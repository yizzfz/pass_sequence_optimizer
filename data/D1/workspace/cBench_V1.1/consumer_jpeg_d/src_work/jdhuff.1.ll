; ModuleID = 'jdhuff.ll'
source_filename = "jdhuff.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i16, i16, i32, i8, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
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
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.d_derived_tbl = type { [17 x i64], [18 x i64], [17 x i32], %struct.JHUFF_TBL*, [256 x i32], [256 x i8] }
%struct.bitread_working_state = type { i8*, i64, i32, i64, i32, %struct.jpeg_decompress_struct*, i32* }
%struct.huff_entropy_decoder = type { %struct.jpeg_entropy_decoder, %struct.bitread_perm_state, %struct.savable_state, i32, [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*] }
%struct.bitread_perm_state = type { i64, i32, i32 }
%struct.savable_state = type { [4 x i32] }

@extend_test = internal constant [16 x i32] [i32 0, i32 1, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 256, i32 512, i32 1024, i32 2048, i32 4096, i32 8192, i32 16384], align 16
@extend_offset = internal constant [16 x i32] [i32 0, i32 -1, i32 -3, i32 -7, i32 -15, i32 -31, i32 -63, i32 -127, i32 -255, i32 -511, i32 -1023, i32 -2047, i32 -4095, i32 -8191, i32 -16383, i32 -32767], align 16
@jpeg_natural_order = external constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct*, %struct.JHUFF_TBL*, %struct.d_derived_tbl** nocapture) #0 {
  %4 = alloca [257 x i8], align 16
  %5 = alloca [257 x i32], align 16
  %6 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %2, align 8
  %7 = icmp eq %struct.d_derived_tbl* %6, null
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %10 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %10, i64 0, i32 0
  %12 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %11, align 8
  %13 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %14 = tail call i8* %12(%struct.jpeg_common_struct* %13, i32 1, i64 1640) #2
  %15 = bitcast %struct.d_derived_tbl** %2 to i8**
  store i8* %14, i8** %15, align 8
  br label %16

; <label>:16:                                     ; preds = %8, %3
  %17 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %2, align 8
  %18 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 3
  store %struct.JHUFF_TBL* %1, %struct.JHUFF_TBL** %18, align 8
  br label %.preheader30

.preheader30:                                     ; preds = %16, %._crit_edge53
  %19 = phi i64 [ 0, %16 ], [ %46, %._crit_edge53 ]
  %.0856 = phi i32 [ 1, %16 ], [ %45, %._crit_edge53 ]
  %indvars.iv2255 = phi i64 [ 1, %16 ], [ %indvars.iv.next23, %._crit_edge53 ]
  %20 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 0, i64 %indvars.iv2255
  %21 = load i8, i8* %20, align 1
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %._crit_edge53, label %.lr.ph52

.lr.ph52:                                         ; preds = %.preheader30
  %23 = trunc i32 %.0856 to i8
  %24 = load i8, i8* %20, align 1
  %25 = zext i8 %24 to i32
  %scevgep = getelementptr [257 x i8], [257 x i8]* %4, i64 0, i64 %19
  %26 = icmp ugt i32 %25, 1
  %smax = select i1 %26, i32 %25, i32 1
  %27 = add nsw i32 %smax, -1
  %28 = zext i32 %27 to i64
  %29 = add nuw nsw i64 %28, 1
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 %23, i64 %29, i32 1, i1 false)
  %30 = zext i8 %24 to i32
  %31 = icmp ugt i32 %30, 1
  %smax63 = select i1 %31, i32 %30, i32 1
  %min.iters.check = icmp ult i32 %smax63, 4
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph52
  %n.vec = and i32 %smax63, 252
  %cmp.zero = icmp eq i32 %n.vec, 0
  %ind.end = or i32 %n.vec, 1
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %32 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %19, i32 0
  %33 = add nsw i32 %n.vec, -4
  %34 = lshr exact i32 %33, 2
  %35 = add nuw nsw i32 %34, 1
  %xtraiter152 = and i32 %35, 7
  %lcmp.mod153 = icmp eq i32 %xtraiter152, 0
  br i1 %lcmp.mod153, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i32 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %vec.phi.prol = phi <2 x i64> [ %32, %vector.body.prol.preheader ], [ %36, %vector.body.prol ]
  %vec.phi65.prol = phi <2 x i64> [ zeroinitializer, %vector.body.prol.preheader ], [ %37, %vector.body.prol ]
  %prol.iter154 = phi i32 [ %xtraiter152, %vector.body.prol.preheader ], [ %prol.iter154.sub, %vector.body.prol ]
  %36 = add nsw <2 x i64> %vec.phi.prol, <i64 1, i64 1>
  %37 = add nsw <2 x i64> %vec.phi65.prol, <i64 1, i64 1>
  %index.next.prol = add i32 %index.prol, 4
  %prol.iter154.sub = add i32 %prol.iter154, -1
  %prol.iter154.cmp = icmp eq i32 %prol.iter154.sub, 0
  br i1 %prol.iter154.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.ph, %vector.body.prol.loopexit.unr-lcssa
  %.lcssa148.unr = phi <2 x i64> [ undef, %vector.ph ], [ %36, %vector.body.prol.loopexit.unr-lcssa ]
  %.lcssa147.unr = phi <2 x i64> [ undef, %vector.ph ], [ %37, %vector.body.prol.loopexit.unr-lcssa ]
  %index.unr = phi i32 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi.unr = phi <2 x i64> [ %32, %vector.ph ], [ %36, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi65.unr = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %37, %vector.body.prol.loopexit.unr-lcssa ]
  %38 = icmp ult i32 %33, 28
  br i1 %38, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i32 [ %index.unr, %vector.ph.new ], [ %index.next.7, %vector.body ]
  %vec.phi = phi <2 x i64> [ %vec.phi.unr, %vector.ph.new ], [ %39, %vector.body ]
  %vec.phi65 = phi <2 x i64> [ %vec.phi65.unr, %vector.ph.new ], [ %40, %vector.body ]
  %39 = add nsw <2 x i64> %vec.phi, <i64 8, i64 8>
  %40 = add nsw <2 x i64> %vec.phi65, <i64 8, i64 8>
  %index.next.7 = add i32 %index, 32
  %41 = icmp eq i32 %index.next.7, %n.vec
  br i1 %41, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %.lcssa148 = phi <2 x i64> [ %.lcssa148.unr, %vector.body.prol.loopexit ], [ %39, %middle.block.unr-lcssa ]
  %.lcssa147 = phi <2 x i64> [ %.lcssa147.unr, %vector.body.prol.loopexit ], [ %40, %middle.block.unr-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa147, %.lcssa148
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx66 = add <2 x i64> %bin.rdx, %rdx.shuf
  %42 = extractelement <2 x i64> %bin.rdx66, i32 0
  %cmp.n = icmp eq i32 %smax63, %n.vec
  br i1 %cmp.n, label %._crit_edge53, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph52
  %.0651.ph = phi i32 [ 1, %min.iters.checked ], [ 1, %.lr.ph52 ], [ %ind.end, %middle.block ]
  %indvars.iv2050.ph = phi i64 [ %19, %min.iters.checked ], [ %19, %.lr.ph52 ], [ %42, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %.0651 = phi i32 [ %43, %scalar.ph ], [ %.0651.ph, %scalar.ph.preheader ]
  %indvars.iv2050 = phi i64 [ %indvars.iv.next21, %scalar.ph ], [ %indvars.iv2050.ph, %scalar.ph.preheader ]
  %indvars.iv.next21 = add nsw i64 %indvars.iv2050, 1
  %43 = add nuw nsw i32 %.0651, 1
  %44 = icmp slt i32 %.0651, %25
  br i1 %44, label %scalar.ph, label %._crit_edge53.loopexit, !llvm.loop !6

._crit_edge53.loopexit:                           ; preds = %scalar.ph
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.loopexit, %middle.block, %.preheader30
  %indvars.iv20.lcssa = phi i64 [ %19, %.preheader30 ], [ %42, %middle.block ], [ %indvars.iv.next21, %._crit_edge53.loopexit ]
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2255, 1
  %45 = add nuw nsw i32 %.0856, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 17
  %sext = shl i64 %indvars.iv20.lcssa, 32
  %46 = ashr exact i64 %sext, 32
  br i1 %exitcond24, label %47, label %.preheader30

; <label>:47:                                     ; preds = %._crit_edge53
  %48 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %46
  store i8 0, i8* %48, align 1
  %49 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 0
  %50 = load i8, i8* %49, align 16
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %.preheader.preheader, label %.preheader29.preheader

.preheader29.preheader:                           ; preds = %47
  %52 = sext i8 %50 to i32
  br label %.preheader29

.preheader29:                                     ; preds = %.preheader29.preheader, %._crit_edge45
  %53 = phi i64 [ %66, %._crit_edge45 ], [ 0, %.preheader29.preheader ]
  %.049 = phi i32 [ %64, %._crit_edge45 ], [ 0, %.preheader29.preheader ]
  %.0348 = phi i32 [ %65, %._crit_edge45 ], [ %52, %.preheader29.preheader ]
  %54 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %53
  %55 = load i8, i8* %54, align 1
  %56 = sext i8 %55 to i32
  %57 = icmp eq i32 %56, %.0348
  br i1 %57, label %.lr.ph44.preheader, label %._crit_edge45

.lr.ph44.preheader:                               ; preds = %.preheader29
  br label %.lr.ph44

.lr.ph44:                                         ; preds = %.lr.ph44.preheader, %.lr.ph44
  %.143 = phi i32 [ %59, %.lr.ph44 ], [ %.049, %.lr.ph44.preheader ]
  %indvars.iv1842 = phi i64 [ %indvars.iv.next19, %.lr.ph44 ], [ %53, %.lr.ph44.preheader ]
  %indvars.iv.next19 = add i64 %indvars.iv1842, 1
  %58 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv1842
  store i32 %.143, i32* %58, align 4
  %59 = add i32 %.143, 1
  %60 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %indvars.iv.next19
  %61 = load i8, i8* %60, align 1
  %62 = sext i8 %61 to i32
  %63 = icmp eq i32 %62, %.0348
  br i1 %63, label %.lr.ph44, label %._crit_edge45.loopexit

._crit_edge45.loopexit:                           ; preds = %.lr.ph44
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45.loopexit, %.preheader29
  %indvars.iv18.lcssa = phi i64 [ %53, %.preheader29 ], [ %indvars.iv.next19, %._crit_edge45.loopexit ]
  %.1.lcssa = phi i32 [ %.049, %.preheader29 ], [ %59, %._crit_edge45.loopexit ]
  %64 = shl i32 %.1.lcssa, 1
  %65 = add nsw i32 %.0348, 1
  %sext27 = shl i64 %indvars.iv18.lcssa, 32
  %66 = ashr exact i64 %sext27, 32
  %67 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %.preheader.preheader.loopexit, label %.preheader29

.preheader.preheader.loopexit:                    ; preds = %._crit_edge45
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %47
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %88
  %.441 = phi i32 [ %.5, %88 ], [ 0, %.preheader.preheader ]
  %indvars.iv1540 = phi i64 [ %indvars.iv.next16, %88 ], [ 1, %.preheader.preheader ]
  %70 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 0, i64 %indvars.iv1540
  %71 = load i8, i8* %70, align 1
  %72 = icmp eq i8 %71, 0
  br i1 %72, label %88, label %73

; <label>:73:                                     ; preds = %.preheader
  %74 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 2, i64 %indvars.iv1540
  store i32 %.441, i32* %74, align 4
  %75 = sext i32 %.441 to i64
  %76 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %75
  %77 = load i32, i32* %76, align 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 0, i64 %indvars.iv1540
  store i64 %78, i64* %79, align 8
  %80 = load i8, i8* %70, align 1
  %81 = zext i8 %80 to i32
  %82 = add nsw i32 %81, %.441
  %83 = add nsw i32 %82, -1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %84
  %86 = load i32, i32* %85, align 4
  %87 = zext i32 %86 to i64
  br label %88

; <label>:88:                                     ; preds = %.preheader, %73
  %.sink = phi i64 [ %87, %73 ], [ -1, %.preheader ]
  %.5 = phi i32 [ %82, %73 ], [ %.441, %.preheader ]
  %89 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 1, i64 %indvars.iv1540
  store i64 %.sink, i64* %89, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1540, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 17
  br i1 %exitcond17, label %90, label %.preheader

; <label>:90:                                     ; preds = %88
  %91 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 1, i64 17
  store i64 1048575, i64* %91, align 8
  %92 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 4
  %93 = bitcast [256 x i32]* %92 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %93, i8 0, i64 1024, i32 8, i1 false)
  %scevgep106 = getelementptr %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 4, i64 1
  %scevgep113 = getelementptr %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 5, i64 1
  br label %94

; <label>:94:                                     ; preds = %90, %._crit_edge37
  %.639 = phi i64 [ 0, %90 ], [ %indvars.iv11.lcssa, %._crit_edge37 ]
  %indvars.iv1338 = phi i64 [ 1, %90 ], [ %indvars.iv.next14, %._crit_edge37 ]
  %sext28 = shl i64 %.639, 32
  %95 = ashr exact i64 %sext28, 32
  %96 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 0, i64 %indvars.iv1338
  %97 = load i8, i8* %96, align 1
  %98 = icmp eq i8 %97, 0
  br i1 %98, label %._crit_edge37, label %.lr.ph36

.lr.ph36:                                         ; preds = %94
  %99 = sub nuw nsw i64 8, %indvars.iv1338
  %100 = trunc i64 %99 to i32
  %101 = shl i32 1, %100
  %102 = icmp eq i32 %100, 31
  %103 = trunc i64 %indvars.iv1338 to i32
  br i1 %102, label %.lr.ph36.split.preheader, label %.lr.ph36.split.us.preheader

.lr.ph36.split.us.preheader:                      ; preds = %.lr.ph36
  %104 = add i32 %101, 1
  %105 = xor i32 %101, -1
  %106 = icmp sgt i32 %105, -2
  %smax96 = select i1 %106, i32 %105, i32 -2
  %107 = add i32 %104, %smax96
  %108 = zext i32 %107 to i64
  %109 = add nuw nsw i64 %108, 1
  %110 = add i32 %101, 1
  %111 = xor i32 %101, -1
  %112 = icmp sgt i32 %111, -2
  %smax107 = select i1 %112, i32 %111, i32 -2
  %113 = add i32 %110, %smax107
  %114 = zext i32 %113 to i64
  %scevgep108 = getelementptr i32, i32* %scevgep106, i64 %114
  %scevgep114 = getelementptr i8, i8* %scevgep113, i64 %114
  %115 = and i64 %109, 8589934584
  %116 = add nsw i64 %115, -8
  %117 = lshr exact i64 %116, 3
  %min.iters.check97 = icmp ult i64 %109, 8
  %n.vec100 = and i64 %109, 8589934584
  %cmp.zero101 = icmp eq i64 %n.vec100, 0
  %cast.crd = trunc i64 %n.vec100 to i32
  %ind.end127 = sub i32 %101, %cast.crd
  %broadcast.splatinsert141 = insertelement <4 x i32> undef, i32 %103, i32 0
  %broadcast.splat142 = shufflevector <4 x i32> %broadcast.splatinsert141, <4 x i32> undef, <4 x i32> zeroinitializer
  %118 = and i64 %117, 1
  %lcmp.mod = icmp eq i64 %118, 0
  %119 = icmp eq i64 %117, 0
  %cmp.n130 = icmp eq i64 %109, %n.vec100
  br label %.lr.ph36.split.us

.lr.ph36.split.preheader:                         ; preds = %.lr.ph36
  %120 = load i8, i8* %96, align 1
  %121 = zext i8 %120 to i32
  %122 = zext i8 %120 to i32
  %123 = icmp ugt i32 %122, 1
  %smax70 = select i1 %123, i32 %122, i32 1
  %min.iters.check71 = icmp ult i32 %smax70, 4
  br i1 %min.iters.check71, label %.lr.ph36.split.preheader143, label %min.iters.checked72

.lr.ph36.split.preheader143:                      ; preds = %middle.block68, %min.iters.checked72, %.lr.ph36.split.preheader
  %.1734.ph = phi i32 [ 1, %min.iters.checked72 ], [ 1, %.lr.ph36.split.preheader ], [ %ind.end80, %middle.block68 ]
  %indvars.iv1133.ph = phi i64 [ %95, %min.iters.checked72 ], [ %95, %.lr.ph36.split.preheader ], [ %134, %middle.block68 ]
  br label %.lr.ph36.split

min.iters.checked72:                              ; preds = %.lr.ph36.split.preheader
  %n.vec74 = and i32 %smax70, 252
  %cmp.zero75 = icmp eq i32 %n.vec74, 0
  %ind.end80 = or i32 %n.vec74, 1
  br i1 %cmp.zero75, label %.lr.ph36.split.preheader143, label %vector.ph76

vector.ph76:                                      ; preds = %min.iters.checked72
  %124 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %95, i32 0
  %125 = add nsw i32 %n.vec74, -4
  %126 = lshr exact i32 %125, 2
  %127 = add nuw nsw i32 %126, 1
  %xtraiter150 = and i32 %127, 7
  %lcmp.mod151 = icmp eq i32 %xtraiter150, 0
  br i1 %lcmp.mod151, label %vector.body67.prol.loopexit, label %vector.body67.prol.preheader

vector.body67.prol.preheader:                     ; preds = %vector.ph76
  br label %vector.body67.prol

vector.body67.prol:                               ; preds = %vector.body67.prol, %vector.body67.prol.preheader
  %index77.prol = phi i32 [ 0, %vector.body67.prol.preheader ], [ %index.next78.prol, %vector.body67.prol ]
  %vec.phi87.prol = phi <2 x i64> [ %124, %vector.body67.prol.preheader ], [ %128, %vector.body67.prol ]
  %vec.phi88.prol = phi <2 x i64> [ zeroinitializer, %vector.body67.prol.preheader ], [ %129, %vector.body67.prol ]
  %prol.iter = phi i32 [ %xtraiter150, %vector.body67.prol.preheader ], [ %prol.iter.sub, %vector.body67.prol ]
  %128 = add <2 x i64> %vec.phi87.prol, <i64 1, i64 1>
  %129 = add <2 x i64> %vec.phi88.prol, <i64 1, i64 1>
  %index.next78.prol = add i32 %index77.prol, 4
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body67.prol.loopexit.unr-lcssa, label %vector.body67.prol, !llvm.loop !8

vector.body67.prol.loopexit.unr-lcssa:            ; preds = %vector.body67.prol
  br label %vector.body67.prol.loopexit

vector.body67.prol.loopexit:                      ; preds = %vector.ph76, %vector.body67.prol.loopexit.unr-lcssa
  %.lcssa145.unr = phi <2 x i64> [ undef, %vector.ph76 ], [ %128, %vector.body67.prol.loopexit.unr-lcssa ]
  %.lcssa.unr = phi <2 x i64> [ undef, %vector.ph76 ], [ %129, %vector.body67.prol.loopexit.unr-lcssa ]
  %index77.unr = phi i32 [ 0, %vector.ph76 ], [ %index.next78.prol, %vector.body67.prol.loopexit.unr-lcssa ]
  %vec.phi87.unr = phi <2 x i64> [ %124, %vector.ph76 ], [ %128, %vector.body67.prol.loopexit.unr-lcssa ]
  %vec.phi88.unr = phi <2 x i64> [ zeroinitializer, %vector.ph76 ], [ %129, %vector.body67.prol.loopexit.unr-lcssa ]
  %130 = icmp ult i32 %125, 28
  br i1 %130, label %middle.block68, label %vector.ph76.new

vector.ph76.new:                                  ; preds = %vector.body67.prol.loopexit
  br label %vector.body67

vector.body67:                                    ; preds = %vector.body67, %vector.ph76.new
  %index77 = phi i32 [ %index77.unr, %vector.ph76.new ], [ %index.next78.7, %vector.body67 ]
  %vec.phi87 = phi <2 x i64> [ %vec.phi87.unr, %vector.ph76.new ], [ %131, %vector.body67 ]
  %vec.phi88 = phi <2 x i64> [ %vec.phi88.unr, %vector.ph76.new ], [ %132, %vector.body67 ]
  %131 = add <2 x i64> %vec.phi87, <i64 8, i64 8>
  %132 = add <2 x i64> %vec.phi88, <i64 8, i64 8>
  %index.next78.7 = add i32 %index77, 32
  %133 = icmp eq i32 %index.next78.7, %n.vec74
  br i1 %133, label %middle.block68.unr-lcssa, label %vector.body67, !llvm.loop !9

middle.block68.unr-lcssa:                         ; preds = %vector.body67
  br label %middle.block68

middle.block68:                                   ; preds = %vector.body67.prol.loopexit, %middle.block68.unr-lcssa
  %.lcssa145 = phi <2 x i64> [ %.lcssa145.unr, %vector.body67.prol.loopexit ], [ %131, %middle.block68.unr-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.unr, %vector.body67.prol.loopexit ], [ %132, %middle.block68.unr-lcssa ]
  %bin.rdx89 = add <2 x i64> %.lcssa, %.lcssa145
  %rdx.shuf90 = shufflevector <2 x i64> %bin.rdx89, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx91 = add <2 x i64> %bin.rdx89, %rdx.shuf90
  %134 = extractelement <2 x i64> %bin.rdx91, i32 0
  %cmp.n81 = icmp eq i32 %smax70, %n.vec74
  br i1 %cmp.n81, label %._crit_edge37, label %.lr.ph36.split.preheader143

.lr.ph36.split.us:                                ; preds = %.lr.ph36.split.us.preheader, %._crit_edge.us
  %.1734.us = phi i32 [ %187, %._crit_edge.us ], [ 1, %.lr.ph36.split.us.preheader ]
  %indvars.iv1133.us = phi i64 [ %indvars.iv.next12.us, %._crit_edge.us ], [ %95, %.lr.ph36.split.us.preheader ]
  %135 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv1133.us
  %136 = load i32, i32* %135, align 4
  %137 = shl i32 %136, %100
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %indvars.iv1133.us
  br i1 %min.iters.check97, label %scalar.ph95.preheader, label %min.iters.checked98

min.iters.checked98:                              ; preds = %.lr.ph36.split.us
  br i1 %cmp.zero101, label %scalar.ph95.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked98
  %scevgep104 = getelementptr %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 4, i64 %138
  %scevgep104105 = bitcast i32* %scevgep104 to i8*
  %scevgep109 = getelementptr i32, i32* %scevgep108, i64 %138
  %scevgep109110 = bitcast i32* %scevgep109 to i8*
  %scevgep112 = getelementptr %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 5, i64 %138
  %scevgep115 = getelementptr i8, i8* %scevgep114, i64 %138
  %bound0 = icmp ult i8* %scevgep104105, %scevgep115
  %bound1 = icmp ult i8* %scevgep112, %scevgep109110
  %found.conflict = and i1 %bound0, %bound1
  %bound0116 = icmp ult i8* %scevgep104105, %139
  %bound1117 = icmp ult i8* %139, %scevgep109110
  %found.conflict118 = and i1 %bound0116, %bound1117
  %conflict.rdx = or i1 %found.conflict, %found.conflict118
  %bound0119 = icmp ult i8* %scevgep112, %139
  %bound1120 = icmp ult i8* %139, %scevgep115
  %found.conflict121 = and i1 %bound0119, %bound1120
  %conflict.rdx122 = or i1 %conflict.rdx, %found.conflict121
  %ind.end129 = add nsw i64 %138, %n.vec100
  br i1 %conflict.rdx122, label %scalar.ph95.preheader, label %vector.ph123

vector.ph123:                                     ; preds = %vector.memcheck
  br i1 %lcmp.mod, label %vector.body93.prol.preheader, label %vector.body93.prol.loopexit.unr-lcssa

vector.body93.prol.preheader:                     ; preds = %vector.ph123
  br label %vector.body93.prol

vector.body93.prol:                               ; preds = %vector.body93.prol.preheader
  %140 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 4, i64 %138
  %141 = bitcast i32* %140 to <4 x i32>*
  store <4 x i32> %broadcast.splat142, <4 x i32>* %141, align 4, !alias.scope !10, !noalias !13
  %142 = getelementptr i32, i32* %140, i64 4
  %143 = bitcast i32* %142 to <4 x i32>*
  store <4 x i32> %broadcast.splat142, <4 x i32>* %143, align 4, !alias.scope !10, !noalias !13
  %144 = load i8, i8* %139, align 1, !alias.scope !16
  %145 = insertelement <4 x i8> undef, i8 %144, i32 0
  %146 = shufflevector <4 x i8> %145, <4 x i8> undef, <4 x i32> zeroinitializer
  %147 = insertelement <4 x i8> undef, i8 %144, i32 0
  %148 = shufflevector <4 x i8> %147, <4 x i8> undef, <4 x i32> zeroinitializer
  %149 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 5, i64 %138
  %150 = bitcast i8* %149 to <4 x i8>*
  store <4 x i8> %146, <4 x i8>* %150, align 1, !alias.scope !17, !noalias !16
  %151 = getelementptr i8, i8* %149, i64 4
  %152 = bitcast i8* %151 to <4 x i8>*
  store <4 x i8> %148, <4 x i8>* %152, align 1, !alias.scope !17, !noalias !16
  br label %vector.body93.prol.loopexit.unr-lcssa

vector.body93.prol.loopexit.unr-lcssa:            ; preds = %vector.ph123, %vector.body93.prol
  %index124.unr.ph = phi i64 [ 8, %vector.body93.prol ], [ 0, %vector.ph123 ]
  br label %vector.body93.prol.loopexit

vector.body93.prol.loopexit:                      ; preds = %vector.body93.prol.loopexit.unr-lcssa
  br i1 %119, label %middle.block94, label %vector.ph123.new

vector.ph123.new:                                 ; preds = %vector.body93.prol.loopexit
  %153 = load i8, i8* %139, align 1, !alias.scope !16
  %154 = insertelement <4 x i8> undef, i8 %153, i32 0
  %155 = shufflevector <4 x i8> %154, <4 x i8> undef, <4 x i32> zeroinitializer
  %156 = insertelement <4 x i8> undef, i8 %153, i32 0
  %157 = shufflevector <4 x i8> %156, <4 x i8> undef, <4 x i32> zeroinitializer
  %158 = load i8, i8* %139, align 1, !alias.scope !16
  %159 = insertelement <4 x i8> undef, i8 %158, i32 0
  %160 = shufflevector <4 x i8> %159, <4 x i8> undef, <4 x i32> zeroinitializer
  %161 = insertelement <4 x i8> undef, i8 %158, i32 0
  %162 = shufflevector <4 x i8> %161, <4 x i8> undef, <4 x i32> zeroinitializer
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93, %vector.ph123.new
  %index124 = phi i64 [ %index124.unr.ph, %vector.ph123.new ], [ %index.next125.1, %vector.body93 ]
  %163 = add i64 %138, %index124
  %164 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 4, i64 %163
  %165 = bitcast i32* %164 to <4 x i32>*
  store <4 x i32> %broadcast.splat142, <4 x i32>* %165, align 4, !alias.scope !10, !noalias !13
  %166 = getelementptr i32, i32* %164, i64 4
  %167 = bitcast i32* %166 to <4 x i32>*
  store <4 x i32> %broadcast.splat142, <4 x i32>* %167, align 4, !alias.scope !10, !noalias !13
  %168 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 5, i64 %163
  %169 = bitcast i8* %168 to <4 x i8>*
  store <4 x i8> %155, <4 x i8>* %169, align 1, !alias.scope !17, !noalias !16
  %170 = getelementptr i8, i8* %168, i64 4
  %171 = bitcast i8* %170 to <4 x i8>*
  store <4 x i8> %157, <4 x i8>* %171, align 1, !alias.scope !17, !noalias !16
  %index.next125 = add i64 %index124, 8
  %172 = add i64 %138, %index.next125
  %173 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 4, i64 %172
  %174 = bitcast i32* %173 to <4 x i32>*
  store <4 x i32> %broadcast.splat142, <4 x i32>* %174, align 4, !alias.scope !10, !noalias !13
  %175 = getelementptr i32, i32* %173, i64 4
  %176 = bitcast i32* %175 to <4 x i32>*
  store <4 x i32> %broadcast.splat142, <4 x i32>* %176, align 4, !alias.scope !10, !noalias !13
  %177 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 5, i64 %172
  %178 = bitcast i8* %177 to <4 x i8>*
  store <4 x i8> %160, <4 x i8>* %178, align 1, !alias.scope !17, !noalias !16
  %179 = getelementptr i8, i8* %177, i64 4
  %180 = bitcast i8* %179 to <4 x i8>*
  store <4 x i8> %162, <4 x i8>* %180, align 1, !alias.scope !17, !noalias !16
  %index.next125.1 = add i64 %index124, 16
  %181 = icmp eq i64 %index.next125.1, %n.vec100
  br i1 %181, label %middle.block94.unr-lcssa, label %vector.body93, !llvm.loop !18

middle.block94.unr-lcssa:                         ; preds = %vector.body93
  br label %middle.block94

middle.block94:                                   ; preds = %vector.body93.prol.loopexit, %middle.block94.unr-lcssa
  br i1 %cmp.n130, label %._crit_edge.us, label %scalar.ph95.preheader

scalar.ph95.preheader:                            ; preds = %middle.block94, %vector.memcheck, %min.iters.checked98, %.lr.ph36.split.us
  %.0132.us.ph = phi i32 [ %101, %vector.memcheck ], [ %101, %min.iters.checked98 ], [ %101, %.lr.ph36.split.us ], [ %ind.end127, %middle.block94 ]
  %indvars.iv31.us.ph = phi i64 [ %138, %vector.memcheck ], [ %138, %min.iters.checked98 ], [ %138, %.lr.ph36.split.us ], [ %ind.end129, %middle.block94 ]
  br label %scalar.ph95

scalar.ph95:                                      ; preds = %scalar.ph95.preheader, %scalar.ph95
  %.0132.us = phi i32 [ %185, %scalar.ph95 ], [ %.0132.us.ph, %scalar.ph95.preheader ]
  %indvars.iv31.us = phi i64 [ %indvars.iv.next.us, %scalar.ph95 ], [ %indvars.iv31.us.ph, %scalar.ph95.preheader ]
  %182 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 4, i64 %indvars.iv31.us
  store i32 %103, i32* %182, align 4
  %183 = load i8, i8* %139, align 1
  %184 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 5, i64 %indvars.iv31.us
  store i8 %183, i8* %184, align 1
  %indvars.iv.next.us = add nsw i64 %indvars.iv31.us, 1
  %185 = add nsw i32 %.0132.us, -1
  %186 = icmp sgt i32 %.0132.us, 1
  br i1 %186, label %scalar.ph95, label %._crit_edge.us.loopexit, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph95
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block94
  %187 = add nuw nsw i32 %.1734.us, 1
  %indvars.iv.next12.us = add i64 %indvars.iv1133.us, 1
  %188 = load i8, i8* %96, align 1
  %189 = zext i8 %188 to i32
  %190 = icmp slt i32 %.1734.us, %189
  br i1 %190, label %.lr.ph36.split.us, label %._crit_edge37.loopexit144

.lr.ph36.split:                                   ; preds = %.lr.ph36.split.preheader143, %.lr.ph36.split
  %.1734 = phi i32 [ %191, %.lr.ph36.split ], [ %.1734.ph, %.lr.ph36.split.preheader143 ]
  %indvars.iv1133 = phi i64 [ %indvars.iv.next12, %.lr.ph36.split ], [ %indvars.iv1133.ph, %.lr.ph36.split.preheader143 ]
  %191 = add nuw nsw i32 %.1734, 1
  %indvars.iv.next12 = add i64 %indvars.iv1133, 1
  %192 = icmp slt i32 %.1734, %121
  br i1 %192, label %.lr.ph36.split, label %._crit_edge37.loopexit, !llvm.loop !20

._crit_edge37.loopexit:                           ; preds = %.lr.ph36.split
  br label %._crit_edge37

._crit_edge37.loopexit144:                        ; preds = %._crit_edge.us
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit144, %._crit_edge37.loopexit, %middle.block68, %94
  %indvars.iv11.lcssa = phi i64 [ %95, %94 ], [ %134, %middle.block68 ], [ %indvars.iv.next12, %._crit_edge37.loopexit ], [ %indvars.iv.next12.us, %._crit_edge37.loopexit144 ]
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1338, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 9
  br i1 %exitcond, label %193, label %94

; <label>:193:                                    ; preds = %._crit_edge37
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nocapture, i64, i32, i32) #0 {
  %5 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 0
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 1
  %8 = load i64, i64* %7, align 8
  %9 = icmp slt i32 %2, 25
  br i1 %9, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %4
  %10 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 2
  %11 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 5
  %12 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 5
  %13 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 6
  %14 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 5
  br label %15

; <label>:15:                                     ; preds = %.lr.ph, %.loopexit31
  %.0246 = phi i64 [ %1, %.lr.ph ], [ %84, %.loopexit31 ]
  %.0344 = phi i32 [ %2, %.lr.ph ], [ %85, %.loopexit31 ]
  %.0443 = phi i64 [ %8, %.lr.ph ], [ %.6, %.loopexit31 ]
  %.0642 = phi i8* [ %6, %.lr.ph ], [ %.612, %.loopexit31 ]
  %16 = load i32, i32* %10, align 8
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %65

; <label>:18:                                     ; preds = %15
  %19 = icmp eq i64 %.0443, 0
  br i1 %19, label %20, label %36

; <label>:20:                                     ; preds = %18
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %11, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i64 0, i32 5
  %23 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %23, i64 0, i32 3
  %25 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %24, align 8
  %26 = tail call i32 %25(%struct.jpeg_decompress_struct* %21) #2
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %.loopexit30.loopexit74, label %28

; <label>:28:                                     ; preds = %20
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %11, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i64 0, i32 5
  %31 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %31, i64 0, i32 0
  %33 = load i8*, i8** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %31, i64 0, i32 1
  %35 = load i64, i64* %34, align 8
  br label %36

; <label>:36:                                     ; preds = %28, %18
  %.17 = phi i8* [ %33, %28 ], [ %.0642, %18 ]
  %.15 = phi i64 [ %35, %28 ], [ %.0443, %18 ]
  %37 = add i64 %.15, -1
  %38 = getelementptr inbounds i8, i8* %.17, i64 1
  %39 = load i8, i8* %.17, align 1
  %40 = zext i8 %39 to i64
  %41 = icmp eq i8 %39, -1
  br i1 %41, label %.preheader.preheader, label %.loopexit31

.preheader.preheader:                             ; preds = %36
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %59
  %.28 = phi i8* [ %61, %59 ], [ %38, %.preheader.preheader ]
  %.2 = phi i64 [ %60, %59 ], [ %37, %.preheader.preheader ]
  %42 = icmp eq i64 %.2, 0
  br i1 %42, label %43, label %59

; <label>:43:                                     ; preds = %.preheader
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %12, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %44, i64 0, i32 5
  %46 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %46, i64 0, i32 3
  %48 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %47, align 8
  %49 = tail call i32 %48(%struct.jpeg_decompress_struct* %44) #2
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %.loopexit30.loopexit, label %51

; <label>:51:                                     ; preds = %43
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %12, align 8
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %52, i64 0, i32 5
  %54 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %54, i64 0, i32 0
  %56 = load i8*, i8** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %54, i64 0, i32 1
  %58 = load i64, i64* %57, align 8
  br label %59

; <label>:59:                                     ; preds = %51, %.preheader
  %.39 = phi i8* [ %56, %51 ], [ %.28, %.preheader ]
  %.3 = phi i64 [ %58, %51 ], [ %.2, %.preheader ]
  %60 = add i64 %.3, -1
  %61 = getelementptr inbounds i8, i8* %.39, i64 1
  %62 = load i8, i8* %.39, align 1
  switch i8 %62, label %63 [
    i8 -1, label %.preheader
    i8 0, label %.loopexit31.loopexit
  ]

; <label>:63:                                     ; preds = %59
  %64 = zext i8 %62 to i32
  store i32 %64, i32* %10, align 8
  br label %65

; <label>:65:                                     ; preds = %15, %63
  %.410 = phi i8* [ %61, %63 ], [ %.0642, %15 ]
  %.4 = phi i64 [ %60, %63 ], [ %.0443, %15 ]
  %66 = icmp slt i32 %.0344, %3
  br i1 %66, label %67, label %.loopexit.loopexit

; <label>:67:                                     ; preds = %65
  %68 = load i32*, i32** %13, align 8
  %69 = load i32, i32* %68, align 4
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %.loopexit31

; <label>:71:                                     ; preds = %67
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %14, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i64 0, i32 0
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %73, align 8
  %75 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %74, i64 0, i32 5
  store i32 113, i32* %75, align 8
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %14, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i64 0, i32 0
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i64 0, i32 1
  %80 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %79, align 8
  %81 = bitcast %struct.jpeg_decompress_struct* %76 to %struct.jpeg_common_struct*
  tail call void %80(%struct.jpeg_common_struct* %81, i32 -1) #2
  %82 = load i32*, i32** %13, align 8
  store i32 1, i32* %82, align 4
  br label %.loopexit31

.loopexit31.loopexit:                             ; preds = %59
  br label %.loopexit31

.loopexit31:                                      ; preds = %.loopexit31.loopexit, %67, %71, %36
  %.612 = phi i8* [ %38, %36 ], [ %.410, %71 ], [ %.410, %67 ], [ %61, %.loopexit31.loopexit ]
  %.6 = phi i64 [ %37, %36 ], [ %.4, %71 ], [ %.4, %67 ], [ %60, %.loopexit31.loopexit ]
  %.1 = phi i64 [ %40, %36 ], [ 0, %71 ], [ 0, %67 ], [ 255, %.loopexit31.loopexit ]
  %83 = shl i64 %.0246, 8
  %84 = or i64 %.1, %83
  %85 = add nsw i32 %.0344, 8
  %86 = icmp slt i32 %85, 25
  br i1 %86, label %15, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %65, %.loopexit31
  %.03.lcssa.ph = phi i32 [ %.0344, %65 ], [ %85, %.loopexit31 ]
  %.02.lcssa.ph = phi i64 [ %.0246, %65 ], [ %84, %.loopexit31 ]
  %.713.ph = phi i8* [ %.410, %65 ], [ %.612, %.loopexit31 ]
  %.7.ph = phi i64 [ %.4, %65 ], [ %.6, %.loopexit31 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4
  %.03.lcssa = phi i32 [ %2, %4 ], [ %.03.lcssa.ph, %.loopexit.loopexit ]
  %.02.lcssa = phi i64 [ %1, %4 ], [ %.02.lcssa.ph, %.loopexit.loopexit ]
  %.713 = phi i8* [ %6, %4 ], [ %.713.ph, %.loopexit.loopexit ]
  %.7 = phi i64 [ %8, %4 ], [ %.7.ph, %.loopexit.loopexit ]
  store i8* %.713, i8** %5, align 8
  store i64 %.7, i64* %7, align 8
  %87 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 3
  store i64 %.02.lcssa, i64* %87, align 8
  %88 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 4
  store i32 %.03.lcssa, i32* %88, align 8
  br label %.loopexit30

.loopexit30.loopexit:                             ; preds = %43
  br label %.loopexit30

.loopexit30.loopexit74:                           ; preds = %20
  br label %.loopexit30

.loopexit30:                                      ; preds = %.loopexit30.loopexit74, %.loopexit30.loopexit, %.loopexit
  %.0 = phi i32 [ 1, %.loopexit ], [ 0, %.loopexit30.loopexit ], [ 0, %.loopexit30.loopexit74 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_huff_decode(%struct.bitread_working_state* nocapture, i64, i32, %struct.d_derived_tbl* nocapture readonly, i32) #0 {
  %6 = icmp slt i32 %2, %4
  br i1 %6, label %7, label %15

; <label>:7:                                      ; preds = %5
  %8 = tail call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %0, i64 %1, i32 %2, i32 %4)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %.loopexit, label %10

; <label>:10:                                     ; preds = %7
  %11 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 3
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 4
  %14 = load i32, i32* %13, align 8
  br label %15

; <label>:15:                                     ; preds = %10, %5
  %.03 = phi i32 [ %14, %10 ], [ %2, %5 ]
  %.02 = phi i64 [ %12, %10 ], [ %1, %5 ]
  %16 = sub nsw i32 %.03, %4
  %17 = zext i32 %16 to i64
  %18 = ashr i64 %.02, %17
  %19 = trunc i64 %18 to i32
  %20 = shl i32 1, %4
  %21 = add nsw i32 %20, -1
  %22 = and i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = sext i32 %4 to i64
  %25 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %3, i64 0, i32 1, i64 %24
  %26 = load i64, i64* %25, align 8
  %27 = icmp sgt i64 %23, %26
  br i1 %27, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %15
  %28 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 3
  %29 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 4
  br label %30

; <label>:30:                                     ; preds = %.lr.ph, %39
  %.0118 = phi i64 [ %23, %.lr.ph ], [ %44, %39 ]
  %.117 = phi i64 [ %.02, %.lr.ph ], [ %.2, %39 ]
  %.1416 = phi i32 [ %16, %.lr.ph ], [ %40, %39 ]
  %indvars.iv15 = phi i64 [ %24, %.lr.ph ], [ %indvars.iv.next, %39 ]
  %31 = shl i64 %.0118, 1
  %32 = icmp slt i32 %.1416, 1
  br i1 %32, label %33, label %39

; <label>:33:                                     ; preds = %30
  %34 = tail call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %0, i64 %.117, i32 %.1416, i32 1)
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %.loopexit.loopexit, label %36

; <label>:36:                                     ; preds = %33
  %37 = load i64, i64* %28, align 8
  %38 = load i32, i32* %29, align 8
  br label %39

; <label>:39:                                     ; preds = %36, %30
  %.25 = phi i32 [ %38, %36 ], [ %.1416, %30 ]
  %.2 = phi i64 [ %37, %36 ], [ %.117, %30 ]
  %40 = add nsw i32 %.25, -1
  %41 = zext i32 %40 to i64
  %42 = lshr i64 %.2, %41
  %43 = and i64 %42, 1
  %44 = or i64 %43, %31
  %indvars.iv.next = add i64 %indvars.iv15, 1
  %45 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %3, i64 0, i32 1, i64 %indvars.iv.next
  %46 = load i64, i64* %45, align 8
  %47 = icmp sgt i64 %44, %46
  br i1 %47, label %30, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %39
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %15
  %indvars.iv.lcssa = phi i64 [ %24, %15 ], [ %indvars.iv.next, %._crit_edge.loopexit ]
  %.14.lcssa = phi i32 [ %16, %15 ], [ %40, %._crit_edge.loopexit ]
  %.1.lcssa = phi i64 [ %.02, %15 ], [ %.2, %._crit_edge.loopexit ]
  %.01.lcssa = phi i64 [ %23, %15 ], [ %44, %._crit_edge.loopexit ]
  %48 = trunc i64 %indvars.iv.lcssa to i32
  %49 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 3
  store i64 %.1.lcssa, i64* %49, align 8
  %50 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 4
  store i32 %.14.lcssa, i32* %50, align 8
  %51 = icmp sgt i32 %48, 16
  br i1 %51, label %52, label %64

; <label>:52:                                     ; preds = %._crit_edge
  %53 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 5
  %54 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %54, i64 0, i32 0
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i64 0, i32 5
  store i32 114, i32* %57, align 8
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %53, align 8
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %58, i64 0, i32 0
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i64 0, i32 1
  %62 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %61, align 8
  %63 = bitcast %struct.jpeg_decompress_struct* %58 to %struct.jpeg_common_struct*
  tail call void %62(%struct.jpeg_common_struct* %63, i32 -1) #2
  br label %.loopexit

; <label>:64:                                     ; preds = %._crit_edge
  %65 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %3, i64 0, i32 3
  %66 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %65, align 8
  %sext = shl i64 %indvars.iv.lcssa, 32
  %67 = ashr exact i64 %sext, 32
  %68 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %3, i64 0, i32 2, i64 %67
  %69 = load i32, i32* %68, align 4
  %70 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %3, i64 0, i32 0, i64 %67
  %71 = load i64, i64* %70, align 8
  %72 = sub nsw i64 %.01.lcssa, %71
  %73 = trunc i64 %72 to i32
  %74 = add nsw i32 %73, %69
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %66, i64 0, i32 1, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %33
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %7, %64, %52
  %.0 = phi i32 [ 0, %52 ], [ %78, %64 ], [ -1, %7 ], [ -1, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define void @jinit_huff_decoder(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 120) #2
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %9 = bitcast %struct.jpeg_entropy_decoder** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass_huff_decoder, void (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 8
  %12 = bitcast i8* %11 to i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)**
  store i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %12, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 56
  %14 = getelementptr inbounds i8, i8* %7, i64 88
  %15 = bitcast i8* %14 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %15, align 8
  %16 = bitcast i8* %13 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %16, align 8
  %17 = getelementptr inbounds i8, i8* %7, i64 96
  %18 = bitcast i8* %17 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %18, align 8
  %19 = getelementptr inbounds i8, i8* %7, i64 64
  %20 = bitcast i8* %19 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %20, align 8
  %21 = getelementptr inbounds i8, i8* %7, i64 104
  %22 = bitcast i8* %21 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %22, align 8
  %23 = getelementptr inbounds i8, i8* %7, i64 72
  %24 = bitcast i8* %23 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %24, align 8
  %25 = getelementptr inbounds i8, i8* %7, i64 112
  %26 = bitcast i8* %25 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %26, align 8
  %27 = getelementptr inbounds i8, i8* %7, i64 80
  %28 = bitcast i8* %27 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %28, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_huff_decoder(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %3 = bitcast %struct.jpeg_entropy_decoder** %2 to %struct.huff_entropy_decoder**
  %4 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 68
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %20

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 69
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %10, 63
  br i1 %11, label %12, label %20

; <label>:12:                                     ; preds = %8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 70
  %14 = load i32, i32* %13, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.preheader, label %20

; <label>:20:                                     ; preds = %16, %12, %8, %1
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 5
  store i32 118, i32* %23, align 8
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i64 0, i32 1
  %26 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %25, align 8
  %27 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %26(%struct.jpeg_common_struct* %27, i32 -1) #2
  br label %.preheader

.preheader:                                       ; preds = %20, %16
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %29 = load i32, i32* %28, align 8
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %32 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %34 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br label %35

; <label>:35:                                     ; preds = %.lr.ph, %71
  %indvars.iv2 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %71 ]
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv2
  %37 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %37, i64 0, i32 5
  %39 = load i32, i32* %38, align 4
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %37, i64 0, i32 6
  %41 = load i32, i32* %40, align 8
  %42 = icmp ugt i32 %39, 3
  br i1 %42, label %48, label %43

; <label>:43:                                     ; preds = %35
  %44 = sext i32 %39 to i64
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 40, i64 %44
  %46 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %45, align 8
  %47 = icmp eq %struct.JHUFF_TBL* %46, null
  br i1 %47, label %48, label %56

; <label>:48:                                     ; preds = %43, %35
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i64 0, i32 5
  store i32 49, i32* %50, align 8
  %51 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %52 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %51, i64 0, i32 6, i32 0, i64 0
  store i32 %39, i32* %52, align 4
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i64 0, i32 0
  %55 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %54, align 8
  tail call void %55(%struct.jpeg_common_struct* nonnull %32) #2
  br label %56

; <label>:56:                                     ; preds = %48, %43
  %57 = icmp ugt i32 %41, 3
  br i1 %57, label %63, label %58

; <label>:58:                                     ; preds = %56
  %59 = sext i32 %41 to i64
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 41, i64 %59
  %61 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %60, align 8
  %62 = icmp eq %struct.JHUFF_TBL* %61, null
  br i1 %62, label %63, label %71

; <label>:63:                                     ; preds = %58, %56
  %64 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %65 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %64, i64 0, i32 5
  store i32 49, i32* %65, align 8
  %66 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %67 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %66, i64 0, i32 6, i32 0, i64 0
  store i32 %41, i32* %67, align 4
  %68 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %69 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %68, i64 0, i32 0
  %70 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %69, align 8
  tail call void %70(%struct.jpeg_common_struct* nonnull %34) #2
  br label %71

; <label>:71:                                     ; preds = %63, %58
  %72 = sext i32 %39 to i64
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 40, i64 %72
  %74 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %73, align 8
  %75 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 4, i64 %72
  tail call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* nonnull %0, %struct.JHUFF_TBL* %74, %struct.d_derived_tbl** %75)
  %76 = sext i32 %41 to i64
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 41, i64 %76
  %78 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %77, align 8
  %79 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 5, i64 %76
  tail call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* nonnull %0, %struct.JHUFF_TBL* %78, %struct.d_derived_tbl** %79)
  %80 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 2, i32 0, i64 %indvars.iv2
  store i32 0, i32* %80, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv2, 1
  %81 = load i32, i32* %28, align 8
  %82 = sext i32 %81 to i64
  %83 = icmp slt i64 %indvars.iv.next, %82
  br i1 %83, label %35, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %71
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %84 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 1, i32 0
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %86 = bitcast i64* %84 to i8*
  call void @llvm.memset.p0i8.i64(i8* %86, i8 0, i64 16, i32 8, i1 false)
  %87 = load i32, i32* %85, align 8
  %88 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 3
  store i32 %87, i32* %88, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decode_mcu(%struct.jpeg_decompress_struct*, [64 x i16]** nocapture readonly) #0 {
  %3 = alloca %struct.bitread_working_state, align 8
  %4 = alloca %struct.savable_state, align 4
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %6 = bitcast %struct.jpeg_entropy_decoder** %5 to %struct.huff_entropy_decoder**
  %7 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %18, label %11

; <label>:11:                                     ; preds = %2
  %12 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 3
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %18

; <label>:15:                                     ; preds = %11
  %16 = tail call i32 @process_restart(%struct.jpeg_decompress_struct* nonnull %0)
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %.loopexit75, label %18

; <label>:18:                                     ; preds = %15, %2, %11
  %19 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 5
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %19, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %21 = bitcast %struct.jpeg_source_mgr** %20 to i64**
  %22 = load i64*, i64** %21, align 8
  %23 = load i64, i64* %22, align 8
  %24 = bitcast %struct.bitread_working_state* %3 to i64*
  store i64 %23, i64* %24, align 8
  %25 = getelementptr inbounds i64, i64* %22, i64 1
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 1
  store i64 %26, i64* %27, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %29 = load i32, i32* %28, align 4
  %30 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 2
  store i32 %29, i32* %30, align 8
  %31 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 1, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 1, i32 1
  %34 = load i32, i32* %33, align 8
  %35 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 1, i32 2
  %36 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 6
  store i32* %35, i32** %36, align 8
  %37 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 2
  %38 = bitcast %struct.savable_state* %4 to i8*
  %39 = bitcast %struct.savable_state* %37 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %38, i8* %39, i64 16, i32 4, i1 false)
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 66
  %41 = load i32, i32* %40, align 8
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %18
  %43 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %44 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %45 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %46 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %47 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %48 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %49 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %50 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %51 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %52 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %53 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %54 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %55 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %56 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %57 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %58 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %59 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %60 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  br label %61

; <label>:61:                                     ; preds = %.lr.ph, %.loopexit
  %.01096 = phi i32 [ %34, %.lr.ph ], [ %.20, %.loopexit ]
  %.01595 = phi i64 [ %32, %.lr.ph ], [ %.2035, %.loopexit ]
  %indvars.iv94 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %.loopexit ]
  %62 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv94
  %63 = load [64 x i16]*, [64 x i16]** %62, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 67, i64 %indvars.iv94
  %65 = load i32, i32* %64, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %66
  %68 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %67, align 8
  %69 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %68, i64 0, i32 5
  %70 = load i32, i32* %69, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 4, i64 %71
  %73 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %72, align 8
  %74 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %68, i64 0, i32 6
  %75 = load i32, i32* %74, align 8
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 5, i64 %76
  %78 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %77, align 8
  %79 = icmp slt i32 %.01096, 8
  br i1 %79, label %80, label %87

; <label>:80:                                     ; preds = %61
  %81 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.01595, i32 %.01096, i32 0)
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %.loopexit75.loopexit117, label %83

; <label>:83:                                     ; preds = %80
  %84 = load i64, i64* %43, align 8
  %85 = load i32, i32* %44, align 8
  %86 = icmp slt i32 %85, 8
  br i1 %86, label %100, label %87

; <label>:87:                                     ; preds = %83, %61
  %.116 = phi i64 [ %.01595, %61 ], [ %84, %83 ]
  %.111 = phi i32 [ %.01096, %61 ], [ %85, %83 ]
  %88 = add nsw i32 %.111, -8
  %89 = zext i32 %88 to i64
  %90 = ashr i64 %.116, %89
  %91 = and i64 %90, 255
  %92 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %73, i64 0, i32 4, i64 %91
  %93 = load i32, i32* %92, align 4
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %100, label %95

; <label>:95:                                     ; preds = %87
  %96 = sub nsw i32 %.111, %93
  %97 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %73, i64 0, i32 5, i64 %91
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  br label %106

; <label>:100:                                    ; preds = %87, %83
  %.217 = phi i64 [ %84, %83 ], [ %.116, %87 ]
  %.212 = phi i32 [ %85, %83 ], [ %.111, %87 ]
  %.03 = phi i32 [ 1, %83 ], [ 9, %87 ]
  %101 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.217, i32 %.212, %struct.d_derived_tbl* %73, i32 %.03)
  %102 = icmp slt i32 %101, 0
  br i1 %102, label %.loopexit75.loopexit117, label %103

; <label>:103:                                    ; preds = %100
  %104 = load i64, i64* %45, align 8
  %105 = load i32, i32* %46, align 8
  br label %106

; <label>:106:                                    ; preds = %103, %95
  %.318 = phi i64 [ %104, %103 ], [ %.116, %95 ]
  %.313 = phi i32 [ %105, %103 ], [ %96, %95 ]
  %.04 = phi i32 [ %101, %103 ], [ %99, %95 ]
  %107 = icmp eq i32 %.04, 0
  br i1 %107, label %132, label %108

; <label>:108:                                    ; preds = %106
  %109 = icmp slt i32 %.313, %.04
  br i1 %109, label %110, label %116

; <label>:110:                                    ; preds = %108
  %111 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.318, i32 %.313, i32 %.04)
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %.loopexit75.loopexit117, label %113

; <label>:113:                                    ; preds = %110
  %114 = load i64, i64* %59, align 8
  %115 = load i32, i32* %60, align 8
  br label %116

; <label>:116:                                    ; preds = %113, %108
  %.419 = phi i64 [ %114, %113 ], [ %.318, %108 ]
  %.4 = phi i32 [ %115, %113 ], [ %.313, %108 ]
  %117 = sub nsw i32 %.4, %.04
  %118 = zext i32 %117 to i64
  %119 = ashr i64 %.419, %118
  %120 = trunc i64 %119 to i32
  %121 = shl i32 1, %.04
  %122 = add nsw i32 %121, -1
  %123 = and i32 %120, %122
  %124 = sext i32 %.04 to i64
  %125 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %124
  %126 = load i32, i32* %125, align 4
  %127 = icmp slt i32 %123, %126
  br i1 %127, label %128, label %132

; <label>:128:                                    ; preds = %116
  %129 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %124
  %130 = load i32, i32* %129, align 4
  %131 = add nsw i32 %130, %123
  br label %132

; <label>:132:                                    ; preds = %106, %128, %116
  %.520 = phi i64 [ %.318, %106 ], [ %.419, %116 ], [ %.419, %128 ]
  %.5 = phi i32 [ %.313, %106 ], [ %117, %116 ], [ %117, %128 ]
  %.1 = phi i32 [ 0, %106 ], [ %123, %116 ], [ %131, %128 ]
  %133 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %68, i64 0, i32 12
  %134 = load i32, i32* %133, align 8
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %.preheader.preheader, label %136

.preheader.preheader:                             ; preds = %136, %132
  br label %.preheader

; <label>:136:                                    ; preds = %132
  %137 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %4, i64 0, i32 0, i64 %66
  %138 = load i32, i32* %137, align 4
  %139 = add nsw i32 %138, %.1
  store i32 %139, i32* %137, align 4
  %140 = trunc i32 %139 to i16
  %141 = getelementptr inbounds [64 x i16], [64 x i16]* %63, i64 0, i64 0
  store i16 %140, i16* %141, align 2
  %142 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %68, i64 0, i32 9
  %143 = load i32, i32* %142, align 4
  %144 = icmp sgt i32 %143, 1
  br i1 %144, label %.preheader76.preheader, label %.preheader.preheader

.preheader76.preheader:                           ; preds = %136
  br label %.preheader76

.preheader76:                                     ; preds = %.preheader76.preheader, %213
  %.0590 = phi i32 [ %214, %213 ], [ 1, %.preheader76.preheader ]
  %.689 = phi i32 [ %.11, %213 ], [ %.5, %.preheader76.preheader ]
  %.62188 = phi i64 [ %.1126, %213 ], [ %.520, %.preheader76.preheader ]
  %145 = icmp slt i32 %.689, 8
  br i1 %145, label %146, label %153

; <label>:146:                                    ; preds = %.preheader76
  %147 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.62188, i32 %.689, i32 0)
  %148 = icmp eq i32 %147, 0
  br i1 %148, label %.loopexit75.loopexit113, label %149

; <label>:149:                                    ; preds = %146
  %150 = load i64, i64* %47, align 8
  %151 = load i32, i32* %48, align 8
  %152 = icmp slt i32 %151, 8
  br i1 %152, label %166, label %153

; <label>:153:                                    ; preds = %149, %.preheader76
  %.722 = phi i64 [ %.62188, %.preheader76 ], [ %150, %149 ]
  %.7 = phi i32 [ %.689, %.preheader76 ], [ %151, %149 ]
  %154 = add nsw i32 %.7, -8
  %155 = zext i32 %154 to i64
  %156 = ashr i64 %.722, %155
  %157 = and i64 %156, 255
  %158 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %78, i64 0, i32 4, i64 %157
  %159 = load i32, i32* %158, align 4
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %166, label %161

; <label>:161:                                    ; preds = %153
  %162 = sub nsw i32 %.7, %159
  %163 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %78, i64 0, i32 5, i64 %157
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  br label %172

; <label>:166:                                    ; preds = %153, %149
  %.823 = phi i64 [ %150, %149 ], [ %.722, %153 ]
  %.8 = phi i32 [ %151, %149 ], [ %.7, %153 ]
  %.02 = phi i32 [ 1, %149 ], [ 9, %153 ]
  %167 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.823, i32 %.8, %struct.d_derived_tbl* %78, i32 %.02)
  %168 = icmp slt i32 %167, 0
  br i1 %168, label %.loopexit75.loopexit113, label %169

; <label>:169:                                    ; preds = %166
  %170 = load i64, i64* %49, align 8
  %171 = load i32, i32* %50, align 8
  br label %172

; <label>:172:                                    ; preds = %169, %161
  %.924 = phi i64 [ %170, %169 ], [ %.722, %161 ]
  %.9 = phi i32 [ %171, %169 ], [ %162, %161 ]
  %.2 = phi i32 [ %167, %169 ], [ %165, %161 ]
  %173 = ashr i32 %.2, 4
  %174 = and i32 %.2, 15
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %209, label %176

; <label>:176:                                    ; preds = %172
  %177 = add nsw i32 %173, %.0590
  %178 = icmp slt i32 %.9, %174
  br i1 %178, label %179, label %185

; <label>:179:                                    ; preds = %176
  %180 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.924, i32 %.9, i32 %174)
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %.loopexit75.loopexit113, label %182

; <label>:182:                                    ; preds = %179
  %183 = load i64, i64* %51, align 8
  %184 = load i32, i32* %52, align 8
  br label %185

; <label>:185:                                    ; preds = %182, %176
  %.1025 = phi i64 [ %183, %182 ], [ %.924, %176 ]
  %.10 = phi i32 [ %184, %182 ], [ %.9, %176 ]
  %186 = sub nsw i32 %.10, %174
  %187 = zext i32 %186 to i64
  %188 = ashr i64 %.1025, %187
  %189 = trunc i64 %188 to i32
  %190 = shl i32 1, %174
  %191 = add nsw i32 %190, -1
  %192 = and i32 %189, %191
  %193 = zext i32 %174 to i64
  %194 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %193
  %195 = load i32, i32* %194, align 4
  %196 = icmp slt i32 %192, %195
  br i1 %196, label %197, label %201

; <label>:197:                                    ; preds = %185
  %198 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %193
  %199 = load i32, i32* %198, align 4
  %200 = add nsw i32 %199, %192
  br label %201

; <label>:201:                                    ; preds = %185, %197
  %202 = phi i32 [ %200, %197 ], [ %192, %185 ]
  %203 = trunc i32 %202 to i16
  %204 = sext i32 %177 to i64
  %205 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %204
  %206 = load i32, i32* %205, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [64 x i16], [64 x i16]* %63, i64 0, i64 %207
  store i16 %203, i16* %208, align 2
  br label %213

; <label>:209:                                    ; preds = %172
  %210 = icmp eq i32 %173, 15
  br i1 %210, label %211, label %.loopexit.loopexit114

; <label>:211:                                    ; preds = %209
  %212 = add nsw i32 %.0590, 15
  br label %213

; <label>:213:                                    ; preds = %201, %211
  %.1126 = phi i64 [ %.1025, %201 ], [ %.924, %211 ]
  %.11 = phi i32 [ %186, %201 ], [ %.9, %211 ]
  %.16 = phi i32 [ %177, %201 ], [ %212, %211 ]
  %214 = add nsw i32 %.16, 1
  %215 = icmp slt i32 %214, 64
  br i1 %215, label %.preheader76, label %.loopexit.loopexit114

.preheader:                                       ; preds = %.preheader.preheader, %259
  %.2793 = phi i32 [ %260, %259 ], [ 1, %.preheader.preheader ]
  %.1392 = phi i32 [ %.18, %259 ], [ %.5, %.preheader.preheader ]
  %.132891 = phi i64 [ %.1833, %259 ], [ %.520, %.preheader.preheader ]
  %216 = icmp slt i32 %.1392, 8
  br i1 %216, label %217, label %224

; <label>:217:                                    ; preds = %.preheader
  %218 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.132891, i32 %.1392, i32 0)
  %219 = icmp eq i32 %218, 0
  br i1 %219, label %.loopexit75.loopexit, label %220

; <label>:220:                                    ; preds = %217
  %221 = load i64, i64* %53, align 8
  %222 = load i32, i32* %54, align 8
  %223 = icmp slt i32 %222, 8
  br i1 %223, label %237, label %224

; <label>:224:                                    ; preds = %220, %.preheader
  %.1429 = phi i64 [ %.132891, %.preheader ], [ %221, %220 ]
  %.14 = phi i32 [ %.1392, %.preheader ], [ %222, %220 ]
  %225 = add nsw i32 %.14, -8
  %226 = zext i32 %225 to i64
  %227 = ashr i64 %.1429, %226
  %228 = and i64 %227, 255
  %229 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %78, i64 0, i32 4, i64 %228
  %230 = load i32, i32* %229, align 4
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %237, label %232

; <label>:232:                                    ; preds = %224
  %233 = sub nsw i32 %.14, %230
  %234 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %78, i64 0, i32 5, i64 %228
  %235 = load i8, i8* %234, align 1
  %236 = zext i8 %235 to i32
  br label %243

; <label>:237:                                    ; preds = %224, %220
  %.1530 = phi i64 [ %221, %220 ], [ %.1429, %224 ]
  %.15 = phi i32 [ %222, %220 ], [ %.14, %224 ]
  %.01 = phi i32 [ 1, %220 ], [ 9, %224 ]
  %238 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.1530, i32 %.15, %struct.d_derived_tbl* %78, i32 %.01)
  %239 = icmp slt i32 %238, 0
  br i1 %239, label %.loopexit75.loopexit, label %240

; <label>:240:                                    ; preds = %237
  %241 = load i64, i64* %55, align 8
  %242 = load i32, i32* %56, align 8
  br label %243

; <label>:243:                                    ; preds = %240, %232
  %.1631 = phi i64 [ %241, %240 ], [ %.1429, %232 ]
  %.1614 = phi i32 [ %242, %240 ], [ %233, %232 ]
  %.3 = phi i32 [ %238, %240 ], [ %236, %232 ]
  %244 = ashr i32 %.3, 4
  %245 = and i32 %.3, 15
  %246 = icmp eq i32 %245, 0
  br i1 %246, label %257, label %247

; <label>:247:                                    ; preds = %243
  %248 = icmp slt i32 %.1614, %245
  br i1 %248, label %249, label %255

; <label>:249:                                    ; preds = %247
  %250 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.1631, i32 %.1614, i32 %245)
  %251 = icmp eq i32 %250, 0
  br i1 %251, label %.loopexit75.loopexit, label %252

; <label>:252:                                    ; preds = %249
  %253 = load i64, i64* %57, align 8
  %254 = load i32, i32* %58, align 8
  br label %255

; <label>:255:                                    ; preds = %252, %247
  %.1732 = phi i64 [ %253, %252 ], [ %.1631, %247 ]
  %.17 = phi i32 [ %254, %252 ], [ %.1614, %247 ]
  %256 = sub nsw i32 %.17, %245
  br label %259

; <label>:257:                                    ; preds = %243
  %258 = icmp eq i32 %244, 15
  br i1 %258, label %259, label %.loopexit.loopexit

; <label>:259:                                    ; preds = %257, %255
  %.1833 = phi i64 [ %.1732, %255 ], [ %.1631, %257 ]
  %.18 = phi i32 [ %256, %255 ], [ %.1614, %257 ]
  %.pn = phi i32 [ %244, %255 ], [ 15, %257 ]
  %.38 = add i32 %.2793, 1
  %260 = add i32 %.38, %.pn
  %261 = icmp slt i32 %260, 64
  br i1 %261, label %.preheader, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %259, %257
  %.2035.ph = phi i64 [ %.1833, %259 ], [ %.1631, %257 ]
  %.20.ph = phi i32 [ %.18, %259 ], [ %.1614, %257 ]
  br label %.loopexit

.loopexit.loopexit114:                            ; preds = %213, %209
  %.2035.ph115 = phi i64 [ %.1126, %213 ], [ %.924, %209 ]
  %.20.ph116 = phi i32 [ %.11, %213 ], [ %.9, %209 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit114, %.loopexit.loopexit
  %.2035 = phi i64 [ %.2035.ph, %.loopexit.loopexit ], [ %.2035.ph115, %.loopexit.loopexit114 ]
  %.20 = phi i32 [ %.20.ph, %.loopexit.loopexit ], [ %.20.ph116, %.loopexit.loopexit114 ]
  %indvars.iv.next = add nuw i64 %indvars.iv94, 1
  %262 = load i32, i32* %40, align 8
  %263 = sext i32 %262 to i64
  %264 = icmp slt i64 %indvars.iv.next, %263
  br i1 %264, label %61, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %18
  %.015.lcssa = phi i64 [ %32, %18 ], [ %.2035, %._crit_edge.loopexit ]
  %.010.lcssa = phi i32 [ %34, %18 ], [ %.20, %._crit_edge.loopexit ]
  %265 = bitcast %struct.bitread_working_state* %3 to i64*
  %266 = load i64, i64* %265, align 8
  %267 = bitcast %struct.jpeg_source_mgr** %20 to i64**
  %268 = load i64*, i64** %267, align 8
  store i64 %266, i64* %268, align 8
  %269 = load i64, i64* %27, align 8
  %270 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %20, align 8
  %271 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %270, i64 0, i32 1
  store i64 %269, i64* %271, align 8
  %272 = load i32, i32* %30, align 8
  store i32 %272, i32* %28, align 4
  store i64 %.015.lcssa, i64* %31, align 8
  store i32 %.010.lcssa, i32* %33, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %39, i8* nonnull %38, i64 16, i32 4, i1 false)
  %273 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 3
  %274 = load i32, i32* %273, align 8
  %275 = add i32 %274, -1
  store i32 %275, i32* %273, align 8
  br label %.loopexit75

.loopexit75.loopexit:                             ; preds = %237, %249, %217
  br label %.loopexit75

.loopexit75.loopexit113:                          ; preds = %166, %179, %146
  br label %.loopexit75

.loopexit75.loopexit117:                          ; preds = %100, %110, %80
  br label %.loopexit75

.loopexit75:                                      ; preds = %.loopexit75.loopexit117, %.loopexit75.loopexit113, %.loopexit75.loopexit, %15, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %15 ], [ 0, %.loopexit75.loopexit ], [ 0, %.loopexit75.loopexit113 ], [ 0, %.loopexit75.loopexit117 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @process_restart(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %3 = bitcast %struct.jpeg_entropy_decoder** %2 to %struct.huff_entropy_decoder**
  %4 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %5 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 1, i32 1
  %6 = load i32, i32* %5, align 8
  %7 = sdiv i32 %6, 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %9 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %9, i64 0, i32 8
  %11 = load i32, i32* %10, align 4
  %12 = add i32 %11, %7
  store i32 %12, i32* %10, align 4
  store i32 0, i32* %5, align 8
  %13 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %14 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %13, i64 0, i32 2
  %15 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %14, align 8
  %16 = tail call i32 %15(%struct.jpeg_decompress_struct* %0) #2
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %29, label %.preheader

.preheader:                                       ; preds = %1
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %19 = load i32, i32* %18, align 8
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv2 = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %21 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 2, i32 0, i64 %indvars.iv2
  store i32 0, i32* %21, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv2, 1
  %22 = load i32, i32* %18, align 8
  %23 = sext i32 %22 to i64
  %24 = icmp slt i64 %indvars.iv.next, %23
  br i1 %24, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %26 = load i32, i32* %25, align 8
  %27 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 3
  store i32 %26, i32* %27, align 8
  %28 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 1, i32 2
  store i32 0, i32* %28, align 4
  br label %29

; <label>:29:                                     ; preds = %1, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %1 ]
  ret i32 %.0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !2}
!9 = distinct !{!9, !4, !5}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14, !15}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = !{!15}
!17 = !{!14}
!18 = distinct !{!18, !4, !5}
!19 = distinct !{!19, !4, !5}
!20 = distinct !{!20, !7, !4, !5}
