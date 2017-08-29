; ModuleID = 'takehiro.ll'
source_filename = "takehiro.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i32 }
%struct.scalefac_struct = type { [23 x i32], [14 x i32] }
%struct.huffcodetab = type { i32, i32, i64*, i8* }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon.0] }
%struct.anon.0 = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.III_scalefac_t = type { [22 x i32], [13 x [3 x i32]] }

@subdv_table = local_unnamed_addr global [23 x %struct.anon] [%struct.anon zeroinitializer, %struct.anon zeroinitializer, %struct.anon zeroinitializer, %struct.anon zeroinitializer, %struct.anon zeroinitializer, %struct.anon { i32 0, i32 1 }, %struct.anon { i32 1, i32 1 }, %struct.anon { i32 1, i32 1 }, %struct.anon { i32 1, i32 2 }, %struct.anon { i32 2, i32 2 }, %struct.anon { i32 2, i32 3 }, %struct.anon { i32 2, i32 3 }, %struct.anon { i32 3, i32 4 }, %struct.anon { i32 3, i32 4 }, %struct.anon { i32 3, i32 4 }, %struct.anon { i32 4, i32 5 }, %struct.anon { i32 4, i32 5 }, %struct.anon { i32 4, i32 6 }, %struct.anon { i32 5, i32 6 }, %struct.anon { i32 5, i32 6 }, %struct.anon { i32 5, i32 7 }, %struct.anon { i32 6, i32 7 }, %struct.anon { i32 6, i32 7 }], align 16
@ipow20 = external local_unnamed_addr global [256 x double], align 16
@scalefac_band = external local_unnamed_addr global %struct.scalefac_struct, align 4
@huf_tbl_noESC = internal unnamed_addr constant [15 x i32] [i32 1, i32 2, i32 5, i32 7, i32 7, i32 10, i32 10, i32 13, i32 13, i32 13, i32 13, i32 13, i32 13, i32 13, i32 13], align 16
@ht = external local_unnamed_addr global [34 x %struct.huffcodetab], align 16
@cb_esc_buf = internal global [288 x i32] zeroinitializer, align 16
@cb_esc_sign = internal unnamed_addr global i32 0, align 4
@cb_esc_end = internal unnamed_addr global i32* null, align 8
@scfsi_calc.scfsi_band = internal unnamed_addr constant [5 x i32] [i32 0, i32 6, i32 11, i32 16, i32 21], align 16
@scfsi_calc.slen1_n = internal unnamed_addr constant [16 x i32] [i32 0, i32 1, i32 1, i32 1, i32 8, i32 2, i32 2, i32 2, i32 4, i32 4, i32 4, i32 8, i32 8, i32 8, i32 16, i32 16], align 16
@scfsi_calc.slen2_n = internal unnamed_addr constant [16 x i32] [i32 0, i32 2, i32 4, i32 8, i32 1, i32 2, i32 4, i32 8, i32 2, i32 4, i32 8, i32 2, i32 4, i32 8, i32 4, i32 8], align 16
@scfsi_calc.slen1_tab = internal unnamed_addr constant [16 x i32] [i32 0, i32 0, i32 0, i32 0, i32 3, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 3, i32 3, i32 3, i32 4, i32 4], align 16
@scfsi_calc.slen2_tab = internal unnamed_addr constant [16 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3, i32 1, i32 2, i32 3, i32 1, i32 2, i32 3, i32 2, i32 3], align 16

; Function Attrs: noinline nounwind uwtable
define i32 @count_bits(%struct.lame_global_flags* nocapture readonly, i32*, double*, %struct.gr_info*) local_unnamed_addr #0 {
  %5 = alloca i32, align 4
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %3, i64 0, i32 3
  %7 = load i32, i32* %6, align 4
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds [256 x double], [256 x double]* @ipow20, i64 0, i64 %8
  %10 = load double, double* %9, align 8
  %11 = fdiv double 8.206000e+03, %10
  br label %16

; <label>:12:                                     ; preds = %16
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fcmp ogt double %14, %11
  br i1 %15, label %.loopexit.loopexit, label %49

; <label>:16:                                     ; preds = %65, %4
  %indvars.iv = phi i64 [ 0, %4 ], [ %indvars.iv.next.5, %65 ]
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = fcmp ogt double %18, %11
  br i1 %19, label %.loopexit.loopexit, label %12

; <label>:20:                                     ; preds = %65
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 60
  %22 = load i32, i32* %21, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %25, label %24

; <label>:24:                                     ; preds = %20
  tail call void @quantize_xrpow(double* nonnull %2, i32* %1, %struct.gr_info* %3) #5
  br label %26

; <label>:25:                                     ; preds = %20
  tail call void @quantize_xrpow_ISO(double* nonnull %2, i32* %1, %struct.gr_info* %3) #5
  br label %26

; <label>:26:                                     ; preds = %25, %24
  %27 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %3, i64 0, i32 6
  %28 = load i32, i32* %27, align 8
  %29 = icmp eq i32 %28, 2
  br i1 %29, label %30, label %38

; <label>:30:                                     ; preds = %26
  %31 = getelementptr inbounds i32, i32* %1, i64 36
  %32 = call fastcc i32 @choose_table_short(i32* %1, i32* %31, i32* nonnull %5)
  %33 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %3, i64 0, i32 8, i64 0
  store i32 %32, i32* %33, align 8
  %34 = getelementptr inbounds i32, i32* %1, i64 576
  %35 = call fastcc i32 @choose_table_short(i32* %31, i32* %34, i32* nonnull %5)
  %36 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %3, i64 0, i32 8, i64 1
  store i32 %35, i32* %36, align 4
  %37 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %3, i64 0, i32 1
  store i32 288, i32* %37, align 4
  br label %47

; <label>:38:                                     ; preds = %26
  %39 = tail call fastcc i32 @count_bits_long(i32* %1, %struct.gr_info* nonnull %3)
  store i32 %39, i32* %5, align 4
  %40 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %3, i64 0, i32 2
  %41 = load i32, i32* %40, align 8
  %42 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %3, i64 0, i32 1
  %43 = load i32, i32* %42, align 4
  %44 = sub i32 %41, %43
  %45 = lshr i32 %44, 2
  store i32 %45, i32* %40, align 8
  %46 = lshr i32 %43, 1
  store i32 %46, i32* %42, align 4
  br label %47

; <label>:47:                                     ; preds = %38, %30
  %48 = load i32, i32* %5, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %61, %57, %53, %49, %12, %16
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %47
  %.0 = phi i32 [ %48, %47 ], [ 100000, %.loopexit.loopexit ]
  ret i32 %.0

; <label>:49:                                     ; preds = %12
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %50 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %51 = load double, double* %50, align 8
  %52 = fcmp ogt double %51, %11
  br i1 %52, label %.loopexit.loopexit, label %53

; <label>:53:                                     ; preds = %49
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %54 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %55 = load double, double* %54, align 8
  %56 = fcmp ogt double %55, %11
  br i1 %56, label %.loopexit.loopexit, label %57

; <label>:57:                                     ; preds = %53
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %58 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.3
  %59 = load double, double* %58, align 8
  %60 = fcmp ogt double %59, %11
  br i1 %60, label %.loopexit.loopexit, label %61

; <label>:61:                                     ; preds = %57
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %62 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.4
  %63 = load double, double* %62, align 8
  %64 = fcmp ogt double %63, %11
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  br i1 %64, label %.loopexit.loopexit, label %65

; <label>:65:                                     ; preds = %61
  %66 = icmp slt i64 %indvars.iv.next.5, 576
  br i1 %66, label %16, label %20
}

declare void @quantize_xrpow(double*, i32*, %struct.gr_info*) local_unnamed_addr #1

declare void @quantize_xrpow_ISO(double*, i32*, %struct.gr_info*) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @choose_table_short(i32*, i32*, i32* nocapture) unnamed_addr #2 {
  %4 = tail call fastcc i32 @ix_max(i32* %0, i32* %1)
  %5 = icmp sgt i32 %4, 8206
  br i1 %5, label %6, label %7

; <label>:6:                                      ; preds = %3
  store i32 100000, i32* %2, align 4
  br label %49

; <label>:7:                                      ; preds = %3
  %8 = icmp slt i32 %4, 16
  br i1 %8, label %9, label %32

; <label>:9:                                      ; preds = %7
  %10 = icmp eq i32 %4, 0
  br i1 %10, label %49, label %11

; <label>:11:                                     ; preds = %9
  %12 = add nsw i32 %4, -1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [15 x i32], [15 x i32]* @huf_tbl_noESC, i64 0, i64 %13
  %15 = load i32, i32* %14, align 4
  %16 = tail call fastcc i32 @count_bit_short_noESC(i32* %0, i32* %1, i32 %15)
  switch i32 %15, label %29 [
    i32 7, label %17
    i32 10, label %17
    i32 2, label %21
    i32 5, label %21
    i32 13, label %25
  ]

; <label>:17:                                     ; preds = %11, %11
  %18 = add nsw i32 %15, 1
  %19 = tail call fastcc i32 @count_bit_noESC2(i32 %18)
  %20 = icmp sgt i32 %16, %19
  %. = select i1 %20, i32 %18, i32 %15
  %.9 = select i1 %20, i32 %19, i32 %16
  br label %21

; <label>:21:                                     ; preds = %17, %11, %11
  %.15 = phi i32 [ %15, %11 ], [ %15, %11 ], [ %., %17 ]
  %.13 = phi i32 [ %16, %11 ], [ %16, %11 ], [ %.9, %17 ]
  %.01 = phi i32 [ %15, %11 ], [ %15, %11 ], [ %18, %17 ]
  %22 = add nsw i32 %.01, 1
  %23 = tail call fastcc i32 @count_bit_noESC2(i32 %22)
  %24 = icmp sgt i32 %.13, %23
  %..15 = select i1 %24, i32 %22, i32 %.15
  %..13 = select i1 %24, i32 %23, i32 %.13
  br label %29

; <label>:25:                                     ; preds = %11
  %26 = add nsw i32 %15, 2
  %27 = tail call fastcc i32 @count_bit_noESC2(i32 %26)
  %28 = icmp sgt i32 %16, %27
  %.10 = select i1 %28, i32 %26, i32 %15
  %.11 = select i1 %28, i32 %27, i32 %16
  br label %29

; <label>:29:                                     ; preds = %11, %25, %21
  %.48 = phi i32 [ %.10, %25 ], [ %..15, %21 ], [ %15, %11 ]
  %.4 = phi i32 [ %.11, %25 ], [ %..13, %21 ], [ %16, %11 ]
  %30 = load i32, i32* %2, align 4
  %31 = add nsw i32 %30, %.4
  store i32 %31, i32* %2, align 4
  br label %49

; <label>:32:                                     ; preds = %7
  %33 = add nsw i32 %4, -15
  %34 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 24, i32 1), align 4
  %35 = icmp slt i32 %34, %33
  br i1 %35, label %36, label %.lr.ph.preheader

; <label>:36:                                     ; preds = %32
  %37 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 25, i32 1), align 4
  %38 = icmp slt i32 %37, %33
  br i1 %38, label %50, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %32, %36, %50, %53, %56, %59, %62, %65
  %.1.lcssa.ph = phi i32 [ 31, %65 ], [ 30, %62 ], [ 29, %59 ], [ 28, %56 ], [ 27, %53 ], [ 26, %50 ], [ 25, %36 ], [ 24, %32 ]
  %39 = add nsw i32 %.1.lcssa.ph, -8
  %40 = zext i32 %39 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %45
  %indvars.iv = phi i64 [ %40, %.lr.ph.preheader ], [ %indvars.iv.next, %45 ]
  %.512 = phi i32 [ %39, %.lr.ph.preheader ], [ %46, %45 ]
  %41 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %indvars.iv, i32 1
  %42 = load i32, i32* %41, align 4
  %43 = icmp slt i32 %42, %33
  %44 = trunc i64 %indvars.iv to i32
  br i1 %43, label %45, label %._crit_edge.loopexit

; <label>:45:                                     ; preds = %.lr.ph
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %46 = add nsw i32 %.512, 1
  %47 = icmp slt i64 %indvars.iv.next, 24
  br i1 %47, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph, %45
  %.5.lcssa.ph = phi i32 [ %46, %45 ], [ %44, %.lr.ph ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %65
  %.1.lcssa18 = phi i32 [ 32, %65 ], [ %.1.lcssa.ph, %._crit_edge.loopexit ]
  %.5.lcssa = phi i32 [ 24, %65 ], [ %.5.lcssa.ph, %._crit_edge.loopexit ]
  %48 = tail call fastcc i32 @count_bit_short_ESC(i32* %0, i32* %1, i32 %.5.lcssa, i32 %.1.lcssa18, i32* %2)
  br label %49

; <label>:49:                                     ; preds = %29, %._crit_edge, %9, %6
  %.0 = phi i32 [ -1, %6 ], [ 0, %9 ], [ %.48, %29 ], [ %48, %._crit_edge ]
  ret i32 %.0

; <label>:50:                                     ; preds = %36
  %51 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 26, i32 1), align 4
  %52 = icmp slt i32 %51, %33
  br i1 %52, label %53, label %.lr.ph.preheader

; <label>:53:                                     ; preds = %50
  %54 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 27, i32 1), align 4
  %55 = icmp slt i32 %54, %33
  br i1 %55, label %56, label %.lr.ph.preheader

; <label>:56:                                     ; preds = %53
  %57 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 28, i32 1), align 4
  %58 = icmp slt i32 %57, %33
  br i1 %58, label %59, label %.lr.ph.preheader

; <label>:59:                                     ; preds = %56
  %60 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 29, i32 1), align 4
  %61 = icmp slt i32 %60, %33
  br i1 %61, label %62, label %.lr.ph.preheader

; <label>:62:                                     ; preds = %59
  %63 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 30, i32 1), align 4
  %64 = icmp slt i32 %63, %33
  br i1 %64, label %65, label %.lr.ph.preheader

; <label>:65:                                     ; preds = %62
  %66 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 31, i32 1), align 4
  %67 = icmp slt i32 %66, %33
  br i1 %67, label %._crit_edge, label %.lr.ph.preheader
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @count_bits_long(i32*, %struct.gr_info* nocapture) unnamed_addr #2 {
  %3 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  br label %4

; <label>:4:                                      ; preds = %6, %2
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %6 ], [ 576, %2 ]
  %5 = icmp sgt i64 %indvars.iv35, 1
  br i1 %5, label %6, label %14

; <label>:6:                                      ; preds = %4
  %7 = add nsw i64 %indvars.iv35, -1
  %8 = getelementptr inbounds i32, i32* %0, i64 %7
  %9 = load i32, i32* %8, align 4
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -2
  %10 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next36
  %11 = load i32, i32* %10, align 4
  %12 = or i32 %11, %9
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %4, label %14

; <label>:14:                                     ; preds = %6, %4
  %15 = trunc i64 %indvars.iv35 to i32
  %16 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 2
  store i32 %15, i32* %16, align 8
  %17 = icmp sgt i32 %15, 3
  br i1 %17, label %.lr.ph, label %62

.lr.ph:                                           ; preds = %14
  %18 = load i8*, i8** getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 32, i32 3), align 16
  %.promoted = load i32, i32* %3, align 4
  %sext = shl i64 %indvars.iv35, 32
  %19 = ashr exact i64 %sext, 32
  br label %20

; <label>:20:                                     ; preds = %.lr.ph, %37
  %indvars.iv33 = phi i64 [ %19, %.lr.ph ], [ %indvars.iv.next34, %37 ]
  %21 = phi i32 [ %.promoted, %.lr.ph ], [ %53, %37 ]
  %.0512 = phi i32 [ 0, %.lr.ph ], [ %58, %37 ]
  %22 = add nsw i64 %indvars.iv33, -1
  %23 = getelementptr inbounds i32, i32* %0, i64 %22
  %24 = load i32, i32* %23, align 4
  %25 = add nsw i64 %indvars.iv33, -2
  %26 = getelementptr inbounds i32, i32* %0, i64 %25
  %27 = load i32, i32* %26, align 4
  %28 = or i32 %27, %24
  %29 = add nsw i64 %indvars.iv33, -3
  %30 = getelementptr inbounds i32, i32* %0, i64 %29
  %31 = load i32, i32* %30, align 4
  %32 = or i32 %28, %31
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, -4
  %33 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next34
  %34 = load i32, i32* %33, align 4
  %35 = or i32 %32, %34
  %36 = icmp ugt i32 %35, 1
  br i1 %36, label %._crit_edge, label %37

; <label>:37:                                     ; preds = %20
  %38 = add nsw i32 %21, %24
  %39 = load i32, i32* %26, align 4
  %40 = icmp eq i32 %39, 0
  %41 = add nsw i32 %24, 2
  %not.20 = xor i1 %40, true
  %42 = zext i1 %not.20 to i32
  %43 = add nsw i32 %38, %42
  %.08 = select i1 %40, i32 %24, i32 %41
  %44 = load i32, i32* %30, align 4
  %45 = icmp eq i32 %44, 0
  %46 = add nsw i32 %.08, 4
  %not.21 = xor i1 %45, true
  %47 = zext i1 %not.21 to i32
  %48 = add nsw i32 %43, %47
  %.19 = select i1 %45, i32 %.08, i32 %46
  %49 = load i32, i32* %33, align 4
  %50 = icmp eq i32 %49, 0
  %51 = add nsw i32 %.19, 8
  %not.22 = xor i1 %50, true
  %52 = zext i1 %not.22 to i32
  %53 = add nsw i32 %48, %52
  %.210 = select i1 %50, i32 %.19, i32 %51
  %54 = sext i32 %.210 to i64
  %55 = getelementptr inbounds i8, i8* %18, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = add nsw i32 %57, %.0512
  %59 = icmp sgt i64 %indvars.iv.next34, 3
  br i1 %59, label %20, label %._crit_edge15

._crit_edge:                                      ; preds = %20
  %60 = trunc i64 %indvars.iv33 to i32
  store i32 %21, i32* %3, align 4
  br label %62

._crit_edge15:                                    ; preds = %37
  %61 = trunc i64 %indvars.iv.next34 to i32
  store i32 %53, i32* %3, align 4
  br label %62

; <label>:62:                                     ; preds = %._crit_edge15, %._crit_edge, %14
  %.05.lcssa = phi i32 [ %.0512, %._crit_edge ], [ %58, %._crit_edge15 ], [ 0, %14 ]
  %.14.lcssa = phi i32 [ %60, %._crit_edge ], [ %61, %._crit_edge15 ], [ %15, %14 ]
  %63 = load i32, i32* %16, align 8
  %64 = sub i32 %63, %.14.lcssa
  %65 = icmp slt i32 %.05.lcssa, %64
  %66 = load i32, i32* %3, align 4
  %.05. = select i1 %65, i32 %.05.lcssa, i32 %64
  %not. = xor i1 %65, true
  %. = zext i1 %not. to i32
  %storemerge = add nsw i32 %.05., %66
  store i32 %storemerge, i32* %3, align 4
  %67 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 14
  store i32 %., i32* %67, align 8
  %68 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 18
  store i32 %storemerge, i32* %68, align 8
  %69 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 1
  store i32 %.14.lcssa, i32* %69, align 4
  %70 = icmp eq i32 %.14.lcssa, 0
  br i1 %70, label %132, label %71

; <label>:71:                                     ; preds = %62
  %72 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 6
  %73 = load i32, i32* %72, align 8
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %.preheader.preheader, label %118

.preheader.preheader:                             ; preds = %71
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %.preheader ], [ 0, %.preheader.preheader ]
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %75 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv.next32
  %76 = load i32, i32* %75, align 4
  %77 = icmp slt i32 %76, %.14.lcssa
  br i1 %77, label %.preheader, label %78

; <label>:78:                                     ; preds = %.preheader
  %79 = getelementptr inbounds [23 x %struct.anon], [23 x %struct.anon]* @subdv_table, i64 0, i64 %indvars.iv.next32, i32 0
  %80 = load i32, i32* %79, align 8
  %81 = sext i32 %80 to i64
  br label %82

; <label>:82:                                     ; preds = %82, %78
  %indvars.iv = phi i64 [ %indvars.iv.next, %82 ], [ %81, %78 ]
  %83 = add nsw i64 %indvars.iv, 1
  %84 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %83
  %85 = load i32, i32* %84, align 4
  %86 = icmp sgt i32 %85, %.14.lcssa
  %indvars.iv.next = add i64 %indvars.iv, -1
  br i1 %86, label %82, label %87

; <label>:87:                                     ; preds = %82
  %88 = trunc i64 %indvars.iv to i32
  %89 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 10
  store i32 %88, i32* %89, align 8
  %90 = getelementptr inbounds [23 x %struct.anon], [23 x %struct.anon]* @subdv_table, i64 0, i64 %indvars.iv.next32, i32 1
  %91 = load i32, i32* %90, align 4
  br label %92

; <label>:92:                                     ; preds = %92, %87
  %.1 = phi i32 [ %91, %87 ], [ %99, %92 ]
  %93 = add i32 %.1, 2
  %94 = add i32 %93, %88
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %95
  %97 = load i32, i32* %96, align 4
  %98 = icmp sgt i32 %97, %.14.lcssa
  %99 = add nsw i32 %.1, -1
  br i1 %98, label %92, label %100

; <label>:100:                                    ; preds = %92
  %101 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 11
  store i32 %.1, i32* %101, align 4
  %102 = load i32, i32* %89, align 8
  %103 = add i32 %102, 1
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %104
  %106 = load i32, i32* %105, align 4
  %107 = add i32 %.1, 2
  %108 = add i32 %107, %102
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %109
  %111 = load i32, i32* %110, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, i32* %0, i64 %112
  %114 = sext i32 %.14.lcssa to i64
  %115 = getelementptr inbounds i32, i32* %0, i64 %114
  %116 = call fastcc i32 @choose_table(i32* %113, i32* %115, i32* nonnull %3)
  %117 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 8, i64 2
  store i32 %116, i32* %117, align 8
  br label %123

; <label>:118:                                    ; preds = %71
  %119 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 10
  store i32 7, i32* %119, align 8
  %120 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 11
  store i32 13, i32* %120, align 4
  %121 = load i32, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 8), align 4
  %122 = icmp sgt i32 %121, %.14.lcssa
  %.14. = select i1 %122, i32 %.14.lcssa, i32 %121
  br label %123

; <label>:123:                                    ; preds = %118, %100
  %.07 = phi i32 [ %111, %100 ], [ %.14.lcssa, %118 ]
  %.2 = phi i32 [ %106, %100 ], [ %.14., %118 ]
  %124 = sext i32 %.2 to i64
  %125 = getelementptr inbounds i32, i32* %0, i64 %124
  %126 = call fastcc i32 @choose_table(i32* %0, i32* %125, i32* nonnull %3)
  %127 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 8, i64 0
  store i32 %126, i32* %127, align 8
  %128 = sext i32 %.07 to i64
  %129 = getelementptr inbounds i32, i32* %0, i64 %128
  %130 = call fastcc i32 @choose_table(i32* %125, i32* %129, i32* nonnull %3)
  %131 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 8, i64 1
  store i32 %130, i32* %131, align 4
  br label %132

; <label>:132:                                    ; preds = %62, %123
  %.0 = load i32, i32* %3, align 4
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define void @best_huffman_divide(i32, i32, %struct.gr_info* nocapture, i32*) local_unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = alloca [25 x i32], align 16
  %7 = alloca [25 x i32], align 16
  %8 = alloca %struct.gr_info, align 8
  %9 = bitcast %struct.gr_info* %8 to i8*
  %10 = bitcast %struct.gr_info* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %9, i8* %10, i64 120, i32 8, i1 false)
  %11 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %8, i64 0, i32 1
  %12 = load i32, i32* %11, align 4
  %13 = shl i32 %12, 1
  %14 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %8, i64 0, i32 0
  %15 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %8, i64 0, i32 18
  %16 = load i32, i32* %15, align 8
  %17 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %8, i64 0, i32 15
  %18 = load i32, i32* %17, align 4
  %19 = add i32 %18, %16
  %20 = sext i32 %13 to i64
  %21 = getelementptr inbounds i32, i32* %3, i64 %20
  br label %28

.preheader3:                                      ; preds = %28, %33
  %.01.lcssa = phi i32 [ %32, %28 ], [ %39, %33 ]
  %22 = icmp slt i32 %.01.lcssa, 25
  br i1 %22, label %.lr.ph.preheader, label %.preheader2

.lr.ph.preheader:                                 ; preds = %.preheader3
  %23 = sext i32 %.01.lcssa to i64
  %24 = sub i32 25, %.01.lcssa
  %25 = sub i32 24, %.01.lcssa
  %xtraiter = and i32 %24, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv10.prol = phi i64 [ %indvars.iv.next11.prol, %.lr.ph.prol ], [ %23, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %26 = getelementptr inbounds [25 x i32], [25 x i32]* %6, i64 0, i64 %indvars.iv10.prol
  store i32 100000, i32* %26, align 4
  %indvars.iv.next11.prol = add nsw i64 %indvars.iv10.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv10.unr = phi i64 [ %23, %.lr.ph.preheader ], [ %indvars.iv.next11.prol, %.lr.ph.prol.loopexit.loopexit ]
  %27 = icmp ult i32 %25, 7
  br i1 %27, label %.preheader2, label %.lr.ph.preheader17

.lr.ph.preheader17:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

; <label>:28:                                     ; preds = %4, %33
  %indvars.iv13 = phi i64 [ 2, %4 ], [ %indvars.iv.next14, %33 ]
  %.017 = phi i32 [ 2, %4 ], [ %39, %33 ]
  %29 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv13
  %30 = load i32, i32* %29, align 4
  %31 = icmp sgt i32 %30, %13
  %32 = trunc i64 %indvars.iv13 to i32
  br i1 %31, label %.preheader3, label %33

; <label>:33:                                     ; preds = %28
  %34 = getelementptr inbounds [25 x i32], [25 x i32]* %6, i64 0, i64 %indvars.iv13
  store i32 %19, i32* %34, align 4
  %35 = sext i32 %30 to i64
  %36 = getelementptr inbounds i32, i32* %3, i64 %35
  %37 = call fastcc i32 @choose_table(i32* %36, i32* %21, i32* %34)
  %38 = getelementptr inbounds [25 x i32], [25 x i32]* %7, i64 0, i64 %indvars.iv13
  store i32 %37, i32* %38, align 4
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %39 = add nuw nsw i32 %.017, 1
  %40 = icmp slt i64 %indvars.iv.next14, 23
  br i1 %40, label %28, label %.preheader3

.preheader2.loopexit:                             ; preds = %.lr.ph
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.loopexit, %.lr.ph.prol.loopexit, %.preheader3
  %41 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %8, i64 0, i32 10
  %42 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %8, i64 0, i32 8, i64 0
  %43 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 0
  %44 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %8, i64 0, i32 8, i64 1
  %45 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %8, i64 0, i32 11
  %46 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %8, i64 0, i32 8, i64 2
  br label %56

.lr.ph:                                           ; preds = %.lr.ph.preheader17, %.lr.ph
  %indvars.iv10 = phi i64 [ %indvars.iv.next11.7, %.lr.ph ], [ %indvars.iv10.unr, %.lr.ph.preheader17 ]
  %47 = getelementptr inbounds [25 x i32], [25 x i32]* %6, i64 0, i64 %indvars.iv10
  store i32 100000, i32* %47, align 4
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %48 = getelementptr inbounds [25 x i32], [25 x i32]* %6, i64 0, i64 %indvars.iv.next11
  store i32 100000, i32* %48, align 4
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv10, 2
  %49 = getelementptr inbounds [25 x i32], [25 x i32]* %6, i64 0, i64 %indvars.iv.next11.1
  store i32 100000, i32* %49, align 4
  %indvars.iv.next11.2 = add nsw i64 %indvars.iv10, 3
  %50 = getelementptr inbounds [25 x i32], [25 x i32]* %6, i64 0, i64 %indvars.iv.next11.2
  store i32 100000, i32* %50, align 4
  %indvars.iv.next11.3 = add nsw i64 %indvars.iv10, 4
  %51 = getelementptr inbounds [25 x i32], [25 x i32]* %6, i64 0, i64 %indvars.iv.next11.3
  store i32 100000, i32* %51, align 4
  %indvars.iv.next11.4 = add nsw i64 %indvars.iv10, 5
  %52 = getelementptr inbounds [25 x i32], [25 x i32]* %6, i64 0, i64 %indvars.iv.next11.4
  store i32 100000, i32* %52, align 4
  %indvars.iv.next11.5 = add nsw i64 %indvars.iv10, 6
  %53 = getelementptr inbounds [25 x i32], [25 x i32]* %6, i64 0, i64 %indvars.iv.next11.5
  store i32 100000, i32* %53, align 4
  %indvars.iv.next11.6 = add nsw i64 %indvars.iv10, 7
  %54 = getelementptr inbounds [25 x i32], [25 x i32]* %6, i64 0, i64 %indvars.iv.next11.6
  store i32 100000, i32* %54, align 4
  %indvars.iv.next11.7 = add nsw i64 %indvars.iv10, 8
  %exitcond12.7 = icmp eq i64 %indvars.iv.next11.7, 25
  br i1 %exitcond12.7, label %.preheader2.loopexit, label %.lr.ph

.loopexit:                                        ; preds = %90
  %55 = icmp slt i64 %indvars.iv.next9, 16
  br i1 %55, label %56, label %91

; <label>:56:                                     ; preds = %.preheader2, %.loopexit
  %indvars.iv8 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next9, %.loopexit ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %57 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv.next9
  %58 = load i32, i32* %57, align 4
  %59 = icmp sgt i32 %58, %13
  br i1 %59, label %91, label %60

; <label>:60:                                     ; preds = %56
  %61 = trunc i64 %indvars.iv8 to i32
  store i32 %61, i32* %41, align 8
  store i32 0, i32* %5, align 4
  %62 = sext i32 %58 to i64
  %63 = getelementptr inbounds i32, i32* %3, i64 %62
  %64 = call fastcc i32 @choose_table(i32* %3, i32* %63, i32* nonnull %5)
  store i32 %64, i32* %42, align 8
  %65 = load i32, i32* %43, align 8
  %66 = load i32, i32* %5, align 4
  %67 = icmp slt i32 %65, %66
  br i1 %67, label %91, label %.preheader

.preheader:                                       ; preds = %60
  %68 = load i32, i32* %5, align 4
  %69 = add nuw nsw i64 %indvars.iv8, 2
  br label %70

; <label>:70:                                     ; preds = %90, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %90 ]
  %71 = add nuw nsw i64 %69, %indvars.iv
  %72 = getelementptr inbounds [25 x i32], [25 x i32]* %6, i64 0, i64 %71
  %73 = load i32, i32* %72, align 4
  %74 = add nsw i32 %73, %68
  store i32 %74, i32* %14, align 8
  %75 = load i32, i32* %43, align 8
  %76 = icmp slt i32 %75, %74
  br i1 %76, label %90, label %77

; <label>:77:                                     ; preds = %70
  %78 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %71
  %79 = load i32, i32* %78, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32* %3, i64 %80
  %82 = call fastcc i32 @choose_table(i32* %63, i32* %81, i32* nonnull %14)
  store i32 %82, i32* %44, align 4
  %83 = load i32, i32* %43, align 8
  %84 = load i32, i32* %14, align 8
  %85 = icmp slt i32 %83, %84
  br i1 %85, label %90, label %86

; <label>:86:                                     ; preds = %77
  %87 = trunc i64 %indvars.iv to i32
  store i32 %87, i32* %45, align 4
  %88 = getelementptr inbounds [25 x i32], [25 x i32]* %7, i64 0, i64 %71
  %89 = load i32, i32* %88, align 4
  store i32 %89, i32* %46, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %10, i8* nonnull %9, i64 120, i32 8, i1 false)
  br label %90

; <label>:90:                                     ; preds = %77, %70, %86
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %.loopexit, label %70

; <label>:91:                                     ; preds = %60, %56, %.loopexit
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @choose_table(i32*, i32*, i32* nocapture) unnamed_addr #2 {
  %4 = tail call fastcc i32 @ix_max(i32* %0, i32* %1)
  %5 = icmp sgt i32 %4, 8206
  br i1 %5, label %6, label %7

; <label>:6:                                      ; preds = %3
  store i32 100000, i32* %2, align 4
  br label %49

; <label>:7:                                      ; preds = %3
  %8 = icmp slt i32 %4, 16
  br i1 %8, label %9, label %32

; <label>:9:                                      ; preds = %7
  %10 = icmp eq i32 %4, 0
  br i1 %10, label %49, label %11

; <label>:11:                                     ; preds = %9
  %12 = add nsw i32 %4, -1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [15 x i32], [15 x i32]* @huf_tbl_noESC, i64 0, i64 %13
  %15 = load i32, i32* %14, align 4
  %16 = tail call fastcc i32 @count_bit_noESC(i32* %0, i32* %1, i32 %15)
  switch i32 %15, label %29 [
    i32 7, label %17
    i32 10, label %17
    i32 2, label %21
    i32 5, label %21
    i32 13, label %25
  ]

; <label>:17:                                     ; preds = %11, %11
  %18 = add nsw i32 %15, 1
  %19 = tail call fastcc i32 @count_bit_noESC2(i32 %18)
  %20 = icmp sgt i32 %16, %19
  %. = select i1 %20, i32 %18, i32 %15
  %.9 = select i1 %20, i32 %19, i32 %16
  br label %21

; <label>:21:                                     ; preds = %17, %11, %11
  %.15 = phi i32 [ %15, %11 ], [ %15, %11 ], [ %., %17 ]
  %.13 = phi i32 [ %16, %11 ], [ %16, %11 ], [ %.9, %17 ]
  %.01 = phi i32 [ %15, %11 ], [ %15, %11 ], [ %18, %17 ]
  %22 = add nsw i32 %.01, 1
  %23 = tail call fastcc i32 @count_bit_noESC2(i32 %22)
  %24 = icmp sgt i32 %.13, %23
  %..15 = select i1 %24, i32 %22, i32 %.15
  %..13 = select i1 %24, i32 %23, i32 %.13
  br label %29

; <label>:25:                                     ; preds = %11
  %26 = add nsw i32 %15, 2
  %27 = tail call fastcc i32 @count_bit_noESC2(i32 %26)
  %28 = icmp sgt i32 %16, %27
  %.10 = select i1 %28, i32 %26, i32 %15
  %.11 = select i1 %28, i32 %27, i32 %16
  br label %29

; <label>:29:                                     ; preds = %11, %25, %21
  %.48 = phi i32 [ %.10, %25 ], [ %..15, %21 ], [ %15, %11 ]
  %.4 = phi i32 [ %.11, %25 ], [ %..13, %21 ], [ %16, %11 ]
  %30 = load i32, i32* %2, align 4
  %31 = add nsw i32 %30, %.4
  store i32 %31, i32* %2, align 4
  br label %49

; <label>:32:                                     ; preds = %7
  %33 = add nsw i32 %4, -15
  %34 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 24, i32 1), align 4
  %35 = icmp slt i32 %34, %33
  br i1 %35, label %36, label %.lr.ph.preheader

; <label>:36:                                     ; preds = %32
  %37 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 25, i32 1), align 4
  %38 = icmp slt i32 %37, %33
  br i1 %38, label %50, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %32, %36, %50, %53, %56, %59, %62, %65
  %.1.lcssa.ph = phi i32 [ 31, %65 ], [ 30, %62 ], [ 29, %59 ], [ 28, %56 ], [ 27, %53 ], [ 26, %50 ], [ 25, %36 ], [ 24, %32 ]
  %39 = add nsw i32 %.1.lcssa.ph, -8
  %40 = zext i32 %39 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %45
  %indvars.iv = phi i64 [ %40, %.lr.ph.preheader ], [ %indvars.iv.next, %45 ]
  %.512 = phi i32 [ %39, %.lr.ph.preheader ], [ %46, %45 ]
  %41 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %indvars.iv, i32 1
  %42 = load i32, i32* %41, align 4
  %43 = icmp slt i32 %42, %33
  %44 = trunc i64 %indvars.iv to i32
  br i1 %43, label %45, label %._crit_edge.loopexit

; <label>:45:                                     ; preds = %.lr.ph
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %46 = add nsw i32 %.512, 1
  %47 = icmp slt i64 %indvars.iv.next, 24
  br i1 %47, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph, %45
  %.5.lcssa.ph = phi i32 [ %46, %45 ], [ %44, %.lr.ph ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %65
  %.1.lcssa18 = phi i32 [ 32, %65 ], [ %.1.lcssa.ph, %._crit_edge.loopexit ]
  %.5.lcssa = phi i32 [ 24, %65 ], [ %.5.lcssa.ph, %._crit_edge.loopexit ]
  %48 = tail call fastcc i32 @count_bit_ESC(i32* %0, i32* %1, i32 %.5.lcssa, i32 %.1.lcssa18, i32* %2)
  br label %49

; <label>:49:                                     ; preds = %29, %._crit_edge, %9, %6
  %.0 = phi i32 [ -1, %6 ], [ 0, %9 ], [ %.48, %29 ], [ %48, %._crit_edge ]
  ret i32 %.0

; <label>:50:                                     ; preds = %36
  %51 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 26, i32 1), align 4
  %52 = icmp slt i32 %51, %33
  br i1 %52, label %53, label %.lr.ph.preheader

; <label>:53:                                     ; preds = %50
  %54 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 27, i32 1), align 4
  %55 = icmp slt i32 %54, %33
  br i1 %55, label %56, label %.lr.ph.preheader

; <label>:56:                                     ; preds = %53
  %57 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 28, i32 1), align 4
  %58 = icmp slt i32 %57, %33
  br i1 %58, label %59, label %.lr.ph.preheader

; <label>:59:                                     ; preds = %56
  %60 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 29, i32 1), align 4
  %61 = icmp slt i32 %60, %33
  br i1 %61, label %62, label %.lr.ph.preheader

; <label>:62:                                     ; preds = %59
  %63 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 30, i32 1), align 4
  %64 = icmp slt i32 %63, %33
  br i1 %64, label %65, label %.lr.ph.preheader

; <label>:65:                                     ; preds = %62
  %66 = load i32, i32* getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 31, i32 1), align 4
  %67 = icmp slt i32 %66, %33
  br i1 %67, label %._crit_edge, label %.lr.ph.preheader
}

; Function Attrs: noinline nounwind uwtable
define void @best_scalefac_store(%struct.lame_global_flags* nocapture readonly, i32, i32, [2 x [576 x i32]]* nocapture readonly, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]*) local_unnamed_addr #0 {
  %7 = sext i32 %1 to i64
  %8 = sext i32 %2 to i64
  %9 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 %7, i32 0, i64 %8, i32 0
  %10 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 %7, i32 0, i64 %8, i32 0, i32 16
  %11 = load i32, i32* %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %.loopexit, label %.lr.ph52.preheader

.lr.ph52.preheader:                               ; preds = %6
  br label %.lr.ph52

.lr.ph52:                                         ; preds = %.lr.ph52.preheader, %34
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %34 ], [ 0, %.lr.ph52.preheader ]
  %13 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 0, i64 %indvars.iv74
  %14 = load i32, i32* %13, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %34

; <label>:16:                                     ; preds = %.lr.ph52
  %17 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv74
  %18 = load i32, i32* %17, align 4
  %19 = add nuw nsw i64 %indvars.iv74, 1
  %20 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = icmp slt i32 %18, %21
  br i1 %22, label %.lr.ph45.preheader, label %._crit_edge46

.lr.ph45.preheader:                               ; preds = %16
  %23 = sext i32 %18 to i64
  %24 = sext i32 %21 to i64
  br label %.lr.ph45

.lr.ph45:                                         ; preds = %.lr.ph45.preheader, %29
  %indvars.iv72 = phi i64 [ %23, %.lr.ph45.preheader ], [ %indvars.iv.next73, %29 ]
  %.0643 = phi i32 [ %18, %.lr.ph45.preheader ], [ %30, %29 ]
  %25 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %3, i64 %7, i64 %8, i64 %indvars.iv72
  %26 = load i32, i32* %25, align 4
  %27 = icmp eq i32 %26, 0
  %28 = trunc i64 %indvars.iv72 to i32
  br i1 %27, label %29, label %._crit_edge46.loopexit

; <label>:29:                                     ; preds = %.lr.ph45
  %indvars.iv.next73 = add nsw i64 %indvars.iv72, 1
  %30 = add nsw i32 %.0643, 1
  %31 = icmp slt i64 %indvars.iv.next73, %24
  br i1 %31, label %.lr.ph45, label %._crit_edge46.loopexit

._crit_edge46.loopexit:                           ; preds = %.lr.ph45, %29
  %.06.lcssa.ph = phi i32 [ %28, %.lr.ph45 ], [ %30, %29 ]
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %16
  %.06.lcssa = phi i32 [ %18, %16 ], [ %.06.lcssa.ph, %._crit_edge46.loopexit ]
  %32 = icmp eq i32 %.06.lcssa, %21
  br i1 %32, label %33, label %34

; <label>:33:                                     ; preds = %._crit_edge46
  store i32 0, i32* %13, align 4
  br label %34

; <label>:34:                                     ; preds = %.lr.ph52, %33, %._crit_edge46
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %35 = load i32, i32* %10, align 8
  %36 = zext i32 %35 to i64
  %37 = icmp ult i64 %indvars.iv.next75, %36
  br i1 %37, label %.lr.ph52, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %34
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %6
  %38 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 %7, i32 0, i64 %8, i32 0, i32 17
  %39 = load i32, i32* %38, align 4
  %40 = icmp slt i32 %39, 12
  br i1 %40, label %.lr.ph39, label %._crit_edge40.2

.lr.ph39:                                         ; preds = %.loopexit
  %41 = sext i32 %39 to i64
  br label %42

; <label>:42:                                     ; preds = %65, %.lr.ph39
  %indvars.iv66 = phi i64 [ %41, %.lr.ph39 ], [ %indvars.iv.next67, %65 ]
  %43 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv66, i64 0
  %44 = load i32, i32* %43, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %46, label %65

; <label>:46:                                     ; preds = %42
  %47 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv66
  %48 = load i32, i32* %47, align 4
  %49 = add nsw i64 %indvars.iv66, 1
  %50 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %49
  %51 = load i32, i32* %50, align 4
  %52 = icmp slt i32 %48, %51
  br i1 %52, label %.lr.ph32.preheader, label %._crit_edge33

.lr.ph32.preheader:                               ; preds = %46
  %53 = sext i32 %48 to i64
  %54 = sext i32 %51 to i64
  br label %.lr.ph32

.lr.ph32:                                         ; preds = %.lr.ph32.preheader, %60
  %indvars.iv64 = phi i64 [ %53, %.lr.ph32.preheader ], [ %indvars.iv.next65, %60 ]
  %.1730 = phi i32 [ %48, %.lr.ph32.preheader ], [ %61, %60 ]
  %55 = mul nsw i64 %indvars.iv64, 3
  %56 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %3, i64 %7, i64 %8, i64 %55
  %57 = load i32, i32* %56, align 4
  %58 = icmp eq i32 %57, 0
  %59 = trunc i64 %indvars.iv64 to i32
  br i1 %58, label %60, label %._crit_edge33.loopexit

; <label>:60:                                     ; preds = %.lr.ph32
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, 1
  %61 = add nsw i32 %.1730, 1
  %62 = icmp slt i64 %indvars.iv.next65, %54
  br i1 %62, label %.lr.ph32, label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %.lr.ph32, %60
  %.17.lcssa.ph = phi i32 [ %59, %.lr.ph32 ], [ %61, %60 ]
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %46
  %.17.lcssa = phi i32 [ %48, %46 ], [ %.17.lcssa.ph, %._crit_edge33.loopexit ]
  %63 = icmp eq i32 %.17.lcssa, %51
  br i1 %63, label %64, label %65

; <label>:64:                                     ; preds = %._crit_edge33
  store i32 0, i32* %43, align 4
  br label %65

; <label>:65:                                     ; preds = %42, %64, %._crit_edge33
  %indvars.iv.next67 = add nsw i64 %indvars.iv66, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next67, 12
  br i1 %exitcond68, label %._crit_edge40, label %42

._crit_edge40:                                    ; preds = %65
  %.pr = load i32, i32* %38, align 4
  %66 = icmp slt i32 %.pr, 12
  br i1 %66, label %.lr.ph39.1, label %._crit_edge40.2

; <label>:67:                                     ; preds = %._crit_edge40.2
  %68 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 %7, i32 0, i64 %8, i32 0, i32 12
  %69 = load i32, i32* %68, align 8
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %.preheader14, label %163

.preheader14:                                     ; preds = %67
  %71 = load i32, i32* %10, align 8
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %._crit_edge28, label %.lr.ph27

.lr.ph27:                                         ; preds = %.preheader14
  %73 = load i32, i32* %10, align 8
  %74 = zext i32 %73 to i64
  %75 = icmp ugt i64 %74, 1
  %umax = select i1 %75, i64 %74, i64 1
  %min.iters.check = icmp ult i64 %umax, 8
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph27
  %n.vec = and i64 %umax, 4294967288
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %76 = add nsw i64 %n.vec, -8
  %77 = lshr exact i64 %76, 3
  %78 = add nuw nsw i64 %77, 1
  %xtraiter90 = and i64 %78, 3
  %lcmp.mod91 = icmp eq i64 %xtraiter90, 0
  br i1 %lcmp.mod91, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %vec.phi.prol = phi <4 x i32> [ %83, %vector.body.prol ], [ zeroinitializer, %vector.body.prol.preheader ]
  %vec.phi81.prol = phi <4 x i32> [ %84, %vector.body.prol ], [ zeroinitializer, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter90, %vector.body.prol.preheader ]
  %79 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 0, i64 %index.prol
  %80 = bitcast i32* %79 to <4 x i32>*
  %wide.load.prol = load <4 x i32>, <4 x i32>* %80, align 4
  %81 = getelementptr i32, i32* %79, i64 4
  %82 = bitcast i32* %81 to <4 x i32>*
  %wide.load82.prol = load <4 x i32>, <4 x i32>* %82, align 4
  %83 = or <4 x i32> %wide.load.prol, %vec.phi.prol
  %84 = or <4 x i32> %wide.load82.prol, %vec.phi81.prol
  %index.next.prol = add i64 %index.prol, 8
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !3

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %.lcssa89.unr = phi <4 x i32> [ undef, %vector.body.preheader ], [ %83, %vector.body.prol.loopexit.unr-lcssa ]
  %.lcssa88.unr = phi <4 x i32> [ undef, %vector.body.preheader ], [ %84, %vector.body.prol.loopexit.unr-lcssa ]
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi.unr = phi <4 x i32> [ zeroinitializer, %vector.body.preheader ], [ %83, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi81.unr = phi <4 x i32> [ zeroinitializer, %vector.body.preheader ], [ %84, %vector.body.prol.loopexit.unr-lcssa ]
  %85 = icmp ult i64 %76, 24
  br i1 %85, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %vec.phi = phi <4 x i32> [ %vec.phi.unr, %vector.body.preheader.new ], [ %108, %vector.body ]
  %vec.phi81 = phi <4 x i32> [ %vec.phi81.unr, %vector.body.preheader.new ], [ %109, %vector.body ]
  %86 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 0, i64 %index
  %87 = bitcast i32* %86 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %87, align 4
  %88 = getelementptr i32, i32* %86, i64 4
  %89 = bitcast i32* %88 to <4 x i32>*
  %wide.load82 = load <4 x i32>, <4 x i32>* %89, align 4
  %90 = or <4 x i32> %wide.load, %vec.phi
  %91 = or <4 x i32> %wide.load82, %vec.phi81
  %index.next = add i64 %index, 8
  %92 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 0, i64 %index.next
  %93 = bitcast i32* %92 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %93, align 4
  %94 = getelementptr i32, i32* %92, i64 4
  %95 = bitcast i32* %94 to <4 x i32>*
  %wide.load82.1 = load <4 x i32>, <4 x i32>* %95, align 4
  %96 = or <4 x i32> %wide.load.1, %90
  %97 = or <4 x i32> %wide.load82.1, %91
  %index.next.1 = add i64 %index, 16
  %98 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 0, i64 %index.next.1
  %99 = bitcast i32* %98 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %99, align 4
  %100 = getelementptr i32, i32* %98, i64 4
  %101 = bitcast i32* %100 to <4 x i32>*
  %wide.load82.2 = load <4 x i32>, <4 x i32>* %101, align 4
  %102 = or <4 x i32> %wide.load.2, %96
  %103 = or <4 x i32> %wide.load82.2, %97
  %index.next.2 = add i64 %index, 24
  %104 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 0, i64 %index.next.2
  %105 = bitcast i32* %104 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %105, align 4
  %106 = getelementptr i32, i32* %104, i64 4
  %107 = bitcast i32* %106 to <4 x i32>*
  %wide.load82.3 = load <4 x i32>, <4 x i32>* %107, align 4
  %108 = or <4 x i32> %wide.load.3, %102
  %109 = or <4 x i32> %wide.load82.3, %103
  %index.next.3 = add i64 %index, 32
  %110 = icmp eq i64 %index.next.3, %n.vec
  br i1 %110, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !4

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %.lcssa89 = phi <4 x i32> [ %.lcssa89.unr, %vector.body.prol.loopexit ], [ %108, %middle.block.unr-lcssa ]
  %.lcssa88 = phi <4 x i32> [ %.lcssa88.unr, %vector.body.prol.loopexit ], [ %109, %middle.block.unr-lcssa ]
  %bin.rdx = or <4 x i32> %.lcssa88, %.lcssa89
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx83 = or <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf84 = shufflevector <4 x i32> %bin.rdx83, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx85 = or <4 x i32> %bin.rdx83, %rdx.shuf84
  %111 = extractelement <4 x i32> %bin.rdx85, i32 0
  %cmp.n = icmp eq i64 %umax, %n.vec
  br i1 %cmp.n, label %._crit_edge28, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph27
  %indvars.iv62.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph27 ], [ %n.vec, %middle.block ]
  %.026.ph = phi i32 [ 0, %min.iters.checked ], [ 0, %.lr.ph27 ], [ %111, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %scalar.ph ], [ %indvars.iv62.ph, %scalar.ph.preheader ]
  %.026 = phi i32 [ %114, %scalar.ph ], [ %.026.ph, %scalar.ph.preheader ]
  %112 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 0, i64 %indvars.iv62
  %113 = load i32, i32* %112, align 4
  %114 = or i32 %113, %.026
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %115 = icmp ult i64 %indvars.iv.next63, %74
  br i1 %115, label %scalar.ph, label %._crit_edge28.loopexit, !llvm.loop !7

._crit_edge28.loopexit:                           ; preds = %scalar.ph
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %middle.block, %.preheader14
  %.0.lcssa = phi i32 [ 0, %.preheader14 ], [ %111, %middle.block ], [ %114, %._crit_edge28.loopexit ]
  %116 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 %7, i32 0, i64 %8, i32 0, i32 17
  %117 = load i32, i32* %116, align 4
  %118 = icmp ult i32 %117, 12
  br i1 %118, label %.preheader13.preheader, label %._crit_edge24

.preheader13.preheader:                           ; preds = %._crit_edge28
  %119 = zext i32 %117 to i64
  %xtraiter = and i32 %117, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader13.prol.loopexit, label %.preheader13.prol

.preheader13.prol:                                ; preds = %.preheader13.preheader
  %120 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %119, i64 0
  %121 = load i32, i32* %120, align 4
  %122 = or i32 %121, %.0.lcssa
  %123 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %119, i64 1
  %124 = load i32, i32* %123, align 4
  %125 = or i32 %124, %122
  %126 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %119, i64 2
  %127 = load i32, i32* %126, align 4
  %128 = or i32 %127, %125
  %indvars.iv.next59.prol = add nuw nsw i64 %119, 1
  br label %.preheader13.prol.loopexit

.preheader13.prol.loopexit:                       ; preds = %.preheader13.preheader, %.preheader13.prol
  %indvars.iv58.unr = phi i64 [ %119, %.preheader13.preheader ], [ %indvars.iv.next59.prol, %.preheader13.prol ]
  %.123.unr = phi i32 [ %.0.lcssa, %.preheader13.preheader ], [ %128, %.preheader13.prol ]
  %.lcssa.lcssa.unr = phi i32 [ undef, %.preheader13.preheader ], [ %128, %.preheader13.prol ]
  %129 = icmp eq i32 %117, 11
  br i1 %129, label %._crit_edge24, label %.preheader.preheader86

.preheader.preheader86:                           ; preds = %.preheader13.prol.loopexit
  br label %.preheader

._crit_edge24.loopexit:                           ; preds = %.preheader
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %.preheader13.prol.loopexit, %._crit_edge28
  %.1.lcssa = phi i32 [ %.0.lcssa, %._crit_edge28 ], [ %.lcssa.lcssa.unr, %.preheader13.prol.loopexit ], [ %210, %._crit_edge24.loopexit ]
  %130 = and i32 %.1.lcssa, 1
  %131 = icmp ne i32 %130, 0
  %132 = icmp eq i32 %.1.lcssa, 0
  %or.cond = or i1 %132, %131
  br i1 %or.cond, label %163, label %.preheader12

.preheader12:                                     ; preds = %._crit_edge24
  %133 = load i32, i32* %10, align 8
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %._crit_edge19, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader12
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.2518 = phi i32 [ %139, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %135 = zext i32 %.2518 to i64
  %136 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 0, i64 %135
  %137 = load i32, i32* %136, align 4
  %138 = sdiv i32 %137, 2
  store i32 %138, i32* %136, align 4
  %139 = add i32 %.2518, 1
  %140 = load i32, i32* %10, align 8
  %141 = icmp ult i32 %139, %140
  br i1 %141, label %.lr.ph, label %._crit_edge19.loopexit

._crit_edge19.loopexit:                           ; preds = %.lr.ph
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.preheader12
  %142 = load i32, i32* %116, align 4
  %143 = icmp ult i32 %142, 12
  br i1 %143, label %.preheader.preheader, label %._crit_edge

.preheader.preheader:                             ; preds = %._crit_edge19
  %144 = zext i32 %142 to i64
  br label %145

; <label>:145:                                    ; preds = %.preheader.preheader, %145
  %indvars.iv = phi i64 [ %144, %.preheader.preheader ], [ %indvars.iv.next, %145 ]
  %146 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv, i64 0
  %147 = load i32, i32* %146, align 4
  %148 = sdiv i32 %147, 2
  store i32 %148, i32* %146, align 4
  %149 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv, i64 1
  %150 = load i32, i32* %149, align 4
  %151 = sdiv i32 %150, 2
  store i32 %151, i32* %149, align 4
  %152 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv, i64 2
  %153 = load i32, i32* %152, align 4
  %154 = sdiv i32 %153, 2
  store i32 %154, i32* %152, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 12
  br i1 %exitcond, label %._crit_edge.loopexit, label %145

._crit_edge.loopexit:                             ; preds = %145
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge19
  store i32 1, i32* %269, align 4
  store i32 99999999, i32* %264, align 4
  %155 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %156 = load i32, i32* %155, align 8
  %157 = icmp eq i32 %156, 2
  %158 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8
  br i1 %157, label %159, label %161

; <label>:159:                                    ; preds = %._crit_edge
  %160 = tail call i32 @scale_bitcount(%struct.III_scalefac_t* %158, %struct.gr_info* nonnull %9) #5
  br label %163

; <label>:161:                                    ; preds = %._crit_edge
  %162 = tail call i32 @scale_bitcount_lsf(%struct.III_scalefac_t* %158, %struct.gr_info* nonnull %9) #5
  br label %163

; <label>:163:                                    ; preds = %._crit_edge24, %161, %159, %67, %._crit_edge40.2
  %164 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %165 = load i32, i32* %164, align 8
  %166 = icmp eq i32 %165, 2
  %167 = icmp eq i32 %1, 1
  %or.cond11 = and i1 %167, %166
  br i1 %or.cond11, label %168, label %189

; <label>:168:                                    ; preds = %163
  %169 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 0, i32 0, i64 %8, i32 0, i32 6
  %170 = load i32, i32* %169, align 8
  %171 = icmp eq i32 %170, 2
  br i1 %171, label %189, label %172

; <label>:172:                                    ; preds = %168
  %173 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 1, i32 0, i64 %8, i32 0, i32 6
  %174 = load i32, i32* %173, align 8
  %175 = icmp eq i32 %174, 2
  br i1 %175, label %189, label %176

; <label>:176:                                    ; preds = %172
  %177 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 0, i32 0, i64 %8, i32 0, i32 13
  %178 = load i32, i32* %177, align 4
  %179 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 1, i32 0, i64 %8, i32 0, i32 13
  %180 = load i32, i32* %179, align 4
  %181 = icmp eq i32 %178, %180
  br i1 %181, label %182, label %189

; <label>:182:                                    ; preds = %176
  %183 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 0, i32 0, i64 %8, i32 0, i32 12
  %184 = load i32, i32* %183, align 8
  %185 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 1, i32 0, i64 %8, i32 0, i32 12
  %186 = load i32, i32* %185, align 8
  %187 = icmp eq i32 %184, %186
  br i1 %187, label %188, label %189

; <label>:188:                                    ; preds = %182
  tail call fastcc void @scfsi_calc(i32 %2, %struct.III_side_info_t* nonnull %4, [2 x %struct.III_scalefac_t]* %5)
  br label %189

; <label>:189:                                    ; preds = %172, %168, %188, %182, %176, %163
  %190 = load i32, i32* %264, align 4
  %191 = load i32, i32* %266, align 8
  %192 = add i32 %191, %190
  store i32 %192, i32* %266, align 8
  ret void

.preheader:                                       ; preds = %.preheader.preheader86, %.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %.preheader ], [ %indvars.iv58.unr, %.preheader.preheader86 ]
  %.123 = phi i32 [ %210, %.preheader ], [ %.123.unr, %.preheader.preheader86 ]
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %193 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv58, i64 2
  %194 = load i32, i32* %193, align 4
  %195 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv58, i64 1
  %196 = load i32, i32* %195, align 4
  %197 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv58, i64 0
  %198 = load i32, i32* %197, align 4
  %199 = or i32 %198, %.123
  %200 = or i32 %196, %199
  %201 = or i32 %194, %200
  %202 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv.next59, i64 0
  %203 = load i32, i32* %202, align 4
  %204 = or i32 %203, %201
  %205 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv.next59, i64 1
  %206 = load i32, i32* %205, align 4
  %207 = or i32 %206, %204
  %208 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv.next59, i64 2
  %209 = load i32, i32* %208, align 4
  %210 = or i32 %209, %207
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %exitcond60.1 = icmp eq i64 %indvars.iv.next59.1, 12
  br i1 %exitcond60.1, label %._crit_edge24.loopexit, label %.preheader

.lr.ph39.1:                                       ; preds = %._crit_edge40
  %211 = sext i32 %.pr to i64
  br label %212

; <label>:212:                                    ; preds = %236, %.lr.ph39.1
  %indvars.iv66.1 = phi i64 [ %211, %.lr.ph39.1 ], [ %indvars.iv.next67.1, %236 ]
  %213 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv66.1, i64 1
  %214 = load i32, i32* %213, align 4
  %215 = icmp sgt i32 %214, 0
  br i1 %215, label %216, label %236

; <label>:216:                                    ; preds = %212
  %217 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv66.1
  %218 = load i32, i32* %217, align 4
  %219 = add nsw i64 %indvars.iv66.1, 1
  %220 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %219
  %221 = load i32, i32* %220, align 4
  %222 = icmp slt i32 %218, %221
  br i1 %222, label %.lr.ph32.preheader.1, label %._crit_edge33.1

.lr.ph32.preheader.1:                             ; preds = %216
  %223 = sext i32 %218 to i64
  %224 = sext i32 %221 to i64
  br label %.lr.ph32.1

.lr.ph32.1:                                       ; preds = %231, %.lr.ph32.preheader.1
  %indvars.iv64.1 = phi i64 [ %223, %.lr.ph32.preheader.1 ], [ %indvars.iv.next65.1, %231 ]
  %.1730.1 = phi i32 [ %218, %.lr.ph32.preheader.1 ], [ %232, %231 ]
  %225 = mul nsw i64 %indvars.iv64.1, 3
  %226 = add nsw i64 %225, 1
  %227 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %3, i64 %7, i64 %8, i64 %226
  %228 = load i32, i32* %227, align 4
  %229 = icmp eq i32 %228, 0
  %230 = trunc i64 %indvars.iv64.1 to i32
  br i1 %229, label %231, label %._crit_edge33.1.loopexit

; <label>:231:                                    ; preds = %.lr.ph32.1
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64.1, 1
  %232 = add nsw i32 %.1730.1, 1
  %233 = icmp slt i64 %indvars.iv.next65.1, %224
  br i1 %233, label %.lr.ph32.1, label %._crit_edge33.1.loopexit

._crit_edge33.1.loopexit:                         ; preds = %231, %.lr.ph32.1
  %.17.lcssa.1.ph = phi i32 [ %230, %.lr.ph32.1 ], [ %232, %231 ]
  br label %._crit_edge33.1

._crit_edge33.1:                                  ; preds = %._crit_edge33.1.loopexit, %216
  %.17.lcssa.1 = phi i32 [ %218, %216 ], [ %.17.lcssa.1.ph, %._crit_edge33.1.loopexit ]
  %234 = icmp eq i32 %.17.lcssa.1, %221
  br i1 %234, label %235, label %236

; <label>:235:                                    ; preds = %._crit_edge33.1
  store i32 0, i32* %213, align 4
  br label %236

; <label>:236:                                    ; preds = %235, %._crit_edge33.1, %212
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66.1, 1
  %exitcond68.1 = icmp eq i64 %indvars.iv.next67.1, 12
  br i1 %exitcond68.1, label %._crit_edge40.1, label %212

._crit_edge40.1:                                  ; preds = %236
  %.pr76.pr = load i32, i32* %38, align 4
  %237 = icmp slt i32 %.pr76.pr, 12
  br i1 %237, label %.lr.ph39.2, label %._crit_edge40.2

.lr.ph39.2:                                       ; preds = %._crit_edge40.1
  %238 = sext i32 %.pr76.pr to i64
  br label %239

; <label>:239:                                    ; preds = %263, %.lr.ph39.2
  %indvars.iv66.2 = phi i64 [ %238, %.lr.ph39.2 ], [ %indvars.iv.next67.2, %263 ]
  %240 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %5, i64 %7, i64 %8, i32 1, i64 %indvars.iv66.2, i64 2
  %241 = load i32, i32* %240, align 4
  %242 = icmp sgt i32 %241, 0
  br i1 %242, label %243, label %263

; <label>:243:                                    ; preds = %239
  %244 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv66.2
  %245 = load i32, i32* %244, align 4
  %246 = add nsw i64 %indvars.iv66.2, 1
  %247 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %246
  %248 = load i32, i32* %247, align 4
  %249 = icmp slt i32 %245, %248
  br i1 %249, label %.lr.ph32.preheader.2, label %._crit_edge33.2

.lr.ph32.preheader.2:                             ; preds = %243
  %250 = sext i32 %245 to i64
  %251 = sext i32 %248 to i64
  br label %.lr.ph32.2

.lr.ph32.2:                                       ; preds = %258, %.lr.ph32.preheader.2
  %indvars.iv64.2 = phi i64 [ %250, %.lr.ph32.preheader.2 ], [ %indvars.iv.next65.2, %258 ]
  %.1730.2 = phi i32 [ %245, %.lr.ph32.preheader.2 ], [ %259, %258 ]
  %252 = mul nsw i64 %indvars.iv64.2, 3
  %253 = add nsw i64 %252, 2
  %254 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %3, i64 %7, i64 %8, i64 %253
  %255 = load i32, i32* %254, align 4
  %256 = icmp eq i32 %255, 0
  %257 = trunc i64 %indvars.iv64.2 to i32
  br i1 %256, label %258, label %._crit_edge33.2.loopexit

; <label>:258:                                    ; preds = %.lr.ph32.2
  %indvars.iv.next65.2 = add nsw i64 %indvars.iv64.2, 1
  %259 = add nsw i32 %.1730.2, 1
  %260 = icmp slt i64 %indvars.iv.next65.2, %251
  br i1 %260, label %.lr.ph32.2, label %._crit_edge33.2.loopexit

._crit_edge33.2.loopexit:                         ; preds = %258, %.lr.ph32.2
  %.17.lcssa.2.ph = phi i32 [ %257, %.lr.ph32.2 ], [ %259, %258 ]
  br label %._crit_edge33.2

._crit_edge33.2:                                  ; preds = %._crit_edge33.2.loopexit, %243
  %.17.lcssa.2 = phi i32 [ %245, %243 ], [ %.17.lcssa.2.ph, %._crit_edge33.2.loopexit ]
  %261 = icmp eq i32 %.17.lcssa.2, %248
  br i1 %261, label %262, label %263

; <label>:262:                                    ; preds = %._crit_edge33.2
  store i32 0, i32* %240, align 4
  br label %263

; <label>:263:                                    ; preds = %262, %._crit_edge33.2, %239
  %indvars.iv.next67.2 = add nsw i64 %indvars.iv66.2, 1
  %exitcond68.2 = icmp eq i64 %indvars.iv.next67.2, 12
  br i1 %exitcond68.2, label %._crit_edge40.2.loopexit, label %239

._crit_edge40.2.loopexit:                         ; preds = %263
  br label %._crit_edge40.2

._crit_edge40.2:                                  ; preds = %._crit_edge40.2.loopexit, %.loopexit, %._crit_edge40, %._crit_edge40.1
  %264 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 %7, i32 0, i64 %8, i32 0, i32 15
  %265 = load i32, i32* %264, align 4
  %266 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %9, i64 0, i32 0
  %267 = load i32, i32* %266, align 8
  %268 = sub i32 %267, %265
  store i32 %268, i32* %266, align 8
  %269 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 %7, i32 0, i64 %8, i32 0, i32 13
  %270 = load i32, i32* %269, align 4
  %271 = icmp eq i32 %270, 0
  br i1 %271, label %67, label %163
}

declare i32 @scale_bitcount(%struct.III_scalefac_t*, %struct.gr_info*) local_unnamed_addr #1

declare i32 @scale_bitcount_lsf(%struct.III_scalefac_t*, %struct.gr_info*) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @scfsi_calc(i32, %struct.III_side_info_t* nocapture, [2 x %struct.III_scalefac_t]* nocapture) unnamed_addr #2 {
.preheader16.preheader:
  %3 = bitcast %struct.III_side_info_t* %1 to i8*
  %4 = sext i32 %0 to i64
  %5 = shl nsw i64 %4, 4
  %6 = or i64 %5, 12
  %uglygep = getelementptr i8, i8* %3, i64 %6
  call void @llvm.memset.p0i8.i64(i8* %uglygep, i8 0, i64 16, i32 4, i1 false)
  br label %.preheader16

.preheader16:                                     ; preds = %.backedge, %.preheader16.preheader
  %indvars.iv63 = phi i64 [ 0, %.preheader16.preheader ], [ %indvars.iv.next64, %.backedge ]
  %7 = getelementptr inbounds [5 x i32], [5 x i32]* @scfsi_calc.scfsi_band, i64 0, i64 %indvars.iv63
  %8 = load i32, i32* %7, align 4
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %9 = getelementptr inbounds [5 x i32], [5 x i32]* @scfsi_calc.scfsi_band, i64 0, i64 %indvars.iv.next64
  %10 = load i32, i32* %9, align 4
  %11 = icmp slt i32 %8, %10
  br i1 %11, label %.lr.ph27.preheader, label %._crit_edge

.lr.ph27.preheader:                               ; preds = %.preheader16
  %12 = sext i32 %8 to i64
  br label %.lr.ph27

.lr.ph27:                                         ; preds = %.lr.ph27.preheader, %19
  %indvars.iv59 = phi i64 [ %12, %.lr.ph27.preheader ], [ %indvars.iv.next60, %19 ]
  %.026 = phi i32 [ %8, %.lr.ph27.preheader ], [ %20, %19 ]
  %13 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 0, i64 %4, i32 0, i64 %indvars.iv59
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 %indvars.iv59
  %16 = load i32, i32* %15, align 4
  %17 = icmp eq i32 %14, %16
  %18 = trunc i64 %indvars.iv59 to i32
  br i1 %17, label %19, label %._crit_edge.loopexit

; <label>:19:                                     ; preds = %.lr.ph27
  %indvars.iv.next60 = add i64 %indvars.iv59, 1
  %20 = add nsw i32 %.026, 1
  %21 = load i32, i32* %9, align 4
  %22 = sext i32 %21 to i64
  %23 = icmp slt i64 %indvars.iv.next60, %22
  br i1 %23, label %.lr.ph27, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph27, %19
  %.0.lcssa.ph = phi i32 [ %18, %.lr.ph27 ], [ %20, %19 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader16
  %.0.lcssa = phi i32 [ %8, %.preheader16 ], [ %.0.lcssa.ph, %._crit_edge.loopexit ]
  %24 = load i32, i32* %9, align 4
  %25 = icmp eq i32 %.0.lcssa, %24
  br i1 %25, label %26, label %.backedge

.backedge:                                        ; preds = %._crit_edge, %._crit_edge38
  %exitcond65 = icmp eq i64 %indvars.iv.next64, 4
  br i1 %exitcond65, label %.preheader15, label %.preheader16

; <label>:26:                                     ; preds = %._crit_edge
  %27 = load i32, i32* %7, align 4
  %28 = load i32, i32* %9, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %.lr.ph37.preheader, label %._crit_edge38

.lr.ph37.preheader:                               ; preds = %26
  %30 = sext i32 %27 to i64
  %31 = load i32, i32* %9, align 4
  %32 = sext i32 %31 to i64
  %33 = add nsw i64 %30, 1
  %34 = sext i32 %31 to i64
  %35 = icmp sgt i64 %33, %34
  %smax = select i1 %35, i64 %33, i64 %34
  %36 = sub nsw i64 %smax, %30
  %min.iters.check = icmp ult i64 %36, 8
  br i1 %min.iters.check, label %.lr.ph37.preheader71, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph37.preheader
  %n.vec = and i64 %36, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %30, %n.vec
  br i1 %cmp.zero, label %.lr.ph37.preheader71, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %37 = add nsw i64 %n.vec, -8
  %38 = lshr exact i64 %37, 3
  %39 = add nuw nsw i64 %38, 1
  %xtraiter = and i64 %39, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %40 = add i64 %30, %index.prol
  %41 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 %40
  %42 = bitcast i32* %41 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32>* %42, align 4
  %43 = getelementptr i32, i32* %41, i64 4
  %44 = bitcast i32* %43 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32>* %44, align 4
  %index.next.prol = add i64 %index.prol, 8
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !9

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %45 = icmp ult i64 %37, 24
  br i1 %45, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %46 = add i64 %30, %index
  %47 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 %46
  %48 = bitcast i32* %47 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32>* %48, align 4
  %49 = getelementptr i32, i32* %47, i64 4
  %50 = bitcast i32* %49 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32>* %50, align 4
  %index.next = add i64 %index, 8
  %51 = add i64 %30, %index.next
  %52 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 %51
  %53 = bitcast i32* %52 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32>* %53, align 4
  %54 = getelementptr i32, i32* %52, i64 4
  %55 = bitcast i32* %54 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32>* %55, align 4
  %index.next.1 = add i64 %index, 16
  %56 = add i64 %30, %index.next.1
  %57 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 %56
  %58 = bitcast i32* %57 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32>* %58, align 4
  %59 = getelementptr i32, i32* %57, i64 4
  %60 = bitcast i32* %59 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32>* %60, align 4
  %index.next.2 = add i64 %index, 24
  %61 = add i64 %30, %index.next.2
  %62 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 %61
  %63 = bitcast i32* %62 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32>* %63, align 4
  %64 = getelementptr i32, i32* %62, i64 4
  %65 = bitcast i32* %64 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32>* %65, align 4
  %index.next.3 = add i64 %index, 32
  %66 = icmp eq i64 %index.next.3, %n.vec
  br i1 %66, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !10

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %36, %n.vec
  br i1 %cmp.n, label %._crit_edge38, label %.lr.ph37.preheader71

.lr.ph37.preheader71:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph37.preheader
  %indvars.iv61.ph = phi i64 [ %30, %min.iters.checked ], [ %30, %.lr.ph37.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph37

.lr.ph37:                                         ; preds = %.lr.ph37.preheader71, %.lr.ph37
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %.lr.ph37 ], [ %indvars.iv61.ph, %.lr.ph37.preheader71 ]
  %67 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 %indvars.iv61
  store i32 -1, i32* %67, align 4
  %indvars.iv.next62 = add i64 %indvars.iv61, 1
  %68 = icmp slt i64 %indvars.iv.next62, %32
  br i1 %68, label %.lr.ph37, label %._crit_edge38.loopexit, !llvm.loop !11

._crit_edge38.loopexit:                           ; preds = %.lr.ph37
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %middle.block, %26
  %69 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 3, i64 %4, i64 %indvars.iv63
  store i32 1, i32* %69, align 4
  br label %.backedge

.lr.ph.preheader.new:                             ; preds = %.preheader15.1057, %166
  %.210.10 = phi i32 [ %.210.9, %.preheader15.1057 ], [ %..08.10, %166 ]
  %.14.10 = phi i32 [ %.14.9, %.preheader15.1057 ], [ %167, %166 ]
  br label %.lr.ph

.preheader15:                                     ; preds = %.backedge
  %70 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 0
  %71 = load i32, i32* %70, align 4
  %72 = icmp slt i32 %71, 0
  %. = select i1 %72, i32 0, i32 %71
  %not. = xor i1 %72, true
  %.69 = zext i1 %not. to i32
  %73 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 1
  %74 = load i32, i32* %73, align 4
  %75 = icmp slt i32 %74, 0
  br i1 %75, label %.preheader15.249, label %111

.lr.ph:                                           ; preds = %.lr.ph.preheader.new
  %76 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 11
  %77 = load i32, i32* %76, align 4
  %78 = icmp slt i32 %77, 0
  br i1 %78, label %.lr.ph.144, label %79

; <label>:79:                                     ; preds = %.lr.ph
  br label %.lr.ph.144

.lr.ph.144:                                       ; preds = %79, %.lr.ph
  %.213 = phi i32 [ 0, %.lr.ph ], [ %77, %79 ]
  %.12 = phi i32 [ 0, %.lr.ph ], [ 1, %79 ]
  %80 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 12
  %81 = load i32, i32* %80, align 4
  %82 = icmp slt i32 %81, 0
  br i1 %82, label %.lr.ph.176, label %105

; <label>:83:                                     ; preds = %103, %.preheader80
  %indvars.iv = phi i64 [ 0, %.preheader80 ], [ %indvars.iv.next, %103 ]
  %84 = getelementptr inbounds [16 x i32], [16 x i32]* @scfsi_calc.slen1_n, i64 0, i64 %indvars.iv
  %85 = load i32, i32* %84, align 4
  %86 = icmp slt i32 %.210.10, %85
  br i1 %86, label %87, label %103

; <label>:87:                                     ; preds = %83
  %88 = getelementptr inbounds [16 x i32], [16 x i32]* @scfsi_calc.slen2_n, i64 0, i64 %indvars.iv
  %89 = load i32, i32* %88, align 4
  %90 = icmp slt i32 %.213.1.4, %89
  br i1 %90, label %91, label %103

; <label>:91:                                     ; preds = %87
  %92 = getelementptr inbounds [16 x i32], [16 x i32]* @scfsi_calc.slen1_tab, i64 0, i64 %indvars.iv
  %93 = load i32, i32* %92, align 4
  %94 = mul nsw i32 %93, %.14.10
  %95 = getelementptr inbounds [16 x i32], [16 x i32]* @scfsi_calc.slen2_tab, i64 0, i64 %indvars.iv
  %96 = load i32, i32* %95, align 4
  %97 = mul nsw i32 %96, %.12.1.4
  %98 = add nsw i32 %97, %94
  %99 = load i32, i32* %214, align 4
  %100 = icmp sgt i32 %99, %98
  br i1 %100, label %101, label %103

; <label>:101:                                    ; preds = %91
  store i32 %98, i32* %214, align 4
  %102 = trunc i64 %indvars.iv to i32
  store i32 %102, i32* %215, align 8
  br label %103

; <label>:103:                                    ; preds = %83, %87, %101, %91
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 16
  br i1 %exitcond, label %104, label %83

; <label>:104:                                    ; preds = %103
  ret void

; <label>:105:                                    ; preds = %.lr.ph.144
  %106 = add nuw nsw i32 %.12, 1
  %107 = icmp slt i32 %.213, %81
  %..011.1 = select i1 %107, i32 %81, i32 %.213
  br label %.lr.ph.176

.lr.ph.176:                                       ; preds = %105, %.lr.ph.144
  %.213.1 = phi i32 [ %.213, %.lr.ph.144 ], [ %..011.1, %105 ]
  %.12.1 = phi i32 [ %.12, %.lr.ph.144 ], [ %106, %105 ]
  %108 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 13
  %109 = load i32, i32* %108, align 4
  %110 = icmp slt i32 %109, 0
  br i1 %110, label %.lr.ph.144.1, label %169

; <label>:111:                                    ; preds = %.preheader15
  %112 = ashr i32 %71, 31
  %113 = add nsw i32 %112, 2
  %114 = icmp slt i32 %., %74
  %..08.1 = select i1 %114, i32 %74, i32 %.
  br label %.preheader15.249

.preheader15.249:                                 ; preds = %111, %.preheader15
  %.210.1 = phi i32 [ %., %.preheader15 ], [ %..08.1, %111 ]
  %.14.1 = phi i32 [ %.69, %.preheader15 ], [ %113, %111 ]
  %115 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 2
  %116 = load i32, i32* %115, align 4
  %117 = icmp slt i32 %116, 0
  br i1 %117, label %.preheader15.350, label %118

; <label>:118:                                    ; preds = %.preheader15.249
  %119 = add nsw i32 %.14.1, 1
  %120 = icmp slt i32 %.210.1, %116
  %..08.2 = select i1 %120, i32 %116, i32 %.210.1
  br label %.preheader15.350

.preheader15.350:                                 ; preds = %118, %.preheader15.249
  %.210.2 = phi i32 [ %.210.1, %.preheader15.249 ], [ %..08.2, %118 ]
  %.14.2 = phi i32 [ %.14.1, %.preheader15.249 ], [ %119, %118 ]
  %121 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 3
  %122 = load i32, i32* %121, align 4
  %123 = icmp slt i32 %122, 0
  br i1 %123, label %.preheader15.451, label %124

; <label>:124:                                    ; preds = %.preheader15.350
  %125 = add nsw i32 %.14.2, 1
  %126 = icmp slt i32 %.210.2, %122
  %..08.3 = select i1 %126, i32 %122, i32 %.210.2
  br label %.preheader15.451

.preheader15.451:                                 ; preds = %124, %.preheader15.350
  %.210.3 = phi i32 [ %.210.2, %.preheader15.350 ], [ %..08.3, %124 ]
  %.14.3 = phi i32 [ %.14.2, %.preheader15.350 ], [ %125, %124 ]
  %127 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 4
  %128 = load i32, i32* %127, align 4
  %129 = icmp slt i32 %128, 0
  br i1 %129, label %.preheader15.552, label %130

; <label>:130:                                    ; preds = %.preheader15.451
  %131 = add nsw i32 %.14.3, 1
  %132 = icmp slt i32 %.210.3, %128
  %..08.4 = select i1 %132, i32 %128, i32 %.210.3
  br label %.preheader15.552

.preheader15.552:                                 ; preds = %130, %.preheader15.451
  %.210.4 = phi i32 [ %.210.3, %.preheader15.451 ], [ %..08.4, %130 ]
  %.14.4 = phi i32 [ %.14.3, %.preheader15.451 ], [ %131, %130 ]
  %133 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 5
  %134 = load i32, i32* %133, align 4
  %135 = icmp slt i32 %134, 0
  br i1 %135, label %.preheader15.653, label %136

; <label>:136:                                    ; preds = %.preheader15.552
  %137 = add nsw i32 %.14.4, 1
  %138 = icmp slt i32 %.210.4, %134
  %..08.5 = select i1 %138, i32 %134, i32 %.210.4
  br label %.preheader15.653

.preheader15.653:                                 ; preds = %136, %.preheader15.552
  %.210.5 = phi i32 [ %.210.4, %.preheader15.552 ], [ %..08.5, %136 ]
  %.14.5 = phi i32 [ %.14.4, %.preheader15.552 ], [ %137, %136 ]
  %139 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 6
  %140 = load i32, i32* %139, align 4
  %141 = icmp slt i32 %140, 0
  br i1 %141, label %.preheader15.754, label %142

; <label>:142:                                    ; preds = %.preheader15.653
  %143 = add nsw i32 %.14.5, 1
  %144 = icmp slt i32 %.210.5, %140
  %..08.6 = select i1 %144, i32 %140, i32 %.210.5
  br label %.preheader15.754

.preheader15.754:                                 ; preds = %142, %.preheader15.653
  %.210.6 = phi i32 [ %.210.5, %.preheader15.653 ], [ %..08.6, %142 ]
  %.14.6 = phi i32 [ %.14.5, %.preheader15.653 ], [ %143, %142 ]
  %145 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 7
  %146 = load i32, i32* %145, align 4
  %147 = icmp slt i32 %146, 0
  br i1 %147, label %.preheader15.855, label %148

; <label>:148:                                    ; preds = %.preheader15.754
  %149 = add nsw i32 %.14.6, 1
  %150 = icmp slt i32 %.210.6, %146
  %..08.7 = select i1 %150, i32 %146, i32 %.210.6
  br label %.preheader15.855

.preheader15.855:                                 ; preds = %148, %.preheader15.754
  %.210.7 = phi i32 [ %.210.6, %.preheader15.754 ], [ %..08.7, %148 ]
  %.14.7 = phi i32 [ %.14.6, %.preheader15.754 ], [ %149, %148 ]
  %151 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 8
  %152 = load i32, i32* %151, align 4
  %153 = icmp slt i32 %152, 0
  br i1 %153, label %.preheader15.956, label %154

; <label>:154:                                    ; preds = %.preheader15.855
  %155 = add nsw i32 %.14.7, 1
  %156 = icmp slt i32 %.210.7, %152
  %..08.8 = select i1 %156, i32 %152, i32 %.210.7
  br label %.preheader15.956

.preheader15.956:                                 ; preds = %154, %.preheader15.855
  %.210.8 = phi i32 [ %.210.7, %.preheader15.855 ], [ %..08.8, %154 ]
  %.14.8 = phi i32 [ %.14.7, %.preheader15.855 ], [ %155, %154 ]
  %157 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 9
  %158 = load i32, i32* %157, align 4
  %159 = icmp slt i32 %158, 0
  br i1 %159, label %.preheader15.1057, label %160

; <label>:160:                                    ; preds = %.preheader15.956
  %161 = add nsw i32 %.14.8, 1
  %162 = icmp slt i32 %.210.8, %158
  %..08.9 = select i1 %162, i32 %158, i32 %.210.8
  br label %.preheader15.1057

.preheader15.1057:                                ; preds = %160, %.preheader15.956
  %.210.9 = phi i32 [ %.210.8, %.preheader15.956 ], [ %..08.9, %160 ]
  %.14.9 = phi i32 [ %.14.8, %.preheader15.956 ], [ %161, %160 ]
  %163 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 10
  %164 = load i32, i32* %163, align 4
  %165 = icmp slt i32 %164, 0
  br i1 %165, label %.lr.ph.preheader.new, label %166

; <label>:166:                                    ; preds = %.preheader15.1057
  %167 = add nsw i32 %.14.9, 1
  %168 = icmp slt i32 %.210.9, %164
  %..08.10 = select i1 %168, i32 %164, i32 %.210.9
  br label %.lr.ph.preheader.new

; <label>:169:                                    ; preds = %.lr.ph.176
  %170 = add nsw i32 %.12.1, 1
  %171 = icmp slt i32 %.213.1, %109
  %..011.172 = select i1 %171, i32 %109, i32 %.213.1
  br label %.lr.ph.144.1

.lr.ph.144.1:                                     ; preds = %169, %.lr.ph.176
  %.213.173 = phi i32 [ %.213.1, %.lr.ph.176 ], [ %..011.172, %169 ]
  %.12.174 = phi i32 [ %.12.1, %.lr.ph.176 ], [ %170, %169 ]
  %172 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 14
  %173 = load i32, i32* %172, align 4
  %174 = icmp slt i32 %173, 0
  br i1 %174, label %.lr.ph.277, label %175

; <label>:175:                                    ; preds = %.lr.ph.144.1
  %176 = add nsw i32 %.12.174, 1
  %177 = icmp slt i32 %.213.173, %173
  %..011.1.1 = select i1 %177, i32 %173, i32 %.213.173
  br label %.lr.ph.277

.lr.ph.277:                                       ; preds = %175, %.lr.ph.144.1
  %.213.1.1 = phi i32 [ %.213.173, %.lr.ph.144.1 ], [ %..011.1.1, %175 ]
  %.12.1.1 = phi i32 [ %.12.174, %.lr.ph.144.1 ], [ %176, %175 ]
  %178 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 15
  %179 = load i32, i32* %178, align 4
  %180 = icmp slt i32 %179, 0
  br i1 %180, label %.lr.ph.144.2, label %181

; <label>:181:                                    ; preds = %.lr.ph.277
  %182 = add nsw i32 %.12.1.1, 1
  %183 = icmp slt i32 %.213.1.1, %179
  %..011.2 = select i1 %183, i32 %179, i32 %.213.1.1
  br label %.lr.ph.144.2

.lr.ph.144.2:                                     ; preds = %181, %.lr.ph.277
  %.213.2 = phi i32 [ %.213.1.1, %.lr.ph.277 ], [ %..011.2, %181 ]
  %.12.2 = phi i32 [ %.12.1.1, %.lr.ph.277 ], [ %182, %181 ]
  %184 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 16
  %185 = load i32, i32* %184, align 4
  %186 = icmp slt i32 %185, 0
  br i1 %186, label %.lr.ph.378, label %187

; <label>:187:                                    ; preds = %.lr.ph.144.2
  %188 = add nsw i32 %.12.2, 1
  %189 = icmp slt i32 %.213.2, %185
  %..011.1.2 = select i1 %189, i32 %185, i32 %.213.2
  br label %.lr.ph.378

.lr.ph.378:                                       ; preds = %187, %.lr.ph.144.2
  %.213.1.2 = phi i32 [ %.213.2, %.lr.ph.144.2 ], [ %..011.1.2, %187 ]
  %.12.1.2 = phi i32 [ %.12.2, %.lr.ph.144.2 ], [ %188, %187 ]
  %190 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 17
  %191 = load i32, i32* %190, align 4
  %192 = icmp slt i32 %191, 0
  br i1 %192, label %.lr.ph.144.3, label %193

; <label>:193:                                    ; preds = %.lr.ph.378
  %194 = add nsw i32 %.12.1.2, 1
  %195 = icmp slt i32 %.213.1.2, %191
  %..011.3 = select i1 %195, i32 %191, i32 %.213.1.2
  br label %.lr.ph.144.3

.lr.ph.144.3:                                     ; preds = %193, %.lr.ph.378
  %.213.3 = phi i32 [ %.213.1.2, %.lr.ph.378 ], [ %..011.3, %193 ]
  %.12.3 = phi i32 [ %.12.1.2, %.lr.ph.378 ], [ %194, %193 ]
  %196 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 18
  %197 = load i32, i32* %196, align 4
  %198 = icmp slt i32 %197, 0
  br i1 %198, label %.lr.ph.479, label %199

; <label>:199:                                    ; preds = %.lr.ph.144.3
  %200 = add nsw i32 %.12.3, 1
  %201 = icmp slt i32 %.213.3, %197
  %..011.1.3 = select i1 %201, i32 %197, i32 %.213.3
  br label %.lr.ph.479

.lr.ph.479:                                       ; preds = %199, %.lr.ph.144.3
  %.213.1.3 = phi i32 [ %.213.3, %.lr.ph.144.3 ], [ %..011.1.3, %199 ]
  %.12.1.3 = phi i32 [ %.12.3, %.lr.ph.144.3 ], [ %200, %199 ]
  %202 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 19
  %203 = load i32, i32* %202, align 4
  %204 = icmp slt i32 %203, 0
  br i1 %204, label %.lr.ph.144.4, label %205

; <label>:205:                                    ; preds = %.lr.ph.479
  %206 = add nsw i32 %.12.1.3, 1
  %207 = icmp slt i32 %.213.1.3, %203
  %..011.4 = select i1 %207, i32 %203, i32 %.213.1.3
  br label %.lr.ph.144.4

.lr.ph.144.4:                                     ; preds = %205, %.lr.ph.479
  %.213.4 = phi i32 [ %.213.1.3, %.lr.ph.479 ], [ %..011.4, %205 ]
  %.12.4 = phi i32 [ %.12.1.3, %.lr.ph.479 ], [ %206, %205 ]
  %208 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %2, i64 1, i64 %4, i32 0, i64 20
  %209 = load i32, i32* %208, align 4
  %210 = icmp slt i32 %209, 0
  br i1 %210, label %.preheader80, label %211

; <label>:211:                                    ; preds = %.lr.ph.144.4
  %212 = add nsw i32 %.12.4, 1
  %213 = icmp slt i32 %.213.4, %209
  %..011.1.4 = select i1 %213, i32 %209, i32 %.213.4
  br label %.preheader80

.preheader80:                                     ; preds = %211, %.lr.ph.144.4
  %.213.1.4 = phi i32 [ %.213.4, %.lr.ph.144.4 ], [ %..011.1.4, %211 ]
  %.12.1.4 = phi i32 [ %.12.4, %.lr.ph.144.4 ], [ %212, %211 ]
  %214 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 1, i32 0, i64 %4, i32 0, i32 15
  %215 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 1, i32 0, i64 %4, i32 0, i32 4
  br label %83
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc i32 @ix_max(i32* readonly, i32* readnone) unnamed_addr #4 {
  %3 = icmp ult i32* %0, %1
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %4 = ptrtoint i32* %0 to i64
  %5 = bitcast i32* %1 to i8*
  %6 = xor i64 %4, -1
  %uglygep = getelementptr i8, i8* %5, i64 %6
  %uglygep4 = ptrtoint i8* %uglygep to i64
  %7 = lshr i64 %uglygep4, 3
  %8 = add nuw nsw i64 %7, 1
  %xtraiter = and i64 %8, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.03.prol = phi i32* [ %12, %.lr.ph.prol ], [ %0, %.lr.ph.prol.preheader ]
  %.012.prol = phi i32 [ %.2.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %9 = getelementptr inbounds i32, i32* %.03.prol, i64 1
  %10 = load i32, i32* %.03.prol, align 4
  %11 = icmp slt i32 %.012.prol, %10
  %..01.prol = select i1 %11, i32 %10, i32 %.012.prol
  %12 = getelementptr inbounds i32, i32* %.03.prol, i64 2
  %13 = load i32, i32* %9, align 4
  %14 = icmp slt i32 %..01.prol, %13
  %.2.prol = select i1 %14, i32 %13, i32 %..01.prol
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !12

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.03.unr = phi i32* [ %0, %.lr.ph.preheader ], [ %12, %.lr.ph.prol.loopexit.loopexit ]
  %.012.unr = phi i32 [ 0, %.lr.ph.preheader ], [ %.2.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.2.lcssa.unr = phi i32 [ undef, %.lr.ph.preheader ], [ %.2.prol, %.lr.ph.prol.loopexit.loopexit ]
  %15 = icmp ult i8* %uglygep, inttoptr (i64 24 to i8*)
  br i1 %15, label %._crit_edge, label %.lr.ph.preheader7

.lr.ph.preheader7:                                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader7, %.lr.ph
  %.03 = phi i32* [ %37, %.lr.ph ], [ %.03.unr, %.lr.ph.preheader7 ]
  %.012 = phi i32 [ %.2.3, %.lr.ph ], [ %.012.unr, %.lr.ph.preheader7 ]
  %16 = getelementptr inbounds i32, i32* %.03, i64 1
  %17 = load i32, i32* %.03, align 4
  %18 = icmp slt i32 %.012, %17
  %..01 = select i1 %18, i32 %17, i32 %.012
  %19 = getelementptr inbounds i32, i32* %.03, i64 2
  %20 = load i32, i32* %16, align 4
  %21 = icmp slt i32 %..01, %20
  %.2 = select i1 %21, i32 %20, i32 %..01
  %22 = getelementptr inbounds i32, i32* %.03, i64 3
  %23 = load i32, i32* %19, align 4
  %24 = icmp slt i32 %.2, %23
  %..01.1 = select i1 %24, i32 %23, i32 %.2
  %25 = getelementptr inbounds i32, i32* %.03, i64 4
  %26 = load i32, i32* %22, align 4
  %27 = icmp slt i32 %..01.1, %26
  %.2.1 = select i1 %27, i32 %26, i32 %..01.1
  %28 = getelementptr inbounds i32, i32* %.03, i64 5
  %29 = load i32, i32* %25, align 4
  %30 = icmp slt i32 %.2.1, %29
  %..01.2 = select i1 %30, i32 %29, i32 %.2.1
  %31 = getelementptr inbounds i32, i32* %.03, i64 6
  %32 = load i32, i32* %28, align 4
  %33 = icmp slt i32 %..01.2, %32
  %.2.2 = select i1 %33, i32 %32, i32 %..01.2
  %34 = getelementptr inbounds i32, i32* %.03, i64 7
  %35 = load i32, i32* %31, align 4
  %36 = icmp slt i32 %.2.2, %35
  %..01.3 = select i1 %36, i32 %35, i32 %.2.2
  %37 = getelementptr inbounds i32, i32* %.03, i64 8
  %38 = load i32, i32* %34, align 4
  %39 = icmp slt i32 %..01.3, %38
  %.2.3 = select i1 %39, i32 %38, i32 %..01.3
  %40 = icmp ult i32* %37, %1
  br i1 %40, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %2
  %.01.lcssa = phi i32 [ 0, %2 ], [ %.2.lcssa.unr, %.lr.ph.prol.loopexit ], [ %.2.3, %._crit_edge.loopexit ]
  ret i32 %.01.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @count_bit_short_noESC(i32* readonly, i32* readnone, i32) unnamed_addr #2 {
  %4 = zext i32 %2 to i64
  %5 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %4, i32 3
  %6 = load i8*, i8** %5, align 8
  br label %7

; <label>:7:                                      ; preds = %3, %7
  %.08 = phi i32* [ getelementptr inbounds ([288 x i32], [288 x i32]* @cb_esc_buf, i64 0, i64 0), %3 ], [ %scevgep, %7 ]
  %.06 = phi i32 [ 0, %3 ], [ %.3.2, %7 ]
  %.04 = phi i32 [ 0, %3 ], [ %47, %7 ]
  %.0 = phi i32* [ %0, %3 ], [ %scevgep18, %7 ]
  %scevgep = getelementptr i32, i32* %.08, i64 3
  %8 = getelementptr inbounds i32, i32* %.0, i64 3
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds i32, i32* %.0, i64 1
  %11 = load i32, i32* %.0, align 4
  %12 = icmp eq i32 %11, 0
  %13 = shl nsw i32 %11, 4
  %not. = xor i1 %12, true
  %14 = zext i1 %not. to i32
  %.01 = select i1 %12, i32 0, i32 %13
  %not.10 = icmp ne i32 %9, 0
  %15 = zext i1 %not.10 to i32
  %.2 = add i32 %15, %.06
  %.3 = add i32 %.2, %14
  %.12 = add nsw i32 %.01, %9
  store i32 %.12, i32* %.08, align 4
  %16 = sext i32 %.12 to i64
  %17 = getelementptr inbounds i8, i8* %6, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = add nsw i32 %19, %.04
  %21 = getelementptr inbounds i32, i32* %.08, i64 1
  %22 = getelementptr inbounds i32, i32* %.0, i64 4
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds i32, i32* %.0, i64 2
  %25 = load i32, i32* %10, align 4
  %26 = icmp eq i32 %25, 0
  %27 = shl nsw i32 %25, 4
  %not..1 = xor i1 %26, true
  %28 = zext i1 %not..1 to i32
  %.01.1 = select i1 %26, i32 0, i32 %27
  %not.10.1 = icmp ne i32 %23, 0
  %29 = zext i1 %not.10.1 to i32
  %.2.1 = add i32 %29, %.3
  %.3.1 = add i32 %.2.1, %28
  %.12.1 = add nsw i32 %.01.1, %23
  store i32 %.12.1, i32* %21, align 4
  %30 = sext i32 %.12.1 to i64
  %31 = getelementptr inbounds i8, i8* %6, i64 %30
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = add nsw i32 %33, %20
  %35 = getelementptr inbounds i32, i32* %.08, i64 2
  %36 = getelementptr inbounds i32, i32* %.0, i64 5
  %37 = load i32, i32* %36, align 4
  %38 = load i32, i32* %24, align 4
  %39 = icmp eq i32 %38, 0
  %40 = shl nsw i32 %38, 4
  %not..2 = xor i1 %39, true
  %41 = zext i1 %not..2 to i32
  %.01.2 = select i1 %39, i32 0, i32 %40
  %not.10.2 = icmp ne i32 %37, 0
  %42 = zext i1 %not.10.2 to i32
  %.2.2 = add i32 %42, %.3.1
  %.3.2 = add i32 %.2.2, %41
  %.12.2 = add nsw i32 %.01.2, %37
  store i32 %.12.2, i32* %35, align 4
  %43 = sext i32 %.12.2 to i64
  %44 = getelementptr inbounds i8, i8* %6, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = add nsw i32 %46, %34
  %scevgep18 = getelementptr i32, i32* %.0, i64 6
  %48 = icmp ult i32* %scevgep18, %1
  br i1 %48, label %7, label %49

; <label>:49:                                     ; preds = %7
  store i32 %.3.2, i32* @cb_esc_sign, align 4
  store i32* %scevgep, i32** @cb_esc_end, align 8
  %50 = add nsw i32 %47, %.3.2
  ret i32 %50
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc i32 @count_bit_noESC2(i32) unnamed_addr #4 {
  %2 = load i32, i32* @cb_esc_sign, align 4
  %3 = zext i32 %0 to i64
  %4 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %3, i32 3
  %5 = load i8*, i8** %4, align 8
  %6 = load i32*, i32** @cb_esc_end, align 8
  %7 = ptrtoint i32* %6 to i64
  %8 = icmp ugt i64 %7, ptrtoint (i32* getelementptr inbounds ([288 x i32], [288 x i32]* @cb_esc_buf, i64 0, i64 1) to i64)
  %umax = select i1 %8, i64 %7, i64 ptrtoint (i32* getelementptr inbounds ([288 x i32], [288 x i32]* @cb_esc_buf, i64 0, i64 1) to i64)
  %umax23 = inttoptr i64 %umax to i8*
  %uglygep = getelementptr i8, i8* %umax23, i64 sub (i64 -1, i64 ptrtoint ([288 x i32]* @cb_esc_buf to i64))
  %uglygep4 = ptrtoint i8* %uglygep to i64
  %9 = lshr i64 %uglygep4, 2
  %10 = add nuw nsw i64 %9, 1
  %xtraiter = and i64 %10, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %1
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %.01.prol = phi i32 [ %17, %.prol.preheader ], [ %2, %.prol.preheader.preheader ]
  %.0.prol = phi i32* [ %11, %.prol.preheader ], [ getelementptr inbounds ([288 x i32], [288 x i32]* @cb_esc_buf, i64 0, i64 0), %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %11 = getelementptr inbounds i32, i32* %.0.prol, i64 1
  %12 = load i32, i32* %.0.prol, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, i8* %5, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = add nsw i32 %16, %.01.prol
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !13

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %1
  %.01.unr = phi i32 [ %2, %1 ], [ %17, %.prol.loopexit.loopexit ]
  %.0.unr = phi i32* [ getelementptr inbounds ([288 x i32], [288 x i32]* @cb_esc_buf, i64 0, i64 0), %1 ], [ %11, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi i32 [ undef, %1 ], [ %17, %.prol.loopexit.loopexit ]
  %18 = icmp ult i8* %uglygep, inttoptr (i64 12 to i8*)
  br i1 %18, label %.unr-lcssa, label %.new.preheader

.new.preheader:                                   ; preds = %.prol.loopexit
  br label %.new

.new:                                             ; preds = %.new.preheader, %.new
  %.01 = phi i32 [ %46, %.new ], [ %.01.unr, %.new.preheader ]
  %.0 = phi i32* [ %40, %.new ], [ %.0.unr, %.new.preheader ]
  %19 = getelementptr inbounds i32, i32* %.0, i64 1
  %20 = load i32, i32* %.0, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, i8* %5, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = add nsw i32 %24, %.01
  %26 = getelementptr inbounds i32, i32* %.0, i64 2
  %27 = load i32, i32* %19, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8* %5, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = add nsw i32 %31, %25
  %33 = getelementptr inbounds i32, i32* %.0, i64 3
  %34 = load i32, i32* %26, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8* %5, i64 %35
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = add nsw i32 %38, %32
  %40 = getelementptr inbounds i32, i32* %.0, i64 4
  %41 = load i32, i32* %33, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %5, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = add nsw i32 %45, %39
  %47 = icmp ult i32* %40, %6
  br i1 %47, label %.new, label %.unr-lcssa.loopexit

.unr-lcssa.loopexit:                              ; preds = %.new
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.unr-lcssa.loopexit, %.prol.loopexit
  %.lcssa = phi i32 [ %.lcssa.unr, %.prol.loopexit ], [ %46, %.unr-lcssa.loopexit ]
  ret i32 %.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @count_bit_short_ESC(i32* readonly, i32* readnone, i32, i32, i32* nocapture) unnamed_addr #2 {
  %6 = sext i32 %2 to i64
  %7 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %6, i32 0
  %8 = load i32, i32* %7, align 8
  %9 = sext i32 %3 to i64
  %10 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %9, i32 0
  %11 = load i32, i32* %10, align 8
  %12 = load i8*, i8** getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 24, i32 3), align 16
  %13 = load i8*, i8** getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 16, i32 3), align 16
  br label %14

; <label>:14:                                     ; preds = %5, %96
  %.015 = phi i32 [ 0, %5 ], [ %.318.2, %96 ]
  %.09 = phi i32 [ 0, %5 ], [ %105, %96 ]
  %.06 = phi i32 [ 0, %5 ], [ %101, %96 ]
  %.0 = phi i32* [ %0, %5 ], [ %scevgep, %96 ]
  %15 = getelementptr inbounds i32, i32* %.0, i64 3
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds i32, i32* %.0, i64 1
  %18 = load i32, i32* %.0, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %26, label %20

; <label>:20:                                     ; preds = %14
  %21 = add nsw i32 %.015, 1
  %22 = icmp sgt i32 %18, 14
  %23 = select i1 %22, i32 %8, i32 0
  %.211 = add nsw i32 %23, %.09
  %24 = select i1 %22, i32 %11, i32 0
  %.28 = add nsw i32 %24, %.06
  %.op = shl i32 %18, 4
  %25 = select i1 %22, i32 240, i32 %.op
  br label %26

; <label>:26:                                     ; preds = %14, %20
  %.217 = phi i32 [ %21, %20 ], [ %.015, %14 ]
  %.312 = phi i32 [ %.211, %20 ], [ %.09, %14 ]
  %.3 = phi i32 [ %.28, %20 ], [ %.06, %14 ]
  %.12 = phi i32 [ %25, %20 ], [ 0, %14 ]
  %27 = icmp eq i32 %16, 0
  br i1 %27, label %34, label %28

; <label>:28:                                     ; preds = %26
  %29 = add nsw i32 %.217, 1
  %30 = icmp sgt i32 %16, 14
  %31 = select i1 %30, i32 %8, i32 0
  %.413 = add nsw i32 %.312, %31
  %32 = select i1 %30, i32 %11, i32 0
  %.4 = add nsw i32 %.3, %32
  %.04 = select i1 %30, i32 15, i32 %16
  %33 = add nsw i32 %.12, %.04
  br label %34

; <label>:34:                                     ; preds = %28, %26
  %.318 = phi i32 [ %29, %28 ], [ %.217, %26 ]
  %.514 = phi i32 [ %.413, %28 ], [ %.312, %26 ]
  %.5 = phi i32 [ %.4, %28 ], [ %.3, %26 ]
  %.2 = phi i32 [ %33, %28 ], [ %.12, %26 ]
  %35 = sext i32 %.2 to i64
  %36 = getelementptr inbounds i8, i8* %12, i64 %35
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = add nsw i32 %38, %.5
  %40 = getelementptr inbounds i8, i8* %13, i64 %35
  %41 = load i8, i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = add nsw i32 %42, %.514
  %44 = getelementptr inbounds i32, i32* %.0, i64 4
  %45 = load i32, i32* %44, align 4
  %46 = getelementptr inbounds i32, i32* %.0, i64 2
  %47 = load i32, i32* %17, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %60, label %54

; <label>:49:                                     ; preds = %96
  %50 = icmp sgt i32 %105, %101
  %.17..110 = select i1 %50, i32 %101, i32 %105
  %. = select i1 %50, i32 %3, i32 %2
  %51 = add nsw i32 %.17..110, %.318.2
  %52 = load i32, i32* %4, align 4
  %53 = add nsw i32 %51, %52
  store i32 %53, i32* %4, align 4
  ret i32 %.

; <label>:54:                                     ; preds = %34
  %55 = add nsw i32 %.318, 1
  %56 = icmp sgt i32 %47, 14
  %57 = select i1 %56, i32 %8, i32 0
  %.211.1 = add nsw i32 %57, %43
  %58 = select i1 %56, i32 %11, i32 0
  %.28.1 = add nsw i32 %58, %39
  %.op.1 = shl i32 %47, 4
  %59 = select i1 %56, i32 240, i32 %.op.1
  br label %60

; <label>:60:                                     ; preds = %54, %34
  %.217.1 = phi i32 [ %55, %54 ], [ %.318, %34 ]
  %.312.1 = phi i32 [ %.211.1, %54 ], [ %43, %34 ]
  %.3.1 = phi i32 [ %.28.1, %54 ], [ %39, %34 ]
  %.12.1 = phi i32 [ %59, %54 ], [ 0, %34 ]
  %61 = icmp eq i32 %45, 0
  br i1 %61, label %68, label %62

; <label>:62:                                     ; preds = %60
  %63 = add nsw i32 %.217.1, 1
  %64 = icmp sgt i32 %45, 14
  %65 = select i1 %64, i32 %8, i32 0
  %.413.1 = add nsw i32 %.312.1, %65
  %66 = select i1 %64, i32 %11, i32 0
  %.4.1 = add nsw i32 %.3.1, %66
  %.04.1 = select i1 %64, i32 15, i32 %45
  %67 = add nsw i32 %.12.1, %.04.1
  br label %68

; <label>:68:                                     ; preds = %62, %60
  %.318.1 = phi i32 [ %63, %62 ], [ %.217.1, %60 ]
  %.514.1 = phi i32 [ %.413.1, %62 ], [ %.312.1, %60 ]
  %.5.1 = phi i32 [ %.4.1, %62 ], [ %.3.1, %60 ]
  %.2.1 = phi i32 [ %67, %62 ], [ %.12.1, %60 ]
  %69 = sext i32 %.2.1 to i64
  %70 = getelementptr inbounds i8, i8* %12, i64 %69
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = add nsw i32 %72, %.5.1
  %74 = getelementptr inbounds i8, i8* %13, i64 %69
  %75 = load i8, i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = add nsw i32 %76, %.514.1
  %78 = getelementptr inbounds i32, i32* %.0, i64 5
  %79 = load i32, i32* %78, align 4
  %80 = load i32, i32* %46, align 4
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %88, label %82

; <label>:82:                                     ; preds = %68
  %83 = add nsw i32 %.318.1, 1
  %84 = icmp sgt i32 %80, 14
  %85 = select i1 %84, i32 %8, i32 0
  %.211.2 = add nsw i32 %85, %77
  %86 = select i1 %84, i32 %11, i32 0
  %.28.2 = add nsw i32 %86, %73
  %.op.2 = shl i32 %80, 4
  %87 = select i1 %84, i32 240, i32 %.op.2
  br label %88

; <label>:88:                                     ; preds = %82, %68
  %.217.2 = phi i32 [ %83, %82 ], [ %.318.1, %68 ]
  %.312.2 = phi i32 [ %.211.2, %82 ], [ %77, %68 ]
  %.3.2 = phi i32 [ %.28.2, %82 ], [ %73, %68 ]
  %.12.2 = phi i32 [ %87, %82 ], [ 0, %68 ]
  %89 = icmp eq i32 %79, 0
  br i1 %89, label %96, label %90

; <label>:90:                                     ; preds = %88
  %91 = add nsw i32 %.217.2, 1
  %92 = icmp sgt i32 %79, 14
  %93 = select i1 %92, i32 %8, i32 0
  %.413.2 = add nsw i32 %.312.2, %93
  %94 = select i1 %92, i32 %11, i32 0
  %.4.2 = add nsw i32 %.3.2, %94
  %.04.2 = select i1 %92, i32 15, i32 %79
  %95 = add nsw i32 %.12.2, %.04.2
  br label %96

; <label>:96:                                     ; preds = %90, %88
  %.318.2 = phi i32 [ %91, %90 ], [ %.217.2, %88 ]
  %.514.2 = phi i32 [ %.413.2, %90 ], [ %.312.2, %88 ]
  %.5.2 = phi i32 [ %.4.2, %90 ], [ %.3.2, %88 ]
  %.2.2 = phi i32 [ %95, %90 ], [ %.12.2, %88 ]
  %97 = sext i32 %.2.2 to i64
  %98 = getelementptr inbounds i8, i8* %12, i64 %97
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = add nsw i32 %100, %.5.2
  %102 = getelementptr inbounds i8, i8* %13, i64 %97
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = add nsw i32 %104, %.514.2
  %scevgep = getelementptr i32, i32* %.0, i64 6
  %106 = icmp ult i32* %scevgep, %1
  br i1 %106, label %14, label %49
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @count_bit_noESC(i32* readonly, i32* readnone, i32) unnamed_addr #2 {
  %4 = ptrtoint i32* %0 to i64
  %5 = zext i32 %2 to i64
  %6 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %5, i32 3
  %7 = load i8*, i8** %6, align 8
  %scevgep = getelementptr i32, i32* %0, i64 2
  %8 = icmp ult i32* %scevgep, %1
  %umax = select i1 %8, i32* %1, i32* %scevgep
  %umax9 = bitcast i32* %umax to i8*
  %9 = xor i64 %4, -1
  %uglygep = getelementptr i8, i8* %umax9, i64 %9
  %uglygep10 = ptrtoint i8* %uglygep to i64
  %10 = lshr i64 %uglygep10, 3
  %11 = add nuw nsw i64 %10, 1
  br label %12

; <label>:12:                                     ; preds = %12, %3
  %.04 = phi i32 [ 0, %3 ], [ %.2, %12 ]
  %.03 = phi i32 [ 0, %3 ], [ %26, %12 ]
  %.02 = phi i32* [ getelementptr inbounds ([288 x i32], [288 x i32]* @cb_esc_buf, i64 0, i64 0), %3 ], [ %21, %12 ]
  %.0 = phi i32* [ %0, %3 ], [ %15, %12 ]
  %13 = getelementptr inbounds i32, i32* %.0, i64 1
  %14 = load i32, i32* %.0, align 4
  %15 = getelementptr inbounds i32, i32* %.0, i64 2
  %16 = load i32, i32* %13, align 4
  %17 = icmp eq i32 %14, 0
  %18 = shl nsw i32 %14, 4
  %not. = xor i1 %17, true
  %19 = zext i1 %not. to i32
  %.15 = add nsw i32 %19, %.04
  %.01 = select i1 %17, i32 0, i32 %18
  %not.6 = icmp ne i32 %16, 0
  %20 = zext i1 %not.6 to i32
  %.2 = add nsw i32 %.15, %20
  %.1 = add nsw i32 %.01, %16
  %21 = getelementptr inbounds i32, i32* %.02, i64 1
  store i32 %.1, i32* %.02, align 4
  %22 = sext i32 %.1 to i64
  %23 = getelementptr inbounds i8, i8* %7, i64 %22
  %24 = load i8, i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = add nsw i32 %25, %.03
  %27 = icmp ult i32* %15, %1
  br i1 %27, label %12, label %28

; <label>:28:                                     ; preds = %12
  %scevgep11 = getelementptr [288 x i32], [288 x i32]* @cb_esc_buf, i64 0, i64 %11
  store i32 %.2, i32* @cb_esc_sign, align 4
  store i32* %scevgep11, i32** @cb_esc_end, align 8
  %29 = add nsw i32 %26, %.2
  ret i32 %29
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @count_bit_ESC(i32* readonly, i32* readnone, i32, i32, i32* nocapture) unnamed_addr #2 {
  %6 = sext i32 %2 to i64
  %7 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %6, i32 0
  %8 = load i32, i32* %7, align 8
  %9 = sext i32 %3 to i64
  %10 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %9, i32 0
  %11 = load i32, i32* %10, align 8
  %12 = icmp ult i32* %0, %1
  br i1 %12, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %5
  %13 = load i8*, i8** getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 16, i32 3), align 16
  %14 = load i8*, i8** getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 24, i32 3), align 16
  br label %15

; <label>:15:                                     ; preds = %.lr.ph, %35
  %.018 = phi i32* [ %0, %.lr.ph ], [ %18, %35 ]
  %.0417 = phi i32 [ 0, %.lr.ph ], [ %44, %35 ]
  %.0716 = phi i32 [ 0, %.lr.ph ], [ %40, %35 ]
  %.01215 = phi i32 [ 0, %.lr.ph ], [ %.214, %35 ]
  %16 = getelementptr inbounds i32, i32* %.018, i64 1
  %17 = load i32, i32* %.018, align 4
  %18 = getelementptr inbounds i32, i32* %.018, i64 2
  %19 = load i32, i32* %16, align 4
  %20 = icmp eq i32 %17, 0
  br i1 %20, label %27, label %21

; <label>:21:                                     ; preds = %15
  %22 = add nsw i32 %.01215, 1
  %23 = icmp sgt i32 %17, 14
  %24 = select i1 %23, i32 %8, i32 0
  %.18 = add nsw i32 %24, %.0716
  %25 = select i1 %23, i32 %11, i32 0
  %.15 = add nsw i32 %25, %.0417
  %.op = shl i32 %17, 4
  %26 = select i1 %23, i32 240, i32 %.op
  br label %27

; <label>:27:                                     ; preds = %15, %21
  %.113 = phi i32 [ %22, %21 ], [ %.01215, %15 ]
  %.29 = phi i32 [ %.18, %21 ], [ %.0716, %15 ]
  %.26 = phi i32 [ %.15, %21 ], [ %.0417, %15 ]
  %.1 = phi i32 [ %26, %21 ], [ 0, %15 ]
  %28 = icmp eq i32 %19, 0
  br i1 %28, label %35, label %29

; <label>:29:                                     ; preds = %27
  %30 = add nsw i32 %.113, 1
  %31 = icmp sgt i32 %19, 14
  %32 = select i1 %31, i32 %8, i32 0
  %.310 = add nsw i32 %.29, %32
  %33 = select i1 %31, i32 %11, i32 0
  %.3 = add nsw i32 %.26, %33
  %.01 = select i1 %31, i32 15, i32 %19
  %34 = add nsw i32 %.1, %.01
  br label %35

; <label>:35:                                     ; preds = %27, %29
  %.214 = phi i32 [ %30, %29 ], [ %.113, %27 ]
  %.411 = phi i32 [ %.310, %29 ], [ %.29, %27 ]
  %.4 = phi i32 [ %.3, %29 ], [ %.26, %27 ]
  %.2 = phi i32 [ %34, %29 ], [ %.1, %27 ]
  %36 = sext i32 %.2 to i64
  %37 = getelementptr inbounds i8, i8* %13, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = add nsw i32 %39, %.411
  %41 = getelementptr inbounds i8, i8* %14, i64 %36
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = add nsw i32 %43, %.4
  %45 = icmp ult i32* %18, %1
  br i1 %45, label %15, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %35
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  %.012.lcssa = phi i32 [ 0, %5 ], [ %.214, %._crit_edge.loopexit ]
  %.07.lcssa = phi i32 [ 0, %5 ], [ %40, %._crit_edge.loopexit ]
  %.04.lcssa = phi i32 [ 0, %5 ], [ %44, %._crit_edge.loopexit ]
  %46 = icmp sgt i32 %.07.lcssa, %.04.lcssa
  %.04..07 = select i1 %46, i32 %.04.lcssa, i32 %.07.lcssa
  %. = select i1 %46, i32 %3, i32 %2
  %47 = add nsw i32 %.04..07, %.012.lcssa
  %48 = load i32, i32* %4, align 4
  %49 = add nsw i32 %47, %48
  store i32 %49, i32* %4, align 4
  ret i32 %.
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !2}
!10 = distinct !{!10, !5, !6}
!11 = distinct !{!11, !8, !5, !6}
!12 = distinct !{!12, !2}
!13 = distinct !{!13, !2}
