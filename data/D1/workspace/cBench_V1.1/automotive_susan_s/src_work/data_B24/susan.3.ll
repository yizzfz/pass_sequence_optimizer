; ModuleID = 'susan.2.ll'
source_filename = "susan.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.anon = type { i32, i32, i32, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [44 x i8] c"Usage: susan <in.pgm> <out.pgm> [options]\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"-s : Smoothing mode (default)\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"-e : Edges mode\0A\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"-c : Corners mode\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [67 x i8] c"See source code for more information about setting the thresholds\0A\00", align 1
@.str.5 = private unnamed_addr constant [60 x i8] c"-t <thresh> : Brightness threshold, all modes (default=20)\0A\00", align 1
@.str.6 = private unnamed_addr constant [107 x i8] c"-d <thresh> : Distance threshold, smoothing mode, (default=4) (use next option instead for flat 3x3 mask)\0A\00", align 1
@.str.7 = private unnamed_addr constant [49 x i8] c"-3 : Use flat 3x3 mask, edges or smoothing mode\0A\00", align 1
@.str.8 = private unnamed_addr constant [79 x i8] c"-n : No post-processing on the binary edge map (runs much faster); edges mode\0A\00", align 1
@.str.9 = private unnamed_addr constant [111 x i8] c"-q : Use faster (and usually stabler) corner mode; edge-like corner suppression not carried out; corners mode\0A\00", align 1
@.str.10 = private unnamed_addr constant [108 x i8] c"-b : Mark corners/edges with single black points instead of black with white border; corners or edges mode\0A\00", align 1
@.str.11 = private unnamed_addr constant [91 x i8] c"-p : Output initial enhancement image only; corners or edges mode (default is edges mode)\0A\00", align 1
@.str.12 = private unnamed_addr constant [77 x i8] c"\0ASUSAN Version 2l (C) 1995-1997 Stephen Smith, DRA UK. steve@fmrib.ox.ac.uk\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.13 = private unnamed_addr constant [26 x i8] c"Image %s not binary PGM.\0A\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.16 = private unnamed_addr constant [23 x i8] c"Can't input image %s.\0A\00", align 1
@.str.17 = private unnamed_addr constant [43 x i8] c"Image %s does not have binary PGM header.\0A\00", align 1
@.str.18 = private unnamed_addr constant [25 x i8] c"Image %s is wrong size.\0A\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.20 = private unnamed_addr constant [23 x i8] c"Can't output image%s.\0A\00", align 1
@.str.21 = private unnamed_addr constant [4 x i8] c"P5\0A\00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str.23 = private unnamed_addr constant [5 x i8] c"255\0A\00", align 1
@.str.24 = private unnamed_addr constant [23 x i8] c"Can't write image %s.\0A\00", align 1
@.str.25 = private unnamed_addr constant [54 x i8] c"Distance_thresh (%f) too big for integer arithmetic.\0A\00", align 1
@.str.26 = private unnamed_addr constant [61 x i8] c"Either reduce it to <=15 or recompile with variable \22total\22\0A\00", align 1
@.str.27 = private unnamed_addr constant [40 x i8] c"as a float: see top \22defines\22 section.\0A\00", align 1
@.str.28 = private unnamed_addr constant [65 x i8] c"Mask size (1.5*distance_thresh+1=%d) too big for image (%dx%d).\0A\00", align 1
@.str.29 = private unnamed_addr constant [19 x i8] c"Too many corners.\0A\00", align 1
@.str.30 = private unnamed_addr constant [26 x i8] c"No argument following -d\0A\00", align 1
@.str.31 = private unnamed_addr constant [26 x i8] c"No argument following -t\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_usage = private constant [5 x i8] c"usage"
@__profn_getint = private constant [6 x i8] c"getint"
@__profn_get_image = private constant [9 x i8] c"get_image"
@__profn_put_image = private constant [9 x i8] c"put_image"
@__profn_int_to_uchar = private constant [12 x i8] c"int_to_uchar"
@__profn_setup_brightness_lut = private constant [20 x i8] c"setup_brightness_lut"
@__profn_free_brightness_lut = private constant [19 x i8] c"free_brightness_lut"
@__profn_susan_principle = private constant [15 x i8] c"susan_principle"
@__profn_susan_principle_small = private constant [21 x i8] c"susan_principle_small"
@__profn_median = private constant [6 x i8] c"median"
@__profn_enlarge = private constant [7 x i8] c"enlarge"
@__profn_susan_smoothing = private constant [15 x i8] c"susan_smoothing"
@__profn_edge_draw = private constant [9 x i8] c"edge_draw"
@__profn_susan_thin = private constant [10 x i8] c"susan_thin"
@__profn_susan_edges = private constant [11 x i8] c"susan_edges"
@__profn_susan_edges_small = private constant [17 x i8] c"susan_edges_small"
@__profn_corner_draw = private constant [11 x i8] c"corner_draw"
@__profn_susan_corners = private constant [13 x i8] c"susan_corners"
@__profn_susan_corners_quick = private constant [19 x i8] c"susan_corners_quick"
@__profn_main1 = private constant [5 x i8] c"main1"
@__profc_usage = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6147907245870442131, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_usage, i32 0, i32 0), i8* bitcast (void ()* @usage to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_getint = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_getint = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4740209576470640809, i64 112950233978, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*)* @getint to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_get_image = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_get_image = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3051709306968522514, i64 58420482338, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_get_image, i32 0, i32 0), i8* bitcast (void (i8*, i8**, i32*, i32*)* @get_image to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_put_image = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_put_image = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6442331330228962246, i64 35717561841, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_put_image, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i32, i32)* @put_image to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_int_to_uchar = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_int_to_uchar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 316526443417710436, i64 79879894706, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_int_to_uchar, i32 0, i32 0), i8* bitcast (void (i32*, i8*, i32)* @int_to_uchar to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_setup_brightness_lut = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_setup_brightness_lut = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5838690029920664675, i64 45130900406, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_setup_brightness_lut, i32 0, i32 0), i8* bitcast (void (i8**, i32, i32)* @setup_brightness_lut to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_free_brightness_lut = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_free_brightness_lut = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2556353804103686501, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_free_brightness_lut, i32 0, i32 0), i8* bitcast (void (i8*)* @free_brightness_lut to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_susan_principle = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_susan_principle = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4513420327801232315, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle, i32 0, i32 0), i8* bitcast (void (i8*, i32*, i8*, i32, i32, i32)* @susan_principle to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_susan_principle_small = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_susan_principle_small = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 718418474276968661, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle_small, i32 0, i32 0), i8* bitcast (void (i8*, i32*, i8*, i32, i32, i32)* @susan_principle_small to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_median = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_median = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8364678950829165289, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_median, i32 0, i32 0), i8* bitcast (i8 (i8*, i32, i32, i32)* @median to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_enlarge = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_enlarge = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4423736303913460418, i64 96578180173, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_enlarge, i32 0, i32 0), i8* bitcast (void (i8**, i8*, i32*, i32*, i32)* @enlarge to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_susan_smoothing = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_susan_smoothing = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7833402155339863091, i64 294859464216, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i32 0, i32 0), i8* bitcast (void (i32, i8*, float, i32, i32, i8*)* @susan_smoothing to i8*), i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_edge_draw = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_edge_draw = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7597443890166103708, i64 92877456719, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i32, i32, i32)* @edge_draw to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_susan_thin = private global [48 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_susan_thin = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8404023235117589252, i64 655587195050, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i32 0, i32 0), i8* bitcast (void (i32*, i8*, i32, i32)* @susan_thin to i8*), i8* null, i32 48, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_susan_edges = private global [27 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_susan_edges = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3306324384658396924, i64 402322447578, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i32 0, i32 0), i8* bitcast (void (i8*, i32*, i8*, i8*, i32, i32, i32)* @susan_edges to i8*), i8* null, i32 27, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_susan_edges_small = private global [23 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_susan_edges_small = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4221848264488606388, i64 369019548392, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i32 0, i32 0), i8* bitcast (void (i8*, i32*, i8*, i8*, i32, i32, i32)* @susan_edges_small to i8*), i8* null, i32 23, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_corner_draw = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_corner_draw = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3036328098518187912, i64 43380092889, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_corner_draw, i32 0, i32 0), i8* bitcast (void (i8*, %struct.anon*, i32, i32)* @corner_draw to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_susan_corners = private global [83 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_susan_corners = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1706069792219237853, i64 930344078531, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i32 0, i32 0), i8* bitcast (void (i8*, i32*, i8*, i32, %struct.anon*, i32, i32)* @susan_corners to i8*), i8* null, i32 83, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_susan_corners_quick = private global [74 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_susan_corners_quick = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6074485476426640912, i64 783040073234, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i32 0, i32 0), i8* bitcast (void (i8*, i32*, i8*, i32, %struct.anon*, i32, i32)* @susan_corners_quick to i8*), i8* null, i32 74, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_main1 = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 337886259678, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (void (i32, i8**)* @main1 to i8*), i8* null, i32 28, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [261 x i8] c"\82\02\00usage\01getint\01get_image\01put_image\01int_to_uchar\01setup_brightness_lut\01free_brightness_lut\01susan_principle\01susan_principle_small\01median\01enlarge\01susan_smoothing\01edge_draw\01susan_thin\01susan_edges\01susan_edges_small\01corner_draw\01susan_corners\01susan_corners_quick\01main1", section "__llvm_prf_names"
@llvm.used = appending global [21 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_getint to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_get_image to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_put_image to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_int_to_uchar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_setup_brightness_lut to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_free_brightness_lut to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_susan_principle to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_susan_principle_small to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_median to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_enlarge to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_susan_smoothing to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_edge_draw to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_susan_thin to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_susan_edges to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_susan_edges_small to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_corner_draw to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_susan_corners to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_susan_corners_quick to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* getelementptr inbounds ([261 x i8], [261 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @usage() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_usage, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_usage, i64 0, i64 0)
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0))
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i32 0, i32 0))
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0))
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i32 0, i32 0))
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i32 0, i32 0))
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.5, i32 0, i32 0))
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([107 x i8], [107 x i8]* @.str.6, i32 0, i32 0))
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.7, i32 0, i32 0))
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([79 x i8], [79 x i8]* @.str.8, i32 0, i32 0))
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([111 x i8], [111 x i8]* @.str.9, i32 0, i32 0))
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @.str.10, i32 0, i32 0))
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([91 x i8], [91 x i8]* @.str.11, i32 0, i32 0))
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.12, i32 0, i32 0))
  call void @exit(i32 0) #8
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: noinline nounwind uwtable
define i32 @getint(%struct._IO_FILE*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [10000 x i8], align 16
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %8 = call i32 @_IO_getc(%struct._IO_FILE* %7)
  store i32 %8, i32* %4, align 4
  br label %9

; <label>:9:                                      ; preds = %32, %1
  %10 = load i32, i32* %4, align 4
  %11 = icmp eq i32 %10, 35
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 1)
  %14 = getelementptr inbounds [10000 x i8], [10000 x i8]* %6, i32 0, i32 0
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %16 = call i8* @fgets(i8* %14, i32 9000, %struct._IO_FILE* %15)
  br label %17

; <label>:17:                                     ; preds = %12, %9
  %18 = load i32, i32* %4, align 4
  %19 = icmp eq i32 %18, -1
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 7)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 7)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0))
  call void @exit(i32 0) #8
  unreachable

; <label>:24:                                     ; preds = %17
  %25 = load i32, i32* %4, align 4
  %26 = icmp sge i32 %25, 48
  br i1 %26, label %27, label %32

; <label>:27:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 2)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 2)
  %29 = load i32, i32* %4, align 4
  %30 = icmp sle i32 %29, 57
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %27
  br label %36

; <label>:32:                                     ; preds = %27, %24
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 0)
  %33 = add i64 %pgocount3, 1
  store i64 %33, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 0)
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %35 = call i32 @_IO_getc(%struct._IO_FILE* %34)
  store i32 %35, i32* %4, align 4
  br label %9

; <label>:36:                                     ; preds = %31
  store i32 0, i32* %5, align 4
  br label %37

; <label>:37:                                     ; preds = %58, %36
  %38 = load i32, i32* %5, align 4
  %39 = mul nsw i32 %38, 10
  %40 = load i32, i32* %4, align 4
  %41 = sub nsw i32 %40, 48
  %42 = add nsw i32 %39, %41
  store i32 %42, i32* %5, align 4
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %44 = call i32 @_IO_getc(%struct._IO_FILE* %43)
  store i32 %44, i32* %4, align 4
  %45 = load i32, i32* %4, align 4
  %46 = icmp eq i32 %45, -1
  br i1 %46, label %47, label %50

; <label>:47:                                     ; preds = %37
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 6)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 6)
  %49 = load i32, i32* %5, align 4
  store i32 %49, i32* %2, align 4
  br label %63

; <label>:50:                                     ; preds = %37
  %51 = load i32, i32* %4, align 4
  %52 = icmp slt i32 %51, 48
  br i1 %52, label %57, label %53

; <label>:53:                                     ; preds = %50
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 3)
  %54 = add i64 %pgocount5, 1
  store i64 %54, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 3)
  %55 = load i32, i32* %4, align 4
  %56 = icmp sgt i32 %55, 57
  br i1 %56, label %57, label %58

; <label>:57:                                     ; preds = %53, %50
  br label %60

; <label>:58:                                     ; preds = %53
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 4)
  %59 = add i64 %pgocount6, 1
  store i64 %59, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 4)
  br label %37

; <label>:60:                                     ; preds = %57
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 5)
  %61 = add i64 %pgocount7, 1
  store i64 %61, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getint, i64 0, i64 5)
  %62 = load i32, i32* %5, align 4
  store i32 %62, i32* %2, align 4
  br label %63

; <label>:63:                                     ; preds = %60, %47
  %64 = load i32, i32* %2, align 4
  ret i32 %64
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define void @get_image(i8*, i8**, i32*, i32*) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca [100 x i8], align 16
  %11 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i32* %2, i32** %7, align 8
  store i32* %3, i32** %8, align 8
  %12 = load i8*, i8** %5, align 8
  %13 = call %struct._IO_FILE* @fopen(i8* %12, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  store %struct._IO_FILE* %13, %struct._IO_FILE** %9, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %20

; <label>:15:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_get_image, i64 0, i64 3)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_get_image, i64 0, i64 3)
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = load i8*, i8** %5, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.16, i32 0, i32 0), i8* %18)
  call void @exit(i32 0) #8
  unreachable

; <label>:20:                                     ; preds = %4
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %22 = call i32 @fgetc(%struct._IO_FILE* %21)
  %23 = trunc i32 %22 to i8
  %24 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 0
  store i8 %23, i8* %24, align 16
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %26 = call i32 @fgetc(%struct._IO_FILE* %25)
  %27 = trunc i32 %26 to i8
  %28 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 1
  store i8 %27, i8* %28, align 1
  %29 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 0
  %30 = load i8, i8* %29, align 16
  %31 = sext i8 %30 to i32
  %32 = icmp eq i32 %31, 80
  br i1 %32, label %33, label %39

; <label>:33:                                     ; preds = %20
  %34 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 1
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp eq i32 %36, 53
  br i1 %37, label %44, label %._crit_edge

._crit_edge:                                      ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_get_image, i64 0, i64 1)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_get_image, i64 0, i64 1)
  br label %39

; <label>:39:                                     ; preds = %._crit_edge, %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_get_image, i64 0, i64 2)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_get_image, i64 0, i64 2)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = load i8*, i8** %5, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.17, i32 0, i32 0), i8* %42)
  call void @exit(i32 0) #8
  unreachable

; <label>:44:                                     ; preds = %33
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %46 = call i32 @getint(%struct._IO_FILE* %45)
  %47 = load i32*, i32** %7, align 8
  store i32 %46, i32* %47, align 4
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %49 = call i32 @getint(%struct._IO_FILE* %48)
  %50 = load i32*, i32** %8, align 8
  store i32 %49, i32* %50, align 4
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %52 = call i32 @getint(%struct._IO_FILE* %51)
  store i32 %52, i32* %11, align 4
  %53 = load i32*, i32** %7, align 8
  %54 = load i32, i32* %53, align 4
  %55 = load i32*, i32** %8, align 8
  %56 = load i32, i32* %55, align 4
  %57 = mul nsw i32 %54, %56
  %58 = sext i32 %57 to i64
  %59 = call noalias i8* @malloc(i64 %58) #7
  %60 = load i8**, i8*** %6, align 8
  store i8* %59, i8** %60, align 8
  %61 = load i8**, i8*** %6, align 8
  %62 = load i8*, i8** %61, align 8
  %63 = load i32*, i32** %7, align 8
  %64 = load i32, i32* %63, align 4
  %65 = load i32*, i32** %8, align 8
  %66 = load i32, i32* %65, align 4
  %67 = mul nsw i32 %64, %66
  %68 = sext i32 %67 to i64
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %70 = call i64 @fread(i8* %62, i64 1, i64 %68, %struct._IO_FILE* %69)
  %71 = icmp eq i64 %70, 0
  br i1 %71, label %72, label %77

; <label>:72:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_get_image, i64 0, i64 4)
  %73 = add i64 %pgocount3, 1
  store i64 %73, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_get_image, i64 0, i64 4)
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %75 = load i8*, i8** %5, align 8
  %76 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %74, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.18, i32 0, i32 0), i8* %75)
  call void @exit(i32 0) #8
  unreachable

; <label>:77:                                     ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_get_image, i64 0, i64 0)
  %78 = add i64 %pgocount4, 1
  store i64 %78, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_get_image, i64 0, i64 0)
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %80 = call i32 @fclose(%struct._IO_FILE* %79)
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fgetc(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define void @put_image(i8*, i8*, i32, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct._IO_FILE*, align 8
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %10 = load i8*, i8** %5, align 8
  %11 = call %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19, i32 0, i32 0))
  store %struct._IO_FILE* %11, %struct._IO_FILE** %9, align 8
  %12 = icmp eq %struct._IO_FILE* %11, null
  br i1 %12, label %13, label %18

; <label>:13:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_put_image, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_put_image, i64 0, i64 1)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = load i8*, i8** %5, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.20, i32 0, i32 0), i8* %16)
  call void @exit(i32 0) #8
  unreachable

; <label>:18:                                     ; preds = %4
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.21, i32 0, i32 0))
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %22 = load i32, i32* %7, align 4
  %23 = load i32, i32* %8, align 4
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i32 0, i32 0), i32 %22, i32 %23)
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.23, i32 0, i32 0))
  %27 = load i8*, i8** %6, align 8
  %28 = load i32, i32* %7, align 4
  %29 = load i32, i32* %8, align 4
  %30 = mul nsw i32 %28, %29
  %31 = sext i32 %30 to i64
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %33 = call i64 @fwrite(i8* %27, i64 %31, i64 1, %struct._IO_FILE* %32)
  %34 = icmp ne i64 %33, 1
  br i1 %34, label %35, label %40

; <label>:35:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_put_image, i64 0, i64 2)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_put_image, i64 0, i64 2)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = load i8*, i8** %5, align 8
  %39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.24, i32 0, i32 0), i8* %38)
  call void @exit(i32 0) #8
  unreachable

; <label>:40:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_put_image, i64 0, i64 0)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_put_image, i64 0, i64 0)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %43 = call i32 @fclose(%struct._IO_FILE* %42)
  ret void
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define void @int_to_uchar(i32*, i8*, i32) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %10 = load i32*, i32** %4, align 8
  %11 = getelementptr inbounds i32, i32* %10, i64 0
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %8, align 4
  %13 = load i32*, i32** %4, align 8
  %14 = getelementptr inbounds i32, i32* %13, i64 0
  %15 = load i32, i32* %14, align 4
  store i32 %15, i32* %9, align 4
  store i32 0, i32* %7, align 4
  br label %16

; <label>:16:                                     ; preds = %51, %3
  %17 = load i32, i32* %7, align 4
  %18 = load i32, i32* %6, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %55

; <label>:20:                                     ; preds = %16
  %21 = load i32*, i32** %4, align 8
  %22 = load i32, i32* %7, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32* %21, i64 %23
  %25 = load i32, i32* %24, align 4
  %26 = load i32, i32* %8, align 4
  %27 = icmp sgt i32 %25, %26
  br i1 %27, label %28, label %35

; <label>:28:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_int_to_uchar, i64 0, i64 2)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_int_to_uchar, i64 0, i64 2)
  %30 = load i32*, i32** %4, align 8
  %31 = load i32, i32* %7, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32* %30, i64 %32
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %8, align 4
  br label %35

; <label>:35:                                     ; preds = %28, %20
  %36 = load i32*, i32** %4, align 8
  %37 = load i32, i32* %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32* %36, i64 %38
  %40 = load i32, i32* %39, align 4
  %41 = load i32, i32* %9, align 4
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %50

; <label>:43:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_int_to_uchar, i64 0, i64 3)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_int_to_uchar, i64 0, i64 3)
  %45 = load i32*, i32** %4, align 8
  %46 = load i32, i32* %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32* %45, i64 %47
  %49 = load i32, i32* %48, align 4
  store i32 %49, i32* %9, align 4
  br label %50

; <label>:50:                                     ; preds = %43, %35
  br label %51

; <label>:51:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_int_to_uchar, i64 0, i64 0)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_int_to_uchar, i64 0, i64 0)
  %53 = load i32, i32* %7, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %7, align 4
  br label %16

; <label>:55:                                     ; preds = %16
  %56 = load i32, i32* %9, align 4
  %57 = load i32, i32* %8, align 4
  %58 = sub nsw i32 %57, %56
  store i32 %58, i32* %8, align 4
  store i32 0, i32* %7, align 4
  br label %59

; <label>:59:                                     ; preds = %79, %55
  %60 = load i32, i32* %7, align 4
  %61 = load i32, i32* %6, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %83

; <label>:63:                                     ; preds = %59
  %64 = load i32*, i32** %4, align 8
  %65 = load i32, i32* %7, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32* %64, i64 %66
  %68 = load i32, i32* %67, align 4
  %69 = load i32, i32* %9, align 4
  %70 = sub nsw i32 %68, %69
  %71 = mul nsw i32 %70, 255
  %72 = load i32, i32* %8, align 4
  %73 = sdiv i32 %71, %72
  %74 = trunc i32 %73 to i8
  %75 = load i8*, i8** %5, align 8
  %76 = load i32, i32* %7, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, i8* %75, i64 %77
  store i8 %74, i8* %78, align 1
  br label %79

; <label>:79:                                     ; preds = %63
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_int_to_uchar, i64 0, i64 1)
  %80 = add i64 %pgocount3, 1
  store i64 %80, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_int_to_uchar, i64 0, i64 1)
  %81 = load i32, i32* %7, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %7, align 4
  br label %59

; <label>:83:                                     ; preds = %59
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_int_to_uchar, i64 0, i64 4)
  %84 = add i64 %pgocount4, 1
  store i64 %84, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_int_to_uchar, i64 0, i64 4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @setup_brightness_lut(i8**, i32, i32) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  store i8** %0, i8*** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %9 = call noalias i8* @malloc(i64 516) #7
  %10 = load i8**, i8*** %4, align 8
  store i8* %9, i8** %10, align 8
  %11 = load i8**, i8*** %4, align 8
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 258
  %14 = load i8**, i8*** %4, align 8
  store i8* %13, i8** %14, align 8
  store i32 -256, i32* %7, align 4
  br label %15

; <label>:15:                                     ; preds = %49, %3
  %16 = load i32, i32* %7, align 4
  %17 = icmp slt i32 %16, 257
  br i1 %17, label %18, label %53

; <label>:18:                                     ; preds = %15
  %19 = load i32, i32* %7, align 4
  %20 = sitofp i32 %19 to float
  %21 = load i32, i32* %5, align 4
  %22 = sitofp i32 %21 to float
  %23 = fdiv float %20, %22
  %24 = fpext float %23 to double
  store double %24, double* %8, align 8
  %25 = load double, double* %8, align 8
  %26 = load double, double* %8, align 8
  %27 = fmul double %25, %26
  store double %27, double* %8, align 8
  %28 = load i32, i32* %6, align 4
  %29 = icmp eq i32 %28, 6
  br i1 %29, label %30, label %37

; <label>:30:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_setup_brightness_lut, i64 0, i64 1)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_setup_brightness_lut, i64 0, i64 1)
  %32 = load double, double* %8, align 8
  %33 = load double, double* %8, align 8
  %34 = fmul double %32, %33
  %35 = load double, double* %8, align 8
  %36 = fmul double %34, %35
  store double %36, double* %8, align 8
  br label %37

; <label>:37:                                     ; preds = %30, %18
  %38 = load double, double* %8, align 8
  %39 = fsub double -0.000000e+00, %38
  %40 = call double @exp(double %39) #7
  %41 = fmul double 1.000000e+02, %40
  store double %41, double* %8, align 8
  %42 = load double, double* %8, align 8
  %43 = fptoui double %42 to i8
  %44 = load i8**, i8*** %4, align 8
  %45 = load i8*, i8** %44, align 8
  %46 = load i32, i32* %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8* %45, i64 %47
  store i8 %43, i8* %48, align 1
  br label %49

; <label>:49:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_setup_brightness_lut, i64 0, i64 0)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_setup_brightness_lut, i64 0, i64 0)
  %51 = load i32, i32* %7, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %7, align 4
  br label %15

; <label>:53:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_setup_brightness_lut, i64 0, i64 2)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_setup_brightness_lut, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind
declare double @exp(double) #3

; Function Attrs: noinline nounwind uwtable
define void @free_brightness_lut(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_free_brightness_lut, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_free_brightness_lut, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load i8*, i8** %3, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 -258
  call void @free(i8* %5) #7
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define void @susan_principle(i8*, i32*, i8*, i32, i32, i32) #0 {
  %7 = alloca i8*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  store i8* %0, i8** %7, align 8
  store i32* %1, i32** %8, align 8
  store i8* %2, i8** %9, align 8
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  %18 = load i32*, i32** %8, align 8
  %19 = bitcast i32* %18 to i8*
  %20 = load i32, i32* %11, align 4
  %21 = load i32, i32* %12, align 4
  %22 = mul nsw i32 %20, %21
  %23 = sext i32 %22 to i64
  %24 = mul i64 %23, 4
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 %24, i32 4, i1 false)
  store i32 3, i32* %13, align 4
  br label %25

; <label>:25:                                     ; preds = %539, %6
  %26 = load i32, i32* %13, align 4
  %27 = load i32, i32* %12, align 4
  %28 = sub nsw i32 %27, 3
  %29 = icmp slt i32 %26, %28
  br i1 %29, label %30, label %543

; <label>:30:                                     ; preds = %25
  store i32 3, i32* %14, align 4
  br label %31

; <label>:31:                                     ; preds = %534, %30
  %32 = load i32, i32* %14, align 4
  %33 = load i32, i32* %11, align 4
  %34 = sub nsw i32 %33, 3
  %35 = icmp slt i32 %32, %34
  br i1 %35, label %36, label %538

; <label>:36:                                     ; preds = %31
  store i32 100, i32* %15, align 4
  %37 = load i8*, i8** %7, align 8
  %38 = load i32, i32* %13, align 4
  %39 = sub nsw i32 %38, 3
  %40 = load i32, i32* %11, align 4
  %41 = mul nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %37, i64 %42
  %44 = load i32, i32* %14, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8* %43, i64 %45
  %47 = getelementptr inbounds i8, i8* %46, i64 -1
  store i8* %47, i8** %16, align 8
  %48 = load i8*, i8** %9, align 8
  %49 = load i8*, i8** %7, align 8
  %50 = load i32, i32* %13, align 4
  %51 = load i32, i32* %11, align 4
  %52 = mul nsw i32 %50, %51
  %53 = load i32, i32* %14, align 4
  %54 = add nsw i32 %52, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8* %49, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8* %48, i64 %59
  store i8* %60, i8** %17, align 8
  %61 = load i8*, i8** %17, align 8
  %62 = load i8*, i8** %16, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %16, align 8
  %64 = load i8, i8* %62, align 1
  %65 = zext i8 %64 to i32
  %66 = sext i32 %65 to i64
  %67 = sub i64 0, %66
  %68 = getelementptr inbounds i8, i8* %61, i64 %67
  %69 = load i8, i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = load i32, i32* %15, align 4
  %72 = add nsw i32 %71, %70
  store i32 %72, i32* %15, align 4
  %73 = load i8*, i8** %17, align 8
  %74 = load i8*, i8** %16, align 8
  %75 = getelementptr inbounds i8, i8* %74, i32 1
  store i8* %75, i8** %16, align 8
  %76 = load i8, i8* %74, align 1
  %77 = zext i8 %76 to i32
  %78 = sext i32 %77 to i64
  %79 = sub i64 0, %78
  %80 = getelementptr inbounds i8, i8* %73, i64 %79
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i32
  %83 = load i32, i32* %15, align 4
  %84 = add nsw i32 %83, %82
  store i32 %84, i32* %15, align 4
  %85 = load i8*, i8** %17, align 8
  %86 = load i8*, i8** %16, align 8
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = sext i32 %88 to i64
  %90 = sub i64 0, %89
  %91 = getelementptr inbounds i8, i8* %85, i64 %90
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = load i32, i32* %15, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, i32* %15, align 4
  %96 = load i32, i32* %11, align 4
  %97 = sub nsw i32 %96, 3
  %98 = load i8*, i8** %16, align 8
  %99 = sext i32 %97 to i64
  %100 = getelementptr inbounds i8, i8* %98, i64 %99
  store i8* %100, i8** %16, align 8
  %101 = load i8*, i8** %17, align 8
  %102 = load i8*, i8** %16, align 8
  %103 = getelementptr inbounds i8, i8* %102, i32 1
  store i8* %103, i8** %16, align 8
  %104 = load i8, i8* %102, align 1
  %105 = zext i8 %104 to i32
  %106 = sext i32 %105 to i64
  %107 = sub i64 0, %106
  %108 = getelementptr inbounds i8, i8* %101, i64 %107
  %109 = load i8, i8* %108, align 1
  %110 = zext i8 %109 to i32
  %111 = load i32, i32* %15, align 4
  %112 = add nsw i32 %111, %110
  store i32 %112, i32* %15, align 4
  %113 = load i8*, i8** %17, align 8
  %114 = load i8*, i8** %16, align 8
  %115 = getelementptr inbounds i8, i8* %114, i32 1
  store i8* %115, i8** %16, align 8
  %116 = load i8, i8* %114, align 1
  %117 = zext i8 %116 to i32
  %118 = sext i32 %117 to i64
  %119 = sub i64 0, %118
  %120 = getelementptr inbounds i8, i8* %113, i64 %119
  %121 = load i8, i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = load i32, i32* %15, align 4
  %124 = add nsw i32 %123, %122
  store i32 %124, i32* %15, align 4
  %125 = load i8*, i8** %17, align 8
  %126 = load i8*, i8** %16, align 8
  %127 = getelementptr inbounds i8, i8* %126, i32 1
  store i8* %127, i8** %16, align 8
  %128 = load i8, i8* %126, align 1
  %129 = zext i8 %128 to i32
  %130 = sext i32 %129 to i64
  %131 = sub i64 0, %130
  %132 = getelementptr inbounds i8, i8* %125, i64 %131
  %133 = load i8, i8* %132, align 1
  %134 = zext i8 %133 to i32
  %135 = load i32, i32* %15, align 4
  %136 = add nsw i32 %135, %134
  store i32 %136, i32* %15, align 4
  %137 = load i8*, i8** %17, align 8
  %138 = load i8*, i8** %16, align 8
  %139 = getelementptr inbounds i8, i8* %138, i32 1
  store i8* %139, i8** %16, align 8
  %140 = load i8, i8* %138, align 1
  %141 = zext i8 %140 to i32
  %142 = sext i32 %141 to i64
  %143 = sub i64 0, %142
  %144 = getelementptr inbounds i8, i8* %137, i64 %143
  %145 = load i8, i8* %144, align 1
  %146 = zext i8 %145 to i32
  %147 = load i32, i32* %15, align 4
  %148 = add nsw i32 %147, %146
  store i32 %148, i32* %15, align 4
  %149 = load i8*, i8** %17, align 8
  %150 = load i8*, i8** %16, align 8
  %151 = load i8, i8* %150, align 1
  %152 = zext i8 %151 to i32
  %153 = sext i32 %152 to i64
  %154 = sub i64 0, %153
  %155 = getelementptr inbounds i8, i8* %149, i64 %154
  %156 = load i8, i8* %155, align 1
  %157 = zext i8 %156 to i32
  %158 = load i32, i32* %15, align 4
  %159 = add nsw i32 %158, %157
  store i32 %159, i32* %15, align 4
  %160 = load i32, i32* %11, align 4
  %161 = sub nsw i32 %160, 5
  %162 = load i8*, i8** %16, align 8
  %163 = sext i32 %161 to i64
  %164 = getelementptr inbounds i8, i8* %162, i64 %163
  store i8* %164, i8** %16, align 8
  %165 = load i8*, i8** %17, align 8
  %166 = load i8*, i8** %16, align 8
  %167 = getelementptr inbounds i8, i8* %166, i32 1
  store i8* %167, i8** %16, align 8
  %168 = load i8, i8* %166, align 1
  %169 = zext i8 %168 to i32
  %170 = sext i32 %169 to i64
  %171 = sub i64 0, %170
  %172 = getelementptr inbounds i8, i8* %165, i64 %171
  %173 = load i8, i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = load i32, i32* %15, align 4
  %176 = add nsw i32 %175, %174
  store i32 %176, i32* %15, align 4
  %177 = load i8*, i8** %17, align 8
  %178 = load i8*, i8** %16, align 8
  %179 = getelementptr inbounds i8, i8* %178, i32 1
  store i8* %179, i8** %16, align 8
  %180 = load i8, i8* %178, align 1
  %181 = zext i8 %180 to i32
  %182 = sext i32 %181 to i64
  %183 = sub i64 0, %182
  %184 = getelementptr inbounds i8, i8* %177, i64 %183
  %185 = load i8, i8* %184, align 1
  %186 = zext i8 %185 to i32
  %187 = load i32, i32* %15, align 4
  %188 = add nsw i32 %187, %186
  store i32 %188, i32* %15, align 4
  %189 = load i8*, i8** %17, align 8
  %190 = load i8*, i8** %16, align 8
  %191 = getelementptr inbounds i8, i8* %190, i32 1
  store i8* %191, i8** %16, align 8
  %192 = load i8, i8* %190, align 1
  %193 = zext i8 %192 to i32
  %194 = sext i32 %193 to i64
  %195 = sub i64 0, %194
  %196 = getelementptr inbounds i8, i8* %189, i64 %195
  %197 = load i8, i8* %196, align 1
  %198 = zext i8 %197 to i32
  %199 = load i32, i32* %15, align 4
  %200 = add nsw i32 %199, %198
  store i32 %200, i32* %15, align 4
  %201 = load i8*, i8** %17, align 8
  %202 = load i8*, i8** %16, align 8
  %203 = getelementptr inbounds i8, i8* %202, i32 1
  store i8* %203, i8** %16, align 8
  %204 = load i8, i8* %202, align 1
  %205 = zext i8 %204 to i32
  %206 = sext i32 %205 to i64
  %207 = sub i64 0, %206
  %208 = getelementptr inbounds i8, i8* %201, i64 %207
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = load i32, i32* %15, align 4
  %212 = add nsw i32 %211, %210
  store i32 %212, i32* %15, align 4
  %213 = load i8*, i8** %17, align 8
  %214 = load i8*, i8** %16, align 8
  %215 = getelementptr inbounds i8, i8* %214, i32 1
  store i8* %215, i8** %16, align 8
  %216 = load i8, i8* %214, align 1
  %217 = zext i8 %216 to i32
  %218 = sext i32 %217 to i64
  %219 = sub i64 0, %218
  %220 = getelementptr inbounds i8, i8* %213, i64 %219
  %221 = load i8, i8* %220, align 1
  %222 = zext i8 %221 to i32
  %223 = load i32, i32* %15, align 4
  %224 = add nsw i32 %223, %222
  store i32 %224, i32* %15, align 4
  %225 = load i8*, i8** %17, align 8
  %226 = load i8*, i8** %16, align 8
  %227 = getelementptr inbounds i8, i8* %226, i32 1
  store i8* %227, i8** %16, align 8
  %228 = load i8, i8* %226, align 1
  %229 = zext i8 %228 to i32
  %230 = sext i32 %229 to i64
  %231 = sub i64 0, %230
  %232 = getelementptr inbounds i8, i8* %225, i64 %231
  %233 = load i8, i8* %232, align 1
  %234 = zext i8 %233 to i32
  %235 = load i32, i32* %15, align 4
  %236 = add nsw i32 %235, %234
  store i32 %236, i32* %15, align 4
  %237 = load i8*, i8** %17, align 8
  %238 = load i8*, i8** %16, align 8
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = sext i32 %240 to i64
  %242 = sub i64 0, %241
  %243 = getelementptr inbounds i8, i8* %237, i64 %242
  %244 = load i8, i8* %243, align 1
  %245 = zext i8 %244 to i32
  %246 = load i32, i32* %15, align 4
  %247 = add nsw i32 %246, %245
  store i32 %247, i32* %15, align 4
  %248 = load i32, i32* %11, align 4
  %249 = sub nsw i32 %248, 6
  %250 = load i8*, i8** %16, align 8
  %251 = sext i32 %249 to i64
  %252 = getelementptr inbounds i8, i8* %250, i64 %251
  store i8* %252, i8** %16, align 8
  %253 = load i8*, i8** %17, align 8
  %254 = load i8*, i8** %16, align 8
  %255 = getelementptr inbounds i8, i8* %254, i32 1
  store i8* %255, i8** %16, align 8
  %256 = load i8, i8* %254, align 1
  %257 = zext i8 %256 to i32
  %258 = sext i32 %257 to i64
  %259 = sub i64 0, %258
  %260 = getelementptr inbounds i8, i8* %253, i64 %259
  %261 = load i8, i8* %260, align 1
  %262 = zext i8 %261 to i32
  %263 = load i32, i32* %15, align 4
  %264 = add nsw i32 %263, %262
  store i32 %264, i32* %15, align 4
  %265 = load i8*, i8** %17, align 8
  %266 = load i8*, i8** %16, align 8
  %267 = getelementptr inbounds i8, i8* %266, i32 1
  store i8* %267, i8** %16, align 8
  %268 = load i8, i8* %266, align 1
  %269 = zext i8 %268 to i32
  %270 = sext i32 %269 to i64
  %271 = sub i64 0, %270
  %272 = getelementptr inbounds i8, i8* %265, i64 %271
  %273 = load i8, i8* %272, align 1
  %274 = zext i8 %273 to i32
  %275 = load i32, i32* %15, align 4
  %276 = add nsw i32 %275, %274
  store i32 %276, i32* %15, align 4
  %277 = load i8*, i8** %17, align 8
  %278 = load i8*, i8** %16, align 8
  %279 = load i8, i8* %278, align 1
  %280 = zext i8 %279 to i32
  %281 = sext i32 %280 to i64
  %282 = sub i64 0, %281
  %283 = getelementptr inbounds i8, i8* %277, i64 %282
  %284 = load i8, i8* %283, align 1
  %285 = zext i8 %284 to i32
  %286 = load i32, i32* %15, align 4
  %287 = add nsw i32 %286, %285
  store i32 %287, i32* %15, align 4
  %288 = load i8*, i8** %16, align 8
  %289 = getelementptr inbounds i8, i8* %288, i64 2
  store i8* %289, i8** %16, align 8
  %290 = load i8*, i8** %17, align 8
  %291 = load i8*, i8** %16, align 8
  %292 = getelementptr inbounds i8, i8* %291, i32 1
  store i8* %292, i8** %16, align 8
  %293 = load i8, i8* %291, align 1
  %294 = zext i8 %293 to i32
  %295 = sext i32 %294 to i64
  %296 = sub i64 0, %295
  %297 = getelementptr inbounds i8, i8* %290, i64 %296
  %298 = load i8, i8* %297, align 1
  %299 = zext i8 %298 to i32
  %300 = load i32, i32* %15, align 4
  %301 = add nsw i32 %300, %299
  store i32 %301, i32* %15, align 4
  %302 = load i8*, i8** %17, align 8
  %303 = load i8*, i8** %16, align 8
  %304 = getelementptr inbounds i8, i8* %303, i32 1
  store i8* %304, i8** %16, align 8
  %305 = load i8, i8* %303, align 1
  %306 = zext i8 %305 to i32
  %307 = sext i32 %306 to i64
  %308 = sub i64 0, %307
  %309 = getelementptr inbounds i8, i8* %302, i64 %308
  %310 = load i8, i8* %309, align 1
  %311 = zext i8 %310 to i32
  %312 = load i32, i32* %15, align 4
  %313 = add nsw i32 %312, %311
  store i32 %313, i32* %15, align 4
  %314 = load i8*, i8** %17, align 8
  %315 = load i8*, i8** %16, align 8
  %316 = load i8, i8* %315, align 1
  %317 = zext i8 %316 to i32
  %318 = sext i32 %317 to i64
  %319 = sub i64 0, %318
  %320 = getelementptr inbounds i8, i8* %314, i64 %319
  %321 = load i8, i8* %320, align 1
  %322 = zext i8 %321 to i32
  %323 = load i32, i32* %15, align 4
  %324 = add nsw i32 %323, %322
  store i32 %324, i32* %15, align 4
  %325 = load i32, i32* %11, align 4
  %326 = sub nsw i32 %325, 6
  %327 = load i8*, i8** %16, align 8
  %328 = sext i32 %326 to i64
  %329 = getelementptr inbounds i8, i8* %327, i64 %328
  store i8* %329, i8** %16, align 8
  %330 = load i8*, i8** %17, align 8
  %331 = load i8*, i8** %16, align 8
  %332 = getelementptr inbounds i8, i8* %331, i32 1
  store i8* %332, i8** %16, align 8
  %333 = load i8, i8* %331, align 1
  %334 = zext i8 %333 to i32
  %335 = sext i32 %334 to i64
  %336 = sub i64 0, %335
  %337 = getelementptr inbounds i8, i8* %330, i64 %336
  %338 = load i8, i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = load i32, i32* %15, align 4
  %341 = add nsw i32 %340, %339
  store i32 %341, i32* %15, align 4
  %342 = load i8*, i8** %17, align 8
  %343 = load i8*, i8** %16, align 8
  %344 = getelementptr inbounds i8, i8* %343, i32 1
  store i8* %344, i8** %16, align 8
  %345 = load i8, i8* %343, align 1
  %346 = zext i8 %345 to i32
  %347 = sext i32 %346 to i64
  %348 = sub i64 0, %347
  %349 = getelementptr inbounds i8, i8* %342, i64 %348
  %350 = load i8, i8* %349, align 1
  %351 = zext i8 %350 to i32
  %352 = load i32, i32* %15, align 4
  %353 = add nsw i32 %352, %351
  store i32 %353, i32* %15, align 4
  %354 = load i8*, i8** %17, align 8
  %355 = load i8*, i8** %16, align 8
  %356 = getelementptr inbounds i8, i8* %355, i32 1
  store i8* %356, i8** %16, align 8
  %357 = load i8, i8* %355, align 1
  %358 = zext i8 %357 to i32
  %359 = sext i32 %358 to i64
  %360 = sub i64 0, %359
  %361 = getelementptr inbounds i8, i8* %354, i64 %360
  %362 = load i8, i8* %361, align 1
  %363 = zext i8 %362 to i32
  %364 = load i32, i32* %15, align 4
  %365 = add nsw i32 %364, %363
  store i32 %365, i32* %15, align 4
  %366 = load i8*, i8** %17, align 8
  %367 = load i8*, i8** %16, align 8
  %368 = getelementptr inbounds i8, i8* %367, i32 1
  store i8* %368, i8** %16, align 8
  %369 = load i8, i8* %367, align 1
  %370 = zext i8 %369 to i32
  %371 = sext i32 %370 to i64
  %372 = sub i64 0, %371
  %373 = getelementptr inbounds i8, i8* %366, i64 %372
  %374 = load i8, i8* %373, align 1
  %375 = zext i8 %374 to i32
  %376 = load i32, i32* %15, align 4
  %377 = add nsw i32 %376, %375
  store i32 %377, i32* %15, align 4
  %378 = load i8*, i8** %17, align 8
  %379 = load i8*, i8** %16, align 8
  %380 = getelementptr inbounds i8, i8* %379, i32 1
  store i8* %380, i8** %16, align 8
  %381 = load i8, i8* %379, align 1
  %382 = zext i8 %381 to i32
  %383 = sext i32 %382 to i64
  %384 = sub i64 0, %383
  %385 = getelementptr inbounds i8, i8* %378, i64 %384
  %386 = load i8, i8* %385, align 1
  %387 = zext i8 %386 to i32
  %388 = load i32, i32* %15, align 4
  %389 = add nsw i32 %388, %387
  store i32 %389, i32* %15, align 4
  %390 = load i8*, i8** %17, align 8
  %391 = load i8*, i8** %16, align 8
  %392 = getelementptr inbounds i8, i8* %391, i32 1
  store i8* %392, i8** %16, align 8
  %393 = load i8, i8* %391, align 1
  %394 = zext i8 %393 to i32
  %395 = sext i32 %394 to i64
  %396 = sub i64 0, %395
  %397 = getelementptr inbounds i8, i8* %390, i64 %396
  %398 = load i8, i8* %397, align 1
  %399 = zext i8 %398 to i32
  %400 = load i32, i32* %15, align 4
  %401 = add nsw i32 %400, %399
  store i32 %401, i32* %15, align 4
  %402 = load i8*, i8** %17, align 8
  %403 = load i8*, i8** %16, align 8
  %404 = load i8, i8* %403, align 1
  %405 = zext i8 %404 to i32
  %406 = sext i32 %405 to i64
  %407 = sub i64 0, %406
  %408 = getelementptr inbounds i8, i8* %402, i64 %407
  %409 = load i8, i8* %408, align 1
  %410 = zext i8 %409 to i32
  %411 = load i32, i32* %15, align 4
  %412 = add nsw i32 %411, %410
  store i32 %412, i32* %15, align 4
  %413 = load i32, i32* %11, align 4
  %414 = sub nsw i32 %413, 5
  %415 = load i8*, i8** %16, align 8
  %416 = sext i32 %414 to i64
  %417 = getelementptr inbounds i8, i8* %415, i64 %416
  store i8* %417, i8** %16, align 8
  %418 = load i8*, i8** %17, align 8
  %419 = load i8*, i8** %16, align 8
  %420 = getelementptr inbounds i8, i8* %419, i32 1
  store i8* %420, i8** %16, align 8
  %421 = load i8, i8* %419, align 1
  %422 = zext i8 %421 to i32
  %423 = sext i32 %422 to i64
  %424 = sub i64 0, %423
  %425 = getelementptr inbounds i8, i8* %418, i64 %424
  %426 = load i8, i8* %425, align 1
  %427 = zext i8 %426 to i32
  %428 = load i32, i32* %15, align 4
  %429 = add nsw i32 %428, %427
  store i32 %429, i32* %15, align 4
  %430 = load i8*, i8** %17, align 8
  %431 = load i8*, i8** %16, align 8
  %432 = getelementptr inbounds i8, i8* %431, i32 1
  store i8* %432, i8** %16, align 8
  %433 = load i8, i8* %431, align 1
  %434 = zext i8 %433 to i32
  %435 = sext i32 %434 to i64
  %436 = sub i64 0, %435
  %437 = getelementptr inbounds i8, i8* %430, i64 %436
  %438 = load i8, i8* %437, align 1
  %439 = zext i8 %438 to i32
  %440 = load i32, i32* %15, align 4
  %441 = add nsw i32 %440, %439
  store i32 %441, i32* %15, align 4
  %442 = load i8*, i8** %17, align 8
  %443 = load i8*, i8** %16, align 8
  %444 = getelementptr inbounds i8, i8* %443, i32 1
  store i8* %444, i8** %16, align 8
  %445 = load i8, i8* %443, align 1
  %446 = zext i8 %445 to i32
  %447 = sext i32 %446 to i64
  %448 = sub i64 0, %447
  %449 = getelementptr inbounds i8, i8* %442, i64 %448
  %450 = load i8, i8* %449, align 1
  %451 = zext i8 %450 to i32
  %452 = load i32, i32* %15, align 4
  %453 = add nsw i32 %452, %451
  store i32 %453, i32* %15, align 4
  %454 = load i8*, i8** %17, align 8
  %455 = load i8*, i8** %16, align 8
  %456 = getelementptr inbounds i8, i8* %455, i32 1
  store i8* %456, i8** %16, align 8
  %457 = load i8, i8* %455, align 1
  %458 = zext i8 %457 to i32
  %459 = sext i32 %458 to i64
  %460 = sub i64 0, %459
  %461 = getelementptr inbounds i8, i8* %454, i64 %460
  %462 = load i8, i8* %461, align 1
  %463 = zext i8 %462 to i32
  %464 = load i32, i32* %15, align 4
  %465 = add nsw i32 %464, %463
  store i32 %465, i32* %15, align 4
  %466 = load i8*, i8** %17, align 8
  %467 = load i8*, i8** %16, align 8
  %468 = load i8, i8* %467, align 1
  %469 = zext i8 %468 to i32
  %470 = sext i32 %469 to i64
  %471 = sub i64 0, %470
  %472 = getelementptr inbounds i8, i8* %466, i64 %471
  %473 = load i8, i8* %472, align 1
  %474 = zext i8 %473 to i32
  %475 = load i32, i32* %15, align 4
  %476 = add nsw i32 %475, %474
  store i32 %476, i32* %15, align 4
  %477 = load i32, i32* %11, align 4
  %478 = sub nsw i32 %477, 3
  %479 = load i8*, i8** %16, align 8
  %480 = sext i32 %478 to i64
  %481 = getelementptr inbounds i8, i8* %479, i64 %480
  store i8* %481, i8** %16, align 8
  %482 = load i8*, i8** %17, align 8
  %483 = load i8*, i8** %16, align 8
  %484 = getelementptr inbounds i8, i8* %483, i32 1
  store i8* %484, i8** %16, align 8
  %485 = load i8, i8* %483, align 1
  %486 = zext i8 %485 to i32
  %487 = sext i32 %486 to i64
  %488 = sub i64 0, %487
  %489 = getelementptr inbounds i8, i8* %482, i64 %488
  %490 = load i8, i8* %489, align 1
  %491 = zext i8 %490 to i32
  %492 = load i32, i32* %15, align 4
  %493 = add nsw i32 %492, %491
  store i32 %493, i32* %15, align 4
  %494 = load i8*, i8** %17, align 8
  %495 = load i8*, i8** %16, align 8
  %496 = getelementptr inbounds i8, i8* %495, i32 1
  store i8* %496, i8** %16, align 8
  %497 = load i8, i8* %495, align 1
  %498 = zext i8 %497 to i32
  %499 = sext i32 %498 to i64
  %500 = sub i64 0, %499
  %501 = getelementptr inbounds i8, i8* %494, i64 %500
  %502 = load i8, i8* %501, align 1
  %503 = zext i8 %502 to i32
  %504 = load i32, i32* %15, align 4
  %505 = add nsw i32 %504, %503
  store i32 %505, i32* %15, align 4
  %506 = load i8*, i8** %17, align 8
  %507 = load i8*, i8** %16, align 8
  %508 = load i8, i8* %507, align 1
  %509 = zext i8 %508 to i32
  %510 = sext i32 %509 to i64
  %511 = sub i64 0, %510
  %512 = getelementptr inbounds i8, i8* %506, i64 %511
  %513 = load i8, i8* %512, align 1
  %514 = zext i8 %513 to i32
  %515 = load i32, i32* %15, align 4
  %516 = add nsw i32 %515, %514
  store i32 %516, i32* %15, align 4
  %517 = load i32, i32* %15, align 4
  %518 = load i32, i32* %10, align 4
  %519 = icmp sle i32 %517, %518
  br i1 %519, label %520, label %533

; <label>:520:                                    ; preds = %36
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle, i64 0, i64 1)
  %521 = add i64 %pgocount, 1
  store i64 %521, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle, i64 0, i64 1)
  %522 = load i32, i32* %10, align 4
  %523 = load i32, i32* %15, align 4
  %524 = sub nsw i32 %522, %523
  %525 = load i32*, i32** %8, align 8
  %526 = load i32, i32* %13, align 4
  %527 = load i32, i32* %11, align 4
  %528 = mul nsw i32 %526, %527
  %529 = load i32, i32* %14, align 4
  %530 = add nsw i32 %528, %529
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds i32, i32* %525, i64 %531
  store i32 %524, i32* %532, align 4
  br label %533

; <label>:533:                                    ; preds = %520, %36
  br label %534

; <label>:534:                                    ; preds = %533
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle, i64 0, i64 0)
  %535 = add i64 %pgocount1, 1
  store i64 %535, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle, i64 0, i64 0)
  %536 = load i32, i32* %14, align 4
  %537 = add nsw i32 %536, 1
  store i32 %537, i32* %14, align 4
  br label %31

; <label>:538:                                    ; preds = %31
  br label %539

; <label>:539:                                    ; preds = %538
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle, i64 0, i64 2)
  %540 = add i64 %pgocount2, 1
  store i64 %540, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle, i64 0, i64 2)
  %541 = load i32, i32* %13, align 4
  %542 = add nsw i32 %541, 1
  store i32 %542, i32* %13, align 4
  br label %25

; <label>:543:                                    ; preds = %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle, i64 0, i64 3)
  %544 = add i64 %pgocount3, 1
  store i64 %544, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle, i64 0, i64 3)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: noinline nounwind uwtable
define void @susan_principle_small(i8*, i32*, i8*, i32, i32, i32) #0 {
  %7 = alloca i8*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  store i8* %0, i8** %7, align 8
  store i32* %1, i32** %8, align 8
  store i8* %2, i8** %9, align 8
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  %18 = load i32*, i32** %8, align 8
  %19 = bitcast i32* %18 to i8*
  %20 = load i32, i32* %11, align 4
  %21 = load i32, i32* %12, align 4
  %22 = mul nsw i32 %20, %21
  %23 = sext i32 %22 to i64
  %24 = mul i64 %23, 4
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 %24, i32 4, i1 false)
  store i32 730, i32* %10, align 4
  store i32 1, i32* %13, align 4
  br label %25

; <label>:25:                                     ; preds = %187, %6
  %26 = load i32, i32* %13, align 4
  %27 = load i32, i32* %12, align 4
  %28 = sub nsw i32 %27, 1
  %29 = icmp slt i32 %26, %28
  br i1 %29, label %30, label %191

; <label>:30:                                     ; preds = %25
  store i32 1, i32* %14, align 4
  br label %31

; <label>:31:                                     ; preds = %182, %30
  %32 = load i32, i32* %14, align 4
  %33 = load i32, i32* %11, align 4
  %34 = sub nsw i32 %33, 1
  %35 = icmp slt i32 %32, %34
  br i1 %35, label %36, label %186

; <label>:36:                                     ; preds = %31
  store i32 100, i32* %15, align 4
  %37 = load i8*, i8** %7, align 8
  %38 = load i32, i32* %13, align 4
  %39 = sub nsw i32 %38, 1
  %40 = load i32, i32* %11, align 4
  %41 = mul nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %37, i64 %42
  %44 = load i32, i32* %14, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8* %43, i64 %45
  %47 = getelementptr inbounds i8, i8* %46, i64 -1
  store i8* %47, i8** %16, align 8
  %48 = load i8*, i8** %9, align 8
  %49 = load i8*, i8** %7, align 8
  %50 = load i32, i32* %13, align 4
  %51 = load i32, i32* %11, align 4
  %52 = mul nsw i32 %50, %51
  %53 = load i32, i32* %14, align 4
  %54 = add nsw i32 %52, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8* %49, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8* %48, i64 %59
  store i8* %60, i8** %17, align 8
  %61 = load i8*, i8** %17, align 8
  %62 = load i8*, i8** %16, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %16, align 8
  %64 = load i8, i8* %62, align 1
  %65 = zext i8 %64 to i32
  %66 = sext i32 %65 to i64
  %67 = sub i64 0, %66
  %68 = getelementptr inbounds i8, i8* %61, i64 %67
  %69 = load i8, i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = load i32, i32* %15, align 4
  %72 = add nsw i32 %71, %70
  store i32 %72, i32* %15, align 4
  %73 = load i8*, i8** %17, align 8
  %74 = load i8*, i8** %16, align 8
  %75 = getelementptr inbounds i8, i8* %74, i32 1
  store i8* %75, i8** %16, align 8
  %76 = load i8, i8* %74, align 1
  %77 = zext i8 %76 to i32
  %78 = sext i32 %77 to i64
  %79 = sub i64 0, %78
  %80 = getelementptr inbounds i8, i8* %73, i64 %79
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i32
  %83 = load i32, i32* %15, align 4
  %84 = add nsw i32 %83, %82
  store i32 %84, i32* %15, align 4
  %85 = load i8*, i8** %17, align 8
  %86 = load i8*, i8** %16, align 8
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = sext i32 %88 to i64
  %90 = sub i64 0, %89
  %91 = getelementptr inbounds i8, i8* %85, i64 %90
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = load i32, i32* %15, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, i32* %15, align 4
  %96 = load i32, i32* %11, align 4
  %97 = sub nsw i32 %96, 2
  %98 = load i8*, i8** %16, align 8
  %99 = sext i32 %97 to i64
  %100 = getelementptr inbounds i8, i8* %98, i64 %99
  store i8* %100, i8** %16, align 8
  %101 = load i8*, i8** %17, align 8
  %102 = load i8*, i8** %16, align 8
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = sext i32 %104 to i64
  %106 = sub i64 0, %105
  %107 = getelementptr inbounds i8, i8* %101, i64 %106
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  %110 = load i32, i32* %15, align 4
  %111 = add nsw i32 %110, %109
  store i32 %111, i32* %15, align 4
  %112 = load i8*, i8** %16, align 8
  %113 = getelementptr inbounds i8, i8* %112, i64 2
  store i8* %113, i8** %16, align 8
  %114 = load i8*, i8** %17, align 8
  %115 = load i8*, i8** %16, align 8
  %116 = load i8, i8* %115, align 1
  %117 = zext i8 %116 to i32
  %118 = sext i32 %117 to i64
  %119 = sub i64 0, %118
  %120 = getelementptr inbounds i8, i8* %114, i64 %119
  %121 = load i8, i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = load i32, i32* %15, align 4
  %124 = add nsw i32 %123, %122
  store i32 %124, i32* %15, align 4
  %125 = load i32, i32* %11, align 4
  %126 = sub nsw i32 %125, 2
  %127 = load i8*, i8** %16, align 8
  %128 = sext i32 %126 to i64
  %129 = getelementptr inbounds i8, i8* %127, i64 %128
  store i8* %129, i8** %16, align 8
  %130 = load i8*, i8** %17, align 8
  %131 = load i8*, i8** %16, align 8
  %132 = getelementptr inbounds i8, i8* %131, i32 1
  store i8* %132, i8** %16, align 8
  %133 = load i8, i8* %131, align 1
  %134 = zext i8 %133 to i32
  %135 = sext i32 %134 to i64
  %136 = sub i64 0, %135
  %137 = getelementptr inbounds i8, i8* %130, i64 %136
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = load i32, i32* %15, align 4
  %141 = add nsw i32 %140, %139
  store i32 %141, i32* %15, align 4
  %142 = load i8*, i8** %17, align 8
  %143 = load i8*, i8** %16, align 8
  %144 = getelementptr inbounds i8, i8* %143, i32 1
  store i8* %144, i8** %16, align 8
  %145 = load i8, i8* %143, align 1
  %146 = zext i8 %145 to i32
  %147 = sext i32 %146 to i64
  %148 = sub i64 0, %147
  %149 = getelementptr inbounds i8, i8* %142, i64 %148
  %150 = load i8, i8* %149, align 1
  %151 = zext i8 %150 to i32
  %152 = load i32, i32* %15, align 4
  %153 = add nsw i32 %152, %151
  store i32 %153, i32* %15, align 4
  %154 = load i8*, i8** %17, align 8
  %155 = load i8*, i8** %16, align 8
  %156 = load i8, i8* %155, align 1
  %157 = zext i8 %156 to i32
  %158 = sext i32 %157 to i64
  %159 = sub i64 0, %158
  %160 = getelementptr inbounds i8, i8* %154, i64 %159
  %161 = load i8, i8* %160, align 1
  %162 = zext i8 %161 to i32
  %163 = load i32, i32* %15, align 4
  %164 = add nsw i32 %163, %162
  store i32 %164, i32* %15, align 4
  %165 = load i32, i32* %15, align 4
  %166 = load i32, i32* %10, align 4
  %167 = icmp sle i32 %165, %166
  br i1 %167, label %168, label %181

; <label>:168:                                    ; preds = %36
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle_small, i64 0, i64 1)
  %169 = add i64 %pgocount, 1
  store i64 %169, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle_small, i64 0, i64 1)
  %170 = load i32, i32* %10, align 4
  %171 = load i32, i32* %15, align 4
  %172 = sub nsw i32 %170, %171
  %173 = load i32*, i32** %8, align 8
  %174 = load i32, i32* %13, align 4
  %175 = load i32, i32* %11, align 4
  %176 = mul nsw i32 %174, %175
  %177 = load i32, i32* %14, align 4
  %178 = add nsw i32 %176, %177
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i32, i32* %173, i64 %179
  store i32 %172, i32* %180, align 4
  br label %181

; <label>:181:                                    ; preds = %168, %36
  br label %182

; <label>:182:                                    ; preds = %181
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle_small, i64 0, i64 0)
  %183 = add i64 %pgocount1, 1
  store i64 %183, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle_small, i64 0, i64 0)
  %184 = load i32, i32* %14, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %14, align 4
  br label %31

; <label>:186:                                    ; preds = %31
  br label %187

; <label>:187:                                    ; preds = %186
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle_small, i64 0, i64 2)
  %188 = add i64 %pgocount2, 1
  store i64 %188, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle_small, i64 0, i64 2)
  %189 = load i32, i32* %13, align 4
  %190 = add nsw i32 %189, 1
  store i32 %190, i32* %13, align 4
  br label %25

; <label>:191:                                    ; preds = %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle_small, i64 0, i64 3)
  %192 = add i64 %pgocount3, 1
  store i64 %192, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_susan_principle_small, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @median(i8*, i32, i32, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [8 x i32], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %13 = load i8*, i8** %5, align 8
  %14 = load i32, i32* %6, align 4
  %15 = sub nsw i32 %14, 1
  %16 = load i32, i32* %8, align 4
  %17 = mul nsw i32 %15, %16
  %18 = load i32, i32* %7, align 4
  %19 = add nsw i32 %17, %18
  %20 = sub nsw i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, i8* %13, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 0
  store i32 %24, i32* %25, align 16
  %26 = load i8*, i8** %5, align 8
  %27 = load i32, i32* %6, align 4
  %28 = sub nsw i32 %27, 1
  %29 = load i32, i32* %8, align 4
  %30 = mul nsw i32 %28, %29
  %31 = load i32, i32* %7, align 4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, i8* %26, i64 %33
  %35 = load i8, i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 1
  store i32 %36, i32* %37, align 4
  %38 = load i8*, i8** %5, align 8
  %39 = load i32, i32* %6, align 4
  %40 = sub nsw i32 %39, 1
  %41 = load i32, i32* %8, align 4
  %42 = mul nsw i32 %40, %41
  %43 = load i32, i32* %7, align 4
  %44 = add nsw i32 %42, %43
  %45 = add nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %38, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 2
  store i32 %49, i32* %50, align 8
  %51 = load i8*, i8** %5, align 8
  %52 = load i32, i32* %6, align 4
  %53 = load i32, i32* %8, align 4
  %54 = mul nsw i32 %52, %53
  %55 = load i32, i32* %7, align 4
  %56 = add nsw i32 %54, %55
  %57 = sub nsw i32 %56, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8* %51, i64 %58
  %60 = load i8, i8* %59, align 1
  %61 = zext i8 %60 to i32
  %62 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 3
  store i32 %61, i32* %62, align 4
  %63 = load i8*, i8** %5, align 8
  %64 = load i32, i32* %6, align 4
  %65 = load i32, i32* %8, align 4
  %66 = mul nsw i32 %64, %65
  %67 = load i32, i32* %7, align 4
  %68 = add nsw i32 %66, %67
  %69 = add nsw i32 %68, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %63, i64 %70
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 4
  store i32 %73, i32* %74, align 16
  %75 = load i8*, i8** %5, align 8
  %76 = load i32, i32* %6, align 4
  %77 = add nsw i32 %76, 1
  %78 = load i32, i32* %8, align 4
  %79 = mul nsw i32 %77, %78
  %80 = load i32, i32* %7, align 4
  %81 = add nsw i32 %79, %80
  %82 = sub nsw i32 %81, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8* %75, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 5
  store i32 %86, i32* %87, align 4
  %88 = load i8*, i8** %5, align 8
  %89 = load i32, i32* %6, align 4
  %90 = add nsw i32 %89, 1
  %91 = load i32, i32* %8, align 4
  %92 = mul nsw i32 %90, %91
  %93 = load i32, i32* %7, align 4
  %94 = add nsw i32 %92, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8* %88, i64 %95
  %97 = load i8, i8* %96, align 1
  %98 = zext i8 %97 to i32
  %99 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 6
  store i32 %98, i32* %99, align 8
  %100 = load i8*, i8** %5, align 8
  %101 = load i32, i32* %6, align 4
  %102 = add nsw i32 %101, 1
  %103 = load i32, i32* %8, align 4
  %104 = mul nsw i32 %102, %103
  %105 = load i32, i32* %7, align 4
  %106 = add nsw i32 %104, %105
  %107 = add nsw i32 %106, 1
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i8, i8* %100, i64 %108
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 7
  store i32 %111, i32* %112, align 4
  store i32 0, i32* %10, align 4
  br label %113

; <label>:113:                                    ; preds = %158, %4
  %114 = load i32, i32* %10, align 4
  %115 = icmp slt i32 %114, 7
  br i1 %115, label %116, label %162

; <label>:116:                                    ; preds = %113
  store i32 0, i32* %11, align 4
  br label %117

; <label>:117:                                    ; preds = %153, %116
  %118 = load i32, i32* %11, align 4
  %119 = load i32, i32* %10, align 4
  %120 = sub nsw i32 7, %119
  %121 = icmp slt i32 %118, %120
  br i1 %121, label %122, label %157

; <label>:122:                                    ; preds = %117
  %123 = load i32, i32* %11, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 %124
  %126 = load i32, i32* %125, align 4
  %127 = load i32, i32* %11, align 4
  %128 = add nsw i32 %127, 1
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 %129
  %131 = load i32, i32* %130, align 4
  %132 = icmp sgt i32 %126, %131
  br i1 %132, label %133, label %152

; <label>:133:                                    ; preds = %122
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_median, i64 0, i64 1)
  %134 = add i64 %pgocount, 1
  store i64 %134, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_median, i64 0, i64 1)
  %135 = load i32, i32* %11, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 %136
  %138 = load i32, i32* %137, align 4
  store i32 %138, i32* %12, align 4
  %139 = load i32, i32* %11, align 4
  %140 = add nsw i32 %139, 1
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 %141
  %143 = load i32, i32* %142, align 4
  %144 = load i32, i32* %11, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 %145
  store i32 %143, i32* %146, align 4
  %147 = load i32, i32* %12, align 4
  %148 = load i32, i32* %11, align 4
  %149 = add nsw i32 %148, 1
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 %150
  store i32 %147, i32* %151, align 4
  br label %152

; <label>:152:                                    ; preds = %133, %122
  br label %153

; <label>:153:                                    ; preds = %152
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_median, i64 0, i64 0)
  %154 = add i64 %pgocount1, 1
  store i64 %154, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_median, i64 0, i64 0)
  %155 = load i32, i32* %11, align 4
  %156 = add nsw i32 %155, 1
  store i32 %156, i32* %11, align 4
  br label %117

; <label>:157:                                    ; preds = %117
  br label %158

; <label>:158:                                    ; preds = %157
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_median, i64 0, i64 2)
  %159 = add i64 %pgocount2, 1
  store i64 %159, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_median, i64 0, i64 2)
  %160 = load i32, i32* %10, align 4
  %161 = add nsw i32 %160, 1
  store i32 %161, i32* %10, align 4
  br label %113

; <label>:162:                                    ; preds = %113
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_median, i64 0, i64 3)
  %163 = add i64 %pgocount3, 1
  store i64 %163, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_median, i64 0, i64 3)
  %164 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 3
  %165 = load i32, i32* %164, align 4
  %166 = getelementptr inbounds [8 x i32], [8 x i32]* %9, i64 0, i64 4
  %167 = load i32, i32* %166, align 16
  %168 = add nsw i32 %165, %167
  %169 = sdiv i32 %168, 2
  %170 = trunc i32 %169 to i8
  ret i8 %170
}

; Function Attrs: noinline nounwind uwtable
define void @enlarge(i8**, i8*, i32*, i32*, i32) #0 {
  %6 = alloca i8**, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i8** %0, i8*** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32* %2, i32** %8, align 8
  store i32* %3, i32** %9, align 8
  store i32 %4, i32* %10, align 4
  store i32 0, i32* %11, align 4
  br label %13

; <label>:13:                                     ; preds = %45, %5
  %14 = load i32, i32* %11, align 4
  %15 = load i32*, i32** %9, align 8
  %16 = load i32, i32* %15, align 4
  %17 = icmp slt i32 %14, %16
  br i1 %17, label %18, label %49

; <label>:18:                                     ; preds = %13
  %19 = load i8*, i8** %7, align 8
  %20 = load i32, i32* %11, align 4
  %21 = load i32, i32* %10, align 4
  %22 = add nsw i32 %20, %21
  %23 = load i32*, i32** %8, align 8
  %24 = load i32, i32* %23, align 4
  %25 = load i32, i32* %10, align 4
  %26 = mul nsw i32 2, %25
  %27 = add nsw i32 %24, %26
  %28 = mul nsw i32 %22, %27
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %19, i64 %29
  %31 = load i32, i32* %10, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %30, i64 %32
  %34 = load i8**, i8*** %6, align 8
  %35 = load i8*, i8** %34, align 8
  %36 = load i32, i32* %11, align 4
  %37 = load i32*, i32** %8, align 8
  %38 = load i32, i32* %37, align 4
  %39 = mul nsw i32 %36, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8* %35, i64 %40
  %42 = load i32*, i32** %8, align 8
  %43 = load i32, i32* %42, align 4
  %44 = sext i32 %43 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* %41, i64 %44, i32 1, i1 false)
  br label %45

; <label>:45:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_enlarge, i64 0, i64 1)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_enlarge, i64 0, i64 1)
  %47 = load i32, i32* %11, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %11, align 4
  br label %13

; <label>:49:                                     ; preds = %13
  store i32 0, i32* %11, align 4
  br label %50

; <label>:50:                                     ; preds = %115, %49
  %51 = load i32, i32* %11, align 4
  %52 = load i32, i32* %10, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %119

; <label>:54:                                     ; preds = %50
  %55 = load i8*, i8** %7, align 8
  %56 = load i32, i32* %10, align 4
  %57 = sub nsw i32 %56, 1
  %58 = load i32, i32* %11, align 4
  %59 = sub nsw i32 %57, %58
  %60 = load i32*, i32** %8, align 8
  %61 = load i32, i32* %60, align 4
  %62 = load i32, i32* %10, align 4
  %63 = mul nsw i32 2, %62
  %64 = add nsw i32 %61, %63
  %65 = mul nsw i32 %59, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %55, i64 %66
  %68 = load i32, i32* %10, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8* %67, i64 %69
  %71 = load i8**, i8*** %6, align 8
  %72 = load i8*, i8** %71, align 8
  %73 = load i32, i32* %11, align 4
  %74 = load i32*, i32** %8, align 8
  %75 = load i32, i32* %74, align 4
  %76 = mul nsw i32 %73, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, i8* %72, i64 %77
  %79 = load i32*, i32** %8, align 8
  %80 = load i32, i32* %79, align 4
  %81 = sext i32 %80 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %70, i8* %78, i64 %81, i32 1, i1 false)
  %82 = load i8*, i8** %7, align 8
  %83 = load i32*, i32** %9, align 8
  %84 = load i32, i32* %83, align 4
  %85 = load i32, i32* %10, align 4
  %86 = add nsw i32 %84, %85
  %87 = load i32, i32* %11, align 4
  %88 = add nsw i32 %86, %87
  %89 = load i32*, i32** %8, align 8
  %90 = load i32, i32* %89, align 4
  %91 = load i32, i32* %10, align 4
  %92 = mul nsw i32 2, %91
  %93 = add nsw i32 %90, %92
  %94 = mul nsw i32 %88, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8* %82, i64 %95
  %97 = load i32, i32* %10, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8* %96, i64 %98
  %100 = load i8**, i8*** %6, align 8
  %101 = load i8*, i8** %100, align 8
  %102 = load i32*, i32** %9, align 8
  %103 = load i32, i32* %102, align 4
  %104 = load i32, i32* %11, align 4
  %105 = sub nsw i32 %103, %104
  %106 = sub nsw i32 %105, 1
  %107 = load i32*, i32** %8, align 8
  %108 = load i32, i32* %107, align 4
  %109 = mul nsw i32 %106, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8* %101, i64 %110
  %112 = load i32*, i32** %8, align 8
  %113 = load i32, i32* %112, align 4
  %114 = sext i32 %113 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %99, i8* %111, i64 %114, i32 1, i1 false)
  br label %115

; <label>:115:                                    ; preds = %54
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_enlarge, i64 0, i64 2)
  %116 = add i64 %pgocount1, 1
  store i64 %116, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_enlarge, i64 0, i64 2)
  %117 = load i32, i32* %11, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %11, align 4
  br label %50

; <label>:119:                                    ; preds = %50
  store i32 0, i32* %11, align 4
  br label %120

; <label>:120:                                    ; preds = %205, %119
  %121 = load i32, i32* %11, align 4
  %122 = load i32, i32* %10, align 4
  %123 = icmp slt i32 %121, %122
  br i1 %123, label %124, label %209

; <label>:124:                                    ; preds = %120
  store i32 0, i32* %12, align 4
  br label %125

; <label>:125:                                    ; preds = %200, %124
  %126 = load i32, i32* %12, align 4
  %127 = load i32*, i32** %9, align 8
  %128 = load i32, i32* %127, align 4
  %129 = load i32, i32* %10, align 4
  %130 = mul nsw i32 2, %129
  %131 = add nsw i32 %128, %130
  %132 = icmp slt i32 %126, %131
  br i1 %132, label %133, label %204

; <label>:133:                                    ; preds = %125
  %134 = load i8*, i8** %7, align 8
  %135 = load i32, i32* %12, align 4
  %136 = load i32*, i32** %8, align 8
  %137 = load i32, i32* %136, align 4
  %138 = load i32, i32* %10, align 4
  %139 = mul nsw i32 2, %138
  %140 = add nsw i32 %137, %139
  %141 = mul nsw i32 %135, %140
  %142 = load i32, i32* %10, align 4
  %143 = add nsw i32 %141, %142
  %144 = load i32, i32* %11, align 4
  %145 = add nsw i32 %143, %144
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i8, i8* %134, i64 %146
  %148 = load i8, i8* %147, align 1
  %149 = load i8*, i8** %7, align 8
  %150 = load i32, i32* %12, align 4
  %151 = load i32*, i32** %8, align 8
  %152 = load i32, i32* %151, align 4
  %153 = load i32, i32* %10, align 4
  %154 = mul nsw i32 2, %153
  %155 = add nsw i32 %152, %154
  %156 = mul nsw i32 %150, %155
  %157 = load i32, i32* %10, align 4
  %158 = add nsw i32 %156, %157
  %159 = sub nsw i32 %158, 1
  %160 = load i32, i32* %11, align 4
  %161 = sub nsw i32 %159, %160
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i8, i8* %149, i64 %162
  store i8 %148, i8* %163, align 1
  %164 = load i8*, i8** %7, align 8
  %165 = load i32, i32* %12, align 4
  %166 = load i32*, i32** %8, align 8
  %167 = load i32, i32* %166, align 4
  %168 = load i32, i32* %10, align 4
  %169 = mul nsw i32 2, %168
  %170 = add nsw i32 %167, %169
  %171 = mul nsw i32 %165, %170
  %172 = load i32*, i32** %8, align 8
  %173 = load i32, i32* %172, align 4
  %174 = add nsw i32 %171, %173
  %175 = load i32, i32* %10, align 4
  %176 = add nsw i32 %174, %175
  %177 = sub nsw i32 %176, 1
  %178 = load i32, i32* %11, align 4
  %179 = sub nsw i32 %177, %178
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds i8, i8* %164, i64 %180
  %182 = load i8, i8* %181, align 1
  %183 = load i8*, i8** %7, align 8
  %184 = load i32, i32* %12, align 4
  %185 = load i32*, i32** %8, align 8
  %186 = load i32, i32* %185, align 4
  %187 = load i32, i32* %10, align 4
  %188 = mul nsw i32 2, %187
  %189 = add nsw i32 %186, %188
  %190 = mul nsw i32 %184, %189
  %191 = load i32*, i32** %8, align 8
  %192 = load i32, i32* %191, align 4
  %193 = add nsw i32 %190, %192
  %194 = load i32, i32* %10, align 4
  %195 = add nsw i32 %193, %194
  %196 = load i32, i32* %11, align 4
  %197 = add nsw i32 %195, %196
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds i8, i8* %183, i64 %198
  store i8 %182, i8* %199, align 1
  br label %200

; <label>:200:                                    ; preds = %133
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_enlarge, i64 0, i64 0)
  %201 = add i64 %pgocount2, 1
  store i64 %201, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_enlarge, i64 0, i64 0)
  %202 = load i32, i32* %12, align 4
  %203 = add nsw i32 %202, 1
  store i32 %203, i32* %12, align 4
  br label %125

; <label>:204:                                    ; preds = %125
  br label %205

; <label>:205:                                    ; preds = %204
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_enlarge, i64 0, i64 3)
  %206 = add i64 %pgocount3, 1
  store i64 %206, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_enlarge, i64 0, i64 3)
  %207 = load i32, i32* %11, align 4
  %208 = add nsw i32 %207, 1
  store i32 %208, i32* %11, align 4
  br label %120

; <label>:209:                                    ; preds = %120
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_enlarge, i64 0, i64 4)
  %210 = add i64 %pgocount4, 1
  store i64 %210, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_enlarge, i64 0, i64 4)
  %211 = load i32, i32* %10, align 4
  %212 = mul nsw i32 2, %211
  %213 = load i32*, i32** %8, align 8
  %214 = load i32, i32* %213, align 4
  %215 = add nsw i32 %214, %212
  store i32 %215, i32* %213, align 4
  %216 = load i32, i32* %10, align 4
  %217 = mul nsw i32 2, %216
  %218 = load i32*, i32** %9, align 8
  %219 = load i32, i32* %218, align 4
  %220 = add nsw i32 %219, %217
  store i32 %220, i32* %218, align 4
  %221 = load i8*, i8** %7, align 8
  %222 = load i8**, i8*** %6, align 8
  store i8* %221, i8** %222, align 8
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: noinline nounwind uwtable
define void @susan_smoothing(i32, i8*, float, i32, i32, i8*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca float, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca float, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i8*, align 8
  %26 = alloca i8*, align 8
  %27 = alloca i8*, align 8
  %28 = alloca i8*, align 8
  %29 = alloca i8*, align 8
  %30 = alloca i8*, align 8
  %31 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i8* %1, i8** %8, align 8
  store float %2, float* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i8* %5, i8** %12, align 8
  %32 = load i8*, i8** %8, align 8
  store i8* %32, i8** %29, align 8
  %33 = load i32, i32* %7, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %42

; <label>:35:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 12)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 12)
  %37 = load float, float* %9, align 4
  %38 = fpext float %37 to double
  %39 = fmul double 1.500000e+00, %38
  %40 = fptosi double %39 to i32
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %16, align 4
  br label %43

; <label>:42:                                     ; preds = %6
  store i32 1, i32* %16, align 4
  br label %43

; <label>:43:                                     ; preds = %42, %35
  store i32 0, i32* %31, align 4
  %44 = load float, float* %9, align 4
  %45 = fcmp ogt float %44, 1.500000e+01
  br i1 %45, label %46, label %57

; <label>:46:                                     ; preds = %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 11)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 11)
  %48 = load i32, i32* %31, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %57

; <label>:50:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 16)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 16)
  %52 = load float, float* %9, align 4
  %53 = fpext float %52 to double
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.25, i32 0, i32 0), double %53)
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.26, i32 0, i32 0))
  %56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.27, i32 0, i32 0))
  call void @exit(i32 0) #8
  unreachable

; <label>:57:                                     ; preds = %46, %43
  %58 = load i32, i32* %16, align 4
  %59 = mul nsw i32 2, %58
  %60 = add nsw i32 %59, 1
  %61 = load i32, i32* %10, align 4
  %62 = icmp sgt i32 %60, %61
  br i1 %62, label %70, label %63

; <label>:63:                                     ; preds = %57
  %64 = load i32, i32* %16, align 4
  %65 = mul nsw i32 2, %64
  %66 = add nsw i32 %65, 1
  %67 = load i32, i32* %11, align 4
  %68 = icmp sgt i32 %66, %67
  br i1 %68, label %._crit_edge, label %76

._crit_edge:                                      ; preds = %63
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 14)
  %69 = add i64 %pgocount3, 1
  store i64 %69, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 14)
  br label %70

; <label>:70:                                     ; preds = %._crit_edge, %57
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 15)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 15)
  %72 = load i32, i32* %16, align 4
  %73 = load i32, i32* %10, align 4
  %74 = load i32, i32* %11, align 4
  %75 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.28, i32 0, i32 0), i32 %72, i32 %73, i32 %74)
  call void @exit(i32 0) #8
  unreachable

; <label>:76:                                     ; preds = %63
  %77 = load i32, i32* %10, align 4
  %78 = load i32, i32* %16, align 4
  %79 = mul nsw i32 %78, 2
  %80 = add nsw i32 %77, %79
  %81 = load i32, i32* %11, align 4
  %82 = load i32, i32* %16, align 4
  %83 = mul nsw i32 %82, 2
  %84 = add nsw i32 %81, %83
  %85 = mul nsw i32 %80, %84
  %86 = sext i32 %85 to i64
  %87 = call noalias i8* @malloc(i64 %86) #7
  store i8* %87, i8** %30, align 8
  %88 = load i8*, i8** %30, align 8
  %89 = load i32, i32* %16, align 4
  call void @enlarge(i8** %8, i8* %88, i32* %10, i32* %11, i32 %89)
  %90 = load i32, i32* %7, align 4
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %285

; <label>:92:                                     ; preds = %76
  %93 = load i32, i32* %16, align 4
  %94 = mul nsw i32 %93, 2
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %14, align 4
  %96 = load i32, i32* %10, align 4
  %97 = load i32, i32* %14, align 4
  %98 = sub nsw i32 %96, %97
  store i32 %98, i32* %15, align 4
  %99 = load i32, i32* %14, align 4
  %100 = load i32, i32* %14, align 4
  %101 = mul nsw i32 %99, %100
  %102 = sext i32 %101 to i64
  %103 = call noalias i8* @malloc(i64 %102) #7
  store i8* %103, i8** %26, align 8
  %104 = load i8*, i8** %26, align 8
  store i8* %104, i8** %27, align 8
  %105 = load float, float* %9, align 4
  %106 = load float, float* %9, align 4
  %107 = fmul float %105, %106
  %108 = fsub float -0.000000e+00, %107
  store float %108, float* %13, align 4
  %109 = load i32, i32* %16, align 4
  %110 = sub nsw i32 0, %109
  store i32 %110, i32* %17, align 4
  br label %111

; <label>:111:                                    ; preds = %146, %92
  %112 = load i32, i32* %17, align 4
  %113 = load i32, i32* %16, align 4
  %114 = icmp sle i32 %112, %113
  br i1 %114, label %115, label %150

; <label>:115:                                    ; preds = %111
  %116 = load i32, i32* %16, align 4
  %117 = sub nsw i32 0, %116
  store i32 %117, i32* %18, align 4
  br label %118

; <label>:118:                                    ; preds = %141, %115
  %119 = load i32, i32* %18, align 4
  %120 = load i32, i32* %16, align 4
  %121 = icmp sle i32 %119, %120
  br i1 %121, label %122, label %145

; <label>:122:                                    ; preds = %118
  %123 = load i32, i32* %17, align 4
  %124 = load i32, i32* %17, align 4
  %125 = mul nsw i32 %123, %124
  %126 = load i32, i32* %18, align 4
  %127 = load i32, i32* %18, align 4
  %128 = mul nsw i32 %126, %127
  %129 = add nsw i32 %125, %128
  %130 = sitofp i32 %129 to float
  %131 = load float, float* %13, align 4
  %132 = fdiv float %130, %131
  %133 = fpext float %132 to double
  %134 = call double @exp(double %133) #7
  %135 = fmul double 1.000000e+02, %134
  %136 = fptosi double %135 to i32
  store i32 %136, i32* %19, align 4
  %137 = load i32, i32* %19, align 4
  %138 = trunc i32 %137 to i8
  %139 = load i8*, i8** %27, align 8
  %140 = getelementptr inbounds i8, i8* %139, i32 1
  store i8* %140, i8** %27, align 8
  store i8 %138, i8* %139, align 1
  br label %141

; <label>:141:                                    ; preds = %122
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 4)
  %142 = add i64 %pgocount5, 1
  store i64 %142, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 4)
  %143 = load i32, i32* %18, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %18, align 4
  br label %118

; <label>:145:                                    ; preds = %118
  br label %146

; <label>:146:                                    ; preds = %145
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 8)
  %147 = add i64 %pgocount6, 1
  store i64 %147, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 8)
  %148 = load i32, i32* %17, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, i32* %17, align 4
  br label %111

; <label>:150:                                    ; preds = %111
  %151 = load i32, i32* %16, align 4
  store i32 %151, i32* %17, align 4
  br label %152

; <label>:152:                                    ; preds = %278, %150
  %153 = load i32, i32* %17, align 4
  %154 = load i32, i32* %11, align 4
  %155 = load i32, i32* %16, align 4
  %156 = sub nsw i32 %154, %155
  %157 = icmp slt i32 %153, %156
  br i1 %157, label %158, label %282

; <label>:158:                                    ; preds = %152
  %159 = load i32, i32* %16, align 4
  store i32 %159, i32* %18, align 4
  br label %160

; <label>:160:                                    ; preds = %273, %158
  %161 = load i32, i32* %18, align 4
  %162 = load i32, i32* %10, align 4
  %163 = load i32, i32* %16, align 4
  %164 = sub nsw i32 %162, %163
  %165 = icmp slt i32 %161, %164
  br i1 %165, label %166, label %277

; <label>:166:                                    ; preds = %160
  store i32 0, i32* %21, align 4
  store i32 0, i32* %31, align 4
  %167 = load i8*, i8** %26, align 8
  store i8* %167, i8** %27, align 8
  %168 = load i8*, i8** %8, align 8
  %169 = load i32, i32* %17, align 4
  %170 = load i32, i32* %16, align 4
  %171 = sub nsw i32 %169, %170
  %172 = load i32, i32* %10, align 4
  %173 = mul nsw i32 %171, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i8, i8* %168, i64 %174
  %176 = load i32, i32* %18, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i8, i8* %175, i64 %177
  %179 = load i32, i32* %16, align 4
  %180 = sext i32 %179 to i64
  %181 = sub i64 0, %180
  %182 = getelementptr inbounds i8, i8* %178, i64 %181
  store i8* %182, i8** %25, align 8
  %183 = load i8*, i8** %8, align 8
  %184 = load i32, i32* %17, align 4
  %185 = load i32, i32* %10, align 4
  %186 = mul nsw i32 %184, %185
  %187 = load i32, i32* %18, align 4
  %188 = add nsw i32 %186, %187
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i8, i8* %183, i64 %189
  %191 = load i8, i8* %190, align 1
  %192 = zext i8 %191 to i32
  store i32 %192, i32* %24, align 4
  %193 = load i8*, i8** %12, align 8
  %194 = load i32, i32* %24, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i8, i8* %193, i64 %195
  store i8* %196, i8** %28, align 8
  %197 = load i32, i32* %16, align 4
  %198 = sub nsw i32 0, %197
  store i32 %198, i32* %20, align 4
  br label %199

; <label>:199:                                    ; preds = %244, %166
  %200 = load i32, i32* %20, align 4
  %201 = load i32, i32* %16, align 4
  %202 = icmp sle i32 %200, %201
  br i1 %202, label %203, label %248

; <label>:203:                                    ; preds = %199
  %204 = load i32, i32* %16, align 4
  %205 = sub nsw i32 0, %204
  store i32 %205, i32* %19, align 4
  br label %206

; <label>:206:                                    ; preds = %235, %203
  %207 = load i32, i32* %19, align 4
  %208 = load i32, i32* %16, align 4
  %209 = icmp sle i32 %207, %208
  br i1 %209, label %210, label %239

; <label>:210:                                    ; preds = %206
  %211 = load i8*, i8** %25, align 8
  %212 = getelementptr inbounds i8, i8* %211, i32 1
  store i8* %212, i8** %25, align 8
  %213 = load i8, i8* %211, align 1
  %214 = zext i8 %213 to i32
  store i32 %214, i32* %22, align 4
  %215 = load i8*, i8** %27, align 8
  %216 = getelementptr inbounds i8, i8* %215, i32 1
  store i8* %216, i8** %27, align 8
  %217 = load i8, i8* %215, align 1
  %218 = zext i8 %217 to i32
  %219 = load i8*, i8** %28, align 8
  %220 = load i32, i32* %22, align 4
  %221 = sext i32 %220 to i64
  %222 = sub i64 0, %221
  %223 = getelementptr inbounds i8, i8* %219, i64 %222
  %224 = load i8, i8* %223, align 1
  %225 = zext i8 %224 to i32
  %226 = mul nsw i32 %218, %225
  store i32 %226, i32* %23, align 4
  %227 = load i32, i32* %23, align 4
  %228 = load i32, i32* %21, align 4
  %229 = add nsw i32 %228, %227
  store i32 %229, i32* %21, align 4
  %230 = load i32, i32* %23, align 4
  %231 = load i32, i32* %22, align 4
  %232 = mul nsw i32 %230, %231
  %233 = load i32, i32* %31, align 4
  %234 = add nsw i32 %233, %232
  store i32 %234, i32* %31, align 4
  br label %235

; <label>:235:                                    ; preds = %210
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 0)
  %236 = add i64 %pgocount7, 1
  store i64 %236, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 0)
  %237 = load i32, i32* %19, align 4
  %238 = add nsw i32 %237, 1
  store i32 %238, i32* %19, align 4
  br label %206

; <label>:239:                                    ; preds = %206
  %240 = load i32, i32* %15, align 4
  %241 = load i8*, i8** %25, align 8
  %242 = sext i32 %240 to i64
  %243 = getelementptr inbounds i8, i8* %241, i64 %242
  store i8* %243, i8** %25, align 8
  br label %244

; <label>:244:                                    ; preds = %239
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 1)
  %245 = add i64 %pgocount8, 1
  store i64 %245, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 1)
  %246 = load i32, i32* %20, align 4
  %247 = add nsw i32 %246, 1
  store i32 %247, i32* %20, align 4
  br label %199

; <label>:248:                                    ; preds = %199
  %249 = load i32, i32* %21, align 4
  %250 = sub nsw i32 %249, 10000
  store i32 %250, i32* %23, align 4
  %251 = load i32, i32* %23, align 4
  %252 = icmp eq i32 %251, 0
  br i1 %252, label %253, label %262

; <label>:253:                                    ; preds = %248
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 2)
  %254 = add i64 %pgocount9, 1
  store i64 %254, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 2)
  %255 = load i8*, i8** %8, align 8
  %256 = load i32, i32* %17, align 4
  %257 = load i32, i32* %18, align 4
  %258 = load i32, i32* %10, align 4
  %259 = call zeroext i8 @median(i8* %255, i32 %256, i32 %257, i32 %258)
  %260 = load i8*, i8** %29, align 8
  %261 = getelementptr inbounds i8, i8* %260, i32 1
  store i8* %261, i8** %29, align 8
  store i8 %259, i8* %260, align 1
  br label %272

; <label>:262:                                    ; preds = %248
  %263 = load i32, i32* %31, align 4
  %264 = load i32, i32* %24, align 4
  %265 = mul nsw i32 %264, 10000
  %266 = sub nsw i32 %263, %265
  %267 = load i32, i32* %23, align 4
  %268 = sdiv i32 %266, %267
  %269 = trunc i32 %268 to i8
  %270 = load i8*, i8** %29, align 8
  %271 = getelementptr inbounds i8, i8* %270, i32 1
  store i8* %271, i8** %29, align 8
  store i8 %269, i8* %270, align 1
  br label %272

; <label>:272:                                    ; preds = %262, %253
  br label %273

; <label>:273:                                    ; preds = %272
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 5)
  %274 = add i64 %pgocount10, 1
  store i64 %274, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 5)
  %275 = load i32, i32* %18, align 4
  %276 = add nsw i32 %275, 1
  store i32 %276, i32* %18, align 4
  br label %160

; <label>:277:                                    ; preds = %160
  br label %278

; <label>:278:                                    ; preds = %277
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 9)
  %279 = add i64 %pgocount11, 1
  store i64 %279, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 9)
  %280 = load i32, i32* %17, align 4
  %281 = add nsw i32 %280, 1
  store i32 %281, i32* %17, align 4
  br label %152

; <label>:282:                                    ; preds = %152
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 13)
  %283 = add i64 %pgocount12, 1
  store i64 %283, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 13)
  %284 = load i8*, i8** %26, align 8
  call void @free(i8* %284) #7
  br label %536

; <label>:285:                                    ; preds = %76
  store i32 1, i32* %17, align 4
  br label %286

; <label>:286:                                    ; preds = %530, %285
  %287 = load i32, i32* %17, align 4
  %288 = load i32, i32* %11, align 4
  %289 = sub nsw i32 %288, 1
  %290 = icmp slt i32 %287, %289
  br i1 %290, label %291, label %534

; <label>:291:                                    ; preds = %286
  store i32 1, i32* %18, align 4
  br label %292

; <label>:292:                                    ; preds = %525, %291
  %293 = load i32, i32* %18, align 4
  %294 = load i32, i32* %10, align 4
  %295 = sub nsw i32 %294, 1
  %296 = icmp slt i32 %293, %295
  br i1 %296, label %297, label %529

; <label>:297:                                    ; preds = %292
  store i32 0, i32* %21, align 4
  store i32 0, i32* %31, align 4
  %298 = load i8*, i8** %8, align 8
  %299 = load i32, i32* %17, align 4
  %300 = sub nsw i32 %299, 1
  %301 = load i32, i32* %10, align 4
  %302 = mul nsw i32 %300, %301
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds i8, i8* %298, i64 %303
  %305 = load i32, i32* %18, align 4
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds i8, i8* %304, i64 %306
  %308 = getelementptr inbounds i8, i8* %307, i64 -1
  store i8* %308, i8** %25, align 8
  %309 = load i8*, i8** %8, align 8
  %310 = load i32, i32* %17, align 4
  %311 = load i32, i32* %10, align 4
  %312 = mul nsw i32 %310, %311
  %313 = load i32, i32* %18, align 4
  %314 = add nsw i32 %312, %313
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds i8, i8* %309, i64 %315
  %317 = load i8, i8* %316, align 1
  %318 = zext i8 %317 to i32
  store i32 %318, i32* %24, align 4
  %319 = load i8*, i8** %12, align 8
  %320 = load i32, i32* %24, align 4
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds i8, i8* %319, i64 %321
  store i8* %322, i8** %28, align 8
  %323 = load i8*, i8** %25, align 8
  %324 = getelementptr inbounds i8, i8* %323, i32 1
  store i8* %324, i8** %25, align 8
  %325 = load i8, i8* %323, align 1
  %326 = zext i8 %325 to i32
  store i32 %326, i32* %22, align 4
  %327 = load i8*, i8** %28, align 8
  %328 = load i32, i32* %22, align 4
  %329 = sext i32 %328 to i64
  %330 = sub i64 0, %329
  %331 = getelementptr inbounds i8, i8* %327, i64 %330
  %332 = load i8, i8* %331, align 1
  %333 = zext i8 %332 to i32
  store i32 %333, i32* %23, align 4
  %334 = load i32, i32* %23, align 4
  %335 = load i32, i32* %21, align 4
  %336 = add nsw i32 %335, %334
  store i32 %336, i32* %21, align 4
  %337 = load i32, i32* %23, align 4
  %338 = load i32, i32* %22, align 4
  %339 = mul nsw i32 %337, %338
  %340 = load i32, i32* %31, align 4
  %341 = add nsw i32 %340, %339
  store i32 %341, i32* %31, align 4
  %342 = load i8*, i8** %25, align 8
  %343 = getelementptr inbounds i8, i8* %342, i32 1
  store i8* %343, i8** %25, align 8
  %344 = load i8, i8* %342, align 1
  %345 = zext i8 %344 to i32
  store i32 %345, i32* %22, align 4
  %346 = load i8*, i8** %28, align 8
  %347 = load i32, i32* %22, align 4
  %348 = sext i32 %347 to i64
  %349 = sub i64 0, %348
  %350 = getelementptr inbounds i8, i8* %346, i64 %349
  %351 = load i8, i8* %350, align 1
  %352 = zext i8 %351 to i32
  store i32 %352, i32* %23, align 4
  %353 = load i32, i32* %23, align 4
  %354 = load i32, i32* %21, align 4
  %355 = add nsw i32 %354, %353
  store i32 %355, i32* %21, align 4
  %356 = load i32, i32* %23, align 4
  %357 = load i32, i32* %22, align 4
  %358 = mul nsw i32 %356, %357
  %359 = load i32, i32* %31, align 4
  %360 = add nsw i32 %359, %358
  store i32 %360, i32* %31, align 4
  %361 = load i8*, i8** %25, align 8
  %362 = load i8, i8* %361, align 1
  %363 = zext i8 %362 to i32
  store i32 %363, i32* %22, align 4
  %364 = load i8*, i8** %28, align 8
  %365 = load i32, i32* %22, align 4
  %366 = sext i32 %365 to i64
  %367 = sub i64 0, %366
  %368 = getelementptr inbounds i8, i8* %364, i64 %367
  %369 = load i8, i8* %368, align 1
  %370 = zext i8 %369 to i32
  store i32 %370, i32* %23, align 4
  %371 = load i32, i32* %23, align 4
  %372 = load i32, i32* %21, align 4
  %373 = add nsw i32 %372, %371
  store i32 %373, i32* %21, align 4
  %374 = load i32, i32* %23, align 4
  %375 = load i32, i32* %22, align 4
  %376 = mul nsw i32 %374, %375
  %377 = load i32, i32* %31, align 4
  %378 = add nsw i32 %377, %376
  store i32 %378, i32* %31, align 4
  %379 = load i32, i32* %10, align 4
  %380 = sub nsw i32 %379, 2
  %381 = load i8*, i8** %25, align 8
  %382 = sext i32 %380 to i64
  %383 = getelementptr inbounds i8, i8* %381, i64 %382
  store i8* %383, i8** %25, align 8
  %384 = load i8*, i8** %25, align 8
  %385 = getelementptr inbounds i8, i8* %384, i32 1
  store i8* %385, i8** %25, align 8
  %386 = load i8, i8* %384, align 1
  %387 = zext i8 %386 to i32
  store i32 %387, i32* %22, align 4
  %388 = load i8*, i8** %28, align 8
  %389 = load i32, i32* %22, align 4
  %390 = sext i32 %389 to i64
  %391 = sub i64 0, %390
  %392 = getelementptr inbounds i8, i8* %388, i64 %391
  %393 = load i8, i8* %392, align 1
  %394 = zext i8 %393 to i32
  store i32 %394, i32* %23, align 4
  %395 = load i32, i32* %23, align 4
  %396 = load i32, i32* %21, align 4
  %397 = add nsw i32 %396, %395
  store i32 %397, i32* %21, align 4
  %398 = load i32, i32* %23, align 4
  %399 = load i32, i32* %22, align 4
  %400 = mul nsw i32 %398, %399
  %401 = load i32, i32* %31, align 4
  %402 = add nsw i32 %401, %400
  store i32 %402, i32* %31, align 4
  %403 = load i8*, i8** %25, align 8
  %404 = getelementptr inbounds i8, i8* %403, i32 1
  store i8* %404, i8** %25, align 8
  %405 = load i8, i8* %403, align 1
  %406 = zext i8 %405 to i32
  store i32 %406, i32* %22, align 4
  %407 = load i8*, i8** %28, align 8
  %408 = load i32, i32* %22, align 4
  %409 = sext i32 %408 to i64
  %410 = sub i64 0, %409
  %411 = getelementptr inbounds i8, i8* %407, i64 %410
  %412 = load i8, i8* %411, align 1
  %413 = zext i8 %412 to i32
  store i32 %413, i32* %23, align 4
  %414 = load i32, i32* %23, align 4
  %415 = load i32, i32* %21, align 4
  %416 = add nsw i32 %415, %414
  store i32 %416, i32* %21, align 4
  %417 = load i32, i32* %23, align 4
  %418 = load i32, i32* %22, align 4
  %419 = mul nsw i32 %417, %418
  %420 = load i32, i32* %31, align 4
  %421 = add nsw i32 %420, %419
  store i32 %421, i32* %31, align 4
  %422 = load i8*, i8** %25, align 8
  %423 = load i8, i8* %422, align 1
  %424 = zext i8 %423 to i32
  store i32 %424, i32* %22, align 4
  %425 = load i8*, i8** %28, align 8
  %426 = load i32, i32* %22, align 4
  %427 = sext i32 %426 to i64
  %428 = sub i64 0, %427
  %429 = getelementptr inbounds i8, i8* %425, i64 %428
  %430 = load i8, i8* %429, align 1
  %431 = zext i8 %430 to i32
  store i32 %431, i32* %23, align 4
  %432 = load i32, i32* %23, align 4
  %433 = load i32, i32* %21, align 4
  %434 = add nsw i32 %433, %432
  store i32 %434, i32* %21, align 4
  %435 = load i32, i32* %23, align 4
  %436 = load i32, i32* %22, align 4
  %437 = mul nsw i32 %435, %436
  %438 = load i32, i32* %31, align 4
  %439 = add nsw i32 %438, %437
  store i32 %439, i32* %31, align 4
  %440 = load i32, i32* %10, align 4
  %441 = sub nsw i32 %440, 2
  %442 = load i8*, i8** %25, align 8
  %443 = sext i32 %441 to i64
  %444 = getelementptr inbounds i8, i8* %442, i64 %443
  store i8* %444, i8** %25, align 8
  %445 = load i8*, i8** %25, align 8
  %446 = getelementptr inbounds i8, i8* %445, i32 1
  store i8* %446, i8** %25, align 8
  %447 = load i8, i8* %445, align 1
  %448 = zext i8 %447 to i32
  store i32 %448, i32* %22, align 4
  %449 = load i8*, i8** %28, align 8
  %450 = load i32, i32* %22, align 4
  %451 = sext i32 %450 to i64
  %452 = sub i64 0, %451
  %453 = getelementptr inbounds i8, i8* %449, i64 %452
  %454 = load i8, i8* %453, align 1
  %455 = zext i8 %454 to i32
  store i32 %455, i32* %23, align 4
  %456 = load i32, i32* %23, align 4
  %457 = load i32, i32* %21, align 4
  %458 = add nsw i32 %457, %456
  store i32 %458, i32* %21, align 4
  %459 = load i32, i32* %23, align 4
  %460 = load i32, i32* %22, align 4
  %461 = mul nsw i32 %459, %460
  %462 = load i32, i32* %31, align 4
  %463 = add nsw i32 %462, %461
  store i32 %463, i32* %31, align 4
  %464 = load i8*, i8** %25, align 8
  %465 = getelementptr inbounds i8, i8* %464, i32 1
  store i8* %465, i8** %25, align 8
  %466 = load i8, i8* %464, align 1
  %467 = zext i8 %466 to i32
  store i32 %467, i32* %22, align 4
  %468 = load i8*, i8** %28, align 8
  %469 = load i32, i32* %22, align 4
  %470 = sext i32 %469 to i64
  %471 = sub i64 0, %470
  %472 = getelementptr inbounds i8, i8* %468, i64 %471
  %473 = load i8, i8* %472, align 1
  %474 = zext i8 %473 to i32
  store i32 %474, i32* %23, align 4
  %475 = load i32, i32* %23, align 4
  %476 = load i32, i32* %21, align 4
  %477 = add nsw i32 %476, %475
  store i32 %477, i32* %21, align 4
  %478 = load i32, i32* %23, align 4
  %479 = load i32, i32* %22, align 4
  %480 = mul nsw i32 %478, %479
  %481 = load i32, i32* %31, align 4
  %482 = add nsw i32 %481, %480
  store i32 %482, i32* %31, align 4
  %483 = load i8*, i8** %25, align 8
  %484 = load i8, i8* %483, align 1
  %485 = zext i8 %484 to i32
  store i32 %485, i32* %22, align 4
  %486 = load i8*, i8** %28, align 8
  %487 = load i32, i32* %22, align 4
  %488 = sext i32 %487 to i64
  %489 = sub i64 0, %488
  %490 = getelementptr inbounds i8, i8* %486, i64 %489
  %491 = load i8, i8* %490, align 1
  %492 = zext i8 %491 to i32
  store i32 %492, i32* %23, align 4
  %493 = load i32, i32* %23, align 4
  %494 = load i32, i32* %21, align 4
  %495 = add nsw i32 %494, %493
  store i32 %495, i32* %21, align 4
  %496 = load i32, i32* %23, align 4
  %497 = load i32, i32* %22, align 4
  %498 = mul nsw i32 %496, %497
  %499 = load i32, i32* %31, align 4
  %500 = add nsw i32 %499, %498
  store i32 %500, i32* %31, align 4
  %501 = load i32, i32* %21, align 4
  %502 = sub nsw i32 %501, 100
  store i32 %502, i32* %23, align 4
  %503 = load i32, i32* %23, align 4
  %504 = icmp eq i32 %503, 0
  br i1 %504, label %505, label %513

; <label>:505:                                    ; preds = %297
  %506 = load i8*, i8** %8, align 8
  %507 = load i32, i32* %17, align 4
  %508 = load i32, i32* %18, align 4
  %509 = load i32, i32* %10, align 4
  %510 = call zeroext i8 @median(i8* %506, i32 %507, i32 %508, i32 %509)
  %511 = load i8*, i8** %29, align 8
  %512 = getelementptr inbounds i8, i8* %511, i32 1
  store i8* %512, i8** %29, align 8
  store i8 %510, i8* %511, align 1
  br label %524

; <label>:513:                                    ; preds = %297
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 3)
  %514 = add i64 %pgocount13, 1
  store i64 %514, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 3)
  %515 = load i32, i32* %31, align 4
  %516 = load i32, i32* %24, align 4
  %517 = mul nsw i32 %516, 100
  %518 = sub nsw i32 %515, %517
  %519 = load i32, i32* %23, align 4
  %520 = sdiv i32 %518, %519
  %521 = trunc i32 %520 to i8
  %522 = load i8*, i8** %29, align 8
  %523 = getelementptr inbounds i8, i8* %522, i32 1
  store i8* %523, i8** %29, align 8
  store i8 %521, i8* %522, align 1
  br label %524

; <label>:524:                                    ; preds = %513, %505
  br label %525

; <label>:525:                                    ; preds = %524
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 6)
  %526 = add i64 %pgocount14, 1
  store i64 %526, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 6)
  %527 = load i32, i32* %18, align 4
  %528 = add nsw i32 %527, 1
  store i32 %528, i32* %18, align 4
  br label %292

; <label>:529:                                    ; preds = %292
  br label %530

; <label>:530:                                    ; preds = %529
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 7)
  %531 = add i64 %pgocount15, 1
  store i64 %531, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 7)
  %532 = load i32, i32* %17, align 4
  %533 = add nsw i32 %532, 1
  store i32 %533, i32* %17, align 4
  br label %286

; <label>:534:                                    ; preds = %286
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 10)
  %535 = add i64 %pgocount16, 1
  store i64 %535, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_susan_smoothing, i64 0, i64 10)
  br label %536

; <label>:536:                                    ; preds = %534, %282
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @edge_draw(i8*, i8*, i32, i32, i32) #0 {
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  store i8* %0, i8** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  %14 = load i32, i32* %10, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %77

; <label>:16:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 5)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 5)
  %18 = load i8*, i8** %7, align 8
  store i8* %18, i8** %13, align 8
  store i32 0, i32* %11, align 4
  br label %19

; <label>:19:                                     ; preds = %72, %16
  %20 = load i32, i32* %11, align 4
  %21 = load i32, i32* %8, align 4
  %22 = load i32, i32* %9, align 4
  %23 = mul nsw i32 %21, %22
  %24 = icmp slt i32 %20, %23
  br i1 %24, label %25, label %76

; <label>:25:                                     ; preds = %19
  %26 = load i8*, i8** %13, align 8
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = icmp slt i32 %28, 8
  br i1 %29, label %30, label %69

; <label>:30:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 3)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 3)
  %32 = load i8*, i8** %6, align 8
  %33 = load i8*, i8** %13, align 8
  %34 = load i8*, i8** %7, align 8
  %35 = ptrtoint i8* %33 to i64
  %36 = ptrtoint i8* %34 to i64
  %37 = sub i64 %35, %36
  %38 = getelementptr inbounds i8, i8* %32, i64 %37
  %39 = load i32, i32* %8, align 4
  %40 = sext i32 %39 to i64
  %41 = sub i64 0, %40
  %42 = getelementptr inbounds i8, i8* %38, i64 %41
  %43 = getelementptr inbounds i8, i8* %42, i64 -1
  store i8* %43, i8** %12, align 8
  %44 = load i8*, i8** %12, align 8
  %45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %45, i8** %12, align 8
  store i8 -1, i8* %44, align 1
  %46 = load i8*, i8** %12, align 8
  %47 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %47, i8** %12, align 8
  store i8 -1, i8* %46, align 1
  %48 = load i8*, i8** %12, align 8
  store i8 -1, i8* %48, align 1
  %49 = load i32, i32* %8, align 4
  %50 = sub nsw i32 %49, 2
  %51 = load i8*, i8** %12, align 8
  %52 = sext i32 %50 to i64
  %53 = getelementptr inbounds i8, i8* %51, i64 %52
  store i8* %53, i8** %12, align 8
  %54 = load i8*, i8** %12, align 8
  %55 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %55, i8** %12, align 8
  store i8 -1, i8* %54, align 1
  %56 = load i8*, i8** %12, align 8
  %57 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %57, i8** %12, align 8
  %58 = load i8*, i8** %12, align 8
  store i8 -1, i8* %58, align 1
  %59 = load i32, i32* %8, align 4
  %60 = sub nsw i32 %59, 2
  %61 = load i8*, i8** %12, align 8
  %62 = sext i32 %60 to i64
  %63 = getelementptr inbounds i8, i8* %61, i64 %62
  store i8* %63, i8** %12, align 8
  %64 = load i8*, i8** %12, align 8
  %65 = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %65, i8** %12, align 8
  store i8 -1, i8* %64, align 1
  %66 = load i8*, i8** %12, align 8
  %67 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %67, i8** %12, align 8
  store i8 -1, i8* %66, align 1
  %68 = load i8*, i8** %12, align 8
  store i8 -1, i8* %68, align 1
  br label %69

; <label>:69:                                     ; preds = %30, %25
  %70 = load i8*, i8** %13, align 8
  %71 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %71, i8** %13, align 8
  br label %72

; <label>:72:                                     ; preds = %69
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 2)
  %73 = add i64 %pgocount2, 1
  store i64 %73, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 2)
  %74 = load i32, i32* %11, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %11, align 4
  br label %19

; <label>:76:                                     ; preds = %19
  br label %77

; <label>:77:                                     ; preds = %76, %5
  %78 = load i8*, i8** %7, align 8
  store i8* %78, i8** %13, align 8
  store i32 0, i32* %11, align 4
  br label %79

; <label>:79:                                     ; preds = %103, %77
  %80 = load i32, i32* %11, align 4
  %81 = load i32, i32* %8, align 4
  %82 = load i32, i32* %9, align 4
  %83 = mul nsw i32 %81, %82
  %84 = icmp slt i32 %80, %83
  br i1 %84, label %85, label %106

; <label>:85:                                     ; preds = %79
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 0)
  %86 = add i64 %pgocount3, 1
  store i64 %86, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 0)
  %87 = load i8*, i8** %13, align 8
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = icmp slt i32 %89, 8
  br i1 %90, label %91, label %100

; <label>:91:                                     ; preds = %85
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 1)
  %92 = add i64 %pgocount4, 1
  store i64 %92, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 1)
  %93 = load i8*, i8** %6, align 8
  %94 = load i8*, i8** %13, align 8
  %95 = load i8*, i8** %7, align 8
  %96 = ptrtoint i8* %94 to i64
  %97 = ptrtoint i8* %95 to i64
  %98 = sub i64 %96, %97
  %99 = getelementptr inbounds i8, i8* %93, i64 %98
  store i8 0, i8* %99, align 1
  br label %100

; <label>:100:                                    ; preds = %91, %85
  %101 = load i8*, i8** %13, align 8
  %102 = getelementptr inbounds i8, i8* %101, i32 1
  store i8* %102, i8** %13, align 8
  br label %103

; <label>:103:                                    ; preds = %100
  %104 = load i32, i32* %11, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %11, align 4
  br label %79

; <label>:106:                                    ; preds = %79
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 4)
  %107 = add i64 %pgocount5, 1
  store i64 %107, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_edge_draw, i64 0, i64 4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @susan_thin(i32*, i8*, i32, i32) #0 {
  %5 = alloca i32*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [9 x i32], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i8*, align 8
  store i32* %0, i32** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32 0, i32* %25, align 4
  store i32 0, i32* %26, align 4
  store i32 4, i32* %29, align 4
  br label %32

; <label>:32:                                     ; preds = %1353, %4
  %33 = load i32, i32* %29, align 4
  %34 = load i32, i32* %8, align 4
  %35 = sub nsw i32 %34, 4
  %36 = icmp slt i32 %33, %35
  br i1 %36, label %37, label %1356

; <label>:37:                                     ; preds = %32
  %pgocount = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 21)
  %38 = add i64 %pgocount, 1
  store i64 %38, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 21)
  store i32 4, i32* %30, align 4
  br label %39

; <label>:39:                                     ; preds = %1348, %37
  %40 = load i32, i32* %30, align 4
  %41 = load i32, i32* %7, align 4
  %42 = sub nsw i32 %41, 4
  %43 = icmp slt i32 %40, %42
  br i1 %43, label %44, label %1352

; <label>:44:                                     ; preds = %39
  %45 = load i8*, i8** %6, align 8
  %46 = load i32, i32* %29, align 4
  %47 = load i32, i32* %7, align 4
  %48 = mul nsw i32 %46, %47
  %49 = load i32, i32* %30, align 4
  %50 = add nsw i32 %48, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %45, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = icmp slt i32 %54, 8
  br i1 %55, label %56, label %1347

; <label>:56:                                     ; preds = %44
  %57 = load i32*, i32** %5, align 8
  %58 = load i32, i32* %29, align 4
  %59 = load i32, i32* %7, align 4
  %60 = mul nsw i32 %58, %59
  %61 = load i32, i32* %30, align 4
  %62 = add nsw i32 %60, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32* %57, i64 %63
  %65 = load i32, i32* %64, align 4
  store i32 %65, i32* %10, align 4
  %66 = load i8*, i8** %6, align 8
  %67 = load i32, i32* %29, align 4
  %68 = sub nsw i32 %67, 1
  %69 = load i32, i32* %7, align 4
  %70 = mul nsw i32 %68, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8* %66, i64 %71
  %73 = load i32, i32* %30, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8* %72, i64 %74
  %76 = getelementptr inbounds i8, i8* %75, i64 -1
  store i8* %76, i8** %31, align 8
  %77 = load i8*, i8** %31, align 8
  %78 = load i8, i8* %77, align 1
  %79 = zext i8 %78 to i32
  %80 = icmp slt i32 %79, 8
  %81 = zext i1 %80 to i32
  %82 = load i8*, i8** %31, align 8
  %83 = getelementptr inbounds i8, i8* %82, i64 1
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = icmp slt i32 %85, 8
  %87 = zext i1 %86 to i32
  %88 = add nsw i32 %81, %87
  %89 = load i8*, i8** %31, align 8
  %90 = getelementptr inbounds i8, i8* %89, i64 2
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i32
  %93 = icmp slt i32 %92, 8
  %94 = zext i1 %93 to i32
  %95 = add nsw i32 %88, %94
  %96 = load i8*, i8** %31, align 8
  %97 = load i32, i32* %7, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8* %96, i64 %98
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = icmp slt i32 %101, 8
  %103 = zext i1 %102 to i32
  %104 = add nsw i32 %95, %103
  %105 = load i8*, i8** %31, align 8
  %106 = load i32, i32* %7, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8* %105, i64 %107
  %109 = getelementptr inbounds i8, i8* %108, i64 2
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = icmp slt i32 %111, 8
  %113 = zext i1 %112 to i32
  %114 = add nsw i32 %104, %113
  %115 = load i8*, i8** %31, align 8
  %116 = load i32, i32* %7, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i8, i8* %115, i64 %117
  %119 = load i32, i32* %7, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, i8* %118, i64 %120
  %122 = load i8, i8* %121, align 1
  %123 = zext i8 %122 to i32
  %124 = icmp slt i32 %123, 8
  %125 = zext i1 %124 to i32
  %126 = add nsw i32 %114, %125
  %127 = load i8*, i8** %31, align 8
  %128 = load i32, i32* %7, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i8, i8* %127, i64 %129
  %131 = load i32, i32* %7, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i8, i8* %130, i64 %132
  %134 = getelementptr inbounds i8, i8* %133, i64 1
  %135 = load i8, i8* %134, align 1
  %136 = zext i8 %135 to i32
  %137 = icmp slt i32 %136, 8
  %138 = zext i1 %137 to i32
  %139 = add nsw i32 %126, %138
  %140 = load i8*, i8** %31, align 8
  %141 = load i32, i32* %7, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8* %140, i64 %142
  %144 = load i32, i32* %7, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, i8* %143, i64 %145
  %147 = getelementptr inbounds i8, i8* %146, i64 2
  %148 = load i8, i8* %147, align 1
  %149 = zext i8 %148 to i32
  %150 = icmp slt i32 %149, 8
  %151 = zext i1 %150 to i32
  %152 = add nsw i32 %139, %151
  store i32 %152, i32* %24, align 4
  %153 = load i32, i32* %24, align 4
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %155, label %165

; <label>:155:                                    ; preds = %56
  %pgocount1 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 8)
  %156 = add i64 %pgocount1, 1
  store i64 %156, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 8)
  %157 = load i8*, i8** %6, align 8
  %158 = load i32, i32* %29, align 4
  %159 = load i32, i32* %7, align 4
  %160 = mul nsw i32 %158, %159
  %161 = load i32, i32* %30, align 4
  %162 = add nsw i32 %160, %161
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i8, i8* %157, i64 %163
  store i8 100, i8* %164, align 1
  br label %165

; <label>:165:                                    ; preds = %155, %56
  %166 = load i32, i32* %24, align 4
  %167 = icmp eq i32 %166, 1
  br i1 %167, label %168, label %683

; <label>:168:                                    ; preds = %165
  %pgocount2 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 6)
  %169 = add i64 %pgocount2, 1
  store i64 %169, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 6)
  %170 = load i8*, i8** %6, align 8
  %171 = load i32, i32* %29, align 4
  %172 = load i32, i32* %7, align 4
  %173 = mul nsw i32 %171, %172
  %174 = load i32, i32* %30, align 4
  %175 = add nsw i32 %173, %174
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i8, i8* %170, i64 %176
  %178 = load i8, i8* %177, align 1
  %179 = zext i8 %178 to i32
  %180 = icmp slt i32 %179, 6
  br i1 %180, label %181, label %683

; <label>:181:                                    ; preds = %168
  %182 = load i32*, i32** %5, align 8
  %183 = load i32, i32* %29, align 4
  %184 = sub nsw i32 %183, 1
  %185 = load i32, i32* %7, align 4
  %186 = mul nsw i32 %184, %185
  %187 = load i32, i32* %30, align 4
  %188 = add nsw i32 %186, %187
  %189 = sub nsw i32 %188, 1
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i32, i32* %182, i64 %190
  %192 = load i32, i32* %191, align 4
  %193 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 0
  store i32 %192, i32* %193, align 16
  %194 = load i32*, i32** %5, align 8
  %195 = load i32, i32* %29, align 4
  %196 = sub nsw i32 %195, 1
  %197 = load i32, i32* %7, align 4
  %198 = mul nsw i32 %196, %197
  %199 = load i32, i32* %30, align 4
  %200 = add nsw i32 %198, %199
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds i32, i32* %194, i64 %201
  %203 = load i32, i32* %202, align 4
  %204 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 1
  store i32 %203, i32* %204, align 4
  %205 = load i32*, i32** %5, align 8
  %206 = load i32, i32* %29, align 4
  %207 = sub nsw i32 %206, 1
  %208 = load i32, i32* %7, align 4
  %209 = mul nsw i32 %207, %208
  %210 = load i32, i32* %30, align 4
  %211 = add nsw i32 %209, %210
  %212 = add nsw i32 %211, 1
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds i32, i32* %205, i64 %213
  %215 = load i32, i32* %214, align 4
  %216 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 2
  store i32 %215, i32* %216, align 8
  %217 = load i32*, i32** %5, align 8
  %218 = load i32, i32* %29, align 4
  %219 = load i32, i32* %7, align 4
  %220 = mul nsw i32 %218, %219
  %221 = load i32, i32* %30, align 4
  %222 = add nsw i32 %220, %221
  %223 = sub nsw i32 %222, 1
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds i32, i32* %217, i64 %224
  %226 = load i32, i32* %225, align 4
  %227 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 3
  store i32 %226, i32* %227, align 4
  %228 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 4
  store i32 0, i32* %228, align 16
  %229 = load i32*, i32** %5, align 8
  %230 = load i32, i32* %29, align 4
  %231 = load i32, i32* %7, align 4
  %232 = mul nsw i32 %230, %231
  %233 = load i32, i32* %30, align 4
  %234 = add nsw i32 %232, %233
  %235 = add nsw i32 %234, 1
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds i32, i32* %229, i64 %236
  %238 = load i32, i32* %237, align 4
  %239 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 5
  store i32 %238, i32* %239, align 4
  %240 = load i32*, i32** %5, align 8
  %241 = load i32, i32* %29, align 4
  %242 = add nsw i32 %241, 1
  %243 = load i32, i32* %7, align 4
  %244 = mul nsw i32 %242, %243
  %245 = load i32, i32* %30, align 4
  %246 = add nsw i32 %244, %245
  %247 = sub nsw i32 %246, 1
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds i32, i32* %240, i64 %248
  %250 = load i32, i32* %249, align 4
  %251 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 6
  store i32 %250, i32* %251, align 8
  %252 = load i32*, i32** %5, align 8
  %253 = load i32, i32* %29, align 4
  %254 = add nsw i32 %253, 1
  %255 = load i32, i32* %7, align 4
  %256 = mul nsw i32 %254, %255
  %257 = load i32, i32* %30, align 4
  %258 = add nsw i32 %256, %257
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds i32, i32* %252, i64 %259
  %261 = load i32, i32* %260, align 4
  %262 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 7
  store i32 %261, i32* %262, align 4
  %263 = load i32*, i32** %5, align 8
  %264 = load i32, i32* %29, align 4
  %265 = add nsw i32 %264, 1
  %266 = load i32, i32* %7, align 4
  %267 = mul nsw i32 %265, %266
  %268 = load i32, i32* %30, align 4
  %269 = add nsw i32 %267, %268
  %270 = add nsw i32 %269, 1
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds i32, i32* %263, i64 %271
  %273 = load i32, i32* %272, align 4
  %274 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 8
  store i32 %273, i32* %274, align 16
  %275 = load i8*, i8** %6, align 8
  %276 = load i32, i32* %29, align 4
  %277 = sub nsw i32 %276, 1
  %278 = load i32, i32* %7, align 4
  %279 = mul nsw i32 %277, %278
  %280 = load i32, i32* %30, align 4
  %281 = add nsw i32 %279, %280
  %282 = sub nsw i32 %281, 1
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds i8, i8* %275, i64 %283
  %285 = load i8, i8* %284, align 1
  %286 = zext i8 %285 to i32
  %287 = icmp slt i32 %286, 8
  br i1 %287, label %288, label %308

; <label>:288:                                    ; preds = %181
  %pgocount3 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 13)
  %289 = add i64 %pgocount3, 1
  store i64 %289, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 13)
  %290 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 0
  store i32 0, i32* %290, align 16
  %291 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 1
  store i32 0, i32* %291, align 4
  %292 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 3
  store i32 0, i32* %292, align 4
  %293 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 2
  %294 = load i32, i32* %293, align 8
  %295 = mul nsw i32 %294, 2
  store i32 %295, i32* %293, align 8
  %296 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 6
  %297 = load i32, i32* %296, align 8
  %298 = mul nsw i32 %297, 2
  store i32 %298, i32* %296, align 8
  %299 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 5
  %300 = load i32, i32* %299, align 4
  %301 = mul nsw i32 %300, 3
  store i32 %301, i32* %299, align 4
  %302 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 7
  %303 = load i32, i32* %302, align 4
  %304 = mul nsw i32 %303, 3
  store i32 %304, i32* %302, align 4
  %305 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 8
  %306 = load i32, i32* %305, align 16
  %307 = mul nsw i32 %306, 4
  store i32 %307, i32* %305, align 16
  br label %550

; <label>:308:                                    ; preds = %181
  %309 = load i8*, i8** %6, align 8
  %310 = load i32, i32* %29, align 4
  %311 = sub nsw i32 %310, 1
  %312 = load i32, i32* %7, align 4
  %313 = mul nsw i32 %311, %312
  %314 = load i32, i32* %30, align 4
  %315 = add nsw i32 %313, %314
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds i8, i8* %309, i64 %316
  %318 = load i8, i8* %317, align 1
  %319 = zext i8 %318 to i32
  %320 = icmp slt i32 %319, 8
  br i1 %320, label %321, label %341

; <label>:321:                                    ; preds = %308
  %pgocount4 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 22)
  %322 = add i64 %pgocount4, 1
  store i64 %322, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 22)
  %323 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 1
  store i32 0, i32* %323, align 4
  %324 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 0
  store i32 0, i32* %324, align 16
  %325 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 2
  store i32 0, i32* %325, align 8
  %326 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 3
  %327 = load i32, i32* %326, align 4
  %328 = mul nsw i32 %327, 2
  store i32 %328, i32* %326, align 4
  %329 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 5
  %330 = load i32, i32* %329, align 4
  %331 = mul nsw i32 %330, 2
  store i32 %331, i32* %329, align 4
  %332 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 6
  %333 = load i32, i32* %332, align 8
  %334 = mul nsw i32 %333, 3
  store i32 %334, i32* %332, align 8
  %335 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 8
  %336 = load i32, i32* %335, align 16
  %337 = mul nsw i32 %336, 3
  store i32 %337, i32* %335, align 16
  %338 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 7
  %339 = load i32, i32* %338, align 4
  %340 = mul nsw i32 %339, 4
  store i32 %340, i32* %338, align 4
  br label %549

; <label>:341:                                    ; preds = %308
  %342 = load i8*, i8** %6, align 8
  %343 = load i32, i32* %29, align 4
  %344 = sub nsw i32 %343, 1
  %345 = load i32, i32* %7, align 4
  %346 = mul nsw i32 %344, %345
  %347 = load i32, i32* %30, align 4
  %348 = add nsw i32 %346, %347
  %349 = add nsw i32 %348, 1
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds i8, i8* %342, i64 %350
  %352 = load i8, i8* %351, align 1
  %353 = zext i8 %352 to i32
  %354 = icmp slt i32 %353, 8
  br i1 %354, label %355, label %375

; <label>:355:                                    ; preds = %341
  %pgocount5 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 32)
  %356 = add i64 %pgocount5, 1
  store i64 %356, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 32)
  %357 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 2
  store i32 0, i32* %357, align 8
  %358 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 1
  store i32 0, i32* %358, align 4
  %359 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 5
  store i32 0, i32* %359, align 4
  %360 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 0
  %361 = load i32, i32* %360, align 16
  %362 = mul nsw i32 %361, 2
  store i32 %362, i32* %360, align 16
  %363 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 8
  %364 = load i32, i32* %363, align 16
  %365 = mul nsw i32 %364, 2
  store i32 %365, i32* %363, align 16
  %366 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 3
  %367 = load i32, i32* %366, align 4
  %368 = mul nsw i32 %367, 3
  store i32 %368, i32* %366, align 4
  %369 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 7
  %370 = load i32, i32* %369, align 4
  %371 = mul nsw i32 %370, 3
  store i32 %371, i32* %369, align 4
  %372 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 6
  %373 = load i32, i32* %372, align 8
  %374 = mul nsw i32 %373, 4
  store i32 %374, i32* %372, align 8
  br label %548

; <label>:375:                                    ; preds = %341
  %376 = load i8*, i8** %6, align 8
  %377 = load i32, i32* %29, align 4
  %378 = load i32, i32* %7, align 4
  %379 = mul nsw i32 %377, %378
  %380 = load i32, i32* %30, align 4
  %381 = add nsw i32 %379, %380
  %382 = sub nsw i32 %381, 1
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds i8, i8* %376, i64 %383
  %385 = load i8, i8* %384, align 1
  %386 = zext i8 %385 to i32
  %387 = icmp slt i32 %386, 8
  br i1 %387, label %388, label %408

; <label>:388:                                    ; preds = %375
  %pgocount6 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 36)
  %389 = add i64 %pgocount6, 1
  store i64 %389, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 36)
  %390 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 3
  store i32 0, i32* %390, align 4
  %391 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 0
  store i32 0, i32* %391, align 16
  %392 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 6
  store i32 0, i32* %392, align 8
  %393 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 1
  %394 = load i32, i32* %393, align 4
  %395 = mul nsw i32 %394, 2
  store i32 %395, i32* %393, align 4
  %396 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 7
  %397 = load i32, i32* %396, align 4
  %398 = mul nsw i32 %397, 2
  store i32 %398, i32* %396, align 4
  %399 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 2
  %400 = load i32, i32* %399, align 8
  %401 = mul nsw i32 %400, 3
  store i32 %401, i32* %399, align 8
  %402 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 8
  %403 = load i32, i32* %402, align 16
  %404 = mul nsw i32 %403, 3
  store i32 %404, i32* %402, align 16
  %405 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 5
  %406 = load i32, i32* %405, align 4
  %407 = mul nsw i32 %406, 4
  store i32 %407, i32* %405, align 4
  br label %547

; <label>:408:                                    ; preds = %375
  %409 = load i8*, i8** %6, align 8
  %410 = load i32, i32* %29, align 4
  %411 = load i32, i32* %7, align 4
  %412 = mul nsw i32 %410, %411
  %413 = load i32, i32* %30, align 4
  %414 = add nsw i32 %412, %413
  %415 = add nsw i32 %414, 1
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds i8, i8* %409, i64 %416
  %418 = load i8, i8* %417, align 1
  %419 = zext i8 %418 to i32
  %420 = icmp slt i32 %419, 8
  br i1 %420, label %421, label %441

; <label>:421:                                    ; preds = %408
  %pgocount7 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 39)
  %422 = add i64 %pgocount7, 1
  store i64 %422, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 39)
  %423 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 5
  store i32 0, i32* %423, align 4
  %424 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 2
  store i32 0, i32* %424, align 8
  %425 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 8
  store i32 0, i32* %425, align 16
  %426 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 1
  %427 = load i32, i32* %426, align 4
  %428 = mul nsw i32 %427, 2
  store i32 %428, i32* %426, align 4
  %429 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 7
  %430 = load i32, i32* %429, align 4
  %431 = mul nsw i32 %430, 2
  store i32 %431, i32* %429, align 4
  %432 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 0
  %433 = load i32, i32* %432, align 16
  %434 = mul nsw i32 %433, 3
  store i32 %434, i32* %432, align 16
  %435 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 6
  %436 = load i32, i32* %435, align 8
  %437 = mul nsw i32 %436, 3
  store i32 %437, i32* %435, align 8
  %438 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 3
  %439 = load i32, i32* %438, align 4
  %440 = mul nsw i32 %439, 4
  store i32 %440, i32* %438, align 4
  br label %546

; <label>:441:                                    ; preds = %408
  %442 = load i8*, i8** %6, align 8
  %443 = load i32, i32* %29, align 4
  %444 = add nsw i32 %443, 1
  %445 = load i32, i32* %7, align 4
  %446 = mul nsw i32 %444, %445
  %447 = load i32, i32* %30, align 4
  %448 = add nsw i32 %446, %447
  %449 = sub nsw i32 %448, 1
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds i8, i8* %442, i64 %450
  %452 = load i8, i8* %451, align 1
  %453 = zext i8 %452 to i32
  %454 = icmp slt i32 %453, 8
  br i1 %454, label %455, label %475

; <label>:455:                                    ; preds = %441
  %pgocount8 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 43)
  %456 = add i64 %pgocount8, 1
  store i64 %456, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 43)
  %457 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 6
  store i32 0, i32* %457, align 8
  %458 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 3
  store i32 0, i32* %458, align 4
  %459 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 7
  store i32 0, i32* %459, align 4
  %460 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 0
  %461 = load i32, i32* %460, align 16
  %462 = mul nsw i32 %461, 2
  store i32 %462, i32* %460, align 16
  %463 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 8
  %464 = load i32, i32* %463, align 16
  %465 = mul nsw i32 %464, 2
  store i32 %465, i32* %463, align 16
  %466 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 1
  %467 = load i32, i32* %466, align 4
  %468 = mul nsw i32 %467, 3
  store i32 %468, i32* %466, align 4
  %469 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 5
  %470 = load i32, i32* %469, align 4
  %471 = mul nsw i32 %470, 3
  store i32 %471, i32* %469, align 4
  %472 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 2
  %473 = load i32, i32* %472, align 8
  %474 = mul nsw i32 %473, 4
  store i32 %474, i32* %472, align 8
  br label %545

; <label>:475:                                    ; preds = %441
  %476 = load i8*, i8** %6, align 8
  %477 = load i32, i32* %29, align 4
  %478 = add nsw i32 %477, 1
  %479 = load i32, i32* %7, align 4
  %480 = mul nsw i32 %478, %479
  %481 = load i32, i32* %30, align 4
  %482 = add nsw i32 %480, %481
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds i8, i8* %476, i64 %483
  %485 = load i8, i8* %484, align 1
  %486 = zext i8 %485 to i32
  %487 = icmp slt i32 %486, 8
  br i1 %487, label %488, label %508

; <label>:488:                                    ; preds = %475
  %pgocount9 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 45)
  %489 = add i64 %pgocount9, 1
  store i64 %489, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 45)
  %490 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 7
  store i32 0, i32* %490, align 4
  %491 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 6
  store i32 0, i32* %491, align 8
  %492 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 8
  store i32 0, i32* %492, align 16
  %493 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 3
  %494 = load i32, i32* %493, align 4
  %495 = mul nsw i32 %494, 2
  store i32 %495, i32* %493, align 4
  %496 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 5
  %497 = load i32, i32* %496, align 4
  %498 = mul nsw i32 %497, 2
  store i32 %498, i32* %496, align 4
  %499 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 0
  %500 = load i32, i32* %499, align 16
  %501 = mul nsw i32 %500, 3
  store i32 %501, i32* %499, align 16
  %502 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 2
  %503 = load i32, i32* %502, align 8
  %504 = mul nsw i32 %503, 3
  store i32 %504, i32* %502, align 8
  %505 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 1
  %506 = load i32, i32* %505, align 4
  %507 = mul nsw i32 %506, 4
  store i32 %507, i32* %505, align 4
  br label %544

; <label>:508:                                    ; preds = %475
  %509 = load i8*, i8** %6, align 8
  %510 = load i32, i32* %29, align 4
  %511 = add nsw i32 %510, 1
  %512 = load i32, i32* %7, align 4
  %513 = mul nsw i32 %511, %512
  %514 = load i32, i32* %30, align 4
  %515 = add nsw i32 %513, %514
  %516 = add nsw i32 %515, 1
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds i8, i8* %509, i64 %517
  %519 = load i8, i8* %518, align 1
  %520 = zext i8 %519 to i32
  %521 = icmp slt i32 %520, 8
  br i1 %521, label %522, label %542

; <label>:522:                                    ; preds = %508
  %pgocount10 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 47)
  %523 = add i64 %pgocount10, 1
  store i64 %523, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 47)
  %524 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 8
  store i32 0, i32* %524, align 16
  %525 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 5
  store i32 0, i32* %525, align 4
  %526 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 7
  store i32 0, i32* %526, align 4
  %527 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 6
  %528 = load i32, i32* %527, align 8
  %529 = mul nsw i32 %528, 2
  store i32 %529, i32* %527, align 8
  %530 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 2
  %531 = load i32, i32* %530, align 8
  %532 = mul nsw i32 %531, 2
  store i32 %532, i32* %530, align 8
  %533 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 1
  %534 = load i32, i32* %533, align 4
  %535 = mul nsw i32 %534, 3
  store i32 %535, i32* %533, align 4
  %536 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 3
  %537 = load i32, i32* %536, align 4
  %538 = mul nsw i32 %537, 3
  store i32 %538, i32* %536, align 4
  %539 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 0
  %540 = load i32, i32* %539, align 16
  %541 = mul nsw i32 %540, 4
  store i32 %541, i32* %539, align 16
  br label %542

; <label>:542:                                    ; preds = %522, %508
  %pgocount11 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 46)
  %543 = add i64 %pgocount11, 1
  store i64 %543, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 46)
  br label %544

; <label>:544:                                    ; preds = %542, %488
  br label %545

; <label>:545:                                    ; preds = %544, %455
  br label %546

; <label>:546:                                    ; preds = %545, %421
  br label %547

; <label>:547:                                    ; preds = %546, %388
  br label %548

; <label>:548:                                    ; preds = %547, %355
  br label %549

; <label>:549:                                    ; preds = %548, %321
  br label %550

; <label>:550:                                    ; preds = %549, %288
  store i32 0, i32* %23, align 4
  store i32 0, i32* %28, align 4
  br label %551

; <label>:551:                                    ; preds = %591, %550
  %552 = load i32, i32* %28, align 4
  %553 = icmp slt i32 %552, 3
  br i1 %553, label %554, label %595

; <label>:554:                                    ; preds = %551
  store i32 0, i32* %27, align 4
  br label %555

; <label>:555:                                    ; preds = %586, %554
  %556 = load i32, i32* %27, align 4
  %557 = icmp slt i32 %556, 3
  br i1 %557, label %558, label %590

; <label>:558:                                    ; preds = %555
  %559 = load i32, i32* %28, align 4
  %560 = load i32, i32* %28, align 4
  %561 = add nsw i32 %559, %560
  %562 = load i32, i32* %28, align 4
  %563 = add nsw i32 %561, %562
  %564 = load i32, i32* %27, align 4
  %565 = add nsw i32 %563, %564
  %566 = sext i32 %565 to i64
  %567 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 %566
  %568 = load i32, i32* %567, align 4
  %569 = load i32, i32* %23, align 4
  %570 = icmp sgt i32 %568, %569
  br i1 %570, label %571, label %585

; <label>:571:                                    ; preds = %558
  %pgocount12 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 1)
  %572 = add i64 %pgocount12, 1
  store i64 %572, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 1)
  %573 = load i32, i32* %28, align 4
  %574 = load i32, i32* %28, align 4
  %575 = add nsw i32 %573, %574
  %576 = load i32, i32* %28, align 4
  %577 = add nsw i32 %575, %576
  %578 = load i32, i32* %27, align 4
  %579 = add nsw i32 %577, %578
  %580 = sext i32 %579 to i64
  %581 = getelementptr inbounds [9 x i32], [9 x i32]* %9, i64 0, i64 %580
  %582 = load i32, i32* %581, align 4
  store i32 %582, i32* %23, align 4
  %583 = load i32, i32* %28, align 4
  store i32 %583, i32* %25, align 4
  %584 = load i32, i32* %27, align 4
  store i32 %584, i32* %26, align 4
  br label %585

; <label>:585:                                    ; preds = %571, %558
  br label %586

; <label>:586:                                    ; preds = %585
  %pgocount13 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 0)
  %587 = add i64 %pgocount13, 1
  store i64 %587, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 0)
  %588 = load i32, i32* %27, align 4
  %589 = add nsw i32 %588, 1
  store i32 %589, i32* %27, align 4
  br label %555

; <label>:590:                                    ; preds = %555
  br label %591

; <label>:591:                                    ; preds = %590
  %pgocount14 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 2)
  %592 = add i64 %pgocount14, 1
  store i64 %592, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 2)
  %593 = load i32, i32* %28, align 4
  %594 = add nsw i32 %593, 1
  store i32 %594, i32* %28, align 4
  br label %551

; <label>:595:                                    ; preds = %551
  %596 = load i32, i32* %23, align 4
  %597 = icmp sgt i32 %596, 0
  br i1 %597, label %598, label %682

; <label>:598:                                    ; preds = %595
  %599 = load i8*, i8** %6, align 8
  %600 = load i32, i32* %29, align 4
  %601 = load i32, i32* %7, align 4
  %602 = mul nsw i32 %600, %601
  %603 = load i32, i32* %30, align 4
  %604 = add nsw i32 %602, %603
  %605 = sext i32 %604 to i64
  %606 = getelementptr inbounds i8, i8* %599, i64 %605
  %607 = load i8, i8* %606, align 1
  %608 = zext i8 %607 to i32
  %609 = icmp slt i32 %608, 4
  br i1 %609, label %610, label %626

; <label>:610:                                    ; preds = %598
  %pgocount15 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 16)
  %611 = add i64 %pgocount15, 1
  store i64 %611, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 16)
  %612 = load i8*, i8** %6, align 8
  %613 = load i32, i32* %29, align 4
  %614 = load i32, i32* %25, align 4
  %615 = add nsw i32 %613, %614
  %616 = sub nsw i32 %615, 1
  %617 = load i32, i32* %7, align 4
  %618 = mul nsw i32 %616, %617
  %619 = load i32, i32* %30, align 4
  %620 = add nsw i32 %618, %619
  %621 = load i32, i32* %26, align 4
  %622 = add nsw i32 %620, %621
  %623 = sub nsw i32 %622, 1
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds i8, i8* %612, i64 %624
  store i8 4, i8* %625, align 1
  br label %654

; <label>:626:                                    ; preds = %598
  %pgocount16 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 17)
  %627 = add i64 %pgocount16, 1
  store i64 %627, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 17)
  %628 = load i8*, i8** %6, align 8
  %629 = load i32, i32* %29, align 4
  %630 = load i32, i32* %7, align 4
  %631 = mul nsw i32 %629, %630
  %632 = load i32, i32* %30, align 4
  %633 = add nsw i32 %631, %632
  %634 = sext i32 %633 to i64
  %635 = getelementptr inbounds i8, i8* %628, i64 %634
  %636 = load i8, i8* %635, align 1
  %637 = zext i8 %636 to i32
  %638 = add nsw i32 %637, 1
  %639 = trunc i32 %638 to i8
  %640 = load i8*, i8** %6, align 8
  %641 = load i32, i32* %29, align 4
  %642 = load i32, i32* %25, align 4
  %643 = add nsw i32 %641, %642
  %644 = sub nsw i32 %643, 1
  %645 = load i32, i32* %7, align 4
  %646 = mul nsw i32 %644, %645
  %647 = load i32, i32* %30, align 4
  %648 = add nsw i32 %646, %647
  %649 = load i32, i32* %26, align 4
  %650 = add nsw i32 %648, %649
  %651 = sub nsw i32 %650, 1
  %652 = sext i32 %651 to i64
  %653 = getelementptr inbounds i8, i8* %640, i64 %652
  store i8 %639, i8* %653, align 1
  br label %654

; <label>:654:                                    ; preds = %626, %610
  %655 = load i32, i32* %25, align 4
  %656 = load i32, i32* %25, align 4
  %657 = add nsw i32 %655, %656
  %658 = load i32, i32* %26, align 4
  %659 = add nsw i32 %657, %658
  %660 = icmp slt i32 %659, 3
  br i1 %660, label %661, label %681

; <label>:661:                                    ; preds = %654
  %662 = load i32, i32* %25, align 4
  %663 = sub nsw i32 %662, 1
  %664 = load i32, i32* %29, align 4
  %665 = add nsw i32 %664, %663
  store i32 %665, i32* %29, align 4
  %666 = load i32, i32* %26, align 4
  %667 = sub nsw i32 %666, 2
  %668 = load i32, i32* %30, align 4
  %669 = add nsw i32 %668, %667
  store i32 %669, i32* %30, align 4
  %670 = load i32, i32* %29, align 4
  %671 = icmp slt i32 %670, 4
  br i1 %671, label %672, label %674

; <label>:672:                                    ; preds = %661
  %pgocount17 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 26)
  %673 = add i64 %pgocount17, 1
  store i64 %673, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 26)
  store i32 4, i32* %29, align 4
  br label %674

; <label>:674:                                    ; preds = %672, %661
  %675 = load i32, i32* %30, align 4
  %676 = icmp slt i32 %675, 4
  br i1 %676, label %677, label %679

; <label>:677:                                    ; preds = %674
  %pgocount18 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 27)
  %678 = add i64 %pgocount18, 1
  store i64 %678, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 27)
  store i32 4, i32* %30, align 4
  br label %679

; <label>:679:                                    ; preds = %677, %674
  %pgocount19 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 18)
  %680 = add i64 %pgocount19, 1
  store i64 %680, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 18)
  br label %681

; <label>:681:                                    ; preds = %679, %654
  br label %682

; <label>:682:                                    ; preds = %681, %595
  br label %683

; <label>:683:                                    ; preds = %682, %168, %165
  %684 = load i32, i32* %24, align 4
  %685 = icmp eq i32 %684, 2
  br i1 %685, label %686, label %1160

; <label>:686:                                    ; preds = %683
  %687 = load i8*, i8** %6, align 8
  %688 = load i32, i32* %29, align 4
  %689 = sub nsw i32 %688, 1
  %690 = load i32, i32* %7, align 4
  %691 = mul nsw i32 %689, %690
  %692 = load i32, i32* %30, align 4
  %693 = add nsw i32 %691, %692
  %694 = sub nsw i32 %693, 1
  %695 = sext i32 %694 to i64
  %696 = getelementptr inbounds i8, i8* %687, i64 %695
  %697 = load i8, i8* %696, align 1
  %698 = zext i8 %697 to i32
  %699 = icmp slt i32 %698, 8
  %700 = zext i1 %699 to i32
  store i32 %700, i32* %19, align 4
  %701 = load i8*, i8** %6, align 8
  %702 = load i32, i32* %29, align 4
  %703 = sub nsw i32 %702, 1
  %704 = load i32, i32* %7, align 4
  %705 = mul nsw i32 %703, %704
  %706 = load i32, i32* %30, align 4
  %707 = add nsw i32 %705, %706
  %708 = add nsw i32 %707, 1
  %709 = sext i32 %708 to i64
  %710 = getelementptr inbounds i8, i8* %701, i64 %709
  %711 = load i8, i8* %710, align 1
  %712 = zext i8 %711 to i32
  %713 = icmp slt i32 %712, 8
  %714 = zext i1 %713 to i32
  store i32 %714, i32* %20, align 4
  %715 = load i8*, i8** %6, align 8
  %716 = load i32, i32* %29, align 4
  %717 = add nsw i32 %716, 1
  %718 = load i32, i32* %7, align 4
  %719 = mul nsw i32 %717, %718
  %720 = load i32, i32* %30, align 4
  %721 = add nsw i32 %719, %720
  %722 = sub nsw i32 %721, 1
  %723 = sext i32 %722 to i64
  %724 = getelementptr inbounds i8, i8* %715, i64 %723
  %725 = load i8, i8* %724, align 1
  %726 = zext i8 %725 to i32
  %727 = icmp slt i32 %726, 8
  %728 = zext i1 %727 to i32
  store i32 %728, i32* %21, align 4
  %729 = load i8*, i8** %6, align 8
  %730 = load i32, i32* %29, align 4
  %731 = add nsw i32 %730, 1
  %732 = load i32, i32* %7, align 4
  %733 = mul nsw i32 %731, %732
  %734 = load i32, i32* %30, align 4
  %735 = add nsw i32 %733, %734
  %736 = add nsw i32 %735, 1
  %737 = sext i32 %736 to i64
  %738 = getelementptr inbounds i8, i8* %729, i64 %737
  %739 = load i8, i8* %738, align 1
  %740 = zext i8 %739 to i32
  %741 = icmp slt i32 %740, 8
  %742 = zext i1 %741 to i32
  store i32 %742, i32* %22, align 4
  %743 = load i32, i32* %19, align 4
  %744 = load i32, i32* %20, align 4
  %745 = add nsw i32 %743, %744
  %746 = load i32, i32* %21, align 4
  %747 = add nsw i32 %745, %746
  %748 = load i32, i32* %22, align 4
  %749 = add nsw i32 %747, %748
  %750 = icmp eq i32 %749, 2
  br i1 %750, label %751, label %932

; <label>:751:                                    ; preds = %686
  %pgocount20 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 10)
  %752 = add i64 %pgocount20, 1
  store i64 %752, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 10)
  %753 = load i32, i32* %19, align 4
  %754 = load i32, i32* %22, align 4
  %755 = or i32 %753, %754
  %756 = load i32, i32* %20, align 4
  %757 = load i32, i32* %21, align 4
  %758 = or i32 %756, %757
  %759 = and i32 %755, %758
  %760 = icmp ne i32 %759, 0
  br i1 %760, label %761, label %932

; <label>:761:                                    ; preds = %751
  %762 = load i32, i32* %19, align 4
  %763 = icmp ne i32 %762, 0
  br i1 %763, label %764, label %772

; <label>:764:                                    ; preds = %761
  %765 = load i32, i32* %20, align 4
  %766 = icmp ne i32 %765, 0
  br i1 %766, label %767, label %769

; <label>:767:                                    ; preds = %764
  %pgocount21 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 25)
  %768 = add i64 %pgocount21, 1
  store i64 %768, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 25)
  store i32 0, i32* %27, align 4
  store i32 -1, i32* %28, align 4
  br label %771

; <label>:769:                                    ; preds = %764
  %pgocount22 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 28)
  %770 = add i64 %pgocount22, 1
  store i64 %770, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 28)
  store i32 -1, i32* %27, align 4
  store i32 0, i32* %28, align 4
  br label %771

; <label>:771:                                    ; preds = %769, %767
  br label %780

; <label>:772:                                    ; preds = %761
  %773 = load i32, i32* %20, align 4
  %774 = icmp ne i32 %773, 0
  br i1 %774, label %775, label %777

; <label>:775:                                    ; preds = %772
  %pgocount23 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 29)
  %776 = add i64 %pgocount23, 1
  store i64 %776, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 29)
  store i32 1, i32* %27, align 4
  store i32 0, i32* %28, align 4
  br label %779

; <label>:777:                                    ; preds = %772
  %pgocount24 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 35)
  %778 = add i64 %pgocount24, 1
  store i64 %778, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 35)
  store i32 0, i32* %27, align 4
  store i32 1, i32* %28, align 4
  br label %779

; <label>:779:                                    ; preds = %777, %775
  br label %780

; <label>:780:                                    ; preds = %779, %771
  %781 = load i32*, i32** %5, align 8
  %782 = load i32, i32* %29, align 4
  %783 = load i32, i32* %28, align 4
  %784 = add nsw i32 %782, %783
  %785 = load i32, i32* %7, align 4
  %786 = mul nsw i32 %784, %785
  %787 = load i32, i32* %30, align 4
  %788 = add nsw i32 %786, %787
  %789 = load i32, i32* %27, align 4
  %790 = add nsw i32 %788, %789
  %791 = sext i32 %790 to i64
  %792 = getelementptr inbounds i32, i32* %781, i64 %791
  %793 = load i32, i32* %792, align 4
  %794 = sitofp i32 %793 to float
  %795 = load i32, i32* %10, align 4
  %796 = sitofp i32 %795 to float
  %797 = fdiv float %794, %796
  %798 = fpext float %797 to double
  %799 = fcmp ogt double %798, 7.000000e-01
  br i1 %799, label %800, label %931

; <label>:800:                                    ; preds = %780
  %801 = load i32, i32* %27, align 4
  %802 = icmp eq i32 %801, 0
  br i1 %802, label %803, label %853

; <label>:803:                                    ; preds = %800
  %pgocount25 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 33)
  %804 = add i64 %pgocount25, 1
  store i64 %804, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 33)
  %805 = load i8*, i8** %6, align 8
  %806 = load i32, i32* %29, align 4
  %807 = load i32, i32* %28, align 4
  %808 = mul nsw i32 2, %807
  %809 = add nsw i32 %806, %808
  %810 = load i32, i32* %7, align 4
  %811 = mul nsw i32 %809, %810
  %812 = load i32, i32* %30, align 4
  %813 = add nsw i32 %811, %812
  %814 = sext i32 %813 to i64
  %815 = getelementptr inbounds i8, i8* %805, i64 %814
  %816 = load i8, i8* %815, align 1
  %817 = zext i8 %816 to i32
  %818 = icmp sgt i32 %817, 7
  br i1 %818, label %819, label %853

; <label>:819:                                    ; preds = %803
  %pgocount26 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 37)
  %820 = add i64 %pgocount26, 1
  store i64 %820, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 37)
  %821 = load i8*, i8** %6, align 8
  %822 = load i32, i32* %29, align 4
  %823 = load i32, i32* %28, align 4
  %824 = mul nsw i32 2, %823
  %825 = add nsw i32 %822, %824
  %826 = load i32, i32* %7, align 4
  %827 = mul nsw i32 %825, %826
  %828 = load i32, i32* %30, align 4
  %829 = add nsw i32 %827, %828
  %830 = sub nsw i32 %829, 1
  %831 = sext i32 %830 to i64
  %832 = getelementptr inbounds i8, i8* %821, i64 %831
  %833 = load i8, i8* %832, align 1
  %834 = zext i8 %833 to i32
  %835 = icmp sgt i32 %834, 7
  br i1 %835, label %836, label %853

; <label>:836:                                    ; preds = %819
  %pgocount27 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 40)
  %837 = add i64 %pgocount27, 1
  store i64 %837, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 40)
  %838 = load i8*, i8** %6, align 8
  %839 = load i32, i32* %29, align 4
  %840 = load i32, i32* %28, align 4
  %841 = mul nsw i32 2, %840
  %842 = add nsw i32 %839, %841
  %843 = load i32, i32* %7, align 4
  %844 = mul nsw i32 %842, %843
  %845 = load i32, i32* %30, align 4
  %846 = add nsw i32 %844, %845
  %847 = add nsw i32 %846, 1
  %848 = sext i32 %847 to i64
  %849 = getelementptr inbounds i8, i8* %838, i64 %848
  %850 = load i8, i8* %849, align 1
  %851 = zext i8 %850 to i32
  %852 = icmp sgt i32 %851, 7
  br i1 %852, label %907, label %853

; <label>:853:                                    ; preds = %836, %819, %803, %800
  %854 = load i32, i32* %28, align 4
  %855 = icmp eq i32 %854, 0
  br i1 %855, label %856, label %929

; <label>:856:                                    ; preds = %853
  %pgocount28 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 34)
  %857 = add i64 %pgocount28, 1
  store i64 %857, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 34)
  %858 = load i8*, i8** %6, align 8
  %859 = load i32, i32* %29, align 4
  %860 = load i32, i32* %7, align 4
  %861 = mul nsw i32 %859, %860
  %862 = load i32, i32* %30, align 4
  %863 = add nsw i32 %861, %862
  %864 = load i32, i32* %27, align 4
  %865 = mul nsw i32 2, %864
  %866 = add nsw i32 %863, %865
  %867 = sext i32 %866 to i64
  %868 = getelementptr inbounds i8, i8* %858, i64 %867
  %869 = load i8, i8* %868, align 1
  %870 = zext i8 %869 to i32
  %871 = icmp sgt i32 %870, 7
  br i1 %871, label %872, label %929

; <label>:872:                                    ; preds = %856
  %pgocount29 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 38)
  %873 = add i64 %pgocount29, 1
  store i64 %873, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 38)
  %874 = load i8*, i8** %6, align 8
  %875 = load i32, i32* %29, align 4
  %876 = add nsw i32 %875, 1
  %877 = load i32, i32* %7, align 4
  %878 = mul nsw i32 %876, %877
  %879 = load i32, i32* %30, align 4
  %880 = add nsw i32 %878, %879
  %881 = load i32, i32* %27, align 4
  %882 = mul nsw i32 2, %881
  %883 = add nsw i32 %880, %882
  %884 = sext i32 %883 to i64
  %885 = getelementptr inbounds i8, i8* %874, i64 %884
  %886 = load i8, i8* %885, align 1
  %887 = zext i8 %886 to i32
  %888 = icmp sgt i32 %887, 7
  br i1 %888, label %889, label %929

; <label>:889:                                    ; preds = %872
  %pgocount30 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 42)
  %890 = add i64 %pgocount30, 1
  store i64 %890, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 42)
  %891 = load i8*, i8** %6, align 8
  %892 = load i32, i32* %29, align 4
  %893 = sub nsw i32 %892, 1
  %894 = load i32, i32* %7, align 4
  %895 = mul nsw i32 %893, %894
  %896 = load i32, i32* %30, align 4
  %897 = add nsw i32 %895, %896
  %898 = load i32, i32* %27, align 4
  %899 = mul nsw i32 2, %898
  %900 = add nsw i32 %897, %899
  %901 = sext i32 %900 to i64
  %902 = getelementptr inbounds i8, i8* %891, i64 %901
  %903 = load i8, i8* %902, align 1
  %904 = zext i8 %903 to i32
  %905 = icmp sgt i32 %904, 7
  br i1 %905, label %907, label %._crit_edge

._crit_edge:                                      ; preds = %889
  %pgocount31 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 3)
  %906 = add i64 %pgocount31, 1
  store i64 %906, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 3)
  br label %929

; <label>:907:                                    ; preds = %889, %836
  %pgocount32 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 41)
  %908 = add i64 %pgocount32, 1
  store i64 %908, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 41)
  %909 = load i8*, i8** %6, align 8
  %910 = load i32, i32* %29, align 4
  %911 = load i32, i32* %7, align 4
  %912 = mul nsw i32 %910, %911
  %913 = load i32, i32* %30, align 4
  %914 = add nsw i32 %912, %913
  %915 = sext i32 %914 to i64
  %916 = getelementptr inbounds i8, i8* %909, i64 %915
  store i8 100, i8* %916, align 1
  %917 = load i8*, i8** %6, align 8
  %918 = load i32, i32* %29, align 4
  %919 = load i32, i32* %28, align 4
  %920 = add nsw i32 %918, %919
  %921 = load i32, i32* %7, align 4
  %922 = mul nsw i32 %920, %921
  %923 = load i32, i32* %30, align 4
  %924 = add nsw i32 %922, %923
  %925 = load i32, i32* %27, align 4
  %926 = add nsw i32 %924, %925
  %927 = sext i32 %926 to i64
  %928 = getelementptr inbounds i8, i8* %917, i64 %927
  store i8 3, i8* %928, align 1
  br label %929

; <label>:929:                                    ; preds = %907, %._crit_edge, %872, %856, %853
  %pgocount33 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 19)
  %930 = add i64 %pgocount33, 1
  store i64 %930, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 19)
  br label %931

; <label>:931:                                    ; preds = %929, %780
  br label %1159

; <label>:932:                                    ; preds = %751, %686
  %933 = load i8*, i8** %6, align 8
  %934 = load i32, i32* %29, align 4
  %935 = sub nsw i32 %934, 1
  %936 = load i32, i32* %7, align 4
  %937 = mul nsw i32 %935, %936
  %938 = load i32, i32* %30, align 4
  %939 = add nsw i32 %937, %938
  %940 = sext i32 %939 to i64
  %941 = getelementptr inbounds i8, i8* %933, i64 %940
  %942 = load i8, i8* %941, align 1
  %943 = zext i8 %942 to i32
  %944 = icmp slt i32 %943, 8
  %945 = zext i1 %944 to i32
  store i32 %945, i32* %11, align 4
  %946 = load i8*, i8** %6, align 8
  %947 = load i32, i32* %29, align 4
  %948 = load i32, i32* %7, align 4
  %949 = mul nsw i32 %947, %948
  %950 = load i32, i32* %30, align 4
  %951 = add nsw i32 %949, %950
  %952 = add nsw i32 %951, 1
  %953 = sext i32 %952 to i64
  %954 = getelementptr inbounds i8, i8* %946, i64 %953
  %955 = load i8, i8* %954, align 1
  %956 = zext i8 %955 to i32
  %957 = icmp slt i32 %956, 8
  %958 = zext i1 %957 to i32
  store i32 %958, i32* %12, align 4
  %959 = load i8*, i8** %6, align 8
  %960 = load i32, i32* %29, align 4
  %961 = add nsw i32 %960, 1
  %962 = load i32, i32* %7, align 4
  %963 = mul nsw i32 %961, %962
  %964 = load i32, i32* %30, align 4
  %965 = add nsw i32 %963, %964
  %966 = sext i32 %965 to i64
  %967 = getelementptr inbounds i8, i8* %959, i64 %966
  %968 = load i8, i8* %967, align 1
  %969 = zext i8 %968 to i32
  %970 = icmp slt i32 %969, 8
  %971 = zext i1 %970 to i32
  store i32 %971, i32* %13, align 4
  %972 = load i8*, i8** %6, align 8
  %973 = load i32, i32* %29, align 4
  %974 = load i32, i32* %7, align 4
  %975 = mul nsw i32 %973, %974
  %976 = load i32, i32* %30, align 4
  %977 = add nsw i32 %975, %976
  %978 = sub nsw i32 %977, 1
  %979 = sext i32 %978 to i64
  %980 = getelementptr inbounds i8, i8* %972, i64 %979
  %981 = load i8, i8* %980, align 1
  %982 = zext i8 %981 to i32
  %983 = icmp slt i32 %982, 8
  %984 = zext i1 %983 to i32
  store i32 %984, i32* %14, align 4
  %985 = load i32, i32* %11, align 4
  %986 = load i32, i32* %12, align 4
  %987 = add nsw i32 %985, %986
  %988 = load i32, i32* %13, align 4
  %989 = add nsw i32 %987, %988
  %990 = load i32, i32* %14, align 4
  %991 = add nsw i32 %989, %990
  %992 = icmp eq i32 %991, 2
  br i1 %992, label %993, label %1157

; <label>:993:                                    ; preds = %932
  %pgocount34 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 12)
  %994 = add i64 %pgocount34, 1
  store i64 %994, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 12)
  %995 = load i32, i32* %14, align 4
  %996 = load i32, i32* %12, align 4
  %997 = or i32 %995, %996
  %998 = load i32, i32* %11, align 4
  %999 = load i32, i32* %13, align 4
  %1000 = or i32 %998, %999
  %1001 = and i32 %997, %1000
  %1002 = icmp ne i32 %1001, 0
  br i1 %1002, label %1003, label %1157

; <label>:1003:                                   ; preds = %993
  %pgocount35 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 15)
  %1004 = add i64 %pgocount35, 1
  store i64 %1004, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 15)
  %1005 = load i32, i32* %11, align 4
  %1006 = load i8*, i8** %6, align 8
  %1007 = load i32, i32* %29, align 4
  %1008 = sub nsw i32 %1007, 2
  %1009 = load i32, i32* %7, align 4
  %1010 = mul nsw i32 %1008, %1009
  %1011 = load i32, i32* %30, align 4
  %1012 = add nsw i32 %1010, %1011
  %1013 = sub nsw i32 %1012, 1
  %1014 = sext i32 %1013 to i64
  %1015 = getelementptr inbounds i8, i8* %1006, i64 %1014
  %1016 = load i8, i8* %1015, align 1
  %1017 = zext i8 %1016 to i32
  %1018 = icmp slt i32 %1017, 8
  %1019 = zext i1 %1018 to i32
  %1020 = load i8*, i8** %6, align 8
  %1021 = load i32, i32* %29, align 4
  %1022 = sub nsw i32 %1021, 2
  %1023 = load i32, i32* %7, align 4
  %1024 = mul nsw i32 %1022, %1023
  %1025 = load i32, i32* %30, align 4
  %1026 = add nsw i32 %1024, %1025
  %1027 = add nsw i32 %1026, 1
  %1028 = sext i32 %1027 to i64
  %1029 = getelementptr inbounds i8, i8* %1020, i64 %1028
  %1030 = load i8, i8* %1029, align 1
  %1031 = zext i8 %1030 to i32
  %1032 = icmp slt i32 %1031, 8
  %1033 = zext i1 %1032 to i32
  %1034 = or i32 %1019, %1033
  %1035 = and i32 %1005, %1034
  %1036 = load i32, i32* %14, align 4
  %1037 = load i8*, i8** %6, align 8
  %1038 = load i32, i32* %29, align 4
  %1039 = sub nsw i32 %1038, 1
  %1040 = load i32, i32* %7, align 4
  %1041 = mul nsw i32 %1039, %1040
  %1042 = load i32, i32* %30, align 4
  %1043 = add nsw i32 %1041, %1042
  %1044 = sub nsw i32 %1043, 2
  %1045 = sext i32 %1044 to i64
  %1046 = getelementptr inbounds i8, i8* %1037, i64 %1045
  %1047 = load i8, i8* %1046, align 1
  %1048 = zext i8 %1047 to i32
  %1049 = icmp slt i32 %1048, 8
  %1050 = zext i1 %1049 to i32
  %1051 = load i8*, i8** %6, align 8
  %1052 = load i32, i32* %29, align 4
  %1053 = add nsw i32 %1052, 1
  %1054 = load i32, i32* %7, align 4
  %1055 = mul nsw i32 %1053, %1054
  %1056 = load i32, i32* %30, align 4
  %1057 = add nsw i32 %1055, %1056
  %1058 = sub nsw i32 %1057, 2
  %1059 = sext i32 %1058 to i64
  %1060 = getelementptr inbounds i8, i8* %1051, i64 %1059
  %1061 = load i8, i8* %1060, align 1
  %1062 = zext i8 %1061 to i32
  %1063 = icmp slt i32 %1062, 8
  %1064 = zext i1 %1063 to i32
  %1065 = or i32 %1050, %1064
  %1066 = and i32 %1036, %1065
  %1067 = or i32 %1035, %1066
  %1068 = load i32, i32* %12, align 4
  %1069 = load i8*, i8** %6, align 8
  %1070 = load i32, i32* %29, align 4
  %1071 = sub nsw i32 %1070, 1
  %1072 = load i32, i32* %7, align 4
  %1073 = mul nsw i32 %1071, %1072
  %1074 = load i32, i32* %30, align 4
  %1075 = add nsw i32 %1073, %1074
  %1076 = add nsw i32 %1075, 2
  %1077 = sext i32 %1076 to i64
  %1078 = getelementptr inbounds i8, i8* %1069, i64 %1077
  %1079 = load i8, i8* %1078, align 1
  %1080 = zext i8 %1079 to i32
  %1081 = icmp slt i32 %1080, 8
  %1082 = zext i1 %1081 to i32
  %1083 = load i8*, i8** %6, align 8
  %1084 = load i32, i32* %29, align 4
  %1085 = add nsw i32 %1084, 1
  %1086 = load i32, i32* %7, align 4
  %1087 = mul nsw i32 %1085, %1086
  %1088 = load i32, i32* %30, align 4
  %1089 = add nsw i32 %1087, %1088
  %1090 = add nsw i32 %1089, 2
  %1091 = sext i32 %1090 to i64
  %1092 = getelementptr inbounds i8, i8* %1083, i64 %1091
  %1093 = load i8, i8* %1092, align 1
  %1094 = zext i8 %1093 to i32
  %1095 = icmp slt i32 %1094, 8
  %1096 = zext i1 %1095 to i32
  %1097 = or i32 %1082, %1096
  %1098 = and i32 %1068, %1097
  %1099 = or i32 %1067, %1098
  %1100 = load i32, i32* %13, align 4
  %1101 = load i8*, i8** %6, align 8
  %1102 = load i32, i32* %29, align 4
  %1103 = add nsw i32 %1102, 2
  %1104 = load i32, i32* %7, align 4
  %1105 = mul nsw i32 %1103, %1104
  %1106 = load i32, i32* %30, align 4
  %1107 = add nsw i32 %1105, %1106
  %1108 = sub nsw i32 %1107, 1
  %1109 = sext i32 %1108 to i64
  %1110 = getelementptr inbounds i8, i8* %1101, i64 %1109
  %1111 = load i8, i8* %1110, align 1
  %1112 = zext i8 %1111 to i32
  %1113 = icmp slt i32 %1112, 8
  %1114 = zext i1 %1113 to i32
  %1115 = load i8*, i8** %6, align 8
  %1116 = load i32, i32* %29, align 4
  %1117 = add nsw i32 %1116, 2
  %1118 = load i32, i32* %7, align 4
  %1119 = mul nsw i32 %1117, %1118
  %1120 = load i32, i32* %30, align 4
  %1121 = add nsw i32 %1119, %1120
  %1122 = add nsw i32 %1121, 1
  %1123 = sext i32 %1122 to i64
  %1124 = getelementptr inbounds i8, i8* %1115, i64 %1123
  %1125 = load i8, i8* %1124, align 1
  %1126 = zext i8 %1125 to i32
  %1127 = icmp slt i32 %1126, 8
  %1128 = zext i1 %1127 to i32
  %1129 = or i32 %1114, %1128
  %1130 = and i32 %1100, %1129
  %1131 = or i32 %1099, %1130
  %1132 = icmp ne i32 %1131, 0
  br i1 %1132, label %1133, label %1157

; <label>:1133:                                   ; preds = %1003
  %1134 = load i8*, i8** %6, align 8
  %1135 = load i32, i32* %29, align 4
  %1136 = load i32, i32* %7, align 4
  %1137 = mul nsw i32 %1135, %1136
  %1138 = load i32, i32* %30, align 4
  %1139 = add nsw i32 %1137, %1138
  %1140 = sext i32 %1139 to i64
  %1141 = getelementptr inbounds i8, i8* %1134, i64 %1140
  store i8 100, i8* %1141, align 1
  %1142 = load i32, i32* %29, align 4
  %1143 = add nsw i32 %1142, -1
  store i32 %1143, i32* %29, align 4
  %1144 = load i32, i32* %30, align 4
  %1145 = sub nsw i32 %1144, 2
  store i32 %1145, i32* %30, align 4
  %1146 = load i32, i32* %29, align 4
  %1147 = icmp slt i32 %1146, 4
  br i1 %1147, label %1148, label %1150

; <label>:1148:                                   ; preds = %1133
  %pgocount36 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 30)
  %1149 = add i64 %pgocount36, 1
  store i64 %1149, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 30)
  store i32 4, i32* %29, align 4
  br label %1150

; <label>:1150:                                   ; preds = %1148, %1133
  %1151 = load i32, i32* %30, align 4
  %1152 = icmp slt i32 %1151, 4
  br i1 %1152, label %1153, label %1155

; <label>:1153:                                   ; preds = %1150
  %pgocount37 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 31)
  %1154 = add i64 %pgocount37, 1
  store i64 %1154, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 31)
  store i32 4, i32* %30, align 4
  br label %1155

; <label>:1155:                                   ; preds = %1153, %1150
  %pgocount38 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 20)
  %1156 = add i64 %pgocount38, 1
  store i64 %1156, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 20)
  br label %1157

; <label>:1157:                                   ; preds = %1155, %1003, %993, %932
  %pgocount39 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 9)
  %1158 = add i64 %pgocount39, 1
  store i64 %1158, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 9)
  br label %1159

; <label>:1159:                                   ; preds = %1157, %931
  br label %1160

; <label>:1160:                                   ; preds = %1159, %683
  %1161 = load i32, i32* %24, align 4
  %1162 = icmp sgt i32 %1161, 2
  br i1 %1162, label %1163, label %1345

; <label>:1163:                                   ; preds = %1160
  %1164 = load i8*, i8** %6, align 8
  %1165 = load i32, i32* %29, align 4
  %1166 = sub nsw i32 %1165, 1
  %1167 = load i32, i32* %7, align 4
  %1168 = mul nsw i32 %1166, %1167
  %1169 = load i32, i32* %30, align 4
  %1170 = add nsw i32 %1168, %1169
  %1171 = sext i32 %1170 to i64
  %1172 = getelementptr inbounds i8, i8* %1164, i64 %1171
  %1173 = load i8, i8* %1172, align 1
  %1174 = zext i8 %1173 to i32
  %1175 = icmp slt i32 %1174, 8
  %1176 = zext i1 %1175 to i32
  store i32 %1176, i32* %11, align 4
  %1177 = load i8*, i8** %6, align 8
  %1178 = load i32, i32* %29, align 4
  %1179 = load i32, i32* %7, align 4
  %1180 = mul nsw i32 %1178, %1179
  %1181 = load i32, i32* %30, align 4
  %1182 = add nsw i32 %1180, %1181
  %1183 = add nsw i32 %1182, 1
  %1184 = sext i32 %1183 to i64
  %1185 = getelementptr inbounds i8, i8* %1177, i64 %1184
  %1186 = load i8, i8* %1185, align 1
  %1187 = zext i8 %1186 to i32
  %1188 = icmp slt i32 %1187, 8
  %1189 = zext i1 %1188 to i32
  store i32 %1189, i32* %12, align 4
  %1190 = load i8*, i8** %6, align 8
  %1191 = load i32, i32* %29, align 4
  %1192 = add nsw i32 %1191, 1
  %1193 = load i32, i32* %7, align 4
  %1194 = mul nsw i32 %1192, %1193
  %1195 = load i32, i32* %30, align 4
  %1196 = add nsw i32 %1194, %1195
  %1197 = sext i32 %1196 to i64
  %1198 = getelementptr inbounds i8, i8* %1190, i64 %1197
  %1199 = load i8, i8* %1198, align 1
  %1200 = zext i8 %1199 to i32
  %1201 = icmp slt i32 %1200, 8
  %1202 = zext i1 %1201 to i32
  store i32 %1202, i32* %13, align 4
  %1203 = load i8*, i8** %6, align 8
  %1204 = load i32, i32* %29, align 4
  %1205 = load i32, i32* %7, align 4
  %1206 = mul nsw i32 %1204, %1205
  %1207 = load i32, i32* %30, align 4
  %1208 = add nsw i32 %1206, %1207
  %1209 = sub nsw i32 %1208, 1
  %1210 = sext i32 %1209 to i64
  %1211 = getelementptr inbounds i8, i8* %1203, i64 %1210
  %1212 = load i8, i8* %1211, align 1
  %1213 = zext i8 %1212 to i32
  %1214 = icmp slt i32 %1213, 8
  %1215 = zext i1 %1214 to i32
  store i32 %1215, i32* %14, align 4
  %1216 = load i32, i32* %11, align 4
  %1217 = load i32, i32* %12, align 4
  %1218 = add nsw i32 %1216, %1217
  %1219 = load i32, i32* %13, align 4
  %1220 = add nsw i32 %1218, %1219
  %1221 = load i32, i32* %14, align 4
  %1222 = add nsw i32 %1220, %1221
  %1223 = icmp sgt i32 %1222, 1
  br i1 %1223, label %1224, label %1343

; <label>:1224:                                   ; preds = %1163
  %1225 = load i8*, i8** %6, align 8
  %1226 = load i32, i32* %29, align 4
  %1227 = sub nsw i32 %1226, 1
  %1228 = load i32, i32* %7, align 4
  %1229 = mul nsw i32 %1227, %1228
  %1230 = load i32, i32* %30, align 4
  %1231 = add nsw i32 %1229, %1230
  %1232 = sub nsw i32 %1231, 1
  %1233 = sext i32 %1232 to i64
  %1234 = getelementptr inbounds i8, i8* %1225, i64 %1233
  %1235 = load i8, i8* %1234, align 1
  %1236 = zext i8 %1235 to i32
  %1237 = icmp slt i32 %1236, 8
  %1238 = zext i1 %1237 to i32
  store i32 %1238, i32* %19, align 4
  %1239 = load i8*, i8** %6, align 8
  %1240 = load i32, i32* %29, align 4
  %1241 = sub nsw i32 %1240, 1
  %1242 = load i32, i32* %7, align 4
  %1243 = mul nsw i32 %1241, %1242
  %1244 = load i32, i32* %30, align 4
  %1245 = add nsw i32 %1243, %1244
  %1246 = add nsw i32 %1245, 1
  %1247 = sext i32 %1246 to i64
  %1248 = getelementptr inbounds i8, i8* %1239, i64 %1247
  %1249 = load i8, i8* %1248, align 1
  %1250 = zext i8 %1249 to i32
  %1251 = icmp slt i32 %1250, 8
  %1252 = zext i1 %1251 to i32
  store i32 %1252, i32* %20, align 4
  %1253 = load i8*, i8** %6, align 8
  %1254 = load i32, i32* %29, align 4
  %1255 = add nsw i32 %1254, 1
  %1256 = load i32, i32* %7, align 4
  %1257 = mul nsw i32 %1255, %1256
  %1258 = load i32, i32* %30, align 4
  %1259 = add nsw i32 %1257, %1258
  %1260 = sub nsw i32 %1259, 1
  %1261 = sext i32 %1260 to i64
  %1262 = getelementptr inbounds i8, i8* %1253, i64 %1261
  %1263 = load i8, i8* %1262, align 1
  %1264 = zext i8 %1263 to i32
  %1265 = icmp slt i32 %1264, 8
  %1266 = zext i1 %1265 to i32
  store i32 %1266, i32* %21, align 4
  %1267 = load i8*, i8** %6, align 8
  %1268 = load i32, i32* %29, align 4
  %1269 = add nsw i32 %1268, 1
  %1270 = load i32, i32* %7, align 4
  %1271 = mul nsw i32 %1269, %1270
  %1272 = load i32, i32* %30, align 4
  %1273 = add nsw i32 %1271, %1272
  %1274 = add nsw i32 %1273, 1
  %1275 = sext i32 %1274 to i64
  %1276 = getelementptr inbounds i8, i8* %1267, i64 %1275
  %1277 = load i8, i8* %1276, align 1
  %1278 = zext i8 %1277 to i32
  %1279 = icmp slt i32 %1278, 8
  %1280 = zext i1 %1279 to i32
  store i32 %1280, i32* %22, align 4
  %1281 = load i32, i32* %19, align 4
  %1282 = load i32, i32* %11, align 4
  %1283 = or i32 %1281, %1282
  store i32 %1283, i32* %15, align 4
  %1284 = load i32, i32* %20, align 4
  %1285 = load i32, i32* %12, align 4
  %1286 = or i32 %1284, %1285
  store i32 %1286, i32* %16, align 4
  %1287 = load i32, i32* %22, align 4
  %1288 = load i32, i32* %13, align 4
  %1289 = or i32 %1287, %1288
  store i32 %1289, i32* %17, align 4
  %1290 = load i32, i32* %21, align 4
  %1291 = load i32, i32* %14, align 4
  %1292 = or i32 %1290, %1291
  store i32 %1292, i32* %18, align 4
  %1293 = load i32, i32* %15, align 4
  %1294 = load i32, i32* %16, align 4
  %1295 = add nsw i32 %1293, %1294
  %1296 = load i32, i32* %17, align 4
  %1297 = add nsw i32 %1295, %1296
  %1298 = load i32, i32* %18, align 4
  %1299 = add nsw i32 %1297, %1298
  %1300 = load i32, i32* %11, align 4
  %1301 = load i32, i32* %16, align 4
  %1302 = and i32 %1300, %1301
  %1303 = load i32, i32* %12, align 4
  %1304 = load i32, i32* %17, align 4
  %1305 = and i32 %1303, %1304
  %1306 = add nsw i32 %1302, %1305
  %1307 = load i32, i32* %13, align 4
  %1308 = load i32, i32* %18, align 4
  %1309 = and i32 %1307, %1308
  %1310 = add nsw i32 %1306, %1309
  %1311 = load i32, i32* %14, align 4
  %1312 = load i32, i32* %15, align 4
  %1313 = and i32 %1311, %1312
  %1314 = add nsw i32 %1310, %1313
  %1315 = sub nsw i32 %1299, %1314
  %1316 = icmp slt i32 %1315, 2
  br i1 %1316, label %1317, label %1341

; <label>:1317:                                   ; preds = %1224
  %1318 = load i8*, i8** %6, align 8
  %1319 = load i32, i32* %29, align 4
  %1320 = load i32, i32* %7, align 4
  %1321 = mul nsw i32 %1319, %1320
  %1322 = load i32, i32* %30, align 4
  %1323 = add nsw i32 %1321, %1322
  %1324 = sext i32 %1323 to i64
  %1325 = getelementptr inbounds i8, i8* %1318, i64 %1324
  store i8 100, i8* %1325, align 1
  %1326 = load i32, i32* %29, align 4
  %1327 = add nsw i32 %1326, -1
  store i32 %1327, i32* %29, align 4
  %1328 = load i32, i32* %30, align 4
  %1329 = sub nsw i32 %1328, 2
  store i32 %1329, i32* %30, align 4
  %1330 = load i32, i32* %29, align 4
  %1331 = icmp slt i32 %1330, 4
  br i1 %1331, label %1332, label %1334

; <label>:1332:                                   ; preds = %1317
  %pgocount40 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 23)
  %1333 = add i64 %pgocount40, 1
  store i64 %1333, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 23)
  store i32 4, i32* %29, align 4
  br label %1334

; <label>:1334:                                   ; preds = %1332, %1317
  %1335 = load i32, i32* %30, align 4
  %1336 = icmp slt i32 %1335, 4
  br i1 %1336, label %1337, label %1339

; <label>:1337:                                   ; preds = %1334
  %pgocount41 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 24)
  %1338 = add i64 %pgocount41, 1
  store i64 %1338, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 24)
  store i32 4, i32* %30, align 4
  br label %1339

; <label>:1339:                                   ; preds = %1337, %1334
  %pgocount42 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 14)
  %1340 = add i64 %pgocount42, 1
  store i64 %1340, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 14)
  br label %1341

; <label>:1341:                                   ; preds = %1339, %1224
  %pgocount43 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 11)
  %1342 = add i64 %pgocount43, 1
  store i64 %1342, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 11)
  br label %1343

; <label>:1343:                                   ; preds = %1341, %1163
  %pgocount44 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 7)
  %1344 = add i64 %pgocount44, 1
  store i64 %1344, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 7)
  br label %1345

; <label>:1345:                                   ; preds = %1343, %1160
  %pgocount45 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 5)
  %1346 = add i64 %pgocount45, 1
  store i64 %1346, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 5)
  br label %1347

; <label>:1347:                                   ; preds = %1345, %44
  br label %1348

; <label>:1348:                                   ; preds = %1347
  %pgocount46 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 4)
  %1349 = add i64 %pgocount46, 1
  store i64 %1349, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 4)
  %1350 = load i32, i32* %30, align 4
  %1351 = add nsw i32 %1350, 1
  store i32 %1351, i32* %30, align 4
  br label %39

; <label>:1352:                                   ; preds = %39
  br label %1353

; <label>:1353:                                   ; preds = %1352
  %1354 = load i32, i32* %29, align 4
  %1355 = add nsw i32 %1354, 1
  store i32 %1355, i32* %29, align 4
  br label %32

; <label>:1356:                                   ; preds = %32
  %pgocount47 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 44)
  %1357 = add i64 %pgocount47, 1
  store i64 %1357, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_susan_thin, i64 0, i64 44)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @susan_edges(i8*, i32*, i8*, i8*, i32, i32, i32) #0 {
  %8 = alloca i8*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca float, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i8, align 1
  %27 = alloca i8*, align 8
  %28 = alloca i8*, align 8
  store i8* %0, i8** %8, align 8
  store i32* %1, i32** %9, align 8
  store i8* %2, i8** %10, align 8
  store i8* %3, i8** %11, align 8
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  store i32 %6, i32* %14, align 4
  %29 = load i32*, i32** %9, align 8
  %30 = bitcast i32* %29 to i8*
  %31 = load i32, i32* %13, align 4
  %32 = load i32, i32* %14, align 4
  %33 = mul nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = mul i64 %34, 4
  call void @llvm.memset.p0i8.i64(i8* %30, i8 0, i64 %35, i32 4, i1 false)
  store i32 3, i32* %17, align 4
  br label %36

; <label>:36:                                     ; preds = %550, %7
  %37 = load i32, i32* %17, align 4
  %38 = load i32, i32* %14, align 4
  %39 = sub nsw i32 %38, 3
  %40 = icmp slt i32 %37, %39
  br i1 %40, label %41, label %554

; <label>:41:                                     ; preds = %36
  store i32 3, i32* %18, align 4
  br label %42

; <label>:42:                                     ; preds = %545, %41
  %43 = load i32, i32* %18, align 4
  %44 = load i32, i32* %13, align 4
  %45 = sub nsw i32 %44, 3
  %46 = icmp slt i32 %43, %45
  br i1 %46, label %47, label %549

; <label>:47:                                     ; preds = %42
  store i32 100, i32* %20, align 4
  %48 = load i8*, i8** %8, align 8
  %49 = load i32, i32* %17, align 4
  %50 = sub nsw i32 %49, 3
  %51 = load i32, i32* %13, align 4
  %52 = mul nsw i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %48, i64 %53
  %55 = load i32, i32* %18, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %54, i64 %56
  %58 = getelementptr inbounds i8, i8* %57, i64 -1
  store i8* %58, i8** %27, align 8
  %59 = load i8*, i8** %11, align 8
  %60 = load i8*, i8** %8, align 8
  %61 = load i32, i32* %17, align 4
  %62 = load i32, i32* %13, align 4
  %63 = mul nsw i32 %61, %62
  %64 = load i32, i32* %18, align 4
  %65 = add nsw i32 %63, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %60, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %59, i64 %70
  store i8* %71, i8** %28, align 8
  %72 = load i8*, i8** %28, align 8
  %73 = load i8*, i8** %27, align 8
  %74 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %74, i8** %27, align 8
  %75 = load i8, i8* %73, align 1
  %76 = zext i8 %75 to i32
  %77 = sext i32 %76 to i64
  %78 = sub i64 0, %77
  %79 = getelementptr inbounds i8, i8* %72, i64 %78
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = load i32, i32* %20, align 4
  %83 = add nsw i32 %82, %81
  store i32 %83, i32* %20, align 4
  %84 = load i8*, i8** %28, align 8
  %85 = load i8*, i8** %27, align 8
  %86 = getelementptr inbounds i8, i8* %85, i32 1
  store i8* %86, i8** %27, align 8
  %87 = load i8, i8* %85, align 1
  %88 = zext i8 %87 to i32
  %89 = sext i32 %88 to i64
  %90 = sub i64 0, %89
  %91 = getelementptr inbounds i8, i8* %84, i64 %90
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = load i32, i32* %20, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, i32* %20, align 4
  %96 = load i8*, i8** %28, align 8
  %97 = load i8*, i8** %27, align 8
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = sext i32 %99 to i64
  %101 = sub i64 0, %100
  %102 = getelementptr inbounds i8, i8* %96, i64 %101
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = load i32, i32* %20, align 4
  %106 = add nsw i32 %105, %104
  store i32 %106, i32* %20, align 4
  %107 = load i32, i32* %13, align 4
  %108 = sub nsw i32 %107, 3
  %109 = load i8*, i8** %27, align 8
  %110 = sext i32 %108 to i64
  %111 = getelementptr inbounds i8, i8* %109, i64 %110
  store i8* %111, i8** %27, align 8
  %112 = load i8*, i8** %28, align 8
  %113 = load i8*, i8** %27, align 8
  %114 = getelementptr inbounds i8, i8* %113, i32 1
  store i8* %114, i8** %27, align 8
  %115 = load i8, i8* %113, align 1
  %116 = zext i8 %115 to i32
  %117 = sext i32 %116 to i64
  %118 = sub i64 0, %117
  %119 = getelementptr inbounds i8, i8* %112, i64 %118
  %120 = load i8, i8* %119, align 1
  %121 = zext i8 %120 to i32
  %122 = load i32, i32* %20, align 4
  %123 = add nsw i32 %122, %121
  store i32 %123, i32* %20, align 4
  %124 = load i8*, i8** %28, align 8
  %125 = load i8*, i8** %27, align 8
  %126 = getelementptr inbounds i8, i8* %125, i32 1
  store i8* %126, i8** %27, align 8
  %127 = load i8, i8* %125, align 1
  %128 = zext i8 %127 to i32
  %129 = sext i32 %128 to i64
  %130 = sub i64 0, %129
  %131 = getelementptr inbounds i8, i8* %124, i64 %130
  %132 = load i8, i8* %131, align 1
  %133 = zext i8 %132 to i32
  %134 = load i32, i32* %20, align 4
  %135 = add nsw i32 %134, %133
  store i32 %135, i32* %20, align 4
  %136 = load i8*, i8** %28, align 8
  %137 = load i8*, i8** %27, align 8
  %138 = getelementptr inbounds i8, i8* %137, i32 1
  store i8* %138, i8** %27, align 8
  %139 = load i8, i8* %137, align 1
  %140 = zext i8 %139 to i32
  %141 = sext i32 %140 to i64
  %142 = sub i64 0, %141
  %143 = getelementptr inbounds i8, i8* %136, i64 %142
  %144 = load i8, i8* %143, align 1
  %145 = zext i8 %144 to i32
  %146 = load i32, i32* %20, align 4
  %147 = add nsw i32 %146, %145
  store i32 %147, i32* %20, align 4
  %148 = load i8*, i8** %28, align 8
  %149 = load i8*, i8** %27, align 8
  %150 = getelementptr inbounds i8, i8* %149, i32 1
  store i8* %150, i8** %27, align 8
  %151 = load i8, i8* %149, align 1
  %152 = zext i8 %151 to i32
  %153 = sext i32 %152 to i64
  %154 = sub i64 0, %153
  %155 = getelementptr inbounds i8, i8* %148, i64 %154
  %156 = load i8, i8* %155, align 1
  %157 = zext i8 %156 to i32
  %158 = load i32, i32* %20, align 4
  %159 = add nsw i32 %158, %157
  store i32 %159, i32* %20, align 4
  %160 = load i8*, i8** %28, align 8
  %161 = load i8*, i8** %27, align 8
  %162 = load i8, i8* %161, align 1
  %163 = zext i8 %162 to i32
  %164 = sext i32 %163 to i64
  %165 = sub i64 0, %164
  %166 = getelementptr inbounds i8, i8* %160, i64 %165
  %167 = load i8, i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = load i32, i32* %20, align 4
  %170 = add nsw i32 %169, %168
  store i32 %170, i32* %20, align 4
  %171 = load i32, i32* %13, align 4
  %172 = sub nsw i32 %171, 5
  %173 = load i8*, i8** %27, align 8
  %174 = sext i32 %172 to i64
  %175 = getelementptr inbounds i8, i8* %173, i64 %174
  store i8* %175, i8** %27, align 8
  %176 = load i8*, i8** %28, align 8
  %177 = load i8*, i8** %27, align 8
  %178 = getelementptr inbounds i8, i8* %177, i32 1
  store i8* %178, i8** %27, align 8
  %179 = load i8, i8* %177, align 1
  %180 = zext i8 %179 to i32
  %181 = sext i32 %180 to i64
  %182 = sub i64 0, %181
  %183 = getelementptr inbounds i8, i8* %176, i64 %182
  %184 = load i8, i8* %183, align 1
  %185 = zext i8 %184 to i32
  %186 = load i32, i32* %20, align 4
  %187 = add nsw i32 %186, %185
  store i32 %187, i32* %20, align 4
  %188 = load i8*, i8** %28, align 8
  %189 = load i8*, i8** %27, align 8
  %190 = getelementptr inbounds i8, i8* %189, i32 1
  store i8* %190, i8** %27, align 8
  %191 = load i8, i8* %189, align 1
  %192 = zext i8 %191 to i32
  %193 = sext i32 %192 to i64
  %194 = sub i64 0, %193
  %195 = getelementptr inbounds i8, i8* %188, i64 %194
  %196 = load i8, i8* %195, align 1
  %197 = zext i8 %196 to i32
  %198 = load i32, i32* %20, align 4
  %199 = add nsw i32 %198, %197
  store i32 %199, i32* %20, align 4
  %200 = load i8*, i8** %28, align 8
  %201 = load i8*, i8** %27, align 8
  %202 = getelementptr inbounds i8, i8* %201, i32 1
  store i8* %202, i8** %27, align 8
  %203 = load i8, i8* %201, align 1
  %204 = zext i8 %203 to i32
  %205 = sext i32 %204 to i64
  %206 = sub i64 0, %205
  %207 = getelementptr inbounds i8, i8* %200, i64 %206
  %208 = load i8, i8* %207, align 1
  %209 = zext i8 %208 to i32
  %210 = load i32, i32* %20, align 4
  %211 = add nsw i32 %210, %209
  store i32 %211, i32* %20, align 4
  %212 = load i8*, i8** %28, align 8
  %213 = load i8*, i8** %27, align 8
  %214 = getelementptr inbounds i8, i8* %213, i32 1
  store i8* %214, i8** %27, align 8
  %215 = load i8, i8* %213, align 1
  %216 = zext i8 %215 to i32
  %217 = sext i32 %216 to i64
  %218 = sub i64 0, %217
  %219 = getelementptr inbounds i8, i8* %212, i64 %218
  %220 = load i8, i8* %219, align 1
  %221 = zext i8 %220 to i32
  %222 = load i32, i32* %20, align 4
  %223 = add nsw i32 %222, %221
  store i32 %223, i32* %20, align 4
  %224 = load i8*, i8** %28, align 8
  %225 = load i8*, i8** %27, align 8
  %226 = getelementptr inbounds i8, i8* %225, i32 1
  store i8* %226, i8** %27, align 8
  %227 = load i8, i8* %225, align 1
  %228 = zext i8 %227 to i32
  %229 = sext i32 %228 to i64
  %230 = sub i64 0, %229
  %231 = getelementptr inbounds i8, i8* %224, i64 %230
  %232 = load i8, i8* %231, align 1
  %233 = zext i8 %232 to i32
  %234 = load i32, i32* %20, align 4
  %235 = add nsw i32 %234, %233
  store i32 %235, i32* %20, align 4
  %236 = load i8*, i8** %28, align 8
  %237 = load i8*, i8** %27, align 8
  %238 = getelementptr inbounds i8, i8* %237, i32 1
  store i8* %238, i8** %27, align 8
  %239 = load i8, i8* %237, align 1
  %240 = zext i8 %239 to i32
  %241 = sext i32 %240 to i64
  %242 = sub i64 0, %241
  %243 = getelementptr inbounds i8, i8* %236, i64 %242
  %244 = load i8, i8* %243, align 1
  %245 = zext i8 %244 to i32
  %246 = load i32, i32* %20, align 4
  %247 = add nsw i32 %246, %245
  store i32 %247, i32* %20, align 4
  %248 = load i8*, i8** %28, align 8
  %249 = load i8*, i8** %27, align 8
  %250 = load i8, i8* %249, align 1
  %251 = zext i8 %250 to i32
  %252 = sext i32 %251 to i64
  %253 = sub i64 0, %252
  %254 = getelementptr inbounds i8, i8* %248, i64 %253
  %255 = load i8, i8* %254, align 1
  %256 = zext i8 %255 to i32
  %257 = load i32, i32* %20, align 4
  %258 = add nsw i32 %257, %256
  store i32 %258, i32* %20, align 4
  %259 = load i32, i32* %13, align 4
  %260 = sub nsw i32 %259, 6
  %261 = load i8*, i8** %27, align 8
  %262 = sext i32 %260 to i64
  %263 = getelementptr inbounds i8, i8* %261, i64 %262
  store i8* %263, i8** %27, align 8
  %264 = load i8*, i8** %28, align 8
  %265 = load i8*, i8** %27, align 8
  %266 = getelementptr inbounds i8, i8* %265, i32 1
  store i8* %266, i8** %27, align 8
  %267 = load i8, i8* %265, align 1
  %268 = zext i8 %267 to i32
  %269 = sext i32 %268 to i64
  %270 = sub i64 0, %269
  %271 = getelementptr inbounds i8, i8* %264, i64 %270
  %272 = load i8, i8* %271, align 1
  %273 = zext i8 %272 to i32
  %274 = load i32, i32* %20, align 4
  %275 = add nsw i32 %274, %273
  store i32 %275, i32* %20, align 4
  %276 = load i8*, i8** %28, align 8
  %277 = load i8*, i8** %27, align 8
  %278 = getelementptr inbounds i8, i8* %277, i32 1
  store i8* %278, i8** %27, align 8
  %279 = load i8, i8* %277, align 1
  %280 = zext i8 %279 to i32
  %281 = sext i32 %280 to i64
  %282 = sub i64 0, %281
  %283 = getelementptr inbounds i8, i8* %276, i64 %282
  %284 = load i8, i8* %283, align 1
  %285 = zext i8 %284 to i32
  %286 = load i32, i32* %20, align 4
  %287 = add nsw i32 %286, %285
  store i32 %287, i32* %20, align 4
  %288 = load i8*, i8** %28, align 8
  %289 = load i8*, i8** %27, align 8
  %290 = load i8, i8* %289, align 1
  %291 = zext i8 %290 to i32
  %292 = sext i32 %291 to i64
  %293 = sub i64 0, %292
  %294 = getelementptr inbounds i8, i8* %288, i64 %293
  %295 = load i8, i8* %294, align 1
  %296 = zext i8 %295 to i32
  %297 = load i32, i32* %20, align 4
  %298 = add nsw i32 %297, %296
  store i32 %298, i32* %20, align 4
  %299 = load i8*, i8** %27, align 8
  %300 = getelementptr inbounds i8, i8* %299, i64 2
  store i8* %300, i8** %27, align 8
  %301 = load i8*, i8** %28, align 8
  %302 = load i8*, i8** %27, align 8
  %303 = getelementptr inbounds i8, i8* %302, i32 1
  store i8* %303, i8** %27, align 8
  %304 = load i8, i8* %302, align 1
  %305 = zext i8 %304 to i32
  %306 = sext i32 %305 to i64
  %307 = sub i64 0, %306
  %308 = getelementptr inbounds i8, i8* %301, i64 %307
  %309 = load i8, i8* %308, align 1
  %310 = zext i8 %309 to i32
  %311 = load i32, i32* %20, align 4
  %312 = add nsw i32 %311, %310
  store i32 %312, i32* %20, align 4
  %313 = load i8*, i8** %28, align 8
  %314 = load i8*, i8** %27, align 8
  %315 = getelementptr inbounds i8, i8* %314, i32 1
  store i8* %315, i8** %27, align 8
  %316 = load i8, i8* %314, align 1
  %317 = zext i8 %316 to i32
  %318 = sext i32 %317 to i64
  %319 = sub i64 0, %318
  %320 = getelementptr inbounds i8, i8* %313, i64 %319
  %321 = load i8, i8* %320, align 1
  %322 = zext i8 %321 to i32
  %323 = load i32, i32* %20, align 4
  %324 = add nsw i32 %323, %322
  store i32 %324, i32* %20, align 4
  %325 = load i8*, i8** %28, align 8
  %326 = load i8*, i8** %27, align 8
  %327 = load i8, i8* %326, align 1
  %328 = zext i8 %327 to i32
  %329 = sext i32 %328 to i64
  %330 = sub i64 0, %329
  %331 = getelementptr inbounds i8, i8* %325, i64 %330
  %332 = load i8, i8* %331, align 1
  %333 = zext i8 %332 to i32
  %334 = load i32, i32* %20, align 4
  %335 = add nsw i32 %334, %333
  store i32 %335, i32* %20, align 4
  %336 = load i32, i32* %13, align 4
  %337 = sub nsw i32 %336, 6
  %338 = load i8*, i8** %27, align 8
  %339 = sext i32 %337 to i64
  %340 = getelementptr inbounds i8, i8* %338, i64 %339
  store i8* %340, i8** %27, align 8
  %341 = load i8*, i8** %28, align 8
  %342 = load i8*, i8** %27, align 8
  %343 = getelementptr inbounds i8, i8* %342, i32 1
  store i8* %343, i8** %27, align 8
  %344 = load i8, i8* %342, align 1
  %345 = zext i8 %344 to i32
  %346 = sext i32 %345 to i64
  %347 = sub i64 0, %346
  %348 = getelementptr inbounds i8, i8* %341, i64 %347
  %349 = load i8, i8* %348, align 1
  %350 = zext i8 %349 to i32
  %351 = load i32, i32* %20, align 4
  %352 = add nsw i32 %351, %350
  store i32 %352, i32* %20, align 4
  %353 = load i8*, i8** %28, align 8
  %354 = load i8*, i8** %27, align 8
  %355 = getelementptr inbounds i8, i8* %354, i32 1
  store i8* %355, i8** %27, align 8
  %356 = load i8, i8* %354, align 1
  %357 = zext i8 %356 to i32
  %358 = sext i32 %357 to i64
  %359 = sub i64 0, %358
  %360 = getelementptr inbounds i8, i8* %353, i64 %359
  %361 = load i8, i8* %360, align 1
  %362 = zext i8 %361 to i32
  %363 = load i32, i32* %20, align 4
  %364 = add nsw i32 %363, %362
  store i32 %364, i32* %20, align 4
  %365 = load i8*, i8** %28, align 8
  %366 = load i8*, i8** %27, align 8
  %367 = getelementptr inbounds i8, i8* %366, i32 1
  store i8* %367, i8** %27, align 8
  %368 = load i8, i8* %366, align 1
  %369 = zext i8 %368 to i32
  %370 = sext i32 %369 to i64
  %371 = sub i64 0, %370
  %372 = getelementptr inbounds i8, i8* %365, i64 %371
  %373 = load i8, i8* %372, align 1
  %374 = zext i8 %373 to i32
  %375 = load i32, i32* %20, align 4
  %376 = add nsw i32 %375, %374
  store i32 %376, i32* %20, align 4
  %377 = load i8*, i8** %28, align 8
  %378 = load i8*, i8** %27, align 8
  %379 = getelementptr inbounds i8, i8* %378, i32 1
  store i8* %379, i8** %27, align 8
  %380 = load i8, i8* %378, align 1
  %381 = zext i8 %380 to i32
  %382 = sext i32 %381 to i64
  %383 = sub i64 0, %382
  %384 = getelementptr inbounds i8, i8* %377, i64 %383
  %385 = load i8, i8* %384, align 1
  %386 = zext i8 %385 to i32
  %387 = load i32, i32* %20, align 4
  %388 = add nsw i32 %387, %386
  store i32 %388, i32* %20, align 4
  %389 = load i8*, i8** %28, align 8
  %390 = load i8*, i8** %27, align 8
  %391 = getelementptr inbounds i8, i8* %390, i32 1
  store i8* %391, i8** %27, align 8
  %392 = load i8, i8* %390, align 1
  %393 = zext i8 %392 to i32
  %394 = sext i32 %393 to i64
  %395 = sub i64 0, %394
  %396 = getelementptr inbounds i8, i8* %389, i64 %395
  %397 = load i8, i8* %396, align 1
  %398 = zext i8 %397 to i32
  %399 = load i32, i32* %20, align 4
  %400 = add nsw i32 %399, %398
  store i32 %400, i32* %20, align 4
  %401 = load i8*, i8** %28, align 8
  %402 = load i8*, i8** %27, align 8
  %403 = getelementptr inbounds i8, i8* %402, i32 1
  store i8* %403, i8** %27, align 8
  %404 = load i8, i8* %402, align 1
  %405 = zext i8 %404 to i32
  %406 = sext i32 %405 to i64
  %407 = sub i64 0, %406
  %408 = getelementptr inbounds i8, i8* %401, i64 %407
  %409 = load i8, i8* %408, align 1
  %410 = zext i8 %409 to i32
  %411 = load i32, i32* %20, align 4
  %412 = add nsw i32 %411, %410
  store i32 %412, i32* %20, align 4
  %413 = load i8*, i8** %28, align 8
  %414 = load i8*, i8** %27, align 8
  %415 = load i8, i8* %414, align 1
  %416 = zext i8 %415 to i32
  %417 = sext i32 %416 to i64
  %418 = sub i64 0, %417
  %419 = getelementptr inbounds i8, i8* %413, i64 %418
  %420 = load i8, i8* %419, align 1
  %421 = zext i8 %420 to i32
  %422 = load i32, i32* %20, align 4
  %423 = add nsw i32 %422, %421
  store i32 %423, i32* %20, align 4
  %424 = load i32, i32* %13, align 4
  %425 = sub nsw i32 %424, 5
  %426 = load i8*, i8** %27, align 8
  %427 = sext i32 %425 to i64
  %428 = getelementptr inbounds i8, i8* %426, i64 %427
  store i8* %428, i8** %27, align 8
  %429 = load i8*, i8** %28, align 8
  %430 = load i8*, i8** %27, align 8
  %431 = getelementptr inbounds i8, i8* %430, i32 1
  store i8* %431, i8** %27, align 8
  %432 = load i8, i8* %430, align 1
  %433 = zext i8 %432 to i32
  %434 = sext i32 %433 to i64
  %435 = sub i64 0, %434
  %436 = getelementptr inbounds i8, i8* %429, i64 %435
  %437 = load i8, i8* %436, align 1
  %438 = zext i8 %437 to i32
  %439 = load i32, i32* %20, align 4
  %440 = add nsw i32 %439, %438
  store i32 %440, i32* %20, align 4
  %441 = load i8*, i8** %28, align 8
  %442 = load i8*, i8** %27, align 8
  %443 = getelementptr inbounds i8, i8* %442, i32 1
  store i8* %443, i8** %27, align 8
  %444 = load i8, i8* %442, align 1
  %445 = zext i8 %444 to i32
  %446 = sext i32 %445 to i64
  %447 = sub i64 0, %446
  %448 = getelementptr inbounds i8, i8* %441, i64 %447
  %449 = load i8, i8* %448, align 1
  %450 = zext i8 %449 to i32
  %451 = load i32, i32* %20, align 4
  %452 = add nsw i32 %451, %450
  store i32 %452, i32* %20, align 4
  %453 = load i8*, i8** %28, align 8
  %454 = load i8*, i8** %27, align 8
  %455 = getelementptr inbounds i8, i8* %454, i32 1
  store i8* %455, i8** %27, align 8
  %456 = load i8, i8* %454, align 1
  %457 = zext i8 %456 to i32
  %458 = sext i32 %457 to i64
  %459 = sub i64 0, %458
  %460 = getelementptr inbounds i8, i8* %453, i64 %459
  %461 = load i8, i8* %460, align 1
  %462 = zext i8 %461 to i32
  %463 = load i32, i32* %20, align 4
  %464 = add nsw i32 %463, %462
  store i32 %464, i32* %20, align 4
  %465 = load i8*, i8** %28, align 8
  %466 = load i8*, i8** %27, align 8
  %467 = getelementptr inbounds i8, i8* %466, i32 1
  store i8* %467, i8** %27, align 8
  %468 = load i8, i8* %466, align 1
  %469 = zext i8 %468 to i32
  %470 = sext i32 %469 to i64
  %471 = sub i64 0, %470
  %472 = getelementptr inbounds i8, i8* %465, i64 %471
  %473 = load i8, i8* %472, align 1
  %474 = zext i8 %473 to i32
  %475 = load i32, i32* %20, align 4
  %476 = add nsw i32 %475, %474
  store i32 %476, i32* %20, align 4
  %477 = load i8*, i8** %28, align 8
  %478 = load i8*, i8** %27, align 8
  %479 = load i8, i8* %478, align 1
  %480 = zext i8 %479 to i32
  %481 = sext i32 %480 to i64
  %482 = sub i64 0, %481
  %483 = getelementptr inbounds i8, i8* %477, i64 %482
  %484 = load i8, i8* %483, align 1
  %485 = zext i8 %484 to i32
  %486 = load i32, i32* %20, align 4
  %487 = add nsw i32 %486, %485
  store i32 %487, i32* %20, align 4
  %488 = load i32, i32* %13, align 4
  %489 = sub nsw i32 %488, 3
  %490 = load i8*, i8** %27, align 8
  %491 = sext i32 %489 to i64
  %492 = getelementptr inbounds i8, i8* %490, i64 %491
  store i8* %492, i8** %27, align 8
  %493 = load i8*, i8** %28, align 8
  %494 = load i8*, i8** %27, align 8
  %495 = getelementptr inbounds i8, i8* %494, i32 1
  store i8* %495, i8** %27, align 8
  %496 = load i8, i8* %494, align 1
  %497 = zext i8 %496 to i32
  %498 = sext i32 %497 to i64
  %499 = sub i64 0, %498
  %500 = getelementptr inbounds i8, i8* %493, i64 %499
  %501 = load i8, i8* %500, align 1
  %502 = zext i8 %501 to i32
  %503 = load i32, i32* %20, align 4
  %504 = add nsw i32 %503, %502
  store i32 %504, i32* %20, align 4
  %505 = load i8*, i8** %28, align 8
  %506 = load i8*, i8** %27, align 8
  %507 = getelementptr inbounds i8, i8* %506, i32 1
  store i8* %507, i8** %27, align 8
  %508 = load i8, i8* %506, align 1
  %509 = zext i8 %508 to i32
  %510 = sext i32 %509 to i64
  %511 = sub i64 0, %510
  %512 = getelementptr inbounds i8, i8* %505, i64 %511
  %513 = load i8, i8* %512, align 1
  %514 = zext i8 %513 to i32
  %515 = load i32, i32* %20, align 4
  %516 = add nsw i32 %515, %514
  store i32 %516, i32* %20, align 4
  %517 = load i8*, i8** %28, align 8
  %518 = load i8*, i8** %27, align 8
  %519 = load i8, i8* %518, align 1
  %520 = zext i8 %519 to i32
  %521 = sext i32 %520 to i64
  %522 = sub i64 0, %521
  %523 = getelementptr inbounds i8, i8* %517, i64 %522
  %524 = load i8, i8* %523, align 1
  %525 = zext i8 %524 to i32
  %526 = load i32, i32* %20, align 4
  %527 = add nsw i32 %526, %525
  store i32 %527, i32* %20, align 4
  %528 = load i32, i32* %20, align 4
  %529 = load i32, i32* %12, align 4
  %530 = icmp sle i32 %528, %529
  br i1 %530, label %531, label %544

; <label>:531:                                    ; preds = %47
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 2)
  %532 = add i64 %pgocount, 1
  store i64 %532, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 2)
  %533 = load i32, i32* %12, align 4
  %534 = load i32, i32* %20, align 4
  %535 = sub nsw i32 %533, %534
  %536 = load i32*, i32** %9, align 8
  %537 = load i32, i32* %17, align 4
  %538 = load i32, i32* %13, align 4
  %539 = mul nsw i32 %537, %538
  %540 = load i32, i32* %18, align 4
  %541 = add nsw i32 %539, %540
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds i32, i32* %536, i64 %542
  store i32 %535, i32* %543, align 4
  br label %544

; <label>:544:                                    ; preds = %531, %47
  br label %545

; <label>:545:                                    ; preds = %544
  %pgocount1 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 0)
  %546 = add i64 %pgocount1, 1
  store i64 %546, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 0)
  %547 = load i32, i32* %18, align 4
  %548 = add nsw i32 %547, 1
  store i32 %548, i32* %18, align 4
  br label %42

; <label>:549:                                    ; preds = %42
  br label %550

; <label>:550:                                    ; preds = %549
  %pgocount2 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 18)
  %551 = add i64 %pgocount2, 1
  store i64 %551, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 18)
  %552 = load i32, i32* %17, align 4
  %553 = add nsw i32 %552, 1
  store i32 %553, i32* %17, align 4
  br label %36

; <label>:554:                                    ; preds = %36
  store i32 4, i32* %17, align 4
  br label %555

; <label>:555:                                    ; preds = %2253, %554
  %556 = load i32, i32* %17, align 4
  %557 = load i32, i32* %14, align 4
  %558 = sub nsw i32 %557, 4
  %559 = icmp slt i32 %556, %558
  br i1 %559, label %560, label %2257

; <label>:560:                                    ; preds = %555
  store i32 4, i32* %18, align 4
  br label %561

; <label>:561:                                    ; preds = %2248, %560
  %562 = load i32, i32* %18, align 4
  %563 = load i32, i32* %13, align 4
  %564 = sub nsw i32 %563, 4
  %565 = icmp slt i32 %562, %564
  br i1 %565, label %566, label %2252

; <label>:566:                                    ; preds = %561
  %567 = load i32*, i32** %9, align 8
  %568 = load i32, i32* %17, align 4
  %569 = load i32, i32* %13, align 4
  %570 = mul nsw i32 %568, %569
  %571 = load i32, i32* %18, align 4
  %572 = add nsw i32 %570, %571
  %573 = sext i32 %572 to i64
  %574 = getelementptr inbounds i32, i32* %567, i64 %573
  %575 = load i32, i32* %574, align 4
  %576 = icmp sgt i32 %575, 0
  br i1 %576, label %577, label %2247

; <label>:577:                                    ; preds = %566
  %578 = load i32*, i32** %9, align 8
  %579 = load i32, i32* %17, align 4
  %580 = load i32, i32* %13, align 4
  %581 = mul nsw i32 %579, %580
  %582 = load i32, i32* %18, align 4
  %583 = add nsw i32 %581, %582
  %584 = sext i32 %583 to i64
  %585 = getelementptr inbounds i32, i32* %578, i64 %584
  %586 = load i32, i32* %585, align 4
  store i32 %586, i32* %19, align 4
  %587 = load i32, i32* %12, align 4
  %588 = load i32, i32* %19, align 4
  %589 = sub nsw i32 %587, %588
  store i32 %589, i32* %20, align 4
  %590 = load i8*, i8** %11, align 8
  %591 = load i8*, i8** %8, align 8
  %592 = load i32, i32* %17, align 4
  %593 = load i32, i32* %13, align 4
  %594 = mul nsw i32 %592, %593
  %595 = load i32, i32* %18, align 4
  %596 = add nsw i32 %594, %595
  %597 = sext i32 %596 to i64
  %598 = getelementptr inbounds i8, i8* %591, i64 %597
  %599 = load i8, i8* %598, align 1
  %600 = zext i8 %599 to i32
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds i8, i8* %590, i64 %601
  store i8* %602, i8** %28, align 8
  %603 = load i32, i32* %20, align 4
  %604 = icmp sgt i32 %603, 600
  br i1 %604, label %605, label %1380

; <label>:605:                                    ; preds = %577
  %606 = load i8*, i8** %8, align 8
  %607 = load i32, i32* %17, align 4
  %608 = sub nsw i32 %607, 3
  %609 = load i32, i32* %13, align 4
  %610 = mul nsw i32 %608, %609
  %611 = sext i32 %610 to i64
  %612 = getelementptr inbounds i8, i8* %606, i64 %611
  %613 = load i32, i32* %18, align 4
  %614 = sext i32 %613 to i64
  %615 = getelementptr inbounds i8, i8* %612, i64 %614
  %616 = getelementptr inbounds i8, i8* %615, i64 -1
  store i8* %616, i8** %27, align 8
  store i32 0, i32* %23, align 4
  store i32 0, i32* %24, align 4
  %617 = load i8*, i8** %28, align 8
  %618 = load i8*, i8** %27, align 8
  %619 = getelementptr inbounds i8, i8* %618, i32 1
  store i8* %619, i8** %27, align 8
  %620 = load i8, i8* %618, align 1
  %621 = zext i8 %620 to i32
  %622 = sext i32 %621 to i64
  %623 = sub i64 0, %622
  %624 = getelementptr inbounds i8, i8* %617, i64 %623
  %625 = load i8, i8* %624, align 1
  store i8 %625, i8* %26, align 1
  %626 = load i8, i8* %26, align 1
  %627 = zext i8 %626 to i32
  %628 = load i32, i32* %23, align 4
  %629 = sub nsw i32 %628, %627
  store i32 %629, i32* %23, align 4
  %630 = load i8, i8* %26, align 1
  %631 = zext i8 %630 to i32
  %632 = mul nsw i32 3, %631
  %633 = load i32, i32* %24, align 4
  %634 = sub nsw i32 %633, %632
  store i32 %634, i32* %24, align 4
  %635 = load i8*, i8** %28, align 8
  %636 = load i8*, i8** %27, align 8
  %637 = getelementptr inbounds i8, i8* %636, i32 1
  store i8* %637, i8** %27, align 8
  %638 = load i8, i8* %636, align 1
  %639 = zext i8 %638 to i32
  %640 = sext i32 %639 to i64
  %641 = sub i64 0, %640
  %642 = getelementptr inbounds i8, i8* %635, i64 %641
  %643 = load i8, i8* %642, align 1
  store i8 %643, i8* %26, align 1
  %644 = load i8, i8* %26, align 1
  %645 = zext i8 %644 to i32
  %646 = mul nsw i32 3, %645
  %647 = load i32, i32* %24, align 4
  %648 = sub nsw i32 %647, %646
  store i32 %648, i32* %24, align 4
  %649 = load i8*, i8** %28, align 8
  %650 = load i8*, i8** %27, align 8
  %651 = load i8, i8* %650, align 1
  %652 = zext i8 %651 to i32
  %653 = sext i32 %652 to i64
  %654 = sub i64 0, %653
  %655 = getelementptr inbounds i8, i8* %649, i64 %654
  %656 = load i8, i8* %655, align 1
  store i8 %656, i8* %26, align 1
  %657 = load i8, i8* %26, align 1
  %658 = zext i8 %657 to i32
  %659 = load i32, i32* %23, align 4
  %660 = add nsw i32 %659, %658
  store i32 %660, i32* %23, align 4
  %661 = load i8, i8* %26, align 1
  %662 = zext i8 %661 to i32
  %663 = mul nsw i32 3, %662
  %664 = load i32, i32* %24, align 4
  %665 = sub nsw i32 %664, %663
  store i32 %665, i32* %24, align 4
  %666 = load i32, i32* %13, align 4
  %667 = sub nsw i32 %666, 3
  %668 = load i8*, i8** %27, align 8
  %669 = sext i32 %667 to i64
  %670 = getelementptr inbounds i8, i8* %668, i64 %669
  store i8* %670, i8** %27, align 8
  %671 = load i8*, i8** %28, align 8
  %672 = load i8*, i8** %27, align 8
  %673 = getelementptr inbounds i8, i8* %672, i32 1
  store i8* %673, i8** %27, align 8
  %674 = load i8, i8* %672, align 1
  %675 = zext i8 %674 to i32
  %676 = sext i32 %675 to i64
  %677 = sub i64 0, %676
  %678 = getelementptr inbounds i8, i8* %671, i64 %677
  %679 = load i8, i8* %678, align 1
  store i8 %679, i8* %26, align 1
  %680 = load i8, i8* %26, align 1
  %681 = zext i8 %680 to i32
  %682 = mul nsw i32 2, %681
  %683 = load i32, i32* %23, align 4
  %684 = sub nsw i32 %683, %682
  store i32 %684, i32* %23, align 4
  %685 = load i8, i8* %26, align 1
  %686 = zext i8 %685 to i32
  %687 = mul nsw i32 2, %686
  %688 = load i32, i32* %24, align 4
  %689 = sub nsw i32 %688, %687
  store i32 %689, i32* %24, align 4
  %690 = load i8*, i8** %28, align 8
  %691 = load i8*, i8** %27, align 8
  %692 = getelementptr inbounds i8, i8* %691, i32 1
  store i8* %692, i8** %27, align 8
  %693 = load i8, i8* %691, align 1
  %694 = zext i8 %693 to i32
  %695 = sext i32 %694 to i64
  %696 = sub i64 0, %695
  %697 = getelementptr inbounds i8, i8* %690, i64 %696
  %698 = load i8, i8* %697, align 1
  store i8 %698, i8* %26, align 1
  %699 = load i8, i8* %26, align 1
  %700 = zext i8 %699 to i32
  %701 = load i32, i32* %23, align 4
  %702 = sub nsw i32 %701, %700
  store i32 %702, i32* %23, align 4
  %703 = load i8, i8* %26, align 1
  %704 = zext i8 %703 to i32
  %705 = mul nsw i32 2, %704
  %706 = load i32, i32* %24, align 4
  %707 = sub nsw i32 %706, %705
  store i32 %707, i32* %24, align 4
  %708 = load i8*, i8** %28, align 8
  %709 = load i8*, i8** %27, align 8
  %710 = getelementptr inbounds i8, i8* %709, i32 1
  store i8* %710, i8** %27, align 8
  %711 = load i8, i8* %709, align 1
  %712 = zext i8 %711 to i32
  %713 = sext i32 %712 to i64
  %714 = sub i64 0, %713
  %715 = getelementptr inbounds i8, i8* %708, i64 %714
  %716 = load i8, i8* %715, align 1
  store i8 %716, i8* %26, align 1
  %717 = load i8, i8* %26, align 1
  %718 = zext i8 %717 to i32
  %719 = mul nsw i32 2, %718
  %720 = load i32, i32* %24, align 4
  %721 = sub nsw i32 %720, %719
  store i32 %721, i32* %24, align 4
  %722 = load i8*, i8** %28, align 8
  %723 = load i8*, i8** %27, align 8
  %724 = getelementptr inbounds i8, i8* %723, i32 1
  store i8* %724, i8** %27, align 8
  %725 = load i8, i8* %723, align 1
  %726 = zext i8 %725 to i32
  %727 = sext i32 %726 to i64
  %728 = sub i64 0, %727
  %729 = getelementptr inbounds i8, i8* %722, i64 %728
  %730 = load i8, i8* %729, align 1
  store i8 %730, i8* %26, align 1
  %731 = load i8, i8* %26, align 1
  %732 = zext i8 %731 to i32
  %733 = load i32, i32* %23, align 4
  %734 = add nsw i32 %733, %732
  store i32 %734, i32* %23, align 4
  %735 = load i8, i8* %26, align 1
  %736 = zext i8 %735 to i32
  %737 = mul nsw i32 2, %736
  %738 = load i32, i32* %24, align 4
  %739 = sub nsw i32 %738, %737
  store i32 %739, i32* %24, align 4
  %740 = load i8*, i8** %28, align 8
  %741 = load i8*, i8** %27, align 8
  %742 = load i8, i8* %741, align 1
  %743 = zext i8 %742 to i32
  %744 = sext i32 %743 to i64
  %745 = sub i64 0, %744
  %746 = getelementptr inbounds i8, i8* %740, i64 %745
  %747 = load i8, i8* %746, align 1
  store i8 %747, i8* %26, align 1
  %748 = load i8, i8* %26, align 1
  %749 = zext i8 %748 to i32
  %750 = mul nsw i32 2, %749
  %751 = load i32, i32* %23, align 4
  %752 = add nsw i32 %751, %750
  store i32 %752, i32* %23, align 4
  %753 = load i8, i8* %26, align 1
  %754 = zext i8 %753 to i32
  %755 = mul nsw i32 2, %754
  %756 = load i32, i32* %24, align 4
  %757 = sub nsw i32 %756, %755
  store i32 %757, i32* %24, align 4
  %758 = load i32, i32* %13, align 4
  %759 = sub nsw i32 %758, 5
  %760 = load i8*, i8** %27, align 8
  %761 = sext i32 %759 to i64
  %762 = getelementptr inbounds i8, i8* %760, i64 %761
  store i8* %762, i8** %27, align 8
  %763 = load i8*, i8** %28, align 8
  %764 = load i8*, i8** %27, align 8
  %765 = getelementptr inbounds i8, i8* %764, i32 1
  store i8* %765, i8** %27, align 8
  %766 = load i8, i8* %764, align 1
  %767 = zext i8 %766 to i32
  %768 = sext i32 %767 to i64
  %769 = sub i64 0, %768
  %770 = getelementptr inbounds i8, i8* %763, i64 %769
  %771 = load i8, i8* %770, align 1
  store i8 %771, i8* %26, align 1
  %772 = load i8, i8* %26, align 1
  %773 = zext i8 %772 to i32
  %774 = mul nsw i32 3, %773
  %775 = load i32, i32* %23, align 4
  %776 = sub nsw i32 %775, %774
  store i32 %776, i32* %23, align 4
  %777 = load i8, i8* %26, align 1
  %778 = zext i8 %777 to i32
  %779 = load i32, i32* %24, align 4
  %780 = sub nsw i32 %779, %778
  store i32 %780, i32* %24, align 4
  %781 = load i8*, i8** %28, align 8
  %782 = load i8*, i8** %27, align 8
  %783 = getelementptr inbounds i8, i8* %782, i32 1
  store i8* %783, i8** %27, align 8
  %784 = load i8, i8* %782, align 1
  %785 = zext i8 %784 to i32
  %786 = sext i32 %785 to i64
  %787 = sub i64 0, %786
  %788 = getelementptr inbounds i8, i8* %781, i64 %787
  %789 = load i8, i8* %788, align 1
  store i8 %789, i8* %26, align 1
  %790 = load i8, i8* %26, align 1
  %791 = zext i8 %790 to i32
  %792 = mul nsw i32 2, %791
  %793 = load i32, i32* %23, align 4
  %794 = sub nsw i32 %793, %792
  store i32 %794, i32* %23, align 4
  %795 = load i8, i8* %26, align 1
  %796 = zext i8 %795 to i32
  %797 = load i32, i32* %24, align 4
  %798 = sub nsw i32 %797, %796
  store i32 %798, i32* %24, align 4
  %799 = load i8*, i8** %28, align 8
  %800 = load i8*, i8** %27, align 8
  %801 = getelementptr inbounds i8, i8* %800, i32 1
  store i8* %801, i8** %27, align 8
  %802 = load i8, i8* %800, align 1
  %803 = zext i8 %802 to i32
  %804 = sext i32 %803 to i64
  %805 = sub i64 0, %804
  %806 = getelementptr inbounds i8, i8* %799, i64 %805
  %807 = load i8, i8* %806, align 1
  store i8 %807, i8* %26, align 1
  %808 = load i8, i8* %26, align 1
  %809 = zext i8 %808 to i32
  %810 = load i32, i32* %23, align 4
  %811 = sub nsw i32 %810, %809
  store i32 %811, i32* %23, align 4
  %812 = load i8, i8* %26, align 1
  %813 = zext i8 %812 to i32
  %814 = load i32, i32* %24, align 4
  %815 = sub nsw i32 %814, %813
  store i32 %815, i32* %24, align 4
  %816 = load i8*, i8** %28, align 8
  %817 = load i8*, i8** %27, align 8
  %818 = getelementptr inbounds i8, i8* %817, i32 1
  store i8* %818, i8** %27, align 8
  %819 = load i8, i8* %817, align 1
  %820 = zext i8 %819 to i32
  %821 = sext i32 %820 to i64
  %822 = sub i64 0, %821
  %823 = getelementptr inbounds i8, i8* %816, i64 %822
  %824 = load i8, i8* %823, align 1
  store i8 %824, i8* %26, align 1
  %825 = load i8, i8* %26, align 1
  %826 = zext i8 %825 to i32
  %827 = load i32, i32* %24, align 4
  %828 = sub nsw i32 %827, %826
  store i32 %828, i32* %24, align 4
  %829 = load i8*, i8** %28, align 8
  %830 = load i8*, i8** %27, align 8
  %831 = getelementptr inbounds i8, i8* %830, i32 1
  store i8* %831, i8** %27, align 8
  %832 = load i8, i8* %830, align 1
  %833 = zext i8 %832 to i32
  %834 = sext i32 %833 to i64
  %835 = sub i64 0, %834
  %836 = getelementptr inbounds i8, i8* %829, i64 %835
  %837 = load i8, i8* %836, align 1
  store i8 %837, i8* %26, align 1
  %838 = load i8, i8* %26, align 1
  %839 = zext i8 %838 to i32
  %840 = load i32, i32* %23, align 4
  %841 = add nsw i32 %840, %839
  store i32 %841, i32* %23, align 4
  %842 = load i8, i8* %26, align 1
  %843 = zext i8 %842 to i32
  %844 = load i32, i32* %24, align 4
  %845 = sub nsw i32 %844, %843
  store i32 %845, i32* %24, align 4
  %846 = load i8*, i8** %28, align 8
  %847 = load i8*, i8** %27, align 8
  %848 = getelementptr inbounds i8, i8* %847, i32 1
  store i8* %848, i8** %27, align 8
  %849 = load i8, i8* %847, align 1
  %850 = zext i8 %849 to i32
  %851 = sext i32 %850 to i64
  %852 = sub i64 0, %851
  %853 = getelementptr inbounds i8, i8* %846, i64 %852
  %854 = load i8, i8* %853, align 1
  store i8 %854, i8* %26, align 1
  %855 = load i8, i8* %26, align 1
  %856 = zext i8 %855 to i32
  %857 = mul nsw i32 2, %856
  %858 = load i32, i32* %23, align 4
  %859 = add nsw i32 %858, %857
  store i32 %859, i32* %23, align 4
  %860 = load i8, i8* %26, align 1
  %861 = zext i8 %860 to i32
  %862 = load i32, i32* %24, align 4
  %863 = sub nsw i32 %862, %861
  store i32 %863, i32* %24, align 4
  %864 = load i8*, i8** %28, align 8
  %865 = load i8*, i8** %27, align 8
  %866 = load i8, i8* %865, align 1
  %867 = zext i8 %866 to i32
  %868 = sext i32 %867 to i64
  %869 = sub i64 0, %868
  %870 = getelementptr inbounds i8, i8* %864, i64 %869
  %871 = load i8, i8* %870, align 1
  store i8 %871, i8* %26, align 1
  %872 = load i8, i8* %26, align 1
  %873 = zext i8 %872 to i32
  %874 = mul nsw i32 3, %873
  %875 = load i32, i32* %23, align 4
  %876 = add nsw i32 %875, %874
  store i32 %876, i32* %23, align 4
  %877 = load i8, i8* %26, align 1
  %878 = zext i8 %877 to i32
  %879 = load i32, i32* %24, align 4
  %880 = sub nsw i32 %879, %878
  store i32 %880, i32* %24, align 4
  %881 = load i32, i32* %13, align 4
  %882 = sub nsw i32 %881, 6
  %883 = load i8*, i8** %27, align 8
  %884 = sext i32 %882 to i64
  %885 = getelementptr inbounds i8, i8* %883, i64 %884
  store i8* %885, i8** %27, align 8
  %886 = load i8*, i8** %28, align 8
  %887 = load i8*, i8** %27, align 8
  %888 = getelementptr inbounds i8, i8* %887, i32 1
  store i8* %888, i8** %27, align 8
  %889 = load i8, i8* %887, align 1
  %890 = zext i8 %889 to i32
  %891 = sext i32 %890 to i64
  %892 = sub i64 0, %891
  %893 = getelementptr inbounds i8, i8* %886, i64 %892
  %894 = load i8, i8* %893, align 1
  store i8 %894, i8* %26, align 1
  %895 = load i8, i8* %26, align 1
  %896 = zext i8 %895 to i32
  %897 = mul nsw i32 3, %896
  %898 = load i32, i32* %23, align 4
  %899 = sub nsw i32 %898, %897
  store i32 %899, i32* %23, align 4
  %900 = load i8*, i8** %28, align 8
  %901 = load i8*, i8** %27, align 8
  %902 = getelementptr inbounds i8, i8* %901, i32 1
  store i8* %902, i8** %27, align 8
  %903 = load i8, i8* %901, align 1
  %904 = zext i8 %903 to i32
  %905 = sext i32 %904 to i64
  %906 = sub i64 0, %905
  %907 = getelementptr inbounds i8, i8* %900, i64 %906
  %908 = load i8, i8* %907, align 1
  store i8 %908, i8* %26, align 1
  %909 = load i8, i8* %26, align 1
  %910 = zext i8 %909 to i32
  %911 = mul nsw i32 2, %910
  %912 = load i32, i32* %23, align 4
  %913 = sub nsw i32 %912, %911
  store i32 %913, i32* %23, align 4
  %914 = load i8*, i8** %28, align 8
  %915 = load i8*, i8** %27, align 8
  %916 = load i8, i8* %915, align 1
  %917 = zext i8 %916 to i32
  %918 = sext i32 %917 to i64
  %919 = sub i64 0, %918
  %920 = getelementptr inbounds i8, i8* %914, i64 %919
  %921 = load i8, i8* %920, align 1
  store i8 %921, i8* %26, align 1
  %922 = load i8, i8* %26, align 1
  %923 = zext i8 %922 to i32
  %924 = load i32, i32* %23, align 4
  %925 = sub nsw i32 %924, %923
  store i32 %925, i32* %23, align 4
  %926 = load i8*, i8** %27, align 8
  %927 = getelementptr inbounds i8, i8* %926, i64 2
  store i8* %927, i8** %27, align 8
  %928 = load i8*, i8** %28, align 8
  %929 = load i8*, i8** %27, align 8
  %930 = getelementptr inbounds i8, i8* %929, i32 1
  store i8* %930, i8** %27, align 8
  %931 = load i8, i8* %929, align 1
  %932 = zext i8 %931 to i32
  %933 = sext i32 %932 to i64
  %934 = sub i64 0, %933
  %935 = getelementptr inbounds i8, i8* %928, i64 %934
  %936 = load i8, i8* %935, align 1
  store i8 %936, i8* %26, align 1
  %937 = load i8, i8* %26, align 1
  %938 = zext i8 %937 to i32
  %939 = load i32, i32* %23, align 4
  %940 = add nsw i32 %939, %938
  store i32 %940, i32* %23, align 4
  %941 = load i8*, i8** %28, align 8
  %942 = load i8*, i8** %27, align 8
  %943 = getelementptr inbounds i8, i8* %942, i32 1
  store i8* %943, i8** %27, align 8
  %944 = load i8, i8* %942, align 1
  %945 = zext i8 %944 to i32
  %946 = sext i32 %945 to i64
  %947 = sub i64 0, %946
  %948 = getelementptr inbounds i8, i8* %941, i64 %947
  %949 = load i8, i8* %948, align 1
  store i8 %949, i8* %26, align 1
  %950 = load i8, i8* %26, align 1
  %951 = zext i8 %950 to i32
  %952 = mul nsw i32 2, %951
  %953 = load i32, i32* %23, align 4
  %954 = add nsw i32 %953, %952
  store i32 %954, i32* %23, align 4
  %955 = load i8*, i8** %28, align 8
  %956 = load i8*, i8** %27, align 8
  %957 = load i8, i8* %956, align 1
  %958 = zext i8 %957 to i32
  %959 = sext i32 %958 to i64
  %960 = sub i64 0, %959
  %961 = getelementptr inbounds i8, i8* %955, i64 %960
  %962 = load i8, i8* %961, align 1
  store i8 %962, i8* %26, align 1
  %963 = load i8, i8* %26, align 1
  %964 = zext i8 %963 to i32
  %965 = mul nsw i32 3, %964
  %966 = load i32, i32* %23, align 4
  %967 = add nsw i32 %966, %965
  store i32 %967, i32* %23, align 4
  %968 = load i32, i32* %13, align 4
  %969 = sub nsw i32 %968, 6
  %970 = load i8*, i8** %27, align 8
  %971 = sext i32 %969 to i64
  %972 = getelementptr inbounds i8, i8* %970, i64 %971
  store i8* %972, i8** %27, align 8
  %973 = load i8*, i8** %28, align 8
  %974 = load i8*, i8** %27, align 8
  %975 = getelementptr inbounds i8, i8* %974, i32 1
  store i8* %975, i8** %27, align 8
  %976 = load i8, i8* %974, align 1
  %977 = zext i8 %976 to i32
  %978 = sext i32 %977 to i64
  %979 = sub i64 0, %978
  %980 = getelementptr inbounds i8, i8* %973, i64 %979
  %981 = load i8, i8* %980, align 1
  store i8 %981, i8* %26, align 1
  %982 = load i8, i8* %26, align 1
  %983 = zext i8 %982 to i32
  %984 = mul nsw i32 3, %983
  %985 = load i32, i32* %23, align 4
  %986 = sub nsw i32 %985, %984
  store i32 %986, i32* %23, align 4
  %987 = load i8, i8* %26, align 1
  %988 = zext i8 %987 to i32
  %989 = load i32, i32* %24, align 4
  %990 = add nsw i32 %989, %988
  store i32 %990, i32* %24, align 4
  %991 = load i8*, i8** %28, align 8
  %992 = load i8*, i8** %27, align 8
  %993 = getelementptr inbounds i8, i8* %992, i32 1
  store i8* %993, i8** %27, align 8
  %994 = load i8, i8* %992, align 1
  %995 = zext i8 %994 to i32
  %996 = sext i32 %995 to i64
  %997 = sub i64 0, %996
  %998 = getelementptr inbounds i8, i8* %991, i64 %997
  %999 = load i8, i8* %998, align 1
  store i8 %999, i8* %26, align 1
  %1000 = load i8, i8* %26, align 1
  %1001 = zext i8 %1000 to i32
  %1002 = mul nsw i32 2, %1001
  %1003 = load i32, i32* %23, align 4
  %1004 = sub nsw i32 %1003, %1002
  store i32 %1004, i32* %23, align 4
  %1005 = load i8, i8* %26, align 1
  %1006 = zext i8 %1005 to i32
  %1007 = load i32, i32* %24, align 4
  %1008 = add nsw i32 %1007, %1006
  store i32 %1008, i32* %24, align 4
  %1009 = load i8*, i8** %28, align 8
  %1010 = load i8*, i8** %27, align 8
  %1011 = getelementptr inbounds i8, i8* %1010, i32 1
  store i8* %1011, i8** %27, align 8
  %1012 = load i8, i8* %1010, align 1
  %1013 = zext i8 %1012 to i32
  %1014 = sext i32 %1013 to i64
  %1015 = sub i64 0, %1014
  %1016 = getelementptr inbounds i8, i8* %1009, i64 %1015
  %1017 = load i8, i8* %1016, align 1
  store i8 %1017, i8* %26, align 1
  %1018 = load i8, i8* %26, align 1
  %1019 = zext i8 %1018 to i32
  %1020 = load i32, i32* %23, align 4
  %1021 = sub nsw i32 %1020, %1019
  store i32 %1021, i32* %23, align 4
  %1022 = load i8, i8* %26, align 1
  %1023 = zext i8 %1022 to i32
  %1024 = load i32, i32* %24, align 4
  %1025 = add nsw i32 %1024, %1023
  store i32 %1025, i32* %24, align 4
  %1026 = load i8*, i8** %28, align 8
  %1027 = load i8*, i8** %27, align 8
  %1028 = getelementptr inbounds i8, i8* %1027, i32 1
  store i8* %1028, i8** %27, align 8
  %1029 = load i8, i8* %1027, align 1
  %1030 = zext i8 %1029 to i32
  %1031 = sext i32 %1030 to i64
  %1032 = sub i64 0, %1031
  %1033 = getelementptr inbounds i8, i8* %1026, i64 %1032
  %1034 = load i8, i8* %1033, align 1
  store i8 %1034, i8* %26, align 1
  %1035 = load i8, i8* %26, align 1
  %1036 = zext i8 %1035 to i32
  %1037 = load i32, i32* %24, align 4
  %1038 = add nsw i32 %1037, %1036
  store i32 %1038, i32* %24, align 4
  %1039 = load i8*, i8** %28, align 8
  %1040 = load i8*, i8** %27, align 8
  %1041 = getelementptr inbounds i8, i8* %1040, i32 1
  store i8* %1041, i8** %27, align 8
  %1042 = load i8, i8* %1040, align 1
  %1043 = zext i8 %1042 to i32
  %1044 = sext i32 %1043 to i64
  %1045 = sub i64 0, %1044
  %1046 = getelementptr inbounds i8, i8* %1039, i64 %1045
  %1047 = load i8, i8* %1046, align 1
  store i8 %1047, i8* %26, align 1
  %1048 = load i8, i8* %26, align 1
  %1049 = zext i8 %1048 to i32
  %1050 = load i32, i32* %23, align 4
  %1051 = add nsw i32 %1050, %1049
  store i32 %1051, i32* %23, align 4
  %1052 = load i8, i8* %26, align 1
  %1053 = zext i8 %1052 to i32
  %1054 = load i32, i32* %24, align 4
  %1055 = add nsw i32 %1054, %1053
  store i32 %1055, i32* %24, align 4
  %1056 = load i8*, i8** %28, align 8
  %1057 = load i8*, i8** %27, align 8
  %1058 = getelementptr inbounds i8, i8* %1057, i32 1
  store i8* %1058, i8** %27, align 8
  %1059 = load i8, i8* %1057, align 1
  %1060 = zext i8 %1059 to i32
  %1061 = sext i32 %1060 to i64
  %1062 = sub i64 0, %1061
  %1063 = getelementptr inbounds i8, i8* %1056, i64 %1062
  %1064 = load i8, i8* %1063, align 1
  store i8 %1064, i8* %26, align 1
  %1065 = load i8, i8* %26, align 1
  %1066 = zext i8 %1065 to i32
  %1067 = mul nsw i32 2, %1066
  %1068 = load i32, i32* %23, align 4
  %1069 = add nsw i32 %1068, %1067
  store i32 %1069, i32* %23, align 4
  %1070 = load i8, i8* %26, align 1
  %1071 = zext i8 %1070 to i32
  %1072 = load i32, i32* %24, align 4
  %1073 = add nsw i32 %1072, %1071
  store i32 %1073, i32* %24, align 4
  %1074 = load i8*, i8** %28, align 8
  %1075 = load i8*, i8** %27, align 8
  %1076 = load i8, i8* %1075, align 1
  %1077 = zext i8 %1076 to i32
  %1078 = sext i32 %1077 to i64
  %1079 = sub i64 0, %1078
  %1080 = getelementptr inbounds i8, i8* %1074, i64 %1079
  %1081 = load i8, i8* %1080, align 1
  store i8 %1081, i8* %26, align 1
  %1082 = load i8, i8* %26, align 1
  %1083 = zext i8 %1082 to i32
  %1084 = mul nsw i32 3, %1083
  %1085 = load i32, i32* %23, align 4
  %1086 = add nsw i32 %1085, %1084
  store i32 %1086, i32* %23, align 4
  %1087 = load i8, i8* %26, align 1
  %1088 = zext i8 %1087 to i32
  %1089 = load i32, i32* %24, align 4
  %1090 = add nsw i32 %1089, %1088
  store i32 %1090, i32* %24, align 4
  %1091 = load i32, i32* %13, align 4
  %1092 = sub nsw i32 %1091, 5
  %1093 = load i8*, i8** %27, align 8
  %1094 = sext i32 %1092 to i64
  %1095 = getelementptr inbounds i8, i8* %1093, i64 %1094
  store i8* %1095, i8** %27, align 8
  %1096 = load i8*, i8** %28, align 8
  %1097 = load i8*, i8** %27, align 8
  %1098 = getelementptr inbounds i8, i8* %1097, i32 1
  store i8* %1098, i8** %27, align 8
  %1099 = load i8, i8* %1097, align 1
  %1100 = zext i8 %1099 to i32
  %1101 = sext i32 %1100 to i64
  %1102 = sub i64 0, %1101
  %1103 = getelementptr inbounds i8, i8* %1096, i64 %1102
  %1104 = load i8, i8* %1103, align 1
  store i8 %1104, i8* %26, align 1
  %1105 = load i8, i8* %26, align 1
  %1106 = zext i8 %1105 to i32
  %1107 = mul nsw i32 2, %1106
  %1108 = load i32, i32* %23, align 4
  %1109 = sub nsw i32 %1108, %1107
  store i32 %1109, i32* %23, align 4
  %1110 = load i8, i8* %26, align 1
  %1111 = zext i8 %1110 to i32
  %1112 = mul nsw i32 2, %1111
  %1113 = load i32, i32* %24, align 4
  %1114 = add nsw i32 %1113, %1112
  store i32 %1114, i32* %24, align 4
  %1115 = load i8*, i8** %28, align 8
  %1116 = load i8*, i8** %27, align 8
  %1117 = getelementptr inbounds i8, i8* %1116, i32 1
  store i8* %1117, i8** %27, align 8
  %1118 = load i8, i8* %1116, align 1
  %1119 = zext i8 %1118 to i32
  %1120 = sext i32 %1119 to i64
  %1121 = sub i64 0, %1120
  %1122 = getelementptr inbounds i8, i8* %1115, i64 %1121
  %1123 = load i8, i8* %1122, align 1
  store i8 %1123, i8* %26, align 1
  %1124 = load i8, i8* %26, align 1
  %1125 = zext i8 %1124 to i32
  %1126 = load i32, i32* %23, align 4
  %1127 = sub nsw i32 %1126, %1125
  store i32 %1127, i32* %23, align 4
  %1128 = load i8, i8* %26, align 1
  %1129 = zext i8 %1128 to i32
  %1130 = mul nsw i32 2, %1129
  %1131 = load i32, i32* %24, align 4
  %1132 = add nsw i32 %1131, %1130
  store i32 %1132, i32* %24, align 4
  %1133 = load i8*, i8** %28, align 8
  %1134 = load i8*, i8** %27, align 8
  %1135 = getelementptr inbounds i8, i8* %1134, i32 1
  store i8* %1135, i8** %27, align 8
  %1136 = load i8, i8* %1134, align 1
  %1137 = zext i8 %1136 to i32
  %1138 = sext i32 %1137 to i64
  %1139 = sub i64 0, %1138
  %1140 = getelementptr inbounds i8, i8* %1133, i64 %1139
  %1141 = load i8, i8* %1140, align 1
  store i8 %1141, i8* %26, align 1
  %1142 = load i8, i8* %26, align 1
  %1143 = zext i8 %1142 to i32
  %1144 = mul nsw i32 2, %1143
  %1145 = load i32, i32* %24, align 4
  %1146 = add nsw i32 %1145, %1144
  store i32 %1146, i32* %24, align 4
  %1147 = load i8*, i8** %28, align 8
  %1148 = load i8*, i8** %27, align 8
  %1149 = getelementptr inbounds i8, i8* %1148, i32 1
  store i8* %1149, i8** %27, align 8
  %1150 = load i8, i8* %1148, align 1
  %1151 = zext i8 %1150 to i32
  %1152 = sext i32 %1151 to i64
  %1153 = sub i64 0, %1152
  %1154 = getelementptr inbounds i8, i8* %1147, i64 %1153
  %1155 = load i8, i8* %1154, align 1
  store i8 %1155, i8* %26, align 1
  %1156 = load i8, i8* %26, align 1
  %1157 = zext i8 %1156 to i32
  %1158 = load i32, i32* %23, align 4
  %1159 = add nsw i32 %1158, %1157
  store i32 %1159, i32* %23, align 4
  %1160 = load i8, i8* %26, align 1
  %1161 = zext i8 %1160 to i32
  %1162 = mul nsw i32 2, %1161
  %1163 = load i32, i32* %24, align 4
  %1164 = add nsw i32 %1163, %1162
  store i32 %1164, i32* %24, align 4
  %1165 = load i8*, i8** %28, align 8
  %1166 = load i8*, i8** %27, align 8
  %1167 = load i8, i8* %1166, align 1
  %1168 = zext i8 %1167 to i32
  %1169 = sext i32 %1168 to i64
  %1170 = sub i64 0, %1169
  %1171 = getelementptr inbounds i8, i8* %1165, i64 %1170
  %1172 = load i8, i8* %1171, align 1
  store i8 %1172, i8* %26, align 1
  %1173 = load i8, i8* %26, align 1
  %1174 = zext i8 %1173 to i32
  %1175 = mul nsw i32 2, %1174
  %1176 = load i32, i32* %23, align 4
  %1177 = add nsw i32 %1176, %1175
  store i32 %1177, i32* %23, align 4
  %1178 = load i8, i8* %26, align 1
  %1179 = zext i8 %1178 to i32
  %1180 = mul nsw i32 2, %1179
  %1181 = load i32, i32* %24, align 4
  %1182 = add nsw i32 %1181, %1180
  store i32 %1182, i32* %24, align 4
  %1183 = load i32, i32* %13, align 4
  %1184 = sub nsw i32 %1183, 3
  %1185 = load i8*, i8** %27, align 8
  %1186 = sext i32 %1184 to i64
  %1187 = getelementptr inbounds i8, i8* %1185, i64 %1186
  store i8* %1187, i8** %27, align 8
  %1188 = load i8*, i8** %28, align 8
  %1189 = load i8*, i8** %27, align 8
  %1190 = getelementptr inbounds i8, i8* %1189, i32 1
  store i8* %1190, i8** %27, align 8
  %1191 = load i8, i8* %1189, align 1
  %1192 = zext i8 %1191 to i32
  %1193 = sext i32 %1192 to i64
  %1194 = sub i64 0, %1193
  %1195 = getelementptr inbounds i8, i8* %1188, i64 %1194
  %1196 = load i8, i8* %1195, align 1
  store i8 %1196, i8* %26, align 1
  %1197 = load i8, i8* %26, align 1
  %1198 = zext i8 %1197 to i32
  %1199 = load i32, i32* %23, align 4
  %1200 = sub nsw i32 %1199, %1198
  store i32 %1200, i32* %23, align 4
  %1201 = load i8, i8* %26, align 1
  %1202 = zext i8 %1201 to i32
  %1203 = mul nsw i32 3, %1202
  %1204 = load i32, i32* %24, align 4
  %1205 = add nsw i32 %1204, %1203
  store i32 %1205, i32* %24, align 4
  %1206 = load i8*, i8** %28, align 8
  %1207 = load i8*, i8** %27, align 8
  %1208 = getelementptr inbounds i8, i8* %1207, i32 1
  store i8* %1208, i8** %27, align 8
  %1209 = load i8, i8* %1207, align 1
  %1210 = zext i8 %1209 to i32
  %1211 = sext i32 %1210 to i64
  %1212 = sub i64 0, %1211
  %1213 = getelementptr inbounds i8, i8* %1206, i64 %1212
  %1214 = load i8, i8* %1213, align 1
  store i8 %1214, i8* %26, align 1
  %1215 = load i8, i8* %26, align 1
  %1216 = zext i8 %1215 to i32
  %1217 = mul nsw i32 3, %1216
  %1218 = load i32, i32* %24, align 4
  %1219 = add nsw i32 %1218, %1217
  store i32 %1219, i32* %24, align 4
  %1220 = load i8*, i8** %28, align 8
  %1221 = load i8*, i8** %27, align 8
  %1222 = load i8, i8* %1221, align 1
  %1223 = zext i8 %1222 to i32
  %1224 = sext i32 %1223 to i64
  %1225 = sub i64 0, %1224
  %1226 = getelementptr inbounds i8, i8* %1220, i64 %1225
  %1227 = load i8, i8* %1226, align 1
  store i8 %1227, i8* %26, align 1
  %1228 = load i8, i8* %26, align 1
  %1229 = zext i8 %1228 to i32
  %1230 = load i32, i32* %23, align 4
  %1231 = add nsw i32 %1230, %1229
  store i32 %1231, i32* %23, align 4
  %1232 = load i8, i8* %26, align 1
  %1233 = zext i8 %1232 to i32
  %1234 = mul nsw i32 3, %1233
  %1235 = load i32, i32* %24, align 4
  %1236 = add nsw i32 %1235, %1234
  store i32 %1236, i32* %24, align 4
  %1237 = load i32, i32* %23, align 4
  %1238 = load i32, i32* %23, align 4
  %1239 = mul nsw i32 %1237, %1238
  %1240 = load i32, i32* %24, align 4
  %1241 = load i32, i32* %24, align 4
  %1242 = mul nsw i32 %1240, %1241
  %1243 = add nsw i32 %1239, %1242
  %1244 = sitofp i32 %1243 to float
  %1245 = fpext float %1244 to double
  %1246 = call double @sqrt(double %1245) #7
  %1247 = fptrunc double %1246 to float
  store float %1247, float* %15, align 4
  %1248 = load float, float* %15, align 4
  %1249 = fpext float %1248 to double
  %1250 = load i32, i32* %20, align 4
  %1251 = sitofp i32 %1250 to float
  %1252 = fpext float %1251 to double
  %1253 = fmul double 9.000000e-01, %1252
  %1254 = fcmp ogt double %1249, %1253
  br i1 %1254, label %1255, label %1377

; <label>:1255:                                   ; preds = %605
  store i32 0, i32* %16, align 4
  %1256 = load i32, i32* %23, align 4
  %1257 = icmp eq i32 %1256, 0
  br i1 %1257, label %1258, label %1260

; <label>:1258:                                   ; preds = %1255
  %pgocount3 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 13)
  %1259 = add i64 %pgocount3, 1
  store i64 %1259, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 13)
  store float 1.000000e+06, float* %15, align 4
  br label %1266

; <label>:1260:                                   ; preds = %1255
  %1261 = load i32, i32* %24, align 4
  %1262 = sitofp i32 %1261 to float
  %1263 = load i32, i32* %23, align 4
  %1264 = sitofp i32 %1263 to float
  %1265 = fdiv float %1262, %1264
  store float %1265, float* %15, align 4
  br label %1266

; <label>:1266:                                   ; preds = %1260, %1258
  %1267 = load float, float* %15, align 4
  %1268 = fcmp olt float %1267, 0.000000e+00
  br i1 %1268, label %1269, label %1272

; <label>:1269:                                   ; preds = %1266
  %1270 = load float, float* %15, align 4
  %1271 = fsub float -0.000000e+00, %1270
  store float %1271, float* %15, align 4
  store i32 -1, i32* %25, align 4
  br label %1274

; <label>:1272:                                   ; preds = %1266
  %pgocount4 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 8)
  %1273 = add i64 %pgocount4, 1
  store i64 %1273, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 8)
  store i32 1, i32* %25, align 4
  br label %1274

; <label>:1274:                                   ; preds = %1272, %1269
  %1275 = load float, float* %15, align 4
  %1276 = fpext float %1275 to double
  %1277 = fcmp olt double %1276, 5.000000e-01
  br i1 %1277, label %1278, label %1280

; <label>:1278:                                   ; preds = %1274
  %pgocount5 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 9)
  %1279 = add i64 %pgocount5, 1
  store i64 %1279, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 9)
  store i32 0, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %1295

; <label>:1280:                                   ; preds = %1274
  %1281 = load float, float* %15, align 4
  %1282 = fpext float %1281 to double
  %1283 = fcmp ogt double %1282, 2.000000e+00
  br i1 %1283, label %1284, label %1286

; <label>:1284:                                   ; preds = %1280
  %pgocount6 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 15)
  %1285 = add i64 %pgocount6, 1
  store i64 %1285, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 15)
  store i32 1, i32* %21, align 4
  store i32 0, i32* %22, align 4
  br label %1294

; <label>:1286:                                   ; preds = %1280
  %1287 = load i32, i32* %25, align 4
  %1288 = icmp sgt i32 %1287, 0
  br i1 %1288, label %1289, label %1291

; <label>:1289:                                   ; preds = %1286
  %pgocount7 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 21)
  %1290 = add i64 %pgocount7, 1
  store i64 %1290, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 21)
  store i32 1, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %1293

; <label>:1291:                                   ; preds = %1286
  %pgocount8 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 24)
  %1292 = add i64 %pgocount8, 1
  store i64 %1292, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 24)
  store i32 -1, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %1293

; <label>:1293:                                   ; preds = %1291, %1289
  br label %1294

; <label>:1294:                                   ; preds = %1293, %1284
  br label %1295

; <label>:1295:                                   ; preds = %1294, %1278
  %1296 = load i32, i32* %19, align 4
  %1297 = load i32*, i32** %9, align 8
  %1298 = load i32, i32* %17, align 4
  %1299 = load i32, i32* %21, align 4
  %1300 = add nsw i32 %1298, %1299
  %1301 = load i32, i32* %13, align 4
  %1302 = mul nsw i32 %1300, %1301
  %1303 = load i32, i32* %18, align 4
  %1304 = add nsw i32 %1302, %1303
  %1305 = load i32, i32* %22, align 4
  %1306 = add nsw i32 %1304, %1305
  %1307 = sext i32 %1306 to i64
  %1308 = getelementptr inbounds i32, i32* %1297, i64 %1307
  %1309 = load i32, i32* %1308, align 4
  %1310 = icmp sgt i32 %1296, %1309
  br i1 %1310, label %1311, label %1376

; <label>:1311:                                   ; preds = %1295
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 10)
  %1312 = add i64 %pgocount9, 1
  store i64 %1312, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 10)
  %1313 = load i32, i32* %19, align 4
  %1314 = load i32*, i32** %9, align 8
  %1315 = load i32, i32* %17, align 4
  %1316 = load i32, i32* %21, align 4
  %1317 = sub nsw i32 %1315, %1316
  %1318 = load i32, i32* %13, align 4
  %1319 = mul nsw i32 %1317, %1318
  %1320 = load i32, i32* %18, align 4
  %1321 = add nsw i32 %1319, %1320
  %1322 = load i32, i32* %22, align 4
  %1323 = sub nsw i32 %1321, %1322
  %1324 = sext i32 %1323 to i64
  %1325 = getelementptr inbounds i32, i32* %1314, i64 %1324
  %1326 = load i32, i32* %1325, align 4
  %1327 = icmp sge i32 %1313, %1326
  br i1 %1327, label %1328, label %1376

; <label>:1328:                                   ; preds = %1311
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 16)
  %1329 = add i64 %pgocount10, 1
  store i64 %1329, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 16)
  %1330 = load i32, i32* %19, align 4
  %1331 = load i32*, i32** %9, align 8
  %1332 = load i32, i32* %17, align 4
  %1333 = load i32, i32* %21, align 4
  %1334 = mul nsw i32 2, %1333
  %1335 = add nsw i32 %1332, %1334
  %1336 = load i32, i32* %13, align 4
  %1337 = mul nsw i32 %1335, %1336
  %1338 = load i32, i32* %18, align 4
  %1339 = add nsw i32 %1337, %1338
  %1340 = load i32, i32* %22, align 4
  %1341 = mul nsw i32 2, %1340
  %1342 = add nsw i32 %1339, %1341
  %1343 = sext i32 %1342 to i64
  %1344 = getelementptr inbounds i32, i32* %1331, i64 %1343
  %1345 = load i32, i32* %1344, align 4
  %1346 = icmp sgt i32 %1330, %1345
  br i1 %1346, label %1347, label %1376

; <label>:1347:                                   ; preds = %1328
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 22)
  %1348 = add i64 %pgocount11, 1
  store i64 %1348, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 22)
  %1349 = load i32, i32* %19, align 4
  %1350 = load i32*, i32** %9, align 8
  %1351 = load i32, i32* %17, align 4
  %1352 = load i32, i32* %21, align 4
  %1353 = mul nsw i32 2, %1352
  %1354 = sub nsw i32 %1351, %1353
  %1355 = load i32, i32* %13, align 4
  %1356 = mul nsw i32 %1354, %1355
  %1357 = load i32, i32* %18, align 4
  %1358 = add nsw i32 %1356, %1357
  %1359 = load i32, i32* %22, align 4
  %1360 = mul nsw i32 2, %1359
  %1361 = sub nsw i32 %1358, %1360
  %1362 = sext i32 %1361 to i64
  %1363 = getelementptr inbounds i32, i32* %1350, i64 %1362
  %1364 = load i32, i32* %1363, align 4
  %1365 = icmp sge i32 %1349, %1364
  br i1 %1365, label %1366, label %1376

; <label>:1366:                                   ; preds = %1347
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 25)
  %1367 = add i64 %pgocount12, 1
  store i64 %1367, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 25)
  %1368 = load i8*, i8** %10, align 8
  %1369 = load i32, i32* %17, align 4
  %1370 = load i32, i32* %13, align 4
  %1371 = mul nsw i32 %1369, %1370
  %1372 = load i32, i32* %18, align 4
  %1373 = add nsw i32 %1371, %1372
  %1374 = sext i32 %1373 to i64
  %1375 = getelementptr inbounds i8, i8* %1368, i64 %1374
  store i8 1, i8* %1375, align 1
  br label %1376

; <label>:1376:                                   ; preds = %1366, %1347, %1328, %1311, %1295
  br label %1379

; <label>:1377:                                   ; preds = %605
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 4)
  %1378 = add i64 %pgocount13, 1
  store i64 %1378, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 4)
  store i32 1, i32* %16, align 4
  br label %1379

; <label>:1379:                                   ; preds = %1377, %1376
  br label %1382

; <label>:1380:                                   ; preds = %577
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 3)
  %1381 = add i64 %pgocount14, 1
  store i64 %1381, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 3)
  store i32 1, i32* %16, align 4
  br label %1382

; <label>:1382:                                   ; preds = %1380, %1379
  %1383 = load i32, i32* %16, align 4
  %1384 = icmp eq i32 %1383, 1
  br i1 %1384, label %1385, label %2246

; <label>:1385:                                   ; preds = %1382
  %1386 = load i8*, i8** %8, align 8
  %1387 = load i32, i32* %17, align 4
  %1388 = sub nsw i32 %1387, 3
  %1389 = load i32, i32* %13, align 4
  %1390 = mul nsw i32 %1388, %1389
  %1391 = sext i32 %1390 to i64
  %1392 = getelementptr inbounds i8, i8* %1386, i64 %1391
  %1393 = load i32, i32* %18, align 4
  %1394 = sext i32 %1393 to i64
  %1395 = getelementptr inbounds i8, i8* %1392, i64 %1394
  %1396 = getelementptr inbounds i8, i8* %1395, i64 -1
  store i8* %1396, i8** %27, align 8
  store i32 0, i32* %23, align 4
  store i32 0, i32* %24, align 4
  store i32 0, i32* %25, align 4
  %1397 = load i8*, i8** %28, align 8
  %1398 = load i8*, i8** %27, align 8
  %1399 = getelementptr inbounds i8, i8* %1398, i32 1
  store i8* %1399, i8** %27, align 8
  %1400 = load i8, i8* %1398, align 1
  %1401 = zext i8 %1400 to i32
  %1402 = sext i32 %1401 to i64
  %1403 = sub i64 0, %1402
  %1404 = getelementptr inbounds i8, i8* %1397, i64 %1403
  %1405 = load i8, i8* %1404, align 1
  store i8 %1405, i8* %26, align 1
  %1406 = load i8, i8* %26, align 1
  %1407 = zext i8 %1406 to i32
  %1408 = load i32, i32* %23, align 4
  %1409 = add nsw i32 %1408, %1407
  store i32 %1409, i32* %23, align 4
  %1410 = load i8, i8* %26, align 1
  %1411 = zext i8 %1410 to i32
  %1412 = mul nsw i32 9, %1411
  %1413 = load i32, i32* %24, align 4
  %1414 = add nsw i32 %1413, %1412
  store i32 %1414, i32* %24, align 4
  %1415 = load i8, i8* %26, align 1
  %1416 = zext i8 %1415 to i32
  %1417 = mul nsw i32 3, %1416
  %1418 = load i32, i32* %25, align 4
  %1419 = add nsw i32 %1418, %1417
  store i32 %1419, i32* %25, align 4
  %1420 = load i8*, i8** %28, align 8
  %1421 = load i8*, i8** %27, align 8
  %1422 = getelementptr inbounds i8, i8* %1421, i32 1
  store i8* %1422, i8** %27, align 8
  %1423 = load i8, i8* %1421, align 1
  %1424 = zext i8 %1423 to i32
  %1425 = sext i32 %1424 to i64
  %1426 = sub i64 0, %1425
  %1427 = getelementptr inbounds i8, i8* %1420, i64 %1426
  %1428 = load i8, i8* %1427, align 1
  store i8 %1428, i8* %26, align 1
  %1429 = load i8, i8* %26, align 1
  %1430 = zext i8 %1429 to i32
  %1431 = mul nsw i32 9, %1430
  %1432 = load i32, i32* %24, align 4
  %1433 = add nsw i32 %1432, %1431
  store i32 %1433, i32* %24, align 4
  %1434 = load i8*, i8** %28, align 8
  %1435 = load i8*, i8** %27, align 8
  %1436 = load i8, i8* %1435, align 1
  %1437 = zext i8 %1436 to i32
  %1438 = sext i32 %1437 to i64
  %1439 = sub i64 0, %1438
  %1440 = getelementptr inbounds i8, i8* %1434, i64 %1439
  %1441 = load i8, i8* %1440, align 1
  store i8 %1441, i8* %26, align 1
  %1442 = load i8, i8* %26, align 1
  %1443 = zext i8 %1442 to i32
  %1444 = load i32, i32* %23, align 4
  %1445 = add nsw i32 %1444, %1443
  store i32 %1445, i32* %23, align 4
  %1446 = load i8, i8* %26, align 1
  %1447 = zext i8 %1446 to i32
  %1448 = mul nsw i32 9, %1447
  %1449 = load i32, i32* %24, align 4
  %1450 = add nsw i32 %1449, %1448
  store i32 %1450, i32* %24, align 4
  %1451 = load i8, i8* %26, align 1
  %1452 = zext i8 %1451 to i32
  %1453 = mul nsw i32 3, %1452
  %1454 = load i32, i32* %25, align 4
  %1455 = sub nsw i32 %1454, %1453
  store i32 %1455, i32* %25, align 4
  %1456 = load i32, i32* %13, align 4
  %1457 = sub nsw i32 %1456, 3
  %1458 = load i8*, i8** %27, align 8
  %1459 = sext i32 %1457 to i64
  %1460 = getelementptr inbounds i8, i8* %1458, i64 %1459
  store i8* %1460, i8** %27, align 8
  %1461 = load i8*, i8** %28, align 8
  %1462 = load i8*, i8** %27, align 8
  %1463 = getelementptr inbounds i8, i8* %1462, i32 1
  store i8* %1463, i8** %27, align 8
  %1464 = load i8, i8* %1462, align 1
  %1465 = zext i8 %1464 to i32
  %1466 = sext i32 %1465 to i64
  %1467 = sub i64 0, %1466
  %1468 = getelementptr inbounds i8, i8* %1461, i64 %1467
  %1469 = load i8, i8* %1468, align 1
  store i8 %1469, i8* %26, align 1
  %1470 = load i8, i8* %26, align 1
  %1471 = zext i8 %1470 to i32
  %1472 = mul nsw i32 4, %1471
  %1473 = load i32, i32* %23, align 4
  %1474 = add nsw i32 %1473, %1472
  store i32 %1474, i32* %23, align 4
  %1475 = load i8, i8* %26, align 1
  %1476 = zext i8 %1475 to i32
  %1477 = mul nsw i32 4, %1476
  %1478 = load i32, i32* %24, align 4
  %1479 = add nsw i32 %1478, %1477
  store i32 %1479, i32* %24, align 4
  %1480 = load i8, i8* %26, align 1
  %1481 = zext i8 %1480 to i32
  %1482 = mul nsw i32 4, %1481
  %1483 = load i32, i32* %25, align 4
  %1484 = add nsw i32 %1483, %1482
  store i32 %1484, i32* %25, align 4
  %1485 = load i8*, i8** %28, align 8
  %1486 = load i8*, i8** %27, align 8
  %1487 = getelementptr inbounds i8, i8* %1486, i32 1
  store i8* %1487, i8** %27, align 8
  %1488 = load i8, i8* %1486, align 1
  %1489 = zext i8 %1488 to i32
  %1490 = sext i32 %1489 to i64
  %1491 = sub i64 0, %1490
  %1492 = getelementptr inbounds i8, i8* %1485, i64 %1491
  %1493 = load i8, i8* %1492, align 1
  store i8 %1493, i8* %26, align 1
  %1494 = load i8, i8* %26, align 1
  %1495 = zext i8 %1494 to i32
  %1496 = load i32, i32* %23, align 4
  %1497 = add nsw i32 %1496, %1495
  store i32 %1497, i32* %23, align 4
  %1498 = load i8, i8* %26, align 1
  %1499 = zext i8 %1498 to i32
  %1500 = mul nsw i32 4, %1499
  %1501 = load i32, i32* %24, align 4
  %1502 = add nsw i32 %1501, %1500
  store i32 %1502, i32* %24, align 4
  %1503 = load i8, i8* %26, align 1
  %1504 = zext i8 %1503 to i32
  %1505 = mul nsw i32 2, %1504
  %1506 = load i32, i32* %25, align 4
  %1507 = add nsw i32 %1506, %1505
  store i32 %1507, i32* %25, align 4
  %1508 = load i8*, i8** %28, align 8
  %1509 = load i8*, i8** %27, align 8
  %1510 = getelementptr inbounds i8, i8* %1509, i32 1
  store i8* %1510, i8** %27, align 8
  %1511 = load i8, i8* %1509, align 1
  %1512 = zext i8 %1511 to i32
  %1513 = sext i32 %1512 to i64
  %1514 = sub i64 0, %1513
  %1515 = getelementptr inbounds i8, i8* %1508, i64 %1514
  %1516 = load i8, i8* %1515, align 1
  store i8 %1516, i8* %26, align 1
  %1517 = load i8, i8* %26, align 1
  %1518 = zext i8 %1517 to i32
  %1519 = mul nsw i32 4, %1518
  %1520 = load i32, i32* %24, align 4
  %1521 = add nsw i32 %1520, %1519
  store i32 %1521, i32* %24, align 4
  %1522 = load i8*, i8** %28, align 8
  %1523 = load i8*, i8** %27, align 8
  %1524 = getelementptr inbounds i8, i8* %1523, i32 1
  store i8* %1524, i8** %27, align 8
  %1525 = load i8, i8* %1523, align 1
  %1526 = zext i8 %1525 to i32
  %1527 = sext i32 %1526 to i64
  %1528 = sub i64 0, %1527
  %1529 = getelementptr inbounds i8, i8* %1522, i64 %1528
  %1530 = load i8, i8* %1529, align 1
  store i8 %1530, i8* %26, align 1
  %1531 = load i8, i8* %26, align 1
  %1532 = zext i8 %1531 to i32
  %1533 = load i32, i32* %23, align 4
  %1534 = add nsw i32 %1533, %1532
  store i32 %1534, i32* %23, align 4
  %1535 = load i8, i8* %26, align 1
  %1536 = zext i8 %1535 to i32
  %1537 = mul nsw i32 4, %1536
  %1538 = load i32, i32* %24, align 4
  %1539 = add nsw i32 %1538, %1537
  store i32 %1539, i32* %24, align 4
  %1540 = load i8, i8* %26, align 1
  %1541 = zext i8 %1540 to i32
  %1542 = mul nsw i32 2, %1541
  %1543 = load i32, i32* %25, align 4
  %1544 = sub nsw i32 %1543, %1542
  store i32 %1544, i32* %25, align 4
  %1545 = load i8*, i8** %28, align 8
  %1546 = load i8*, i8** %27, align 8
  %1547 = load i8, i8* %1546, align 1
  %1548 = zext i8 %1547 to i32
  %1549 = sext i32 %1548 to i64
  %1550 = sub i64 0, %1549
  %1551 = getelementptr inbounds i8, i8* %1545, i64 %1550
  %1552 = load i8, i8* %1551, align 1
  store i8 %1552, i8* %26, align 1
  %1553 = load i8, i8* %26, align 1
  %1554 = zext i8 %1553 to i32
  %1555 = mul nsw i32 4, %1554
  %1556 = load i32, i32* %23, align 4
  %1557 = add nsw i32 %1556, %1555
  store i32 %1557, i32* %23, align 4
  %1558 = load i8, i8* %26, align 1
  %1559 = zext i8 %1558 to i32
  %1560 = mul nsw i32 4, %1559
  %1561 = load i32, i32* %24, align 4
  %1562 = add nsw i32 %1561, %1560
  store i32 %1562, i32* %24, align 4
  %1563 = load i8, i8* %26, align 1
  %1564 = zext i8 %1563 to i32
  %1565 = mul nsw i32 4, %1564
  %1566 = load i32, i32* %25, align 4
  %1567 = sub nsw i32 %1566, %1565
  store i32 %1567, i32* %25, align 4
  %1568 = load i32, i32* %13, align 4
  %1569 = sub nsw i32 %1568, 5
  %1570 = load i8*, i8** %27, align 8
  %1571 = sext i32 %1569 to i64
  %1572 = getelementptr inbounds i8, i8* %1570, i64 %1571
  store i8* %1572, i8** %27, align 8
  %1573 = load i8*, i8** %28, align 8
  %1574 = load i8*, i8** %27, align 8
  %1575 = getelementptr inbounds i8, i8* %1574, i32 1
  store i8* %1575, i8** %27, align 8
  %1576 = load i8, i8* %1574, align 1
  %1577 = zext i8 %1576 to i32
  %1578 = sext i32 %1577 to i64
  %1579 = sub i64 0, %1578
  %1580 = getelementptr inbounds i8, i8* %1573, i64 %1579
  %1581 = load i8, i8* %1580, align 1
  store i8 %1581, i8* %26, align 1
  %1582 = load i8, i8* %26, align 1
  %1583 = zext i8 %1582 to i32
  %1584 = mul nsw i32 9, %1583
  %1585 = load i32, i32* %23, align 4
  %1586 = add nsw i32 %1585, %1584
  store i32 %1586, i32* %23, align 4
  %1587 = load i8, i8* %26, align 1
  %1588 = zext i8 %1587 to i32
  %1589 = load i32, i32* %24, align 4
  %1590 = add nsw i32 %1589, %1588
  store i32 %1590, i32* %24, align 4
  %1591 = load i8, i8* %26, align 1
  %1592 = zext i8 %1591 to i32
  %1593 = mul nsw i32 3, %1592
  %1594 = load i32, i32* %25, align 4
  %1595 = add nsw i32 %1594, %1593
  store i32 %1595, i32* %25, align 4
  %1596 = load i8*, i8** %28, align 8
  %1597 = load i8*, i8** %27, align 8
  %1598 = getelementptr inbounds i8, i8* %1597, i32 1
  store i8* %1598, i8** %27, align 8
  %1599 = load i8, i8* %1597, align 1
  %1600 = zext i8 %1599 to i32
  %1601 = sext i32 %1600 to i64
  %1602 = sub i64 0, %1601
  %1603 = getelementptr inbounds i8, i8* %1596, i64 %1602
  %1604 = load i8, i8* %1603, align 1
  store i8 %1604, i8* %26, align 1
  %1605 = load i8, i8* %26, align 1
  %1606 = zext i8 %1605 to i32
  %1607 = mul nsw i32 4, %1606
  %1608 = load i32, i32* %23, align 4
  %1609 = add nsw i32 %1608, %1607
  store i32 %1609, i32* %23, align 4
  %1610 = load i8, i8* %26, align 1
  %1611 = zext i8 %1610 to i32
  %1612 = load i32, i32* %24, align 4
  %1613 = add nsw i32 %1612, %1611
  store i32 %1613, i32* %24, align 4
  %1614 = load i8, i8* %26, align 1
  %1615 = zext i8 %1614 to i32
  %1616 = mul nsw i32 2, %1615
  %1617 = load i32, i32* %25, align 4
  %1618 = add nsw i32 %1617, %1616
  store i32 %1618, i32* %25, align 4
  %1619 = load i8*, i8** %28, align 8
  %1620 = load i8*, i8** %27, align 8
  %1621 = getelementptr inbounds i8, i8* %1620, i32 1
  store i8* %1621, i8** %27, align 8
  %1622 = load i8, i8* %1620, align 1
  %1623 = zext i8 %1622 to i32
  %1624 = sext i32 %1623 to i64
  %1625 = sub i64 0, %1624
  %1626 = getelementptr inbounds i8, i8* %1619, i64 %1625
  %1627 = load i8, i8* %1626, align 1
  store i8 %1627, i8* %26, align 1
  %1628 = load i8, i8* %26, align 1
  %1629 = zext i8 %1628 to i32
  %1630 = load i32, i32* %23, align 4
  %1631 = add nsw i32 %1630, %1629
  store i32 %1631, i32* %23, align 4
  %1632 = load i8, i8* %26, align 1
  %1633 = zext i8 %1632 to i32
  %1634 = load i32, i32* %24, align 4
  %1635 = add nsw i32 %1634, %1633
  store i32 %1635, i32* %24, align 4
  %1636 = load i8, i8* %26, align 1
  %1637 = zext i8 %1636 to i32
  %1638 = load i32, i32* %25, align 4
  %1639 = add nsw i32 %1638, %1637
  store i32 %1639, i32* %25, align 4
  %1640 = load i8*, i8** %28, align 8
  %1641 = load i8*, i8** %27, align 8
  %1642 = getelementptr inbounds i8, i8* %1641, i32 1
  store i8* %1642, i8** %27, align 8
  %1643 = load i8, i8* %1641, align 1
  %1644 = zext i8 %1643 to i32
  %1645 = sext i32 %1644 to i64
  %1646 = sub i64 0, %1645
  %1647 = getelementptr inbounds i8, i8* %1640, i64 %1646
  %1648 = load i8, i8* %1647, align 1
  store i8 %1648, i8* %26, align 1
  %1649 = load i8, i8* %26, align 1
  %1650 = zext i8 %1649 to i32
  %1651 = load i32, i32* %24, align 4
  %1652 = add nsw i32 %1651, %1650
  store i32 %1652, i32* %24, align 4
  %1653 = load i8*, i8** %28, align 8
  %1654 = load i8*, i8** %27, align 8
  %1655 = getelementptr inbounds i8, i8* %1654, i32 1
  store i8* %1655, i8** %27, align 8
  %1656 = load i8, i8* %1654, align 1
  %1657 = zext i8 %1656 to i32
  %1658 = sext i32 %1657 to i64
  %1659 = sub i64 0, %1658
  %1660 = getelementptr inbounds i8, i8* %1653, i64 %1659
  %1661 = load i8, i8* %1660, align 1
  store i8 %1661, i8* %26, align 1
  %1662 = load i8, i8* %26, align 1
  %1663 = zext i8 %1662 to i32
  %1664 = load i32, i32* %23, align 4
  %1665 = add nsw i32 %1664, %1663
  store i32 %1665, i32* %23, align 4
  %1666 = load i8, i8* %26, align 1
  %1667 = zext i8 %1666 to i32
  %1668 = load i32, i32* %24, align 4
  %1669 = add nsw i32 %1668, %1667
  store i32 %1669, i32* %24, align 4
  %1670 = load i8, i8* %26, align 1
  %1671 = zext i8 %1670 to i32
  %1672 = load i32, i32* %25, align 4
  %1673 = sub nsw i32 %1672, %1671
  store i32 %1673, i32* %25, align 4
  %1674 = load i8*, i8** %28, align 8
  %1675 = load i8*, i8** %27, align 8
  %1676 = getelementptr inbounds i8, i8* %1675, i32 1
  store i8* %1676, i8** %27, align 8
  %1677 = load i8, i8* %1675, align 1
  %1678 = zext i8 %1677 to i32
  %1679 = sext i32 %1678 to i64
  %1680 = sub i64 0, %1679
  %1681 = getelementptr inbounds i8, i8* %1674, i64 %1680
  %1682 = load i8, i8* %1681, align 1
  store i8 %1682, i8* %26, align 1
  %1683 = load i8, i8* %26, align 1
  %1684 = zext i8 %1683 to i32
  %1685 = mul nsw i32 4, %1684
  %1686 = load i32, i32* %23, align 4
  %1687 = add nsw i32 %1686, %1685
  store i32 %1687, i32* %23, align 4
  %1688 = load i8, i8* %26, align 1
  %1689 = zext i8 %1688 to i32
  %1690 = load i32, i32* %24, align 4
  %1691 = add nsw i32 %1690, %1689
  store i32 %1691, i32* %24, align 4
  %1692 = load i8, i8* %26, align 1
  %1693 = zext i8 %1692 to i32
  %1694 = mul nsw i32 2, %1693
  %1695 = load i32, i32* %25, align 4
  %1696 = sub nsw i32 %1695, %1694
  store i32 %1696, i32* %25, align 4
  %1697 = load i8*, i8** %28, align 8
  %1698 = load i8*, i8** %27, align 8
  %1699 = load i8, i8* %1698, align 1
  %1700 = zext i8 %1699 to i32
  %1701 = sext i32 %1700 to i64
  %1702 = sub i64 0, %1701
  %1703 = getelementptr inbounds i8, i8* %1697, i64 %1702
  %1704 = load i8, i8* %1703, align 1
  store i8 %1704, i8* %26, align 1
  %1705 = load i8, i8* %26, align 1
  %1706 = zext i8 %1705 to i32
  %1707 = mul nsw i32 9, %1706
  %1708 = load i32, i32* %23, align 4
  %1709 = add nsw i32 %1708, %1707
  store i32 %1709, i32* %23, align 4
  %1710 = load i8, i8* %26, align 1
  %1711 = zext i8 %1710 to i32
  %1712 = load i32, i32* %24, align 4
  %1713 = add nsw i32 %1712, %1711
  store i32 %1713, i32* %24, align 4
  %1714 = load i8, i8* %26, align 1
  %1715 = zext i8 %1714 to i32
  %1716 = mul nsw i32 3, %1715
  %1717 = load i32, i32* %25, align 4
  %1718 = sub nsw i32 %1717, %1716
  store i32 %1718, i32* %25, align 4
  %1719 = load i32, i32* %13, align 4
  %1720 = sub nsw i32 %1719, 6
  %1721 = load i8*, i8** %27, align 8
  %1722 = sext i32 %1720 to i64
  %1723 = getelementptr inbounds i8, i8* %1721, i64 %1722
  store i8* %1723, i8** %27, align 8
  %1724 = load i8*, i8** %28, align 8
  %1725 = load i8*, i8** %27, align 8
  %1726 = getelementptr inbounds i8, i8* %1725, i32 1
  store i8* %1726, i8** %27, align 8
  %1727 = load i8, i8* %1725, align 1
  %1728 = zext i8 %1727 to i32
  %1729 = sext i32 %1728 to i64
  %1730 = sub i64 0, %1729
  %1731 = getelementptr inbounds i8, i8* %1724, i64 %1730
  %1732 = load i8, i8* %1731, align 1
  store i8 %1732, i8* %26, align 1
  %1733 = load i8, i8* %26, align 1
  %1734 = zext i8 %1733 to i32
  %1735 = mul nsw i32 9, %1734
  %1736 = load i32, i32* %23, align 4
  %1737 = add nsw i32 %1736, %1735
  store i32 %1737, i32* %23, align 4
  %1738 = load i8*, i8** %28, align 8
  %1739 = load i8*, i8** %27, align 8
  %1740 = getelementptr inbounds i8, i8* %1739, i32 1
  store i8* %1740, i8** %27, align 8
  %1741 = load i8, i8* %1739, align 1
  %1742 = zext i8 %1741 to i32
  %1743 = sext i32 %1742 to i64
  %1744 = sub i64 0, %1743
  %1745 = getelementptr inbounds i8, i8* %1738, i64 %1744
  %1746 = load i8, i8* %1745, align 1
  store i8 %1746, i8* %26, align 1
  %1747 = load i8, i8* %26, align 1
  %1748 = zext i8 %1747 to i32
  %1749 = mul nsw i32 4, %1748
  %1750 = load i32, i32* %23, align 4
  %1751 = add nsw i32 %1750, %1749
  store i32 %1751, i32* %23, align 4
  %1752 = load i8*, i8** %28, align 8
  %1753 = load i8*, i8** %27, align 8
  %1754 = load i8, i8* %1753, align 1
  %1755 = zext i8 %1754 to i32
  %1756 = sext i32 %1755 to i64
  %1757 = sub i64 0, %1756
  %1758 = getelementptr inbounds i8, i8* %1752, i64 %1757
  %1759 = load i8, i8* %1758, align 1
  store i8 %1759, i8* %26, align 1
  %1760 = load i8, i8* %26, align 1
  %1761 = zext i8 %1760 to i32
  %1762 = load i32, i32* %23, align 4
  %1763 = add nsw i32 %1762, %1761
  store i32 %1763, i32* %23, align 4
  %1764 = load i8*, i8** %27, align 8
  %1765 = getelementptr inbounds i8, i8* %1764, i64 2
  store i8* %1765, i8** %27, align 8
  %1766 = load i8*, i8** %28, align 8
  %1767 = load i8*, i8** %27, align 8
  %1768 = getelementptr inbounds i8, i8* %1767, i32 1
  store i8* %1768, i8** %27, align 8
  %1769 = load i8, i8* %1767, align 1
  %1770 = zext i8 %1769 to i32
  %1771 = sext i32 %1770 to i64
  %1772 = sub i64 0, %1771
  %1773 = getelementptr inbounds i8, i8* %1766, i64 %1772
  %1774 = load i8, i8* %1773, align 1
  store i8 %1774, i8* %26, align 1
  %1775 = load i8, i8* %26, align 1
  %1776 = zext i8 %1775 to i32
  %1777 = load i32, i32* %23, align 4
  %1778 = add nsw i32 %1777, %1776
  store i32 %1778, i32* %23, align 4
  %1779 = load i8*, i8** %28, align 8
  %1780 = load i8*, i8** %27, align 8
  %1781 = getelementptr inbounds i8, i8* %1780, i32 1
  store i8* %1781, i8** %27, align 8
  %1782 = load i8, i8* %1780, align 1
  %1783 = zext i8 %1782 to i32
  %1784 = sext i32 %1783 to i64
  %1785 = sub i64 0, %1784
  %1786 = getelementptr inbounds i8, i8* %1779, i64 %1785
  %1787 = load i8, i8* %1786, align 1
  store i8 %1787, i8* %26, align 1
  %1788 = load i8, i8* %26, align 1
  %1789 = zext i8 %1788 to i32
  %1790 = mul nsw i32 4, %1789
  %1791 = load i32, i32* %23, align 4
  %1792 = add nsw i32 %1791, %1790
  store i32 %1792, i32* %23, align 4
  %1793 = load i8*, i8** %28, align 8
  %1794 = load i8*, i8** %27, align 8
  %1795 = load i8, i8* %1794, align 1
  %1796 = zext i8 %1795 to i32
  %1797 = sext i32 %1796 to i64
  %1798 = sub i64 0, %1797
  %1799 = getelementptr inbounds i8, i8* %1793, i64 %1798
  %1800 = load i8, i8* %1799, align 1
  store i8 %1800, i8* %26, align 1
  %1801 = load i8, i8* %26, align 1
  %1802 = zext i8 %1801 to i32
  %1803 = mul nsw i32 9, %1802
  %1804 = load i32, i32* %23, align 4
  %1805 = add nsw i32 %1804, %1803
  store i32 %1805, i32* %23, align 4
  %1806 = load i32, i32* %13, align 4
  %1807 = sub nsw i32 %1806, 6
  %1808 = load i8*, i8** %27, align 8
  %1809 = sext i32 %1807 to i64
  %1810 = getelementptr inbounds i8, i8* %1808, i64 %1809
  store i8* %1810, i8** %27, align 8
  %1811 = load i8*, i8** %28, align 8
  %1812 = load i8*, i8** %27, align 8
  %1813 = getelementptr inbounds i8, i8* %1812, i32 1
  store i8* %1813, i8** %27, align 8
  %1814 = load i8, i8* %1812, align 1
  %1815 = zext i8 %1814 to i32
  %1816 = sext i32 %1815 to i64
  %1817 = sub i64 0, %1816
  %1818 = getelementptr inbounds i8, i8* %1811, i64 %1817
  %1819 = load i8, i8* %1818, align 1
  store i8 %1819, i8* %26, align 1
  %1820 = load i8, i8* %26, align 1
  %1821 = zext i8 %1820 to i32
  %1822 = mul nsw i32 9, %1821
  %1823 = load i32, i32* %23, align 4
  %1824 = add nsw i32 %1823, %1822
  store i32 %1824, i32* %23, align 4
  %1825 = load i8, i8* %26, align 1
  %1826 = zext i8 %1825 to i32
  %1827 = load i32, i32* %24, align 4
  %1828 = add nsw i32 %1827, %1826
  store i32 %1828, i32* %24, align 4
  %1829 = load i8, i8* %26, align 1
  %1830 = zext i8 %1829 to i32
  %1831 = mul nsw i32 3, %1830
  %1832 = load i32, i32* %25, align 4
  %1833 = sub nsw i32 %1832, %1831
  store i32 %1833, i32* %25, align 4
  %1834 = load i8*, i8** %28, align 8
  %1835 = load i8*, i8** %27, align 8
  %1836 = getelementptr inbounds i8, i8* %1835, i32 1
  store i8* %1836, i8** %27, align 8
  %1837 = load i8, i8* %1835, align 1
  %1838 = zext i8 %1837 to i32
  %1839 = sext i32 %1838 to i64
  %1840 = sub i64 0, %1839
  %1841 = getelementptr inbounds i8, i8* %1834, i64 %1840
  %1842 = load i8, i8* %1841, align 1
  store i8 %1842, i8* %26, align 1
  %1843 = load i8, i8* %26, align 1
  %1844 = zext i8 %1843 to i32
  %1845 = mul nsw i32 4, %1844
  %1846 = load i32, i32* %23, align 4
  %1847 = add nsw i32 %1846, %1845
  store i32 %1847, i32* %23, align 4
  %1848 = load i8, i8* %26, align 1
  %1849 = zext i8 %1848 to i32
  %1850 = load i32, i32* %24, align 4
  %1851 = add nsw i32 %1850, %1849
  store i32 %1851, i32* %24, align 4
  %1852 = load i8, i8* %26, align 1
  %1853 = zext i8 %1852 to i32
  %1854 = mul nsw i32 2, %1853
  %1855 = load i32, i32* %25, align 4
  %1856 = sub nsw i32 %1855, %1854
  store i32 %1856, i32* %25, align 4
  %1857 = load i8*, i8** %28, align 8
  %1858 = load i8*, i8** %27, align 8
  %1859 = getelementptr inbounds i8, i8* %1858, i32 1
  store i8* %1859, i8** %27, align 8
  %1860 = load i8, i8* %1858, align 1
  %1861 = zext i8 %1860 to i32
  %1862 = sext i32 %1861 to i64
  %1863 = sub i64 0, %1862
  %1864 = getelementptr inbounds i8, i8* %1857, i64 %1863
  %1865 = load i8, i8* %1864, align 1
  store i8 %1865, i8* %26, align 1
  %1866 = load i8, i8* %26, align 1
  %1867 = zext i8 %1866 to i32
  %1868 = load i32, i32* %23, align 4
  %1869 = add nsw i32 %1868, %1867
  store i32 %1869, i32* %23, align 4
  %1870 = load i8, i8* %26, align 1
  %1871 = zext i8 %1870 to i32
  %1872 = load i32, i32* %24, align 4
  %1873 = add nsw i32 %1872, %1871
  store i32 %1873, i32* %24, align 4
  %1874 = load i8, i8* %26, align 1
  %1875 = zext i8 %1874 to i32
  %1876 = load i32, i32* %25, align 4
  %1877 = sub nsw i32 %1876, %1875
  store i32 %1877, i32* %25, align 4
  %1878 = load i8*, i8** %28, align 8
  %1879 = load i8*, i8** %27, align 8
  %1880 = getelementptr inbounds i8, i8* %1879, i32 1
  store i8* %1880, i8** %27, align 8
  %1881 = load i8, i8* %1879, align 1
  %1882 = zext i8 %1881 to i32
  %1883 = sext i32 %1882 to i64
  %1884 = sub i64 0, %1883
  %1885 = getelementptr inbounds i8, i8* %1878, i64 %1884
  %1886 = load i8, i8* %1885, align 1
  store i8 %1886, i8* %26, align 1
  %1887 = load i8, i8* %26, align 1
  %1888 = zext i8 %1887 to i32
  %1889 = load i32, i32* %24, align 4
  %1890 = add nsw i32 %1889, %1888
  store i32 %1890, i32* %24, align 4
  %1891 = load i8*, i8** %28, align 8
  %1892 = load i8*, i8** %27, align 8
  %1893 = getelementptr inbounds i8, i8* %1892, i32 1
  store i8* %1893, i8** %27, align 8
  %1894 = load i8, i8* %1892, align 1
  %1895 = zext i8 %1894 to i32
  %1896 = sext i32 %1895 to i64
  %1897 = sub i64 0, %1896
  %1898 = getelementptr inbounds i8, i8* %1891, i64 %1897
  %1899 = load i8, i8* %1898, align 1
  store i8 %1899, i8* %26, align 1
  %1900 = load i8, i8* %26, align 1
  %1901 = zext i8 %1900 to i32
  %1902 = load i32, i32* %23, align 4
  %1903 = add nsw i32 %1902, %1901
  store i32 %1903, i32* %23, align 4
  %1904 = load i8, i8* %26, align 1
  %1905 = zext i8 %1904 to i32
  %1906 = load i32, i32* %24, align 4
  %1907 = add nsw i32 %1906, %1905
  store i32 %1907, i32* %24, align 4
  %1908 = load i8, i8* %26, align 1
  %1909 = zext i8 %1908 to i32
  %1910 = load i32, i32* %25, align 4
  %1911 = add nsw i32 %1910, %1909
  store i32 %1911, i32* %25, align 4
  %1912 = load i8*, i8** %28, align 8
  %1913 = load i8*, i8** %27, align 8
  %1914 = getelementptr inbounds i8, i8* %1913, i32 1
  store i8* %1914, i8** %27, align 8
  %1915 = load i8, i8* %1913, align 1
  %1916 = zext i8 %1915 to i32
  %1917 = sext i32 %1916 to i64
  %1918 = sub i64 0, %1917
  %1919 = getelementptr inbounds i8, i8* %1912, i64 %1918
  %1920 = load i8, i8* %1919, align 1
  store i8 %1920, i8* %26, align 1
  %1921 = load i8, i8* %26, align 1
  %1922 = zext i8 %1921 to i32
  %1923 = mul nsw i32 4, %1922
  %1924 = load i32, i32* %23, align 4
  %1925 = add nsw i32 %1924, %1923
  store i32 %1925, i32* %23, align 4
  %1926 = load i8, i8* %26, align 1
  %1927 = zext i8 %1926 to i32
  %1928 = load i32, i32* %24, align 4
  %1929 = add nsw i32 %1928, %1927
  store i32 %1929, i32* %24, align 4
  %1930 = load i8, i8* %26, align 1
  %1931 = zext i8 %1930 to i32
  %1932 = mul nsw i32 2, %1931
  %1933 = load i32, i32* %25, align 4
  %1934 = add nsw i32 %1933, %1932
  store i32 %1934, i32* %25, align 4
  %1935 = load i8*, i8** %28, align 8
  %1936 = load i8*, i8** %27, align 8
  %1937 = load i8, i8* %1936, align 1
  %1938 = zext i8 %1937 to i32
  %1939 = sext i32 %1938 to i64
  %1940 = sub i64 0, %1939
  %1941 = getelementptr inbounds i8, i8* %1935, i64 %1940
  %1942 = load i8, i8* %1941, align 1
  store i8 %1942, i8* %26, align 1
  %1943 = load i8, i8* %26, align 1
  %1944 = zext i8 %1943 to i32
  %1945 = mul nsw i32 9, %1944
  %1946 = load i32, i32* %23, align 4
  %1947 = add nsw i32 %1946, %1945
  store i32 %1947, i32* %23, align 4
  %1948 = load i8, i8* %26, align 1
  %1949 = zext i8 %1948 to i32
  %1950 = load i32, i32* %24, align 4
  %1951 = add nsw i32 %1950, %1949
  store i32 %1951, i32* %24, align 4
  %1952 = load i8, i8* %26, align 1
  %1953 = zext i8 %1952 to i32
  %1954 = mul nsw i32 3, %1953
  %1955 = load i32, i32* %25, align 4
  %1956 = add nsw i32 %1955, %1954
  store i32 %1956, i32* %25, align 4
  %1957 = load i32, i32* %13, align 4
  %1958 = sub nsw i32 %1957, 5
  %1959 = load i8*, i8** %27, align 8
  %1960 = sext i32 %1958 to i64
  %1961 = getelementptr inbounds i8, i8* %1959, i64 %1960
  store i8* %1961, i8** %27, align 8
  %1962 = load i8*, i8** %28, align 8
  %1963 = load i8*, i8** %27, align 8
  %1964 = getelementptr inbounds i8, i8* %1963, i32 1
  store i8* %1964, i8** %27, align 8
  %1965 = load i8, i8* %1963, align 1
  %1966 = zext i8 %1965 to i32
  %1967 = sext i32 %1966 to i64
  %1968 = sub i64 0, %1967
  %1969 = getelementptr inbounds i8, i8* %1962, i64 %1968
  %1970 = load i8, i8* %1969, align 1
  store i8 %1970, i8* %26, align 1
  %1971 = load i8, i8* %26, align 1
  %1972 = zext i8 %1971 to i32
  %1973 = mul nsw i32 4, %1972
  %1974 = load i32, i32* %23, align 4
  %1975 = add nsw i32 %1974, %1973
  store i32 %1975, i32* %23, align 4
  %1976 = load i8, i8* %26, align 1
  %1977 = zext i8 %1976 to i32
  %1978 = mul nsw i32 4, %1977
  %1979 = load i32, i32* %24, align 4
  %1980 = add nsw i32 %1979, %1978
  store i32 %1980, i32* %24, align 4
  %1981 = load i8, i8* %26, align 1
  %1982 = zext i8 %1981 to i32
  %1983 = mul nsw i32 4, %1982
  %1984 = load i32, i32* %25, align 4
  %1985 = sub nsw i32 %1984, %1983
  store i32 %1985, i32* %25, align 4
  %1986 = load i8*, i8** %28, align 8
  %1987 = load i8*, i8** %27, align 8
  %1988 = getelementptr inbounds i8, i8* %1987, i32 1
  store i8* %1988, i8** %27, align 8
  %1989 = load i8, i8* %1987, align 1
  %1990 = zext i8 %1989 to i32
  %1991 = sext i32 %1990 to i64
  %1992 = sub i64 0, %1991
  %1993 = getelementptr inbounds i8, i8* %1986, i64 %1992
  %1994 = load i8, i8* %1993, align 1
  store i8 %1994, i8* %26, align 1
  %1995 = load i8, i8* %26, align 1
  %1996 = zext i8 %1995 to i32
  %1997 = load i32, i32* %23, align 4
  %1998 = add nsw i32 %1997, %1996
  store i32 %1998, i32* %23, align 4
  %1999 = load i8, i8* %26, align 1
  %2000 = zext i8 %1999 to i32
  %2001 = mul nsw i32 4, %2000
  %2002 = load i32, i32* %24, align 4
  %2003 = add nsw i32 %2002, %2001
  store i32 %2003, i32* %24, align 4
  %2004 = load i8, i8* %26, align 1
  %2005 = zext i8 %2004 to i32
  %2006 = mul nsw i32 2, %2005
  %2007 = load i32, i32* %25, align 4
  %2008 = sub nsw i32 %2007, %2006
  store i32 %2008, i32* %25, align 4
  %2009 = load i8*, i8** %28, align 8
  %2010 = load i8*, i8** %27, align 8
  %2011 = getelementptr inbounds i8, i8* %2010, i32 1
  store i8* %2011, i8** %27, align 8
  %2012 = load i8, i8* %2010, align 1
  %2013 = zext i8 %2012 to i32
  %2014 = sext i32 %2013 to i64
  %2015 = sub i64 0, %2014
  %2016 = getelementptr inbounds i8, i8* %2009, i64 %2015
  %2017 = load i8, i8* %2016, align 1
  store i8 %2017, i8* %26, align 1
  %2018 = load i8, i8* %26, align 1
  %2019 = zext i8 %2018 to i32
  %2020 = mul nsw i32 4, %2019
  %2021 = load i32, i32* %24, align 4
  %2022 = add nsw i32 %2021, %2020
  store i32 %2022, i32* %24, align 4
  %2023 = load i8*, i8** %28, align 8
  %2024 = load i8*, i8** %27, align 8
  %2025 = getelementptr inbounds i8, i8* %2024, i32 1
  store i8* %2025, i8** %27, align 8
  %2026 = load i8, i8* %2024, align 1
  %2027 = zext i8 %2026 to i32
  %2028 = sext i32 %2027 to i64
  %2029 = sub i64 0, %2028
  %2030 = getelementptr inbounds i8, i8* %2023, i64 %2029
  %2031 = load i8, i8* %2030, align 1
  store i8 %2031, i8* %26, align 1
  %2032 = load i8, i8* %26, align 1
  %2033 = zext i8 %2032 to i32
  %2034 = load i32, i32* %23, align 4
  %2035 = add nsw i32 %2034, %2033
  store i32 %2035, i32* %23, align 4
  %2036 = load i8, i8* %26, align 1
  %2037 = zext i8 %2036 to i32
  %2038 = mul nsw i32 4, %2037
  %2039 = load i32, i32* %24, align 4
  %2040 = add nsw i32 %2039, %2038
  store i32 %2040, i32* %24, align 4
  %2041 = load i8, i8* %26, align 1
  %2042 = zext i8 %2041 to i32
  %2043 = mul nsw i32 2, %2042
  %2044 = load i32, i32* %25, align 4
  %2045 = add nsw i32 %2044, %2043
  store i32 %2045, i32* %25, align 4
  %2046 = load i8*, i8** %28, align 8
  %2047 = load i8*, i8** %27, align 8
  %2048 = load i8, i8* %2047, align 1
  %2049 = zext i8 %2048 to i32
  %2050 = sext i32 %2049 to i64
  %2051 = sub i64 0, %2050
  %2052 = getelementptr inbounds i8, i8* %2046, i64 %2051
  %2053 = load i8, i8* %2052, align 1
  store i8 %2053, i8* %26, align 1
  %2054 = load i8, i8* %26, align 1
  %2055 = zext i8 %2054 to i32
  %2056 = mul nsw i32 4, %2055
  %2057 = load i32, i32* %23, align 4
  %2058 = add nsw i32 %2057, %2056
  store i32 %2058, i32* %23, align 4
  %2059 = load i8, i8* %26, align 1
  %2060 = zext i8 %2059 to i32
  %2061 = mul nsw i32 4, %2060
  %2062 = load i32, i32* %24, align 4
  %2063 = add nsw i32 %2062, %2061
  store i32 %2063, i32* %24, align 4
  %2064 = load i8, i8* %26, align 1
  %2065 = zext i8 %2064 to i32
  %2066 = mul nsw i32 4, %2065
  %2067 = load i32, i32* %25, align 4
  %2068 = add nsw i32 %2067, %2066
  store i32 %2068, i32* %25, align 4
  %2069 = load i32, i32* %13, align 4
  %2070 = sub nsw i32 %2069, 3
  %2071 = load i8*, i8** %27, align 8
  %2072 = sext i32 %2070 to i64
  %2073 = getelementptr inbounds i8, i8* %2071, i64 %2072
  store i8* %2073, i8** %27, align 8
  %2074 = load i8*, i8** %28, align 8
  %2075 = load i8*, i8** %27, align 8
  %2076 = getelementptr inbounds i8, i8* %2075, i32 1
  store i8* %2076, i8** %27, align 8
  %2077 = load i8, i8* %2075, align 1
  %2078 = zext i8 %2077 to i32
  %2079 = sext i32 %2078 to i64
  %2080 = sub i64 0, %2079
  %2081 = getelementptr inbounds i8, i8* %2074, i64 %2080
  %2082 = load i8, i8* %2081, align 1
  store i8 %2082, i8* %26, align 1
  %2083 = load i8, i8* %26, align 1
  %2084 = zext i8 %2083 to i32
  %2085 = load i32, i32* %23, align 4
  %2086 = add nsw i32 %2085, %2084
  store i32 %2086, i32* %23, align 4
  %2087 = load i8, i8* %26, align 1
  %2088 = zext i8 %2087 to i32
  %2089 = mul nsw i32 9, %2088
  %2090 = load i32, i32* %24, align 4
  %2091 = add nsw i32 %2090, %2089
  store i32 %2091, i32* %24, align 4
  %2092 = load i8, i8* %26, align 1
  %2093 = zext i8 %2092 to i32
  %2094 = mul nsw i32 3, %2093
  %2095 = load i32, i32* %25, align 4
  %2096 = sub nsw i32 %2095, %2094
  store i32 %2096, i32* %25, align 4
  %2097 = load i8*, i8** %28, align 8
  %2098 = load i8*, i8** %27, align 8
  %2099 = getelementptr inbounds i8, i8* %2098, i32 1
  store i8* %2099, i8** %27, align 8
  %2100 = load i8, i8* %2098, align 1
  %2101 = zext i8 %2100 to i32
  %2102 = sext i32 %2101 to i64
  %2103 = sub i64 0, %2102
  %2104 = getelementptr inbounds i8, i8* %2097, i64 %2103
  %2105 = load i8, i8* %2104, align 1
  store i8 %2105, i8* %26, align 1
  %2106 = load i8, i8* %26, align 1
  %2107 = zext i8 %2106 to i32
  %2108 = mul nsw i32 9, %2107
  %2109 = load i32, i32* %24, align 4
  %2110 = add nsw i32 %2109, %2108
  store i32 %2110, i32* %24, align 4
  %2111 = load i8*, i8** %28, align 8
  %2112 = load i8*, i8** %27, align 8
  %2113 = load i8, i8* %2112, align 1
  %2114 = zext i8 %2113 to i32
  %2115 = sext i32 %2114 to i64
  %2116 = sub i64 0, %2115
  %2117 = getelementptr inbounds i8, i8* %2111, i64 %2116
  %2118 = load i8, i8* %2117, align 1
  store i8 %2118, i8* %26, align 1
  %2119 = load i8, i8* %26, align 1
  %2120 = zext i8 %2119 to i32
  %2121 = load i32, i32* %23, align 4
  %2122 = add nsw i32 %2121, %2120
  store i32 %2122, i32* %23, align 4
  %2123 = load i8, i8* %26, align 1
  %2124 = zext i8 %2123 to i32
  %2125 = mul nsw i32 9, %2124
  %2126 = load i32, i32* %24, align 4
  %2127 = add nsw i32 %2126, %2125
  store i32 %2127, i32* %24, align 4
  %2128 = load i8, i8* %26, align 1
  %2129 = zext i8 %2128 to i32
  %2130 = mul nsw i32 3, %2129
  %2131 = load i32, i32* %25, align 4
  %2132 = add nsw i32 %2131, %2130
  store i32 %2132, i32* %25, align 4
  %2133 = load i32, i32* %24, align 4
  %2134 = icmp eq i32 %2133, 0
  br i1 %2134, label %2135, label %2137

; <label>:2135:                                   ; preds = %1385
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 7)
  %2136 = add i64 %pgocount15, 1
  store i64 %2136, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 7)
  store float 1.000000e+06, float* %15, align 4
  br label %2143

; <label>:2137:                                   ; preds = %1385
  %2138 = load i32, i32* %23, align 4
  %2139 = sitofp i32 %2138 to float
  %2140 = load i32, i32* %24, align 4
  %2141 = sitofp i32 %2140 to float
  %2142 = fdiv float %2139, %2141
  store float %2142, float* %15, align 4
  br label %2143

; <label>:2143:                                   ; preds = %2137, %2135
  %2144 = load float, float* %15, align 4
  %2145 = fpext float %2144 to double
  %2146 = fcmp olt double %2145, 5.000000e-01
  br i1 %2146, label %2147, label %2149

; <label>:2147:                                   ; preds = %2143
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 5)
  %2148 = add i64 %pgocount16, 1
  store i64 %2148, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 5)
  store i32 0, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %2164

; <label>:2149:                                   ; preds = %2143
  %2150 = load float, float* %15, align 4
  %2151 = fpext float %2150 to double
  %2152 = fcmp ogt double %2151, 2.000000e+00
  br i1 %2152, label %2153, label %2155

; <label>:2153:                                   ; preds = %2149
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 11)
  %2154 = add i64 %pgocount17, 1
  store i64 %2154, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 11)
  store i32 1, i32* %21, align 4
  store i32 0, i32* %22, align 4
  br label %2163

; <label>:2155:                                   ; preds = %2149
  %2156 = load i32, i32* %25, align 4
  %2157 = icmp sgt i32 %2156, 0
  br i1 %2157, label %2158, label %2160

; <label>:2158:                                   ; preds = %2155
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 14)
  %2159 = add i64 %pgocount18, 1
  store i64 %2159, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 14)
  store i32 -1, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %2162

; <label>:2160:                                   ; preds = %2155
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 20)
  %2161 = add i64 %pgocount19, 1
  store i64 %2161, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 20)
  store i32 1, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %2162

; <label>:2162:                                   ; preds = %2160, %2158
  br label %2163

; <label>:2163:                                   ; preds = %2162, %2153
  br label %2164

; <label>:2164:                                   ; preds = %2163, %2147
  %2165 = load i32, i32* %19, align 4
  %2166 = load i32*, i32** %9, align 8
  %2167 = load i32, i32* %17, align 4
  %2168 = load i32, i32* %21, align 4
  %2169 = add nsw i32 %2167, %2168
  %2170 = load i32, i32* %13, align 4
  %2171 = mul nsw i32 %2169, %2170
  %2172 = load i32, i32* %18, align 4
  %2173 = add nsw i32 %2171, %2172
  %2174 = load i32, i32* %22, align 4
  %2175 = add nsw i32 %2173, %2174
  %2176 = sext i32 %2175 to i64
  %2177 = getelementptr inbounds i32, i32* %2166, i64 %2176
  %2178 = load i32, i32* %2177, align 4
  %2179 = icmp sgt i32 %2165, %2178
  br i1 %2179, label %2180, label %2245

; <label>:2180:                                   ; preds = %2164
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 6)
  %2181 = add i64 %pgocount20, 1
  store i64 %2181, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 6)
  %2182 = load i32, i32* %19, align 4
  %2183 = load i32*, i32** %9, align 8
  %2184 = load i32, i32* %17, align 4
  %2185 = load i32, i32* %21, align 4
  %2186 = sub nsw i32 %2184, %2185
  %2187 = load i32, i32* %13, align 4
  %2188 = mul nsw i32 %2186, %2187
  %2189 = load i32, i32* %18, align 4
  %2190 = add nsw i32 %2188, %2189
  %2191 = load i32, i32* %22, align 4
  %2192 = sub nsw i32 %2190, %2191
  %2193 = sext i32 %2192 to i64
  %2194 = getelementptr inbounds i32, i32* %2183, i64 %2193
  %2195 = load i32, i32* %2194, align 4
  %2196 = icmp sge i32 %2182, %2195
  br i1 %2196, label %2197, label %2245

; <label>:2197:                                   ; preds = %2180
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 12)
  %2198 = add i64 %pgocount21, 1
  store i64 %2198, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 12)
  %2199 = load i32, i32* %19, align 4
  %2200 = load i32*, i32** %9, align 8
  %2201 = load i32, i32* %17, align 4
  %2202 = load i32, i32* %21, align 4
  %2203 = mul nsw i32 2, %2202
  %2204 = add nsw i32 %2201, %2203
  %2205 = load i32, i32* %13, align 4
  %2206 = mul nsw i32 %2204, %2205
  %2207 = load i32, i32* %18, align 4
  %2208 = add nsw i32 %2206, %2207
  %2209 = load i32, i32* %22, align 4
  %2210 = mul nsw i32 2, %2209
  %2211 = add nsw i32 %2208, %2210
  %2212 = sext i32 %2211 to i64
  %2213 = getelementptr inbounds i32, i32* %2200, i64 %2212
  %2214 = load i32, i32* %2213, align 4
  %2215 = icmp sgt i32 %2199, %2214
  br i1 %2215, label %2216, label %2245

; <label>:2216:                                   ; preds = %2197
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 17)
  %2217 = add i64 %pgocount22, 1
  store i64 %2217, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 17)
  %2218 = load i32, i32* %19, align 4
  %2219 = load i32*, i32** %9, align 8
  %2220 = load i32, i32* %17, align 4
  %2221 = load i32, i32* %21, align 4
  %2222 = mul nsw i32 2, %2221
  %2223 = sub nsw i32 %2220, %2222
  %2224 = load i32, i32* %13, align 4
  %2225 = mul nsw i32 %2223, %2224
  %2226 = load i32, i32* %18, align 4
  %2227 = add nsw i32 %2225, %2226
  %2228 = load i32, i32* %22, align 4
  %2229 = mul nsw i32 2, %2228
  %2230 = sub nsw i32 %2227, %2229
  %2231 = sext i32 %2230 to i64
  %2232 = getelementptr inbounds i32, i32* %2219, i64 %2231
  %2233 = load i32, i32* %2232, align 4
  %2234 = icmp sge i32 %2218, %2233
  br i1 %2234, label %2235, label %2245

; <label>:2235:                                   ; preds = %2216
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 23)
  %2236 = add i64 %pgocount23, 1
  store i64 %2236, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 23)
  %2237 = load i8*, i8** %10, align 8
  %2238 = load i32, i32* %17, align 4
  %2239 = load i32, i32* %13, align 4
  %2240 = mul nsw i32 %2238, %2239
  %2241 = load i32, i32* %18, align 4
  %2242 = add nsw i32 %2240, %2241
  %2243 = sext i32 %2242 to i64
  %2244 = getelementptr inbounds i8, i8* %2237, i64 %2243
  store i8 2, i8* %2244, align 1
  br label %2245

; <label>:2245:                                   ; preds = %2235, %2216, %2197, %2180, %2164
  br label %2246

; <label>:2246:                                   ; preds = %2245, %1382
  br label %2247

; <label>:2247:                                   ; preds = %2246, %566
  br label %2248

; <label>:2248:                                   ; preds = %2247
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 1)
  %2249 = add i64 %pgocount24, 1
  store i64 %2249, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 1)
  %2250 = load i32, i32* %18, align 4
  %2251 = add nsw i32 %2250, 1
  store i32 %2251, i32* %18, align 4
  br label %561

; <label>:2252:                                   ; preds = %561
  br label %2253

; <label>:2253:                                   ; preds = %2252
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 19)
  %2254 = add i64 %pgocount25, 1
  store i64 %2254, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 19)
  %2255 = load i32, i32* %17, align 4
  %2256 = add nsw i32 %2255, 1
  store i32 %2256, i32* %17, align 4
  br label %555

; <label>:2257:                                   ; preds = %555
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 26)
  %2258 = add i64 %pgocount26, 1
  store i64 %2258, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_susan_edges, i64 0, i64 26)
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: noinline nounwind uwtable
define void @susan_edges_small(i8*, i32*, i8*, i8*, i32, i32, i32) #0 {
  %8 = alloca i8*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca float, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i8, align 1
  %27 = alloca i8*, align 8
  %28 = alloca i8*, align 8
  store i8* %0, i8** %8, align 8
  store i32* %1, i32** %9, align 8
  store i8* %2, i8** %10, align 8
  store i8* %3, i8** %11, align 8
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  store i32 %6, i32* %14, align 4
  %29 = load i32*, i32** %9, align 8
  %30 = bitcast i32* %29 to i8*
  %31 = load i32, i32* %13, align 4
  %32 = load i32, i32* %14, align 4
  %33 = mul nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = mul i64 %34, 4
  call void @llvm.memset.p0i8.i64(i8* %30, i8 0, i64 %35, i32 4, i1 false)
  store i32 730, i32* %12, align 4
  store i32 1, i32* %17, align 4
  br label %36

; <label>:36:                                     ; preds = %198, %7
  %37 = load i32, i32* %17, align 4
  %38 = load i32, i32* %14, align 4
  %39 = sub nsw i32 %38, 1
  %40 = icmp slt i32 %37, %39
  br i1 %40, label %41, label %202

; <label>:41:                                     ; preds = %36
  store i32 1, i32* %18, align 4
  br label %42

; <label>:42:                                     ; preds = %193, %41
  %43 = load i32, i32* %18, align 4
  %44 = load i32, i32* %13, align 4
  %45 = sub nsw i32 %44, 1
  %46 = icmp slt i32 %43, %45
  br i1 %46, label %47, label %197

; <label>:47:                                     ; preds = %42
  store i32 100, i32* %20, align 4
  %48 = load i8*, i8** %8, align 8
  %49 = load i32, i32* %17, align 4
  %50 = sub nsw i32 %49, 1
  %51 = load i32, i32* %13, align 4
  %52 = mul nsw i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %48, i64 %53
  %55 = load i32, i32* %18, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %54, i64 %56
  %58 = getelementptr inbounds i8, i8* %57, i64 -1
  store i8* %58, i8** %27, align 8
  %59 = load i8*, i8** %11, align 8
  %60 = load i8*, i8** %8, align 8
  %61 = load i32, i32* %17, align 4
  %62 = load i32, i32* %13, align 4
  %63 = mul nsw i32 %61, %62
  %64 = load i32, i32* %18, align 4
  %65 = add nsw i32 %63, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %60, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %59, i64 %70
  store i8* %71, i8** %28, align 8
  %72 = load i8*, i8** %28, align 8
  %73 = load i8*, i8** %27, align 8
  %74 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %74, i8** %27, align 8
  %75 = load i8, i8* %73, align 1
  %76 = zext i8 %75 to i32
  %77 = sext i32 %76 to i64
  %78 = sub i64 0, %77
  %79 = getelementptr inbounds i8, i8* %72, i64 %78
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = load i32, i32* %20, align 4
  %83 = add nsw i32 %82, %81
  store i32 %83, i32* %20, align 4
  %84 = load i8*, i8** %28, align 8
  %85 = load i8*, i8** %27, align 8
  %86 = getelementptr inbounds i8, i8* %85, i32 1
  store i8* %86, i8** %27, align 8
  %87 = load i8, i8* %85, align 1
  %88 = zext i8 %87 to i32
  %89 = sext i32 %88 to i64
  %90 = sub i64 0, %89
  %91 = getelementptr inbounds i8, i8* %84, i64 %90
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = load i32, i32* %20, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, i32* %20, align 4
  %96 = load i8*, i8** %28, align 8
  %97 = load i8*, i8** %27, align 8
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = sext i32 %99 to i64
  %101 = sub i64 0, %100
  %102 = getelementptr inbounds i8, i8* %96, i64 %101
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = load i32, i32* %20, align 4
  %106 = add nsw i32 %105, %104
  store i32 %106, i32* %20, align 4
  %107 = load i32, i32* %13, align 4
  %108 = sub nsw i32 %107, 2
  %109 = load i8*, i8** %27, align 8
  %110 = sext i32 %108 to i64
  %111 = getelementptr inbounds i8, i8* %109, i64 %110
  store i8* %111, i8** %27, align 8
  %112 = load i8*, i8** %28, align 8
  %113 = load i8*, i8** %27, align 8
  %114 = load i8, i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = sext i32 %115 to i64
  %117 = sub i64 0, %116
  %118 = getelementptr inbounds i8, i8* %112, i64 %117
  %119 = load i8, i8* %118, align 1
  %120 = zext i8 %119 to i32
  %121 = load i32, i32* %20, align 4
  %122 = add nsw i32 %121, %120
  store i32 %122, i32* %20, align 4
  %123 = load i8*, i8** %27, align 8
  %124 = getelementptr inbounds i8, i8* %123, i64 2
  store i8* %124, i8** %27, align 8
  %125 = load i8*, i8** %28, align 8
  %126 = load i8*, i8** %27, align 8
  %127 = load i8, i8* %126, align 1
  %128 = zext i8 %127 to i32
  %129 = sext i32 %128 to i64
  %130 = sub i64 0, %129
  %131 = getelementptr inbounds i8, i8* %125, i64 %130
  %132 = load i8, i8* %131, align 1
  %133 = zext i8 %132 to i32
  %134 = load i32, i32* %20, align 4
  %135 = add nsw i32 %134, %133
  store i32 %135, i32* %20, align 4
  %136 = load i32, i32* %13, align 4
  %137 = sub nsw i32 %136, 2
  %138 = load i8*, i8** %27, align 8
  %139 = sext i32 %137 to i64
  %140 = getelementptr inbounds i8, i8* %138, i64 %139
  store i8* %140, i8** %27, align 8
  %141 = load i8*, i8** %28, align 8
  %142 = load i8*, i8** %27, align 8
  %143 = getelementptr inbounds i8, i8* %142, i32 1
  store i8* %143, i8** %27, align 8
  %144 = load i8, i8* %142, align 1
  %145 = zext i8 %144 to i32
  %146 = sext i32 %145 to i64
  %147 = sub i64 0, %146
  %148 = getelementptr inbounds i8, i8* %141, i64 %147
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = load i32, i32* %20, align 4
  %152 = add nsw i32 %151, %150
  store i32 %152, i32* %20, align 4
  %153 = load i8*, i8** %28, align 8
  %154 = load i8*, i8** %27, align 8
  %155 = getelementptr inbounds i8, i8* %154, i32 1
  store i8* %155, i8** %27, align 8
  %156 = load i8, i8* %154, align 1
  %157 = zext i8 %156 to i32
  %158 = sext i32 %157 to i64
  %159 = sub i64 0, %158
  %160 = getelementptr inbounds i8, i8* %153, i64 %159
  %161 = load i8, i8* %160, align 1
  %162 = zext i8 %161 to i32
  %163 = load i32, i32* %20, align 4
  %164 = add nsw i32 %163, %162
  store i32 %164, i32* %20, align 4
  %165 = load i8*, i8** %28, align 8
  %166 = load i8*, i8** %27, align 8
  %167 = load i8, i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = sext i32 %168 to i64
  %170 = sub i64 0, %169
  %171 = getelementptr inbounds i8, i8* %165, i64 %170
  %172 = load i8, i8* %171, align 1
  %173 = zext i8 %172 to i32
  %174 = load i32, i32* %20, align 4
  %175 = add nsw i32 %174, %173
  store i32 %175, i32* %20, align 4
  %176 = load i32, i32* %20, align 4
  %177 = load i32, i32* %12, align 4
  %178 = icmp sle i32 %176, %177
  br i1 %178, label %179, label %192

; <label>:179:                                    ; preds = %47
  %pgocount = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 2)
  %180 = add i64 %pgocount, 1
  store i64 %180, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 2)
  %181 = load i32, i32* %12, align 4
  %182 = load i32, i32* %20, align 4
  %183 = sub nsw i32 %181, %182
  %184 = load i32*, i32** %9, align 8
  %185 = load i32, i32* %17, align 4
  %186 = load i32, i32* %13, align 4
  %187 = mul nsw i32 %185, %186
  %188 = load i32, i32* %18, align 4
  %189 = add nsw i32 %187, %188
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i32, i32* %184, i64 %190
  store i32 %183, i32* %191, align 4
  br label %192

; <label>:192:                                    ; preds = %179, %47
  br label %193

; <label>:193:                                    ; preds = %192
  %pgocount1 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 0)
  %194 = add i64 %pgocount1, 1
  store i64 %194, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 0)
  %195 = load i32, i32* %18, align 4
  %196 = add nsw i32 %195, 1
  store i32 %196, i32* %18, align 4
  br label %42

; <label>:197:                                    ; preds = %42
  br label %198

; <label>:198:                                    ; preds = %197
  %pgocount2 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 17)
  %199 = add i64 %pgocount2, 1
  store i64 %199, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 17)
  %200 = load i32, i32* %17, align 4
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* %17, align 4
  br label %36

; <label>:202:                                    ; preds = %36
  store i32 2, i32* %17, align 4
  br label %203

; <label>:203:                                    ; preds = %741, %202
  %204 = load i32, i32* %17, align 4
  %205 = load i32, i32* %14, align 4
  %206 = sub nsw i32 %205, 2
  %207 = icmp slt i32 %204, %206
  br i1 %207, label %208, label %745

; <label>:208:                                    ; preds = %203
  store i32 2, i32* %18, align 4
  br label %209

; <label>:209:                                    ; preds = %736, %208
  %210 = load i32, i32* %18, align 4
  %211 = load i32, i32* %13, align 4
  %212 = sub nsw i32 %211, 2
  %213 = icmp slt i32 %210, %212
  br i1 %213, label %214, label %740

; <label>:214:                                    ; preds = %209
  %215 = load i32*, i32** %9, align 8
  %216 = load i32, i32* %17, align 4
  %217 = load i32, i32* %13, align 4
  %218 = mul nsw i32 %216, %217
  %219 = load i32, i32* %18, align 4
  %220 = add nsw i32 %218, %219
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds i32, i32* %215, i64 %221
  %223 = load i32, i32* %222, align 4
  %224 = icmp sgt i32 %223, 0
  br i1 %224, label %225, label %735

; <label>:225:                                    ; preds = %214
  %226 = load i32*, i32** %9, align 8
  %227 = load i32, i32* %17, align 4
  %228 = load i32, i32* %13, align 4
  %229 = mul nsw i32 %227, %228
  %230 = load i32, i32* %18, align 4
  %231 = add nsw i32 %229, %230
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i32, i32* %226, i64 %232
  %234 = load i32, i32* %233, align 4
  store i32 %234, i32* %19, align 4
  %235 = load i32, i32* %12, align 4
  %236 = load i32, i32* %19, align 4
  %237 = sub nsw i32 %235, %236
  store i32 %237, i32* %20, align 4
  %238 = load i8*, i8** %11, align 8
  %239 = load i8*, i8** %8, align 8
  %240 = load i32, i32* %17, align 4
  %241 = load i32, i32* %13, align 4
  %242 = mul nsw i32 %240, %241
  %243 = load i32, i32* %18, align 4
  %244 = add nsw i32 %242, %243
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i8, i8* %239, i64 %245
  %247 = load i8, i8* %246, align 1
  %248 = zext i8 %247 to i32
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds i8, i8* %238, i64 %249
  store i8* %250, i8** %28, align 8
  %251 = load i32, i32* %20, align 4
  %252 = icmp sgt i32 %251, 250
  br i1 %252, label %253, label %498

; <label>:253:                                    ; preds = %225
  %254 = load i8*, i8** %8, align 8
  %255 = load i32, i32* %17, align 4
  %256 = sub nsw i32 %255, 1
  %257 = load i32, i32* %13, align 4
  %258 = mul nsw i32 %256, %257
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds i8, i8* %254, i64 %259
  %261 = load i32, i32* %18, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds i8, i8* %260, i64 %262
  %264 = getelementptr inbounds i8, i8* %263, i64 -1
  store i8* %264, i8** %27, align 8
  store i32 0, i32* %23, align 4
  store i32 0, i32* %24, align 4
  %265 = load i8*, i8** %28, align 8
  %266 = load i8*, i8** %27, align 8
  %267 = getelementptr inbounds i8, i8* %266, i32 1
  store i8* %267, i8** %27, align 8
  %268 = load i8, i8* %266, align 1
  %269 = zext i8 %268 to i32
  %270 = sext i32 %269 to i64
  %271 = sub i64 0, %270
  %272 = getelementptr inbounds i8, i8* %265, i64 %271
  %273 = load i8, i8* %272, align 1
  store i8 %273, i8* %26, align 1
  %274 = load i8, i8* %26, align 1
  %275 = zext i8 %274 to i32
  %276 = load i32, i32* %23, align 4
  %277 = sub nsw i32 %276, %275
  store i32 %277, i32* %23, align 4
  %278 = load i8, i8* %26, align 1
  %279 = zext i8 %278 to i32
  %280 = load i32, i32* %24, align 4
  %281 = sub nsw i32 %280, %279
  store i32 %281, i32* %24, align 4
  %282 = load i8*, i8** %28, align 8
  %283 = load i8*, i8** %27, align 8
  %284 = getelementptr inbounds i8, i8* %283, i32 1
  store i8* %284, i8** %27, align 8
  %285 = load i8, i8* %283, align 1
  %286 = zext i8 %285 to i32
  %287 = sext i32 %286 to i64
  %288 = sub i64 0, %287
  %289 = getelementptr inbounds i8, i8* %282, i64 %288
  %290 = load i8, i8* %289, align 1
  store i8 %290, i8* %26, align 1
  %291 = load i8, i8* %26, align 1
  %292 = zext i8 %291 to i32
  %293 = load i32, i32* %24, align 4
  %294 = sub nsw i32 %293, %292
  store i32 %294, i32* %24, align 4
  %295 = load i8*, i8** %28, align 8
  %296 = load i8*, i8** %27, align 8
  %297 = load i8, i8* %296, align 1
  %298 = zext i8 %297 to i32
  %299 = sext i32 %298 to i64
  %300 = sub i64 0, %299
  %301 = getelementptr inbounds i8, i8* %295, i64 %300
  %302 = load i8, i8* %301, align 1
  store i8 %302, i8* %26, align 1
  %303 = load i8, i8* %26, align 1
  %304 = zext i8 %303 to i32
  %305 = load i32, i32* %23, align 4
  %306 = add nsw i32 %305, %304
  store i32 %306, i32* %23, align 4
  %307 = load i8, i8* %26, align 1
  %308 = zext i8 %307 to i32
  %309 = load i32, i32* %24, align 4
  %310 = sub nsw i32 %309, %308
  store i32 %310, i32* %24, align 4
  %311 = load i32, i32* %13, align 4
  %312 = sub nsw i32 %311, 2
  %313 = load i8*, i8** %27, align 8
  %314 = sext i32 %312 to i64
  %315 = getelementptr inbounds i8, i8* %313, i64 %314
  store i8* %315, i8** %27, align 8
  %316 = load i8*, i8** %28, align 8
  %317 = load i8*, i8** %27, align 8
  %318 = load i8, i8* %317, align 1
  %319 = zext i8 %318 to i32
  %320 = sext i32 %319 to i64
  %321 = sub i64 0, %320
  %322 = getelementptr inbounds i8, i8* %316, i64 %321
  %323 = load i8, i8* %322, align 1
  store i8 %323, i8* %26, align 1
  %324 = load i8, i8* %26, align 1
  %325 = zext i8 %324 to i32
  %326 = load i32, i32* %23, align 4
  %327 = sub nsw i32 %326, %325
  store i32 %327, i32* %23, align 4
  %328 = load i8*, i8** %27, align 8
  %329 = getelementptr inbounds i8, i8* %328, i64 2
  store i8* %329, i8** %27, align 8
  %330 = load i8*, i8** %28, align 8
  %331 = load i8*, i8** %27, align 8
  %332 = load i8, i8* %331, align 1
  %333 = zext i8 %332 to i32
  %334 = sext i32 %333 to i64
  %335 = sub i64 0, %334
  %336 = getelementptr inbounds i8, i8* %330, i64 %335
  %337 = load i8, i8* %336, align 1
  store i8 %337, i8* %26, align 1
  %338 = load i8, i8* %26, align 1
  %339 = zext i8 %338 to i32
  %340 = load i32, i32* %23, align 4
  %341 = add nsw i32 %340, %339
  store i32 %341, i32* %23, align 4
  %342 = load i32, i32* %13, align 4
  %343 = sub nsw i32 %342, 2
  %344 = load i8*, i8** %27, align 8
  %345 = sext i32 %343 to i64
  %346 = getelementptr inbounds i8, i8* %344, i64 %345
  store i8* %346, i8** %27, align 8
  %347 = load i8*, i8** %28, align 8
  %348 = load i8*, i8** %27, align 8
  %349 = getelementptr inbounds i8, i8* %348, i32 1
  store i8* %349, i8** %27, align 8
  %350 = load i8, i8* %348, align 1
  %351 = zext i8 %350 to i32
  %352 = sext i32 %351 to i64
  %353 = sub i64 0, %352
  %354 = getelementptr inbounds i8, i8* %347, i64 %353
  %355 = load i8, i8* %354, align 1
  store i8 %355, i8* %26, align 1
  %356 = load i8, i8* %26, align 1
  %357 = zext i8 %356 to i32
  %358 = load i32, i32* %23, align 4
  %359 = sub nsw i32 %358, %357
  store i32 %359, i32* %23, align 4
  %360 = load i8, i8* %26, align 1
  %361 = zext i8 %360 to i32
  %362 = load i32, i32* %24, align 4
  %363 = add nsw i32 %362, %361
  store i32 %363, i32* %24, align 4
  %364 = load i8*, i8** %28, align 8
  %365 = load i8*, i8** %27, align 8
  %366 = getelementptr inbounds i8, i8* %365, i32 1
  store i8* %366, i8** %27, align 8
  %367 = load i8, i8* %365, align 1
  %368 = zext i8 %367 to i32
  %369 = sext i32 %368 to i64
  %370 = sub i64 0, %369
  %371 = getelementptr inbounds i8, i8* %364, i64 %370
  %372 = load i8, i8* %371, align 1
  store i8 %372, i8* %26, align 1
  %373 = load i8, i8* %26, align 1
  %374 = zext i8 %373 to i32
  %375 = load i32, i32* %24, align 4
  %376 = add nsw i32 %375, %374
  store i32 %376, i32* %24, align 4
  %377 = load i8*, i8** %28, align 8
  %378 = load i8*, i8** %27, align 8
  %379 = load i8, i8* %378, align 1
  %380 = zext i8 %379 to i32
  %381 = sext i32 %380 to i64
  %382 = sub i64 0, %381
  %383 = getelementptr inbounds i8, i8* %377, i64 %382
  %384 = load i8, i8* %383, align 1
  store i8 %384, i8* %26, align 1
  %385 = load i8, i8* %26, align 1
  %386 = zext i8 %385 to i32
  %387 = load i32, i32* %23, align 4
  %388 = add nsw i32 %387, %386
  store i32 %388, i32* %23, align 4
  %389 = load i8, i8* %26, align 1
  %390 = zext i8 %389 to i32
  %391 = load i32, i32* %24, align 4
  %392 = add nsw i32 %391, %390
  store i32 %392, i32* %24, align 4
  %393 = load i32, i32* %23, align 4
  %394 = load i32, i32* %23, align 4
  %395 = mul nsw i32 %393, %394
  %396 = load i32, i32* %24, align 4
  %397 = load i32, i32* %24, align 4
  %398 = mul nsw i32 %396, %397
  %399 = add nsw i32 %395, %398
  %400 = sitofp i32 %399 to float
  %401 = fpext float %400 to double
  %402 = call double @sqrt(double %401) #7
  %403 = fptrunc double %402 to float
  store float %403, float* %15, align 4
  %404 = load float, float* %15, align 4
  %405 = fpext float %404 to double
  %406 = load i32, i32* %20, align 4
  %407 = sitofp i32 %406 to float
  %408 = fpext float %407 to double
  %409 = fmul double 4.000000e-01, %408
  %410 = fcmp ogt double %405, %409
  br i1 %410, label %411, label %495

; <label>:411:                                    ; preds = %253
  store i32 0, i32* %16, align 4
  %412 = load i32, i32* %23, align 4
  %413 = icmp eq i32 %412, 0
  br i1 %413, label %414, label %416

; <label>:414:                                    ; preds = %411
  %pgocount3 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 13)
  %415 = add i64 %pgocount3, 1
  store i64 %415, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 13)
  store float 1.000000e+06, float* %15, align 4
  br label %422

; <label>:416:                                    ; preds = %411
  %417 = load i32, i32* %24, align 4
  %418 = sitofp i32 %417 to float
  %419 = load i32, i32* %23, align 4
  %420 = sitofp i32 %419 to float
  %421 = fdiv float %418, %420
  store float %421, float* %15, align 4
  br label %422

; <label>:422:                                    ; preds = %416, %414
  %423 = load float, float* %15, align 4
  %424 = fcmp olt float %423, 0.000000e+00
  br i1 %424, label %425, label %428

; <label>:425:                                    ; preds = %422
  %426 = load float, float* %15, align 4
  %427 = fsub float -0.000000e+00, %426
  store float %427, float* %15, align 4
  store i32 -1, i32* %25, align 4
  br label %430

; <label>:428:                                    ; preds = %422
  %pgocount4 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 8)
  %429 = add i64 %pgocount4, 1
  store i64 %429, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 8)
  store i32 1, i32* %25, align 4
  br label %430

; <label>:430:                                    ; preds = %428, %425
  %431 = load float, float* %15, align 4
  %432 = fpext float %431 to double
  %433 = fcmp olt double %432, 5.000000e-01
  br i1 %433, label %434, label %436

; <label>:434:                                    ; preds = %430
  %pgocount5 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 9)
  %435 = add i64 %pgocount5, 1
  store i64 %435, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 9)
  store i32 0, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %451

; <label>:436:                                    ; preds = %430
  %437 = load float, float* %15, align 4
  %438 = fpext float %437 to double
  %439 = fcmp ogt double %438, 2.000000e+00
  br i1 %439, label %440, label %442

; <label>:440:                                    ; preds = %436
  %pgocount6 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 15)
  %441 = add i64 %pgocount6, 1
  store i64 %441, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 15)
  store i32 1, i32* %21, align 4
  store i32 0, i32* %22, align 4
  br label %450

; <label>:442:                                    ; preds = %436
  %443 = load i32, i32* %25, align 4
  %444 = icmp sgt i32 %443, 0
  br i1 %444, label %445, label %447

; <label>:445:                                    ; preds = %442
  %pgocount7 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 20)
  %446 = add i64 %pgocount7, 1
  store i64 %446, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 20)
  store i32 1, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %449

; <label>:447:                                    ; preds = %442
  %pgocount8 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 21)
  %448 = add i64 %pgocount8, 1
  store i64 %448, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 21)
  store i32 -1, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %449

; <label>:449:                                    ; preds = %447, %445
  br label %450

; <label>:450:                                    ; preds = %449, %440
  br label %451

; <label>:451:                                    ; preds = %450, %434
  %452 = load i32, i32* %19, align 4
  %453 = load i32*, i32** %9, align 8
  %454 = load i32, i32* %17, align 4
  %455 = load i32, i32* %21, align 4
  %456 = add nsw i32 %454, %455
  %457 = load i32, i32* %13, align 4
  %458 = mul nsw i32 %456, %457
  %459 = load i32, i32* %18, align 4
  %460 = add nsw i32 %458, %459
  %461 = load i32, i32* %22, align 4
  %462 = add nsw i32 %460, %461
  %463 = sext i32 %462 to i64
  %464 = getelementptr inbounds i32, i32* %453, i64 %463
  %465 = load i32, i32* %464, align 4
  %466 = icmp sgt i32 %452, %465
  br i1 %466, label %467, label %494

; <label>:467:                                    ; preds = %451
  %pgocount9 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 10)
  %468 = add i64 %pgocount9, 1
  store i64 %468, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 10)
  %469 = load i32, i32* %19, align 4
  %470 = load i32*, i32** %9, align 8
  %471 = load i32, i32* %17, align 4
  %472 = load i32, i32* %21, align 4
  %473 = sub nsw i32 %471, %472
  %474 = load i32, i32* %13, align 4
  %475 = mul nsw i32 %473, %474
  %476 = load i32, i32* %18, align 4
  %477 = add nsw i32 %475, %476
  %478 = load i32, i32* %22, align 4
  %479 = sub nsw i32 %477, %478
  %480 = sext i32 %479 to i64
  %481 = getelementptr inbounds i32, i32* %470, i64 %480
  %482 = load i32, i32* %481, align 4
  %483 = icmp sge i32 %469, %482
  br i1 %483, label %484, label %494

; <label>:484:                                    ; preds = %467
  %pgocount10 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 16)
  %485 = add i64 %pgocount10, 1
  store i64 %485, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 16)
  %486 = load i8*, i8** %10, align 8
  %487 = load i32, i32* %17, align 4
  %488 = load i32, i32* %13, align 4
  %489 = mul nsw i32 %487, %488
  %490 = load i32, i32* %18, align 4
  %491 = add nsw i32 %489, %490
  %492 = sext i32 %491 to i64
  %493 = getelementptr inbounds i8, i8* %486, i64 %492
  store i8 1, i8* %493, align 1
  br label %494

; <label>:494:                                    ; preds = %484, %467, %451
  br label %497

; <label>:495:                                    ; preds = %253
  %pgocount11 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 4)
  %496 = add i64 %pgocount11, 1
  store i64 %496, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 4)
  store i32 1, i32* %16, align 4
  br label %497

; <label>:497:                                    ; preds = %495, %494
  br label %500

; <label>:498:                                    ; preds = %225
  %pgocount12 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 3)
  %499 = add i64 %pgocount12, 1
  store i64 %499, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 3)
  store i32 1, i32* %16, align 4
  br label %500

; <label>:500:                                    ; preds = %498, %497
  %501 = load i32, i32* %16, align 4
  %502 = icmp eq i32 %501, 1
  br i1 %502, label %503, label %734

; <label>:503:                                    ; preds = %500
  %504 = load i8*, i8** %8, align 8
  %505 = load i32, i32* %17, align 4
  %506 = sub nsw i32 %505, 1
  %507 = load i32, i32* %13, align 4
  %508 = mul nsw i32 %506, %507
  %509 = sext i32 %508 to i64
  %510 = getelementptr inbounds i8, i8* %504, i64 %509
  %511 = load i32, i32* %18, align 4
  %512 = sext i32 %511 to i64
  %513 = getelementptr inbounds i8, i8* %510, i64 %512
  %514 = getelementptr inbounds i8, i8* %513, i64 -1
  store i8* %514, i8** %27, align 8
  store i32 0, i32* %23, align 4
  store i32 0, i32* %24, align 4
  store i32 0, i32* %25, align 4
  %515 = load i8*, i8** %28, align 8
  %516 = load i8*, i8** %27, align 8
  %517 = getelementptr inbounds i8, i8* %516, i32 1
  store i8* %517, i8** %27, align 8
  %518 = load i8, i8* %516, align 1
  %519 = zext i8 %518 to i32
  %520 = sext i32 %519 to i64
  %521 = sub i64 0, %520
  %522 = getelementptr inbounds i8, i8* %515, i64 %521
  %523 = load i8, i8* %522, align 1
  store i8 %523, i8* %26, align 1
  %524 = load i8, i8* %26, align 1
  %525 = zext i8 %524 to i32
  %526 = load i32, i32* %23, align 4
  %527 = add nsw i32 %526, %525
  store i32 %527, i32* %23, align 4
  %528 = load i8, i8* %26, align 1
  %529 = zext i8 %528 to i32
  %530 = load i32, i32* %24, align 4
  %531 = add nsw i32 %530, %529
  store i32 %531, i32* %24, align 4
  %532 = load i8, i8* %26, align 1
  %533 = zext i8 %532 to i32
  %534 = load i32, i32* %25, align 4
  %535 = add nsw i32 %534, %533
  store i32 %535, i32* %25, align 4
  %536 = load i8*, i8** %28, align 8
  %537 = load i8*, i8** %27, align 8
  %538 = getelementptr inbounds i8, i8* %537, i32 1
  store i8* %538, i8** %27, align 8
  %539 = load i8, i8* %537, align 1
  %540 = zext i8 %539 to i32
  %541 = sext i32 %540 to i64
  %542 = sub i64 0, %541
  %543 = getelementptr inbounds i8, i8* %536, i64 %542
  %544 = load i8, i8* %543, align 1
  store i8 %544, i8* %26, align 1
  %545 = load i8, i8* %26, align 1
  %546 = zext i8 %545 to i32
  %547 = load i32, i32* %24, align 4
  %548 = add nsw i32 %547, %546
  store i32 %548, i32* %24, align 4
  %549 = load i8*, i8** %28, align 8
  %550 = load i8*, i8** %27, align 8
  %551 = load i8, i8* %550, align 1
  %552 = zext i8 %551 to i32
  %553 = sext i32 %552 to i64
  %554 = sub i64 0, %553
  %555 = getelementptr inbounds i8, i8* %549, i64 %554
  %556 = load i8, i8* %555, align 1
  store i8 %556, i8* %26, align 1
  %557 = load i8, i8* %26, align 1
  %558 = zext i8 %557 to i32
  %559 = load i32, i32* %23, align 4
  %560 = add nsw i32 %559, %558
  store i32 %560, i32* %23, align 4
  %561 = load i8, i8* %26, align 1
  %562 = zext i8 %561 to i32
  %563 = load i32, i32* %24, align 4
  %564 = add nsw i32 %563, %562
  store i32 %564, i32* %24, align 4
  %565 = load i8, i8* %26, align 1
  %566 = zext i8 %565 to i32
  %567 = load i32, i32* %25, align 4
  %568 = sub nsw i32 %567, %566
  store i32 %568, i32* %25, align 4
  %569 = load i32, i32* %13, align 4
  %570 = sub nsw i32 %569, 2
  %571 = load i8*, i8** %27, align 8
  %572 = sext i32 %570 to i64
  %573 = getelementptr inbounds i8, i8* %571, i64 %572
  store i8* %573, i8** %27, align 8
  %574 = load i8*, i8** %28, align 8
  %575 = load i8*, i8** %27, align 8
  %576 = load i8, i8* %575, align 1
  %577 = zext i8 %576 to i32
  %578 = sext i32 %577 to i64
  %579 = sub i64 0, %578
  %580 = getelementptr inbounds i8, i8* %574, i64 %579
  %581 = load i8, i8* %580, align 1
  store i8 %581, i8* %26, align 1
  %582 = load i8, i8* %26, align 1
  %583 = zext i8 %582 to i32
  %584 = load i32, i32* %23, align 4
  %585 = add nsw i32 %584, %583
  store i32 %585, i32* %23, align 4
  %586 = load i8*, i8** %27, align 8
  %587 = getelementptr inbounds i8, i8* %586, i64 2
  store i8* %587, i8** %27, align 8
  %588 = load i8*, i8** %28, align 8
  %589 = load i8*, i8** %27, align 8
  %590 = load i8, i8* %589, align 1
  %591 = zext i8 %590 to i32
  %592 = sext i32 %591 to i64
  %593 = sub i64 0, %592
  %594 = getelementptr inbounds i8, i8* %588, i64 %593
  %595 = load i8, i8* %594, align 1
  store i8 %595, i8* %26, align 1
  %596 = load i8, i8* %26, align 1
  %597 = zext i8 %596 to i32
  %598 = load i32, i32* %23, align 4
  %599 = add nsw i32 %598, %597
  store i32 %599, i32* %23, align 4
  %600 = load i32, i32* %13, align 4
  %601 = sub nsw i32 %600, 2
  %602 = load i8*, i8** %27, align 8
  %603 = sext i32 %601 to i64
  %604 = getelementptr inbounds i8, i8* %602, i64 %603
  store i8* %604, i8** %27, align 8
  %605 = load i8*, i8** %28, align 8
  %606 = load i8*, i8** %27, align 8
  %607 = getelementptr inbounds i8, i8* %606, i32 1
  store i8* %607, i8** %27, align 8
  %608 = load i8, i8* %606, align 1
  %609 = zext i8 %608 to i32
  %610 = sext i32 %609 to i64
  %611 = sub i64 0, %610
  %612 = getelementptr inbounds i8, i8* %605, i64 %611
  %613 = load i8, i8* %612, align 1
  store i8 %613, i8* %26, align 1
  %614 = load i8, i8* %26, align 1
  %615 = zext i8 %614 to i32
  %616 = load i32, i32* %23, align 4
  %617 = add nsw i32 %616, %615
  store i32 %617, i32* %23, align 4
  %618 = load i8, i8* %26, align 1
  %619 = zext i8 %618 to i32
  %620 = load i32, i32* %24, align 4
  %621 = add nsw i32 %620, %619
  store i32 %621, i32* %24, align 4
  %622 = load i8, i8* %26, align 1
  %623 = zext i8 %622 to i32
  %624 = load i32, i32* %25, align 4
  %625 = sub nsw i32 %624, %623
  store i32 %625, i32* %25, align 4
  %626 = load i8*, i8** %28, align 8
  %627 = load i8*, i8** %27, align 8
  %628 = getelementptr inbounds i8, i8* %627, i32 1
  store i8* %628, i8** %27, align 8
  %629 = load i8, i8* %627, align 1
  %630 = zext i8 %629 to i32
  %631 = sext i32 %630 to i64
  %632 = sub i64 0, %631
  %633 = getelementptr inbounds i8, i8* %626, i64 %632
  %634 = load i8, i8* %633, align 1
  store i8 %634, i8* %26, align 1
  %635 = load i8, i8* %26, align 1
  %636 = zext i8 %635 to i32
  %637 = load i32, i32* %24, align 4
  %638 = add nsw i32 %637, %636
  store i32 %638, i32* %24, align 4
  %639 = load i8*, i8** %28, align 8
  %640 = load i8*, i8** %27, align 8
  %641 = load i8, i8* %640, align 1
  %642 = zext i8 %641 to i32
  %643 = sext i32 %642 to i64
  %644 = sub i64 0, %643
  %645 = getelementptr inbounds i8, i8* %639, i64 %644
  %646 = load i8, i8* %645, align 1
  store i8 %646, i8* %26, align 1
  %647 = load i8, i8* %26, align 1
  %648 = zext i8 %647 to i32
  %649 = load i32, i32* %23, align 4
  %650 = add nsw i32 %649, %648
  store i32 %650, i32* %23, align 4
  %651 = load i8, i8* %26, align 1
  %652 = zext i8 %651 to i32
  %653 = load i32, i32* %24, align 4
  %654 = add nsw i32 %653, %652
  store i32 %654, i32* %24, align 4
  %655 = load i8, i8* %26, align 1
  %656 = zext i8 %655 to i32
  %657 = load i32, i32* %25, align 4
  %658 = add nsw i32 %657, %656
  store i32 %658, i32* %25, align 4
  %659 = load i32, i32* %24, align 4
  %660 = icmp eq i32 %659, 0
  br i1 %660, label %661, label %663

; <label>:661:                                    ; preds = %503
  %pgocount13 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 7)
  %662 = add i64 %pgocount13, 1
  store i64 %662, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 7)
  store float 1.000000e+06, float* %15, align 4
  br label %669

; <label>:663:                                    ; preds = %503
  %664 = load i32, i32* %23, align 4
  %665 = sitofp i32 %664 to float
  %666 = load i32, i32* %24, align 4
  %667 = sitofp i32 %666 to float
  %668 = fdiv float %665, %667
  store float %668, float* %15, align 4
  br label %669

; <label>:669:                                    ; preds = %663, %661
  %670 = load float, float* %15, align 4
  %671 = fpext float %670 to double
  %672 = fcmp olt double %671, 5.000000e-01
  br i1 %672, label %673, label %675

; <label>:673:                                    ; preds = %669
  %pgocount14 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 5)
  %674 = add i64 %pgocount14, 1
  store i64 %674, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 5)
  store i32 0, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %690

; <label>:675:                                    ; preds = %669
  %676 = load float, float* %15, align 4
  %677 = fpext float %676 to double
  %678 = fcmp ogt double %677, 2.000000e+00
  br i1 %678, label %679, label %681

; <label>:679:                                    ; preds = %675
  %pgocount15 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 11)
  %680 = add i64 %pgocount15, 1
  store i64 %680, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 11)
  store i32 1, i32* %21, align 4
  store i32 0, i32* %22, align 4
  br label %689

; <label>:681:                                    ; preds = %675
  %682 = load i32, i32* %25, align 4
  %683 = icmp sgt i32 %682, 0
  br i1 %683, label %684, label %686

; <label>:684:                                    ; preds = %681
  %pgocount16 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 14)
  %685 = add i64 %pgocount16, 1
  store i64 %685, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 14)
  store i32 -1, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %688

; <label>:686:                                    ; preds = %681
  %pgocount17 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 19)
  %687 = add i64 %pgocount17, 1
  store i64 %687, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 19)
  store i32 1, i32* %21, align 4
  store i32 1, i32* %22, align 4
  br label %688

; <label>:688:                                    ; preds = %686, %684
  br label %689

; <label>:689:                                    ; preds = %688, %679
  br label %690

; <label>:690:                                    ; preds = %689, %673
  %691 = load i32, i32* %19, align 4
  %692 = load i32*, i32** %9, align 8
  %693 = load i32, i32* %17, align 4
  %694 = load i32, i32* %21, align 4
  %695 = add nsw i32 %693, %694
  %696 = load i32, i32* %13, align 4
  %697 = mul nsw i32 %695, %696
  %698 = load i32, i32* %18, align 4
  %699 = add nsw i32 %697, %698
  %700 = load i32, i32* %22, align 4
  %701 = add nsw i32 %699, %700
  %702 = sext i32 %701 to i64
  %703 = getelementptr inbounds i32, i32* %692, i64 %702
  %704 = load i32, i32* %703, align 4
  %705 = icmp sgt i32 %691, %704
  br i1 %705, label %706, label %733

; <label>:706:                                    ; preds = %690
  %pgocount18 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 6)
  %707 = add i64 %pgocount18, 1
  store i64 %707, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 6)
  %708 = load i32, i32* %19, align 4
  %709 = load i32*, i32** %9, align 8
  %710 = load i32, i32* %17, align 4
  %711 = load i32, i32* %21, align 4
  %712 = sub nsw i32 %710, %711
  %713 = load i32, i32* %13, align 4
  %714 = mul nsw i32 %712, %713
  %715 = load i32, i32* %18, align 4
  %716 = add nsw i32 %714, %715
  %717 = load i32, i32* %22, align 4
  %718 = sub nsw i32 %716, %717
  %719 = sext i32 %718 to i64
  %720 = getelementptr inbounds i32, i32* %709, i64 %719
  %721 = load i32, i32* %720, align 4
  %722 = icmp sge i32 %708, %721
  br i1 %722, label %723, label %733

; <label>:723:                                    ; preds = %706
  %pgocount19 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 12)
  %724 = add i64 %pgocount19, 1
  store i64 %724, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 12)
  %725 = load i8*, i8** %10, align 8
  %726 = load i32, i32* %17, align 4
  %727 = load i32, i32* %13, align 4
  %728 = mul nsw i32 %726, %727
  %729 = load i32, i32* %18, align 4
  %730 = add nsw i32 %728, %729
  %731 = sext i32 %730 to i64
  %732 = getelementptr inbounds i8, i8* %725, i64 %731
  store i8 2, i8* %732, align 1
  br label %733

; <label>:733:                                    ; preds = %723, %706, %690
  br label %734

; <label>:734:                                    ; preds = %733, %500
  br label %735

; <label>:735:                                    ; preds = %734, %214
  br label %736

; <label>:736:                                    ; preds = %735
  %pgocount20 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 1)
  %737 = add i64 %pgocount20, 1
  store i64 %737, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 1)
  %738 = load i32, i32* %18, align 4
  %739 = add nsw i32 %738, 1
  store i32 %739, i32* %18, align 4
  br label %209

; <label>:740:                                    ; preds = %209
  br label %741

; <label>:741:                                    ; preds = %740
  %pgocount21 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 18)
  %742 = add i64 %pgocount21, 1
  store i64 %742, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 18)
  %743 = load i32, i32* %17, align 4
  %744 = add nsw i32 %743, 1
  store i32 %744, i32* %17, align 4
  br label %203

; <label>:745:                                    ; preds = %203
  %pgocount22 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 22)
  %746 = add i64 %pgocount22, 1
  store i64 %746, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_susan_edges_small, i64 0, i64 22)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @corner_draw(i8*, %struct.anon*, i32, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca %struct.anon*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store %struct.anon* %1, %struct.anon** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32 0, i32* %10, align 4
  br label %11

; <label>:11:                                     ; preds = %96, %4
  %12 = load %struct.anon*, %struct.anon** %6, align 8
  %13 = load i32, i32* %10, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.anon, %struct.anon* %12, i64 %14
  %16 = getelementptr inbounds %struct.anon, %struct.anon* %15, i32 0, i32 2
  %17 = load i32, i32* %16, align 4
  %18 = icmp ne i32 %17, 7
  br i1 %18, label %19, label %97

; <label>:19:                                     ; preds = %11
  %20 = load i32, i32* %8, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %72

; <label>:22:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_corner_draw, i64 0, i64 1)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_corner_draw, i64 0, i64 1)
  %24 = load i8*, i8** %5, align 8
  %25 = load %struct.anon*, %struct.anon** %6, align 8
  %26 = load i32, i32* %10, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.anon, %struct.anon* %25, i64 %27
  %29 = getelementptr inbounds %struct.anon, %struct.anon* %28, i32 0, i32 1
  %30 = load i32, i32* %29, align 4
  %31 = sub nsw i32 %30, 1
  %32 = load i32, i32* %7, align 4
  %33 = mul nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8* %24, i64 %34
  %36 = load %struct.anon*, %struct.anon** %6, align 8
  %37 = load i32, i32* %10, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %struct.anon, %struct.anon* %36, i64 %38
  %40 = getelementptr inbounds %struct.anon, %struct.anon* %39, i32 0, i32 0
  %41 = load i32, i32* %40, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %35, i64 %42
  %44 = getelementptr inbounds i8, i8* %43, i64 -1
  store i8* %44, i8** %9, align 8
  %45 = load i8*, i8** %9, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %9, align 8
  store i8 -1, i8* %45, align 1
  %47 = load i8*, i8** %9, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %9, align 8
  store i8 -1, i8* %47, align 1
  %49 = load i8*, i8** %9, align 8
  store i8 -1, i8* %49, align 1
  %50 = load i32, i32* %7, align 4
  %51 = sub nsw i32 %50, 2
  %52 = load i8*, i8** %9, align 8
  %53 = sext i32 %51 to i64
  %54 = getelementptr inbounds i8, i8* %52, i64 %53
  store i8* %54, i8** %9, align 8
  %55 = load i8*, i8** %9, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** %9, align 8
  store i8 -1, i8* %55, align 1
  %57 = load i8*, i8** %9, align 8
  %58 = getelementptr inbounds i8, i8* %57, i32 1
  store i8* %58, i8** %9, align 8
  store i8 0, i8* %57, align 1
  %59 = load i8*, i8** %9, align 8
  store i8 -1, i8* %59, align 1
  %60 = load i32, i32* %7, align 4
  %61 = sub nsw i32 %60, 2
  %62 = load i8*, i8** %9, align 8
  %63 = sext i32 %61 to i64
  %64 = getelementptr inbounds i8, i8* %62, i64 %63
  store i8* %64, i8** %9, align 8
  %65 = load i8*, i8** %9, align 8
  %66 = getelementptr inbounds i8, i8* %65, i32 1
  store i8* %66, i8** %9, align 8
  store i8 -1, i8* %65, align 1
  %67 = load i8*, i8** %9, align 8
  %68 = getelementptr inbounds i8, i8* %67, i32 1
  store i8* %68, i8** %9, align 8
  store i8 -1, i8* %67, align 1
  %69 = load i8*, i8** %9, align 8
  store i8 -1, i8* %69, align 1
  %70 = load i32, i32* %10, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %10, align 4
  br label %96

; <label>:72:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_corner_draw, i64 0, i64 0)
  %73 = add i64 %pgocount1, 1
  store i64 %73, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_corner_draw, i64 0, i64 0)
  %74 = load i8*, i8** %5, align 8
  %75 = load %struct.anon*, %struct.anon** %6, align 8
  %76 = load i32, i32* %10, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds %struct.anon, %struct.anon* %75, i64 %77
  %79 = getelementptr inbounds %struct.anon, %struct.anon* %78, i32 0, i32 1
  %80 = load i32, i32* %79, align 4
  %81 = load i32, i32* %7, align 4
  %82 = mul nsw i32 %80, %81
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8* %74, i64 %83
  %85 = load %struct.anon*, %struct.anon** %6, align 8
  %86 = load i32, i32* %10, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds %struct.anon, %struct.anon* %85, i64 %87
  %89 = getelementptr inbounds %struct.anon, %struct.anon* %88, i32 0, i32 0
  %90 = load i32, i32* %89, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8* %84, i64 %91
  store i8* %92, i8** %9, align 8
  %93 = load i8*, i8** %9, align 8
  store i8 0, i8* %93, align 1
  %94 = load i32, i32* %10, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %10, align 4
  br label %96

; <label>:96:                                     ; preds = %72, %22
  br label %11

; <label>:97:                                     ; preds = %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_corner_draw, i64 0, i64 2)
  %98 = add i64 %pgocount2, 1
  store i64 %98, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_corner_draw, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @susan_corners(i8*, i32*, i8*, i32, %struct.anon*, i32, i32) #0 {
  %8 = alloca i8*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca %struct.anon*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32*, align 8
  %24 = alloca i32*, align 8
  %25 = alloca float, align 4
  %26 = alloca i8, align 1
  %27 = alloca i8*, align 8
  %28 = alloca i8*, align 8
  store i8* %0, i8** %8, align 8
  store i32* %1, i32** %9, align 8
  store i8* %2, i8** %10, align 8
  store i32 %3, i32* %11, align 4
  store %struct.anon* %4, %struct.anon** %12, align 8
  store i32 %5, i32* %13, align 4
  store i32 %6, i32* %14, align 4
  %29 = load i32*, i32** %9, align 8
  %30 = bitcast i32* %29 to i8*
  %31 = load i32, i32* %13, align 4
  %32 = load i32, i32* %14, align 4
  %33 = mul nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = mul i64 %34, 4
  call void @llvm.memset.p0i8.i64(i8* %30, i8 0, i64 %35, i32 4, i1 false)
  %36 = load i32, i32* %13, align 4
  %37 = load i32, i32* %14, align 4
  %38 = mul nsw i32 %36, %37
  %39 = sext i32 %38 to i64
  %40 = mul i64 %39, 4
  %41 = call noalias i8* @malloc(i64 %40) #7
  %42 = bitcast i8* %41 to i32*
  store i32* %42, i32** %23, align 8
  %43 = load i32, i32* %13, align 4
  %44 = load i32, i32* %14, align 4
  %45 = mul nsw i32 %43, %44
  %46 = sext i32 %45 to i64
  %47 = mul i64 %46, 4
  %48 = call noalias i8* @malloc(i64 %47) #7
  %49 = bitcast i8* %48 to i32*
  store i32* %49, i32** %24, align 8
  store i32 5, i32* %21, align 4
  br label %50

; <label>:50:                                     ; preds = %1601, %7
  %51 = load i32, i32* %21, align 4
  %52 = load i32, i32* %14, align 4
  %53 = sub nsw i32 %52, 5
  %54 = icmp slt i32 %51, %53
  br i1 %54, label %55, label %1605

; <label>:55:                                     ; preds = %50
  store i32 5, i32* %22, align 4
  br label %56

; <label>:56:                                     ; preds = %1597, %55
  %57 = load i32, i32* %22, align 4
  %58 = load i32, i32* %13, align 4
  %59 = sub nsw i32 %58, 5
  %60 = icmp slt i32 %57, %59
  br i1 %60, label %61, label %1600

; <label>:61:                                     ; preds = %56
  store i32 100, i32* %15, align 4
  %62 = load i8*, i8** %8, align 8
  %63 = load i32, i32* %21, align 4
  %64 = sub nsw i32 %63, 3
  %65 = load i32, i32* %13, align 4
  %66 = mul nsw i32 %64, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8* %62, i64 %67
  %69 = load i32, i32* %22, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %68, i64 %70
  %72 = getelementptr inbounds i8, i8* %71, i64 -1
  store i8* %72, i8** %27, align 8
  %73 = load i8*, i8** %10, align 8
  %74 = load i8*, i8** %8, align 8
  %75 = load i32, i32* %21, align 4
  %76 = load i32, i32* %13, align 4
  %77 = mul nsw i32 %75, %76
  %78 = load i32, i32* %22, align 4
  %79 = add nsw i32 %77, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8* %74, i64 %80
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8* %73, i64 %84
  store i8* %85, i8** %28, align 8
  %86 = load i8*, i8** %28, align 8
  %87 = load i8*, i8** %27, align 8
  %88 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %88, i8** %27, align 8
  %89 = load i8, i8* %87, align 1
  %90 = zext i8 %89 to i32
  %91 = sext i32 %90 to i64
  %92 = sub i64 0, %91
  %93 = getelementptr inbounds i8, i8* %86, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = load i32, i32* %15, align 4
  %97 = add nsw i32 %96, %95
  store i32 %97, i32* %15, align 4
  %98 = load i8*, i8** %28, align 8
  %99 = load i8*, i8** %27, align 8
  %100 = getelementptr inbounds i8, i8* %99, i32 1
  store i8* %100, i8** %27, align 8
  %101 = load i8, i8* %99, align 1
  %102 = zext i8 %101 to i32
  %103 = sext i32 %102 to i64
  %104 = sub i64 0, %103
  %105 = getelementptr inbounds i8, i8* %98, i64 %104
  %106 = load i8, i8* %105, align 1
  %107 = zext i8 %106 to i32
  %108 = load i32, i32* %15, align 4
  %109 = add nsw i32 %108, %107
  store i32 %109, i32* %15, align 4
  %110 = load i8*, i8** %28, align 8
  %111 = load i8*, i8** %27, align 8
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i32
  %114 = sext i32 %113 to i64
  %115 = sub i64 0, %114
  %116 = getelementptr inbounds i8, i8* %110, i64 %115
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  %119 = load i32, i32* %15, align 4
  %120 = add nsw i32 %119, %118
  store i32 %120, i32* %15, align 4
  %121 = load i32, i32* %13, align 4
  %122 = sub nsw i32 %121, 3
  %123 = load i8*, i8** %27, align 8
  %124 = sext i32 %122 to i64
  %125 = getelementptr inbounds i8, i8* %123, i64 %124
  store i8* %125, i8** %27, align 8
  %126 = load i8*, i8** %28, align 8
  %127 = load i8*, i8** %27, align 8
  %128 = getelementptr inbounds i8, i8* %127, i32 1
  store i8* %128, i8** %27, align 8
  %129 = load i8, i8* %127, align 1
  %130 = zext i8 %129 to i32
  %131 = sext i32 %130 to i64
  %132 = sub i64 0, %131
  %133 = getelementptr inbounds i8, i8* %126, i64 %132
  %134 = load i8, i8* %133, align 1
  %135 = zext i8 %134 to i32
  %136 = load i32, i32* %15, align 4
  %137 = add nsw i32 %136, %135
  store i32 %137, i32* %15, align 4
  %138 = load i8*, i8** %28, align 8
  %139 = load i8*, i8** %27, align 8
  %140 = getelementptr inbounds i8, i8* %139, i32 1
  store i8* %140, i8** %27, align 8
  %141 = load i8, i8* %139, align 1
  %142 = zext i8 %141 to i32
  %143 = sext i32 %142 to i64
  %144 = sub i64 0, %143
  %145 = getelementptr inbounds i8, i8* %138, i64 %144
  %146 = load i8, i8* %145, align 1
  %147 = zext i8 %146 to i32
  %148 = load i32, i32* %15, align 4
  %149 = add nsw i32 %148, %147
  store i32 %149, i32* %15, align 4
  %150 = load i8*, i8** %28, align 8
  %151 = load i8*, i8** %27, align 8
  %152 = getelementptr inbounds i8, i8* %151, i32 1
  store i8* %152, i8** %27, align 8
  %153 = load i8, i8* %151, align 1
  %154 = zext i8 %153 to i32
  %155 = sext i32 %154 to i64
  %156 = sub i64 0, %155
  %157 = getelementptr inbounds i8, i8* %150, i64 %156
  %158 = load i8, i8* %157, align 1
  %159 = zext i8 %158 to i32
  %160 = load i32, i32* %15, align 4
  %161 = add nsw i32 %160, %159
  store i32 %161, i32* %15, align 4
  %162 = load i8*, i8** %28, align 8
  %163 = load i8*, i8** %27, align 8
  %164 = getelementptr inbounds i8, i8* %163, i32 1
  store i8* %164, i8** %27, align 8
  %165 = load i8, i8* %163, align 1
  %166 = zext i8 %165 to i32
  %167 = sext i32 %166 to i64
  %168 = sub i64 0, %167
  %169 = getelementptr inbounds i8, i8* %162, i64 %168
  %170 = load i8, i8* %169, align 1
  %171 = zext i8 %170 to i32
  %172 = load i32, i32* %15, align 4
  %173 = add nsw i32 %172, %171
  store i32 %173, i32* %15, align 4
  %174 = load i8*, i8** %28, align 8
  %175 = load i8*, i8** %27, align 8
  %176 = load i8, i8* %175, align 1
  %177 = zext i8 %176 to i32
  %178 = sext i32 %177 to i64
  %179 = sub i64 0, %178
  %180 = getelementptr inbounds i8, i8* %174, i64 %179
  %181 = load i8, i8* %180, align 1
  %182 = zext i8 %181 to i32
  %183 = load i32, i32* %15, align 4
  %184 = add nsw i32 %183, %182
  store i32 %184, i32* %15, align 4
  %185 = load i32, i32* %13, align 4
  %186 = sub nsw i32 %185, 5
  %187 = load i8*, i8** %27, align 8
  %188 = sext i32 %186 to i64
  %189 = getelementptr inbounds i8, i8* %187, i64 %188
  store i8* %189, i8** %27, align 8
  %190 = load i8*, i8** %28, align 8
  %191 = load i8*, i8** %27, align 8
  %192 = getelementptr inbounds i8, i8* %191, i32 1
  store i8* %192, i8** %27, align 8
  %193 = load i8, i8* %191, align 1
  %194 = zext i8 %193 to i32
  %195 = sext i32 %194 to i64
  %196 = sub i64 0, %195
  %197 = getelementptr inbounds i8, i8* %190, i64 %196
  %198 = load i8, i8* %197, align 1
  %199 = zext i8 %198 to i32
  %200 = load i32, i32* %15, align 4
  %201 = add nsw i32 %200, %199
  store i32 %201, i32* %15, align 4
  %202 = load i8*, i8** %28, align 8
  %203 = load i8*, i8** %27, align 8
  %204 = getelementptr inbounds i8, i8* %203, i32 1
  store i8* %204, i8** %27, align 8
  %205 = load i8, i8* %203, align 1
  %206 = zext i8 %205 to i32
  %207 = sext i32 %206 to i64
  %208 = sub i64 0, %207
  %209 = getelementptr inbounds i8, i8* %202, i64 %208
  %210 = load i8, i8* %209, align 1
  %211 = zext i8 %210 to i32
  %212 = load i32, i32* %15, align 4
  %213 = add nsw i32 %212, %211
  store i32 %213, i32* %15, align 4
  %214 = load i8*, i8** %28, align 8
  %215 = load i8*, i8** %27, align 8
  %216 = getelementptr inbounds i8, i8* %215, i32 1
  store i8* %216, i8** %27, align 8
  %217 = load i8, i8* %215, align 1
  %218 = zext i8 %217 to i32
  %219 = sext i32 %218 to i64
  %220 = sub i64 0, %219
  %221 = getelementptr inbounds i8, i8* %214, i64 %220
  %222 = load i8, i8* %221, align 1
  %223 = zext i8 %222 to i32
  %224 = load i32, i32* %15, align 4
  %225 = add nsw i32 %224, %223
  store i32 %225, i32* %15, align 4
  %226 = load i8*, i8** %28, align 8
  %227 = load i8*, i8** %27, align 8
  %228 = getelementptr inbounds i8, i8* %227, i32 1
  store i8* %228, i8** %27, align 8
  %229 = load i8, i8* %227, align 1
  %230 = zext i8 %229 to i32
  %231 = sext i32 %230 to i64
  %232 = sub i64 0, %231
  %233 = getelementptr inbounds i8, i8* %226, i64 %232
  %234 = load i8, i8* %233, align 1
  %235 = zext i8 %234 to i32
  %236 = load i32, i32* %15, align 4
  %237 = add nsw i32 %236, %235
  store i32 %237, i32* %15, align 4
  %238 = load i8*, i8** %28, align 8
  %239 = load i8*, i8** %27, align 8
  %240 = getelementptr inbounds i8, i8* %239, i32 1
  store i8* %240, i8** %27, align 8
  %241 = load i8, i8* %239, align 1
  %242 = zext i8 %241 to i32
  %243 = sext i32 %242 to i64
  %244 = sub i64 0, %243
  %245 = getelementptr inbounds i8, i8* %238, i64 %244
  %246 = load i8, i8* %245, align 1
  %247 = zext i8 %246 to i32
  %248 = load i32, i32* %15, align 4
  %249 = add nsw i32 %248, %247
  store i32 %249, i32* %15, align 4
  %250 = load i8*, i8** %28, align 8
  %251 = load i8*, i8** %27, align 8
  %252 = getelementptr inbounds i8, i8* %251, i32 1
  store i8* %252, i8** %27, align 8
  %253 = load i8, i8* %251, align 1
  %254 = zext i8 %253 to i32
  %255 = sext i32 %254 to i64
  %256 = sub i64 0, %255
  %257 = getelementptr inbounds i8, i8* %250, i64 %256
  %258 = load i8, i8* %257, align 1
  %259 = zext i8 %258 to i32
  %260 = load i32, i32* %15, align 4
  %261 = add nsw i32 %260, %259
  store i32 %261, i32* %15, align 4
  %262 = load i8*, i8** %28, align 8
  %263 = load i8*, i8** %27, align 8
  %264 = load i8, i8* %263, align 1
  %265 = zext i8 %264 to i32
  %266 = sext i32 %265 to i64
  %267 = sub i64 0, %266
  %268 = getelementptr inbounds i8, i8* %262, i64 %267
  %269 = load i8, i8* %268, align 1
  %270 = zext i8 %269 to i32
  %271 = load i32, i32* %15, align 4
  %272 = add nsw i32 %271, %270
  store i32 %272, i32* %15, align 4
  %273 = load i32, i32* %13, align 4
  %274 = sub nsw i32 %273, 6
  %275 = load i8*, i8** %27, align 8
  %276 = sext i32 %274 to i64
  %277 = getelementptr inbounds i8, i8* %275, i64 %276
  store i8* %277, i8** %27, align 8
  %278 = load i8*, i8** %28, align 8
  %279 = load i8*, i8** %27, align 8
  %280 = getelementptr inbounds i8, i8* %279, i32 1
  store i8* %280, i8** %27, align 8
  %281 = load i8, i8* %279, align 1
  %282 = zext i8 %281 to i32
  %283 = sext i32 %282 to i64
  %284 = sub i64 0, %283
  %285 = getelementptr inbounds i8, i8* %278, i64 %284
  %286 = load i8, i8* %285, align 1
  %287 = zext i8 %286 to i32
  %288 = load i32, i32* %15, align 4
  %289 = add nsw i32 %288, %287
  store i32 %289, i32* %15, align 4
  %290 = load i8*, i8** %28, align 8
  %291 = load i8*, i8** %27, align 8
  %292 = getelementptr inbounds i8, i8* %291, i32 1
  store i8* %292, i8** %27, align 8
  %293 = load i8, i8* %291, align 1
  %294 = zext i8 %293 to i32
  %295 = sext i32 %294 to i64
  %296 = sub i64 0, %295
  %297 = getelementptr inbounds i8, i8* %290, i64 %296
  %298 = load i8, i8* %297, align 1
  %299 = zext i8 %298 to i32
  %300 = load i32, i32* %15, align 4
  %301 = add nsw i32 %300, %299
  store i32 %301, i32* %15, align 4
  %302 = load i8*, i8** %28, align 8
  %303 = load i8*, i8** %27, align 8
  %304 = load i8, i8* %303, align 1
  %305 = zext i8 %304 to i32
  %306 = sext i32 %305 to i64
  %307 = sub i64 0, %306
  %308 = getelementptr inbounds i8, i8* %302, i64 %307
  %309 = load i8, i8* %308, align 1
  %310 = zext i8 %309 to i32
  %311 = load i32, i32* %15, align 4
  %312 = add nsw i32 %311, %310
  store i32 %312, i32* %15, align 4
  %313 = load i32, i32* %15, align 4
  %314 = load i32, i32* %11, align 4
  %315 = icmp slt i32 %313, %314
  br i1 %315, label %317, label %._crit_edge3

._crit_edge3:                                     ; preds = %61
  %pgocount = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 14)
  %316 = add i64 %pgocount, 1
  store i64 %316, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 14)
  br label %1596

; <label>:317:                                    ; preds = %61
  %318 = load i8*, i8** %27, align 8
  %319 = getelementptr inbounds i8, i8* %318, i64 2
  store i8* %319, i8** %27, align 8
  %320 = load i8*, i8** %28, align 8
  %321 = load i8*, i8** %27, align 8
  %322 = getelementptr inbounds i8, i8* %321, i32 1
  store i8* %322, i8** %27, align 8
  %323 = load i8, i8* %321, align 1
  %324 = zext i8 %323 to i32
  %325 = sext i32 %324 to i64
  %326 = sub i64 0, %325
  %327 = getelementptr inbounds i8, i8* %320, i64 %326
  %328 = load i8, i8* %327, align 1
  %329 = zext i8 %328 to i32
  %330 = load i32, i32* %15, align 4
  %331 = add nsw i32 %330, %329
  store i32 %331, i32* %15, align 4
  %332 = load i32, i32* %15, align 4
  %333 = load i32, i32* %11, align 4
  %334 = icmp slt i32 %332, %333
  br i1 %334, label %336, label %._crit_edge5

._crit_edge5:                                     ; preds = %317
  %pgocount41 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 17)
  %335 = add i64 %pgocount41, 1
  store i64 %335, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 17)
  br label %1595

; <label>:336:                                    ; preds = %317
  %337 = load i8*, i8** %28, align 8
  %338 = load i8*, i8** %27, align 8
  %339 = getelementptr inbounds i8, i8* %338, i32 1
  store i8* %339, i8** %27, align 8
  %340 = load i8, i8* %338, align 1
  %341 = zext i8 %340 to i32
  %342 = sext i32 %341 to i64
  %343 = sub i64 0, %342
  %344 = getelementptr inbounds i8, i8* %337, i64 %343
  %345 = load i8, i8* %344, align 1
  %346 = zext i8 %345 to i32
  %347 = load i32, i32* %15, align 4
  %348 = add nsw i32 %347, %346
  store i32 %348, i32* %15, align 4
  %349 = load i32, i32* %15, align 4
  %350 = load i32, i32* %11, align 4
  %351 = icmp slt i32 %349, %350
  br i1 %351, label %353, label %._crit_edge7

._crit_edge7:                                     ; preds = %336
  %pgocount42 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 20)
  %352 = add i64 %pgocount42, 1
  store i64 %352, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 20)
  br label %1593

; <label>:353:                                    ; preds = %336
  %354 = load i8*, i8** %28, align 8
  %355 = load i8*, i8** %27, align 8
  %356 = load i8, i8* %355, align 1
  %357 = zext i8 %356 to i32
  %358 = sext i32 %357 to i64
  %359 = sub i64 0, %358
  %360 = getelementptr inbounds i8, i8* %354, i64 %359
  %361 = load i8, i8* %360, align 1
  %362 = zext i8 %361 to i32
  %363 = load i32, i32* %15, align 4
  %364 = add nsw i32 %363, %362
  store i32 %364, i32* %15, align 4
  %365 = load i32, i32* %15, align 4
  %366 = load i32, i32* %11, align 4
  %367 = icmp slt i32 %365, %366
  br i1 %367, label %369, label %._crit_edge

._crit_edge:                                      ; preds = %353
  %pgocount43 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 2)
  %368 = add i64 %pgocount43, 1
  store i64 %368, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 2)
  br label %1592

; <label>:369:                                    ; preds = %353
  %370 = load i32, i32* %13, align 4
  %371 = sub nsw i32 %370, 6
  %372 = load i8*, i8** %27, align 8
  %373 = sext i32 %371 to i64
  %374 = getelementptr inbounds i8, i8* %372, i64 %373
  store i8* %374, i8** %27, align 8
  %375 = load i8*, i8** %28, align 8
  %376 = load i8*, i8** %27, align 8
  %377 = getelementptr inbounds i8, i8* %376, i32 1
  store i8* %377, i8** %27, align 8
  %378 = load i8, i8* %376, align 1
  %379 = zext i8 %378 to i32
  %380 = sext i32 %379 to i64
  %381 = sub i64 0, %380
  %382 = getelementptr inbounds i8, i8* %375, i64 %381
  %383 = load i8, i8* %382, align 1
  %384 = zext i8 %383 to i32
  %385 = load i32, i32* %15, align 4
  %386 = add nsw i32 %385, %384
  store i32 %386, i32* %15, align 4
  %387 = load i32, i32* %15, align 4
  %388 = load i32, i32* %11, align 4
  %389 = icmp slt i32 %387, %388
  br i1 %389, label %390, label %1591

; <label>:390:                                    ; preds = %369
  %391 = load i8*, i8** %28, align 8
  %392 = load i8*, i8** %27, align 8
  %393 = getelementptr inbounds i8, i8* %392, i32 1
  store i8* %393, i8** %27, align 8
  %394 = load i8, i8* %392, align 1
  %395 = zext i8 %394 to i32
  %396 = sext i32 %395 to i64
  %397 = sub i64 0, %396
  %398 = getelementptr inbounds i8, i8* %391, i64 %397
  %399 = load i8, i8* %398, align 1
  %400 = zext i8 %399 to i32
  %401 = load i32, i32* %15, align 4
  %402 = add nsw i32 %401, %400
  store i32 %402, i32* %15, align 4
  %403 = load i32, i32* %15, align 4
  %404 = load i32, i32* %11, align 4
  %405 = icmp slt i32 %403, %404
  br i1 %405, label %407, label %._crit_edge1

._crit_edge1:                                     ; preds = %390
  %pgocount44 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 3)
  %406 = add i64 %pgocount44, 1
  store i64 %406, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 3)
  br label %1590

; <label>:407:                                    ; preds = %390
  %408 = load i8*, i8** %28, align 8
  %409 = load i8*, i8** %27, align 8
  %410 = getelementptr inbounds i8, i8* %409, i32 1
  store i8* %410, i8** %27, align 8
  %411 = load i8, i8* %409, align 1
  %412 = zext i8 %411 to i32
  %413 = sext i32 %412 to i64
  %414 = sub i64 0, %413
  %415 = getelementptr inbounds i8, i8* %408, i64 %414
  %416 = load i8, i8* %415, align 1
  %417 = zext i8 %416 to i32
  %418 = load i32, i32* %15, align 4
  %419 = add nsw i32 %418, %417
  store i32 %419, i32* %15, align 4
  %420 = load i32, i32* %15, align 4
  %421 = load i32, i32* %11, align 4
  %422 = icmp slt i32 %420, %421
  br i1 %422, label %424, label %._crit_edge2

._crit_edge2:                                     ; preds = %407
  %pgocount45 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 13)
  %423 = add i64 %pgocount45, 1
  store i64 %423, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 13)
  br label %1589

; <label>:424:                                    ; preds = %407
  %425 = load i8*, i8** %28, align 8
  %426 = load i8*, i8** %27, align 8
  %427 = getelementptr inbounds i8, i8* %426, i32 1
  store i8* %427, i8** %27, align 8
  %428 = load i8, i8* %426, align 1
  %429 = zext i8 %428 to i32
  %430 = sext i32 %429 to i64
  %431 = sub i64 0, %430
  %432 = getelementptr inbounds i8, i8* %425, i64 %431
  %433 = load i8, i8* %432, align 1
  %434 = zext i8 %433 to i32
  %435 = load i32, i32* %15, align 4
  %436 = add nsw i32 %435, %434
  store i32 %436, i32* %15, align 4
  %437 = load i32, i32* %15, align 4
  %438 = load i32, i32* %11, align 4
  %439 = icmp slt i32 %437, %438
  br i1 %439, label %441, label %._crit_edge4

._crit_edge4:                                     ; preds = %424
  %pgocount46 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 15)
  %440 = add i64 %pgocount46, 1
  store i64 %440, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 15)
  br label %1588

; <label>:441:                                    ; preds = %424
  %442 = load i8*, i8** %28, align 8
  %443 = load i8*, i8** %27, align 8
  %444 = getelementptr inbounds i8, i8* %443, i32 1
  store i8* %444, i8** %27, align 8
  %445 = load i8, i8* %443, align 1
  %446 = zext i8 %445 to i32
  %447 = sext i32 %446 to i64
  %448 = sub i64 0, %447
  %449 = getelementptr inbounds i8, i8* %442, i64 %448
  %450 = load i8, i8* %449, align 1
  %451 = zext i8 %450 to i32
  %452 = load i32, i32* %15, align 4
  %453 = add nsw i32 %452, %451
  store i32 %453, i32* %15, align 4
  %454 = load i32, i32* %15, align 4
  %455 = load i32, i32* %11, align 4
  %456 = icmp slt i32 %454, %455
  br i1 %456, label %458, label %._crit_edge6

._crit_edge6:                                     ; preds = %441
  %pgocount47 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 18)
  %457 = add i64 %pgocount47, 1
  store i64 %457, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 18)
  br label %1587

; <label>:458:                                    ; preds = %441
  %459 = load i8*, i8** %28, align 8
  %460 = load i8*, i8** %27, align 8
  %461 = getelementptr inbounds i8, i8* %460, i32 1
  store i8* %461, i8** %27, align 8
  %462 = load i8, i8* %460, align 1
  %463 = zext i8 %462 to i32
  %464 = sext i32 %463 to i64
  %465 = sub i64 0, %464
  %466 = getelementptr inbounds i8, i8* %459, i64 %465
  %467 = load i8, i8* %466, align 1
  %468 = zext i8 %467 to i32
  %469 = load i32, i32* %15, align 4
  %470 = add nsw i32 %469, %468
  store i32 %470, i32* %15, align 4
  %471 = load i32, i32* %15, align 4
  %472 = load i32, i32* %11, align 4
  %473 = icmp slt i32 %471, %472
  br i1 %473, label %475, label %._crit_edge8

._crit_edge8:                                     ; preds = %458
  %pgocount48 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 23)
  %474 = add i64 %pgocount48, 1
  store i64 %474, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 23)
  br label %1586

; <label>:475:                                    ; preds = %458
  %476 = load i8*, i8** %28, align 8
  %477 = load i8*, i8** %27, align 8
  %478 = load i8, i8* %477, align 1
  %479 = zext i8 %478 to i32
  %480 = sext i32 %479 to i64
  %481 = sub i64 0, %480
  %482 = getelementptr inbounds i8, i8* %476, i64 %481
  %483 = load i8, i8* %482, align 1
  %484 = zext i8 %483 to i32
  %485 = load i32, i32* %15, align 4
  %486 = add nsw i32 %485, %484
  store i32 %486, i32* %15, align 4
  %487 = load i32, i32* %15, align 4
  %488 = load i32, i32* %11, align 4
  %489 = icmp slt i32 %487, %488
  br i1 %489, label %491, label %._crit_edge9

._crit_edge9:                                     ; preds = %475
  %pgocount49 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 25)
  %490 = add i64 %pgocount49, 1
  store i64 %490, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 25)
  br label %1585

; <label>:491:                                    ; preds = %475
  %492 = load i32, i32* %13, align 4
  %493 = sub nsw i32 %492, 5
  %494 = load i8*, i8** %27, align 8
  %495 = sext i32 %493 to i64
  %496 = getelementptr inbounds i8, i8* %494, i64 %495
  store i8* %496, i8** %27, align 8
  %497 = load i8*, i8** %28, align 8
  %498 = load i8*, i8** %27, align 8
  %499 = getelementptr inbounds i8, i8* %498, i32 1
  store i8* %499, i8** %27, align 8
  %500 = load i8, i8* %498, align 1
  %501 = zext i8 %500 to i32
  %502 = sext i32 %501 to i64
  %503 = sub i64 0, %502
  %504 = getelementptr inbounds i8, i8* %497, i64 %503
  %505 = load i8, i8* %504, align 1
  %506 = zext i8 %505 to i32
  %507 = load i32, i32* %15, align 4
  %508 = add nsw i32 %507, %506
  store i32 %508, i32* %15, align 4
  %509 = load i32, i32* %15, align 4
  %510 = load i32, i32* %11, align 4
  %511 = icmp slt i32 %509, %510
  br i1 %511, label %513, label %._crit_edge10

._crit_edge10:                                    ; preds = %491
  %pgocount50 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 27)
  %512 = add i64 %pgocount50, 1
  store i64 %512, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 27)
  br label %1584

; <label>:513:                                    ; preds = %491
  %514 = load i8*, i8** %28, align 8
  %515 = load i8*, i8** %27, align 8
  %516 = getelementptr inbounds i8, i8* %515, i32 1
  store i8* %516, i8** %27, align 8
  %517 = load i8, i8* %515, align 1
  %518 = zext i8 %517 to i32
  %519 = sext i32 %518 to i64
  %520 = sub i64 0, %519
  %521 = getelementptr inbounds i8, i8* %514, i64 %520
  %522 = load i8, i8* %521, align 1
  %523 = zext i8 %522 to i32
  %524 = load i32, i32* %15, align 4
  %525 = add nsw i32 %524, %523
  store i32 %525, i32* %15, align 4
  %526 = load i32, i32* %15, align 4
  %527 = load i32, i32* %11, align 4
  %528 = icmp slt i32 %526, %527
  br i1 %528, label %530, label %._crit_edge11

._crit_edge11:                                    ; preds = %513
  %pgocount51 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 29)
  %529 = add i64 %pgocount51, 1
  store i64 %529, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 29)
  br label %1583

; <label>:530:                                    ; preds = %513
  %531 = load i8*, i8** %28, align 8
  %532 = load i8*, i8** %27, align 8
  %533 = getelementptr inbounds i8, i8* %532, i32 1
  store i8* %533, i8** %27, align 8
  %534 = load i8, i8* %532, align 1
  %535 = zext i8 %534 to i32
  %536 = sext i32 %535 to i64
  %537 = sub i64 0, %536
  %538 = getelementptr inbounds i8, i8* %531, i64 %537
  %539 = load i8, i8* %538, align 1
  %540 = zext i8 %539 to i32
  %541 = load i32, i32* %15, align 4
  %542 = add nsw i32 %541, %540
  store i32 %542, i32* %15, align 4
  %543 = load i32, i32* %15, align 4
  %544 = load i32, i32* %11, align 4
  %545 = icmp slt i32 %543, %544
  br i1 %545, label %547, label %._crit_edge12

._crit_edge12:                                    ; preds = %530
  %pgocount52 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 31)
  %546 = add i64 %pgocount52, 1
  store i64 %546, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 31)
  br label %1582

; <label>:547:                                    ; preds = %530
  %548 = load i8*, i8** %28, align 8
  %549 = load i8*, i8** %27, align 8
  %550 = getelementptr inbounds i8, i8* %549, i32 1
  store i8* %550, i8** %27, align 8
  %551 = load i8, i8* %549, align 1
  %552 = zext i8 %551 to i32
  %553 = sext i32 %552 to i64
  %554 = sub i64 0, %553
  %555 = getelementptr inbounds i8, i8* %548, i64 %554
  %556 = load i8, i8* %555, align 1
  %557 = zext i8 %556 to i32
  %558 = load i32, i32* %15, align 4
  %559 = add nsw i32 %558, %557
  store i32 %559, i32* %15, align 4
  %560 = load i32, i32* %15, align 4
  %561 = load i32, i32* %11, align 4
  %562 = icmp slt i32 %560, %561
  br i1 %562, label %564, label %._crit_edge13

._crit_edge13:                                    ; preds = %547
  %pgocount53 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 33)
  %563 = add i64 %pgocount53, 1
  store i64 %563, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 33)
  br label %1581

; <label>:564:                                    ; preds = %547
  %565 = load i8*, i8** %28, align 8
  %566 = load i8*, i8** %27, align 8
  %567 = load i8, i8* %566, align 1
  %568 = zext i8 %567 to i32
  %569 = sext i32 %568 to i64
  %570 = sub i64 0, %569
  %571 = getelementptr inbounds i8, i8* %565, i64 %570
  %572 = load i8, i8* %571, align 1
  %573 = zext i8 %572 to i32
  %574 = load i32, i32* %15, align 4
  %575 = add nsw i32 %574, %573
  store i32 %575, i32* %15, align 4
  %576 = load i32, i32* %15, align 4
  %577 = load i32, i32* %11, align 4
  %578 = icmp slt i32 %576, %577
  br i1 %578, label %580, label %._crit_edge14

._crit_edge14:                                    ; preds = %564
  %pgocount54 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 35)
  %579 = add i64 %pgocount54, 1
  store i64 %579, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 35)
  br label %1580

; <label>:580:                                    ; preds = %564
  %581 = load i32, i32* %13, align 4
  %582 = sub nsw i32 %581, 3
  %583 = load i8*, i8** %27, align 8
  %584 = sext i32 %582 to i64
  %585 = getelementptr inbounds i8, i8* %583, i64 %584
  store i8* %585, i8** %27, align 8
  %586 = load i8*, i8** %28, align 8
  %587 = load i8*, i8** %27, align 8
  %588 = getelementptr inbounds i8, i8* %587, i32 1
  store i8* %588, i8** %27, align 8
  %589 = load i8, i8* %587, align 1
  %590 = zext i8 %589 to i32
  %591 = sext i32 %590 to i64
  %592 = sub i64 0, %591
  %593 = getelementptr inbounds i8, i8* %586, i64 %592
  %594 = load i8, i8* %593, align 1
  %595 = zext i8 %594 to i32
  %596 = load i32, i32* %15, align 4
  %597 = add nsw i32 %596, %595
  store i32 %597, i32* %15, align 4
  %598 = load i32, i32* %15, align 4
  %599 = load i32, i32* %11, align 4
  %600 = icmp slt i32 %598, %599
  br i1 %600, label %602, label %._crit_edge15

._crit_edge15:                                    ; preds = %580
  %pgocount55 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 37)
  %601 = add i64 %pgocount55, 1
  store i64 %601, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 37)
  br label %1579

; <label>:602:                                    ; preds = %580
  %603 = load i8*, i8** %28, align 8
  %604 = load i8*, i8** %27, align 8
  %605 = getelementptr inbounds i8, i8* %604, i32 1
  store i8* %605, i8** %27, align 8
  %606 = load i8, i8* %604, align 1
  %607 = zext i8 %606 to i32
  %608 = sext i32 %607 to i64
  %609 = sub i64 0, %608
  %610 = getelementptr inbounds i8, i8* %603, i64 %609
  %611 = load i8, i8* %610, align 1
  %612 = zext i8 %611 to i32
  %613 = load i32, i32* %15, align 4
  %614 = add nsw i32 %613, %612
  store i32 %614, i32* %15, align 4
  %615 = load i32, i32* %15, align 4
  %616 = load i32, i32* %11, align 4
  %617 = icmp slt i32 %615, %616
  br i1 %617, label %619, label %._crit_edge16

._crit_edge16:                                    ; preds = %602
  %pgocount56 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 39)
  %618 = add i64 %pgocount56, 1
  store i64 %618, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 39)
  br label %1578

; <label>:619:                                    ; preds = %602
  %620 = load i8*, i8** %28, align 8
  %621 = load i8*, i8** %27, align 8
  %622 = load i8, i8* %621, align 1
  %623 = zext i8 %622 to i32
  %624 = sext i32 %623 to i64
  %625 = sub i64 0, %624
  %626 = getelementptr inbounds i8, i8* %620, i64 %625
  %627 = load i8, i8* %626, align 1
  %628 = zext i8 %627 to i32
  %629 = load i32, i32* %15, align 4
  %630 = add nsw i32 %629, %628
  store i32 %630, i32* %15, align 4
  %631 = load i32, i32* %15, align 4
  %632 = load i32, i32* %11, align 4
  %633 = icmp slt i32 %631, %632
  br i1 %633, label %635, label %._crit_edge17

._crit_edge17:                                    ; preds = %619
  %pgocount57 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 41)
  %634 = add i64 %pgocount57, 1
  store i64 %634, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 41)
  br label %1577

; <label>:635:                                    ; preds = %619
  store i32 0, i32* %16, align 4
  store i32 0, i32* %17, align 4
  %636 = load i8*, i8** %8, align 8
  %637 = load i32, i32* %21, align 4
  %638 = sub nsw i32 %637, 3
  %639 = load i32, i32* %13, align 4
  %640 = mul nsw i32 %638, %639
  %641 = sext i32 %640 to i64
  %642 = getelementptr inbounds i8, i8* %636, i64 %641
  %643 = load i32, i32* %22, align 4
  %644 = sext i32 %643 to i64
  %645 = getelementptr inbounds i8, i8* %642, i64 %644
  %646 = getelementptr inbounds i8, i8* %645, i64 -1
  store i8* %646, i8** %27, align 8
  %647 = load i8*, i8** %28, align 8
  %648 = load i8*, i8** %27, align 8
  %649 = getelementptr inbounds i8, i8* %648, i32 1
  store i8* %649, i8** %27, align 8
  %650 = load i8, i8* %648, align 1
  %651 = zext i8 %650 to i32
  %652 = sext i32 %651 to i64
  %653 = sub i64 0, %652
  %654 = getelementptr inbounds i8, i8* %647, i64 %653
  %655 = load i8, i8* %654, align 1
  store i8 %655, i8* %26, align 1
  %656 = load i8, i8* %26, align 1
  %657 = zext i8 %656 to i32
  %658 = load i32, i32* %16, align 4
  %659 = sub nsw i32 %658, %657
  store i32 %659, i32* %16, align 4
  %660 = load i8, i8* %26, align 1
  %661 = zext i8 %660 to i32
  %662 = mul nsw i32 3, %661
  %663 = load i32, i32* %17, align 4
  %664 = sub nsw i32 %663, %662
  store i32 %664, i32* %17, align 4
  %665 = load i8*, i8** %28, align 8
  %666 = load i8*, i8** %27, align 8
  %667 = getelementptr inbounds i8, i8* %666, i32 1
  store i8* %667, i8** %27, align 8
  %668 = load i8, i8* %666, align 1
  %669 = zext i8 %668 to i32
  %670 = sext i32 %669 to i64
  %671 = sub i64 0, %670
  %672 = getelementptr inbounds i8, i8* %665, i64 %671
  %673 = load i8, i8* %672, align 1
  store i8 %673, i8* %26, align 1
  %674 = load i8, i8* %26, align 1
  %675 = zext i8 %674 to i32
  %676 = mul nsw i32 3, %675
  %677 = load i32, i32* %17, align 4
  %678 = sub nsw i32 %677, %676
  store i32 %678, i32* %17, align 4
  %679 = load i8*, i8** %28, align 8
  %680 = load i8*, i8** %27, align 8
  %681 = load i8, i8* %680, align 1
  %682 = zext i8 %681 to i32
  %683 = sext i32 %682 to i64
  %684 = sub i64 0, %683
  %685 = getelementptr inbounds i8, i8* %679, i64 %684
  %686 = load i8, i8* %685, align 1
  store i8 %686, i8* %26, align 1
  %687 = load i8, i8* %26, align 1
  %688 = zext i8 %687 to i32
  %689 = load i32, i32* %16, align 4
  %690 = add nsw i32 %689, %688
  store i32 %690, i32* %16, align 4
  %691 = load i8, i8* %26, align 1
  %692 = zext i8 %691 to i32
  %693 = mul nsw i32 3, %692
  %694 = load i32, i32* %17, align 4
  %695 = sub nsw i32 %694, %693
  store i32 %695, i32* %17, align 4
  %696 = load i32, i32* %13, align 4
  %697 = sub nsw i32 %696, 3
  %698 = load i8*, i8** %27, align 8
  %699 = sext i32 %697 to i64
  %700 = getelementptr inbounds i8, i8* %698, i64 %699
  store i8* %700, i8** %27, align 8
  %701 = load i8*, i8** %28, align 8
  %702 = load i8*, i8** %27, align 8
  %703 = getelementptr inbounds i8, i8* %702, i32 1
  store i8* %703, i8** %27, align 8
  %704 = load i8, i8* %702, align 1
  %705 = zext i8 %704 to i32
  %706 = sext i32 %705 to i64
  %707 = sub i64 0, %706
  %708 = getelementptr inbounds i8, i8* %701, i64 %707
  %709 = load i8, i8* %708, align 1
  store i8 %709, i8* %26, align 1
  %710 = load i8, i8* %26, align 1
  %711 = zext i8 %710 to i32
  %712 = mul nsw i32 2, %711
  %713 = load i32, i32* %16, align 4
  %714 = sub nsw i32 %713, %712
  store i32 %714, i32* %16, align 4
  %715 = load i8, i8* %26, align 1
  %716 = zext i8 %715 to i32
  %717 = mul nsw i32 2, %716
  %718 = load i32, i32* %17, align 4
  %719 = sub nsw i32 %718, %717
  store i32 %719, i32* %17, align 4
  %720 = load i8*, i8** %28, align 8
  %721 = load i8*, i8** %27, align 8
  %722 = getelementptr inbounds i8, i8* %721, i32 1
  store i8* %722, i8** %27, align 8
  %723 = load i8, i8* %721, align 1
  %724 = zext i8 %723 to i32
  %725 = sext i32 %724 to i64
  %726 = sub i64 0, %725
  %727 = getelementptr inbounds i8, i8* %720, i64 %726
  %728 = load i8, i8* %727, align 1
  store i8 %728, i8* %26, align 1
  %729 = load i8, i8* %26, align 1
  %730 = zext i8 %729 to i32
  %731 = load i32, i32* %16, align 4
  %732 = sub nsw i32 %731, %730
  store i32 %732, i32* %16, align 4
  %733 = load i8, i8* %26, align 1
  %734 = zext i8 %733 to i32
  %735 = mul nsw i32 2, %734
  %736 = load i32, i32* %17, align 4
  %737 = sub nsw i32 %736, %735
  store i32 %737, i32* %17, align 4
  %738 = load i8*, i8** %28, align 8
  %739 = load i8*, i8** %27, align 8
  %740 = getelementptr inbounds i8, i8* %739, i32 1
  store i8* %740, i8** %27, align 8
  %741 = load i8, i8* %739, align 1
  %742 = zext i8 %741 to i32
  %743 = sext i32 %742 to i64
  %744 = sub i64 0, %743
  %745 = getelementptr inbounds i8, i8* %738, i64 %744
  %746 = load i8, i8* %745, align 1
  store i8 %746, i8* %26, align 1
  %747 = load i8, i8* %26, align 1
  %748 = zext i8 %747 to i32
  %749 = mul nsw i32 2, %748
  %750 = load i32, i32* %17, align 4
  %751 = sub nsw i32 %750, %749
  store i32 %751, i32* %17, align 4
  %752 = load i8*, i8** %28, align 8
  %753 = load i8*, i8** %27, align 8
  %754 = getelementptr inbounds i8, i8* %753, i32 1
  store i8* %754, i8** %27, align 8
  %755 = load i8, i8* %753, align 1
  %756 = zext i8 %755 to i32
  %757 = sext i32 %756 to i64
  %758 = sub i64 0, %757
  %759 = getelementptr inbounds i8, i8* %752, i64 %758
  %760 = load i8, i8* %759, align 1
  store i8 %760, i8* %26, align 1
  %761 = load i8, i8* %26, align 1
  %762 = zext i8 %761 to i32
  %763 = load i32, i32* %16, align 4
  %764 = add nsw i32 %763, %762
  store i32 %764, i32* %16, align 4
  %765 = load i8, i8* %26, align 1
  %766 = zext i8 %765 to i32
  %767 = mul nsw i32 2, %766
  %768 = load i32, i32* %17, align 4
  %769 = sub nsw i32 %768, %767
  store i32 %769, i32* %17, align 4
  %770 = load i8*, i8** %28, align 8
  %771 = load i8*, i8** %27, align 8
  %772 = load i8, i8* %771, align 1
  %773 = zext i8 %772 to i32
  %774 = sext i32 %773 to i64
  %775 = sub i64 0, %774
  %776 = getelementptr inbounds i8, i8* %770, i64 %775
  %777 = load i8, i8* %776, align 1
  store i8 %777, i8* %26, align 1
  %778 = load i8, i8* %26, align 1
  %779 = zext i8 %778 to i32
  %780 = mul nsw i32 2, %779
  %781 = load i32, i32* %16, align 4
  %782 = add nsw i32 %781, %780
  store i32 %782, i32* %16, align 4
  %783 = load i8, i8* %26, align 1
  %784 = zext i8 %783 to i32
  %785 = mul nsw i32 2, %784
  %786 = load i32, i32* %17, align 4
  %787 = sub nsw i32 %786, %785
  store i32 %787, i32* %17, align 4
  %788 = load i32, i32* %13, align 4
  %789 = sub nsw i32 %788, 5
  %790 = load i8*, i8** %27, align 8
  %791 = sext i32 %789 to i64
  %792 = getelementptr inbounds i8, i8* %790, i64 %791
  store i8* %792, i8** %27, align 8
  %793 = load i8*, i8** %28, align 8
  %794 = load i8*, i8** %27, align 8
  %795 = getelementptr inbounds i8, i8* %794, i32 1
  store i8* %795, i8** %27, align 8
  %796 = load i8, i8* %794, align 1
  %797 = zext i8 %796 to i32
  %798 = sext i32 %797 to i64
  %799 = sub i64 0, %798
  %800 = getelementptr inbounds i8, i8* %793, i64 %799
  %801 = load i8, i8* %800, align 1
  store i8 %801, i8* %26, align 1
  %802 = load i8, i8* %26, align 1
  %803 = zext i8 %802 to i32
  %804 = mul nsw i32 3, %803
  %805 = load i32, i32* %16, align 4
  %806 = sub nsw i32 %805, %804
  store i32 %806, i32* %16, align 4
  %807 = load i8, i8* %26, align 1
  %808 = zext i8 %807 to i32
  %809 = load i32, i32* %17, align 4
  %810 = sub nsw i32 %809, %808
  store i32 %810, i32* %17, align 4
  %811 = load i8*, i8** %28, align 8
  %812 = load i8*, i8** %27, align 8
  %813 = getelementptr inbounds i8, i8* %812, i32 1
  store i8* %813, i8** %27, align 8
  %814 = load i8, i8* %812, align 1
  %815 = zext i8 %814 to i32
  %816 = sext i32 %815 to i64
  %817 = sub i64 0, %816
  %818 = getelementptr inbounds i8, i8* %811, i64 %817
  %819 = load i8, i8* %818, align 1
  store i8 %819, i8* %26, align 1
  %820 = load i8, i8* %26, align 1
  %821 = zext i8 %820 to i32
  %822 = mul nsw i32 2, %821
  %823 = load i32, i32* %16, align 4
  %824 = sub nsw i32 %823, %822
  store i32 %824, i32* %16, align 4
  %825 = load i8, i8* %26, align 1
  %826 = zext i8 %825 to i32
  %827 = load i32, i32* %17, align 4
  %828 = sub nsw i32 %827, %826
  store i32 %828, i32* %17, align 4
  %829 = load i8*, i8** %28, align 8
  %830 = load i8*, i8** %27, align 8
  %831 = getelementptr inbounds i8, i8* %830, i32 1
  store i8* %831, i8** %27, align 8
  %832 = load i8, i8* %830, align 1
  %833 = zext i8 %832 to i32
  %834 = sext i32 %833 to i64
  %835 = sub i64 0, %834
  %836 = getelementptr inbounds i8, i8* %829, i64 %835
  %837 = load i8, i8* %836, align 1
  store i8 %837, i8* %26, align 1
  %838 = load i8, i8* %26, align 1
  %839 = zext i8 %838 to i32
  %840 = load i32, i32* %16, align 4
  %841 = sub nsw i32 %840, %839
  store i32 %841, i32* %16, align 4
  %842 = load i8, i8* %26, align 1
  %843 = zext i8 %842 to i32
  %844 = load i32, i32* %17, align 4
  %845 = sub nsw i32 %844, %843
  store i32 %845, i32* %17, align 4
  %846 = load i8*, i8** %28, align 8
  %847 = load i8*, i8** %27, align 8
  %848 = getelementptr inbounds i8, i8* %847, i32 1
  store i8* %848, i8** %27, align 8
  %849 = load i8, i8* %847, align 1
  %850 = zext i8 %849 to i32
  %851 = sext i32 %850 to i64
  %852 = sub i64 0, %851
  %853 = getelementptr inbounds i8, i8* %846, i64 %852
  %854 = load i8, i8* %853, align 1
  store i8 %854, i8* %26, align 1
  %855 = load i8, i8* %26, align 1
  %856 = zext i8 %855 to i32
  %857 = load i32, i32* %17, align 4
  %858 = sub nsw i32 %857, %856
  store i32 %858, i32* %17, align 4
  %859 = load i8*, i8** %28, align 8
  %860 = load i8*, i8** %27, align 8
  %861 = getelementptr inbounds i8, i8* %860, i32 1
  store i8* %861, i8** %27, align 8
  %862 = load i8, i8* %860, align 1
  %863 = zext i8 %862 to i32
  %864 = sext i32 %863 to i64
  %865 = sub i64 0, %864
  %866 = getelementptr inbounds i8, i8* %859, i64 %865
  %867 = load i8, i8* %866, align 1
  store i8 %867, i8* %26, align 1
  %868 = load i8, i8* %26, align 1
  %869 = zext i8 %868 to i32
  %870 = load i32, i32* %16, align 4
  %871 = add nsw i32 %870, %869
  store i32 %871, i32* %16, align 4
  %872 = load i8, i8* %26, align 1
  %873 = zext i8 %872 to i32
  %874 = load i32, i32* %17, align 4
  %875 = sub nsw i32 %874, %873
  store i32 %875, i32* %17, align 4
  %876 = load i8*, i8** %28, align 8
  %877 = load i8*, i8** %27, align 8
  %878 = getelementptr inbounds i8, i8* %877, i32 1
  store i8* %878, i8** %27, align 8
  %879 = load i8, i8* %877, align 1
  %880 = zext i8 %879 to i32
  %881 = sext i32 %880 to i64
  %882 = sub i64 0, %881
  %883 = getelementptr inbounds i8, i8* %876, i64 %882
  %884 = load i8, i8* %883, align 1
  store i8 %884, i8* %26, align 1
  %885 = load i8, i8* %26, align 1
  %886 = zext i8 %885 to i32
  %887 = mul nsw i32 2, %886
  %888 = load i32, i32* %16, align 4
  %889 = add nsw i32 %888, %887
  store i32 %889, i32* %16, align 4
  %890 = load i8, i8* %26, align 1
  %891 = zext i8 %890 to i32
  %892 = load i32, i32* %17, align 4
  %893 = sub nsw i32 %892, %891
  store i32 %893, i32* %17, align 4
  %894 = load i8*, i8** %28, align 8
  %895 = load i8*, i8** %27, align 8
  %896 = load i8, i8* %895, align 1
  %897 = zext i8 %896 to i32
  %898 = sext i32 %897 to i64
  %899 = sub i64 0, %898
  %900 = getelementptr inbounds i8, i8* %894, i64 %899
  %901 = load i8, i8* %900, align 1
  store i8 %901, i8* %26, align 1
  %902 = load i8, i8* %26, align 1
  %903 = zext i8 %902 to i32
  %904 = mul nsw i32 3, %903
  %905 = load i32, i32* %16, align 4
  %906 = add nsw i32 %905, %904
  store i32 %906, i32* %16, align 4
  %907 = load i8, i8* %26, align 1
  %908 = zext i8 %907 to i32
  %909 = load i32, i32* %17, align 4
  %910 = sub nsw i32 %909, %908
  store i32 %910, i32* %17, align 4
  %911 = load i32, i32* %13, align 4
  %912 = sub nsw i32 %911, 6
  %913 = load i8*, i8** %27, align 8
  %914 = sext i32 %912 to i64
  %915 = getelementptr inbounds i8, i8* %913, i64 %914
  store i8* %915, i8** %27, align 8
  %916 = load i8*, i8** %28, align 8
  %917 = load i8*, i8** %27, align 8
  %918 = getelementptr inbounds i8, i8* %917, i32 1
  store i8* %918, i8** %27, align 8
  %919 = load i8, i8* %917, align 1
  %920 = zext i8 %919 to i32
  %921 = sext i32 %920 to i64
  %922 = sub i64 0, %921
  %923 = getelementptr inbounds i8, i8* %916, i64 %922
  %924 = load i8, i8* %923, align 1
  store i8 %924, i8* %26, align 1
  %925 = load i8, i8* %26, align 1
  %926 = zext i8 %925 to i32
  %927 = mul nsw i32 3, %926
  %928 = load i32, i32* %16, align 4
  %929 = sub nsw i32 %928, %927
  store i32 %929, i32* %16, align 4
  %930 = load i8*, i8** %28, align 8
  %931 = load i8*, i8** %27, align 8
  %932 = getelementptr inbounds i8, i8* %931, i32 1
  store i8* %932, i8** %27, align 8
  %933 = load i8, i8* %931, align 1
  %934 = zext i8 %933 to i32
  %935 = sext i32 %934 to i64
  %936 = sub i64 0, %935
  %937 = getelementptr inbounds i8, i8* %930, i64 %936
  %938 = load i8, i8* %937, align 1
  store i8 %938, i8* %26, align 1
  %939 = load i8, i8* %26, align 1
  %940 = zext i8 %939 to i32
  %941 = mul nsw i32 2, %940
  %942 = load i32, i32* %16, align 4
  %943 = sub nsw i32 %942, %941
  store i32 %943, i32* %16, align 4
  %944 = load i8*, i8** %28, align 8
  %945 = load i8*, i8** %27, align 8
  %946 = load i8, i8* %945, align 1
  %947 = zext i8 %946 to i32
  %948 = sext i32 %947 to i64
  %949 = sub i64 0, %948
  %950 = getelementptr inbounds i8, i8* %944, i64 %949
  %951 = load i8, i8* %950, align 1
  store i8 %951, i8* %26, align 1
  %952 = load i8, i8* %26, align 1
  %953 = zext i8 %952 to i32
  %954 = load i32, i32* %16, align 4
  %955 = sub nsw i32 %954, %953
  store i32 %955, i32* %16, align 4
  %956 = load i8*, i8** %27, align 8
  %957 = getelementptr inbounds i8, i8* %956, i64 2
  store i8* %957, i8** %27, align 8
  %958 = load i8*, i8** %28, align 8
  %959 = load i8*, i8** %27, align 8
  %960 = getelementptr inbounds i8, i8* %959, i32 1
  store i8* %960, i8** %27, align 8
  %961 = load i8, i8* %959, align 1
  %962 = zext i8 %961 to i32
  %963 = sext i32 %962 to i64
  %964 = sub i64 0, %963
  %965 = getelementptr inbounds i8, i8* %958, i64 %964
  %966 = load i8, i8* %965, align 1
  store i8 %966, i8* %26, align 1
  %967 = load i8, i8* %26, align 1
  %968 = zext i8 %967 to i32
  %969 = load i32, i32* %16, align 4
  %970 = add nsw i32 %969, %968
  store i32 %970, i32* %16, align 4
  %971 = load i8*, i8** %28, align 8
  %972 = load i8*, i8** %27, align 8
  %973 = getelementptr inbounds i8, i8* %972, i32 1
  store i8* %973, i8** %27, align 8
  %974 = load i8, i8* %972, align 1
  %975 = zext i8 %974 to i32
  %976 = sext i32 %975 to i64
  %977 = sub i64 0, %976
  %978 = getelementptr inbounds i8, i8* %971, i64 %977
  %979 = load i8, i8* %978, align 1
  store i8 %979, i8* %26, align 1
  %980 = load i8, i8* %26, align 1
  %981 = zext i8 %980 to i32
  %982 = mul nsw i32 2, %981
  %983 = load i32, i32* %16, align 4
  %984 = add nsw i32 %983, %982
  store i32 %984, i32* %16, align 4
  %985 = load i8*, i8** %28, align 8
  %986 = load i8*, i8** %27, align 8
  %987 = load i8, i8* %986, align 1
  %988 = zext i8 %987 to i32
  %989 = sext i32 %988 to i64
  %990 = sub i64 0, %989
  %991 = getelementptr inbounds i8, i8* %985, i64 %990
  %992 = load i8, i8* %991, align 1
  store i8 %992, i8* %26, align 1
  %993 = load i8, i8* %26, align 1
  %994 = zext i8 %993 to i32
  %995 = mul nsw i32 3, %994
  %996 = load i32, i32* %16, align 4
  %997 = add nsw i32 %996, %995
  store i32 %997, i32* %16, align 4
  %998 = load i32, i32* %13, align 4
  %999 = sub nsw i32 %998, 6
  %1000 = load i8*, i8** %27, align 8
  %1001 = sext i32 %999 to i64
  %1002 = getelementptr inbounds i8, i8* %1000, i64 %1001
  store i8* %1002, i8** %27, align 8
  %1003 = load i8*, i8** %28, align 8
  %1004 = load i8*, i8** %27, align 8
  %1005 = getelementptr inbounds i8, i8* %1004, i32 1
  store i8* %1005, i8** %27, align 8
  %1006 = load i8, i8* %1004, align 1
  %1007 = zext i8 %1006 to i32
  %1008 = sext i32 %1007 to i64
  %1009 = sub i64 0, %1008
  %1010 = getelementptr inbounds i8, i8* %1003, i64 %1009
  %1011 = load i8, i8* %1010, align 1
  store i8 %1011, i8* %26, align 1
  %1012 = load i8, i8* %26, align 1
  %1013 = zext i8 %1012 to i32
  %1014 = mul nsw i32 3, %1013
  %1015 = load i32, i32* %16, align 4
  %1016 = sub nsw i32 %1015, %1014
  store i32 %1016, i32* %16, align 4
  %1017 = load i8, i8* %26, align 1
  %1018 = zext i8 %1017 to i32
  %1019 = load i32, i32* %17, align 4
  %1020 = add nsw i32 %1019, %1018
  store i32 %1020, i32* %17, align 4
  %1021 = load i8*, i8** %28, align 8
  %1022 = load i8*, i8** %27, align 8
  %1023 = getelementptr inbounds i8, i8* %1022, i32 1
  store i8* %1023, i8** %27, align 8
  %1024 = load i8, i8* %1022, align 1
  %1025 = zext i8 %1024 to i32
  %1026 = sext i32 %1025 to i64
  %1027 = sub i64 0, %1026
  %1028 = getelementptr inbounds i8, i8* %1021, i64 %1027
  %1029 = load i8, i8* %1028, align 1
  store i8 %1029, i8* %26, align 1
  %1030 = load i8, i8* %26, align 1
  %1031 = zext i8 %1030 to i32
  %1032 = mul nsw i32 2, %1031
  %1033 = load i32, i32* %16, align 4
  %1034 = sub nsw i32 %1033, %1032
  store i32 %1034, i32* %16, align 4
  %1035 = load i8, i8* %26, align 1
  %1036 = zext i8 %1035 to i32
  %1037 = load i32, i32* %17, align 4
  %1038 = add nsw i32 %1037, %1036
  store i32 %1038, i32* %17, align 4
  %1039 = load i8*, i8** %28, align 8
  %1040 = load i8*, i8** %27, align 8
  %1041 = getelementptr inbounds i8, i8* %1040, i32 1
  store i8* %1041, i8** %27, align 8
  %1042 = load i8, i8* %1040, align 1
  %1043 = zext i8 %1042 to i32
  %1044 = sext i32 %1043 to i64
  %1045 = sub i64 0, %1044
  %1046 = getelementptr inbounds i8, i8* %1039, i64 %1045
  %1047 = load i8, i8* %1046, align 1
  store i8 %1047, i8* %26, align 1
  %1048 = load i8, i8* %26, align 1
  %1049 = zext i8 %1048 to i32
  %1050 = load i32, i32* %16, align 4
  %1051 = sub nsw i32 %1050, %1049
  store i32 %1051, i32* %16, align 4
  %1052 = load i8, i8* %26, align 1
  %1053 = zext i8 %1052 to i32
  %1054 = load i32, i32* %17, align 4
  %1055 = add nsw i32 %1054, %1053
  store i32 %1055, i32* %17, align 4
  %1056 = load i8*, i8** %28, align 8
  %1057 = load i8*, i8** %27, align 8
  %1058 = getelementptr inbounds i8, i8* %1057, i32 1
  store i8* %1058, i8** %27, align 8
  %1059 = load i8, i8* %1057, align 1
  %1060 = zext i8 %1059 to i32
  %1061 = sext i32 %1060 to i64
  %1062 = sub i64 0, %1061
  %1063 = getelementptr inbounds i8, i8* %1056, i64 %1062
  %1064 = load i8, i8* %1063, align 1
  store i8 %1064, i8* %26, align 1
  %1065 = load i8, i8* %26, align 1
  %1066 = zext i8 %1065 to i32
  %1067 = load i32, i32* %17, align 4
  %1068 = add nsw i32 %1067, %1066
  store i32 %1068, i32* %17, align 4
  %1069 = load i8*, i8** %28, align 8
  %1070 = load i8*, i8** %27, align 8
  %1071 = getelementptr inbounds i8, i8* %1070, i32 1
  store i8* %1071, i8** %27, align 8
  %1072 = load i8, i8* %1070, align 1
  %1073 = zext i8 %1072 to i32
  %1074 = sext i32 %1073 to i64
  %1075 = sub i64 0, %1074
  %1076 = getelementptr inbounds i8, i8* %1069, i64 %1075
  %1077 = load i8, i8* %1076, align 1
  store i8 %1077, i8* %26, align 1
  %1078 = load i8, i8* %26, align 1
  %1079 = zext i8 %1078 to i32
  %1080 = load i32, i32* %16, align 4
  %1081 = add nsw i32 %1080, %1079
  store i32 %1081, i32* %16, align 4
  %1082 = load i8, i8* %26, align 1
  %1083 = zext i8 %1082 to i32
  %1084 = load i32, i32* %17, align 4
  %1085 = add nsw i32 %1084, %1083
  store i32 %1085, i32* %17, align 4
  %1086 = load i8*, i8** %28, align 8
  %1087 = load i8*, i8** %27, align 8
  %1088 = getelementptr inbounds i8, i8* %1087, i32 1
  store i8* %1088, i8** %27, align 8
  %1089 = load i8, i8* %1087, align 1
  %1090 = zext i8 %1089 to i32
  %1091 = sext i32 %1090 to i64
  %1092 = sub i64 0, %1091
  %1093 = getelementptr inbounds i8, i8* %1086, i64 %1092
  %1094 = load i8, i8* %1093, align 1
  store i8 %1094, i8* %26, align 1
  %1095 = load i8, i8* %26, align 1
  %1096 = zext i8 %1095 to i32
  %1097 = mul nsw i32 2, %1096
  %1098 = load i32, i32* %16, align 4
  %1099 = add nsw i32 %1098, %1097
  store i32 %1099, i32* %16, align 4
  %1100 = load i8, i8* %26, align 1
  %1101 = zext i8 %1100 to i32
  %1102 = load i32, i32* %17, align 4
  %1103 = add nsw i32 %1102, %1101
  store i32 %1103, i32* %17, align 4
  %1104 = load i8*, i8** %28, align 8
  %1105 = load i8*, i8** %27, align 8
  %1106 = load i8, i8* %1105, align 1
  %1107 = zext i8 %1106 to i32
  %1108 = sext i32 %1107 to i64
  %1109 = sub i64 0, %1108
  %1110 = getelementptr inbounds i8, i8* %1104, i64 %1109
  %1111 = load i8, i8* %1110, align 1
  store i8 %1111, i8* %26, align 1
  %1112 = load i8, i8* %26, align 1
  %1113 = zext i8 %1112 to i32
  %1114 = mul nsw i32 3, %1113
  %1115 = load i32, i32* %16, align 4
  %1116 = add nsw i32 %1115, %1114
  store i32 %1116, i32* %16, align 4
  %1117 = load i8, i8* %26, align 1
  %1118 = zext i8 %1117 to i32
  %1119 = load i32, i32* %17, align 4
  %1120 = add nsw i32 %1119, %1118
  store i32 %1120, i32* %17, align 4
  %1121 = load i32, i32* %13, align 4
  %1122 = sub nsw i32 %1121, 5
  %1123 = load i8*, i8** %27, align 8
  %1124 = sext i32 %1122 to i64
  %1125 = getelementptr inbounds i8, i8* %1123, i64 %1124
  store i8* %1125, i8** %27, align 8
  %1126 = load i8*, i8** %28, align 8
  %1127 = load i8*, i8** %27, align 8
  %1128 = getelementptr inbounds i8, i8* %1127, i32 1
  store i8* %1128, i8** %27, align 8
  %1129 = load i8, i8* %1127, align 1
  %1130 = zext i8 %1129 to i32
  %1131 = sext i32 %1130 to i64
  %1132 = sub i64 0, %1131
  %1133 = getelementptr inbounds i8, i8* %1126, i64 %1132
  %1134 = load i8, i8* %1133, align 1
  store i8 %1134, i8* %26, align 1
  %1135 = load i8, i8* %26, align 1
  %1136 = zext i8 %1135 to i32
  %1137 = mul nsw i32 2, %1136
  %1138 = load i32, i32* %16, align 4
  %1139 = sub nsw i32 %1138, %1137
  store i32 %1139, i32* %16, align 4
  %1140 = load i8, i8* %26, align 1
  %1141 = zext i8 %1140 to i32
  %1142 = mul nsw i32 2, %1141
  %1143 = load i32, i32* %17, align 4
  %1144 = add nsw i32 %1143, %1142
  store i32 %1144, i32* %17, align 4
  %1145 = load i8*, i8** %28, align 8
  %1146 = load i8*, i8** %27, align 8
  %1147 = getelementptr inbounds i8, i8* %1146, i32 1
  store i8* %1147, i8** %27, align 8
  %1148 = load i8, i8* %1146, align 1
  %1149 = zext i8 %1148 to i32
  %1150 = sext i32 %1149 to i64
  %1151 = sub i64 0, %1150
  %1152 = getelementptr inbounds i8, i8* %1145, i64 %1151
  %1153 = load i8, i8* %1152, align 1
  store i8 %1153, i8* %26, align 1
  %1154 = load i8, i8* %26, align 1
  %1155 = zext i8 %1154 to i32
  %1156 = load i32, i32* %16, align 4
  %1157 = sub nsw i32 %1156, %1155
  store i32 %1157, i32* %16, align 4
  %1158 = load i8, i8* %26, align 1
  %1159 = zext i8 %1158 to i32
  %1160 = mul nsw i32 2, %1159
  %1161 = load i32, i32* %17, align 4
  %1162 = add nsw i32 %1161, %1160
  store i32 %1162, i32* %17, align 4
  %1163 = load i8*, i8** %28, align 8
  %1164 = load i8*, i8** %27, align 8
  %1165 = getelementptr inbounds i8, i8* %1164, i32 1
  store i8* %1165, i8** %27, align 8
  %1166 = load i8, i8* %1164, align 1
  %1167 = zext i8 %1166 to i32
  %1168 = sext i32 %1167 to i64
  %1169 = sub i64 0, %1168
  %1170 = getelementptr inbounds i8, i8* %1163, i64 %1169
  %1171 = load i8, i8* %1170, align 1
  store i8 %1171, i8* %26, align 1
  %1172 = load i8, i8* %26, align 1
  %1173 = zext i8 %1172 to i32
  %1174 = mul nsw i32 2, %1173
  %1175 = load i32, i32* %17, align 4
  %1176 = add nsw i32 %1175, %1174
  store i32 %1176, i32* %17, align 4
  %1177 = load i8*, i8** %28, align 8
  %1178 = load i8*, i8** %27, align 8
  %1179 = getelementptr inbounds i8, i8* %1178, i32 1
  store i8* %1179, i8** %27, align 8
  %1180 = load i8, i8* %1178, align 1
  %1181 = zext i8 %1180 to i32
  %1182 = sext i32 %1181 to i64
  %1183 = sub i64 0, %1182
  %1184 = getelementptr inbounds i8, i8* %1177, i64 %1183
  %1185 = load i8, i8* %1184, align 1
  store i8 %1185, i8* %26, align 1
  %1186 = load i8, i8* %26, align 1
  %1187 = zext i8 %1186 to i32
  %1188 = load i32, i32* %16, align 4
  %1189 = add nsw i32 %1188, %1187
  store i32 %1189, i32* %16, align 4
  %1190 = load i8, i8* %26, align 1
  %1191 = zext i8 %1190 to i32
  %1192 = mul nsw i32 2, %1191
  %1193 = load i32, i32* %17, align 4
  %1194 = add nsw i32 %1193, %1192
  store i32 %1194, i32* %17, align 4
  %1195 = load i8*, i8** %28, align 8
  %1196 = load i8*, i8** %27, align 8
  %1197 = load i8, i8* %1196, align 1
  %1198 = zext i8 %1197 to i32
  %1199 = sext i32 %1198 to i64
  %1200 = sub i64 0, %1199
  %1201 = getelementptr inbounds i8, i8* %1195, i64 %1200
  %1202 = load i8, i8* %1201, align 1
  store i8 %1202, i8* %26, align 1
  %1203 = load i8, i8* %26, align 1
  %1204 = zext i8 %1203 to i32
  %1205 = mul nsw i32 2, %1204
  %1206 = load i32, i32* %16, align 4
  %1207 = add nsw i32 %1206, %1205
  store i32 %1207, i32* %16, align 4
  %1208 = load i8, i8* %26, align 1
  %1209 = zext i8 %1208 to i32
  %1210 = mul nsw i32 2, %1209
  %1211 = load i32, i32* %17, align 4
  %1212 = add nsw i32 %1211, %1210
  store i32 %1212, i32* %17, align 4
  %1213 = load i32, i32* %13, align 4
  %1214 = sub nsw i32 %1213, 3
  %1215 = load i8*, i8** %27, align 8
  %1216 = sext i32 %1214 to i64
  %1217 = getelementptr inbounds i8, i8* %1215, i64 %1216
  store i8* %1217, i8** %27, align 8
  %1218 = load i8*, i8** %28, align 8
  %1219 = load i8*, i8** %27, align 8
  %1220 = getelementptr inbounds i8, i8* %1219, i32 1
  store i8* %1220, i8** %27, align 8
  %1221 = load i8, i8* %1219, align 1
  %1222 = zext i8 %1221 to i32
  %1223 = sext i32 %1222 to i64
  %1224 = sub i64 0, %1223
  %1225 = getelementptr inbounds i8, i8* %1218, i64 %1224
  %1226 = load i8, i8* %1225, align 1
  store i8 %1226, i8* %26, align 1
  %1227 = load i8, i8* %26, align 1
  %1228 = zext i8 %1227 to i32
  %1229 = load i32, i32* %16, align 4
  %1230 = sub nsw i32 %1229, %1228
  store i32 %1230, i32* %16, align 4
  %1231 = load i8, i8* %26, align 1
  %1232 = zext i8 %1231 to i32
  %1233 = mul nsw i32 3, %1232
  %1234 = load i32, i32* %17, align 4
  %1235 = add nsw i32 %1234, %1233
  store i32 %1235, i32* %17, align 4
  %1236 = load i8*, i8** %28, align 8
  %1237 = load i8*, i8** %27, align 8
  %1238 = getelementptr inbounds i8, i8* %1237, i32 1
  store i8* %1238, i8** %27, align 8
  %1239 = load i8, i8* %1237, align 1
  %1240 = zext i8 %1239 to i32
  %1241 = sext i32 %1240 to i64
  %1242 = sub i64 0, %1241
  %1243 = getelementptr inbounds i8, i8* %1236, i64 %1242
  %1244 = load i8, i8* %1243, align 1
  store i8 %1244, i8* %26, align 1
  %1245 = load i8, i8* %26, align 1
  %1246 = zext i8 %1245 to i32
  %1247 = mul nsw i32 3, %1246
  %1248 = load i32, i32* %17, align 4
  %1249 = add nsw i32 %1248, %1247
  store i32 %1249, i32* %17, align 4
  %1250 = load i8*, i8** %28, align 8
  %1251 = load i8*, i8** %27, align 8
  %1252 = load i8, i8* %1251, align 1
  %1253 = zext i8 %1252 to i32
  %1254 = sext i32 %1253 to i64
  %1255 = sub i64 0, %1254
  %1256 = getelementptr inbounds i8, i8* %1250, i64 %1255
  %1257 = load i8, i8* %1256, align 1
  store i8 %1257, i8* %26, align 1
  %1258 = load i8, i8* %26, align 1
  %1259 = zext i8 %1258 to i32
  %1260 = load i32, i32* %16, align 4
  %1261 = add nsw i32 %1260, %1259
  store i32 %1261, i32* %16, align 4
  %1262 = load i8, i8* %26, align 1
  %1263 = zext i8 %1262 to i32
  %1264 = mul nsw i32 3, %1263
  %1265 = load i32, i32* %17, align 4
  %1266 = add nsw i32 %1265, %1264
  store i32 %1266, i32* %17, align 4
  %1267 = load i32, i32* %16, align 4
  %1268 = load i32, i32* %16, align 4
  %1269 = mul nsw i32 %1267, %1268
  store i32 %1269, i32* %19, align 4
  %1270 = load i32, i32* %17, align 4
  %1271 = load i32, i32* %17, align 4
  %1272 = mul nsw i32 %1270, %1271
  store i32 %1272, i32* %20, align 4
  %1273 = load i32, i32* %19, align 4
  %1274 = load i32, i32* %20, align 4
  %1275 = add nsw i32 %1273, %1274
  store i32 %1275, i32* %18, align 4
  %1276 = load i32, i32* %18, align 4
  %1277 = load i32, i32* %15, align 4
  %1278 = load i32, i32* %15, align 4
  %1279 = mul nsw i32 %1277, %1278
  %1280 = sdiv i32 %1279, 2
  %1281 = icmp sgt i32 %1276, %1280
  br i1 %1281, label %1283, label %._crit_edge18

._crit_edge18:                                    ; preds = %635
  %pgocount58 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 43)
  %1282 = add i64 %pgocount58, 1
  store i64 %1282, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 43)
  br label %1576

; <label>:1283:                                   ; preds = %635
  %1284 = load i32, i32* %20, align 4
  %1285 = load i32, i32* %19, align 4
  %1286 = icmp slt i32 %1284, %1285
  br i1 %1286, label %1287, label %1411

; <label>:1287:                                   ; preds = %1283
  %1288 = load i32, i32* %17, align 4
  %1289 = sitofp i32 %1288 to float
  %1290 = load i32, i32* %16, align 4
  %1291 = call i32 @abs(i32 %1290) #9
  %1292 = sitofp i32 %1291 to float
  %1293 = fdiv float %1289, %1292
  store float %1293, float* %25, align 4
  %1294 = load i32, i32* %16, align 4
  %1295 = call i32 @abs(i32 %1294) #9
  %1296 = load i32, i32* %16, align 4
  %1297 = sdiv i32 %1295, %1296
  store i32 %1297, i32* %18, align 4
  %1298 = load i8*, i8** %28, align 8
  %1299 = load i8*, i8** %8, align 8
  %1300 = load i32, i32* %21, align 4
  %1301 = load float, float* %25, align 4
  %1302 = fcmp olt float %1301, 0.000000e+00
  br i1 %1302, label %1303, label %1308

; <label>:1303:                                   ; preds = %1287
  %1304 = load float, float* %25, align 4
  %1305 = fpext float %1304 to double
  %1306 = fsub double %1305, 5.000000e-01
  %1307 = fptosi double %1306 to i32
  br label %1314

; <label>:1308:                                   ; preds = %1287
  %pgocount59 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 5)
  %1309 = add i64 %pgocount59, 1
  store i64 %1309, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 5)
  %1310 = load float, float* %25, align 4
  %1311 = fpext float %1310 to double
  %1312 = fadd double %1311, 5.000000e-01
  %1313 = fptosi double %1312 to i32
  br label %1314

; <label>:1314:                                   ; preds = %1308, %1303
  %1315 = phi i32 [ %1307, %1303 ], [ %1313, %1308 ]
  %1316 = add nsw i32 %1300, %1315
  %1317 = load i32, i32* %13, align 4
  %1318 = mul nsw i32 %1316, %1317
  %1319 = load i32, i32* %22, align 4
  %1320 = add nsw i32 %1318, %1319
  %1321 = load i32, i32* %18, align 4
  %1322 = add nsw i32 %1320, %1321
  %1323 = sext i32 %1322 to i64
  %1324 = getelementptr inbounds i8, i8* %1299, i64 %1323
  %1325 = load i8, i8* %1324, align 1
  %1326 = zext i8 %1325 to i32
  %1327 = sext i32 %1326 to i64
  %1328 = sub i64 0, %1327
  %1329 = getelementptr inbounds i8, i8* %1298, i64 %1328
  %1330 = load i8, i8* %1329, align 1
  %1331 = zext i8 %1330 to i32
  %1332 = load i8*, i8** %28, align 8
  %1333 = load i8*, i8** %8, align 8
  %1334 = load i32, i32* %21, align 4
  %1335 = load float, float* %25, align 4
  %1336 = fmul float 2.000000e+00, %1335
  %1337 = fcmp olt float %1336, 0.000000e+00
  br i1 %1337, label %1338, label %1344

; <label>:1338:                                   ; preds = %1314
  %1339 = load float, float* %25, align 4
  %1340 = fmul float 2.000000e+00, %1339
  %1341 = fpext float %1340 to double
  %1342 = fsub double %1341, 5.000000e-01
  %1343 = fptosi double %1342 to i32
  br label %1351

; <label>:1344:                                   ; preds = %1314
  %pgocount60 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 6)
  %1345 = add i64 %pgocount60, 1
  store i64 %1345, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 6)
  %1346 = load float, float* %25, align 4
  %1347 = fmul float 2.000000e+00, %1346
  %1348 = fpext float %1347 to double
  %1349 = fadd double %1348, 5.000000e-01
  %1350 = fptosi double %1349 to i32
  br label %1351

; <label>:1351:                                   ; preds = %1344, %1338
  %1352 = phi i32 [ %1343, %1338 ], [ %1350, %1344 ]
  %1353 = add nsw i32 %1334, %1352
  %1354 = load i32, i32* %13, align 4
  %1355 = mul nsw i32 %1353, %1354
  %1356 = load i32, i32* %22, align 4
  %1357 = add nsw i32 %1355, %1356
  %1358 = load i32, i32* %18, align 4
  %1359 = mul nsw i32 2, %1358
  %1360 = add nsw i32 %1357, %1359
  %1361 = sext i32 %1360 to i64
  %1362 = getelementptr inbounds i8, i8* %1333, i64 %1361
  %1363 = load i8, i8* %1362, align 1
  %1364 = zext i8 %1363 to i32
  %1365 = sext i32 %1364 to i64
  %1366 = sub i64 0, %1365
  %1367 = getelementptr inbounds i8, i8* %1332, i64 %1366
  %1368 = load i8, i8* %1367, align 1
  %1369 = zext i8 %1368 to i32
  %1370 = add nsw i32 %1331, %1369
  %1371 = load i8*, i8** %28, align 8
  %1372 = load i8*, i8** %8, align 8
  %1373 = load i32, i32* %21, align 4
  %1374 = load float, float* %25, align 4
  %1375 = fmul float 3.000000e+00, %1374
  %1376 = fcmp olt float %1375, 0.000000e+00
  br i1 %1376, label %1377, label %1384

; <label>:1377:                                   ; preds = %1351
  %pgocount61 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 7)
  %1378 = add i64 %pgocount61, 1
  store i64 %1378, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 7)
  %1379 = load float, float* %25, align 4
  %1380 = fmul float 3.000000e+00, %1379
  %1381 = fpext float %1380 to double
  %1382 = fsub double %1381, 5.000000e-01
  %1383 = fptosi double %1382 to i32
  br label %1391

; <label>:1384:                                   ; preds = %1351
  %pgocount62 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 8)
  %1385 = add i64 %pgocount62, 1
  store i64 %1385, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 8)
  %1386 = load float, float* %25, align 4
  %1387 = fmul float 3.000000e+00, %1386
  %1388 = fpext float %1387 to double
  %1389 = fadd double %1388, 5.000000e-01
  %1390 = fptosi double %1389 to i32
  br label %1391

; <label>:1391:                                   ; preds = %1384, %1377
  %1392 = phi i32 [ %1383, %1377 ], [ %1390, %1384 ]
  %1393 = add nsw i32 %1373, %1392
  %1394 = load i32, i32* %13, align 4
  %1395 = mul nsw i32 %1393, %1394
  %1396 = load i32, i32* %22, align 4
  %1397 = add nsw i32 %1395, %1396
  %1398 = load i32, i32* %18, align 4
  %1399 = mul nsw i32 3, %1398
  %1400 = add nsw i32 %1397, %1399
  %1401 = sext i32 %1400 to i64
  %1402 = getelementptr inbounds i8, i8* %1372, i64 %1401
  %1403 = load i8, i8* %1402, align 1
  %1404 = zext i8 %1403 to i32
  %1405 = sext i32 %1404 to i64
  %1406 = sub i64 0, %1405
  %1407 = getelementptr inbounds i8, i8* %1371, i64 %1406
  %1408 = load i8, i8* %1407, align 1
  %1409 = zext i8 %1408 to i32
  %1410 = add nsw i32 %1370, %1409
  store i32 %1410, i32* %18, align 4
  br label %1535

; <label>:1411:                                   ; preds = %1283
  %1412 = load i32, i32* %16, align 4
  %1413 = sitofp i32 %1412 to float
  %1414 = load i32, i32* %17, align 4
  %1415 = call i32 @abs(i32 %1414) #9
  %1416 = sitofp i32 %1415 to float
  %1417 = fdiv float %1413, %1416
  store float %1417, float* %25, align 4
  %1418 = load i32, i32* %17, align 4
  %1419 = call i32 @abs(i32 %1418) #9
  %1420 = load i32, i32* %17, align 4
  %1421 = sdiv i32 %1419, %1420
  store i32 %1421, i32* %18, align 4
  %1422 = load i8*, i8** %28, align 8
  %1423 = load i8*, i8** %8, align 8
  %1424 = load i32, i32* %21, align 4
  %1425 = load i32, i32* %18, align 4
  %1426 = add nsw i32 %1424, %1425
  %1427 = load i32, i32* %13, align 4
  %1428 = mul nsw i32 %1426, %1427
  %1429 = load i32, i32* %22, align 4
  %1430 = add nsw i32 %1428, %1429
  %1431 = load float, float* %25, align 4
  %1432 = fcmp olt float %1431, 0.000000e+00
  br i1 %1432, label %1433, label %1438

; <label>:1433:                                   ; preds = %1411
  %1434 = load float, float* %25, align 4
  %1435 = fpext float %1434 to double
  %1436 = fsub double %1435, 5.000000e-01
  %1437 = fptosi double %1436 to i32
  br label %1444

; <label>:1438:                                   ; preds = %1411
  %pgocount63 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 9)
  %1439 = add i64 %pgocount63, 1
  store i64 %1439, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 9)
  %1440 = load float, float* %25, align 4
  %1441 = fpext float %1440 to double
  %1442 = fadd double %1441, 5.000000e-01
  %1443 = fptosi double %1442 to i32
  br label %1444

; <label>:1444:                                   ; preds = %1438, %1433
  %1445 = phi i32 [ %1437, %1433 ], [ %1443, %1438 ]
  %1446 = add nsw i32 %1430, %1445
  %1447 = sext i32 %1446 to i64
  %1448 = getelementptr inbounds i8, i8* %1423, i64 %1447
  %1449 = load i8, i8* %1448, align 1
  %1450 = zext i8 %1449 to i32
  %1451 = sext i32 %1450 to i64
  %1452 = sub i64 0, %1451
  %1453 = getelementptr inbounds i8, i8* %1422, i64 %1452
  %1454 = load i8, i8* %1453, align 1
  %1455 = zext i8 %1454 to i32
  %1456 = load i8*, i8** %28, align 8
  %1457 = load i8*, i8** %8, align 8
  %1458 = load i32, i32* %21, align 4
  %1459 = load i32, i32* %18, align 4
  %1460 = mul nsw i32 2, %1459
  %1461 = add nsw i32 %1458, %1460
  %1462 = load i32, i32* %13, align 4
  %1463 = mul nsw i32 %1461, %1462
  %1464 = load i32, i32* %22, align 4
  %1465 = add nsw i32 %1463, %1464
  %1466 = load float, float* %25, align 4
  %1467 = fmul float 2.000000e+00, %1466
  %1468 = fcmp olt float %1467, 0.000000e+00
  br i1 %1468, label %1469, label %1475

; <label>:1469:                                   ; preds = %1444
  %1470 = load float, float* %25, align 4
  %1471 = fmul float 2.000000e+00, %1470
  %1472 = fpext float %1471 to double
  %1473 = fsub double %1472, 5.000000e-01
  %1474 = fptosi double %1473 to i32
  br label %1482

; <label>:1475:                                   ; preds = %1444
  %pgocount64 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 10)
  %1476 = add i64 %pgocount64, 1
  store i64 %1476, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 10)
  %1477 = load float, float* %25, align 4
  %1478 = fmul float 2.000000e+00, %1477
  %1479 = fpext float %1478 to double
  %1480 = fadd double %1479, 5.000000e-01
  %1481 = fptosi double %1480 to i32
  br label %1482

; <label>:1482:                                   ; preds = %1475, %1469
  %1483 = phi i32 [ %1474, %1469 ], [ %1481, %1475 ]
  %1484 = add nsw i32 %1465, %1483
  %1485 = sext i32 %1484 to i64
  %1486 = getelementptr inbounds i8, i8* %1457, i64 %1485
  %1487 = load i8, i8* %1486, align 1
  %1488 = zext i8 %1487 to i32
  %1489 = sext i32 %1488 to i64
  %1490 = sub i64 0, %1489
  %1491 = getelementptr inbounds i8, i8* %1456, i64 %1490
  %1492 = load i8, i8* %1491, align 1
  %1493 = zext i8 %1492 to i32
  %1494 = add nsw i32 %1455, %1493
  %1495 = load i8*, i8** %28, align 8
  %1496 = load i8*, i8** %8, align 8
  %1497 = load i32, i32* %21, align 4
  %1498 = load i32, i32* %18, align 4
  %1499 = mul nsw i32 3, %1498
  %1500 = add nsw i32 %1497, %1499
  %1501 = load i32, i32* %13, align 4
  %1502 = mul nsw i32 %1500, %1501
  %1503 = load i32, i32* %22, align 4
  %1504 = add nsw i32 %1502, %1503
  %1505 = load float, float* %25, align 4
  %1506 = fmul float 3.000000e+00, %1505
  %1507 = fcmp olt float %1506, 0.000000e+00
  br i1 %1507, label %1508, label %1515

; <label>:1508:                                   ; preds = %1482
  %pgocount65 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 11)
  %1509 = add i64 %pgocount65, 1
  store i64 %1509, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 11)
  %1510 = load float, float* %25, align 4
  %1511 = fmul float 3.000000e+00, %1510
  %1512 = fpext float %1511 to double
  %1513 = fsub double %1512, 5.000000e-01
  %1514 = fptosi double %1513 to i32
  br label %1522

; <label>:1515:                                   ; preds = %1482
  %pgocount66 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 12)
  %1516 = add i64 %pgocount66, 1
  store i64 %1516, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 12)
  %1517 = load float, float* %25, align 4
  %1518 = fmul float 3.000000e+00, %1517
  %1519 = fpext float %1518 to double
  %1520 = fadd double %1519, 5.000000e-01
  %1521 = fptosi double %1520 to i32
  br label %1522

; <label>:1522:                                   ; preds = %1515, %1508
  %1523 = phi i32 [ %1514, %1508 ], [ %1521, %1515 ]
  %1524 = add nsw i32 %1504, %1523
  %1525 = sext i32 %1524 to i64
  %1526 = getelementptr inbounds i8, i8* %1496, i64 %1525
  %1527 = load i8, i8* %1526, align 1
  %1528 = zext i8 %1527 to i32
  %1529 = sext i32 %1528 to i64
  %1530 = sub i64 0, %1529
  %1531 = getelementptr inbounds i8, i8* %1495, i64 %1530
  %1532 = load i8, i8* %1531, align 1
  %1533 = zext i8 %1532 to i32
  %1534 = add nsw i32 %1494, %1533
  store i32 %1534, i32* %18, align 4
  br label %1535

; <label>:1535:                                   ; preds = %1522, %1391
  %1536 = load i32, i32* %18, align 4
  %1537 = icmp sgt i32 %1536, 290
  br i1 %1537, label %1539, label %._crit_edge19

._crit_edge19:                                    ; preds = %1535
  %pgocount67 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 45)
  %1538 = add i64 %pgocount67, 1
  store i64 %1538, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 45)
  br label %1575

; <label>:1539:                                   ; preds = %1535
  %1540 = load i32, i32* %11, align 4
  %1541 = load i32, i32* %15, align 4
  %1542 = sub nsw i32 %1540, %1541
  %1543 = load i32*, i32** %9, align 8
  %1544 = load i32, i32* %21, align 4
  %1545 = load i32, i32* %13, align 4
  %1546 = mul nsw i32 %1544, %1545
  %1547 = load i32, i32* %22, align 4
  %1548 = add nsw i32 %1546, %1547
  %1549 = sext i32 %1548 to i64
  %1550 = getelementptr inbounds i32, i32* %1543, i64 %1549
  store i32 %1542, i32* %1550, align 4
  %1551 = load i32, i32* %16, align 4
  %1552 = mul nsw i32 51, %1551
  %1553 = load i32, i32* %15, align 4
  %1554 = sdiv i32 %1552, %1553
  %1555 = load i32*, i32** %23, align 8
  %1556 = load i32, i32* %21, align 4
  %1557 = load i32, i32* %13, align 4
  %1558 = mul nsw i32 %1556, %1557
  %1559 = load i32, i32* %22, align 4
  %1560 = add nsw i32 %1558, %1559
  %1561 = sext i32 %1560 to i64
  %1562 = getelementptr inbounds i32, i32* %1555, i64 %1561
  store i32 %1554, i32* %1562, align 4
  %1563 = load i32, i32* %17, align 4
  %1564 = mul nsw i32 51, %1563
  %1565 = load i32, i32* %15, align 4
  %1566 = sdiv i32 %1564, %1565
  %1567 = load i32*, i32** %24, align 8
  %1568 = load i32, i32* %21, align 4
  %1569 = load i32, i32* %13, align 4
  %1570 = mul nsw i32 %1568, %1569
  %1571 = load i32, i32* %22, align 4
  %1572 = add nsw i32 %1570, %1571
  %1573 = sext i32 %1572 to i64
  %1574 = getelementptr inbounds i32, i32* %1567, i64 %1573
  store i32 %1566, i32* %1574, align 4
  br label %1575

; <label>:1575:                                   ; preds = %1539, %._crit_edge19
  br label %1576

; <label>:1576:                                   ; preds = %1575, %._crit_edge18
  br label %1577

; <label>:1577:                                   ; preds = %1576, %._crit_edge17
  br label %1578

; <label>:1578:                                   ; preds = %1577, %._crit_edge16
  br label %1579

; <label>:1579:                                   ; preds = %1578, %._crit_edge15
  br label %1580

; <label>:1580:                                   ; preds = %1579, %._crit_edge14
  br label %1581

; <label>:1581:                                   ; preds = %1580, %._crit_edge13
  br label %1582

; <label>:1582:                                   ; preds = %1581, %._crit_edge12
  br label %1583

; <label>:1583:                                   ; preds = %1582, %._crit_edge11
  br label %1584

; <label>:1584:                                   ; preds = %1583, %._crit_edge10
  br label %1585

; <label>:1585:                                   ; preds = %1584, %._crit_edge9
  br label %1586

; <label>:1586:                                   ; preds = %1585, %._crit_edge8
  br label %1587

; <label>:1587:                                   ; preds = %1586, %._crit_edge6
  br label %1588

; <label>:1588:                                   ; preds = %1587, %._crit_edge4
  br label %1589

; <label>:1589:                                   ; preds = %1588, %._crit_edge2
  br label %1590

; <label>:1590:                                   ; preds = %1589, %._crit_edge1
  br label %1591

; <label>:1591:                                   ; preds = %1590, %369
  br label %1592

; <label>:1592:                                   ; preds = %1591, %._crit_edge
  br label %1593

; <label>:1593:                                   ; preds = %1592, %._crit_edge7
  %pgocount68 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 4)
  %1594 = add i64 %pgocount68, 1
  store i64 %1594, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 4)
  br label %1595

; <label>:1595:                                   ; preds = %1593, %._crit_edge5
  br label %1596

; <label>:1596:                                   ; preds = %1595, %._crit_edge3
  br label %1597

; <label>:1597:                                   ; preds = %1596
  %1598 = load i32, i32* %22, align 4
  %1599 = add nsw i32 %1598, 1
  store i32 %1599, i32* %22, align 4
  br label %56

; <label>:1600:                                   ; preds = %56
  br label %1601

; <label>:1601:                                   ; preds = %1600
  %pgocount69 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 21)
  %1602 = add i64 %pgocount69, 1
  store i64 %1602, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 21)
  %1603 = load i32, i32* %21, align 4
  %1604 = add nsw i32 %1603, 1
  store i32 %1604, i32* %21, align 4
  br label %50

; <label>:1605:                                   ; preds = %50
  store i32 0, i32* %15, align 4
  store i32 5, i32* %21, align 4
  br label %1606

; <label>:1606:                                   ; preds = %2415, %1605
  %1607 = load i32, i32* %21, align 4
  %1608 = load i32, i32* %14, align 4
  %1609 = sub nsw i32 %1608, 5
  %1610 = icmp slt i32 %1607, %1609
  br i1 %1610, label %1611, label %2419

; <label>:1611:                                   ; preds = %1606
  store i32 5, i32* %22, align 4
  br label %1612

; <label>:1612:                                   ; preds = %2410, %1611
  %1613 = load i32, i32* %22, align 4
  %1614 = load i32, i32* %13, align 4
  %1615 = sub nsw i32 %1614, 5
  %1616 = icmp slt i32 %1613, %1615
  br i1 %1616, label %1617, label %2414

; <label>:1617:                                   ; preds = %1612
  %1618 = load i32*, i32** %9, align 8
  %1619 = load i32, i32* %21, align 4
  %1620 = load i32, i32* %13, align 4
  %1621 = mul nsw i32 %1619, %1620
  %1622 = load i32, i32* %22, align 4
  %1623 = add nsw i32 %1621, %1622
  %1624 = sext i32 %1623 to i64
  %1625 = getelementptr inbounds i32, i32* %1618, i64 %1624
  %1626 = load i32, i32* %1625, align 4
  store i32 %1626, i32* %16, align 4
  %1627 = load i32, i32* %16, align 4
  %1628 = icmp sgt i32 %1627, 0
  br i1 %1628, label %1629, label %2409

; <label>:1629:                                   ; preds = %1617
  %1630 = load i32, i32* %16, align 4
  %1631 = load i32*, i32** %9, align 8
  %1632 = load i32, i32* %21, align 4
  %1633 = sub nsw i32 %1632, 3
  %1634 = load i32, i32* %13, align 4
  %1635 = mul nsw i32 %1633, %1634
  %1636 = load i32, i32* %22, align 4
  %1637 = add nsw i32 %1635, %1636
  %1638 = sub nsw i32 %1637, 3
  %1639 = sext i32 %1638 to i64
  %1640 = getelementptr inbounds i32, i32* %1631, i64 %1639
  %1641 = load i32, i32* %1640, align 4
  %1642 = icmp sgt i32 %1630, %1641
  br i1 %1642, label %1643, label %2407

; <label>:1643:                                   ; preds = %1629
  %1644 = load i32, i32* %16, align 4
  %1645 = load i32*, i32** %9, align 8
  %1646 = load i32, i32* %21, align 4
  %1647 = sub nsw i32 %1646, 3
  %1648 = load i32, i32* %13, align 4
  %1649 = mul nsw i32 %1647, %1648
  %1650 = load i32, i32* %22, align 4
  %1651 = add nsw i32 %1649, %1650
  %1652 = sub nsw i32 %1651, 2
  %1653 = sext i32 %1652 to i64
  %1654 = getelementptr inbounds i32, i32* %1645, i64 %1653
  %1655 = load i32, i32* %1654, align 4
  %1656 = icmp sgt i32 %1644, %1655
  br i1 %1656, label %1658, label %._crit_edge20

._crit_edge20:                                    ; preds = %1643
  %pgocount70 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 59)
  %1657 = add i64 %pgocount70, 1
  store i64 %1657, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 59)
  br label %2407

; <label>:1658:                                   ; preds = %1643
  %1659 = load i32, i32* %16, align 4
  %1660 = load i32*, i32** %9, align 8
  %1661 = load i32, i32* %21, align 4
  %1662 = sub nsw i32 %1661, 3
  %1663 = load i32, i32* %13, align 4
  %1664 = mul nsw i32 %1662, %1663
  %1665 = load i32, i32* %22, align 4
  %1666 = add nsw i32 %1664, %1665
  %1667 = sub nsw i32 %1666, 1
  %1668 = sext i32 %1667 to i64
  %1669 = getelementptr inbounds i32, i32* %1660, i64 %1668
  %1670 = load i32, i32* %1669, align 4
  %1671 = icmp sgt i32 %1659, %1670
  br i1 %1671, label %1673, label %._crit_edge21

._crit_edge21:                                    ; preds = %1658
  %pgocount71 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 60)
  %1672 = add i64 %pgocount71, 1
  store i64 %1672, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 60)
  br label %2407

; <label>:1673:                                   ; preds = %1658
  %1674 = load i32, i32* %16, align 4
  %1675 = load i32*, i32** %9, align 8
  %1676 = load i32, i32* %21, align 4
  %1677 = sub nsw i32 %1676, 3
  %1678 = load i32, i32* %13, align 4
  %1679 = mul nsw i32 %1677, %1678
  %1680 = load i32, i32* %22, align 4
  %1681 = add nsw i32 %1679, %1680
  %1682 = sext i32 %1681 to i64
  %1683 = getelementptr inbounds i32, i32* %1675, i64 %1682
  %1684 = load i32, i32* %1683, align 4
  %1685 = icmp sgt i32 %1674, %1684
  br i1 %1685, label %1687, label %._crit_edge22

._crit_edge22:                                    ; preds = %1673
  %pgocount72 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 61)
  %1686 = add i64 %pgocount72, 1
  store i64 %1686, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 61)
  br label %2407

; <label>:1687:                                   ; preds = %1673
  %1688 = load i32, i32* %16, align 4
  %1689 = load i32*, i32** %9, align 8
  %1690 = load i32, i32* %21, align 4
  %1691 = sub nsw i32 %1690, 3
  %1692 = load i32, i32* %13, align 4
  %1693 = mul nsw i32 %1691, %1692
  %1694 = load i32, i32* %22, align 4
  %1695 = add nsw i32 %1693, %1694
  %1696 = add nsw i32 %1695, 1
  %1697 = sext i32 %1696 to i64
  %1698 = getelementptr inbounds i32, i32* %1689, i64 %1697
  %1699 = load i32, i32* %1698, align 4
  %1700 = icmp sgt i32 %1688, %1699
  br i1 %1700, label %1702, label %._crit_edge23

._crit_edge23:                                    ; preds = %1687
  %pgocount73 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 62)
  %1701 = add i64 %pgocount73, 1
  store i64 %1701, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 62)
  br label %2407

; <label>:1702:                                   ; preds = %1687
  %1703 = load i32, i32* %16, align 4
  %1704 = load i32*, i32** %9, align 8
  %1705 = load i32, i32* %21, align 4
  %1706 = sub nsw i32 %1705, 3
  %1707 = load i32, i32* %13, align 4
  %1708 = mul nsw i32 %1706, %1707
  %1709 = load i32, i32* %22, align 4
  %1710 = add nsw i32 %1708, %1709
  %1711 = add nsw i32 %1710, 2
  %1712 = sext i32 %1711 to i64
  %1713 = getelementptr inbounds i32, i32* %1704, i64 %1712
  %1714 = load i32, i32* %1713, align 4
  %1715 = icmp sgt i32 %1703, %1714
  br i1 %1715, label %1717, label %._crit_edge24

._crit_edge24:                                    ; preds = %1702
  %pgocount74 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 63)
  %1716 = add i64 %pgocount74, 1
  store i64 %1716, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 63)
  br label %2407

; <label>:1717:                                   ; preds = %1702
  %1718 = load i32, i32* %16, align 4
  %1719 = load i32*, i32** %9, align 8
  %1720 = load i32, i32* %21, align 4
  %1721 = sub nsw i32 %1720, 3
  %1722 = load i32, i32* %13, align 4
  %1723 = mul nsw i32 %1721, %1722
  %1724 = load i32, i32* %22, align 4
  %1725 = add nsw i32 %1723, %1724
  %1726 = add nsw i32 %1725, 3
  %1727 = sext i32 %1726 to i64
  %1728 = getelementptr inbounds i32, i32* %1719, i64 %1727
  %1729 = load i32, i32* %1728, align 4
  %1730 = icmp sgt i32 %1718, %1729
  br i1 %1730, label %1732, label %._crit_edge25

._crit_edge25:                                    ; preds = %1717
  %pgocount75 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 64)
  %1731 = add i64 %pgocount75, 1
  store i64 %1731, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 64)
  br label %2407

; <label>:1732:                                   ; preds = %1717
  %1733 = load i32, i32* %16, align 4
  %1734 = load i32*, i32** %9, align 8
  %1735 = load i32, i32* %21, align 4
  %1736 = sub nsw i32 %1735, 2
  %1737 = load i32, i32* %13, align 4
  %1738 = mul nsw i32 %1736, %1737
  %1739 = load i32, i32* %22, align 4
  %1740 = add nsw i32 %1738, %1739
  %1741 = sub nsw i32 %1740, 3
  %1742 = sext i32 %1741 to i64
  %1743 = getelementptr inbounds i32, i32* %1734, i64 %1742
  %1744 = load i32, i32* %1743, align 4
  %1745 = icmp sgt i32 %1733, %1744
  br i1 %1745, label %1747, label %._crit_edge26

._crit_edge26:                                    ; preds = %1732
  %pgocount76 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 65)
  %1746 = add i64 %pgocount76, 1
  store i64 %1746, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 65)
  br label %2407

; <label>:1747:                                   ; preds = %1732
  %1748 = load i32, i32* %16, align 4
  %1749 = load i32*, i32** %9, align 8
  %1750 = load i32, i32* %21, align 4
  %1751 = sub nsw i32 %1750, 2
  %1752 = load i32, i32* %13, align 4
  %1753 = mul nsw i32 %1751, %1752
  %1754 = load i32, i32* %22, align 4
  %1755 = add nsw i32 %1753, %1754
  %1756 = sub nsw i32 %1755, 2
  %1757 = sext i32 %1756 to i64
  %1758 = getelementptr inbounds i32, i32* %1749, i64 %1757
  %1759 = load i32, i32* %1758, align 4
  %1760 = icmp sgt i32 %1748, %1759
  br i1 %1760, label %1762, label %._crit_edge27

._crit_edge27:                                    ; preds = %1747
  %pgocount77 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 66)
  %1761 = add i64 %pgocount77, 1
  store i64 %1761, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 66)
  br label %2407

; <label>:1762:                                   ; preds = %1747
  %1763 = load i32, i32* %16, align 4
  %1764 = load i32*, i32** %9, align 8
  %1765 = load i32, i32* %21, align 4
  %1766 = sub nsw i32 %1765, 2
  %1767 = load i32, i32* %13, align 4
  %1768 = mul nsw i32 %1766, %1767
  %1769 = load i32, i32* %22, align 4
  %1770 = add nsw i32 %1768, %1769
  %1771 = sub nsw i32 %1770, 1
  %1772 = sext i32 %1771 to i64
  %1773 = getelementptr inbounds i32, i32* %1764, i64 %1772
  %1774 = load i32, i32* %1773, align 4
  %1775 = icmp sgt i32 %1763, %1774
  br i1 %1775, label %1777, label %._crit_edge28

._crit_edge28:                                    ; preds = %1762
  %pgocount78 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 67)
  %1776 = add i64 %pgocount78, 1
  store i64 %1776, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 67)
  br label %2407

; <label>:1777:                                   ; preds = %1762
  %1778 = load i32, i32* %16, align 4
  %1779 = load i32*, i32** %9, align 8
  %1780 = load i32, i32* %21, align 4
  %1781 = sub nsw i32 %1780, 2
  %1782 = load i32, i32* %13, align 4
  %1783 = mul nsw i32 %1781, %1782
  %1784 = load i32, i32* %22, align 4
  %1785 = add nsw i32 %1783, %1784
  %1786 = sext i32 %1785 to i64
  %1787 = getelementptr inbounds i32, i32* %1779, i64 %1786
  %1788 = load i32, i32* %1787, align 4
  %1789 = icmp sgt i32 %1778, %1788
  br i1 %1789, label %1791, label %._crit_edge29

._crit_edge29:                                    ; preds = %1777
  %pgocount79 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 68)
  %1790 = add i64 %pgocount79, 1
  store i64 %1790, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 68)
  br label %2407

; <label>:1791:                                   ; preds = %1777
  %1792 = load i32, i32* %16, align 4
  %1793 = load i32*, i32** %9, align 8
  %1794 = load i32, i32* %21, align 4
  %1795 = sub nsw i32 %1794, 2
  %1796 = load i32, i32* %13, align 4
  %1797 = mul nsw i32 %1795, %1796
  %1798 = load i32, i32* %22, align 4
  %1799 = add nsw i32 %1797, %1798
  %1800 = add nsw i32 %1799, 1
  %1801 = sext i32 %1800 to i64
  %1802 = getelementptr inbounds i32, i32* %1793, i64 %1801
  %1803 = load i32, i32* %1802, align 4
  %1804 = icmp sgt i32 %1792, %1803
  br i1 %1804, label %1806, label %._crit_edge30

._crit_edge30:                                    ; preds = %1791
  %pgocount80 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 69)
  %1805 = add i64 %pgocount80, 1
  store i64 %1805, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 69)
  br label %2407

; <label>:1806:                                   ; preds = %1791
  %1807 = load i32, i32* %16, align 4
  %1808 = load i32*, i32** %9, align 8
  %1809 = load i32, i32* %21, align 4
  %1810 = sub nsw i32 %1809, 2
  %1811 = load i32, i32* %13, align 4
  %1812 = mul nsw i32 %1810, %1811
  %1813 = load i32, i32* %22, align 4
  %1814 = add nsw i32 %1812, %1813
  %1815 = add nsw i32 %1814, 2
  %1816 = sext i32 %1815 to i64
  %1817 = getelementptr inbounds i32, i32* %1808, i64 %1816
  %1818 = load i32, i32* %1817, align 4
  %1819 = icmp sgt i32 %1807, %1818
  br i1 %1819, label %1821, label %._crit_edge31

._crit_edge31:                                    ; preds = %1806
  %pgocount81 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 70)
  %1820 = add i64 %pgocount81, 1
  store i64 %1820, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 70)
  br label %2407

; <label>:1821:                                   ; preds = %1806
  %1822 = load i32, i32* %16, align 4
  %1823 = load i32*, i32** %9, align 8
  %1824 = load i32, i32* %21, align 4
  %1825 = sub nsw i32 %1824, 2
  %1826 = load i32, i32* %13, align 4
  %1827 = mul nsw i32 %1825, %1826
  %1828 = load i32, i32* %22, align 4
  %1829 = add nsw i32 %1827, %1828
  %1830 = add nsw i32 %1829, 3
  %1831 = sext i32 %1830 to i64
  %1832 = getelementptr inbounds i32, i32* %1823, i64 %1831
  %1833 = load i32, i32* %1832, align 4
  %1834 = icmp sgt i32 %1822, %1833
  br i1 %1834, label %1836, label %._crit_edge32

._crit_edge32:                                    ; preds = %1821
  %pgocount82 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 71)
  %1835 = add i64 %pgocount82, 1
  store i64 %1835, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 71)
  br label %2407

; <label>:1836:                                   ; preds = %1821
  %1837 = load i32, i32* %16, align 4
  %1838 = load i32*, i32** %9, align 8
  %1839 = load i32, i32* %21, align 4
  %1840 = sub nsw i32 %1839, 1
  %1841 = load i32, i32* %13, align 4
  %1842 = mul nsw i32 %1840, %1841
  %1843 = load i32, i32* %22, align 4
  %1844 = add nsw i32 %1842, %1843
  %1845 = sub nsw i32 %1844, 3
  %1846 = sext i32 %1845 to i64
  %1847 = getelementptr inbounds i32, i32* %1838, i64 %1846
  %1848 = load i32, i32* %1847, align 4
  %1849 = icmp sgt i32 %1837, %1848
  br i1 %1849, label %1851, label %._crit_edge33

._crit_edge33:                                    ; preds = %1836
  %pgocount83 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 72)
  %1850 = add i64 %pgocount83, 1
  store i64 %1850, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 72)
  br label %2407

; <label>:1851:                                   ; preds = %1836
  %1852 = load i32, i32* %16, align 4
  %1853 = load i32*, i32** %9, align 8
  %1854 = load i32, i32* %21, align 4
  %1855 = sub nsw i32 %1854, 1
  %1856 = load i32, i32* %13, align 4
  %1857 = mul nsw i32 %1855, %1856
  %1858 = load i32, i32* %22, align 4
  %1859 = add nsw i32 %1857, %1858
  %1860 = sub nsw i32 %1859, 2
  %1861 = sext i32 %1860 to i64
  %1862 = getelementptr inbounds i32, i32* %1853, i64 %1861
  %1863 = load i32, i32* %1862, align 4
  %1864 = icmp sgt i32 %1852, %1863
  br i1 %1864, label %1866, label %._crit_edge34

._crit_edge34:                                    ; preds = %1851
  %pgocount84 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 73)
  %1865 = add i64 %pgocount84, 1
  store i64 %1865, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 73)
  br label %2407

; <label>:1866:                                   ; preds = %1851
  %1867 = load i32, i32* %16, align 4
  %1868 = load i32*, i32** %9, align 8
  %1869 = load i32, i32* %21, align 4
  %1870 = sub nsw i32 %1869, 1
  %1871 = load i32, i32* %13, align 4
  %1872 = mul nsw i32 %1870, %1871
  %1873 = load i32, i32* %22, align 4
  %1874 = add nsw i32 %1872, %1873
  %1875 = sub nsw i32 %1874, 1
  %1876 = sext i32 %1875 to i64
  %1877 = getelementptr inbounds i32, i32* %1868, i64 %1876
  %1878 = load i32, i32* %1877, align 4
  %1879 = icmp sgt i32 %1867, %1878
  br i1 %1879, label %1881, label %._crit_edge35

._crit_edge35:                                    ; preds = %1866
  %pgocount85 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 74)
  %1880 = add i64 %pgocount85, 1
  store i64 %1880, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 74)
  br label %2407

; <label>:1881:                                   ; preds = %1866
  %1882 = load i32, i32* %16, align 4
  %1883 = load i32*, i32** %9, align 8
  %1884 = load i32, i32* %21, align 4
  %1885 = sub nsw i32 %1884, 1
  %1886 = load i32, i32* %13, align 4
  %1887 = mul nsw i32 %1885, %1886
  %1888 = load i32, i32* %22, align 4
  %1889 = add nsw i32 %1887, %1888
  %1890 = sext i32 %1889 to i64
  %1891 = getelementptr inbounds i32, i32* %1883, i64 %1890
  %1892 = load i32, i32* %1891, align 4
  %1893 = icmp sgt i32 %1882, %1892
  br i1 %1893, label %1895, label %._crit_edge36

._crit_edge36:                                    ; preds = %1881
  %pgocount86 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 75)
  %1894 = add i64 %pgocount86, 1
  store i64 %1894, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 75)
  br label %2407

; <label>:1895:                                   ; preds = %1881
  %1896 = load i32, i32* %16, align 4
  %1897 = load i32*, i32** %9, align 8
  %1898 = load i32, i32* %21, align 4
  %1899 = sub nsw i32 %1898, 1
  %1900 = load i32, i32* %13, align 4
  %1901 = mul nsw i32 %1899, %1900
  %1902 = load i32, i32* %22, align 4
  %1903 = add nsw i32 %1901, %1902
  %1904 = add nsw i32 %1903, 1
  %1905 = sext i32 %1904 to i64
  %1906 = getelementptr inbounds i32, i32* %1897, i64 %1905
  %1907 = load i32, i32* %1906, align 4
  %1908 = icmp sgt i32 %1896, %1907
  br i1 %1908, label %1910, label %._crit_edge37

._crit_edge37:                                    ; preds = %1895
  %pgocount87 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 77)
  %1909 = add i64 %pgocount87, 1
  store i64 %1909, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 77)
  br label %2407

; <label>:1910:                                   ; preds = %1895
  %pgocount88 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 76)
  %1911 = add i64 %pgocount88, 1
  store i64 %1911, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 76)
  %1912 = load i32, i32* %16, align 4
  %1913 = load i32*, i32** %9, align 8
  %1914 = load i32, i32* %21, align 4
  %1915 = sub nsw i32 %1914, 1
  %1916 = load i32, i32* %13, align 4
  %1917 = mul nsw i32 %1915, %1916
  %1918 = load i32, i32* %22, align 4
  %1919 = add nsw i32 %1917, %1918
  %1920 = add nsw i32 %1919, 2
  %1921 = sext i32 %1920 to i64
  %1922 = getelementptr inbounds i32, i32* %1913, i64 %1921
  %1923 = load i32, i32* %1922, align 4
  %1924 = icmp sgt i32 %1912, %1923
  br i1 %1924, label %1926, label %._crit_edge38

._crit_edge38:                                    ; preds = %1910
  %pgocount89 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 78)
  %1925 = add i64 %pgocount89, 1
  store i64 %1925, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 78)
  br label %2407

; <label>:1926:                                   ; preds = %1910
  %1927 = load i32, i32* %16, align 4
  %1928 = load i32*, i32** %9, align 8
  %1929 = load i32, i32* %21, align 4
  %1930 = sub nsw i32 %1929, 1
  %1931 = load i32, i32* %13, align 4
  %1932 = mul nsw i32 %1930, %1931
  %1933 = load i32, i32* %22, align 4
  %1934 = add nsw i32 %1932, %1933
  %1935 = add nsw i32 %1934, 3
  %1936 = sext i32 %1935 to i64
  %1937 = getelementptr inbounds i32, i32* %1928, i64 %1936
  %1938 = load i32, i32* %1937, align 4
  %1939 = icmp sgt i32 %1927, %1938
  br i1 %1939, label %1941, label %._crit_edge39

._crit_edge39:                                    ; preds = %1926
  %pgocount90 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 79)
  %1940 = add i64 %pgocount90, 1
  store i64 %1940, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 79)
  br label %2407

; <label>:1941:                                   ; preds = %1926
  %1942 = load i32, i32* %16, align 4
  %1943 = load i32*, i32** %9, align 8
  %1944 = load i32, i32* %21, align 4
  %1945 = load i32, i32* %13, align 4
  %1946 = mul nsw i32 %1944, %1945
  %1947 = load i32, i32* %22, align 4
  %1948 = add nsw i32 %1946, %1947
  %1949 = sub nsw i32 %1948, 3
  %1950 = sext i32 %1949 to i64
  %1951 = getelementptr inbounds i32, i32* %1943, i64 %1950
  %1952 = load i32, i32* %1951, align 4
  %1953 = icmp sgt i32 %1942, %1952
  br i1 %1953, label %1955, label %._crit_edge40

._crit_edge40:                                    ; preds = %1941
  %pgocount91 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 80)
  %1954 = add i64 %pgocount91, 1
  store i64 %1954, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 80)
  br label %2407

; <label>:1955:                                   ; preds = %1941
  %1956 = load i32, i32* %16, align 4
  %1957 = load i32*, i32** %9, align 8
  %1958 = load i32, i32* %21, align 4
  %1959 = load i32, i32* %13, align 4
  %1960 = mul nsw i32 %1958, %1959
  %1961 = load i32, i32* %22, align 4
  %1962 = add nsw i32 %1960, %1961
  %1963 = sub nsw i32 %1962, 2
  %1964 = sext i32 %1963 to i64
  %1965 = getelementptr inbounds i32, i32* %1957, i64 %1964
  %1966 = load i32, i32* %1965, align 4
  %1967 = icmp sgt i32 %1956, %1966
  br i1 %1967, label %1968, label %2407

; <label>:1968:                                   ; preds = %1955
  %pgocount92 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 16)
  %1969 = add i64 %pgocount92, 1
  store i64 %1969, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 16)
  %1970 = load i32, i32* %16, align 4
  %1971 = load i32*, i32** %9, align 8
  %1972 = load i32, i32* %21, align 4
  %1973 = load i32, i32* %13, align 4
  %1974 = mul nsw i32 %1972, %1973
  %1975 = load i32, i32* %22, align 4
  %1976 = add nsw i32 %1974, %1975
  %1977 = sub nsw i32 %1976, 1
  %1978 = sext i32 %1977 to i64
  %1979 = getelementptr inbounds i32, i32* %1971, i64 %1978
  %1980 = load i32, i32* %1979, align 4
  %1981 = icmp sgt i32 %1970, %1980
  br i1 %1981, label %1982, label %2407

; <label>:1982:                                   ; preds = %1968
  %pgocount93 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 19)
  %1983 = add i64 %pgocount93, 1
  store i64 %1983, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 19)
  %1984 = load i32, i32* %16, align 4
  %1985 = load i32*, i32** %9, align 8
  %1986 = load i32, i32* %21, align 4
  %1987 = load i32, i32* %13, align 4
  %1988 = mul nsw i32 %1986, %1987
  %1989 = load i32, i32* %22, align 4
  %1990 = add nsw i32 %1988, %1989
  %1991 = add nsw i32 %1990, 1
  %1992 = sext i32 %1991 to i64
  %1993 = getelementptr inbounds i32, i32* %1985, i64 %1992
  %1994 = load i32, i32* %1993, align 4
  %1995 = icmp sge i32 %1984, %1994
  br i1 %1995, label %1996, label %2407

; <label>:1996:                                   ; preds = %1982
  %pgocount94 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 24)
  %1997 = add i64 %pgocount94, 1
  store i64 %1997, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 24)
  %1998 = load i32, i32* %16, align 4
  %1999 = load i32*, i32** %9, align 8
  %2000 = load i32, i32* %21, align 4
  %2001 = load i32, i32* %13, align 4
  %2002 = mul nsw i32 %2000, %2001
  %2003 = load i32, i32* %22, align 4
  %2004 = add nsw i32 %2002, %2003
  %2005 = add nsw i32 %2004, 2
  %2006 = sext i32 %2005 to i64
  %2007 = getelementptr inbounds i32, i32* %1999, i64 %2006
  %2008 = load i32, i32* %2007, align 4
  %2009 = icmp sge i32 %1998, %2008
  br i1 %2009, label %2010, label %2407

; <label>:2010:                                   ; preds = %1996
  %pgocount95 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 26)
  %2011 = add i64 %pgocount95, 1
  store i64 %2011, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 26)
  %2012 = load i32, i32* %16, align 4
  %2013 = load i32*, i32** %9, align 8
  %2014 = load i32, i32* %21, align 4
  %2015 = load i32, i32* %13, align 4
  %2016 = mul nsw i32 %2014, %2015
  %2017 = load i32, i32* %22, align 4
  %2018 = add nsw i32 %2016, %2017
  %2019 = add nsw i32 %2018, 3
  %2020 = sext i32 %2019 to i64
  %2021 = getelementptr inbounds i32, i32* %2013, i64 %2020
  %2022 = load i32, i32* %2021, align 4
  %2023 = icmp sge i32 %2012, %2022
  br i1 %2023, label %2024, label %2407

; <label>:2024:                                   ; preds = %2010
  %pgocount96 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 28)
  %2025 = add i64 %pgocount96, 1
  store i64 %2025, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 28)
  %2026 = load i32, i32* %16, align 4
  %2027 = load i32*, i32** %9, align 8
  %2028 = load i32, i32* %21, align 4
  %2029 = add nsw i32 %2028, 1
  %2030 = load i32, i32* %13, align 4
  %2031 = mul nsw i32 %2029, %2030
  %2032 = load i32, i32* %22, align 4
  %2033 = add nsw i32 %2031, %2032
  %2034 = sub nsw i32 %2033, 3
  %2035 = sext i32 %2034 to i64
  %2036 = getelementptr inbounds i32, i32* %2027, i64 %2035
  %2037 = load i32, i32* %2036, align 4
  %2038 = icmp sge i32 %2026, %2037
  br i1 %2038, label %2039, label %2407

; <label>:2039:                                   ; preds = %2024
  %pgocount97 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 30)
  %2040 = add i64 %pgocount97, 1
  store i64 %2040, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 30)
  %2041 = load i32, i32* %16, align 4
  %2042 = load i32*, i32** %9, align 8
  %2043 = load i32, i32* %21, align 4
  %2044 = add nsw i32 %2043, 1
  %2045 = load i32, i32* %13, align 4
  %2046 = mul nsw i32 %2044, %2045
  %2047 = load i32, i32* %22, align 4
  %2048 = add nsw i32 %2046, %2047
  %2049 = sub nsw i32 %2048, 2
  %2050 = sext i32 %2049 to i64
  %2051 = getelementptr inbounds i32, i32* %2042, i64 %2050
  %2052 = load i32, i32* %2051, align 4
  %2053 = icmp sge i32 %2041, %2052
  br i1 %2053, label %2054, label %2407

; <label>:2054:                                   ; preds = %2039
  %pgocount98 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 32)
  %2055 = add i64 %pgocount98, 1
  store i64 %2055, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 32)
  %2056 = load i32, i32* %16, align 4
  %2057 = load i32*, i32** %9, align 8
  %2058 = load i32, i32* %21, align 4
  %2059 = add nsw i32 %2058, 1
  %2060 = load i32, i32* %13, align 4
  %2061 = mul nsw i32 %2059, %2060
  %2062 = load i32, i32* %22, align 4
  %2063 = add nsw i32 %2061, %2062
  %2064 = sub nsw i32 %2063, 1
  %2065 = sext i32 %2064 to i64
  %2066 = getelementptr inbounds i32, i32* %2057, i64 %2065
  %2067 = load i32, i32* %2066, align 4
  %2068 = icmp sge i32 %2056, %2067
  br i1 %2068, label %2069, label %2407

; <label>:2069:                                   ; preds = %2054
  %pgocount99 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 34)
  %2070 = add i64 %pgocount99, 1
  store i64 %2070, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 34)
  %2071 = load i32, i32* %16, align 4
  %2072 = load i32*, i32** %9, align 8
  %2073 = load i32, i32* %21, align 4
  %2074 = add nsw i32 %2073, 1
  %2075 = load i32, i32* %13, align 4
  %2076 = mul nsw i32 %2074, %2075
  %2077 = load i32, i32* %22, align 4
  %2078 = add nsw i32 %2076, %2077
  %2079 = sext i32 %2078 to i64
  %2080 = getelementptr inbounds i32, i32* %2072, i64 %2079
  %2081 = load i32, i32* %2080, align 4
  %2082 = icmp sge i32 %2071, %2081
  br i1 %2082, label %2083, label %2407

; <label>:2083:                                   ; preds = %2069
  %pgocount100 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 36)
  %2084 = add i64 %pgocount100, 1
  store i64 %2084, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 36)
  %2085 = load i32, i32* %16, align 4
  %2086 = load i32*, i32** %9, align 8
  %2087 = load i32, i32* %21, align 4
  %2088 = add nsw i32 %2087, 1
  %2089 = load i32, i32* %13, align 4
  %2090 = mul nsw i32 %2088, %2089
  %2091 = load i32, i32* %22, align 4
  %2092 = add nsw i32 %2090, %2091
  %2093 = add nsw i32 %2092, 1
  %2094 = sext i32 %2093 to i64
  %2095 = getelementptr inbounds i32, i32* %2086, i64 %2094
  %2096 = load i32, i32* %2095, align 4
  %2097 = icmp sge i32 %2085, %2096
  br i1 %2097, label %2098, label %2407

; <label>:2098:                                   ; preds = %2083
  %pgocount101 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 38)
  %2099 = add i64 %pgocount101, 1
  store i64 %2099, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 38)
  %2100 = load i32, i32* %16, align 4
  %2101 = load i32*, i32** %9, align 8
  %2102 = load i32, i32* %21, align 4
  %2103 = add nsw i32 %2102, 1
  %2104 = load i32, i32* %13, align 4
  %2105 = mul nsw i32 %2103, %2104
  %2106 = load i32, i32* %22, align 4
  %2107 = add nsw i32 %2105, %2106
  %2108 = add nsw i32 %2107, 2
  %2109 = sext i32 %2108 to i64
  %2110 = getelementptr inbounds i32, i32* %2101, i64 %2109
  %2111 = load i32, i32* %2110, align 4
  %2112 = icmp sge i32 %2100, %2111
  br i1 %2112, label %2113, label %2407

; <label>:2113:                                   ; preds = %2098
  %pgocount102 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 40)
  %2114 = add i64 %pgocount102, 1
  store i64 %2114, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 40)
  %2115 = load i32, i32* %16, align 4
  %2116 = load i32*, i32** %9, align 8
  %2117 = load i32, i32* %21, align 4
  %2118 = add nsw i32 %2117, 1
  %2119 = load i32, i32* %13, align 4
  %2120 = mul nsw i32 %2118, %2119
  %2121 = load i32, i32* %22, align 4
  %2122 = add nsw i32 %2120, %2121
  %2123 = add nsw i32 %2122, 3
  %2124 = sext i32 %2123 to i64
  %2125 = getelementptr inbounds i32, i32* %2116, i64 %2124
  %2126 = load i32, i32* %2125, align 4
  %2127 = icmp sge i32 %2115, %2126
  br i1 %2127, label %2128, label %2407

; <label>:2128:                                   ; preds = %2113
  %pgocount103 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 42)
  %2129 = add i64 %pgocount103, 1
  store i64 %2129, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 42)
  %2130 = load i32, i32* %16, align 4
  %2131 = load i32*, i32** %9, align 8
  %2132 = load i32, i32* %21, align 4
  %2133 = add nsw i32 %2132, 2
  %2134 = load i32, i32* %13, align 4
  %2135 = mul nsw i32 %2133, %2134
  %2136 = load i32, i32* %22, align 4
  %2137 = add nsw i32 %2135, %2136
  %2138 = sub nsw i32 %2137, 3
  %2139 = sext i32 %2138 to i64
  %2140 = getelementptr inbounds i32, i32* %2131, i64 %2139
  %2141 = load i32, i32* %2140, align 4
  %2142 = icmp sge i32 %2130, %2141
  br i1 %2142, label %2143, label %2407

; <label>:2143:                                   ; preds = %2128
  %pgocount104 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 44)
  %2144 = add i64 %pgocount104, 1
  store i64 %2144, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 44)
  %2145 = load i32, i32* %16, align 4
  %2146 = load i32*, i32** %9, align 8
  %2147 = load i32, i32* %21, align 4
  %2148 = add nsw i32 %2147, 2
  %2149 = load i32, i32* %13, align 4
  %2150 = mul nsw i32 %2148, %2149
  %2151 = load i32, i32* %22, align 4
  %2152 = add nsw i32 %2150, %2151
  %2153 = sub nsw i32 %2152, 2
  %2154 = sext i32 %2153 to i64
  %2155 = getelementptr inbounds i32, i32* %2146, i64 %2154
  %2156 = load i32, i32* %2155, align 4
  %2157 = icmp sge i32 %2145, %2156
  br i1 %2157, label %2158, label %2407

; <label>:2158:                                   ; preds = %2143
  %pgocount105 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 46)
  %2159 = add i64 %pgocount105, 1
  store i64 %2159, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 46)
  %2160 = load i32, i32* %16, align 4
  %2161 = load i32*, i32** %9, align 8
  %2162 = load i32, i32* %21, align 4
  %2163 = add nsw i32 %2162, 2
  %2164 = load i32, i32* %13, align 4
  %2165 = mul nsw i32 %2163, %2164
  %2166 = load i32, i32* %22, align 4
  %2167 = add nsw i32 %2165, %2166
  %2168 = sub nsw i32 %2167, 1
  %2169 = sext i32 %2168 to i64
  %2170 = getelementptr inbounds i32, i32* %2161, i64 %2169
  %2171 = load i32, i32* %2170, align 4
  %2172 = icmp sge i32 %2160, %2171
  br i1 %2172, label %2173, label %2407

; <label>:2173:                                   ; preds = %2158
  %pgocount106 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 47)
  %2174 = add i64 %pgocount106, 1
  store i64 %2174, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 47)
  %2175 = load i32, i32* %16, align 4
  %2176 = load i32*, i32** %9, align 8
  %2177 = load i32, i32* %21, align 4
  %2178 = add nsw i32 %2177, 2
  %2179 = load i32, i32* %13, align 4
  %2180 = mul nsw i32 %2178, %2179
  %2181 = load i32, i32* %22, align 4
  %2182 = add nsw i32 %2180, %2181
  %2183 = sext i32 %2182 to i64
  %2184 = getelementptr inbounds i32, i32* %2176, i64 %2183
  %2185 = load i32, i32* %2184, align 4
  %2186 = icmp sge i32 %2175, %2185
  br i1 %2186, label %2187, label %2407

; <label>:2187:                                   ; preds = %2173
  %pgocount107 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 48)
  %2188 = add i64 %pgocount107, 1
  store i64 %2188, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 48)
  %2189 = load i32, i32* %16, align 4
  %2190 = load i32*, i32** %9, align 8
  %2191 = load i32, i32* %21, align 4
  %2192 = add nsw i32 %2191, 2
  %2193 = load i32, i32* %13, align 4
  %2194 = mul nsw i32 %2192, %2193
  %2195 = load i32, i32* %22, align 4
  %2196 = add nsw i32 %2194, %2195
  %2197 = add nsw i32 %2196, 1
  %2198 = sext i32 %2197 to i64
  %2199 = getelementptr inbounds i32, i32* %2190, i64 %2198
  %2200 = load i32, i32* %2199, align 4
  %2201 = icmp sge i32 %2189, %2200
  br i1 %2201, label %2202, label %2407

; <label>:2202:                                   ; preds = %2187
  %pgocount108 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 49)
  %2203 = add i64 %pgocount108, 1
  store i64 %2203, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 49)
  %2204 = load i32, i32* %16, align 4
  %2205 = load i32*, i32** %9, align 8
  %2206 = load i32, i32* %21, align 4
  %2207 = add nsw i32 %2206, 2
  %2208 = load i32, i32* %13, align 4
  %2209 = mul nsw i32 %2207, %2208
  %2210 = load i32, i32* %22, align 4
  %2211 = add nsw i32 %2209, %2210
  %2212 = add nsw i32 %2211, 2
  %2213 = sext i32 %2212 to i64
  %2214 = getelementptr inbounds i32, i32* %2205, i64 %2213
  %2215 = load i32, i32* %2214, align 4
  %2216 = icmp sge i32 %2204, %2215
  br i1 %2216, label %2217, label %2407

; <label>:2217:                                   ; preds = %2202
  %pgocount109 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 50)
  %2218 = add i64 %pgocount109, 1
  store i64 %2218, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 50)
  %2219 = load i32, i32* %16, align 4
  %2220 = load i32*, i32** %9, align 8
  %2221 = load i32, i32* %21, align 4
  %2222 = add nsw i32 %2221, 2
  %2223 = load i32, i32* %13, align 4
  %2224 = mul nsw i32 %2222, %2223
  %2225 = load i32, i32* %22, align 4
  %2226 = add nsw i32 %2224, %2225
  %2227 = add nsw i32 %2226, 3
  %2228 = sext i32 %2227 to i64
  %2229 = getelementptr inbounds i32, i32* %2220, i64 %2228
  %2230 = load i32, i32* %2229, align 4
  %2231 = icmp sge i32 %2219, %2230
  br i1 %2231, label %2232, label %2407

; <label>:2232:                                   ; preds = %2217
  %pgocount110 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 51)
  %2233 = add i64 %pgocount110, 1
  store i64 %2233, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 51)
  %2234 = load i32, i32* %16, align 4
  %2235 = load i32*, i32** %9, align 8
  %2236 = load i32, i32* %21, align 4
  %2237 = add nsw i32 %2236, 3
  %2238 = load i32, i32* %13, align 4
  %2239 = mul nsw i32 %2237, %2238
  %2240 = load i32, i32* %22, align 4
  %2241 = add nsw i32 %2239, %2240
  %2242 = sub nsw i32 %2241, 3
  %2243 = sext i32 %2242 to i64
  %2244 = getelementptr inbounds i32, i32* %2235, i64 %2243
  %2245 = load i32, i32* %2244, align 4
  %2246 = icmp sge i32 %2234, %2245
  br i1 %2246, label %2247, label %2407

; <label>:2247:                                   ; preds = %2232
  %pgocount111 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 52)
  %2248 = add i64 %pgocount111, 1
  store i64 %2248, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 52)
  %2249 = load i32, i32* %16, align 4
  %2250 = load i32*, i32** %9, align 8
  %2251 = load i32, i32* %21, align 4
  %2252 = add nsw i32 %2251, 3
  %2253 = load i32, i32* %13, align 4
  %2254 = mul nsw i32 %2252, %2253
  %2255 = load i32, i32* %22, align 4
  %2256 = add nsw i32 %2254, %2255
  %2257 = sub nsw i32 %2256, 2
  %2258 = sext i32 %2257 to i64
  %2259 = getelementptr inbounds i32, i32* %2250, i64 %2258
  %2260 = load i32, i32* %2259, align 4
  %2261 = icmp sge i32 %2249, %2260
  br i1 %2261, label %2262, label %2407

; <label>:2262:                                   ; preds = %2247
  %pgocount112 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 53)
  %2263 = add i64 %pgocount112, 1
  store i64 %2263, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 53)
  %2264 = load i32, i32* %16, align 4
  %2265 = load i32*, i32** %9, align 8
  %2266 = load i32, i32* %21, align 4
  %2267 = add nsw i32 %2266, 3
  %2268 = load i32, i32* %13, align 4
  %2269 = mul nsw i32 %2267, %2268
  %2270 = load i32, i32* %22, align 4
  %2271 = add nsw i32 %2269, %2270
  %2272 = sub nsw i32 %2271, 1
  %2273 = sext i32 %2272 to i64
  %2274 = getelementptr inbounds i32, i32* %2265, i64 %2273
  %2275 = load i32, i32* %2274, align 4
  %2276 = icmp sge i32 %2264, %2275
  br i1 %2276, label %2277, label %2407

; <label>:2277:                                   ; preds = %2262
  %pgocount113 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 54)
  %2278 = add i64 %pgocount113, 1
  store i64 %2278, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 54)
  %2279 = load i32, i32* %16, align 4
  %2280 = load i32*, i32** %9, align 8
  %2281 = load i32, i32* %21, align 4
  %2282 = add nsw i32 %2281, 3
  %2283 = load i32, i32* %13, align 4
  %2284 = mul nsw i32 %2282, %2283
  %2285 = load i32, i32* %22, align 4
  %2286 = add nsw i32 %2284, %2285
  %2287 = sext i32 %2286 to i64
  %2288 = getelementptr inbounds i32, i32* %2280, i64 %2287
  %2289 = load i32, i32* %2288, align 4
  %2290 = icmp sge i32 %2279, %2289
  br i1 %2290, label %2291, label %2407

; <label>:2291:                                   ; preds = %2277
  %pgocount114 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 55)
  %2292 = add i64 %pgocount114, 1
  store i64 %2292, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 55)
  %2293 = load i32, i32* %16, align 4
  %2294 = load i32*, i32** %9, align 8
  %2295 = load i32, i32* %21, align 4
  %2296 = add nsw i32 %2295, 3
  %2297 = load i32, i32* %13, align 4
  %2298 = mul nsw i32 %2296, %2297
  %2299 = load i32, i32* %22, align 4
  %2300 = add nsw i32 %2298, %2299
  %2301 = add nsw i32 %2300, 1
  %2302 = sext i32 %2301 to i64
  %2303 = getelementptr inbounds i32, i32* %2294, i64 %2302
  %2304 = load i32, i32* %2303, align 4
  %2305 = icmp sge i32 %2293, %2304
  br i1 %2305, label %2306, label %2407

; <label>:2306:                                   ; preds = %2291
  %pgocount115 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 56)
  %2307 = add i64 %pgocount115, 1
  store i64 %2307, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 56)
  %2308 = load i32, i32* %16, align 4
  %2309 = load i32*, i32** %9, align 8
  %2310 = load i32, i32* %21, align 4
  %2311 = add nsw i32 %2310, 3
  %2312 = load i32, i32* %13, align 4
  %2313 = mul nsw i32 %2311, %2312
  %2314 = load i32, i32* %22, align 4
  %2315 = add nsw i32 %2313, %2314
  %2316 = add nsw i32 %2315, 2
  %2317 = sext i32 %2316 to i64
  %2318 = getelementptr inbounds i32, i32* %2309, i64 %2317
  %2319 = load i32, i32* %2318, align 4
  %2320 = icmp sge i32 %2308, %2319
  br i1 %2320, label %2321, label %2407

; <label>:2321:                                   ; preds = %2306
  %pgocount116 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 57)
  %2322 = add i64 %pgocount116, 1
  store i64 %2322, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 57)
  %2323 = load i32, i32* %16, align 4
  %2324 = load i32*, i32** %9, align 8
  %2325 = load i32, i32* %21, align 4
  %2326 = add nsw i32 %2325, 3
  %2327 = load i32, i32* %13, align 4
  %2328 = mul nsw i32 %2326, %2327
  %2329 = load i32, i32* %22, align 4
  %2330 = add nsw i32 %2328, %2329
  %2331 = add nsw i32 %2330, 3
  %2332 = sext i32 %2331 to i64
  %2333 = getelementptr inbounds i32, i32* %2324, i64 %2332
  %2334 = load i32, i32* %2333, align 4
  %2335 = icmp sge i32 %2323, %2334
  br i1 %2335, label %2336, label %2407

; <label>:2336:                                   ; preds = %2321
  %2337 = load %struct.anon*, %struct.anon** %12, align 8
  %2338 = load i32, i32* %15, align 4
  %2339 = sext i32 %2338 to i64
  %2340 = getelementptr inbounds %struct.anon, %struct.anon* %2337, i64 %2339
  %2341 = getelementptr inbounds %struct.anon, %struct.anon* %2340, i32 0, i32 2
  store i32 0, i32* %2341, align 4
  %2342 = load i32, i32* %22, align 4
  %2343 = load %struct.anon*, %struct.anon** %12, align 8
  %2344 = load i32, i32* %15, align 4
  %2345 = sext i32 %2344 to i64
  %2346 = getelementptr inbounds %struct.anon, %struct.anon* %2343, i64 %2345
  %2347 = getelementptr inbounds %struct.anon, %struct.anon* %2346, i32 0, i32 0
  store i32 %2342, i32* %2347, align 4
  %2348 = load i32, i32* %21, align 4
  %2349 = load %struct.anon*, %struct.anon** %12, align 8
  %2350 = load i32, i32* %15, align 4
  %2351 = sext i32 %2350 to i64
  %2352 = getelementptr inbounds %struct.anon, %struct.anon* %2349, i64 %2351
  %2353 = getelementptr inbounds %struct.anon, %struct.anon* %2352, i32 0, i32 1
  store i32 %2348, i32* %2353, align 4
  %2354 = load i32*, i32** %23, align 8
  %2355 = load i32, i32* %21, align 4
  %2356 = load i32, i32* %13, align 4
  %2357 = mul nsw i32 %2355, %2356
  %2358 = load i32, i32* %22, align 4
  %2359 = add nsw i32 %2357, %2358
  %2360 = sext i32 %2359 to i64
  %2361 = getelementptr inbounds i32, i32* %2354, i64 %2360
  %2362 = load i32, i32* %2361, align 4
  %2363 = load %struct.anon*, %struct.anon** %12, align 8
  %2364 = load i32, i32* %15, align 4
  %2365 = sext i32 %2364 to i64
  %2366 = getelementptr inbounds %struct.anon, %struct.anon* %2363, i64 %2365
  %2367 = getelementptr inbounds %struct.anon, %struct.anon* %2366, i32 0, i32 3
  store i32 %2362, i32* %2367, align 4
  %2368 = load i32*, i32** %24, align 8
  %2369 = load i32, i32* %21, align 4
  %2370 = load i32, i32* %13, align 4
  %2371 = mul nsw i32 %2369, %2370
  %2372 = load i32, i32* %22, align 4
  %2373 = add nsw i32 %2371, %2372
  %2374 = sext i32 %2373 to i64
  %2375 = getelementptr inbounds i32, i32* %2368, i64 %2374
  %2376 = load i32, i32* %2375, align 4
  %2377 = load %struct.anon*, %struct.anon** %12, align 8
  %2378 = load i32, i32* %15, align 4
  %2379 = sext i32 %2378 to i64
  %2380 = getelementptr inbounds %struct.anon, %struct.anon* %2377, i64 %2379
  %2381 = getelementptr inbounds %struct.anon, %struct.anon* %2380, i32 0, i32 4
  store i32 %2376, i32* %2381, align 4
  %2382 = load i8*, i8** %8, align 8
  %2383 = load i32, i32* %21, align 4
  %2384 = load i32, i32* %13, align 4
  %2385 = mul nsw i32 %2383, %2384
  %2386 = load i32, i32* %22, align 4
  %2387 = add nsw i32 %2385, %2386
  %2388 = sext i32 %2387 to i64
  %2389 = getelementptr inbounds i8, i8* %2382, i64 %2388
  %2390 = load i8, i8* %2389, align 1
  %2391 = zext i8 %2390 to i32
  %2392 = load %struct.anon*, %struct.anon** %12, align 8
  %2393 = load i32, i32* %15, align 4
  %2394 = sext i32 %2393 to i64
  %2395 = getelementptr inbounds %struct.anon, %struct.anon* %2392, i64 %2394
  %2396 = getelementptr inbounds %struct.anon, %struct.anon* %2395, i32 0, i32 5
  store i32 %2391, i32* %2396, align 4
  %2397 = load i32, i32* %15, align 4
  %2398 = add nsw i32 %2397, 1
  store i32 %2398, i32* %15, align 4
  %2399 = load i32, i32* %15, align 4
  %2400 = icmp eq i32 %2399, 15000
  br i1 %2400, label %2401, label %2405

; <label>:2401:                                   ; preds = %2336
  %pgocount117 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 81)
  %2402 = add i64 %pgocount117, 1
  store i64 %2402, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 81)
  %2403 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2404 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2403, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

; <label>:2405:                                   ; preds = %2336
  %pgocount118 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 58)
  %2406 = add i64 %pgocount118, 1
  store i64 %2406, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 58)
  br label %2407

; <label>:2407:                                   ; preds = %2405, %2321, %2306, %2291, %2277, %2262, %2247, %2232, %2217, %2202, %2187, %2173, %2158, %2143, %2128, %2113, %2098, %2083, %2069, %2054, %2039, %2024, %2010, %1996, %1982, %1968, %1955, %._crit_edge40, %._crit_edge39, %._crit_edge38, %._crit_edge37, %._crit_edge36, %._crit_edge35, %._crit_edge34, %._crit_edge33, %._crit_edge32, %._crit_edge31, %._crit_edge30, %._crit_edge29, %._crit_edge28, %._crit_edge27, %._crit_edge26, %._crit_edge25, %._crit_edge24, %._crit_edge23, %._crit_edge22, %._crit_edge21, %._crit_edge20, %1629
  %pgocount119 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 82)
  %2408 = add i64 %pgocount119, 1
  store i64 %2408, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 82)
  br label %2409

; <label>:2409:                                   ; preds = %2407, %1617
  br label %2410

; <label>:2410:                                   ; preds = %2409
  %pgocount120 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 1)
  %2411 = add i64 %pgocount120, 1
  store i64 %2411, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 1)
  %2412 = load i32, i32* %22, align 4
  %2413 = add nsw i32 %2412, 1
  store i32 %2413, i32* %22, align 4
  br label %1612

; <label>:2414:                                   ; preds = %1612
  br label %2415

; <label>:2415:                                   ; preds = %2414
  %pgocount121 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 22)
  %2416 = add i64 %pgocount121, 1
  store i64 %2416, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 22)
  %2417 = load i32, i32* %21, align 4
  %2418 = add nsw i32 %2417, 1
  store i32 %2418, i32* %21, align 4
  br label %1606

; <label>:2419:                                   ; preds = %1606
  %pgocount122 = load i64, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 0)
  %2420 = add i64 %pgocount122, 1
  store i64 %2420, i64* getelementptr inbounds ([83 x i64], [83 x i64]* @__profc_susan_corners, i64 0, i64 0)
  %2421 = load %struct.anon*, %struct.anon** %12, align 8
  %2422 = load i32, i32* %15, align 4
  %2423 = sext i32 %2422 to i64
  %2424 = getelementptr inbounds %struct.anon, %struct.anon* %2421, i64 %2423
  %2425 = getelementptr inbounds %struct.anon, %struct.anon* %2424, i32 0, i32 2
  store i32 7, i32* %2425, align 4
  %2426 = load i32*, i32** %23, align 8
  %2427 = bitcast i32* %2426 to i8*
  call void @free(i8* %2427) #7
  %2428 = load i32*, i32** %24, align 8
  %2429 = bitcast i32* %2428 to i8*
  call void @free(i8* %2429) #7
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #5

; Function Attrs: noinline nounwind uwtable
define void @susan_corners_quick(i8*, i32*, i8*, i32, %struct.anon*, i32, i32) #0 {
  %8 = alloca i8*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca %struct.anon*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i8*, align 8
  %21 = alloca i8*, align 8
  store i8* %0, i8** %8, align 8
  store i32* %1, i32** %9, align 8
  store i8* %2, i8** %10, align 8
  store i32 %3, i32* %11, align 4
  store %struct.anon* %4, %struct.anon** %12, align 8
  store i32 %5, i32* %13, align 4
  store i32 %6, i32* %14, align 4
  %22 = load i32*, i32** %9, align 8
  %23 = bitcast i32* %22 to i8*
  %24 = load i32, i32* %13, align 4
  %25 = load i32, i32* %14, align 4
  %26 = mul nsw i32 %24, %25
  %27 = sext i32 %26 to i64
  %28 = mul i64 %27, 4
  call void @llvm.memset.p0i8.i64(i8* %23, i8 0, i64 %28, i32 4, i1 false)
  store i32 7, i32* %18, align 4
  br label %29

; <label>:29:                                     ; preds = %651, %7
  %30 = load i32, i32* %18, align 4
  %31 = load i32, i32* %14, align 4
  %32 = sub nsw i32 %31, 7
  %33 = icmp slt i32 %30, %32
  br i1 %33, label %34, label %655

; <label>:34:                                     ; preds = %29
  store i32 7, i32* %19, align 4
  br label %35

; <label>:35:                                     ; preds = %647, %34
  %36 = load i32, i32* %19, align 4
  %37 = load i32, i32* %13, align 4
  %38 = sub nsw i32 %37, 7
  %39 = icmp slt i32 %36, %38
  br i1 %39, label %40, label %650

; <label>:40:                                     ; preds = %35
  store i32 100, i32* %15, align 4
  %41 = load i8*, i8** %8, align 8
  %42 = load i32, i32* %18, align 4
  %43 = sub nsw i32 %42, 3
  %44 = load i32, i32* %13, align 4
  %45 = mul nsw i32 %43, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %41, i64 %46
  %48 = load i32, i32* %19, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8* %47, i64 %49
  %51 = getelementptr inbounds i8, i8* %50, i64 -1
  store i8* %51, i8** %20, align 8
  %52 = load i8*, i8** %10, align 8
  %53 = load i8*, i8** %8, align 8
  %54 = load i32, i32* %18, align 4
  %55 = load i32, i32* %13, align 4
  %56 = mul nsw i32 %54, %55
  %57 = load i32, i32* %19, align 4
  %58 = add nsw i32 %56, %57
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8* %53, i64 %59
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8* %52, i64 %63
  store i8* %64, i8** %21, align 8
  %65 = load i8*, i8** %21, align 8
  %66 = load i8*, i8** %20, align 8
  %67 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %67, i8** %20, align 8
  %68 = load i8, i8* %66, align 1
  %69 = zext i8 %68 to i32
  %70 = sext i32 %69 to i64
  %71 = sub i64 0, %70
  %72 = getelementptr inbounds i8, i8* %65, i64 %71
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = load i32, i32* %15, align 4
  %76 = add nsw i32 %75, %74
  store i32 %76, i32* %15, align 4
  %77 = load i8*, i8** %21, align 8
  %78 = load i8*, i8** %20, align 8
  %79 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %79, i8** %20, align 8
  %80 = load i8, i8* %78, align 1
  %81 = zext i8 %80 to i32
  %82 = sext i32 %81 to i64
  %83 = sub i64 0, %82
  %84 = getelementptr inbounds i8, i8* %77, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = load i32, i32* %15, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, i32* %15, align 4
  %89 = load i8*, i8** %21, align 8
  %90 = load i8*, i8** %20, align 8
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i32
  %93 = sext i32 %92 to i64
  %94 = sub i64 0, %93
  %95 = getelementptr inbounds i8, i8* %89, i64 %94
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i32
  %98 = load i32, i32* %15, align 4
  %99 = add nsw i32 %98, %97
  store i32 %99, i32* %15, align 4
  %100 = load i32, i32* %13, align 4
  %101 = sub nsw i32 %100, 3
  %102 = load i8*, i8** %20, align 8
  %103 = sext i32 %101 to i64
  %104 = getelementptr inbounds i8, i8* %102, i64 %103
  store i8* %104, i8** %20, align 8
  %105 = load i8*, i8** %21, align 8
  %106 = load i8*, i8** %20, align 8
  %107 = getelementptr inbounds i8, i8* %106, i32 1
  store i8* %107, i8** %20, align 8
  %108 = load i8, i8* %106, align 1
  %109 = zext i8 %108 to i32
  %110 = sext i32 %109 to i64
  %111 = sub i64 0, %110
  %112 = getelementptr inbounds i8, i8* %105, i64 %111
  %113 = load i8, i8* %112, align 1
  %114 = zext i8 %113 to i32
  %115 = load i32, i32* %15, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, i32* %15, align 4
  %117 = load i8*, i8** %21, align 8
  %118 = load i8*, i8** %20, align 8
  %119 = getelementptr inbounds i8, i8* %118, i32 1
  store i8* %119, i8** %20, align 8
  %120 = load i8, i8* %118, align 1
  %121 = zext i8 %120 to i32
  %122 = sext i32 %121 to i64
  %123 = sub i64 0, %122
  %124 = getelementptr inbounds i8, i8* %117, i64 %123
  %125 = load i8, i8* %124, align 1
  %126 = zext i8 %125 to i32
  %127 = load i32, i32* %15, align 4
  %128 = add nsw i32 %127, %126
  store i32 %128, i32* %15, align 4
  %129 = load i8*, i8** %21, align 8
  %130 = load i8*, i8** %20, align 8
  %131 = getelementptr inbounds i8, i8* %130, i32 1
  store i8* %131, i8** %20, align 8
  %132 = load i8, i8* %130, align 1
  %133 = zext i8 %132 to i32
  %134 = sext i32 %133 to i64
  %135 = sub i64 0, %134
  %136 = getelementptr inbounds i8, i8* %129, i64 %135
  %137 = load i8, i8* %136, align 1
  %138 = zext i8 %137 to i32
  %139 = load i32, i32* %15, align 4
  %140 = add nsw i32 %139, %138
  store i32 %140, i32* %15, align 4
  %141 = load i8*, i8** %21, align 8
  %142 = load i8*, i8** %20, align 8
  %143 = getelementptr inbounds i8, i8* %142, i32 1
  store i8* %143, i8** %20, align 8
  %144 = load i8, i8* %142, align 1
  %145 = zext i8 %144 to i32
  %146 = sext i32 %145 to i64
  %147 = sub i64 0, %146
  %148 = getelementptr inbounds i8, i8* %141, i64 %147
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = load i32, i32* %15, align 4
  %152 = add nsw i32 %151, %150
  store i32 %152, i32* %15, align 4
  %153 = load i8*, i8** %21, align 8
  %154 = load i8*, i8** %20, align 8
  %155 = load i8, i8* %154, align 1
  %156 = zext i8 %155 to i32
  %157 = sext i32 %156 to i64
  %158 = sub i64 0, %157
  %159 = getelementptr inbounds i8, i8* %153, i64 %158
  %160 = load i8, i8* %159, align 1
  %161 = zext i8 %160 to i32
  %162 = load i32, i32* %15, align 4
  %163 = add nsw i32 %162, %161
  store i32 %163, i32* %15, align 4
  %164 = load i32, i32* %13, align 4
  %165 = sub nsw i32 %164, 5
  %166 = load i8*, i8** %20, align 8
  %167 = sext i32 %165 to i64
  %168 = getelementptr inbounds i8, i8* %166, i64 %167
  store i8* %168, i8** %20, align 8
  %169 = load i8*, i8** %21, align 8
  %170 = load i8*, i8** %20, align 8
  %171 = getelementptr inbounds i8, i8* %170, i32 1
  store i8* %171, i8** %20, align 8
  %172 = load i8, i8* %170, align 1
  %173 = zext i8 %172 to i32
  %174 = sext i32 %173 to i64
  %175 = sub i64 0, %174
  %176 = getelementptr inbounds i8, i8* %169, i64 %175
  %177 = load i8, i8* %176, align 1
  %178 = zext i8 %177 to i32
  %179 = load i32, i32* %15, align 4
  %180 = add nsw i32 %179, %178
  store i32 %180, i32* %15, align 4
  %181 = load i8*, i8** %21, align 8
  %182 = load i8*, i8** %20, align 8
  %183 = getelementptr inbounds i8, i8* %182, i32 1
  store i8* %183, i8** %20, align 8
  %184 = load i8, i8* %182, align 1
  %185 = zext i8 %184 to i32
  %186 = sext i32 %185 to i64
  %187 = sub i64 0, %186
  %188 = getelementptr inbounds i8, i8* %181, i64 %187
  %189 = load i8, i8* %188, align 1
  %190 = zext i8 %189 to i32
  %191 = load i32, i32* %15, align 4
  %192 = add nsw i32 %191, %190
  store i32 %192, i32* %15, align 4
  %193 = load i8*, i8** %21, align 8
  %194 = load i8*, i8** %20, align 8
  %195 = getelementptr inbounds i8, i8* %194, i32 1
  store i8* %195, i8** %20, align 8
  %196 = load i8, i8* %194, align 1
  %197 = zext i8 %196 to i32
  %198 = sext i32 %197 to i64
  %199 = sub i64 0, %198
  %200 = getelementptr inbounds i8, i8* %193, i64 %199
  %201 = load i8, i8* %200, align 1
  %202 = zext i8 %201 to i32
  %203 = load i32, i32* %15, align 4
  %204 = add nsw i32 %203, %202
  store i32 %204, i32* %15, align 4
  %205 = load i8*, i8** %21, align 8
  %206 = load i8*, i8** %20, align 8
  %207 = getelementptr inbounds i8, i8* %206, i32 1
  store i8* %207, i8** %20, align 8
  %208 = load i8, i8* %206, align 1
  %209 = zext i8 %208 to i32
  %210 = sext i32 %209 to i64
  %211 = sub i64 0, %210
  %212 = getelementptr inbounds i8, i8* %205, i64 %211
  %213 = load i8, i8* %212, align 1
  %214 = zext i8 %213 to i32
  %215 = load i32, i32* %15, align 4
  %216 = add nsw i32 %215, %214
  store i32 %216, i32* %15, align 4
  %217 = load i8*, i8** %21, align 8
  %218 = load i8*, i8** %20, align 8
  %219 = getelementptr inbounds i8, i8* %218, i32 1
  store i8* %219, i8** %20, align 8
  %220 = load i8, i8* %218, align 1
  %221 = zext i8 %220 to i32
  %222 = sext i32 %221 to i64
  %223 = sub i64 0, %222
  %224 = getelementptr inbounds i8, i8* %217, i64 %223
  %225 = load i8, i8* %224, align 1
  %226 = zext i8 %225 to i32
  %227 = load i32, i32* %15, align 4
  %228 = add nsw i32 %227, %226
  store i32 %228, i32* %15, align 4
  %229 = load i8*, i8** %21, align 8
  %230 = load i8*, i8** %20, align 8
  %231 = getelementptr inbounds i8, i8* %230, i32 1
  store i8* %231, i8** %20, align 8
  %232 = load i8, i8* %230, align 1
  %233 = zext i8 %232 to i32
  %234 = sext i32 %233 to i64
  %235 = sub i64 0, %234
  %236 = getelementptr inbounds i8, i8* %229, i64 %235
  %237 = load i8, i8* %236, align 1
  %238 = zext i8 %237 to i32
  %239 = load i32, i32* %15, align 4
  %240 = add nsw i32 %239, %238
  store i32 %240, i32* %15, align 4
  %241 = load i8*, i8** %21, align 8
  %242 = load i8*, i8** %20, align 8
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = sext i32 %244 to i64
  %246 = sub i64 0, %245
  %247 = getelementptr inbounds i8, i8* %241, i64 %246
  %248 = load i8, i8* %247, align 1
  %249 = zext i8 %248 to i32
  %250 = load i32, i32* %15, align 4
  %251 = add nsw i32 %250, %249
  store i32 %251, i32* %15, align 4
  %252 = load i32, i32* %13, align 4
  %253 = sub nsw i32 %252, 6
  %254 = load i8*, i8** %20, align 8
  %255 = sext i32 %253 to i64
  %256 = getelementptr inbounds i8, i8* %254, i64 %255
  store i8* %256, i8** %20, align 8
  %257 = load i8*, i8** %21, align 8
  %258 = load i8*, i8** %20, align 8
  %259 = getelementptr inbounds i8, i8* %258, i32 1
  store i8* %259, i8** %20, align 8
  %260 = load i8, i8* %258, align 1
  %261 = zext i8 %260 to i32
  %262 = sext i32 %261 to i64
  %263 = sub i64 0, %262
  %264 = getelementptr inbounds i8, i8* %257, i64 %263
  %265 = load i8, i8* %264, align 1
  %266 = zext i8 %265 to i32
  %267 = load i32, i32* %15, align 4
  %268 = add nsw i32 %267, %266
  store i32 %268, i32* %15, align 4
  %269 = load i8*, i8** %21, align 8
  %270 = load i8*, i8** %20, align 8
  %271 = getelementptr inbounds i8, i8* %270, i32 1
  store i8* %271, i8** %20, align 8
  %272 = load i8, i8* %270, align 1
  %273 = zext i8 %272 to i32
  %274 = sext i32 %273 to i64
  %275 = sub i64 0, %274
  %276 = getelementptr inbounds i8, i8* %269, i64 %275
  %277 = load i8, i8* %276, align 1
  %278 = zext i8 %277 to i32
  %279 = load i32, i32* %15, align 4
  %280 = add nsw i32 %279, %278
  store i32 %280, i32* %15, align 4
  %281 = load i8*, i8** %21, align 8
  %282 = load i8*, i8** %20, align 8
  %283 = load i8, i8* %282, align 1
  %284 = zext i8 %283 to i32
  %285 = sext i32 %284 to i64
  %286 = sub i64 0, %285
  %287 = getelementptr inbounds i8, i8* %281, i64 %286
  %288 = load i8, i8* %287, align 1
  %289 = zext i8 %288 to i32
  %290 = load i32, i32* %15, align 4
  %291 = add nsw i32 %290, %289
  store i32 %291, i32* %15, align 4
  %292 = load i32, i32* %15, align 4
  %293 = load i32, i32* %11, align 4
  %294 = icmp slt i32 %292, %293
  br i1 %294, label %296, label %._crit_edge3

._crit_edge3:                                     ; preds = %40
  %pgocount = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 7)
  %295 = add i64 %pgocount, 1
  store i64 %295, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 7)
  br label %646

; <label>:296:                                    ; preds = %40
  %297 = load i8*, i8** %20, align 8
  %298 = getelementptr inbounds i8, i8* %297, i64 2
  store i8* %298, i8** %20, align 8
  %299 = load i8*, i8** %21, align 8
  %300 = load i8*, i8** %20, align 8
  %301 = getelementptr inbounds i8, i8* %300, i32 1
  store i8* %301, i8** %20, align 8
  %302 = load i8, i8* %300, align 1
  %303 = zext i8 %302 to i32
  %304 = sext i32 %303 to i64
  %305 = sub i64 0, %304
  %306 = getelementptr inbounds i8, i8* %299, i64 %305
  %307 = load i8, i8* %306, align 1
  %308 = zext i8 %307 to i32
  %309 = load i32, i32* %15, align 4
  %310 = add nsw i32 %309, %308
  store i32 %310, i32* %15, align 4
  %311 = load i32, i32* %15, align 4
  %312 = load i32, i32* %11, align 4
  %313 = icmp slt i32 %311, %312
  br i1 %313, label %315, label %._crit_edge5

._crit_edge5:                                     ; preds = %296
  %pgocount39 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 10)
  %314 = add i64 %pgocount39, 1
  store i64 %314, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 10)
  br label %645

; <label>:315:                                    ; preds = %296
  %316 = load i8*, i8** %21, align 8
  %317 = load i8*, i8** %20, align 8
  %318 = getelementptr inbounds i8, i8* %317, i32 1
  store i8* %318, i8** %20, align 8
  %319 = load i8, i8* %317, align 1
  %320 = zext i8 %319 to i32
  %321 = sext i32 %320 to i64
  %322 = sub i64 0, %321
  %323 = getelementptr inbounds i8, i8* %316, i64 %322
  %324 = load i8, i8* %323, align 1
  %325 = zext i8 %324 to i32
  %326 = load i32, i32* %15, align 4
  %327 = add nsw i32 %326, %325
  store i32 %327, i32* %15, align 4
  %328 = load i32, i32* %15, align 4
  %329 = load i32, i32* %11, align 4
  %330 = icmp slt i32 %328, %329
  br i1 %330, label %332, label %._crit_edge7

._crit_edge7:                                     ; preds = %315
  %pgocount40 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 13)
  %331 = add i64 %pgocount40, 1
  store i64 %331, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 13)
  br label %643

; <label>:332:                                    ; preds = %315
  %333 = load i8*, i8** %21, align 8
  %334 = load i8*, i8** %20, align 8
  %335 = load i8, i8* %334, align 1
  %336 = zext i8 %335 to i32
  %337 = sext i32 %336 to i64
  %338 = sub i64 0, %337
  %339 = getelementptr inbounds i8, i8* %333, i64 %338
  %340 = load i8, i8* %339, align 1
  %341 = zext i8 %340 to i32
  %342 = load i32, i32* %15, align 4
  %343 = add nsw i32 %342, %341
  store i32 %343, i32* %15, align 4
  %344 = load i32, i32* %15, align 4
  %345 = load i32, i32* %11, align 4
  %346 = icmp slt i32 %344, %345
  br i1 %346, label %348, label %._crit_edge

._crit_edge:                                      ; preds = %332
  %pgocount41 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 2)
  %347 = add i64 %pgocount41, 1
  store i64 %347, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 2)
  br label %642

; <label>:348:                                    ; preds = %332
  %349 = load i32, i32* %13, align 4
  %350 = sub nsw i32 %349, 6
  %351 = load i8*, i8** %20, align 8
  %352 = sext i32 %350 to i64
  %353 = getelementptr inbounds i8, i8* %351, i64 %352
  store i8* %353, i8** %20, align 8
  %354 = load i8*, i8** %21, align 8
  %355 = load i8*, i8** %20, align 8
  %356 = getelementptr inbounds i8, i8* %355, i32 1
  store i8* %356, i8** %20, align 8
  %357 = load i8, i8* %355, align 1
  %358 = zext i8 %357 to i32
  %359 = sext i32 %358 to i64
  %360 = sub i64 0, %359
  %361 = getelementptr inbounds i8, i8* %354, i64 %360
  %362 = load i8, i8* %361, align 1
  %363 = zext i8 %362 to i32
  %364 = load i32, i32* %15, align 4
  %365 = add nsw i32 %364, %363
  store i32 %365, i32* %15, align 4
  %366 = load i32, i32* %15, align 4
  %367 = load i32, i32* %11, align 4
  %368 = icmp slt i32 %366, %367
  br i1 %368, label %369, label %641

; <label>:369:                                    ; preds = %348
  %370 = load i8*, i8** %21, align 8
  %371 = load i8*, i8** %20, align 8
  %372 = getelementptr inbounds i8, i8* %371, i32 1
  store i8* %372, i8** %20, align 8
  %373 = load i8, i8* %371, align 1
  %374 = zext i8 %373 to i32
  %375 = sext i32 %374 to i64
  %376 = sub i64 0, %375
  %377 = getelementptr inbounds i8, i8* %370, i64 %376
  %378 = load i8, i8* %377, align 1
  %379 = zext i8 %378 to i32
  %380 = load i32, i32* %15, align 4
  %381 = add nsw i32 %380, %379
  store i32 %381, i32* %15, align 4
  %382 = load i32, i32* %15, align 4
  %383 = load i32, i32* %11, align 4
  %384 = icmp slt i32 %382, %383
  br i1 %384, label %386, label %._crit_edge1

._crit_edge1:                                     ; preds = %369
  %pgocount42 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 3)
  %385 = add i64 %pgocount42, 1
  store i64 %385, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 3)
  br label %640

; <label>:386:                                    ; preds = %369
  %387 = load i8*, i8** %21, align 8
  %388 = load i8*, i8** %20, align 8
  %389 = getelementptr inbounds i8, i8* %388, i32 1
  store i8* %389, i8** %20, align 8
  %390 = load i8, i8* %388, align 1
  %391 = zext i8 %390 to i32
  %392 = sext i32 %391 to i64
  %393 = sub i64 0, %392
  %394 = getelementptr inbounds i8, i8* %387, i64 %393
  %395 = load i8, i8* %394, align 1
  %396 = zext i8 %395 to i32
  %397 = load i32, i32* %15, align 4
  %398 = add nsw i32 %397, %396
  store i32 %398, i32* %15, align 4
  %399 = load i32, i32* %15, align 4
  %400 = load i32, i32* %11, align 4
  %401 = icmp slt i32 %399, %400
  br i1 %401, label %403, label %._crit_edge2

._crit_edge2:                                     ; preds = %386
  %pgocount43 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 6)
  %402 = add i64 %pgocount43, 1
  store i64 %402, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 6)
  br label %639

; <label>:403:                                    ; preds = %386
  %404 = load i8*, i8** %21, align 8
  %405 = load i8*, i8** %20, align 8
  %406 = getelementptr inbounds i8, i8* %405, i32 1
  store i8* %406, i8** %20, align 8
  %407 = load i8, i8* %405, align 1
  %408 = zext i8 %407 to i32
  %409 = sext i32 %408 to i64
  %410 = sub i64 0, %409
  %411 = getelementptr inbounds i8, i8* %404, i64 %410
  %412 = load i8, i8* %411, align 1
  %413 = zext i8 %412 to i32
  %414 = load i32, i32* %15, align 4
  %415 = add nsw i32 %414, %413
  store i32 %415, i32* %15, align 4
  %416 = load i32, i32* %15, align 4
  %417 = load i32, i32* %11, align 4
  %418 = icmp slt i32 %416, %417
  br i1 %418, label %420, label %._crit_edge4

._crit_edge4:                                     ; preds = %403
  %pgocount44 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 8)
  %419 = add i64 %pgocount44, 1
  store i64 %419, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 8)
  br label %638

; <label>:420:                                    ; preds = %403
  %421 = load i8*, i8** %21, align 8
  %422 = load i8*, i8** %20, align 8
  %423 = getelementptr inbounds i8, i8* %422, i32 1
  store i8* %423, i8** %20, align 8
  %424 = load i8, i8* %422, align 1
  %425 = zext i8 %424 to i32
  %426 = sext i32 %425 to i64
  %427 = sub i64 0, %426
  %428 = getelementptr inbounds i8, i8* %421, i64 %427
  %429 = load i8, i8* %428, align 1
  %430 = zext i8 %429 to i32
  %431 = load i32, i32* %15, align 4
  %432 = add nsw i32 %431, %430
  store i32 %432, i32* %15, align 4
  %433 = load i32, i32* %15, align 4
  %434 = load i32, i32* %11, align 4
  %435 = icmp slt i32 %433, %434
  br i1 %435, label %437, label %._crit_edge6

._crit_edge6:                                     ; preds = %420
  %pgocount45 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 11)
  %436 = add i64 %pgocount45, 1
  store i64 %436, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 11)
  br label %637

; <label>:437:                                    ; preds = %420
  %438 = load i8*, i8** %21, align 8
  %439 = load i8*, i8** %20, align 8
  %440 = getelementptr inbounds i8, i8* %439, i32 1
  store i8* %440, i8** %20, align 8
  %441 = load i8, i8* %439, align 1
  %442 = zext i8 %441 to i32
  %443 = sext i32 %442 to i64
  %444 = sub i64 0, %443
  %445 = getelementptr inbounds i8, i8* %438, i64 %444
  %446 = load i8, i8* %445, align 1
  %447 = zext i8 %446 to i32
  %448 = load i32, i32* %15, align 4
  %449 = add nsw i32 %448, %447
  store i32 %449, i32* %15, align 4
  %450 = load i32, i32* %15, align 4
  %451 = load i32, i32* %11, align 4
  %452 = icmp slt i32 %450, %451
  br i1 %452, label %454, label %._crit_edge8

._crit_edge8:                                     ; preds = %437
  %pgocount46 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 16)
  %453 = add i64 %pgocount46, 1
  store i64 %453, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 16)
  br label %636

; <label>:454:                                    ; preds = %437
  %455 = load i8*, i8** %21, align 8
  %456 = load i8*, i8** %20, align 8
  %457 = load i8, i8* %456, align 1
  %458 = zext i8 %457 to i32
  %459 = sext i32 %458 to i64
  %460 = sub i64 0, %459
  %461 = getelementptr inbounds i8, i8* %455, i64 %460
  %462 = load i8, i8* %461, align 1
  %463 = zext i8 %462 to i32
  %464 = load i32, i32* %15, align 4
  %465 = add nsw i32 %464, %463
  store i32 %465, i32* %15, align 4
  %466 = load i32, i32* %15, align 4
  %467 = load i32, i32* %11, align 4
  %468 = icmp slt i32 %466, %467
  br i1 %468, label %470, label %._crit_edge9

._crit_edge9:                                     ; preds = %454
  %pgocount47 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 18)
  %469 = add i64 %pgocount47, 1
  store i64 %469, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 18)
  br label %635

; <label>:470:                                    ; preds = %454
  %471 = load i32, i32* %13, align 4
  %472 = sub nsw i32 %471, 5
  %473 = load i8*, i8** %20, align 8
  %474 = sext i32 %472 to i64
  %475 = getelementptr inbounds i8, i8* %473, i64 %474
  store i8* %475, i8** %20, align 8
  %476 = load i8*, i8** %21, align 8
  %477 = load i8*, i8** %20, align 8
  %478 = getelementptr inbounds i8, i8* %477, i32 1
  store i8* %478, i8** %20, align 8
  %479 = load i8, i8* %477, align 1
  %480 = zext i8 %479 to i32
  %481 = sext i32 %480 to i64
  %482 = sub i64 0, %481
  %483 = getelementptr inbounds i8, i8* %476, i64 %482
  %484 = load i8, i8* %483, align 1
  %485 = zext i8 %484 to i32
  %486 = load i32, i32* %15, align 4
  %487 = add nsw i32 %486, %485
  store i32 %487, i32* %15, align 4
  %488 = load i32, i32* %15, align 4
  %489 = load i32, i32* %11, align 4
  %490 = icmp slt i32 %488, %489
  br i1 %490, label %492, label %._crit_edge10

._crit_edge10:                                    ; preds = %470
  %pgocount48 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 20)
  %491 = add i64 %pgocount48, 1
  store i64 %491, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 20)
  br label %634

; <label>:492:                                    ; preds = %470
  %493 = load i8*, i8** %21, align 8
  %494 = load i8*, i8** %20, align 8
  %495 = getelementptr inbounds i8, i8* %494, i32 1
  store i8* %495, i8** %20, align 8
  %496 = load i8, i8* %494, align 1
  %497 = zext i8 %496 to i32
  %498 = sext i32 %497 to i64
  %499 = sub i64 0, %498
  %500 = getelementptr inbounds i8, i8* %493, i64 %499
  %501 = load i8, i8* %500, align 1
  %502 = zext i8 %501 to i32
  %503 = load i32, i32* %15, align 4
  %504 = add nsw i32 %503, %502
  store i32 %504, i32* %15, align 4
  %505 = load i32, i32* %15, align 4
  %506 = load i32, i32* %11, align 4
  %507 = icmp slt i32 %505, %506
  br i1 %507, label %509, label %._crit_edge11

._crit_edge11:                                    ; preds = %492
  %pgocount49 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 22)
  %508 = add i64 %pgocount49, 1
  store i64 %508, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 22)
  br label %633

; <label>:509:                                    ; preds = %492
  %510 = load i8*, i8** %21, align 8
  %511 = load i8*, i8** %20, align 8
  %512 = getelementptr inbounds i8, i8* %511, i32 1
  store i8* %512, i8** %20, align 8
  %513 = load i8, i8* %511, align 1
  %514 = zext i8 %513 to i32
  %515 = sext i32 %514 to i64
  %516 = sub i64 0, %515
  %517 = getelementptr inbounds i8, i8* %510, i64 %516
  %518 = load i8, i8* %517, align 1
  %519 = zext i8 %518 to i32
  %520 = load i32, i32* %15, align 4
  %521 = add nsw i32 %520, %519
  store i32 %521, i32* %15, align 4
  %522 = load i32, i32* %15, align 4
  %523 = load i32, i32* %11, align 4
  %524 = icmp slt i32 %522, %523
  br i1 %524, label %526, label %._crit_edge12

._crit_edge12:                                    ; preds = %509
  %pgocount50 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 24)
  %525 = add i64 %pgocount50, 1
  store i64 %525, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 24)
  br label %632

; <label>:526:                                    ; preds = %509
  %527 = load i8*, i8** %21, align 8
  %528 = load i8*, i8** %20, align 8
  %529 = getelementptr inbounds i8, i8* %528, i32 1
  store i8* %529, i8** %20, align 8
  %530 = load i8, i8* %528, align 1
  %531 = zext i8 %530 to i32
  %532 = sext i32 %531 to i64
  %533 = sub i64 0, %532
  %534 = getelementptr inbounds i8, i8* %527, i64 %533
  %535 = load i8, i8* %534, align 1
  %536 = zext i8 %535 to i32
  %537 = load i32, i32* %15, align 4
  %538 = add nsw i32 %537, %536
  store i32 %538, i32* %15, align 4
  %539 = load i32, i32* %15, align 4
  %540 = load i32, i32* %11, align 4
  %541 = icmp slt i32 %539, %540
  br i1 %541, label %543, label %._crit_edge13

._crit_edge13:                                    ; preds = %526
  %pgocount51 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 26)
  %542 = add i64 %pgocount51, 1
  store i64 %542, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 26)
  br label %631

; <label>:543:                                    ; preds = %526
  %544 = load i8*, i8** %21, align 8
  %545 = load i8*, i8** %20, align 8
  %546 = load i8, i8* %545, align 1
  %547 = zext i8 %546 to i32
  %548 = sext i32 %547 to i64
  %549 = sub i64 0, %548
  %550 = getelementptr inbounds i8, i8* %544, i64 %549
  %551 = load i8, i8* %550, align 1
  %552 = zext i8 %551 to i32
  %553 = load i32, i32* %15, align 4
  %554 = add nsw i32 %553, %552
  store i32 %554, i32* %15, align 4
  %555 = load i32, i32* %15, align 4
  %556 = load i32, i32* %11, align 4
  %557 = icmp slt i32 %555, %556
  br i1 %557, label %559, label %._crit_edge14

._crit_edge14:                                    ; preds = %543
  %pgocount52 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 28)
  %558 = add i64 %pgocount52, 1
  store i64 %558, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 28)
  br label %630

; <label>:559:                                    ; preds = %543
  %560 = load i32, i32* %13, align 4
  %561 = sub nsw i32 %560, 3
  %562 = load i8*, i8** %20, align 8
  %563 = sext i32 %561 to i64
  %564 = getelementptr inbounds i8, i8* %562, i64 %563
  store i8* %564, i8** %20, align 8
  %565 = load i8*, i8** %21, align 8
  %566 = load i8*, i8** %20, align 8
  %567 = getelementptr inbounds i8, i8* %566, i32 1
  store i8* %567, i8** %20, align 8
  %568 = load i8, i8* %566, align 1
  %569 = zext i8 %568 to i32
  %570 = sext i32 %569 to i64
  %571 = sub i64 0, %570
  %572 = getelementptr inbounds i8, i8* %565, i64 %571
  %573 = load i8, i8* %572, align 1
  %574 = zext i8 %573 to i32
  %575 = load i32, i32* %15, align 4
  %576 = add nsw i32 %575, %574
  store i32 %576, i32* %15, align 4
  %577 = load i32, i32* %15, align 4
  %578 = load i32, i32* %11, align 4
  %579 = icmp slt i32 %577, %578
  br i1 %579, label %581, label %._crit_edge15

._crit_edge15:                                    ; preds = %559
  %pgocount53 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 30)
  %580 = add i64 %pgocount53, 1
  store i64 %580, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 30)
  br label %629

; <label>:581:                                    ; preds = %559
  %582 = load i8*, i8** %21, align 8
  %583 = load i8*, i8** %20, align 8
  %584 = getelementptr inbounds i8, i8* %583, i32 1
  store i8* %584, i8** %20, align 8
  %585 = load i8, i8* %583, align 1
  %586 = zext i8 %585 to i32
  %587 = sext i32 %586 to i64
  %588 = sub i64 0, %587
  %589 = getelementptr inbounds i8, i8* %582, i64 %588
  %590 = load i8, i8* %589, align 1
  %591 = zext i8 %590 to i32
  %592 = load i32, i32* %15, align 4
  %593 = add nsw i32 %592, %591
  store i32 %593, i32* %15, align 4
  %594 = load i32, i32* %15, align 4
  %595 = load i32, i32* %11, align 4
  %596 = icmp slt i32 %594, %595
  br i1 %596, label %598, label %._crit_edge16

._crit_edge16:                                    ; preds = %581
  %pgocount54 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 32)
  %597 = add i64 %pgocount54, 1
  store i64 %597, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 32)
  br label %628

; <label>:598:                                    ; preds = %581
  %599 = load i8*, i8** %21, align 8
  %600 = load i8*, i8** %20, align 8
  %601 = load i8, i8* %600, align 1
  %602 = zext i8 %601 to i32
  %603 = sext i32 %602 to i64
  %604 = sub i64 0, %603
  %605 = getelementptr inbounds i8, i8* %599, i64 %604
  %606 = load i8, i8* %605, align 1
  %607 = zext i8 %606 to i32
  %608 = load i32, i32* %15, align 4
  %609 = add nsw i32 %608, %607
  store i32 %609, i32* %15, align 4
  %610 = load i32, i32* %15, align 4
  %611 = load i32, i32* %11, align 4
  %612 = icmp slt i32 %610, %611
  br i1 %612, label %614, label %._crit_edge17

._crit_edge17:                                    ; preds = %598
  %pgocount55 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 34)
  %613 = add i64 %pgocount55, 1
  store i64 %613, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 34)
  br label %626

; <label>:614:                                    ; preds = %598
  %615 = load i32, i32* %11, align 4
  %616 = load i32, i32* %15, align 4
  %617 = sub nsw i32 %615, %616
  %618 = load i32*, i32** %9, align 8
  %619 = load i32, i32* %18, align 4
  %620 = load i32, i32* %13, align 4
  %621 = mul nsw i32 %619, %620
  %622 = load i32, i32* %19, align 4
  %623 = add nsw i32 %621, %622
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds i32, i32* %618, i64 %624
  store i32 %617, i32* %625, align 4
  br label %626

; <label>:626:                                    ; preds = %614, %._crit_edge17
  %pgocount56 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 5)
  %627 = add i64 %pgocount56, 1
  store i64 %627, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 5)
  br label %628

; <label>:628:                                    ; preds = %626, %._crit_edge16
  br label %629

; <label>:629:                                    ; preds = %628, %._crit_edge15
  br label %630

; <label>:630:                                    ; preds = %629, %._crit_edge14
  br label %631

; <label>:631:                                    ; preds = %630, %._crit_edge13
  br label %632

; <label>:632:                                    ; preds = %631, %._crit_edge12
  br label %633

; <label>:633:                                    ; preds = %632, %._crit_edge11
  br label %634

; <label>:634:                                    ; preds = %633, %._crit_edge10
  br label %635

; <label>:635:                                    ; preds = %634, %._crit_edge9
  br label %636

; <label>:636:                                    ; preds = %635, %._crit_edge8
  br label %637

; <label>:637:                                    ; preds = %636, %._crit_edge6
  br label %638

; <label>:638:                                    ; preds = %637, %._crit_edge4
  br label %639

; <label>:639:                                    ; preds = %638, %._crit_edge2
  br label %640

; <label>:640:                                    ; preds = %639, %._crit_edge1
  br label %641

; <label>:641:                                    ; preds = %640, %348
  br label %642

; <label>:642:                                    ; preds = %641, %._crit_edge
  br label %643

; <label>:643:                                    ; preds = %642, %._crit_edge7
  %pgocount57 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 4)
  %644 = add i64 %pgocount57, 1
  store i64 %644, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 4)
  br label %645

; <label>:645:                                    ; preds = %643, %._crit_edge5
  br label %646

; <label>:646:                                    ; preds = %645, %._crit_edge3
  br label %647

; <label>:647:                                    ; preds = %646
  %648 = load i32, i32* %19, align 4
  %649 = add nsw i32 %648, 1
  store i32 %649, i32* %19, align 4
  br label %35

; <label>:650:                                    ; preds = %35
  br label %651

; <label>:651:                                    ; preds = %650
  %pgocount58 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 14)
  %652 = add i64 %pgocount58, 1
  store i64 %652, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 14)
  %653 = load i32, i32* %18, align 4
  %654 = add nsw i32 %653, 1
  store i32 %654, i32* %18, align 4
  br label %29

; <label>:655:                                    ; preds = %29
  store i32 0, i32* %15, align 4
  store i32 7, i32* %18, align 4
  br label %656

; <label>:656:                                    ; preds = %2273, %655
  %657 = load i32, i32* %18, align 4
  %658 = load i32, i32* %14, align 4
  %659 = sub nsw i32 %658, 7
  %660 = icmp slt i32 %657, %659
  br i1 %660, label %661, label %2277

; <label>:661:                                    ; preds = %656
  store i32 7, i32* %19, align 4
  br label %662

; <label>:662:                                    ; preds = %2268, %661
  %663 = load i32, i32* %19, align 4
  %664 = load i32, i32* %13, align 4
  %665 = sub nsw i32 %664, 7
  %666 = icmp slt i32 %663, %665
  br i1 %666, label %667, label %2272

; <label>:667:                                    ; preds = %662
  %668 = load i32*, i32** %9, align 8
  %669 = load i32, i32* %18, align 4
  %670 = load i32, i32* %13, align 4
  %671 = mul nsw i32 %669, %670
  %672 = load i32, i32* %19, align 4
  %673 = add nsw i32 %671, %672
  %674 = sext i32 %673 to i64
  %675 = getelementptr inbounds i32, i32* %668, i64 %674
  %676 = load i32, i32* %675, align 4
  store i32 %676, i32* %16, align 4
  %677 = load i32, i32* %16, align 4
  %678 = icmp sgt i32 %677, 0
  br i1 %678, label %679, label %2267

; <label>:679:                                    ; preds = %667
  %680 = load i32, i32* %16, align 4
  %681 = load i32*, i32** %9, align 8
  %682 = load i32, i32* %18, align 4
  %683 = sub nsw i32 %682, 3
  %684 = load i32, i32* %13, align 4
  %685 = mul nsw i32 %683, %684
  %686 = load i32, i32* %19, align 4
  %687 = add nsw i32 %685, %686
  %688 = sub nsw i32 %687, 3
  %689 = sext i32 %688 to i64
  %690 = getelementptr inbounds i32, i32* %681, i64 %689
  %691 = load i32, i32* %690, align 4
  %692 = icmp sgt i32 %680, %691
  br i1 %692, label %693, label %2265

; <label>:693:                                    ; preds = %679
  %694 = load i32, i32* %16, align 4
  %695 = load i32*, i32** %9, align 8
  %696 = load i32, i32* %18, align 4
  %697 = sub nsw i32 %696, 3
  %698 = load i32, i32* %13, align 4
  %699 = mul nsw i32 %697, %698
  %700 = load i32, i32* %19, align 4
  %701 = add nsw i32 %699, %700
  %702 = sub nsw i32 %701, 2
  %703 = sext i32 %702 to i64
  %704 = getelementptr inbounds i32, i32* %695, i64 %703
  %705 = load i32, i32* %704, align 4
  %706 = icmp sgt i32 %694, %705
  br i1 %706, label %708, label %._crit_edge18

._crit_edge18:                                    ; preds = %693
  %pgocount59 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 50)
  %707 = add i64 %pgocount59, 1
  store i64 %707, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 50)
  br label %2265

; <label>:708:                                    ; preds = %693
  %709 = load i32, i32* %16, align 4
  %710 = load i32*, i32** %9, align 8
  %711 = load i32, i32* %18, align 4
  %712 = sub nsw i32 %711, 3
  %713 = load i32, i32* %13, align 4
  %714 = mul nsw i32 %712, %713
  %715 = load i32, i32* %19, align 4
  %716 = add nsw i32 %714, %715
  %717 = sub nsw i32 %716, 1
  %718 = sext i32 %717 to i64
  %719 = getelementptr inbounds i32, i32* %710, i64 %718
  %720 = load i32, i32* %719, align 4
  %721 = icmp sgt i32 %709, %720
  br i1 %721, label %723, label %._crit_edge19

._crit_edge19:                                    ; preds = %708
  %pgocount60 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 51)
  %722 = add i64 %pgocount60, 1
  store i64 %722, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 51)
  br label %2265

; <label>:723:                                    ; preds = %708
  %724 = load i32, i32* %16, align 4
  %725 = load i32*, i32** %9, align 8
  %726 = load i32, i32* %18, align 4
  %727 = sub nsw i32 %726, 3
  %728 = load i32, i32* %13, align 4
  %729 = mul nsw i32 %727, %728
  %730 = load i32, i32* %19, align 4
  %731 = add nsw i32 %729, %730
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds i32, i32* %725, i64 %732
  %734 = load i32, i32* %733, align 4
  %735 = icmp sgt i32 %724, %734
  br i1 %735, label %737, label %._crit_edge20

._crit_edge20:                                    ; preds = %723
  %pgocount61 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 52)
  %736 = add i64 %pgocount61, 1
  store i64 %736, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 52)
  br label %2265

; <label>:737:                                    ; preds = %723
  %738 = load i32, i32* %16, align 4
  %739 = load i32*, i32** %9, align 8
  %740 = load i32, i32* %18, align 4
  %741 = sub nsw i32 %740, 3
  %742 = load i32, i32* %13, align 4
  %743 = mul nsw i32 %741, %742
  %744 = load i32, i32* %19, align 4
  %745 = add nsw i32 %743, %744
  %746 = add nsw i32 %745, 1
  %747 = sext i32 %746 to i64
  %748 = getelementptr inbounds i32, i32* %739, i64 %747
  %749 = load i32, i32* %748, align 4
  %750 = icmp sgt i32 %738, %749
  br i1 %750, label %752, label %._crit_edge21

._crit_edge21:                                    ; preds = %737
  %pgocount62 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 53)
  %751 = add i64 %pgocount62, 1
  store i64 %751, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 53)
  br label %2265

; <label>:752:                                    ; preds = %737
  %753 = load i32, i32* %16, align 4
  %754 = load i32*, i32** %9, align 8
  %755 = load i32, i32* %18, align 4
  %756 = sub nsw i32 %755, 3
  %757 = load i32, i32* %13, align 4
  %758 = mul nsw i32 %756, %757
  %759 = load i32, i32* %19, align 4
  %760 = add nsw i32 %758, %759
  %761 = add nsw i32 %760, 2
  %762 = sext i32 %761 to i64
  %763 = getelementptr inbounds i32, i32* %754, i64 %762
  %764 = load i32, i32* %763, align 4
  %765 = icmp sgt i32 %753, %764
  br i1 %765, label %767, label %._crit_edge22

._crit_edge22:                                    ; preds = %752
  %pgocount63 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 54)
  %766 = add i64 %pgocount63, 1
  store i64 %766, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 54)
  br label %2265

; <label>:767:                                    ; preds = %752
  %768 = load i32, i32* %16, align 4
  %769 = load i32*, i32** %9, align 8
  %770 = load i32, i32* %18, align 4
  %771 = sub nsw i32 %770, 3
  %772 = load i32, i32* %13, align 4
  %773 = mul nsw i32 %771, %772
  %774 = load i32, i32* %19, align 4
  %775 = add nsw i32 %773, %774
  %776 = add nsw i32 %775, 3
  %777 = sext i32 %776 to i64
  %778 = getelementptr inbounds i32, i32* %769, i64 %777
  %779 = load i32, i32* %778, align 4
  %780 = icmp sgt i32 %768, %779
  br i1 %780, label %782, label %._crit_edge23

._crit_edge23:                                    ; preds = %767
  %pgocount64 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 55)
  %781 = add i64 %pgocount64, 1
  store i64 %781, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 55)
  br label %2265

; <label>:782:                                    ; preds = %767
  %783 = load i32, i32* %16, align 4
  %784 = load i32*, i32** %9, align 8
  %785 = load i32, i32* %18, align 4
  %786 = sub nsw i32 %785, 2
  %787 = load i32, i32* %13, align 4
  %788 = mul nsw i32 %786, %787
  %789 = load i32, i32* %19, align 4
  %790 = add nsw i32 %788, %789
  %791 = sub nsw i32 %790, 3
  %792 = sext i32 %791 to i64
  %793 = getelementptr inbounds i32, i32* %784, i64 %792
  %794 = load i32, i32* %793, align 4
  %795 = icmp sgt i32 %783, %794
  br i1 %795, label %797, label %._crit_edge24

._crit_edge24:                                    ; preds = %782
  %pgocount65 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 56)
  %796 = add i64 %pgocount65, 1
  store i64 %796, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 56)
  br label %2265

; <label>:797:                                    ; preds = %782
  %798 = load i32, i32* %16, align 4
  %799 = load i32*, i32** %9, align 8
  %800 = load i32, i32* %18, align 4
  %801 = sub nsw i32 %800, 2
  %802 = load i32, i32* %13, align 4
  %803 = mul nsw i32 %801, %802
  %804 = load i32, i32* %19, align 4
  %805 = add nsw i32 %803, %804
  %806 = sub nsw i32 %805, 2
  %807 = sext i32 %806 to i64
  %808 = getelementptr inbounds i32, i32* %799, i64 %807
  %809 = load i32, i32* %808, align 4
  %810 = icmp sgt i32 %798, %809
  br i1 %810, label %812, label %._crit_edge25

._crit_edge25:                                    ; preds = %797
  %pgocount66 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 57)
  %811 = add i64 %pgocount66, 1
  store i64 %811, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 57)
  br label %2265

; <label>:812:                                    ; preds = %797
  %813 = load i32, i32* %16, align 4
  %814 = load i32*, i32** %9, align 8
  %815 = load i32, i32* %18, align 4
  %816 = sub nsw i32 %815, 2
  %817 = load i32, i32* %13, align 4
  %818 = mul nsw i32 %816, %817
  %819 = load i32, i32* %19, align 4
  %820 = add nsw i32 %818, %819
  %821 = sub nsw i32 %820, 1
  %822 = sext i32 %821 to i64
  %823 = getelementptr inbounds i32, i32* %814, i64 %822
  %824 = load i32, i32* %823, align 4
  %825 = icmp sgt i32 %813, %824
  br i1 %825, label %827, label %._crit_edge26

._crit_edge26:                                    ; preds = %812
  %pgocount67 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 58)
  %826 = add i64 %pgocount67, 1
  store i64 %826, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 58)
  br label %2265

; <label>:827:                                    ; preds = %812
  %828 = load i32, i32* %16, align 4
  %829 = load i32*, i32** %9, align 8
  %830 = load i32, i32* %18, align 4
  %831 = sub nsw i32 %830, 2
  %832 = load i32, i32* %13, align 4
  %833 = mul nsw i32 %831, %832
  %834 = load i32, i32* %19, align 4
  %835 = add nsw i32 %833, %834
  %836 = sext i32 %835 to i64
  %837 = getelementptr inbounds i32, i32* %829, i64 %836
  %838 = load i32, i32* %837, align 4
  %839 = icmp sgt i32 %828, %838
  br i1 %839, label %841, label %._crit_edge27

._crit_edge27:                                    ; preds = %827
  %pgocount68 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 59)
  %840 = add i64 %pgocount68, 1
  store i64 %840, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 59)
  br label %2265

; <label>:841:                                    ; preds = %827
  %842 = load i32, i32* %16, align 4
  %843 = load i32*, i32** %9, align 8
  %844 = load i32, i32* %18, align 4
  %845 = sub nsw i32 %844, 2
  %846 = load i32, i32* %13, align 4
  %847 = mul nsw i32 %845, %846
  %848 = load i32, i32* %19, align 4
  %849 = add nsw i32 %847, %848
  %850 = add nsw i32 %849, 1
  %851 = sext i32 %850 to i64
  %852 = getelementptr inbounds i32, i32* %843, i64 %851
  %853 = load i32, i32* %852, align 4
  %854 = icmp sgt i32 %842, %853
  br i1 %854, label %856, label %._crit_edge28

._crit_edge28:                                    ; preds = %841
  %pgocount69 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 60)
  %855 = add i64 %pgocount69, 1
  store i64 %855, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 60)
  br label %2265

; <label>:856:                                    ; preds = %841
  %857 = load i32, i32* %16, align 4
  %858 = load i32*, i32** %9, align 8
  %859 = load i32, i32* %18, align 4
  %860 = sub nsw i32 %859, 2
  %861 = load i32, i32* %13, align 4
  %862 = mul nsw i32 %860, %861
  %863 = load i32, i32* %19, align 4
  %864 = add nsw i32 %862, %863
  %865 = add nsw i32 %864, 2
  %866 = sext i32 %865 to i64
  %867 = getelementptr inbounds i32, i32* %858, i64 %866
  %868 = load i32, i32* %867, align 4
  %869 = icmp sgt i32 %857, %868
  br i1 %869, label %871, label %._crit_edge29

._crit_edge29:                                    ; preds = %856
  %pgocount70 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 61)
  %870 = add i64 %pgocount70, 1
  store i64 %870, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 61)
  br label %2265

; <label>:871:                                    ; preds = %856
  %872 = load i32, i32* %16, align 4
  %873 = load i32*, i32** %9, align 8
  %874 = load i32, i32* %18, align 4
  %875 = sub nsw i32 %874, 2
  %876 = load i32, i32* %13, align 4
  %877 = mul nsw i32 %875, %876
  %878 = load i32, i32* %19, align 4
  %879 = add nsw i32 %877, %878
  %880 = add nsw i32 %879, 3
  %881 = sext i32 %880 to i64
  %882 = getelementptr inbounds i32, i32* %873, i64 %881
  %883 = load i32, i32* %882, align 4
  %884 = icmp sgt i32 %872, %883
  br i1 %884, label %886, label %._crit_edge30

._crit_edge30:                                    ; preds = %871
  %pgocount71 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 62)
  %885 = add i64 %pgocount71, 1
  store i64 %885, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 62)
  br label %2265

; <label>:886:                                    ; preds = %871
  %887 = load i32, i32* %16, align 4
  %888 = load i32*, i32** %9, align 8
  %889 = load i32, i32* %18, align 4
  %890 = sub nsw i32 %889, 1
  %891 = load i32, i32* %13, align 4
  %892 = mul nsw i32 %890, %891
  %893 = load i32, i32* %19, align 4
  %894 = add nsw i32 %892, %893
  %895 = sub nsw i32 %894, 3
  %896 = sext i32 %895 to i64
  %897 = getelementptr inbounds i32, i32* %888, i64 %896
  %898 = load i32, i32* %897, align 4
  %899 = icmp sgt i32 %887, %898
  br i1 %899, label %901, label %._crit_edge31

._crit_edge31:                                    ; preds = %886
  %pgocount72 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 63)
  %900 = add i64 %pgocount72, 1
  store i64 %900, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 63)
  br label %2265

; <label>:901:                                    ; preds = %886
  %902 = load i32, i32* %16, align 4
  %903 = load i32*, i32** %9, align 8
  %904 = load i32, i32* %18, align 4
  %905 = sub nsw i32 %904, 1
  %906 = load i32, i32* %13, align 4
  %907 = mul nsw i32 %905, %906
  %908 = load i32, i32* %19, align 4
  %909 = add nsw i32 %907, %908
  %910 = sub nsw i32 %909, 2
  %911 = sext i32 %910 to i64
  %912 = getelementptr inbounds i32, i32* %903, i64 %911
  %913 = load i32, i32* %912, align 4
  %914 = icmp sgt i32 %902, %913
  br i1 %914, label %916, label %._crit_edge32

._crit_edge32:                                    ; preds = %901
  %pgocount73 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 64)
  %915 = add i64 %pgocount73, 1
  store i64 %915, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 64)
  br label %2265

; <label>:916:                                    ; preds = %901
  %917 = load i32, i32* %16, align 4
  %918 = load i32*, i32** %9, align 8
  %919 = load i32, i32* %18, align 4
  %920 = sub nsw i32 %919, 1
  %921 = load i32, i32* %13, align 4
  %922 = mul nsw i32 %920, %921
  %923 = load i32, i32* %19, align 4
  %924 = add nsw i32 %922, %923
  %925 = sub nsw i32 %924, 1
  %926 = sext i32 %925 to i64
  %927 = getelementptr inbounds i32, i32* %918, i64 %926
  %928 = load i32, i32* %927, align 4
  %929 = icmp sgt i32 %917, %928
  br i1 %929, label %931, label %._crit_edge33

._crit_edge33:                                    ; preds = %916
  %pgocount74 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 65)
  %930 = add i64 %pgocount74, 1
  store i64 %930, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 65)
  br label %2265

; <label>:931:                                    ; preds = %916
  %932 = load i32, i32* %16, align 4
  %933 = load i32*, i32** %9, align 8
  %934 = load i32, i32* %18, align 4
  %935 = sub nsw i32 %934, 1
  %936 = load i32, i32* %13, align 4
  %937 = mul nsw i32 %935, %936
  %938 = load i32, i32* %19, align 4
  %939 = add nsw i32 %937, %938
  %940 = sext i32 %939 to i64
  %941 = getelementptr inbounds i32, i32* %933, i64 %940
  %942 = load i32, i32* %941, align 4
  %943 = icmp sgt i32 %932, %942
  br i1 %943, label %945, label %._crit_edge34

._crit_edge34:                                    ; preds = %931
  %pgocount75 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 66)
  %944 = add i64 %pgocount75, 1
  store i64 %944, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 66)
  br label %2265

; <label>:945:                                    ; preds = %931
  %946 = load i32, i32* %16, align 4
  %947 = load i32*, i32** %9, align 8
  %948 = load i32, i32* %18, align 4
  %949 = sub nsw i32 %948, 1
  %950 = load i32, i32* %13, align 4
  %951 = mul nsw i32 %949, %950
  %952 = load i32, i32* %19, align 4
  %953 = add nsw i32 %951, %952
  %954 = add nsw i32 %953, 1
  %955 = sext i32 %954 to i64
  %956 = getelementptr inbounds i32, i32* %947, i64 %955
  %957 = load i32, i32* %956, align 4
  %958 = icmp sgt i32 %946, %957
  br i1 %958, label %960, label %._crit_edge35

._crit_edge35:                                    ; preds = %945
  %pgocount76 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 68)
  %959 = add i64 %pgocount76, 1
  store i64 %959, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 68)
  br label %2265

; <label>:960:                                    ; preds = %945
  %pgocount77 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 67)
  %961 = add i64 %pgocount77, 1
  store i64 %961, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 67)
  %962 = load i32, i32* %16, align 4
  %963 = load i32*, i32** %9, align 8
  %964 = load i32, i32* %18, align 4
  %965 = sub nsw i32 %964, 1
  %966 = load i32, i32* %13, align 4
  %967 = mul nsw i32 %965, %966
  %968 = load i32, i32* %19, align 4
  %969 = add nsw i32 %967, %968
  %970 = add nsw i32 %969, 2
  %971 = sext i32 %970 to i64
  %972 = getelementptr inbounds i32, i32* %963, i64 %971
  %973 = load i32, i32* %972, align 4
  %974 = icmp sgt i32 %962, %973
  br i1 %974, label %976, label %._crit_edge36

._crit_edge36:                                    ; preds = %960
  %pgocount78 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 69)
  %975 = add i64 %pgocount78, 1
  store i64 %975, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 69)
  br label %2265

; <label>:976:                                    ; preds = %960
  %977 = load i32, i32* %16, align 4
  %978 = load i32*, i32** %9, align 8
  %979 = load i32, i32* %18, align 4
  %980 = sub nsw i32 %979, 1
  %981 = load i32, i32* %13, align 4
  %982 = mul nsw i32 %980, %981
  %983 = load i32, i32* %19, align 4
  %984 = add nsw i32 %982, %983
  %985 = add nsw i32 %984, 3
  %986 = sext i32 %985 to i64
  %987 = getelementptr inbounds i32, i32* %978, i64 %986
  %988 = load i32, i32* %987, align 4
  %989 = icmp sgt i32 %977, %988
  br i1 %989, label %991, label %._crit_edge37

._crit_edge37:                                    ; preds = %976
  %pgocount79 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 70)
  %990 = add i64 %pgocount79, 1
  store i64 %990, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 70)
  br label %2265

; <label>:991:                                    ; preds = %976
  %992 = load i32, i32* %16, align 4
  %993 = load i32*, i32** %9, align 8
  %994 = load i32, i32* %18, align 4
  %995 = load i32, i32* %13, align 4
  %996 = mul nsw i32 %994, %995
  %997 = load i32, i32* %19, align 4
  %998 = add nsw i32 %996, %997
  %999 = sub nsw i32 %998, 3
  %1000 = sext i32 %999 to i64
  %1001 = getelementptr inbounds i32, i32* %993, i64 %1000
  %1002 = load i32, i32* %1001, align 4
  %1003 = icmp sgt i32 %992, %1002
  br i1 %1003, label %1005, label %._crit_edge38

._crit_edge38:                                    ; preds = %991
  %pgocount80 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 71)
  %1004 = add i64 %pgocount80, 1
  store i64 %1004, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 71)
  br label %2265

; <label>:1005:                                   ; preds = %991
  %1006 = load i32, i32* %16, align 4
  %1007 = load i32*, i32** %9, align 8
  %1008 = load i32, i32* %18, align 4
  %1009 = load i32, i32* %13, align 4
  %1010 = mul nsw i32 %1008, %1009
  %1011 = load i32, i32* %19, align 4
  %1012 = add nsw i32 %1010, %1011
  %1013 = sub nsw i32 %1012, 2
  %1014 = sext i32 %1013 to i64
  %1015 = getelementptr inbounds i32, i32* %1007, i64 %1014
  %1016 = load i32, i32* %1015, align 4
  %1017 = icmp sgt i32 %1006, %1016
  br i1 %1017, label %1018, label %2265

; <label>:1018:                                   ; preds = %1005
  %pgocount81 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 9)
  %1019 = add i64 %pgocount81, 1
  store i64 %1019, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 9)
  %1020 = load i32, i32* %16, align 4
  %1021 = load i32*, i32** %9, align 8
  %1022 = load i32, i32* %18, align 4
  %1023 = load i32, i32* %13, align 4
  %1024 = mul nsw i32 %1022, %1023
  %1025 = load i32, i32* %19, align 4
  %1026 = add nsw i32 %1024, %1025
  %1027 = sub nsw i32 %1026, 1
  %1028 = sext i32 %1027 to i64
  %1029 = getelementptr inbounds i32, i32* %1021, i64 %1028
  %1030 = load i32, i32* %1029, align 4
  %1031 = icmp sgt i32 %1020, %1030
  br i1 %1031, label %1032, label %2265

; <label>:1032:                                   ; preds = %1018
  %pgocount82 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 12)
  %1033 = add i64 %pgocount82, 1
  store i64 %1033, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 12)
  %1034 = load i32, i32* %16, align 4
  %1035 = load i32*, i32** %9, align 8
  %1036 = load i32, i32* %18, align 4
  %1037 = load i32, i32* %13, align 4
  %1038 = mul nsw i32 %1036, %1037
  %1039 = load i32, i32* %19, align 4
  %1040 = add nsw i32 %1038, %1039
  %1041 = add nsw i32 %1040, 1
  %1042 = sext i32 %1041 to i64
  %1043 = getelementptr inbounds i32, i32* %1035, i64 %1042
  %1044 = load i32, i32* %1043, align 4
  %1045 = icmp sge i32 %1034, %1044
  br i1 %1045, label %1046, label %2265

; <label>:1046:                                   ; preds = %1032
  %pgocount83 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 17)
  %1047 = add i64 %pgocount83, 1
  store i64 %1047, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 17)
  %1048 = load i32, i32* %16, align 4
  %1049 = load i32*, i32** %9, align 8
  %1050 = load i32, i32* %18, align 4
  %1051 = load i32, i32* %13, align 4
  %1052 = mul nsw i32 %1050, %1051
  %1053 = load i32, i32* %19, align 4
  %1054 = add nsw i32 %1052, %1053
  %1055 = add nsw i32 %1054, 2
  %1056 = sext i32 %1055 to i64
  %1057 = getelementptr inbounds i32, i32* %1049, i64 %1056
  %1058 = load i32, i32* %1057, align 4
  %1059 = icmp sge i32 %1048, %1058
  br i1 %1059, label %1060, label %2265

; <label>:1060:                                   ; preds = %1046
  %pgocount84 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 19)
  %1061 = add i64 %pgocount84, 1
  store i64 %1061, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 19)
  %1062 = load i32, i32* %16, align 4
  %1063 = load i32*, i32** %9, align 8
  %1064 = load i32, i32* %18, align 4
  %1065 = load i32, i32* %13, align 4
  %1066 = mul nsw i32 %1064, %1065
  %1067 = load i32, i32* %19, align 4
  %1068 = add nsw i32 %1066, %1067
  %1069 = add nsw i32 %1068, 3
  %1070 = sext i32 %1069 to i64
  %1071 = getelementptr inbounds i32, i32* %1063, i64 %1070
  %1072 = load i32, i32* %1071, align 4
  %1073 = icmp sge i32 %1062, %1072
  br i1 %1073, label %1074, label %2265

; <label>:1074:                                   ; preds = %1060
  %pgocount85 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 21)
  %1075 = add i64 %pgocount85, 1
  store i64 %1075, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 21)
  %1076 = load i32, i32* %16, align 4
  %1077 = load i32*, i32** %9, align 8
  %1078 = load i32, i32* %18, align 4
  %1079 = add nsw i32 %1078, 1
  %1080 = load i32, i32* %13, align 4
  %1081 = mul nsw i32 %1079, %1080
  %1082 = load i32, i32* %19, align 4
  %1083 = add nsw i32 %1081, %1082
  %1084 = sub nsw i32 %1083, 3
  %1085 = sext i32 %1084 to i64
  %1086 = getelementptr inbounds i32, i32* %1077, i64 %1085
  %1087 = load i32, i32* %1086, align 4
  %1088 = icmp sge i32 %1076, %1087
  br i1 %1088, label %1089, label %2265

; <label>:1089:                                   ; preds = %1074
  %pgocount86 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 23)
  %1090 = add i64 %pgocount86, 1
  store i64 %1090, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 23)
  %1091 = load i32, i32* %16, align 4
  %1092 = load i32*, i32** %9, align 8
  %1093 = load i32, i32* %18, align 4
  %1094 = add nsw i32 %1093, 1
  %1095 = load i32, i32* %13, align 4
  %1096 = mul nsw i32 %1094, %1095
  %1097 = load i32, i32* %19, align 4
  %1098 = add nsw i32 %1096, %1097
  %1099 = sub nsw i32 %1098, 2
  %1100 = sext i32 %1099 to i64
  %1101 = getelementptr inbounds i32, i32* %1092, i64 %1100
  %1102 = load i32, i32* %1101, align 4
  %1103 = icmp sge i32 %1091, %1102
  br i1 %1103, label %1104, label %2265

; <label>:1104:                                   ; preds = %1089
  %pgocount87 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 25)
  %1105 = add i64 %pgocount87, 1
  store i64 %1105, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 25)
  %1106 = load i32, i32* %16, align 4
  %1107 = load i32*, i32** %9, align 8
  %1108 = load i32, i32* %18, align 4
  %1109 = add nsw i32 %1108, 1
  %1110 = load i32, i32* %13, align 4
  %1111 = mul nsw i32 %1109, %1110
  %1112 = load i32, i32* %19, align 4
  %1113 = add nsw i32 %1111, %1112
  %1114 = sub nsw i32 %1113, 1
  %1115 = sext i32 %1114 to i64
  %1116 = getelementptr inbounds i32, i32* %1107, i64 %1115
  %1117 = load i32, i32* %1116, align 4
  %1118 = icmp sge i32 %1106, %1117
  br i1 %1118, label %1119, label %2265

; <label>:1119:                                   ; preds = %1104
  %pgocount88 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 27)
  %1120 = add i64 %pgocount88, 1
  store i64 %1120, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 27)
  %1121 = load i32, i32* %16, align 4
  %1122 = load i32*, i32** %9, align 8
  %1123 = load i32, i32* %18, align 4
  %1124 = add nsw i32 %1123, 1
  %1125 = load i32, i32* %13, align 4
  %1126 = mul nsw i32 %1124, %1125
  %1127 = load i32, i32* %19, align 4
  %1128 = add nsw i32 %1126, %1127
  %1129 = sext i32 %1128 to i64
  %1130 = getelementptr inbounds i32, i32* %1122, i64 %1129
  %1131 = load i32, i32* %1130, align 4
  %1132 = icmp sge i32 %1121, %1131
  br i1 %1132, label %1133, label %2265

; <label>:1133:                                   ; preds = %1119
  %pgocount89 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 29)
  %1134 = add i64 %pgocount89, 1
  store i64 %1134, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 29)
  %1135 = load i32, i32* %16, align 4
  %1136 = load i32*, i32** %9, align 8
  %1137 = load i32, i32* %18, align 4
  %1138 = add nsw i32 %1137, 1
  %1139 = load i32, i32* %13, align 4
  %1140 = mul nsw i32 %1138, %1139
  %1141 = load i32, i32* %19, align 4
  %1142 = add nsw i32 %1140, %1141
  %1143 = add nsw i32 %1142, 1
  %1144 = sext i32 %1143 to i64
  %1145 = getelementptr inbounds i32, i32* %1136, i64 %1144
  %1146 = load i32, i32* %1145, align 4
  %1147 = icmp sge i32 %1135, %1146
  br i1 %1147, label %1148, label %2265

; <label>:1148:                                   ; preds = %1133
  %pgocount90 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 31)
  %1149 = add i64 %pgocount90, 1
  store i64 %1149, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 31)
  %1150 = load i32, i32* %16, align 4
  %1151 = load i32*, i32** %9, align 8
  %1152 = load i32, i32* %18, align 4
  %1153 = add nsw i32 %1152, 1
  %1154 = load i32, i32* %13, align 4
  %1155 = mul nsw i32 %1153, %1154
  %1156 = load i32, i32* %19, align 4
  %1157 = add nsw i32 %1155, %1156
  %1158 = add nsw i32 %1157, 2
  %1159 = sext i32 %1158 to i64
  %1160 = getelementptr inbounds i32, i32* %1151, i64 %1159
  %1161 = load i32, i32* %1160, align 4
  %1162 = icmp sge i32 %1150, %1161
  br i1 %1162, label %1163, label %2265

; <label>:1163:                                   ; preds = %1148
  %pgocount91 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 33)
  %1164 = add i64 %pgocount91, 1
  store i64 %1164, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 33)
  %1165 = load i32, i32* %16, align 4
  %1166 = load i32*, i32** %9, align 8
  %1167 = load i32, i32* %18, align 4
  %1168 = add nsw i32 %1167, 1
  %1169 = load i32, i32* %13, align 4
  %1170 = mul nsw i32 %1168, %1169
  %1171 = load i32, i32* %19, align 4
  %1172 = add nsw i32 %1170, %1171
  %1173 = add nsw i32 %1172, 3
  %1174 = sext i32 %1173 to i64
  %1175 = getelementptr inbounds i32, i32* %1166, i64 %1174
  %1176 = load i32, i32* %1175, align 4
  %1177 = icmp sge i32 %1165, %1176
  br i1 %1177, label %1178, label %2265

; <label>:1178:                                   ; preds = %1163
  %pgocount92 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 35)
  %1179 = add i64 %pgocount92, 1
  store i64 %1179, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 35)
  %1180 = load i32, i32* %16, align 4
  %1181 = load i32*, i32** %9, align 8
  %1182 = load i32, i32* %18, align 4
  %1183 = add nsw i32 %1182, 2
  %1184 = load i32, i32* %13, align 4
  %1185 = mul nsw i32 %1183, %1184
  %1186 = load i32, i32* %19, align 4
  %1187 = add nsw i32 %1185, %1186
  %1188 = sub nsw i32 %1187, 3
  %1189 = sext i32 %1188 to i64
  %1190 = getelementptr inbounds i32, i32* %1181, i64 %1189
  %1191 = load i32, i32* %1190, align 4
  %1192 = icmp sge i32 %1180, %1191
  br i1 %1192, label %1193, label %2265

; <label>:1193:                                   ; preds = %1178
  %pgocount93 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 36)
  %1194 = add i64 %pgocount93, 1
  store i64 %1194, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 36)
  %1195 = load i32, i32* %16, align 4
  %1196 = load i32*, i32** %9, align 8
  %1197 = load i32, i32* %18, align 4
  %1198 = add nsw i32 %1197, 2
  %1199 = load i32, i32* %13, align 4
  %1200 = mul nsw i32 %1198, %1199
  %1201 = load i32, i32* %19, align 4
  %1202 = add nsw i32 %1200, %1201
  %1203 = sub nsw i32 %1202, 2
  %1204 = sext i32 %1203 to i64
  %1205 = getelementptr inbounds i32, i32* %1196, i64 %1204
  %1206 = load i32, i32* %1205, align 4
  %1207 = icmp sge i32 %1195, %1206
  br i1 %1207, label %1208, label %2265

; <label>:1208:                                   ; preds = %1193
  %pgocount94 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 37)
  %1209 = add i64 %pgocount94, 1
  store i64 %1209, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 37)
  %1210 = load i32, i32* %16, align 4
  %1211 = load i32*, i32** %9, align 8
  %1212 = load i32, i32* %18, align 4
  %1213 = add nsw i32 %1212, 2
  %1214 = load i32, i32* %13, align 4
  %1215 = mul nsw i32 %1213, %1214
  %1216 = load i32, i32* %19, align 4
  %1217 = add nsw i32 %1215, %1216
  %1218 = sub nsw i32 %1217, 1
  %1219 = sext i32 %1218 to i64
  %1220 = getelementptr inbounds i32, i32* %1211, i64 %1219
  %1221 = load i32, i32* %1220, align 4
  %1222 = icmp sge i32 %1210, %1221
  br i1 %1222, label %1223, label %2265

; <label>:1223:                                   ; preds = %1208
  %pgocount95 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 38)
  %1224 = add i64 %pgocount95, 1
  store i64 %1224, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 38)
  %1225 = load i32, i32* %16, align 4
  %1226 = load i32*, i32** %9, align 8
  %1227 = load i32, i32* %18, align 4
  %1228 = add nsw i32 %1227, 2
  %1229 = load i32, i32* %13, align 4
  %1230 = mul nsw i32 %1228, %1229
  %1231 = load i32, i32* %19, align 4
  %1232 = add nsw i32 %1230, %1231
  %1233 = sext i32 %1232 to i64
  %1234 = getelementptr inbounds i32, i32* %1226, i64 %1233
  %1235 = load i32, i32* %1234, align 4
  %1236 = icmp sge i32 %1225, %1235
  br i1 %1236, label %1237, label %2265

; <label>:1237:                                   ; preds = %1223
  %pgocount96 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 39)
  %1238 = add i64 %pgocount96, 1
  store i64 %1238, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 39)
  %1239 = load i32, i32* %16, align 4
  %1240 = load i32*, i32** %9, align 8
  %1241 = load i32, i32* %18, align 4
  %1242 = add nsw i32 %1241, 2
  %1243 = load i32, i32* %13, align 4
  %1244 = mul nsw i32 %1242, %1243
  %1245 = load i32, i32* %19, align 4
  %1246 = add nsw i32 %1244, %1245
  %1247 = add nsw i32 %1246, 1
  %1248 = sext i32 %1247 to i64
  %1249 = getelementptr inbounds i32, i32* %1240, i64 %1248
  %1250 = load i32, i32* %1249, align 4
  %1251 = icmp sge i32 %1239, %1250
  br i1 %1251, label %1252, label %2265

; <label>:1252:                                   ; preds = %1237
  %pgocount97 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 40)
  %1253 = add i64 %pgocount97, 1
  store i64 %1253, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 40)
  %1254 = load i32, i32* %16, align 4
  %1255 = load i32*, i32** %9, align 8
  %1256 = load i32, i32* %18, align 4
  %1257 = add nsw i32 %1256, 2
  %1258 = load i32, i32* %13, align 4
  %1259 = mul nsw i32 %1257, %1258
  %1260 = load i32, i32* %19, align 4
  %1261 = add nsw i32 %1259, %1260
  %1262 = add nsw i32 %1261, 2
  %1263 = sext i32 %1262 to i64
  %1264 = getelementptr inbounds i32, i32* %1255, i64 %1263
  %1265 = load i32, i32* %1264, align 4
  %1266 = icmp sge i32 %1254, %1265
  br i1 %1266, label %1267, label %2265

; <label>:1267:                                   ; preds = %1252
  %pgocount98 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 41)
  %1268 = add i64 %pgocount98, 1
  store i64 %1268, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 41)
  %1269 = load i32, i32* %16, align 4
  %1270 = load i32*, i32** %9, align 8
  %1271 = load i32, i32* %18, align 4
  %1272 = add nsw i32 %1271, 2
  %1273 = load i32, i32* %13, align 4
  %1274 = mul nsw i32 %1272, %1273
  %1275 = load i32, i32* %19, align 4
  %1276 = add nsw i32 %1274, %1275
  %1277 = add nsw i32 %1276, 3
  %1278 = sext i32 %1277 to i64
  %1279 = getelementptr inbounds i32, i32* %1270, i64 %1278
  %1280 = load i32, i32* %1279, align 4
  %1281 = icmp sge i32 %1269, %1280
  br i1 %1281, label %1282, label %2265

; <label>:1282:                                   ; preds = %1267
  %pgocount99 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 42)
  %1283 = add i64 %pgocount99, 1
  store i64 %1283, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 42)
  %1284 = load i32, i32* %16, align 4
  %1285 = load i32*, i32** %9, align 8
  %1286 = load i32, i32* %18, align 4
  %1287 = add nsw i32 %1286, 3
  %1288 = load i32, i32* %13, align 4
  %1289 = mul nsw i32 %1287, %1288
  %1290 = load i32, i32* %19, align 4
  %1291 = add nsw i32 %1289, %1290
  %1292 = sub nsw i32 %1291, 3
  %1293 = sext i32 %1292 to i64
  %1294 = getelementptr inbounds i32, i32* %1285, i64 %1293
  %1295 = load i32, i32* %1294, align 4
  %1296 = icmp sge i32 %1284, %1295
  br i1 %1296, label %1297, label %2265

; <label>:1297:                                   ; preds = %1282
  %pgocount100 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 43)
  %1298 = add i64 %pgocount100, 1
  store i64 %1298, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 43)
  %1299 = load i32, i32* %16, align 4
  %1300 = load i32*, i32** %9, align 8
  %1301 = load i32, i32* %18, align 4
  %1302 = add nsw i32 %1301, 3
  %1303 = load i32, i32* %13, align 4
  %1304 = mul nsw i32 %1302, %1303
  %1305 = load i32, i32* %19, align 4
  %1306 = add nsw i32 %1304, %1305
  %1307 = sub nsw i32 %1306, 2
  %1308 = sext i32 %1307 to i64
  %1309 = getelementptr inbounds i32, i32* %1300, i64 %1308
  %1310 = load i32, i32* %1309, align 4
  %1311 = icmp sge i32 %1299, %1310
  br i1 %1311, label %1312, label %2265

; <label>:1312:                                   ; preds = %1297
  %pgocount101 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 44)
  %1313 = add i64 %pgocount101, 1
  store i64 %1313, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 44)
  %1314 = load i32, i32* %16, align 4
  %1315 = load i32*, i32** %9, align 8
  %1316 = load i32, i32* %18, align 4
  %1317 = add nsw i32 %1316, 3
  %1318 = load i32, i32* %13, align 4
  %1319 = mul nsw i32 %1317, %1318
  %1320 = load i32, i32* %19, align 4
  %1321 = add nsw i32 %1319, %1320
  %1322 = sub nsw i32 %1321, 1
  %1323 = sext i32 %1322 to i64
  %1324 = getelementptr inbounds i32, i32* %1315, i64 %1323
  %1325 = load i32, i32* %1324, align 4
  %1326 = icmp sge i32 %1314, %1325
  br i1 %1326, label %1327, label %2265

; <label>:1327:                                   ; preds = %1312
  %pgocount102 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 45)
  %1328 = add i64 %pgocount102, 1
  store i64 %1328, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 45)
  %1329 = load i32, i32* %16, align 4
  %1330 = load i32*, i32** %9, align 8
  %1331 = load i32, i32* %18, align 4
  %1332 = add nsw i32 %1331, 3
  %1333 = load i32, i32* %13, align 4
  %1334 = mul nsw i32 %1332, %1333
  %1335 = load i32, i32* %19, align 4
  %1336 = add nsw i32 %1334, %1335
  %1337 = sext i32 %1336 to i64
  %1338 = getelementptr inbounds i32, i32* %1330, i64 %1337
  %1339 = load i32, i32* %1338, align 4
  %1340 = icmp sge i32 %1329, %1339
  br i1 %1340, label %1341, label %2265

; <label>:1341:                                   ; preds = %1327
  %pgocount103 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 46)
  %1342 = add i64 %pgocount103, 1
  store i64 %1342, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 46)
  %1343 = load i32, i32* %16, align 4
  %1344 = load i32*, i32** %9, align 8
  %1345 = load i32, i32* %18, align 4
  %1346 = add nsw i32 %1345, 3
  %1347 = load i32, i32* %13, align 4
  %1348 = mul nsw i32 %1346, %1347
  %1349 = load i32, i32* %19, align 4
  %1350 = add nsw i32 %1348, %1349
  %1351 = add nsw i32 %1350, 1
  %1352 = sext i32 %1351 to i64
  %1353 = getelementptr inbounds i32, i32* %1344, i64 %1352
  %1354 = load i32, i32* %1353, align 4
  %1355 = icmp sge i32 %1343, %1354
  br i1 %1355, label %1356, label %2265

; <label>:1356:                                   ; preds = %1341
  %pgocount104 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 47)
  %1357 = add i64 %pgocount104, 1
  store i64 %1357, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 47)
  %1358 = load i32, i32* %16, align 4
  %1359 = load i32*, i32** %9, align 8
  %1360 = load i32, i32* %18, align 4
  %1361 = add nsw i32 %1360, 3
  %1362 = load i32, i32* %13, align 4
  %1363 = mul nsw i32 %1361, %1362
  %1364 = load i32, i32* %19, align 4
  %1365 = add nsw i32 %1363, %1364
  %1366 = add nsw i32 %1365, 2
  %1367 = sext i32 %1366 to i64
  %1368 = getelementptr inbounds i32, i32* %1359, i64 %1367
  %1369 = load i32, i32* %1368, align 4
  %1370 = icmp sge i32 %1358, %1369
  br i1 %1370, label %1371, label %2265

; <label>:1371:                                   ; preds = %1356
  %pgocount105 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 48)
  %1372 = add i64 %pgocount105, 1
  store i64 %1372, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 48)
  %1373 = load i32, i32* %16, align 4
  %1374 = load i32*, i32** %9, align 8
  %1375 = load i32, i32* %18, align 4
  %1376 = add nsw i32 %1375, 3
  %1377 = load i32, i32* %13, align 4
  %1378 = mul nsw i32 %1376, %1377
  %1379 = load i32, i32* %19, align 4
  %1380 = add nsw i32 %1378, %1379
  %1381 = add nsw i32 %1380, 3
  %1382 = sext i32 %1381 to i64
  %1383 = getelementptr inbounds i32, i32* %1374, i64 %1382
  %1384 = load i32, i32* %1383, align 4
  %1385 = icmp sge i32 %1373, %1384
  br i1 %1385, label %1386, label %2265

; <label>:1386:                                   ; preds = %1371
  %1387 = load %struct.anon*, %struct.anon** %12, align 8
  %1388 = load i32, i32* %15, align 4
  %1389 = sext i32 %1388 to i64
  %1390 = getelementptr inbounds %struct.anon, %struct.anon* %1387, i64 %1389
  %1391 = getelementptr inbounds %struct.anon, %struct.anon* %1390, i32 0, i32 2
  store i32 0, i32* %1391, align 4
  %1392 = load i32, i32* %19, align 4
  %1393 = load %struct.anon*, %struct.anon** %12, align 8
  %1394 = load i32, i32* %15, align 4
  %1395 = sext i32 %1394 to i64
  %1396 = getelementptr inbounds %struct.anon, %struct.anon* %1393, i64 %1395
  %1397 = getelementptr inbounds %struct.anon, %struct.anon* %1396, i32 0, i32 0
  store i32 %1392, i32* %1397, align 4
  %1398 = load i32, i32* %18, align 4
  %1399 = load %struct.anon*, %struct.anon** %12, align 8
  %1400 = load i32, i32* %15, align 4
  %1401 = sext i32 %1400 to i64
  %1402 = getelementptr inbounds %struct.anon, %struct.anon* %1399, i64 %1401
  %1403 = getelementptr inbounds %struct.anon, %struct.anon* %1402, i32 0, i32 1
  store i32 %1398, i32* %1403, align 4
  %1404 = load i8*, i8** %8, align 8
  %1405 = load i32, i32* %18, align 4
  %1406 = sub nsw i32 %1405, 2
  %1407 = load i32, i32* %13, align 4
  %1408 = mul nsw i32 %1406, %1407
  %1409 = load i32, i32* %19, align 4
  %1410 = add nsw i32 %1408, %1409
  %1411 = sub nsw i32 %1410, 2
  %1412 = sext i32 %1411 to i64
  %1413 = getelementptr inbounds i8, i8* %1404, i64 %1412
  %1414 = load i8, i8* %1413, align 1
  %1415 = zext i8 %1414 to i32
  %1416 = load i8*, i8** %8, align 8
  %1417 = load i32, i32* %18, align 4
  %1418 = sub nsw i32 %1417, 2
  %1419 = load i32, i32* %13, align 4
  %1420 = mul nsw i32 %1418, %1419
  %1421 = load i32, i32* %19, align 4
  %1422 = add nsw i32 %1420, %1421
  %1423 = sub nsw i32 %1422, 1
  %1424 = sext i32 %1423 to i64
  %1425 = getelementptr inbounds i8, i8* %1416, i64 %1424
  %1426 = load i8, i8* %1425, align 1
  %1427 = zext i8 %1426 to i32
  %1428 = add nsw i32 %1415, %1427
  %1429 = load i8*, i8** %8, align 8
  %1430 = load i32, i32* %18, align 4
  %1431 = sub nsw i32 %1430, 2
  %1432 = load i32, i32* %13, align 4
  %1433 = mul nsw i32 %1431, %1432
  %1434 = load i32, i32* %19, align 4
  %1435 = add nsw i32 %1433, %1434
  %1436 = sext i32 %1435 to i64
  %1437 = getelementptr inbounds i8, i8* %1429, i64 %1436
  %1438 = load i8, i8* %1437, align 1
  %1439 = zext i8 %1438 to i32
  %1440 = add nsw i32 %1428, %1439
  %1441 = load i8*, i8** %8, align 8
  %1442 = load i32, i32* %18, align 4
  %1443 = sub nsw i32 %1442, 2
  %1444 = load i32, i32* %13, align 4
  %1445 = mul nsw i32 %1443, %1444
  %1446 = load i32, i32* %19, align 4
  %1447 = add nsw i32 %1445, %1446
  %1448 = add nsw i32 %1447, 1
  %1449 = sext i32 %1448 to i64
  %1450 = getelementptr inbounds i8, i8* %1441, i64 %1449
  %1451 = load i8, i8* %1450, align 1
  %1452 = zext i8 %1451 to i32
  %1453 = add nsw i32 %1440, %1452
  %1454 = load i8*, i8** %8, align 8
  %1455 = load i32, i32* %18, align 4
  %1456 = sub nsw i32 %1455, 2
  %1457 = load i32, i32* %13, align 4
  %1458 = mul nsw i32 %1456, %1457
  %1459 = load i32, i32* %19, align 4
  %1460 = add nsw i32 %1458, %1459
  %1461 = add nsw i32 %1460, 2
  %1462 = sext i32 %1461 to i64
  %1463 = getelementptr inbounds i8, i8* %1454, i64 %1462
  %1464 = load i8, i8* %1463, align 1
  %1465 = zext i8 %1464 to i32
  %1466 = add nsw i32 %1453, %1465
  %1467 = load i8*, i8** %8, align 8
  %1468 = load i32, i32* %18, align 4
  %1469 = sub nsw i32 %1468, 1
  %1470 = load i32, i32* %13, align 4
  %1471 = mul nsw i32 %1469, %1470
  %1472 = load i32, i32* %19, align 4
  %1473 = add nsw i32 %1471, %1472
  %1474 = sub nsw i32 %1473, 2
  %1475 = sext i32 %1474 to i64
  %1476 = getelementptr inbounds i8, i8* %1467, i64 %1475
  %1477 = load i8, i8* %1476, align 1
  %1478 = zext i8 %1477 to i32
  %1479 = add nsw i32 %1466, %1478
  %1480 = load i8*, i8** %8, align 8
  %1481 = load i32, i32* %18, align 4
  %1482 = sub nsw i32 %1481, 1
  %1483 = load i32, i32* %13, align 4
  %1484 = mul nsw i32 %1482, %1483
  %1485 = load i32, i32* %19, align 4
  %1486 = add nsw i32 %1484, %1485
  %1487 = sub nsw i32 %1486, 1
  %1488 = sext i32 %1487 to i64
  %1489 = getelementptr inbounds i8, i8* %1480, i64 %1488
  %1490 = load i8, i8* %1489, align 1
  %1491 = zext i8 %1490 to i32
  %1492 = add nsw i32 %1479, %1491
  %1493 = load i8*, i8** %8, align 8
  %1494 = load i32, i32* %18, align 4
  %1495 = sub nsw i32 %1494, 1
  %1496 = load i32, i32* %13, align 4
  %1497 = mul nsw i32 %1495, %1496
  %1498 = load i32, i32* %19, align 4
  %1499 = add nsw i32 %1497, %1498
  %1500 = sext i32 %1499 to i64
  %1501 = getelementptr inbounds i8, i8* %1493, i64 %1500
  %1502 = load i8, i8* %1501, align 1
  %1503 = zext i8 %1502 to i32
  %1504 = add nsw i32 %1492, %1503
  %1505 = load i8*, i8** %8, align 8
  %1506 = load i32, i32* %18, align 4
  %1507 = sub nsw i32 %1506, 1
  %1508 = load i32, i32* %13, align 4
  %1509 = mul nsw i32 %1507, %1508
  %1510 = load i32, i32* %19, align 4
  %1511 = add nsw i32 %1509, %1510
  %1512 = add nsw i32 %1511, 1
  %1513 = sext i32 %1512 to i64
  %1514 = getelementptr inbounds i8, i8* %1505, i64 %1513
  %1515 = load i8, i8* %1514, align 1
  %1516 = zext i8 %1515 to i32
  %1517 = add nsw i32 %1504, %1516
  %1518 = load i8*, i8** %8, align 8
  %1519 = load i32, i32* %18, align 4
  %1520 = sub nsw i32 %1519, 1
  %1521 = load i32, i32* %13, align 4
  %1522 = mul nsw i32 %1520, %1521
  %1523 = load i32, i32* %19, align 4
  %1524 = add nsw i32 %1522, %1523
  %1525 = add nsw i32 %1524, 2
  %1526 = sext i32 %1525 to i64
  %1527 = getelementptr inbounds i8, i8* %1518, i64 %1526
  %1528 = load i8, i8* %1527, align 1
  %1529 = zext i8 %1528 to i32
  %1530 = add nsw i32 %1517, %1529
  %1531 = load i8*, i8** %8, align 8
  %1532 = load i32, i32* %18, align 4
  %1533 = load i32, i32* %13, align 4
  %1534 = mul nsw i32 %1532, %1533
  %1535 = load i32, i32* %19, align 4
  %1536 = add nsw i32 %1534, %1535
  %1537 = sub nsw i32 %1536, 2
  %1538 = sext i32 %1537 to i64
  %1539 = getelementptr inbounds i8, i8* %1531, i64 %1538
  %1540 = load i8, i8* %1539, align 1
  %1541 = zext i8 %1540 to i32
  %1542 = add nsw i32 %1530, %1541
  %1543 = load i8*, i8** %8, align 8
  %1544 = load i32, i32* %18, align 4
  %1545 = load i32, i32* %13, align 4
  %1546 = mul nsw i32 %1544, %1545
  %1547 = load i32, i32* %19, align 4
  %1548 = add nsw i32 %1546, %1547
  %1549 = sub nsw i32 %1548, 1
  %1550 = sext i32 %1549 to i64
  %1551 = getelementptr inbounds i8, i8* %1543, i64 %1550
  %1552 = load i8, i8* %1551, align 1
  %1553 = zext i8 %1552 to i32
  %1554 = add nsw i32 %1542, %1553
  %1555 = load i8*, i8** %8, align 8
  %1556 = load i32, i32* %18, align 4
  %1557 = load i32, i32* %13, align 4
  %1558 = mul nsw i32 %1556, %1557
  %1559 = load i32, i32* %19, align 4
  %1560 = add nsw i32 %1558, %1559
  %1561 = sext i32 %1560 to i64
  %1562 = getelementptr inbounds i8, i8* %1555, i64 %1561
  %1563 = load i8, i8* %1562, align 1
  %1564 = zext i8 %1563 to i32
  %1565 = add nsw i32 %1554, %1564
  %1566 = load i8*, i8** %8, align 8
  %1567 = load i32, i32* %18, align 4
  %1568 = load i32, i32* %13, align 4
  %1569 = mul nsw i32 %1567, %1568
  %1570 = load i32, i32* %19, align 4
  %1571 = add nsw i32 %1569, %1570
  %1572 = add nsw i32 %1571, 1
  %1573 = sext i32 %1572 to i64
  %1574 = getelementptr inbounds i8, i8* %1566, i64 %1573
  %1575 = load i8, i8* %1574, align 1
  %1576 = zext i8 %1575 to i32
  %1577 = add nsw i32 %1565, %1576
  %1578 = load i8*, i8** %8, align 8
  %1579 = load i32, i32* %18, align 4
  %1580 = load i32, i32* %13, align 4
  %1581 = mul nsw i32 %1579, %1580
  %1582 = load i32, i32* %19, align 4
  %1583 = add nsw i32 %1581, %1582
  %1584 = add nsw i32 %1583, 2
  %1585 = sext i32 %1584 to i64
  %1586 = getelementptr inbounds i8, i8* %1578, i64 %1585
  %1587 = load i8, i8* %1586, align 1
  %1588 = zext i8 %1587 to i32
  %1589 = add nsw i32 %1577, %1588
  %1590 = load i8*, i8** %8, align 8
  %1591 = load i32, i32* %18, align 4
  %1592 = add nsw i32 %1591, 1
  %1593 = load i32, i32* %13, align 4
  %1594 = mul nsw i32 %1592, %1593
  %1595 = load i32, i32* %19, align 4
  %1596 = add nsw i32 %1594, %1595
  %1597 = sub nsw i32 %1596, 2
  %1598 = sext i32 %1597 to i64
  %1599 = getelementptr inbounds i8, i8* %1590, i64 %1598
  %1600 = load i8, i8* %1599, align 1
  %1601 = zext i8 %1600 to i32
  %1602 = add nsw i32 %1589, %1601
  %1603 = load i8*, i8** %8, align 8
  %1604 = load i32, i32* %18, align 4
  %1605 = add nsw i32 %1604, 1
  %1606 = load i32, i32* %13, align 4
  %1607 = mul nsw i32 %1605, %1606
  %1608 = load i32, i32* %19, align 4
  %1609 = add nsw i32 %1607, %1608
  %1610 = sub nsw i32 %1609, 1
  %1611 = sext i32 %1610 to i64
  %1612 = getelementptr inbounds i8, i8* %1603, i64 %1611
  %1613 = load i8, i8* %1612, align 1
  %1614 = zext i8 %1613 to i32
  %1615 = add nsw i32 %1602, %1614
  %1616 = load i8*, i8** %8, align 8
  %1617 = load i32, i32* %18, align 4
  %1618 = add nsw i32 %1617, 1
  %1619 = load i32, i32* %13, align 4
  %1620 = mul nsw i32 %1618, %1619
  %1621 = load i32, i32* %19, align 4
  %1622 = add nsw i32 %1620, %1621
  %1623 = sext i32 %1622 to i64
  %1624 = getelementptr inbounds i8, i8* %1616, i64 %1623
  %1625 = load i8, i8* %1624, align 1
  %1626 = zext i8 %1625 to i32
  %1627 = add nsw i32 %1615, %1626
  %1628 = load i8*, i8** %8, align 8
  %1629 = load i32, i32* %18, align 4
  %1630 = add nsw i32 %1629, 1
  %1631 = load i32, i32* %13, align 4
  %1632 = mul nsw i32 %1630, %1631
  %1633 = load i32, i32* %19, align 4
  %1634 = add nsw i32 %1632, %1633
  %1635 = add nsw i32 %1634, 1
  %1636 = sext i32 %1635 to i64
  %1637 = getelementptr inbounds i8, i8* %1628, i64 %1636
  %1638 = load i8, i8* %1637, align 1
  %1639 = zext i8 %1638 to i32
  %1640 = add nsw i32 %1627, %1639
  %1641 = load i8*, i8** %8, align 8
  %1642 = load i32, i32* %18, align 4
  %1643 = add nsw i32 %1642, 1
  %1644 = load i32, i32* %13, align 4
  %1645 = mul nsw i32 %1643, %1644
  %1646 = load i32, i32* %19, align 4
  %1647 = add nsw i32 %1645, %1646
  %1648 = add nsw i32 %1647, 2
  %1649 = sext i32 %1648 to i64
  %1650 = getelementptr inbounds i8, i8* %1641, i64 %1649
  %1651 = load i8, i8* %1650, align 1
  %1652 = zext i8 %1651 to i32
  %1653 = add nsw i32 %1640, %1652
  %1654 = load i8*, i8** %8, align 8
  %1655 = load i32, i32* %18, align 4
  %1656 = add nsw i32 %1655, 2
  %1657 = load i32, i32* %13, align 4
  %1658 = mul nsw i32 %1656, %1657
  %1659 = load i32, i32* %19, align 4
  %1660 = add nsw i32 %1658, %1659
  %1661 = sub nsw i32 %1660, 2
  %1662 = sext i32 %1661 to i64
  %1663 = getelementptr inbounds i8, i8* %1654, i64 %1662
  %1664 = load i8, i8* %1663, align 1
  %1665 = zext i8 %1664 to i32
  %1666 = add nsw i32 %1653, %1665
  %1667 = load i8*, i8** %8, align 8
  %1668 = load i32, i32* %18, align 4
  %1669 = add nsw i32 %1668, 2
  %1670 = load i32, i32* %13, align 4
  %1671 = mul nsw i32 %1669, %1670
  %1672 = load i32, i32* %19, align 4
  %1673 = add nsw i32 %1671, %1672
  %1674 = sub nsw i32 %1673, 1
  %1675 = sext i32 %1674 to i64
  %1676 = getelementptr inbounds i8, i8* %1667, i64 %1675
  %1677 = load i8, i8* %1676, align 1
  %1678 = zext i8 %1677 to i32
  %1679 = add nsw i32 %1666, %1678
  %1680 = load i8*, i8** %8, align 8
  %1681 = load i32, i32* %18, align 4
  %1682 = add nsw i32 %1681, 2
  %1683 = load i32, i32* %13, align 4
  %1684 = mul nsw i32 %1682, %1683
  %1685 = load i32, i32* %19, align 4
  %1686 = add nsw i32 %1684, %1685
  %1687 = sext i32 %1686 to i64
  %1688 = getelementptr inbounds i8, i8* %1680, i64 %1687
  %1689 = load i8, i8* %1688, align 1
  %1690 = zext i8 %1689 to i32
  %1691 = add nsw i32 %1679, %1690
  %1692 = load i8*, i8** %8, align 8
  %1693 = load i32, i32* %18, align 4
  %1694 = add nsw i32 %1693, 2
  %1695 = load i32, i32* %13, align 4
  %1696 = mul nsw i32 %1694, %1695
  %1697 = load i32, i32* %19, align 4
  %1698 = add nsw i32 %1696, %1697
  %1699 = add nsw i32 %1698, 1
  %1700 = sext i32 %1699 to i64
  %1701 = getelementptr inbounds i8, i8* %1692, i64 %1700
  %1702 = load i8, i8* %1701, align 1
  %1703 = zext i8 %1702 to i32
  %1704 = add nsw i32 %1691, %1703
  %1705 = load i8*, i8** %8, align 8
  %1706 = load i32, i32* %18, align 4
  %1707 = add nsw i32 %1706, 2
  %1708 = load i32, i32* %13, align 4
  %1709 = mul nsw i32 %1707, %1708
  %1710 = load i32, i32* %19, align 4
  %1711 = add nsw i32 %1709, %1710
  %1712 = add nsw i32 %1711, 2
  %1713 = sext i32 %1712 to i64
  %1714 = getelementptr inbounds i8, i8* %1705, i64 %1713
  %1715 = load i8, i8* %1714, align 1
  %1716 = zext i8 %1715 to i32
  %1717 = add nsw i32 %1704, %1716
  store i32 %1717, i32* %16, align 4
  %1718 = load i32, i32* %16, align 4
  %1719 = sdiv i32 %1718, 25
  %1720 = load %struct.anon*, %struct.anon** %12, align 8
  %1721 = load i32, i32* %15, align 4
  %1722 = sext i32 %1721 to i64
  %1723 = getelementptr inbounds %struct.anon, %struct.anon* %1720, i64 %1722
  %1724 = getelementptr inbounds %struct.anon, %struct.anon* %1723, i32 0, i32 5
  store i32 %1719, i32* %1724, align 4
  %1725 = load i8*, i8** %8, align 8
  %1726 = load i32, i32* %18, align 4
  %1727 = sub nsw i32 %1726, 2
  %1728 = load i32, i32* %13, align 4
  %1729 = mul nsw i32 %1727, %1728
  %1730 = load i32, i32* %19, align 4
  %1731 = add nsw i32 %1729, %1730
  %1732 = add nsw i32 %1731, 2
  %1733 = sext i32 %1732 to i64
  %1734 = getelementptr inbounds i8, i8* %1725, i64 %1733
  %1735 = load i8, i8* %1734, align 1
  %1736 = zext i8 %1735 to i32
  %1737 = load i8*, i8** %8, align 8
  %1738 = load i32, i32* %18, align 4
  %1739 = sub nsw i32 %1738, 1
  %1740 = load i32, i32* %13, align 4
  %1741 = mul nsw i32 %1739, %1740
  %1742 = load i32, i32* %19, align 4
  %1743 = add nsw i32 %1741, %1742
  %1744 = add nsw i32 %1743, 2
  %1745 = sext i32 %1744 to i64
  %1746 = getelementptr inbounds i8, i8* %1737, i64 %1745
  %1747 = load i8, i8* %1746, align 1
  %1748 = zext i8 %1747 to i32
  %1749 = add nsw i32 %1736, %1748
  %1750 = load i8*, i8** %8, align 8
  %1751 = load i32, i32* %18, align 4
  %1752 = load i32, i32* %13, align 4
  %1753 = mul nsw i32 %1751, %1752
  %1754 = load i32, i32* %19, align 4
  %1755 = add nsw i32 %1753, %1754
  %1756 = add nsw i32 %1755, 2
  %1757 = sext i32 %1756 to i64
  %1758 = getelementptr inbounds i8, i8* %1750, i64 %1757
  %1759 = load i8, i8* %1758, align 1
  %1760 = zext i8 %1759 to i32
  %1761 = add nsw i32 %1749, %1760
  %1762 = load i8*, i8** %8, align 8
  %1763 = load i32, i32* %18, align 4
  %1764 = add nsw i32 %1763, 1
  %1765 = load i32, i32* %13, align 4
  %1766 = mul nsw i32 %1764, %1765
  %1767 = load i32, i32* %19, align 4
  %1768 = add nsw i32 %1766, %1767
  %1769 = add nsw i32 %1768, 2
  %1770 = sext i32 %1769 to i64
  %1771 = getelementptr inbounds i8, i8* %1762, i64 %1770
  %1772 = load i8, i8* %1771, align 1
  %1773 = zext i8 %1772 to i32
  %1774 = add nsw i32 %1761, %1773
  %1775 = load i8*, i8** %8, align 8
  %1776 = load i32, i32* %18, align 4
  %1777 = add nsw i32 %1776, 2
  %1778 = load i32, i32* %13, align 4
  %1779 = mul nsw i32 %1777, %1778
  %1780 = load i32, i32* %19, align 4
  %1781 = add nsw i32 %1779, %1780
  %1782 = add nsw i32 %1781, 2
  %1783 = sext i32 %1782 to i64
  %1784 = getelementptr inbounds i8, i8* %1775, i64 %1783
  %1785 = load i8, i8* %1784, align 1
  %1786 = zext i8 %1785 to i32
  %1787 = add nsw i32 %1774, %1786
  %1788 = load i8*, i8** %8, align 8
  %1789 = load i32, i32* %18, align 4
  %1790 = sub nsw i32 %1789, 2
  %1791 = load i32, i32* %13, align 4
  %1792 = mul nsw i32 %1790, %1791
  %1793 = load i32, i32* %19, align 4
  %1794 = add nsw i32 %1792, %1793
  %1795 = sub nsw i32 %1794, 2
  %1796 = sext i32 %1795 to i64
  %1797 = getelementptr inbounds i8, i8* %1788, i64 %1796
  %1798 = load i8, i8* %1797, align 1
  %1799 = zext i8 %1798 to i32
  %1800 = load i8*, i8** %8, align 8
  %1801 = load i32, i32* %18, align 4
  %1802 = sub nsw i32 %1801, 1
  %1803 = load i32, i32* %13, align 4
  %1804 = mul nsw i32 %1802, %1803
  %1805 = load i32, i32* %19, align 4
  %1806 = add nsw i32 %1804, %1805
  %1807 = sub nsw i32 %1806, 2
  %1808 = sext i32 %1807 to i64
  %1809 = getelementptr inbounds i8, i8* %1800, i64 %1808
  %1810 = load i8, i8* %1809, align 1
  %1811 = zext i8 %1810 to i32
  %1812 = add nsw i32 %1799, %1811
  %1813 = load i8*, i8** %8, align 8
  %1814 = load i32, i32* %18, align 4
  %1815 = load i32, i32* %13, align 4
  %1816 = mul nsw i32 %1814, %1815
  %1817 = load i32, i32* %19, align 4
  %1818 = add nsw i32 %1816, %1817
  %1819 = sub nsw i32 %1818, 2
  %1820 = sext i32 %1819 to i64
  %1821 = getelementptr inbounds i8, i8* %1813, i64 %1820
  %1822 = load i8, i8* %1821, align 1
  %1823 = zext i8 %1822 to i32
  %1824 = add nsw i32 %1812, %1823
  %1825 = load i8*, i8** %8, align 8
  %1826 = load i32, i32* %18, align 4
  %1827 = add nsw i32 %1826, 1
  %1828 = load i32, i32* %13, align 4
  %1829 = mul nsw i32 %1827, %1828
  %1830 = load i32, i32* %19, align 4
  %1831 = add nsw i32 %1829, %1830
  %1832 = sub nsw i32 %1831, 2
  %1833 = sext i32 %1832 to i64
  %1834 = getelementptr inbounds i8, i8* %1825, i64 %1833
  %1835 = load i8, i8* %1834, align 1
  %1836 = zext i8 %1835 to i32
  %1837 = add nsw i32 %1824, %1836
  %1838 = load i8*, i8** %8, align 8
  %1839 = load i32, i32* %18, align 4
  %1840 = add nsw i32 %1839, 2
  %1841 = load i32, i32* %13, align 4
  %1842 = mul nsw i32 %1840, %1841
  %1843 = load i32, i32* %19, align 4
  %1844 = add nsw i32 %1842, %1843
  %1845 = sub nsw i32 %1844, 2
  %1846 = sext i32 %1845 to i64
  %1847 = getelementptr inbounds i8, i8* %1838, i64 %1846
  %1848 = load i8, i8* %1847, align 1
  %1849 = zext i8 %1848 to i32
  %1850 = add nsw i32 %1837, %1849
  %1851 = sub nsw i32 %1787, %1850
  store i32 %1851, i32* %16, align 4
  %1852 = load i32, i32* %16, align 4
  %1853 = load i8*, i8** %8, align 8
  %1854 = load i32, i32* %18, align 4
  %1855 = sub nsw i32 %1854, 2
  %1856 = load i32, i32* %13, align 4
  %1857 = mul nsw i32 %1855, %1856
  %1858 = load i32, i32* %19, align 4
  %1859 = add nsw i32 %1857, %1858
  %1860 = add nsw i32 %1859, 1
  %1861 = sext i32 %1860 to i64
  %1862 = getelementptr inbounds i8, i8* %1853, i64 %1861
  %1863 = load i8, i8* %1862, align 1
  %1864 = zext i8 %1863 to i32
  %1865 = add nsw i32 %1852, %1864
  %1866 = load i8*, i8** %8, align 8
  %1867 = load i32, i32* %18, align 4
  %1868 = sub nsw i32 %1867, 1
  %1869 = load i32, i32* %13, align 4
  %1870 = mul nsw i32 %1868, %1869
  %1871 = load i32, i32* %19, align 4
  %1872 = add nsw i32 %1870, %1871
  %1873 = add nsw i32 %1872, 1
  %1874 = sext i32 %1873 to i64
  %1875 = getelementptr inbounds i8, i8* %1866, i64 %1874
  %1876 = load i8, i8* %1875, align 1
  %1877 = zext i8 %1876 to i32
  %1878 = add nsw i32 %1865, %1877
  %1879 = load i8*, i8** %8, align 8
  %1880 = load i32, i32* %18, align 4
  %1881 = load i32, i32* %13, align 4
  %1882 = mul nsw i32 %1880, %1881
  %1883 = load i32, i32* %19, align 4
  %1884 = add nsw i32 %1882, %1883
  %1885 = add nsw i32 %1884, 1
  %1886 = sext i32 %1885 to i64
  %1887 = getelementptr inbounds i8, i8* %1879, i64 %1886
  %1888 = load i8, i8* %1887, align 1
  %1889 = zext i8 %1888 to i32
  %1890 = add nsw i32 %1878, %1889
  %1891 = load i8*, i8** %8, align 8
  %1892 = load i32, i32* %18, align 4
  %1893 = add nsw i32 %1892, 1
  %1894 = load i32, i32* %13, align 4
  %1895 = mul nsw i32 %1893, %1894
  %1896 = load i32, i32* %19, align 4
  %1897 = add nsw i32 %1895, %1896
  %1898 = add nsw i32 %1897, 1
  %1899 = sext i32 %1898 to i64
  %1900 = getelementptr inbounds i8, i8* %1891, i64 %1899
  %1901 = load i8, i8* %1900, align 1
  %1902 = zext i8 %1901 to i32
  %1903 = add nsw i32 %1890, %1902
  %1904 = load i8*, i8** %8, align 8
  %1905 = load i32, i32* %18, align 4
  %1906 = add nsw i32 %1905, 2
  %1907 = load i32, i32* %13, align 4
  %1908 = mul nsw i32 %1906, %1907
  %1909 = load i32, i32* %19, align 4
  %1910 = add nsw i32 %1908, %1909
  %1911 = add nsw i32 %1910, 1
  %1912 = sext i32 %1911 to i64
  %1913 = getelementptr inbounds i8, i8* %1904, i64 %1912
  %1914 = load i8, i8* %1913, align 1
  %1915 = zext i8 %1914 to i32
  %1916 = add nsw i32 %1903, %1915
  %1917 = load i8*, i8** %8, align 8
  %1918 = load i32, i32* %18, align 4
  %1919 = sub nsw i32 %1918, 2
  %1920 = load i32, i32* %13, align 4
  %1921 = mul nsw i32 %1919, %1920
  %1922 = load i32, i32* %19, align 4
  %1923 = add nsw i32 %1921, %1922
  %1924 = sub nsw i32 %1923, 1
  %1925 = sext i32 %1924 to i64
  %1926 = getelementptr inbounds i8, i8* %1917, i64 %1925
  %1927 = load i8, i8* %1926, align 1
  %1928 = zext i8 %1927 to i32
  %1929 = load i8*, i8** %8, align 8
  %1930 = load i32, i32* %18, align 4
  %1931 = sub nsw i32 %1930, 1
  %1932 = load i32, i32* %13, align 4
  %1933 = mul nsw i32 %1931, %1932
  %1934 = load i32, i32* %19, align 4
  %1935 = add nsw i32 %1933, %1934
  %1936 = sub nsw i32 %1935, 1
  %1937 = sext i32 %1936 to i64
  %1938 = getelementptr inbounds i8, i8* %1929, i64 %1937
  %1939 = load i8, i8* %1938, align 1
  %1940 = zext i8 %1939 to i32
  %1941 = add nsw i32 %1928, %1940
  %1942 = load i8*, i8** %8, align 8
  %1943 = load i32, i32* %18, align 4
  %1944 = load i32, i32* %13, align 4
  %1945 = mul nsw i32 %1943, %1944
  %1946 = load i32, i32* %19, align 4
  %1947 = add nsw i32 %1945, %1946
  %1948 = sub nsw i32 %1947, 1
  %1949 = sext i32 %1948 to i64
  %1950 = getelementptr inbounds i8, i8* %1942, i64 %1949
  %1951 = load i8, i8* %1950, align 1
  %1952 = zext i8 %1951 to i32
  %1953 = add nsw i32 %1941, %1952
  %1954 = load i8*, i8** %8, align 8
  %1955 = load i32, i32* %18, align 4
  %1956 = add nsw i32 %1955, 1
  %1957 = load i32, i32* %13, align 4
  %1958 = mul nsw i32 %1956, %1957
  %1959 = load i32, i32* %19, align 4
  %1960 = add nsw i32 %1958, %1959
  %1961 = sub nsw i32 %1960, 1
  %1962 = sext i32 %1961 to i64
  %1963 = getelementptr inbounds i8, i8* %1954, i64 %1962
  %1964 = load i8, i8* %1963, align 1
  %1965 = zext i8 %1964 to i32
  %1966 = add nsw i32 %1953, %1965
  %1967 = load i8*, i8** %8, align 8
  %1968 = load i32, i32* %18, align 4
  %1969 = add nsw i32 %1968, 2
  %1970 = load i32, i32* %13, align 4
  %1971 = mul nsw i32 %1969, %1970
  %1972 = load i32, i32* %19, align 4
  %1973 = add nsw i32 %1971, %1972
  %1974 = sub nsw i32 %1973, 1
  %1975 = sext i32 %1974 to i64
  %1976 = getelementptr inbounds i8, i8* %1967, i64 %1975
  %1977 = load i8, i8* %1976, align 1
  %1978 = zext i8 %1977 to i32
  %1979 = add nsw i32 %1966, %1978
  %1980 = sub nsw i32 %1916, %1979
  %1981 = load i32, i32* %16, align 4
  %1982 = add nsw i32 %1981, %1980
  store i32 %1982, i32* %16, align 4
  %1983 = load i8*, i8** %8, align 8
  %1984 = load i32, i32* %18, align 4
  %1985 = add nsw i32 %1984, 2
  %1986 = load i32, i32* %13, align 4
  %1987 = mul nsw i32 %1985, %1986
  %1988 = load i32, i32* %19, align 4
  %1989 = add nsw i32 %1987, %1988
  %1990 = sub nsw i32 %1989, 2
  %1991 = sext i32 %1990 to i64
  %1992 = getelementptr inbounds i8, i8* %1983, i64 %1991
  %1993 = load i8, i8* %1992, align 1
  %1994 = zext i8 %1993 to i32
  %1995 = load i8*, i8** %8, align 8
  %1996 = load i32, i32* %18, align 4
  %1997 = add nsw i32 %1996, 2
  %1998 = load i32, i32* %13, align 4
  %1999 = mul nsw i32 %1997, %1998
  %2000 = load i32, i32* %19, align 4
  %2001 = add nsw i32 %1999, %2000
  %2002 = sub nsw i32 %2001, 1
  %2003 = sext i32 %2002 to i64
  %2004 = getelementptr inbounds i8, i8* %1995, i64 %2003
  %2005 = load i8, i8* %2004, align 1
  %2006 = zext i8 %2005 to i32
  %2007 = add nsw i32 %1994, %2006
  %2008 = load i8*, i8** %8, align 8
  %2009 = load i32, i32* %18, align 4
  %2010 = add nsw i32 %2009, 2
  %2011 = load i32, i32* %13, align 4
  %2012 = mul nsw i32 %2010, %2011
  %2013 = load i32, i32* %19, align 4
  %2014 = add nsw i32 %2012, %2013
  %2015 = sext i32 %2014 to i64
  %2016 = getelementptr inbounds i8, i8* %2008, i64 %2015
  %2017 = load i8, i8* %2016, align 1
  %2018 = zext i8 %2017 to i32
  %2019 = add nsw i32 %2007, %2018
  %2020 = load i8*, i8** %8, align 8
  %2021 = load i32, i32* %18, align 4
  %2022 = add nsw i32 %2021, 2
  %2023 = load i32, i32* %13, align 4
  %2024 = mul nsw i32 %2022, %2023
  %2025 = load i32, i32* %19, align 4
  %2026 = add nsw i32 %2024, %2025
  %2027 = add nsw i32 %2026, 1
  %2028 = sext i32 %2027 to i64
  %2029 = getelementptr inbounds i8, i8* %2020, i64 %2028
  %2030 = load i8, i8* %2029, align 1
  %2031 = zext i8 %2030 to i32
  %2032 = add nsw i32 %2019, %2031
  %2033 = load i8*, i8** %8, align 8
  %2034 = load i32, i32* %18, align 4
  %2035 = add nsw i32 %2034, 2
  %2036 = load i32, i32* %13, align 4
  %2037 = mul nsw i32 %2035, %2036
  %2038 = load i32, i32* %19, align 4
  %2039 = add nsw i32 %2037, %2038
  %2040 = add nsw i32 %2039, 2
  %2041 = sext i32 %2040 to i64
  %2042 = getelementptr inbounds i8, i8* %2033, i64 %2041
  %2043 = load i8, i8* %2042, align 1
  %2044 = zext i8 %2043 to i32
  %2045 = add nsw i32 %2032, %2044
  %2046 = load i8*, i8** %8, align 8
  %2047 = load i32, i32* %18, align 4
  %2048 = sub nsw i32 %2047, 2
  %2049 = load i32, i32* %13, align 4
  %2050 = mul nsw i32 %2048, %2049
  %2051 = load i32, i32* %19, align 4
  %2052 = add nsw i32 %2050, %2051
  %2053 = sub nsw i32 %2052, 2
  %2054 = sext i32 %2053 to i64
  %2055 = getelementptr inbounds i8, i8* %2046, i64 %2054
  %2056 = load i8, i8* %2055, align 1
  %2057 = zext i8 %2056 to i32
  %2058 = load i8*, i8** %8, align 8
  %2059 = load i32, i32* %18, align 4
  %2060 = sub nsw i32 %2059, 2
  %2061 = load i32, i32* %13, align 4
  %2062 = mul nsw i32 %2060, %2061
  %2063 = load i32, i32* %19, align 4
  %2064 = add nsw i32 %2062, %2063
  %2065 = sub nsw i32 %2064, 1
  %2066 = sext i32 %2065 to i64
  %2067 = getelementptr inbounds i8, i8* %2058, i64 %2066
  %2068 = load i8, i8* %2067, align 1
  %2069 = zext i8 %2068 to i32
  %2070 = add nsw i32 %2057, %2069
  %2071 = load i8*, i8** %8, align 8
  %2072 = load i32, i32* %18, align 4
  %2073 = sub nsw i32 %2072, 2
  %2074 = load i32, i32* %13, align 4
  %2075 = mul nsw i32 %2073, %2074
  %2076 = load i32, i32* %19, align 4
  %2077 = add nsw i32 %2075, %2076
  %2078 = sext i32 %2077 to i64
  %2079 = getelementptr inbounds i8, i8* %2071, i64 %2078
  %2080 = load i8, i8* %2079, align 1
  %2081 = zext i8 %2080 to i32
  %2082 = add nsw i32 %2070, %2081
  %2083 = load i8*, i8** %8, align 8
  %2084 = load i32, i32* %18, align 4
  %2085 = sub nsw i32 %2084, 2
  %2086 = load i32, i32* %13, align 4
  %2087 = mul nsw i32 %2085, %2086
  %2088 = load i32, i32* %19, align 4
  %2089 = add nsw i32 %2087, %2088
  %2090 = add nsw i32 %2089, 1
  %2091 = sext i32 %2090 to i64
  %2092 = getelementptr inbounds i8, i8* %2083, i64 %2091
  %2093 = load i8, i8* %2092, align 1
  %2094 = zext i8 %2093 to i32
  %2095 = add nsw i32 %2082, %2094
  %2096 = load i8*, i8** %8, align 8
  %2097 = load i32, i32* %18, align 4
  %2098 = sub nsw i32 %2097, 2
  %2099 = load i32, i32* %13, align 4
  %2100 = mul nsw i32 %2098, %2099
  %2101 = load i32, i32* %19, align 4
  %2102 = add nsw i32 %2100, %2101
  %2103 = add nsw i32 %2102, 2
  %2104 = sext i32 %2103 to i64
  %2105 = getelementptr inbounds i8, i8* %2096, i64 %2104
  %2106 = load i8, i8* %2105, align 1
  %2107 = zext i8 %2106 to i32
  %2108 = add nsw i32 %2095, %2107
  %2109 = sub nsw i32 %2045, %2108
  store i32 %2109, i32* %17, align 4
  %2110 = load i32, i32* %17, align 4
  %2111 = load i8*, i8** %8, align 8
  %2112 = load i32, i32* %18, align 4
  %2113 = add nsw i32 %2112, 1
  %2114 = load i32, i32* %13, align 4
  %2115 = mul nsw i32 %2113, %2114
  %2116 = load i32, i32* %19, align 4
  %2117 = add nsw i32 %2115, %2116
  %2118 = sub nsw i32 %2117, 2
  %2119 = sext i32 %2118 to i64
  %2120 = getelementptr inbounds i8, i8* %2111, i64 %2119
  %2121 = load i8, i8* %2120, align 1
  %2122 = zext i8 %2121 to i32
  %2123 = add nsw i32 %2110, %2122
  %2124 = load i8*, i8** %8, align 8
  %2125 = load i32, i32* %18, align 4
  %2126 = add nsw i32 %2125, 1
  %2127 = load i32, i32* %13, align 4
  %2128 = mul nsw i32 %2126, %2127
  %2129 = load i32, i32* %19, align 4
  %2130 = add nsw i32 %2128, %2129
  %2131 = sub nsw i32 %2130, 1
  %2132 = sext i32 %2131 to i64
  %2133 = getelementptr inbounds i8, i8* %2124, i64 %2132
  %2134 = load i8, i8* %2133, align 1
  %2135 = zext i8 %2134 to i32
  %2136 = add nsw i32 %2123, %2135
  %2137 = load i8*, i8** %8, align 8
  %2138 = load i32, i32* %18, align 4
  %2139 = add nsw i32 %2138, 1
  %2140 = load i32, i32* %13, align 4
  %2141 = mul nsw i32 %2139, %2140
  %2142 = load i32, i32* %19, align 4
  %2143 = add nsw i32 %2141, %2142
  %2144 = sext i32 %2143 to i64
  %2145 = getelementptr inbounds i8, i8* %2137, i64 %2144
  %2146 = load i8, i8* %2145, align 1
  %2147 = zext i8 %2146 to i32
  %2148 = add nsw i32 %2136, %2147
  %2149 = load i8*, i8** %8, align 8
  %2150 = load i32, i32* %18, align 4
  %2151 = add nsw i32 %2150, 1
  %2152 = load i32, i32* %13, align 4
  %2153 = mul nsw i32 %2151, %2152
  %2154 = load i32, i32* %19, align 4
  %2155 = add nsw i32 %2153, %2154
  %2156 = add nsw i32 %2155, 1
  %2157 = sext i32 %2156 to i64
  %2158 = getelementptr inbounds i8, i8* %2149, i64 %2157
  %2159 = load i8, i8* %2158, align 1
  %2160 = zext i8 %2159 to i32
  %2161 = add nsw i32 %2148, %2160
  %2162 = load i8*, i8** %8, align 8
  %2163 = load i32, i32* %18, align 4
  %2164 = add nsw i32 %2163, 1
  %2165 = load i32, i32* %13, align 4
  %2166 = mul nsw i32 %2164, %2165
  %2167 = load i32, i32* %19, align 4
  %2168 = add nsw i32 %2166, %2167
  %2169 = add nsw i32 %2168, 2
  %2170 = sext i32 %2169 to i64
  %2171 = getelementptr inbounds i8, i8* %2162, i64 %2170
  %2172 = load i8, i8* %2171, align 1
  %2173 = zext i8 %2172 to i32
  %2174 = add nsw i32 %2161, %2173
  %2175 = load i8*, i8** %8, align 8
  %2176 = load i32, i32* %18, align 4
  %2177 = sub nsw i32 %2176, 1
  %2178 = load i32, i32* %13, align 4
  %2179 = mul nsw i32 %2177, %2178
  %2180 = load i32, i32* %19, align 4
  %2181 = add nsw i32 %2179, %2180
  %2182 = sub nsw i32 %2181, 2
  %2183 = sext i32 %2182 to i64
  %2184 = getelementptr inbounds i8, i8* %2175, i64 %2183
  %2185 = load i8, i8* %2184, align 1
  %2186 = zext i8 %2185 to i32
  %2187 = load i8*, i8** %8, align 8
  %2188 = load i32, i32* %18, align 4
  %2189 = sub nsw i32 %2188, 1
  %2190 = load i32, i32* %13, align 4
  %2191 = mul nsw i32 %2189, %2190
  %2192 = load i32, i32* %19, align 4
  %2193 = add nsw i32 %2191, %2192
  %2194 = sub nsw i32 %2193, 1
  %2195 = sext i32 %2194 to i64
  %2196 = getelementptr inbounds i8, i8* %2187, i64 %2195
  %2197 = load i8, i8* %2196, align 1
  %2198 = zext i8 %2197 to i32
  %2199 = add nsw i32 %2186, %2198
  %2200 = load i8*, i8** %8, align 8
  %2201 = load i32, i32* %18, align 4
  %2202 = sub nsw i32 %2201, 1
  %2203 = load i32, i32* %13, align 4
  %2204 = mul nsw i32 %2202, %2203
  %2205 = load i32, i32* %19, align 4
  %2206 = add nsw i32 %2204, %2205
  %2207 = sext i32 %2206 to i64
  %2208 = getelementptr inbounds i8, i8* %2200, i64 %2207
  %2209 = load i8, i8* %2208, align 1
  %2210 = zext i8 %2209 to i32
  %2211 = add nsw i32 %2199, %2210
  %2212 = load i8*, i8** %8, align 8
  %2213 = load i32, i32* %18, align 4
  %2214 = sub nsw i32 %2213, 1
  %2215 = load i32, i32* %13, align 4
  %2216 = mul nsw i32 %2214, %2215
  %2217 = load i32, i32* %19, align 4
  %2218 = add nsw i32 %2216, %2217
  %2219 = add nsw i32 %2218, 1
  %2220 = sext i32 %2219 to i64
  %2221 = getelementptr inbounds i8, i8* %2212, i64 %2220
  %2222 = load i8, i8* %2221, align 1
  %2223 = zext i8 %2222 to i32
  %2224 = add nsw i32 %2211, %2223
  %2225 = load i8*, i8** %8, align 8
  %2226 = load i32, i32* %18, align 4
  %2227 = sub nsw i32 %2226, 1
  %2228 = load i32, i32* %13, align 4
  %2229 = mul nsw i32 %2227, %2228
  %2230 = load i32, i32* %19, align 4
  %2231 = add nsw i32 %2229, %2230
  %2232 = add nsw i32 %2231, 2
  %2233 = sext i32 %2232 to i64
  %2234 = getelementptr inbounds i8, i8* %2225, i64 %2233
  %2235 = load i8, i8* %2234, align 1
  %2236 = zext i8 %2235 to i32
  %2237 = add nsw i32 %2224, %2236
  %2238 = sub nsw i32 %2174, %2237
  %2239 = load i32, i32* %17, align 4
  %2240 = add nsw i32 %2239, %2238
  store i32 %2240, i32* %17, align 4
  %2241 = load i32, i32* %16, align 4
  %2242 = sdiv i32 %2241, 15
  %2243 = load %struct.anon*, %struct.anon** %12, align 8
  %2244 = load i32, i32* %15, align 4
  %2245 = sext i32 %2244 to i64
  %2246 = getelementptr inbounds %struct.anon, %struct.anon* %2243, i64 %2245
  %2247 = getelementptr inbounds %struct.anon, %struct.anon* %2246, i32 0, i32 3
  store i32 %2242, i32* %2247, align 4
  %2248 = load i32, i32* %17, align 4
  %2249 = sdiv i32 %2248, 15
  %2250 = load %struct.anon*, %struct.anon** %12, align 8
  %2251 = load i32, i32* %15, align 4
  %2252 = sext i32 %2251 to i64
  %2253 = getelementptr inbounds %struct.anon, %struct.anon* %2250, i64 %2252
  %2254 = getelementptr inbounds %struct.anon, %struct.anon* %2253, i32 0, i32 4
  store i32 %2249, i32* %2254, align 4
  %2255 = load i32, i32* %15, align 4
  %2256 = add nsw i32 %2255, 1
  store i32 %2256, i32* %15, align 4
  %2257 = load i32, i32* %15, align 4
  %2258 = icmp eq i32 %2257, 15000
  br i1 %2258, label %2259, label %2263

; <label>:2259:                                   ; preds = %1386
  %pgocount106 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 72)
  %2260 = add i64 %pgocount106, 1
  store i64 %2260, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 72)
  %2261 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2262 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2261, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

; <label>:2263:                                   ; preds = %1386
  %pgocount107 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 49)
  %2264 = add i64 %pgocount107, 1
  store i64 %2264, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 49)
  br label %2265

; <label>:2265:                                   ; preds = %2263, %1371, %1356, %1341, %1327, %1312, %1297, %1282, %1267, %1252, %1237, %1223, %1208, %1193, %1178, %1163, %1148, %1133, %1119, %1104, %1089, %1074, %1060, %1046, %1032, %1018, %1005, %._crit_edge38, %._crit_edge37, %._crit_edge36, %._crit_edge35, %._crit_edge34, %._crit_edge33, %._crit_edge32, %._crit_edge31, %._crit_edge30, %._crit_edge29, %._crit_edge28, %._crit_edge27, %._crit_edge26, %._crit_edge25, %._crit_edge24, %._crit_edge23, %._crit_edge22, %._crit_edge21, %._crit_edge20, %._crit_edge19, %._crit_edge18, %679
  %pgocount108 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 73)
  %2266 = add i64 %pgocount108, 1
  store i64 %2266, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 73)
  br label %2267

; <label>:2267:                                   ; preds = %2265, %667
  br label %2268

; <label>:2268:                                   ; preds = %2267
  %pgocount109 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 1)
  %2269 = add i64 %pgocount109, 1
  store i64 %2269, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 1)
  %2270 = load i32, i32* %19, align 4
  %2271 = add nsw i32 %2270, 1
  store i32 %2271, i32* %19, align 4
  br label %662

; <label>:2272:                                   ; preds = %662
  br label %2273

; <label>:2273:                                   ; preds = %2272
  %pgocount110 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 15)
  %2274 = add i64 %pgocount110, 1
  store i64 %2274, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 15)
  %2275 = load i32, i32* %18, align 4
  %2276 = add nsw i32 %2275, 1
  store i32 %2276, i32* %18, align 4
  br label %656

; <label>:2277:                                   ; preds = %656
  %pgocount111 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 0)
  %2278 = add i64 %pgocount111, 1
  store i64 %2278, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_susan_corners_quick, i64 0, i64 0)
  %2279 = load %struct.anon*, %struct.anon** %12, align 8
  %2280 = load i32, i32* %15, align 4
  %2281 = sext i32 %2280 to i64
  %2282 = getelementptr inbounds %struct.anon, %struct.anon* %2279, i64 %2281
  %2283 = getelementptr inbounds %struct.anon, %struct.anon* %2282, i32 0, i32 2
  store i32 7, i32* %2283, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @main1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca float, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca [15000 x %struct.anon], align 16
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store float 4.000000e+00, float* %9, align 4
  store i32 3, i32* %11, align 4
  store i32 20, i32* %12, align 4
  store i32 0, i32* %13, align 4
  store i32 1, i32* %14, align 4
  store i32 0, i32* %15, align 4
  store i32 0, i32* %16, align 4
  store i32 0, i32* %17, align 4
  store i32 1850, i32* %18, align 4
  store i32 2650, i32* %19, align 4
  store i32 0, i32* %20, align 4
  %24 = load i32, i32* %3, align 4
  %25 = icmp slt i32 %24, 3
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 14)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 14)
  call void @usage()
  br label %28

; <label>:28:                                     ; preds = %26, %2
  %29 = load i8**, i8*** %4, align 8
  %30 = getelementptr inbounds i8*, i8** %29, i64 1
  %31 = load i8*, i8** %30, align 8
  call void @get_image(i8* %31, i8** %6, i32* %21, i32* %22)
  br label %32

; <label>:32:                                     ; preds = %109, %28
  %33 = load i32, i32* %11, align 4
  %34 = load i32, i32* %3, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %112

; <label>:36:                                     ; preds = %32
  %37 = load i8**, i8*** %4, align 8
  %38 = load i32, i32* %11, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8*, i8** %37, i64 %39
  %41 = load i8*, i8** %40, align 8
  store i8* %41, i8** %5, align 8
  %42 = load i8*, i8** %5, align 8
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp eq i32 %44, 45
  br i1 %45, label %46, label %107

; <label>:46:                                     ; preds = %36
  %47 = load i8*, i8** %5, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %5, align 8
  %49 = load i8, i8* %48, align 1
  %50 = sext i8 %49 to i32
  switch i32 %50, label %105 [
    i32 115, label %51
    i32 101, label %53
    i32 99, label %55
    i32 112, label %57
    i32 110, label %59
    i32 98, label %61
    i32 51, label %63
    i32 113, label %65
    i32 100, label %67
    i32 116, label %89
  ]

; <label>:51:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 2)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 2)
  store i32 0, i32* %20, align 4
  br label %105

; <label>:53:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 3)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 3)
  store i32 1, i32* %20, align 4
  br label %105

; <label>:55:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 4)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 4)
  store i32 2, i32* %20, align 4
  br label %105

; <label>:57:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 5)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 5)
  store i32 1, i32* %13, align 4
  br label %105

; <label>:59:                                     ; preds = %46
  %pgocount5 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 6)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 6)
  store i32 0, i32* %14, align 4
  br label %105

; <label>:61:                                     ; preds = %46
  %pgocount6 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 7)
  %62 = add i64 %pgocount6, 1
  store i64 %62, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 7)
  store i32 1, i32* %16, align 4
  br label %105

; <label>:63:                                     ; preds = %46
  %pgocount7 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 8)
  %64 = add i64 %pgocount7, 1
  store i64 %64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 8)
  store i32 1, i32* %15, align 4
  br label %105

; <label>:65:                                     ; preds = %46
  %pgocount8 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 9)
  %66 = add i64 %pgocount8, 1
  store i64 %66, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 9)
  store i32 1, i32* %17, align 4
  br label %105

; <label>:67:                                     ; preds = %46
  %68 = load i32, i32* %11, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %11, align 4
  %70 = load i32, i32* %3, align 4
  %71 = icmp sge i32 %69, %70
  br i1 %71, label %72, label %75

; <label>:72:                                     ; preds = %67
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 26)
  %73 = add i64 %pgocount9, 1
  store i64 %73, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 26)
  %74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.30, i32 0, i32 0))
  call void @exit(i32 0) #8
  unreachable

; <label>:75:                                     ; preds = %67
  %76 = load i8**, i8*** %4, align 8
  %77 = load i32, i32* %11, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8*, i8** %76, i64 %78
  %80 = load i8*, i8** %79, align 8
  %81 = call double @atof(i8* %80) #10
  %82 = fptrunc double %81 to float
  store float %82, float* %9, align 4
  %83 = load float, float* %9, align 4
  %84 = fcmp olt float %83, 0.000000e+00
  br i1 %84, label %85, label %87

; <label>:85:                                     ; preds = %75
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 13)
  %86 = add i64 %pgocount10, 1
  store i64 %86, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 13)
  store i32 1, i32* %15, align 4
  br label %87

; <label>:87:                                     ; preds = %85, %75
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 10)
  %88 = add i64 %pgocount11, 1
  store i64 %88, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 10)
  br label %105

; <label>:89:                                     ; preds = %46
  %90 = load i32, i32* %11, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %11, align 4
  %92 = load i32, i32* %3, align 4
  %93 = icmp sge i32 %91, %92
  br i1 %93, label %94, label %97

; <label>:94:                                     ; preds = %89
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 27)
  %95 = add i64 %pgocount12, 1
  store i64 %95, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 27)
  %96 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.31, i32 0, i32 0))
  call void @exit(i32 0) #8
  unreachable

; <label>:97:                                     ; preds = %89
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 11)
  %98 = add i64 %pgocount13, 1
  store i64 %98, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 11)
  %99 = load i8**, i8*** %4, align 8
  %100 = load i32, i32* %11, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8*, i8** %99, i64 %101
  %103 = load i8*, i8** %102, align 8
  %104 = call i32 @atoi(i8* %103) #10
  store i32 %104, i32* %12, align 4
  br label %105

; <label>:105:                                    ; preds = %97, %87, %65, %63, %61, %59, %57, %55, %53, %51, %46
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 1)
  %106 = add i64 %pgocount14, 1
  store i64 %106, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 1)
  br label %109

; <label>:107:                                    ; preds = %36
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 0)
  %108 = add i64 %pgocount15, 1
  store i64 %108, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 0)
  call void @usage()
  br label %109

; <label>:109:                                    ; preds = %107, %105
  %110 = load i32, i32* %11, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %11, align 4
  br label %32

; <label>:112:                                    ; preds = %32
  %113 = load i32, i32* %13, align 4
  %114 = icmp eq i32 %113, 1
  br i1 %114, label %115, label %121

; <label>:115:                                    ; preds = %112
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 15)
  %116 = add i64 %pgocount16, 1
  store i64 %116, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 15)
  %117 = load i32, i32* %20, align 4
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %119, label %121

; <label>:119:                                    ; preds = %115
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 17)
  %120 = add i64 %pgocount17, 1
  store i64 %120, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 17)
  store i32 1, i32* %20, align 4
  br label %121

; <label>:121:                                    ; preds = %119, %115, %112
  %122 = load i32, i32* %20, align 4
  switch i32 %122, label %274 [
    i32 0, label %123
    i32 1, label %133
    i32 2, label %220
  ]

; <label>:123:                                    ; preds = %121
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 16)
  %124 = add i64 %pgocount18, 1
  store i64 %124, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 16)
  %125 = load i32, i32* %12, align 4
  call void @setup_brightness_lut(i8** %7, i32 %125, i32 2)
  %126 = load i32, i32* %15, align 4
  %127 = load i8*, i8** %6, align 8
  %128 = load float, float* %9, align 4
  %129 = load i32, i32* %21, align 4
  %130 = load i32, i32* %22, align 4
  %131 = load i8*, i8** %7, align 8
  call void @susan_smoothing(i32 %126, i8* %127, float %128, i32 %129, i32 %130, i8* %131)
  %132 = load i8*, i8** %7, align 8
  call void @free_brightness_lut(i8* %132)
  br label %274

; <label>:133:                                    ; preds = %121
  %134 = load i32, i32* %21, align 4
  %135 = load i32, i32* %22, align 4
  %136 = mul nsw i32 %134, %135
  %137 = sext i32 %136 to i64
  %138 = mul i64 %137, 4
  %139 = call noalias i8* @malloc(i64 %138) #7
  %140 = bitcast i8* %139 to i32*
  store i32* %140, i32** %10, align 8
  %141 = load i32, i32* %12, align 4
  call void @setup_brightness_lut(i8** %7, i32 %141, i32 6)
  %142 = load i32, i32* %13, align 4
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %144, label %169

; <label>:144:                                    ; preds = %133
  %145 = load i32, i32* %15, align 4
  %146 = icmp ne i32 %145, 0
  br i1 %146, label %147, label %155

; <label>:147:                                    ; preds = %144
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 19)
  %148 = add i64 %pgocount19, 1
  store i64 %148, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 19)
  %149 = load i8*, i8** %6, align 8
  %150 = load i32*, i32** %10, align 8
  %151 = load i8*, i8** %7, align 8
  %152 = load i32, i32* %19, align 4
  %153 = load i32, i32* %21, align 4
  %154 = load i32, i32* %22, align 4
  call void @susan_principle_small(i8* %149, i32* %150, i8* %151, i32 %152, i32 %153, i32 %154)
  br label %163

; <label>:155:                                    ; preds = %144
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 20)
  %156 = add i64 %pgocount20, 1
  store i64 %156, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 20)
  %157 = load i8*, i8** %6, align 8
  %158 = load i32*, i32** %10, align 8
  %159 = load i8*, i8** %7, align 8
  %160 = load i32, i32* %19, align 4
  %161 = load i32, i32* %21, align 4
  %162 = load i32, i32* %22, align 4
  call void @susan_principle(i8* %157, i32* %158, i8* %159, i32 %160, i32 %161, i32 %162)
  br label %163

; <label>:163:                                    ; preds = %155, %147
  %164 = load i32*, i32** %10, align 8
  %165 = load i8*, i8** %6, align 8
  %166 = load i32, i32* %21, align 4
  %167 = load i32, i32* %22, align 4
  %168 = mul nsw i32 %166, %167
  call void @int_to_uchar(i32* %164, i8* %165, i32 %168)
  br label %216

; <label>:169:                                    ; preds = %133
  %170 = load i32, i32* %21, align 4
  %171 = load i32, i32* %22, align 4
  %172 = mul nsw i32 %170, %171
  %173 = sext i32 %172 to i64
  %174 = call noalias i8* @malloc(i64 %173) #7
  store i8* %174, i8** %8, align 8
  %175 = load i8*, i8** %8, align 8
  %176 = load i32, i32* %21, align 4
  %177 = load i32, i32* %22, align 4
  %178 = mul nsw i32 %176, %177
  %179 = sext i32 %178 to i64
  call void @llvm.memset.p0i8.i64(i8* %175, i8 100, i64 %179, i32 1, i1 false)
  %180 = load i32, i32* %15, align 4
  %181 = icmp ne i32 %180, 0
  br i1 %181, label %182, label %191

; <label>:182:                                    ; preds = %169
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 21)
  %183 = add i64 %pgocount21, 1
  store i64 %183, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 21)
  %184 = load i8*, i8** %6, align 8
  %185 = load i32*, i32** %10, align 8
  %186 = load i8*, i8** %8, align 8
  %187 = load i8*, i8** %7, align 8
  %188 = load i32, i32* %19, align 4
  %189 = load i32, i32* %21, align 4
  %190 = load i32, i32* %22, align 4
  call void @susan_edges_small(i8* %184, i32* %185, i8* %186, i8* %187, i32 %188, i32 %189, i32 %190)
  br label %200

; <label>:191:                                    ; preds = %169
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 24)
  %192 = add i64 %pgocount22, 1
  store i64 %192, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 24)
  %193 = load i8*, i8** %6, align 8
  %194 = load i32*, i32** %10, align 8
  %195 = load i8*, i8** %8, align 8
  %196 = load i8*, i8** %7, align 8
  %197 = load i32, i32* %19, align 4
  %198 = load i32, i32* %21, align 4
  %199 = load i32, i32* %22, align 4
  call void @susan_edges(i8* %193, i32* %194, i8* %195, i8* %196, i32 %197, i32 %198, i32 %199)
  br label %200

; <label>:200:                                    ; preds = %191, %182
  %201 = load i32, i32* %14, align 4
  %202 = icmp ne i32 %201, 0
  br i1 %202, label %203, label %209

; <label>:203:                                    ; preds = %200
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 22)
  %204 = add i64 %pgocount23, 1
  store i64 %204, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 22)
  %205 = load i32*, i32** %10, align 8
  %206 = load i8*, i8** %8, align 8
  %207 = load i32, i32* %21, align 4
  %208 = load i32, i32* %22, align 4
  call void @susan_thin(i32* %205, i8* %206, i32 %207, i32 %208)
  br label %209

; <label>:209:                                    ; preds = %203, %200
  %210 = load i8*, i8** %6, align 8
  %211 = load i8*, i8** %8, align 8
  %212 = load i32, i32* %21, align 4
  %213 = load i32, i32* %22, align 4
  %214 = load i32, i32* %16, align 4
  call void @edge_draw(i8* %210, i8* %211, i32 %212, i32 %213, i32 %214)
  %215 = load i8*, i8** %8, align 8
  call void @free(i8* %215) #7
  br label %216

; <label>:216:                                    ; preds = %209, %163
  %217 = load i8*, i8** %7, align 8
  call void @free_brightness_lut(i8* %217)
  %218 = load i32*, i32** %10, align 8
  %219 = bitcast i32* %218 to i8*
  call void @free(i8* %219) #7
  br label %274

; <label>:220:                                    ; preds = %121
  %221 = load i32, i32* %21, align 4
  %222 = load i32, i32* %22, align 4
  %223 = mul nsw i32 %221, %222
  %224 = sext i32 %223 to i64
  %225 = mul i64 %224, 4
  %226 = call noalias i8* @malloc(i64 %225) #7
  %227 = bitcast i8* %226 to i32*
  store i32* %227, i32** %10, align 8
  %228 = load i32, i32* %12, align 4
  call void @setup_brightness_lut(i8** %7, i32 %228, i32 6)
  %229 = load i32, i32* %13, align 4
  %230 = icmp ne i32 %229, 0
  br i1 %230, label %231, label %244

; <label>:231:                                    ; preds = %220
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 18)
  %232 = add i64 %pgocount24, 1
  store i64 %232, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 18)
  %233 = load i8*, i8** %6, align 8
  %234 = load i32*, i32** %10, align 8
  %235 = load i8*, i8** %7, align 8
  %236 = load i32, i32* %18, align 4
  %237 = load i32, i32* %21, align 4
  %238 = load i32, i32* %22, align 4
  call void @susan_principle(i8* %233, i32* %234, i8* %235, i32 %236, i32 %237, i32 %238)
  %239 = load i32*, i32** %10, align 8
  %240 = load i8*, i8** %6, align 8
  %241 = load i32, i32* %21, align 4
  %242 = load i32, i32* %22, align 4
  %243 = mul nsw i32 %241, %242
  call void @int_to_uchar(i32* %239, i8* %240, i32 %243)
  br label %270

; <label>:244:                                    ; preds = %220
  %245 = load i32, i32* %17, align 4
  %246 = icmp ne i32 %245, 0
  br i1 %246, label %247, label %256

; <label>:247:                                    ; preds = %244
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 23)
  %248 = add i64 %pgocount25, 1
  store i64 %248, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 23)
  %249 = load i8*, i8** %6, align 8
  %250 = load i32*, i32** %10, align 8
  %251 = load i8*, i8** %7, align 8
  %252 = load i32, i32* %18, align 4
  %253 = getelementptr inbounds [15000 x %struct.anon], [15000 x %struct.anon]* %23, i32 0, i32 0
  %254 = load i32, i32* %21, align 4
  %255 = load i32, i32* %22, align 4
  call void @susan_corners_quick(i8* %249, i32* %250, i8* %251, i32 %252, %struct.anon* %253, i32 %254, i32 %255)
  br label %265

; <label>:256:                                    ; preds = %244
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 25)
  %257 = add i64 %pgocount26, 1
  store i64 %257, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 25)
  %258 = load i8*, i8** %6, align 8
  %259 = load i32*, i32** %10, align 8
  %260 = load i8*, i8** %7, align 8
  %261 = load i32, i32* %18, align 4
  %262 = getelementptr inbounds [15000 x %struct.anon], [15000 x %struct.anon]* %23, i32 0, i32 0
  %263 = load i32, i32* %21, align 4
  %264 = load i32, i32* %22, align 4
  call void @susan_corners(i8* %258, i32* %259, i8* %260, i32 %261, %struct.anon* %262, i32 %263, i32 %264)
  br label %265

; <label>:265:                                    ; preds = %256, %247
  %266 = load i8*, i8** %6, align 8
  %267 = getelementptr inbounds [15000 x %struct.anon], [15000 x %struct.anon]* %23, i32 0, i32 0
  %268 = load i32, i32* %21, align 4
  %269 = load i32, i32* %16, align 4
  call void @corner_draw(i8* %266, %struct.anon* %267, i32 %268, i32 %269)
  br label %270

; <label>:270:                                    ; preds = %265, %231
  %271 = load i8*, i8** %7, align 8
  call void @free_brightness_lut(i8* %271)
  %272 = load i32*, i32** %10, align 8
  %273 = bitcast i32* %272 to i8*
  call void @free(i8* %273) #7
  br label %274

; <label>:274:                                    ; preds = %270, %216, %123, %121
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 12)
  %275 = add i64 %pgocount27, 1
  store i64 %275, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main1, i64 0, i64 12)
  %276 = load i8**, i8*** %4, align 8
  %277 = getelementptr inbounds i8*, i8** %276, i64 2
  %278 = load i8*, i8** %277, align 8
  %279 = load i8*, i8** %6, align 8
  %280 = load i32, i32* %21, align 4
  %281 = load i32, i32* %22, align 4
  call void @put_image(i8* %278, i8* %279, i32 %280, i32 %281)
  %282 = load i8*, i8** %6, align 8
  call void @free(i8* %282) #7
  ret void
}

; Function Attrs: nounwind readonly
declare double @atof(i8*) #6

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #6

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #7

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readnone }
attributes #10 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
