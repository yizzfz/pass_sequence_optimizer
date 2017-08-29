; ModuleID = 'rdswitch.ll'
source_filename = "rdswitch.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
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
%struct.jpeg_comp_master = type opaque
%struct.jpeg_c_main_controller = type opaque
%struct.jpeg_c_prep_controller = type opaque
%struct.jpeg_c_coef_controller = type opaque
%struct.jpeg_marker_writer = type opaque
%struct.jpeg_color_converter = type opaque
%struct.jpeg_downsampler = type opaque
%struct.jpeg_forward_dct = type opaque
%struct.jpeg_entropy_encoder = type opaque

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [26 x i8] c"Can't open table file %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"Too many tables in file %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"Invalid table data in file %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [29 x i8] c"Non-numeric data in file %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"Can't open scan definition file %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [35 x i8] c"Too many scans defined in file %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [44 x i8] c"Too many components in one scan in file %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [38 x i8] c"Invalid scan entry format in file %s\0A\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"%d%c\00", align 1
@.str.10 = private unnamed_addr constant [45 x i8] c"JPEG quantization tables are numbered 0..%d\0A\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"%d%c%d%c\00", align 1
@.str.12 = private unnamed_addr constant [36 x i8] c"JPEG sampling factors must be 1..4\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @read_quant_tables(%struct.jpeg_compress_struct*, i8*, i32, i32) local_unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca [64 x i32], align 16
  %8 = tail call %struct._IO_FILE* @fopen(i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %9 = icmp eq %struct._IO_FILE* %8, null
  br i1 %9, label %14, label %.preheader

.preheader:                                       ; preds = %4
  %10 = call fastcc i32 @read_text_integer(%struct._IO_FILE* nonnull %8, i64* nonnull %6, i32* nonnull %5)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %12 = getelementptr inbounds [64 x i32], [64 x i32]* %7, i64 0, i64 0
  %13 = getelementptr inbounds [64 x i32], [64 x i32]* %7, i64 0, i64 0
  br label %.lr.ph

; <label>:14:                                     ; preds = %4
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0), i8* %1) #6
  br label %49

.lr.ph:                                           ; preds = %.lr.ph.preheader, %37
  %.024 = phi i32 [ %38, %37 ], [ 0, %.lr.ph.preheader ]
  %17 = icmp sgt i32 %.024, 3
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %.lr.ph
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* %1) #6
  %21 = call i32 @fclose(%struct._IO_FILE* nonnull %8)
  br label %49

; <label>:22:                                     ; preds = %.lr.ph
  %23 = load i64, i64* %6, align 8
  %24 = trunc i64 %23 to i32
  store i32 %24, i32* %12, align 16
  br label %25

; <label>:25:                                     ; preds = %22, %32
  %indvars.iv = phi i64 [ 1, %22 ], [ %indvars.iv.next, %32 ]
  %26 = call fastcc i32 @read_text_integer(%struct._IO_FILE* nonnull %8, i64* nonnull %6, i32* nonnull %5)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %25
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3, i64 0, i64 0), i8* %1) #6
  %31 = call i32 @fclose(%struct._IO_FILE* nonnull %8)
  br label %49

; <label>:32:                                     ; preds = %25
  %33 = load i64, i64* %6, align 8
  %34 = trunc i64 %33 to i32
  %35 = getelementptr inbounds [64 x i32], [64 x i32]* %7, i64 0, i64 %indvars.iv
  store i32 %34, i32* %35, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = icmp slt i64 %indvars.iv.next, 64
  br i1 %36, label %25, label %37

; <label>:37:                                     ; preds = %32
  call void @jpeg_add_quant_table(%struct.jpeg_compress_struct* %0, i32 %.024, i32* nonnull %13, i32 %2, i32 %3) #5
  %38 = add nuw nsw i32 %.024, 1
  %39 = call fastcc i32 @read_text_integer(%struct._IO_FILE* nonnull %8, i64* nonnull %6, i32* nonnull %5)
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %37
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %41 = load i32, i32* %5, align 4
  %42 = icmp eq i32 %41, -1
  br i1 %42, label %47, label %43

; <label>:43:                                     ; preds = %._crit_edge
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i64 0, i64 0), i8* %1) #6
  %46 = call i32 @fclose(%struct._IO_FILE* nonnull %8)
  br label %49

; <label>:47:                                     ; preds = %._crit_edge
  %48 = call i32 @fclose(%struct._IO_FILE* nonnull %8)
  br label %49

; <label>:49:                                     ; preds = %47, %43, %28, %18, %14
  %.0 = phi i32 [ 0, %14 ], [ 0, %18 ], [ 0, %28 ], [ 0, %43 ], [ 1, %47 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @read_text_integer(%struct._IO_FILE* nocapture, i64* nocapture, i32* nocapture) unnamed_addr #0 {
  br label %4

; <label>:4:                                      ; preds = %7, %3
  %5 = tail call fastcc i32 @text_getc(%struct._IO_FILE* %0)
  %6 = icmp eq i32 %5, -1
  br i1 %6, label %.loopexit.loopexit, label %7

; <label>:7:                                      ; preds = %4
  %8 = tail call i16** @__ctype_b_loc() #7
  %9 = load i16*, i16** %8, align 8
  %10 = sext i32 %5 to i64
  %11 = getelementptr inbounds i16, i16* %9, i64 %10
  %12 = load i16, i16* %11, align 2
  %13 = and i16 %12, 8192
  %14 = icmp eq i16 %13, 0
  br i1 %14, label %15, label %4

; <label>:15:                                     ; preds = %7
  %16 = and i16 %12, 2048
  %17 = icmp eq i16 %16, 0
  br i1 %17, label %.loopexit, label %18

; <label>:18:                                     ; preds = %15
  %19 = add nsw i32 %5, -48
  %20 = sext i32 %19 to i64
  %21 = tail call fastcc i32 @text_getc(%struct._IO_FILE* %0)
  %22 = icmp eq i32 %21, -1
  br i1 %22, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %18
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %30
  %23 = phi i32 [ %35, %30 ], [ %21, %.lr.ph.preheader ]
  %.016 = phi i64 [ %34, %30 ], [ %20, %.lr.ph.preheader ]
  %24 = load i16*, i16** %8, align 8
  %25 = sext i32 %23 to i64
  %26 = getelementptr inbounds i16, i16* %24, i64 %25
  %27 = load i16, i16* %26, align 2
  %28 = and i16 %27, 2048
  %29 = icmp eq i16 %28, 0
  br i1 %29, label %._crit_edge.loopexit, label %30

; <label>:30:                                     ; preds = %.lr.ph
  %31 = mul nsw i64 %.016, 10
  %32 = add nsw i32 %23, -48
  %33 = sext i32 %32 to i64
  %34 = add nsw i64 %33, %31
  %35 = tail call fastcc i32 @text_getc(%struct._IO_FILE* %0)
  %36 = icmp eq i32 %35, -1
  br i1 %36, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph, %30
  %.01.lcssa.ph = phi i64 [ %.016, %.lr.ph ], [ %34, %30 ]
  %.lcssa.ph = phi i32 [ %23, %.lr.ph ], [ -1, %30 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %18
  %.01.lcssa = phi i64 [ %20, %18 ], [ %.01.lcssa.ph, %._crit_edge.loopexit ]
  %.lcssa = phi i32 [ -1, %18 ], [ %.lcssa.ph, %._crit_edge.loopexit ]
  store i64 %.01.lcssa, i64* %1, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %4
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %15, %._crit_edge
  %.sink = phi i32 [ %.lcssa, %._crit_edge ], [ %5, %15 ], [ -1, %.loopexit.loopexit ]
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %15 ], [ 0, %.loopexit.loopexit ]
  store i32 %.sink, i32* %2, align 4
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #1

declare void @jpeg_add_quant_table(%struct.jpeg_compress_struct*, i32, i32*, i32, i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define i32 @read_scan_script(%struct.jpeg_compress_struct*, i8*) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca [100 x %struct.jpeg_scan_info], align 16
  %6 = tail call %struct._IO_FILE* @fopen(i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %7 = icmp eq %struct._IO_FILE* %6, null
  br i1 %7, label %8, label %11

; <label>:8:                                      ; preds = %2
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0), i8* %1) #6
  br label %112

; <label>:11:                                     ; preds = %2
  %12 = call fastcc i32 @read_scan_integer(%struct._IO_FILE* nonnull %6, i64* nonnull %4, i32* nonnull %3)
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %._crit_edge24, label %.lr.ph23.preheader

.lr.ph23.preheader:                               ; preds = %11
  %14 = getelementptr inbounds [100 x %struct.jpeg_scan_info], [100 x %struct.jpeg_scan_info]* %5, i64 0, i64 0
  br label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph23.preheader, %84
  %.0121 = phi %struct.jpeg_scan_info* [ %85, %84 ], [ %14, %.lr.ph23.preheader ]
  %.0320 = phi i32 [ %86, %84 ], [ 0, %.lr.ph23.preheader ]
  %15 = icmp sgt i32 %.0320, 99
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %.lr.ph23
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.6, i64 0, i64 0), i8* %1) #6
  %19 = tail call i32 @fclose(%struct._IO_FILE* nonnull %6)
  br label %112

; <label>:20:                                     ; preds = %.lr.ph23
  %21 = load i64, i64* %4, align 8
  %22 = trunc i64 %21 to i32
  %23 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0121, i64 0, i32 1, i64 0
  store i32 %22, i32* %23, align 4
  %24 = load i32, i32* %3, align 4
  %25 = icmp eq i32 %24, 32
  br i1 %25, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %20
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %34
  %indvars.iv = phi i64 [ %indvars.iv.next, %34 ], [ 1, %.lr.ph.preheader ]
  %26 = icmp sgt i64 %indvars.iv, 3
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %.lr.ph
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.7, i64 0, i64 0), i8* %1) #6
  %30 = tail call i32 @fclose(%struct._IO_FILE* nonnull %6)
  br label %112

; <label>:31:                                     ; preds = %.lr.ph
  %32 = call fastcc i32 @read_scan_integer(%struct._IO_FILE* nonnull %6, i64* nonnull %4, i32* nonnull %3)
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %.loopexit.loopexit, label %34

; <label>:34:                                     ; preds = %31
  %35 = load i64, i64* %4, align 8
  %36 = trunc i64 %35 to i32
  %37 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0121, i64 0, i32 1, i64 %indvars.iv
  store i32 %36, i32* %37, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = load i32, i32* %3, align 4
  %39 = icmp eq i32 %38, 32
  br i1 %39, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %34
  %40 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %20
  %.02.lcssa = phi i32 [ 1, %20 ], [ %40, %._crit_edge.loopexit ]
  %41 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0121, i64 0, i32 0
  store i32 %.02.lcssa, i32* %41, align 4
  %42 = load i32, i32* %3, align 4
  %43 = icmp eq i32 %42, 58
  br i1 %43, label %44, label %74

; <label>:44:                                     ; preds = %._crit_edge
  %45 = call fastcc i32 @read_scan_integer(%struct._IO_FILE* nonnull %6, i64* nonnull %4, i32* nonnull %3)
  %46 = icmp ne i32 %45, 0
  %47 = load i32, i32* %3, align 4
  %48 = icmp eq i32 %47, 32
  %or.cond = and i1 %46, %48
  br i1 %or.cond, label %49, label %.loopexit.loopexit30

; <label>:49:                                     ; preds = %44
  %50 = load i64, i64* %4, align 8
  %51 = trunc i64 %50 to i32
  %52 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0121, i64 0, i32 2
  store i32 %51, i32* %52, align 4
  %53 = call fastcc i32 @read_scan_integer(%struct._IO_FILE* nonnull %6, i64* nonnull %4, i32* nonnull %3)
  %54 = icmp ne i32 %53, 0
  %55 = load i32, i32* %3, align 4
  %56 = icmp eq i32 %55, 32
  %or.cond6 = and i1 %54, %56
  br i1 %or.cond6, label %57, label %.loopexit.loopexit30

; <label>:57:                                     ; preds = %49
  %58 = load i64, i64* %4, align 8
  %59 = trunc i64 %58 to i32
  %60 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0121, i64 0, i32 3
  store i32 %59, i32* %60, align 4
  %61 = call fastcc i32 @read_scan_integer(%struct._IO_FILE* nonnull %6, i64* nonnull %4, i32* nonnull %3)
  %62 = icmp ne i32 %61, 0
  %63 = load i32, i32* %3, align 4
  %64 = icmp eq i32 %63, 32
  %or.cond8 = and i1 %62, %64
  br i1 %or.cond8, label %65, label %.loopexit.loopexit30

; <label>:65:                                     ; preds = %57
  %66 = load i64, i64* %4, align 8
  %67 = trunc i64 %66 to i32
  %68 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0121, i64 0, i32 4
  store i32 %67, i32* %68, align 4
  %69 = call fastcc i32 @read_scan_integer(%struct._IO_FILE* nonnull %6, i64* nonnull %4, i32* nonnull %3)
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %.loopexit.loopexit30, label %71

; <label>:71:                                     ; preds = %65
  %72 = load i64, i64* %4, align 8
  %73 = trunc i64 %72 to i32
  br label %78

; <label>:74:                                     ; preds = %._crit_edge
  %75 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0121, i64 0, i32 2
  store i32 0, i32* %75, align 4
  %76 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0121, i64 0, i32 3
  store i32 63, i32* %76, align 4
  %77 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0121, i64 0, i32 4
  store i32 0, i32* %77, align 4
  br label %78

; <label>:78:                                     ; preds = %74, %71
  %.sink = phi i32 [ 0, %74 ], [ %73, %71 ]
  %79 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0121, i64 0, i32 5
  store i32 %.sink, i32* %79, align 4
  %80 = load i32, i32* %3, align 4
  switch i32 %80, label %.loopexit.loopexit30 [
    i32 -1, label %84
    i32 59, label %84
  ]

.loopexit.loopexit:                               ; preds = %31
  br label %.loopexit

.loopexit.loopexit30:                             ; preds = %44, %49, %57, %65, %78
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit30, %.loopexit.loopexit
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %82 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.8, i64 0, i64 0), i8* %1) #6
  %83 = tail call i32 @fclose(%struct._IO_FILE* nonnull %6)
  br label %112

; <label>:84:                                     ; preds = %78, %78
  %85 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0121, i64 1
  %86 = add nuw nsw i32 %.0320, 1
  %87 = call fastcc i32 @read_scan_integer(%struct._IO_FILE* nonnull %6, i64* nonnull %4, i32* nonnull %3)
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %._crit_edge24.loopexit, label %.lr.ph23

._crit_edge24.loopexit:                           ; preds = %84
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %11
  %.03.lcssa = phi i32 [ 0, %11 ], [ %86, %._crit_edge24.loopexit ]
  %89 = load i32, i32* %3, align 4
  %90 = icmp eq i32 %89, -1
  br i1 %90, label %95, label %91

; <label>:91:                                     ; preds = %._crit_edge24
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %93 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %92, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i64 0, i64 0), i8* %1) #6
  %94 = tail call i32 @fclose(%struct._IO_FILE* nonnull %6)
  br label %112

; <label>:95:                                     ; preds = %._crit_edge24
  %96 = icmp sgt i32 %.03.lcssa, 0
  br i1 %96, label %97, label %110

; <label>:97:                                     ; preds = %95
  %98 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %99 = bitcast %struct.jpeg_memory_mgr** %98 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %100 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %99, align 8
  %101 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %100, align 8
  %102 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %103 = sext i32 %.03.lcssa to i64
  %104 = mul nsw i64 %103, 36
  %105 = tail call i8* %101(%struct.jpeg_common_struct* %102, i32 1, i64 %104) #5
  %106 = bitcast [100 x %struct.jpeg_scan_info]* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %105, i8* nonnull %106, i64 %104, i32 1, i1 false)
  %107 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 22
  %108 = bitcast %struct.jpeg_scan_info** %107 to i8**
  store i8* %105, i8** %108, align 8
  %109 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 21
  store i32 %.03.lcssa, i32* %109, align 8
  br label %110

; <label>:110:                                    ; preds = %97, %95
  %111 = tail call i32 @fclose(%struct._IO_FILE* nonnull %6)
  br label %112

; <label>:112:                                    ; preds = %110, %91, %.loopexit, %27, %16, %8
  %.0 = phi i32 [ 0, %8 ], [ 0, %16 ], [ 0, %27 ], [ 0, %.loopexit ], [ 0, %91 ], [ 1, %110 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @read_scan_integer(%struct._IO_FILE* nocapture, i64* nocapture, i32* nocapture) unnamed_addr #0 {
  %4 = tail call fastcc i32 @read_text_integer(%struct._IO_FILE* %0, i64* %1, i32* %2)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %33, label %6

; <label>:6:                                      ; preds = %3
  %7 = load i32, i32* %2, align 4
  %8 = icmp eq i32 %7, -1
  br i1 %8, label %.critedge, label %.lr.ph

.lr.ph:                                           ; preds = %6
  %9 = tail call i16** @__ctype_b_loc() #7
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %17
  %.012 = phi i32 [ %7, %.lr.ph ], [ %18, %17 ]
  %11 = load i16*, i16** %9, align 8
  %12 = sext i32 %.012 to i64
  %13 = getelementptr inbounds i16, i16* %11, i64 %12
  %14 = load i16, i16* %13, align 2
  %15 = and i16 %14, 8192
  %16 = icmp eq i16 %15, 0
  br i1 %16, label %.critedge.loopexit, label %17

; <label>:17:                                     ; preds = %10
  %18 = tail call fastcc i32 @text_getc(%struct._IO_FILE* %0)
  %19 = icmp eq i32 %18, -1
  br i1 %19, label %.critedge.loopexit, label %10

.critedge.loopexit:                               ; preds = %10, %17
  %.01.lcssa.ph = phi i32 [ %.012, %10 ], [ -1, %17 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %6
  %.01.lcssa = phi i32 [ -1, %6 ], [ %.01.lcssa.ph, %.critedge.loopexit ]
  %20 = tail call i16** @__ctype_b_loc() #7
  %21 = load i16*, i16** %20, align 8
  %22 = sext i32 %.01.lcssa to i64
  %23 = getelementptr inbounds i16, i16* %21, i64 %22
  %24 = load i16, i16* %23, align 2
  %25 = and i16 %24, 2048
  %26 = icmp eq i16 %25, 0
  br i1 %26, label %30, label %27

; <label>:27:                                     ; preds = %.critedge
  %28 = tail call i32 @ungetc(i32 %.01.lcssa, %struct._IO_FILE* %0)
  %29 = icmp eq i32 %28, -1
  br i1 %29, label %33, label %32

; <label>:30:                                     ; preds = %.critedge
  switch i32 %.01.lcssa, label %31 [
    i32 -1, label %32
    i32 59, label %32
    i32 58, label %32
  ]

; <label>:31:                                     ; preds = %30
  br label %32

; <label>:32:                                     ; preds = %31, %30, %30, %30, %27
  %.2 = phi i32 [ 32, %27 ], [ 32, %31 ], [ %.01.lcssa, %30 ], [ %.01.lcssa, %30 ], [ %.01.lcssa, %30 ]
  store i32 %.2, i32* %2, align 4
  br label %33

; <label>:33:                                     ; preds = %27, %3, %32
  %.0 = phi i32 [ 1, %32 ], [ 0, %3 ], [ 0, %27 ]
  ret i32 %.0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: noinline nounwind uwtable
define i32 @set_quant_slots(%struct.jpeg_compress_struct* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  store i32 0, i32* %3, align 4
  %sunkaddr17 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 80
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to %struct.jpeg_component_info**
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr15 = add i64 %sunkaddr, 80
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to %struct.jpeg_component_info**
  br label %5

; <label>:5:                                      ; preds = %2, %.thread
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %.thread ]
  %.028 = phi i8* [ %1, %2 ], [ %.3, %.thread ]
  %6 = load i8, i8* %.028, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %25, label %8

; <label>:8:                                      ; preds = %5
  store i8 44, i8* %4, align 1
  %9 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* nonnull %.028, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i64 0, i64 0), i32* nonnull %3, i8* nonnull %4) #5
  %10 = icmp sgt i32 %9, 0
  %11 = load i8, i8* %4, align 1
  %12 = icmp eq i8 %11, 44
  %or.cond5 = and i1 %10, %12
  br i1 %or.cond5, label %13, label %.loopexit.loopexit

; <label>:13:                                     ; preds = %8
  %14 = load i32, i32* %3, align 4
  %15 = icmp ugt i32 %14, 3
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %13
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.10, i64 0, i64 0), i32 3) #6
  br label %.loopexit

; <label>:19:                                     ; preds = %13
  %20 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr16, align 8
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %20, i64 %indvars.iv, i32 4
  store i32 %14, i32* %21, align 8
  br label %22

; <label>:22:                                     ; preds = %22, %19
  %.1 = phi i8* [ %.028, %19 ], [ %24, %22 ]
  %23 = load i8, i8* %.1, align 1
  %24 = getelementptr inbounds i8, i8* %.1, i64 1
  switch i8 %23, label %22 [
    i8 0, label %.thread.loopexit
    i8 44, label %.thread.loopexit20
  ]

; <label>:25:                                     ; preds = %5
  %26 = load i32, i32* %3, align 4
  %27 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr19, align 8
  %28 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 %indvars.iv, i32 4
  store i32 %26, i32* %28, align 8
  br label %.thread

.thread.loopexit20:                               ; preds = %22
  br label %.thread

.thread.loopexit:                                 ; preds = %22
  br label %.thread

.thread:                                          ; preds = %.thread.loopexit, %.thread.loopexit20, %25
  %.3 = phi i8* [ %.028, %25 ], [ %24, %.thread.loopexit20 ], [ %.1, %.thread.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = icmp slt i64 %indvars.iv.next, 10
  br i1 %29, label %5, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.thread, %8
  %.0.ph = phi i32 [ 1, %.thread ], [ 0, %8 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %16
  %.0 = phi i32 [ 0, %16 ], [ %.0.ph, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @set_sample_factors(%struct.jpeg_compress_struct* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %sunkaddr24 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr25 = add i64 %sunkaddr24, 80
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to %struct.jpeg_component_info**
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr, 80
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to %struct.jpeg_component_info**
  br label %7

; <label>:7:                                      ; preds = %2, %.thread
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %.thread ]
  %.0215 = phi i8* [ %1, %2 ], [ %.3, %.thread ]
  %8 = load i8, i8* %.0215, align 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %36, label %10

; <label>:10:                                     ; preds = %7
  store i8 44, i8* %6, align 1
  %11 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* nonnull %.0215, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11, i64 0, i64 0), i32* nonnull %3, i8* nonnull %5, i32* nonnull %4, i8* nonnull %6) #5
  %12 = icmp slt i32 %11, 3
  br i1 %12, label %.loopexit.loopexit, label %13

; <label>:13:                                     ; preds = %10
  %14 = load i8, i8* %5, align 1
  %15 = or i8 %14, 32
  %16 = icmp eq i8 %15, 120
  %17 = load i8, i8* %6, align 1
  %18 = icmp eq i8 %17, 44
  %or.cond5 = and i1 %16, %18
  br i1 %or.cond5, label %19, label %.loopexit.loopexit

; <label>:19:                                     ; preds = %13
  %20 = load i32, i32* %3, align 4
  %.off = add i32 %20, -1
  %21 = load i32, i32* %4, align 4
  %.off12 = add i32 %21, -1
  %22 = or i32 %.off12, %.off
  %23 = icmp ugt i32 %22, 3
  br i1 %23, label %24, label %27

; <label>:24:                                     ; preds = %19
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i64 @fwrite(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.12, i64 0, i64 0), i64 35, i64 1, %struct._IO_FILE* %25) #6
  br label %.loopexit

; <label>:27:                                     ; preds = %19
  %28 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr23, align 8
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i64 %indvars.iv, i32 2
  store i32 %20, i32* %29, align 8
  %30 = load i32, i32* %4, align 4
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr23, align 8
  %32 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i64 %indvars.iv, i32 3
  store i32 %30, i32* %32, align 4
  br label %33

; <label>:33:                                     ; preds = %33, %27
  %.1 = phi i8* [ %.0215, %27 ], [ %35, %33 ]
  %34 = load i8, i8* %.1, align 1
  %35 = getelementptr inbounds i8, i8* %.1, i64 1
  switch i8 %34, label %33 [
    i8 0, label %.thread.loopexit
    i8 44, label %.thread.loopexit27
  ]

; <label>:36:                                     ; preds = %7
  %37 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr26, align 8
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %37, i64 %indvars.iv, i32 2
  store i32 1, i32* %38, align 8
  %39 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr26, align 8
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 %indvars.iv, i32 3
  store i32 1, i32* %40, align 4
  br label %.thread

.thread.loopexit27:                               ; preds = %33
  br label %.thread

.thread.loopexit:                                 ; preds = %33
  br label %.thread

.thread:                                          ; preds = %.thread.loopexit, %.thread.loopexit27, %36
  %.3 = phi i8* [ %.0215, %36 ], [ %35, %.thread.loopexit27 ], [ %.1, %.thread.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = icmp slt i64 %indvars.iv.next, 10
  br i1 %41, label %7, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %10, %13, %.thread
  %.0.ph = phi i32 [ 1, %.thread ], [ 0, %13 ], [ 0, %10 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %24
  %.0 = phi i32 [ 0, %24 ], [ %.0.ph, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @text_getc(%struct._IO_FILE* nocapture) unnamed_addr #0 {
  %2 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %3 = icmp eq i32 %2, 35
  br i1 %3, label %.preheader.preheader, label %.loopexit

.preheader.preheader:                             ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %4 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  switch i32 %4, label %.preheader [
    i32 -1, label %.loopexit.loopexit
    i32 10, label %.loopexit.loopexit
  ]

.loopexit.loopexit:                               ; preds = %.preheader, %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %1
  %.0 = phi i32 [ %2, %1 ], [ %4, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @ungetc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
