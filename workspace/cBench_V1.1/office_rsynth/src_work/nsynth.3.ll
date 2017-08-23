; ModuleID = 'nsynth.2.ll'
source_filename = "nsynth.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.resonator_t = type { i8*, float, float, float, float, float }
%struct.klatt_global_t = type { i32, i32, i32, i32, i64, i64, i64, i64 }
%struct.klatt_frame_t = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [63 x i8] c"$Id: nsynth.c,v 1.13 1994/11/08 13:30:50 a904209 Exp a904209 $\00", align 1
@nsynth_id = global i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str, i32 0, i32 0), align 8
@time_count = global i32 0, align 4
@.str.1 = private unnamed_addr constant [7 x i8] c"F0hz10\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"AVdb\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"F1hz\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"B1hz\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"F2hz\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"B2hz\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"F3hz\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"B3hz\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"F4hz\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"B4hz\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"F5hz\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"B5hz\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"F6hz\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"B6hz\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"FNZhz\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"BNZhz\00", align 1
@.str.17 = private unnamed_addr constant [6 x i8] c"FNPhz\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"BNPhz\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"AP\00", align 1
@.str.20 = private unnamed_addr constant [6 x i8] c"Kopen\00", align 1
@.str.21 = private unnamed_addr constant [6 x i8] c"Aturb\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"TLTdb\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"AF\00", align 1
@.str.24 = private unnamed_addr constant [6 x i8] c"Kskew\00", align 1
@.str.25 = private unnamed_addr constant [3 x i8] c"A1\00", align 1
@.str.26 = private unnamed_addr constant [6 x i8] c"B1phz\00", align 1
@.str.27 = private unnamed_addr constant [3 x i8] c"A2\00", align 1
@.str.28 = private unnamed_addr constant [6 x i8] c"B2phz\00", align 1
@.str.29 = private unnamed_addr constant [3 x i8] c"A3\00", align 1
@.str.30 = private unnamed_addr constant [6 x i8] c"B3phz\00", align 1
@.str.31 = private unnamed_addr constant [3 x i8] c"A4\00", align 1
@.str.32 = private unnamed_addr constant [6 x i8] c"B4phz\00", align 1
@.str.33 = private unnamed_addr constant [3 x i8] c"A5\00", align 1
@.str.34 = private unnamed_addr constant [6 x i8] c"B5phz\00", align 1
@.str.35 = private unnamed_addr constant [3 x i8] c"A6\00", align 1
@.str.36 = private unnamed_addr constant [6 x i8] c"B6phz\00", align 1
@.str.37 = private unnamed_addr constant [4 x i8] c"ANP\00", align 1
@.str.38 = private unnamed_addr constant [3 x i8] c"AB\00", align 1
@.str.39 = private unnamed_addr constant [6 x i8] c"AVpdb\00", align 1
@.str.40 = private unnamed_addr constant [6 x i8] c"Gain0\00", align 1
@par_name = global [40 x i8*] [i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.39, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.40, i32 0, i32 0)], align 16
@show_parms.names = internal global i32 0, align 4
@.str.41 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str.42 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.43 = private unnamed_addr constant [5 x i8] c"%*d \00", align 1
@parwave.seed = internal global i64 5, align 8
@nlast = internal global float 0.000000e+00, align 4
@nper = internal global i64 0, align 8
@nmod = internal global i64 0, align 8
@amp_frica = internal global float 0.000000e+00, align 4
@T0 = internal global i64 0, align 8
@rlp = internal global %struct.resonator_t { i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.49, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@onemd = internal global float 0.000000e+00, align 4
@vlast = internal global float 0.000000e+00, align 4
@decay = internal global float 0.000000e+00, align 4
@nopen = internal global i64 0, align 8
@amp_breth = internal global float 0.000000e+00, align 4
@amp_voice = internal global float 0.000000e+00, align 4
@amp_aspir = internal global float 0.000000e+00, align 4
@rnz = internal global %struct.resonator_t { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.50, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@rnpc = internal global %struct.resonator_t { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.51, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r8c = internal global %struct.resonator_t { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.52, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r7c = internal global %struct.resonator_t { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.53, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r6c = internal global %struct.resonator_t { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.54, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r5c = internal global %struct.resonator_t { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.55, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r4c = internal global %struct.resonator_t { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.56, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r3c = internal global %struct.resonator_t { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.57, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r2c = internal global %struct.resonator_t { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.58, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r1c = internal global %struct.resonator_t { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.59, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r1p = internal global %struct.resonator_t { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.60, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@glotlast = internal global float 0.000000e+00, align 4
@r6p = internal global %struct.resonator_t { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.61, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r5p = internal global %struct.resonator_t { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.62, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r4p = internal global %struct.resonator_t { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.63, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r3p = internal global %struct.resonator_t { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.64, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@r2p = internal global %struct.resonator_t { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.65, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@amp_bypas = internal global float 0.000000e+00, align 4
@rout = internal global %struct.resonator_t { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.66, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@minus_pi_t = internal global float 0.000000e+00, align 4
@two_pi_t = internal global float 0.000000e+00, align 4
@rnpp = internal global %struct.resonator_t { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.69, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@rgl = internal global %struct.resonator_t { i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.70, i32 0, i32 0), float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 }, align 8
@warnsw = internal global i32 0, align 4
@F0hz10 = internal global i64 0, align 8
@AVdb = internal global i64 0, align 8
@Kskew = internal global i64 0, align 8
@par_amp_voice = internal global float 0.000000e+00, align 4
@.str.44 = private unnamed_addr constant [30 x i8] c"Try to compute amptable[%ld]\0A\00", align 1
@amptable = internal constant [88 x float] [float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 6.000000e+00, float 7.000000e+00, float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01, float 1.300000e+01, float 1.400000e+01, float 1.600000e+01, float 1.800000e+01, float 2.000000e+01, float 2.200000e+01, float 2.500000e+01, float 2.800000e+01, float 3.200000e+01, float 3.500000e+01, float 4.000000e+01, float 4.500000e+01, float 5.100000e+01, float 5.700000e+01, float 6.400000e+01, float 7.100000e+01, float 8.000000e+01, float 9.000000e+01, float 1.010000e+02, float 1.140000e+02, float 1.280000e+02, float 1.420000e+02, float 1.590000e+02, float 1.790000e+02, float 2.020000e+02, float 2.270000e+02, float 2.560000e+02, float 2.840000e+02, float 3.180000e+02, float 3.590000e+02, float 4.050000e+02, float 4.550000e+02, float 5.120000e+02, float 5.680000e+02, float 6.380000e+02, float 7.190000e+02, float 8.110000e+02, float 9.110000e+02, float 1.024000e+03, float 1.137000e+03, float 1.276000e+03, float 1.438000e+03, float 1.622000e+03, float 1.823000e+03, float 2.048000e+03, float 2.273000e+03, float 2.552000e+03, float 2.875000e+03, float 3.244000e+03, float 3.645000e+03, float 4.096000e+03, float 4.547000e+03, float 5.104000e+03, float 5.751000e+03, float 6.488000e+03, float 7.291000e+03, float 8.192000e+03, float 9.093000e+03, float 1.020700e+04, float 1.150200e+04, float 1.297600e+04, float 1.458200e+04, float 1.638400e+04, float 1.835000e+04, float 2.064400e+04, float 2.342900e+04, float 2.621400e+04, float 2.949100e+04, float 3.276700e+04], align 16
@impulsive_source.doublet = internal global [3 x float] [float 0.000000e+00, float 1.300000e+07, float -1.300000e+07], align 4
@vwave = internal global float 0.000000e+00, align 4
@natglot_b = internal global float 0.000000e+00, align 4
@natglot_a = internal global float 0.000000e+00, align 4
@.str.45 = private unnamed_addr constant [58 x i8] c"Warning: glottal open period cannot exceed T0, truncated\0A\00", align 1
@.str.46 = private unnamed_addr constant [53 x i8] c"Warning: minimum glottal open period is 10 samples.\0A\00", align 1
@.str.47 = private unnamed_addr constant [24 x i8] c"truncated, nopen = %ld\0A\00", align 1
@natglot = internal constant [224 x i16] [i16 1200, i16 1142, i16 1088, i16 1038, i16 991, i16 948, i16 907, i16 869, i16 833, i16 799, i16 768, i16 738, i16 710, i16 683, i16 658, i16 634, i16 612, i16 590, i16 570, i16 551, i16 533, i16 515, i16 499, i16 483, i16 468, i16 454, i16 440, i16 427, i16 415, i16 403, i16 391, i16 380, i16 370, i16 360, i16 350, i16 341, i16 332, i16 323, i16 315, i16 307, i16 300, i16 292, i16 285, i16 278, i16 272, i16 265, i16 259, i16 253, i16 247, i16 242, i16 237, i16 231, i16 226, i16 221, i16 217, i16 212, i16 208, i16 204, i16 199, i16 195, i16 192, i16 188, i16 184, i16 180, i16 177, i16 174, i16 170, i16 167, i16 164, i16 161, i16 158, i16 155, i16 153, i16 150, i16 147, i16 145, i16 142, i16 140, i16 137, i16 135, i16 133, i16 131, i16 128, i16 126, i16 124, i16 122, i16 120, i16 119, i16 117, i16 115, i16 113, i16 111, i16 110, i16 108, i16 106, i16 105, i16 103, i16 102, i16 100, i16 99, i16 97, i16 96, i16 95, i16 93, i16 92, i16 91, i16 90, i16 88, i16 87, i16 86, i16 85, i16 84, i16 83, i16 82, i16 80, i16 79, i16 78, i16 77, i16 76, i16 75, i16 75, i16 74, i16 73, i16 72, i16 71, i16 70, i16 69, i16 68, i16 68, i16 67, i16 66, i16 65, i16 64, i16 64, i16 63, i16 62, i16 61, i16 61, i16 60, i16 59, i16 59, i16 58, i16 57, i16 57, i16 56, i16 56, i16 55, i16 55, i16 54, i16 54, i16 53, i16 53, i16 52, i16 52, i16 51, i16 51, i16 50, i16 50, i16 49, i16 49, i16 48, i16 48, i16 47, i16 47, i16 46, i16 46, i16 45, i16 45, i16 44, i16 44, i16 43, i16 43, i16 42, i16 42, i16 41, i16 41, i16 41, i16 41, i16 40, i16 40, i16 39, i16 39, i16 38, i16 38, i16 38, i16 38, i16 37, i16 37, i16 36, i16 36, i16 36, i16 36, i16 35, i16 35, i16 35, i16 35, i16 34, i16 34, i16 33, i16 33, i16 33, i16 33, i16 32, i16 32, i16 32, i16 32, i16 31, i16 31, i16 31, i16 31, i16 30, i16 30, i16 30, i16 30, i16 29, i16 29, i16 29, i16 29, i16 28, i16 28, i16 28, i16 28, i16 27, i16 27], align 16
@.str.48 = private unnamed_addr constant [58 x i8] c"Kskew duration=%ld > glottal closed period=%ld, truncate\0A\00", align 1
@skew = internal global i64 0, align 8
@.str.49 = private unnamed_addr constant [25 x i8] c"downsamp low-pass filter\00", align 1
@.str.50 = private unnamed_addr constant [19 x i8] c"cascade nasal zero\00", align 1
@.str.51 = private unnamed_addr constant [19 x i8] c"cascade nasal pole\00", align 1
@.str.52 = private unnamed_addr constant [20 x i8] c"cascade 8th formant\00", align 1
@.str.53 = private unnamed_addr constant [20 x i8] c"cascade 7th formant\00", align 1
@.str.54 = private unnamed_addr constant [20 x i8] c"cascade 6th formant\00", align 1
@.str.55 = private unnamed_addr constant [20 x i8] c"cascade 5th formant\00", align 1
@.str.56 = private unnamed_addr constant [20 x i8] c"cascade 4th formant\00", align 1
@.str.57 = private unnamed_addr constant [20 x i8] c"cascade 3rd formant\00", align 1
@.str.58 = private unnamed_addr constant [20 x i8] c"cascade 2nd formant\00", align 1
@.str.59 = private unnamed_addr constant [20 x i8] c"cascade 1st formant\00", align 1
@.str.60 = private unnamed_addr constant [21 x i8] c"parallel 1st formant\00", align 1
@.str.61 = private unnamed_addr constant [21 x i8] c"parallel 6th formant\00", align 1
@.str.62 = private unnamed_addr constant [21 x i8] c"parallel 5th formant\00", align 1
@.str.63 = private unnamed_addr constant [21 x i8] c"parallel 4th formant\00", align 1
@.str.64 = private unnamed_addr constant [21 x i8] c"parallel 3rd formant\00", align 1
@.str.65 = private unnamed_addr constant [21 x i8] c"parallel 2nd formant\00", align 1
@.str.66 = private unnamed_addr constant [16 x i8] c"output low-pass\00", align 1
@.str.67 = private unnamed_addr constant [17 x i8] c"\0A* * * WARNING: \00", align 1
@.str.68 = private unnamed_addr constant [59 x i8] c" Signal at output of synthesizer (+%3.1f dB) exceeds 0 dB\0A\00", align 1
@.str.69 = private unnamed_addr constant [20 x i8] c"parallel nasal pole\00", align 1
@.str.70 = private unnamed_addr constant [33 x i8] c"crit-damped glot low-pass filter\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_show_parms = private constant [10 x i8] c"show_parms"
@__profn_parwave = private constant [7 x i8] c"parwave"
@__profn_tmp1.ll_frame_init = private constant [18 x i8] c"tmp1.ll:frame_init"
@__profn_tmp1.ll_flutter = private constant [15 x i8] c"tmp1.ll:flutter"
@__profn_tmp1.ll_impulsive_source = private constant [24 x i8] c"tmp1.ll:impulsive_source"
@__profn_tmp1.ll_natural_source = private constant [22 x i8] c"tmp1.ll:natural_source"
@__profn_tmp1.ll_pitch_synch_par_reset = private constant [29 x i8] c"tmp1.ll:pitch_synch_par_reset"
@__profn_tmp1.ll_resonator = private constant [17 x i8] c"tmp1.ll:resonator"
@__profn_tmp1.ll_antiresonator = private constant [21 x i8] c"tmp1.ll:antiresonator"
@__profn_tmp1.ll_clip = private constant [12 x i8] c"tmp1.ll:clip"
@__profn_parwave_init = private constant [12 x i8] c"parwave_init"
@__profn_tmp1.ll_setabc = private constant [14 x i8] c"tmp1.ll:setabc"
@__profn_tmp1.ll_DBtoLIN = private constant [15 x i8] c"tmp1.ll:DBtoLIN"
@__profn_tmp1.ll_setzeroabc = private constant [18 x i8] c"tmp1.ll:setzeroabc"
@__profn_tmp1.ll_setabcg = private constant [15 x i8] c"tmp1.ll:setabcg"
@__profn_tmp1.ll_overload_warning = private constant [24 x i8] c"tmp1.ll:overload_warning"
@__profn_tmp1.ll_dBconvert = private constant [17 x i8] c"tmp1.ll:dBconvert"
@__profc_show_parms = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_show_parms = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4600342650311206131, i64 66239574432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_show_parms, i32 0, i32 0), i8* bitcast (void (%struct.klatt_global_t*, i32*)* @show_parms to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_parwave = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_parwave = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 357218205392334303, i64 216119595604, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i32 0, i32 0), i8* bitcast (void (%struct.klatt_global_t*, %struct.klatt_frame_t*, i16*)* @parwave to i8*), i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_frame_init = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_frame_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5741385450391045251, i64 124165240322, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_flutter = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_flutter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1356123229283695051, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_flutter, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_impulsive_source = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_impulsive_source = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2615162833319415329, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_impulsive_source, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_natural_source = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_natural_source = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8141396898956979609, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_natural_source, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pitch_synch_par_reset = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pitch_synch_par_reset = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8736168125652139108, i64 195176008314, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i32 0, i32 0), i8* null, i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_resonator = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_resonator = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2341610465231121903, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_resonator, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_antiresonator = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_antiresonator = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -336850905719259807, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_antiresonator, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_clip = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_clip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2244344486361539745, i64 41716471419, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_clip, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_parwave_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_parwave_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2835227498545139741, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_parwave_init, i32 0, i32 0), i8* bitcast (void (%struct.klatt_global_t*)* @parwave_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_setabc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_setabc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7380073154435098845, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setabc, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_DBtoLIN = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_DBtoLIN = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1698224475776017901, i64 54192280815, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_DBtoLIN, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_setzeroabc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_setzeroabc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2852700723262950633, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setzeroabc, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_setabcg = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_setabcg = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3756289336601241026, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setabcg, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_overload_warning = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_overload_warning = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8677019271370924224, i64 38398930585, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_overload_warning, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_dBconvert = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_dBconvert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5585424614463825509, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_dBconvert, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [157 x i8] c"\B2\02\99\01x\DAeNA\0A\021\0Cd?$x\F5\B8x\11\C4/\94\D8\8Dn mJ\9A\EE\A2\AF\B7 \B6\AB^\06f&3\99<\CB\EA\12h\C8C\C5\15\16\1C,\A4\FD\8E\F9pS\08\E8(\92u\89\8B\19j\E3\14R\E1L\0B\BA,E}\CFF\B0\A2\C0\BFr\22\F3\B3\CB\8FX\B1\BEs\8A\19{{eR\83\D2\FB!\1A\FD\AB\9E)}\D6~\EF\ABmp\F5\8D\1EG\93\F3\E9\B2\B5\9F\A8\B2=y'\EE\8D\CB\82\CA\02\93[A#\C5nL\A3\97XM{\01))p\B7", section "__llvm_prf_names"
@llvm.used = appending global [18 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_show_parms to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_parwave to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_frame_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_flutter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_impulsive_source to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_natural_source to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pitch_synch_par_reset to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_resonator to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_antiresonator to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_clip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_parwave_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_setabc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_DBtoLIN to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_setzeroabc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_setabcg to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_overload_warning to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_dBconvert to i8*), i8* getelementptr inbounds ([157 x i8], [157 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @show_parms(%struct.klatt_global_t*, i32*) #0 {
  %3 = alloca %struct.klatt_global_t*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  store %struct.klatt_global_t* %0, %struct.klatt_global_t** %3, align 8
  store i32* %1, i32** %4, align 8
  %6 = load i32, i32* @show_parms.names, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* @show_parms.names, align 4
  %8 = srem i32 %6, 64
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %27

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_show_parms, i64 0, i64 3)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_show_parms, i64 0, i64 3)
  store i32 0, i32* %5, align 4
  br label %12

; <label>:12:                                     ; preds = %21, %10
  %13 = load i32, i32* %5, align 4
  %14 = icmp slt i32 %13, 40
  br i1 %14, label %15, label %25

; <label>:15:                                     ; preds = %12
  %16 = load i32, i32* %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [40 x i8*], [40 x i8*]* @par_name, i64 0, i64 %17
  %19 = load i8*, i8** %18, align 8
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.41, i32 0, i32 0), i8* %19)
  br label %21

; <label>:21:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_show_parms, i64 0, i64 1)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_show_parms, i64 0, i64 1)
  %23 = load i32, i32* %5, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %5, align 4
  br label %12

; <label>:25:                                     ; preds = %12
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0))
  br label %27

; <label>:27:                                     ; preds = %25, %2
  store i32 0, i32* %5, align 4
  br label %28

; <label>:28:                                     ; preds = %45, %27
  %29 = load i32, i32* %5, align 4
  %30 = icmp slt i32 %29, 40
  br i1 %30, label %31, label %48

; <label>:31:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_show_parms, i64 0, i64 0)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_show_parms, i64 0, i64 0)
  %33 = load i32, i32* %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [40 x i8*], [40 x i8*]* @par_name, i64 0, i64 %34
  %36 = load i8*, i8** %35, align 8
  %37 = call i64 @strlen(i8* %36) #5
  %38 = trunc i64 %37 to i32
  %39 = load i32*, i32** %4, align 8
  %40 = load i32, i32* %5, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32* %39, i64 %41
  %43 = load i32, i32* %42, align 4
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.43, i32 0, i32 0), i32 %38, i32 %43)
  br label %45

; <label>:45:                                     ; preds = %31
  %46 = load i32, i32* %5, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %5, align 4
  br label %28

; <label>:48:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_show_parms, i64 0, i64 2)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_show_parms, i64 0, i64 2)
  %50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind uwtable
define void @parwave(%struct.klatt_global_t*, %struct.klatt_frame_t*, i16*) #0 {
  %4 = alloca %struct.klatt_global_t*, align 8
  %5 = alloca %struct.klatt_frame_t*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i64, align 8
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  %10 = alloca i32, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  %17 = alloca i64, align 8
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  store %struct.klatt_global_t* %0, %struct.klatt_global_t** %4, align 8
  store %struct.klatt_frame_t* %1, %struct.klatt_frame_t** %5, align 8
  store i16* %2, i16** %6, align 8
  store float 0.000000e+00, float* %8, align 4
  %20 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %21 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %5, align 8
  call void @frame_init(%struct.klatt_global_t* %20, %struct.klatt_frame_t* %21)
  %22 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %23 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %22, i32 0, i32 2
  %24 = load i32, i32* %23, align 8
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %32

; <label>:26:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 16)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 16)
  %28 = load i32, i32* @time_count, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* @time_count, align 4
  %30 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %31 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %5, align 8
  call void @flutter(%struct.klatt_global_t* %30, %struct.klatt_frame_t* %31)
  br label %32

; <label>:32:                                     ; preds = %26, %3
  store i64 0, i64* %7, align 8
  br label %33

; <label>:33:                                     ; preds = %227, %32
  %34 = load i64, i64* %7, align 8
  %35 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %36 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %35, i32 0, i32 7
  %37 = load i64, i64* %36, align 8
  %38 = icmp slt i64 %34, %37
  br i1 %38, label %39, label %230

; <label>:39:                                     ; preds = %33
  %40 = load i64, i64* @parwave.seed, align 8
  %41 = mul i64 %40, 1664525
  %42 = add i64 %41, 1
  store i64 %42, i64* @parwave.seed, align 8
  %43 = load i64, i64* @parwave.seed, align 8
  %44 = and i64 %43, 4294967295
  store i64 %44, i64* @parwave.seed, align 8
  %45 = load i64, i64* @parwave.seed, align 8
  %46 = shl i64 %45, 32
  %47 = ashr i64 %46, 50
  store i64 %47, i64* %17, align 8
  %48 = load i64, i64* %17, align 8
  %49 = sitofp i64 %48 to double
  %50 = load float, float* @nlast, align 4
  %51 = fpext float %50 to double
  %52 = fmul double 7.500000e-01, %51
  %53 = fadd double %49, %52
  %54 = fptrunc double %53 to float
  store float %54, float* %9, align 4
  %55 = load float, float* %9, align 4
  store float %55, float* @nlast, align 4
  %56 = load i64, i64* @nper, align 8
  %57 = load i64, i64* @nmod, align 8
  %58 = icmp sgt i64 %56, %57
  br i1 %58, label %59, label %65

; <label>:59:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 3)
  %60 = add i64 %pgocount1, 1
  store i64 %60, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 3)
  %61 = load float, float* %9, align 4
  %62 = fpext float %61 to double
  %63 = fmul double %62, 5.000000e-01
  %64 = fptrunc double %63 to float
  store float %64, float* %9, align 4
  br label %65

; <label>:65:                                     ; preds = %59, %39
  %66 = load float, float* @amp_frica, align 4
  %67 = load float, float* %9, align 4
  %68 = fmul float %66, %67
  store float %68, float* %15, align 4
  store float %68, float* %11, align 4
  store i32 0, i32* %10, align 4
  br label %69

; <label>:69:                                     ; preds = %99, %65
  %70 = load i32, i32* %10, align 4
  %71 = icmp slt i32 %70, 4
  br i1 %71, label %72, label %102

; <label>:72:                                     ; preds = %69
  %73 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %74 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %73, i32 0, i32 6
  %75 = load i64, i64* %74, align 8
  %76 = icmp eq i64 %75, 1
  br i1 %76, label %77, label %81

; <label>:77:                                     ; preds = %72
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 0)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 0)
  %79 = load i64, i64* @nper, align 8
  %80 = call float @impulsive_source(i64 %79)
  store float %80, float* %14, align 4
  br label %85

; <label>:81:                                     ; preds = %72
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 1)
  %82 = add i64 %pgocount3, 1
  store i64 %82, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 1)
  %83 = load i64, i64* @nper, align 8
  %84 = call float @natural_source(i64 %83)
  store float %84, float* %14, align 4
  br label %85

; <label>:85:                                     ; preds = %81, %77
  %86 = load i64, i64* @nper, align 8
  %87 = load i64, i64* @T0, align 8
  %88 = icmp sge i64 %86, %87
  br i1 %88, label %89, label %94

; <label>:89:                                     ; preds = %85
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 2)
  %90 = add i64 %pgocount4, 1
  store i64 %90, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 2)
  store i64 0, i64* @nper, align 8
  %91 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %92 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %5, align 8
  %93 = load i64, i64* %7, align 8
  call void @pitch_synch_par_reset(%struct.klatt_global_t* %91, %struct.klatt_frame_t* %92, i64 %93)
  br label %94

; <label>:94:                                     ; preds = %89, %85
  %95 = load float, float* %14, align 4
  %96 = call float @resonator(%struct.resonator_t* @rlp, float %95)
  store float %96, float* %14, align 4
  %97 = load i64, i64* @nper, align 8
  %98 = add nsw i64 %97, 1
  store i64 %98, i64* @nper, align 8
  br label %99

; <label>:99:                                     ; preds = %94
  %100 = load i32, i32* %10, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %10, align 4
  br label %69

; <label>:102:                                    ; preds = %69
  %103 = load float, float* %14, align 4
  %104 = load float, float* @onemd, align 4
  %105 = fmul float %103, %104
  %106 = load float, float* @vlast, align 4
  %107 = load float, float* @decay, align 4
  %108 = fmul float %106, %107
  %109 = fadd float %105, %108
  store float %109, float* %14, align 4
  %110 = load float, float* %14, align 4
  store float %110, float* @vlast, align 4
  %111 = load i64, i64* @nper, align 8
  %112 = load i64, i64* @nopen, align 8
  %113 = icmp slt i64 %111, %112
  br i1 %113, label %114, label %122

; <label>:114:                                    ; preds = %102
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 4)
  %115 = add i64 %pgocount5, 1
  store i64 %115, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 4)
  %116 = load float, float* @amp_breth, align 4
  %117 = load i64, i64* %17, align 8
  %118 = sitofp i64 %117 to float
  %119 = fmul float %116, %118
  %120 = load float, float* %14, align 4
  %121 = fadd float %120, %119
  store float %121, float* %14, align 4
  br label %122

; <label>:122:                                    ; preds = %114, %102
  %123 = load float, float* @amp_voice, align 4
  %124 = load float, float* %14, align 4
  %125 = fmul float %123, %124
  store float %125, float* %12, align 4
  %126 = load float, float* @amp_aspir, align 4
  %127 = load float, float* %9, align 4
  %128 = fmul float %126, %127
  store float %128, float* %16, align 4
  %129 = load float, float* %16, align 4
  %130 = load float, float* %12, align 4
  %131 = fadd float %130, %129
  store float %131, float* %12, align 4
  %132 = load float, float* %12, align 4
  store float %132, float* %13, align 4
  %133 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %134 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %133, i32 0, i32 0
  %135 = load i32, i32* %134, align 8
  %136 = icmp ne i32 %135, 2
  br i1 %136, label %137, label %180

; <label>:137:                                    ; preds = %122
  %138 = load float, float* %12, align 4
  %139 = call float @antiresonator(%struct.resonator_t* @rnz, float %138)
  store float %139, float* %18, align 4
  %140 = load float, float* %18, align 4
  %141 = call float @resonator(%struct.resonator_t* @rnpc, float %140)
  store float %141, float* %19, align 4
  %142 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %143 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %142, i32 0, i32 5
  %144 = load i64, i64* %143, align 8
  switch i64 %144, label %177 [
    i64 8, label %145
    i64 7, label %149
    i64 6, label %153
    i64 5, label %157
    i64 4, label %161
    i64 3, label %165
    i64 2, label %169
    i64 1, label %173
  ]

; <label>:145:                                    ; preds = %137
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 14)
  %146 = add i64 %pgocount6, 1
  store i64 %146, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 14)
  %147 = load float, float* %19, align 4
  %148 = call float @resonator(%struct.resonator_t* @r8c, float %147)
  store float %148, float* %19, align 4
  br label %149

; <label>:149:                                    ; preds = %145, %137
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 12)
  %150 = add i64 %pgocount7, 1
  store i64 %150, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 12)
  %151 = load float, float* %19, align 4
  %152 = call float @resonator(%struct.resonator_t* @r7c, float %151)
  store float %152, float* %19, align 4
  br label %153

; <label>:153:                                    ; preds = %149, %137
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 11)
  %154 = add i64 %pgocount8, 1
  store i64 %154, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 11)
  %155 = load float, float* %19, align 4
  %156 = call float @resonator(%struct.resonator_t* @r6c, float %155)
  store float %156, float* %19, align 4
  br label %157

; <label>:157:                                    ; preds = %153, %137
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 10)
  %158 = add i64 %pgocount9, 1
  store i64 %158, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 10)
  %159 = load float, float* %19, align 4
  %160 = call float @resonator(%struct.resonator_t* @r5c, float %159)
  store float %160, float* %19, align 4
  br label %161

; <label>:161:                                    ; preds = %157, %137
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 9)
  %162 = add i64 %pgocount10, 1
  store i64 %162, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 9)
  %163 = load float, float* %19, align 4
  %164 = call float @resonator(%struct.resonator_t* @r4c, float %163)
  store float %164, float* %19, align 4
  br label %165

; <label>:165:                                    ; preds = %161, %137
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 8)
  %166 = add i64 %pgocount11, 1
  store i64 %166, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 8)
  %167 = load float, float* %19, align 4
  %168 = call float @resonator(%struct.resonator_t* @r3c, float %167)
  store float %168, float* %19, align 4
  br label %169

; <label>:169:                                    ; preds = %165, %137
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 7)
  %170 = add i64 %pgocount12, 1
  store i64 %170, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 7)
  %171 = load float, float* %19, align 4
  %172 = call float @resonator(%struct.resonator_t* @r2c, float %171)
  store float %172, float* %19, align 4
  br label %173

; <label>:173:                                    ; preds = %169, %137
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 6)
  %174 = add i64 %pgocount13, 1
  store i64 %174, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 6)
  %175 = load float, float* %19, align 4
  %176 = call float @resonator(%struct.resonator_t* @r1c, float %175)
  store float %176, float* %8, align 4
  br label %179

; <label>:177:                                    ; preds = %137
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 13)
  %178 = add i64 %pgocount14, 1
  store i64 %178, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 13)
  store float 0.000000e+00, float* %8, align 4
  br label %179

; <label>:179:                                    ; preds = %177, %173
  br label %194

; <label>:180:                                    ; preds = %122
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 5)
  %181 = add i64 %pgocount15, 1
  store i64 %181, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 5)
  %182 = load float, float* %13, align 4
  %183 = call float @antiresonator(%struct.resonator_t* @rnz, float %182)
  store float %183, float* %13, align 4
  %184 = load float, float* %13, align 4
  %185 = call float @resonator(%struct.resonator_t* @rnpc, float %184)
  store float %185, float* %13, align 4
  %186 = load float, float* %13, align 4
  %187 = call float @resonator(%struct.resonator_t* @r1p, float %186)
  store float %187, float* %8, align 4
  %188 = load float, float* %13, align 4
  %189 = load float, float* @glotlast, align 4
  %190 = fsub float %188, %189
  %191 = load float, float* %11, align 4
  %192 = fadd float %191, %190
  store float %192, float* %11, align 4
  %193 = load float, float* %13, align 4
  store float %193, float* @glotlast, align 4
  br label %194

; <label>:194:                                    ; preds = %180, %179
  %195 = load float, float* %11, align 4
  %196 = call float @resonator(%struct.resonator_t* @r6p, float %195)
  %197 = load float, float* %8, align 4
  %198 = fsub float %196, %197
  store float %198, float* %8, align 4
  %199 = load float, float* %11, align 4
  %200 = call float @resonator(%struct.resonator_t* @r5p, float %199)
  %201 = load float, float* %8, align 4
  %202 = fsub float %200, %201
  store float %202, float* %8, align 4
  %203 = load float, float* %11, align 4
  %204 = call float @resonator(%struct.resonator_t* @r4p, float %203)
  %205 = load float, float* %8, align 4
  %206 = fsub float %204, %205
  store float %206, float* %8, align 4
  %207 = load float, float* %11, align 4
  %208 = call float @resonator(%struct.resonator_t* @r3p, float %207)
  %209 = load float, float* %8, align 4
  %210 = fsub float %208, %209
  store float %210, float* %8, align 4
  %211 = load float, float* %11, align 4
  %212 = call float @resonator(%struct.resonator_t* @r2p, float %211)
  %213 = load float, float* %8, align 4
  %214 = fsub float %212, %213
  store float %214, float* %8, align 4
  %215 = load float, float* @amp_bypas, align 4
  %216 = load float, float* %11, align 4
  %217 = fmul float %215, %216
  %218 = load float, float* %8, align 4
  %219 = fsub float %217, %218
  store float %219, float* %8, align 4
  %220 = load float, float* %8, align 4
  %221 = call float @resonator(%struct.resonator_t* @rout, float %220)
  store float %221, float* %8, align 4
  %222 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %223 = load float, float* %8, align 4
  %224 = call signext i16 @clip(%struct.klatt_global_t* %222, float %223)
  %225 = load i16*, i16** %6, align 8
  %226 = getelementptr inbounds i16, i16* %225, i32 1
  store i16* %226, i16** %6, align 8
  store i16 %224, i16* %225, align 2
  br label %227

; <label>:227:                                    ; preds = %194
  %228 = load i64, i64* %7, align 8
  %229 = add nsw i64 %228, 1
  store i64 %229, i64* %7, align 8
  br label %33

; <label>:230:                                    ; preds = %33
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 15)
  %231 = add i64 %pgocount16, 1
  store i64 %231, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_parwave, i64 0, i64 15)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @frame_init(%struct.klatt_global_t*, %struct.klatt_frame_t*) #0 {
  %3 = alloca %struct.klatt_global_t*, align 8
  %4 = alloca %struct.klatt_frame_t*, align 8
  %5 = alloca i64, align 8
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  store %struct.klatt_global_t* %0, %struct.klatt_global_t** %3, align 8
  store %struct.klatt_frame_t* %1, %struct.klatt_frame_t** %4, align 8
  %13 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %14 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 8
  store i64 %15, i64* @F0hz10, align 8
  %16 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %17 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %16, i32 0, i32 1
  %18 = load i64, i64* %17, align 8
  %19 = sub nsw i64 %18, 7
  store i64 %19, i64* @AVdb, align 8
  %20 = load i64, i64* @AVdb, align 8
  %21 = icmp slt i64 %20, 0
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 4)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 4)
  store i64 0, i64* @AVdb, align 8
  br label %24

; <label>:24:                                     ; preds = %22, %2
  %25 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %26 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %27 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %26, i32 0, i32 18
  %28 = load i64, i64* %27, align 8
  %29 = call float @DBtoLIN(%struct.klatt_global_t* %25, i64 %28)
  %30 = fpext float %29 to double
  %31 = fmul double %30, 5.000000e-02
  %32 = fptrunc double %31 to float
  store float %32, float* @amp_aspir, align 4
  %33 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %34 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %35 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %34, i32 0, i32 22
  %36 = load i64, i64* %35, align 8
  %37 = call float @DBtoLIN(%struct.klatt_global_t* %33, i64 %36)
  %38 = fpext float %37 to double
  %39 = fmul double %38, 2.500000e-01
  %40 = fptrunc double %39 to float
  store float %40, float* @amp_frica, align 4
  %41 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %42 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %41, i32 0, i32 23
  %43 = load i64, i64* %42, align 8
  store i64 %43, i64* @Kskew, align 8
  %44 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %45 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %46 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %45, i32 0, i32 38
  %47 = load i64, i64* %46, align 8
  %48 = call float @DBtoLIN(%struct.klatt_global_t* %44, i64 %47)
  store float %48, float* @par_amp_voice, align 4
  %49 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %50 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %51 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %50, i32 0, i32 24
  %52 = load i64, i64* %51, align 8
  %53 = call float @DBtoLIN(%struct.klatt_global_t* %49, i64 %52)
  %54 = fpext float %53 to double
  %55 = fmul double %54, 4.000000e-01
  %56 = fptrunc double %55 to float
  store float %56, float* %6, align 4
  %57 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %58 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %59 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %58, i32 0, i32 26
  %60 = load i64, i64* %59, align 8
  %61 = call float @DBtoLIN(%struct.klatt_global_t* %57, i64 %60)
  %62 = fpext float %61 to double
  %63 = fmul double %62, 1.500000e-01
  %64 = fptrunc double %63 to float
  store float %64, float* %8, align 4
  %65 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %66 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %67 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %66, i32 0, i32 28
  %68 = load i64, i64* %67, align 8
  %69 = call float @DBtoLIN(%struct.klatt_global_t* %65, i64 %68)
  %70 = fpext float %69 to double
  %71 = fmul double %70, 6.000000e-02
  %72 = fptrunc double %71 to float
  store float %72, float* %9, align 4
  %73 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %74 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %75 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %74, i32 0, i32 30
  %76 = load i64, i64* %75, align 8
  %77 = call float @DBtoLIN(%struct.klatt_global_t* %73, i64 %76)
  %78 = fpext float %77 to double
  %79 = fmul double %78, 4.000000e-02
  %80 = fptrunc double %79 to float
  store float %80, float* %10, align 4
  %81 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %82 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %83 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %82, i32 0, i32 32
  %84 = load i64, i64* %83, align 8
  %85 = call float @DBtoLIN(%struct.klatt_global_t* %81, i64 %84)
  %86 = fpext float %85 to double
  %87 = fmul double %86, 2.200000e-02
  %88 = fptrunc double %87 to float
  store float %88, float* %11, align 4
  %89 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %90 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %91 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %90, i32 0, i32 34
  %92 = load i64, i64* %91, align 8
  %93 = call float @DBtoLIN(%struct.klatt_global_t* %89, i64 %92)
  %94 = fpext float %93 to double
  %95 = fmul double %94, 3.000000e-02
  %96 = fptrunc double %95 to float
  store float %96, float* %12, align 4
  %97 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %98 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %99 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %98, i32 0, i32 36
  %100 = load i64, i64* %99, align 8
  %101 = call float @DBtoLIN(%struct.klatt_global_t* %97, i64 %100)
  %102 = fpext float %101 to double
  %103 = fmul double %102, 6.000000e-01
  %104 = fptrunc double %103 to float
  store float %104, float* %7, align 4
  %105 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %106 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %107 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %106, i32 0, i32 37
  %108 = load i64, i64* %107, align 8
  %109 = call float @DBtoLIN(%struct.klatt_global_t* %105, i64 %108)
  %110 = fpext float %109 to double
  %111 = fmul double %110, 5.000000e-02
  %112 = fptrunc double %111 to float
  store float %112, float* @amp_bypas, align 4
  %113 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %114 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %113, i32 0, i32 5
  %115 = load i64, i64* %114, align 8
  %116 = icmp sge i64 %115, 8
  br i1 %116, label %117, label %129

; <label>:117:                                    ; preds = %24
  %118 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %119 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %118, i32 0, i32 4
  %120 = load i64, i64* %119, align 8
  %121 = icmp sge i64 %120, 16000
  br i1 %121, label %122, label %124

; <label>:122:                                    ; preds = %117
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 5)
  %123 = add i64 %pgocount1, 1
  store i64 %123, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 5)
  call void @setabc(i64 7500, i64 600, %struct.resonator_t* @r8c)
  br label %128

; <label>:124:                                    ; preds = %117
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 6)
  %125 = add i64 %pgocount2, 1
  store i64 %125, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 6)
  %126 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %127 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %126, i32 0, i32 5
  store i64 6, i64* %127, align 8
  br label %128

; <label>:128:                                    ; preds = %124, %122
  br label %129

; <label>:129:                                    ; preds = %128, %24
  %130 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %131 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %130, i32 0, i32 5
  %132 = load i64, i64* %131, align 8
  %133 = icmp sge i64 %132, 7
  br i1 %133, label %134, label %146

; <label>:134:                                    ; preds = %129
  %135 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %136 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %135, i32 0, i32 4
  %137 = load i64, i64* %136, align 8
  %138 = icmp sge i64 %137, 16000
  br i1 %138, label %139, label %141

; <label>:139:                                    ; preds = %134
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 7)
  %140 = add i64 %pgocount3, 1
  store i64 %140, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 7)
  call void @setabc(i64 6500, i64 500, %struct.resonator_t* @r7c)
  br label %145

; <label>:141:                                    ; preds = %134
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 8)
  %142 = add i64 %pgocount4, 1
  store i64 %142, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 8)
  %143 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %144 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %143, i32 0, i32 5
  store i64 6, i64* %144, align 8
  br label %145

; <label>:145:                                    ; preds = %141, %139
  br label %146

; <label>:146:                                    ; preds = %145, %129
  %147 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %148 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %147, i32 0, i32 5
  %149 = load i64, i64* %148, align 8
  %150 = icmp sge i64 %149, 6
  br i1 %150, label %151, label %159

; <label>:151:                                    ; preds = %146
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 1)
  %152 = add i64 %pgocount5, 1
  store i64 %152, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 1)
  %153 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %154 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %153, i32 0, i32 12
  %155 = load i64, i64* %154, align 8
  %156 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %157 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %156, i32 0, i32 13
  %158 = load i64, i64* %157, align 8
  call void @setabc(i64 %155, i64 %158, %struct.resonator_t* @r6c)
  br label %159

; <label>:159:                                    ; preds = %151, %146
  %160 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %161 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %160, i32 0, i32 5
  %162 = load i64, i64* %161, align 8
  %163 = icmp sge i64 %162, 5
  br i1 %163, label %164, label %172

; <label>:164:                                    ; preds = %159
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 2)
  %165 = add i64 %pgocount6, 1
  store i64 %165, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 2)
  %166 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %167 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %166, i32 0, i32 10
  %168 = load i64, i64* %167, align 8
  %169 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %170 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %169, i32 0, i32 11
  %171 = load i64, i64* %170, align 8
  call void @setabc(i64 %168, i64 %171, %struct.resonator_t* @r5c)
  br label %172

; <label>:172:                                    ; preds = %164, %159
  %173 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %174 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %173, i32 0, i32 8
  %175 = load i64, i64* %174, align 8
  %176 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %177 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %176, i32 0, i32 9
  %178 = load i64, i64* %177, align 8
  call void @setabc(i64 %175, i64 %178, %struct.resonator_t* @r4c)
  %179 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %180 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %179, i32 0, i32 6
  %181 = load i64, i64* %180, align 8
  %182 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %183 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %182, i32 0, i32 7
  %184 = load i64, i64* %183, align 8
  call void @setabc(i64 %181, i64 %184, %struct.resonator_t* @r3c)
  %185 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %186 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %185, i32 0, i32 4
  %187 = load i64, i64* %186, align 8
  %188 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %189 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %188, i32 0, i32 5
  %190 = load i64, i64* %189, align 8
  call void @setabc(i64 %187, i64 %190, %struct.resonator_t* @r2c)
  %191 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %192 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %191, i32 0, i32 2
  %193 = load i64, i64* %192, align 8
  %194 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %195 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %194, i32 0, i32 3
  %196 = load i64, i64* %195, align 8
  call void @setabc(i64 %193, i64 %196, %struct.resonator_t* @r1c)
  %197 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %198 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %197, i32 0, i32 16
  %199 = load i64, i64* %198, align 8
  %200 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %201 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %200, i32 0, i32 17
  %202 = load i64, i64* %201, align 8
  call void @setabc(i64 %199, i64 %202, %struct.resonator_t* @rnpc)
  %203 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %204 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %203, i32 0, i32 14
  %205 = load i64, i64* %204, align 8
  %206 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %207 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %206, i32 0, i32 15
  %208 = load i64, i64* %207, align 8
  call void @setzeroabc(i64 %205, i64 %208, %struct.resonator_t* @rnz)
  %209 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %210 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %209, i32 0, i32 2
  %211 = load i64, i64* %210, align 8
  %212 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %213 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %212, i32 0, i32 25
  %214 = load i64, i64* %213, align 8
  %215 = load float, float* %6, align 4
  call void @setabcg(i64 %211, i64 %214, %struct.resonator_t* @r1p, float %215)
  %216 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %217 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %216, i32 0, i32 16
  %218 = load i64, i64* %217, align 8
  %219 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %220 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %219, i32 0, i32 17
  %221 = load i64, i64* %220, align 8
  %222 = load float, float* %7, align 4
  call void @setabcg(i64 %218, i64 %221, %struct.resonator_t* @rnpp, float %222)
  %223 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %224 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %223, i32 0, i32 4
  %225 = load i64, i64* %224, align 8
  %226 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %227 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %226, i32 0, i32 27
  %228 = load i64, i64* %227, align 8
  %229 = load float, float* %8, align 4
  call void @setabcg(i64 %225, i64 %228, %struct.resonator_t* @r2p, float %229)
  %230 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %231 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %230, i32 0, i32 6
  %232 = load i64, i64* %231, align 8
  %233 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %234 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %233, i32 0, i32 29
  %235 = load i64, i64* %234, align 8
  %236 = load float, float* %9, align 4
  call void @setabcg(i64 %232, i64 %235, %struct.resonator_t* @r3p, float %236)
  %237 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %238 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %237, i32 0, i32 8
  %239 = load i64, i64* %238, align 8
  %240 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %241 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %240, i32 0, i32 31
  %242 = load i64, i64* %241, align 8
  %243 = load float, float* %10, align 4
  call void @setabcg(i64 %239, i64 %242, %struct.resonator_t* @r4p, float %243)
  %244 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %245 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %244, i32 0, i32 10
  %246 = load i64, i64* %245, align 8
  %247 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %248 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %247, i32 0, i32 33
  %249 = load i64, i64* %248, align 8
  %250 = load float, float* %11, align 4
  call void @setabcg(i64 %246, i64 %249, %struct.resonator_t* @r5p, float %250)
  %251 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %252 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %251, i32 0, i32 12
  %253 = load i64, i64* %252, align 8
  %254 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %255 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %254, i32 0, i32 35
  %256 = load i64, i64* %255, align 8
  %257 = load float, float* %12, align 4
  call void @setabcg(i64 %253, i64 %256, %struct.resonator_t* @r6p, float %257)
  %258 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %4, align 8
  %259 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %258, i32 0, i32 39
  %260 = load i64, i64* %259, align 8
  %261 = sub nsw i64 %260, 3
  store i64 %261, i64* %5, align 8
  %262 = load i64, i64* %5, align 8
  %263 = icmp sle i64 %262, 0
  br i1 %263, label %264, label %266

; <label>:264:                                    ; preds = %172
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 3)
  %265 = add i64 %pgocount7, 1
  store i64 %265, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 3)
  store i64 57, i64* %5, align 8
  br label %266

; <label>:266:                                    ; preds = %264, %172
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 0)
  %267 = add i64 %pgocount8, 1
  store i64 %267, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_frame_init, i64 0, i64 0)
  %268 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %269 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %268, i32 0, i32 4
  %270 = load i64, i64* %269, align 8
  %271 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %272 = load i64, i64* %5, align 8
  %273 = call float @DBtoLIN(%struct.klatt_global_t* %271, i64 %272)
  call void @setabcg(i64 0, i64 %270, %struct.resonator_t* @rout, float %273)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @flutter(%struct.klatt_global_t*, %struct.klatt_frame_t*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_flutter, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_flutter, i64 0, i64 0)
  %4 = alloca %struct.klatt_global_t*, align 8
  %5 = alloca %struct.klatt_frame_t*, align 8
  %6 = alloca i64, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  store %struct.klatt_global_t* %0, %struct.klatt_global_t** %4, align 8
  store %struct.klatt_frame_t* %1, %struct.klatt_frame_t** %5, align 8
  %13 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %5, align 8
  %14 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 8
  %16 = sdiv i64 %15, 10
  store i64 %16, i64* %6, align 8
  %17 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %18 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %17, i32 0, i32 2
  %19 = load i32, i32* %18, align 8
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 5.000000e+01
  store double %21, double* %7, align 8
  %22 = load i64, i64* %6, align 8
  %23 = sitofp i64 %22 to double
  %24 = fdiv double %23, 1.000000e+02
  store double %24, double* %8, align 8
  %25 = load i32, i32* @time_count, align 4
  %26 = sitofp i32 %25 to double
  %27 = fmul double 0x4053F2F91CA1765C, %26
  %28 = call double @sin(double %27) #4
  store double %28, double* %9, align 8
  %29 = load i32, i32* @time_count, align 4
  %30 = sitofp i32 %29 to double
  %31 = fmul double 0x40464E28AD1D5A02, %30
  %32 = call double @sin(double %31) #4
  store double %32, double* %10, align 8
  %33 = load i32, i32* @time_count, align 4
  %34 = sitofp i32 %33 to double
  %35 = fmul double 0x403D87EDBD883645, %34
  %36 = call double @sin(double %35) #4
  store double %36, double* %11, align 8
  %37 = load double, double* %7, align 8
  %38 = load double, double* %8, align 8
  %39 = fmul double %37, %38
  %40 = load double, double* %9, align 8
  %41 = load double, double* %10, align 8
  %42 = fadd double %40, %41
  %43 = load double, double* %11, align 8
  %44 = fadd double %42, %43
  %45 = fmul double %39, %44
  %46 = fmul double %45, 1.000000e+01
  store double %46, double* %12, align 8
  %47 = load double, double* %12, align 8
  %48 = fptosi double %47 to i64
  %49 = load i64, i64* @F0hz10, align 8
  %50 = add nsw i64 %49, %48
  store i64 %50, i64* @F0hz10, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal float @impulsive_source(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = icmp slt i64 %3, 3
  br i1 %4, label %5, label %10

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_impulsive_source, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_impulsive_source, i64 0, i64 0)
  %7 = load i64, i64* %2, align 8
  %8 = getelementptr inbounds [3 x float], [3 x float]* @impulsive_source.doublet, i64 0, i64 %7
  %9 = load float, float* %8, align 4
  store float %9, float* @vwave, align 4
  br label %12

; <label>:10:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_impulsive_source, i64 0, i64 1)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_impulsive_source, i64 0, i64 1)
  store float 0.000000e+00, float* @vwave, align 4
  br label %12

; <label>:12:                                     ; preds = %10, %5
  %13 = load float, float* @vwave, align 4
  %14 = call float @resonator(%struct.resonator_t* @rgl, float %13)
  ret float %14
}

; Function Attrs: nounwind uwtable
define internal float @natural_source(i64) #0 {
  %2 = alloca float, align 4
  %3 = alloca i64, align 8
  %4 = alloca float, align 4
  store i64 %0, i64* %3, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64, i64* @nopen, align 8
  %7 = icmp slt i64 %5, %6
  br i1 %7, label %8, label %21

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_natural_source, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_natural_source, i64 0, i64 0)
  %10 = load float, float* @natglot_b, align 4
  %11 = load float, float* @natglot_a, align 4
  %12 = fsub float %11, %10
  store float %12, float* @natglot_a, align 4
  %13 = load float, float* @natglot_a, align 4
  %14 = load float, float* @vwave, align 4
  %15 = fadd float %14, %13
  store float %15, float* @vwave, align 4
  %16 = load float, float* @vwave, align 4
  %17 = fpext float %16 to double
  %18 = fmul double %17, 2.800000e-02
  %19 = fptrunc double %18 to float
  store float %19, float* %4, align 4
  %20 = load float, float* %4, align 4
  store float %20, float* %2, align 4
  br label %23

; <label>:21:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_natural_source, i64 0, i64 1)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_natural_source, i64 0, i64 1)
  store float 0.000000e+00, float* @vwave, align 4
  store float 0.000000e+00, float* %2, align 4
  br label %23

; <label>:23:                                     ; preds = %21, %8
  %24 = load float, float* %2, align 4
  ret float %24
}

; Function Attrs: nounwind uwtable
define internal void @pitch_synch_par_reset(%struct.klatt_global_t*, %struct.klatt_frame_t*, i64) #0 {
  %4 = alloca %struct.klatt_global_t*, align 8
  %5 = alloca %struct.klatt_frame_t*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca float, align 4
  store %struct.klatt_global_t* %0, %struct.klatt_global_t** %4, align 8
  store %struct.klatt_frame_t* %1, %struct.klatt_frame_t** %5, align 8
  store i64 %2, i64* %6, align 8
  %9 = load i64, i64* @F0hz10, align 8
  %10 = icmp sgt i64 %9, 0
  br i1 %10, label %11, label %148

; <label>:11:                                     ; preds = %3
  %12 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %13 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %12, i32 0, i32 4
  %14 = load i64, i64* %13, align 8
  %15 = mul nsw i64 40, %14
  %16 = load i64, i64* @F0hz10, align 8
  %17 = sdiv i64 %15, %16
  store i64 %17, i64* @T0, align 8
  %18 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %19 = load i64, i64* @AVdb, align 8
  %20 = call float @DBtoLIN(%struct.klatt_global_t* %18, i64 %19)
  store float %20, float* @amp_voice, align 4
  %21 = load i64, i64* @T0, align 8
  store i64 %21, i64* @nmod, align 8
  %22 = load i64, i64* @AVdb, align 8
  %23 = icmp sgt i64 %22, 0
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 1)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 1)
  %26 = load i64, i64* @nmod, align 8
  %27 = ashr i64 %26, 1
  store i64 %27, i64* @nmod, align 8
  br label %28

; <label>:28:                                     ; preds = %24, %11
  %29 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %30 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %5, align 8
  %31 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %30, i32 0, i32 20
  %32 = load i64, i64* %31, align 8
  %33 = call float @DBtoLIN(%struct.klatt_global_t* %29, i64 %32)
  %34 = fpext float %33 to double
  %35 = fmul double %34, 1.000000e-01
  %36 = fptrunc double %35 to float
  store float %36, float* @amp_breth, align 4
  %37 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %5, align 8
  %38 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %37, i32 0, i32 19
  %39 = load i64, i64* %38, align 8
  %40 = mul nsw i64 4, %39
  store i64 %40, i64* @nopen, align 8
  %41 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %42 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %41, i32 0, i32 6
  %43 = load i64, i64* %42, align 8
  %44 = icmp eq i64 %43, 1
  br i1 %44, label %45, label %51

; <label>:45:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 5)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 5)
  %47 = load i64, i64* @nopen, align 8
  %48 = icmp sgt i64 %47, 263
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %45
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 11)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 11)
  store i64 263, i64* @nopen, align 8
  br label %51

; <label>:51:                                     ; preds = %49, %45, %28
  %52 = load i64, i64* @nopen, align 8
  %53 = load i64, i64* @T0, align 8
  %54 = sub nsw i64 %53, 1
  %55 = icmp sge i64 %52, %54
  br i1 %55, label %56, label %68

; <label>:56:                                     ; preds = %51
  %57 = load i64, i64* @T0, align 8
  %58 = sub nsw i64 %57, 2
  store i64 %58, i64* @nopen, align 8
  %59 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %60 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %59, i32 0, i32 1
  %61 = load i32, i32* %60, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %66, label %63

; <label>:63:                                     ; preds = %56
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 12)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 12)
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.45, i32 0, i32 0))
  br label %66

; <label>:66:                                     ; preds = %63, %56
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 6)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 6)
  br label %68

; <label>:68:                                     ; preds = %66, %51
  %69 = load i64, i64* @nopen, align 8
  %70 = icmp slt i64 %69, 40
  br i1 %70, label %71, label %83

; <label>:71:                                     ; preds = %68
  store i64 40, i64* @nopen, align 8
  %72 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %73 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %72, i32 0, i32 1
  %74 = load i32, i32* %73, align 4
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %81, label %76

; <label>:76:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 13)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 13)
  %78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.46, i32 0, i32 0))
  %79 = load i64, i64* @nopen, align 8
  %80 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.47, i32 0, i32 0), i64 %79)
  br label %81

; <label>:81:                                     ; preds = %76, %71
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 7)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 7)
  br label %83

; <label>:83:                                     ; preds = %81, %68
  %84 = load i64, i64* @nopen, align 8
  %85 = sub nsw i64 %84, 40
  %86 = getelementptr inbounds [224 x i16], [224 x i16]* @natglot, i64 0, i64 %85
  %87 = load i16, i16* %86, align 2
  %88 = sitofp i16 %87 to float
  store float %88, float* @natglot_b, align 4
  %89 = load float, float* @natglot_b, align 4
  %90 = load i64, i64* @nopen, align 8
  %91 = sitofp i64 %90 to float
  %92 = fmul float %89, %91
  %93 = fpext float %92 to double
  %94 = fmul double %93, 3.330000e-01
  %95 = fptrunc double %94 to float
  store float %95, float* @natglot_a, align 4
  %96 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %97 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %96, i32 0, i32 4
  %98 = load i64, i64* %97, align 8
  %99 = load i64, i64* @nopen, align 8
  %100 = sdiv i64 %98, %99
  store i64 %100, i64* %7, align 8
  %101 = load i64, i64* %7, align 8
  call void @setabc(i64 0, i64 %101, %struct.resonator_t* @rgl)
  %102 = load i64, i64* @nopen, align 8
  %103 = sitofp i64 %102 to double
  %104 = fmul double %103, 8.330000e-03
  %105 = fptrunc double %104 to float
  store float %105, float* %8, align 4
  %106 = load float, float* %8, align 4
  %107 = load float, float* %8, align 4
  %108 = fmul float %106, %107
  %109 = load float, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rgl, i32 0, i32 1), align 8
  %110 = fmul float %109, %108
  store float %110, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rgl, i32 0, i32 1), align 8
  %111 = load i64, i64* @T0, align 8
  %112 = load i64, i64* @nopen, align 8
  %113 = sub nsw i64 %111, %112
  store i64 %113, i64* %7, align 8
  %114 = load i64, i64* @Kskew, align 8
  %115 = load i64, i64* %7, align 8
  %116 = icmp sgt i64 %114, %115
  br i1 %116, label %117, label %132

; <label>:117:                                    ; preds = %83
  %118 = load %struct.klatt_global_t*, %struct.klatt_global_t** %4, align 8
  %119 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %118, i32 0, i32 1
  %120 = load i32, i32* %119, align 4
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %129, label %122

; <label>:122:                                    ; preds = %117
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 14)
  %123 = add i64 %pgocount7, 1
  store i64 %123, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 14)
  %124 = load i64, i64* @Kskew, align 8
  %125 = load i64, i64* @T0, align 8
  %126 = load i64, i64* @nopen, align 8
  %127 = sub nsw i64 %125, %126
  %128 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.48, i32 0, i32 0), i64 %124, i64 %127)
  br label %129

; <label>:129:                                    ; preds = %122, %117
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 8)
  %130 = add i64 %pgocount8, 1
  store i64 %130, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 8)
  %131 = load i64, i64* %7, align 8
  store i64 %131, i64* @Kskew, align 8
  br label %132

; <label>:132:                                    ; preds = %129, %83
  %133 = load i64, i64* @skew, align 8
  %134 = icmp sge i64 %133, 0
  br i1 %134, label %135, label %138

; <label>:135:                                    ; preds = %132
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 9)
  %136 = add i64 %pgocount9, 1
  store i64 %136, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 9)
  %137 = load i64, i64* @Kskew, align 8
  store i64 %137, i64* @skew, align 8
  br label %142

; <label>:138:                                    ; preds = %132
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 10)
  %139 = add i64 %pgocount10, 1
  store i64 %139, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 10)
  %140 = load i64, i64* @Kskew, align 8
  %141 = sub nsw i64 0, %140
  store i64 %141, i64* @skew, align 8
  br label %142

; <label>:142:                                    ; preds = %138, %135
  %143 = load i64, i64* @T0, align 8
  %144 = load i64, i64* @skew, align 8
  %145 = add nsw i64 %143, %144
  store i64 %145, i64* @T0, align 8
  %146 = load i64, i64* @skew, align 8
  %147 = sub nsw i64 0, %146
  store i64 %147, i64* @skew, align 8
  br label %151

; <label>:148:                                    ; preds = %3
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 2)
  %149 = add i64 %pgocount11, 1
  store i64 %149, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 2)
  store i64 4, i64* @T0, align 8
  store float 0.000000e+00, float* @amp_voice, align 4
  %150 = load i64, i64* @T0, align 8
  store i64 %150, i64* @nmod, align 8
  store float 0.000000e+00, float* @amp_breth, align 4
  store float 0.000000e+00, float* @natglot_a, align 4
  store float 0.000000e+00, float* @natglot_b, align 4
  br label %151

; <label>:151:                                    ; preds = %148, %142
  %152 = load i64, i64* @T0, align 8
  %153 = icmp ne i64 %152, 4
  br i1 %153, label %158, label %154

; <label>:154:                                    ; preds = %151
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 0)
  %155 = add i64 %pgocount12, 1
  store i64 %155, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 0)
  %156 = load i64, i64* %6, align 8
  %157 = icmp eq i64 %156, 0
  br i1 %157, label %158, label %177

; <label>:158:                                    ; preds = %154, %151
  %159 = load %struct.klatt_frame_t*, %struct.klatt_frame_t** %5, align 8
  %160 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %159, i32 0, i32 21
  %161 = load i64, i64* %160, align 8
  %162 = sitofp i64 %161 to double
  %163 = fmul double 3.300000e-02, %162
  %164 = fptrunc double %163 to float
  store float %164, float* @decay, align 4
  %165 = load float, float* @decay, align 4
  %166 = fpext float %165 to double
  %167 = fcmp ogt double %166, 0.000000e+00
  br i1 %167, label %168, label %174

; <label>:168:                                    ; preds = %158
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 3)
  %169 = add i64 %pgocount13, 1
  store i64 %169, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 3)
  %170 = load float, float* @decay, align 4
  %171 = fpext float %170 to double
  %172 = fsub double 1.000000e+00, %171
  %173 = fptrunc double %172 to float
  store float %173, float* @onemd, align 4
  br label %176

; <label>:174:                                    ; preds = %158
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 4)
  %175 = add i64 %pgocount14, 1
  store i64 %175, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_pitch_synch_par_reset, i64 0, i64 4)
  store float 1.000000e+00, float* @onemd, align 4
  br label %176

; <label>:176:                                    ; preds = %174, %168
  br label %177

; <label>:177:                                    ; preds = %176, %154
  ret void
}

; Function Attrs: nounwind uwtable
define internal float @resonator(%struct.resonator_t*, float) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_resonator, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_resonator, i64 0, i64 0)
  %4 = alloca %struct.resonator_t*, align 8
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store %struct.resonator_t* %0, %struct.resonator_t** %4, align 8
  store float %1, float* %5, align 4
  %7 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %8 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %7, i32 0, i32 1
  %9 = load float, float* %8, align 8
  %10 = load float, float* %5, align 4
  %11 = fmul float %9, %10
  %12 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %13 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %12, i32 0, i32 2
  %14 = load float, float* %13, align 4
  %15 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %16 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %15, i32 0, i32 4
  %17 = load float, float* %16, align 4
  %18 = fmul float %14, %17
  %19 = fadd float %11, %18
  %20 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %21 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %20, i32 0, i32 3
  %22 = load float, float* %21, align 8
  %23 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %24 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %23, i32 0, i32 5
  %25 = load float, float* %24, align 8
  %26 = fmul float %22, %25
  %27 = fadd float %19, %26
  store float %27, float* %6, align 4
  %28 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %29 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %28, i32 0, i32 4
  %30 = load float, float* %29, align 4
  %31 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %32 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %31, i32 0, i32 5
  store float %30, float* %32, align 8
  %33 = load float, float* %6, align 4
  %34 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %35 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %34, i32 0, i32 4
  store float %33, float* %35, align 4
  %36 = load float, float* %6, align 4
  ret float %36
}

; Function Attrs: nounwind uwtable
define internal float @antiresonator(%struct.resonator_t*, float) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_antiresonator, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_antiresonator, i64 0, i64 0)
  %4 = alloca %struct.resonator_t*, align 8
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store %struct.resonator_t* %0, %struct.resonator_t** %4, align 8
  store float %1, float* %5, align 4
  %7 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %8 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %7, i32 0, i32 1
  %9 = load float, float* %8, align 8
  %10 = load float, float* %5, align 4
  %11 = fmul float %9, %10
  %12 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %13 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %12, i32 0, i32 2
  %14 = load float, float* %13, align 4
  %15 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %16 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %15, i32 0, i32 4
  %17 = load float, float* %16, align 4
  %18 = fmul float %14, %17
  %19 = fadd float %11, %18
  %20 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %21 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %20, i32 0, i32 3
  %22 = load float, float* %21, align 8
  %23 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %24 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %23, i32 0, i32 5
  %25 = load float, float* %24, align 8
  %26 = fmul float %22, %25
  %27 = fadd float %19, %26
  store float %27, float* %6, align 4
  %28 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %29 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %28, i32 0, i32 4
  %30 = load float, float* %29, align 4
  %31 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %32 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %31, i32 0, i32 5
  store float %30, float* %32, align 8
  %33 = load float, float* %5, align 4
  %34 = load %struct.resonator_t*, %struct.resonator_t** %4, align 8
  %35 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %34, i32 0, i32 4
  store float %33, float* %35, align 4
  %36 = load float, float* %6, align 4
  ret float %36
}

; Function Attrs: nounwind uwtable
define internal signext i16 @clip(%struct.klatt_global_t*, float) #0 {
  %3 = alloca %struct.klatt_global_t*, align 8
  %4 = alloca float, align 4
  %5 = alloca i64, align 8
  store %struct.klatt_global_t* %0, %struct.klatt_global_t** %3, align 8
  store float %1, float* %4, align 4
  %6 = load float, float* %4, align 4
  %7 = fptosi float %6 to i64
  store i64 %7, i64* %5, align 8
  %8 = load i64, i64* %5, align 8
  %9 = icmp slt i64 %8, -32767
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 0)
  %12 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %13 = load i64, i64* %5, align 8
  %14 = sub nsw i64 0, %13
  call void @overload_warning(%struct.klatt_global_t* %12, i64 %14)
  store i64 -32767, i64* %5, align 8
  br label %24

; <label>:15:                                     ; preds = %2
  %16 = load i64, i64* %5, align 8
  %17 = icmp sgt i64 %16, 32767
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 2)
  %20 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %21 = load i64, i64* %5, align 8
  call void @overload_warning(%struct.klatt_global_t* %20, i64 %21)
  store i64 32767, i64* %5, align 8
  br label %22

; <label>:22:                                     ; preds = %18, %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 1)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 1)
  br label %24

; <label>:24:                                     ; preds = %22, %10
  %25 = load i64, i64* %5, align 8
  %26 = trunc i64 %25 to i16
  ret i16 %26
}

; Function Attrs: nounwind uwtable
define void @parwave_init(%struct.klatt_global_t*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_parwave_init, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_parwave_init, i64 0, i64 0)
  %3 = alloca %struct.klatt_global_t*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store %struct.klatt_global_t* %0, %struct.klatt_global_t** %3, align 8
  %6 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %7 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %6, i32 0, i32 4
  %8 = load i64, i64* %7, align 8
  %9 = mul nsw i64 950, %8
  %10 = sdiv i64 %9, 10000
  store i64 %10, i64* %4, align 8
  %11 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %12 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %11, i32 0, i32 4
  %13 = load i64, i64* %12, align 8
  %14 = mul nsw i64 630, %13
  %15 = sdiv i64 %14, 10000
  store i64 %15, i64* %5, align 8
  %16 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %17 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %16, i32 0, i32 4
  %18 = load i64, i64* %17, align 8
  %19 = sitofp i64 %18 to double
  %20 = fdiv double 0xC00921FB5A7ED197, %19
  %21 = fptrunc double %20 to float
  store float %21, float* @minus_pi_t, align 4
  %22 = load float, float* @minus_pi_t, align 4
  %23 = fpext float %22 to double
  %24 = fmul double -2.000000e+00, %23
  %25 = fptrunc double %24 to float
  store float %25, float* @two_pi_t, align 4
  %26 = load i64, i64* %4, align 8
  %27 = load i64, i64* %5, align 8
  call void @setabc(i64 %26, i64 %27, %struct.resonator_t* @rlp)
  store i64 0, i64* @nper, align 8
  store i64 0, i64* @T0, align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rnpp, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rnpp, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r1p, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r1p, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r2p, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r2p, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r3p, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r3p, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r4p, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r4p, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r5p, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r5p, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r6p, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r6p, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r1c, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r1c, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r2c, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r2c, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r3c, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r3c, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r4c, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r4c, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r5c, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r5c, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r6c, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r6c, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r7c, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r7c, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r8c, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @r8c, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rnpc, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rnpc, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rnz, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rnz, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rgl, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rgl, i32 0, i32 5), align 8
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rlp, i32 0, i32 4), align 4
  store float 0.000000e+00, float* getelementptr inbounds (%struct.resonator_t, %struct.resonator_t* @rlp, i32 0, i32 5), align 8
  store float 0.000000e+00, float* @vlast, align 4
  store float 0.000000e+00, float* @nlast, align 4
  store float 0.000000e+00, float* @glotlast, align 4
  store i32 0, i32* @warnsw, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @setabc(i64, i64, %struct.resonator_t*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setabc, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setabc, i64 0, i64 0)
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.resonator_t*, align 8
  %8 = alloca double, align 8
  %9 = alloca float, align 4
  store i64 %0, i64* %5, align 8
  store i64 %1, i64* %6, align 8
  store %struct.resonator_t* %2, %struct.resonator_t** %7, align 8
  %10 = load float, float* @minus_pi_t, align 4
  %11 = load i64, i64* %6, align 8
  %12 = sitofp i64 %11 to float
  %13 = fmul float %10, %12
  %14 = fpext float %13 to double
  store double %14, double* %8, align 8
  %15 = load double, double* %8, align 8
  %16 = call double @exp(double %15) #4
  %17 = fptrunc double %16 to float
  store float %17, float* %9, align 4
  %18 = load float, float* %9, align 4
  %19 = load float, float* %9, align 4
  %20 = fmul float %18, %19
  %21 = fsub float -0.000000e+00, %20
  %22 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  %23 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %22, i32 0, i32 3
  store float %21, float* %23, align 8
  %24 = load float, float* @two_pi_t, align 4
  %25 = load i64, i64* %5, align 8
  %26 = sitofp i64 %25 to float
  %27 = fmul float %24, %26
  %28 = fpext float %27 to double
  store double %28, double* %8, align 8
  %29 = load float, float* %9, align 4
  %30 = fpext float %29 to double
  %31 = load double, double* %8, align 8
  %32 = call double @cos(double %31) #4
  %33 = fmul double %30, %32
  %34 = fmul double %33, 2.000000e+00
  %35 = fptrunc double %34 to float
  %36 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  %37 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %36, i32 0, i32 2
  store float %35, float* %37, align 4
  %38 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  %39 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %38, i32 0, i32 2
  %40 = load float, float* %39, align 4
  %41 = fpext float %40 to double
  %42 = fsub double 1.000000e+00, %41
  %43 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  %44 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %43, i32 0, i32 3
  %45 = load float, float* %44, align 8
  %46 = fpext float %45 to double
  %47 = fsub double %42, %46
  %48 = fptrunc double %47 to float
  %49 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  %50 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %49, i32 0, i32 1
  store float %48, float* %50, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal float @DBtoLIN(%struct.klatt_global_t*, i64) #0 {
  %3 = alloca %struct.klatt_global_t*, align 8
  %4 = alloca i64, align 8
  store %struct.klatt_global_t* %0, %struct.klatt_global_t** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  %6 = icmp slt i64 %5, 0
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_DBtoLIN, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_DBtoLIN, i64 0, i64 1)
  store i64 0, i64* %4, align 8
  br label %25

; <label>:9:                                      ; preds = %2
  %10 = load i64, i64* %4, align 8
  %11 = icmp sge i64 %10, 88
  br i1 %11, label %12, label %23

; <label>:12:                                     ; preds = %9
  %13 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %14 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %13, i32 0, i32 1
  %15 = load i32, i32* %14, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %21, label %17

; <label>:17:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_DBtoLIN, i64 0, i64 3)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_DBtoLIN, i64 0, i64 3)
  %19 = load i64, i64* %4, align 8
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.44, i32 0, i32 0), i64 %19)
  br label %21

; <label>:21:                                     ; preds = %17, %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_DBtoLIN, i64 0, i64 2)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_DBtoLIN, i64 0, i64 2)
  store i64 87, i64* %4, align 8
  br label %23

; <label>:23:                                     ; preds = %21, %9
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_DBtoLIN, i64 0, i64 0)
  %24 = add i64 %pgocount3, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_DBtoLIN, i64 0, i64 0)
  br label %25

; <label>:25:                                     ; preds = %23, %7
  %26 = load i64, i64* %4, align 8
  %27 = getelementptr inbounds [88 x float], [88 x float]* @amptable, i64 0, i64 %26
  %28 = load float, float* %27, align 4
  %29 = fpext float %28 to double
  %30 = fmul double %29, 1.000000e-03
  %31 = fptrunc double %30 to float
  ret float %31
}

; Function Attrs: nounwind uwtable
define internal void @setzeroabc(i64, i64, %struct.resonator_t*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setzeroabc, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setzeroabc, i64 0, i64 0)
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.resonator_t*, align 8
  store i64 %0, i64* %5, align 8
  store i64 %1, i64* %6, align 8
  store %struct.resonator_t* %2, %struct.resonator_t** %7, align 8
  %8 = load i64, i64* %5, align 8
  %9 = load i64, i64* %6, align 8
  %10 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  call void @setabc(i64 %8, i64 %9, %struct.resonator_t* %10)
  %11 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  %12 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %11, i32 0, i32 1
  %13 = load float, float* %12, align 8
  %14 = fpext float %13 to double
  %15 = fdiv double 1.000000e+00, %14
  %16 = fptrunc double %15 to float
  %17 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  %18 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %17, i32 0, i32 1
  store float %16, float* %18, align 8
  %19 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  %20 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %19, i32 0, i32 1
  %21 = load float, float* %20, align 8
  %22 = fsub float -0.000000e+00, %21
  %23 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  %24 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %23, i32 0, i32 2
  %25 = load float, float* %24, align 4
  %26 = fmul float %25, %22
  store float %26, float* %24, align 4
  %27 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  %28 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %27, i32 0, i32 1
  %29 = load float, float* %28, align 8
  %30 = fsub float -0.000000e+00, %29
  %31 = load %struct.resonator_t*, %struct.resonator_t** %7, align 8
  %32 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %31, i32 0, i32 3
  %33 = load float, float* %32, align 8
  %34 = fmul float %33, %30
  store float %34, float* %32, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @setabcg(i64, i64, %struct.resonator_t*, float) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setabcg, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setabcg, i64 0, i64 0)
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca %struct.resonator_t*, align 8
  %9 = alloca float, align 4
  store i64 %0, i64* %6, align 8
  store i64 %1, i64* %7, align 8
  store %struct.resonator_t* %2, %struct.resonator_t** %8, align 8
  store float %3, float* %9, align 4
  %10 = load i64, i64* %6, align 8
  %11 = load i64, i64* %7, align 8
  %12 = load %struct.resonator_t*, %struct.resonator_t** %8, align 8
  call void @setabc(i64 %10, i64 %11, %struct.resonator_t* %12)
  %13 = load float, float* %9, align 4
  %14 = load %struct.resonator_t*, %struct.resonator_t** %8, align 8
  %15 = getelementptr inbounds %struct.resonator_t, %struct.resonator_t* %14, i32 0, i32 1
  %16 = load float, float* %15, align 8
  %17 = fmul float %16, %13
  store float %17, float* %15, align 8
  ret void
}

; Function Attrs: nounwind
declare double @sin(double) #3

; Function Attrs: nounwind uwtable
define internal void @overload_warning(%struct.klatt_global_t*, i64) #0 {
  %3 = alloca %struct.klatt_global_t*, align 8
  %4 = alloca i64, align 8
  store %struct.klatt_global_t* %0, %struct.klatt_global_t** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i32, i32* @warnsw, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %23

; <label>:7:                                      ; preds = %2
  %8 = load i32, i32* @warnsw, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @warnsw, align 4
  %10 = load %struct.klatt_global_t*, %struct.klatt_global_t** %3, align 8
  %11 = getelementptr inbounds %struct.klatt_global_t, %struct.klatt_global_t* %10, i32 0, i32 1
  %12 = load i32, i32* %11, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %21, label %14

; <label>:14:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_overload_warning, i64 0, i64 2)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_overload_warning, i64 0, i64 2)
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.67, i32 0, i32 0))
  %17 = load i64, i64* %4, align 8
  %18 = call float @dBconvert(i64 %17)
  %19 = fpext float %18 to double
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.68, i32 0, i32 0), double %19)
  br label %21

; <label>:21:                                     ; preds = %14, %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_overload_warning, i64 0, i64 1)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_overload_warning, i64 0, i64 1)
  br label %23

; <label>:23:                                     ; preds = %21, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_overload_warning, i64 0, i64 0)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_overload_warning, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define internal float @dBconvert(i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_dBconvert, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_dBconvert, i64 0, i64 0)
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = sitofp i64 %4 to double
  %6 = fdiv double %5, 3.276700e+04
  %7 = call double @log10(double %6) #4
  %8 = fmul double 2.000000e+01, %7
  %9 = fptrunc double %8 to float
  ret float %9
}

; Function Attrs: nounwind
declare double @log10(double) #3

; Function Attrs: nounwind
declare double @exp(double) #3

; Function Attrs: nounwind
declare double @cos(double) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
