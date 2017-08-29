; ModuleID = 'jchuff.ll'
source_filename = "jchuff.c"
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
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.c_derived_tbl = type { [256 x i32], [256 x i8] }
%struct.huff_entropy_encoder = type { %struct.jpeg_entropy_encoder, %struct.savable_state, i32, i32, [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*], [4 x i64*], [4 x i64*] }
%struct.savable_state = type { i64, i32, [4 x i32] }
%struct.working_state = type { i8*, i64, %struct.savable_state, %struct.jpeg_compress_struct* }

@jpeg_natural_order = external constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, %struct.c_derived_tbl**) #0 {
  %4 = alloca [257 x i8], align 16
  %5 = alloca [257 x i32], align 16
  %6 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %2, align 8
  %7 = icmp eq %struct.c_derived_tbl* %6, null
  br i1 %7, label %8, label %15

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %10 = bitcast %struct.jpeg_memory_mgr** %9 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %11 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %10, align 8
  %12 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %11, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %13 = tail call i8* %12(%struct.jpeg_common_struct* %.cast, i32 1, i64 1280) #4
  %14 = bitcast %struct.c_derived_tbl** %2 to i8**
  store i8* %13, i8** %14, align 8
  br label %15

; <label>:15:                                     ; preds = %8, %3
  %16 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %2, align 8
  br label %.preheader28

.preheader28:                                     ; preds = %._crit_edge42, %15
  %indvars.iv52 = phi i64 [ 1, %15 ], [ %indvars.iv.next53, %._crit_edge42 ]
  %storemerge45 = phi i32 [ 1, %15 ], [ %33, %._crit_edge42 ]
  %.02644 = phi i32 [ 0, %15 ], [ %.127.lcssa, %._crit_edge42 ]
  %17 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 0, i64 %indvars.iv52
  %18 = load i8, i8* %17, align 1
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %._crit_edge42, label %.lr.ph41

.lr.ph41:                                         ; preds = %.preheader28
  %20 = trunc i32 %storemerge45 to i8
  %21 = load i8, i8* %17, align 1
  %22 = zext i8 %21 to i32
  %23 = sext i32 %.02644 to i64
  %scevgep = getelementptr [257 x i8], [257 x i8]* %4, i64 0, i64 %23
  %24 = icmp ugt i32 %22, 1
  %smax = select i1 %24, i32 %22, i32 1
  %25 = add nsw i32 %smax, -1
  %26 = zext i32 %25 to i64
  %27 = add nuw nsw i64 %26, 1
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 %20, i64 %27, i32 1, i1 false)
  %28 = icmp ugt i32 %22, 1
  %smax55 = select i1 %28, i32 %22, i32 1
  br label %29

; <label>:29:                                     ; preds = %29, %.lr.ph41
  %storemerge240 = phi i32 [ %30, %29 ], [ 1, %.lr.ph41 ]
  %30 = add nuw nsw i32 %storemerge240, 1
  %31 = icmp slt i32 %storemerge240, %22
  br i1 %31, label %29, label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %29
  %32 = add i32 %.02644, %smax55
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader28
  %.127.lcssa = phi i32 [ %.02644, %.preheader28 ], [ %32, %._crit_edge42.loopexit ]
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %33 = add nuw nsw i32 %storemerge45, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, 17
  br i1 %exitcond, label %34, label %.preheader28

; <label>:34:                                     ; preds = %._crit_edge42
  %35 = sext i32 %.127.lcssa to i64
  %36 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %35
  store i8 0, i8* %36, align 1
  %37 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 0
  %38 = load i8, i8* %37, align 16
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %._crit_edge38, label %.preheader.preheader

.preheader.preheader:                             ; preds = %34
  %40 = sext i8 %38 to i32
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge33
  %.037 = phi i32 [ %53, %._crit_edge33 ], [ 0, %.preheader.preheader ]
  %.02536 = phi i32 [ %54, %._crit_edge33 ], [ %40, %.preheader.preheader ]
  %.235 = phi i32 [ %.3.lcssa, %._crit_edge33 ], [ 0, %.preheader.preheader ]
  %41 = sext i32 %.235 to i64
  %42 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %41
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp eq i32 %44, %.02536
  br i1 %45, label %.lr.ph32.preheader, label %._crit_edge33

.lr.ph32.preheader:                               ; preds = %.preheader
  br label %.lr.ph32

.lr.ph32:                                         ; preds = %.lr.ph32.preheader, %.lr.ph32
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %.lr.ph32 ], [ %41, %.lr.ph32.preheader ]
  %.131 = phi i32 [ %47, %.lr.ph32 ], [ %.037, %.lr.ph32.preheader ]
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  %46 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv48
  store i32 %.131, i32* %46, align 4
  %47 = add i32 %.131, 1
  %48 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %indvars.iv.next49
  %49 = load i8, i8* %48, align 1
  %50 = sext i8 %49 to i32
  %51 = icmp eq i32 %50, %.02536
  br i1 %51, label %.lr.ph32, label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %.lr.ph32
  %52 = trunc i64 %indvars.iv.next49 to i32
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %.preheader
  %.3.lcssa = phi i32 [ %.235, %.preheader ], [ %52, %._crit_edge33.loopexit ]
  %.1.lcssa = phi i32 [ %.037, %.preheader ], [ %47, %._crit_edge33.loopexit ]
  %53 = shl i32 %.1.lcssa, 1
  %54 = add nsw i32 %.02536, 1
  %55 = sext i32 %.3.lcssa to i64
  %56 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = icmp eq i8 %57, 0
  br i1 %58, label %._crit_edge38.loopexit, label %.preheader

._crit_edge38.loopexit:                           ; preds = %._crit_edge33
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %34
  %59 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %16, i64 0, i32 1, i64 0
  tail call void @llvm.memset.p0i8.i64(i8* %59, i8 0, i64 256, i32 4, i1 false)
  %60 = icmp sgt i32 %.127.lcssa, 0
  br i1 %60, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge38
  %xtraiter = and i32 %.127.lcssa, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %61 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 0
  %62 = load i32, i32* %61, align 16
  %63 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 0
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i64
  %66 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %16, i64 0, i32 0, i64 %65
  store i32 %62, i32* %66, align 4
  %67 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 0
  %68 = load i8, i8* %67, align 16
  %69 = load i8, i8* %63, align 1
  %70 = zext i8 %69 to i64
  %71 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %16, i64 0, i32 1, i64 %70
  store i8 %68, i8* %71, align 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ 1, %.lr.ph.prol ]
  %72 = icmp eq i32 %.127.lcssa, 1
  br i1 %72, label %._crit_edge, label %.lr.ph.preheader54

.lr.ph.preheader54:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = zext i32 %.127.lcssa to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader54, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.preheader54 ]
  %73 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv
  %74 = load i32, i32* %73, align 4
  %75 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %indvars.iv
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i64
  %78 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %16, i64 0, i32 0, i64 %77
  store i32 %74, i32* %78, align 4
  %79 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %indvars.iv
  %80 = load i8, i8* %79, align 1
  %81 = load i8, i8* %75, align 1
  %82 = zext i8 %81 to i64
  %83 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %16, i64 0, i32 1, i64 %82
  store i8 %80, i8* %83, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %84 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv.next
  %85 = load i32, i32* %84, align 4
  %86 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %indvars.iv.next
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i64
  %89 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %16, i64 0, i32 0, i64 %88
  store i32 %85, i32* %89, align 4
  %90 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %indvars.iv.next
  %91 = load i8, i8* %90, align 1
  %92 = load i8, i8* %86, align 1
  %93 = zext i8 %92 to i64
  %94 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %16, i64 0, i32 1, i64 %93
  store i8 %91, i8* %94, align 1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %._crit_edge38
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, i64*) #0 {
  %4 = alloca [33 x i8], align 16
  %5 = alloca [257 x i32], align 16
  %6 = alloca [257 x i32], align 16
  %7 = bitcast [257 x i32]* %6 to i8*
  %8 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 33, i32 16, i1 false)
  %9 = bitcast [257 x i32]* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %9, i8 0, i64 1028, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 -1, i64 1028, i32 16, i1 false)
  %10 = getelementptr inbounds i64, i64* %2, i64 256
  store i64 1, i64* %10, align 8
  %sunkaddr = ptrtoint [257 x i32]* %6 to i64
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %42
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %3
  %11 = load i64, i64* %2, align 8
  %12 = icmp eq i64 %11, 0
  %13 = icmp sgt i64 %11, 1000000000
  %or.cond147 = or i1 %12, %13
  %.180148 = sext i1 %or.cond147 to i32
  %.1149 = select i1 %or.cond147, i64 1000000000, i64 %11
  br label %126

.preheader104:                                    ; preds = %126
  %14 = zext i32 %.180 to i64
  %15 = load i64, i64* %2, align 8
  %16 = icmp eq i64 %15, 0
  %17 = icmp sgt i64 %15, 1000000000
  %or.cond82154 = or i1 %16, %17
  %18 = icmp eq i32 %.180, 0
  %or.cond83155 = or i1 %18, %or.cond82154
  %.177156 = sext i1 %or.cond83155 to i32
  %.3157 = select i1 %or.cond83155, i64 1000000000, i64 %15
  br label %137

; <label>:19:                                     ; preds = %137
  %20 = icmp slt i32 %.177, 0
  br i1 %20, label %.preheader103, label %24

.preheader103:                                    ; preds = %19
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %22 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr87 = ptrtoint [257 x i32]* %5 to i64
  %23 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  br label %51

; <label>:24:                                     ; preds = %19
  %25 = sext i32 %.177 to i64
  %26 = getelementptr inbounds i64, i64* %2, i64 %25
  %27 = load i64, i64* %26, align 8
  %28 = sext i32 %.180 to i64
  %29 = getelementptr inbounds i64, i64* %2, i64 %28
  %30 = load i64, i64* %29, align 8
  %31 = add nsw i64 %30, %27
  store i64 %31, i64* %29, align 8
  store i64 0, i64* %26, align 8
  br label %32

; <label>:32:                                     ; preds = %32, %24
  %.281 = phi i32 [ %.180, %24 ], [ %39, %32 ]
  %33 = sext i32 %.281 to i64
  %34 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %33
  %35 = load i32, i32* %34, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %34, align 4
  %37 = sext i32 %.281 to i64
  %38 = getelementptr inbounds [257 x i32], [257 x i32]* %6, i64 0, i64 %37
  %39 = load i32, i32* %38, align 4
  %40 = icmp sgt i32 %39, -1
  br i1 %40, label %32, label %41

; <label>:41:                                     ; preds = %32
  %sunkaddr84 = shl nsw i64 %37, 2
  %sunkaddr85 = add i64 %sunkaddr, %sunkaddr84
  %sunkaddr86 = inttoptr i64 %sunkaddr85 to i32*
  store i32 %.177, i32* %sunkaddr86, align 4
  br label %42

; <label>:42:                                     ; preds = %42, %41
  %.278 = phi i32 [ %.177, %41 ], [ %49, %42 ]
  %43 = sext i32 %.278 to i64
  %44 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %43
  %45 = load i32, i32* %44, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %44, align 4
  %47 = sext i32 %.278 to i64
  %48 = getelementptr inbounds [257 x i32], [257 x i32]* %6, i64 0, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = icmp sgt i32 %49, -1
  br i1 %50, label %42, label %.loopexit.loopexit

.preheader102:                                    ; preds = %68
  %sunkaddr91 = ptrtoint [33 x i8]* %4 to i64
  %sunkaddr94 = ptrtoint [33 x i8]* %4 to i64
  br label %.preheader101

; <label>:51:                                     ; preds = %68, %.preheader103
  %indvars.iv133 = phi i64 [ 0, %.preheader103 ], [ %indvars.iv.next134, %68 ]
  %52 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv133
  %53 = load i32, i32* %52, align 4
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %68, label %55

; <label>:55:                                     ; preds = %51
  %56 = icmp sgt i32 %53, 32
  br i1 %56, label %57, label %62

; <label>:57:                                     ; preds = %55
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i64 0, i32 5
  store i32 38, i32* %59, align 8
  %60 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %23, align 8
  %61 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %60, align 8
  tail call void %61(%struct.jpeg_common_struct* %22) #4
  br label %62

; <label>:62:                                     ; preds = %57, %55
  %sunkaddr88 = shl nsw i64 %indvars.iv133, 2
  %sunkaddr89 = add i64 %sunkaddr87, %sunkaddr88
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to i32*
  %63 = load i32, i32* %sunkaddr90, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %64
  %66 = load i8, i8* %65, align 1
  %67 = add i8 %66, 1
  store i8 %67, i8* %65, align 1
  br label %68

; <label>:68:                                     ; preds = %62, %51
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next134, 257
  br i1 %exitcond135, label %.preheader102, label %51

.preheader101:                                    ; preds = %.preheader102, %._crit_edge
  %indvars.iv131 = phi i64 [ 32, %.preheader102 ], [ %indvars.iv.next132, %._crit_edge ]
  %indvars.iv127 = phi i64 [ 30, %.preheader102 ], [ %indvars.iv.next128, %._crit_edge ]
  %69 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %indvars.iv131
  %70 = load i8, i8* %69, align 1
  %71 = icmp eq i8 %70, 0
  br i1 %71, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader101
  %sunkaddr92 = add i64 %sunkaddr91, %indvars.iv131
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to i8*
  %72 = add nsw i64 %indvars.iv131, -1
  %73 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %72
  br label %74

; <label>:74:                                     ; preds = %.lr.ph, %79
  br label %75

; <label>:75:                                     ; preds = %75, %74
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %75 ], [ %indvars.iv127, %74 ]
  %76 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %indvars.iv129
  %77 = load i8, i8* %76, align 1
  %78 = icmp eq i8 %77, 0
  %indvars.iv.next130 = add i64 %indvars.iv129, -1
  br i1 %78, label %75, label %79

; <label>:79:                                     ; preds = %75
  %80 = load i8, i8* %sunkaddr93, align 1
  %81 = add i8 %80, -2
  store i8 %81, i8* %sunkaddr93, align 1
  %82 = load i8, i8* %73, align 1
  %83 = add i8 %82, 1
  store i8 %83, i8* %73, align 1
  %sext = shl i64 %indvars.iv129, 32
  %84 = ashr exact i64 %sext, 32
  %85 = add nsw i64 %84, 1
  %86 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %85
  %87 = load i8, i8* %86, align 1
  %88 = add i8 %87, 2
  store i8 %88, i8* %86, align 1
  %sunkaddr95 = add i64 %sunkaddr94, %indvars.iv129
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to i8*
  %89 = load i8, i8* %sunkaddr96, align 1
  %90 = add i8 %89, -1
  store i8 %90, i8* %sunkaddr96, align 1
  %91 = load i8, i8* %69, align 1
  %92 = icmp eq i8 %91, 0
  br i1 %92, label %._crit_edge.loopexit, label %74

._crit_edge.loopexit:                             ; preds = %79
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader101
  %indvars.iv.next132 = add nsw i64 %indvars.iv131, -1
  %93 = icmp sgt i64 %indvars.iv.next132, 16
  %indvars.iv.next128 = add nsw i64 %indvars.iv127, -1
  br i1 %93, label %.preheader101, label %.preheader100.preheader

.preheader100.preheader:                          ; preds = %._crit_edge
  br label %.preheader100

.preheader100:                                    ; preds = %.preheader100.preheader, %.preheader100
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %.preheader100 ], [ 16, %.preheader100.preheader ]
  %94 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %indvars.iv125
  %95 = load i8, i8* %94, align 1
  %96 = icmp eq i8 %95, 0
  %indvars.iv.next126 = add i64 %indvars.iv125, -1
  br i1 %96, label %.preheader100, label %97

; <label>:97:                                     ; preds = %.preheader100
  %98 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 0
  %99 = add i8 %95, -1
  %sunkaddr97 = ptrtoint [33 x i8]* %4 to i64
  %sunkaddr98 = add i64 %sunkaddr97, %indvars.iv125
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i8*
  store i8 %99, i8* %sunkaddr99, align 1
  %100 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %100, i8* nonnull %98, i64 17, i32 4, i1 false)
  br label %.preheader

.preheader:                                       ; preds = %114, %97
  %storemerge5111 = phi i32 [ 1, %97 ], [ %115, %114 ]
  %.073110 = phi i32 [ 0, %97 ], [ %.275.1, %114 ]
  br label %101

; <label>:101:                                    ; preds = %124, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %124 ]
  %storemerge6109 = phi i32 [ 0, %.preheader ], [ %125, %124 ]
  %.174108 = phi i32 [ %.073110, %.preheader ], [ %.275.1, %124 ]
  %102 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv
  %103 = load i32, i32* %102, align 8
  %104 = icmp eq i32 %103, %storemerge5111
  br i1 %104, label %105, label %110

; <label>:105:                                    ; preds = %101
  %106 = add nsw i32 %.174108, 1
  %107 = sext i32 %.174108 to i64
  %108 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %107
  %109 = trunc i32 %storemerge6109 to i8
  store i8 %109, i8* %108, align 1
  br label %110

; <label>:110:                                    ; preds = %101, %105
  %.275 = phi i32 [ %106, %105 ], [ %.174108, %101 ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %111 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv.next
  %112 = load i32, i32* %111, align 4
  %113 = icmp eq i32 %112, %storemerge5111
  br i1 %113, label %118, label %124

; <label>:114:                                    ; preds = %124
  %115 = add nuw nsw i32 %storemerge5111, 1
  %exitcond = icmp eq i32 %115, 33
  br i1 %exitcond, label %116, label %.preheader

; <label>:116:                                    ; preds = %114
  %117 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 2
  store i32 0, i32* %117, align 4
  ret void

; <label>:118:                                    ; preds = %110
  %119 = add nsw i32 %.275, 1
  %120 = sext i32 %.275 to i64
  %121 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %120
  %122 = trunc i32 %storemerge6109 to i8
  %123 = or i8 %122, 1
  store i8 %123, i8* %121, align 1
  br label %124

; <label>:124:                                    ; preds = %118, %110
  %.275.1 = phi i32 [ %119, %118 ], [ %.275, %110 ]
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %125 = add nuw nsw i32 %storemerge6109, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 256
  br i1 %exitcond.1, label %114, label %101

; <label>:126:                                    ; preds = %.loopexit, %126
  %indvars.iv.next137153 = phi i64 [ 1, %.loopexit ], [ %indvars.iv.next137, %126 ]
  %.1152 = phi i64 [ %.1149, %.loopexit ], [ %.1, %126 ]
  %.180151 = phi i32 [ %.180148, %.loopexit ], [ %.180, %126 ]
  %indvars.iv136150 = phi i64 [ 0, %.loopexit ], [ %indvars.iv.next137.1, %126 ]
  %127 = getelementptr inbounds i64, i64* %2, i64 %indvars.iv.next137153
  %128 = load i64, i64* %127, align 8
  %129 = icmp eq i64 %128, 0
  %130 = icmp sgt i64 %128, %.1152
  %or.cond.1 = or i1 %129, %130
  %131 = trunc i64 %indvars.iv.next137153 to i32
  %.180.1 = select i1 %or.cond.1, i32 %.180151, i32 %131
  %.1.1 = select i1 %or.cond.1, i64 %.1152, i64 %128
  %indvars.iv.next137.1 = add nuw nsw i64 %indvars.iv136150, 2
  %132 = getelementptr inbounds i64, i64* %2, i64 %indvars.iv.next137.1
  %133 = load i64, i64* %132, align 8
  %134 = icmp eq i64 %133, 0
  %135 = icmp sgt i64 %133, %.1.1
  %or.cond = or i1 %134, %135
  %136 = trunc i64 %indvars.iv.next137.1 to i32
  %.180 = select i1 %or.cond, i32 %.180.1, i32 %136
  %.1 = select i1 %or.cond, i64 %.1.1, i64 %133
  %indvars.iv.next137 = or i64 %indvars.iv.next137.1, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next137, 257
  br i1 %exitcond138, label %.preheader104, label %126

; <label>:137:                                    ; preds = %.preheader104, %137
  %indvars.iv.next140161 = phi i64 [ 1, %.preheader104 ], [ %indvars.iv.next140, %137 ]
  %.3160 = phi i64 [ %.3157, %.preheader104 ], [ %.3, %137 ]
  %.177159 = phi i32 [ %.177156, %.preheader104 ], [ %.177, %137 ]
  %indvars.iv139158 = phi i64 [ 0, %.preheader104 ], [ %indvars.iv.next140.1, %137 ]
  %138 = getelementptr inbounds i64, i64* %2, i64 %indvars.iv.next140161
  %139 = load i64, i64* %138, align 8
  %140 = icmp eq i64 %139, 0
  %141 = icmp sgt i64 %139, %.3160
  %or.cond82.1 = or i1 %140, %141
  %142 = icmp eq i64 %indvars.iv.next140161, %14
  %or.cond83.1 = or i1 %142, %or.cond82.1
  %143 = trunc i64 %indvars.iv.next140161 to i32
  %.177.1 = select i1 %or.cond83.1, i32 %.177159, i32 %143
  %.3.1 = select i1 %or.cond83.1, i64 %.3160, i64 %139
  %indvars.iv.next140.1 = add nuw nsw i64 %indvars.iv139158, 2
  %144 = getelementptr inbounds i64, i64* %2, i64 %indvars.iv.next140.1
  %145 = load i64, i64* %144, align 8
  %146 = icmp eq i64 %145, 0
  %147 = icmp sgt i64 %145, %.3.1
  %or.cond82 = or i1 %146, %147
  %148 = icmp eq i64 %indvars.iv.next140.1, %14
  %or.cond83 = or i1 %148, %or.cond82
  %149 = trunc i64 %indvars.iv.next140.1 to i32
  %.177 = select i1 %or.cond83, i32 %.177.1, i32 %149
  %.3 = select i1 %or.cond83, i64 %.3.1, i64 %145
  %indvars.iv.next140 = or i64 %indvars.iv.next140.1, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next140, 257
  br i1 %exitcond141, label %19, label %137
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define void @jinit_huff_encoder(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %6 = tail call i8* %5(%struct.jpeg_common_struct* %.cast, i32 1, i64 192) #4
  %.cast1 = ptrtoint i8* %6 to i64
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %8 = bitcast %struct.jpeg_entropy_encoder** %7 to i64*
  store i64 %.cast1, i64* %8, align 8
  %9 = bitcast i8* %6 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_huff, void (%struct.jpeg_compress_struct*, i32)** %9, align 8
  %10 = getelementptr inbounds i8, i8* %6, i64 64
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 128, i32 8, i1 false)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_huff(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.huff_entropy_encoder**
  %5 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %4, align 8
  %6 = icmp eq i32 %1, 0
  %7 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 0, i32 1
  %encode_mcu_huff.sink = select i1 %6, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_huff, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_gather
  %finish_pass_huff.sink = select i1 %6, void (%struct.jpeg_compress_struct*)* @finish_pass_huff, void (%struct.jpeg_compress_struct*)* @finish_pass_gather
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* %encode_mcu_huff.sink, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %7, align 8
  %8 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 0, i32 2
  store void (%struct.jpeg_compress_struct*)* %finish_pass_huff.sink, void (%struct.jpeg_compress_struct*)** %8, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %.cast5 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %.cast4 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %14 = icmp eq i32 %1, 0
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %.cast3 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %sunkaddr60 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %.cast2 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr65 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %sunkaddr70 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %17 = icmp eq i32 %1, 0
  %18 = icmp eq i32 %1, 0
  %19 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %20 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %21 = bitcast %struct.jpeg_memory_mgr** %15 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %22 = bitcast %struct.jpeg_memory_mgr** %16 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  br i1 %18, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %86
  %indvars.iv = phi i64 [ %indvars.iv.next, %86 ], [ 0, %.lr.ph.split.us.preheader ]
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %24 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %24, i64 0, i32 5
  %26 = load i32, i32* %25, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %24, i64 0, i32 6
  %29 = load i32, i32* %28, align 8
  %30 = sext i32 %29 to i64
  %31 = sext i32 %29 to i64
  %32 = sext i32 %29 to i64
  %33 = icmp ugt i32 %26, 3
  br i1 %33, label %39, label %34

; <label>:34:                                     ; preds = %.lr.ph.split.us
  %35 = sext i32 %26 to i64
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %35
  %37 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %36, align 8
  %38 = icmp eq %struct.JHUFF_TBL* %37, null
  br i1 %38, label %39, label %46

; <label>:39:                                     ; preds = %34, %.lr.ph.split.us
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i64 0, i32 5
  store i32 49, i32* %41, align 8
  %42 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %43 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %42, i64 0, i32 6, i32 0, i64 0
  store i32 %26, i32* %43, align 4
  %44 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %19, align 8
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  tail call void %45(%struct.jpeg_common_struct* nonnull %.cast5) #4
  br label %46

; <label>:46:                                     ; preds = %39, %34
  %47 = icmp ugt i32 %29, 3
  br i1 %47, label %52, label %48

; <label>:48:                                     ; preds = %46
  %49 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %32
  %50 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %49, align 8
  %51 = icmp eq %struct.JHUFF_TBL* %50, null
  %or.cond12.us = and i1 %17, %51
  br i1 %or.cond12.us, label %52, label %59

; <label>:52:                                     ; preds = %48, %46
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i64 0, i32 5
  store i32 49, i32* %54, align 8
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i64 0, i32 6, i32 0, i64 0
  store i32 %29, i32* %56, align 4
  %57 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %20, align 8
  %58 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %57, align 8
  tail call void %58(%struct.jpeg_common_struct* nonnull %.cast4) #4
  br label %59

; <label>:59:                                     ; preds = %52, %48
  br i1 %14, label %79, label %60

; <label>:60:                                     ; preds = %59
  %61 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 6, i64 %27
  %62 = load i64*, i64** %61, align 8
  %63 = icmp eq i64* %62, null
  br i1 %63, label %64, label %68

; <label>:64:                                     ; preds = %60
  %65 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %21, align 8
  %66 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %65, align 8
  %67 = tail call i8* %66(%struct.jpeg_common_struct* nonnull %.cast3, i32 1, i64 2056) #4
  %sunkaddr56.us = shl nsw i64 %27, 3
  %sunkaddr57.us = add i64 %sunkaddr, %sunkaddr56.us
  %sunkaddr58.us = add i64 %sunkaddr57.us, 128
  %sunkaddr59.us = inttoptr i64 %sunkaddr58.us to i8**
  store i8* %67, i8** %sunkaddr59.us, align 8
  br label %68

; <label>:68:                                     ; preds = %64, %60
  %sunkaddr61.us = shl nsw i64 %27, 3
  %sunkaddr62.us = add i64 %sunkaddr60, %sunkaddr61.us
  %sunkaddr63.us = add i64 %sunkaddr62.us, 128
  %sunkaddr64.us = inttoptr i64 %sunkaddr63.us to i8**
  %69 = load i8*, i8** %sunkaddr64.us, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %69, i8 0, i64 2056, i32 1, i1 false)
  %70 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 7, i64 %31
  %71 = load i64*, i64** %70, align 8
  %72 = icmp eq i64* %71, null
  br i1 %72, label %73, label %77

; <label>:73:                                     ; preds = %68
  %74 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %22, align 8
  %75 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %74, align 8
  %76 = tail call i8* %75(%struct.jpeg_common_struct* nonnull %.cast2, i32 1, i64 2056) #4
  %sunkaddr66.us = shl nsw i64 %31, 3
  %sunkaddr67.us = add i64 %sunkaddr65, %sunkaddr66.us
  %sunkaddr68.us = add i64 %sunkaddr67.us, 160
  %sunkaddr69.us = inttoptr i64 %sunkaddr68.us to i8**
  store i8* %76, i8** %sunkaddr69.us, align 8
  br label %77

; <label>:77:                                     ; preds = %73, %68
  %sunkaddr71.us = shl nsw i64 %31, 3
  %sunkaddr72.us = add i64 %sunkaddr70, %sunkaddr71.us
  %sunkaddr73.us = add i64 %sunkaddr72.us, 160
  %sunkaddr74.us = inttoptr i64 %sunkaddr73.us to i8**
  %78 = load i8*, i8** %sunkaddr74.us, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %78, i8 0, i64 2056, i32 1, i1 false)
  br label %86

; <label>:79:                                     ; preds = %59
  %80 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %27
  %81 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %80, align 8
  %82 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 4, i64 %27
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %81, %struct.c_derived_tbl** %82)
  %83 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %30
  %84 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %83, align 8
  %85 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 5, i64 %30
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %84, %struct.c_derived_tbl** %85)
  br label %86

; <label>:86:                                     ; preds = %79, %77
  %87 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 2, i64 %indvars.iv
  store i32 0, i32* %87, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %88 = load i32, i32* %9, align 4
  %89 = sext i32 %88 to i64
  %90 = icmp slt i64 %indvars.iv.next, %89
  br i1 %90, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %149
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %149 ], [ 0, %.lr.ph.split.preheader ]
  %91 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv77
  %92 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %91, align 8
  %93 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %92, i64 0, i32 5
  %94 = load i32, i32* %93, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %92, i64 0, i32 6
  %97 = load i32, i32* %96, align 8
  %98 = sext i32 %97 to i64
  %99 = sext i32 %97 to i64
  %100 = sext i32 %97 to i64
  %101 = icmp ugt i32 %94, 3
  br i1 %101, label %102, label %109

; <label>:102:                                    ; preds = %.lr.ph.split
  %103 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %104 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %103, i64 0, i32 5
  store i32 49, i32* %104, align 8
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i64 0, i32 6, i32 0, i64 0
  store i32 %94, i32* %106, align 4
  %107 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %19, align 8
  %108 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %107, align 8
  tail call void %108(%struct.jpeg_common_struct* nonnull %.cast5) #4
  br label %109

; <label>:109:                                    ; preds = %.lr.ph.split, %102
  %110 = icmp ugt i32 %97, 3
  br i1 %110, label %115, label %111

; <label>:111:                                    ; preds = %109
  %112 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %100
  %113 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %112, align 8
  %114 = icmp eq %struct.JHUFF_TBL* %113, null
  %or.cond12 = and i1 %17, %114
  br i1 %or.cond12, label %115, label %122

; <label>:115:                                    ; preds = %111, %109
  %116 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %117 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %116, i64 0, i32 5
  store i32 49, i32* %117, align 8
  %118 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %119 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %118, i64 0, i32 6, i32 0, i64 0
  store i32 %97, i32* %119, align 4
  %120 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %20, align 8
  %121 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %120, align 8
  tail call void %121(%struct.jpeg_common_struct* nonnull %.cast4) #4
  br label %122

; <label>:122:                                    ; preds = %115, %111
  br i1 %14, label %142, label %123

; <label>:123:                                    ; preds = %122
  %124 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 6, i64 %95
  %125 = load i64*, i64** %124, align 8
  %126 = icmp eq i64* %125, null
  br i1 %126, label %127, label %131

; <label>:127:                                    ; preds = %123
  %128 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %21, align 8
  %129 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %128, align 8
  %130 = tail call i8* %129(%struct.jpeg_common_struct* nonnull %.cast3, i32 1, i64 2056) #4
  %sunkaddr56 = shl nsw i64 %95, 3
  %sunkaddr57 = add i64 %sunkaddr, %sunkaddr56
  %sunkaddr58 = add i64 %sunkaddr57, 128
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to i8**
  store i8* %130, i8** %sunkaddr59, align 8
  br label %131

; <label>:131:                                    ; preds = %127, %123
  %sunkaddr61 = shl nsw i64 %95, 3
  %sunkaddr62 = add i64 %sunkaddr60, %sunkaddr61
  %sunkaddr63 = add i64 %sunkaddr62, 128
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to i8**
  %132 = load i8*, i8** %sunkaddr64, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %132, i8 0, i64 2056, i32 1, i1 false)
  %133 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 7, i64 %99
  %134 = load i64*, i64** %133, align 8
  %135 = icmp eq i64* %134, null
  br i1 %135, label %136, label %140

; <label>:136:                                    ; preds = %131
  %137 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %22, align 8
  %138 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %137, align 8
  %139 = tail call i8* %138(%struct.jpeg_common_struct* nonnull %.cast2, i32 1, i64 2056) #4
  %sunkaddr66 = shl nsw i64 %99, 3
  %sunkaddr67 = add i64 %sunkaddr65, %sunkaddr66
  %sunkaddr68 = add i64 %sunkaddr67, 160
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i8**
  store i8* %139, i8** %sunkaddr69, align 8
  br label %140

; <label>:140:                                    ; preds = %136, %131
  %sunkaddr71 = shl nsw i64 %99, 3
  %sunkaddr72 = add i64 %sunkaddr70, %sunkaddr71
  %sunkaddr73 = add i64 %sunkaddr72, 160
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to i8**
  %141 = load i8*, i8** %sunkaddr74, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %141, i8 0, i64 2056, i32 1, i1 false)
  br label %149

; <label>:142:                                    ; preds = %122
  %143 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %95
  %144 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %143, align 8
  %145 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 4, i64 %95
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %144, %struct.c_derived_tbl** %145)
  %146 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %98
  %147 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %146, align 8
  %148 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 5, i64 %98
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %147, %struct.c_derived_tbl** %148)
  br label %149

; <label>:149:                                    ; preds = %142, %140
  %150 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 2, i64 %indvars.iv77
  store i32 0, i32* %150, align 4
  %indvars.iv.next78 = add nuw i64 %indvars.iv77, 1
  %151 = load i32, i32* %9, align 4
  %152 = sext i32 %151 to i64
  %153 = icmp slt i64 %indvars.iv.next78, %152
  br i1 %153, label %.lr.ph.split, label %._crit_edge.loopexit81

._crit_edge.loopexit:                             ; preds = %86
  br label %._crit_edge

._crit_edge.loopexit81:                           ; preds = %149
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit81, %._crit_edge.loopexit, %2
  %154 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 0
  store i64 0, i64* %154, align 8
  %155 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 1
  store i32 0, i32* %155, align 8
  %156 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %157 = load i32, i32* %156, align 8
  %158 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 2
  store i32 %157, i32* %158, align 8
  %159 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 3
  store i32 0, i32* %159, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal i32 @encode_mcu_gather(%struct.jpeg_compress_struct*, [64 x i16]**) #2 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %.preheader, label %9

; <label>:9:                                      ; preds = %2
  %10 = inttoptr i64 %5 to %struct.huff_entropy_encoder*
  %11 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %10, i64 0, i32 2
  %12 = load i32, i32* %11, align 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %.preheader29, label %24

.preheader29:                                     ; preds = %9
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %15 = load i32, i32* %14, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %.lr.ph32, label %._crit_edge33

.lr.ph32:                                         ; preds = %.preheader29
  %17 = inttoptr i64 %5 to %struct.huff_entropy_encoder*
  br label %18

; <label>:18:                                     ; preds = %.lr.ph32, %18
  %indvars.iv34 = phi i64 [ 0, %.lr.ph32 ], [ %indvars.iv.next35, %18 ]
  %19 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %17, i64 0, i32 1, i32 2, i64 %indvars.iv34
  store i32 0, i32* %19, align 4
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %20 = load i32, i32* %14, align 4
  %21 = sext i32 %20 to i64
  %22 = icmp slt i64 %indvars.iv.next35, %21
  br i1 %22, label %18, label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %18
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %.preheader29
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr23 = add i64 %sunkaddr, 272
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i32*
  %23 = load i32, i32* %sunkaddr24, align 8
  %sunkaddr25 = add i64 %5, 56
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to i32*
  store i32 %23, i32* %sunkaddr26, align 8
  br label %24

; <label>:24:                                     ; preds = %._crit_edge33, %9
  %sunkaddr27 = add i64 %5, 56
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i32*
  %25 = load i32, i32* %sunkaddr28, align 8
  %26 = add i32 %25, -1
  store i32 %26, i32* %sunkaddr28, align 8
  br label %.preheader

.preheader:                                       ; preds = %2, %24
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  %28 = load i32, i32* %27, align 8
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %30 = inttoptr i64 %5 to %struct.huff_entropy_encoder*
  br label %31

; <label>:31:                                     ; preds = %.lr.ph, %31
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %31 ]
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 46, i64 %indvars.iv
  %33 = load i32, i32* %32, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %34
  %36 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %35, align 8
  %37 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %38 = bitcast [64 x i16]** %37 to i16**
  %39 = load i16*, i16** %38, align 8
  %40 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %30, i64 0, i32 1, i32 2, i64 %34
  %41 = load i32, i32* %40, align 4
  %42 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %36, i64 0, i32 5
  %43 = load i32, i32* %42, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %30, i64 0, i32 6, i64 %44
  %46 = load i64*, i64** %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %36, i64 0, i32 6
  %48 = load i32, i32* %47, align 8
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %30, i64 0, i32 7, i64 %49
  %51 = load i64*, i64** %50, align 8
  tail call void @htest_one_block(i16* %39, i32 %41, i64* %46, i64* %51)
  %52 = bitcast [64 x i16]** %37 to i16**
  %53 = load i16*, i16** %52, align 8
  %54 = load i16, i16* %53, align 2
  %55 = sext i16 %54 to i32
  store i32 %55, i32* %40, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %56 = load i32, i32* %27, align 8
  %57 = sext i32 %56 to i64
  %58 = icmp slt i64 %indvars.iv.next, %57
  br i1 %58, label %31, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %31
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_gather(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca [4 x i32], align 16
  %3 = alloca [4 x i32], align 16
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %5 = bitcast %struct.jpeg_entropy_encoder** %4 to i64*
  %6 = load i64, i64* %5, align 8
  %7 = bitcast [4 x i32]* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 0, i64 16, i32 16, i1 false)
  %8 = bitcast [4 x i32]* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 16, i32 16, i1 false)
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %12 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr24 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %13 = inttoptr i64 %6 to %struct.huff_entropy_encoder*
  %sunkaddr29 = ptrtoint [4 x i32]* %2 to i64
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr33 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr38 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %15 = inttoptr i64 %6 to %struct.huff_entropy_encoder*
  %sunkaddr43 = ptrtoint [4 x i32]* %3 to i64
  br label %16

; <label>:16:                                     ; preds = %.lr.ph, %52
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %52 ]
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %18 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %18, i64 0, i32 5
  %20 = load i32, i32* %19, align 4
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %18, i64 0, i32 6
  %22 = load i32, i32* %21, align 8
  %23 = sext i32 %22 to i64
  %24 = sext i32 %20 to i64
  %25 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %38

; <label>:28:                                     ; preds = %16
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %24
  %30 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %29, align 8
  %31 = icmp eq %struct.JHUFF_TBL* %30, null
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %28
  %33 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* nonnull %12) #4
  %sunkaddr20 = shl nsw i64 %24, 3
  %sunkaddr21 = add i64 %sunkaddr, %sunkaddr20
  %sunkaddr22 = add i64 %sunkaddr21, 120
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to %struct.JHUFF_TBL**
  store %struct.JHUFF_TBL* %33, %struct.JHUFF_TBL** %sunkaddr23, align 8
  br label %34

; <label>:34:                                     ; preds = %32, %28
  %sunkaddr25 = shl nsw i64 %24, 3
  %sunkaddr26 = add i64 %sunkaddr24, %sunkaddr25
  %sunkaddr27 = add i64 %sunkaddr26, 120
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to %struct.JHUFF_TBL**
  %35 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %sunkaddr28, align 8
  %36 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %13, i64 0, i32 6, i64 %24
  %37 = load i64*, i64** %36, align 8
  tail call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %35, i64* %37)
  %sunkaddr30 = shl nsw i64 %24, 2
  %sunkaddr31 = add i64 %sunkaddr29, %sunkaddr30
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i32*
  store i32 1, i32* %sunkaddr32, align 4
  br label %38

; <label>:38:                                     ; preds = %16, %34
  %39 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 %23
  %40 = load i32, i32* %39, align 4
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %52

; <label>:42:                                     ; preds = %38
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %23
  %44 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %43, align 8
  %45 = icmp eq %struct.JHUFF_TBL* %44, null
  br i1 %45, label %46, label %48

; <label>:46:                                     ; preds = %42
  %47 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* nonnull %14) #4
  %sunkaddr34 = shl nsw i64 %23, 3
  %sunkaddr35 = add i64 %sunkaddr33, %sunkaddr34
  %sunkaddr36 = add i64 %sunkaddr35, 152
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to %struct.JHUFF_TBL**
  store %struct.JHUFF_TBL* %47, %struct.JHUFF_TBL** %sunkaddr37, align 8
  br label %48

; <label>:48:                                     ; preds = %46, %42
  %sunkaddr39 = shl nsw i64 %23, 3
  %sunkaddr40 = add i64 %sunkaddr38, %sunkaddr39
  %sunkaddr41 = add i64 %sunkaddr40, 152
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to %struct.JHUFF_TBL**
  %49 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %sunkaddr42, align 8
  %50 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %15, i64 0, i32 7, i64 %23
  %51 = load i64*, i64** %50, align 8
  tail call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %49, i64* %51)
  %sunkaddr44 = shl nsw i64 %23, 2
  %sunkaddr45 = add i64 %sunkaddr43, %sunkaddr44
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to i32*
  store i32 1, i32* %sunkaddr46, align 4
  br label %52

; <label>:52:                                     ; preds = %48, %38
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %53 = load i32, i32* %9, align 4
  %54 = sext i32 %53 to i64
  %55 = icmp slt i64 %indvars.iv.next, %54
  br i1 %55, label %16, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %52
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_huff(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
  %3 = alloca %struct.working_state, align 8
  %4 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %6 = bitcast %struct.jpeg_entropy_encoder** %5 to %struct.huff_entropy_encoder**
  %7 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %9 = bitcast %struct.jpeg_destination_mgr** %8 to i64**
  %10 = load i64*, i64** %9, align 8
  %11 = load i64, i64* %10, align 8
  %12 = bitcast %struct.working_state* %3 to i64*
  store i64 %11, i64* %12, align 8
  %13 = getelementptr inbounds i64, i64* %10, i64 1
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds %struct.working_state, %struct.working_state* %3, i64 0, i32 1
  store i64 %14, i64* %15, align 8
  %16 = getelementptr inbounds %struct.working_state, %struct.working_state* %3, i64 0, i32 2
  %17 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %7, i64 0, i32 1
  %18 = bitcast %struct.savable_state* %16 to i8*
  %19 = bitcast %struct.savable_state* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 32, i32 8, i1 false)
  %20 = getelementptr inbounds %struct.working_state, %struct.working_state* %3, i64 0, i32 3
  %21 = bitcast %struct.jpeg_compress_struct** %20 to i64*
  store i64 %4, i64* %21, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %.preheader, label %25

; <label>:25:                                     ; preds = %2
  %26 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %7, i64 0, i32 2
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %.preheader

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %7, i64 0, i32 3
  %31 = load i32, i32* %30, align 4
  %32 = call i32 @emit_restart(%struct.working_state* nonnull %3, i32 %31)
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %25, %29, %2
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  %35 = load i32, i32* %34, align 8
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %sunkaddr = ptrtoint [64 x i16]** %1 to i64
  %sunkaddr30 = ptrtoint %struct.working_state* %3 to i64
  br label %37

; <label>:37:                                     ; preds = %.lr.ph, %60
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %60 ]
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 46, i64 %indvars.iv
  %39 = load i32, i32* %38, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %40
  %42 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %41, align 8
  %43 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %44 = bitcast [64 x i16]** %43 to i16**
  %45 = load i16*, i16** %44, align 8
  %46 = getelementptr inbounds %struct.working_state, %struct.working_state* %3, i64 0, i32 2, i32 2, i64 %40
  %47 = load i32, i32* %46, align 4
  %48 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %42, i64 0, i32 5
  %49 = load i32, i32* %48, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %7, i64 0, i32 4, i64 %50
  %52 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %42, i64 0, i32 6
  %54 = load i32, i32* %53, align 8
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %7, i64 0, i32 5, i64 %55
  %57 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %56, align 8
  %58 = call i32 @encode_one_block(%struct.working_state* nonnull %3, i16* %45, i32 %47, %struct.c_derived_tbl* %52, %struct.c_derived_tbl* %57)
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %.loopexit.loopexit, label %60

; <label>:60:                                     ; preds = %37
  %sunkaddr27 = shl nsw i64 %indvars.iv, 3
  %sunkaddr28 = add i64 %sunkaddr, %sunkaddr27
  %61 = inttoptr i64 %sunkaddr28 to i16**
  %62 = load i16*, i16** %61, align 8
  %63 = load i16, i16* %62, align 2
  %64 = sext i16 %63 to i32
  %sunkaddr31 = shl nsw i64 %40, 2
  %sunkaddr32 = add i64 %sunkaddr30, %sunkaddr31
  %sunkaddr33 = add i64 %sunkaddr32, 28
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  store i32 %64, i32* %sunkaddr34, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %65 = load i32, i32* %34, align 8
  %66 = sext i32 %65 to i64
  %67 = icmp slt i64 %indvars.iv.next, %66
  br i1 %67, label %37, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %60
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %68 = bitcast %struct.savable_state* %17 to i8*
  %69 = bitcast %struct.savable_state* %16 to i8*
  %70 = bitcast %struct.working_state* %3 to i64*
  %71 = load i64, i64* %70, align 8
  %sunkaddr35 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 32
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to i64**
  %72 = load i64*, i64** %sunkaddr37, align 8
  store i64 %71, i64* %72, align 8
  %sunkaddr38 = ptrtoint %struct.working_state* %3 to i64
  %sunkaddr39 = add i64 %sunkaddr38, 8
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to i64*
  %73 = load i64, i64* %sunkaddr40, align 8
  %sunkaddr41 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr42 = add i64 %sunkaddr41, 32
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to %struct.jpeg_destination_mgr**
  %74 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr43, align 8
  %75 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %74, i64 0, i32 1
  store i64 %73, i64* %75, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %68, i8* %69, i64 32, i32 8, i1 false)
  %sunkaddr44 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr45 = add i64 %sunkaddr44, 272
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to i32*
  %76 = load i32, i32* %sunkaddr46, align 8
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %.loopexit, label %78

; <label>:78:                                     ; preds = %._crit_edge
  %79 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %7, i64 0, i32 2
  %80 = load i32, i32* %79, align 8
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %87

; <label>:82:                                     ; preds = %78
  %sunkaddr47 = ptrtoint %struct.huff_entropy_encoder* %7 to i64
  %sunkaddr48 = add i64 %sunkaddr47, 56
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i32*
  store i32 %76, i32* %sunkaddr49, align 8
  %83 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %7, i64 0, i32 3
  %84 = load i32, i32* %83, align 4
  %85 = add nsw i32 %84, 1
  %86 = and i32 %85, 7
  store i32 %86, i32* %83, align 4
  br label %87

; <label>:87:                                     ; preds = %82, %78
  %sunkaddr50 = ptrtoint %struct.huff_entropy_encoder* %7 to i64
  %sunkaddr51 = add i64 %sunkaddr50, 56
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i32*
  %88 = load i32, i32* %sunkaddr52, align 8
  %89 = add i32 %88, -1
  store i32 %89, i32* %sunkaddr52, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %37
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %87, %._crit_edge, %29
  %.0 = phi i32 [ 0, %29 ], [ 1, %._crit_edge ], [ 1, %87 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_huff(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.working_state, align 8
  %3 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %5 = bitcast %struct.jpeg_entropy_encoder** %4 to %struct.huff_entropy_encoder**
  %6 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %8 = bitcast %struct.jpeg_destination_mgr** %7 to i64**
  %9 = load i64*, i64** %8, align 8
  %10 = load i64, i64* %9, align 8
  %11 = bitcast %struct.working_state* %2 to i64*
  store i64 %10, i64* %11, align 8
  %12 = getelementptr inbounds i64, i64* %9, i64 1
  %13 = load i64, i64* %12, align 8
  %14 = getelementptr inbounds %struct.working_state, %struct.working_state* %2, i64 0, i32 1
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.working_state, %struct.working_state* %2, i64 0, i32 2
  %16 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 1
  %17 = bitcast %struct.savable_state* %15 to i8*
  %18 = bitcast %struct.savable_state* %16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 32, i32 8, i1 false)
  %19 = getelementptr inbounds %struct.working_state, %struct.working_state* %2, i64 0, i32 3
  %20 = bitcast %struct.jpeg_compress_struct** %19 to i64*
  store i64 %3, i64* %20, align 8
  %21 = call i32 @flush_bits(%struct.working_state* nonnull %2)
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %31

; <label>:23:                                     ; preds = %1
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 5
  store i32 22, i32* %26, align 8
  %27 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %28 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %27, align 8
  %29 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %28, align 8
  %30 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  call void %29(%struct.jpeg_common_struct* %30) #4
  br label %31

; <label>:31:                                     ; preds = %1, %23
  %32 = bitcast %struct.savable_state* %16 to i8*
  %33 = bitcast %struct.savable_state* %15 to i8*
  %34 = bitcast %struct.working_state* %2 to i64*
  %35 = load i64, i64* %34, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr, 32
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i64**
  %36 = load i64*, i64** %sunkaddr8, align 8
  store i64 %35, i64* %36, align 8
  %sunkaddr9 = ptrtoint %struct.working_state* %2 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 8
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i64*
  %37 = load i64, i64* %sunkaddr11, align 8
  %sunkaddr12 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 32
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to %struct.jpeg_destination_mgr**
  %38 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr14, align 8
  %39 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %38, i64 0, i32 1
  store i64 %37, i64* %39, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 32, i32 8, i1 false)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @htest_one_block(i16*, i32, i64*, i64*) #2 {
  %5 = load i16, i16* %0, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %6, %1
  %8 = icmp slt i32 %7, 0
  %9 = sub nsw i32 0, %7
  %. = select i1 %8, i32 %9, i32 %7
  %10 = icmp eq i32 %., 0
  br i1 %10, label %._crit_edge34, label %.lr.ph33.preheader

.lr.ph33.preheader:                               ; preds = %4
  br label %.lr.ph33

.lr.ph33:                                         ; preds = %.lr.ph33.preheader, %.lr.ph33
  %.12431 = phi i32 [ %12, %.lr.ph33 ], [ %., %.lr.ph33.preheader ]
  %.02530 = phi i32 [ %11, %.lr.ph33 ], [ 0, %.lr.ph33.preheader ]
  %11 = add nuw nsw i32 %.02530, 1
  %12 = ashr i32 %.12431, 1
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %._crit_edge34.loopexit, label %.lr.ph33

._crit_edge34.loopexit:                           ; preds = %.lr.ph33
  %phitmp = sext i32 %11 to i64
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %4
  %.025.lcssa = phi i64 [ 0, %4 ], [ %phitmp, %._crit_edge34.loopexit ]
  %14 = getelementptr inbounds i64, i64* %2, i64 %.025.lcssa
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, 1
  store i64 %16, i64* %14, align 8
  %17 = getelementptr inbounds i64, i64* %3, i64 240
  br label %18

; <label>:18:                                     ; preds = %50, %._crit_edge34
  %indvars.iv = phi i64 [ 1, %._crit_edge34 ], [ %indvars.iv.next, %50 ]
  %.028 = phi i32 [ 0, %._crit_edge34 ], [ %storemerge2, %50 ]
  %19 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %20 = load i32, i32* %19, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i16, i16* %0, i64 %21
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i32
  %25 = icmp eq i16 %23, 0
  br i1 %25, label %27, label %.preheader

.preheader:                                       ; preds = %18
  %26 = icmp sgt i32 %.028, 15
  br i1 %26, label %._crit_edge, label %36

; <label>:27:                                     ; preds = %18
  %28 = add nsw i32 %.028, 1
  br label %50

._crit_edge:                                      ; preds = %.preheader
  %29 = add i32 %.028, -16
  %30 = lshr i32 %29, 4
  %31 = shl nuw i32 %30, 4
  %32 = zext i32 %30 to i64
  %.promoted = load i64, i64* %17, align 8
  %33 = add i64 %.promoted, 1
  %34 = add i64 %33, %32
  %35 = sub i32 %29, %31
  store i64 %34, i64* %17, align 8
  br label %36

; <label>:36:                                     ; preds = %._crit_edge, %.preheader
  %.1.lcssa = phi i32 [ %35, %._crit_edge ], [ %.028, %.preheader ]
  %37 = icmp slt i16 %23, 0
  %38 = sub nsw i32 0, %24
  %.26 = select i1 %37, i32 %38, i32 %24
  br label %39

; <label>:39:                                     ; preds = %39, %36
  %.2 = phi i32 [ %40, %39 ], [ %.26, %36 ]
  %storemerge1 = phi i32 [ %42, %39 ], [ 1, %36 ]
  %40 = ashr i32 %.2, 1
  %41 = icmp eq i32 %40, 0
  %42 = add nuw nsw i32 %storemerge1, 1
  br i1 %41, label %43, label %39

; <label>:43:                                     ; preds = %39
  %44 = shl i32 %.1.lcssa, 4
  %45 = add nsw i32 %storemerge1, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i64, i64* %3, i64 %46
  %48 = load i64, i64* %47, align 8
  %49 = add nsw i64 %48, 1
  store i64 %49, i64* %47, align 8
  br label %50

; <label>:50:                                     ; preds = %43, %27
  %storemerge2 = phi i32 [ 0, %43 ], [ %28, %27 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 64
  br i1 %exitcond, label %51, label %18

; <label>:51:                                     ; preds = %50
  %52 = icmp sgt i32 %storemerge2, 0
  br i1 %52, label %53, label %56

; <label>:53:                                     ; preds = %51
  %54 = load i64, i64* %3, align 8
  %55 = add nsw i64 %54, 1
  store i64 %55, i64* %3, align 8
  br label %56

; <label>:56:                                     ; preds = %53, %51
  ret void
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @emit_restart(%struct.working_state*, i32) #0 {
  %3 = tail call i32 @flush_bits(%struct.working_state* %0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %.loopexit, label %5

; <label>:5:                                      ; preds = %2
  %6 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 0
  %7 = load i8*, i8** %6, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 1
  store i8* %8, i8** %6, align 8
  store i8 -1, i8* %7, align 1
  %9 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 1
  %10 = load i64, i64* %9, align 8
  %11 = add i64 %10, -1
  store i64 %11, i64* %9, align 8
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %5
  %14 = tail call i32 @dump_buffer(%struct.working_state* nonnull %0)
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %.loopexit, label %16

; <label>:16:                                     ; preds = %13, %5
  %17 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 0
  %18 = add nsw i32 %1, 208
  %19 = trunc i32 %18 to i8
  %20 = load i8*, i8** %17, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 1
  store i8* %21, i8** %17, align 8
  store i8 %19, i8* %20, align 1
  %sunkaddr = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr9 = add i64 %sunkaddr, 8
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i64*
  %22 = load i64, i64* %sunkaddr10, align 8
  %23 = add i64 %22, -1
  store i64 %23, i64* %sunkaddr10, align 8
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %25, label %.preheader

; <label>:25:                                     ; preds = %16
  %26 = tail call i32 @dump_buffer(%struct.working_state* nonnull %0)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %25, %16
  %28 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 3
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i64 0, i32 41
  %31 = load i32, i32* %30, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %33 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 2, i64 %indvars.iv
  store i32 0, i32* %33, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %28, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i64 0, i32 41
  %36 = load i32, i32* %35, align 4
  %37 = sext i32 %36 to i64
  %38 = icmp slt i64 %indvars.iv.next, %37
  br i1 %38, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %25, %13, %2
  %.0 = phi i32 [ 0, %2 ], [ 0, %13 ], [ 0, %25 ], [ 1, %.preheader ], [ 1, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_one_block(%struct.working_state*, i16*, i32, %struct.c_derived_tbl*, %struct.c_derived_tbl*) #0 {
  %6 = load i16, i16* %1, align 2
  %7 = sext i16 %6 to i32
  %8 = sub nsw i32 %7, %2
  %9 = icmp slt i32 %8, 0
  %10 = sub nsw i32 0, %8
  %. = select i1 %9, i32 %10, i32 %8
  %.lobit = ashr i32 %8, 31
  %.43 = add nsw i32 %.lobit, %8
  %11 = icmp eq i32 %., 0
  br i1 %11, label %._crit_edge59, label %.lr.ph58.preheader

.lr.ph58.preheader:                               ; preds = %5
  br label %.lr.ph58

.lr.ph58:                                         ; preds = %.lr.ph58.preheader, %.lr.ph58
  %.03856 = phi i32 [ %12, %.lr.ph58 ], [ 0, %.lr.ph58.preheader ]
  %.14255 = phi i32 [ %13, %.lr.ph58 ], [ %., %.lr.ph58.preheader ]
  %12 = add nuw nsw i32 %.03856, 1
  %13 = ashr i32 %.14255, 1
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %._crit_edge59.loopexit, label %.lr.ph58

._crit_edge59.loopexit:                           ; preds = %.lr.ph58
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge59.loopexit, %5
  %.038.lcssa = phi i32 [ 0, %5 ], [ %12, %._crit_edge59.loopexit ]
  %15 = sext i32 %.038.lcssa to i64
  %16 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %3, i64 0, i32 0, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %3, i64 0, i32 1, i64 %15
  %19 = load i8, i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = tail call i32 @emit_bits(%struct.working_state* %0, i32 %17, i32 %20)
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %.loopexit, label %23

; <label>:23:                                     ; preds = %._crit_edge59
  %24 = icmp eq i32 %.038.lcssa, 0
  br i1 %24, label %.preheader47, label %25

; <label>:25:                                     ; preds = %23
  %26 = tail call i32 @emit_bits(%struct.working_state* %0, i32 %.43, i32 %.038.lcssa)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %.loopexit, label %.preheader47

.preheader47:                                     ; preds = %25, %23
  %28 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 0, i64 240
  %29 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 1, i64 240
  br label %30

; <label>:30:                                     ; preds = %.preheader47, %70
  %indvars.iv = phi i64 [ 1, %.preheader47 ], [ %indvars.iv.next, %70 ]
  %.053 = phi i32 [ 0, %.preheader47 ], [ %storemerge2, %70 ]
  %31 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %32 = load i32, i32* %31, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i16, i16* %1, i64 %33
  %35 = load i16, i16* %34, align 2
  %36 = sext i16 %35 to i32
  %37 = icmp eq i16 %35, 0
  br i1 %37, label %39, label %.preheader

.preheader:                                       ; preds = %30
  %38 = icmp sgt i32 %.053, 15
  br i1 %38, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:39:                                     ; preds = %30
  %40 = add nsw i32 %.053, 1
  br label %70

.lr.ph:                                           ; preds = %.lr.ph.preheader, %46
  %.152 = phi i32 [ %47, %46 ], [ %.053, %.lr.ph.preheader ]
  %41 = load i32, i32* %28, align 4
  %42 = load i8, i8* %29, align 4
  %43 = sext i8 %42 to i32
  %44 = tail call i32 @emit_bits(%struct.working_state* %0, i32 %41, i32 %43)
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %.loopexit.loopexit, label %46

; <label>:46:                                     ; preds = %.lr.ph
  %47 = add nsw i32 %.152, -16
  %48 = icmp sgt i32 %47, 15
  br i1 %48, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %46
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.1.lcssa = phi i32 [ %.053, %.preheader ], [ %47, %._crit_edge.loopexit ]
  %49 = icmp slt i16 %35, 0
  %50 = sub nsw i32 0, %36
  %.44 = select i1 %49, i32 %50, i32 %36
  %.lobit46 = ashr i16 %35, 15
  br label %51

; <label>:51:                                     ; preds = %51, %._crit_edge
  %.2 = phi i32 [ %52, %51 ], [ %.44, %._crit_edge ]
  %storemerge1 = phi i32 [ %54, %51 ], [ 1, %._crit_edge ]
  %52 = ashr i32 %.2, 1
  %53 = icmp eq i32 %52, 0
  %54 = add nuw nsw i32 %storemerge1, 1
  br i1 %53, label %55, label %51

; <label>:55:                                     ; preds = %51
  %56 = shl i32 %.1.lcssa, 4
  %57 = add nsw i32 %storemerge1, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 0, i64 %58
  %60 = load i32, i32* %59, align 4
  %61 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 1, i64 %58
  %62 = load i8, i8* %61, align 1
  %63 = sext i8 %62 to i32
  %64 = tail call i32 @emit_bits(%struct.working_state* %0, i32 %60, i32 %63)
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %.loopexit.loopexit67, label %66

; <label>:66:                                     ; preds = %55
  %67 = sext i16 %.lobit46 to i32
  %.45 = add nsw i32 %67, %36
  %68 = tail call i32 @emit_bits(%struct.working_state* %0, i32 %.45, i32 %storemerge1)
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %.loopexit.loopexit67, label %70

; <label>:70:                                     ; preds = %66, %39
  %storemerge2 = phi i32 [ %40, %39 ], [ 0, %66 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %71 = icmp slt i64 %indvars.iv.next, 64
  br i1 %71, label %30, label %72

; <label>:72:                                     ; preds = %70
  %73 = icmp sgt i32 %storemerge2, 0
  br i1 %73, label %74, label %82

; <label>:74:                                     ; preds = %72
  %75 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 0, i64 0
  %76 = load i32, i32* %75, align 4
  %77 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 1, i64 0
  %78 = load i8, i8* %77, align 4
  %79 = sext i8 %78 to i32
  %80 = tail call i32 @emit_bits(%struct.working_state* %0, i32 %76, i32 %79)
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %.loopexit, label %82

; <label>:82:                                     ; preds = %74, %72
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit.loopexit67:                             ; preds = %55, %66
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit67, %.loopexit.loopexit, %74, %25, %._crit_edge59, %82
  %.037 = phi i32 [ 1, %82 ], [ 0, %._crit_edge59 ], [ 0, %25 ], [ 0, %74 ], [ 0, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit67 ]
  ret i32 %.037
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @flush_bits(%struct.working_state*) #0 {
  %2 = tail call i32 @emit_bits(%struct.working_state* %0, i32 127, i32 7)
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %7, label %4

; <label>:4:                                      ; preds = %1
  %5 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 0
  store i64 0, i64* %5, align 8
  %6 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 1
  store i32 0, i32* %6, align 8
  br label %7

; <label>:7:                                      ; preds = %1, %4
  %storemerge = phi i32 [ 1, %4 ], [ 0, %1 ]
  ret i32 %storemerge
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @dump_buffer(%struct.working_state*) #0 {
  %2 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 3
  %3 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %3, i64 0, i32 5
  %5 = bitcast %struct.jpeg_destination_mgr** %4 to i64*
  %6 = load i64, i64* %5, align 8
  %.cast = inttoptr i64 %6 to %struct.jpeg_destination_mgr*
  %7 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %.cast, i64 0, i32 3
  %8 = load i32 (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)** %7, align 8
  %9 = tail call i32 %8(%struct.jpeg_compress_struct* %3) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %18, label %11

; <label>:11:                                     ; preds = %1
  %12 = inttoptr i64 %6 to i64*
  %13 = load i64, i64* %12, align 8
  %14 = bitcast %struct.working_state* %0 to i64*
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds i64, i64* %12, i64 1
  %16 = load i64, i64* %15, align 8
  %17 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 1
  store i64 %16, i64* %17, align 8
  br label %18

; <label>:18:                                     ; preds = %1, %11
  %storemerge = phi i32 [ 1, %11 ], [ 0, %1 ]
  ret i32 %storemerge
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @emit_bits(%struct.working_state*, i32, i32) #0 {
  %4 = zext i32 %1 to i64
  %5 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 1
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %2, 0
  br i1 %7, label %8, label %18

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 3
  %10 = bitcast %struct.jpeg_compress_struct** %9 to %struct.jpeg_error_mgr***
  %11 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %10, align 8
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 39, i32* %13, align 8
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %9, align 8
  %15 = bitcast %struct.jpeg_compress_struct* %14 to void (%struct.jpeg_common_struct*)***
  %16 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %14 to %struct.jpeg_common_struct*
  tail call void %17(%struct.jpeg_common_struct* %.cast) #4
  br label %18

; <label>:18:                                     ; preds = %8, %3
  %19 = zext i32 %2 to i64
  %20 = shl i64 1, %19
  %21 = add i64 %20, 4294967295
  %22 = and i64 %21, %4
  %23 = add nsw i32 %6, %2
  %24 = sub nsw i32 24, %23
  %25 = zext i32 %24 to i64
  %26 = shl i64 %22, %25
  %27 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 0
  %28 = load i64, i64* %27, align 8
  %29 = or i64 %28, %26
  %30 = icmp sgt i32 %23, 7
  br i1 %30, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %18
  %31 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 0
  %32 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 1
  %33 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 0
  %sunkaddr = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr21 = add i64 %sunkaddr, 8
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i64*
  br label %34

; <label>:34:                                     ; preds = %.lr.ph, %57
  %.01932 = phi i32 [ %23, %.lr.ph ], [ %59, %57 ]
  %.02031 = phi i64 [ %29, %.lr.ph ], [ %58, %57 ]
  %35 = lshr i64 %.02031, 16
  %36 = trunc i64 %35 to i8
  %37 = load i8*, i8** %31, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 1
  store i8* %38, i8** %31, align 8
  store i8 %36, i8* %37, align 1
  %39 = load i64, i64* %32, align 8
  %40 = add i64 %39, -1
  store i64 %40, i64* %32, align 8
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %42, label %45

; <label>:42:                                     ; preds = %34
  %43 = tail call i32 @dump_buffer(%struct.working_state* nonnull %0)
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %.loopexit.loopexit, label %45

; <label>:45:                                     ; preds = %42, %34
  %46 = and i64 %35, 255
  %47 = icmp eq i64 %46, 255
  br i1 %47, label %48, label %57

; <label>:48:                                     ; preds = %45
  %49 = load i8*, i8** %33, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 1
  store i8* %50, i8** %33, align 8
  store i8 0, i8* %49, align 1
  %51 = load i64, i64* %sunkaddr22, align 8
  %52 = add i64 %51, -1
  store i64 %52, i64* %sunkaddr22, align 8
  %53 = icmp eq i64 %52, 0
  br i1 %53, label %54, label %57

; <label>:54:                                     ; preds = %48
  %55 = tail call i32 @dump_buffer(%struct.working_state* nonnull %0)
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %.loopexit.loopexit, label %57

; <label>:57:                                     ; preds = %48, %54, %45
  %58 = shl i64 %.02031, 8
  %59 = add nsw i32 %.01932, -8
  %60 = icmp sgt i32 %59, 7
  br i1 %60, label %34, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %57
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %18
  %.020.lcssa = phi i64 [ %29, %18 ], [ %58, %._crit_edge.loopexit ]
  %.019.lcssa = phi i32 [ %23, %18 ], [ %59, %._crit_edge.loopexit ]
  %sunkaddr23 = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 16
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i64*
  store i64 %.020.lcssa, i64* %sunkaddr25, align 8
  %sunkaddr26 = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 24
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i32*
  store i32 %.019.lcssa, i32* %sunkaddr28, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %42, %54
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
