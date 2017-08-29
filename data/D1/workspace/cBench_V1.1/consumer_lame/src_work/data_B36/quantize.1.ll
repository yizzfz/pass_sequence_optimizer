; ModuleID = 'quantize.ll'
source_filename = "quantize.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.scalefac_struct = type { [23 x i32], [14 x i32] }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_psy_ratio = type { %struct.III_psy_xmin, %struct.III_psy_xmin }
%struct.III_psy_xmin = type { [22 x double], [13 x [3 x double]] }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }
%struct.III_scalefac_t = type { [22 x i32], [13 x [3 x i32]] }

@convert_mdct = external local_unnamed_addr global i32, align 4
@reduce_sidechannel = external local_unnamed_addr global i32, align 4
@masking_lower = external local_unnamed_addr global float, align 4
@.str = private unnamed_addr constant [20 x i8] c"this_bits>=min_bits\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"quantize.c\00", align 1
@__PRETTY_FUNCTION__.VBR_iteration_loop = private unnamed_addr constant [171 x i8] c"void VBR_iteration_loop(lame_global_flags *, FLOAT8 (*)[2], FLOAT8 *, FLOAT8 (*)[2][576], III_psy_ratio (*)[2], III_side_info_t *, int (*)[2][576], III_scalefac_t (*)[2])\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"this_bits<=max_bits\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"(int)cod_info->part2_3_length <= max_bits\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"used_bits <= bits\00", align 1
@nr_of_sfb_block = external global [6 x [3 x [4 x i32]]], align 16
@outer_loop.OldValue = internal unnamed_addr global [2 x i32] [i32 180, i32 180], align 4
@.str.5 = private unnamed_addr constant [15 x i8] c"iteration != 1\00", align 1
@__PRETTY_FUNCTION__.outer_loop = private unnamed_addr constant [135 x i8] c"void outer_loop(lame_global_flags *, FLOAT8 *, int, FLOAT8 *, III_psy_xmin *, int *, III_scalefac_t *, gr_info *, FLOAT8 (*)[21], int)\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"cod_info->global_gain < 256\00", align 1
@pretab = external local_unnamed_addr global [21 x i32], align 16
@.str.7 = private unnamed_addr constant [8 x i8] c"s<Q_MAX\00", align 1
@__PRETTY_FUNCTION__.calc_noise1 = private unnamed_addr constant [140 x i8] c"int calc_noise1(FLOAT8 *, int *, gr_info *, FLOAT8 (*)[21], FLOAT8 (*)[21], III_psy_xmin *, III_scalefac_t *, FLOAT8 *, FLOAT8 *, FLOAT8 *)\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"s>=0\00", align 1
@pow20 = external local_unnamed_addr global [256 x double], align 16
@scalefac_band = external local_unnamed_addr global %struct.scalefac_struct, align 4
@pow43 = external local_unnamed_addr global [8208 x double], align 16

; Function Attrs: noinline nounwind uwtable
define void @iteration_loop(%struct.lame_global_flags*, [2 x double]*, double* nocapture readonly, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*) local_unnamed_addr #0 {
  %9 = alloca [4 x double], align 16
  %10 = alloca [2 x %struct.III_psy_xmin], align 16
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [2 x i32], align 4
  tail call void @iteration_init(%struct.lame_global_flags* %0, %struct.III_side_info_t* %5, [2 x [576 x i32]]* %6) #8
  call void @getframebits(%struct.lame_global_flags* %0, i32* nonnull %11, i32* nonnull %12) #8
  %14 = load i32, i32* %12, align 4
  %15 = load i32, i32* %11, align 4
  %16 = call i32 @ResvFrameBegin(%struct.lame_global_flags* %0, %struct.III_side_info_t* %5, i32 %14, i32 %15) #8
  %17 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %18 = load i32, i32* %17, align 8
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %8
  %20 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 0
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %22 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 64
  %23 = getelementptr inbounds [4 x double], [4 x double]* %9, i64 0, i64 0
  %24 = bitcast [4 x double]* %9 to i8*
  br label %25

; <label>:25:                                     ; preds = %.lr.ph7, %._crit_edge
  %indvars.iv11 = phi i64 [ 0, %.lr.ph7 ], [ %indvars.iv.next12, %._crit_edge ]
  %26 = load i32, i32* @convert_mdct, align 4
  %27 = icmp eq i32 %26, 0
  %28 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv11, i64 0
  br i1 %27, label %30, label %29

; <label>:29:                                     ; preds = %25
  call void @ms_convert([576 x double]* %28, [576 x double]* %28) #8
  br label %30

; <label>:30:                                     ; preds = %25, %29
  %31 = load i32, i32* %12, align 4
  %32 = trunc i64 %indvars.iv11 to i32
  call void @on_pe(%struct.lame_global_flags* nonnull %0, [2 x double]* %1, %struct.III_side_info_t* %5, i32* nonnull %20, i32 %31, i32 %32) #8
  %33 = load i32, i32* @reduce_sidechannel, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %.preheader, label %35

; <label>:35:                                     ; preds = %30
  %36 = getelementptr inbounds double, double* %2, i64 %indvars.iv11
  %37 = load double, double* %36, align 8
  %38 = load i32, i32* %12, align 4
  call void @reduce_side(i32* nonnull %20, double %37, i32 %38) #8
  br label %.preheader

.preheader:                                       ; preds = %30, %35
  %39 = load i32, i32* %21, align 4
  %40 = icmp sgt i32 %39, 0
  br i1 %40, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %41 = trunc i64 %indvars.iv11 to i32
  %42 = trunc i64 %indvars.iv11 to i32
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %87
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %87 ], [ 0, %.lr.ph.preheader ]
  %43 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv11, i32 0, i64 %indvars.iv9, i32 0
  %44 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv11, i64 %indvars.iv9, i64 0
  %45 = call i32 @init_outer_loop(%struct.lame_global_flags* nonnull %0, double* %44, %struct.gr_info* %43)
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %52

; <label>:47:                                     ; preds = %.lr.ph
  %48 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %7, i64 %indvars.iv11, i64 %indvars.iv9
  %49 = bitcast %struct.III_scalefac_t* %48 to i8*
  call void @llvm.memset.p0i8.i64(i8* %49, i8 0, i64 244, i32 4, i1 false)
  %50 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv11, i64 %indvars.iv9, i64 0
  %51 = bitcast i32* %50 to i8*
  call void @llvm.memset.p0i8.i64(i8* %51, i8 0, i64 2304, i32 4, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull %24, i8 0, i64 32, i32 16, i1 false)
  br label %61

; <label>:52:                                     ; preds = %.lr.ph
  %53 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %4, i64 %indvars.iv11, i64 %indvars.iv9
  %54 = getelementptr inbounds [2 x %struct.III_psy_xmin], [2 x %struct.III_psy_xmin]* %10, i64 0, i64 %indvars.iv9
  %55 = call i32 @calc_xmin(%struct.lame_global_flags* nonnull %0, double* %44, %struct.III_psy_ratio* %53, %struct.gr_info* %43, %struct.III_psy_xmin* %54) #8
  %56 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 %indvars.iv9
  %57 = load i32, i32* %56, align 4
  %58 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv11, i64 %indvars.iv9, i64 0
  %59 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %7, i64 %indvars.iv11, i64 %indvars.iv9
  %60 = trunc i64 %indvars.iv9 to i32
  call void @outer_loop(%struct.lame_global_flags* nonnull %0, double* %44, i32 %57, double* nonnull %23, %struct.III_psy_xmin* %54, i32* %58, %struct.III_scalefac_t* %59, %struct.gr_info* %43, [21 x double]* undef, i32 %60)
  br label %61

; <label>:61:                                     ; preds = %52, %47
  %62 = trunc i64 %indvars.iv9 to i32
  call void @best_scalefac_store(%struct.lame_global_flags* nonnull %0, i32 %41, i32 %62, [2 x [576 x i32]]* %6, %struct.III_side_info_t* %5, [2 x %struct.III_scalefac_t]* %7) #8
  %63 = load i32, i32* %22, align 4
  %64 = icmp eq i32 %63, 1
  br i1 %64, label %65, label %72

; <label>:65:                                     ; preds = %61
  %66 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv11, i32 0, i64 %indvars.iv9, i32 0, i32 6
  %67 = load i32, i32* %66, align 8
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %72

; <label>:69:                                     ; preds = %65
  %70 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv11, i64 %indvars.iv9, i64 0
  %71 = trunc i64 %indvars.iv9 to i32
  call void @best_huffman_divide(i32 %42, i32 %71, %struct.gr_info* nonnull %43, i32* %70) #8
  br label %72

; <label>:72:                                     ; preds = %69, %65, %61
  %73 = load i32, i32* %12, align 4
  call void @ResvAdjust(%struct.lame_global_flags* nonnull %0, %struct.gr_info* %43, %struct.III_side_info_t* %5, i32 %73) #8
  br label %74

; <label>:74:                                     ; preds = %98, %72
  %indvars.iv = phi i64 [ 0, %72 ], [ %indvars.iv.next.1, %98 ]
  %75 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv11, i64 %indvars.iv9, i64 %indvars.iv
  %76 = load double, double* %75, align 8
  %77 = fcmp olt double %76, 0.000000e+00
  %78 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv11, i64 %indvars.iv9, i64 %indvars.iv
  br i1 %77, label %79, label %82

; <label>:79:                                     ; preds = %74
  %80 = load i32, i32* %78, align 4
  %81 = sub nsw i32 0, %80
  store i32 %81, i32* %78, align 4
  br label %82

; <label>:82:                                     ; preds = %74, %79
  %indvars.iv.next = or i64 %indvars.iv, 1
  %83 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv11, i64 %indvars.iv9, i64 %indvars.iv.next
  %84 = load double, double* %83, align 8
  %85 = fcmp olt double %84, 0.000000e+00
  %86 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv11, i64 %indvars.iv9, i64 %indvars.iv.next
  br i1 %85, label %95, label %98

; <label>:87:                                     ; preds = %98
  %indvars.iv.next10 = add nuw i64 %indvars.iv9, 1
  %88 = load i32, i32* %21, align 4
  %89 = sext i32 %88 to i64
  %90 = icmp slt i64 %indvars.iv.next10, %89
  br i1 %90, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %87
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %indvars.iv.next12 = add nuw i64 %indvars.iv11, 1
  %91 = load i32, i32* %17, align 8
  %92 = sext i32 %91 to i64
  %93 = icmp slt i64 %indvars.iv.next12, %92
  br i1 %93, label %25, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %8
  %94 = load i32, i32* %12, align 4
  call void @ResvFrameEnd(%struct.lame_global_flags* nonnull %0, %struct.III_side_info_t* %5, i32 %94) #8
  ret void

; <label>:95:                                     ; preds = %82
  %96 = load i32, i32* %86, align 4
  %97 = sub nsw i32 0, %96
  store i32 %97, i32* %86, align 4
  br label %98

; <label>:98:                                     ; preds = %95, %82
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 576
  br i1 %exitcond.1, label %87, label %74
}

declare void @iteration_init(%struct.lame_global_flags*, %struct.III_side_info_t*, [2 x [576 x i32]]*) local_unnamed_addr #1

declare void @getframebits(%struct.lame_global_flags*, i32*, i32*) local_unnamed_addr #1

declare i32 @ResvFrameBegin(%struct.lame_global_flags*, %struct.III_side_info_t*, i32, i32) local_unnamed_addr #1

declare void @ms_convert([576 x double]*, [576 x double]*) local_unnamed_addr #1

declare void @on_pe(%struct.lame_global_flags*, [2 x double]*, %struct.III_side_info_t*, i32*, i32, i32) local_unnamed_addr #1

declare void @reduce_side(i32*, double, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @init_outer_loop(%struct.lame_global_flags* nocapture readonly, double* nocapture readonly, %struct.gr_info*) local_unnamed_addr #0 {
  %4 = alloca [3 x double], align 16
  %scevgep = getelementptr %struct.gr_info, %struct.gr_info* %2, i64 0, i32 20, i64 0
  %scevgep50 = bitcast i32* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50, i8 0, i64 16, i32 4, i1 false)
  %5 = bitcast [3 x double]* %4 to i8*
  %6 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 19
  store i32* getelementptr inbounds ([6 x [3 x [4 x i32]]], [6 x [3 x [4 x i32]]]* @nr_of_sfb_block, i64 0, i64 0, i64 0, i64 0), i32** %6, align 8
  %7 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 0
  store i32 0, i32* %7, align 8
  %8 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 1
  store i32 0, i32* %8, align 4
  %9 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 2
  store i32 0, i32* %9, align 8
  %10 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 4
  store i32 0, i32* %10, align 8
  %11 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 8, i64 0
  %12 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 15
  store i32 0, i32* %12, align 4
  %13 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 3
  %14 = bitcast i32* %11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 40, i32 8, i1 false)
  store i32 210, i32* %13, align 4
  %15 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 14
  store i32 0, i32* %15, align 8
  %16 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 18
  store i32 0, i32* %16, align 8
  %17 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 20
  %18 = load i32, i32* %17, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.preheader.preheader, label %20

.preheader.preheader:                             ; preds = %20, %3
  br label %.preheader

; <label>:20:                                     ; preds = %3
  %21 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 6
  %22 = load i32, i32* %21, align 8
  %23 = icmp eq i32 %22, 2
  br i1 %23, label %.preheader11.preheader, label %.preheader.preheader

.preheader11.preheader:                           ; preds = %20
  call void @llvm.memset.p0i8.i64(i8* nonnull %5, i8 0, i64 24, i32 16, i1 false)
  %24 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 0
  %25 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 1
  %26 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 2
  %.promoted = load double, double* %24, align 16
  %.promoted51 = load double, double* %25, align 8
  %.promoted53 = load double, double* %26, align 16
  br label %27

; <label>:27:                                     ; preds = %27, %.preheader11.preheader
  %28 = phi double [ %.promoted53, %.preheader11.preheader ], [ %54, %27 ]
  %29 = phi double [ %.promoted51, %.preheader11.preheader ], [ %50, %27 ]
  %30 = phi double [ %.promoted, %.preheader11.preheader ], [ %46, %27 ]
  %indvars.iv42 = phi i64 [ 0, %.preheader11.preheader ], [ %indvars.iv.next43.1, %27 ]
  %.0322 = phi i32 [ 0, %.preheader11.preheader ], [ %55, %27 ]
  %31 = getelementptr inbounds double, double* %1, i64 %indvars.iv42
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %32
  %34 = fadd double %30, %33
  %indvars.iv.next41 = or i64 %indvars.iv42, 1
  %35 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next41
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %36
  %38 = fadd double %29, %37
  %indvars.iv.next41.1 = add nuw nsw i64 %indvars.iv42, 2
  %39 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next41.1
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fadd double %28, %41
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 3
  %43 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next43
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %44
  %46 = fadd double %34, %45
  %indvars.iv.next41.159 = add nsw i64 %indvars.iv42, 4
  %47 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next41.159
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %48
  %50 = fadd double %38, %49
  %indvars.iv.next41.1.1 = add nsw i64 %indvars.iv42, 5
  %51 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next41.1.1
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %52
  %54 = fadd double %42, %53
  %55 = add nsw i32 %.0322, 2
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 6
  %exitcond.1 = icmp eq i32 %55, 192
  br i1 %exitcond.1, label %.preheader8, label %27

.preheader8:                                      ; preds = %27
  store double %46, double* %24, align 16
  store double %50, double* %25, align 8
  store double %54, double* %26, align 16
  %56 = fcmp olt double %46, 1.000000e-12
  %57 = select i1 %56, double 1.000000e-12, double %46
  %58 = fcmp ogt double %57, %50
  %59 = select i1 %58, double %57, double %50
  %60 = fcmp ogt double %59, %54
  %61 = select i1 %60, double %59, double %54
  %62 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 0
  %63 = load double, double* %62, align 16
  %64 = fcmp ogt double %63, 1.000000e-12
  %65 = select i1 %64, double %63, double 1.000000e-12
  %66 = fdiv double %65, %61
  store double %66, double* %62, align 16
  %67 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 1
  %68 = load double, double* %67, align 8
  %69 = fcmp ogt double %68, 1.000000e-12
  %70 = select i1 %69, double %68, double 1.000000e-12
  %71 = fdiv double %70, %61
  store double %71, double* %67, align 8
  %72 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 2
  %73 = load double, double* %72, align 16
  %74 = fcmp ogt double %73, 1.000000e-12
  %75 = select i1 %74, double %73, double 1.000000e-12
  %76 = fdiv double %75, %61
  store double %76, double* %72, align 16
  %77 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 0
  %78 = load double, double* %77, align 16
  %79 = tail call double @log(double %78) #8
  %80 = fmul double %79, -5.000000e-01
  %81 = fdiv double %80, 0x3FE62E42FEFA39EF
  %82 = fadd double %81, 5.000000e-01
  %83 = fptosi double %82 to i32
  %84 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 9, i64 0
  store i32 %83, i32* %84, align 4
  %85 = icmp sgt i32 %83, 2
  br i1 %85, label %.sink.split, label %86

; <label>:86:                                     ; preds = %.preheader8
  %87 = icmp slt i32 %83, 0
  br i1 %87, label %.sink.split, label %.preheader8.131

.sink.split:                                      ; preds = %.preheader8, %86
  %.sink = phi i32 [ 0, %86 ], [ 2, %.preheader8 ]
  store i32 %.sink, i32* %84, align 4
  br label %.preheader8.131

.preheader8.131:                                  ; preds = %.sink.split, %86
  %88 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 1
  %89 = load double, double* %88, align 8
  %90 = tail call double @log(double %89) #8
  %91 = fmul double %90, -5.000000e-01
  %92 = fdiv double %91, 0x3FE62E42FEFA39EF
  %93 = fadd double %92, 5.000000e-01
  %94 = fptosi double %93 to i32
  %95 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 9, i64 1
  store i32 %94, i32* %95, align 4
  %96 = icmp sgt i32 %94, 2
  br i1 %96, label %.sink.split.1, label %115

.preheader.126:                                   ; preds = %.preheader
  %indvars.iv.next = or i64 %indvars.iv, 1
  %97 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %98 = load double, double* %97, align 8
  %99 = tail call double @fabs(double %98) #9
  %100 = fcmp ogt double %99, 1.000000e-99
  br i1 %100, label %.loopexit.loopexit, label %.preheader.227

.preheader:                                       ; preds = %.preheader.preheader, %113
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %113 ], [ 0, %.preheader.preheader ]
  %101 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %102 = load double, double* %101, align 8
  %103 = tail call double @fabs(double %102) #9
  %104 = fcmp ogt double %103, 1.000000e-99
  br i1 %104, label %.loopexit.loopexit, label %.preheader.126

.loopexit.loopexit:                               ; preds = %113, %.preheader.328, %.preheader.227, %.preheader.126, %.preheader
  %.0.ph = phi i32 [ 0, %113 ], [ 1, %.preheader.328 ], [ 1, %.preheader.227 ], [ 1, %.preheader.126 ], [ 1, %.preheader ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %128
  %.0 = phi i32 [ %., %128 ], [ %.0.ph, %.loopexit.loopexit ]
  ret i32 %.0

.preheader.227:                                   ; preds = %.preheader.126
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %105 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %106 = load double, double* %105, align 8
  %107 = tail call double @fabs(double %106) #9
  %108 = fcmp ogt double %107, 1.000000e-99
  br i1 %108, label %.loopexit.loopexit, label %.preheader.328

.preheader.328:                                   ; preds = %.preheader.227
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %109 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  %110 = load double, double* %109, align 8
  %111 = tail call double @fabs(double %110) #9
  %112 = fcmp ogt double %111, 1.000000e-99
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %112, label %.loopexit.loopexit, label %113

; <label>:113:                                    ; preds = %.preheader.328
  %114 = icmp slt i64 %indvars.iv.next.3, 576
  br i1 %114, label %.preheader, label %.loopexit.loopexit

; <label>:115:                                    ; preds = %.preheader8.131
  %116 = icmp slt i32 %94, 0
  br i1 %116, label %.sink.split.1, label %.preheader8.232

.sink.split.1:                                    ; preds = %115, %.preheader8.131
  %.sink.1 = phi i32 [ 0, %115 ], [ 2, %.preheader8.131 ]
  store i32 %.sink.1, i32* %95, align 4
  br label %.preheader8.232

.preheader8.232:                                  ; preds = %.sink.split.1, %115
  %117 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 2
  %118 = load double, double* %117, align 16
  %119 = tail call double @log(double %118) #8
  %120 = fmul double %119, -5.000000e-01
  %121 = fdiv double %120, 0x3FE62E42FEFA39EF
  %122 = fadd double %121, 5.000000e-01
  %123 = fptosi double %122 to i32
  %124 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 9, i64 2
  store i32 %123, i32* %124, align 4
  %125 = icmp sgt i32 %123, 2
  br i1 %125, label %.sink.split.2, label %126

; <label>:126:                                    ; preds = %.preheader8.232
  %127 = icmp slt i32 %123, 0
  br i1 %127, label %.sink.split.2, label %128

.sink.split.2:                                    ; preds = %126, %.preheader8.232
  %.sink.2 = phi i32 [ 0, %126 ], [ 2, %.preheader8.232 ]
  store i32 %.sink.2, i32* %124, align 4
  br label %128

; <label>:128:                                    ; preds = %.sink.split.2, %126
  %129 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 0
  %130 = load double, double* %129, align 16
  %131 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 1
  %132 = load double, double* %131, align 8
  %133 = fadd double %130, %132
  %134 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 0, i64 2
  %135 = load double, double* %134, align 16
  %136 = fadd double %133, %135
  %137 = fcmp ogt double %136, 1.000000e-99
  %. = zext i1 %137 to i32
  br label %.loopexit
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

declare i32 @calc_xmin(%struct.lame_global_flags*, double*, %struct.III_psy_ratio*, %struct.gr_info*, %struct.III_psy_xmin*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @outer_loop(%struct.lame_global_flags*, double* nocapture readonly, i32, double* nocapture, %struct.III_psy_xmin* nocapture readonly, i32* nocapture, %struct.III_scalefac_t* nocapture, %struct.gr_info*, [21 x double]* nocapture readnone, i32) local_unnamed_addr #0 {
  %11 = alloca %struct.III_scalefac_t, align 4
  %12 = alloca %struct.gr_info, align 8
  %13 = alloca [576 x i32], align 16
  %14 = alloca [576 x double], align 16
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca [4 x [21 x double]], align 16
  %19 = alloca [4 x [21 x double]], align 16
  %20 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %7, i64 0, i32 15
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 62
  %22 = getelementptr inbounds [576 x double], [576 x double]* %14, i64 0, i64 0
  %23 = getelementptr inbounds [4 x [21 x double]], [4 x [21 x double]]* %19, i64 0, i64 0
  %24 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %25 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %7, i64 0, i32 13
  %26 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 19
  %27 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %7, i64 0, i32 13
  %28 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %7, i64 0, i32 3
  %29 = getelementptr inbounds [576 x double], [576 x double]* %14, i64 0, i64 0
  %30 = getelementptr inbounds [576 x i32], [576 x i32]* %13, i64 0, i64 0
  %31 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %7, i64 0, i32 0
  %32 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 61
  %33 = bitcast %struct.III_scalefac_t* %6 to i8*
  %34 = bitcast %struct.III_scalefac_t* %11 to i8*
  %35 = bitcast i32* %5 to i8*
  %36 = bitcast [576 x i32]* %13 to i8*
  %37 = bitcast %struct.gr_info* %12 to i8*
  %38 = bitcast %struct.gr_info* %7 to i8*
  %39 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 18
  %40 = getelementptr inbounds [576 x i32], [576 x i32]* %13, i64 0, i64 0
  %41 = getelementptr inbounds [4 x [21 x double]], [4 x [21 x double]]* %18, i64 0, i64 0
  %42 = getelementptr inbounds [4 x [21 x double]], [4 x [21 x double]]* %19, i64 0, i64 0
  %43 = bitcast %struct.III_scalefac_t* %11 to i8*
  %44 = sext i32 %9 to i64
  %45 = getelementptr inbounds [2 x i32], [2 x i32]* @outer_loop.OldValue, i64 0, i64 %44
  %46 = getelementptr inbounds [576 x i32], [576 x i32]* %13, i64 0, i64 0
  %47 = getelementptr inbounds [576 x double], [576 x double]* %14, i64 0, i64 0
  %48 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %7, i64 0, i32 3
  br label %.thread32.backedge.thread61

.thread32.backedge.thread61:                      ; preds = %.thread32.backedge.thread61.backedge, %10
  %.0646 = phi i1 [ false, %10 ], [ %.0646.be, %.thread32.backedge.thread61.backedge ]
  %.0945 = phi double [ 0.000000e+00, %10 ], [ %.211, %.thread32.backedge.thread61.backedge ]
  %.01244 = phi double [ 0.000000e+00, %10 ], [ %.214, %.thread32.backedge.thread61.backedge ]
  %.01543 = phi double [ 0.000000e+00, %10 ], [ %.217, %.thread32.backedge.thread61.backedge ]
  %.01842 = phi i32 [ 100, %10 ], [ %.220, %.thread32.backedge.thread61.backedge ]
  %.02640 = phi i32 [ 0, %10 ], [ %49, %.thread32.backedge.thread61.backedge ]
  %.02939 = phi i32 [ 0, %10 ], [ %.130, %.thread32.backedge.thread61.backedge ]
  %49 = add nuw nsw i32 %.02640, 1
  br i1 %.0646, label %77, label %50

; <label>:50:                                     ; preds = %.thread32.backedge.thread61
  call void @llvm.memset.p0i8.i64(i8* nonnull %43, i8 0, i64 244, i32 4, i1 false)
  br label %51

; <label>:51:                                     ; preds = %51, %50
  %indvars.iv = phi i64 [ 0, %50 ], [ %indvars.iv.next.2, %51 ]
  %52 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = call double @fabs(double %53) #9
  %55 = call double @sqrt(double %54) #8
  %56 = fmul double %54, %55
  %57 = call double @sqrt(double %56) #8
  %58 = getelementptr inbounds [576 x double], [576 x double]* %14, i64 0, i64 %indvars.iv
  store double %57, double* %58, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %60 = load double, double* %59, align 8
  %61 = call double @fabs(double %60) #9
  %62 = call double @sqrt(double %61) #8
  %63 = fmul double %61, %62
  %64 = call double @sqrt(double %63) #8
  %65 = getelementptr inbounds [576 x double], [576 x double]* %14, i64 0, i64 %indvars.iv.next
  store double %64, double* %65, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %66 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %67 = load double, double* %66, align 8
  %68 = call double @fabs(double %67) #9
  %69 = call double @sqrt(double %68) #8
  %70 = fmul double %68, %69
  %71 = call double @sqrt(double %70) #8
  %72 = getelementptr inbounds [576 x double], [576 x double]* %14, i64 0, i64 %indvars.iv.next.1
  store double %71, double* %72, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 576
  br i1 %exitcond.2, label %73, label %51

; <label>:73:                                     ; preds = %51
  %74 = load i32, i32* %45, align 4
  %75 = call i32 @bin_search_StepSize2(%struct.lame_global_flags* %0, i32 %2, i32 %74, i32* nonnull %46, double* nonnull %47, %struct.gr_info* %7) #8
  %76 = load i32, i32* %48, align 4
  store i32 %76, i32* %45, align 4
  br label %77

; <label>:77:                                     ; preds = %.thread32.backedge.thread61, %73
  %.130 = phi i32 [ %75, %73 ], [ %.02939, %.thread32.backedge.thread61 ]
  %78 = load i32, i32* %20, align 4
  %79 = sub i32 %2, %78
  %80 = icmp slt i32 %79, 0
  %81 = icmp eq i32 %.02640, 0
  br i1 %80, label %82, label %84

; <label>:82:                                     ; preds = %77
  br i1 %81, label %83, label %.thread32.backedge.thread

; <label>:83:                                     ; preds = %82
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 805, i8* getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.outer_loop, i64 0, i64 0)) #10
  unreachable

; <label>:84:                                     ; preds = %77
  br i1 %81, label %85, label %.sink.split

; <label>:85:                                     ; preds = %84
  %86 = icmp sgt i32 %.130, %79
  br i1 %86, label %87, label %91

; <label>:87:                                     ; preds = %85
  %88 = load i32, i32* %28, align 4
  %89 = add i32 %88, 1
  store i32 %89, i32* %28, align 4
  br label %.sink.split

.sink.split:                                      ; preds = %84, %87
  %90 = call i32 @inner_loop(%struct.lame_global_flags* %0, double* nonnull %29, i32* nonnull %30, i32 %79, %struct.gr_info* nonnull %7) #8
  br label %91

; <label>:91:                                     ; preds = %.sink.split, %85
  %.1 = phi i32 [ %.130, %85 ], [ %90, %.sink.split ]
  store i32 %.1, i32* %31, align 8
  %92 = load i32, i32* %32, align 8
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %96, label %94

; <label>:94:                                     ; preds = %91
  %95 = call i32 @calc_noise1(double* %1, i32* nonnull %40, %struct.gr_info* nonnull %7, [21 x double]* nonnull %41, [21 x double]* nonnull %42, %struct.III_psy_xmin* %4, %struct.III_scalefac_t* nonnull %11, double* nonnull %16, double* nonnull %17, double* nonnull %15)
  br label %96

; <label>:96:                                     ; preds = %91, %94
  %.122 = phi i32 [ %95, %94 ], [ 0, %91 ]
  br i1 %81, label %.thread, label %97

; <label>:97:                                     ; preds = %96
  %98 = load i32, i32* %39, align 4
  %99 = load double, double* %17, align 8
  %100 = load double, double* %16, align 8
  %101 = load double, double* %15, align 8
  %102 = call i32 @quant_compare(i32 %98, i32 %.01842, double %.0945, double %.01244, double %.01543, i32 %.122, double %99, double %100, double %101)
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %107, label %.thread

.thread:                                          ; preds = %96, %97
  %104 = load double, double* %15, align 8
  %105 = load double, double* %16, align 8
  %106 = load double, double* %17, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* nonnull %34, i64 244, i32 4, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %35, i8* nonnull %36, i64 2304, i32 4, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %37, i8* %38, i64 120, i32 8, i1 false)
  br label %107

; <label>:107:                                    ; preds = %.thread, %97
  %.220 = phi i32 [ %.01842, %97 ], [ %.122, %.thread ]
  %.217 = phi double [ %.01543, %97 ], [ %104, %.thread ]
  %.214 = phi double [ %.01244, %97 ], [ %105, %.thread ]
  %.211 = phi double [ %.0945, %97 ], [ %106, %.thread ]
  %108 = load i32, i32* %21, align 4
  %109 = or i32 %108, %.122
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %.thread32.backedge.thread.loopexit, label %111

; <label>:111:                                    ; preds = %107
  call void @amp_scalefac_bands(double* nonnull %22, %struct.gr_info* %7, %struct.III_scalefac_t* nonnull %11, [21 x double]* nonnull %23)
  %112 = call i32 @loop_break(%struct.III_scalefac_t* nonnull %11, %struct.gr_info* %7) #8
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %.thread32.backedge.thread.loopexit

; <label>:114:                                    ; preds = %111
  %115 = load i32, i32* %24, align 8
  %116 = icmp eq i32 %115, 1
  br i1 %116, label %117, label %119

; <label>:117:                                    ; preds = %114
  %118 = call i32 @scale_bitcount(%struct.III_scalefac_t* nonnull %11, %struct.gr_info* %7) #8
  br label %121

; <label>:119:                                    ; preds = %114
  %120 = call i32 @scale_bitcount_lsf(%struct.III_scalefac_t* nonnull %11, %struct.gr_info* %7) #8
  br label %121

; <label>:121:                                    ; preds = %119, %117
  %.027 = phi i32 [ %118, %117 ], [ %120, %119 ]
  %122 = icmp eq i32 %.027, 0
  br i1 %122, label %.thread32.backedge.thread61.backedge, label %123

; <label>:123:                                    ; preds = %121
  %124 = load i32, i32* %25, align 4
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %.thread32.backedge.thread.loopexit

; <label>:126:                                    ; preds = %123
  %127 = load i32, i32* %26, align 8
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %.thread32.backedge.thread.loopexit, label %.thread32.backedge.thread58

.thread32.backedge.thread58:                      ; preds = %126
  %129 = call i32 @init_outer_loop(%struct.lame_global_flags* nonnull %0, double* %1, %struct.gr_info* nonnull %7)
  store i32 1, i32* %27, align 4
  br label %.thread32.backedge.thread61.backedge

.thread32.backedge.thread61.backedge:             ; preds = %.thread32.backedge.thread58, %121
  %.0646.be = phi i1 [ false, %.thread32.backedge.thread58 ], [ true, %121 ]
  br label %.thread32.backedge.thread61

.thread32.backedge.thread.loopexit:               ; preds = %126, %107, %123, %111
  br label %.thread32.backedge.thread

.thread32.backedge.thread:                        ; preds = %.thread32.backedge.thread.loopexit, %82
  %.2205057 = phi i32 [ %.01842, %82 ], [ %.220, %.thread32.backedge.thread.loopexit ]
  %.2175156 = phi double [ %.01543, %82 ], [ %.217, %.thread32.backedge.thread.loopexit ]
  %.2145255 = phi double [ %.01244, %82 ], [ %.214, %.thread32.backedge.thread.loopexit ]
  %.2115354 = phi double [ %.0945, %82 ], [ %.211, %.thread32.backedge.thread.loopexit ]
  %130 = bitcast %struct.gr_info* %7 to i8*
  %131 = bitcast %struct.gr_info* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %130, i8* nonnull %131, i64 120, i32 8, i1 false)
  %132 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %7, i64 0, i32 15
  %133 = load i32, i32* %132, align 4
  %134 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %7, i64 0, i32 0
  %135 = load i32, i32* %134, align 8
  %136 = add i32 %135, %133
  store i32 %136, i32* %134, align 8
  %137 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %7, i64 0, i32 3
  %138 = load i32, i32* %137, align 4
  %139 = icmp ult i32 %138, 256
  br i1 %139, label %141, label %140

; <label>:140:                                    ; preds = %.thread32.backedge.thread
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 891, i8* getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.outer_loop, i64 0, i64 0)) #10
  unreachable

; <label>:141:                                    ; preds = %.thread32.backedge.thread
  %142 = sitofp i32 %.2205057 to double
  store double %142, double* %3, align 8
  %143 = getelementptr inbounds double, double* %3, i64 1
  store double %.2175156, double* %143, align 8
  %144 = getelementptr inbounds double, double* %3, i64 2
  store double %.2145255, double* %144, align 8
  %145 = getelementptr inbounds double, double* %3, i64 3
  store double %.2115354, double* %145, align 8
  ret void
}

declare void @best_scalefac_store(%struct.lame_global_flags*, i32, i32, [2 x [576 x i32]]*, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]*) local_unnamed_addr #1

declare void @best_huffman_divide(i32, i32, %struct.gr_info*, i32*) local_unnamed_addr #1

declare void @ResvAdjust(%struct.lame_global_flags*, %struct.gr_info*, %struct.III_side_info_t*, i32) local_unnamed_addr #1

declare void @ResvFrameEnd(%struct.lame_global_flags*, %struct.III_side_info_t*, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @set_masking_lower(i32, i32) local_unnamed_addr #0 {
  %3 = shl i32 %0, 1
  %4 = add nsw i32 %3, -6
  %5 = sitofp i32 %4 to float
  %6 = add nsw i32 %1, -125
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.375000e+03
  %9 = fptrunc double %8 to float
  %10 = fadd float %9, -1.000000e+00
  %11 = fmul float %10, 4.000000e+00
  %12 = fadd float %5, %11
  %13 = fdiv float %12, 1.000000e+01
  %14 = fpext float %13 to double
  %15 = tail call double @pow(double 1.000000e+01, double %14) #8
  %16 = fptrunc double %15 to float
  store float %16, float* @masking_lower, align 4
  ret void
}

; Function Attrs: nounwind
declare double @pow(double, double) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define void @VBR_iteration_loop(%struct.lame_global_flags*, [2 x double]* nocapture readonly, double* nocapture readonly, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*) local_unnamed_addr #0 {
  %9 = alloca %struct.gr_info, align 8
  %10 = alloca %struct.gr_info, align 8
  %11 = alloca %struct.III_scalefac_t, align 4
  %12 = alloca [576 x i32], align 16
  %13 = alloca %struct.III_psy_xmin, align 8
  %14 = alloca [2 x [2 x i32]], align 16
  %15 = alloca [4 x double], align 16
  %16 = alloca [15 x i32], align 16
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  tail call void @iteration_init(%struct.lame_global_flags* %0, %struct.III_side_info_t* %5, [2 x [576 x i32]]* %6) #8
  %19 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 50
  store i32 1, i32* %19, align 4
  %20 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 48
  %21 = load i32, i32* %20, align 4
  %22 = icmp slt i32 %21, 1
  br i1 %22, label %._crit_edge123, label %.lr.ph122

.lr.ph122:                                        ; preds = %8
  %23 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 47
  %24 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  br label %25

; <label>:25:                                     ; preds = %33, %.lr.ph122
  %.017120 = phi i32 [ 0, %.lr.ph122 ], [ %.118, %33 ]
  call void @getframebits(%struct.lame_global_flags* nonnull %0, i32* nonnull %17, i32* nonnull %18) #8
  %26 = load i32, i32* %19, align 4
  %27 = load i32, i32* %23, align 8
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %29, label %33

; <label>:29:                                     ; preds = %25
  %30 = load i32, i32* %18, align 4
  %31 = load i32, i32* %24, align 4
  %32 = sdiv i32 %30, %31
  br label %33

; <label>:33:                                     ; preds = %29, %25
  %.118 = phi i32 [ %32, %29 ], [ %.017120, %25 ]
  %34 = load i32, i32* %18, align 4
  %35 = load i32, i32* %17, align 4
  %36 = call i32 @ResvFrameBegin(%struct.lame_global_flags* nonnull %0, %struct.III_side_info_t* %5, i32 %34, i32 %35) #8
  %37 = load i32, i32* %19, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [15 x i32], [15 x i32]* %16, i64 0, i64 %38
  store i32 %36, i32* %39, align 4
  %40 = add nsw i32 %37, 1
  store i32 %40, i32* %19, align 4
  %41 = load i32, i32* %20, align 4
  %42 = icmp slt i32 %37, %41
  br i1 %42, label %25, label %._crit_edge123.loopexit

._crit_edge123.loopexit:                          ; preds = %33
  br label %._crit_edge123

._crit_edge123:                                   ; preds = %._crit_edge123.loopexit, %8
  %.017.lcssa = phi i32 [ 0, %8 ], [ %.118, %._crit_edge123.loopexit ]
  %.lcssa71 = phi i32 [ %21, %8 ], [ %41, %._crit_edge123.loopexit ]
  store i32 %.lcssa71, i32* %19, align 4
  %43 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %44 = load i32, i32* %43, align 8
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %.lr.ph115, label %._crit_edge116

.lr.ph115:                                        ; preds = %._crit_edge123
  %46 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %47 = icmp sgt i32 %.017.lcssa, 125
  %..017 = select i1 %47, i32 %.017.lcssa, i32 125
  %48 = bitcast %struct.gr_info* %10 to i8*
  %49 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %50 = getelementptr inbounds [4 x double], [4 x double]* %15, i64 0, i64 0
  %51 = getelementptr inbounds [4 x double], [4 x double]* %15, i64 0, i64 3
  %52 = getelementptr inbounds [4 x double], [4 x double]* %15, i64 0, i64 2
  %53 = getelementptr inbounds [4 x double], [4 x double]* %15, i64 0, i64 1
  %54 = bitcast %struct.III_scalefac_t* %11 to i8*
  %55 = bitcast [576 x i32]* %12 to i8*
  %56 = bitcast %struct.gr_info* %9 to i8*
  %57 = bitcast [576 x i32]* %12 to i8*
  %58 = bitcast %struct.III_scalefac_t* %11 to i8*
  %59 = bitcast %struct.gr_info* %9 to i8*
  br label %60

; <label>:60:                                     ; preds = %.lr.ph115, %._crit_edge108
  %indvars.iv160 = phi i64 [ 0, %.lr.ph115 ], [ %indvars.iv.next161, %._crit_edge108 ]
  %.03113 = phi i32 [ 0, %.lr.ph115 ], [ %.14.lcssa, %._crit_edge108 ]
  %.024111 = phi i32 [ 0, %.lr.ph115 ], [ %.125.lcssa, %._crit_edge108 ]
  %61 = load i32, i32* %46, align 4
  %62 = load i32, i32* @reduce_sidechannel, align 4
  %63 = icmp eq i32 %62, 0
  %. = select i1 %63, i32 %61, i32 1
  %64 = load i32, i32* @convert_mdct, align 4
  %65 = icmp eq i32 %64, 0
  %66 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv160, i64 0
  br i1 %65, label %.preheader55, label %67

; <label>:67:                                     ; preds = %60
  call void @ms_convert([576 x double]* %66, [576 x double]* %66) #8
  br label %.preheader55

.preheader55:                                     ; preds = %60, %67
  %68 = icmp sgt i32 %., 0
  br i1 %68, label %.lr.ph107, label %._crit_edge108

.lr.ph107:                                        ; preds = %.preheader55
  %69 = sext i32 %. to i64
  br label %70

; <label>:70:                                     ; preds = %.lr.ph107, %165
  %indvars.iv158 = phi i64 [ 0, %.lr.ph107 ], [ %indvars.iv.next159, %165 ]
  %.14106 = phi i32 [ %.03113, %.lr.ph107 ], [ %.3, %165 ]
  %.125103 = phi i32 [ %.024111, %.lr.ph107 ], [ %.226, %165 ]
  %71 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv160, i32 0, i64 %indvars.iv158, i32 0
  %72 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv160, i64 %indvars.iv158, i64 0
  %73 = call i32 @init_outer_loop(%struct.lame_global_flags* %0, double* %72, %struct.gr_info* %71)
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %81

; <label>:75:                                     ; preds = %70
  %76 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %7, i64 %indvars.iv160, i64 %indvars.iv158
  %77 = bitcast %struct.III_scalefac_t* %76 to i8*
  call void @llvm.memset.p0i8.i64(i8* %77, i8 0, i64 244, i32 4, i1 false)
  %78 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv160, i64 %indvars.iv158, i64 0
  %79 = bitcast i32* %78 to i8*
  call void @llvm.memset.p0i8.i64(i8* %79, i8 0, i64 2304, i32 4, i1 false)
  %80 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv160, i64 %indvars.iv158
  store i32 0, i32* %80, align 4
  br label %165

; <label>:81:                                     ; preds = %70
  %82 = bitcast %struct.gr_info* %71 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %48, i8* %82, i64 120, i32 8, i1 false)
  %83 = load i32, i32* %49, align 4
  call void @set_masking_lower(i32 %83, i32 2500)
  %84 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %4, i64 %indvars.iv160, i64 %indvars.iv158
  %85 = call i32 @calc_xmin(%struct.lame_global_flags* %0, double* %72, %struct.III_psy_ratio* %84, %struct.gr_info* %71, %struct.III_psy_xmin* nonnull %13) #8
  %86 = icmp eq i32 %85, 0
  %...017 = select i1 %86, i32 125, i32 %..017
  %..14 = select i1 %86, i32 1, i32 %.14106
  %87 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv160, i32 0, i64 %indvars.iv158, i32 0, i32 6
  %88 = load i32, i32* %87, align 8
  %89 = icmp eq i32 %88, 2
  br i1 %89, label %90, label %99

; <label>:90:                                     ; preds = %81
  %91 = getelementptr inbounds [2 x double], [2 x double]* %1, i64 %indvars.iv160, i64 %indvars.iv158
  %92 = load double, double* %91, align 8
  %93 = fcmp olt double %92, 1.100000e+03
  %94 = select i1 %93, double 1.100000e+03, double %92
  %95 = sitofp i32 %...017 to double
  %96 = fadd double %95, %94
  %97 = fptosi double %96 to i32
  %98 = icmp slt i32 %97, 1800
  %.33 = select i1 %98, i32 %97, i32 1800
  br label %99

; <label>:99:                                     ; preds = %90, %81
  %.132 = phi i32 [ %.33, %90 ], [ %...017, %81 ]
  %100 = load i32, i32* %20, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [15 x i32], [15 x i32]* %16, i64 0, i64 %101
  %103 = load i32, i32* %102, align 4
  %104 = load i32, i32* %46, align 4
  %105 = load i32, i32* %43, align 8
  %106 = mul nsw i32 %105, %104
  %107 = sdiv i32 %103, %106
  %108 = add nsw i32 %107, 1200
  %109 = icmp slt i32 %108, 2500
  %.34 = select i1 %109, i32 %108, i32 2500
  %110 = icmp sgt i32 %.34, %.132
  %111 = select i1 %110, i32 %.34, i32 %.132
  %112 = sub nsw i32 %111, %.132
  %113 = sdiv i32 %112, 4
  %114 = add nsw i32 %111, %.132
  %115 = sdiv i32 %114, 2
  %116 = add nsw i32 %111, 1
  %117 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv160, i64 %indvars.iv158, i64 0
  %118 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %7, i64 %indvars.iv160, i64 %indvars.iv158
  %119 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %71, i64 0, i32 0
  %120 = bitcast %struct.III_scalefac_t* %118 to i8*
  %121 = bitcast i32* %117 to i8*
  %122 = trunc i64 %indvars.iv158 to i32
  br label %123

; <label>:123:                                    ; preds = %148, %99
  %.022 = phi i32 [ %113, %99 ], [ %.123, %148 ]
  %.019 = phi i32 [ %115, %99 ], [ %.221, %148 ]
  %.0 = phi i32 [ %116, %99 ], [ %.2, %148 ]
  %124 = icmp slt i32 %.019, %.132
  br i1 %124, label %125, label %126

; <label>:125:                                    ; preds = %123
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 400, i8* getelementptr inbounds ([171 x i8], [171 x i8]* @__PRETTY_FUNCTION__.VBR_iteration_loop, i64 0, i64 0)) #10
  unreachable

; <label>:126:                                    ; preds = %123
  %127 = icmp sgt i32 %.019, %111
  br i1 %127, label %128, label %129

; <label>:128:                                    ; preds = %126
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 401, i8* getelementptr inbounds ([171 x i8], [171 x i8]* @__PRETTY_FUNCTION__.VBR_iteration_loop, i64 0, i64 0)) #10
  unreachable

; <label>:129:                                    ; preds = %126
  %130 = icmp slt i32 %.019, %.0
  br i1 %130, label %133, label %131

; <label>:131:                                    ; preds = %129
  %132 = sub nsw i32 %.019, %.022
  br label %148

; <label>:133:                                    ; preds = %129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %82, i8* nonnull %48, i64 120, i32 8, i1 false)
  %134 = load i32, i32* %49, align 4
  call void @set_masking_lower(i32 %134, i32 %.019)
  %135 = call i32 @calc_xmin(%struct.lame_global_flags* %0, double* %72, %struct.III_psy_ratio* %84, %struct.gr_info* %71, %struct.III_psy_xmin* nonnull %13) #8
  call void @outer_loop(%struct.lame_global_flags* %0, double* %72, i32 %.019, double* nonnull %50, %struct.III_psy_xmin* nonnull %13, i32* %117, %struct.III_scalefac_t* %118, %struct.gr_info* %71, [21 x double]* undef, i32 %122)
  %136 = load double, double* %50, align 16
  %137 = fptosi double %136 to i32
  %138 = load double, double* %51, align 8
  %139 = load double, double* %52, align 16
  %140 = load double, double* %53, align 8
  %141 = call i32 @VBR_compare(i32 0, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, i32 %137, double %138, double %139, double %140)
  %142 = icmp eq i32 %141, 0
  br i1 %142, label %146, label %143

; <label>:143:                                    ; preds = %133
  %144 = load i32, i32* %119, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %54, i8* %120, i64 244, i32 4, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %55, i8* %121, i64 2304, i32 4, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %56, i8* nonnull %82, i64 120, i32 8, i1 false)
  %145 = sub nsw i32 %.019, %.022
  br label %148

; <label>:146:                                    ; preds = %133
  %147 = add nsw i32 %.019, %.022
  br label %148

; <label>:148:                                    ; preds = %143, %146, %131
  %.221 = phi i32 [ %132, %131 ], [ %145, %143 ], [ %147, %146 ]
  %.2 = phi i32 [ %.0, %131 ], [ %144, %143 ], [ %.0, %146 ]
  %.123 = sdiv i32 %.022, 2
  %149 = icmp sgt i32 %.022, 21
  br i1 %149, label %123, label %150

; <label>:150:                                    ; preds = %148
  %151 = icmp sgt i32 %.2, %111
  br i1 %151, label %157, label %152

; <label>:152:                                    ; preds = %150
  %153 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv160, i64 %indvars.iv158, i64 0
  %154 = bitcast i32* %153 to i8*
  %155 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %7, i64 %indvars.iv160, i64 %indvars.iv158
  %156 = bitcast %struct.III_scalefac_t* %155 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %82, i8* nonnull %59, i64 120, i32 8, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %156, i8* nonnull %58, i64 244, i32 4, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %154, i8* nonnull %57, i64 2304, i32 4, i1 false)
  br label %157

; <label>:157:                                    ; preds = %150, %152
  %158 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %71, i64 0, i32 0
  %159 = load i32, i32* %158, align 8
  %160 = icmp sgt i32 %159, %111
  br i1 %160, label %161, label %162

; <label>:161:                                    ; preds = %157
  call void @__assert_fail(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 497, i8* getelementptr inbounds ([171 x i8], [171 x i8]* @__PRETTY_FUNCTION__.VBR_iteration_loop, i64 0, i64 0)) #10
  unreachable

; <label>:162:                                    ; preds = %157
  %163 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv160, i64 %indvars.iv158
  store i32 %159, i32* %163, align 4
  %164 = add nsw i32 %159, %.125103
  br label %165

; <label>:165:                                    ; preds = %162, %75
  %.226 = phi i32 [ %164, %162 ], [ %.125103, %75 ]
  %.3 = phi i32 [ %..14, %162 ], [ 1, %75 ]
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %166 = icmp slt i64 %indvars.iv.next159, %69
  br i1 %166, label %70, label %._crit_edge108.loopexit

._crit_edge108.loopexit:                          ; preds = %165
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %._crit_edge108.loopexit, %.preheader55
  %.125.lcssa = phi i32 [ %.024111, %.preheader55 ], [ %.226, %._crit_edge108.loopexit ]
  %.14.lcssa = phi i32 [ %.03113, %.preheader55 ], [ %.3, %._crit_edge108.loopexit ]
  %indvars.iv.next161 = add nuw i64 %indvars.iv160, 1
  %167 = load i32, i32* %43, align 8
  %168 = sext i32 %167 to i64
  %169 = icmp slt i64 %indvars.iv.next161, %168
  br i1 %169, label %60, label %._crit_edge116.loopexit

._crit_edge116.loopexit:                          ; preds = %._crit_edge108
  br label %._crit_edge116

._crit_edge116:                                   ; preds = %._crit_edge116.loopexit, %._crit_edge123
  %.024.lcssa = phi i32 [ 0, %._crit_edge123 ], [ %.125.lcssa, %._crit_edge116.loopexit ]
  %.03.lcssa = phi i32 [ 0, %._crit_edge123 ], [ %.14.lcssa, %._crit_edge116.loopexit ]
  %170 = load i32, i32* @reduce_sidechannel, align 4
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %.loopexit54, label %.preheader53

.preheader53:                                     ; preds = %._crit_edge116
  %172 = load i32, i32* %43, align 8
  %173 = icmp sgt i32 %172, 0
  br i1 %173, label %.lr.ph101, label %.loopexit54

.lr.ph101:                                        ; preds = %.preheader53
  %174 = load i32, i32* %43, align 8
  %175 = sext i32 %174 to i64
  br label %176

; <label>:176:                                    ; preds = %.lr.ph101, %176
  %indvars.iv156 = phi i64 [ 0, %.lr.ph101 ], [ %indvars.iv.next157, %176 ]
  %.32799 = phi i32 [ %.024.lcssa, %.lr.ph101 ], [ %192, %176 ]
  %177 = getelementptr inbounds double, double* %2, i64 %indvars.iv156
  %178 = load double, double* %177, align 8
  %179 = fsub double 5.000000e-01, %178
  %180 = fmul double %179, 3.300000e-01
  %181 = fmul double %180, 2.000000e+00
  %182 = fsub double 1.000000e+00, %181
  %183 = fadd double %181, 1.000000e+00
  %184 = fdiv double %182, %183
  %185 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv156, i64 0
  %186 = load i32, i32* %185, align 8
  %187 = sitofp i32 %186 to double
  %188 = fmul double %187, %184
  %189 = fptosi double %188 to i32
  %190 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv156, i64 1
  %191 = icmp sgt i32 %189, 125
  %.40 = select i1 %191, i32 %189, i32 125
  store i32 %.40, i32* %190, align 4
  %192 = add nsw i32 %.40, %.32799
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %193 = icmp slt i64 %indvars.iv.next157, %175
  br i1 %193, label %176, label %.loopexit54.loopexit

.loopexit54.loopexit:                             ; preds = %176
  br label %.loopexit54

.loopexit54:                                      ; preds = %.loopexit54.loopexit, %.preheader53, %._crit_edge116
  %.428 = phi i32 [ %.024.lcssa, %._crit_edge116 ], [ %.024.lcssa, %.preheader53 ], [ %192, %.loopexit54.loopexit ]
  %194 = icmp eq i32 %.03.lcssa, 0
  br i1 %194, label %195, label %.preheader52

; <label>:195:                                    ; preds = %.loopexit54
  %196 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 47
  %197 = load i32, i32* %196, align 8
  br label %.preheader52

.preheader52:                                     ; preds = %.loopexit54, %195
  %.sink41.ph = phi i32 [ 1, %.loopexit54 ], [ %197, %195 ]
  store i32 %.sink41.ph, i32* %19, align 4
  %198 = load i32, i32* %20, align 4
  %199 = icmp slt i32 %.sink41.ph, %198
  br i1 %199, label %.lr.ph96.preheader, label %._crit_edge97

.lr.ph96.preheader:                               ; preds = %.preheader52
  %200 = sext i32 %.sink41.ph to i64
  br label %.lr.ph96

; <label>:201:                                    ; preds = %.lr.ph96
  %202 = trunc i64 %indvars.iv.next155 to i32
  store i32 %202, i32* %19, align 4
  %203 = load i32, i32* %20, align 4
  %204 = sext i32 %203 to i64
  %205 = icmp slt i64 %indvars.iv.next155, %204
  br i1 %205, label %.lr.ph96, label %._crit_edge97.loopexit

.lr.ph96:                                         ; preds = %.lr.ph96.preheader, %201
  %indvars.iv154 = phi i64 [ %200, %.lr.ph96.preheader ], [ %indvars.iv.next155, %201 ]
  %206 = getelementptr inbounds [15 x i32], [15 x i32]* %16, i64 0, i64 %indvars.iv154
  %207 = load i32, i32* %206, align 4
  %208 = icmp sgt i32 %.428, %207
  %indvars.iv.next155 = add i64 %indvars.iv154, 1
  br i1 %208, label %201, label %._crit_edge97.loopexit

._crit_edge97.loopexit:                           ; preds = %.lr.ph96, %201
  br label %._crit_edge97

._crit_edge97:                                    ; preds = %._crit_edge97.loopexit, %.preheader52
  call void @getframebits(%struct.lame_global_flags* nonnull %0, i32* nonnull %17, i32* nonnull %18) #8
  %209 = load i32, i32* %18, align 4
  %210 = load i32, i32* %17, align 4
  %211 = call i32 @ResvFrameBegin(%struct.lame_global_flags* nonnull %0, %struct.III_side_info_t* %5, i32 %209, i32 %210) #8
  %212 = icmp sgt i32 %.428, %211
  br i1 %212, label %.preheader51, label %.loopexit

.preheader51:                                     ; preds = %._crit_edge97
  %213 = load i32, i32* %43, align 8
  %214 = icmp sgt i32 %213, 0
  br i1 %214, label %.preheader50.lr.ph, label %.loopexit

.preheader50.lr.ph:                               ; preds = %.preheader51
  %215 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %216 = load i32, i32* %215, align 4
  %217 = icmp sgt i32 %216, 0
  br i1 %217, label %.preheader50.us.preheader, label %.preheader49

.preheader50.us.preheader:                        ; preds = %.preheader50.lr.ph
  %218 = load i32, i32* %43, align 8
  %219 = sext i32 %218 to i64
  %220 = load i32, i32* %19, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [15 x i32], [15 x i32]* %16, i64 0, i64 %221
  %223 = load i32, i32* %222, align 4
  %224 = load i32, i32* %215, align 4
  %225 = sext i32 %224 to i64
  br label %.preheader50.us

.preheader50.us:                                  ; preds = %.preheader50.us.preheader, %._crit_edge93.us
  %indvars.iv152 = phi i64 [ 0, %.preheader50.us.preheader ], [ %indvars.iv.next153, %._crit_edge93.us ]
  br label %226

; <label>:226:                                    ; preds = %.preheader50.us, %226
  %indvars.iv150 = phi i64 [ 0, %.preheader50.us ], [ %indvars.iv.next151, %226 ]
  %227 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv152, i64 %indvars.iv150
  %228 = load i32, i32* %227, align 4
  %229 = mul nsw i32 %223, %228
  %230 = sdiv i32 %229, %.428
  store i32 %230, i32* %227, align 4
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %231 = icmp slt i64 %indvars.iv.next151, %225
  br i1 %231, label %226, label %._crit_edge93.us

._crit_edge93.us:                                 ; preds = %226
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %232 = icmp slt i64 %indvars.iv.next153, %219
  br i1 %232, label %.preheader50.us, label %.preheader49.loopexit

.preheader49.loopexit:                            ; preds = %._crit_edge93.us
  br label %.preheader49

.preheader49:                                     ; preds = %.preheader49.loopexit, %.preheader50.lr.ph
  %.pr = load i32, i32* %43, align 8
  %233 = icmp sgt i32 %.pr, 0
  br i1 %233, label %.preheader48.lr.ph, label %.loopexit

.preheader48.lr.ph:                               ; preds = %.preheader49
  %234 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %235 = load i32, i32* %234, align 4
  %236 = icmp sgt i32 %235, 0
  br i1 %236, label %.preheader48.us.preheader, label %.loopexit

.preheader48.us.preheader:                        ; preds = %.preheader48.lr.ph
  %237 = load i32, i32* %43, align 8
  %238 = sext i32 %237 to i64
  %239 = load i32, i32* %234, align 4
  %240 = sext i32 %239 to i64
  %241 = icmp sgt i64 %240, 1
  %smax = select i1 %241, i64 %240, i64 1
  %242 = and i64 %smax, 9223372036854775800
  %243 = add nsw i64 %242, -8
  %244 = lshr exact i64 %243, 3
  %245 = add nuw nsw i64 %244, 1
  %min.iters.check = icmp ult i64 %smax, 8
  %n.vec = and i64 %smax, 9223372036854775800
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter = and i64 %245, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %246 = icmp ult i64 %243, 24
  %cmp.n = icmp eq i64 %smax, %n.vec
  br label %.preheader48.us

.preheader48.us:                                  ; preds = %.preheader48.us.preheader, %._crit_edge87.us
  %indvars.iv148 = phi i64 [ 0, %.preheader48.us.preheader ], [ %indvars.iv.next149, %._crit_edge87.us ]
  %.52988.us = phi i32 [ 0, %.preheader48.us.preheader ], [ %.lcssa170, %._crit_edge87.us ]
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader48.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %247 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %.52988.us, i32 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %vec.phi.prol = phi <4 x i32> [ %247, %vector.body.prol.preheader ], [ %252, %vector.body.prol ]
  %vec.phi174.prol = phi <4 x i32> [ zeroinitializer, %vector.body.prol.preheader ], [ %253, %vector.body.prol ]
  %prol.iter = phi i64 [ %xtraiter, %vector.body.prol.preheader ], [ %prol.iter.sub, %vector.body.prol ]
  %248 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv148, i64 %index.prol
  %249 = bitcast i32* %248 to <4 x i32>*
  %wide.load.prol = load <4 x i32>, <4 x i32>* %249, align 8
  %250 = getelementptr i32, i32* %248, i64 4
  %251 = bitcast i32* %250 to <4 x i32>*
  %wide.load175.prol = load <4 x i32>, <4 x i32>* %251, align 8
  %252 = add nsw <4 x i32> %wide.load.prol, %vec.phi.prol
  %253 = add nsw <4 x i32> %wide.load175.prol, %vec.phi174.prol
  %index.next.prol = add i64 %index.prol, 8
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.ph, %vector.body.prol.loopexit.unr-lcssa
  %.lcssa182.unr = phi <4 x i32> [ undef, %vector.ph ], [ %252, %vector.body.prol.loopexit.unr-lcssa ]
  %.lcssa181.unr = phi <4 x i32> [ undef, %vector.ph ], [ %253, %vector.body.prol.loopexit.unr-lcssa ]
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi.unr = phi <4 x i32> [ %247, %vector.ph ], [ %252, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi174.unr = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %253, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %246, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr, %vector.ph.new ], [ %index.next.3, %vector.body ]
  %vec.phi = phi <4 x i32> [ %vec.phi.unr, %vector.ph.new ], [ %276, %vector.body ]
  %vec.phi174 = phi <4 x i32> [ %vec.phi174.unr, %vector.ph.new ], [ %277, %vector.body ]
  %254 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv148, i64 %index
  %255 = bitcast i32* %254 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %255, align 8
  %256 = getelementptr i32, i32* %254, i64 4
  %257 = bitcast i32* %256 to <4 x i32>*
  %wide.load175 = load <4 x i32>, <4 x i32>* %257, align 8
  %258 = add nsw <4 x i32> %wide.load, %vec.phi
  %259 = add nsw <4 x i32> %wide.load175, %vec.phi174
  %index.next = add i64 %index, 8
  %260 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv148, i64 %index.next
  %261 = bitcast i32* %260 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %261, align 8
  %262 = getelementptr i32, i32* %260, i64 4
  %263 = bitcast i32* %262 to <4 x i32>*
  %wide.load175.1 = load <4 x i32>, <4 x i32>* %263, align 8
  %264 = add nsw <4 x i32> %wide.load.1, %258
  %265 = add nsw <4 x i32> %wide.load175.1, %259
  %index.next.1 = add i64 %index, 16
  %266 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv148, i64 %index.next.1
  %267 = bitcast i32* %266 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %267, align 8
  %268 = getelementptr i32, i32* %266, i64 4
  %269 = bitcast i32* %268 to <4 x i32>*
  %wide.load175.2 = load <4 x i32>, <4 x i32>* %269, align 8
  %270 = add nsw <4 x i32> %wide.load.2, %264
  %271 = add nsw <4 x i32> %wide.load175.2, %265
  %index.next.2 = add i64 %index, 24
  %272 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv148, i64 %index.next.2
  %273 = bitcast i32* %272 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %273, align 8
  %274 = getelementptr i32, i32* %272, i64 4
  %275 = bitcast i32* %274 to <4 x i32>*
  %wide.load175.3 = load <4 x i32>, <4 x i32>* %275, align 8
  %276 = add nsw <4 x i32> %wide.load.3, %270
  %277 = add nsw <4 x i32> %wide.load175.3, %271
  %index.next.3 = add i64 %index, 32
  %278 = icmp eq i64 %index.next.3, %n.vec
  br i1 %278, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %.lcssa182 = phi <4 x i32> [ %.lcssa182.unr, %vector.body.prol.loopexit ], [ %276, %middle.block.unr-lcssa ]
  %.lcssa181 = phi <4 x i32> [ %.lcssa181.unr, %vector.body.prol.loopexit ], [ %277, %middle.block.unr-lcssa ]
  %bin.rdx = add <4 x i32> %.lcssa181, %.lcssa182
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx176 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf177 = shufflevector <4 x i32> %bin.rdx176, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx178 = add <4 x i32> %bin.rdx176, %rdx.shuf177
  %279 = extractelement <4 x i32> %bin.rdx178, i32 0
  br i1 %cmp.n, label %._crit_edge87.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.preheader48.us
  %indvars.iv146.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.preheader48.us ], [ %n.vec, %middle.block ]
  %.63084.us.ph = phi i32 [ %.52988.us, %min.iters.checked ], [ %.52988.us, %.preheader48.us ], [ %279, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %scalar.ph ], [ %indvars.iv146.ph, %scalar.ph.preheader ]
  %.63084.us = phi i32 [ %282, %scalar.ph ], [ %.63084.us.ph, %scalar.ph.preheader ]
  %280 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv148, i64 %indvars.iv146
  %281 = load i32, i32* %280, align 4
  %282 = add nsw i32 %281, %.63084.us
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %283 = icmp slt i64 %indvars.iv.next147, %240
  br i1 %283, label %scalar.ph, label %._crit_edge87.us.loopexit, !llvm.loop !6

._crit_edge87.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge87.us

._crit_edge87.us:                                 ; preds = %._crit_edge87.us.loopexit, %middle.block
  %.lcssa170 = phi i32 [ %279, %middle.block ], [ %282, %._crit_edge87.us.loopexit ]
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %284 = icmp slt i64 %indvars.iv.next149, %238
  br i1 %284, label %.preheader48.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge87.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader51, %.preheader48.lr.ph, %.preheader49, %._crit_edge97
  %.7 = phi i32 [ %.428, %._crit_edge97 ], [ 0, %.preheader49 ], [ 0, %.preheader48.lr.ph ], [ 0, %.preheader51 ], [ %.lcssa170, %.loopexit.loopexit ]
  %.02 = phi i32 [ 0, %._crit_edge97 ], [ 1, %.preheader49 ], [ 1, %.preheader48.lr.ph ], [ 1, %.preheader51 ], [ 1, %.loopexit.loopexit ]
  %285 = icmp sgt i32 %.7, %211
  br i1 %285, label %294, label %.preheader47

.preheader47:                                     ; preds = %.loopexit
  %286 = load i32, i32* %43, align 8
  %287 = icmp sgt i32 %286, 0
  br i1 %287, label %.preheader46.lr.ph, label %.preheader43thread-pre-split

.preheader46.lr.ph:                               ; preds = %.preheader47
  %288 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %289 = icmp eq i32 %.02, 0
  %290 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %291 = getelementptr inbounds [4 x double], [4 x double]* %15, i64 0, i64 0
  %292 = bitcast [4 x double]* %15 to i8*
  %293 = bitcast [4 x double]* %15 to i8*
  br label %.preheader46

; <label>:294:                                    ; preds = %.loopexit
  call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 552, i8* getelementptr inbounds ([171 x i8], [171 x i8]* @__PRETTY_FUNCTION__.VBR_iteration_loop, i64 0, i64 0)) #10
  unreachable

.preheader46:                                     ; preds = %.preheader46.lr.ph, %._crit_edge82
  %indvars.iv144 = phi i64 [ 0, %.preheader46.lr.ph ], [ %indvars.iv.next145, %._crit_edge82 ]
  %295 = load i32, i32* %288, align 4
  %296 = icmp sgt i32 %295, 0
  br i1 %296, label %.lr.ph81, label %._crit_edge82

.lr.ph81:                                         ; preds = %.preheader46
  br i1 %289, label %.lr.ph81.split.us.preheader, label %.lr.ph81.split.preheader

.lr.ph81.split.preheader:                         ; preds = %.lr.ph81
  br label %.lr.ph81.split

.lr.ph81.split.us.preheader:                      ; preds = %.lr.ph81
  br label %.lr.ph81.split.us

.lr.ph81.split.us:                                ; preds = %.lr.ph81.split.us.preheader, %319
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %319 ], [ 0, %.lr.ph81.split.us.preheader ]
  %297 = load i32, i32* @reduce_sidechannel, align 4
  %298 = icmp ne i32 %297, 0
  %299 = icmp eq i64 %indvars.iv142, 1
  %or.cond.us = and i1 %299, %298
  br i1 %or.cond.us, label %300, label %319

; <label>:300:                                    ; preds = %.lr.ph81.split.us
  %301 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv144, i32 0, i64 %indvars.iv142, i32 0
  %302 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv142, i64 0
  %303 = call i32 @init_outer_loop(%struct.lame_global_flags* nonnull %0, double* %302, %struct.gr_info* %301)
  %304 = icmp eq i32 %303, 0
  br i1 %304, label %314, label %305

; <label>:305:                                    ; preds = %300
  %306 = load i32, i32* %290, align 4
  %307 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv144, i64 %indvars.iv142
  %308 = load i32, i32* %307, align 4
  call void @set_masking_lower(i32 %306, i32 %308)
  %309 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %4, i64 %indvars.iv144, i64 %indvars.iv142
  %310 = call i32 @calc_xmin(%struct.lame_global_flags* nonnull %0, double* %302, %struct.III_psy_ratio* %309, %struct.gr_info* %301, %struct.III_psy_xmin* nonnull %13) #8
  %311 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv144, i64 %indvars.iv142, i64 0
  %312 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %7, i64 %indvars.iv144, i64 %indvars.iv142
  %313 = trunc i64 %indvars.iv142 to i32
  call void @outer_loop(%struct.lame_global_flags* nonnull %0, double* %302, i32 %308, double* nonnull %291, %struct.III_psy_xmin* nonnull %13, i32* %311, %struct.III_scalefac_t* %312, %struct.gr_info* %301, [21 x double]* undef, i32 %313)
  br label %319

; <label>:314:                                    ; preds = %300
  %315 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %7, i64 %indvars.iv144, i64 %indvars.iv142
  %316 = bitcast %struct.III_scalefac_t* %315 to i8*
  call void @llvm.memset.p0i8.i64(i8* %316, i8 0, i64 244, i32 4, i1 false)
  %317 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv144, i64 %indvars.iv142, i64 0
  %318 = bitcast i32* %317 to i8*
  call void @llvm.memset.p0i8.i64(i8* %318, i8 0, i64 2304, i32 4, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull %292, i8 0, i64 32, i32 16, i1 false)
  br label %319

; <label>:319:                                    ; preds = %314, %305, %.lr.ph81.split.us
  %indvars.iv.next143 = add nuw i64 %indvars.iv142, 1
  %320 = load i32, i32* %288, align 4
  %321 = sext i32 %320 to i64
  %322 = icmp slt i64 %indvars.iv.next143, %321
  br i1 %322, label %.lr.ph81.split.us, label %._crit_edge82.loopexit

.preheader45:                                     ; preds = %._crit_edge82
  %323 = icmp sgt i32 %347, 0
  br i1 %323, label %.preheader44.lr.ph, label %.preheader43thread-pre-split

.preheader44.lr.ph:                               ; preds = %.preheader45
  %324 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  br label %.preheader44

.lr.ph81.split:                                   ; preds = %.lr.ph81.split.preheader, %343
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %343 ], [ 0, %.lr.ph81.split.preheader ]
  %325 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv144, i32 0, i64 %indvars.iv140, i32 0
  %326 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv140, i64 0
  %327 = call i32 @init_outer_loop(%struct.lame_global_flags* nonnull %0, double* %326, %struct.gr_info* %325)
  %328 = icmp eq i32 %327, 0
  br i1 %328, label %329, label %334

; <label>:329:                                    ; preds = %.lr.ph81.split
  %330 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %7, i64 %indvars.iv144, i64 %indvars.iv140
  %331 = bitcast %struct.III_scalefac_t* %330 to i8*
  call void @llvm.memset.p0i8.i64(i8* %331, i8 0, i64 244, i32 4, i1 false)
  %332 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv144, i64 %indvars.iv140, i64 0
  %333 = bitcast i32* %332 to i8*
  call void @llvm.memset.p0i8.i64(i8* %333, i8 0, i64 2304, i32 4, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull %293, i8 0, i64 32, i32 16, i1 false)
  br label %343

; <label>:334:                                    ; preds = %.lr.ph81.split
  %335 = load i32, i32* %290, align 4
  %336 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %14, i64 0, i64 %indvars.iv144, i64 %indvars.iv140
  %337 = load i32, i32* %336, align 4
  call void @set_masking_lower(i32 %335, i32 %337)
  %338 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %4, i64 %indvars.iv144, i64 %indvars.iv140
  %339 = call i32 @calc_xmin(%struct.lame_global_flags* nonnull %0, double* %326, %struct.III_psy_ratio* %338, %struct.gr_info* %325, %struct.III_psy_xmin* nonnull %13) #8
  %340 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv144, i64 %indvars.iv140, i64 0
  %341 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %7, i64 %indvars.iv144, i64 %indvars.iv140
  %342 = trunc i64 %indvars.iv140 to i32
  call void @outer_loop(%struct.lame_global_flags* nonnull %0, double* %326, i32 %337, double* nonnull %291, %struct.III_psy_xmin* nonnull %13, i32* %340, %struct.III_scalefac_t* %341, %struct.gr_info* %325, [21 x double]* undef, i32 %342)
  br label %343

; <label>:343:                                    ; preds = %334, %329
  %indvars.iv.next141 = add nuw i64 %indvars.iv140, 1
  %344 = load i32, i32* %288, align 4
  %345 = sext i32 %344 to i64
  %346 = icmp slt i64 %indvars.iv.next141, %345
  br i1 %346, label %.lr.ph81.split, label %._crit_edge82.loopexit179

._crit_edge82.loopexit:                           ; preds = %319
  br label %._crit_edge82

._crit_edge82.loopexit179:                        ; preds = %343
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %._crit_edge82.loopexit179, %._crit_edge82.loopexit, %.preheader46
  %indvars.iv.next145 = add nuw i64 %indvars.iv144, 1
  %347 = load i32, i32* %43, align 8
  %348 = sext i32 %347 to i64
  %349 = icmp slt i64 %indvars.iv.next145, %348
  br i1 %349, label %.preheader46, label %.preheader45

.preheader44:                                     ; preds = %.preheader44.lr.ph, %._crit_edge78
  %indvars.iv138 = phi i64 [ 0, %.preheader44.lr.ph ], [ %indvars.iv.next139, %._crit_edge78 ]
  %350 = load i32, i32* %324, align 4
  %351 = icmp sgt i32 %350, 0
  br i1 %351, label %.lr.ph.preheader, label %._crit_edge78

.lr.ph.preheader:                                 ; preds = %.preheader44
  %352 = trunc i64 %indvars.iv138 to i32
  %353 = trunc i64 %indvars.iv138 to i32
  br label %.lr.ph

.preheader43thread-pre-split:                     ; preds = %.preheader47, %.preheader45
  %.pr162 = load i32, i32* %43, align 8
  br label %.preheader43

.preheader43.loopexit:                            ; preds = %._crit_edge78
  br label %.preheader43

.preheader43:                                     ; preds = %.preheader43.loopexit, %.preheader43thread-pre-split
  %354 = phi i32 [ %.pr162, %.preheader43thread-pre-split ], [ %370, %.preheader43.loopexit ]
  %355 = icmp sgt i32 %354, 0
  br i1 %355, label %.preheader42.lr.ph, label %._crit_edge76

.preheader42.lr.ph:                               ; preds = %.preheader43
  %356 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  br label %.preheader42

.lr.ph:                                           ; preds = %.lr.ph.preheader, %365
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %365 ], [ 0, %.lr.ph.preheader ]
  %357 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv138, i32 0, i64 %indvars.iv136, i32 0
  %358 = trunc i64 %indvars.iv136 to i32
  call void @best_scalefac_store(%struct.lame_global_flags* nonnull %0, i32 %352, i32 %358, [2 x [576 x i32]]* %6, %struct.III_side_info_t* %5, [2 x %struct.III_scalefac_t]* %7) #8
  %359 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv138, i32 0, i64 %indvars.iv136, i32 0, i32 6
  %360 = load i32, i32* %359, align 8
  %361 = icmp eq i32 %360, 0
  br i1 %361, label %362, label %365

; <label>:362:                                    ; preds = %.lr.ph
  %363 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv138, i64 %indvars.iv136, i64 0
  %364 = trunc i64 %indvars.iv136 to i32
  call void @best_huffman_divide(i32 %353, i32 %364, %struct.gr_info* %357, i32* %363) #8
  br label %365

; <label>:365:                                    ; preds = %362, %.lr.ph
  %366 = load i32, i32* %18, align 4
  call void @ResvAdjust(%struct.lame_global_flags* nonnull %0, %struct.gr_info* %357, %struct.III_side_info_t* nonnull %5, i32 %366) #8
  %indvars.iv.next137 = add nuw i64 %indvars.iv136, 1
  %367 = load i32, i32* %324, align 4
  %368 = sext i32 %367 to i64
  %369 = icmp slt i64 %indvars.iv.next137, %368
  br i1 %369, label %.lr.ph, label %._crit_edge78.loopexit

._crit_edge78.loopexit:                           ; preds = %365
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.loopexit, %.preheader44
  %indvars.iv.next139 = add nuw i64 %indvars.iv138, 1
  %370 = load i32, i32* %43, align 8
  %371 = sext i32 %370 to i64
  %372 = icmp slt i64 %indvars.iv.next139, %371
  br i1 %372, label %.preheader44, label %.preheader43.loopexit

.preheader42:                                     ; preds = %.preheader42.lr.ph, %._crit_edge
  %indvars.iv134 = phi i64 [ 0, %.preheader42.lr.ph ], [ %indvars.iv.next135, %._crit_edge ]
  %373 = load i32, i32* %356, align 4
  %374 = icmp sgt i32 %373, 0
  br i1 %374, label %.preheader.preheader, label %._crit_edge

.preheader.preheader:                             ; preds = %.preheader42
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %388
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %388 ], [ 0, %.preheader.preheader ]
  br label %375

; <label>:375:                                    ; preds = %399, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %399 ]
  %376 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv134, i64 %indvars.iv132, i64 %indvars.iv
  %377 = load double, double* %376, align 8
  %378 = fcmp olt double %377, 0.000000e+00
  %379 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv134, i64 %indvars.iv132, i64 %indvars.iv
  br i1 %378, label %380, label %383

; <label>:380:                                    ; preds = %375
  %381 = load i32, i32* %379, align 4
  %382 = sub nsw i32 0, %381
  store i32 %382, i32* %379, align 4
  br label %383

; <label>:383:                                    ; preds = %375, %380
  %indvars.iv.next = or i64 %indvars.iv, 1
  %384 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv134, i64 %indvars.iv132, i64 %indvars.iv.next
  %385 = load double, double* %384, align 8
  %386 = fcmp olt double %385, 0.000000e+00
  %387 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %6, i64 %indvars.iv134, i64 %indvars.iv132, i64 %indvars.iv.next
  br i1 %386, label %396, label %399

; <label>:388:                                    ; preds = %399
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %389 = load i32, i32* %356, align 4
  %390 = sext i32 %389 to i64
  %391 = icmp slt i64 %indvars.iv.next133, %390
  br i1 %391, label %.preheader, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %388
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader42
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %392 = load i32, i32* %43, align 8
  %393 = sext i32 %392 to i64
  %394 = icmp slt i64 %indvars.iv.next135, %393
  br i1 %394, label %.preheader42, label %._crit_edge76.loopexit

._crit_edge76.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge76.loopexit, %.preheader43
  %395 = load i32, i32* %18, align 4
  call void @ResvFrameEnd(%struct.lame_global_flags* nonnull %0, %struct.III_side_info_t* %5, i32 %395) #8
  ret void

; <label>:396:                                    ; preds = %383
  %397 = load i32, i32* %387, align 4
  %398 = sub nsw i32 0, %397
  store i32 %398, i32* %387, align 4
  br label %399

; <label>:399:                                    ; preds = %396, %383
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 576
  br i1 %exitcond.1, label %388, label %375
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #4

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i32 @VBR_compare(i32, double, double, double, i32, double, double, double) local_unnamed_addr #5 {
  %9 = icmp sgt i32 %4, %0
  %10 = fcmp ugt double %6, %2
  %or.cond = or i1 %9, %10
  %11 = fcmp ugt double %5, %1
  %or.cond1 = or i1 %11, %or.cond
  %12 = fcmp ole double %7, %3
  %not.or.cond1 = xor i1 %or.cond1, true
  %. = and i1 %12, %not.or.cond1
  %13 = zext i1 %. to i32
  ret i32 %13
}

; Function Attrs: nounwind
declare double @log(double) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare double @fabs(double) local_unnamed_addr #6

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @bin_search_StepSize2(%struct.lame_global_flags*, i32, i32, i32*, double*, %struct.gr_info*) local_unnamed_addr #1

declare i32 @inner_loop(%struct.lame_global_flags*, double*, i32*, i32, %struct.gr_info*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @calc_noise1(double* nocapture readonly, i32* nocapture readonly, %struct.gr_info* nocapture readonly, [21 x double]* nocapture, [21 x double]* nocapture, %struct.III_psy_xmin* nocapture readonly, %struct.III_scalefac_t* nocapture readonly, double* nocapture, double* nocapture, double* nocapture) local_unnamed_addr #0 {
  store double 0.000000e+00, double* %7, align 8
  store double 0.000000e+00, double* %8, align 8
  store double -9.990000e+02, double* %9, align 8
  %11 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 16
  %12 = load i32, i32* %11, align 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %.preheader, label %.lr.ph50

.lr.ph50:                                         ; preds = %10
  %14 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 12
  %15 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 3
  %16 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 13
  br label %20

.preheader.loopexit:                              ; preds = %109
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %10
  %.06.lcssa = phi i32 [ 0, %10 ], [ %.17, %.preheader.loopexit ]
  %.01.lcssa = phi i32 [ 0, %10 ], [ %47, %.preheader.loopexit ]
  %17 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 17
  %18 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 13
  %19 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 3
  br label %117

; <label>:20:                                     ; preds = %.lr.ph50, %109
  %.0148 = phi i32 [ 0, %.lr.ph50 ], [ %47, %109 ]
  %.0646 = phi i32 [ 0, %.lr.ph50 ], [ %.17, %109 ]
  %21 = zext i32 %.0148 to i64
  %22 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %6, i64 0, i32 0, i64 %21
  %23 = load i32, i32* %22, align 4
  %24 = load i32, i32* %14, align 8
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %30, label %26

; <label>:26:                                     ; preds = %20
  %27 = getelementptr inbounds [21 x i32], [21 x i32]* @pretab, i64 0, i64 %21
  %28 = load i32, i32* %27, align 4
  %29 = add nsw i32 %28, %23
  br label %30

; <label>:30:                                     ; preds = %20, %26
  %.0 = phi i32 [ %29, %26 ], [ %23, %20 ]
  %31 = load i32, i32* %15, align 4
  %32 = load i32, i32* %16, align 4
  %33 = add i32 %32, 1
  %34 = shl i32 %.0, %33
  %35 = sub i32 %31, %34
  %36 = icmp slt i32 %35, 256
  br i1 %36, label %38, label %37

; <label>:37:                                     ; preds = %30
  tail call void @__assert_fail(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 945, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @__PRETTY_FUNCTION__.calc_noise1, i64 0, i64 0)) #10
  unreachable

; <label>:38:                                     ; preds = %30
  %39 = icmp sgt i32 %35, -1
  br i1 %39, label %41, label %40

; <label>:40:                                     ; preds = %38
  tail call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 946, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @__PRETTY_FUNCTION__.calc_noise1, i64 0, i64 0)) #10
  unreachable

; <label>:41:                                     ; preds = %38
  %42 = sext i32 %35 to i64
  %43 = getelementptr inbounds [256 x double], [256 x double]* @pow20, i64 0, i64 %42
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %21
  %46 = load i32, i32* %45, align 4
  %47 = add nsw i32 %.0148, 1
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %48
  %50 = load i32, i32* %49, align 4
  %51 = sub nsw i32 %50, %46
  %52 = sitofp i32 %51 to double
  %53 = icmp sgt i32 %50, %46
  br i1 %53, label %.lr.ph43.preheader, label %._crit_edge44

.lr.ph43.preheader:                               ; preds = %41
  %54 = sext i32 %46 to i64
  %55 = sub i32 %50, %46
  %56 = add i32 %50, -1
  %xtraiter61 = and i32 %55, 1
  %lcmp.mod62 = icmp eq i32 %xtraiter61, 0
  br i1 %lcmp.mod62, label %.lr.ph43.prol.loopexit, label %.lr.ph43.prol

.lr.ph43.prol:                                    ; preds = %.lr.ph43.preheader
  %57 = getelementptr inbounds double, double* %0, i64 %54
  %58 = load double, double* %57, align 8
  %59 = tail call double @fabs(double %58) #9
  %60 = getelementptr inbounds i32, i32* %1, i64 %54
  %61 = load i32, i32* %60, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %62
  %64 = load double, double* %63, align 8
  %65 = fmul double %44, %64
  %66 = fsub double %59, %65
  %67 = fmul double %66, %66
  %68 = fadd double %67, 0.000000e+00
  %indvars.iv.next59.prol = add nsw i64 %54, 1
  br label %.lr.ph43.prol.loopexit

.lr.ph43.prol.loopexit:                           ; preds = %.lr.ph43.prol, %.lr.ph43.preheader
  %indvars.iv58.unr.ph = phi i64 [ %indvars.iv.next59.prol, %.lr.ph43.prol ], [ %54, %.lr.ph43.preheader ]
  %.0241.unr.ph = phi double [ %68, %.lr.ph43.prol ], [ 0.000000e+00, %.lr.ph43.preheader ]
  %.lcssa54.unr.ph = phi double [ %68, %.lr.ph43.prol ], [ undef, %.lr.ph43.preheader ]
  %69 = icmp eq i32 %56, %46
  br i1 %69, label %._crit_edge44, label %.lr.ph43.preheader66

.lr.ph43.preheader66:                             ; preds = %.lr.ph43.prol.loopexit
  %wide.trip.count60.1 = sext i32 %50 to i64
  br label %.lr.ph43

.lr.ph43:                                         ; preds = %.lr.ph43.preheader66, %.lr.ph43
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %.lr.ph43 ], [ %indvars.iv58.unr.ph, %.lr.ph43.preheader66 ]
  %.0241 = phi double [ %93, %.lr.ph43 ], [ %.0241.unr.ph, %.lr.ph43.preheader66 ]
  %70 = getelementptr inbounds double, double* %0, i64 %indvars.iv58
  %71 = load double, double* %70, align 8
  %72 = tail call double @fabs(double %71) #9
  %73 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv58
  %74 = load i32, i32* %73, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %75
  %77 = load double, double* %76, align 8
  %78 = fmul double %44, %77
  %79 = fsub double %72, %78
  %80 = fmul double %79, %79
  %81 = fadd double %.0241, %80
  %indvars.iv.next59 = add nsw i64 %indvars.iv58, 1
  %82 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next59
  %83 = load double, double* %82, align 8
  %84 = tail call double @fabs(double %83) #9
  %85 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next59
  %86 = load i32, i32* %85, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %87
  %89 = load double, double* %88, align 8
  %90 = fmul double %44, %89
  %91 = fsub double %84, %90
  %92 = fmul double %91, %91
  %93 = fadd double %81, %92
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %exitcond.164 = icmp eq i64 %indvars.iv.next59.1, %wide.trip.count60.1
  br i1 %exitcond.164, label %._crit_edge44.loopexit, label %.lr.ph43

._crit_edge44.loopexit:                           ; preds = %.lr.ph43
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %.lr.ph43.prol.loopexit, %41
  %.02.lcssa = phi double [ 0.000000e+00, %41 ], [ %.lcssa54.unr.ph, %.lr.ph43.prol.loopexit ], [ %93, %._crit_edge44.loopexit ]
  %94 = fdiv double %.02.lcssa, %52
  %95 = getelementptr inbounds [21 x double], [21 x double]* %3, i64 0, i64 %21
  store double %94, double* %95, align 8
  %96 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %5, i64 0, i32 0, i64 %21
  %97 = load double, double* %96, align 8
  %98 = fdiv double %94, %97
  %99 = fcmp olt double %98, 1.000000e-03
  %100 = select i1 %99, double 1.000000e-03, double %98
  %101 = tail call double @log10(double %100) #8
  %102 = fmul double %101, 1.000000e+01
  %103 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 %21
  store double %102, double* %103, align 8
  %104 = fcmp ogt double %102, 0.000000e+00
  br i1 %104, label %105, label %109

; <label>:105:                                    ; preds = %._crit_edge44
  %106 = add nsw i32 %.0646, 1
  %107 = load double, double* %7, align 8
  %108 = fadd double %102, %107
  store double %108, double* %7, align 8
  br label %109

; <label>:109:                                    ; preds = %105, %._crit_edge44
  %.17 = phi i32 [ %106, %105 ], [ %.0646, %._crit_edge44 ]
  %110 = load double, double* %8, align 8
  %111 = fadd double %102, %110
  store double %111, double* %8, align 8
  %112 = load double, double* %9, align 8
  %113 = fcmp ogt double %112, %102
  %114 = select i1 %113, double %112, double %102
  store double %114, double* %9, align 8
  %115 = load i32, i32* %11, align 8
  %116 = icmp ult i32 %47, %115
  br i1 %116, label %20, label %.preheader.loopexit

; <label>:117:                                    ; preds = %.preheader, %._crit_edge33
  %indvars.iv56 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next57, %._crit_edge33 ]
  %.139 = phi i32 [ %.01.lcssa, %.preheader ], [ %.2.lcssa, %._crit_edge33 ]
  %.2838 = phi i32 [ %.06.lcssa, %.preheader ], [ %.3.lcssa, %._crit_edge33 ]
  %118 = load i32, i32* %17, align 4
  %119 = icmp ult i32 %118, 12
  br i1 %119, label %.lr.ph32, label %._crit_edge33

.lr.ph32:                                         ; preds = %117
  %120 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 9, i64 %indvars.iv56
  %121 = add nuw nsw i64 %indvars.iv56, 1
  br label %122

; <label>:122:                                    ; preds = %.lr.ph32, %212
  %.230 = phi i32 [ %.139, %.lr.ph32 ], [ %218, %212 ]
  %.1529 = phi i32 [ %118, %.lr.ph32 ], [ %143, %212 ]
  %.328 = phi i32 [ %.2838, %.lr.ph32 ], [ %.4, %212 ]
  %123 = zext i32 %.1529 to i64
  %124 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %6, i64 0, i32 1, i64 %123, i64 %indvars.iv56
  %125 = load i32, i32* %124, align 4
  %126 = load i32, i32* %18, align 4
  %127 = add i32 %126, 1
  %128 = shl i32 %125, %127
  %129 = load i32, i32* %120, align 4
  %130 = load i32, i32* %19, align 4
  %.neg12 = mul i32 %129, -8
  %.neg13 = sub i32 %.neg12, %128
  %131 = add i32 %.neg13, %130
  %132 = icmp slt i32 %131, 256
  br i1 %132, label %134, label %133

; <label>:133:                                    ; preds = %122
  tail call void @__assert_fail(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 1000, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @__PRETTY_FUNCTION__.calc_noise1, i64 0, i64 0)) #10
  unreachable

; <label>:134:                                    ; preds = %122
  %135 = icmp sgt i32 %131, -1
  br i1 %135, label %137, label %136

; <label>:136:                                    ; preds = %134
  tail call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 1001, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @__PRETTY_FUNCTION__.calc_noise1, i64 0, i64 0)) #10
  unreachable

; <label>:137:                                    ; preds = %134
  %138 = sext i32 %131 to i64
  %139 = getelementptr inbounds [256 x double], [256 x double]* @pow20, i64 0, i64 %138
  %140 = load double, double* %139, align 8
  %141 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %123
  %142 = load i32, i32* %141, align 4
  %143 = add nsw i32 %.1529, 1
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %144
  %146 = load i32, i32* %145, align 4
  %147 = sub nsw i32 %146, %142
  %148 = sitofp i32 %147 to double
  %149 = icmp sgt i32 %146, %142
  br i1 %149, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %137
  %150 = sext i32 %142 to i64
  %151 = sub i32 %146, %142
  %152 = add i32 %146, -1
  %xtraiter = and i32 %151, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %153 = mul nsw i64 %150, 3
  %154 = add nsw i64 %153, %indvars.iv56
  %155 = getelementptr inbounds double, double* %0, i64 %154
  %156 = load double, double* %155, align 8
  %157 = tail call double @fabs(double %156) #9
  %158 = getelementptr inbounds i32, i32* %1, i64 %154
  %159 = load i32, i32* %158, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %160
  %162 = load double, double* %161, align 8
  %163 = fmul double %140, %162
  %164 = fsub double %157, %163
  %165 = fmul double %164, %164
  %166 = fadd double %165, 0.000000e+00
  %indvars.iv.next.prol = add nsw i64 %150, 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ %150, %.lr.ph.preheader ]
  %.1327.unr.ph = phi double [ %166, %.lr.ph.prol ], [ 0.000000e+00, %.lr.ph.preheader ]
  %.lcssa.unr.ph = phi double [ %166, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %167 = icmp eq i32 %152, %142
  br i1 %167, label %._crit_edge, label %.lr.ph.preheader65

.lr.ph.preheader65:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = sext i32 %146 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader65, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr.ph, %.lr.ph.preheader65 ]
  %.1327 = phi double [ %196, %.lr.ph ], [ %.1327.unr.ph, %.lr.ph.preheader65 ]
  %168 = mul nsw i64 %indvars.iv, 3
  %169 = add nsw i64 %168, %indvars.iv56
  %170 = getelementptr inbounds double, double* %0, i64 %169
  %171 = load double, double* %170, align 8
  %172 = tail call double @fabs(double %171) #9
  %173 = getelementptr inbounds i32, i32* %1, i64 %169
  %174 = load i32, i32* %173, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %175
  %177 = load double, double* %176, align 8
  %178 = fmul double %140, %177
  %179 = fsub double %172, %178
  %180 = fmul double %179, %179
  %181 = fadd double %.1327, %180
  %182 = mul i64 %indvars.iv, 3
  %183 = add i64 %182, 3
  %184 = add nsw i64 %183, %indvars.iv56
  %185 = getelementptr inbounds double, double* %0, i64 %184
  %186 = load double, double* %185, align 8
  %187 = tail call double @fabs(double %186) #9
  %188 = getelementptr inbounds i32, i32* %1, i64 %184
  %189 = load i32, i32* %188, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %190
  %192 = load double, double* %191, align 8
  %193 = fmul double %140, %192
  %194 = fsub double %187, %193
  %195 = fmul double %194, %194
  %196 = fadd double %181, %195
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %137
  %.13.lcssa = phi double [ 0.000000e+00, %137 ], [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %196, %._crit_edge.loopexit ]
  %197 = fdiv double %.13.lcssa, %148
  %198 = getelementptr inbounds [21 x double], [21 x double]* %3, i64 %121, i64 %123
  store double %197, double* %198, align 8
  %199 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %5, i64 0, i32 1, i64 %123, i64 %indvars.iv56
  %200 = load double, double* %199, align 8
  %201 = fdiv double %197, %200
  %202 = fcmp olt double %201, 1.000000e-03
  %203 = select i1 %202, double 1.000000e-03, double %201
  %204 = tail call double @log10(double %203) #8
  %205 = fmul double %204, 1.000000e+01
  %206 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 %121, i64 %123
  store double %205, double* %206, align 8
  %207 = fcmp ogt double %205, 0.000000e+00
  br i1 %207, label %208, label %212

; <label>:208:                                    ; preds = %._crit_edge
  %209 = add nsw i32 %.328, 1
  %210 = load double, double* %7, align 8
  %211 = fadd double %205, %210
  store double %211, double* %7, align 8
  br label %212

; <label>:212:                                    ; preds = %208, %._crit_edge
  %.4 = phi i32 [ %209, %208 ], [ %.328, %._crit_edge ]
  %213 = load double, double* %8, align 8
  %214 = fadd double %205, %213
  store double %214, double* %8, align 8
  %215 = load double, double* %9, align 8
  %216 = fcmp ogt double %215, %205
  %217 = select i1 %216, double %215, double %205
  store double %217, double* %9, align 8
  %218 = add nsw i32 %.230, 1
  %219 = icmp ult i32 %143, 12
  br i1 %219, label %122, label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %212
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %117
  %.3.lcssa = phi i32 [ %.2838, %117 ], [ %.4, %._crit_edge33.loopexit ]
  %.2.lcssa = phi i32 [ %.139, %117 ], [ %218, %._crit_edge33.loopexit ]
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %220 = icmp slt i64 %indvars.iv.next57, 3
  br i1 %220, label %117, label %221

; <label>:221:                                    ; preds = %._crit_edge33
  %222 = icmp sgt i32 %.2.lcssa, 1
  br i1 %222, label %223, label %227

; <label>:223:                                    ; preds = %221
  %224 = sitofp i32 %.2.lcssa to double
  %225 = load double, double* %8, align 8
  %226 = fdiv double %225, %224
  store double %226, double* %8, align 8
  br label %227

; <label>:227:                                    ; preds = %223, %221
  %228 = icmp sgt i32 %.3.lcssa, 1
  br i1 %228, label %229, label %233

; <label>:229:                                    ; preds = %227
  %230 = sitofp i32 %.3.lcssa to double
  %231 = load double, double* %7, align 8
  %232 = fdiv double %231, %230
  store double %232, double* %7, align 8
  br label %233

; <label>:233:                                    ; preds = %229, %227
  ret i32 %.3.lcssa
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i32 @quant_compare(i32, i32, double, double, double, i32, double, double, double) local_unnamed_addr #5 {
  %10 = icmp eq i32 %0, 0
  br i1 %10, label %.thread, label %15

.thread:                                          ; preds = %9
  %11 = icmp slt i32 %5, %1
  %12 = icmp eq i32 %5, %1
  %13 = fcmp ole double %7, %3
  %. = and i1 %12, %13
  %.. = or i1 %11, %.
  %14 = zext i1 %.. to i32
  br label %.thread17

; <label>:15:                                     ; preds = %9
  %16 = fcmp olt double %8, %4
  %17 = fcmp olt double %6, %2
  %18 = fadd double %4, 2.000000e+00
  %19 = fcmp ogt double %18, %8
  %20 = and i1 %17, %19
  %21 = zext i1 %20 to i32
  switch i32 %0, label %.thread17.fold.split [
    i32 3, label %.thread17
    i32 4, label %22
    i32 5, label %51
    i32 6, label %57
  ]

; <label>:22:                                     ; preds = %15
  %23 = fcmp ole double %8, 0.000000e+00
  %24 = fcmp ogt double %4, 2.000000e+00
  %or.cond = and i1 %24, %23
  br i1 %or.cond, label %48, label %25

; <label>:25:                                     ; preds = %22
  %26 = fcmp olt double %4, 0.000000e+00
  %or.cond1 = and i1 %26, %23
  %27 = fadd double %4, 2.000000e+00
  %28 = fcmp ogt double %27, %8
  %or.cond3 = and i1 %28, %or.cond1
  %or.cond4 = and i1 %17, %or.cond3
  br i1 %or.cond4, label %48, label %29

; <label>:29:                                     ; preds = %25
  %30 = fcmp ogt double %4, 0.000000e+00
  %or.cond5 = and i1 %30, %23
  %or.cond7 = and i1 %28, %or.cond5
  %31 = fadd double %2, %3
  %32 = fcmp ogt double %31, %6
  %or.cond9 = and i1 %32, %or.cond7
  br i1 %or.cond9, label %48, label %33

; <label>:33:                                     ; preds = %29
  %34 = fcmp ogt double %8, 0.000000e+00
  %35 = fcmp ogt double %4, -5.000000e-01
  %or.cond10 = and i1 %35, %34
  %36 = fadd double %4, 1.000000e+00
  %37 = fcmp ogt double %36, %8
  %or.cond12 = and i1 %37, %or.cond10
  %38 = fadd double %6, %7
  %39 = fcmp olt double %38, %31
  %or.cond19 = and i1 %39, %or.cond12
  br i1 %or.cond19, label %48, label %40

; <label>:40:                                     ; preds = %33
  %41 = fcmp ogt double %4, -1.000000e+00
  %or.cond13 = and i1 %41, %34
  %42 = fadd double %4, 1.500000e+00
  %43 = fcmp ogt double %42, %8
  %or.cond15 = and i1 %43, %or.cond13
  %44 = fadd double %6, %7
  %45 = fadd double %44, %7
  %46 = fadd double %31, %3
  %47 = fcmp olt double %45, %46
  %.20 = and i1 %47, %or.cond15
  br label %48

; <label>:48:                                     ; preds = %40, %33, %29, %25, %22
  %49 = phi i1 [ true, %22 ], [ true, %25 ], [ true, %29 ], [ true, %33 ], [ %.20, %40 ]
  %50 = zext i1 %49 to i32
  br label %.thread17

; <label>:51:                                     ; preds = %15
  %52 = fcmp olt double %7, %3
  %53 = fcmp oeq double %7, %3
  %54 = and i1 %17, %53
  %55 = or i1 %52, %54
  %56 = zext i1 %55 to i32
  br label %.thread17

; <label>:57:                                     ; preds = %15
  %58 = fcmp olt double %7, %3
  br i1 %58, label %64, label %59

; <label>:59:                                     ; preds = %57
  %.not = fcmp une double %7, %3
  %brmerge = or i1 %.not, %16
  %not..not = xor i1 %.not, true
  br i1 %brmerge, label %64, label %60

; <label>:60:                                     ; preds = %59
  %61 = fcmp oeq double %8, %4
  %62 = fcmp ole double %6, %2
  %63 = and i1 %62, %61
  br label %64

; <label>:64:                                     ; preds = %59, %60, %57
  %65 = phi i1 [ true, %57 ], [ %not..not, %59 ], [ %63, %60 ]
  %66 = zext i1 %65 to i32
  br label %.thread17

.thread17.fold.split:                             ; preds = %15
  %67 = icmp eq i32 %0, 2
  %68 = icmp eq i32 %0, 1
  %narrow = and i1 %68, %16
  %.2.v = select i1 %67, i1 %17, i1 %narrow
  %.2 = zext i1 %.2.v to i32
  br label %.thread17

.thread17:                                        ; preds = %15, %.thread17.fold.split, %48, %.thread, %51, %64
  %.6 = phi i32 [ %66, %64 ], [ %56, %51 ], [ %21, %15 ], [ %14, %.thread ], [ %50, %48 ], [ %.2, %.thread17.fold.split ]
  ret i32 %.6
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @amp_scalefac_bands(double* nocapture, %struct.gr_info* nocapture readonly, %struct.III_scalefac_t* nocapture, [21 x double]* nocapture readonly) local_unnamed_addr #7 {
  %5 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 13
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  %. = select i1 %7, double 0x3FF4BFDAD5362A27, double 0x3FFAE89F995AD3AE
  %8 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 16
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %._crit_edge30, label %.lr.ph29

.lr.ph29:                                         ; preds = %4
  %11 = load i32, i32* %8, align 8
  %12 = zext i32 %11 to i64
  br label %13

; <label>:13:                                     ; preds = %.lr.ph29, %13
  %indvars.iv54 = phi i64 [ 0, %.lr.ph29 ], [ %indvars.iv.next55, %13 ]
  %.027 = phi double [ -9.000000e+02, %.lr.ph29 ], [ %17, %13 ]
  %14 = getelementptr inbounds [21 x double], [21 x double]* %3, i64 0, i64 %indvars.iv54
  %15 = load double, double* %14, align 8
  %16 = fcmp ogt double %15, %.027
  %17 = select i1 %16, double %15, double %.027
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %18 = icmp ult i64 %indvars.iv.next55, %12
  br i1 %18, label %13, label %._crit_edge30.loopexit

._crit_edge30.loopexit:                           ; preds = %13
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %4
  %.0.lcssa = phi double [ -9.000000e+02, %4 ], [ %17, %._crit_edge30.loopexit ]
  %19 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 17
  %20 = load i32, i32* %19, align 4
  %21 = icmp ult i32 %20, 12
  br i1 %21, label %.preheader11.preheader, label %._crit_edge

.preheader11.preheader:                           ; preds = %._crit_edge30
  %22 = zext i32 %20 to i64
  %xtraiter51 = and i32 %20, 1
  %lcmp.mod52 = icmp eq i32 %xtraiter51, 0
  br i1 %lcmp.mod52, label %.preheader11.prol.loopexit, label %.outer.prol.preheader

.outer.prol.preheader:                            ; preds = %.preheader11.preheader
  br label %.outer.prol

.outer.prol.loopexit:                             ; preds = %27
  br label %.outer.prol

.outer.prol:                                      ; preds = %.outer.prol.preheader, %.outer.prol.loopexit
  %.05.ph.prol = phi i64 [ %indvars.iv.next47.prol, %.outer.prol.loopexit ], [ 0, %.outer.prol.preheader ]
  %.2.ph.prol = phi double [ %29, %.outer.prol.loopexit ], [ %.0.lcssa, %.outer.prol.preheader ]
  %sext57 = shl i64 %.05.ph.prol, 32
  %23 = ashr exact i64 %sext57, 32
  br label %24

; <label>:24:                                     ; preds = %27, %.outer.prol
  %indvars.iv46.prol = phi i64 [ %23, %.outer.prol ], [ %indvars.iv.next47.prol, %27 ]
  %25 = icmp slt i64 %indvars.iv46.prol, 3
  br i1 %25, label %27, label %26

; <label>:26:                                     ; preds = %24
  %indvars.iv.next49.prol = add nuw nsw i64 %22, 1
  br label %.preheader11.prol.loopexit

; <label>:27:                                     ; preds = %24
  %indvars.iv.next47.prol = add nsw i64 %indvars.iv46.prol, 1
  %28 = getelementptr inbounds [21 x double], [21 x double]* %3, i64 %indvars.iv.next47.prol, i64 %22
  %29 = load double, double* %28, align 8
  %30 = fcmp ogt double %29, %.2.ph.prol
  br i1 %30, label %.outer.prol.loopexit, label %24

.preheader11.prol.loopexit:                       ; preds = %.preheader11.preheader, %26
  %indvars.iv48.unr = phi i64 [ %22, %.preheader11.preheader ], [ %indvars.iv.next49.prol, %26 ]
  %.124.unr = phi double [ %.0.lcssa, %.preheader11.preheader ], [ %.2.ph.prol, %26 ]
  %.2.ph.lcssa.lcssa.unr = phi double [ undef, %.preheader11.preheader ], [ %.2.ph.prol, %26 ]
  %31 = icmp eq i32 %20, 11
  br i1 %31, label %._crit_edge, label %.preheader11.preheader74

.preheader11.preheader74:                         ; preds = %.preheader11.prol.loopexit
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.preheader74, %173
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %173 ], [ %indvars.iv48.unr, %.preheader11.preheader74 ]
  %.124 = phi double [ %.2.ph.1, %173 ], [ %.124.unr, %.preheader11.preheader74 ]
  br label %.outer

.outer.loopexit:                                  ; preds = %35
  br label %.outer

.outer:                                           ; preds = %.outer.loopexit, %.preheader11
  %.05.ph = phi i64 [ 0, %.preheader11 ], [ %indvars.iv.next47, %.outer.loopexit ]
  %.2.ph = phi double [ %.124, %.preheader11 ], [ %37, %.outer.loopexit ]
  %sext = shl i64 %.05.ph, 32
  %32 = ashr exact i64 %sext, 32
  br label %33

; <label>:33:                                     ; preds = %.outer, %35
  %indvars.iv46 = phi i64 [ %32, %.outer ], [ %indvars.iv.next47, %35 ]
  %34 = icmp slt i64 %indvars.iv46, 3
  br i1 %34, label %35, label %.preheader11.153

; <label>:35:                                     ; preds = %33
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %36 = getelementptr inbounds [21 x double], [21 x double]* %3, i64 %indvars.iv.next47, i64 %indvars.iv48
  %37 = load double, double* %36, align 8
  %38 = fcmp ogt double %37, %.2.ph
  br i1 %38, label %.outer.loopexit, label %33

.preheader11.153:                                 ; preds = %33
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  br label %.outer.1

._crit_edge.loopexit:                             ; preds = %173
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader11.prol.loopexit, %._crit_edge30
  %.1.lcssa = phi double [ %.0.lcssa, %._crit_edge30 ], [ %.2.ph.lcssa.lcssa.unr, %.preheader11.prol.loopexit ], [ %.2.ph.1, %._crit_edge.loopexit ]
  %39 = fmul double %.1.lcssa, 1.050000e+00
  %40 = fcmp olt double %39, 0.000000e+00
  %41 = select i1 %40, double %39, double 0.000000e+00
  %42 = load i32, i32* %8, align 8
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %.preheader.preheader, label %.lr.ph22.preheader

.lr.ph22.preheader:                               ; preds = %._crit_edge
  %broadcast.splatinsert71 = insertelement <2 x double> undef, double %., i32 0
  %broadcast.splat72 = shufflevector <2 x double> %broadcast.splatinsert71, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph22

.lr.ph22:                                         ; preds = %.lr.ph22.preheader, %.loopexit10
  %.2421 = phi i32 [ %102, %.loopexit10 ], [ 0, %.lr.ph22.preheader ]
  %44 = zext i32 %.2421 to i64
  %45 = getelementptr inbounds [21 x double], [21 x double]* %3, i64 0, i64 %44
  %46 = load double, double* %45, align 8
  %47 = fcmp ogt double %46, %41
  br i1 %47, label %48, label %.loopexit10

; <label>:48:                                     ; preds = %.lr.ph22
  %49 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %2, i64 0, i32 0, i64 %44
  %50 = load i32, i32* %49, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %49, align 4
  %52 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %44
  %53 = load i32, i32* %52, align 4
  %54 = add i32 %.2421, 1
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %55
  %57 = load i32, i32* %56, align 4
  %58 = icmp sgt i32 %57, %53
  br i1 %58, label %.lr.ph20.preheader, label %.loopexit10

.lr.ph20.preheader:                               ; preds = %48
  %59 = sext i32 %53 to i64
  %60 = sub i32 %57, %53
  %61 = add i32 %57, -1
  %62 = sub i32 %61, %53
  %xtraiter44 = and i32 %60, 3
  %lcmp.mod45 = icmp eq i32 %xtraiter44, 0
  br i1 %lcmp.mod45, label %.lr.ph20.prol.loopexit, label %.lr.ph20.prol.preheader

.lr.ph20.prol.preheader:                          ; preds = %.lr.ph20.preheader
  br label %.lr.ph20.prol

.lr.ph20.prol:                                    ; preds = %.lr.ph20.prol.preheader, %.lr.ph20.prol
  %indvars.iv40.prol = phi i64 [ %indvars.iv.next41.prol, %.lr.ph20.prol ], [ %59, %.lr.ph20.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph20.prol ], [ %xtraiter44, %.lr.ph20.prol.preheader ]
  %63 = getelementptr inbounds double, double* %0, i64 %indvars.iv40.prol
  %64 = load double, double* %63, align 8
  %65 = fmul double %., %64
  store double %65, double* %63, align 8
  %indvars.iv.next41.prol = add nsw i64 %indvars.iv40.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph20.prol.loopexit.loopexit, label %.lr.ph20.prol, !llvm.loop !8

.lr.ph20.prol.loopexit.loopexit:                  ; preds = %.lr.ph20.prol
  br label %.lr.ph20.prol.loopexit

.lr.ph20.prol.loopexit:                           ; preds = %.lr.ph20.prol.loopexit.loopexit, %.lr.ph20.preheader
  %indvars.iv40.unr = phi i64 [ %59, %.lr.ph20.preheader ], [ %indvars.iv.next41.prol, %.lr.ph20.prol.loopexit.loopexit ]
  %66 = icmp ult i32 %62, 3
  br i1 %66, label %.loopexit10, label %.lr.ph20.preheader59

.lr.ph20.preheader59:                             ; preds = %.lr.ph20.prol.loopexit
  %wide.trip.count42.3 = sext i32 %57 to i64
  %67 = add nsw i64 %wide.trip.count42.3, -4
  %68 = sub i64 %67, %indvars.iv40.unr
  %69 = lshr i64 %68, 2
  %70 = add nuw nsw i64 %69, 1
  %min.iters.check = icmp ult i64 %70, 2
  br i1 %min.iters.check, label %.lr.ph20.preheader73, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph20.preheader59
  %n.mod.vf = and i64 %70, 1
  %n.vec = sub nsw i64 %70, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %71 = add i64 %indvars.iv40.unr, 4
  %72 = shl nuw i64 %69, 2
  %73 = add i64 %71, %72
  %74 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %73, %74
  br i1 %cmp.zero, label %.lr.ph20.preheader73, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %75 = shl i64 %index, 2
  %76 = add i64 %indvars.iv40.unr, %75
  %77 = getelementptr inbounds double, double* %0, i64 %76
  %78 = bitcast double* %77 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %78, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec68 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec69 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec70 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %79 = fmul <2 x double> %broadcast.splat72, %strided.vec
  %80 = fmul <2 x double> %broadcast.splat72, %strided.vec68
  %81 = fmul <2 x double> %broadcast.splat72, %strided.vec69
  %82 = add nsw i64 %76, 3
  %83 = getelementptr inbounds double, double* %0, i64 %82
  %84 = fmul <2 x double> %broadcast.splat72, %strided.vec70
  %85 = getelementptr double, double* %83, i64 -3
  %86 = bitcast double* %85 to <8 x double>*
  %87 = shufflevector <2 x double> %79, <2 x double> %80, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %88 = shufflevector <2 x double> %81, <2 x double> %84, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %87, <4 x double> %88, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %86, align 8
  %index.next = add i64 %index, 2
  %89 = icmp eq i64 %index.next, %n.vec
  br i1 %89, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit10, label %.lr.ph20.preheader73

.lr.ph20.preheader73:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph20.preheader59
  %indvars.iv40.ph = phi i64 [ %indvars.iv40.unr, %min.iters.checked ], [ %indvars.iv40.unr, %.lr.ph20.preheader59 ], [ %ind.end, %middle.block ]
  br label %.lr.ph20

.lr.ph20:                                         ; preds = %.lr.ph20.preheader73, %.lr.ph20
  %indvars.iv40 = phi i64 [ %indvars.iv.next41.3, %.lr.ph20 ], [ %indvars.iv40.ph, %.lr.ph20.preheader73 ]
  %90 = getelementptr inbounds double, double* %0, i64 %indvars.iv40
  %91 = load double, double* %90, align 8
  %92 = fmul double %., %91
  store double %92, double* %90, align 8
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %93 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next41
  %94 = load double, double* %93, align 8
  %95 = fmul double %., %94
  store double %95, double* %93, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %96 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next41.1
  %97 = load double, double* %96, align 8
  %98 = fmul double %., %97
  store double %98, double* %96, align 8
  %indvars.iv.next41.2 = add nsw i64 %indvars.iv40, 3
  %99 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next41.2
  %100 = load double, double* %99, align 8
  %101 = fmul double %., %100
  store double %101, double* %99, align 8
  %indvars.iv.next41.3 = add nsw i64 %indvars.iv40, 4
  %exitcond43.3 = icmp eq i64 %indvars.iv.next41.3, %wide.trip.count42.3
  br i1 %exitcond43.3, label %.loopexit10.loopexit, label %.lr.ph20, !llvm.loop !10

.loopexit10.loopexit:                             ; preds = %.lr.ph20
  br label %.loopexit10

.loopexit10:                                      ; preds = %.loopexit10.loopexit, %middle.block, %.lr.ph20.prol.loopexit, %48, %.lr.ph22
  %102 = add i32 %.2421, 1
  %103 = load i32, i32* %8, align 8
  %104 = icmp ult i32 %102, %103
  br i1 %104, label %.lr.ph22, label %.preheader.preheader.loopexit

.preheader.preheader.loopexit:                    ; preds = %.loopexit10
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %._crit_edge
  br label %.preheader

.loopexit9.loopexit:                              ; preds = %.loopexit
  br label %.loopexit9

.loopexit9:                                       ; preds = %.loopexit9.loopexit, %.preheader
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 3
  br i1 %exitcond39, label %169, label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit9
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %.loopexit9 ], [ 0, %.preheader.preheader ]
  %105 = load i32, i32* %19, align 4
  %106 = icmp ult i32 %105, 12
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  br i1 %106, label %.lr.ph17, label %.loopexit9

.lr.ph17:                                         ; preds = %.preheader
  %107 = zext i32 %105 to i64
  br label %108

; <label>:108:                                    ; preds = %.loopexit, %.lr.ph17
  %indvars.iv35 = phi i64 [ %107, %.lr.ph17 ], [ %indvars.iv.next36, %.loopexit ]
  %109 = getelementptr inbounds [21 x double], [21 x double]* %3, i64 %indvars.iv.next38, i64 %indvars.iv35
  %110 = load double, double* %109, align 8
  %111 = fcmp ogt double %110, %41
  br i1 %111, label %112, label %.loopexit

; <label>:112:                                    ; preds = %108
  %113 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %2, i64 0, i32 1, i64 %indvars.iv35, i64 %indvars.iv37
  %114 = load i32, i32* %113, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %113, align 4
  %116 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv35
  %117 = load i32, i32* %116, align 4
  %118 = add nuw nsw i64 %indvars.iv35, 1
  %119 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %118
  %120 = load i32, i32* %119, align 4
  %121 = icmp sgt i32 %120, %117
  br i1 %121, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %112
  %122 = sext i32 %117 to i64
  %123 = sub i32 %120, %117
  %124 = add i32 %120, -1
  %xtraiter = and i32 %123, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %125 = mul nsw i64 %122, 3
  %126 = add nsw i64 %125, %indvars.iv37
  %127 = getelementptr inbounds double, double* %0, i64 %126
  %128 = load double, double* %127, align 8
  %129 = fmul double %., %128
  store double %129, double* %127, align 8
  %indvars.iv.next.prol = add nsw i64 %122, 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ %122, %.lr.ph.preheader ]
  %130 = icmp eq i32 %124, %117
  br i1 %130, label %.loopexit, label %.lr.ph.preheader58

.lr.ph.preheader58:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = sext i32 %120 to i64
  %131 = add nsw i64 %wide.trip.count.1, -2
  %132 = sub nsw i64 %131, %indvars.iv.unr.ph
  %133 = lshr i64 %132, 1
  %134 = and i64 %133, 1
  %lcmp.mod80 = icmp eq i64 %134, 0
  br i1 %lcmp.mod80, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit78.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader58
  br label %.lr.ph.prol81

.lr.ph.prol81:                                    ; preds = %.lr.ph.prol.preheader
  %135 = mul nsw i64 %indvars.iv.unr.ph, 3
  %136 = add nsw i64 %135, %indvars.iv37
  %137 = getelementptr inbounds double, double* %0, i64 %136
  %138 = load double, double* %137, align 8
  %139 = fmul double %., %138
  store double %139, double* %137, align 8
  %140 = mul nsw i64 %indvars.iv.unr.ph, 3
  %141 = add i64 %140, 3
  %142 = add nsw i64 %141, %indvars.iv37
  %143 = getelementptr inbounds double, double* %0, i64 %142
  %144 = load double, double* %143, align 8
  %145 = fmul double %., %144
  store double %145, double* %143, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr.ph, 2
  br label %.lr.ph.prol.loopexit78.unr-lcssa

.lr.ph.prol.loopexit78.unr-lcssa:                 ; preds = %.lr.ph.preheader58, %.lr.ph.prol81
  %indvars.iv.unr.ph82 = phi i64 [ %indvars.iv.next.1.prol, %.lr.ph.prol81 ], [ %indvars.iv.unr.ph, %.lr.ph.preheader58 ]
  br label %.lr.ph.prol.loopexit78

.lr.ph.prol.loopexit78:                           ; preds = %.lr.ph.prol.loopexit78.unr-lcssa
  %146 = icmp eq i64 %133, 0
  br i1 %146, label %.loopexit.loopexit, label %.lr.ph.preheader58.new

.lr.ph.preheader58.new:                           ; preds = %.lr.ph.prol.loopexit78
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader58.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph82, %.lr.ph.preheader58.new ], [ %indvars.iv.next.1.1, %.lr.ph ]
  %147 = mul nsw i64 %indvars.iv, 3
  %148 = add nsw i64 %147, %indvars.iv37
  %149 = getelementptr inbounds double, double* %0, i64 %148
  %150 = load double, double* %149, align 8
  %151 = fmul double %., %150
  store double %151, double* %149, align 8
  %152 = mul i64 %indvars.iv, 3
  %153 = add i64 %152, 3
  %154 = add nsw i64 %153, %indvars.iv37
  %155 = getelementptr inbounds double, double* %0, i64 %154
  %156 = load double, double* %155, align 8
  %157 = fmul double %., %156
  store double %157, double* %155, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %158 = mul nsw i64 %indvars.iv.next.1, 3
  %159 = add nsw i64 %158, %indvars.iv37
  %160 = getelementptr inbounds double, double* %0, i64 %159
  %161 = load double, double* %160, align 8
  %162 = fmul double %., %161
  store double %162, double* %160, align 8
  %163 = mul i64 %indvars.iv.next.1, 3
  %164 = add i64 %163, 3
  %165 = add nsw i64 %164, %indvars.iv37
  %166 = getelementptr inbounds double, double* %0, i64 %165
  %167 = load double, double* %166, align 8
  %168 = fmul double %., %167
  store double %168, double* %166, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 4
  %exitcond.1.1 = icmp eq i64 %indvars.iv.next.1.1, %wide.trip.count.1
  br i1 %exitcond.1.1, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph.prol.loopexit78, %.loopexit.loopexit.unr-lcssa
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph.prol.loopexit, %112, %108
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, 12
  br i1 %exitcond, label %.loopexit9.loopexit, label %108

; <label>:169:                                    ; preds = %.loopexit9
  ret void

.outer.1.loopexit:                                ; preds = %174
  br label %.outer.1

.outer.1:                                         ; preds = %.outer.1.loopexit, %.preheader11.153
  %.05.ph.1 = phi i64 [ 0, %.preheader11.153 ], [ %indvars.iv.next47.1, %.outer.1.loopexit ]
  %.2.ph.1 = phi double [ %.2.ph, %.preheader11.153 ], [ %176, %.outer.1.loopexit ]
  %sext56 = shl i64 %.05.ph.1, 32
  %170 = ashr exact i64 %sext56, 32
  br label %171

; <label>:171:                                    ; preds = %174, %.outer.1
  %indvars.iv46.1 = phi i64 [ %170, %.outer.1 ], [ %indvars.iv.next47.1, %174 ]
  %172 = icmp slt i64 %indvars.iv46.1, 3
  br i1 %172, label %174, label %173

; <label>:173:                                    ; preds = %171
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond50.1 = icmp eq i64 %indvars.iv.next49.1, 12
  br i1 %exitcond50.1, label %._crit_edge.loopexit, label %.preheader11

; <label>:174:                                    ; preds = %171
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46.1, 1
  %175 = getelementptr inbounds [21 x double], [21 x double]* %3, i64 %indvars.iv.next47.1, i64 %indvars.iv.next49
  %176 = load double, double* %175, align 8
  %177 = fcmp ogt double %176, %.2.ph.1
  br i1 %177, label %.outer.1.loopexit, label %171
}

declare i32 @loop_break(%struct.III_scalefac_t*, %struct.gr_info*) local_unnamed_addr #1

declare i32 @scale_bitcount(%struct.III_scalefac_t*, %struct.gr_info*) local_unnamed_addr #1

declare i32 @scale_bitcount_lsf(%struct.III_scalefac_t*, %struct.gr_info*) local_unnamed_addr #1

; Function Attrs: nounwind
declare double @log10(double) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { nounwind readnone }
attributes #10 = { noreturn nounwind }

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
!10 = distinct !{!10, !7, !4, !5}
