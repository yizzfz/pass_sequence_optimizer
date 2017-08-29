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
@first_pool_slop = internal constant [2 x i64] [i64 1600, i64 16000], align 16
@extra_pool_slop = internal constant [2 x i64] [i64 0, i64 5000], align 16

; Function Attrs: noinline nounwind uwtable
define void @jinit_memory_mgr(%struct.jpeg_common_struct*) #0 {
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
  %53 = bitcast %struct.jpeg_memory_mgr** %4 to i8**
  store i8* %6, i8** %53, align 8
  %54 = tail call i8* @getenv(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #5
  %55 = icmp eq i8* %54, null
  br i1 %55, label %68, label %56

; <label>:56:                                     ; preds = %17
  store i8 120, i8* %3, align 1
  %57 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* nonnull %54, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64* nonnull %2, i8* nonnull %3) #5
  %58 = icmp sgt i32 %57, 0
  br i1 %58, label %59, label %68

; <label>:59:                                     ; preds = %56
  %60 = load i8, i8* %3, align 1
  %61 = sext i8 %60 to i32
  switch i32 %61, label %65 [
    i32 109, label %62
    i32 77, label %62
  ]

; <label>:62:                                     ; preds = %59, %59
  %63 = load i64, i64* %2, align 8
  %64 = mul nsw i64 %63, 1000
  store i64 %64, i64* %2, align 8
  br label %65

; <label>:65:                                     ; preds = %59, %62
  %66 = load i64, i64* %2, align 8
  %67 = mul nsw i64 %66, 1000
  store i64 %67, i64* %41, align 8
  br label %68

; <label>:68:                                     ; preds = %17, %56, %65
  ret void
}

declare i64 @jpeg_mem_init(%struct.jpeg_common_struct*) #1

declare i8* @jpeg_get_small(%struct.jpeg_common_struct*, i64) #1

declare void @jpeg_mem_term(%struct.jpeg_common_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @alloc_small(%struct.jpeg_common_struct*, i32, i64) #0 {
  %4 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %5 = bitcast %struct.jpeg_memory_mgr** %4 to %struct.my_memory_mgr**
  %6 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %7 = icmp ugt i64 %2, 999999976
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %3
  tail call void @out_of_memory(%struct.jpeg_common_struct* nonnull %0, i32 1)
  br label %9

; <label>:9:                                      ; preds = %8, %3
  %10 = and i64 %2, 7
  %11 = icmp ne i64 %10, 0
  %12 = sub nsw i64 8, %10
  %13 = select i1 %11, i64 %12, i64 0
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
  %27 = load %union.small_pool_struct*, %union.small_pool_struct** %26, align 8
  %28 = icmp eq %union.small_pool_struct* %27, null
  br i1 %28, label %._crit_edge20, label %.lr.ph19.preheader

.lr.ph19.preheader:                               ; preds = %24
  br label %.lr.ph19

.lr.ph19:                                         ; preds = %.lr.ph19.preheader, %33
  %29 = phi %union.small_pool_struct* [ %35, %33 ], [ %27, %.lr.ph19.preheader ]
  %30 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %29, i64 0, i32 0, i32 2
  %31 = load i64, i64* %30, align 8
  %32 = icmp ult i64 %31, %.02
  br i1 %32, label %33, label %.loopexit.loopexit

; <label>:33:                                     ; preds = %.lr.ph19
  %34 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %29, i64 0, i32 0, i32 0
  %35 = load %union.small_pool_struct*, %union.small_pool_struct** %34, align 8
  %36 = icmp eq %union.small_pool_struct* %35, null
  br i1 %36, label %._crit_edge20.loopexit, label %.lr.ph19

._crit_edge20.loopexit:                           ; preds = %33
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %24
  %.01.lcssa = phi %union.small_pool_struct* [ null, %24 ], [ %29, %._crit_edge20.loopexit ]
  %37 = add i64 %.02, 24
  %38 = icmp eq %union.small_pool_struct* %.01.lcssa, null
  %extra_pool_slop.sink = select i1 %38, [2 x i64]* @first_pool_slop, [2 x i64]* @extra_pool_slop
  %39 = getelementptr inbounds [2 x i64], [2 x i64]* %extra_pool_slop.sink, i64 0, i64 %25
  %40 = load i64, i64* %39, align 8
  %41 = sub i64 999999976, %.02
  %42 = icmp ugt i64 %40, %41
  %. = select i1 %42, i64 %41, i64 %40
  %43 = add i64 %37, %.
  %44 = tail call i8* @jpeg_get_small(%struct.jpeg_common_struct* %0, i64 %43) #5
  %45 = icmp eq i8* %44, null
  br i1 %45, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge20
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.backedge
  %.215 = phi i64 [ %46, %.backedge ], [ %., %.lr.ph.preheader ]
  %46 = lshr i64 %.215, 1
  %47 = icmp ult i64 %.215, 100
  br i1 %47, label %48, label %.backedge

; <label>:48:                                     ; preds = %.lr.ph
  tail call void @out_of_memory(%struct.jpeg_common_struct* %0, i32 2)
  br label %.backedge

.backedge:                                        ; preds = %48, %.lr.ph
  %49 = add i64 %37, %46
  %50 = tail call i8* @jpeg_get_small(%struct.jpeg_common_struct* %0, i64 %49) #5
  %51 = icmp eq i8* %50, null
  br i1 %51, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.backedge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge20
  %.2.lcssa = phi i64 [ %., %._crit_edge20 ], [ %46, %._crit_edge.loopexit ]
  %.lcssa11 = phi i64 [ %43, %._crit_edge20 ], [ %49, %._crit_edge.loopexit ]
  %.lcssa = phi i8* [ %44, %._crit_edge20 ], [ %50, %._crit_edge.loopexit ]
  %52 = bitcast i8* %.lcssa to %union.small_pool_struct*
  %53 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %6, i64 0, i32 5
  %54 = load i64, i64* %53, align 8
  %55 = add i64 %54, %.lcssa11
  store i64 %55, i64* %53, align 8
  %56 = add i64 %.2.lcssa, %.02
  %57 = getelementptr inbounds i8, i8* %.lcssa, i64 16
  %58 = bitcast i8* %57 to i64*
  call void @llvm.memset.p0i8.i64(i8* nonnull %.lcssa, i8 0, i64 16, i32 8, i1 false)
  store i64 %56, i64* %58, align 8
  %59 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.01.lcssa, i64 0, i32 0, i32 0
  %.sink10 = select i1 %38, %union.small_pool_struct** %26, %union.small_pool_struct** %59
  %60 = bitcast %union.small_pool_struct** %.sink10 to i8**
  store i8* %.lcssa, i8** %60, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph19
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.14 = phi %union.small_pool_struct* [ %52, %._crit_edge ], [ %29, %.loopexit.loopexit ]
  %61 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.14, i64 1
  %62 = bitcast %union.small_pool_struct* %61 to i8*
  %63 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.14, i64 0, i32 0, i32 1
  %64 = load i64, i64* %63, align 8
  %65 = getelementptr inbounds i8, i8* %62, i64 %64
  %66 = add i64 %64, %.02
  store i64 %66, i64* %63, align 8
  %67 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.14, i64 0, i32 0, i32 2
  %68 = load i64, i64* %67, align 8
  %69 = sub i64 %68, %.02
  store i64 %69, i64* %67, align 8
  ret i8* %65
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @alloc_large(%struct.jpeg_common_struct*, i32, i64) #0 {
  %4 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %5 = bitcast %struct.jpeg_memory_mgr** %4 to %struct.my_memory_mgr**
  %6 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %7 = icmp ugt i64 %2, 999999976
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %3
  tail call void @out_of_memory(%struct.jpeg_common_struct* nonnull %0, i32 3)
  br label %9

; <label>:9:                                      ; preds = %8, %3
  %10 = and i64 %2, 7
  %11 = icmp ne i64 %10, 0
  %12 = sub nsw i64 8, %10
  %13 = select i1 %11, i64 %12, i64 0
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
  tail call void @out_of_memory(%struct.jpeg_common_struct* nonnull %0, i32 4)
  br label %29

; <label>:29:                                     ; preds = %28, %24
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

; <label>:18:                                     ; preds = %11, %4
  %19 = zext i32 %3 to i64
  %20 = icmp ult i64 %9, %19
  %21 = trunc i64 %9 to i32
  %.02 = select i1 %20, i32 %21, i32 %3
  %22 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %7, i64 0, i32 6
  store i32 %.02, i32* %22, align 8
  %23 = shl nuw nsw i64 %19, 3
  %24 = tail call i8* @alloc_small(%struct.jpeg_common_struct* nonnull %0, i32 %1, i64 %23)
  %25 = bitcast i8* %24 to i8**
  %26 = icmp eq i32 %3, 0
  br i1 %26, label %._crit_edge, label %.lr.ph10.preheader

.lr.ph10.preheader:                               ; preds = %18
  %27 = xor i32 %3, -1
  br label %.lr.ph10

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph.prol.loopexit, %.lr.ph10
  %.1.lcssa = phi i32 [ %.019, %.lr.ph10 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %74, %.loopexit.loopexit ]
  %28 = icmp ult i32 %.1.lcssa, %3
  br i1 %28, label %.lr.ph10, label %._crit_edge.loopexit

.lr.ph10:                                         ; preds = %.lr.ph10.preheader, %.loopexit
  %.019 = phi i32 [ %.1.lcssa, %.loopexit ], [ 0, %.lr.ph10.preheader ]
  %.138 = phi i32 [ %31, %.loopexit ], [ %.02, %.lr.ph10.preheader ]
  %29 = sub i32 %3, %.019
  %30 = icmp ult i32 %.138, %29
  %31 = select i1 %30, i32 %.138, i32 %29
  %32 = zext i32 %31 to i64
  %33 = mul nuw i64 %32, %8
  %34 = tail call i8* @alloc_large(%struct.jpeg_common_struct* %0, i32 %1, i64 %33)
  %35 = icmp eq i32 %31, 0
  br i1 %35, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph10
  %36 = add i32 %.019, %27
  %37 = xor i32 %.138, -1
  %38 = icmp ugt i32 %36, %37
  %umax = select i1 %38, i32 %36, i32 %37
  %39 = sub i32 -2, %umax
  %xtraiter = and i32 %31, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.07.prol = phi i32 [ %44, %.lr.ph.prol ], [ %31, %.lr.ph.prol.preheader ]
  %.16.prol = phi i32 [ %40, %.lr.ph.prol ], [ %.019, %.lr.ph.prol.preheader ]
  %.045.prol = phi i8* [ %43, %.lr.ph.prol ], [ %34, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %40 = add i32 %.16.prol, 1
  %41 = zext i32 %.16.prol to i64
  %42 = getelementptr inbounds i8*, i8** %25, i64 %41
  store i8* %.045.prol, i8** %42, align 8
  %43 = getelementptr inbounds i8, i8* %.045.prol, i64 %8
  %44 = add i32 %.07.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.lcssa.unr = phi i32 [ undef, %.lr.ph.preheader ], [ %40, %.lr.ph.prol.loopexit.loopexit ]
  %.07.unr = phi i32 [ %31, %.lr.ph.preheader ], [ %44, %.lr.ph.prol.loopexit.loopexit ]
  %.16.unr = phi i32 [ %.019, %.lr.ph.preheader ], [ %40, %.lr.ph.prol.loopexit.loopexit ]
  %.045.unr = phi i8* [ %34, %.lr.ph.preheader ], [ %43, %.lr.ph.prol.loopexit.loopexit ]
  %45 = icmp ult i32 %39, 7
  br i1 %45, label %.loopexit, label %.lr.ph.preheader19

.lr.ph.preheader19:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader19, %.lr.ph
  %.07 = phi i32 [ %78, %.lr.ph ], [ %.07.unr, %.lr.ph.preheader19 ]
  %.16 = phi i32 [ %74, %.lr.ph ], [ %.16.unr, %.lr.ph.preheader19 ]
  %.045 = phi i8* [ %77, %.lr.ph ], [ %.045.unr, %.lr.ph.preheader19 ]
  %46 = add i32 %.16, 1
  %47 = zext i32 %.16 to i64
  %48 = getelementptr inbounds i8*, i8** %25, i64 %47
  store i8* %.045, i8** %48, align 8
  %49 = getelementptr inbounds i8, i8* %.045, i64 %8
  %50 = add i32 %.16, 2
  %51 = zext i32 %46 to i64
  %52 = getelementptr inbounds i8*, i8** %25, i64 %51
  store i8* %49, i8** %52, align 8
  %53 = getelementptr inbounds i8, i8* %49, i64 %8
  %54 = add i32 %.16, 3
  %55 = zext i32 %50 to i64
  %56 = getelementptr inbounds i8*, i8** %25, i64 %55
  store i8* %53, i8** %56, align 8
  %57 = getelementptr inbounds i8, i8* %53, i64 %8
  %58 = add i32 %.16, 4
  %59 = zext i32 %54 to i64
  %60 = getelementptr inbounds i8*, i8** %25, i64 %59
  store i8* %57, i8** %60, align 8
  %61 = getelementptr inbounds i8, i8* %57, i64 %8
  %62 = add i32 %.16, 5
  %63 = zext i32 %58 to i64
  %64 = getelementptr inbounds i8*, i8** %25, i64 %63
  store i8* %61, i8** %64, align 8
  %65 = getelementptr inbounds i8, i8* %61, i64 %8
  %66 = add i32 %.16, 6
  %67 = zext i32 %62 to i64
  %68 = getelementptr inbounds i8*, i8** %25, i64 %67
  store i8* %65, i8** %68, align 8
  %69 = getelementptr inbounds i8, i8* %65, i64 %8
  %70 = add i32 %.16, 7
  %71 = zext i32 %66 to i64
  %72 = getelementptr inbounds i8*, i8** %25, i64 %71
  store i8* %69, i8** %72, align 8
  %73 = getelementptr inbounds i8, i8* %69, i64 %8
  %74 = add i32 %.16, 8
  %75 = zext i32 %70 to i64
  %76 = getelementptr inbounds i8*, i8** %25, i64 %75
  store i8* %73, i8** %76, align 8
  %77 = getelementptr inbounds i8, i8* %73, i64 %8
  %78 = add i32 %.07, -8
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %.loopexit.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %18
  ret i8** %25
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

; <label>:19:                                     ; preds = %12, %4
  %20 = zext i32 %3 to i64
  %21 = icmp ult i64 %10, %20
  %22 = trunc i64 %10 to i32
  %.02 = select i1 %21, i32 %22, i32 %3
  %23 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %7, i64 0, i32 6
  store i32 %.02, i32* %23, align 8
  %24 = shl nuw nsw i64 %20, 3
  %25 = tail call i8* @alloc_small(%struct.jpeg_common_struct* nonnull %0, i32 %1, i64 %24)
  %26 = bitcast i8* %25 to [64 x i16]**
  %27 = icmp eq i32 %3, 0
  br i1 %27, label %._crit_edge, label %.lr.ph10

.lr.ph10:                                         ; preds = %19
  %28 = shl nuw nsw i64 %8, 7
  %29 = xor i32 %3, -1
  br label %31

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph.prol.loopexit, %31
  %.1.lcssa = phi i32 [ %.019, %31 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %62, %.loopexit.loopexit ]
  %30 = icmp ult i32 %.1.lcssa, %3
  br i1 %30, label %31, label %._crit_edge.loopexit

; <label>:31:                                     ; preds = %.lr.ph10, %.loopexit
  %.019 = phi i32 [ 0, %.lr.ph10 ], [ %.1.lcssa, %.loopexit ]
  %.138 = phi i32 [ %.02, %.lr.ph10 ], [ %34, %.loopexit ]
  %32 = sub i32 %3, %.019
  %33 = icmp ult i32 %.138, %32
  %34 = select i1 %33, i32 %.138, i32 %32
  %35 = zext i32 %34 to i64
  %36 = mul i64 %28, %35
  %37 = tail call i8* @alloc_large(%struct.jpeg_common_struct* %0, i32 %1, i64 %36)
  %38 = bitcast i8* %37 to [64 x i16]*
  %39 = icmp eq i32 %34, 0
  br i1 %39, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %31
  %40 = add i32 %.019, %29
  %41 = xor i32 %.138, -1
  %42 = icmp ugt i32 %40, %41
  %umax = select i1 %42, i32 %40, i32 %41
  %43 = sub i32 -2, %umax
  %xtraiter = and i32 %34, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.07.prol = phi i32 [ %48, %.lr.ph.prol ], [ %34, %.lr.ph.prol.preheader ]
  %.16.prol = phi i32 [ %44, %.lr.ph.prol ], [ %.019, %.lr.ph.prol.preheader ]
  %.045.prol = phi [64 x i16]* [ %47, %.lr.ph.prol ], [ %38, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %44 = add i32 %.16.prol, 1
  %45 = zext i32 %.16.prol to i64
  %46 = getelementptr inbounds [64 x i16]*, [64 x i16]** %26, i64 %45
  store [64 x i16]* %.045.prol, [64 x i16]** %46, align 8
  %47 = getelementptr inbounds [64 x i16], [64 x i16]* %.045.prol, i64 %8
  %48 = add i32 %.07.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.lcssa.unr = phi i32 [ undef, %.lr.ph.preheader ], [ %44, %.lr.ph.prol.loopexit.loopexit ]
  %.07.unr = phi i32 [ %34, %.lr.ph.preheader ], [ %48, %.lr.ph.prol.loopexit.loopexit ]
  %.16.unr = phi i32 [ %.019, %.lr.ph.preheader ], [ %44, %.lr.ph.prol.loopexit.loopexit ]
  %.045.unr = phi [64 x i16]* [ %38, %.lr.ph.preheader ], [ %47, %.lr.ph.prol.loopexit.loopexit ]
  %49 = icmp ult i32 %43, 3
  br i1 %49, label %.loopexit, label %.lr.ph.preheader19

.lr.ph.preheader19:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader19, %.lr.ph
  %.07 = phi i32 [ %66, %.lr.ph ], [ %.07.unr, %.lr.ph.preheader19 ]
  %.16 = phi i32 [ %62, %.lr.ph ], [ %.16.unr, %.lr.ph.preheader19 ]
  %.045 = phi [64 x i16]* [ %65, %.lr.ph ], [ %.045.unr, %.lr.ph.preheader19 ]
  %50 = add i32 %.16, 1
  %51 = zext i32 %.16 to i64
  %52 = getelementptr inbounds [64 x i16]*, [64 x i16]** %26, i64 %51
  store [64 x i16]* %.045, [64 x i16]** %52, align 8
  %53 = getelementptr inbounds [64 x i16], [64 x i16]* %.045, i64 %8
  %54 = add i32 %.16, 2
  %55 = zext i32 %50 to i64
  %56 = getelementptr inbounds [64 x i16]*, [64 x i16]** %26, i64 %55
  store [64 x i16]* %53, [64 x i16]** %56, align 8
  %57 = getelementptr inbounds [64 x i16], [64 x i16]* %53, i64 %8
  %58 = add i32 %.16, 3
  %59 = zext i32 %54 to i64
  %60 = getelementptr inbounds [64 x i16]*, [64 x i16]** %26, i64 %59
  store [64 x i16]* %57, [64 x i16]** %60, align 8
  %61 = getelementptr inbounds [64 x i16], [64 x i16]* %57, i64 %8
  %62 = add i32 %.16, 4
  %63 = zext i32 %58 to i64
  %64 = getelementptr inbounds [64 x i16]*, [64 x i16]** %26, i64 %63
  store [64 x i16]* %61, [64 x i16]** %64, align 8
  %65 = getelementptr inbounds [64 x i16], [64 x i16]* %61, i64 %8
  %66 = add i32 %.07, -4
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %.loopexit.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %19
  ret [64 x i16]** %26
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
  %6 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %7 = icmp eq %struct.jvirt_sarray_control* %6, null
  br i1 %7, label %._crit_edge23, label %.lr.ph22.preheader

.lr.ph22.preheader:                               ; preds = %1
  br label %.lr.ph22

.lr.ph22:                                         ; preds = %.lr.ph22.preheader, %26
  %8 = phi %struct.jvirt_sarray_control* [ %28, %26 ], [ %6, %.lr.ph22.preheader ]
  %.0320 = phi i64 [ %.14, %26 ], [ 0, %.lr.ph22.preheader ]
  %.0519 = phi i64 [ %.16, %26 ], [ 0, %.lr.ph22.preheader ]
  %9 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %8, i64 0, i32 0
  %10 = load i8**, i8*** %9, align 8
  %11 = icmp eq i8** %10, null
  br i1 %11, label %12, label %26

; <label>:12:                                     ; preds = %.lr.ph22
  %13 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %8, i64 0, i32 3
  %14 = load i32, i32* %13, align 8
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %8, i64 0, i32 2
  %17 = load i32, i32* %16, align 4
  %18 = zext i32 %17 to i64
  %19 = mul nuw nsw i64 %18, %15
  %20 = add i64 %19, %.0320
  %21 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %8, i64 0, i32 1
  %22 = load i32, i32* %21, align 8
  %23 = zext i32 %22 to i64
  %24 = mul nuw nsw i64 %23, %18
  %25 = add i64 %24, %.0519
  br label %26

; <label>:26:                                     ; preds = %.lr.ph22, %12
  %.16 = phi i64 [ %25, %12 ], [ %.0519, %.lr.ph22 ]
  %.14 = phi i64 [ %20, %12 ], [ %.0320, %.lr.ph22 ]
  %27 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %8, i64 0, i32 11
  %28 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %27, align 8
  %29 = icmp eq %struct.jvirt_sarray_control* %28, null
  br i1 %29, label %._crit_edge23.loopexit, label %.lr.ph22

._crit_edge23.loopexit:                           ; preds = %26
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %1
  %.05.lcssa = phi i64 [ 0, %1 ], [ %.16, %._crit_edge23.loopexit ]
  %.03.lcssa = phi i64 [ 0, %1 ], [ %.14, %._crit_edge23.loopexit ]
  %30 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %4, i64 0, i32 4
  %31 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %30, align 8
  %32 = icmp eq %struct.jvirt_barray_control* %31, null
  br i1 %32, label %._crit_edge, label %.lr.ph17.preheader

.lr.ph17.preheader:                               ; preds = %._crit_edge23
  br label %.lr.ph17

.lr.ph17:                                         ; preds = %.lr.ph17.preheader, %53
  %33 = phi %struct.jvirt_barray_control* [ %55, %53 ], [ %31, %.lr.ph17.preheader ]
  %.216 = phi i64 [ %.3, %53 ], [ %.03.lcssa, %.lr.ph17.preheader ]
  %.2715 = phi i64 [ %.38, %53 ], [ %.05.lcssa, %.lr.ph17.preheader ]
  %34 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %33, i64 0, i32 0
  %35 = load [64 x i16]**, [64 x i16]*** %34, align 8
  %36 = icmp eq [64 x i16]** %35, null
  br i1 %36, label %37, label %53

; <label>:37:                                     ; preds = %.lr.ph17
  %38 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %33, i64 0, i32 3
  %39 = load i32, i32* %38, align 8
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %33, i64 0, i32 2
  %42 = load i32, i32* %41, align 4
  %43 = zext i32 %42 to i64
  %44 = shl nuw nsw i64 %40, 7
  %45 = mul i64 %44, %43
  %46 = add i64 %45, %.216
  %47 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %33, i64 0, i32 1
  %48 = load i32, i32* %47, align 8
  %49 = zext i32 %48 to i64
  %50 = shl nuw nsw i64 %43, 7
  %51 = mul i64 %50, %49
  %52 = add i64 %51, %.2715
  br label %53

; <label>:53:                                     ; preds = %.lr.ph17, %37
  %.38 = phi i64 [ %52, %37 ], [ %.2715, %.lr.ph17 ]
  %.3 = phi i64 [ %46, %37 ], [ %.216, %.lr.ph17 ]
  %54 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %33, i64 0, i32 11
  %55 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %54, align 8
  %56 = icmp eq %struct.jvirt_barray_control* %55, null
  br i1 %56, label %._crit_edge.loopexit, label %.lr.ph17

._crit_edge.loopexit:                             ; preds = %53
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge23
  %.27.lcssa = phi i64 [ %.05.lcssa, %._crit_edge23 ], [ %.38, %._crit_edge.loopexit ]
  %.2.lcssa = phi i64 [ %.03.lcssa, %._crit_edge23 ], [ %.3, %._crit_edge.loopexit ]
  %57 = icmp slt i64 %.2.lcssa, 1
  br i1 %57, label %.loopexit, label %58

; <label>:58:                                     ; preds = %._crit_edge
  %59 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %4, i64 0, i32 5
  %60 = load i64, i64* %59, align 8
  %61 = tail call i64 @jpeg_mem_available(%struct.jpeg_common_struct* %0, i64 %.2.lcssa, i64 %.27.lcssa, i64 %60) #5
  %62 = icmp slt i64 %61, %.27.lcssa
  br i1 %62, label %63, label %66

; <label>:63:                                     ; preds = %58
  %64 = sdiv i64 %61, %.2.lcssa
  %65 = icmp sgt i64 %64, 1
  %. = select i1 %65, i64 %64, i64 1
  br label %66

; <label>:66:                                     ; preds = %58, %63
  %.110 = phi i64 [ %., %63 ], [ 1000000000, %58 ]
  %67 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %68 = icmp eq %struct.jvirt_sarray_control* %67, null
  br i1 %68, label %.preheader, label %.lr.ph14

.lr.ph14:                                         ; preds = %66
  %69 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %4, i64 0, i32 6
  br label %73

.preheader.loopexit:                              ; preds = %113
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %66
  %70 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %30, align 8
  %71 = icmp eq %struct.jvirt_barray_control* %70, null
  br i1 %71, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader
  %72 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %4, i64 0, i32 6
  br label %117

; <label>:73:                                     ; preds = %.lr.ph14, %113
  %74 = phi %struct.jvirt_sarray_control* [ %67, %.lr.ph14 ], [ %115, %113 ]
  %75 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 0
  %76 = load i8**, i8*** %75, align 8
  %77 = icmp eq i8** %76, null
  br i1 %77, label %78, label %113

; <label>:78:                                     ; preds = %73
  %79 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 1
  %80 = load i32, i32* %79, align 8
  %81 = zext i32 %80 to i64
  %82 = add nsw i64 %81, -1
  %83 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 3
  %84 = load i32, i32* %83, align 8
  %85 = zext i32 %84 to i64
  %86 = sdiv i64 %82, %85
  %87 = icmp slt i64 %86, %.110
  br i1 %87, label %88, label %90

; <label>:88:                                     ; preds = %78
  %89 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 4
  store i32 %80, i32* %89, align 4
  br label %102

; <label>:90:                                     ; preds = %78
  %91 = mul nsw i64 %85, %.110
  %92 = trunc i64 %91 to i32
  %93 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 4
  store i32 %92, i32* %93, align 4
  %94 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 12
  %95 = load i32, i32* %79, align 8
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 2
  %98 = load i32, i32* %97, align 4
  %99 = zext i32 %98 to i64
  %100 = mul nuw nsw i64 %99, %96
  tail call void @jpeg_open_backing_store(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* %94, i64 %100) #5
  %101 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 10
  store i32 1, i32* %101, align 4
  br label %102

; <label>:102:                                    ; preds = %90, %88
  %103 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 2
  %104 = load i32, i32* %103, align 4
  %105 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 4
  %106 = load i32, i32* %105, align 4
  %107 = tail call i8** @alloc_sarray(%struct.jpeg_common_struct* %0, i32 1, i32 %104, i32 %106)
  store i8** %107, i8*** %75, align 8
  %108 = load i32, i32* %69, align 8
  %109 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 5
  store i32 %108, i32* %109, align 8
  %110 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 6
  store i32 0, i32* %110, align 4
  %111 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 7
  store i32 0, i32* %111, align 8
  %112 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 9
  store i32 0, i32* %112, align 8
  br label %113

; <label>:113:                                    ; preds = %73, %102
  %114 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i64 0, i32 11
  %115 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %114, align 8
  %116 = icmp eq %struct.jvirt_sarray_control* %115, null
  br i1 %116, label %.preheader.loopexit, label %73

; <label>:117:                                    ; preds = %.lr.ph, %158
  %118 = phi %struct.jvirt_barray_control* [ %70, %.lr.ph ], [ %160, %158 ]
  %119 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 0
  %120 = load [64 x i16]**, [64 x i16]*** %119, align 8
  %121 = icmp eq [64 x i16]** %120, null
  br i1 %121, label %122, label %158

; <label>:122:                                    ; preds = %117
  %123 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 1
  %124 = load i32, i32* %123, align 8
  %125 = zext i32 %124 to i64
  %126 = add nsw i64 %125, -1
  %127 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 3
  %128 = load i32, i32* %127, align 8
  %129 = zext i32 %128 to i64
  %130 = sdiv i64 %126, %129
  %131 = icmp slt i64 %130, %.110
  br i1 %131, label %132, label %134

; <label>:132:                                    ; preds = %122
  %133 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 4
  store i32 %124, i32* %133, align 4
  br label %147

; <label>:134:                                    ; preds = %122
  %135 = mul nsw i64 %129, %.110
  %136 = trunc i64 %135 to i32
  %137 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 4
  store i32 %136, i32* %137, align 4
  %138 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 12
  %139 = load i32, i32* %123, align 8
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 2
  %142 = load i32, i32* %141, align 4
  %143 = zext i32 %142 to i64
  %144 = shl nuw nsw i64 %140, 7
  %145 = mul i64 %144, %143
  tail call void @jpeg_open_backing_store(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* %138, i64 %145) #5
  %146 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 10
  store i32 1, i32* %146, align 4
  br label %147

; <label>:147:                                    ; preds = %134, %132
  %148 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 2
  %149 = load i32, i32* %148, align 4
  %150 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 4
  %151 = load i32, i32* %150, align 4
  %152 = tail call [64 x i16]** @alloc_barray(%struct.jpeg_common_struct* %0, i32 1, i32 %149, i32 %151)
  store [64 x i16]** %152, [64 x i16]*** %119, align 8
  %153 = load i32, i32* %72, align 8
  %154 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 5
  store i32 %153, i32* %154, align 8
  %155 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 6
  store i32 0, i32* %155, align 4
  %156 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 7
  store i32 0, i32* %156, align 8
  %157 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 9
  store i32 0, i32* %157, align 8
  br label %158

; <label>:158:                                    ; preds = %117, %147
  %159 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %118, i64 0, i32 11
  %160 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %159, align 8
  %161 = icmp eq %struct.jvirt_barray_control* %160, null
  br i1 %161, label %.loopexit.loopexit, label %117

.loopexit.loopexit:                               ; preds = %158
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

; <label>:25:                                     ; preds = %18, %14
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
  tail call void @do_sarray_io(%struct.jpeg_common_struct* %0, %struct.jvirt_sarray_control* nonnull %1, i32 1)
  store i32 0, i32* %46, align 8
  br label %50

; <label>:50:                                     ; preds = %45, %49
  %51 = load i32, i32* %26, align 4
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
  store i32 %.sink, i32* %26, align 4
  tail call void @do_sarray_io(%struct.jpeg_common_struct* %0, %struct.jvirt_sarray_control* nonnull %1, i32 0)
  br label %62

; <label>:62:                                     ; preds = %61, %29
  %63 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 7
  %64 = load i32, i32* %63, align 8
  %65 = icmp ult i32 %64, %6
  br i1 %65, label %66, label %.loopexit

; <label>:66:                                     ; preds = %62
  %67 = icmp ult i32 %64, %2
  %68 = icmp ne i32 %4, 0
  br i1 %67, label %69, label %76

; <label>:69:                                     ; preds = %66
  br i1 %68, label %.thread, label %.thread5

.thread:                                          ; preds = %69
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
  br i1 %68, label %77, label %.thread5

; <label>:77:                                     ; preds = %.thread, %76
  %.014 = phi i32 [ %2, %.thread ], [ %64, %76 ]
  store i32 %6, i32* %63, align 8
  br label %.thread5

.thread5:                                         ; preds = %69, %77, %76
  %.013 = phi i32 [ %.014, %77 ], [ %64, %76 ], [ %2, %69 ]
  %78 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 8
  %79 = load i32, i32* %78, align 4
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %96, label %81

; <label>:81:                                     ; preds = %.thread5
  %82 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 2
  %83 = load i32, i32* %82, align 4
  %84 = zext i32 %83 to i64
  %85 = load i32, i32* %26, align 4
  %86 = sub i32 %.013, %85
  %87 = sub i32 %6, %85
  %88 = zext i32 %87 to i64
  %89 = icmp ult i32 %86, %87
  br i1 %89, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %81
  %90 = zext i32 %86 to i64
  %91 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 0
  br label %92

; <label>:92:                                     ; preds = %92, %.lr.ph
  %indvars.iv7 = phi i64 [ %90, %.lr.ph ], [ %indvars.iv.next, %92 ]
  %93 = load i8**, i8*** %91, align 8
  %94 = getelementptr inbounds i8*, i8** %93, i64 %indvars.iv7
  %95 = load i8*, i8** %94, align 8
  tail call void @jzero_far(i8* %95, i64 %84) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %88
  br i1 %exitcond, label %.loopexit.loopexit, label %92

; <label>:96:                                     ; preds = %.thread5
  %cond = icmp eq i32 %4, 0
  br i1 %cond, label %.thread6, label %104

.thread6:                                         ; preds = %96
  %97 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %97, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 5
  store i32 20, i32* %99, align 8
  %100 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %101 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %100, align 8
  %102 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %101, align 8
  tail call void %102(%struct.jpeg_common_struct* %0) #5
  br label %106

.loopexit.loopexit:                               ; preds = %92
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %81, %62
  %103 = icmp eq i32 %4, 0
  br i1 %103, label %106, label %104

; <label>:104:                                    ; preds = %.loopexit, %96
  %105 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 9
  store i32 1, i32* %105, align 8
  br label %106

; <label>:106:                                    ; preds = %.loopexit, %.thread6, %104
  %107 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 0
  %108 = load i8**, i8*** %107, align 8
  %109 = load i32, i32* %26, align 4
  %110 = sub i32 %2, %109
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i8*, i8** %108, i64 %111
  ret i8** %112
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

; <label>:25:                                     ; preds = %18, %14
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
  tail call void @do_barray_io(%struct.jpeg_common_struct* %0, %struct.jvirt_barray_control* nonnull %1, i32 1)
  store i32 0, i32* %46, align 8
  br label %50

; <label>:50:                                     ; preds = %45, %49
  %51 = load i32, i32* %26, align 4
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
  store i32 %.sink, i32* %26, align 4
  tail call void @do_barray_io(%struct.jpeg_common_struct* %0, %struct.jvirt_barray_control* nonnull %1, i32 0)
  br label %62

; <label>:62:                                     ; preds = %61, %29
  %63 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 7
  %64 = load i32, i32* %63, align 8
  %65 = icmp ult i32 %64, %6
  br i1 %65, label %66, label %.loopexit

; <label>:66:                                     ; preds = %62
  %67 = icmp ult i32 %64, %2
  %68 = icmp ne i32 %4, 0
  br i1 %67, label %69, label %76

; <label>:69:                                     ; preds = %66
  br i1 %68, label %.thread, label %.thread5

.thread:                                          ; preds = %69
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
  br i1 %68, label %77, label %.thread5

; <label>:77:                                     ; preds = %.thread, %76
  %.014 = phi i32 [ %2, %.thread ], [ %64, %76 ]
  store i32 %6, i32* %63, align 8
  br label %.thread5

.thread5:                                         ; preds = %69, %77, %76
  %.013 = phi i32 [ %.014, %77 ], [ %64, %76 ], [ %2, %69 ]
  %78 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 8
  %79 = load i32, i32* %78, align 4
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %98, label %81

; <label>:81:                                     ; preds = %.thread5
  %82 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 2
  %83 = load i32, i32* %82, align 4
  %84 = zext i32 %83 to i64
  %85 = shl nuw nsw i64 %84, 7
  %86 = load i32, i32* %26, align 4
  %87 = sub i32 %.013, %86
  %88 = sub i32 %6, %86
  %89 = zext i32 %88 to i64
  %90 = icmp ult i32 %87, %88
  br i1 %90, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %81
  %91 = zext i32 %87 to i64
  %92 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 0
  br label %93

; <label>:93:                                     ; preds = %93, %.lr.ph
  %indvars.iv7 = phi i64 [ %91, %.lr.ph ], [ %indvars.iv.next, %93 ]
  %94 = load [64 x i16]**, [64 x i16]*** %92, align 8
  %95 = getelementptr inbounds [64 x i16]*, [64 x i16]** %94, i64 %indvars.iv7
  %96 = bitcast [64 x i16]** %95 to i8**
  %97 = load i8*, i8** %96, align 8
  tail call void @jzero_far(i8* %97, i64 %85) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %89
  br i1 %exitcond, label %.loopexit.loopexit, label %93

; <label>:98:                                     ; preds = %.thread5
  %cond = icmp eq i32 %4, 0
  br i1 %cond, label %.thread6, label %106

.thread6:                                         ; preds = %98
  %99 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %100 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %99, align 8
  %101 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %100, i64 0, i32 5
  store i32 20, i32* %101, align 8
  %102 = bitcast %struct.jpeg_common_struct* %0 to void (%struct.jpeg_common_struct*)***
  %103 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %102, align 8
  %104 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %103, align 8
  tail call void %104(%struct.jpeg_common_struct* %0) #5
  br label %108

.loopexit.loopexit:                               ; preds = %93
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %81, %62
  %105 = icmp eq i32 %4, 0
  br i1 %105, label %108, label %106

; <label>:106:                                    ; preds = %.loopexit, %98
  %107 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 9
  store i32 1, i32* %107, align 8
  br label %108

; <label>:108:                                    ; preds = %.loopexit, %.thread6, %106
  %109 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 0
  %110 = load [64 x i16]**, [64 x i16]*** %109, align 8
  %111 = load i32, i32* %26, align 4
  %112 = sub i32 %2, %111
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds [64 x i16]*, [64 x i16]** %110, i64 %113
  ret [64 x i16]** %114
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
  br label %48

; <label>:15:                                     ; preds = %2
  %16 = icmp eq i32 %1, 1
  br i1 %16, label %17, label %48

; <label>:17:                                     ; preds = %15
  %18 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %5, i64 0, i32 3
  %19 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %18, align 8
  %20 = icmp eq %struct.jvirt_sarray_control* %19, null
  br i1 %20, label %._crit_edge16, label %.lr.ph15.preheader

.lr.ph15.preheader:                               ; preds = %17
  br label %.lr.ph15

.lr.ph15:                                         ; preds = %.lr.ph15.preheader, %29
  %21 = phi %struct.jvirt_sarray_control* [ %31, %29 ], [ %19, %.lr.ph15.preheader ]
  %22 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %21, i64 0, i32 10
  %23 = load i32, i32* %22, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %29, label %25

; <label>:25:                                     ; preds = %.lr.ph15
  store i32 0, i32* %22, align 4
  %26 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %21, i64 0, i32 12
  %27 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %21, i64 0, i32 12, i32 2
  %28 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)** %27, align 8
  tail call void %28(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* %26) #5
  br label %29

; <label>:29:                                     ; preds = %.lr.ph15, %25
  %30 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %21, i64 0, i32 11
  %31 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %30, align 8
  %32 = icmp eq %struct.jvirt_sarray_control* %31, null
  br i1 %32, label %._crit_edge16.loopexit, label %.lr.ph15

._crit_edge16.loopexit:                           ; preds = %29
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %17
  store %struct.jvirt_sarray_control* null, %struct.jvirt_sarray_control** %18, align 8
  %33 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %5, i64 0, i32 4
  %34 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %33, align 8
  %35 = icmp eq %struct.jvirt_barray_control* %34, null
  br i1 %35, label %._crit_edge13, label %.lr.ph12.preheader

.lr.ph12.preheader:                               ; preds = %._crit_edge16
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12.preheader, %44
  %36 = phi %struct.jvirt_barray_control* [ %46, %44 ], [ %34, %.lr.ph12.preheader ]
  %37 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %36, i64 0, i32 10
  %38 = load i32, i32* %37, align 4
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %44, label %40

; <label>:40:                                     ; preds = %.lr.ph12
  store i32 0, i32* %37, align 4
  %41 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %36, i64 0, i32 12
  %42 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %36, i64 0, i32 12, i32 2
  %43 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)** %42, align 8
  tail call void %43(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* %41) #5
  br label %44

; <label>:44:                                     ; preds = %.lr.ph12, %40
  %45 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %36, i64 0, i32 11
  %46 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %45, align 8
  %47 = icmp eq %struct.jvirt_barray_control* %46, null
  br i1 %47, label %._crit_edge13.loopexit, label %.lr.ph12

._crit_edge13.loopexit:                           ; preds = %44
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %._crit_edge16
  store %struct.jvirt_barray_control* null, %struct.jvirt_barray_control** %33, align 8
  br label %48

; <label>:48:                                     ; preds = %.thread, %._crit_edge13, %15
  %49 = sext i32 %1 to i64
  %50 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %5, i64 0, i32 2, i64 %49
  %51 = load %union.large_pool_struct*, %union.large_pool_struct** %50, align 8
  store %union.large_pool_struct* null, %union.large_pool_struct** %50, align 8
  %52 = icmp eq %union.large_pool_struct* %51, null
  br i1 %52, label %._crit_edge10, label %.lr.ph9

.lr.ph9:                                          ; preds = %48
  %53 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %5, i64 0, i32 5
  br label %54

; <label>:54:                                     ; preds = %.lr.ph9, %54
  %.in57 = phi %union.large_pool_struct* [ %51, %.lr.ph9 ], [ %57, %54 ]
  %55 = bitcast %union.large_pool_struct* %.in57 to i8*
  %56 = getelementptr inbounds %union.large_pool_struct, %union.large_pool_struct* %.in57, i64 0, i32 0, i32 0
  %57 = load %union.large_pool_struct*, %union.large_pool_struct** %56, align 8
  %58 = getelementptr inbounds %union.large_pool_struct, %union.large_pool_struct* %.in57, i64 0, i32 0, i32 1
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds %union.large_pool_struct, %union.large_pool_struct* %.in57, i64 0, i32 0, i32 2
  %61 = load i64, i64* %60, align 8
  %62 = add i64 %59, 24
  %63 = add i64 %62, %61
  tail call void @jpeg_free_large(%struct.jpeg_common_struct* %0, i8* %55, i64 %63) #5
  %64 = load i64, i64* %53, align 8
  %65 = sub i64 %64, %63
  store i64 %65, i64* %53, align 8
  %66 = icmp eq %union.large_pool_struct* %57, null
  br i1 %66, label %._crit_edge10.loopexit, label %54

._crit_edge10.loopexit:                           ; preds = %54
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %48
  %67 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %5, i64 0, i32 1, i64 %49
  %68 = load %union.small_pool_struct*, %union.small_pool_struct** %67, align 8
  store %union.small_pool_struct* null, %union.small_pool_struct** %67, align 8
  %69 = icmp eq %union.small_pool_struct* %68, null
  br i1 %69, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge10
  %70 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %5, i64 0, i32 5
  br label %71

; <label>:71:                                     ; preds = %.lr.ph, %71
  %.in6 = phi %union.small_pool_struct* [ %68, %.lr.ph ], [ %74, %71 ]
  %72 = bitcast %union.small_pool_struct* %.in6 to i8*
  %73 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.in6, i64 0, i32 0, i32 0
  %74 = load %union.small_pool_struct*, %union.small_pool_struct** %73, align 8
  %75 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.in6, i64 0, i32 0, i32 1
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %.in6, i64 0, i32 0, i32 2
  %78 = load i64, i64* %77, align 8
  %79 = add i64 %76, 24
  %80 = add i64 %79, %78
  tail call void @jpeg_free_small(%struct.jpeg_common_struct* %0, i8* %72, i64 %80) #5
  %81 = load i64, i64* %70, align 8
  %82 = sub i64 %81, %80
  store i64 %82, i64* %70, align 8
  %83 = icmp eq %union.small_pool_struct* %74, null
  br i1 %83, label %._crit_edge.loopexit, label %71

._crit_edge.loopexit:                             ; preds = %71
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge10
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
declare i8* @getenv(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @out_of_memory(%struct.jpeg_common_struct*, i32) #0 {
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

declare i8* @jpeg_get_large(%struct.jpeg_common_struct*, i64) #1

declare i64 @jpeg_mem_available(%struct.jpeg_common_struct*, i64, i64, i64) #1

declare void @jpeg_open_backing_store(%struct.jpeg_common_struct*, %struct.backing_store_struct*, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal void @do_sarray_io(%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32) #0 {
  %4 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 6
  %8 = load i32, i32* %7, align 4
  %9 = zext i32 %8 to i64
  %10 = mul nuw nsw i64 %9, %6
  %11 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 5
  %12 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 4
  %13 = load i32, i32* %12, align 4
  %14 = zext i32 %13 to i64
  %15 = icmp eq i32 %13, 0
  br i1 %15, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %3
  %16 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 7
  %17 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 1
  %18 = icmp eq i32 %2, 0
  %19 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 12
  %20 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %19, i64 0, i32 0
  %21 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 0
  %22 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 12, i32 1
  %23 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %1, i64 0, i32 0
  br i1 %18, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %42
  %24 = phi i64 [ %53, %42 ], [ %14, %.lr.ph.split.us.preheader ]
  %.04.us = phi i64 [ %51, %42 ], [ 0, %.lr.ph.split.us.preheader ]
  %.013.us = phi i64 [ %48, %42 ], [ %10, %.lr.ph.split.us.preheader ]
  %25 = load i32, i32* %11, align 8
  %26 = zext i32 %25 to i64
  %27 = sub nsw i64 %24, %.04.us
  %28 = icmp slt i64 %26, %27
  %..us = select i1 %28, i64 %26, i64 %27
  %29 = load i32, i32* %7, align 4
  %30 = zext i32 %29 to i64
  %31 = add nsw i64 %30, %.04.us
  %32 = load i32, i32* %16, align 8
  %33 = zext i32 %32 to i64
  %34 = sub nsw i64 %33, %31
  %35 = icmp slt i64 %..us, %34
  %36 = select i1 %35, i64 %..us, i64 %34
  %37 = load i32, i32* %17, align 8
  %38 = zext i32 %37 to i64
  %39 = sub nsw i64 %38, %31
  %40 = icmp slt i64 %36, %39
  %.2.us = select i1 %40, i64 %36, i64 %39
  %41 = icmp slt i64 %.2.us, 1
  br i1 %41, label %.loopexit.loopexit, label %42

; <label>:42:                                     ; preds = %.lr.ph.split.us
  %43 = mul nsw i64 %.2.us, %6
  %44 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %20, align 8
  %45 = load i8**, i8*** %21, align 8
  %46 = getelementptr inbounds i8*, i8** %45, i64 %.04.us
  %47 = load i8*, i8** %46, align 8
  tail call void %44(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* nonnull %19, i8* %47, i64 %.013.us, i64 %43) #5
  %48 = add nsw i64 %43, %.013.us
  %49 = load i32, i32* %11, align 8
  %50 = zext i32 %49 to i64
  %51 = add nsw i64 %50, %.04.us
  %52 = load i32, i32* %12, align 4
  %53 = zext i32 %52 to i64
  %54 = icmp sgt i64 %53, %51
  br i1 %54, label %.lr.ph.split.us, label %.loopexit.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %73
  %55 = phi i64 [ %84, %73 ], [ %14, %.lr.ph.split.preheader ]
  %.04 = phi i64 [ %82, %73 ], [ 0, %.lr.ph.split.preheader ]
  %.013 = phi i64 [ %79, %73 ], [ %10, %.lr.ph.split.preheader ]
  %56 = load i32, i32* %11, align 8
  %57 = zext i32 %56 to i64
  %58 = sub nsw i64 %55, %.04
  %59 = icmp slt i64 %57, %58
  %. = select i1 %59, i64 %57, i64 %58
  %60 = load i32, i32* %7, align 4
  %61 = zext i32 %60 to i64
  %62 = add nsw i64 %61, %.04
  %63 = load i32, i32* %16, align 8
  %64 = zext i32 %63 to i64
  %65 = sub nsw i64 %64, %62
  %66 = icmp slt i64 %., %65
  %67 = select i1 %66, i64 %., i64 %65
  %68 = load i32, i32* %17, align 8
  %69 = zext i32 %68 to i64
  %70 = sub nsw i64 %69, %62
  %71 = icmp slt i64 %67, %70
  %.2 = select i1 %71, i64 %67, i64 %70
  %72 = icmp slt i64 %.2, 1
  br i1 %72, label %.loopexit.loopexit9, label %73

; <label>:73:                                     ; preds = %.lr.ph.split
  %74 = mul nsw i64 %.2, %6
  %75 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %22, align 8
  %76 = load i8**, i8*** %23, align 8
  %77 = getelementptr inbounds i8*, i8** %76, i64 %.04
  %78 = load i8*, i8** %77, align 8
  tail call void %75(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* nonnull %19, i8* %78, i64 %.013, i64 %74) #5
  %79 = add nsw i64 %74, %.013
  %80 = load i32, i32* %11, align 8
  %81 = zext i32 %80 to i64
  %82 = add nsw i64 %81, %.04
  %83 = load i32, i32* %12, align 4
  %84 = zext i32 %83 to i64
  %85 = icmp sgt i64 %84, %82
  br i1 %85, label %.lr.ph.split, label %.loopexit.loopexit9

.loopexit.loopexit:                               ; preds = %42, %.lr.ph.split.us
  br label %.loopexit

.loopexit.loopexit9:                              ; preds = %73, %.lr.ph.split
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit9, %.loopexit.loopexit, %3
  ret void
}

declare void @jzero_far(i8*, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal void @do_barray_io(%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32) #0 {
  %4 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = zext i32 %5 to i64
  %7 = shl nuw nsw i64 %6, 7
  %8 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 6
  %9 = load i32, i32* %8, align 4
  %10 = zext i32 %9 to i64
  %11 = mul nsw i64 %10, %7
  %12 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 5
  %13 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 4
  %14 = load i32, i32* %13, align 4
  %15 = zext i32 %14 to i64
  %16 = icmp eq i32 %14, 0
  br i1 %16, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %3
  %17 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 7
  %18 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 1
  %19 = icmp eq i32 %2, 0
  %20 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 12
  %21 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %20, i64 0, i32 0
  %22 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 0
  %23 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 12, i32 1
  %24 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %1, i64 0, i32 0
  br i1 %19, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %43
  %25 = phi i64 [ %55, %43 ], [ %15, %.lr.ph.split.us.preheader ]
  %.04.us = phi i64 [ %53, %43 ], [ 0, %.lr.ph.split.us.preheader ]
  %.013.us = phi i64 [ %50, %43 ], [ %11, %.lr.ph.split.us.preheader ]
  %26 = load i32, i32* %12, align 8
  %27 = zext i32 %26 to i64
  %28 = sub nsw i64 %25, %.04.us
  %29 = icmp slt i64 %27, %28
  %..us = select i1 %29, i64 %27, i64 %28
  %30 = load i32, i32* %8, align 4
  %31 = zext i32 %30 to i64
  %32 = add nsw i64 %31, %.04.us
  %33 = load i32, i32* %17, align 8
  %34 = zext i32 %33 to i64
  %35 = sub nsw i64 %34, %32
  %36 = icmp slt i64 %..us, %35
  %37 = select i1 %36, i64 %..us, i64 %35
  %38 = load i32, i32* %18, align 8
  %39 = zext i32 %38 to i64
  %40 = sub nsw i64 %39, %32
  %41 = icmp slt i64 %37, %40
  %.2.us = select i1 %41, i64 %37, i64 %40
  %42 = icmp slt i64 %.2.us, 1
  br i1 %42, label %.loopexit.loopexit, label %43

; <label>:43:                                     ; preds = %.lr.ph.split.us
  %44 = mul nsw i64 %.2.us, %7
  %45 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %21, align 8
  %46 = load [64 x i16]**, [64 x i16]*** %22, align 8
  %47 = getelementptr inbounds [64 x i16]*, [64 x i16]** %46, i64 %.04.us
  %48 = bitcast [64 x i16]** %47 to i8**
  %49 = load i8*, i8** %48, align 8
  tail call void %45(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* nonnull %20, i8* %49, i64 %.013.us, i64 %44) #5
  %50 = add nsw i64 %44, %.013.us
  %51 = load i32, i32* %12, align 8
  %52 = zext i32 %51 to i64
  %53 = add nsw i64 %52, %.04.us
  %54 = load i32, i32* %13, align 4
  %55 = zext i32 %54 to i64
  %56 = icmp sgt i64 %55, %53
  br i1 %56, label %.lr.ph.split.us, label %.loopexit.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %75
  %57 = phi i64 [ %87, %75 ], [ %15, %.lr.ph.split.preheader ]
  %.04 = phi i64 [ %85, %75 ], [ 0, %.lr.ph.split.preheader ]
  %.013 = phi i64 [ %82, %75 ], [ %11, %.lr.ph.split.preheader ]
  %58 = load i32, i32* %12, align 8
  %59 = zext i32 %58 to i64
  %60 = sub nsw i64 %57, %.04
  %61 = icmp slt i64 %59, %60
  %. = select i1 %61, i64 %59, i64 %60
  %62 = load i32, i32* %8, align 4
  %63 = zext i32 %62 to i64
  %64 = add nsw i64 %63, %.04
  %65 = load i32, i32* %17, align 8
  %66 = zext i32 %65 to i64
  %67 = sub nsw i64 %66, %64
  %68 = icmp slt i64 %., %67
  %69 = select i1 %68, i64 %., i64 %67
  %70 = load i32, i32* %18, align 8
  %71 = zext i32 %70 to i64
  %72 = sub nsw i64 %71, %64
  %73 = icmp slt i64 %69, %72
  %.2 = select i1 %73, i64 %69, i64 %72
  %74 = icmp slt i64 %.2, 1
  br i1 %74, label %.loopexit.loopexit9, label %75

; <label>:75:                                     ; preds = %.lr.ph.split
  %76 = mul nsw i64 %.2, %7
  %77 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %23, align 8
  %78 = load [64 x i16]**, [64 x i16]*** %24, align 8
  %79 = getelementptr inbounds [64 x i16]*, [64 x i16]** %78, i64 %.04
  %80 = bitcast [64 x i16]** %79 to i8**
  %81 = load i8*, i8** %80, align 8
  tail call void %77(%struct.jpeg_common_struct* %0, %struct.backing_store_struct* nonnull %20, i8* %81, i64 %.013, i64 %76) #5
  %82 = add nsw i64 %76, %.013
  %83 = load i32, i32* %12, align 8
  %84 = zext i32 %83 to i64
  %85 = add nsw i64 %84, %.04
  %86 = load i32, i32* %13, align 4
  %87 = zext i32 %86 to i64
  %88 = icmp sgt i64 %87, %85
  br i1 %88, label %.lr.ph.split, label %.loopexit.loopexit9

.loopexit.loopexit:                               ; preds = %43, %.lr.ph.split.us
  br label %.loopexit

.loopexit.loopexit9:                              ; preds = %75, %.lr.ph.split
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit9, %.loopexit.loopexit, %3
  ret void
}

declare void @jpeg_free_large(%struct.jpeg_common_struct*, i8*, i64) #1

declare void @jpeg_free_small(%struct.jpeg_common_struct*, i8*, i64) #1

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
