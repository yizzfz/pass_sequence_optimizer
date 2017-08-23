; ModuleID = 'tmp1.ll'
source_filename = "djpeg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
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
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type opaque
%struct.jpeg_d_main_controller = type opaque
%struct.jpeg_d_coef_controller = type opaque
%struct.jpeg_d_post_controller = type opaque
%struct.jpeg_input_controller = type opaque
%struct.jpeg_marker_reader = type opaque
%struct.jpeg_entropy_decoder = type opaque
%struct.jpeg_inverse_dct = type opaque
%struct.jpeg_upsampler = type opaque
%struct.jpeg_color_deconverter = type opaque
%struct.jpeg_color_quantizer = type opaque
%struct.djpeg_dest_struct = type { void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, %struct._IO_FILE*, i8**, i32 }

$__llvm_profile_raw_version = comdat any

@progname = internal global i8* null, align 8
@.str = private unnamed_addr constant [6 x i8] c"djpeg\00", align 1
@cdjpeg_message_table = internal constant [44 x i8*] [i8* null, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.39, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.44, i32 0, i32 0), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.45, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.46, i32 0, i32 0), i8* null], align 16
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [25 x i8] c"%s: only one input file\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"%s: can't open %s\0A\00", align 1
@outfilename = internal global i8* null, align 8
@.str.4 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@requested_fmt = internal global i32 0, align 4
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
@.str.47 = private unnamed_addr constant [22 x i8] c"Comment, length %ld:\0A\00", align 1
@.str.48 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.49 = private unnamed_addr constant [3 x i8] c"\5C\5C\00", align 1
@.str.50 = private unnamed_addr constant [6 x i8] c"\5C%03o\00", align 1
@.str.51 = private unnamed_addr constant [4 x i8] c"bmp\00", align 1
@.str.52 = private unnamed_addr constant [7 x i8] c"colors\00", align 1
@.str.53 = private unnamed_addr constant [8 x i8] c"colours\00", align 1
@.str.54 = private unnamed_addr constant [9 x i8] c"quantize\00", align 1
@.str.55 = private unnamed_addr constant [9 x i8] c"quantise\00", align 1
@.str.56 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.57 = private unnamed_addr constant [4 x i8] c"dct\00", align 1
@.str.58 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.59 = private unnamed_addr constant [5 x i8] c"fast\00", align 1
@.str.60 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.61 = private unnamed_addr constant [7 x i8] c"dither\00", align 1
@.str.62 = private unnamed_addr constant [3 x i8] c"fs\00", align 1
@.str.63 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.64 = private unnamed_addr constant [8 x i8] c"ordered\00", align 1
@.str.65 = private unnamed_addr constant [6 x i8] c"debug\00", align 1
@.str.66 = private unnamed_addr constant [8 x i8] c"verbose\00", align 1
@parse_switches.printed_version = internal global i32 0, align 4
@.str.67 = private unnamed_addr constant [47 x i8] c"Independent JPEG Group's DJPEG, version %s\0A%s\0A\00", align 1
@.str.68 = private unnamed_addr constant [13 x i8] c"6a  7-Feb-96\00", align 1
@.str.69 = private unnamed_addr constant [35 x i8] c"Copyright (C) 1996, Thomas G. Lane\00", align 1
@.str.70 = private unnamed_addr constant [4 x i8] c"gif\00", align 1
@.str.71 = private unnamed_addr constant [10 x i8] c"grayscale\00", align 1
@.str.72 = private unnamed_addr constant [10 x i8] c"greyscale\00", align 1
@.str.73 = private unnamed_addr constant [4 x i8] c"map\00", align 1
@.str.74 = private unnamed_addr constant [10 x i8] c"maxmemory\00", align 1
@.str.75 = private unnamed_addr constant [6 x i8] c"%ld%c\00", align 1
@.str.76 = private unnamed_addr constant [9 x i8] c"nosmooth\00", align 1
@.str.77 = private unnamed_addr constant [8 x i8] c"onepass\00", align 1
@.str.78 = private unnamed_addr constant [4 x i8] c"os2\00", align 1
@.str.79 = private unnamed_addr constant [8 x i8] c"outfile\00", align 1
@.str.80 = private unnamed_addr constant [4 x i8] c"pnm\00", align 1
@.str.81 = private unnamed_addr constant [4 x i8] c"ppm\00", align 1
@.str.82 = private unnamed_addr constant [4 x i8] c"rle\00", align 1
@.str.83 = private unnamed_addr constant [6 x i8] c"scale\00", align 1
@.str.84 = private unnamed_addr constant [6 x i8] c"%d/%d\00", align 1
@.str.85 = private unnamed_addr constant [6 x i8] c"targa\00", align 1
@.str.86 = private unnamed_addr constant [22 x i8] c"usage: %s [switches] \00", align 1
@.str.87 = private unnamed_addr constant [13 x i8] c"[inputfile]\0A\00", align 1
@.str.88 = private unnamed_addr constant [38 x i8] c"Switches (names may be abbreviated):\0A\00", align 1
@.str.89 = private unnamed_addr constant [56 x i8] c"  -colors N      Reduce image to no more than N colors\0A\00", align 1
@.str.90 = private unnamed_addr constant [47 x i8] c"  -fast          Fast, low-quality processing\0A\00", align 1
@.str.91 = private unnamed_addr constant [41 x i8] c"  -grayscale     Force grayscale output\0A\00", align 1
@.str.92 = private unnamed_addr constant [62 x i8] c"  -scale M/N     Scale output image by fraction M/N, eg, 1/8\0A\00", align 1
@.str.93 = private unnamed_addr constant [61 x i8] c"  -bmp           Select BMP output format (Windows style)%s\0A\00", align 1
@.str.94 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.95 = private unnamed_addr constant [45 x i8] c"  -gif           Select GIF output format%s\0A\00", align 1
@.str.96 = private unnamed_addr constant [58 x i8] c"  -os2           Select BMP output format (OS/2 style)%s\0A\00", align 1
@.str.97 = private unnamed_addr constant [59 x i8] c"  -pnm           Select PBMPLUS (PPM/PGM) output format%s\0A\00", align 1
@.str.98 = private unnamed_addr constant [11 x i8] c" (default)\00", align 1
@.str.99 = private unnamed_addr constant [47 x i8] c"  -targa         Select Targa output format%s\0A\00", align 1
@.str.100 = private unnamed_addr constant [30 x i8] c"Switches for advanced users:\0A\00", align 1
@.str.101 = private unnamed_addr constant [43 x i8] c"  -dct int       Use integer DCT method%s\0A\00", align 1
@.str.102 = private unnamed_addr constant [57 x i8] c"  -dct fast      Use fast integer DCT (less accurate)%s\0A\00", align 1
@.str.103 = private unnamed_addr constant [50 x i8] c"  -dct float     Use floating-point DCT method%s\0A\00", align 1
@.str.104 = private unnamed_addr constant [46 x i8] c"  -dither fs     Use F-S dithering (default)\0A\00", align 1
@.str.105 = private unnamed_addr constant [54 x i8] c"  -dither none   Don't use dithering in quantization\0A\00", align 1
@.str.106 = private unnamed_addr constant [63 x i8] c"  -dither ordered  Use ordered dither (medium speed, quality)\0A\00", align 1
@.str.107 = private unnamed_addr constant [57 x i8] c"  -map FILE      Map to colors used in named image file\0A\00", align 1
@.str.108 = private unnamed_addr constant [52 x i8] c"  -nosmooth      Don't use high-quality upsampling\0A\00", align 1
@.str.109 = private unnamed_addr constant [62 x i8] c"  -onepass       Use 1-pass quantization (fast, low quality)\0A\00", align 1
@.str.110 = private unnamed_addr constant [52 x i8] c"  -maxmemory N   Maximum memory to use (in kbytes)\0A\00", align 1
@.str.111 = private unnamed_addr constant [47 x i8] c"  -outfile name  Specify name for output file\0A\00", align 1
@.str.112 = private unnamed_addr constant [44 x i8] c"  -verbose  or  -debug   Emit debug output\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main1 = private constant [5 x i8] c"main1"
@__profn_tmp1.ll_COM_handler = private constant [19 x i8] c"tmp1.ll:COM_handler"
@__profn_tmp1.ll_parse_switches = private constant [22 x i8] c"tmp1.ll:parse_switches"
@__profn_tmp1.ll_usage = private constant [13 x i8] c"tmp1.ll:usage"
@__profn_tmp1.ll_jpeg_getc = private constant [17 x i8] c"tmp1.ll:jpeg_getc"
@__profc_main1 = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_main1 = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 1126097611893909, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main1 to i8*), i8* bitcast ([4 x i64]* @__profvp_main1 to i8*), i32 16, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_COM_handler = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_COM_handler = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2500276846439989465, i64 147044603183, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @COM_handler to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_parse_switches = private global [50 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_parse_switches = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2477713196328074963, i64 722385733208, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i32 0, i32 0), i8* null, i8* null, i32 50, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_usage = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7998456694610620455, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_jpeg_getc = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_jpeg_getc = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_jpeg_getc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8375104283571273956, i64 562988352351897, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jpeg_getc, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_jpeg_getc to i8*), i32 3, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [12 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [68 x i8] c"PBx\DA\CBM\CC\CC3d,\C9-0\D4\CB\C9\B1r\F6\F7\8D\CFH\CCK\C9I-\82\8B\15$\16\15\A7\C6\17\97g\96$g\A4\16\C3\85K\8B\13\D3S\E1\BC\AC\82\D4\F4\F8\F4\D4\92d\00r\E3\1C\A0", section "__llvm_prf_names"
@llvm.used = appending global [7 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_COM_handler to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_parse_switches to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_jpeg_getc to i8*), i8* bitcast ([12 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca %struct.jpeg_decompress_struct, align 8
  %6 = alloca %struct.jpeg_error_mgr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.djpeg_dest_struct*, align 8
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca %struct._IO_FILE*, align 8
  %11 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store %struct.djpeg_dest_struct* null, %struct.djpeg_dest_struct** %8, align 8
  %12 = load i8**, i8*** %4, align 8
  %13 = getelementptr inbounds i8*, i8** %12, i64 0
  %14 = load i8*, i8** %13, align 8
  store i8* %14, i8** @progname, align 8
  %15 = load i8*, i8** @progname, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %24, label %17

; <label>:17:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 1)
  %19 = load i8*, i8** @progname, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %17, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 4)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 4)
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8** @progname, align 8
  br label %26

; <label>:26:                                     ; preds = %24, %17
  %27 = call %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr* %6)
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 0
  store %struct.jpeg_error_mgr* %27, %struct.jpeg_error_mgr** %28, align 8
  call void @jpeg_CreateDecompress(%struct.jpeg_decompress_struct* %5, i32 61, i64 616)
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i32 0, i32 11
  store i8** getelementptr inbounds ([44 x i8*], [44 x i8*]* @cdjpeg_message_table, i32 0, i32 0), i8*** %29, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i32 0, i32 12
  store i32 1000, i32* %30, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i32 0, i32 13
  store i32 1043, i32* %31, align 4
  call void @jpeg_set_marker_processor(%struct.jpeg_decompress_struct* %5, i32 254, i32 (%struct.jpeg_decompress_struct*)* @COM_handler)
  %32 = load i32, i32* %3, align 4
  %33 = load i8**, i8*** %4, align 8
  %34 = call i32 @parse_switches(%struct.jpeg_decompress_struct* %5, i32 %32, i8** %33, i32 0, i32 0)
  store i32 %34, i32* %7, align 4
  %35 = load i32, i32* %7, align 4
  %36 = load i32, i32* %3, align 4
  %37 = sub nsw i32 %36, 1
  %38 = icmp slt i32 %35, %37
  br i1 %38, label %39, label %44

; <label>:39:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 5)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 5)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = load i8*, i8** @progname, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i32 0, i32 0), i8* %42)
  call void @usage()
  br label %44

; <label>:44:                                     ; preds = %39, %26
  %45 = load i32, i32* %7, align 4
  %46 = load i32, i32* %3, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %68

; <label>:48:                                     ; preds = %44
  %49 = load i8**, i8*** %4, align 8
  %50 = load i32, i32* %7, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8*, i8** %49, i64 %51
  %53 = load i8*, i8** %52, align 8
  %54 = call %struct._IO_FILE* @fopen(i8* %53, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %54, %struct._IO_FILE** %9, align 8
  %55 = icmp eq %struct._IO_FILE* %54, null
  br i1 %55, label %56, label %66

; <label>:56:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 15)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 15)
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = load i8*, i8** @progname, align 8
  %60 = load i8**, i8*** %4, align 8
  %61 = load i32, i32* %7, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8*, i8** %60, i64 %62
  %64 = load i8*, i8** %63, align 8
  %65 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* %59, i8* %64)
  call void @exit(i32 1) #6
  unreachable

; <label>:66:                                     ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 6)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 6)
  br label %70

; <label>:68:                                     ; preds = %44
  %69 = call %struct._IO_FILE* @read_stdin()
  store %struct._IO_FILE* %69, %struct._IO_FILE** %9, align 8
  br label %70

; <label>:70:                                     ; preds = %68, %66
  %71 = load i8*, i8** @outfilename, align 8
  %72 = icmp ne i8* %71, null
  br i1 %72, label %73, label %84

; <label>:73:                                     ; preds = %70
  %74 = load i8*, i8** @outfilename, align 8
  %75 = call %struct._IO_FILE* @fopen(i8* %74, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %75, %struct._IO_FILE** %10, align 8
  %76 = icmp eq %struct._IO_FILE* %75, null
  br i1 %76, label %77, label %83

; <label>:77:                                     ; preds = %73
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 14)
  %78 = add i64 %pgocount5, 1
  store i64 %78, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 14)
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %80 = load i8*, i8** @progname, align 8
  %81 = load i8*, i8** @outfilename, align 8
  %82 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %79, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* %80, i8* %81)
  call void @exit(i32 1) #6
  unreachable

; <label>:83:                                     ; preds = %73
  br label %87

; <label>:84:                                     ; preds = %70
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 7)
  %85 = add i64 %pgocount6, 1
  store i64 %85, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 7)
  %86 = call %struct._IO_FILE* @write_stdout()
  store %struct._IO_FILE* %86, %struct._IO_FILE** %10, align 8
  br label %87

; <label>:87:                                     ; preds = %84, %83
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  call void @jpeg_stdio_src(%struct.jpeg_decompress_struct* %5, %struct._IO_FILE* %88)
  %89 = call i32 @jpeg_read_header(%struct.jpeg_decompress_struct* %5, i32 1)
  %90 = load i32, i32* %3, align 4
  %91 = load i8**, i8*** %4, align 8
  %92 = call i32 @parse_switches(%struct.jpeg_decompress_struct* %5, i32 %90, i8** %91, i32 0, i32 1)
  store i32 %92, i32* %7, align 4
  %93 = load i32, i32* @requested_fmt, align 4
  switch i32 %93, label %109 [
    i32 0, label %94
    i32 2, label %97
    i32 1, label %100
    i32 3, label %103
    i32 5, label %106
  ]

; <label>:94:                                     ; preds = %87
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 8)
  %95 = add i64 %pgocount7, 1
  store i64 %95, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 8)
  %96 = call %struct.djpeg_dest_struct* @jinit_write_bmp(%struct.jpeg_decompress_struct* %5, i32 0)
  store %struct.djpeg_dest_struct* %96, %struct.djpeg_dest_struct** %8, align 8
  br label %120

; <label>:97:                                     ; preds = %87
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 9)
  %98 = add i64 %pgocount8, 1
  store i64 %98, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 9)
  %99 = call %struct.djpeg_dest_struct* @jinit_write_bmp(%struct.jpeg_decompress_struct* %5, i32 1)
  store %struct.djpeg_dest_struct* %99, %struct.djpeg_dest_struct** %8, align 8
  br label %120

; <label>:100:                                    ; preds = %87
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 10)
  %101 = add i64 %pgocount9, 1
  store i64 %101, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 10)
  %102 = call %struct.djpeg_dest_struct* @jinit_write_gif(%struct.jpeg_decompress_struct* %5)
  store %struct.djpeg_dest_struct* %102, %struct.djpeg_dest_struct** %8, align 8
  br label %120

; <label>:103:                                    ; preds = %87
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 11)
  %104 = add i64 %pgocount10, 1
  store i64 %104, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 11)
  %105 = call %struct.djpeg_dest_struct* @jinit_write_ppm(%struct.jpeg_decompress_struct* %5)
  store %struct.djpeg_dest_struct* %105, %struct.djpeg_dest_struct** %8, align 8
  br label %120

; <label>:106:                                    ; preds = %87
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 12)
  %107 = add i64 %pgocount11, 1
  store i64 %107, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 12)
  %108 = call %struct.djpeg_dest_struct* @jinit_write_targa(%struct.jpeg_decompress_struct* %5)
  store %struct.djpeg_dest_struct* %108, %struct.djpeg_dest_struct** %8, align 8
  br label %120

; <label>:109:                                    ; preds = %87
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 13)
  %110 = add i64 %pgocount12, 1
  store i64 %110, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 13)
  %111 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 0
  %112 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %111, align 8
  %113 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %112, i32 0, i32 5
  store i32 1042, i32* %113, align 8
  %114 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 0
  %115 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %114, align 8
  %116 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %115, i32 0, i32 0
  %117 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %116, align 8
  %118 = bitcast %struct.jpeg_decompress_struct* %5 to %struct.jpeg_common_struct*
  %119 = ptrtoint void (%struct.jpeg_common_struct*)* %117 to i64
  call void @__llvm_profile_instrument_target(i64 %119, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i32 0)
  call void %117(%struct.jpeg_common_struct* %118)
  br label %120

; <label>:120:                                    ; preds = %109, %106, %103, %100, %97, %94
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %122 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %8, align 8
  %123 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %122, i32 0, i32 3
  store %struct._IO_FILE* %121, %struct._IO_FILE** %123, align 8
  %124 = call i32 @jpeg_start_decompress(%struct.jpeg_decompress_struct* %5)
  %125 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %8, align 8
  %126 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %125, i32 0, i32 0
  %127 = load void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %126, align 8
  %128 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %8, align 8
  %129 = ptrtoint void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* %127 to i64
  call void @__llvm_profile_instrument_target(i64 %129, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i32 1)
  call void %127(%struct.jpeg_decompress_struct* %5, %struct.djpeg_dest_struct* %128)
  br label %130

; <label>:130:                                    ; preds = %136, %120
  %131 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 33
  %132 = load i32, i32* %131, align 8
  %133 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 27
  %134 = load i32, i32* %133, align 4
  %135 = icmp ult i32 %132, %134
  br i1 %135, label %136, label %151

; <label>:136:                                    ; preds = %130
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 0)
  %137 = add i64 %pgocount13, 1
  store i64 %137, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 0)
  %138 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %8, align 8
  %139 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %138, i32 0, i32 4
  %140 = load i8**, i8*** %139, align 8
  %141 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %8, align 8
  %142 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %141, i32 0, i32 5
  %143 = load i32, i32* %142, align 8
  %144 = call i32 @jpeg_read_scanlines(%struct.jpeg_decompress_struct* %5, i8** %140, i32 %143)
  store i32 %144, i32* %11, align 4
  %145 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %8, align 8
  %146 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %145, i32 0, i32 1
  %147 = load void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %146, align 8
  %148 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %8, align 8
  %149 = load i32, i32* %11, align 4
  %150 = ptrtoint void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* %147 to i64
  call void @__llvm_profile_instrument_target(i64 %150, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i32 2)
  call void %147(%struct.jpeg_decompress_struct* %5, %struct.djpeg_dest_struct* %148, i32 %149)
  br label %130

; <label>:151:                                    ; preds = %130
  %152 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %8, align 8
  %153 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %152, i32 0, i32 2
  %154 = load void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %153, align 8
  %155 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %8, align 8
  %156 = ptrtoint void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* %154 to i64
  call void @__llvm_profile_instrument_target(i64 %156, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i32 3)
  call void %154(%struct.jpeg_decompress_struct* %5, %struct.djpeg_dest_struct* %155)
  %157 = call i32 @jpeg_finish_decompress(%struct.jpeg_decompress_struct* %5)
  call void @jpeg_destroy_decompress(%struct.jpeg_decompress_struct* %5)
  %158 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %159 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %160 = icmp ne %struct._IO_FILE* %158, %159
  br i1 %160, label %161, label %165

; <label>:161:                                    ; preds = %151
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 2)
  %162 = add i64 %pgocount14, 1
  store i64 %162, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 2)
  %163 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %164 = call i32 @fclose(%struct._IO_FILE* %163)
  br label %165

; <label>:165:                                    ; preds = %161, %151
  %166 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %167 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %168 = icmp ne %struct._IO_FILE* %166, %167
  br i1 %168, label %169, label %173

; <label>:169:                                    ; preds = %165
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 3)
  %170 = add i64 %pgocount15, 1
  store i64 %170, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 3)
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %172 = call i32 @fclose(%struct._IO_FILE* %171)
  br label %173

; <label>:173:                                    ; preds = %169, %165
  ret i32 0
}

declare %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr*) #1

declare void @jpeg_CreateDecompress(%struct.jpeg_decompress_struct*, i32, i64) #1

declare void @jpeg_set_marker_processor(%struct.jpeg_decompress_struct*, i32, i32 (%struct.jpeg_decompress_struct*)*) #1

; Function Attrs: nounwind uwtable
define internal i32 @COM_handler(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %7 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %7, i32 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i32 0, i32 7
  %11 = load i32, i32* %10, align 4
  %12 = icmp sge i32 %11, 1
  %13 = zext i1 %12 to i32
  store i32 %13, i32* %3, align 4
  store i32 0, i32* %6, align 4
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %15 = call i32 @jpeg_getc(%struct.jpeg_decompress_struct* %14)
  %16 = shl i32 %15, 8
  %17 = zext i32 %16 to i64
  store i64 %17, i64* %4, align 8
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %19 = call i32 @jpeg_getc(%struct.jpeg_decompress_struct* %18)
  %20 = zext i32 %19 to i64
  %21 = load i64, i64* %4, align 8
  %22 = add nsw i64 %21, %20
  store i64 %22, i64* %4, align 8
  %23 = load i64, i64* %4, align 8
  %24 = sub nsw i64 %23, 2
  store i64 %24, i64* %4, align 8
  %25 = load i32, i32* %3, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %32

; <label>:27:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 8)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 8)
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = load i64, i64* %4, align 8
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.47, i32 0, i32 0), i64 %30)
  br label %32

; <label>:32:                                     ; preds = %27, %1
  br label %33

; <label>:33:                                     ; preds = %93, %32
  %34 = load i64, i64* %4, align 8
  %35 = add nsw i64 %34, -1
  store i64 %35, i64* %4, align 8
  %36 = icmp sge i64 %35, 0
  br i1 %36, label %37, label %95

; <label>:37:                                     ; preds = %33
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %39 = call i32 @jpeg_getc(%struct.jpeg_decompress_struct* %38)
  store i32 %39, i32* %5, align 4
  %40 = load i32, i32* %3, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %93

; <label>:42:                                     ; preds = %37
  %43 = load i32, i32* %5, align 4
  %44 = icmp eq i32 %43, 13
  br i1 %44, label %45, label %49

; <label>:45:                                     ; preds = %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 1)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 1)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.48, i32 0, i32 0))
  br label %91

; <label>:49:                                     ; preds = %42
  %50 = load i32, i32* %5, align 4
  %51 = icmp eq i32 %50, 10
  br i1 %51, label %52, label %61

; <label>:52:                                     ; preds = %49
  %53 = load i32, i32* %6, align 4
  %54 = icmp ne i32 %53, 13
  br i1 %54, label %55, label %59

; <label>:55:                                     ; preds = %52
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 3)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 3)
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.48, i32 0, i32 0))
  br label %59

; <label>:59:                                     ; preds = %55, %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 2)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 2)
  br label %90

; <label>:61:                                     ; preds = %49
  %62 = load i32, i32* %5, align 4
  %63 = icmp eq i32 %62, 92
  br i1 %63, label %64, label %68

; <label>:64:                                     ; preds = %61
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 4)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 4)
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %67 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %66, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.49, i32 0, i32 0))
  br label %89

; <label>:68:                                     ; preds = %61
  %69 = call i16** @__ctype_b_loc() #7
  %70 = load i16*, i16** %69, align 8
  %71 = load i32, i32* %5, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i16, i16* %70, i64 %72
  %74 = load i16, i16* %73, align 2
  %75 = zext i16 %74 to i32
  %76 = and i32 %75, 16384
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %83

; <label>:78:                                     ; preds = %68
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 5)
  %79 = add i64 %pgocount5, 1
  store i64 %79, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 5)
  %80 = load i32, i32* %5, align 4
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %82 = call i32 @_IO_putc(i32 %80, %struct._IO_FILE* %81)
  br label %88

; <label>:83:                                     ; preds = %68
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 6)
  %84 = add i64 %pgocount6, 1
  store i64 %84, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 6)
  %85 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %86 = load i32, i32* %5, align 4
  %87 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %85, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.50, i32 0, i32 0), i32 %86)
  br label %88

; <label>:88:                                     ; preds = %83, %78
  br label %89

; <label>:89:                                     ; preds = %88, %64
  br label %90

; <label>:90:                                     ; preds = %89, %59
  br label %91

; <label>:91:                                     ; preds = %90, %45
  %92 = load i32, i32* %5, align 4
  store i32 %92, i32* %6, align 4
  br label %93

; <label>:93:                                     ; preds = %91, %37
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 0)
  %94 = add i64 %pgocount7, 1
  store i64 %94, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 0)
  br label %33

; <label>:95:                                     ; preds = %33
  %96 = load i32, i32* %3, align 4
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %102

; <label>:98:                                     ; preds = %95
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 9)
  %99 = add i64 %pgocount8, 1
  store i64 %99, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 9)
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %101 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %100, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.48, i32 0, i32 0))
  br label %102

; <label>:102:                                    ; preds = %98, %95
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 7)
  %103 = add i64 %pgocount9, 1
  store i64 %103, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_COM_handler, i64 0, i64 7)
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal i32 @parse_switches(%struct.jpeg_decompress_struct*, i32, i8**, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 48)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 48)
  %7 = alloca %struct.jpeg_decompress_struct*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8**, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct._IO_FILE*, align 8
  %16 = alloca i64, align 8
  %17 = alloca i8, align 1
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %7, align 8
  store i32 %1, i32* %8, align 4
  store i8** %2, i8*** %9, align 8
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32 3, i32* @requested_fmt, align 4
  store i8* null, i8** @outfilename, align 8
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i32 0, i32 7
  store i32 0, i32* %21, align 4
  store i32 1, i32* %12, align 4
  br label %22

; <label>:22:                                     ; preds = %458, %5
  %23 = load i32, i32* %12, align 4
  %24 = load i32, i32* %8, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %462

; <label>:26:                                     ; preds = %22
  %27 = load i8**, i8*** %9, align 8
  %28 = load i32, i32* %12, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8*, i8** %27, i64 %29
  %31 = load i8*, i8** %30, align 8
  store i8* %31, i8** %13, align 8
  %32 = load i8*, i8** %13, align 8
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp ne i32 %34, 45
  br i1 %35, label %36, label %43

; <label>:36:                                     ; preds = %26
  %37 = load i32, i32* %12, align 4
  %38 = load i32, i32* %10, align 4
  %39 = icmp sle i32 %37, %38
  br i1 %39, label %40, label %41

; <label>:40:                                     ; preds = %36
  store i8* null, i8** @outfilename, align 8
  br label %458

; <label>:41:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 3)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 3)
  br label %462

; <label>:43:                                     ; preds = %26
  %44 = load i8*, i8** %13, align 8
  %45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %45, i8** %13, align 8
  %46 = load i8*, i8** %13, align 8
  %47 = call i32 @keymatch(i8* %46, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.51, i32 0, i32 0), i32 1)
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 8)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 8)
  store i32 0, i32* @requested_fmt, align 4
  br label %457

; <label>:51:                                     ; preds = %43
  %52 = load i8*, i8** %13, align 8
  %53 = call i32 @keymatch(i8* %52, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.52, i32 0, i32 0), i32 1)
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %70, label %55

; <label>:55:                                     ; preds = %51
  %56 = load i8*, i8** %13, align 8
  %57 = call i32 @keymatch(i8* %56, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.53, i32 0, i32 0), i32 1)
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %._crit_edge1, label %60

._crit_edge1:                                     ; preds = %55
  %pgocount4 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 10)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 10)
  br label %70

; <label>:60:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 6)
  %61 = add i64 %pgocount5, 1
  store i64 %61, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 6)
  %62 = load i8*, i8** %13, align 8
  %63 = call i32 @keymatch(i8* %62, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.54, i32 0, i32 0), i32 1)
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %70, label %65

; <label>:65:                                     ; preds = %60
  %66 = load i8*, i8** %13, align 8
  %67 = call i32 @keymatch(i8* %66, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.55, i32 0, i32 0), i32 1)
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %._crit_edge, label %94

._crit_edge:                                      ; preds = %65
  %pgocount6 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 4)
  %69 = add i64 %pgocount6, 1
  store i64 %69, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 4)
  br label %70

; <label>:70:                                     ; preds = %._crit_edge1, %._crit_edge, %60, %51
  %71 = load i32, i32* %12, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %12, align 4
  %73 = load i32, i32* %8, align 4
  %74 = icmp sge i32 %72, %73
  br i1 %74, label %75, label %77

; <label>:75:                                     ; preds = %70
  %pgocount7 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 0)
  %76 = add i64 %pgocount7, 1
  store i64 %76, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 0)
  call void @usage()
  br label %77

; <label>:77:                                     ; preds = %75, %70
  %78 = load i8**, i8*** %9, align 8
  %79 = load i32, i32* %12, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8*, i8** %78, i64 %80
  %82 = load i8*, i8** %81, align 8
  %83 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %82, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i32 0, i32 0), i32* %14) #5
  %84 = icmp ne i32 %83, 1
  br i1 %84, label %85, label %87

; <label>:85:                                     ; preds = %77
  %pgocount8 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 1)
  %86 = add i64 %pgocount8, 1
  store i64 %86, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 1)
  call void @usage()
  br label %87

; <label>:87:                                     ; preds = %85, %77
  %pgocount9 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 2)
  %88 = add i64 %pgocount9, 1
  store i64 %88, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 2)
  %89 = load i32, i32* %14, align 4
  %90 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %91 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %90, i32 0, i32 22
  store i32 %89, i32* %91, align 8
  %92 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %93 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %92, i32 0, i32 19
  store i32 1, i32* %93, align 4
  br label %456

; <label>:94:                                     ; preds = %65
  %95 = load i8*, i8** %13, align 8
  %96 = call i32 @keymatch(i8* %95, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.57, i32 0, i32 0), i32 2)
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %146

; <label>:98:                                     ; preds = %94
  %99 = load i32, i32* %12, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %12, align 4
  %101 = load i32, i32* %8, align 4
  %102 = icmp sge i32 %100, %101
  br i1 %102, label %103, label %105

; <label>:103:                                    ; preds = %98
  %pgocount10 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 9)
  %104 = add i64 %pgocount10, 1
  store i64 %104, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 9)
  call void @usage()
  br label %105

; <label>:105:                                    ; preds = %103, %98
  %106 = load i8**, i8*** %9, align 8
  %107 = load i32, i32* %12, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i8*, i8** %106, i64 %108
  %110 = load i8*, i8** %109, align 8
  %111 = call i32 @keymatch(i8* %110, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.58, i32 0, i32 0), i32 1)
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %117

; <label>:113:                                    ; preds = %105
  %pgocount11 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 7)
  %114 = add i64 %pgocount11, 1
  store i64 %114, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 7)
  %115 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %116 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %115, i32 0, i32 16
  store i32 0, i32* %116, align 8
  br label %145

; <label>:117:                                    ; preds = %105
  %118 = load i8**, i8*** %9, align 8
  %119 = load i32, i32* %12, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8*, i8** %118, i64 %120
  %122 = load i8*, i8** %121, align 8
  %123 = call i32 @keymatch(i8* %122, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.59, i32 0, i32 0), i32 2)
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %125, label %129

; <label>:125:                                    ; preds = %117
  %pgocount12 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 11)
  %126 = add i64 %pgocount12, 1
  store i64 %126, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 11)
  %127 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %128 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %127, i32 0, i32 16
  store i32 1, i32* %128, align 8
  br label %144

; <label>:129:                                    ; preds = %117
  %130 = load i8**, i8*** %9, align 8
  %131 = load i32, i32* %12, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i8*, i8** %130, i64 %132
  %134 = load i8*, i8** %133, align 8
  %135 = call i32 @keymatch(i8* %134, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.60, i32 0, i32 0), i32 2)
  %136 = icmp ne i32 %135, 0
  br i1 %136, label %137, label %141

; <label>:137:                                    ; preds = %129
  %pgocount13 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 15)
  %138 = add i64 %pgocount13, 1
  store i64 %138, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 15)
  %139 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %140 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %139, i32 0, i32 16
  store i32 2, i32* %140, align 8
  br label %143

; <label>:141:                                    ; preds = %129
  %pgocount14 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 19)
  %142 = add i64 %pgocount14, 1
  store i64 %142, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 19)
  call void @usage()
  br label %143

; <label>:143:                                    ; preds = %141, %137
  br label %144

; <label>:144:                                    ; preds = %143, %125
  br label %145

; <label>:145:                                    ; preds = %144, %113
  br label %455

; <label>:146:                                    ; preds = %94
  %147 = load i8*, i8** %13, align 8
  %148 = call i32 @keymatch(i8* %147, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i32 2)
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %150, label %198

; <label>:150:                                    ; preds = %146
  %151 = load i32, i32* %12, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* %12, align 4
  %153 = load i32, i32* %8, align 4
  %154 = icmp sge i32 %152, %153
  br i1 %154, label %155, label %157

; <label>:155:                                    ; preds = %150
  %pgocount15 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 14)
  %156 = add i64 %pgocount15, 1
  store i64 %156, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 14)
  call void @usage()
  br label %157

; <label>:157:                                    ; preds = %155, %150
  %158 = load i8**, i8*** %9, align 8
  %159 = load i32, i32* %12, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i8*, i8** %158, i64 %160
  %162 = load i8*, i8** %161, align 8
  %163 = call i32 @keymatch(i8* %162, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.62, i32 0, i32 0), i32 2)
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %165, label %169

; <label>:165:                                    ; preds = %157
  %pgocount16 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 12)
  %166 = add i64 %pgocount16, 1
  store i64 %166, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 12)
  %167 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %168 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %167, i32 0, i32 20
  store i32 2, i32* %168, align 8
  br label %197

; <label>:169:                                    ; preds = %157
  %170 = load i8**, i8*** %9, align 8
  %171 = load i32, i32* %12, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i8*, i8** %170, i64 %172
  %174 = load i8*, i8** %173, align 8
  %175 = call i32 @keymatch(i8* %174, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i32 2)
  %176 = icmp ne i32 %175, 0
  br i1 %176, label %177, label %181

; <label>:177:                                    ; preds = %169
  %pgocount17 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 16)
  %178 = add i64 %pgocount17, 1
  store i64 %178, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 16)
  %179 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %180 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %179, i32 0, i32 20
  store i32 0, i32* %180, align 8
  br label %196

; <label>:181:                                    ; preds = %169
  %182 = load i8**, i8*** %9, align 8
  %183 = load i32, i32* %12, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds i8*, i8** %182, i64 %184
  %186 = load i8*, i8** %185, align 8
  %187 = call i32 @keymatch(i8* %186, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.64, i32 0, i32 0), i32 2)
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %189, label %193

; <label>:189:                                    ; preds = %181
  %pgocount18 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 20)
  %190 = add i64 %pgocount18, 1
  store i64 %190, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 20)
  %191 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %192 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %191, i32 0, i32 20
  store i32 1, i32* %192, align 8
  br label %195

; <label>:193:                                    ; preds = %181
  %pgocount19 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 21)
  %194 = add i64 %pgocount19, 1
  store i64 %194, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 21)
  call void @usage()
  br label %195

; <label>:195:                                    ; preds = %193, %189
  br label %196

; <label>:196:                                    ; preds = %195, %177
  br label %197

; <label>:197:                                    ; preds = %196, %165
  br label %454

; <label>:198:                                    ; preds = %146
  %199 = load i8*, i8** %13, align 8
  %200 = call i32 @keymatch(i8* %199, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.65, i32 0, i32 0), i32 1)
  %201 = icmp ne i32 %200, 0
  br i1 %201, label %207, label %202

; <label>:202:                                    ; preds = %198
  %pgocount20 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 17)
  %203 = add i64 %pgocount20, 1
  store i64 %203, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 17)
  %204 = load i8*, i8** %13, align 8
  %205 = call i32 @keymatch(i8* %204, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.66, i32 0, i32 0), i32 1)
  %206 = icmp ne i32 %205, 0
  br i1 %206, label %207, label %222

; <label>:207:                                    ; preds = %202, %198
  %208 = load i32, i32* @parse_switches.printed_version, align 4
  %209 = icmp ne i32 %208, 0
  br i1 %209, label %214, label %210

; <label>:210:                                    ; preds = %207
  %pgocount21 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 18)
  %211 = add i64 %pgocount21, 1
  store i64 %211, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 18)
  %212 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %213 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %212, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.67, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.68, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.69, i32 0, i32 0))
  store i32 1, i32* @parse_switches.printed_version, align 4
  br label %214

; <label>:214:                                    ; preds = %210, %207
  %pgocount22 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 13)
  %215 = add i64 %pgocount22, 1
  store i64 %215, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 13)
  %216 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %217 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %216, i32 0, i32 0
  %218 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %217, align 8
  %219 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %218, i32 0, i32 7
  %220 = load i32, i32* %219, align 4
  %221 = add nsw i32 %220, 1
  store i32 %221, i32* %219, align 4
  br label %453

; <label>:222:                                    ; preds = %202
  %223 = load i8*, i8** %13, align 8
  %224 = call i32 @keymatch(i8* %223, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.59, i32 0, i32 0), i32 1)
  %225 = icmp ne i32 %224, 0
  br i1 %225, label %226, label %245

; <label>:226:                                    ; preds = %222
  %227 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %228 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %227, i32 0, i32 21
  store i32 0, i32* %228, align 4
  %229 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %230 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %229, i32 0, i32 20
  store i32 1, i32* %230, align 8
  %231 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %232 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %231, i32 0, i32 19
  %233 = load i32, i32* %232, align 4
  %234 = icmp ne i32 %233, 0
  br i1 %234, label %239, label %235

; <label>:235:                                    ; preds = %226
  %pgocount23 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 23)
  %236 = add i64 %pgocount23, 1
  store i64 %236, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 23)
  %237 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %238 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %237, i32 0, i32 22
  store i32 216, i32* %238, align 8
  br label %239

; <label>:239:                                    ; preds = %235, %226
  %pgocount24 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 22)
  %240 = add i64 %pgocount24, 1
  store i64 %240, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 22)
  %241 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %242 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %241, i32 0, i32 16
  store i32 1, i32* %242, align 8
  %243 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %244 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %243, i32 0, i32 17
  store i32 0, i32* %244, align 4
  br label %452

; <label>:245:                                    ; preds = %222
  %246 = load i8*, i8** %13, align 8
  %247 = call i32 @keymatch(i8* %246, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.70, i32 0, i32 0), i32 1)
  %248 = icmp ne i32 %247, 0
  br i1 %248, label %249, label %251

; <label>:249:                                    ; preds = %245
  %pgocount25 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 24)
  %250 = add i64 %pgocount25, 1
  store i64 %250, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 24)
  store i32 1, i32* @requested_fmt, align 4
  br label %451

; <label>:251:                                    ; preds = %245
  %252 = load i8*, i8** %13, align 8
  %253 = call i32 @keymatch(i8* %252, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.71, i32 0, i32 0), i32 2)
  %254 = icmp ne i32 %253, 0
  br i1 %254, label %260, label %255

; <label>:255:                                    ; preds = %251
  %pgocount26 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 26)
  %256 = add i64 %pgocount26, 1
  store i64 %256, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 26)
  %257 = load i8*, i8** %13, align 8
  %258 = call i32 @keymatch(i8* %257, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.72, i32 0, i32 0), i32 2)
  %259 = icmp ne i32 %258, 0
  br i1 %259, label %260, label %264

; <label>:260:                                    ; preds = %255, %251
  %pgocount27 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 25)
  %261 = add i64 %pgocount27, 1
  store i64 %261, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 25)
  %262 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %263 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %262, i32 0, i32 10
  store i32 1, i32* %263, align 8
  br label %450

; <label>:264:                                    ; preds = %255
  %265 = load i8*, i8** %13, align 8
  %266 = call i32 @keymatch(i8* %265, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.73, i32 0, i32 0), i32 3)
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %268, label %306

; <label>:268:                                    ; preds = %264
  %269 = load i32, i32* %12, align 4
  %270 = add nsw i32 %269, 1
  store i32 %270, i32* %12, align 4
  %271 = load i32, i32* %8, align 4
  %272 = icmp sge i32 %270, %271
  br i1 %272, label %273, label %275

; <label>:273:                                    ; preds = %268
  %pgocount28 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 29)
  %274 = add i64 %pgocount28, 1
  store i64 %274, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 29)
  call void @usage()
  br label %275

; <label>:275:                                    ; preds = %273, %268
  %276 = load i32, i32* %11, align 4
  %277 = icmp ne i32 %276, 0
  br i1 %277, label %278, label %304

; <label>:278:                                    ; preds = %275
  %279 = load i8**, i8*** %9, align 8
  %280 = load i32, i32* %12, align 4
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds i8*, i8** %279, i64 %281
  %283 = load i8*, i8** %282, align 8
  %284 = call %struct._IO_FILE* @fopen(i8* %283, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %284, %struct._IO_FILE** %15, align 8
  %285 = icmp eq %struct._IO_FILE* %284, null
  br i1 %285, label %286, label %296

; <label>:286:                                    ; preds = %278
  %pgocount29 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 49)
  %287 = add i64 %pgocount29, 1
  store i64 %287, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 49)
  %288 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %289 = load i8*, i8** @progname, align 8
  %290 = load i8**, i8*** %9, align 8
  %291 = load i32, i32* %12, align 4
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds i8*, i8** %290, i64 %292
  %294 = load i8*, i8** %293, align 8
  %295 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %288, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* %289, i8* %294)
  call void @exit(i32 1) #6
  unreachable

; <label>:296:                                    ; preds = %278
  %pgocount30 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 28)
  %297 = add i64 %pgocount30, 1
  store i64 %297, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 28)
  %298 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %299 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  call void @read_color_map(%struct.jpeg_decompress_struct* %298, %struct._IO_FILE* %299)
  %300 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %301 = call i32 @fclose(%struct._IO_FILE* %300)
  %302 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %303 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %302, i32 0, i32 19
  store i32 1, i32* %303, align 4
  br label %304

; <label>:304:                                    ; preds = %296, %275
  %pgocount31 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 27)
  %305 = add i64 %pgocount31, 1
  store i64 %305, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 27)
  br label %449

; <label>:306:                                    ; preds = %264
  %307 = load i8*, i8** %13, align 8
  %308 = call i32 @keymatch(i8* %307, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0), i32 3)
  %309 = icmp ne i32 %308, 0
  br i1 %309, label %310, label %348

; <label>:310:                                    ; preds = %306
  %pgocount32 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 30)
  %311 = add i64 %pgocount32, 1
  store i64 %311, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 30)
  store i8 120, i8* %17, align 1
  %312 = load i32, i32* %12, align 4
  %313 = add nsw i32 %312, 1
  store i32 %313, i32* %12, align 4
  %314 = load i32, i32* %8, align 4
  %315 = icmp sge i32 %313, %314
  br i1 %315, label %316, label %318

; <label>:316:                                    ; preds = %310
  %pgocount33 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 32)
  %317 = add i64 %pgocount33, 1
  store i64 %317, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 32)
  call void @usage()
  br label %318

; <label>:318:                                    ; preds = %316, %310
  %319 = load i8**, i8*** %9, align 8
  %320 = load i32, i32* %12, align 4
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds i8*, i8** %319, i64 %321
  %323 = load i8*, i8** %322, align 8
  %324 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %323, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.75, i32 0, i32 0), i64* %16, i8* %17) #5
  %325 = icmp slt i32 %324, 1
  br i1 %325, label %326, label %328

; <label>:326:                                    ; preds = %318
  %pgocount34 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 34)
  %327 = add i64 %pgocount34, 1
  store i64 %327, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 34)
  call void @usage()
  br label %328

; <label>:328:                                    ; preds = %326, %318
  %329 = load i8, i8* %17, align 1
  %330 = sext i8 %329 to i32
  %331 = icmp eq i32 %330, 109
  br i1 %331, label %337, label %332

; <label>:332:                                    ; preds = %328
  %pgocount35 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 33)
  %333 = add i64 %pgocount35, 1
  store i64 %333, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 33)
  %334 = load i8, i8* %17, align 1
  %335 = sext i8 %334 to i32
  %336 = icmp eq i32 %335, 77
  br i1 %336, label %337, label %341

; <label>:337:                                    ; preds = %332, %328
  %pgocount36 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 31)
  %338 = add i64 %pgocount36, 1
  store i64 %338, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 31)
  %339 = load i64, i64* %16, align 8
  %340 = mul nsw i64 %339, 1000
  store i64 %340, i64* %16, align 8
  br label %341

; <label>:341:                                    ; preds = %337, %332
  %342 = load i64, i64* %16, align 8
  %343 = mul nsw i64 %342, 1000
  %344 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %345 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %344, i32 0, i32 1
  %346 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %345, align 8
  %347 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %346, i32 0, i32 11
  store i64 %343, i64* %347, align 8
  br label %448

; <label>:348:                                    ; preds = %306
  %349 = load i8*, i8** %13, align 8
  %350 = call i32 @keymatch(i8* %349, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.76, i32 0, i32 0), i32 3)
  %351 = icmp ne i32 %350, 0
  br i1 %351, label %352, label %356

; <label>:352:                                    ; preds = %348
  %pgocount37 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 35)
  %353 = add i64 %pgocount37, 1
  store i64 %353, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 35)
  %354 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %355 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %354, i32 0, i32 17
  store i32 0, i32* %355, align 4
  br label %447

; <label>:356:                                    ; preds = %348
  %357 = load i8*, i8** %13, align 8
  %358 = call i32 @keymatch(i8* %357, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.77, i32 0, i32 0), i32 3)
  %359 = icmp ne i32 %358, 0
  br i1 %359, label %360, label %364

; <label>:360:                                    ; preds = %356
  %pgocount38 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 36)
  %361 = add i64 %pgocount38, 1
  store i64 %361, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 36)
  %362 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %363 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %362, i32 0, i32 21
  store i32 0, i32* %363, align 4
  br label %446

; <label>:364:                                    ; preds = %356
  %365 = load i8*, i8** %13, align 8
  %366 = call i32 @keymatch(i8* %365, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.78, i32 0, i32 0), i32 3)
  %367 = icmp ne i32 %366, 0
  br i1 %367, label %368, label %370

; <label>:368:                                    ; preds = %364
  %pgocount39 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 37)
  %369 = add i64 %pgocount39, 1
  store i64 %369, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 37)
  store i32 2, i32* @requested_fmt, align 4
  br label %445

; <label>:370:                                    ; preds = %364
  %371 = load i8*, i8** %13, align 8
  %372 = call i32 @keymatch(i8* %371, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.79, i32 0, i32 0), i32 4)
  %373 = icmp ne i32 %372, 0
  br i1 %373, label %374, label %388

; <label>:374:                                    ; preds = %370
  %375 = load i32, i32* %12, align 4
  %376 = add nsw i32 %375, 1
  store i32 %376, i32* %12, align 4
  %377 = load i32, i32* %8, align 4
  %378 = icmp sge i32 %376, %377
  br i1 %378, label %379, label %381

; <label>:379:                                    ; preds = %374
  %pgocount40 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 40)
  %380 = add i64 %pgocount40, 1
  store i64 %380, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 40)
  call void @usage()
  br label %381

; <label>:381:                                    ; preds = %379, %374
  %pgocount41 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 38)
  %382 = add i64 %pgocount41, 1
  store i64 %382, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 38)
  %383 = load i8**, i8*** %9, align 8
  %384 = load i32, i32* %12, align 4
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds i8*, i8** %383, i64 %385
  %387 = load i8*, i8** %386, align 8
  store i8* %387, i8** @outfilename, align 8
  br label %444

; <label>:388:                                    ; preds = %370
  %389 = load i8*, i8** %13, align 8
  %390 = call i32 @keymatch(i8* %389, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.80, i32 0, i32 0), i32 1)
  %391 = icmp ne i32 %390, 0
  br i1 %391, label %397, label %392

; <label>:392:                                    ; preds = %388
  %pgocount42 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 41)
  %393 = add i64 %pgocount42, 1
  store i64 %393, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 41)
  %394 = load i8*, i8** %13, align 8
  %395 = call i32 @keymatch(i8* %394, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.81, i32 0, i32 0), i32 1)
  %396 = icmp ne i32 %395, 0
  br i1 %396, label %397, label %399

; <label>:397:                                    ; preds = %392, %388
  %pgocount43 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 39)
  %398 = add i64 %pgocount43, 1
  store i64 %398, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 39)
  store i32 3, i32* @requested_fmt, align 4
  br label %443

; <label>:399:                                    ; preds = %392
  %400 = load i8*, i8** %13, align 8
  %401 = call i32 @keymatch(i8* %400, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.82, i32 0, i32 0), i32 1)
  %402 = icmp ne i32 %401, 0
  br i1 %402, label %403, label %405

; <label>:403:                                    ; preds = %399
  %pgocount44 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 42)
  %404 = add i64 %pgocount44, 1
  store i64 %404, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 42)
  store i32 4, i32* @requested_fmt, align 4
  br label %442

; <label>:405:                                    ; preds = %399
  %406 = load i8*, i8** %13, align 8
  %407 = call i32 @keymatch(i8* %406, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.83, i32 0, i32 0), i32 1)
  %408 = icmp ne i32 %407, 0
  br i1 %408, label %409, label %432

; <label>:409:                                    ; preds = %405
  %410 = load i32, i32* %12, align 4
  %411 = add nsw i32 %410, 1
  store i32 %411, i32* %12, align 4
  %412 = load i32, i32* %8, align 4
  %413 = icmp sge i32 %411, %412
  br i1 %413, label %414, label %416

; <label>:414:                                    ; preds = %409
  %pgocount45 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 44)
  %415 = add i64 %pgocount45, 1
  store i64 %415, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 44)
  call void @usage()
  br label %416

; <label>:416:                                    ; preds = %414, %409
  %417 = load i8**, i8*** %9, align 8
  %418 = load i32, i32* %12, align 4
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds i8*, i8** %417, i64 %419
  %421 = load i8*, i8** %420, align 8
  %422 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %423 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %422, i32 0, i32 11
  %424 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %425 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %424, i32 0, i32 12
  %426 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %421, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.84, i32 0, i32 0), i32* %423, i32* %425) #5
  %427 = icmp ne i32 %426, 2
  br i1 %427, label %428, label %430

; <label>:428:                                    ; preds = %416
  %pgocount46 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 45)
  %429 = add i64 %pgocount46, 1
  store i64 %429, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 45)
  call void @usage()
  br label %430

; <label>:430:                                    ; preds = %428, %416
  %pgocount47 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 43)
  %431 = add i64 %pgocount47, 1
  store i64 %431, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 43)
  br label %441

; <label>:432:                                    ; preds = %405
  %433 = load i8*, i8** %13, align 8
  %434 = call i32 @keymatch(i8* %433, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.85, i32 0, i32 0), i32 1)
  %435 = icmp ne i32 %434, 0
  br i1 %435, label %436, label %438

; <label>:436:                                    ; preds = %432
  %pgocount48 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 46)
  %437 = add i64 %pgocount48, 1
  store i64 %437, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 46)
  store i32 5, i32* @requested_fmt, align 4
  br label %440

; <label>:438:                                    ; preds = %432
  %pgocount49 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 47)
  %439 = add i64 %pgocount49, 1
  store i64 %439, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 47)
  call void @usage()
  br label %440

; <label>:440:                                    ; preds = %438, %436
  br label %441

; <label>:441:                                    ; preds = %440, %430
  br label %442

; <label>:442:                                    ; preds = %441, %403
  br label %443

; <label>:443:                                    ; preds = %442, %397
  br label %444

; <label>:444:                                    ; preds = %443, %381
  br label %445

; <label>:445:                                    ; preds = %444, %368
  br label %446

; <label>:446:                                    ; preds = %445, %360
  br label %447

; <label>:447:                                    ; preds = %446, %352
  br label %448

; <label>:448:                                    ; preds = %447, %341
  br label %449

; <label>:449:                                    ; preds = %448, %304
  br label %450

; <label>:450:                                    ; preds = %449, %260
  br label %451

; <label>:451:                                    ; preds = %450, %249
  br label %452

; <label>:452:                                    ; preds = %451, %239
  br label %453

; <label>:453:                                    ; preds = %452, %214
  br label %454

; <label>:454:                                    ; preds = %453, %197
  br label %455

; <label>:455:                                    ; preds = %454, %145
  br label %456

; <label>:456:                                    ; preds = %455, %87
  br label %457

; <label>:457:                                    ; preds = %456, %49
  br label %458

; <label>:458:                                    ; preds = %457, %40
  %pgocount50 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 5)
  %459 = add i64 %pgocount50, 1
  store i64 %459, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_parse_switches, i64 0, i64 5)
  %460 = load i32, i32* %12, align 4
  %461 = add nsw i32 %460, 1
  store i32 %461, i32* %12, align 4
  br label %22

; <label>:462:                                    ; preds = %41, %22
  %463 = load i32, i32* %12, align 4
  ret i32 %463
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal void @usage() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = load i8*, i8** @progname, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.86, i32 0, i32 0), i8* %3)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.87, i32 0, i32 0))
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.88, i32 0, i32 0))
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.89, i32 0, i32 0))
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.90, i32 0, i32 0))
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.91, i32 0, i32 0))
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.92, i32 0, i32 0))
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.93, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i32 0, i32 0))
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.95, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i32 0, i32 0))
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.96, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i32 0, i32 0))
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.97, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.98, i32 0, i32 0))
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.99, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i32 0, i32 0))
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.100, i32 0, i32 0))
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.101, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.98, i32 0, i32 0))
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.102, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i32 0, i32 0))
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i32 0, i32 0))
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.104, i32 0, i32 0))
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.105, i32 0, i32 0))
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.106, i32 0, i32 0))
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.107, i32 0, i32 0))
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.108, i32 0, i32 0))
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.109, i32 0, i32 0))
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.110, i32 0, i32 0))
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.111, i32 0, i32 0))
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.112, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable
                                                  ; No predecessors!
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare %struct._IO_FILE* @read_stdin() #1

declare %struct._IO_FILE* @write_stdout() #1

declare void @jpeg_stdio_src(%struct.jpeg_decompress_struct*, %struct._IO_FILE*) #1

declare i32 @jpeg_read_header(%struct.jpeg_decompress_struct*, i32) #1

declare %struct.djpeg_dest_struct* @jinit_write_bmp(%struct.jpeg_decompress_struct*, i32) #1

declare %struct.djpeg_dest_struct* @jinit_write_gif(%struct.jpeg_decompress_struct*) #1

declare %struct.djpeg_dest_struct* @jinit_write_ppm(%struct.jpeg_decompress_struct*) #1

declare %struct.djpeg_dest_struct* @jinit_write_targa(%struct.jpeg_decompress_struct*) #1

declare i32 @jpeg_start_decompress(%struct.jpeg_decompress_struct*) #1

declare i32 @jpeg_read_scanlines(%struct.jpeg_decompress_struct*, i8**, i32) #1

declare i32 @jpeg_finish_decompress(%struct.jpeg_decompress_struct*) #1

declare void @jpeg_destroy_decompress(%struct.jpeg_decompress_struct*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define internal i32 @jpeg_getc(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.jpeg_source_mgr*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 5
  %6 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  store %struct.jpeg_source_mgr* %6, %struct.jpeg_source_mgr** %3, align 8
  %7 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %3, align 8
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %7, i32 0, i32 1
  %9 = load i64, i64* %8, align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %35

; <label>:11:                                     ; preds = %1
  %12 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %12, i32 0, i32 3
  %14 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %13, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %16 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %14 to i64
  call void @__llvm_profile_instrument_target(i64 %16, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_jpeg_getc to i8*), i32 0)
  %17 = call i32 %14(%struct.jpeg_decompress_struct* %15)
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %33, label %19

; <label>:19:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jpeg_getc, i64 0, i64 2)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jpeg_getc, i64 0, i64 2)
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 0
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i32 0, i32 5
  store i32 22, i32* %24, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i32 0, i32 0
  %29 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %28, align 8
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %31 = bitcast %struct.jpeg_decompress_struct* %30 to %struct.jpeg_common_struct*
  %32 = ptrtoint void (%struct.jpeg_common_struct*)* %29 to i64
  call void @__llvm_profile_instrument_target(i64 %32, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_jpeg_getc to i8*), i32 1)
  call void %29(%struct.jpeg_common_struct* %31)
  br label %33

; <label>:33:                                     ; preds = %19, %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jpeg_getc, i64 0, i64 1)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jpeg_getc, i64 0, i64 1)
  br label %35

; <label>:35:                                     ; preds = %33, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jpeg_getc, i64 0, i64 0)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jpeg_getc, i64 0, i64 0)
  %37 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %37, i32 0, i32 1
  %39 = load i64, i64* %38, align 8
  %40 = add i64 %39, -1
  store i64 %40, i64* %38, align 8
  %41 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %3, align 8
  %42 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %41, i32 0, i32 0
  %43 = load i8*, i8** %42, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %42, align 8
  %45 = load i8, i8* %43, align 1
  %46 = zext i8 %45 to i32
  ret i32 %46
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #3

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

declare i32 @keymatch(i8*, i8*, i32) #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #4

declare void @read_color_map(%struct.jpeg_decompress_struct*, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #5

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
