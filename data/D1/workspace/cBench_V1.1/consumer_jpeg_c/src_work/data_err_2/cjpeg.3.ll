; ModuleID = 'cjpeg.2.ll'
source_filename = "cjpeg.c"
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
%struct.cjpeg_source_struct = type { void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, %struct._IO_FILE*, i8**, i32 }

$__llvm_profile_raw_version = comdat any

@progname = internal global i8* null, align 8
@.str = private unnamed_addr constant [6 x i8] c"cjpeg\00", align 1
@cdjpeg_message_table = internal constant [44 x i8*] [i8* null, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.39, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.44, i32 0, i32 0), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.45, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.46, i32 0, i32 0), i8* null], align 16
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [25 x i8] c"%s: only one input file\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"%s: can't open %s\0A\00", align 1
@outfilename = internal global i8* null, align 8
@.str.4 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@stdout = external global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [32 x i8] c"Unsupported BMP colormap format\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"Only 8- and 24-bit BMP files are supported\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"Invalid BMP file: bad header length\00", align 1
@.str.8 = private unnamed_addr constant [42 x i8] c"Invalid BMP file: biPlanes not equal to 1\00", align 1
@.str.9 = private unnamed_addr constant [36 x i8] c"BMP output must be grayscale or RGB\00", align 1
@.str.10 = private unnamed_addr constant [41 x i8] c"Sorry, compressed BMPs not yet supported\00", align 1
@.str.11 = private unnamed_addr constant [40 x i8] c"Not a BMP file - does not start with BM\00", align 1
@.str.12 = private unnamed_addr constant [23 x i8] c"%ux%u 24-bit BMP image\00", align 1
@.str.13 = private unnamed_addr constant [34 x i8] c"%ux%u 8-bit colormapped BMP image\00", align 1
@.str.14 = private unnamed_addr constant [27 x i8] c"%ux%u 24-bit OS2 BMP image\00", align 1
@.str.15 = private unnamed_addr constant [38 x i8] c"%ux%u 8-bit colormapped OS2 BMP image\00", align 1
@.str.16 = private unnamed_addr constant [24 x i8] c"GIF output got confused\00", align 1
@.str.17 = private unnamed_addr constant [22 x i8] c"Bogus GIF codesize %d\00", align 1
@.str.18 = private unnamed_addr constant [36 x i8] c"GIF output must be grayscale or RGB\00", align 1
@.str.19 = private unnamed_addr constant [27 x i8] c"Too few images in GIF file\00", align 1
@.str.20 = private unnamed_addr constant [15 x i8] c"Not a GIF file\00", align 1
@.str.21 = private unnamed_addr constant [19 x i8] c"%ux%ux%d GIF image\00", align 1
@.str.22 = private unnamed_addr constant [48 x i8] c"Warning: unexpected GIF version number '%c%c%c'\00", align 1
@.str.23 = private unnamed_addr constant [44 x i8] c"Ignoring GIF extension block of type 0x%02x\00", align 1
@.str.24 = private unnamed_addr constant [35 x i8] c"Caution: nonsquare pixels in input\00", align 1
@.str.25 = private unnamed_addr constant [25 x i8] c"Corrupt data in GIF file\00", align 1
@.str.26 = private unnamed_addr constant [40 x i8] c"Bogus char 0x%02x in GIF file, ignoring\00", align 1
@.str.27 = private unnamed_addr constant [27 x i8] c"Premature end of GIF image\00", align 1
@.str.28 = private unnamed_addr constant [20 x i8] c"Ran out of GIF bits\00", align 1
@.str.29 = private unnamed_addr constant [36 x i8] c"PPM output must be grayscale or RGB\00", align 1
@.str.30 = private unnamed_addr constant [28 x i8] c"Nonnumeric data in PPM file\00", align 1
@.str.31 = private unnamed_addr constant [15 x i8] c"Not a PPM file\00", align 1
@.str.32 = private unnamed_addr constant [16 x i8] c"%ux%u PGM image\00", align 1
@.str.33 = private unnamed_addr constant [21 x i8] c"%ux%u text PGM image\00", align 1
@.str.34 = private unnamed_addr constant [16 x i8] c"%ux%u PPM image\00", align 1
@.str.35 = private unnamed_addr constant [21 x i8] c"%ux%u text PPM image\00", align 1
@.str.36 = private unnamed_addr constant [34 x i8] c"Unsupported Targa colormap format\00", align 1
@.str.37 = private unnamed_addr constant [34 x i8] c"Invalid or unsupported Targa file\00", align 1
@.str.38 = private unnamed_addr constant [38 x i8] c"Targa output must be grayscale or RGB\00", align 1
@.str.39 = private unnamed_addr constant [22 x i8] c"%ux%u RGB Targa image\00", align 1
@.str.40 = private unnamed_addr constant [28 x i8] c"%ux%u grayscale Targa image\00", align 1
@.str.41 = private unnamed_addr constant [30 x i8] c"%ux%u colormapped Targa image\00", align 1
@.str.42 = private unnamed_addr constant [51 x i8] c"Color map file is invalid or of unsupported format\00", align 1
@.str.43 = private unnamed_addr constant [53 x i8] c"Output file format cannot handle %d colormap entries\00", align 1
@.str.44 = private unnamed_addr constant [14 x i8] c"ungetc failed\00", align 1
@.str.45 = private unnamed_addr constant [59 x i8] c"Unrecognized input file format --- perhaps you need -targa\00", align 1
@.str.46 = private unnamed_addr constant [31 x i8] c"Unsupported output file format\00", align 1
@is_targa = internal global i32 0, align 4
@.str.47 = private unnamed_addr constant [11 x i8] c"arithmetic\00", align 1
@.str.48 = private unnamed_addr constant [44 x i8] c"%s: sorry, arithmetic coding not supported\0A\00", align 1
@.str.49 = private unnamed_addr constant [9 x i8] c"baseline\00", align 1
@.str.50 = private unnamed_addr constant [4 x i8] c"dct\00", align 1
@.str.51 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.52 = private unnamed_addr constant [5 x i8] c"fast\00", align 1
@.str.53 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.54 = private unnamed_addr constant [6 x i8] c"debug\00", align 1
@.str.55 = private unnamed_addr constant [8 x i8] c"verbose\00", align 1
@parse_switches.printed_version = internal global i32 0, align 4
@.str.56 = private unnamed_addr constant [47 x i8] c"Independent JPEG Group's CJPEG, version %s\0A%s\0A\00", align 1
@.str.57 = private unnamed_addr constant [13 x i8] c"6a  7-Feb-96\00", align 1
@.str.58 = private unnamed_addr constant [35 x i8] c"Copyright (C) 1996, Thomas G. Lane\00", align 1
@.str.59 = private unnamed_addr constant [10 x i8] c"grayscale\00", align 1
@.str.60 = private unnamed_addr constant [10 x i8] c"greyscale\00", align 1
@.str.61 = private unnamed_addr constant [10 x i8] c"maxmemory\00", align 1
@.str.62 = private unnamed_addr constant [6 x i8] c"%ld%c\00", align 1
@.str.63 = private unnamed_addr constant [9 x i8] c"optimize\00", align 1
@.str.64 = private unnamed_addr constant [9 x i8] c"optimise\00", align 1
@.str.65 = private unnamed_addr constant [8 x i8] c"outfile\00", align 1
@.str.66 = private unnamed_addr constant [12 x i8] c"progressive\00", align 1
@.str.67 = private unnamed_addr constant [8 x i8] c"quality\00", align 1
@.str.68 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.69 = private unnamed_addr constant [7 x i8] c"qslots\00", align 1
@.str.70 = private unnamed_addr constant [8 x i8] c"qtables\00", align 1
@.str.71 = private unnamed_addr constant [8 x i8] c"restart\00", align 1
@.str.72 = private unnamed_addr constant [7 x i8] c"sample\00", align 1
@.str.73 = private unnamed_addr constant [6 x i8] c"scans\00", align 1
@.str.74 = private unnamed_addr constant [7 x i8] c"smooth\00", align 1
@.str.75 = private unnamed_addr constant [6 x i8] c"targa\00", align 1
@.str.76 = private unnamed_addr constant [22 x i8] c"usage: %s [switches] \00", align 1
@.str.77 = private unnamed_addr constant [13 x i8] c"[inputfile]\0A\00", align 1
@.str.78 = private unnamed_addr constant [38 x i8] c"Switches (names may be abbreviated):\0A\00", align 1
@.str.79 = private unnamed_addr constant [69 x i8] c"  -quality N     Compression quality (0..100; 5-95 is useful range)\0A\00", align 1
@.str.80 = private unnamed_addr constant [46 x i8] c"  -grayscale     Create monochrome JPEG file\0A\00", align 1
@.str.81 = private unnamed_addr constant [78 x i8] c"  -optimize      Optimize Huffman table (smaller file, but slow compression)\0A\00", align 1
@.str.82 = private unnamed_addr constant [47 x i8] c"  -progressive   Create progressive JPEG file\0A\00", align 1
@.str.83 = private unnamed_addr constant [66 x i8] c"  -targa         Input file is Targa format (usually not needed)\0A\00", align 1
@.str.84 = private unnamed_addr constant [30 x i8] c"Switches for advanced users:\0A\00", align 1
@.str.85 = private unnamed_addr constant [43 x i8] c"  -dct int       Use integer DCT method%s\0A\00", align 1
@.str.86 = private unnamed_addr constant [11 x i8] c" (default)\00", align 1
@.str.87 = private unnamed_addr constant [57 x i8] c"  -dct fast      Use fast integer DCT (less accurate)%s\0A\00", align 1
@.str.88 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.89 = private unnamed_addr constant [50 x i8] c"  -dct float     Use floating-point DCT method%s\0A\00", align 1
@.str.90 = private unnamed_addr constant [68 x i8] c"  -restart N     Set restart interval in rows, or in blocks with B\0A\00", align 1
@.str.91 = private unnamed_addr constant [63 x i8] c"  -smooth N      Smooth dithered input (N=1..100 is strength)\0A\00", align 1
@.str.92 = private unnamed_addr constant [52 x i8] c"  -maxmemory N   Maximum memory to use (in kbytes)\0A\00", align 1
@.str.93 = private unnamed_addr constant [47 x i8] c"  -outfile name  Specify name for output file\0A\00", align 1
@.str.94 = private unnamed_addr constant [44 x i8] c"  -verbose  or  -debug   Emit debug output\0A\00", align 1
@.str.95 = private unnamed_addr constant [23 x i8] c"Switches for wizards:\0A\00", align 1
@.str.96 = private unnamed_addr constant [40 x i8] c"  -baseline      Force baseline output\0A\00", align 1
@.str.97 = private unnamed_addr constant [56 x i8] c"  -qtables file  Use quantization tables given in file\0A\00", align 1
@.str.98 = private unnamed_addr constant [56 x i8] c"  -qslots N[,...]    Set component quantization tables\0A\00", align 1
@.str.99 = private unnamed_addr constant [53 x i8] c"  -sample HxV[,...]  Set component sampling factors\0A\00", align 1
@.str.100 = private unnamed_addr constant [57 x i8] c"  -scans file    Create multi-scan JPEG per script file\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main1 = private constant [5 x i8] c"main1"
@__profn_tmp1.ll_parse_switches = private constant [22 x i8] c"tmp1.ll:parse_switches"
@__profn_tmp1.ll_usage = private constant [13 x i8] c"tmp1.ll:usage"
@__profn_tmp1.ll_select_file_type = private constant [24 x i8] c"tmp1.ll:select_file_type"
@__profc_main1 = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_main1 = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 844573821577212, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main1 to i8*), i8* bitcast ([3 x i64]* @__profvp_main1 to i8*), i32 11, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_parse_switches = private global [60 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_parse_switches = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2477713196328074963, i64 840000653256, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i32 0, i32 0), i8* null, i8* null, i32 60, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_usage = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7998456694610620455, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_select_file_type = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_select_file_type = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_select_file_type = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6489162530948130819, i64 844522089308044, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i32 0, i32 0), i8* null, i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_select_file_type to i8*), i32 8, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [12 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [69 x i8] c"C\00main1\01tmp1.ll:parse_switches\01tmp1.ll:usage\01tmp1.ll:select_file_type", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_parse_switches to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_select_file_type to i8*), i8* bitcast ([12 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([69 x i8], [69 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca %struct.jpeg_compress_struct, align 8
  %6 = alloca %struct.jpeg_error_mgr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.cjpeg_source_struct*, align 8
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca %struct._IO_FILE*, align 8
  %11 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %12 = load i8**, i8*** %4, align 8
  %13 = getelementptr inbounds i8*, i8** %12, i64 0
  %14 = load i8*, i8** %13, align 8
  store i8* %14, i8** @progname, align 8
  %15 = load i8*, i8** @progname, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %24, label %17

; <label>:17:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 1)
  %19 = load i8*, i8** @progname, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %17, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 4)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 4)
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8** @progname, align 8
  br label %26

; <label>:26:                                     ; preds = %24, %17
  %27 = call %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr* %6)
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 0
  store %struct.jpeg_error_mgr* %27, %struct.jpeg_error_mgr** %28, align 8
  call void @jpeg_CreateCompress(%struct.jpeg_compress_struct* %5, i32 61, i64 496)
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i32 0, i32 11
  store i8** getelementptr inbounds ([44 x i8*], [44 x i8*]* @cdjpeg_message_table, i32 0, i32 0), i8*** %29, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i32 0, i32 12
  store i32 1000, i32* %30, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i32 0, i32 13
  store i32 1043, i32* %31, align 4
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 9
  store i32 2, i32* %32, align 4
  call void @jpeg_set_defaults(%struct.jpeg_compress_struct* %5)
  %33 = load i32, i32* %3, align 4
  %34 = load i8**, i8*** %4, align 8
  %35 = call i32 @parse_switches(%struct.jpeg_compress_struct* %5, i32 %33, i8** %34, i32 0, i32 0)
  store i32 %35, i32* %7, align 4
  %36 = load i32, i32* %7, align 4
  %37 = load i32, i32* %3, align 4
  %38 = sub nsw i32 %37, 1
  %39 = icmp slt i32 %36, %38
  br i1 %39, label %40, label %45

; <label>:40:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 5)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 5)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = load i8*, i8** @progname, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i32 0, i32 0), i8* %43)
  call void @usage()
  br label %45

; <label>:45:                                     ; preds = %40, %26
  %46 = load i32, i32* %7, align 4
  %47 = load i32, i32* %3, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %69

; <label>:49:                                     ; preds = %45
  %50 = load i8**, i8*** %4, align 8
  %51 = load i32, i32* %7, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8*, i8** %50, i64 %52
  %54 = load i8*, i8** %53, align 8
  %55 = call %struct._IO_FILE* @fopen(i8* %54, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %55, %struct._IO_FILE** %9, align 8
  %56 = icmp eq %struct._IO_FILE* %55, null
  br i1 %56, label %57, label %67

; <label>:57:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 10)
  %58 = add i64 %pgocount3, 1
  store i64 %58, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 10)
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %60 = load i8*, i8** @progname, align 8
  %61 = load i8**, i8*** %4, align 8
  %62 = load i32, i32* %7, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8*, i8** %61, i64 %63
  %65 = load i8*, i8** %64, align 8
  %66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* %60, i8* %65)
  call void @exit(i32 1) #5
  unreachable

; <label>:67:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 7)
  %68 = add i64 %pgocount4, 1
  store i64 %68, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 7)
  br label %72

; <label>:69:                                     ; preds = %45
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 6)
  %70 = add i64 %pgocount5, 1
  store i64 %70, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 6)
  %71 = call %struct._IO_FILE* @read_stdin()
  store %struct._IO_FILE* %71, %struct._IO_FILE** %9, align 8
  br label %72

; <label>:72:                                     ; preds = %69, %67
  %73 = load i8*, i8** @outfilename, align 8
  %74 = icmp ne i8* %73, null
  br i1 %74, label %75, label %86

; <label>:75:                                     ; preds = %72
  %76 = load i8*, i8** @outfilename, align 8
  %77 = call %struct._IO_FILE* @fopen(i8* %76, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %77, %struct._IO_FILE** %10, align 8
  %78 = icmp eq %struct._IO_FILE* %77, null
  br i1 %78, label %79, label %85

; <label>:79:                                     ; preds = %75
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 9)
  %80 = add i64 %pgocount6, 1
  store i64 %80, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 9)
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %82 = load i8*, i8** @progname, align 8
  %83 = load i8*, i8** @outfilename, align 8
  %84 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* %82, i8* %83)
  call void @exit(i32 1) #5
  unreachable

; <label>:85:                                     ; preds = %75
  br label %89

; <label>:86:                                     ; preds = %72
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 8)
  %87 = add i64 %pgocount7, 1
  store i64 %87, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 8)
  %88 = call %struct._IO_FILE* @write_stdout()
  store %struct._IO_FILE* %88, %struct._IO_FILE** %10, align 8
  br label %89

; <label>:89:                                     ; preds = %86, %85
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %91 = call %struct.cjpeg_source_struct* @select_file_type(%struct.jpeg_compress_struct* %5, %struct._IO_FILE* %90)
  store %struct.cjpeg_source_struct* %91, %struct.cjpeg_source_struct** %8, align 8
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %93 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %8, align 8
  %94 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %93, i32 0, i32 3
  store %struct._IO_FILE* %92, %struct._IO_FILE** %94, align 8
  %95 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %8, align 8
  %96 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %95, i32 0, i32 0
  %97 = load void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %96, align 8
  %98 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %8, align 8
  %99 = ptrtoint void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* %97 to i64
  call void @__llvm_profile_instrument_target(i64 %99, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i32 0)
  call void %97(%struct.jpeg_compress_struct* %5, %struct.cjpeg_source_struct* %98)
  call void @jpeg_default_colorspace(%struct.jpeg_compress_struct* %5)
  %100 = load i32, i32* %3, align 4
  %101 = load i8**, i8*** %4, align 8
  %102 = call i32 @parse_switches(%struct.jpeg_compress_struct* %5, i32 %100, i8** %101, i32 0, i32 1)
  store i32 %102, i32* %7, align 4
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  call void @jpeg_stdio_dest(%struct.jpeg_compress_struct* %5, %struct._IO_FILE* %103)
  call void @jpeg_start_compress(%struct.jpeg_compress_struct* %5, i32 1)
  br label %104

; <label>:104:                                    ; preds = %110, %89
  %105 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 36
  %106 = load i32, i32* %105, align 8
  %107 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 7
  %108 = load i32, i32* %107, align 4
  %109 = icmp ult i32 %106, %108
  br i1 %109, label %110, label %123

; <label>:110:                                    ; preds = %104
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 0)
  %111 = add i64 %pgocount8, 1
  store i64 %111, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 0)
  %112 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %8, align 8
  %113 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %112, i32 0, i32 1
  %114 = load i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %113, align 8
  %115 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %8, align 8
  %116 = ptrtoint i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* %114 to i64
  call void @__llvm_profile_instrument_target(i64 %116, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i32 1)
  %117 = call i32 %114(%struct.jpeg_compress_struct* %5, %struct.cjpeg_source_struct* %115)
  store i32 %117, i32* %11, align 4
  %118 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %8, align 8
  %119 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %118, i32 0, i32 4
  %120 = load i8**, i8*** %119, align 8
  %121 = load i32, i32* %11, align 4
  %122 = call i32 @jpeg_write_scanlines(%struct.jpeg_compress_struct* %5, i8** %120, i32 %121)
  br label %104

; <label>:123:                                    ; preds = %104
  %124 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %8, align 8
  %125 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %124, i32 0, i32 2
  %126 = load void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %125, align 8
  %127 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %8, align 8
  %128 = ptrtoint void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* %126 to i64
  call void @__llvm_profile_instrument_target(i64 %128, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i32 2)
  call void %126(%struct.jpeg_compress_struct* %5, %struct.cjpeg_source_struct* %127)
  call void @jpeg_finish_compress(%struct.jpeg_compress_struct* %5)
  call void @jpeg_destroy_compress(%struct.jpeg_compress_struct* %5)
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %130 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %131 = icmp ne %struct._IO_FILE* %129, %130
  br i1 %131, label %132, label %136

; <label>:132:                                    ; preds = %123
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 2)
  %133 = add i64 %pgocount9, 1
  store i64 %133, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 2)
  %134 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %135 = call i32 @fclose(%struct._IO_FILE* %134)
  br label %136

; <label>:136:                                    ; preds = %132, %123
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %139 = icmp ne %struct._IO_FILE* %137, %138
  br i1 %139, label %140, label %144

; <label>:140:                                    ; preds = %136
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 3)
  %141 = add i64 %pgocount10, 1
  store i64 %141, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_main1, i64 0, i64 3)
  %142 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %143 = call i32 @fclose(%struct._IO_FILE* %142)
  br label %144

; <label>:144:                                    ; preds = %140, %136
  ret i32 0
}

declare %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr*) #1

declare void @jpeg_CreateCompress(%struct.jpeg_compress_struct*, i32, i64) #1

declare void @jpeg_set_defaults(%struct.jpeg_compress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @parse_switches(%struct.jpeg_compress_struct*, i32, i8**, i32, i32) #0 {
  %6 = alloca %struct.jpeg_compress_struct*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8**, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i64, align 8
  %22 = alloca i8, align 1
  %23 = alloca i64, align 8
  %24 = alloca i8, align 1
  %25 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %6, align 8
  store i32 %1, i32* %7, align 4
  store i8** %2, i8*** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  store i8* null, i8** %17, align 8
  store i8* null, i8** %18, align 8
  store i8* null, i8** %19, align 8
  store i8* null, i8** %20, align 8
  store i32 75, i32* %13, align 4
  store i32 100, i32* %14, align 4
  store i32 0, i32* %15, align 4
  store i32 0, i32* %16, align 4
  store i32 0, i32* @is_targa, align 4
  store i8* null, i8** @outfilename, align 8
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 0
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i32 0, i32 7
  store i32 0, i32* %29, align 4
  store i32 1, i32* %11, align 4
  br label %30

; <label>:30:                                     ; preds = %447, %5
  %31 = load i32, i32* %11, align 4
  %32 = load i32, i32* %7, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %450

; <label>:34:                                     ; preds = %30
  %35 = load i8**, i8*** %8, align 8
  %36 = load i32, i32* %11, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8*, i8** %35, i64 %37
  %39 = load i8*, i8** %38, align 8
  store i8* %39, i8** %12, align 8
  %40 = load i8*, i8** %12, align 8
  %41 = load i8, i8* %40, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp ne i32 %42, 45
  br i1 %43, label %44, label %52

; <label>:44:                                     ; preds = %34
  %45 = load i32, i32* %11, align 4
  %46 = load i32, i32* %9, align 4
  %47 = icmp sle i32 %45, %46
  br i1 %47, label %48, label %50

; <label>:48:                                     ; preds = %44
  %pgocount = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 0)
  %49 = add i64 %pgocount, 1
  store i64 %49, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 0)
  store i8* null, i8** @outfilename, align 8
  br label %447

; <label>:50:                                     ; preds = %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 15)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 15)
  br label %450

; <label>:52:                                     ; preds = %34
  %53 = load i8*, i8** %12, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %12, align 8
  %55 = load i8*, i8** %12, align 8
  %56 = call i32 @keymatch(i8* %55, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.47, i32 0, i32 0), i32 1)
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %63

; <label>:58:                                     ; preds = %52
  %pgocount2 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 40)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 40)
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %61 = load i8*, i8** @progname, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.48, i32 0, i32 0), i8* %61)
  call void @exit(i32 1) #5
  unreachable

; <label>:63:                                     ; preds = %52
  %64 = load i8*, i8** %12, align 8
  %65 = call i32 @keymatch(i8* %64, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.49, i32 0, i32 0), i32 1)
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %69

; <label>:67:                                     ; preds = %63
  %pgocount3 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 1)
  %68 = add i64 %pgocount3, 1
  store i64 %68, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 1)
  store i32 1, i32* %15, align 4
  br label %445

; <label>:69:                                     ; preds = %63
  %70 = load i8*, i8** %12, align 8
  %71 = call i32 @keymatch(i8* %70, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.50, i32 0, i32 0), i32 2)
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %121

; <label>:73:                                     ; preds = %69
  %74 = load i32, i32* %11, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %11, align 4
  %76 = load i32, i32* %7, align 4
  %77 = icmp sge i32 %75, %76
  br i1 %77, label %78, label %80

; <label>:78:                                     ; preds = %73
  %pgocount4 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 4)
  %79 = add i64 %pgocount4, 1
  store i64 %79, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 4)
  call void @usage()
  br label %80

; <label>:80:                                     ; preds = %78, %73
  %81 = load i8**, i8*** %8, align 8
  %82 = load i32, i32* %11, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8*, i8** %81, i64 %83
  %85 = load i8*, i8** %84, align 8
  %86 = call i32 @keymatch(i8* %85, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.51, i32 0, i32 0), i32 1)
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %92

; <label>:88:                                     ; preds = %80
  %pgocount5 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 2)
  %89 = add i64 %pgocount5, 1
  store i64 %89, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 2)
  %90 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %91 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %90, i32 0, i32 28
  store i32 0, i32* %91, align 4
  br label %120

; <label>:92:                                     ; preds = %80
  %93 = load i8**, i8*** %8, align 8
  %94 = load i32, i32* %11, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8*, i8** %93, i64 %95
  %97 = load i8*, i8** %96, align 8
  %98 = call i32 @keymatch(i8* %97, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.52, i32 0, i32 0), i32 2)
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %104

; <label>:100:                                    ; preds = %92
  %pgocount6 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 7)
  %101 = add i64 %pgocount6, 1
  store i64 %101, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 7)
  %102 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %103 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %102, i32 0, i32 28
  store i32 1, i32* %103, align 4
  br label %119

; <label>:104:                                    ; preds = %92
  %105 = load i8**, i8*** %8, align 8
  %106 = load i32, i32* %11, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8*, i8** %105, i64 %107
  %109 = load i8*, i8** %108, align 8
  %110 = call i32 @keymatch(i8* %109, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.53, i32 0, i32 0), i32 2)
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %112, label %116

; <label>:112:                                    ; preds = %104
  %pgocount7 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 16)
  %113 = add i64 %pgocount7, 1
  store i64 %113, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 16)
  %114 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %115 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %114, i32 0, i32 28
  store i32 2, i32* %115, align 4
  br label %118

; <label>:116:                                    ; preds = %104
  %pgocount8 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 22)
  %117 = add i64 %pgocount8, 1
  store i64 %117, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 22)
  call void @usage()
  br label %118

; <label>:118:                                    ; preds = %116, %112
  br label %119

; <label>:119:                                    ; preds = %118, %100
  br label %120

; <label>:120:                                    ; preds = %119, %88
  br label %444

; <label>:121:                                    ; preds = %69
  %122 = load i8*, i8** %12, align 8
  %123 = call i32 @keymatch(i8* %122, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.54, i32 0, i32 0), i32 1)
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %130, label %125

; <label>:125:                                    ; preds = %121
  %pgocount9 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 8)
  %126 = add i64 %pgocount9, 1
  store i64 %126, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 8)
  %127 = load i8*, i8** %12, align 8
  %128 = call i32 @keymatch(i8* %127, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.55, i32 0, i32 0), i32 1)
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %130, label %145

; <label>:130:                                    ; preds = %125, %121
  %131 = load i32, i32* @parse_switches.printed_version, align 4
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %137, label %133

; <label>:133:                                    ; preds = %130
  %pgocount10 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 9)
  %134 = add i64 %pgocount10, 1
  store i64 %134, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 9)
  %135 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %136 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %135, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.56, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.57, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.58, i32 0, i32 0))
  store i32 1, i32* @parse_switches.printed_version, align 4
  br label %137

; <label>:137:                                    ; preds = %133, %130
  %pgocount11 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 3)
  %138 = add i64 %pgocount11, 1
  store i64 %138, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 3)
  %139 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %140 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %139, i32 0, i32 0
  %141 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %140, align 8
  %142 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %141, i32 0, i32 7
  %143 = load i32, i32* %142, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %142, align 4
  br label %443

; <label>:145:                                    ; preds = %125
  %146 = load i8*, i8** %12, align 8
  %147 = call i32 @keymatch(i8* %146, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.59, i32 0, i32 0), i32 2)
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %154, label %149

; <label>:149:                                    ; preds = %145
  %pgocount12 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 23)
  %150 = add i64 %pgocount12, 1
  store i64 %150, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 23)
  %151 = load i8*, i8** %12, align 8
  %152 = call i32 @keymatch(i8* %151, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.60, i32 0, i32 0), i32 2)
  %153 = icmp ne i32 %152, 0
  br i1 %153, label %154, label %157

; <label>:154:                                    ; preds = %149, %145
  %pgocount13 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 17)
  %155 = add i64 %pgocount13, 1
  store i64 %155, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 17)
  %156 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* %156, i32 1)
  br label %442

; <label>:157:                                    ; preds = %149
  %158 = load i8*, i8** %12, align 8
  %159 = call i32 @keymatch(i8* %158, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.61, i32 0, i32 0), i32 3)
  %160 = icmp ne i32 %159, 0
  br i1 %160, label %161, label %199

; <label>:161:                                    ; preds = %157
  %pgocount14 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 24)
  %162 = add i64 %pgocount14, 1
  store i64 %162, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 24)
  store i8 120, i8* %22, align 1
  %163 = load i32, i32* %11, align 4
  %164 = add nsw i32 %163, 1
  store i32 %164, i32* %11, align 4
  %165 = load i32, i32* %7, align 4
  %166 = icmp sge i32 %164, %165
  br i1 %166, label %167, label %169

; <label>:167:                                    ; preds = %161
  %pgocount15 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 27)
  %168 = add i64 %pgocount15, 1
  store i64 %168, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 27)
  call void @usage()
  br label %169

; <label>:169:                                    ; preds = %167, %161
  %170 = load i8**, i8*** %8, align 8
  %171 = load i32, i32* %11, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i8*, i8** %170, i64 %172
  %174 = load i8*, i8** %173, align 8
  %175 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %174, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.62, i32 0, i32 0), i64* %21, i8* %22) #4
  %176 = icmp slt i32 %175, 1
  br i1 %176, label %177, label %179

; <label>:177:                                    ; preds = %169
  %pgocount16 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 29)
  %178 = add i64 %pgocount16, 1
  store i64 %178, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 29)
  call void @usage()
  br label %179

; <label>:179:                                    ; preds = %177, %169
  %180 = load i8, i8* %22, align 1
  %181 = sext i8 %180 to i32
  %182 = icmp eq i32 %181, 109
  br i1 %182, label %188, label %183

; <label>:183:                                    ; preds = %179
  %pgocount17 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 28)
  %184 = add i64 %pgocount17, 1
  store i64 %184, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 28)
  %185 = load i8, i8* %22, align 1
  %186 = sext i8 %185 to i32
  %187 = icmp eq i32 %186, 77
  br i1 %187, label %188, label %192

; <label>:188:                                    ; preds = %183, %179
  %pgocount18 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 25)
  %189 = add i64 %pgocount18, 1
  store i64 %189, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 25)
  %190 = load i64, i64* %21, align 8
  %191 = mul nsw i64 %190, 1000
  store i64 %191, i64* %21, align 8
  br label %192

; <label>:192:                                    ; preds = %188, %183
  %193 = load i64, i64* %21, align 8
  %194 = mul nsw i64 %193, 1000
  %195 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %196 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %195, i32 0, i32 1
  %197 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %196, align 8
  %198 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %197, i32 0, i32 11
  store i64 %194, i64* %198, align 8
  br label %441

; <label>:199:                                    ; preds = %157
  %200 = load i8*, i8** %12, align 8
  %201 = call i32 @keymatch(i8* %200, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.63, i32 0, i32 0), i32 1)
  %202 = icmp ne i32 %201, 0
  br i1 %202, label %208, label %203

; <label>:203:                                    ; preds = %199
  %pgocount19 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 30)
  %204 = add i64 %pgocount19, 1
  store i64 %204, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 30)
  %205 = load i8*, i8** %12, align 8
  %206 = call i32 @keymatch(i8* %205, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.64, i32 0, i32 0), i32 1)
  %207 = icmp ne i32 %206, 0
  br i1 %207, label %208, label %212

; <label>:208:                                    ; preds = %203, %199
  %pgocount20 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 26)
  %209 = add i64 %pgocount20, 1
  store i64 %209, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 26)
  %210 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %211 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %210, i32 0, i32 25
  store i32 1, i32* %211, align 8
  br label %440

; <label>:212:                                    ; preds = %203
  %213 = load i8*, i8** %12, align 8
  %214 = call i32 @keymatch(i8* %213, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.65, i32 0, i32 0), i32 4)
  %215 = icmp ne i32 %214, 0
  br i1 %215, label %216, label %230

; <label>:216:                                    ; preds = %212
  %217 = load i32, i32* %11, align 4
  %218 = add nsw i32 %217, 1
  store i32 %218, i32* %11, align 4
  %219 = load i32, i32* %7, align 4
  %220 = icmp sge i32 %218, %219
  br i1 %220, label %221, label %223

; <label>:221:                                    ; preds = %216
  %pgocount21 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 32)
  %222 = add i64 %pgocount21, 1
  store i64 %222, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 32)
  call void @usage()
  br label %223

; <label>:223:                                    ; preds = %221, %216
  %pgocount22 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 31)
  %224 = add i64 %pgocount22, 1
  store i64 %224, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 31)
  %225 = load i8**, i8*** %8, align 8
  %226 = load i32, i32* %11, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds i8*, i8** %225, i64 %227
  %229 = load i8*, i8** %228, align 8
  store i8* %229, i8** @outfilename, align 8
  br label %439

; <label>:230:                                    ; preds = %212
  %231 = load i8*, i8** %12, align 8
  %232 = call i32 @keymatch(i8* %231, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.66, i32 0, i32 0), i32 1)
  %233 = icmp ne i32 %232, 0
  br i1 %233, label %234, label %236

; <label>:234:                                    ; preds = %230
  %pgocount23 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 33)
  %235 = add i64 %pgocount23, 1
  store i64 %235, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 33)
  store i32 1, i32* %16, align 4
  br label %438

; <label>:236:                                    ; preds = %230
  %237 = load i8*, i8** %12, align 8
  %238 = call i32 @keymatch(i8* %237, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.67, i32 0, i32 0), i32 1)
  %239 = icmp ne i32 %238, 0
  br i1 %239, label %240, label %261

; <label>:240:                                    ; preds = %236
  %241 = load i32, i32* %11, align 4
  %242 = add nsw i32 %241, 1
  store i32 %242, i32* %11, align 4
  %243 = load i32, i32* %7, align 4
  %244 = icmp sge i32 %242, %243
  br i1 %244, label %245, label %247

; <label>:245:                                    ; preds = %240
  %pgocount24 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 35)
  %246 = add i64 %pgocount24, 1
  store i64 %246, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 35)
  call void @usage()
  br label %247

; <label>:247:                                    ; preds = %245, %240
  %248 = load i8**, i8*** %8, align 8
  %249 = load i32, i32* %11, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i8*, i8** %248, i64 %250
  %252 = load i8*, i8** %251, align 8
  %253 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %252, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.68, i32 0, i32 0), i32* %13) #4
  %254 = icmp ne i32 %253, 1
  br i1 %254, label %255, label %257

; <label>:255:                                    ; preds = %247
  %pgocount25 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 36)
  %256 = add i64 %pgocount25, 1
  store i64 %256, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 36)
  call void @usage()
  br label %257

; <label>:257:                                    ; preds = %255, %247
  %pgocount26 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 34)
  %258 = add i64 %pgocount26, 1
  store i64 %258, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 34)
  %259 = load i32, i32* %13, align 4
  %260 = call i32 @jpeg_quality_scaling(i32 %259)
  store i32 %260, i32* %14, align 4
  br label %437

; <label>:261:                                    ; preds = %236
  %262 = load i8*, i8** %12, align 8
  %263 = call i32 @keymatch(i8* %262, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.69, i32 0, i32 0), i32 2)
  %264 = icmp ne i32 %263, 0
  br i1 %264, label %265, label %279

; <label>:265:                                    ; preds = %261
  %266 = load i32, i32* %11, align 4
  %267 = add nsw i32 %266, 1
  store i32 %267, i32* %11, align 4
  %268 = load i32, i32* %7, align 4
  %269 = icmp sge i32 %267, %268
  br i1 %269, label %270, label %272

; <label>:270:                                    ; preds = %265
  %pgocount27 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 38)
  %271 = add i64 %pgocount27, 1
  store i64 %271, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 38)
  call void @usage()
  br label %272

; <label>:272:                                    ; preds = %270, %265
  %pgocount28 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 37)
  %273 = add i64 %pgocount28, 1
  store i64 %273, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 37)
  %274 = load i8**, i8*** %8, align 8
  %275 = load i32, i32* %11, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds i8*, i8** %274, i64 %276
  %278 = load i8*, i8** %277, align 8
  store i8* %278, i8** %18, align 8
  br label %436

; <label>:279:                                    ; preds = %261
  %280 = load i8*, i8** %12, align 8
  %281 = call i32 @keymatch(i8* %280, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.70, i32 0, i32 0), i32 2)
  %282 = icmp ne i32 %281, 0
  br i1 %282, label %283, label %297

; <label>:283:                                    ; preds = %279
  %284 = load i32, i32* %11, align 4
  %285 = add nsw i32 %284, 1
  store i32 %285, i32* %11, align 4
  %286 = load i32, i32* %7, align 4
  %287 = icmp sge i32 %285, %286
  br i1 %287, label %288, label %290

; <label>:288:                                    ; preds = %283
  %pgocount29 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 41)
  %289 = add i64 %pgocount29, 1
  store i64 %289, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 41)
  call void @usage()
  br label %290

; <label>:290:                                    ; preds = %288, %283
  %pgocount30 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 39)
  %291 = add i64 %pgocount30, 1
  store i64 %291, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 39)
  %292 = load i8**, i8*** %8, align 8
  %293 = load i32, i32* %11, align 4
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds i8*, i8** %292, i64 %294
  %296 = load i8*, i8** %295, align 8
  store i8* %296, i8** %17, align 8
  br label %435

; <label>:297:                                    ; preds = %279
  %298 = load i8*, i8** %12, align 8
  %299 = call i32 @keymatch(i8* %298, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.71, i32 0, i32 0), i32 1)
  %300 = icmp ne i32 %299, 0
  br i1 %300, label %301, label %351

; <label>:301:                                    ; preds = %297
  store i8 120, i8* %24, align 1
  %302 = load i32, i32* %11, align 4
  %303 = add nsw i32 %302, 1
  store i32 %303, i32* %11, align 4
  %304 = load i32, i32* %7, align 4
  %305 = icmp sge i32 %303, %304
  br i1 %305, label %306, label %308

; <label>:306:                                    ; preds = %301
  %pgocount31 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 45)
  %307 = add i64 %pgocount31, 1
  store i64 %307, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 45)
  call void @usage()
  br label %308

; <label>:308:                                    ; preds = %306, %301
  %309 = load i8**, i8*** %8, align 8
  %310 = load i32, i32* %11, align 4
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds i8*, i8** %309, i64 %311
  %313 = load i8*, i8** %312, align 8
  %314 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %313, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.62, i32 0, i32 0), i64* %23, i8* %24) #4
  %315 = icmp slt i32 %314, 1
  br i1 %315, label %316, label %318

; <label>:316:                                    ; preds = %308
  %pgocount32 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 47)
  %317 = add i64 %pgocount32, 1
  store i64 %317, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 47)
  call void @usage()
  br label %318

; <label>:318:                                    ; preds = %316, %308
  %319 = load i64, i64* %23, align 8
  %320 = icmp slt i64 %319, 0
  br i1 %320, label %325, label %321

; <label>:321:                                    ; preds = %318
  %pgocount33 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 44)
  %322 = add i64 %pgocount33, 1
  store i64 %322, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 44)
  %323 = load i64, i64* %23, align 8
  %324 = icmp sgt i64 %323, 65535
  br i1 %324, label %325, label %327

; <label>:325:                                    ; preds = %321, %318
  %pgocount34 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 43)
  %326 = add i64 %pgocount34, 1
  store i64 %326, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 43)
  call void @usage()
  br label %327

; <label>:327:                                    ; preds = %325, %321
  %328 = load i8, i8* %24, align 1
  %329 = sext i8 %328 to i32
  %330 = icmp eq i32 %329, 98
  br i1 %330, label %336, label %331

; <label>:331:                                    ; preds = %327
  %pgocount35 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 46)
  %332 = add i64 %pgocount35, 1
  store i64 %332, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 46)
  %333 = load i8, i8* %24, align 1
  %334 = sext i8 %333 to i32
  %335 = icmp eq i32 %334, 66
  br i1 %335, label %336, label %344

; <label>:336:                                    ; preds = %331, %327
  %pgocount36 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 42)
  %337 = add i64 %pgocount36, 1
  store i64 %337, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 42)
  %338 = load i64, i64* %23, align 8
  %339 = trunc i64 %338 to i32
  %340 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %341 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %340, i32 0, i32 29
  store i32 %339, i32* %341, align 8
  %342 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %343 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %342, i32 0, i32 30
  store i32 0, i32* %343, align 4
  br label %350

; <label>:344:                                    ; preds = %331
  %pgocount37 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 49)
  %345 = add i64 %pgocount37, 1
  store i64 %345, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 49)
  %346 = load i64, i64* %23, align 8
  %347 = trunc i64 %346 to i32
  %348 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %349 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %348, i32 0, i32 30
  store i32 %347, i32* %349, align 4
  br label %350

; <label>:350:                                    ; preds = %344, %336
  br label %434

; <label>:351:                                    ; preds = %297
  %352 = load i8*, i8** %12, align 8
  %353 = call i32 @keymatch(i8* %352, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.72, i32 0, i32 0), i32 2)
  %354 = icmp ne i32 %353, 0
  br i1 %354, label %355, label %369

; <label>:355:                                    ; preds = %351
  %356 = load i32, i32* %11, align 4
  %357 = add nsw i32 %356, 1
  store i32 %357, i32* %11, align 4
  %358 = load i32, i32* %7, align 4
  %359 = icmp sge i32 %357, %358
  br i1 %359, label %360, label %362

; <label>:360:                                    ; preds = %355
  %pgocount38 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 50)
  %361 = add i64 %pgocount38, 1
  store i64 %361, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 50)
  call void @usage()
  br label %362

; <label>:362:                                    ; preds = %360, %355
  %pgocount39 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 48)
  %363 = add i64 %pgocount39, 1
  store i64 %363, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 48)
  %364 = load i8**, i8*** %8, align 8
  %365 = load i32, i32* %11, align 4
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds i8*, i8** %364, i64 %366
  %368 = load i8*, i8** %367, align 8
  store i8* %368, i8** %19, align 8
  br label %433

; <label>:369:                                    ; preds = %351
  %370 = load i8*, i8** %12, align 8
  %371 = call i32 @keymatch(i8* %370, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.73, i32 0, i32 0), i32 2)
  %372 = icmp ne i32 %371, 0
  br i1 %372, label %373, label %387

; <label>:373:                                    ; preds = %369
  %374 = load i32, i32* %11, align 4
  %375 = add nsw i32 %374, 1
  store i32 %375, i32* %11, align 4
  %376 = load i32, i32* %7, align 4
  %377 = icmp sge i32 %375, %376
  br i1 %377, label %378, label %380

; <label>:378:                                    ; preds = %373
  %pgocount40 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 52)
  %379 = add i64 %pgocount40, 1
  store i64 %379, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 52)
  call void @usage()
  br label %380

; <label>:380:                                    ; preds = %378, %373
  %pgocount41 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 51)
  %381 = add i64 %pgocount41, 1
  store i64 %381, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 51)
  %382 = load i8**, i8*** %8, align 8
  %383 = load i32, i32* %11, align 4
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds i8*, i8** %382, i64 %384
  %386 = load i8*, i8** %385, align 8
  store i8* %386, i8** %20, align 8
  br label %432

; <label>:387:                                    ; preds = %369
  %388 = load i8*, i8** %12, align 8
  %389 = call i32 @keymatch(i8* %388, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.74, i32 0, i32 0), i32 2)
  %390 = icmp ne i32 %389, 0
  br i1 %390, label %391, label %422

; <label>:391:                                    ; preds = %387
  %392 = load i32, i32* %11, align 4
  %393 = add nsw i32 %392, 1
  store i32 %393, i32* %11, align 4
  %394 = load i32, i32* %7, align 4
  %395 = icmp sge i32 %393, %394
  br i1 %395, label %396, label %398

; <label>:396:                                    ; preds = %391
  %pgocount42 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 56)
  %397 = add i64 %pgocount42, 1
  store i64 %397, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 56)
  call void @usage()
  br label %398

; <label>:398:                                    ; preds = %396, %391
  %399 = load i8**, i8*** %8, align 8
  %400 = load i32, i32* %11, align 4
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds i8*, i8** %399, i64 %401
  %403 = load i8*, i8** %402, align 8
  %404 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %403, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.68, i32 0, i32 0), i32* %25) #4
  %405 = icmp ne i32 %404, 1
  br i1 %405, label %406, label %408

; <label>:406:                                    ; preds = %398
  %pgocount43 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 57)
  %407 = add i64 %pgocount43, 1
  store i64 %407, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 57)
  call void @usage()
  br label %408

; <label>:408:                                    ; preds = %406, %398
  %409 = load i32, i32* %25, align 4
  %410 = icmp slt i32 %409, 0
  br i1 %410, label %415, label %411

; <label>:411:                                    ; preds = %408
  %pgocount44 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 55)
  %412 = add i64 %pgocount44, 1
  store i64 %412, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 55)
  %413 = load i32, i32* %25, align 4
  %414 = icmp sgt i32 %413, 100
  br i1 %414, label %415, label %417

; <label>:415:                                    ; preds = %411, %408
  %pgocount45 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 54)
  %416 = add i64 %pgocount45, 1
  store i64 %416, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 54)
  call void @usage()
  br label %417

; <label>:417:                                    ; preds = %415, %411
  %pgocount46 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 53)
  %418 = add i64 %pgocount46, 1
  store i64 %418, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 53)
  %419 = load i32, i32* %25, align 4
  %420 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %421 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %420, i32 0, i32 27
  store i32 %419, i32* %421, align 8
  br label %431

; <label>:422:                                    ; preds = %387
  %423 = load i8*, i8** %12, align 8
  %424 = call i32 @keymatch(i8* %423, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.75, i32 0, i32 0), i32 1)
  %425 = icmp ne i32 %424, 0
  br i1 %425, label %426, label %428

; <label>:426:                                    ; preds = %422
  %pgocount47 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 58)
  %427 = add i64 %pgocount47, 1
  store i64 %427, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 58)
  store i32 1, i32* @is_targa, align 4
  br label %430

; <label>:428:                                    ; preds = %422
  %pgocount48 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 59)
  %429 = add i64 %pgocount48, 1
  store i64 %429, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 59)
  call void @usage()
  br label %430

; <label>:430:                                    ; preds = %428, %426
  br label %431

; <label>:431:                                    ; preds = %430, %417
  br label %432

; <label>:432:                                    ; preds = %431, %380
  br label %433

; <label>:433:                                    ; preds = %432, %362
  br label %434

; <label>:434:                                    ; preds = %433, %350
  br label %435

; <label>:435:                                    ; preds = %434, %290
  br label %436

; <label>:436:                                    ; preds = %435, %272
  br label %437

; <label>:437:                                    ; preds = %436, %257
  br label %438

; <label>:438:                                    ; preds = %437, %234
  br label %439

; <label>:439:                                    ; preds = %438, %223
  br label %440

; <label>:440:                                    ; preds = %439, %208
  br label %441

; <label>:441:                                    ; preds = %440, %192
  br label %442

; <label>:442:                                    ; preds = %441, %154
  br label %443

; <label>:443:                                    ; preds = %442, %137
  br label %444

; <label>:444:                                    ; preds = %443, %120
  br label %445

; <label>:445:                                    ; preds = %444, %67
  br label %446

; <label>:446:                                    ; preds = %445
  br label %447

; <label>:447:                                    ; preds = %446, %48
  %448 = load i32, i32* %11, align 4
  %449 = add nsw i32 %448, 1
  store i32 %449, i32* %11, align 4
  br label %30

; <label>:450:                                    ; preds = %50, %30
  %451 = load i32, i32* %10, align 4
  %452 = icmp ne i32 %451, 0
  br i1 %452, label %453, label %514

; <label>:453:                                    ; preds = %450
  %454 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %455 = load i32, i32* %13, align 4
  %456 = load i32, i32* %15, align 4
  call void @jpeg_set_quality(%struct.jpeg_compress_struct* %454, i32 %455, i32 %456)
  %457 = load i8*, i8** %17, align 8
  %458 = icmp ne i8* %457, null
  br i1 %458, label %459, label %470

; <label>:459:                                    ; preds = %453
  %460 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %461 = load i8*, i8** %17, align 8
  %462 = load i32, i32* %14, align 4
  %463 = load i32, i32* %15, align 4
  %464 = call i32 @read_quant_tables(%struct.jpeg_compress_struct* %460, i8* %461, i32 %462, i32 %463)
  %465 = icmp ne i32 %464, 0
  br i1 %465, label %468, label %466

; <label>:466:                                    ; preds = %459
  %pgocount49 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 18)
  %467 = add i64 %pgocount49, 1
  store i64 %467, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 18)
  call void @usage()
  br label %468

; <label>:468:                                    ; preds = %466, %459
  %pgocount50 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 10)
  %469 = add i64 %pgocount50, 1
  store i64 %469, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 10)
  br label %470

; <label>:470:                                    ; preds = %468, %453
  %471 = load i8*, i8** %18, align 8
  %472 = icmp ne i8* %471, null
  br i1 %472, label %473, label %482

; <label>:473:                                    ; preds = %470
  %474 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %475 = load i8*, i8** %18, align 8
  %476 = call i32 @set_quant_slots(%struct.jpeg_compress_struct* %474, i8* %475)
  %477 = icmp ne i32 %476, 0
  br i1 %477, label %480, label %478

; <label>:478:                                    ; preds = %473
  %pgocount51 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 19)
  %479 = add i64 %pgocount51, 1
  store i64 %479, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 19)
  call void @usage()
  br label %480

; <label>:480:                                    ; preds = %478, %473
  %pgocount52 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 11)
  %481 = add i64 %pgocount52, 1
  store i64 %481, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 11)
  br label %482

; <label>:482:                                    ; preds = %480, %470
  %483 = load i8*, i8** %19, align 8
  %484 = icmp ne i8* %483, null
  br i1 %484, label %485, label %494

; <label>:485:                                    ; preds = %482
  %486 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %487 = load i8*, i8** %19, align 8
  %488 = call i32 @set_sample_factors(%struct.jpeg_compress_struct* %486, i8* %487)
  %489 = icmp ne i32 %488, 0
  br i1 %489, label %492, label %490

; <label>:490:                                    ; preds = %485
  %pgocount53 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 20)
  %491 = add i64 %pgocount53, 1
  store i64 %491, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 20)
  call void @usage()
  br label %492

; <label>:492:                                    ; preds = %490, %485
  %pgocount54 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 12)
  %493 = add i64 %pgocount54, 1
  store i64 %493, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 12)
  br label %494

; <label>:494:                                    ; preds = %492, %482
  %495 = load i32, i32* %16, align 4
  %496 = icmp ne i32 %495, 0
  br i1 %496, label %497, label %500

; <label>:497:                                    ; preds = %494
  %pgocount55 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 13)
  %498 = add i64 %pgocount55, 1
  store i64 %498, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 13)
  %499 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  call void @jpeg_simple_progression(%struct.jpeg_compress_struct* %499)
  br label %500

; <label>:500:                                    ; preds = %497, %494
  %501 = load i8*, i8** %20, align 8
  %502 = icmp ne i8* %501, null
  br i1 %502, label %503, label %512

; <label>:503:                                    ; preds = %500
  %504 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %505 = load i8*, i8** %20, align 8
  %506 = call i32 @read_scan_script(%struct.jpeg_compress_struct* %504, i8* %505)
  %507 = icmp ne i32 %506, 0
  br i1 %507, label %510, label %508

; <label>:508:                                    ; preds = %503
  %pgocount56 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 21)
  %509 = add i64 %pgocount56, 1
  store i64 %509, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 21)
  call void @usage()
  br label %510

; <label>:510:                                    ; preds = %508, %503
  %pgocount57 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 14)
  %511 = add i64 %pgocount57, 1
  store i64 %511, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 14)
  br label %512

; <label>:512:                                    ; preds = %510, %500
  %pgocount58 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 6)
  %513 = add i64 %pgocount58, 1
  store i64 %513, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 6)
  br label %514

; <label>:514:                                    ; preds = %512, %450
  %pgocount59 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 5)
  %515 = add i64 %pgocount59, 1
  store i64 %515, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 5)
  %516 = load i32, i32* %11, align 4
  ret i32 %516
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @usage() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = load i8*, i8** @progname, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.76, i32 0, i32 0), i8* %3)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.77, i32 0, i32 0))
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.78, i32 0, i32 0))
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.79, i32 0, i32 0))
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.80, i32 0, i32 0))
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.81, i32 0, i32 0))
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.82, i32 0, i32 0))
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.83, i32 0, i32 0))
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.84, i32 0, i32 0))
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.85, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.86, i32 0, i32 0))
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.87, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.88, i32 0, i32 0))
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.89, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.88, i32 0, i32 0))
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.90, i32 0, i32 0))
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.91, i32 0, i32 0))
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.92, i32 0, i32 0))
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.93, i32 0, i32 0))
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.94, i32 0, i32 0))
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.95, i32 0, i32 0))
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.96, i32 0, i32 0))
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.97, i32 0, i32 0))
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.98, i32 0, i32 0))
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.99, i32 0, i32 0))
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.100, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable
                                                  ; No predecessors!
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare %struct._IO_FILE* @read_stdin() #1

declare %struct._IO_FILE* @write_stdout() #1

; Function Attrs: noinline nounwind uwtable
define internal %struct.cjpeg_source_struct* @select_file_type(%struct.jpeg_compress_struct*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.cjpeg_source_struct*, align 8
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  %7 = load i32, i32* @is_targa, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 0)
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %12 = call %struct.cjpeg_source_struct* @jinit_read_targa(%struct.jpeg_compress_struct* %11)
  store %struct.cjpeg_source_struct* %12, %struct.cjpeg_source_struct** %3, align 8
  br label %83

; <label>:13:                                     ; preds = %2
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %15 = call i32 @_IO_getc(%struct._IO_FILE* %14)
  store i32 %15, i32* %6, align 4
  %16 = icmp eq i32 %15, -1
  br i1 %16, label %17, label %31

; <label>:17:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 1)
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i32 0, i32 5
  store i32 41, i32* %22, align 8
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i32 0, i32 0
  %27 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %26, align 8
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %29 = bitcast %struct.jpeg_compress_struct* %28 to %struct.jpeg_common_struct*
  %30 = ptrtoint void (%struct.jpeg_common_struct*)* %27 to i64
  call void @__llvm_profile_instrument_target(i64 %30, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_select_file_type to i8*), i32 0)
  call void %27(%struct.jpeg_common_struct* %29)
  br label %31

; <label>:31:                                     ; preds = %17, %13
  %32 = load i32, i32* %6, align 4
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %34 = call i32 @ungetc(i32 %32, %struct._IO_FILE* %33)
  %35 = icmp eq i32 %34, -1
  br i1 %35, label %36, label %50

; <label>:36:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 2)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 2)
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %38, i32 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i32 0, i32 5
  store i32 1040, i32* %41, align 8
  %42 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %42, i32 0, i32 0
  %44 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %44, i32 0, i32 0
  %46 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %45, align 8
  %47 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %48 = bitcast %struct.jpeg_compress_struct* %47 to %struct.jpeg_common_struct*
  %49 = ptrtoint void (%struct.jpeg_common_struct*)* %46 to i64
  call void @__llvm_profile_instrument_target(i64 %49, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_select_file_type to i8*), i32 1)
  call void %46(%struct.jpeg_common_struct* %48)
  br label %50

; <label>:50:                                     ; preds = %36, %31
  %51 = load i32, i32* %6, align 4
  switch i32 %51, label %68 [
    i32 66, label %52
    i32 71, label %56
    i32 80, label %60
    i32 0, label %64
  ]

; <label>:52:                                     ; preds = %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 3)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 3)
  %54 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %55 = call %struct.cjpeg_source_struct* @jinit_read_bmp(%struct.jpeg_compress_struct* %54)
  store %struct.cjpeg_source_struct* %55, %struct.cjpeg_source_struct** %3, align 8
  br label %83

; <label>:56:                                     ; preds = %50
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 4)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 4)
  %58 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %59 = call %struct.cjpeg_source_struct* @jinit_read_gif(%struct.jpeg_compress_struct* %58)
  store %struct.cjpeg_source_struct* %59, %struct.cjpeg_source_struct** %3, align 8
  br label %83

; <label>:60:                                     ; preds = %50
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 5)
  %61 = add i64 %pgocount5, 1
  store i64 %61, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 5)
  %62 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %63 = call %struct.cjpeg_source_struct* @jinit_read_ppm(%struct.jpeg_compress_struct* %62)
  store %struct.cjpeg_source_struct* %63, %struct.cjpeg_source_struct** %3, align 8
  br label %83

; <label>:64:                                     ; preds = %50
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 6)
  %65 = add i64 %pgocount6, 1
  store i64 %65, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 6)
  %66 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %67 = call %struct.cjpeg_source_struct* @jinit_read_targa(%struct.jpeg_compress_struct* %66)
  store %struct.cjpeg_source_struct* %67, %struct.cjpeg_source_struct** %3, align 8
  br label %83

; <label>:68:                                     ; preds = %50
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %69, i32 0, i32 0
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i32 0, i32 5
  store i32 1041, i32* %72, align 8
  %73 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %74 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %73, i32 0, i32 0
  %75 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %74, align 8
  %76 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %75, i32 0, i32 0
  %77 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %76, align 8
  %78 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %79 = bitcast %struct.jpeg_compress_struct* %78 to %struct.jpeg_common_struct*
  %80 = ptrtoint void (%struct.jpeg_common_struct*)* %77 to i64
  call void @__llvm_profile_instrument_target(i64 %80, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_select_file_type to i8*), i32 2)
  call void %77(%struct.jpeg_common_struct* %79)
  br label %81

; <label>:81:                                     ; preds = %68
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 7)
  %82 = add i64 %pgocount7, 1
  store i64 %82, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_select_file_type, i64 0, i64 7)
  store %struct.cjpeg_source_struct* null, %struct.cjpeg_source_struct** %3, align 8
  br label %83

; <label>:83:                                     ; preds = %81, %64, %60, %56, %52, %9
  %84 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %3, align 8
  ret %struct.cjpeg_source_struct* %84
}

declare void @jpeg_default_colorspace(%struct.jpeg_compress_struct*) #1

declare void @jpeg_stdio_dest(%struct.jpeg_compress_struct*, %struct._IO_FILE*) #1

declare void @jpeg_start_compress(%struct.jpeg_compress_struct*, i32) #1

declare i32 @jpeg_write_scanlines(%struct.jpeg_compress_struct*, i8**, i32) #1

declare void @jpeg_finish_compress(%struct.jpeg_compress_struct*) #1

declare void @jpeg_destroy_compress(%struct.jpeg_compress_struct*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare i32 @keymatch(i8*, i8*, i32) #1

declare void @jpeg_set_colorspace(%struct.jpeg_compress_struct*, i32) #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #3

declare i32 @jpeg_quality_scaling(i32) #1

declare void @jpeg_set_quality(%struct.jpeg_compress_struct*, i32, i32) #1

declare i32 @read_quant_tables(%struct.jpeg_compress_struct*, i8*, i32, i32) #1

declare i32 @set_quant_slots(%struct.jpeg_compress_struct*, i8*) #1

declare i32 @set_sample_factors(%struct.jpeg_compress_struct*, i8*) #1

declare void @jpeg_simple_progression(%struct.jpeg_compress_struct*) #1

declare i32 @read_scan_script(%struct.jpeg_compress_struct*, i8*) #1

declare %struct.cjpeg_source_struct* @jinit_read_targa(%struct.jpeg_compress_struct*) #1

declare i32 @_IO_getc(%struct._IO_FILE*) #1

declare i32 @ungetc(i32, %struct._IO_FILE*) #1

declare %struct.cjpeg_source_struct* @jinit_read_bmp(%struct.jpeg_compress_struct*) #1

declare %struct.cjpeg_source_struct* @jinit_read_gif(%struct.jpeg_compress_struct*) #1

declare %struct.cjpeg_source_struct* @jinit_read_ppm(%struct.jpeg_compress_struct*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
