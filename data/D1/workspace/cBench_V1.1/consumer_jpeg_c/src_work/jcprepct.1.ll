; ModuleID = 'jcprepct.ll'
source_filename = "jcprepct.c"
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
%struct.my_prep_controller = type { %struct.jpeg_c_prep_controller, [10 x i8**], i32, i32, i32, i32 }

; Function Attrs: noinline nounwind uwtable
define void @jinit_c_prep_controller(%struct.jpeg_compress_struct*, i32) local_unnamed_addr #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %12, label %4

; <label>:4:                                      ; preds = %2
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %6 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i64 0, i32 5
  store i32 4, i32* %7, align 8
  %8 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %9 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %8, align 8
  %10 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %9, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %10(%struct.jpeg_common_struct* %11) #3
  br label %12

; <label>:12:                                     ; preds = %2, %4
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %14 = bitcast %struct.jpeg_memory_mgr** %13 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %15 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %14, align 8
  %16 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %15, align 8
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %18 = tail call i8* %16(%struct.jpeg_common_struct* %17, i32 1, i64 112) #3
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %20 = bitcast %struct.jpeg_c_prep_controller** %19 to i8**
  store i8* %18, i8** %20, align 8
  %21 = bitcast i8* %18 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_prep, void (%struct.jpeg_compress_struct*, i32)** %21, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 57
  %23 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %23, i64 0, i32 2
  %25 = load i32, i32* %24, align 8
  %26 = icmp eq i32 %25, 0
  %sunkaddr30 = ptrtoint i8* %18 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 8
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)**
  br i1 %26, label %28, label %27

; <label>:27:                                     ; preds = %12
  store void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* @pre_process_context, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)** %sunkaddr32, align 8
  tail call fastcc void @create_context_buffer(%struct.jpeg_compress_struct* nonnull %0)
  ret void

; <label>:28:                                     ; preds = %12
  store void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* @pre_process_data, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)** %sunkaddr32, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %30 = load i32, i32* %29, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %28
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %33 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %32, align 8
  %34 = ptrtoint i8* %18 to i64
  %35 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr33 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr34 = add i64 %sunkaddr33, 8
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to %struct.jpeg_memory_mgr**
  %sunkaddr36 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr37 = add i64 %sunkaddr36, 304
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i32*
  %sunkaddr39 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr40 = add i64 %sunkaddr39, 308
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to i32*
  %sunkaddr42 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr43 = add i64 %sunkaddr42, 68
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to i32*
  br label %36

; <label>:36:                                     ; preds = %36, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %36 ]
  %.03 = phi %struct.jpeg_component_info* [ %33, %.lr.ph ], [ %54, %36 ]
  %37 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr35, align 8
  %38 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %37, i64 0, i32 2
  %39 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 7
  %41 = load i32, i32* %40, align 4
  %42 = zext i32 %41 to i64
  %43 = shl nuw nsw i64 %42, 3
  %44 = load i32, i32* %sunkaddr38, align 8
  %45 = sext i32 %44 to i64
  %46 = mul nsw i64 %43, %45
  %47 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 2
  %48 = load i32, i32* %47, align 8
  %49 = sext i32 %48 to i64
  %50 = sdiv i64 %46, %49
  %51 = trunc i64 %50 to i32
  %52 = load i32, i32* %sunkaddr41, align 4
  %53 = tail call i8** %39(%struct.jpeg_common_struct* nonnull %35, i32 1, i32 %51, i32 %52) #3
  %sunkaddr19 = shl i64 %indvars.iv, 3
  %sunkaddr20 = add i64 %34, %sunkaddr19
  %sunkaddr21 = add i64 %sunkaddr20, 16
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i8***
  store i8** %53, i8*** %sunkaddr22, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %54 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %55 = load i32, i32* %sunkaddr44, align 4
  %56 = sext i32 %55 to i64
  %57 = icmp slt i64 %indvars.iv.next, %56
  br i1 %57, label %36, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %36
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %28
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_prep(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %4 = bitcast %struct.jpeg_c_prep_controller** %3 to %struct.my_prep_controller**
  %5 = load %struct.my_prep_controller*, %struct.my_prep_controller** %4, align 8
  %6 = icmp eq i32 %1, 0
  br i1 %6, label %15, label %7

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 4, i32* %10, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %12 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %11, align 8
  %13 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %12, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %13(%struct.jpeg_common_struct* %14) #3
  br label %15

; <label>:15:                                     ; preds = %2, %7
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %17 = load i32, i32* %16, align 4
  %18 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %5, i64 0, i32 2
  store i32 %17, i32* %18, align 8
  %19 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %5, i64 0, i32 3
  store i32 0, i32* %19, align 4
  %20 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %5, i64 0, i32 4
  store i32 0, i32* %20, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %22 = load i32, i32* %21, align 4
  %23 = shl nsw i32 %22, 1
  %24 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %5, i64 0, i32 5
  store i32 %23, i32* %24, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @pre_process_context(%struct.jpeg_compress_struct*, i8**, i32* nocapture, i32, i8***, i32* nocapture, i32) #0 {
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %9 = bitcast %struct.jpeg_c_prep_controller** %8 to %struct.my_prep_controller**
  %10 = load %struct.my_prep_controller*, %struct.my_prep_controller** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %12 = load i32, i32* %11, align 4
  %13 = mul nsw i32 %12, 3
  %14 = load i32, i32* %5, align 4
  %15 = icmp ult i32 %14, %6
  br i1 %15, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %7
  %16 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 1, i64 0
  %17 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 1, i64 0
  %sunkaddr160 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr161 = add i64 %sunkaddr160, 96
  %sunkaddr162 = inttoptr i64 %sunkaddr161 to i32*
  %sunkaddr120 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr121 = add i64 %sunkaddr120, 108
  %sunkaddr122 = inttoptr i64 %sunkaddr121 to i32*
  %sunkaddr = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr123 = add i64 %sunkaddr, 100
  %sunkaddr124 = inttoptr i64 %sunkaddr123 to i32*
  %sunkaddr125 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr126 = add i64 %sunkaddr125, 464
  %sunkaddr127 = inttoptr i64 %sunkaddr126 to %struct.jpeg_color_converter**
  %sunkaddr128 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr129 = add i64 %sunkaddr128, 96
  %sunkaddr130 = inttoptr i64 %sunkaddr129 to i32*
  %sunkaddr131 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr132 = add i64 %sunkaddr131, 44
  %sunkaddr133 = inttoptr i64 %sunkaddr132 to i32*
  %sunkaddr134 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr135 = add i64 %sunkaddr134, 68
  %sunkaddr136 = inttoptr i64 %sunkaddr135 to i32*
  %sunkaddr137 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr138 = add i64 %sunkaddr137, 308
  %sunkaddr139 = inttoptr i64 %sunkaddr138 to i32*
  %sunkaddr151 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr152 = add i64 %sunkaddr151, 68
  %sunkaddr153 = inttoptr i64 %sunkaddr152 to i32*
  %sunkaddr140 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr145 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr146 = add i64 %sunkaddr145, 40
  %sunkaddr147 = inttoptr i64 %sunkaddr146 to i32*
  %sunkaddr148 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr149 = add i64 %sunkaddr148, 308
  %sunkaddr150 = inttoptr i64 %sunkaddr149 to i32*
  %sunkaddr154 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr155 = add i64 %sunkaddr154, 100
  %sunkaddr156 = inttoptr i64 %sunkaddr155 to i32*
  %sunkaddr157 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr158 = add i64 %sunkaddr157, 96
  %sunkaddr159 = inttoptr i64 %sunkaddr158 to i32*
  %sunkaddr190 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr191 = add i64 %sunkaddr190, 100
  %sunkaddr192 = inttoptr i64 %sunkaddr191 to i32*
  %sunkaddr193 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr194 = add i64 %sunkaddr193, 108
  %sunkaddr195 = inttoptr i64 %sunkaddr194 to i32*
  %sunkaddr196 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr197 = add i64 %sunkaddr196, 472
  %sunkaddr198 = inttoptr i64 %sunkaddr197 to %struct.jpeg_downsampler**
  %sunkaddr199 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr200 = add i64 %sunkaddr199, 104
  %sunkaddr201 = inttoptr i64 %sunkaddr200 to i32*
  %sunkaddr202 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr203 = add i64 %sunkaddr202, 308
  %sunkaddr204 = inttoptr i64 %sunkaddr203 to i32*
  %sunkaddr205 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr206 = add i64 %sunkaddr205, 100
  %sunkaddr207 = inttoptr i64 %sunkaddr206 to i32*
  %sunkaddr211 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr212 = add i64 %sunkaddr211, 100
  %sunkaddr213 = inttoptr i64 %sunkaddr212 to i32*
  %sunkaddr214 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr215 = add i64 %sunkaddr214, 308
  %sunkaddr216 = inttoptr i64 %sunkaddr215 to i32*
  %sunkaddr217 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr218 = add i64 %sunkaddr217, 108
  %sunkaddr219 = inttoptr i64 %sunkaddr218 to i32*
  %sunkaddr208 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr209 = add i64 %sunkaddr208, 100
  %sunkaddr210 = inttoptr i64 %sunkaddr209 to i32*
  %sunkaddr163 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr164 = add i64 %sunkaddr163, 100
  %sunkaddr165 = inttoptr i64 %sunkaddr164 to i32*
  %sunkaddr166 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr167 = add i64 %sunkaddr166, 108
  %sunkaddr168 = inttoptr i64 %sunkaddr167 to i32*
  %sunkaddr169 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr170 = add i64 %sunkaddr169, 68
  %sunkaddr171 = inttoptr i64 %sunkaddr170 to i32*
  %sunkaddr184 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr185 = add i64 %sunkaddr184, 108
  %sunkaddr186 = inttoptr i64 %sunkaddr185 to i32*
  %sunkaddr187 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr188 = add i64 %sunkaddr187, 100
  %sunkaddr189 = inttoptr i64 %sunkaddr188 to i32*
  %sunkaddr172 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr173 = add i64 %sunkaddr172, 40
  %sunkaddr174 = inttoptr i64 %sunkaddr173 to i32*
  %sunkaddr175 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr176 = add i64 %sunkaddr175, 100
  %sunkaddr177 = inttoptr i64 %sunkaddr176 to i32*
  %sunkaddr178 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr179 = add i64 %sunkaddr178, 108
  %sunkaddr180 = inttoptr i64 %sunkaddr179 to i32*
  %sunkaddr181 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr182 = add i64 %sunkaddr181, 68
  %sunkaddr183 = inttoptr i64 %sunkaddr182 to i32*
  br label %18

; <label>:18:                                     ; preds = %.backedge, %.lr.ph11
  %19 = load i32, i32* %2, align 4
  %20 = icmp ult i32 %19, %3
  br i1 %20, label %21, label %54

; <label>:21:                                     ; preds = %18
  %22 = zext i32 %19 to i64
  %23 = sub i32 %3, %19
  %24 = load i32, i32* %sunkaddr122, align 4
  %25 = load i32, i32* %sunkaddr124, align 4
  %26 = sub nsw i32 %24, %25
  %27 = icmp ult i32 %26, %23
  %. = select i1 %27, i32 %26, i32 %23
  %28 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %sunkaddr127, align 8
  %29 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %28, i64 0, i32 1
  %30 = load void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %29, align 8
  %31 = getelementptr inbounds i8*, i8** %1, i64 %22
  tail call void %30(%struct.jpeg_compress_struct* %0, i8** %31, i8*** %16, i32 %25, i32 %.) #3
  %32 = load i32, i32* %sunkaddr130, align 8
  %33 = load i32, i32* %sunkaddr133, align 4
  %34 = icmp eq i32 %32, %33
  br i1 %34, label %.preheader3, label %.loopexit

.preheader3:                                      ; preds = %21
  %35 = load i32, i32* %sunkaddr136, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %.preheader.preheader, label %.loopexit

.preheader.preheader:                             ; preds = %.preheader3
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge8
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge8 ], [ 0, %.preheader.preheader ]
  %37 = load i32, i32* %sunkaddr139, align 4
  %38 = icmp slt i32 %37, 1
  br i1 %38, label %._crit_edge8, label %.lr.ph7.preheader

.lr.ph7.preheader:                                ; preds = %.preheader
  %sunkaddr141 = shl i64 %indvars.iv14, 3
  %sunkaddr142 = add i64 %sunkaddr140, %sunkaddr141
  %sunkaddr143 = add i64 %sunkaddr142, 16
  %sunkaddr144 = inttoptr i64 %sunkaddr143 to i8***
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %.lr.ph7
  %.06 = phi i32 [ %42, %.lr.ph7 ], [ 1, %.lr.ph7.preheader ]
  %39 = load i8**, i8*** %sunkaddr144, align 8
  %40 = sub nsw i32 0, %.06
  %41 = load i32, i32* %sunkaddr147, align 8
  tail call void @jcopy_sample_rows(i8** %39, i32 0, i8** %39, i32 %40, i32 1, i32 %41) #3
  %42 = add nuw nsw i32 %.06, 1
  %43 = load i32, i32* %sunkaddr150, align 4
  %44 = icmp slt i32 %.06, %43
  br i1 %44, label %.lr.ph7, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %.lr.ph7
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader
  %indvars.iv.next15 = add nuw i64 %indvars.iv14, 1
  %45 = load i32, i32* %sunkaddr153, align 4
  %46 = sext i32 %45 to i64
  %47 = icmp slt i64 %indvars.iv.next15, %46
  br i1 %47, label %.preheader, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge8
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader3, %21
  %48 = load i32, i32* %2, align 4
  %49 = add i32 %48, %.
  store i32 %49, i32* %2, align 4
  %50 = load i32, i32* %sunkaddr156, align 4
  %51 = add nsw i32 %50, %.
  store i32 %51, i32* %sunkaddr156, align 4
  %52 = load i32, i32* %sunkaddr159, align 8
  %53 = sub i32 %52, %.
  store i32 %53, i32* %sunkaddr159, align 8
  br label %72

; <label>:54:                                     ; preds = %18
  %55 = load i32, i32* %sunkaddr162, align 8
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %._crit_edge12.loopexit

; <label>:57:                                     ; preds = %54
  %58 = load i32, i32* %sunkaddr165, align 4
  %59 = load i32, i32* %sunkaddr168, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %.preheader4, label %72

.preheader4:                                      ; preds = %57
  %61 = load i32, i32* %sunkaddr171, align 4
  %62 = icmp sgt i32 %61, 0
  br i1 %62, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader4
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %63 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 1, i64 %indvars.iv
  %64 = load i8**, i8*** %63, align 8
  %65 = load i32, i32* %sunkaddr174, align 8
  %66 = load i32, i32* %sunkaddr177, align 4
  %67 = load i32, i32* %sunkaddr180, align 4
  tail call fastcc void @expand_bottom_edge(i8** %64, i32 %65, i32 %66, i32 %67)
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %68 = load i32, i32* %sunkaddr183, align 4
  %69 = sext i32 %68 to i64
  %70 = icmp slt i64 %indvars.iv.next, %69
  br i1 %70, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader4
  %71 = load i32, i32* %sunkaddr186, align 4
  store i32 %71, i32* %sunkaddr189, align 4
  br label %72

; <label>:72:                                     ; preds = %57, %._crit_edge, %.loopexit
  %73 = load i32, i32* %sunkaddr192, align 4
  %74 = load i32, i32* %sunkaddr195, align 4
  %75 = icmp eq i32 %73, %74
  br i1 %75, label %76, label %.backedge

; <label>:76:                                     ; preds = %72
  %77 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %sunkaddr198, align 8
  %78 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %77, i64 0, i32 1
  %79 = load void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)** %78, align 8
  %80 = load i32, i32* %sunkaddr201, align 8
  %81 = load i32, i32* %5, align 4
  tail call void %79(%struct.jpeg_compress_struct* %0, i8*** nonnull %17, i32 %80, i8*** %4, i32 %81) #3
  %82 = load i32, i32* %5, align 4
  %83 = add i32 %82, 1
  store i32 %83, i32* %5, align 4
  %84 = load i32, i32* %sunkaddr204, align 4
  %85 = load i32, i32* %sunkaddr201, align 8
  %86 = add nsw i32 %85, %84
  %87 = icmp slt i32 %86, %13
  %.2 = select i1 %87, i32 %86, i32 0
  store i32 %.2, i32* %sunkaddr201, align 8
  %88 = load i32, i32* %sunkaddr207, align 4
  %89 = icmp slt i32 %88, %13
  br i1 %89, label %91, label %90

; <label>:90:                                     ; preds = %76
  store i32 0, i32* %sunkaddr210, align 4
  br label %91

; <label>:91:                                     ; preds = %76, %90
  %92 = load i32, i32* %sunkaddr213, align 4
  %93 = load i32, i32* %sunkaddr216, align 4
  %94 = add nsw i32 %93, %92
  store i32 %94, i32* %sunkaddr219, align 4
  br label %.backedge

.backedge:                                        ; preds = %72, %91
  %95 = load i32, i32* %5, align 4
  %96 = icmp ult i32 %95, %6
  br i1 %96, label %18, label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %54, %.backedge
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @create_context_buffer(%struct.jpeg_compress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %3 = bitcast %struct.jpeg_c_prep_controller** %2 to %struct.my_prep_controller**
  %4 = load %struct.my_prep_controller*, %struct.my_prep_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %6 = load i32, i32* %5, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %9 = bitcast %struct.jpeg_memory_mgr** %8 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %9, align 8
  %11 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %10, align 8
  %12 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %14 = load i32, i32* %13, align 4
  %15 = mul i32 %6, 5
  %16 = mul i32 %15, %14
  %17 = sext i32 %16 to i64
  %18 = shl nsw i64 %17, 3
  %19 = tail call i8* %11(%struct.jpeg_common_struct* %12, i32 1, i64 %18) #3
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %21 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %22 = load i32, i32* %13, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %.lr.ph9, label %._crit_edge10

.lr.ph9:                                          ; preds = %1
  %24 = sext i32 %6 to i64
  %25 = sext i32 %6 to i64
  %26 = mul i32 %6, 3
  %27 = mul nsw i64 %24, 24
  %28 = icmp sgt i32 %6, 0
  %29 = mul nsw i64 %25, 5
  %30 = bitcast i8* %19 to i8**
  br i1 %28, label %.lr.ph9.split.us.preheader, label %.lr.ph9.split.preheader

.lr.ph9.split.preheader:                          ; preds = %.lr.ph9
  %31 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr43 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr44 = add i64 %sunkaddr43, 8
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to %struct.jpeg_memory_mgr**
  %sunkaddr46 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr47 = add i64 %sunkaddr46, 304
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to i32*
  %sunkaddr49 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr50 = add i64 %sunkaddr49, 68
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to i32*
  br label %.lr.ph9.split

.lr.ph9.split.us.preheader:                       ; preds = %.lr.ph9
  %32 = shl i32 %6, 2
  %33 = shl i32 %6, 1
  %34 = sext i32 %33 to i64
  %35 = sext i32 %32 to i64
  %xtraiter = and i32 %6, 1
  %wide.trip.count.1 = zext i32 %6 to i64
  %36 = icmp eq i32 %xtraiter, 0
  %37 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr35 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 8
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to %struct.jpeg_memory_mgr**
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr38 = add i64 %sunkaddr, 304
  %sunkaddr39 = inttoptr i64 %sunkaddr38 to i32*
  %38 = icmp eq i32 %6, 1
  %sunkaddr40 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr41 = add i64 %sunkaddr40, 68
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to i32*
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph9.split.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.lr.ph9.split.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %.07.us = phi i8** [ %30, %.lr.ph9.split.us.preheader ], [ %91, %._crit_edge.us ]
  %.016.us = phi %struct.jpeg_component_info* [ %21, %.lr.ph9.split.us.preheader ], [ %92, %._crit_edge.us ]
  %39 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr37, align 8
  %40 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %39, i64 0, i32 2
  %41 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.016.us, i64 0, i32 7
  %43 = load i32, i32* %42, align 4
  %44 = zext i32 %43 to i64
  %45 = shl nuw nsw i64 %44, 3
  %46 = load i32, i32* %sunkaddr39, align 8
  %47 = sext i32 %46 to i64
  %48 = mul nsw i64 %45, %47
  %49 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.016.us, i64 0, i32 2
  %50 = load i32, i32* %49, align 8
  %51 = sext i32 %50 to i64
  %52 = sdiv i64 %48, %51
  %53 = trunc i64 %52 to i32
  %54 = tail call i8** %41(%struct.jpeg_common_struct* nonnull %37, i32 1, i32 %53, i32 %26) #3
  %55 = getelementptr inbounds i8*, i8** %.07.us, i64 %7
  %56 = bitcast i8** %55 to i8*
  %57 = bitcast i8** %54 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %56, i8* %57, i64 %27, i32 1, i1 false)
  br i1 %36, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph9.split.us
  %58 = getelementptr inbounds i8*, i8** %54, i64 %34
  %59 = bitcast i8** %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = bitcast i8** %.07.us to i64*
  store i64 %60, i64* %61, align 8
  %62 = bitcast i8** %54 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds i8*, i8** %.07.us, i64 %35
  %65 = bitcast i8** %64 to i64*
  store i64 %63, i64* %65, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph9.split.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph9.split.us ]
  br i1 %38, label %._crit_edge.us, label %.lr.ph9.split.us.new.preheader

.lr.ph9.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph9.split.us.new

.lr.ph9.split.us.new:                             ; preds = %.lr.ph9.split.us.new.preheader, %.lr.ph9.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph9.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph9.split.us.new.preheader ]
  %66 = add nsw i64 %indvars.iv, %34
  %67 = getelementptr inbounds i8*, i8** %54, i64 %66
  %68 = bitcast i8** %67 to i64*
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds i8*, i8** %.07.us, i64 %indvars.iv
  %71 = bitcast i8** %70 to i64*
  store i64 %69, i64* %71, align 8
  %72 = getelementptr inbounds i8*, i8** %54, i64 %indvars.iv
  %73 = bitcast i8** %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = add nsw i64 %indvars.iv, %35
  %76 = getelementptr inbounds i8*, i8** %.07.us, i64 %75
  %77 = bitcast i8** %76 to i64*
  store i64 %74, i64* %77, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %78 = add nsw i64 %indvars.iv.next, %34
  %79 = getelementptr inbounds i8*, i8** %54, i64 %78
  %80 = bitcast i8** %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds i8*, i8** %.07.us, i64 %indvars.iv.next
  %83 = bitcast i8** %82 to i64*
  store i64 %81, i64* %83, align 8
  %84 = getelementptr inbounds i8*, i8** %54, i64 %indvars.iv.next
  %85 = bitcast i8** %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %indvars.iv.next, %35
  %88 = getelementptr inbounds i8*, i8** %.07.us, i64 %87
  %89 = bitcast i8** %88 to i64*
  store i64 %86, i64* %89, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph9.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph9.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %90 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %4, i64 0, i32 1, i64 %indvars.iv12
  store i8** %55, i8*** %90, align 8
  %91 = getelementptr inbounds i8*, i8** %.07.us, i64 %29
  %indvars.iv.next13 = add nuw i64 %indvars.iv12, 1
  %92 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.016.us, i64 1
  %93 = load i32, i32* %sunkaddr42, align 4
  %94 = sext i32 %93 to i64
  %95 = icmp slt i64 %indvars.iv.next13, %94
  br i1 %95, label %.lr.ph9.split.us, label %._crit_edge10.loopexit

.lr.ph9.split:                                    ; preds = %.lr.ph9.split.preheader, %.lr.ph9.split
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %.lr.ph9.split ], [ 0, %.lr.ph9.split.preheader ]
  %.07 = phi i8** [ %116, %.lr.ph9.split ], [ %30, %.lr.ph9.split.preheader ]
  %.016 = phi %struct.jpeg_component_info* [ %117, %.lr.ph9.split ], [ %21, %.lr.ph9.split.preheader ]
  %96 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr45, align 8
  %97 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %96, i64 0, i32 2
  %98 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %97, align 8
  %99 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.016, i64 0, i32 7
  %100 = load i32, i32* %99, align 4
  %101 = zext i32 %100 to i64
  %102 = shl nuw nsw i64 %101, 3
  %103 = load i32, i32* %sunkaddr48, align 8
  %104 = sext i32 %103 to i64
  %105 = mul nsw i64 %102, %104
  %106 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.016, i64 0, i32 2
  %107 = load i32, i32* %106, align 8
  %108 = sext i32 %107 to i64
  %109 = sdiv i64 %105, %108
  %110 = trunc i64 %109 to i32
  %111 = tail call i8** %98(%struct.jpeg_common_struct* nonnull %31, i32 1, i32 %110, i32 %26) #3
  %112 = getelementptr inbounds i8*, i8** %.07, i64 %7
  %113 = bitcast i8** %112 to i8*
  %114 = bitcast i8** %111 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %113, i8* %114, i64 %27, i32 1, i1 false)
  %115 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %4, i64 0, i32 1, i64 %indvars.iv14
  store i8** %112, i8*** %115, align 8
  %116 = getelementptr inbounds i8*, i8** %.07, i64 %29
  %indvars.iv.next15 = add nuw i64 %indvars.iv14, 1
  %117 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.016, i64 1
  %118 = load i32, i32* %sunkaddr51, align 4
  %119 = sext i32 %118 to i64
  %120 = icmp slt i64 %indvars.iv.next15, %119
  br i1 %120, label %.lr.ph9.split, label %._crit_edge10.loopexit53

._crit_edge10.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge10

._crit_edge10.loopexit53:                         ; preds = %.lr.ph9.split
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit53, %._crit_edge10.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @pre_process_data(%struct.jpeg_compress_struct*, i8**, i32* nocapture, i32, i8***, i32* nocapture, i32) #0 {
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %9 = bitcast %struct.jpeg_c_prep_controller** %8 to %struct.my_prep_controller**
  %10 = load %struct.my_prep_controller*, %struct.my_prep_controller** %9, align 8
  %11 = load i32, i32* %2, align 4
  %12 = icmp ult i32 %11, %3
  br i1 %12, label %.lr.ph8, label %.critedge

.lr.ph8:                                          ; preds = %7
  %13 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 1, i64 0
  %14 = load i32, i32* %5, align 4
  %15 = icmp ult i32 %14, %6
  br i1 %15, label %.lr.ph73.preheader, label %.critedge

.lr.ph73.preheader:                               ; preds = %.lr.ph8
  %sunkaddr74 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr75 = add i64 %sunkaddr74, 308
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to i32*
  %sunkaddr = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr77 = add i64 %sunkaddr, 100
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to i32*
  %sunkaddr79 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr80 = add i64 %sunkaddr79, 464
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to %struct.jpeg_color_converter**
  %sunkaddr82 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr83 = add i64 %sunkaddr82, 96
  %sunkaddr84 = inttoptr i64 %sunkaddr83 to i32*
  %sunkaddr85 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr86 = add i64 %sunkaddr85, 100
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to i32*
  %sunkaddr88 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr89 = add i64 %sunkaddr88, 308
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to i32*
  %sunkaddr91 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr92 = add i64 %sunkaddr91, 68
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to i32*
  %sunkaddr106 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr107 = add i64 %sunkaddr106, 308
  %sunkaddr108 = inttoptr i64 %sunkaddr107 to i32*
  %sunkaddr109 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr110 = add i64 %sunkaddr109, 100
  %sunkaddr111 = inttoptr i64 %sunkaddr110 to i32*
  %sunkaddr94 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr95 = add i64 %sunkaddr94, 40
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to i32*
  %sunkaddr97 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr98 = add i64 %sunkaddr97, 100
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i32*
  %sunkaddr100 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr101 = add i64 %sunkaddr100, 308
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to i32*
  %sunkaddr103 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr104 = add i64 %sunkaddr103, 68
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to i32*
  %sunkaddr112 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr113 = add i64 %sunkaddr112, 100
  %sunkaddr114 = inttoptr i64 %sunkaddr113 to i32*
  %sunkaddr115 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr116 = add i64 %sunkaddr115, 308
  %sunkaddr117 = inttoptr i64 %sunkaddr116 to i32*
  %sunkaddr118 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr119 = add i64 %sunkaddr118, 472
  %sunkaddr120 = inttoptr i64 %sunkaddr119 to %struct.jpeg_downsampler**
  %sunkaddr121 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr122 = add i64 %sunkaddr121, 100
  %sunkaddr123 = inttoptr i64 %sunkaddr122 to i32*
  %sunkaddr124 = ptrtoint %struct.my_prep_controller* %10 to i64
  %sunkaddr125 = add i64 %sunkaddr124, 96
  %sunkaddr126 = inttoptr i64 %sunkaddr125 to i32*
  br label %.lr.ph73

; <label>:16:                                     ; preds = %.backedge
  %17 = load i32, i32* %5, align 4
  %18 = icmp ult i32 %17, %6
  br i1 %18, label %.lr.ph73, label %.critedge.loopexit

.lr.ph73:                                         ; preds = %.lr.ph73.preheader, %16
  %19 = phi i32 [ %69, %16 ], [ %11, %.lr.ph73.preheader ]
  %20 = sub i32 %3, %19
  %21 = load i32, i32* %sunkaddr76, align 4
  %22 = load i32, i32* %sunkaddr78, align 4
  %23 = sub nsw i32 %21, %22
  %24 = icmp ult i32 %23, %20
  %. = select i1 %24, i32 %23, i32 %20
  %25 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %sunkaddr81, align 8
  %26 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %25, i64 0, i32 1
  %27 = load void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %26, align 8
  %28 = zext i32 %19 to i64
  %29 = getelementptr inbounds i8*, i8** %1, i64 %28
  tail call void %27(%struct.jpeg_compress_struct* nonnull %0, i8** %29, i8*** %13, i32 %22, i32 %.) #3
  %30 = load i32, i32* %2, align 4
  %31 = add i32 %30, %.
  store i32 %31, i32* %2, align 4
  %32 = load i32, i32* %sunkaddr78, align 4
  %33 = add nsw i32 %32, %.
  store i32 %33, i32* %sunkaddr78, align 4
  %34 = load i32, i32* %sunkaddr84, align 8
  %35 = sub i32 %34, %.
  store i32 %35, i32* %sunkaddr84, align 8
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %52

; <label>:37:                                     ; preds = %.lr.ph73
  %38 = load i32, i32* %sunkaddr87, align 4
  %39 = load i32, i32* %sunkaddr90, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %.preheader, label %52

.preheader:                                       ; preds = %37
  %41 = load i32, i32* %sunkaddr93, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %.lr.ph5.preheader, label %._crit_edge6

.lr.ph5.preheader:                                ; preds = %.preheader
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %.lr.ph5.preheader, %.lr.ph5
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %.lr.ph5 ], [ 0, %.lr.ph5.preheader ]
  %43 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 1, i64 %indvars.iv10
  %44 = load i8**, i8*** %43, align 8
  %45 = load i32, i32* %sunkaddr96, align 8
  %46 = load i32, i32* %sunkaddr99, align 4
  %47 = load i32, i32* %sunkaddr102, align 4
  tail call fastcc void @expand_bottom_edge(i8** %44, i32 %45, i32 %46, i32 %47)
  %indvars.iv.next11 = add nuw i64 %indvars.iv10, 1
  %48 = load i32, i32* %sunkaddr105, align 4
  %49 = sext i32 %48 to i64
  %50 = icmp slt i64 %indvars.iv.next11, %49
  br i1 %50, label %.lr.ph5, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %.lr.ph5
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.preheader
  %51 = load i32, i32* %sunkaddr108, align 4
  store i32 %51, i32* %sunkaddr111, align 4
  br label %52

; <label>:52:                                     ; preds = %37, %.lr.ph73, %._crit_edge6
  %53 = load i32, i32* %sunkaddr114, align 4
  %54 = load i32, i32* %sunkaddr117, align 4
  %55 = icmp eq i32 %53, %54
  br i1 %55, label %56, label %63

; <label>:56:                                     ; preds = %52
  %57 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %sunkaddr120, align 8
  %58 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %57, i64 0, i32 1
  %59 = load void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)** %58, align 8
  %60 = load i32, i32* %5, align 4
  tail call void %59(%struct.jpeg_compress_struct* nonnull %0, i8*** nonnull %13, i32 0, i8*** %4, i32 %60) #3
  store i32 0, i32* %sunkaddr123, align 4
  %61 = load i32, i32* %5, align 4
  %62 = add i32 %61, 1
  store i32 %62, i32* %5, align 4
  br label %63

; <label>:63:                                     ; preds = %52, %56
  %64 = load i32, i32* %sunkaddr126, align 8
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %.backedge

; <label>:66:                                     ; preds = %63
  %67 = load i32, i32* %5, align 4
  %68 = icmp ult i32 %67, %6
  br i1 %68, label %71, label %.backedge

.backedge:                                        ; preds = %66, %63
  %69 = load i32, i32* %2, align 4
  %70 = icmp ult i32 %69, %3
  br i1 %70, label %16, label %.critedge.loopexit

; <label>:71:                                     ; preds = %66
  %72 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %73 = load i32, i32* %72, align 4
  %74 = icmp sgt i32 %73, 0
  br i1 %74, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %71
  %75 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %76 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %75, align 8
  %sunkaddr127 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr128 = add i64 %sunkaddr127, 68
  %sunkaddr129 = inttoptr i64 %sunkaddr128 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %.03 = phi %struct.jpeg_component_info* [ %76, %.lr.ph.preheader ], [ %87, %.lr.ph ]
  %77 = getelementptr inbounds i8**, i8*** %4, i64 %indvars.iv
  %78 = load i8**, i8*** %77, align 8
  %79 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 7
  %80 = load i32, i32* %79, align 4
  %81 = shl i32 %80, 3
  %82 = load i32, i32* %5, align 4
  %83 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 3
  %84 = load i32, i32* %83, align 4
  %85 = mul i32 %84, %82
  %86 = mul i32 %84, %6
  tail call fastcc void @expand_bottom_edge(i8** %78, i32 %81, i32 %85, i32 %86)
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %87 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %88 = load i32, i32* %sunkaddr129, align 4
  %89 = sext i32 %88 to i64
  %90 = icmp slt i64 %indvars.iv.next, %89
  br i1 %90, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %71
  store i32 %6, i32* %5, align 4
  br label %.critedge

.critedge.loopexit:                               ; preds = %16, %.backedge
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %.lr.ph8, %7, %._crit_edge
  ret void
}

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @expand_bottom_edge(i8**, i32, i32, i32) unnamed_addr #0 {
  %5 = icmp slt i32 %2, %3
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %6 = add nsw i32 %2, -1
  br label %7

; <label>:7:                                      ; preds = %7, %.lr.ph
  %.01 = phi i32 [ %2, %.lr.ph ], [ %8, %7 ]
  tail call void @jcopy_sample_rows(i8** %0, i32 %6, i8** %0, i32 %.01, i32 1, i32 %1) #3
  %8 = add nsw i32 %.01, 1
  %exitcond = icmp eq i32 %8, %3
  br i1 %exitcond, label %._crit_edge.loopexit, label %7

._crit_edge.loopexit:                             ; preds = %7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
