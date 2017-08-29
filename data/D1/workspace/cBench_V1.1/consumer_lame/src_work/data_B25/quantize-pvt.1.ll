; ModuleID = 'quantize-pvt.ll'
source_filename = "quantize-pvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.scalefac_struct = type { [23 x i32], [14 x i32] }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }
%struct.III_scalefac_t = type { [22 x i32], [13 x [3 x i32]] }
%struct.III_psy_ratio = type { %struct.III_psy_xmin, %struct.III_psy_xmin }
%struct.III_psy_xmin = type { [22 x double], [13 x [3 x double]] }

@masking_lower = local_unnamed_addr global float 1.000000e+00, align 4
@nr_of_sfb_block = global [6 x [3 x [4 x i32]]] [[3 x [4 x i32]] [[4 x i32] [i32 6, i32 5, i32 5, i32 5], [4 x i32] [i32 9, i32 9, i32 9, i32 9], [4 x i32] [i32 6, i32 9, i32 9, i32 9]], [3 x [4 x i32]] [[4 x i32] [i32 6, i32 5, i32 7, i32 3], [4 x i32] [i32 9, i32 9, i32 12, i32 6], [4 x i32] [i32 6, i32 9, i32 12, i32 6]], [3 x [4 x i32]] [[4 x i32] [i32 11, i32 10, i32 0, i32 0], [4 x i32] [i32 18, i32 18, i32 0, i32 0], [4 x i32] [i32 15, i32 18, i32 0, i32 0]], [3 x [4 x i32]] [[4 x i32] [i32 7, i32 7, i32 7, i32 0], [4 x i32] [i32 12, i32 12, i32 12, i32 0], [4 x i32] [i32 6, i32 15, i32 12, i32 0]], [3 x [4 x i32]] [[4 x i32] [i32 6, i32 6, i32 6, i32 3], [4 x i32] [i32 12, i32 9, i32 9, i32 6], [4 x i32] [i32 6, i32 12, i32 9, i32 6]], [3 x [4 x i32]] [[4 x i32] [i32 8, i32 8, i32 5, i32 0], [4 x i32] [i32 15, i32 12, i32 9, i32 0], [4 x i32] [i32 6, i32 18, i32 9, i32 0]]], align 16
@pretab = local_unnamed_addr global [21 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 2, i32 2, i32 3, i32 3, i32 3, i32 2], align 16
@sfBandIndex = local_unnamed_addr global [6 x %struct.scalefac_struct] [%struct.scalefac_struct { [23 x i32] [i32 0, i32 6, i32 12, i32 18, i32 24, i32 30, i32 36, i32 44, i32 54, i32 66, i32 80, i32 96, i32 116, i32 140, i32 168, i32 200, i32 238, i32 284, i32 336, i32 396, i32 464, i32 522, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 18, i32 24, i32 32, i32 42, i32 56, i32 74, i32 100, i32 132, i32 174, i32 192] }, %struct.scalefac_struct { [23 x i32] [i32 0, i32 6, i32 12, i32 18, i32 24, i32 30, i32 36, i32 44, i32 54, i32 66, i32 80, i32 96, i32 114, i32 136, i32 162, i32 194, i32 232, i32 278, i32 332, i32 394, i32 464, i32 540, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 18, i32 26, i32 36, i32 48, i32 62, i32 80, i32 104, i32 136, i32 180, i32 192] }, %struct.scalefac_struct { [23 x i32] [i32 0, i32 6, i32 12, i32 18, i32 24, i32 30, i32 36, i32 44, i32 54, i32 66, i32 80, i32 96, i32 116, i32 140, i32 168, i32 200, i32 238, i32 284, i32 336, i32 396, i32 464, i32 522, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 18, i32 26, i32 36, i32 48, i32 62, i32 80, i32 104, i32 134, i32 174, i32 192] }, %struct.scalefac_struct { [23 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 20, i32 24, i32 30, i32 36, i32 44, i32 52, i32 62, i32 74, i32 90, i32 110, i32 134, i32 162, i32 196, i32 238, i32 288, i32 342, i32 418, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 22, i32 30, i32 40, i32 52, i32 66, i32 84, i32 106, i32 136, i32 192] }, %struct.scalefac_struct { [23 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 20, i32 24, i32 30, i32 36, i32 42, i32 50, i32 60, i32 72, i32 88, i32 106, i32 128, i32 156, i32 190, i32 230, i32 276, i32 330, i32 384, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 22, i32 28, i32 38, i32 50, i32 64, i32 80, i32 100, i32 126, i32 192] }, %struct.scalefac_struct { [23 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 20, i32 24, i32 30, i32 36, i32 44, i32 54, i32 66, i32 82, i32 102, i32 126, i32 156, i32 194, i32 240, i32 296, i32 364, i32 448, i32 550, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 22, i32 30, i32 42, i32 58, i32 78, i32 104, i32 138, i32 180, i32 192] }], align 16
@scalefac_band = common local_unnamed_addr global %struct.scalefac_struct zeroinitializer, align 4
@ATH_l = internal global [21 x double] zeroinitializer, align 16
@ATH_s = internal global [21 x double] zeroinitializer, align 16
@pow43 = common local_unnamed_addr global [8208 x double] zeroinitializer, align 16
@adj43 = internal unnamed_addr global [8208 x double] zeroinitializer, align 16
@ipow20 = common local_unnamed_addr global [256 x double] zeroinitializer, align 16
@pow20 = common local_unnamed_addr global [256 x double] zeroinitializer, align 16
@convert_mdct = common local_unnamed_addr global i32 0, align 4
@reduce_sidechannel = common local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [14 x i8] c"max_bits >= 0\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"quantize-pvt.c\00", align 1
@__PRETTY_FUNCTION__.inner_loop = private unnamed_addr constant [69 x i8] c"int inner_loop(lame_global_flags *, FLOAT8 *, int *, int, gr_info *)\00", align 1
@scale_bitcount.slen1 = internal unnamed_addr constant [16 x i32] [i32 1, i32 1, i32 1, i32 1, i32 8, i32 2, i32 2, i32 2, i32 4, i32 4, i32 4, i32 8, i32 8, i32 8, i32 16, i32 16], align 16
@scale_bitcount.slen2 = internal unnamed_addr constant [16 x i32] [i32 1, i32 2, i32 4, i32 8, i32 1, i32 2, i32 4, i32 8, i32 2, i32 4, i32 8, i32 2, i32 4, i32 8, i32 4, i32 8], align 16
@scale_bitcount.slen1_tab = internal global [16 x i32] [i32 0, i32 18, i32 36, i32 54, i32 54, i32 36, i32 54, i32 72, i32 54, i32 72, i32 90, i32 72, i32 90, i32 108, i32 108, i32 126], align 16
@scale_bitcount.slen2_tab = internal global [16 x i32] [i32 0, i32 10, i32 20, i32 30, i32 33, i32 21, i32 31, i32 41, i32 32, i32 42, i32 52, i32 43, i32 53, i32 63, i32 64, i32 74], align 16
@max_range_sfac_tab = internal unnamed_addr constant [6 x [4 x i32]] [[4 x i32] [i32 15, i32 15, i32 7, i32 7], [4 x i32] [i32 15, i32 15, i32 7, i32 0], [4 x i32] [i32 7, i32 3, i32 0, i32 0], [4 x i32] [i32 15, i32 31, i32 31, i32 0], [4 x i32] [i32 7, i32 7, i32 7, i32 0], [4 x i32] [i32 3, i32 3, i32 0, i32 0]], align 16
@scale_bitcount_lsf.log2tab = internal unnamed_addr constant [16 x i32] [i32 0, i32 1, i32 2, i32 2, i32 3, i32 3, i32 3, i32 3, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4], align 16
@.str.2 = private unnamed_addr constant [38 x i8] c"intensity stereo not implemented yet\0A\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"cod_info->sfb_partition_table\00", align 1
@__PRETTY_FUNCTION__.scale_bitcount_lsf = private unnamed_addr constant [52 x i8] c"int scale_bitcount_lsf(III_scalefac_t *, gr_info *)\00", align 1
@bin_search_StepSize2.CurrentStep = internal unnamed_addr global i32 4, align 4
@ATH_mdct_long = common local_unnamed_addr global [576 x double] zeroinitializer, align 16
@ATH_mdct_short = common local_unnamed_addr global [192 x double] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define void @iteration_init(%struct.lame_global_flags* nocapture readonly, %struct.III_side_info_t* nocapture, [2 x [576 x i32]]* nocapture readnone) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 2
  store i32 0, i32* %4, align 8
  %5 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  %6 = load i64, i64* %5, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %.preheader13, label %.loopexit

.preheader13:                                     ; preds = %3
  %8 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 51
  %9 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %10 = load i32, i32* %8, align 8
  %11 = load i32, i32* %9, align 8
  %12 = mul nsw i32 %11, 3
  %13 = add nsw i32 %12, %10
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %14, i32 0, i64 0
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 0), align 4
  br label %235

; <label>:17:                                     ; preds = %235
  %18 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 51
  %19 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %20 = load i32, i32* %18, align 8
  %21 = load i32, i32* %19, align 8
  %22 = mul nsw i32 %21, 3
  %23 = add nsw i32 %22, %20
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %24, i32 1, i64 0
  %26 = load i32, i32* %25, align 4
  store i32 %26, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 0), align 4
  %27 = load i32, i32* %18, align 8
  %28 = load i32, i32* %19, align 8
  %29 = mul nsw i32 %28, 3
  %30 = add nsw i32 %29, %27
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %31, i32 1, i64 1
  %33 = load i32, i32* %32, align 4
  store i32 %33, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 1), align 4
  %34 = load i32, i32* %18, align 8
  %35 = load i32, i32* %19, align 8
  %36 = mul nsw i32 %35, 3
  %37 = add nsw i32 %36, %34
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %38, i32 1, i64 2
  %40 = load i32, i32* %39, align 4
  store i32 %40, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 2), align 4
  %41 = load i32, i32* %18, align 8
  %42 = load i32, i32* %19, align 8
  %43 = mul nsw i32 %42, 3
  %44 = add nsw i32 %43, %41
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %45, i32 1, i64 3
  %47 = load i32, i32* %46, align 4
  store i32 %47, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 3), align 4
  %48 = load i32, i32* %18, align 8
  %49 = load i32, i32* %19, align 8
  %50 = mul nsw i32 %49, 3
  %51 = add nsw i32 %50, %48
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %52, i32 1, i64 4
  %54 = load i32, i32* %53, align 4
  store i32 %54, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 4), align 4
  %55 = load i32, i32* %18, align 8
  %56 = load i32, i32* %19, align 8
  %57 = mul nsw i32 %56, 3
  %58 = add nsw i32 %57, %55
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %59, i32 1, i64 5
  %61 = load i32, i32* %60, align 4
  store i32 %61, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 5), align 4
  %62 = load i32, i32* %18, align 8
  %63 = load i32, i32* %19, align 8
  %64 = mul nsw i32 %63, 3
  %65 = add nsw i32 %64, %62
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %66, i32 1, i64 6
  %68 = load i32, i32* %67, align 4
  store i32 %68, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 6), align 4
  %69 = load i32, i32* %18, align 8
  %70 = load i32, i32* %19, align 8
  %71 = mul nsw i32 %70, 3
  %72 = add nsw i32 %71, %69
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %73, i32 1, i64 7
  %75 = load i32, i32* %74, align 4
  store i32 %75, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 7), align 4
  %76 = load i32, i32* %18, align 8
  %77 = load i32, i32* %19, align 8
  %78 = mul nsw i32 %77, 3
  %79 = add nsw i32 %78, %76
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %80, i32 1, i64 8
  %82 = load i32, i32* %81, align 4
  store i32 %82, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 8), align 4
  %83 = load i32, i32* %18, align 8
  %84 = load i32, i32* %19, align 8
  %85 = mul nsw i32 %84, 3
  %86 = add nsw i32 %85, %83
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %87, i32 1, i64 9
  %89 = load i32, i32* %88, align 4
  store i32 %89, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 9), align 4
  %90 = load i32, i32* %18, align 8
  %91 = load i32, i32* %19, align 8
  %92 = mul nsw i32 %91, 3
  %93 = add nsw i32 %92, %90
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %94, i32 1, i64 10
  %96 = load i32, i32* %95, align 4
  store i32 %96, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 10), align 4
  %97 = load i32, i32* %18, align 8
  %98 = load i32, i32* %19, align 8
  %99 = mul nsw i32 %98, 3
  %100 = add nsw i32 %99, %97
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %101, i32 1, i64 11
  %103 = load i32, i32* %102, align 4
  store i32 %103, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 11), align 4
  %104 = load i32, i32* %18, align 8
  %105 = load i32, i32* %19, align 8
  %106 = mul nsw i32 %105, 3
  %107 = add nsw i32 %106, %104
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %108, i32 1, i64 12
  %110 = load i32, i32* %109, align 4
  store i32 %110, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 12), align 4
  %111 = load i32, i32* %18, align 8
  %112 = load i32, i32* %19, align 8
  %113 = mul nsw i32 %112, 3
  %114 = add nsw i32 %113, %111
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %115, i32 1, i64 13
  %117 = load i32, i32* %116, align 4
  store i32 %117, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 13), align 4
  %118 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 0
  store i32 0, i32* %118, align 8
  tail call void @compute_ath(%struct.lame_global_flags* nonnull %0, double* getelementptr inbounds ([21 x double], [21 x double]* @ATH_l, i64 0, i64 0), double* getelementptr inbounds ([21 x double], [21 x double]* @ATH_s, i64 0, i64 0))
  br label %119

; <label>:119:                                    ; preds = %119, %17
  %indvars.iv38 = phi i64 [ 0, %17 ], [ %indvars.iv.next39.5, %119 ]
  %120 = trunc i64 %indvars.iv38 to i32
  %121 = sitofp i32 %120 to double
  %122 = tail call double @pow(double %121, double 0x3FF5555555555555) #8
  %123 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv38
  store double %122, double* %123, align 16
  %indvars.iv.next39 = or i64 %indvars.iv38, 1
  %124 = trunc i64 %indvars.iv.next39 to i32
  %125 = sitofp i32 %124 to double
  %126 = tail call double @pow(double %125, double 0x3FF5555555555555) #8
  %127 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next39
  store double %126, double* %127, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %128 = trunc i64 %indvars.iv.next39.1 to i32
  %129 = sitofp i32 %128 to double
  %130 = tail call double @pow(double %129, double 0x3FF5555555555555) #8
  %131 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next39.1
  store double %130, double* %131, align 16
  %indvars.iv.next39.2 = add nsw i64 %indvars.iv38, 3
  %132 = trunc i64 %indvars.iv.next39.2 to i32
  %133 = sitofp i32 %132 to double
  %134 = tail call double @pow(double %133, double 0x3FF5555555555555) #8
  %135 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next39.2
  store double %134, double* %135, align 8
  %indvars.iv.next39.3 = add nsw i64 %indvars.iv38, 4
  %136 = trunc i64 %indvars.iv.next39.3 to i32
  %137 = sitofp i32 %136 to double
  %138 = tail call double @pow(double %137, double 0x3FF5555555555555) #8
  %139 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next39.3
  store double %138, double* %139, align 16
  %indvars.iv.next39.4 = add nsw i64 %indvars.iv38, 5
  %140 = trunc i64 %indvars.iv.next39.4 to i32
  %141 = sitofp i32 %140 to double
  %142 = tail call double @pow(double %141, double 0x3FF5555555555555) #8
  %143 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next39.4
  store double %142, double* %143, align 8
  %indvars.iv.next39.5 = add nsw i64 %indvars.iv38, 6
  %exitcond40.5 = icmp eq i64 %indvars.iv.next39.5, 8208
  br i1 %exitcond40.5, label %.preheader11.preheader, label %119

.preheader11.preheader:                           ; preds = %119
  %144 = load double, double* getelementptr inbounds ([8208 x double], [8208 x double]* @pow43, i64 0, i64 0), align 16
  %145 = load double, double* getelementptr inbounds ([8208 x double], [8208 x double]* @pow43, i64 0, i64 1), align 8
  %146 = fadd double %144, %145
  %147 = fmul double %146, 5.000000e-01
  %148 = tail call double @pow(double %147, double 7.500000e-01) #8
  %149 = fsub double 1.000000e+00, %148
  store double %149, double* getelementptr inbounds ([8208 x double], [8208 x double]* @adj43, i64 0, i64 0), align 16
  br label %.preheader11.1

; <label>:150:                                    ; preds = %.preheader11.1
  store double 5.000000e-01, double* getelementptr inbounds ([8208 x double], [8208 x double]* @adj43, i64 0, i64 8207), align 8
  %151 = load double, double* getelementptr inbounds ([8208 x double], [8208 x double]* @pow43, i64 0, i64 0), align 16
  %152 = load double, double* getelementptr inbounds ([8208 x double], [8208 x double]* @pow43, i64 0, i64 1), align 8
  %153 = fadd double %151, %152
  %154 = fmul double %153, 5.000000e-01
  %155 = tail call double @pow(double %154, double 7.500000e-01) #8
  br label %197

.preheader10:                                     ; preds = %.preheader10.preheader, %.preheader10
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.1, %.preheader10 ], [ 0, %.preheader10.preheader ]
  %156 = add i64 %indvars.iv30, 4294967086
  %157 = trunc i64 %156 to i32
  %158 = sitofp i32 %157 to double
  %159 = fmul double %158, -1.875000e-01
  %exp2 = tail call double @llvm.exp2.f64(double %159)
  %160 = getelementptr inbounds [256 x double], [256 x double]* @ipow20, i64 0, i64 %indvars.iv30
  store double %exp2, double* %160, align 16
  %161 = fmul double %158, 2.500000e-01
  %exp24 = tail call double @llvm.exp2.f64(double %161)
  %162 = getelementptr inbounds [256 x double], [256 x double]* @pow20, i64 0, i64 %indvars.iv30
  store double %exp24, double* %162, align 16
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %163 = add i64 %indvars.iv30, 4294967087
  %164 = trunc i64 %163 to i32
  %165 = sitofp i32 %164 to double
  %166 = fmul double %165, -1.875000e-01
  %exp2.1 = tail call double @llvm.exp2.f64(double %166)
  %167 = getelementptr inbounds [256 x double], [256 x double]* @ipow20, i64 0, i64 %indvars.iv.next31
  store double %exp2.1, double* %167, align 8
  %168 = fmul double %165, 2.500000e-01
  %exp24.1 = tail call double @llvm.exp2.f64(double %168)
  %169 = getelementptr inbounds [256 x double], [256 x double]* @pow20, i64 0, i64 %indvars.iv.next31
  store double %exp24.1, double* %169, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next31.1, 256
  br i1 %exitcond.1, label %.loopexit.loopexit, label %.preheader10

.loopexit.loopexit:                               ; preds = %.preheader10
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %3
  store i32 0, i32* @convert_mdct, align 4
  store i32 0, i32* @reduce_sidechannel, align 4
  %170 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 52
  %171 = load i32, i32* %170, align 4
  %172 = icmp eq i32 %171, 2
  br i1 %172, label %173, label %.preheader9

; <label>:173:                                    ; preds = %.loopexit
  store i32 1, i32* @convert_mdct, align 4
  store i32 1, i32* @reduce_sidechannel, align 4
  br label %.preheader9

.preheader9:                                      ; preds = %173, %.loopexit
  %174 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %175 = load i32, i32* %174, align 8
  %176 = icmp sgt i32 %175, 0
  br i1 %176, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %177 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.lr.ph, %._crit_edge17
  %indvars.iv28 = phi i64 [ 0, %.preheader8.lr.ph ], [ %indvars.iv.next29, %._crit_edge17 ]
  %178 = load i32, i32* %177, align 4
  %179 = icmp sgt i32 %178, 0
  br i1 %179, label %.lr.ph.preheader, label %._crit_edge17

.lr.ph.preheader:                                 ; preds = %.preheader8
  br label %.lr.ph

.preheader7.loopexit:                             ; preds = %._crit_edge17
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader9
  %180 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %181 = load i32, i32* %180, align 4
  %182 = icmp sgt i32 %181, 0
  br i1 %182, label %.preheader.preheader, label %._crit_edge

.preheader.preheader:                             ; preds = %.preheader7
  br label %.preheader

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %183 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv28, i32 0, i64 %indvars.iv26, i32 0, i32 6
  %184 = load i32, i32* %183, align 8
  %185 = icmp eq i32 %184, 2
  %186 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv28, i32 0, i64 %indvars.iv26, i32 0, i32 16
  %.sink6 = select i1 %185, i32 0, i32 21
  %.sink = select i1 %185, i32 0, i32 12
  store i32 %.sink6, i32* %186, align 8
  %187 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv28, i32 0, i64 %indvars.iv26, i32 0, i32 17
  store i32 %.sink, i32* %187, align 4
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %188 = load i32, i32* %177, align 4
  %189 = sext i32 %188 to i64
  %190 = icmp slt i64 %indvars.iv.next27, %189
  br i1 %190, label %.lr.ph, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %.lr.ph
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %191 = load i32, i32* %174, align 8
  %192 = sext i32 %191 to i64
  %193 = icmp slt i64 %indvars.iv.next29, %192
  br i1 %193, label %.preheader8, label %.preheader7.loopexit

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader ], [ 0, %.preheader.preheader ]
  %scevgep = getelementptr %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 3, i64 %indvars.iv, i64 0
  %scevgep25 = bitcast i32* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25, i8 0, i64 16, i32 4, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %194 = load i32, i32* %180, align 4
  %195 = sext i32 %194 to i64
  %196 = icmp slt i64 %indvars.iv.next, %195
  br i1 %196, label %.preheader, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.preheader
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader7
  ret void

; <label>:197:                                    ; preds = %252, %150
  %indvars.iv.next3348 = phi i64 [ 2, %150 ], [ %indvars.iv.next33.153, %252 ]
  %indvars.iv3247 = phi i64 [ 1, %150 ], [ %indvars.iv.next33.1.1, %252 ]
  %198 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv3247
  %199 = load double, double* %198, align 8
  %200 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next3348
  %201 = load double, double* %200, align 8
  %202 = fadd double %199, %201
  %203 = fmul double %202, 5.000000e-01
  %204 = tail call double @pow(double %203, double 7.500000e-01) #8
  %indvars.iv.next33.1 = add nuw nsw i64 %indvars.iv3247, 2
  %205 = add nuw nsw i64 %indvars.iv3247, 1
  %206 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %205
  %207 = load double, double* %206, align 8
  %208 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next33.1
  %209 = load double, double* %208, align 8
  %210 = fadd double %207, %209
  %211 = fmul double %210, 5.000000e-01
  %212 = tail call double @pow(double %211, double 7.500000e-01) #8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv3247, 3
  %exitcond = icmp eq i64 %indvars.iv.next33, 8208
  br i1 %exitcond, label %.preheader10.preheader, label %252

.preheader10.preheader:                           ; preds = %197
  br label %.preheader10

.preheader11.1:                                   ; preds = %.preheader11.preheader, %.preheader11.1
  %indvars.iv.next3650 = phi i64 [ 1, %.preheader11.preheader ], [ %indvars.iv.next36, %.preheader11.1 ]
  %indvars.iv3549 = phi i64 [ 0, %.preheader11.preheader ], [ %indvars.iv.next36.1, %.preheader11.1 ]
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv3549, 2
  %213 = trunc i64 %indvars.iv.next36.1 to i32
  %214 = sitofp i32 %213 to double
  %215 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next3650
  %216 = load double, double* %215, align 8
  %217 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next36.1
  %218 = load double, double* %217, align 16
  %219 = fadd double %216, %218
  %220 = fmul double %219, 5.000000e-01
  %221 = tail call double @pow(double %220, double 7.500000e-01) #8
  %222 = fsub double %214, %221
  %223 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %indvars.iv.next3650
  store double %222, double* %223, align 8
  %indvars.iv.next36 = or i64 %indvars.iv.next36.1, 1
  %224 = trunc i64 %indvars.iv.next36 to i32
  %225 = sitofp i32 %224 to double
  %226 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next36.1
  %227 = load double, double* %226, align 16
  %228 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next36
  %229 = load double, double* %228, align 8
  %230 = fadd double %227, %229
  %231 = fmul double %230, 5.000000e-01
  %232 = tail call double @pow(double %231, double 7.500000e-01) #8
  %233 = fsub double %225, %232
  %234 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %indvars.iv.next36.1
  store double %233, double* %234, align 16
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 8207
  br i1 %exitcond37, label %150, label %.preheader11.1

; <label>:235:                                    ; preds = %.preheader13, %235
  %indvars.iv.next4552 = phi i64 [ 1, %.preheader13 ], [ %indvars.iv.next45, %235 ]
  %indvars.iv4451 = phi i64 [ 0, %.preheader13 ], [ %indvars.iv.next45.1, %235 ]
  %236 = load i32, i32* %8, align 8
  %237 = load i32, i32* %9, align 8
  %238 = mul nsw i32 %237, 3
  %239 = add nsw i32 %238, %236
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %240, i32 0, i64 %indvars.iv.next4552
  %242 = load i32, i32* %241, align 4
  %243 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv.next4552
  store i32 %242, i32* %243, align 4
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv4451, 2
  %244 = load i32, i32* %8, align 8
  %245 = load i32, i32* %9, align 8
  %246 = mul nsw i32 %245, 3
  %247 = add nsw i32 %246, %244
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %248, i32 0, i64 %indvars.iv.next45.1
  %250 = load i32, i32* %249, align 4
  %251 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv.next45.1
  store i32 %250, i32* %251, align 4
  %indvars.iv.next45 = or i64 %indvars.iv.next45.1, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next45, 23
  br i1 %exitcond46, label %17, label %235

; <label>:252:                                    ; preds = %197
  %253 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next33.1
  %254 = load double, double* %253, align 8
  %255 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next33
  %256 = load double, double* %255, align 8
  %257 = fadd double %254, %256
  %258 = fmul double %257, 5.000000e-01
  %259 = tail call double @pow(double %258, double 7.500000e-01) #8
  %indvars.iv.next33.1.1 = add nsw i64 %indvars.iv3247, 4
  %260 = add nsw i64 %indvars.iv3247, 3
  %261 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %260
  %262 = load double, double* %261, align 8
  %263 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %indvars.iv.next33.1.1
  %264 = load double, double* %263, align 8
  %265 = fadd double %262, %264
  %266 = fmul double %265, 5.000000e-01
  %267 = tail call double @pow(double %266, double 7.500000e-01) #8
  %indvars.iv.next33.153 = add nsw i64 %indvars.iv3247, 5
  br label %197
}

; Function Attrs: noinline nounwind uwtable
define void @compute_ath(%struct.lame_global_flags* nocapture readonly, double* nocapture, double* nocapture) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  %5 = load i32, i32* %4, align 8
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+03
  br label %8

.loopexit3.loopexit:                              ; preds = %.lr.ph7
  br label %.loopexit3

.loopexit3:                                       ; preds = %.loopexit3.loopexit, %8
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 21
  br i1 %exitcond13, label %.preheader.preheader, label %8

.preheader.preheader:                             ; preds = %.loopexit3
  br label %.preheader

; <label>:8:                                      ; preds = %.loopexit3, %3
  %indvars.iv11 = phi i64 [ 0, %3 ], [ %indvars.iv.next12, %.loopexit3 ]
  %9 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv11
  %10 = load i32, i32* %9, align 4
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %11 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv.next12
  %12 = load i32, i32* %11, align 4
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv11
  store double 1.000000e+99, double* %13, align 8
  %14 = icmp slt i32 %10, %12
  br i1 %14, label %.lr.ph7.preheader, label %.loopexit3

.lr.ph7.preheader:                                ; preds = %8
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %.lr.ph7
  %.016 = phi i32 [ %22, %.lr.ph7 ], [ %10, %.lr.ph7.preheader ]
  %15 = sitofp i32 %.016 to double
  %16 = fmul double %7, %15
  %17 = fdiv double %16, 1.152000e+03
  %18 = tail call double @ATHformula(%struct.lame_global_flags* %0, double %17)
  %19 = load double, double* %13, align 8
  %20 = fcmp olt double %19, %18
  %21 = select i1 %20, double %19, double %18
  store double %21, double* %13, align 8
  %22 = add nsw i32 %.016, 1
  %exitcond10 = icmp eq i32 %22, %12
  br i1 %exitcond10, label %.loopexit3.loopexit, label %.lr.ph7

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %exitcond9 = icmp eq i64 %indvars.iv.next, 12
  br i1 %exitcond9, label %37, label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvars.iv = phi i64 [ %indvars.iv.next, %.loopexit ], [ 0, %.preheader.preheader ]
  %23 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv
  %24 = load i32, i32* %23, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv.next
  %26 = load i32, i32* %25, align 4
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double 1.000000e+99, double* %27, align 8
  %28 = icmp slt i32 %24, %26
  br i1 %28, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.124 = phi i32 [ %36, %.lr.ph ], [ %24, %.lr.ph.preheader ]
  %29 = sitofp i32 %.124 to double
  %30 = fmul double %7, %29
  %31 = fdiv double %30, 3.840000e+02
  %32 = tail call double @ATHformula(%struct.lame_global_flags* %0, double %31)
  %33 = load double, double* %27, align 8
  %34 = fcmp olt double %33, %32
  %35 = select i1 %34, double %33, double %32
  store double %35, double* %27, align 8
  %36 = add nsw i32 %.124, 1
  %exitcond = icmp eq i32 %36, %26
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph

; <label>:37:                                     ; preds = %.loopexit
  ret void
}

; Function Attrs: nounwind
declare double @pow(double, double) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define double @ATHformula(%struct.lame_global_flags* nocapture readonly, double) local_unnamed_addr #0 {
  %3 = fcmp olt double %1, 2.000000e-02
  %. = select i1 %3, double 2.000000e-02, double %1
  %4 = tail call double @pow(double %., double -8.000000e-01) #8
  %5 = fmul double %4, 3.640000e+00
  %6 = fadd double %., -3.300000e+00
  %pow2 = fmul double %6, %6
  %7 = fmul double %pow2, -6.000000e-01
  %8 = tail call double @exp(double %7) #8
  %9 = fmul double %8, 6.500000e+00
  %10 = fsub double %5, %9
  %11 = tail call double @pow(double %., double 4.000000e+00) #8
  %12 = fmul double %11, 1.000000e-03
  %13 = fadd double %10, %12
  %14 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 34
  %15 = load i32, i32* %14, align 4
  %16 = icmp eq i32 %15, 0
  %.sink = select i1 %16, double -1.140000e+02, double -2.000000e+02
  %17 = fadd double %13, %.sink
  %18 = fdiv double %17, 1.000000e+01
  %19 = tail call double @pow(double 1.000000e+01, double %18) #8
  ret double %19
}

; Function Attrs: nounwind
declare double @exp(double) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define void @ms_convert([576 x double]* nocapture, [576 x double]* nocapture readonly) local_unnamed_addr #2 {
  br label %3

; <label>:3:                                      ; preds = %3, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next.1, %3 ]
  %4 = getelementptr inbounds [576 x double], [576 x double]* %1, i64 0, i64 %indvars.iv
  %5 = load double, double* %4, align 8
  %6 = getelementptr inbounds [576 x double], [576 x double]* %1, i64 1, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = fadd double %5, %7
  %9 = fmul double %8, 0x3FE6A09E667F3BCD
  %10 = getelementptr inbounds [576 x double], [576 x double]* %0, i64 0, i64 %indvars.iv
  store double %9, double* %10, align 8
  %11 = fsub double %5, %7
  %12 = fmul double %11, 0x3FE6A09E667F3BCD
  %13 = getelementptr inbounds [576 x double], [576 x double]* %0, i64 1, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = getelementptr inbounds [576 x double], [576 x double]* %1, i64 0, i64 %indvars.iv.next
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [576 x double], [576 x double]* %1, i64 1, i64 %indvars.iv.next
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  %19 = fmul double %18, 0x3FE6A09E667F3BCD
  %20 = getelementptr inbounds [576 x double], [576 x double]* %0, i64 0, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %21 = fsub double %15, %17
  %22 = fmul double %21, 0x3FE6A09E667F3BCD
  %23 = getelementptr inbounds [576 x double], [576 x double]* %0, i64 1, i64 %indvars.iv.next
  store double %22, double* %23, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 576
  br i1 %exitcond.1, label %24, label %3

; <label>:24:                                     ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @on_pe(%struct.lame_global_flags* nocapture readonly, [2 x double]* nocapture readonly, %struct.III_side_info_t* nocapture readonly, i32* nocapture, i32, i32) local_unnamed_addr #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [2 x i32], align 4
  call void @ResvMaxBits(i32 %4, i32* nonnull %8, i32* nonnull %7, i32 %5) #8
  %10 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %11 = load i32, i32* %10, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %.lr.ph, label %53

.lr.ph:                                           ; preds = %6
  %13 = sext i32 %5 to i64
  %14 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %7, align 4
  br label %15

; <label>:15:                                     ; preds = %.lr.ph, %45
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %45 ]
  %16 = phi i32 [ %.promoted, %.lr.ph ], [ %49, %45 ]
  %17 = phi i32 [ %11, %.lr.ph ], [ %50, %45 ]
  %18 = sdiv i32 %14, %17
  %19 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv
  store i32 %18, i32* %19, align 4
  %20 = getelementptr inbounds [2 x double], [2 x double]* %1, i64 %13, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = fadd double %21, -7.500000e+02
  %23 = fdiv double %22, 1.550000e+00
  %24 = fptosi double %23 to i32
  %25 = getelementptr inbounds [2 x i32], [2 x i32]* %9, i64 0, i64 %indvars.iv
  store i32 %24, i32* %25, align 4
  %26 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 %13, i32 0, i64 %indvars.iv, i32 0, i32 6
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 2
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %15
  %30 = icmp slt i32 %24, 500
  br i1 %30, label %.sink.split, label %thread-pre-split

thread-pre-split:                                 ; preds = %29
  %.pr = load i32, i32* %25, align 4
  br label %31

; <label>:31:                                     ; preds = %thread-pre-split, %15
  %32 = phi i32 [ %.pr, %thread-pre-split ], [ %24, %15 ]
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %.sink.split, label %34

.sink.split:                                      ; preds = %29, %31
  %.sink = phi i32 [ 0, %31 ], [ 500, %29 ]
  store i32 %.sink, i32* %25, align 4
  br label %34

; <label>:34:                                     ; preds = %.sink.split, %31
  %35 = load i32, i32* %25, align 4
  %36 = icmp sgt i32 %35, %16
  br i1 %36, label %37, label %38

; <label>:37:                                     ; preds = %34
  store i32 %16, i32* %25, align 4
  br label %38

; <label>:38:                                     ; preds = %37, %34
  %39 = load i32, i32* %19, align 4
  %40 = load i32, i32* %25, align 4
  %41 = add nsw i32 %40, %39
  %42 = icmp sgt i32 %41, 4095
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %38
  %44 = sub nsw i32 4095, %39
  store i32 %44, i32* %25, align 4
  br label %45

; <label>:45:                                     ; preds = %43, %38
  %46 = load i32, i32* %19, align 4
  %47 = load i32, i32* %25, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, i32* %19, align 4
  %49 = sub nsw i32 %16, %47
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = load i32, i32* %10, align 4
  %51 = sext i32 %50 to i64
  %52 = icmp slt i64 %indvars.iv.next, %51
  br i1 %52, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %45
  store i32 %49, i32* %7, align 4
  br label %53

; <label>:53:                                     ; preds = %._crit_edge, %6
  ret void
}

declare void @ResvMaxBits(i32, i32*, i32*, i32) local_unnamed_addr #3

; Function Attrs: noinline norecurse nounwind uwtable
define void @reduce_side(i32* nocapture, double, i32) local_unnamed_addr #2 {
  %4 = fsub double 5.000000e-01, %1
  %5 = fmul double %4, 3.300000e-01
  %6 = fmul double %5, 2.000000e+00
  %7 = fptrunc double %6 to float
  %8 = fcmp olt float %7, 0.000000e+00
  %.0 = select i1 %8, float 0.000000e+00, float %7
  %9 = getelementptr inbounds i32, i32* %0, i64 1
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 124
  br i1 %11, label %12, label %31

; <label>:12:                                     ; preds = %3
  %13 = sitofp i32 %10 to float
  %14 = fmul float %.0, %13
  %15 = fsub float %13, %14
  %16 = fcmp ogt float %15, 1.250000e+02
  br i1 %16, label %17, label %27

; <label>:17:                                     ; preds = %12
  %18 = load i32, i32* %0, align 4
  %19 = sitofp i32 %18 to float
  %20 = fadd float %14, %19
  %21 = fptosi float %20 to i32
  store i32 %21, i32* %0, align 4
  %22 = load i32, i32* %9, align 4
  %23 = sitofp i32 %22 to float
  %24 = fmul float %.0, %23
  %25 = fsub float %23, %24
  %26 = fptosi float %25 to i32
  br label %.preheader.sink.split

; <label>:27:                                     ; preds = %12
  %28 = add nsw i32 %10, -125
  %29 = load i32, i32* %0, align 4
  %30 = add nsw i32 %28, %29
  store i32 %30, i32* %0, align 4
  br label %.preheader.sink.split

.preheader.sink.split:                            ; preds = %27, %17
  %.sink = phi i32 [ %26, %17 ], [ 125, %27 ]
  store i32 %.sink, i32* %9, align 4
  br label %31

; <label>:31:                                     ; preds = %3, %.preheader.sink.split
  %32 = sdiv i32 %2, 2
  %33 = add nsw i32 %32, 1200
  %34 = icmp slt i32 %33, 4095
  %35 = select i1 %34, i32 %33, i32 4095
  %36 = load i32, i32* %0, align 4
  %37 = icmp sgt i32 %36, %35
  br i1 %37, label %38, label %39

; <label>:38:                                     ; preds = %31
  store i32 %35, i32* %0, align 4
  br label %39

; <label>:39:                                     ; preds = %31, %38
  %40 = getelementptr inbounds i32, i32* %0, i64 1
  %41 = load i32, i32* %40, align 4
  %42 = icmp sgt i32 %41, %35
  br i1 %42, label %43, label %44

; <label>:43:                                     ; preds = %39
  store i32 %35, i32* %40, align 4
  br label %44

; <label>:44:                                     ; preds = %43, %39
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @inner_loop(%struct.lame_global_flags*, double*, i32*, i32, %struct.gr_info*) local_unnamed_addr #0 {
  %6 = icmp sgt i32 %3, -1
  br i1 %6, label %8, label %7

; <label>:7:                                      ; preds = %5
  tail call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 431, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @__PRETTY_FUNCTION__.inner_loop, i64 0, i64 0)) #9
  unreachable

; <label>:8:                                      ; preds = %5
  %9 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %4, i64 0, i32 3
  %10 = load i32, i32* %9, align 4
  %11 = add i32 %10, -1
  store i32 %11, i32* %9, align 4
  br label %12

; <label>:12:                                     ; preds = %12, %8
  %13 = load i32, i32* %9, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %9, align 4
  %15 = tail call i32 @count_bits(%struct.lame_global_flags* %0, i32* %2, double* %1, %struct.gr_info* nonnull %4) #8
  %16 = icmp sgt i32 %15, %3
  br i1 %16, label %12, label %17

; <label>:17:                                     ; preds = %12
  ret i32 %15
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #4

declare i32 @count_bits(%struct.lame_global_flags*, i32*, double*, %struct.gr_info*) local_unnamed_addr #3

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @scale_bitcount(%struct.III_scalefac_t* nocapture, %struct.gr_info* nocapture) local_unnamed_addr #2 {
  %3 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 6
  %4 = load i32, i32* %3, align 8
  %5 = icmp eq i32 %4, 2
  br i1 %5, label %.loopexit.loopexit58, label %.preheader23

.preheader23:                                     ; preds = %2
  %6 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 0
  %7 = load i32, i32* %6, align 4
  %8 = icmp sgt i32 %7, 0
  %..39 = select i1 %8, i32 %7, i32 0
  %9 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 1
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, %..39
  %..39.1 = select i1 %11, i32 %10, i32 %..39
  %12 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 2
  %13 = load i32, i32* %12, align 4
  %14 = icmp sgt i32 %13, %..39.1
  %..39.2 = select i1 %14, i32 %13, i32 %..39.1
  %15 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 3
  %16 = load i32, i32* %15, align 4
  %17 = icmp sgt i32 %16, %..39.2
  %..39.3 = select i1 %17, i32 %16, i32 %..39.2
  %18 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 4
  %19 = load i32, i32* %18, align 4
  %20 = icmp sgt i32 %19, %..39.3
  %..39.4 = select i1 %20, i32 %19, i32 %..39.3
  %21 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 5
  %22 = load i32, i32* %21, align 4
  %23 = icmp sgt i32 %22, %..39.4
  %..39.5 = select i1 %23, i32 %22, i32 %..39.4
  %24 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 6
  %25 = load i32, i32* %24, align 4
  %26 = icmp sgt i32 %25, %..39.5
  %..39.6 = select i1 %26, i32 %25, i32 %..39.5
  %27 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 7
  %28 = load i32, i32* %27, align 4
  %29 = icmp sgt i32 %28, %..39.6
  %..39.7 = select i1 %29, i32 %28, i32 %..39.6
  %30 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 8
  %31 = load i32, i32* %30, align 4
  %32 = icmp sgt i32 %31, %..39.7
  %..39.8 = select i1 %32, i32 %31, i32 %..39.7
  %33 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 9
  %34 = load i32, i32* %33, align 4
  %35 = icmp sgt i32 %34, %..39.8
  %..39.9 = select i1 %35, i32 %34, i32 %..39.8
  %36 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 10
  %37 = load i32, i32* %36, align 4
  %38 = icmp sgt i32 %37, %..39.9
  %..39.10 = select i1 %38, i32 %37, i32 %..39.9
  %39 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 12
  %40 = load i32, i32* %39, align 8
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %.preheader21, label %.thread

.preheader21:                                     ; preds = %.preheader23
  %42 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 11
  %43 = load i32, i32* %42, align 4
  %44 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 11), align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %.thread, label %.preheader21.168

.preheader21.168:                                 ; preds = %.preheader21
  %46 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 12
  %47 = load i32, i32* %46, align 4
  %48 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 12), align 16
  %49 = icmp slt i32 %47, %48
  br i1 %49, label %.thread, label %.preheader21.269

.thread.preheader.loopexit65:                     ; preds = %.preheader21.976
  store i32 1, i32* %39, align 8
  %50 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 11), align 4
  %51 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 11
  %52 = load i32, i32* %51, align 4
  %53 = sub nsw i32 %52, %50
  store i32 %53, i32* %51, align 4
  %54 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 12), align 16
  %55 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 12
  %56 = load i32, i32* %55, align 4
  %57 = sub nsw i32 %56, %54
  store i32 %57, i32* %55, align 4
  %58 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 13), align 4
  %59 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 13
  %60 = load i32, i32* %59, align 4
  %61 = sub nsw i32 %60, %58
  store i32 %61, i32* %59, align 4
  %62 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 14), align 8
  %63 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 14
  %64 = load i32, i32* %63, align 4
  %65 = sub nsw i32 %64, %62
  store i32 %65, i32* %63, align 4
  %66 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 15), align 4
  %67 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 15
  %68 = load i32, i32* %67, align 4
  %69 = sub nsw i32 %68, %66
  store i32 %69, i32* %67, align 4
  %70 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 16), align 16
  %71 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 16
  %72 = load i32, i32* %71, align 4
  %73 = sub nsw i32 %72, %70
  store i32 %73, i32* %71, align 4
  %74 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 17), align 4
  %75 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 17
  %76 = load i32, i32* %75, align 4
  %77 = sub nsw i32 %76, %74
  store i32 %77, i32* %75, align 4
  %78 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 18), align 8
  %79 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 18
  %80 = load i32, i32* %79, align 4
  %81 = sub nsw i32 %80, %78
  store i32 %81, i32* %79, align 4
  %82 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 19), align 4
  %83 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 19
  %84 = load i32, i32* %83, align 4
  %85 = sub nsw i32 %84, %82
  store i32 %85, i32* %83, align 4
  %86 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 20), align 16
  %87 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 20
  %88 = load i32, i32* %87, align 4
  %89 = sub nsw i32 %88, %86
  store i32 %89, i32* %87, align 4
  br label %.thread

.thread:                                          ; preds = %.preheader23, %.thread.preheader.loopexit65, %.preheader21.976, %.preheader21.875, %.preheader21.774, %.preheader21.673, %.preheader21.572, %.preheader21.471, %.preheader21.370, %.preheader21.269, %.preheader21.168, %.preheader21
  %90 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 11
  %91 = load i32, i32* %90, align 4
  %92 = icmp sgt i32 %91, 0
  %..315 = select i1 %92, i32 %91, i32 0
  %93 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 12
  %94 = load i32, i32* %93, align 4
  %95 = icmp sgt i32 %94, %..315
  %..315.1 = select i1 %95, i32 %94, i32 %..315
  %96 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 13
  %97 = load i32, i32* %96, align 4
  %98 = icmp sgt i32 %97, %..315.1
  %..315.2 = select i1 %98, i32 %97, i32 %..315.1
  %99 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 14
  %100 = load i32, i32* %99, align 4
  %101 = icmp sgt i32 %100, %..315.2
  %..315.3 = select i1 %101, i32 %100, i32 %..315.2
  %102 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 15
  %103 = load i32, i32* %102, align 4
  %104 = icmp sgt i32 %103, %..315.3
  %..315.4 = select i1 %104, i32 %103, i32 %..315.3
  %105 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 16
  %106 = load i32, i32* %105, align 4
  %107 = icmp sgt i32 %106, %..315.4
  %..315.5 = select i1 %107, i32 %106, i32 %..315.4
  %108 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 17
  %109 = load i32, i32* %108, align 4
  %110 = icmp sgt i32 %109, %..315.5
  %..315.6 = select i1 %110, i32 %109, i32 %..315.5
  %111 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 18
  %112 = load i32, i32* %111, align 4
  %113 = icmp sgt i32 %112, %..315.6
  %..315.7 = select i1 %113, i32 %112, i32 %..315.6
  %114 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 19
  %115 = load i32, i32* %114, align 4
  %116 = icmp sgt i32 %115, %..315.7
  %..315.8 = select i1 %116, i32 %115, i32 %..315.7
  %117 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 20
  %118 = load i32, i32* %117, align 4
  %119 = icmp sgt i32 %118, %..315.8
  %..315.9 = select i1 %119, i32 %118, i32 %..315.8
  br label %.loopexit

.loopexit:                                        ; preds = %.thread, %.loopexit.loopexit58
  %.517 = phi i32 [ %..113.5.2, %.loopexit.loopexit58 ], [ %..315.9, %.thread ]
  %.511 = phi i32 [ %..17.5.2, %.loopexit.loopexit58 ], [ %..39.10, %.thread ]
  %.0 = phi i32* [ getelementptr inbounds ([16 x i32], [16 x i32]* @scale_bitcount.slen1_tab, i64 0, i64 0), %.loopexit.loopexit58 ], [ getelementptr inbounds ([16 x i32], [16 x i32]* @scale_bitcount.slen2_tab, i64 0, i64 0), %.thread ]
  %120 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 15
  store i32 100000, i32* %120, align 4
  %121 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 4
  br label %122

; <label>:122:                                    ; preds = %137, %.loopexit
  %indvars.iv = phi i64 [ 0, %.loopexit ], [ %indvars.iv.next, %137 ]
  %.0126 = phi i32 [ 2, %.loopexit ], [ %.1, %137 ]
  %123 = getelementptr inbounds [16 x i32], [16 x i32]* @scale_bitcount.slen1, i64 0, i64 %indvars.iv
  %124 = load i32, i32* %123, align 4
  %125 = icmp slt i32 %.511, %124
  br i1 %125, label %126, label %137

; <label>:126:                                    ; preds = %122
  %127 = getelementptr inbounds [16 x i32], [16 x i32]* @scale_bitcount.slen2, i64 0, i64 %indvars.iv
  %128 = load i32, i32* %127, align 4
  %129 = icmp slt i32 %.517, %128
  br i1 %129, label %130, label %137

; <label>:130:                                    ; preds = %126
  %131 = load i32, i32* %120, align 4
  %132 = getelementptr inbounds i32, i32* %.0, i64 %indvars.iv
  %133 = load i32, i32* %132, align 4
  %134 = icmp sgt i32 %131, %133
  br i1 %134, label %135, label %137

; <label>:135:                                    ; preds = %130
  store i32 %133, i32* %120, align 4
  %136 = trunc i64 %indvars.iv to i32
  store i32 %136, i32* %121, align 8
  br label %137

; <label>:137:                                    ; preds = %122, %126, %130, %135
  %.1 = phi i32 [ 0, %135 ], [ %.0126, %130 ], [ %.0126, %126 ], [ %.0126, %122 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 16
  br i1 %exitcond, label %138, label %122

; <label>:138:                                    ; preds = %137
  ret i32 %.1

.loopexit.loopexit58:                             ; preds = %2
  %139 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 0, i64 0
  %140 = load i32, i32* %139, align 4
  %141 = icmp sgt i32 %140, 0
  %..17 = select i1 %141, i32 %140, i32 0
  %142 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 1, i64 0
  %143 = load i32, i32* %142, align 4
  %144 = icmp sgt i32 %143, %..17
  %..17.1 = select i1 %144, i32 %143, i32 %..17
  %145 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 2, i64 0
  %146 = load i32, i32* %145, align 4
  %147 = icmp sgt i32 %146, %..17.1
  %..17.2 = select i1 %147, i32 %146, i32 %..17.1
  %148 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 3, i64 0
  %149 = load i32, i32* %148, align 4
  %150 = icmp sgt i32 %149, %..17.2
  %..17.3 = select i1 %150, i32 %149, i32 %..17.2
  %151 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 4, i64 0
  %152 = load i32, i32* %151, align 4
  %153 = icmp sgt i32 %152, %..17.3
  %..17.4 = select i1 %153, i32 %152, i32 %..17.3
  %154 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 5, i64 0
  %155 = load i32, i32* %154, align 4
  %156 = icmp sgt i32 %155, %..17.4
  %157 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 6, i64 0
  %158 = load i32, i32* %157, align 4
  %159 = icmp sgt i32 %158, 0
  %..113 = select i1 %159, i32 %158, i32 0
  %160 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 7, i64 0
  %161 = load i32, i32* %160, align 4
  %162 = icmp sgt i32 %161, %..113
  %..113.1 = select i1 %162, i32 %161, i32 %..113
  %163 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 8, i64 0
  %164 = load i32, i32* %163, align 4
  %165 = icmp sgt i32 %164, %..113.1
  %..113.2 = select i1 %165, i32 %164, i32 %..113.1
  %166 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 9, i64 0
  %167 = load i32, i32* %166, align 4
  %168 = icmp sgt i32 %167, %..113.2
  %..113.3 = select i1 %168, i32 %167, i32 %..113.2
  %169 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 10, i64 0
  %170 = load i32, i32* %169, align 4
  %171 = icmp sgt i32 %170, %..113.3
  %..113.4 = select i1 %171, i32 %170, i32 %..113.3
  %172 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 11, i64 0
  %173 = load i32, i32* %172, align 4
  %174 = icmp sgt i32 %173, %..113.4
  %..113.5 = select i1 %174, i32 %173, i32 %..113.4
  %..17.5 = select i1 %156, i32 %155, i32 %..17.4
  %175 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 0, i64 1
  %176 = load i32, i32* %175, align 4
  %177 = icmp sgt i32 %176, %..17.5
  %..17.152 = select i1 %177, i32 %176, i32 %..17.5
  %178 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 1, i64 1
  %179 = load i32, i32* %178, align 4
  %180 = icmp sgt i32 %179, %..17.152
  %..17.1.1 = select i1 %180, i32 %179, i32 %..17.152
  %181 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 2, i64 1
  %182 = load i32, i32* %181, align 4
  %183 = icmp sgt i32 %182, %..17.1.1
  %..17.2.1 = select i1 %183, i32 %182, i32 %..17.1.1
  %184 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 3, i64 1
  %185 = load i32, i32* %184, align 4
  %186 = icmp sgt i32 %185, %..17.2.1
  %..17.3.1 = select i1 %186, i32 %185, i32 %..17.2.1
  %187 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 4, i64 1
  %188 = load i32, i32* %187, align 4
  %189 = icmp sgt i32 %188, %..17.3.1
  %..17.4.1 = select i1 %189, i32 %188, i32 %..17.3.1
  %190 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 5, i64 1
  %191 = load i32, i32* %190, align 4
  %192 = icmp sgt i32 %191, %..17.4.1
  %193 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 6, i64 1
  %194 = load i32, i32* %193, align 4
  %195 = icmp sgt i32 %194, %..113.5
  %..113.153 = select i1 %195, i32 %194, i32 %..113.5
  %196 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 7, i64 1
  %197 = load i32, i32* %196, align 4
  %198 = icmp sgt i32 %197, %..113.153
  %..113.1.1 = select i1 %198, i32 %197, i32 %..113.153
  %199 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 8, i64 1
  %200 = load i32, i32* %199, align 4
  %201 = icmp sgt i32 %200, %..113.1.1
  %..113.2.1 = select i1 %201, i32 %200, i32 %..113.1.1
  %202 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 9, i64 1
  %203 = load i32, i32* %202, align 4
  %204 = icmp sgt i32 %203, %..113.2.1
  %..113.3.1 = select i1 %204, i32 %203, i32 %..113.2.1
  %205 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 10, i64 1
  %206 = load i32, i32* %205, align 4
  %207 = icmp sgt i32 %206, %..113.3.1
  %..113.4.1 = select i1 %207, i32 %206, i32 %..113.3.1
  %208 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 11, i64 1
  %209 = load i32, i32* %208, align 4
  %210 = icmp sgt i32 %209, %..113.4.1
  %..113.5.1 = select i1 %210, i32 %209, i32 %..113.4.1
  %..17.5.1 = select i1 %192, i32 %191, i32 %..17.4.1
  %211 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 0, i64 2
  %212 = load i32, i32* %211, align 4
  %213 = icmp sgt i32 %212, %..17.5.1
  %..17.254 = select i1 %213, i32 %212, i32 %..17.5.1
  %214 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 1, i64 2
  %215 = load i32, i32* %214, align 4
  %216 = icmp sgt i32 %215, %..17.254
  %..17.1.2 = select i1 %216, i32 %215, i32 %..17.254
  %217 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 2, i64 2
  %218 = load i32, i32* %217, align 4
  %219 = icmp sgt i32 %218, %..17.1.2
  %..17.2.2 = select i1 %219, i32 %218, i32 %..17.1.2
  %220 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 3, i64 2
  %221 = load i32, i32* %220, align 4
  %222 = icmp sgt i32 %221, %..17.2.2
  %..17.3.2 = select i1 %222, i32 %221, i32 %..17.2.2
  %223 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 4, i64 2
  %224 = load i32, i32* %223, align 4
  %225 = icmp sgt i32 %224, %..17.3.2
  %..17.4.2 = select i1 %225, i32 %224, i32 %..17.3.2
  %226 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 5, i64 2
  %227 = load i32, i32* %226, align 4
  %228 = icmp sgt i32 %227, %..17.4.2
  %229 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 6, i64 2
  %230 = load i32, i32* %229, align 4
  %231 = icmp sgt i32 %230, %..113.5.1
  %..113.255 = select i1 %231, i32 %230, i32 %..113.5.1
  %232 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 7, i64 2
  %233 = load i32, i32* %232, align 4
  %234 = icmp sgt i32 %233, %..113.255
  %..113.1.2 = select i1 %234, i32 %233, i32 %..113.255
  %235 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 8, i64 2
  %236 = load i32, i32* %235, align 4
  %237 = icmp sgt i32 %236, %..113.1.2
  %..113.2.2 = select i1 %237, i32 %236, i32 %..113.1.2
  %238 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 9, i64 2
  %239 = load i32, i32* %238, align 4
  %240 = icmp sgt i32 %239, %..113.2.2
  %..113.3.2 = select i1 %240, i32 %239, i32 %..113.2.2
  %241 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 10, i64 2
  %242 = load i32, i32* %241, align 4
  %243 = icmp sgt i32 %242, %..113.3.2
  %..113.4.2 = select i1 %243, i32 %242, i32 %..113.3.2
  %244 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 11, i64 2
  %245 = load i32, i32* %244, align 4
  %246 = icmp sgt i32 %245, %..113.4.2
  %..113.5.2 = select i1 %246, i32 %245, i32 %..113.4.2
  %..17.5.2 = select i1 %228, i32 %227, i32 %..17.4.2
  br label %.loopexit

.preheader21.269:                                 ; preds = %.preheader21.168
  %247 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 13
  %248 = load i32, i32* %247, align 4
  %249 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 13), align 4
  %250 = icmp slt i32 %248, %249
  br i1 %250, label %.thread, label %.preheader21.370

.preheader21.370:                                 ; preds = %.preheader21.269
  %251 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 14
  %252 = load i32, i32* %251, align 4
  %253 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 14), align 8
  %254 = icmp slt i32 %252, %253
  br i1 %254, label %.thread, label %.preheader21.471

.preheader21.471:                                 ; preds = %.preheader21.370
  %255 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 15
  %256 = load i32, i32* %255, align 4
  %257 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 15), align 4
  %258 = icmp slt i32 %256, %257
  br i1 %258, label %.thread, label %.preheader21.572

.preheader21.572:                                 ; preds = %.preheader21.471
  %259 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 16
  %260 = load i32, i32* %259, align 4
  %261 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 16), align 16
  %262 = icmp slt i32 %260, %261
  br i1 %262, label %.thread, label %.preheader21.673

.preheader21.673:                                 ; preds = %.preheader21.572
  %263 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 17
  %264 = load i32, i32* %263, align 4
  %265 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 17), align 4
  %266 = icmp slt i32 %264, %265
  br i1 %266, label %.thread, label %.preheader21.774

.preheader21.774:                                 ; preds = %.preheader21.673
  %267 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 18
  %268 = load i32, i32* %267, align 4
  %269 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 18), align 8
  %270 = icmp slt i32 %268, %269
  br i1 %270, label %.thread, label %.preheader21.875

.preheader21.875:                                 ; preds = %.preheader21.774
  %271 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 19
  %272 = load i32, i32* %271, align 4
  %273 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 19), align 4
  %274 = icmp slt i32 %272, %273
  br i1 %274, label %.thread, label %.preheader21.976

.preheader21.976:                                 ; preds = %.preheader21.875
  %275 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 20
  %276 = load i32, i32* %275, align 4
  %277 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 20), align 16
  %278 = icmp slt i32 %276, %277
  br i1 %278, label %.thread, label %.thread.preheader.loopexit65
}

; Function Attrs: noinline nounwind uwtable
define i32 @scale_bitcount_lsf(%struct.III_scalefac_t* nocapture readonly, %struct.gr_info* nocapture) local_unnamed_addr #0 {
  %3 = alloca [4 x i32], align 16
  %4 = bitcast [4 x i32]* %3 to i8*
  %5 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 12
  %6 = load i32, i32* %5, align 8
  call void @llvm.memset.p0i8.i64(i8* nonnull %4, i8 0, i64 16, i32 16, i1 false)
  %7 = icmp eq i32 %6, 0
  %8 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 6
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 2
  %11 = select i1 %7, i64 0, i64 2
  br i1 %10, label %.preheader16, label %.preheader18.preheader

.preheader18.preheader:                           ; preds = %2
  br label %.preheader18

.preheader16:                                     ; preds = %2
  %12 = getelementptr inbounds [6 x [3 x [4 x i32]]], [6 x [3 x [4 x i32]]]* @nr_of_sfb_block, i64 0, i64 %11, i64 1, i64 0
  %13 = load i32, i32* %12, align 16
  %14 = udiv i32 %13, 3
  %15 = icmp ugt i32 %13, 2
  br i1 %15, label %.preheader.lr.ph, label %.preheader16.149

.preheader.lr.ph:                                 ; preds = %.preheader16
  %16 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 0
  %.promoted27 = load i32, i32* %16, align 16
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next, %17 ]
  %.lcssa28 = phi i32 [ %.promoted27, %.preheader.lr.ph ], [ %..2, %17 ]
  %.11125 = phi i32 [ 0, %.preheader.lr.ph ], [ %27, %17 ]
  %18 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv, i64 0
  %19 = load i32, i32* %18, align 4
  %20 = icmp sgt i32 %19, %.lcssa28
  %. = select i1 %20, i32 %19, i32 %.lcssa28
  %21 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv, i64 1
  %22 = load i32, i32* %21, align 4
  %23 = icmp sgt i32 %22, %.
  %..1 = select i1 %23, i32 %22, i32 %.
  %24 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv, i64 2
  %25 = load i32, i32* %24, align 4
  %26 = icmp sgt i32 %25, %..1
  %..2 = select i1 %26, i32 %25, i32 %..1
  %27 = add nuw nsw i32 %.11125, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %28 = icmp slt i32 %27, %14
  br i1 %28, label %17, label %._crit_edge

._crit_edge:                                      ; preds = %17
  %29 = trunc i64 %indvars.iv.next to i32
  store i32 %..2, i32* %16, align 16
  br label %.preheader16.149

.preheader16.149:                                 ; preds = %._crit_edge, %.preheader16
  %.1.lcssa = phi i32 [ %29, %._crit_edge ], [ 0, %.preheader16 ]
  %30 = getelementptr inbounds [6 x [3 x [4 x i32]]], [6 x [3 x [4 x i32]]]* @nr_of_sfb_block, i64 0, i64 %11, i64 1, i64 1
  %31 = load i32, i32* %30, align 4
  %32 = udiv i32 %31, 3
  %33 = icmp ugt i32 %31, 2
  br i1 %33, label %.preheader.lr.ph.1, label %.preheader16.250

.preheader18:                                     ; preds = %.preheader18.preheader, %61
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %61 ], [ 0, %.preheader18.preheader ]
  %.238 = phi i32 [ %.3.lcssa, %61 ], [ 0, %.preheader18.preheader ]
  %34 = getelementptr inbounds [6 x [3 x [4 x i32]]], [6 x [3 x [4 x i32]]]* @nr_of_sfb_block, i64 0, i64 %11, i64 0, i64 %indvars.iv55
  %35 = load i32, i32* %34, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %.lr.ph, label %61

.lr.ph:                                           ; preds = %.preheader18
  %37 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 %indvars.iv55
  %.promoted = load i32, i32* %37, align 4
  %38 = sext i32 %.238 to i64
  %39 = add i32 %35, -1
  %xtraiter = and i32 %35, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next54.prol, %.prol.preheader ], [ %38, %.prol.preheader.preheader ]
  %40 = phi i32 [ %.40.prol, %.prol.preheader ], [ %.promoted, %.prol.preheader.preheader ]
  %.21231.prol = phi i32 [ %44, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %41 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 %indvars.iv53.prol
  %42 = load i32, i32* %41, align 4
  %43 = icmp sgt i32 %42, %40
  %.40.prol = select i1 %43, i32 %42, i32 %40
  %44 = add nuw nsw i32 %.21231.prol, 1
  %indvars.iv.next54.prol = add nsw i64 %indvars.iv53.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv53.unr = phi i64 [ %38, %.lr.ph ], [ %indvars.iv.next54.prol, %.prol.loopexit.loopexit ]
  %.unr = phi i32 [ %.promoted, %.lr.ph ], [ %.40.prol, %.prol.loopexit.loopexit ]
  %.21231.unr = phi i32 [ 0, %.lr.ph ], [ %44, %.prol.loopexit.loopexit ]
  %.40.lcssa.unr = phi i32 [ undef, %.lr.ph ], [ %.40.prol, %.prol.loopexit.loopexit ]
  %45 = icmp ult i32 %39, 3
  br i1 %45, label %._crit_edge34, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.3, %.lr.ph.new ], [ %indvars.iv53.unr, %.lr.ph.new.preheader ]
  %46 = phi i32 [ %.40.3, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %.21231 = phi i32 [ %59, %.lr.ph.new ], [ %.21231.unr, %.lr.ph.new.preheader ]
  %47 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 %indvars.iv53
  %48 = load i32, i32* %47, align 4
  %49 = icmp sgt i32 %48, %46
  %.40 = select i1 %49, i32 %48, i32 %46
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, 1
  %50 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 %indvars.iv.next54
  %51 = load i32, i32* %50, align 4
  %52 = icmp sgt i32 %51, %.40
  %.40.1 = select i1 %52, i32 %51, i32 %.40
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %53 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 %indvars.iv.next54.1
  %54 = load i32, i32* %53, align 4
  %55 = icmp sgt i32 %54, %.40.1
  %.40.2 = select i1 %55, i32 %54, i32 %.40.1
  %indvars.iv.next54.2 = add nsw i64 %indvars.iv53, 3
  %56 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 %indvars.iv.next54.2
  %57 = load i32, i32* %56, align 4
  %58 = icmp sgt i32 %57, %.40.2
  %.40.3 = select i1 %58, i32 %57, i32 %.40.2
  %59 = add nsw i32 %.21231, 4
  %indvars.iv.next54.3 = add nsw i64 %indvars.iv53, 4
  %exitcond.3 = icmp eq i32 %59, %35
  br i1 %exitcond.3, label %._crit_edge34.loopexit, label %.lr.ph.new

._crit_edge34.loopexit:                           ; preds = %.lr.ph.new
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %.prol.loopexit
  %.40.lcssa = phi i32 [ %.40.lcssa.unr, %.prol.loopexit ], [ %.40.3, %._crit_edge34.loopexit ]
  %60 = add i32 %.238, %35
  store i32 %.40.lcssa, i32* %37, align 4
  br label %61

; <label>:61:                                     ; preds = %._crit_edge34, %.preheader18
  %.3.lcssa = phi i32 [ %60, %._crit_edge34 ], [ %.238, %.preheader18 ]
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond = icmp eq i64 %indvars.iv.next56, 4
  br i1 %exitcond, label %.loopexit17.loopexit, label %.preheader18

.loopexit17.loopexit:                             ; preds = %61
  br label %.loopexit17

.loopexit17:                                      ; preds = %.loopexit17.loopexit, %.preheader16.351, %._crit_edge.3
  %.02 = phi i64 [ 1, %._crit_edge.3 ], [ 1, %.preheader16.351 ], [ 0, %.loopexit17.loopexit ]
  %62 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 0
  %63 = load i32, i32* %62, align 16
  %64 = getelementptr inbounds [6 x [4 x i32]], [6 x [4 x i32]]* @max_range_sfac_tab, i64 0, i64 %11, i64 0
  %65 = load i32, i32* %64, align 16
  %66 = icmp sgt i32 %63, %65
  %67 = zext i1 %66 to i32
  %68 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 1
  %69 = load i32, i32* %68, align 4
  %70 = getelementptr inbounds [6 x [4 x i32]], [6 x [4 x i32]]* @max_range_sfac_tab, i64 0, i64 %11, i64 1
  %71 = load i32, i32* %70, align 4
  %72 = icmp sgt i32 %69, %71
  %73 = zext i1 %72 to i32
  %..08.1 = add nuw nsw i32 %73, %67
  %74 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 2
  %75 = load i32, i32* %74, align 8
  %76 = getelementptr inbounds [6 x [4 x i32]], [6 x [4 x i32]]* @max_range_sfac_tab, i64 0, i64 %11, i64 2
  %77 = load i32, i32* %76, align 8
  %78 = icmp sgt i32 %75, %77
  %79 = zext i1 %78 to i32
  %..08.2 = add nuw nsw i32 %79, %..08.1
  %80 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 3
  %81 = load i32, i32* %80, align 4
  %82 = getelementptr inbounds [6 x [4 x i32]], [6 x [4 x i32]]* @max_range_sfac_tab, i64 0, i64 %11, i64 3
  %83 = load i32, i32* %82, align 4
  %84 = icmp sgt i32 %81, %83
  %85 = zext i1 %84 to i32
  %..08.3 = add nuw nsw i32 %85, %..08.2
  %cond = icmp eq i32 %..08.3, 0
  br i1 %cond, label %86, label %.loopexit

; <label>:86:                                     ; preds = %.loopexit17
  %87 = getelementptr inbounds [6 x [3 x [4 x i32]]], [6 x [3 x [4 x i32]]]* @nr_of_sfb_block, i64 0, i64 %11, i64 %.02, i64 0
  %88 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 19
  store i32* %87, i32** %88, align 8
  %89 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 0
  %90 = load i32, i32* %89, align 16
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [16 x i32], [16 x i32]* @scale_bitcount_lsf.log2tab, i64 0, i64 %91
  %93 = load i32, i32* %92, align 4
  %94 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 0
  store i32 %93, i32* %94, align 4
  %95 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 1
  %96 = load i32, i32* %95, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [16 x i32], [16 x i32]* @scale_bitcount_lsf.log2tab, i64 0, i64 %97
  %99 = load i32, i32* %98, align 4
  %100 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 1
  store i32 %99, i32* %100, align 4
  %101 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 2
  %102 = load i32, i32* %101, align 8
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [16 x i32], [16 x i32]* @scale_bitcount_lsf.log2tab, i64 0, i64 %103
  %105 = load i32, i32* %104, align 4
  %106 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 2
  store i32 %105, i32* %106, align 4
  %107 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 3
  %108 = load i32, i32* %107, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [16 x i32], [16 x i32]* @scale_bitcount_lsf.log2tab, i64 0, i64 %109
  %111 = load i32, i32* %110, align 4
  %112 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 3
  store i32 %111, i32* %112, align 4
  %113 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 0
  %114 = load i32, i32* %113, align 8
  %115 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 1
  %116 = load i32, i32* %115, align 4
  br i1 %7, label %117, label %126

; <label>:117:                                    ; preds = %86
  %118 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 2
  %119 = load i32, i32* %118, align 8
  %120 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 3
  %121 = load i32, i32* %120, align 4
  %122 = mul i32 %114, 5
  %123 = add i32 %122, %116
  %124 = shl i32 %123, 4
  %125 = shl i32 %119, 2
  br label %128

; <label>:126:                                    ; preds = %86
  %127 = mul i32 %114, 3
  br label %128

; <label>:128:                                    ; preds = %117, %126
  %.sink41 = phi i32 [ %124, %117 ], [ 500, %126 ]
  %.sink = phi i32 [ %125, %117 ], [ %127, %126 ]
  %.sink15 = phi i32 [ %121, %117 ], [ %116, %126 ]
  %129 = add i32 %.sink, %.sink41
  %130 = add i32 %129, %.sink15
  %131 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 4
  store i32 %130, i32* %131, align 8
  %132 = load i32*, i32** %88, align 8
  %133 = icmp eq i32* %132, null
  br i1 %133, label %134, label %.loopexit.loopexit44

; <label>:134:                                    ; preds = %128
  tail call void @__assert_fail(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 665, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__PRETTY_FUNCTION__.scale_bitcount_lsf, i64 0, i64 0)) #9
  unreachable

.loopexit.loopexit44:                             ; preds = %128
  %135 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 15
  store i32 0, i32* %135, align 4
  %136 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 0
  %137 = load i32, i32* %136, align 4
  %138 = load i32*, i32** %88, align 8
  %139 = load i32, i32* %138, align 4
  %140 = mul i32 %139, %137
  store i32 %140, i32* %135, align 4
  %141 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 1
  %142 = load i32, i32* %141, align 4
  %143 = getelementptr inbounds i32, i32* %138, i64 1
  %144 = load i32, i32* %143, align 4
  %145 = mul i32 %144, %142
  %146 = add i32 %140, %145
  store i32 %146, i32* %135, align 4
  %147 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 2
  %148 = load i32, i32* %147, align 4
  %149 = load i32*, i32** %88, align 8
  %150 = getelementptr inbounds i32, i32* %149, i64 2
  %151 = load i32, i32* %150, align 4
  %152 = mul i32 %151, %148
  %153 = load i32, i32* %135, align 4
  %154 = add i32 %153, %152
  store i32 %154, i32* %135, align 4
  %155 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 20, i64 3
  %156 = load i32, i32* %155, align 4
  %157 = load i32*, i32** %88, align 8
  %158 = getelementptr inbounds i32, i32* %157, i64 3
  %159 = load i32, i32* %158, align 4
  %160 = mul i32 %159, %156
  %161 = load i32, i32* %135, align 4
  %162 = add i32 %161, %160
  store i32 %162, i32* %135, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit44, %.loopexit17
  ret i32 %..08.3

.preheader.lr.ph.1:                               ; preds = %.preheader16.149
  %163 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 1
  %.promoted27.1 = load i32, i32* %163, align 4
  %164 = sext i32 %.1.lcssa to i64
  br label %165

; <label>:165:                                    ; preds = %.preheader.lr.ph.1, %165
  %indvars.iv.1 = phi i64 [ %164, %.preheader.lr.ph.1 ], [ %indvars.iv.next.1, %165 ]
  %.lcssa28.1 = phi i32 [ %.promoted27.1, %.preheader.lr.ph.1 ], [ %..2.1, %165 ]
  %.11125.1 = phi i32 [ 0, %.preheader.lr.ph.1 ], [ %175, %165 ]
  %166 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv.1, i64 0
  %167 = load i32, i32* %166, align 4
  %168 = icmp sgt i32 %167, %.lcssa28.1
  %..147 = select i1 %168, i32 %167, i32 %.lcssa28.1
  %169 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv.1, i64 1
  %170 = load i32, i32* %169, align 4
  %171 = icmp sgt i32 %170, %..147
  %..1.1 = select i1 %171, i32 %170, i32 %..147
  %172 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv.1, i64 2
  %173 = load i32, i32* %172, align 4
  %174 = icmp sgt i32 %173, %..1.1
  %..2.1 = select i1 %174, i32 %173, i32 %..1.1
  %175 = add nuw nsw i32 %.11125.1, 1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv.1, 1
  %176 = icmp slt i32 %175, %32
  br i1 %176, label %165, label %._crit_edge.1

._crit_edge.1:                                    ; preds = %165
  %177 = trunc i64 %indvars.iv.next.1 to i32
  store i32 %..2.1, i32* %163, align 4
  br label %.preheader16.250

.preheader16.250:                                 ; preds = %._crit_edge.1, %.preheader16.149
  %.1.lcssa.1 = phi i32 [ %177, %._crit_edge.1 ], [ %.1.lcssa, %.preheader16.149 ]
  %178 = getelementptr inbounds [6 x [3 x [4 x i32]]], [6 x [3 x [4 x i32]]]* @nr_of_sfb_block, i64 0, i64 %11, i64 1, i64 2
  %179 = load i32, i32* %178, align 8
  %180 = udiv i32 %179, 3
  %181 = icmp ugt i32 %179, 2
  br i1 %181, label %.preheader.lr.ph.2, label %.preheader16.351

.preheader.lr.ph.2:                               ; preds = %.preheader16.250
  %182 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 2
  %.promoted27.2 = load i32, i32* %182, align 8
  %183 = sext i32 %.1.lcssa.1 to i64
  br label %184

; <label>:184:                                    ; preds = %.preheader.lr.ph.2, %184
  %indvars.iv.2 = phi i64 [ %183, %.preheader.lr.ph.2 ], [ %indvars.iv.next.2, %184 ]
  %.lcssa28.2 = phi i32 [ %.promoted27.2, %.preheader.lr.ph.2 ], [ %..2.2, %184 ]
  %.11125.2 = phi i32 [ 0, %.preheader.lr.ph.2 ], [ %194, %184 ]
  %185 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv.2, i64 0
  %186 = load i32, i32* %185, align 4
  %187 = icmp sgt i32 %186, %.lcssa28.2
  %..248 = select i1 %187, i32 %186, i32 %.lcssa28.2
  %188 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv.2, i64 1
  %189 = load i32, i32* %188, align 4
  %190 = icmp sgt i32 %189, %..248
  %..1.2 = select i1 %190, i32 %189, i32 %..248
  %191 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv.2, i64 2
  %192 = load i32, i32* %191, align 4
  %193 = icmp sgt i32 %192, %..1.2
  %..2.2 = select i1 %193, i32 %192, i32 %..1.2
  %194 = add nuw nsw i32 %.11125.2, 1
  %indvars.iv.next.2 = add nsw i64 %indvars.iv.2, 1
  %195 = icmp slt i32 %194, %180
  br i1 %195, label %184, label %._crit_edge.2

._crit_edge.2:                                    ; preds = %184
  %196 = trunc i64 %indvars.iv.next.2 to i32
  store i32 %..2.2, i32* %182, align 8
  br label %.preheader16.351

.preheader16.351:                                 ; preds = %._crit_edge.2, %.preheader16.250
  %.1.lcssa.2 = phi i32 [ %196, %._crit_edge.2 ], [ %.1.lcssa.1, %.preheader16.250 ]
  %197 = getelementptr inbounds [6 x [3 x [4 x i32]]], [6 x [3 x [4 x i32]]]* @nr_of_sfb_block, i64 0, i64 %11, i64 1, i64 3
  %198 = load i32, i32* %197, align 4
  %199 = udiv i32 %198, 3
  %200 = icmp ugt i32 %198, 2
  br i1 %200, label %.preheader.lr.ph.3, label %.loopexit17

.preheader.lr.ph.3:                               ; preds = %.preheader16.351
  %201 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 3
  %.promoted27.3 = load i32, i32* %201, align 4
  %202 = sext i32 %.1.lcssa.2 to i64
  br label %203

; <label>:203:                                    ; preds = %.preheader.lr.ph.3, %203
  %indvars.iv.3 = phi i64 [ %202, %.preheader.lr.ph.3 ], [ %indvars.iv.next.3, %203 ]
  %.lcssa28.3 = phi i32 [ %.promoted27.3, %.preheader.lr.ph.3 ], [ %..2.3, %203 ]
  %.11125.3 = phi i32 [ 0, %.preheader.lr.ph.3 ], [ %213, %203 ]
  %204 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv.3, i64 0
  %205 = load i32, i32* %204, align 4
  %206 = icmp sgt i32 %205, %.lcssa28.3
  %..3 = select i1 %206, i32 %205, i32 %.lcssa28.3
  %207 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv.3, i64 1
  %208 = load i32, i32* %207, align 4
  %209 = icmp sgt i32 %208, %..3
  %..1.3 = select i1 %209, i32 %208, i32 %..3
  %210 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv.3, i64 2
  %211 = load i32, i32* %210, align 4
  %212 = icmp sgt i32 %211, %..1.3
  %..2.3 = select i1 %212, i32 %211, i32 %..1.3
  %213 = add nuw nsw i32 %.11125.3, 1
  %indvars.iv.next.3 = add nsw i64 %indvars.iv.3, 1
  %214 = icmp slt i32 %213, %199
  br i1 %214, label %203, label %._crit_edge.3

._crit_edge.3:                                    ; preds = %203
  store i32 %..2.3, i32* %201, align 4
  br label %.loopexit17
}

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @calc_xmin(%struct.lame_global_flags* nocapture readonly, double* nocapture readonly, %struct.III_psy_ratio* nocapture readonly, %struct.gr_info* nocapture readonly, %struct.III_psy_xmin* nocapture) local_unnamed_addr #2 {
  %6 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 33
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 0
  %9 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %3, i64 0, i32 17
  %10 = load i32, i32* %9, align 4
  %11 = icmp ult i32 %10, 12
  br i1 %8, label %.preheader15, label %.preheader19

.preheader19:                                     ; preds = %5
  br i1 %11, label %.preheader18.preheader, label %.preheader16

.preheader18.preheader:                           ; preds = %.preheader19
  %12 = zext i32 %10 to i64
  %xtraiter67 = and i32 %10, 1
  %lcmp.mod68 = icmp eq i32 %xtraiter67, 0
  br i1 %lcmp.mod68, label %.preheader18.prol.loopexit, label %13

; <label>:13:                                     ; preds = %.preheader18.preheader
  %14 = getelementptr inbounds [21 x double], [21 x double]* @ATH_s, i64 0, i64 %12
  %15 = bitcast double* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %12, i64 0
  %18 = bitcast double* %17 to i64*
  store i64 %16, i64* %18, align 8
  %19 = load i64, i64* %15, align 8
  %20 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %12, i64 1
  %21 = bitcast double* %20 to i64*
  store i64 %19, i64* %21, align 8
  %22 = load i64, i64* %15, align 8
  %23 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %12, i64 2
  %24 = bitcast double* %23 to i64*
  store i64 %22, i64* %24, align 8
  %indvars.iv.next65.prol = add nuw nsw i64 %12, 1
  br label %.preheader18.prol.loopexit

.preheader18.prol.loopexit:                       ; preds = %.preheader18.preheader, %13
  %indvars.iv64.unr = phi i64 [ %12, %.preheader18.preheader ], [ %indvars.iv.next65.prol, %13 ]
  %25 = icmp eq i32 %10, 11
  br i1 %25, label %.preheader16, label %.preheader72.preheader

.preheader72.preheader:                           ; preds = %.preheader18.prol.loopexit
  br label %.preheader72

.preheader15:                                     ; preds = %5
  br i1 %11, label %.lr.ph36, label %.preheader

.lr.ph36:                                         ; preds = %.preheader15
  %26 = load float, float* @masking_lower, align 4
  %27 = fpext float %26 to double
  %28 = zext i32 %10 to i64
  br label %46

.preheader16.loopexit:                            ; preds = %.preheader72
  br label %.preheader16

.preheader16:                                     ; preds = %.preheader16.loopexit, %.preheader18.prol.loopexit, %.preheader19
  %29 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %3, i64 0, i32 16
  %30 = load i32, i32* %29, align 8
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %.loopexit, label %.lr.ph39.preheader

.lr.ph39.preheader:                               ; preds = %.preheader16
  br label %.lr.ph39

.lr.ph39:                                         ; preds = %.lr.ph39.preheader, %.lr.ph39
  %.1438 = phi i32 [ %38, %.lr.ph39 ], [ 0, %.lr.ph39.preheader ]
  %32 = zext i32 %.1438 to i64
  %33 = getelementptr inbounds [21 x double], [21 x double]* @ATH_l, i64 0, i64 %32
  %34 = bitcast double* %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 0, i64 %32
  %37 = bitcast double* %36 to i64*
  store i64 %35, i64* %37, align 8
  %38 = add i32 %.1438, 1
  %39 = load i32, i32* %29, align 8
  %40 = icmp ult i32 %38, %39
  br i1 %40, label %.lr.ph39, label %.loopexit.loopexit78

.loopexit14.loopexit:                             ; preds = %89
  br label %.loopexit14

.loopexit14:                                      ; preds = %.loopexit14.loopexit, %.loopexit14.loopexit4249
  %.16.lcssa = phi i32 [ %.27.2, %.loopexit14.loopexit4249 ], [ %.27.us, %.loopexit14.loopexit ]
  %exitcond60 = icmp eq i64 %indvars.iv.next59, 12
  br i1 %exitcond60, label %.preheader.loopexit, label %46

.preheader.loopexit:                              ; preds = %.loopexit14
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader15
  %.05.lcssa = phi i32 [ 0, %.preheader15 ], [ %.16.lcssa, %.preheader.loopexit ]
  %41 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %3, i64 0, i32 16
  %42 = load i32, i32* %41, align 8
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %.loopexit, label %.lr.ph24

.lr.ph24:                                         ; preds = %.preheader
  %44 = load float, float* @masking_lower, align 4
  %45 = fpext float %44 to double
  br label %147

; <label>:46:                                     ; preds = %.loopexit14, %.lr.ph36
  %indvars.iv58 = phi i64 [ %28, %.lr.ph36 ], [ %indvars.iv.next59, %.loopexit14 ]
  %.0534 = phi i32 [ 0, %.lr.ph36 ], [ %.16.lcssa, %.loopexit14 ]
  %47 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv58
  %48 = load i32, i32* %47, align 4
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %49 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv.next59
  %50 = load i32, i32* %49, align 4
  %51 = sub nsw i32 %50, %48
  %52 = icmp sgt i32 %50, %48
  %53 = sitofp i32 %51 to double
  %54 = getelementptr inbounds [21 x double], [21 x double]* @ATH_s, i64 0, i64 %indvars.iv58
  br i1 %52, label %.preheader13.us.preheader, label %.preheader13

.preheader13.us.preheader:                        ; preds = %46
  %55 = sext i32 %48 to i64
  %56 = sub i32 %50, %48
  %57 = add i32 %50, -1
  %xtraiter53 = and i32 %56, 1
  %lcmp.mod54 = icmp eq i32 %xtraiter53, 0
  %58 = icmp eq i32 %57, %48
  %wide.trip.count52.1 = sext i32 %50 to i64
  %59 = mul nsw i64 %55, 3
  %indvars.iv.next51.prol = add nsw i64 %55, 1
  %60 = add nsw i64 %wide.trip.count52.1, -2
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %89, %.preheader13.us.preheader
  %indvars.iv56 = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next57, %89 ]
  %.1633.us = phi i32 [ %.0534, %.preheader13.us.preheader ], [ %.27.us, %89 ]
  br i1 %lcmp.mod54, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader13.us
  %61 = add nsw i64 %59, %indvars.iv56
  %62 = getelementptr inbounds double, double* %1, i64 %61
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %63
  %65 = fadd double %64, 0.000000e+00
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader13.us
  %indvars.iv50.unr.ph = phi i64 [ %indvars.iv.next51.prol, %.prol.preheader ], [ %55, %.preheader13.us ]
  %.0127.us.unr.ph = phi double [ %65, %.prol.preheader ], [ 0.000000e+00, %.preheader13.us ]
  %.lcssa44.unr.ph = phi double [ %65, %.prol.preheader ], [ undef, %.preheader13.us ]
  br i1 %58, label %._crit_edge29.us, label %.preheader13.us.new.preheader

.preheader13.us.new.preheader:                    ; preds = %.prol.loopexit
  %66 = sub nsw i64 %60, %indvars.iv50.unr.ph
  %67 = lshr i64 %66, 1
  %68 = and i64 %67, 1
  %lcmp.mod82 = icmp eq i64 %68, 0
  br i1 %lcmp.mod82, label %.preheader13.us.new.prol.preheader, label %.preheader13.us.new.prol.loopexit.unr-lcssa

.preheader13.us.new.prol.preheader:               ; preds = %.preheader13.us.new.preheader
  br label %.preheader13.us.new.prol

.preheader13.us.new.prol:                         ; preds = %.preheader13.us.new.prol.preheader
  %69 = mul nsw i64 %indvars.iv50.unr.ph, 3
  %70 = add nsw i64 %69, %indvars.iv56
  %71 = getelementptr inbounds double, double* %1, i64 %70
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %72
  %74 = fadd double %.0127.us.unr.ph, %73
  %75 = mul nsw i64 %indvars.iv50.unr.ph, 3
  %76 = add i64 %75, 3
  %77 = add nsw i64 %76, %indvars.iv56
  %78 = getelementptr inbounds double, double* %1, i64 %77
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %79
  %81 = fadd double %74, %80
  %indvars.iv.next51.1.prol = add nsw i64 %indvars.iv50.unr.ph, 2
  br label %.preheader13.us.new.prol.loopexit.unr-lcssa

.preheader13.us.new.prol.loopexit.unr-lcssa:      ; preds = %.preheader13.us.new.preheader, %.preheader13.us.new.prol
  %.lcssa80.unr.ph = phi double [ %81, %.preheader13.us.new.prol ], [ undef, %.preheader13.us.new.preheader ]
  %indvars.iv50.unr.ph83 = phi i64 [ %indvars.iv.next51.1.prol, %.preheader13.us.new.prol ], [ %indvars.iv50.unr.ph, %.preheader13.us.new.preheader ]
  %.0127.us.unr.ph84 = phi double [ %81, %.preheader13.us.new.prol ], [ %.0127.us.unr.ph, %.preheader13.us.new.preheader ]
  br label %.preheader13.us.new.prol.loopexit

.preheader13.us.new.prol.loopexit:                ; preds = %.preheader13.us.new.prol.loopexit.unr-lcssa
  %82 = icmp eq i64 %67, 0
  br i1 %82, label %._crit_edge29.us.loopexit, label %.preheader13.us.new.preheader.new

.preheader13.us.new.preheader.new:                ; preds = %.preheader13.us.new.prol.loopexit
  br label %.preheader13.us.new

; <label>:83:                                     ; preds = %._crit_edge29.us
  %84 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %2, i64 0, i32 0, i32 1, i64 %indvars.iv58, i64 %indvars.iv56
  %85 = load double, double* %84, align 8
  %86 = fmul double %123, %85
  %87 = fmul double %86, %27
  %88 = fdiv double %87, %125
  br label %89

; <label>:89:                                     ; preds = %83, %._crit_edge29.us
  %.0.us = phi double [ %88, %83 ], [ %125, %._crit_edge29.us ]
  %90 = load double, double* %54, align 8
  %91 = fcmp ogt double %90, %.0.us
  %92 = select i1 %91, double %90, double %.0.us
  %93 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %indvars.iv58, i64 %indvars.iv56
  store double %92, double* %93, align 8
  %94 = load double, double* %54, align 8
  %95 = fcmp ogt double %123, %94
  %96 = zext i1 %95 to i32
  %.27.us = add nsw i32 %96, %.1633.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, 3
  br i1 %exitcond, label %.loopexit14.loopexit, label %.preheader13.us

.preheader13.us.new:                              ; preds = %.preheader13.us.new, %.preheader13.us.new.preheader.new
  %indvars.iv50 = phi i64 [ %indvars.iv50.unr.ph83, %.preheader13.us.new.preheader.new ], [ %indvars.iv.next51.1.1, %.preheader13.us.new ]
  %.0127.us = phi double [ %.0127.us.unr.ph84, %.preheader13.us.new.preheader.new ], [ %122, %.preheader13.us.new ]
  %97 = mul nsw i64 %indvars.iv50, 3
  %98 = add nsw i64 %97, %indvars.iv56
  %99 = getelementptr inbounds double, double* %1, i64 %98
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, %100
  %102 = fadd double %.0127.us, %101
  %103 = mul i64 %indvars.iv50, 3
  %104 = add i64 %103, 3
  %105 = add nsw i64 %104, %indvars.iv56
  %106 = getelementptr inbounds double, double* %1, i64 %105
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, %107
  %109 = fadd double %102, %108
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %110 = mul nsw i64 %indvars.iv.next51.1, 3
  %111 = add nsw i64 %110, %indvars.iv56
  %112 = getelementptr inbounds double, double* %1, i64 %111
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, %113
  %115 = fadd double %109, %114
  %116 = mul i64 %indvars.iv.next51.1, 3
  %117 = add i64 %116, 3
  %118 = add nsw i64 %117, %indvars.iv56
  %119 = getelementptr inbounds double, double* %1, i64 %118
  %120 = load double, double* %119, align 8
  %121 = fmul double %120, %120
  %122 = fadd double %115, %121
  %indvars.iv.next51.1.1 = add nsw i64 %indvars.iv50, 4
  %exitcond.1.1 = icmp eq i64 %indvars.iv.next51.1.1, %wide.trip.count52.1
  br i1 %exitcond.1.1, label %._crit_edge29.us.loopexit.unr-lcssa, label %.preheader13.us.new

._crit_edge29.us.loopexit.unr-lcssa:              ; preds = %.preheader13.us.new
  br label %._crit_edge29.us.loopexit

._crit_edge29.us.loopexit:                        ; preds = %.preheader13.us.new.prol.loopexit, %._crit_edge29.us.loopexit.unr-lcssa
  %.lcssa80 = phi double [ %.lcssa80.unr.ph, %.preheader13.us.new.prol.loopexit ], [ %122, %._crit_edge29.us.loopexit.unr-lcssa ]
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit, %.prol.loopexit
  %.lcssa44 = phi double [ %.lcssa44.unr.ph, %.prol.loopexit ], [ %.lcssa80, %._crit_edge29.us.loopexit ]
  %123 = fdiv double %.lcssa44, %53
  %124 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %2, i64 0, i32 1, i32 1, i64 %indvars.iv58, i64 %indvars.iv56
  %125 = load double, double* %124, align 8
  %126 = fcmp ogt double %125, 0.000000e+00
  br i1 %126, label %83, label %89

.preheader13:                                     ; preds = %46
  %127 = fdiv double 0.000000e+00, %53
  %128 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %2, i64 0, i32 1, i32 1, i64 %indvars.iv58, i64 0
  %129 = load double, double* %128, align 8
  %130 = fcmp ogt double %129, 0.000000e+00
  br i1 %130, label %131, label %.preheader13.147

; <label>:131:                                    ; preds = %.preheader13
  %132 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %2, i64 0, i32 0, i32 1, i64 %indvars.iv58, i64 0
  %133 = load double, double* %132, align 8
  %134 = fmul double %127, %133
  %135 = fmul double %134, %27
  %136 = fdiv double %135, %129
  br label %.preheader13.147

.preheader13.147:                                 ; preds = %131, %.preheader13
  %.0 = phi double [ %136, %131 ], [ %129, %.preheader13 ]
  %137 = load double, double* %54, align 8
  %138 = fcmp ogt double %137, %.0
  %139 = select i1 %138, double %137, double %.0
  %140 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %indvars.iv58, i64 0
  store double %139, double* %140, align 8
  %141 = load double, double* %54, align 8
  %142 = fcmp ogt double %127, %141
  %143 = zext i1 %142 to i32
  %.27 = add nsw i32 %143, %.0534
  %144 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %2, i64 0, i32 1, i32 1, i64 %indvars.iv58, i64 1
  %145 = load double, double* %144, align 8
  %146 = fcmp ogt double %145, 0.000000e+00
  br i1 %146, label %204, label %.preheader13.248

; <label>:147:                                    ; preds = %.lr.ph24, %193
  %.323 = phi i32 [ 0, %.lr.ph24 ], [ %151, %193 ]
  %.3822 = phi i32 [ %.05.lcssa, %.lr.ph24 ], [ %.4, %193 ]
  %148 = zext i32 %.323 to i64
  %149 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %148
  %150 = load i32, i32* %149, align 4
  %151 = add i32 %.323, 1
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %152
  %154 = load i32, i32* %153, align 4
  %155 = sub nsw i32 %154, %150
  %156 = icmp sgt i32 %154, %150
  br i1 %156, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %147
  %157 = sext i32 %150 to i64
  %158 = sub i32 %154, %150
  %159 = add i32 %154, -1
  %160 = sub i32 %159, %150
  %xtraiter = and i32 %158, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ %157, %.lr.ph.prol.preheader ]
  %.1221.prol = phi double [ %164, %.lr.ph.prol ], [ 0.000000e+00, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %161 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  %162 = load double, double* %161, align 8
  %163 = fmul double %162, %162
  %164 = fadd double %.1221.prol, %163
  %indvars.iv.next.prol = add nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv.unr = phi i64 [ %157, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.1221.unr = phi double [ 0.000000e+00, %.lr.ph.preheader ], [ %164, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %164, %.lr.ph.prol.loopexit.loopexit ]
  %165 = icmp ult i32 %160, 3
  br i1 %165, label %._crit_edge, label %.lr.ph.preheader70

.lr.ph.preheader70:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.3 = sext i32 %154 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader70, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.preheader70 ]
  %.1221 = phi double [ %181, %.lr.ph ], [ %.1221.unr, %.lr.ph.preheader70 ]
  %166 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %167 = load double, double* %166, align 8
  %168 = fmul double %167, %167
  %169 = fadd double %.1221, %168
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %170 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %171 = load double, double* %170, align 8
  %172 = fmul double %171, %171
  %173 = fadd double %169, %172
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %174 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %175 = load double, double* %174, align 8
  %176 = fmul double %175, %175
  %177 = fadd double %173, %176
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %178 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  %179 = load double, double* %178, align 8
  %180 = fmul double %179, %179
  %181 = fadd double %177, %180
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %147
  %.12.lcssa = phi double [ 0.000000e+00, %147 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %181, %._crit_edge.loopexit ]
  %182 = sitofp i32 %155 to double
  %183 = fdiv double %.12.lcssa, %182
  %184 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %2, i64 0, i32 1, i32 0, i64 %148
  %185 = load double, double* %184, align 8
  %186 = fcmp ogt double %185, 0.000000e+00
  br i1 %186, label %187, label %193

; <label>:187:                                    ; preds = %._crit_edge
  %188 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %2, i64 0, i32 0, i32 0, i64 %148
  %189 = load double, double* %188, align 8
  %190 = fmul double %183, %189
  %191 = fmul double %190, %45
  %192 = fdiv double %191, %185
  br label %193

; <label>:193:                                    ; preds = %187, %._crit_edge
  %.1 = phi double [ %192, %187 ], [ %185, %._crit_edge ]
  %194 = getelementptr inbounds [21 x double], [21 x double]* @ATH_l, i64 0, i64 %148
  %195 = load double, double* %194, align 8
  %196 = fcmp ogt double %195, %.1
  %197 = select i1 %196, double %195, double %.1
  %198 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 0, i64 %148
  store double %197, double* %198, align 8
  %199 = load double, double* %194, align 8
  %200 = fcmp ogt double %183, %199
  %201 = zext i1 %200 to i32
  %.4 = add nsw i32 %201, %.3822
  %202 = load i32, i32* %41, align 8
  %203 = icmp ult i32 %151, %202
  br i1 %203, label %147, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %193
  br label %.loopexit

.loopexit.loopexit78:                             ; preds = %.lr.ph39
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit78, %.loopexit.loopexit, %.preheader, %.preheader16
  %.5 = phi i32 [ %.05.lcssa, %.preheader ], [ 0, %.preheader16 ], [ %.4, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit78 ]
  ret i32 %.5

; <label>:204:                                    ; preds = %.preheader13.147
  %205 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %2, i64 0, i32 0, i32 1, i64 %indvars.iv58, i64 1
  %206 = load double, double* %205, align 8
  %207 = fmul double %127, %206
  %208 = fmul double %207, %27
  %209 = fdiv double %208, %145
  br label %.preheader13.248

.preheader13.248:                                 ; preds = %204, %.preheader13.147
  %.0.1 = phi double [ %209, %204 ], [ %145, %.preheader13.147 ]
  %210 = load double, double* %54, align 8
  %211 = fcmp ogt double %210, %.0.1
  %212 = select i1 %211, double %210, double %.0.1
  %213 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %indvars.iv58, i64 1
  store double %212, double* %213, align 8
  %214 = load double, double* %54, align 8
  %215 = fcmp ogt double %127, %214
  %216 = zext i1 %215 to i32
  %.27.1 = add nsw i32 %216, %.27
  %217 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %2, i64 0, i32 1, i32 1, i64 %indvars.iv58, i64 2
  %218 = load double, double* %217, align 8
  %219 = fcmp ogt double %218, 0.000000e+00
  br i1 %219, label %220, label %.loopexit14.loopexit4249

; <label>:220:                                    ; preds = %.preheader13.248
  %221 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %2, i64 0, i32 0, i32 1, i64 %indvars.iv58, i64 2
  %222 = load double, double* %221, align 8
  %223 = fmul double %127, %222
  %224 = fmul double %223, %27
  %225 = fdiv double %224, %218
  br label %.loopexit14.loopexit4249

.loopexit14.loopexit4249:                         ; preds = %220, %.preheader13.248
  %.0.2 = phi double [ %225, %220 ], [ %218, %.preheader13.248 ]
  %226 = load double, double* %54, align 8
  %227 = fcmp ogt double %226, %.0.2
  %228 = select i1 %227, double %226, double %.0.2
  %229 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %indvars.iv58, i64 2
  store double %228, double* %229, align 8
  %230 = load double, double* %54, align 8
  %231 = fcmp ogt double %127, %230
  %232 = zext i1 %231 to i32
  %.27.2 = add nsw i32 %232, %.27.1
  br label %.loopexit14

.preheader72:                                     ; preds = %.preheader72.preheader, %.preheader72
  %indvars.iv64 = phi i64 [ %indvars.iv.next65.1, %.preheader72 ], [ %indvars.iv64.unr, %.preheader72.preheader ]
  %233 = getelementptr inbounds [21 x double], [21 x double]* @ATH_s, i64 0, i64 %indvars.iv64
  %234 = bitcast double* %233 to i64*
  %235 = load i64, i64* %234, align 8
  %236 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %indvars.iv64, i64 0
  %237 = bitcast double* %236 to i64*
  store i64 %235, i64* %237, align 8
  %238 = load i64, i64* %234, align 8
  %239 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %indvars.iv64, i64 1
  %240 = bitcast double* %239 to i64*
  store i64 %238, i64* %240, align 8
  %241 = load i64, i64* %234, align 8
  %242 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %indvars.iv64, i64 2
  %243 = bitcast double* %242 to i64*
  store i64 %241, i64* %243, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %244 = getelementptr inbounds [21 x double], [21 x double]* @ATH_s, i64 0, i64 %indvars.iv.next65
  %245 = bitcast double* %244 to i64*
  %246 = load i64, i64* %245, align 8
  %247 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %indvars.iv.next65, i64 0
  %248 = bitcast double* %247 to i64*
  store i64 %246, i64* %248, align 8
  %249 = load i64, i64* %245, align 8
  %250 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %indvars.iv.next65, i64 1
  %251 = bitcast double* %250 to i64*
  store i64 %249, i64* %251, align 8
  %252 = load i64, i64* %245, align 8
  %253 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %4, i64 0, i32 1, i64 %indvars.iv.next65, i64 2
  %254 = bitcast double* %253 to i64*
  store i64 %252, i64* %254, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %exitcond66.1 = icmp eq i64 %indvars.iv.next65.1, 12
  br i1 %exitcond66.1, label %.preheader16.loopexit, label %.preheader72
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @loop_break(%struct.III_scalefac_t* nocapture readonly, %struct.gr_info* nocapture readonly) local_unnamed_addr #5 {
  %3 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 16
  %4 = load i32, i32* %3, align 8
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

; <label>:6:                                      ; preds = %.lr.ph
  %7 = load i32, i32* %3, align 8
  %8 = icmp ult i32 %13, %7
  br i1 %8, label %.lr.ph, label %._crit_edge.loopexit

.lr.ph:                                           ; preds = %.lr.ph.preheader, %6
  %.017 = phi i32 [ %13, %6 ], [ 0, %.lr.ph.preheader ]
  %9 = zext i32 %.017 to i64
  %10 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 0, i64 %9
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 0
  %13 = add i32 %.017, 1
  br i1 %12, label %.loopexit.loopexit12, label %6

._crit_edge.loopexit:                             ; preds = %6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %14 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 17
  %15 = load i32, i32* %14, align 4
  %16 = icmp ult i32 %15, 12
  br i1 %16, label %.preheader.preheader, label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge
  %17 = zext i32 %15 to i64
  br label %22

; <label>:18:                                     ; preds = %22
  %19 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv, i64 1
  %20 = load i32, i32* %19, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %.loopexit.loopexit, label %26

; <label>:22:                                     ; preds = %30, %.preheader.preheader
  %indvars.iv = phi i64 [ %17, %.preheader.preheader ], [ %indvars.iv.next, %30 ]
  %23 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv, i64 0
  %24 = load i32, i32* %23, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %.loopexit.loopexit, label %18

.loopexit.loopexit:                               ; preds = %26, %18, %22, %30
  %.0.ph = phi i32 [ 1, %30 ], [ 0, %22 ], [ 0, %18 ], [ 0, %26 ]
  br label %.loopexit

.loopexit.loopexit12:                             ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit12, %.loopexit.loopexit, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ %.0.ph, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit12 ]
  ret i32 %.0

; <label>:26:                                     ; preds = %18
  %27 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %0, i64 0, i32 1, i64 %indvars.iv, i64 2
  %28 = load i32, i32* %27, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %.loopexit.loopexit, label %30

; <label>:30:                                     ; preds = %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = icmp ult i64 %indvars.iv.next, 12
  br i1 %31, label %22, label %.loopexit.loopexit
}

; Function Attrs: noinline nounwind uwtable
define i32 @bin_search_StepSize2(%struct.lame_global_flags*, i32, i32, i32*, double*, %struct.gr_info*) local_unnamed_addr #0 {
  %7 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %5, i64 0, i32 3
  store i32 %2, i32* %7, align 4
  %8 = tail call i32 @count_bits(%struct.lame_global_flags* %0, i32* %3, double* %4, %struct.gr_info* %5) #8
  %9 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.backedge
  %11 = phi i32 [ %28, %.backedge ], [ %9, %.lr.ph.preheader ]
  %12 = phi i32 [ %27, %.backedge ], [ %8, %.lr.ph.preheader ]
  %.09 = phi i32 [ %.0.be, %.backedge ], [ 0, %.lr.ph.preheader ]
  %.018 = phi i32 [ %.01.be, %.backedge ], [ %2, %.lr.ph.preheader ]
  %.037 = phi i32 [ %.03.be, %.backedge ], [ 0, %.lr.ph.preheader ]
  %13 = icmp eq i32 %.037, 0
  br i1 %13, label %16, label %14

; <label>:14:                                     ; preds = %.lr.ph
  %15 = sdiv i32 %11, 2
  store i32 %15, i32* @bin_search_StepSize2.CurrentStep, align 4
  br label %16

; <label>:16:                                     ; preds = %.lr.ph, %14
  %17 = icmp sgt i32 %12, %1
  br i1 %17, label %18, label %30

; <label>:18:                                     ; preds = %16
  %19 = icmp eq i32 %.09, 2
  %or.cond = and i1 %13, %19
  br i1 %or.cond, label %20, label %23

; <label>:20:                                     ; preds = %18
  %21 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %22 = sdiv i32 %21, 2
  store i32 %22, i32* @bin_search_StepSize2.CurrentStep, align 4
  br label %23

; <label>:23:                                     ; preds = %20, %18
  %.14 = phi i32 [ 1, %20 ], [ %.037, %18 ]
  %24 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %25 = add nsw i32 %24, %.018
  %26 = icmp sgt i32 %25, 255
  br i1 %26, label %._crit_edge.loopexit, label %.backedge

.backedge:                                        ; preds = %23, %37
  %.03.be = phi i32 [ %.14, %23 ], [ %.25, %37 ]
  %.01.be = phi i32 [ %25, %23 ], [ %39, %37 ]
  %.0.be = phi i32 [ 1, %23 ], [ 2, %37 ]
  store i32 %.01.be, i32* %7, align 4
  %27 = tail call i32 @count_bits(%struct.lame_global_flags* %0, i32* %3, double* %4, %struct.gr_info* %5) #8
  %28 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %._crit_edge.loopexit, label %.lr.ph

; <label>:30:                                     ; preds = %16
  %31 = icmp slt i32 %12, %1
  br i1 %31, label %32, label %._crit_edge.loopexit

; <label>:32:                                     ; preds = %30
  %33 = icmp eq i32 %.09, 1
  %or.cond6 = and i1 %13, %33
  br i1 %or.cond6, label %34, label %37

; <label>:34:                                     ; preds = %32
  %35 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %36 = sdiv i32 %35, 2
  store i32 %36, i32* @bin_search_StepSize2.CurrentStep, align 4
  br label %37

; <label>:37:                                     ; preds = %34, %32
  %.25 = phi i32 [ 1, %34 ], [ %.037, %32 ]
  %38 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %39 = sub nsw i32 %.018, %38
  %40 = icmp slt i32 %39, 0
  br i1 %40, label %._crit_edge.loopexit, label %.backedge

._crit_edge.loopexit:                             ; preds = %30, %37, %23, %.backedge
  %.lcssa.ph = phi i32 [ %12, %30 ], [ %12, %37 ], [ %12, %23 ], [ %27, %.backedge ]
  %.2.ph = phi i32 [ %.018, %30 ], [ %39, %37 ], [ %25, %23 ], [ %.01.be, %.backedge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  %.lcssa = phi i32 [ %8, %6 ], [ %.lcssa.ph, %._crit_edge.loopexit ]
  %.2 = phi i32 [ %2, %6 ], [ %.2.ph, %._crit_edge.loopexit ]
  %41 = sub nsw i32 %2, %.2
  %ispos = icmp sgt i32 %41, -1
  %neg = sub i32 0, %41
  %42 = select i1 %ispos, i32 %41, i32 %neg
  %43 = icmp sgt i32 %42, 3
  %. = select i1 %43, i32 4, i32 2
  store i32 %., i32* @bin_search_StepSize2.CurrentStep, align 4
  ret i32 %.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @quantize_xrpow(double* nocapture readonly, i32* nocapture, %struct.gr_info* nocapture readonly) local_unnamed_addr #2 {
  %4 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 3
  %5 = load i32, i32* %4, align 4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds [256 x double], [256 x double]* @ipow20, i64 0, i64 %6
  %8 = load double, double* %7, align 8
  br label %9

; <label>:9:                                      ; preds = %3, %9
  %.05 = phi double* [ %0, %3 ], [ %49, %9 ]
  %.014 = phi i32* [ %1, %3 ], [ %48, %9 ]
  %.023 = phi i32 [ 144, %3 ], [ %50, %9 ]
  %10 = getelementptr inbounds double, double* %.05, i64 1
  %11 = load double, double* %.05, align 8
  %12 = fmul double %8, %11
  %13 = fptosi double %12 to i32
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %14
  %16 = load double, double* %15, align 8
  %17 = fadd double %12, %16
  %18 = fptosi double %17 to i32
  %19 = getelementptr inbounds i32, i32* %.014, i64 1
  store i32 %18, i32* %.014, align 4
  %20 = getelementptr inbounds double, double* %.05, i64 2
  %21 = load double, double* %10, align 8
  %22 = fmul double %8, %21
  %23 = fptosi double %22 to i32
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %24
  %26 = load double, double* %25, align 8
  %27 = fadd double %22, %26
  %28 = fptosi double %27 to i32
  %29 = getelementptr inbounds i32, i32* %.014, i64 2
  store i32 %28, i32* %19, align 4
  %30 = getelementptr inbounds double, double* %.05, i64 3
  %31 = load double, double* %20, align 8
  %32 = fmul double %8, %31
  %33 = fptosi double %32 to i32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %34
  %36 = load double, double* %35, align 8
  %37 = fadd double %32, %36
  %38 = fptosi double %37 to i32
  %39 = getelementptr inbounds i32, i32* %.014, i64 3
  store i32 %38, i32* %29, align 4
  %40 = load double, double* %30, align 8
  %41 = fmul double %8, %40
  %42 = fptosi double %41 to i32
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %43
  %45 = load double, double* %44, align 8
  %46 = fadd double %41, %45
  %47 = fptosi double %46 to i32
  store i32 %47, i32* %39, align 4
  %48 = getelementptr inbounds i32, i32* %.014, i64 4
  %49 = getelementptr inbounds double, double* %.05, i64 4
  %50 = add nsw i32 %.023, -1
  %51 = icmp sgt i32 %.023, 1
  br i1 %51, label %9, label %52

; <label>:52:                                     ; preds = %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @quantize_xrpow_ISO(double* nocapture readonly, i32* nocapture, %struct.gr_info* nocapture readonly) local_unnamed_addr #2 {
  %4 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 3
  %5 = load i32, i32* %4, align 4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds [256 x double], [256 x double]* @ipow20, i64 0, i64 %6
  %8 = load double, double* %7, align 8
  %9 = fdiv double 5.946000e-01, %8
  br label %10

; <label>:10:                                     ; preds = %10, %3
  %.06 = phi double* [ %0, %3 ], [ %.1.2, %10 ]
  %.015 = phi i32* [ %1, %3 ], [ %.12.2, %10 ]
  %.034 = phi i32 [ 576, %3 ], [ %27, %10 ]
  %11 = load double, double* %.06, align 8
  %12 = fcmp ogt double %9, %11
  %13 = fmul double %8, %11
  %14 = fadd double %13, 4.054000e-01
  %15 = fptosi double %14 to i32
  %storemerge = select i1 %12, i32 0, i32 %15
  store i32 %storemerge, i32* %.015, align 4
  %.1 = getelementptr inbounds double, double* %.06, i64 1
  %.12 = getelementptr inbounds i32, i32* %.015, i64 1
  %16 = load double, double* %.1, align 8
  %17 = fcmp ogt double %9, %16
  %18 = fmul double %8, %16
  %19 = fadd double %18, 4.054000e-01
  %20 = fptosi double %19 to i32
  %storemerge.1 = select i1 %17, i32 0, i32 %20
  store i32 %storemerge.1, i32* %.12, align 4
  %.1.1 = getelementptr inbounds double, double* %.06, i64 2
  %.12.1 = getelementptr inbounds i32, i32* %.015, i64 2
  %21 = add nsw i32 %.034, -2
  %22 = load double, double* %.1.1, align 8
  %23 = fcmp ogt double %9, %22
  %24 = fmul double %8, %22
  %25 = fadd double %24, 4.054000e-01
  %26 = fptosi double %25 to i32
  %storemerge.2 = select i1 %23, i32 0, i32 %26
  store i32 %storemerge.2, i32* %.12.1, align 4
  %.1.2 = getelementptr inbounds double, double* %.06, i64 3
  %.12.2 = getelementptr inbounds i32, i32* %.015, i64 3
  %27 = add nsw i32 %.034, -3
  %28 = icmp sgt i32 %21, 1
  br i1 %28, label %10, label %29

; <label>:29:                                     ; preds = %10
  ret void
}

; Function Attrs: nounwind readnone
declare double @llvm.exp2.f64(double) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #7

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { argmemonly nounwind }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
