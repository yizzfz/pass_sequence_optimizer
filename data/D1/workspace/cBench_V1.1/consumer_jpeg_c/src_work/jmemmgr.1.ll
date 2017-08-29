; ModuleID = 'jmemmgr.ll'
source_filename = "jmemmgr.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%struct.jpeg_error_mgr = type { {}*, void (%struct.jpeg_common_struct*, i32)*, {}*, void (%struct.jpeg_common_struct*, i8*)*, {}*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type { i8**, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.jvirt_sarray_control*, %struct.backing_store_struct }
%struct.backing_store_struct = type { void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)*, %struct._IO_FILE*, [64 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.jvirt_barray_control = type { [64 x i16]**, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.jvirt_barray_control*, %struct.backing_store_struct }
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%union.small_pool_struct = type { %struct.anon }
%struct.anon = type { %union.small_pool_struct*, i64, i64 }
%union.large_pool_struct = type { %struct.anon.0 }
%struct.anon.0 = type { %union.large_pool_struct*, i64, i64 }
%struct.my_memory_mgr = type { %struct.jpeg_memory_mgr, [2 x %union.small_pool_struct*], [2 x %union.large_pool_struct*], %struct.jvirt_sarray_control*, %struct.jvirt_barray_control*, i64, i32 }

@.str = private unnamed_addr constant [8 x i8] c"JPEGMEM\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%ld%c\00", align 1
@first_pool_slop = internal unnamed_addr constant [2 x i64] [i64 1600, i64 16000], align 16
@extra_pool_slop = internal unnamed_addr constant [2 x i64] [i64 0, i64 5000], align 16

; Function Attrs: noinline nounwind uwtable
define void @jinit_memory_mgr(%struct.jpeg_common_struct*) local_unnamed_addr #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8, align 1
  %4 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  store %struct.jpeg_memory_mgr* null, %struct.jpeg_memory_mgr** %4, align 8
  %5 = tail call i64 @jpeg_mem_init(%struct.jpeg_common_struct* %0) #5
  store i64 %5, i64* %2, align 8
  %6 = tail call i8* @jpeg_get_small(%struct.jpeg_common_struct* %0, i64 160) #5
  %7 = icmp eq i8* %6, null
  br i1 %7, label %8, label %17

; <label>:8:                                      ; preds = %1
  tail call void @jpeg_mem_term(%struct.jpeg_common_struct* nonnull %0) #5
  %9 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 5
  store i32 53, i32* %11, align 8
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 0
  store i32 0, i32* %13, align 4
  %14 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %15 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %14, align 8
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  tail call void %16(%struct.jpeg_common_struct* nonnull %0) #5
  br label %17

; <label>:17:                                     ; preds = %1, %8
  %18 = bitcast i8* %6 to i8* (%struct.jpeg_common_struct*, i32, i64)**
  store i8* (%struct.jpeg_common_struct*, i32, i64)* @alloc_small, i8* (%struct.jpeg_common_struct*, i32, i64)** %18, align 8
  %19 = getelementptr inbounds i8, i8* %6, i64 8
  %20 = bitcast i8* %19 to i8* (%struct.jpeg_common_struct*, i32, i64)**
  store i8* (%struct.jpeg_common_struct*, i32, i64)* @alloc_large, i8* (%struct.jpeg_common_struct*, i32, i64)** %20, align 8
  %21 = getelementptr inbounds i8, i8* %6, i64 16
  %22 = bitcast i8* %21 to i8** (%struct.jpeg_common_struct*, i32, i32, i32)**
  store i8** (%struct.jpeg_common_struct*, i32, i32, i32)* @alloc_sarray, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %22, align 8
  %23 = getelementptr inbounds i8, i8* %6, i64 24
  %24 = bitcast i8* %23 to [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)**
  store [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)* @alloc_barray, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)** %24, align 8
  %25 = getelementptr inbounds i8, i8* %6, i64 32
  %26 = bitcast i8* %25 to %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)**
  store %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* @request_virt_sarray, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %26, align 8
  %27 = getelementptr inbounds i8, i8* %6, i64 40
  %28 = bitcast i8* %27 to %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)**
  store %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* @request_virt_barray, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %28, align 8
  %29 = getelementptr inbounds i8, i8* %6, i64 48
  %30 = bitcast i8* %29 to void (%struct.jpeg_common_struct*)**
  store void (%struct.jpeg_common_struct*)* @realize_virt_arrays, void (%struct.jpeg_common_struct*)** %30, align 8
  %31 = getelementptr inbounds i8, i8* %6, i64 56
  %32 = bitcast i8* %31 to i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)**
  store i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* @access_virt_sarray, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %32, align 8
  %33 = getelementptr inbounds i8, i8* %6, i64 64
  %34 = bitcast i8* %33 to [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)**
  store [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)* @access_virt_barray, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %34, align 8
  %35 = getelementptr inbounds i8, i8* %6, i64 72
  %36 = bitcast i8* %35 to void (%struct.jpeg_common_struct*, i32)**
  store void (%struct.jpeg_common_struct*, i32)* @free_pool, void (%struct.jpeg_common_struct*, i32)** %36, align 8
  %37 = getelementptr inbounds i8, i8* %6, i64 80
  %38 = bitcast i8* %37 to void (%struct.jpeg_common_struct*)**
  store void (%struct.jpeg_common_struct*)* @self_destruct, void (%struct.jpeg_common_struct*)** %38, align 8
  %39 = load i64, i64* %2, align 8
  %40 = getelementptr inbounds i8, i8* %6, i64 88
  %41 = bitcast i8* %40 to i64*
  store i64 %39, i64* %41, align 8
  %42 = getelementptr inbounds i8, i8* %6, i64 112
  %43 = getelementptr inbounds i8, i8* %6, i64 96
  %44 = getelementptr inbounds i8, i8* %6, i64 104
  %45 = bitcast i8* %44 to %union.small_pool_struct**
  store %union.small_pool_struct* null, %union.small_pool_struct** %45, align 8
  %46 = getelementptr inbounds i8, i8* %6, i64 120
  %47 = bitcast i8* %46 to %union.large_pool_struct**
  store %union.large_pool_struct* null, %union.large_pool_struct** %47, align 8
  %48 = bitcast i8* %43 to %union.small_pool_struct**
  store %union.small_pool_struct* null, %union.small_pool_struct** %48, align 8
  %49 = bitcast i8* %42 to %union.large_pool_struct**
  store %union.large_pool_struct* null, %union.large_pool_struct** %49, align 8
  %50 = getelementptr inbounds i8, i8* %6, i64 128
  %51 = getelementptr inbounds i8, i8* %6, i64 144
  %52 = bitcast i8* %51 to i64*
  call void @llvm.memset.p0i8.i64(i8* %50, i8 0, i64 16, i32 8, i1 false)
  store i64 160, i64* %52, align 8
  %sunkaddr = ptrtoint %struct.jpeg_common_struct* %0 to i64
  %sunkaddr3 = add i64 %sunkaddr, 8
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i8**
  store i8* %6, i8** %sunkaddr4, align 8
  %53 = tail call i8* @getenv(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #5
  %54 = icmp eq i8* %53, null
  br i1 %54, label %66, label %55

; <label>:55:                                     ; preds = %17
  store i8 120, i8* %3, align 1
  %56 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* nonnull %53, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64* nonnull %2, i8* nonnull %3) #5
  %57 = icmp sgt i32 %56, 0
  br i1 %57, label %58, label %66

; <label>:58:                                     ; preds = %55
  %59 = load i8, i8* %3, align 1
  switch i8 %59, label %63 [
    i8 109, label %60
    i8 77, label %60
  ]

; <label>:60:                                     ; preds = %58, %58
  %61 = load i64, i64* %2, align 8
  %62 = mul nsw i64 %61, 1000
  store i64 %62, i64* %2, align 8
  br label %63

; <label>:63:                                     ; preds = %58, %60
  %64 = load i64, i64* %2, align 8
  %65 = mul nsw i64 %64, 1000
  %sunkaddr5 = ptrtoint i8* %6 to i64
  %sunkaddr6 = add i64 %sunkaddr5, 88
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i64*
  store i64 %65, i64* %sunkaddr7, align 8
  br label %66

; <label>:66:                                     ; preds = %55, %17, %63
  ret void
}

declare i64 @jpeg_mem_init(%struct.jpeg_common_struct*) local_unnamed_addr #1

declare i8* @jpeg_get_small(%struct.jpeg_common_struct*, i64) local_unnamed_addr #1

declare void @jpeg_mem_term(%struct.jpeg_common_struct*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @alloc_small(%struct.jpeg_common_struct*, i32, i64) #0 {
  %4 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %5 = bitcast %struct.jpeg_memory_mgr** %4 to %struct.my_memory_mgr**
  %6 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %7 = icmp ugt i64 %2, 999999976
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %3
  tail call fastcc void @out_of_memory(%struct.jpeg_common_struct* nonnull %0, i32 1)
  br label %9

; <label>:9:                                      ; preds = %3, %8
  %10 = and i64 %2, 7
  %11 = icmp eq i64 %10, 0
  %12 = sub nsw i64 8, %10
  %13 = select i1 %11, i64 0, i64 %12
  %.02 = add i64 %13, %2
  %14 = icmp ugt i32 %1, 1
  br i1 %14, label %15, label %24

; <label>:15:                                     ; preds = %9
  %16 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i64 0, i32 5
  store i32 12, i32* %18, align 8
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 6, i32 0, i64 0
  store i32 %1, i32* %20, align 4
  %21 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %22 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %21, align 8
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  tail call void %23(%struct.jpeg_common_struct* nonnull %0) #5
  br label %24

; <label>:24:                                     ; preds = %9, %15
  %25 = sext i32 %1 to i64
  %26 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %6, i64 0, i32 1, i64 %25
  %.0311 = load %union.small_pool_struct*, %union.small_pool_struct** %26, align 8
  %cond12 = icmp eq %union.small_pool_struct* %.0311, null
  br i1 %cond12, label %._crit_edge16, label %..lr.ph15_crit_edge

..lr.ph15_crit_edge:                              ; preds = %24
  %27 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.0311, i64 0, i32 0, i32 2
  %28 = load i64, i64* %27, align 8
  %29 = icmp ult i64 %28, %.02
  br i1 %29, label %.lr.ph35.preheader, label %.loopexit

.lr.ph35.preheader:                               ; preds = %..lr.ph15_crit_edge
  br label %.lr.ph35

.lr.ph15:                                         ; preds = %.lr.ph35
  %30 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.03, i64 0, i32 0, i32 2
  %31 = load i64, i64* %30, align 8
  %32 = icmp ult i64 %31, %.02
  br i1 %32, label %.lr.ph35, label %.loopexit.loopexit

.lr.ph35:                                         ; preds = %.lr.ph35.preheader, %.lr.ph15
  %.031334 = phi %union.small_pool_struct* [ %.03, %.lr.ph15 ], [ %.0311, %.lr.ph35.preheader ]
  %33 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.031334, i64 0, i32 0, i32 0
  %.03 = load %union.small_pool_struct*, %union.small_pool_struct** %33, align 8
  %cond = icmp eq %union.small_pool_struct* %.03, null
  br i1 %cond, label %._crit_edge16.loopexit, label %.lr.ph15

._crit_edge16.loopexit:                           ; preds = %.lr.ph35
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %24
  %.01.lcssa = phi %union.small_pool_struct* [ null, %24 ], [ %.031334, %._crit_edge16.loopexit ]
  %34 = add i64 %.02, 24
  %35 = icmp eq %union.small_pool_struct* %.01.lcssa, null
  %extra_pool_slop.sink = select i1 %35, [2 x i64]* @first_pool_slop, [2 x i64]* @extra_pool_slop
  %36 = getelementptr inbounds [2 x i64], [2 x i64]* %extra_pool_slop.sink, i64 0, i64 %25
  %.0 = load i64, i64* %36, align 8
  %37 = sub i64 999999976, %.02
  %38 = icmp ugt i64 %.0, %37
  %..0 = select i1 %38, i64 %37, i64 %.0
  %39 = add i64 %34, %..0
  %40 = tail call i8* @jpeg_get_small(%struct.jpeg_common_struct* %0, i64 %39) #5
  %41 = icmp eq i8* %40, null
  br i1 %41, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge16
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.backedge
  %.28 = phi i64 [ %42, %.backedge ], [ %..0, %.lr.ph.preheader ]
  %42 = lshr i64 %.28, 1
  %43 = icmp ult i64 %.28, 100
  br i1 %43, label %44, label %.backedge

; <label>:44:                                     ; preds = %.lr.ph
  tail call fastcc void @out_of_memory(%struct.jpeg_common_struct* %0, i32 2)
  br label %.backedge

.backedge:                                        ; preds = %.lr.ph, %44
  %45 = add i64 %34, %42
  %46 = tail call i8* @jpeg_get_small(%struct.jpeg_common_struct* %0, i64 %45) #5
  %47 = icmp eq i8* %46, null
  br i1 %47, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.backedge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge16
  %.2.lcssa = phi i64 [ %..0, %._crit_edge16 ], [ %42, %._crit_edge.loopexit ]
  %.lcssa5 = phi i64 [ %39, %._crit_edge16 ], [ %45, %._crit_edge.loopexit ]
  %.lcssa = phi i8* [ %40, %._crit_edge16 ], [ %46, %._crit_edge.loopexit ]
  %48 = icmp eq %union.small_pool_struct* %.01.lcssa, null
  %49 = bitcast i8* %.lcssa to %union.small_pool_struct*
  %50 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %6, i64 0, i32 5
  %51 = load i64, i64* %50, align 8
  %52 = add i64 %51, %.lcssa5
  store i64 %52, i64* %50, align 8
  %53 = add i64 %.2.lcssa, %.02
  %54 = getelementptr inbounds i8, i8* %.lcssa, i64 16
  %55 = bitcast i8* %54 to i64*
  call void @llvm.memset.p0i8.i64(i8* nonnull %.lcssa, i8 0, i64 16, i32 8, i1 false)
  store i64 %53, i64* %55, align 8
  %56 = bitcast %union.small_pool_struct* %.01.lcssa to i8**
  %57 = bitcast %union.small_pool_struct** %26 to i8**
  %.sink = select i1 %48, i8** %57, i8** %56
  store i8* %.lcssa, i8** %.sink, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph15
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %..lr.ph15_crit_edge, %._crit_edge
  %.14 = phi %union.small_pool_struct* [ %49, %._crit_edge ], [ %.0311, %..lr.ph15_crit_edge ], [ %.03, %.loopexit.loopexit ]
  %58 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.14, i64 1
  %59 = bitcast %union.small_pool_struct* %58 to i8*
  %60 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.14, i64 0, i32 0, i32 1
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds i8, i8* %59, i64 %61
  %63 = add i64 %61, %.02
  store i64 %63, i64* %60, align 8
  %64 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.14, i64 0, i32 0, i32 2
  %65 = load i64, i64* %64, align 8
  %66 = sub i64 %65, %.02
  store i64 %66, i64* %64, align 8
  ret i8* %62
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @alloc_large(%struct.jpeg_common_struct*, i32, i64) #0 {
  %4 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %5 = bitcast %struct.jpeg_memory_mgr** %4 to %struct.my_memory_mgr**
  %6 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %7 = icmp ugt i64 %2, 999999976
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %3
  tail call fastcc void @out_of_memory(%struct.jpeg_common_struct* nonnull %0, i32 3)
  br label %9

; <label>:9:                                      ; preds = %3, %8
  %10 = and i64 %2, 7
  %11 = icmp eq i64 %10, 0
  %12 = sub nsw i64 8, %10
  %13 = select i1 %11, i64 0, i64 %12
  %.0 = add i64 %13, %2
  %14 = icmp ugt i32 %1, 1
  br i1 %14, label %15, label %24

; <label>:15:                                     ; preds = %9
  %16 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i64 0, i32 5
  store i32 12, i32* %18, align 8
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 6, i32 0, i64 0
  store i32 %1, i32* %20, align 4
  %21 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %22 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %21, align 8
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  tail call void %23(%struct.jpeg_common_struct* nonnull %0) #5
  br label %24

; <label>:24:                                     ; preds = %9, %15
  %25 = add i64 %.0, 24
  %26 = tail call i8* @jpeg_get_large(%struct.jpeg_common_struct* nonnull %0, i64 %25) #5
  %27 = icmp eq i8* %26, null
  br i1 %27, label %28, label %29

; <label>:28:                                     ; preds = %24
  tail call fastcc void @out_of_memory(%struct.jpeg_common_struct* nonnull %0, i32 4)
  br label %29

; <label>:29:                                     ; preds = %24, %28
  %30 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %6, i64 0, i32 5
  %31 = load i64, i64* %30, align 8
  %32 = add i64 %31, %25
  store i64 %32, i64* %30, align 8
  %33 = sext i32 %1 to i64
  %34 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %6, i64 0, i32 2, i64 %33
  %35 = bitcast %union.large_pool_struct** %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = bitcast i8* %26 to i64*
  store i64 %36, i64* %37, align 8
  %38 = getelementptr inbounds i8, i8* %26, i64 8
  %39 = bitcast i8* %38 to i64*
  store i64 %.0, i64* %39, align 8
  %40 = getelementptr inbounds i8, i8* %26, i64 16
  %41 = bitcast i8* %40 to i64*
  store i64 0, i64* %41, align 8
  %42 = bitcast %union.large_pool_struct** %34 to i8**
  store i8* %26, i8** %42, align 8
  %43 = getelementptr inbounds i8, i8* %26, i64 24
  ret i8* %43
}

; Function Attrs: noinline nounwind uwtable
define internal i8** @alloc_sarray(%struct.jpeg_common_struct*, i32, i32, i32) #0 {
  %5 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %6 = bitcast %struct.jpeg_memory_mgr** %5 to %struct.my_memory_mgr**
  %7 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %6, align 8
  %8 = zext i32 %2 to i64
  %9 = udiv i64 999999976, %8
  %10 = icmp ugt i32 %2, 999999976
  br i1 %10, label %11, label %18

; <label>:11:                                     ; preds = %4
  %12 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 5
  store i32 69, i32* %14, align 8
  %15 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %16 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  tail call void %17(%struct.jpeg_common_struct* nonnull %0) #5
  br label %18

; <label>:18:                                     ; preds = %4, %11
  %19 = zext i32 %3 to i64
  %20 = icmp ult i64 %9, %19
  %21 = trunc i64 %9 to i32
  %.02 = select i1 %20, i32 %21, i32 %3
  %22 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %7, i64 0, i32 6
  store i32 %.02, i32* %22, align 8
  %23 = shl nuw nsw i64 %19, 3
  %24 = tail call i8* @alloc_small(%struct.jpeg_common_struct* nonnull %0, i32 %1, i64 %23)
  %25 = icmp eq i32 %3, 0
  br i1 %25, label %._crit_edge, label %.lr.ph10.preheader

.lr.ph10.preheader:                               ; preds = %18
  %26 = xor i32 %3, -1
  %27 = xor i32 %3, -1
  %28 = bitcast i8* %24 to i8**
  %29 = bitcast i8* %24 to i8**
  br label %.lr.ph10

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph.prol.loopexit, %.lr.ph10
  %.1.lcssa = phi i32 [ %.019, %.lr.ph10 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %87, %.loopexit.loopexit ]
  %30 = icmp ult i32 %.1.lcssa, %3
  br i1 %30, label %.lr.ph10, label %._crit_edge.loopexit

.lr.ph10:                                         ; preds = %.loopexit, %.lr.ph10.preheader
  %.019 = phi i32 [ %.1.lcssa, %.loopexit ], [ 0, %.lr.ph10.preheader ]
  %.138 = phi i32 [ %33, %.loopexit ], [ %.02, %.lr.ph10.preheader ]
  %31 = sub i32 %3, %.019
  %32 = icmp ult i32 %.138, %31
  %33 = select i1 %32, i32 %.138, i32 %31
  %34 = zext i32 %33 to i64
  %35 = mul nuw i64 %34, %8
  %36 = tail call i8* @alloc_large(%struct.jpeg_common_struct* %0, i32 %1, i64 %35)
  %37 = icmp eq i32 %33, 0
  br i1 %37, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph10
  %38 = add i32 %.019, %26
  %39 = xor i32 %.138, -1
  %40 = icmp ugt i32 %38, %39
  %umax = select i1 %40, i32 %38, i32 %39
  %41 = sub i32 -2, %umax
  %xtraiter = and i32 %33, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.preheader..lr.ph.prol_crit_edge

.lr.ph.preheader..lr.ph.prol_crit_edge:           ; preds = %.lr.ph.preheader
  %42 = add nsw i32 %xtraiter, -1
  %43 = zext i32 %42 to i64
  %44 = add nuw nsw i64 %43, 1
  %45 = mul i64 %8, %44
  %46 = add i32 %.019, %27
  %47 = xor i32 %.138, -1
  %48 = icmp ugt i32 %46, %47
  %umax19 = select i1 %48, i32 %46, i32 %47
  %49 = xor i32 %umax19, -1
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.preheader..lr.ph.prol_crit_edge
  %.16.prol = phi i32 [ %53, %.lr.ph.prol ], [ %.019, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %.045.prol = phi i8* [ %52, %.lr.ph.prol ], [ %36, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %50 = zext i32 %.16.prol to i64
  %51 = getelementptr inbounds i8*, i8** %29, i64 %50
  store i8* %.045.prol, i8** %51, align 8
  %52 = getelementptr inbounds i8, i8* %.045.prol, i64 %8
  %53 = add i32 %.16.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol..lr.ph.prol.loopexit_crit_edge:       ; preds = %.lr.ph.prol
  %scevgep = getelementptr i8, i8* %36, i64 %45
  %54 = sub i32 %49, %xtraiter
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge
  %.lcssa.unr = phi i32 [ %53, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ undef, %.lr.ph.preheader ]
  %.07.unr = phi i32 [ %54, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ %33, %.lr.ph.preheader ]
  %.16.unr = phi i32 [ %53, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ %.019, %.lr.ph.preheader ]
  %.045.unr = phi i8* [ %scevgep, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ %36, %.lr.ph.preheader ]
  %55 = icmp ult i32 %41, 7
  br i1 %55, label %.loopexit, label %.lr.ph.preheader21

.lr.ph.preheader21:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader21, %.lr.ph
  %.07 = phi i32 [ %88, %.lr.ph ], [ %.07.unr, %.lr.ph.preheader21 ]
  %.16 = phi i32 [ %87, %.lr.ph ], [ %.16.unr, %.lr.ph.preheader21 ]
  %.045 = phi i8* [ %86, %.lr.ph ], [ %.045.unr, %.lr.ph.preheader21 ]
  %56 = zext i32 %.16 to i64
  %57 = getelementptr inbounds i8*, i8** %28, i64 %56
  store i8* %.045, i8** %57, align 8
  %58 = getelementptr inbounds i8, i8* %.045, i64 %8
  %59 = add i32 %.16, 1
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i8*, i8** %28, i64 %60
  store i8* %58, i8** %61, align 8
  %62 = getelementptr inbounds i8, i8* %58, i64 %8
  %63 = add i32 %.16, 2
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i8*, i8** %28, i64 %64
  store i8* %62, i8** %65, align 8
  %66 = getelementptr inbounds i8, i8* %62, i64 %8
  %67 = add i32 %.16, 3
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i8*, i8** %28, i64 %68
  store i8* %66, i8** %69, align 8
  %70 = getelementptr inbounds i8, i8* %66, i64 %8
  %71 = add i32 %.16, 4
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i8*, i8** %28, i64 %72
  store i8* %70, i8** %73, align 8
  %74 = getelementptr inbounds i8, i8* %70, i64 %8
  %75 = add i32 %.16, 5
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i8*, i8** %28, i64 %76
  store i8* %74, i8** %77, align 8
  %78 = getelementptr inbounds i8, i8* %74, i64 %8
  %79 = add i32 %.16, 6
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i8*, i8** %28, i64 %80
  store i8* %78, i8** %81, align 8
  %82 = getelementptr inbounds i8, i8* %78, i64 %8
  %83 = add i32 %.16, 7
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i8*, i8** %28, i64 %84
  store i8* %82, i8** %85, align 8
  %86 = getelementptr inbounds i8, i8* %82, i64 %8
  %87 = add i32 %.16, 8
  %88 = add i32 %.07, -8
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %.loopexit.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %18
  %90 = bitcast i8* %24 to i8**
  ret i8** %90
}

; Function Attrs: noinline nounwind uwtable
define internal [64 x i16]** @alloc_barray(%struct.jpeg_common_struct*, i32, i32, i32) #0 {
  %5 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %6 = bitcast %struct.jpeg_memory_mgr** %5 to %struct.my_memory_mgr**
  %7 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %6, align 8
  %8 = zext i32 %2 to i64
  %9 = shl nuw nsw i64 %8, 7
  %10 = udiv i64 999999976, %9
  %11 = icmp ugt i32 %2, 7812499
  br i1 %11, label %12, label %19

; <label>:12:                                     ; preds = %4
  %13 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i64 0, i32 5
  store i32 69, i32* %15, align 8
  %16 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %17 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %16, align 8
  %18 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %17, align 8
  tail call void %18(%struct.jpeg_common_struct* nonnull %0) #5
  br label %19

; <label>:19:                                     ; preds = %4, %12
  %20 = zext i32 %3 to i64
  %21 = icmp ult i64 %10, %20
  %22 = trunc i64 %10 to i32
  %.02 = select i1 %21, i32 %22, i32 %3
  %23 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %7, i64 0, i32 6
  store i32 %.02, i32* %23, align 8
  %24 = shl nuw nsw i64 %20, 3
  %25 = tail call i8* @alloc_small(%struct.jpeg_common_struct* nonnull %0, i32 %1, i64 %24)
  %26 = icmp eq i32 %3, 0
  br i1 %26, label %._crit_edge, label %.lr.ph10

.lr.ph10:                                         ; preds = %19
  %27 = shl nuw nsw i64 %8, 7
  %28 = xor i32 %3, -1
  %29 = xor i32 %3, -1
  %30 = bitcast i8* %25 to [64 x i16]**
  %31 = bitcast i8* %25 to [64 x i16]**
  br label %33

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph.prol.loopexit, %33
  %.1.lcssa = phi i32 [ %.019, %33 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %76, %.loopexit.loopexit ]
  %32 = icmp ult i32 %.1.lcssa, %3
  br i1 %32, label %33, label %._crit_edge.loopexit

; <label>:33:                                     ; preds = %.loopexit, %.lr.ph10
  %.019 = phi i32 [ 0, %.lr.ph10 ], [ %.1.lcssa, %.loopexit ]
  %.138 = phi i32 [ %.02, %.lr.ph10 ], [ %36, %.loopexit ]
  %34 = sub i32 %3, %.019
  %35 = icmp ult i32 %.138, %34
  %36 = select i1 %35, i32 %.138, i32 %34
  %37 = zext i32 %36 to i64
  %38 = mul i64 %27, %37
  %39 = tail call i8* @alloc_large(%struct.jpeg_common_struct* %0, i32 %1, i64 %38)
  %40 = icmp eq i32 %36, 0
  br i1 %40, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %33
  %41 = add i32 %.019, %28
  %42 = xor i32 %.138, -1
  %43 = icmp ugt i32 %41, %42
  %umax = select i1 %43, i32 %41, i32 %42
  %44 = sub i32 -2, %umax
  %xtraiter = and i32 %36, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  %45 = bitcast i8* %39 to [64 x i16]*
  %46 = add nsw i32 %xtraiter, -1
  %47 = zext i32 %46 to i64
  %48 = shl nuw nsw i64 %47, 7
  %49 = add nuw nsw i64 %48, 128
  %50 = mul i64 %8, %49
  %scevgep = getelementptr i8, i8* %39, i64 %50
  %51 = add i32 %.019, %29
  %52 = xor i32 %.138, -1
  %53 = icmp ugt i32 %51, %52
  %umax20 = select i1 %53, i32 %51, i32 %52
  %54 = xor i32 %umax20, -1
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %.16.prol = phi i32 [ %58, %.lr.ph.prol ], [ %.019, %.lr.ph.prol.preheader ]
  %.045.prol = phi [64 x i16]* [ %57, %.lr.ph.prol ], [ %45, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %55 = zext i32 %.16.prol to i64
  %56 = getelementptr inbounds [64 x i16]*, [64 x i16]** %31, i64 %55
  store [64 x i16]* %.045.prol, [64 x i16]** %56, align 8
  %57 = getelementptr inbounds [64 x i16], [64 x i16]* %.045.prol, i64 %8
  %58 = add i32 %.16.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol..lr.ph.prol.loopexit_crit_edge:       ; preds = %.lr.ph.prol
  %59 = sub i32 %54, %xtraiter
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge
  %.lcssa.unr = phi i32 [ %58, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ undef, %.lr.ph.preheader ]
  %.07.unr = phi i32 [ %59, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ %36, %.lr.ph.preheader ]
  %.16.unr = phi i32 [ %58, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ %.019, %.lr.ph.preheader ]
  %.045.unr.in = phi i8* [ %scevgep, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ %39, %.lr.ph.preheader ]
  %60 = icmp ult i32 %44, 3
  br i1 %60, label %.loopexit, label %.lr.ph.prol.loopexit..lr.ph_crit_edge

.lr.ph.prol.loopexit..lr.ph_crit_edge:            ; preds = %.lr.ph.prol.loopexit
  %.045.unr = bitcast i8* %.045.unr.in to [64 x i16]*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.prol.loopexit..lr.ph_crit_edge
  %.07 = phi i32 [ %77, %.lr.ph ], [ %.07.unr, %.lr.ph.prol.loopexit..lr.ph_crit_edge ]
  %.16 = phi i32 [ %76, %.lr.ph ], [ %.16.unr, %.lr.ph.prol.loopexit..lr.ph_crit_edge ]
  %.045 = phi [64 x i16]* [ %75, %.lr.ph ], [ %.045.unr, %.lr.ph.prol.loopexit..lr.ph_crit_edge ]
  %61 = zext i32 %.16 to i64
  %62 = getelementptr inbounds [64 x i16]*, [64 x i16]** %30, i64 %61
  store [64 x i16]* %.045, [64 x i16]** %62, align 8
  %63 = getelementptr inbounds [64 x i16], [64 x i16]* %.045, i64 %8
  %64 = add i32 %.16, 1
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds [64 x i16]*, [64 x i16]** %30, i64 %65
  store [64 x i16]* %63, [64 x i16]** %66, align 8
  %67 = getelementptr inbounds [64 x i16], [64 x i16]* %63, i64 %8
  %68 = add i32 %.16, 2
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds [64 x i16]*, [64 x i16]** %30, i64 %69
  store [64 x i16]* %67, [64 x i16]** %70, align 8
  %71 = getelementptr inbounds [64 x i16], [64 x i16]* %67, i64 %8
  %72 = add i32 %.16, 3
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds [64 x i16]*, [64 x i16]** %30, i64 %73
  store [64 x i16]* %71, [64 x i16]** %74, align 8
  %75 = getelementptr inbounds [64 x i16], [64 x i16]* %71, i64 %8
  %76 = add i32 %.16, 4
  %77 = add i32 %.07, -4
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %.loopexit.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %19
  %79 = bitcast i8* %25 to [64 x i16]**
  ret [64 x i16]** %79
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.jvirt_sarray_control* @request_virt_sarray(%struct.jpeg_common_struct*, i32, i32, i32, i32, i32) #0 {
  %7 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %8 = bitcast %struct.jpeg_memory_mgr** %7 to %struct.my_memory_mgr**
  %9 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %8, align 8
  %10 = icmp eq i32 %1, 1
  br i1 %10, label %20, label %11

; <label>:11:                                     ; preds = %6
  %12 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 5
  store i32 12, i32* %14, align 8
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i64 0, i32 6, i32 0, i64 0
  store i32 %1, i32* %16, align 4
  %17 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %18 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %17, align 8
  %19 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %18, align 8
  tail call void %19(%struct.jpeg_common_struct* nonnull %0) #5
  br label %20

; <label>:20:                                     ; preds = %6, %11
  %21 = tail call i8* @alloc_small(%struct.jpeg_common_struct* nonnull %0, i32 %1, i64 152)
  %22 = bitcast i8* %21 to %struct.jvirt_sarray_control*
  %23 = bitcast i8* %21 to i8***
  store i8** null, i8*** %23, align 8
  %24 = getelementptr inbounds i8, i8* %21, i64 8
  %25 = bitcast i8* %24 to i32*
  store i32 %4, i32* %25, align 8
  %26 = getelementptr inbounds i8, i8* %21, i64 12
  %27 = bitcast i8* %26 to i32*
  store i32 %3, i32* %27, align 4
  %28 = getelementptr inbounds i8, i8* %21, i64 16
  %29 = bitcast i8* %28 to i32*
  store i32 %5, i32* %29, align 8
  %30 = getelementptr inbounds i8, i8* %21, i64 36
  %31 = bitcast i8* %30 to i32*
  store i32 %2, i32* %31, align 4
  %32 = getelementptr inbounds i8, i8* %21, i64 44
  %33 = bitcast i8* %32 to i32*
  store i32 0, i32* %33, align 4
  %34 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %9, i64 0, i32 3
  %35 = bitcast %struct.jvirt_sarray_control** %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds i8, i8* %21, i64 48
  %38 = bitcast i8* %37 to i64*
  store i64 %36, i64* %38, align 8
  %39 = bitcast %struct.jvirt_sarray_control** %34 to i8**
  store i8* %21, i8** %39, align 8
  ret %struct.jvirt_sarray_control* %22
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.jvirt_barray_control* @request_virt_barray(%struct.jpeg_common_struct*, i32, i32, i32, i32, i32) #0 {
  %7 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %8 = bitcast %struct.jpeg_memory_mgr** %7 to %struct.my_memory_mgr**
  %9 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %8, align 8
  %10 = icmp eq i32 %1, 1
  br i1 %10, label %20, label %11

; <label>:11:                                     ; preds = %6
  %12 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 5
  store i32 12, i32* %14, align 8
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i64 0, i32 6, i32 0, i64 0
  store i32 %1, i32* %16, align 4
  %17 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %18 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %17, align 8
  %19 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %18, align 8
  tail call void %19(%struct.jpeg_common_struct* nonnull %0) #5
  br label %20

; <label>:20:                                     ; preds = %6, %11
  %21 = tail call i8* @alloc_small(%struct.jpeg_common_struct* nonnull %0, i32 %1, i64 152)
  %22 = bitcast i8* %21 to %struct.jvirt_barray_control*
  %23 = bitcast i8* %21 to [64 x i16]***
  store [64 x i16]** null, [64 x i16]*** %23, align 8
  %24 = getelementptr inbounds i8, i8* %21, i64 8
  %25 = bitcast i8* %24 to i32*
  store i32 %4, i32* %25, align 8
  %26 = getelementptr inbounds i8, i8* %21, i64 12
  %27 = bitcast i8* %26 to i32*
  store i32 %3, i32* %27, align 4
  %28 = getelementptr inbounds i8, i8* %21, i64 16
  %29 = bitcast i8* %28 to i32*
  store i32 %5, i32* %29, align 8
  %30 = getelementptr inbounds i8, i8* %21, i64 36
  %31 = bitcast i8* %30 to i32*
  store i32 %2, i32* %31, align 4
  %32 = getelementptr inbounds i8, i8* %21, i64 44
  %33 = bitcast i8* %32 to i32*
  store i32 0, i32* %33, align 4
  %34 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %9, i64 0, i32 4
  %35 = bitcast %struct.jvirt_barray_control** %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds i8, i8* %21, i64 48
  %38 = bitcast i8* %37 to i64*
  store i64 %36, i64* %38, align 8
  %39 = bitcast %struct.jvirt_barray_control** %34 to i8**
  store i8* %21, i8** %39, align 8
  ret %struct.jvirt_barray_control* %22
}

; Function Attrs: noinline nounwind uwtable
define internal void @realize_virt_arrays(%struct.jpeg_common_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to %struct.my_memory_mgr**
  %4 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %4, i64 0, i32 3
  %.0124 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %6 = icmp eq %struct.jvirt_sarray_control* %.0124, null
  br i1 %6, label %._crit_edge30, label %.lr.ph29.preheader

.lr.ph29.preheader:                               ; preds = %1
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29.preheader, %24
  %.0127 = phi %struct.jvirt_sarray_control* [ %.01, %24 ], [ %.0124, %.lr.ph29.preheader ]
  %.0326 = phi i64 [ %.14, %24 ], [ 0, %.lr.ph29.preheader ]
  %.0525 = phi i64 [ %.16, %24 ], [ 0, %.lr.ph29.preheader ]
  %7 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.0127, i64 0, i32 0
  %8 = load i8**, i8*** %7, align 8
  %9 = icmp eq i8** %8, null
  br i1 %9, label %10, label %24

; <label>:10:                                     ; preds = %.lr.ph29
  %11 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.0127, i64 0, i32 3
  %12 = load i32, i32* %11, align 8
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.0127, i64 0, i32 2
  %15 = load i32, i32* %14, align 4
  %16 = zext i32 %15 to i64
  %17 = mul nuw i64 %16, %13
  %18 = add i64 %17, %.0326
  %19 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.0127, i64 0, i32 1
  %20 = load i32, i32* %19, align 8
  %21 = zext i32 %20 to i64
  %22 = mul nuw i64 %21, %16
  %23 = add i64 %22, %.0525
  br label %24

; <label>:24:                                     ; preds = %.lr.ph29, %10
  %.16 = phi i64 [ %23, %10 ], [ %.0525, %.lr.ph29 ]
  %.14 = phi i64 [ %18, %10 ], [ %.0326, %.lr.ph29 ]
  %25 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.0127, i64 0, i32 11
  %.01 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %25, align 8
  %26 = icmp eq %struct.jvirt_sarray_control* %.01, null
  br i1 %26, label %._crit_edge30.loopexit, label %.lr.ph29

._crit_edge30.loopexit:                           ; preds = %24
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %1
  %.05.lcssa = phi i64 [ 0, %1 ], [ %.16, %._crit_edge30.loopexit ]
  %.03.lcssa = phi i64 [ 0, %1 ], [ %.14, %._crit_edge30.loopexit ]
  %27 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %4, i64 0, i32 4
  %.018 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %27, align 8
  %28 = icmp eq %struct.jvirt_barray_control* %.018, null
  br i1 %28, label %._crit_edge, label %.lr.ph22.preheader

.lr.ph22.preheader:                               ; preds = %._crit_edge30
  br label %.lr.ph22

.lr.ph22:                                         ; preds = %.lr.ph22.preheader, %48
  %.021 = phi %struct.jvirt_barray_control* [ %.0, %48 ], [ %.018, %.lr.ph22.preheader ]
  %.220 = phi i64 [ %.3, %48 ], [ %.03.lcssa, %.lr.ph22.preheader ]
  %.2719 = phi i64 [ %.38, %48 ], [ %.05.lcssa, %.lr.ph22.preheader ]
  %29 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.021, i64 0, i32 0
  %30 = load [64 x i16]**, [64 x i16]*** %29, align 8
  %31 = icmp eq [64 x i16]** %30, null
  br i1 %31, label %32, label %48

; <label>:32:                                     ; preds = %.lr.ph22
  %33 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.021, i64 0, i32 3
  %34 = load i32, i32* %33, align 8
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.021, i64 0, i32 2
  %37 = load i32, i32* %36, align 4
  %38 = zext i32 %37 to i64
  %39 = shl nuw nsw i64 %35, 7
  %40 = mul i64 %39, %38
  %41 = add i64 %40, %.220
  %42 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.021, i64 0, i32 1
  %43 = load i32, i32* %42, align 8
  %44 = zext i32 %43 to i64
  %45 = shl nuw nsw i64 %38, 7
  %46 = mul i64 %45, %44
  %47 = add i64 %46, %.2719
  br label %48

; <label>:48:                                     ; preds = %.lr.ph22, %32
  %.38 = phi i64 [ %47, %32 ], [ %.2719, %.lr.ph22 ]
  %.3 = phi i64 [ %41, %32 ], [ %.220, %.lr.ph22 ]
  %49 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.021, i64 0, i32 11
  %.0 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %49, align 8
  %50 = icmp eq %struct.jvirt_barray_control* %.0, null
  br i1 %50, label %._crit_edge.loopexit, label %.lr.ph22

._crit_edge.loopexit:                             ; preds = %48
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge30
  %.27.lcssa = phi i64 [ %.05.lcssa, %._crit_edge30 ], [ %.38, %._crit_edge.loopexit ]
  %.2.lcssa = phi i64 [ %.03.lcssa, %._crit_edge30 ], [ %.3, %._crit_edge.loopexit ]
  %51 = icmp slt i64 %.2.lcssa, 1
  br i1 %51, label %.loopexit, label %52

; <label>:52:                                     ; preds = %._crit_edge
  %53 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %4, i64 0, i32 5
  %54 = load i64, i64* %53, align 8
  %55 = tail call i64 @jpeg_mem_available(%struct.jpeg_common_struct* %0, i64 %.2.lcssa, i64 %.27.lcssa, i64 %54) #5
  %56 = icmp slt i64 %55, %.27.lcssa
  br i1 %56, label %57, label %60

; <label>:57:                                     ; preds = %52
  %58 = sdiv i64 %55, %.2.lcssa
  %59 = icmp sgt i64 %58, 1
  %. = select i1 %59, i64 %58, i64 1
  br label %60

; <label>:60:                                     ; preds = %52, %57
  %.110 = phi i64 [ %., %57 ], [ 1000000000, %52 ]
  %sunkaddr = ptrtoint %struct.my_memory_mgr* %4 to i64
  %sunkaddr33 = add i64 %sunkaddr, 128
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to %struct.jvirt_sarray_control**
  %.1214 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %sunkaddr34, align 8
  %61 = icmp eq %struct.jvirt_sarray_control* %.1214, null
  br i1 %61, label %.preheader, label %.lr.ph17.preheader

.lr.ph17.preheader:                               ; preds = %60
  %sunkaddr58 = ptrtoint %struct.my_memory_mgr* %4 to i64
  %sunkaddr59 = add i64 %sunkaddr58, 152
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to i32*
  br label %.lr.ph17

.preheader.loopexit:                              ; preds = %102
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %60
  %sunkaddr35 = ptrtoint %struct.my_memory_mgr* %4 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 136
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to %struct.jvirt_barray_control**
  %.111 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %sunkaddr37, align 8
  %62 = icmp eq %struct.jvirt_barray_control* %.111, null
  br i1 %62, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %sunkaddr61 = ptrtoint %struct.my_memory_mgr* %4 to i64
  %sunkaddr62 = add i64 %sunkaddr61, 152
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to i32*
  br label %.lr.ph

.lr.ph17:                                         ; preds = %.lr.ph17.preheader, %102
  %.1215 = phi %struct.jvirt_sarray_control* [ %.12, %102 ], [ %.1214, %.lr.ph17.preheader ]
  %63 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 0
  %64 = load i8**, i8*** %63, align 8
  %65 = icmp eq i8** %64, null
  br i1 %65, label %66, label %102

; <label>:66:                                     ; preds = %.lr.ph17
  %67 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 1
  %68 = load i32, i32* %67, align 8
  %69 = zext i32 %68 to i64
  %70 = add nsw i64 %69, -1
  %71 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 3
  %72 = load i32, i32* %71, align 8
  %73 = zext i32 %72 to i64
  %74 = sdiv i64 %70, %73
  %75 = icmp slt i64 %74, %.110
  br i1 %75, label %76, label %78

; <label>:76:                                     ; preds = %66
  %77 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 4
  store i32 %68, i32* %77, align 4
  br label %90

; <label>:78:                                     ; preds = %66
  %79 = mul nsw i64 %73, %.110
  %80 = trunc i64 %79 to i32
  %81 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 4
  store i32 %80, i32* %81, align 4
  %82 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 12
  %sunkaddr38 = ptrtoint %struct.jvirt_sarray_control* %.1215 to i64
  %sunkaddr39 = add i64 %sunkaddr38, 8
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to i32*
  %83 = load i32, i32* %sunkaddr40, align 8
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 2
  %86 = load i32, i32* %85, align 4
  %87 = zext i32 %86 to i64
  %88 = mul nuw i64 %87, %84
  tail call void @jpeg_open_backing_store(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* %82, i64 %88) #5
  %89 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 10
  store i32 1, i32* %89, align 4
  br label %90

; <label>:90:                                     ; preds = %78, %76
  %91 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 0
  %92 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 2
  %93 = load i32, i32* %92, align 4
  %94 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 4
  %95 = load i32, i32* %94, align 4
  %96 = tail call i8** @alloc_sarray(%struct.jpeg_common_struct* %0, i32 1, i32 %93, i32 %95)
  store i8** %96, i8*** %91, align 8
  %97 = load i32, i32* %sunkaddr60, align 8
  %98 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 5
  store i32 %97, i32* %98, align 8
  %99 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 6
  store i32 0, i32* %99, align 4
  %100 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 7
  store i32 0, i32* %100, align 8
  %101 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 9
  store i32 0, i32* %101, align 8
  br label %102

; <label>:102:                                    ; preds = %.lr.ph17, %90
  %103 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.1215, i64 0, i32 11
  %.12 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %103, align 8
  %104 = icmp eq %struct.jvirt_sarray_control* %.12, null
  br i1 %104, label %.preheader.loopexit, label %.lr.ph17

.lr.ph:                                           ; preds = %.lr.ph.preheader, %145
  %.112 = phi %struct.jvirt_barray_control* [ %.1, %145 ], [ %.111, %.lr.ph.preheader ]
  %105 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 0
  %106 = load [64 x i16]**, [64 x i16]*** %105, align 8
  %107 = icmp eq [64 x i16]** %106, null
  br i1 %107, label %108, label %145

; <label>:108:                                    ; preds = %.lr.ph
  %109 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 1
  %110 = load i32, i32* %109, align 8
  %111 = zext i32 %110 to i64
  %112 = add nsw i64 %111, -1
  %113 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 3
  %114 = load i32, i32* %113, align 8
  %115 = zext i32 %114 to i64
  %116 = sdiv i64 %112, %115
  %117 = icmp slt i64 %116, %.110
  br i1 %117, label %118, label %120

; <label>:118:                                    ; preds = %108
  %119 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 4
  store i32 %110, i32* %119, align 4
  br label %133

; <label>:120:                                    ; preds = %108
  %121 = mul nsw i64 %115, %.110
  %122 = trunc i64 %121 to i32
  %123 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 4
  store i32 %122, i32* %123, align 4
  %124 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 12
  %sunkaddr44 = ptrtoint %struct.jvirt_barray_control* %.112 to i64
  %sunkaddr45 = add i64 %sunkaddr44, 8
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to i32*
  %125 = load i32, i32* %sunkaddr46, align 8
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 2
  %128 = load i32, i32* %127, align 4
  %129 = zext i32 %128 to i64
  %130 = shl nuw nsw i64 %126, 7
  %131 = mul i64 %130, %129
  tail call void @jpeg_open_backing_store(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* %124, i64 %131) #5
  %132 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 10
  store i32 1, i32* %132, align 4
  br label %133

; <label>:133:                                    ; preds = %120, %118
  %134 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 0
  %135 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 2
  %136 = load i32, i32* %135, align 4
  %137 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 4
  %138 = load i32, i32* %137, align 4
  %139 = tail call [64 x i16]** @alloc_barray(%struct.jpeg_common_struct* %0, i32 1, i32 %136, i32 %138)
  store [64 x i16]** %139, [64 x i16]*** %134, align 8
  %140 = load i32, i32* %sunkaddr63, align 8
  %141 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 5
  store i32 %140, i32* %141, align 8
  %142 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 6
  store i32 0, i32* %142, align 4
  %143 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 7
  store i32 0, i32* %143, align 8
  %144 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 9
  store i32 0, i32* %144, align 8
  br label %145

; <label>:145:                                    ; preds = %.lr.ph, %133
  %146 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.112, i64 0, i32 11
  %.1 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %146, align 8
  %147 = icmp eq %struct.jvirt_barray_control* %.1, null
  br i1 %147, label %.loopexit.loopexit, label %.lr.ph

.loopexit.loopexit:                               ; preds = %145
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %._crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i8** @access_virt_sarray(%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32) #0 {
  %6 = add i32 %3, %2
  %7 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 1
  %8 = load i32, i32* %7, align 8
  %9 = icmp ugt i32 %6, %8
  br i1 %9, label %18, label %10

; <label>:10:                                     ; preds = %5
  %11 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 3
  %12 = load i32, i32* %11, align 8
  %13 = icmp ult i32 %12, %3
  br i1 %13, label %18, label %14

; <label>:14:                                     ; preds = %10
  %15 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 0
  %16 = load i8**, i8*** %15, align 8
  %17 = icmp eq i8** %16, null
  br i1 %17, label %18, label %25

; <label>:18:                                     ; preds = %14, %10, %5
  %19 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 20, i32* %21, align 8
  %22 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* %0) #5
  br label %25

; <label>:25:                                     ; preds = %14, %18
  %26 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 6
  %27 = load i32, i32* %26, align 4
  %28 = icmp ugt i32 %27, %2
  br i1 %28, label %34, label %29

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 4
  %31 = load i32, i32* %30, align 4
  %32 = add i32 %31, %27
  %33 = icmp ugt i32 %6, %32
  br i1 %33, label %34, label %62

; <label>:34:                                     ; preds = %29, %25
  %35 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 10
  %36 = load i32, i32* %35, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %45

; <label>:38:                                     ; preds = %34
  %39 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i64 0, i32 5
  store i32 68, i32* %41, align 8
  %42 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %43 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %42, align 8
  %44 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %43, align 8
  tail call void %44(%struct.jpeg_common_struct* %0) #5
  br label %45

; <label>:45:                                     ; preds = %34, %38
  %46 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 9
  %47 = load i32, i32* %46, align 8
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %50, label %49

; <label>:49:                                     ; preds = %45
  tail call fastcc void @do_sarray_io(%struct.jpeg_common_struct* %0, %struct.jvirt_sarray_control* nonnull %1, i32 1)
  %sunkaddr = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr7 = add i64 %sunkaddr, 40
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  store i32 0, i32* %sunkaddr8, align 8
  br label %50

; <label>:50:                                     ; preds = %45, %49
  %sunkaddr9 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 28
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  %51 = load i32, i32* %sunkaddr11, align 4
  %52 = icmp ult i32 %51, %2
  br i1 %52, label %61, label %53

; <label>:53:                                     ; preds = %50
  %54 = zext i32 %6 to i64
  %55 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 4
  %56 = load i32, i32* %55, align 4
  %57 = zext i32 %56 to i64
  %58 = sub nsw i64 %54, %57
  %59 = icmp sgt i64 %58, 0
  %. = select i1 %59, i64 %58, i64 0
  %60 = trunc i64 %. to i32
  br label %61

; <label>:61:                                     ; preds = %50, %53
  %.sink = phi i32 [ %60, %53 ], [ %2, %50 ]
  %sunkaddr12 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 28
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  store i32 %.sink, i32* %sunkaddr14, align 4
  tail call fastcc void @do_sarray_io(%struct.jpeg_common_struct* %0, %struct.jvirt_sarray_control* nonnull %1, i32 0)
  br label %62

; <label>:62:                                     ; preds = %29, %61
  %63 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 7
  %64 = load i32, i32* %63, align 8
  %65 = icmp ult i32 %64, %6
  br i1 %65, label %66, label %.loopexit

; <label>:66:                                     ; preds = %62
  %67 = icmp ult i32 %64, %2
  %68 = icmp eq i32 %4, 0
  br i1 %67, label %69, label %76

; <label>:69:                                     ; preds = %66
  br i1 %68, label %.thread, label %.thread4

.thread4:                                         ; preds = %69
  %70 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i64 0, i32 5
  store i32 20, i32* %72, align 8
  %73 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %74 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %73, align 8
  %75 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %74, align 8
  tail call void %75(%struct.jpeg_common_struct* %0) #5
  br label %77

; <label>:76:                                     ; preds = %66
  br i1 %68, label %.thread, label %77

; <label>:77:                                     ; preds = %76, %.thread4
  %.015 = phi i32 [ %2, %.thread4 ], [ %64, %76 ]
  %sunkaddr15 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 32
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  store i32 %6, i32* %sunkaddr17, align 8
  br label %.thread

.thread:                                          ; preds = %76, %69, %77
  %78 = phi i1 [ false, %77 ], [ true, %69 ], [ true, %76 ]
  %.013 = phi i32 [ %.015, %77 ], [ %2, %69 ], [ %64, %76 ]
  %79 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 8
  %80 = load i32, i32* %79, align 4
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %96, label %82

; <label>:82:                                     ; preds = %.thread
  %83 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 2
  %84 = load i32, i32* %83, align 4
  %85 = zext i32 %84 to i64
  %sunkaddr18 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 28
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  %86 = load i32, i32* %sunkaddr20, align 4
  %87 = sub i32 %.013, %86
  %88 = sub i32 %6, %86
  %89 = icmp ult i32 %87, %88
  br i1 %89, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %82
  %90 = zext i32 %87 to i64
  %wide.trip.count = zext i32 %88 to i64
  %91 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 0
  br label %92

; <label>:92:                                     ; preds = %92, %.lr.ph
  %indvars.iv = phi i64 [ %90, %.lr.ph ], [ %indvars.iv.next, %92 ]
  %93 = load i8**, i8*** %91, align 8
  %94 = getelementptr inbounds i8*, i8** %93, i64 %indvars.iv
  %95 = load i8*, i8** %94, align 8
  tail call void @jzero_far(i8* %95, i64 %85) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.loopexit.loopexit, label %92

; <label>:96:                                     ; preds = %.thread
  br i1 %78, label %97, label %105

; <label>:97:                                     ; preds = %96
  %98 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %99 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %98, align 8
  %100 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %99, i64 0, i32 5
  store i32 20, i32* %100, align 8
  %101 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %102 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %101, align 8
  %103 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %102, align 8
  tail call void %103(%struct.jpeg_common_struct* %0) #5
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %92
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %82, %62, %97
  %104 = icmp eq i32 %4, 0
  br i1 %104, label %107, label %105

; <label>:105:                                    ; preds = %.loopexit, %96
  %106 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 9
  store i32 1, i32* %106, align 8
  br label %107

; <label>:107:                                    ; preds = %.loopexit, %105
  %108 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 0
  %109 = load i8**, i8*** %108, align 8
  %sunkaddr21 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 28
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  %110 = load i32, i32* %sunkaddr23, align 4
  %111 = sub i32 %2, %110
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds i8*, i8** %109, i64 %112
  ret i8** %113
}

; Function Attrs: noinline nounwind uwtable
define internal [64 x i16]** @access_virt_barray(%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32) #0 {
  %6 = add i32 %3, %2
  %7 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 1
  %8 = load i32, i32* %7, align 8
  %9 = icmp ugt i32 %6, %8
  br i1 %9, label %18, label %10

; <label>:10:                                     ; preds = %5
  %11 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 3
  %12 = load i32, i32* %11, align 8
  %13 = icmp ult i32 %12, %3
  br i1 %13, label %18, label %14

; <label>:14:                                     ; preds = %10
  %15 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 0
  %16 = load [64 x i16]**, [64 x i16]*** %15, align 8
  %17 = icmp eq [64 x i16]** %16, null
  br i1 %17, label %18, label %25

; <label>:18:                                     ; preds = %14, %10, %5
  %19 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 20, i32* %21, align 8
  %22 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* %0) #5
  br label %25

; <label>:25:                                     ; preds = %14, %18
  %26 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 6
  %27 = load i32, i32* %26, align 4
  %28 = icmp ugt i32 %27, %2
  br i1 %28, label %34, label %29

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 4
  %31 = load i32, i32* %30, align 4
  %32 = add i32 %31, %27
  %33 = icmp ugt i32 %6, %32
  br i1 %33, label %34, label %62

; <label>:34:                                     ; preds = %29, %25
  %35 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 10
  %36 = load i32, i32* %35, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %45

; <label>:38:                                     ; preds = %34
  %39 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i64 0, i32 5
  store i32 68, i32* %41, align 8
  %42 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %43 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %42, align 8
  %44 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %43, align 8
  tail call void %44(%struct.jpeg_common_struct* %0) #5
  br label %45

; <label>:45:                                     ; preds = %34, %38
  %46 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 9
  %47 = load i32, i32* %46, align 8
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %50, label %49

; <label>:49:                                     ; preds = %45
  tail call fastcc void @do_barray_io(%struct.jpeg_common_struct* %0, %struct.jvirt_barray_control* nonnull %1, i32 1)
  %sunkaddr = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr7 = add i64 %sunkaddr, 40
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  store i32 0, i32* %sunkaddr8, align 8
  br label %50

; <label>:50:                                     ; preds = %45, %49
  %sunkaddr9 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 28
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  %51 = load i32, i32* %sunkaddr11, align 4
  %52 = icmp ult i32 %51, %2
  br i1 %52, label %61, label %53

; <label>:53:                                     ; preds = %50
  %54 = zext i32 %6 to i64
  %55 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 4
  %56 = load i32, i32* %55, align 4
  %57 = zext i32 %56 to i64
  %58 = sub nsw i64 %54, %57
  %59 = icmp sgt i64 %58, 0
  %. = select i1 %59, i64 %58, i64 0
  %60 = trunc i64 %. to i32
  br label %61

; <label>:61:                                     ; preds = %50, %53
  %.sink = phi i32 [ %60, %53 ], [ %2, %50 ]
  %sunkaddr12 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 28
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  store i32 %.sink, i32* %sunkaddr14, align 4
  tail call fastcc void @do_barray_io(%struct.jpeg_common_struct* %0, %struct.jvirt_barray_control* nonnull %1, i32 0)
  br label %62

; <label>:62:                                     ; preds = %29, %61
  %63 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 7
  %64 = load i32, i32* %63, align 8
  %65 = icmp ult i32 %64, %6
  br i1 %65, label %66, label %.loopexit

; <label>:66:                                     ; preds = %62
  %67 = icmp ult i32 %64, %2
  %68 = icmp eq i32 %4, 0
  br i1 %67, label %69, label %76

; <label>:69:                                     ; preds = %66
  br i1 %68, label %.thread, label %.thread4

.thread4:                                         ; preds = %69
  %70 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i64 0, i32 5
  store i32 20, i32* %72, align 8
  %73 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %74 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %73, align 8
  %75 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %74, align 8
  tail call void %75(%struct.jpeg_common_struct* %0) #5
  br label %77

; <label>:76:                                     ; preds = %66
  br i1 %68, label %.thread, label %77

; <label>:77:                                     ; preds = %76, %.thread4
  %.015 = phi i32 [ %2, %.thread4 ], [ %64, %76 ]
  %sunkaddr15 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 32
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  store i32 %6, i32* %sunkaddr17, align 8
  br label %.thread

.thread:                                          ; preds = %76, %69, %77
  %78 = phi i1 [ false, %77 ], [ true, %69 ], [ true, %76 ]
  %.013 = phi i32 [ %.015, %77 ], [ %2, %69 ], [ %64, %76 ]
  %79 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 8
  %80 = load i32, i32* %79, align 4
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %98, label %82

; <label>:82:                                     ; preds = %.thread
  %83 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 2
  %84 = load i32, i32* %83, align 4
  %85 = zext i32 %84 to i64
  %86 = shl nuw nsw i64 %85, 7
  %sunkaddr18 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 28
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  %87 = load i32, i32* %sunkaddr20, align 4
  %88 = sub i32 %.013, %87
  %89 = sub i32 %6, %87
  %90 = icmp ult i32 %88, %89
  br i1 %90, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %82
  %91 = zext i32 %88 to i64
  %wide.trip.count = zext i32 %89 to i64
  %92 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 0
  br label %93

; <label>:93:                                     ; preds = %93, %.lr.ph
  %indvars.iv = phi i64 [ %91, %.lr.ph ], [ %indvars.iv.next, %93 ]
  %94 = load [64 x i16]**, [64 x i16]*** %92, align 8
  %95 = getelementptr inbounds [64 x i16]*, [64 x i16]** %94, i64 %indvars.iv
  %96 = bitcast [64 x i16]** %95 to i8**
  %97 = load i8*, i8** %96, align 8
  tail call void @jzero_far(i8* %97, i64 %86) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.loopexit.loopexit, label %93

; <label>:98:                                     ; preds = %.thread
  br i1 %78, label %99, label %107

; <label>:99:                                     ; preds = %98
  %100 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %101 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %100, align 8
  %102 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %101, i64 0, i32 5
  store i32 20, i32* %102, align 8
  %103 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %104 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %103, align 8
  %105 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %104, align 8
  tail call void %105(%struct.jpeg_common_struct* %0) #5
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %93
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %82, %62, %99
  %106 = icmp eq i32 %4, 0
  br i1 %106, label %109, label %107

; <label>:107:                                    ; preds = %.loopexit, %98
  %108 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 9
  store i32 1, i32* %108, align 8
  br label %109

; <label>:109:                                    ; preds = %.loopexit, %107
  %110 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 0
  %111 = load [64 x i16]**, [64 x i16]*** %110, align 8
  %sunkaddr21 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 28
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  %112 = load i32, i32* %sunkaddr23, align 4
  %113 = sub i32 %2, %112
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds [64 x i16]*, [64 x i16]** %111, i64 %114
  ret [64 x i16]** %115
}

; Function Attrs: noinline nounwind uwtable
define internal void @free_pool(%struct.jpeg_common_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to %struct.my_memory_mgr**
  %5 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %4, align 8
  %6 = icmp ugt i32 %1, 1
  br i1 %6, label %.thread, label %15

.thread:                                          ; preds = %2
  %7 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i64 0, i32 5
  store i32 12, i32* %9, align 8
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %1, i32* %11, align 4
  %12 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  tail call void %14(%struct.jpeg_common_struct* nonnull %0) #5
  br label %42

; <label>:15:                                     ; preds = %2
  %16 = icmp eq i32 %1, 1
  br i1 %16, label %17, label %42

; <label>:17:                                     ; preds = %15
  %18 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %5, i64 0, i32 3
  %.0117 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %18, align 8
  %19 = icmp eq %struct.jvirt_sarray_control* %.0117, null
  br i1 %19, label %._crit_edge21, label %.lr.ph20.preheader

.lr.ph20.preheader:                               ; preds = %17
  br label %.lr.ph20

.lr.ph20:                                         ; preds = %.lr.ph20.preheader, %27
  %.0118 = phi %struct.jvirt_sarray_control* [ %.01, %27 ], [ %.0117, %.lr.ph20.preheader ]
  %20 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.0118, i64 0, i32 10
  %21 = load i32, i32* %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %27, label %23

; <label>:23:                                     ; preds = %.lr.ph20
  %sunkaddr = ptrtoint %struct.jvirt_sarray_control* %.0118 to i64
  %sunkaddr22 = add i64 %sunkaddr, 44
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  store i32 0, i32* %sunkaddr23, align 4
  %24 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.0118, i64 0, i32 12, i32 2
  %25 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)** %24, align 8
  %26 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.0118, i64 0, i32 12
  tail call void %25(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* %26) #5
  br label %27

; <label>:27:                                     ; preds = %.lr.ph20, %23
  %28 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %.0118, i64 0, i32 11
  %.01 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %28, align 8
  %29 = icmp eq %struct.jvirt_sarray_control* %.01, null
  br i1 %29, label %._crit_edge21.loopexit, label %.lr.ph20

._crit_edge21.loopexit:                           ; preds = %27
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %17
  %sunkaddr24 = ptrtoint %struct.my_memory_mgr* %5 to i64
  %sunkaddr25 = add i64 %sunkaddr24, 128
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to %struct.jvirt_sarray_control**
  store %struct.jvirt_sarray_control* null, %struct.jvirt_sarray_control** %sunkaddr26, align 8
  %30 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %5, i64 0, i32 4
  %.012 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %30, align 8
  %31 = icmp eq %struct.jvirt_barray_control* %.012, null
  br i1 %31, label %._crit_edge16, label %.lr.ph15.preheader

.lr.ph15.preheader:                               ; preds = %._crit_edge21
  br label %.lr.ph15

.lr.ph15:                                         ; preds = %.lr.ph15.preheader, %39
  %.013 = phi %struct.jvirt_barray_control* [ %.0, %39 ], [ %.012, %.lr.ph15.preheader ]
  %32 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.013, i64 0, i32 10
  %33 = load i32, i32* %32, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %39, label %35

; <label>:35:                                     ; preds = %.lr.ph15
  %sunkaddr27 = ptrtoint %struct.jvirt_barray_control* %.013 to i64
  %sunkaddr28 = add i64 %sunkaddr27, 44
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to i32*
  store i32 0, i32* %sunkaddr29, align 4
  %36 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.013, i64 0, i32 12, i32 2
  %37 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)** %36, align 8
  %38 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.013, i64 0, i32 12
  tail call void %37(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* %38) #5
  br label %39

; <label>:39:                                     ; preds = %.lr.ph15, %35
  %40 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %.013, i64 0, i32 11
  %.0 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %40, align 8
  %41 = icmp eq %struct.jvirt_barray_control* %.0, null
  br i1 %41, label %._crit_edge16.loopexit, label %.lr.ph15

._crit_edge16.loopexit:                           ; preds = %39
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %._crit_edge21
  %sunkaddr30 = ptrtoint %struct.my_memory_mgr* %5 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 136
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to %struct.jvirt_barray_control**
  store %struct.jvirt_barray_control* null, %struct.jvirt_barray_control** %sunkaddr32, align 8
  br label %42

; <label>:42:                                     ; preds = %15, %.thread, %._crit_edge16
  %43 = sext i32 %1 to i64
  %44 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %5, i64 0, i32 2, i64 %43
  %45 = load %union.large_pool_struct*, %union.large_pool_struct** %44, align 8
  store %union.large_pool_struct* null, %union.large_pool_struct** %44, align 8
  %46 = icmp eq %union.large_pool_struct* %45, null
  br i1 %46, label %._crit_edge11, label %.lr.ph10.preheader

.lr.ph10.preheader:                               ; preds = %42
  %sunkaddr45 = ptrtoint %struct.my_memory_mgr* %5 to i64
  %sunkaddr46 = add i64 %sunkaddr45, 144
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to i64*
  br label %.lr.ph10

.lr.ph10:                                         ; preds = %.lr.ph10.preheader, %.lr.ph10
  %.in58 = phi %union.large_pool_struct* [ %49, %.lr.ph10 ], [ %45, %.lr.ph10.preheader ]
  %47 = bitcast %union.large_pool_struct* %.in58 to i8*
  %48 = getelementptr inbounds %union.large_pool_struct, %union.large_pool_struct* %.in58, i64 0, i32 0, i32 0
  %49 = load %union.large_pool_struct*, %union.large_pool_struct** %48, align 8
  %50 = getelementptr inbounds %union.large_pool_struct, %union.large_pool_struct* %.in58, i64 0, i32 0, i32 1
  %51 = load i64, i64* %50, align 8
  %52 = getelementptr inbounds %union.large_pool_struct, %union.large_pool_struct* %.in58, i64 0, i32 0, i32 2
  %53 = load i64, i64* %52, align 8
  %54 = add i64 %51, 24
  %55 = add i64 %54, %53
  tail call void @jpeg_free_large(%struct.jpeg_common_struct* %0, i8* %47, i64 %55) #5
  %56 = load i64, i64* %sunkaddr47, align 8
  %57 = sub i64 %56, %55
  store i64 %57, i64* %sunkaddr47, align 8
  %58 = icmp eq %union.large_pool_struct* %49, null
  br i1 %58, label %._crit_edge11.loopexit, label %.lr.ph10

._crit_edge11.loopexit:                           ; preds = %.lr.ph10
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %42
  %59 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %5, i64 0, i32 1, i64 %43
  %60 = load %union.small_pool_struct*, %union.small_pool_struct** %59, align 8
  store %union.small_pool_struct* null, %union.small_pool_struct** %59, align 8
  %61 = icmp eq %union.small_pool_struct* %60, null
  br i1 %61, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge11
  %sunkaddr48 = ptrtoint %struct.my_memory_mgr* %5 to i64
  %sunkaddr49 = add i64 %sunkaddr48, 144
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to i64*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.in67 = phi %union.small_pool_struct* [ %64, %.lr.ph ], [ %60, %.lr.ph.preheader ]
  %62 = bitcast %union.small_pool_struct* %.in67 to i8*
  %63 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.in67, i64 0, i32 0, i32 0
  %64 = load %union.small_pool_struct*, %union.small_pool_struct** %63, align 8
  %65 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.in67, i64 0, i32 0, i32 1
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.in67, i64 0, i32 0, i32 2
  %68 = load i64, i64* %67, align 8
  %69 = add i64 %66, 24
  %70 = add i64 %69, %68
  tail call void @jpeg_free_small(%struct.jpeg_common_struct* %0, i8* %62, i64 %70) #5
  %71 = load i64, i64* %sunkaddr50, align 8
  %72 = sub i64 %71, %70
  store i64 %72, i64* %sunkaddr50, align 8
  %73 = icmp eq %union.small_pool_struct* %64, null
  br i1 %73, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge11
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @self_destruct(%struct.jpeg_common_struct*) #0 {
  tail call void @free_pool(%struct.jpeg_common_struct* %0, i32 1)
  tail call void @free_pool(%struct.jpeg_common_struct* %0, i32 0)
  %2 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8**
  %4 = load i8*, i8** %3, align 8
  tail call void @jpeg_free_small(%struct.jpeg_common_struct* %0, i8* %4, i64 160) #5
  store %struct.jpeg_memory_mgr* null, %struct.jpeg_memory_mgr** %2, align 8
  tail call void @jpeg_mem_term(%struct.jpeg_common_struct* %0) #5
  ret void
}

; Function Attrs: nounwind readonly
declare i8* @getenv(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @out_of_memory(%struct.jpeg_common_struct*, i32) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %4 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %4, i64 0, i32 5
  store i32 53, i32* %5, align 8
  %6 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i64 0, i32 6, i32 0, i64 0
  store i32 %1, i32* %7, align 4
  %8 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %9 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %8, align 8
  %10 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %9, align 8
  tail call void %10(%struct.jpeg_common_struct* %0) #5
  ret void
}

declare i8* @jpeg_get_large(%struct.jpeg_common_struct*, i64) local_unnamed_addr #1

declare i64 @jpeg_mem_available(%struct.jpeg_common_struct*, i64, i64, i64) local_unnamed_addr #1

declare void @jpeg_open_backing_store(%struct.jpeg_common_struct*, %struct.backing_store_struct*, i64) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @do_sarray_io(%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 6
  %8 = load i32, i32* %7, align 4
  %9 = zext i32 %8 to i64
  %10 = mul nuw nsw i64 %9, %6
  %11 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 4
  %12 = load i32, i32* %11, align 4
  %13 = zext i32 %12 to i64
  %14 = icmp eq i32 %12, 0
  br i1 %14, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %3
  %15 = icmp eq i32 %2, 0
  %16 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 12
  %17 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 12
  %sunkaddr76 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr77 = add i64 %sunkaddr76, 24
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to i32*
  %18 = load i32, i32* %sunkaddr78, align 8
  %19 = zext i32 %18 to i64
  %20 = icmp ult i64 %19, %13
  %..us52 = select i1 %20, i64 %19, i64 %13
  %sunkaddr79 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr80 = add i64 %sunkaddr79, 28
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to i32*
  %21 = load i32, i32* %sunkaddr81, align 4
  %22 = zext i32 %21 to i64
  %sunkaddr82 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr83 = add i64 %sunkaddr82, 32
  %sunkaddr84 = inttoptr i64 %sunkaddr83 to i32*
  %23 = load i32, i32* %sunkaddr84, align 8
  %24 = zext i32 %23 to i64
  %25 = sub nsw i64 %24, %22
  %26 = icmp slt i64 %..us52, %25
  %27 = select i1 %26, i64 %..us52, i64 %25
  %sunkaddr85 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr86 = add i64 %sunkaddr85, 8
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to i32*
  %28 = load i32, i32* %sunkaddr87, align 8
  %29 = zext i32 %28 to i64
  %30 = sub nsw i64 %29, %22
  %31 = icmp slt i64 %27, %30
  %.2.us53 = select i1 %31, i64 %27, i64 %30
  %32 = icmp slt i64 %.2.us53, 1
  br i1 %15, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br i1 %32, label %._crit_edge, label %.lr.ph63

.lr.ph63:                                         ; preds = %.lr.ph.split.preheader
  %sunkaddr109 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr110 = add i64 %sunkaddr109, 24
  %sunkaddr111 = inttoptr i64 %sunkaddr110 to i32*
  %33 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 0
  %sunkaddr120 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr121 = add i64 %sunkaddr120, 64
  %sunkaddr122 = inttoptr i64 %sunkaddr121 to void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)**
  %sunkaddr123 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr124 = add i64 %sunkaddr123, 24
  %sunkaddr125 = inttoptr i64 %sunkaddr124 to i32*
  %sunkaddr126 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr127 = add i64 %sunkaddr126, 20
  %sunkaddr128 = inttoptr i64 %sunkaddr127 to i32*
  %sunkaddr = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr112 = add i64 %sunkaddr, 28
  %sunkaddr113 = inttoptr i64 %sunkaddr112 to i32*
  %sunkaddr114 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr115 = add i64 %sunkaddr114, 32
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to i32*
  %sunkaddr117 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr118 = add i64 %sunkaddr117, 8
  %sunkaddr119 = inttoptr i64 %sunkaddr118 to i32*
  br label %83

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br i1 %32, label %._crit_edge, label %.lr.ph57

.lr.ph57:                                         ; preds = %.lr.ph.split.us.preheader
  %sunkaddr88 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr89 = add i64 %sunkaddr88, 24
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to i32*
  %34 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 0
  %sunkaddr100 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr101 = add i64 %sunkaddr100, 56
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)**
  %sunkaddr103 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr104 = add i64 %sunkaddr103, 24
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to i32*
  %sunkaddr106 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr107 = add i64 %sunkaddr106, 20
  %sunkaddr108 = inttoptr i64 %sunkaddr107 to i32*
  %sunkaddr91 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr92 = add i64 %sunkaddr91, 28
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to i32*
  %sunkaddr94 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr95 = add i64 %sunkaddr94, 32
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to i32*
  %sunkaddr97 = ptrtoint %struct.jvirt_sarray_control* %1 to i64
  %sunkaddr98 = add i64 %sunkaddr97, 8
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i32*
  br label %53

.lr.ph.split.us:                                  ; preds = %53
  %35 = add nsw i64 %54, %.013.us55
  %36 = load i32, i32* %sunkaddr90, align 8
  %37 = zext i32 %36 to i64
  %38 = sub nsw i64 %63, %61
  %39 = icmp slt i64 %37, %38
  %..us = select i1 %39, i64 %37, i64 %38
  %40 = load i32, i32* %sunkaddr93, align 4
  %41 = zext i32 %40 to i64
  %42 = add nsw i64 %41, %61
  %43 = load i32, i32* %sunkaddr96, align 8
  %44 = zext i32 %43 to i64
  %45 = sub nsw i64 %44, %42
  %46 = icmp slt i64 %..us, %45
  %47 = select i1 %46, i64 %..us, i64 %45
  %48 = load i32, i32* %sunkaddr99, align 8
  %49 = zext i32 %48 to i64
  %50 = sub nsw i64 %49, %42
  %51 = icmp slt i64 %47, %50
  %.2.us = select i1 %51, i64 %47, i64 %50
  %52 = icmp slt i64 %.2.us, 1
  br i1 %52, label %._crit_edge.loopexit, label %53

; <label>:53:                                     ; preds = %.lr.ph57, %.lr.ph.split.us
  %.2.us56 = phi i64 [ %.2.us53, %.lr.ph57 ], [ %.2.us, %.lr.ph.split.us ]
  %.013.us55 = phi i64 [ %10, %.lr.ph57 ], [ %35, %.lr.ph.split.us ]
  %.04.us54 = phi i64 [ 0, %.lr.ph57 ], [ %61, %.lr.ph.split.us ]
  %54 = mul nsw i64 %.2.us56, %6
  %55 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %sunkaddr102, align 8
  %56 = load i8**, i8*** %34, align 8
  %57 = getelementptr inbounds i8*, i8** %56, i64 %.04.us54
  %58 = load i8*, i8** %57, align 8
  tail call void %55(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* nonnull %16, i8* %58, i64 %.013.us55, i64 %54) #5
  %59 = load i32, i32* %sunkaddr105, align 8
  %60 = zext i32 %59 to i64
  %61 = add nsw i64 %60, %.04.us54
  %62 = load i32, i32* %sunkaddr108, align 4
  %63 = zext i32 %62 to i64
  %64 = icmp sgt i64 %63, %61
  br i1 %64, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %83
  %65 = add nsw i64 %84, %.01361
  %66 = load i32, i32* %sunkaddr111, align 8
  %67 = zext i32 %66 to i64
  %68 = sub nsw i64 %93, %91
  %69 = icmp slt i64 %67, %68
  %. = select i1 %69, i64 %67, i64 %68
  %70 = load i32, i32* %sunkaddr113, align 4
  %71 = zext i32 %70 to i64
  %72 = add nsw i64 %71, %91
  %73 = load i32, i32* %sunkaddr116, align 8
  %74 = zext i32 %73 to i64
  %75 = sub nsw i64 %74, %72
  %76 = icmp slt i64 %., %75
  %77 = select i1 %76, i64 %., i64 %75
  %78 = load i32, i32* %sunkaddr119, align 8
  %79 = zext i32 %78 to i64
  %80 = sub nsw i64 %79, %72
  %81 = icmp slt i64 %77, %80
  %.2 = select i1 %81, i64 %77, i64 %80
  %82 = icmp slt i64 %.2, 1
  br i1 %82, label %._crit_edge.loopexit130, label %83

; <label>:83:                                     ; preds = %.lr.ph63, %.lr.ph.split
  %.262 = phi i64 [ %.2.us53, %.lr.ph63 ], [ %.2, %.lr.ph.split ]
  %.01361 = phi i64 [ %10, %.lr.ph63 ], [ %65, %.lr.ph.split ]
  %.0460 = phi i64 [ 0, %.lr.ph63 ], [ %91, %.lr.ph.split ]
  %84 = mul nsw i64 %.262, %6
  %85 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %sunkaddr122, align 8
  %86 = load i8**, i8*** %33, align 8
  %87 = getelementptr inbounds i8*, i8** %86, i64 %.0460
  %88 = load i8*, i8** %87, align 8
  tail call void %85(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* nonnull %17, i8* %88, i64 %.01361, i64 %84) #5
  %89 = load i32, i32* %sunkaddr125, align 8
  %90 = zext i32 %89 to i64
  %91 = add nsw i64 %90, %.0460
  %92 = load i32, i32* %sunkaddr128, align 4
  %93 = zext i32 %92 to i64
  %94 = icmp sgt i64 %93, %91
  br i1 %94, label %.lr.ph.split, label %._crit_edge.loopexit130

._crit_edge.loopexit:                             ; preds = %.lr.ph.split.us, %53
  br label %._crit_edge

._crit_edge.loopexit130:                          ; preds = %.lr.ph.split, %83
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit130, %._crit_edge.loopexit, %.lr.ph.split.preheader, %.lr.ph.split.us.preheader, %3
  ret void
}

declare void @jzero_far(i8*, i64) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @do_barray_io(%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = zext i32 %5 to i64
  %7 = shl nuw nsw i64 %6, 7
  %8 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 6
  %9 = load i32, i32* %8, align 4
  %10 = zext i32 %9 to i64
  %11 = mul nsw i64 %10, %7
  %12 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 4
  %13 = load i32, i32* %12, align 4
  %14 = zext i32 %13 to i64
  %15 = icmp eq i32 %13, 0
  br i1 %15, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %3
  %16 = icmp eq i32 %2, 0
  %17 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 12
  %18 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 12
  %sunkaddr76 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr77 = add i64 %sunkaddr76, 24
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to i32*
  %19 = load i32, i32* %sunkaddr78, align 8
  %20 = zext i32 %19 to i64
  %21 = icmp ult i64 %20, %14
  %..us52 = select i1 %21, i64 %20, i64 %14
  %sunkaddr79 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr80 = add i64 %sunkaddr79, 28
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to i32*
  %22 = load i32, i32* %sunkaddr81, align 4
  %23 = zext i32 %22 to i64
  %sunkaddr82 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr83 = add i64 %sunkaddr82, 32
  %sunkaddr84 = inttoptr i64 %sunkaddr83 to i32*
  %24 = load i32, i32* %sunkaddr84, align 8
  %25 = zext i32 %24 to i64
  %26 = sub nsw i64 %25, %23
  %27 = icmp slt i64 %..us52, %26
  %28 = select i1 %27, i64 %..us52, i64 %26
  %sunkaddr85 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr86 = add i64 %sunkaddr85, 8
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to i32*
  %29 = load i32, i32* %sunkaddr87, align 8
  %30 = zext i32 %29 to i64
  %31 = sub nsw i64 %30, %23
  %32 = icmp slt i64 %28, %31
  %.2.us53 = select i1 %32, i64 %28, i64 %31
  %33 = icmp slt i64 %.2.us53, 1
  br i1 %16, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br i1 %33, label %._crit_edge, label %.lr.ph63

.lr.ph63:                                         ; preds = %.lr.ph.split.preheader
  %sunkaddr109 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr110 = add i64 %sunkaddr109, 24
  %sunkaddr111 = inttoptr i64 %sunkaddr110 to i32*
  %34 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 0
  %sunkaddr120 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr121 = add i64 %sunkaddr120, 64
  %sunkaddr122 = inttoptr i64 %sunkaddr121 to void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)**
  %sunkaddr123 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr124 = add i64 %sunkaddr123, 24
  %sunkaddr125 = inttoptr i64 %sunkaddr124 to i32*
  %sunkaddr126 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr127 = add i64 %sunkaddr126, 20
  %sunkaddr128 = inttoptr i64 %sunkaddr127 to i32*
  %sunkaddr = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr112 = add i64 %sunkaddr, 28
  %sunkaddr113 = inttoptr i64 %sunkaddr112 to i32*
  %sunkaddr114 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr115 = add i64 %sunkaddr114, 32
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to i32*
  %sunkaddr117 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr118 = add i64 %sunkaddr117, 8
  %sunkaddr119 = inttoptr i64 %sunkaddr118 to i32*
  br label %85

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br i1 %33, label %._crit_edge, label %.lr.ph57

.lr.ph57:                                         ; preds = %.lr.ph.split.us.preheader
  %sunkaddr88 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr89 = add i64 %sunkaddr88, 24
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to i32*
  %35 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 0
  %sunkaddr100 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr101 = add i64 %sunkaddr100, 56
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)**
  %sunkaddr103 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr104 = add i64 %sunkaddr103, 24
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to i32*
  %sunkaddr106 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr107 = add i64 %sunkaddr106, 20
  %sunkaddr108 = inttoptr i64 %sunkaddr107 to i32*
  %sunkaddr91 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr92 = add i64 %sunkaddr91, 28
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to i32*
  %sunkaddr94 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr95 = add i64 %sunkaddr94, 32
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to i32*
  %sunkaddr97 = ptrtoint %struct.jvirt_barray_control* %1 to i64
  %sunkaddr98 = add i64 %sunkaddr97, 8
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i32*
  br label %54

.lr.ph.split.us:                                  ; preds = %54
  %36 = add nsw i64 %55, %.013.us55
  %37 = load i32, i32* %sunkaddr90, align 8
  %38 = zext i32 %37 to i64
  %39 = sub nsw i64 %65, %63
  %40 = icmp slt i64 %38, %39
  %..us = select i1 %40, i64 %38, i64 %39
  %41 = load i32, i32* %sunkaddr93, align 4
  %42 = zext i32 %41 to i64
  %43 = add nsw i64 %42, %63
  %44 = load i32, i32* %sunkaddr96, align 8
  %45 = zext i32 %44 to i64
  %46 = sub nsw i64 %45, %43
  %47 = icmp slt i64 %..us, %46
  %48 = select i1 %47, i64 %..us, i64 %46
  %49 = load i32, i32* %sunkaddr99, align 8
  %50 = zext i32 %49 to i64
  %51 = sub nsw i64 %50, %43
  %52 = icmp slt i64 %48, %51
  %.2.us = select i1 %52, i64 %48, i64 %51
  %53 = icmp slt i64 %.2.us, 1
  br i1 %53, label %._crit_edge.loopexit, label %54

; <label>:54:                                     ; preds = %.lr.ph57, %.lr.ph.split.us
  %.2.us56 = phi i64 [ %.2.us53, %.lr.ph57 ], [ %.2.us, %.lr.ph.split.us ]
  %.013.us55 = phi i64 [ %11, %.lr.ph57 ], [ %36, %.lr.ph.split.us ]
  %.04.us54 = phi i64 [ 0, %.lr.ph57 ], [ %63, %.lr.ph.split.us ]
  %55 = mul nsw i64 %.2.us56, %7
  %56 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %sunkaddr102, align 8
  %57 = load [64 x i16]**, [64 x i16]*** %35, align 8
  %58 = getelementptr inbounds [64 x i16]*, [64 x i16]** %57, i64 %.04.us54
  %59 = bitcast [64 x i16]** %58 to i8**
  %60 = load i8*, i8** %59, align 8
  tail call void %56(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* nonnull %17, i8* %60, i64 %.013.us55, i64 %55) #5
  %61 = load i32, i32* %sunkaddr105, align 8
  %62 = zext i32 %61 to i64
  %63 = add nsw i64 %62, %.04.us54
  %64 = load i32, i32* %sunkaddr108, align 4
  %65 = zext i32 %64 to i64
  %66 = icmp sgt i64 %65, %63
  br i1 %66, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %85
  %67 = add nsw i64 %86, %.01361
  %68 = load i32, i32* %sunkaddr111, align 8
  %69 = zext i32 %68 to i64
  %70 = sub nsw i64 %96, %94
  %71 = icmp slt i64 %69, %70
  %. = select i1 %71, i64 %69, i64 %70
  %72 = load i32, i32* %sunkaddr113, align 4
  %73 = zext i32 %72 to i64
  %74 = add nsw i64 %73, %94
  %75 = load i32, i32* %sunkaddr116, align 8
  %76 = zext i32 %75 to i64
  %77 = sub nsw i64 %76, %74
  %78 = icmp slt i64 %., %77
  %79 = select i1 %78, i64 %., i64 %77
  %80 = load i32, i32* %sunkaddr119, align 8
  %81 = zext i32 %80 to i64
  %82 = sub nsw i64 %81, %74
  %83 = icmp slt i64 %79, %82
  %.2 = select i1 %83, i64 %79, i64 %82
  %84 = icmp slt i64 %.2, 1
  br i1 %84, label %._crit_edge.loopexit130, label %85

; <label>:85:                                     ; preds = %.lr.ph63, %.lr.ph.split
  %.262 = phi i64 [ %.2.us53, %.lr.ph63 ], [ %.2, %.lr.ph.split ]
  %.01361 = phi i64 [ %11, %.lr.ph63 ], [ %67, %.lr.ph.split ]
  %.0460 = phi i64 [ 0, %.lr.ph63 ], [ %94, %.lr.ph.split ]
  %86 = mul nsw i64 %.262, %7
  %87 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %sunkaddr122, align 8
  %88 = load [64 x i16]**, [64 x i16]*** %34, align 8
  %89 = getelementptr inbounds [64 x i16]*, [64 x i16]** %88, i64 %.0460
  %90 = bitcast [64 x i16]** %89 to i8**
  %91 = load i8*, i8** %90, align 8
  tail call void %87(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* nonnull %18, i8* %91, i64 %.01361, i64 %86) #5
  %92 = load i32, i32* %sunkaddr125, align 8
  %93 = zext i32 %92 to i64
  %94 = add nsw i64 %93, %.0460
  %95 = load i32, i32* %sunkaddr128, align 4
  %96 = zext i32 %95 to i64
  %97 = icmp sgt i64 %96, %94
  br i1 %97, label %.lr.ph.split, label %._crit_edge.loopexit130

._crit_edge.loopexit:                             ; preds = %.lr.ph.split.us, %54
  br label %._crit_edge

._crit_edge.loopexit130:                          ; preds = %.lr.ph.split, %85
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit130, %._crit_edge.loopexit, %.lr.ph.split.preheader, %.lr.ph.split.us.preheader, %3
  ret void
}

declare void @jpeg_free_large(%struct.jpeg_common_struct*, i8*, i64) local_unnamed_addr #1

declare void @jpeg_free_small(%struct.jpeg_common_struct*, i8*, i64) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
