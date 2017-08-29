; ModuleID = 'djpeg.ll'
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

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8** nocapture readonly) #0 {
  %3 = alloca %struct.jpeg_decompress_struct, align 8
  %4 = alloca %struct.jpeg_error_mgr, align 8
  %5 = load i8*, i8** %1, align 8
  store i8* %5, i8** @progname, align 8
  %6 = icmp eq i8* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %2
  %8 = load i8, i8* %5, align 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %7, %2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** @progname, align 8
  br label %11

; <label>:11:                                     ; preds = %10, %7
  %12 = call %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr* nonnull %4) #6
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %3, i64 0, i32 0
  store %struct.jpeg_error_mgr* %12, %struct.jpeg_error_mgr** %13, align 8
  call void @jpeg_CreateDecompress(%struct.jpeg_decompress_struct* nonnull %3, i32 61, i64 616) #6
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %4, i64 0, i32 11
  store i8** getelementptr inbounds ([44 x i8*], [44 x i8*]* @cdjpeg_message_table, i64 0, i64 0), i8*** %14, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %4, i64 0, i32 12
  store i32 1000, i32* %15, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %4, i64 0, i32 13
  store i32 1043, i32* %16, align 4
  call void @jpeg_set_marker_processor(%struct.jpeg_decompress_struct* nonnull %3, i32 254, i32 (%struct.jpeg_decompress_struct*)* nonnull @COM_handler) #6
  %17 = call i32 @parse_switches(%struct.jpeg_decompress_struct* nonnull %3, i32 %0, i8** nonnull %1, i32 0)
  %18 = add nsw i32 %0, -1
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %11
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = load i8*, i8** @progname, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i8* %22) #7
  call void @usage()
  unreachable

; <label>:24:                                     ; preds = %11
  %25 = icmp slt i32 %17, %0
  br i1 %25, label %26, label %37

; <label>:26:                                     ; preds = %24
  %27 = sext i32 %17 to i64
  %28 = getelementptr inbounds i8*, i8** %1, i64 %27
  %29 = load i8*, i8** %28, align 8
  %30 = call %struct._IO_FILE* @fopen(i8* %29, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0))
  %31 = icmp eq %struct._IO_FILE* %30, null
  br i1 %31, label %32, label %39

; <label>:32:                                     ; preds = %26
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = load i8*, i8** @progname, align 8
  %35 = load i8*, i8** %28, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i8* %34, i8* %35) #7
  call void @exit(i32 1) #8
  unreachable

; <label>:37:                                     ; preds = %24
  %38 = call %struct._IO_FILE* @read_stdin() #6
  br label %39

; <label>:39:                                     ; preds = %26, %37
  %.01 = phi %struct._IO_FILE* [ %38, %37 ], [ %30, %26 ]
  %40 = load i8*, i8** @outfilename, align 8
  %41 = icmp eq i8* %40, null
  br i1 %41, label %50, label %42

; <label>:42:                                     ; preds = %39
  %43 = call %struct._IO_FILE* @fopen(i8* nonnull %40, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0))
  %44 = icmp eq %struct._IO_FILE* %43, null
  br i1 %44, label %45, label %52

; <label>:45:                                     ; preds = %42
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = load i8*, i8** @progname, align 8
  %48 = load i8*, i8** @outfilename, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i8* %47, i8* %48) #7
  call void @exit(i32 1) #8
  unreachable

; <label>:50:                                     ; preds = %39
  %51 = call %struct._IO_FILE* @write_stdout() #6
  br label %52

; <label>:52:                                     ; preds = %42, %50
  %.0 = phi %struct._IO_FILE* [ %51, %50 ], [ %43, %42 ]
  call void @jpeg_stdio_src(%struct.jpeg_decompress_struct* nonnull %3, %struct._IO_FILE* %.01) #6
  %53 = call i32 @jpeg_read_header(%struct.jpeg_decompress_struct* nonnull %3, i32 1) #6
  %54 = call i32 @parse_switches(%struct.jpeg_decompress_struct* nonnull %3, i32 %0, i8** nonnull %1, i32 1)
  %55 = load i32, i32* @requested_fmt, align 4
  switch i32 %55, label %66 [
    i32 0, label %56
    i32 2, label %58
    i32 1, label %60
    i32 3, label %62
    i32 5, label %64
  ]

; <label>:56:                                     ; preds = %52
  %57 = call %struct.djpeg_dest_struct* @jinit_write_bmp(%struct.jpeg_decompress_struct* nonnull %3, i32 0) #6
  br label %72

; <label>:58:                                     ; preds = %52
  %59 = call %struct.djpeg_dest_struct* @jinit_write_bmp(%struct.jpeg_decompress_struct* nonnull %3, i32 1) #6
  br label %72

; <label>:60:                                     ; preds = %52
  %61 = call %struct.djpeg_dest_struct* @jinit_write_gif(%struct.jpeg_decompress_struct* nonnull %3) #6
  br label %72

; <label>:62:                                     ; preds = %52
  %63 = call %struct.djpeg_dest_struct* @jinit_write_ppm(%struct.jpeg_decompress_struct* nonnull %3) #6
  br label %72

; <label>:64:                                     ; preds = %52
  %65 = call %struct.djpeg_dest_struct* @jinit_write_targa(%struct.jpeg_decompress_struct* nonnull %3) #6
  br label %72

; <label>:66:                                     ; preds = %52
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i64 0, i32 5
  store i32 1042, i32* %68, align 8
  %69 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i64 0, i32 0
  %70 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %69, align 8
  %71 = bitcast %struct.jpeg_decompress_struct* %3 to %struct.jpeg_common_struct*
  call void %70(%struct.jpeg_common_struct* nonnull %71) #6
  br label %72

; <label>:72:                                     ; preds = %66, %64, %62, %60, %58, %56
  %.02 = phi %struct.djpeg_dest_struct* [ null, %66 ], [ %65, %64 ], [ %63, %62 ], [ %61, %60 ], [ %59, %58 ], [ %57, %56 ]
  %73 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %.02, i64 0, i32 3
  store %struct._IO_FILE* %.0, %struct._IO_FILE** %73, align 8
  %74 = call i32 @jpeg_start_decompress(%struct.jpeg_decompress_struct* nonnull %3) #6
  %75 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %.02, i64 0, i32 0
  %76 = load void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %75, align 8
  call void %76(%struct.jpeg_decompress_struct* nonnull %3, %struct.djpeg_dest_struct* %.02) #6
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %3, i64 0, i32 33
  %78 = load i32, i32* %77, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %3, i64 0, i32 27
  %80 = load i32, i32* %79, align 4
  %81 = icmp ult i32 %78, %80
  br i1 %81, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %72
  %82 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %.02, i64 0, i32 4
  %83 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %.02, i64 0, i32 5
  %84 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %.02, i64 0, i32 1
  br label %85

; <label>:85:                                     ; preds = %.lr.ph, %85
  %86 = load i8**, i8*** %82, align 8
  %87 = load i32, i32* %83, align 8
  %88 = call i32 @jpeg_read_scanlines(%struct.jpeg_decompress_struct* nonnull %3, i8** %86, i32 %87) #6
  %89 = load void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %84, align 8
  call void %89(%struct.jpeg_decompress_struct* nonnull %3, %struct.djpeg_dest_struct* %.02, i32 %88) #6
  %90 = load i32, i32* %77, align 8
  %91 = load i32, i32* %79, align 4
  %92 = icmp ult i32 %90, %91
  br i1 %92, label %85, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %85
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %72
  %93 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %.02, i64 0, i32 2
  %94 = load void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %93, align 8
  call void %94(%struct.jpeg_decompress_struct* nonnull %3, %struct.djpeg_dest_struct* %.02) #6
  %95 = call i32 @jpeg_finish_decompress(%struct.jpeg_decompress_struct* nonnull %3) #6
  call void @jpeg_destroy_decompress(%struct.jpeg_decompress_struct* nonnull %3) #6
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %97 = icmp eq %struct._IO_FILE* %.01, %96
  br i1 %97, label %100, label %98

; <label>:98:                                     ; preds = %._crit_edge
  %99 = call i32 @fclose(%struct._IO_FILE* %.01)
  br label %100

; <label>:100:                                    ; preds = %._crit_edge, %98
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %102 = icmp eq %struct._IO_FILE* %.0, %101
  br i1 %102, label %105, label %103

; <label>:103:                                    ; preds = %100
  %104 = call i32 @fclose(%struct._IO_FILE* %.0)
  br label %105

; <label>:105:                                    ; preds = %100, %103
  ret i32 0
}

declare %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr*) #1

declare void @jpeg_CreateDecompress(%struct.jpeg_decompress_struct*, i32, i64) #1

declare void @jpeg_set_marker_processor(%struct.jpeg_decompress_struct*, i32, i32 (%struct.jpeg_decompress_struct*)*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @COM_handler(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %3 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %3, i64 0, i32 7
  %5 = load i32, i32* %4, align 4
  %6 = icmp sgt i32 %5, 0
  %7 = tail call i32 @jpeg_getc(%struct.jpeg_decompress_struct* %0)
  %8 = shl i32 %7, 8
  %9 = zext i32 %8 to i64
  %10 = tail call i32 @jpeg_getc(%struct.jpeg_decompress_struct* %0)
  %11 = zext i32 %10 to i64
  %12 = add nsw i64 %11, -2
  %13 = add nsw i64 %12, %9
  br i1 %6, label %.preheader, label %.outer.split.preheader

.outer.split.preheader:                           ; preds = %1
  %14 = icmp sgt i64 %13, 0
  br i1 %14, label %.outer.split.preheader21, label %.us-lcssa.us

.outer.split.preheader21:                         ; preds = %.outer.split.preheader
  br label %.outer.split

.preheader:                                       ; preds = %1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.47, i64 0, i64 0), i64 %13) #7
  %17 = icmp sgt i64 %13, 0
  br i1 %17, label %.us-lcssa10.us.us.preheader, label %.us-lcssa.us

.us-lcssa10.us.us.preheader:                      ; preds = %.preheader
  br label %.us-lcssa10.us.us

; <label>:18:                                     ; preds = %.us-lcssa10.us.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.49, i64 0, i64 0), i64 2, i64 1, %struct._IO_FILE* %19) #7
  br label %.outer.us.backedge

; <label>:21:                                     ; preds = %.us-lcssa10.us.us
  %22 = icmp eq i32 %.0.ph.us19, 13
  br i1 %22, label %.outer.us.backedge, label %23

; <label>:23:                                     ; preds = %21
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #7
  br label %.outer.us.backedge

; <label>:25:                                     ; preds = %.us-lcssa10.us.us
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc7.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #7
  br label %.outer.us.backedge

; <label>:27:                                     ; preds = %.us-lcssa10.us.us
  %28 = tail call i16** @__ctype_b_loc() #9
  %29 = load i16*, i16** %28, align 8
  %30 = sext i32 %42 to i64
  %31 = getelementptr inbounds i16, i16* %29, i64 %30
  %32 = load i16, i16* %31, align 2
  %33 = and i16 %32, 16384
  %34 = icmp eq i16 %33, 0
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %34, label %38, label %36

; <label>:36:                                     ; preds = %27
  %37 = tail call i32 @_IO_putc(i32 %42, %struct._IO_FILE* %35)
  br label %.outer.us.backedge

; <label>:38:                                     ; preds = %27
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.50, i64 0, i64 0), i32 %42) #7
  br label %.outer.us.backedge

.outer.us.backedge:                               ; preds = %38, %36, %25, %23, %21, %18
  %.0.ph.us.be = phi i32 [ %42, %38 ], [ %42, %36 ], [ 13, %25 ], [ 10, %23 ], [ 10, %21 ], [ 92, %18 ]
  %40 = icmp sgt i64 %.in, 1
  br i1 %40, label %.us-lcssa10.us.us, label %.us-lcssa.us.loopexit

.us-lcssa10.us.us:                                ; preds = %.us-lcssa10.us.us.preheader, %.outer.us.backedge
  %.in = phi i64 [ %41, %.outer.us.backedge ], [ %13, %.us-lcssa10.us.us.preheader ]
  %.0.ph.us19 = phi i32 [ %.0.ph.us.be, %.outer.us.backedge ], [ 0, %.us-lcssa10.us.us.preheader ]
  %41 = add nsw i64 %.in, -1
  %42 = tail call i32 @jpeg_getc(%struct.jpeg_decompress_struct* %0)
  switch i32 %42, label %27 [
    i32 13, label %25
    i32 10, label %21
    i32 92, label %18
  ]

.outer.split:                                     ; preds = %.outer.split.preheader21, %.outer.split
  %.0120 = phi i64 [ %43, %.outer.split ], [ %13, %.outer.split.preheader21 ]
  %43 = add nsw i64 %.0120, -1
  %44 = tail call i32 @jpeg_getc(%struct.jpeg_decompress_struct* %0)
  %45 = icmp sgt i64 %.0120, 1
  br i1 %45, label %.outer.split, label %.us-lcssa.us.loopexit22

.us-lcssa.us.loopexit:                            ; preds = %.outer.us.backedge
  br label %.us-lcssa.us

.us-lcssa.us.loopexit22:                          ; preds = %.outer.split
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit22, %.us-lcssa.us.loopexit, %.outer.split.preheader, %.preheader
  br i1 %6, label %46, label %48

; <label>:46:                                     ; preds = %.us-lcssa.us
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %47) #7
  br label %48

; <label>:48:                                     ; preds = %46, %.us-lcssa.us
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @parse_switches(%struct.jpeg_decompress_struct*, i32, i8** nocapture readonly, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i8, align 1
  store i32 3, i32* @requested_fmt, align 4
  store i8* null, i8** @outfilename, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 7
  store i32 0, i32* %10, align 4
  %11 = icmp sgt i32 %1, 1
  br i1 %11, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %4
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 11
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 12
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 21
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 17
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %17 = icmp eq i32 %3, 0
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 21
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 22
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 16
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 17
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 16
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 16
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 16
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 22
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  br label %34

; <label>:34:                                     ; preds = %.lr.ph, %259
  %.018 = phi i32 [ 1, %.lr.ph ], [ %260, %259 ]
  %35 = sext i32 %.018 to i64
  %36 = getelementptr inbounds i8*, i8** %2, i64 %35
  %37 = load i8*, i8** %36, align 8
  %38 = load i8, i8* %37, align 1
  %39 = icmp eq i8 %38, 45
  br i1 %39, label %43, label %40

; <label>:40:                                     ; preds = %34
  %41 = icmp slt i32 %.018, 1
  br i1 %41, label %42, label %.loopexit.loopexit

; <label>:42:                                     ; preds = %40
  store i8* null, i8** @outfilename, align 8
  br label %259

; <label>:43:                                     ; preds = %34
  %44 = getelementptr inbounds i8, i8* %37, i64 1
  %45 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.51, i64 0, i64 0), i32 1) #6
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %48, label %47

; <label>:47:                                     ; preds = %43
  store i32 0, i32* @requested_fmt, align 4
  br label %259

; <label>:48:                                     ; preds = %43
  %49 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.52, i64 0, i64 0), i32 1) #6
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %60

; <label>:51:                                     ; preds = %48
  %52 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.53, i64 0, i64 0), i32 1) #6
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %60

; <label>:54:                                     ; preds = %51
  %55 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.54, i64 0, i64 0), i32 1) #6
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %60

; <label>:57:                                     ; preds = %54
  %58 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.55, i64 0, i64 0), i32 1) #6
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %73, label %60

; <label>:60:                                     ; preds = %57, %54, %51, %48
  %61 = add nsw i32 %.018, 1
  %62 = icmp slt i32 %61, %1
  br i1 %62, label %64, label %63

; <label>:63:                                     ; preds = %60
  call void @usage()
  unreachable

; <label>:64:                                     ; preds = %60
  %65 = sext i32 %61 to i64
  %66 = getelementptr inbounds i8*, i8** %2, i64 %65
  %67 = load i8*, i8** %66, align 8
  %68 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %67, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i64 0, i64 0), i32* nonnull %5) #6
  %69 = icmp eq i32 %68, 1
  br i1 %69, label %71, label %70

; <label>:70:                                     ; preds = %64
  call void @usage()
  unreachable

; <label>:71:                                     ; preds = %64
  %72 = load i32, i32* %5, align 4
  store i32 %72, i32* %32, align 8
  store i32 1, i32* %33, align 4
  br label %259

; <label>:73:                                     ; preds = %57
  %74 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.57, i64 0, i64 0), i32 2) #6
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %98, label %76

; <label>:76:                                     ; preds = %73
  %77 = add nsw i32 %.018, 1
  %78 = icmp slt i32 %77, %1
  br i1 %78, label %80, label %79

; <label>:79:                                     ; preds = %76
  call void @usage()
  unreachable

; <label>:80:                                     ; preds = %76
  %81 = sext i32 %77 to i64
  %82 = getelementptr inbounds i8*, i8** %2, i64 %81
  %83 = load i8*, i8** %82, align 8
  %84 = call i32 @keymatch(i8* %83, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.58, i64 0, i64 0), i32 1) #6
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %87, label %86

; <label>:86:                                     ; preds = %80
  store i32 0, i32* %31, align 8
  br label %259

; <label>:87:                                     ; preds = %80
  %88 = load i8*, i8** %82, align 8
  %89 = call i32 @keymatch(i8* %88, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.59, i64 0, i64 0), i32 2) #6
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %92, label %91

; <label>:91:                                     ; preds = %87
  store i32 1, i32* %30, align 8
  br label %259

; <label>:92:                                     ; preds = %87
  %93 = load i8*, i8** %82, align 8
  %94 = call i32 @keymatch(i8* %93, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.60, i64 0, i64 0), i32 2) #6
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %97, label %96

; <label>:96:                                     ; preds = %92
  store i32 2, i32* %29, align 8
  br label %259

; <label>:97:                                     ; preds = %92
  call void @usage()
  unreachable

; <label>:98:                                     ; preds = %73
  %99 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i64 0, i64 0), i32 2) #6
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %123, label %101

; <label>:101:                                    ; preds = %98
  %102 = add nsw i32 %.018, 1
  %103 = icmp slt i32 %102, %1
  br i1 %103, label %105, label %104

; <label>:104:                                    ; preds = %101
  call void @usage()
  unreachable

; <label>:105:                                    ; preds = %101
  %106 = sext i32 %102 to i64
  %107 = getelementptr inbounds i8*, i8** %2, i64 %106
  %108 = load i8*, i8** %107, align 8
  %109 = call i32 @keymatch(i8* %108, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.62, i64 0, i64 0), i32 2) #6
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %112, label %111

; <label>:111:                                    ; preds = %105
  store i32 2, i32* %28, align 8
  br label %259

; <label>:112:                                    ; preds = %105
  %113 = load i8*, i8** %107, align 8
  %114 = call i32 @keymatch(i8* %113, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i64 0, i64 0), i32 2) #6
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %117, label %116

; <label>:116:                                    ; preds = %112
  store i32 0, i32* %27, align 8
  br label %259

; <label>:117:                                    ; preds = %112
  %118 = load i8*, i8** %107, align 8
  %119 = call i32 @keymatch(i8* %118, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.64, i64 0, i64 0), i32 2) #6
  %120 = icmp eq i32 %119, 0
  br i1 %120, label %122, label %121

; <label>:121:                                    ; preds = %117
  store i32 1, i32* %26, align 8
  br label %259

; <label>:122:                                    ; preds = %117
  call void @usage()
  unreachable

; <label>:123:                                    ; preds = %98
  %124 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.65, i64 0, i64 0), i32 1) #6
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %129

; <label>:126:                                    ; preds = %123
  %127 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.66, i64 0, i64 0), i32 1) #6
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %140, label %129

; <label>:129:                                    ; preds = %126, %123
  %130 = load i32, i32* @parse_switches.printed_version, align 4
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %132, label %135

; <label>:132:                                    ; preds = %129
  %133 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %134 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %133, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.67, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.68, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.69, i64 0, i64 0)) #7
  store i32 1, i32* @parse_switches.printed_version, align 4
  br label %135

; <label>:135:                                    ; preds = %129, %132
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 7
  %138 = load i32, i32* %137, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, i32* %137, align 4
  br label %259

; <label>:140:                                    ; preds = %126
  %141 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.59, i64 0, i64 0), i32 1) #6
  %142 = icmp eq i32 %141, 0
  br i1 %142, label %148, label %143

; <label>:143:                                    ; preds = %140
  store i32 0, i32* %20, align 4
  store i32 1, i32* %21, align 8
  %144 = load i32, i32* %22, align 4
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %146, label %147

; <label>:146:                                    ; preds = %143
  store i32 216, i32* %23, align 8
  br label %147

; <label>:147:                                    ; preds = %143, %146
  store i32 1, i32* %24, align 8
  store i32 0, i32* %25, align 4
  br label %259

; <label>:148:                                    ; preds = %140
  %149 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.70, i64 0, i64 0), i32 1) #6
  %150 = icmp eq i32 %149, 0
  br i1 %150, label %152, label %151

; <label>:151:                                    ; preds = %148
  store i32 1, i32* @requested_fmt, align 4
  br label %259

; <label>:152:                                    ; preds = %148
  %153 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.71, i64 0, i64 0), i32 2) #6
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %155, label %158

; <label>:155:                                    ; preds = %152
  %156 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.72, i64 0, i64 0), i32 2) #6
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %159, label %158

; <label>:158:                                    ; preds = %155, %152
  store i32 1, i32* %19, align 8
  br label %259

; <label>:159:                                    ; preds = %155
  %160 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.73, i64 0, i64 0), i32 3) #6
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %180, label %162

; <label>:162:                                    ; preds = %159
  %163 = add nsw i32 %.018, 1
  %164 = icmp slt i32 %163, %1
  br i1 %164, label %166, label %165

; <label>:165:                                    ; preds = %162
  call void @usage()
  unreachable

; <label>:166:                                    ; preds = %162
  br i1 %17, label %259, label %167

; <label>:167:                                    ; preds = %166
  %168 = sext i32 %163 to i64
  %169 = getelementptr inbounds i8*, i8** %2, i64 %168
  %170 = load i8*, i8** %169, align 8
  %171 = call %struct._IO_FILE* @fopen(i8* %170, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0))
  %172 = icmp eq %struct._IO_FILE* %171, null
  br i1 %172, label %173, label %178

; <label>:173:                                    ; preds = %167
  %174 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %175 = load i8*, i8** @progname, align 8
  %176 = load i8*, i8** %169, align 8
  %177 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %174, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i8* %175, i8* %176) #7
  call void @exit(i32 1) #8
  unreachable

; <label>:178:                                    ; preds = %167
  call void @read_color_map(%struct.jpeg_decompress_struct* %0, %struct._IO_FILE* nonnull %171) #6
  %179 = call i32 @fclose(%struct._IO_FILE* nonnull %171)
  store i32 1, i32* %18, align 4
  br label %259

; <label>:180:                                    ; preds = %159
  %181 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0), i32 3) #6
  %182 = icmp eq i32 %181, 0
  br i1 %182, label %205, label %183

; <label>:183:                                    ; preds = %180
  store i8 120, i8* %7, align 1
  %184 = add nsw i32 %.018, 1
  %185 = icmp slt i32 %184, %1
  br i1 %185, label %187, label %186

; <label>:186:                                    ; preds = %183
  call void @usage()
  unreachable

; <label>:187:                                    ; preds = %183
  %188 = sext i32 %184 to i64
  %189 = getelementptr inbounds i8*, i8** %2, i64 %188
  %190 = load i8*, i8** %189, align 8
  %191 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %190, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.75, i64 0, i64 0), i64* nonnull %6, i8* nonnull %7) #6
  %192 = icmp slt i32 %191, 1
  br i1 %192, label %193, label %194

; <label>:193:                                    ; preds = %187
  call void @usage()
  unreachable

; <label>:194:                                    ; preds = %187
  %195 = load i8, i8* %7, align 1
  %196 = sext i8 %195 to i32
  switch i32 %196, label %200 [
    i32 109, label %197
    i32 77, label %197
  ]

; <label>:197:                                    ; preds = %194, %194
  %198 = load i64, i64* %6, align 8
  %199 = mul nsw i64 %198, 1000
  store i64 %199, i64* %6, align 8
  br label %200

; <label>:200:                                    ; preds = %194, %197
  %201 = load i64, i64* %6, align 8
  %202 = mul nsw i64 %201, 1000
  %203 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %16, align 8
  %204 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %203, i64 0, i32 11
  store i64 %202, i64* %204, align 8
  br label %259

; <label>:205:                                    ; preds = %180
  %206 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.76, i64 0, i64 0), i32 3) #6
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %209, label %208

; <label>:208:                                    ; preds = %205
  store i32 0, i32* %15, align 4
  br label %259

; <label>:209:                                    ; preds = %205
  %210 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.77, i64 0, i64 0), i32 3) #6
  %211 = icmp eq i32 %210, 0
  br i1 %211, label %213, label %212

; <label>:212:                                    ; preds = %209
  store i32 0, i32* %14, align 4
  br label %259

; <label>:213:                                    ; preds = %209
  %214 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.78, i64 0, i64 0), i32 3) #6
  %215 = icmp eq i32 %214, 0
  br i1 %215, label %217, label %216

; <label>:216:                                    ; preds = %213
  store i32 2, i32* @requested_fmt, align 4
  br label %259

; <label>:217:                                    ; preds = %213
  %218 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.79, i64 0, i64 0), i32 4) #6
  %219 = icmp eq i32 %218, 0
  br i1 %219, label %229, label %220

; <label>:220:                                    ; preds = %217
  %221 = add nsw i32 %.018, 1
  %222 = icmp slt i32 %221, %1
  br i1 %222, label %224, label %223

; <label>:223:                                    ; preds = %220
  call void @usage()
  unreachable

; <label>:224:                                    ; preds = %220
  %225 = sext i32 %221 to i64
  %226 = getelementptr inbounds i8*, i8** %2, i64 %225
  %227 = bitcast i8** %226 to i64*
  %228 = load i64, i64* %227, align 8
  store i64 %228, i64* bitcast (i8** @outfilename to i64*), align 8
  br label %259

; <label>:229:                                    ; preds = %217
  %230 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.80, i64 0, i64 0), i32 1) #6
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %232, label %235

; <label>:232:                                    ; preds = %229
  %233 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.81, i64 0, i64 0), i32 1) #6
  %234 = icmp eq i32 %233, 0
  br i1 %234, label %236, label %235

; <label>:235:                                    ; preds = %232, %229
  store i32 3, i32* @requested_fmt, align 4
  br label %259

; <label>:236:                                    ; preds = %232
  %237 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.82, i64 0, i64 0), i32 1) #6
  %238 = icmp eq i32 %237, 0
  br i1 %238, label %240, label %239

; <label>:239:                                    ; preds = %236
  store i32 4, i32* @requested_fmt, align 4
  br label %259

; <label>:240:                                    ; preds = %236
  %241 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.83, i64 0, i64 0), i32 1) #6
  %242 = icmp eq i32 %241, 0
  br i1 %242, label %254, label %243

; <label>:243:                                    ; preds = %240
  %244 = add nsw i32 %.018, 1
  %245 = icmp slt i32 %244, %1
  br i1 %245, label %247, label %246

; <label>:246:                                    ; preds = %243
  call void @usage()
  unreachable

; <label>:247:                                    ; preds = %243
  %248 = sext i32 %244 to i64
  %249 = getelementptr inbounds i8*, i8** %2, i64 %248
  %250 = load i8*, i8** %249, align 8
  %251 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %250, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.84, i64 0, i64 0), i32* %12, i32* %13) #6
  %252 = icmp eq i32 %251, 2
  br i1 %252, label %259, label %253

; <label>:253:                                    ; preds = %247
  call void @usage()
  unreachable

; <label>:254:                                    ; preds = %240
  %255 = call i32 @keymatch(i8* %44, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.85, i64 0, i64 0), i32 1) #6
  %256 = icmp eq i32 %255, 0
  br i1 %256, label %258, label %257

; <label>:257:                                    ; preds = %254
  store i32 5, i32* @requested_fmt, align 4
  br label %259

; <label>:258:                                    ; preds = %254
  call void @usage()
  unreachable

; <label>:259:                                    ; preds = %166, %247, %47, %91, %96, %86, %135, %151, %178, %208, %216, %235, %257, %239, %224, %212, %200, %158, %147, %111, %121, %116, %71, %42
  %.18 = phi i32 [ %.018, %42 ], [ %.018, %47 ], [ %61, %71 ], [ %77, %91 ], [ %77, %96 ], [ %77, %86 ], [ %102, %116 ], [ %102, %121 ], [ %102, %111 ], [ %.018, %135 ], [ %.018, %147 ], [ %.018, %151 ], [ %.018, %158 ], [ %163, %178 ], [ %163, %166 ], [ %184, %200 ], [ %.018, %208 ], [ %.018, %212 ], [ %.018, %216 ], [ %221, %224 ], [ %.018, %235 ], [ %.018, %239 ], [ %244, %247 ], [ %.018, %257 ]
  %260 = add nsw i32 %.18, 1
  %261 = icmp slt i32 %260, %1
  br i1 %261, label %34, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %259, %40
  %.0.lcssa.ph = phi i32 [ %260, %259 ], [ %.018, %40 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4
  %.0.lcssa = phi i32 [ 1, %4 ], [ %.0.lcssa.ph, %.loopexit.loopexit ]
  ret i32 %.0.lcssa
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: noinline noreturn nounwind uwtable
define internal void @usage() #3 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = load i8*, i8** @progname, align 8
  %3 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.86, i64 0, i64 0), i8* %2) #7
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.87, i64 0, i64 0), i64 12, i64 1, %struct._IO_FILE* %4) #7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.88, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %6) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.89, i64 0, i64 0), i64 55, i64 1, %struct._IO_FILE* %8) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.90, i64 0, i64 0), i64 46, i64 1, %struct._IO_FILE* %10) #7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.91, i64 0, i64 0), i64 40, i64 1, %struct._IO_FILE* %12) #7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.92, i64 0, i64 0), i64 61, i64 1, %struct._IO_FILE* %14) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.93, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.95, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.96, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.97, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.98, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.99, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i64 0, i64 0)) #7
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.100, i64 0, i64 0), i64 29, i64 1, %struct._IO_FILE* %26) #7
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.101, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.98, i64 0, i64 0)) #7
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.102, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i64 0, i64 0)) #7
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.103, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.94, i64 0, i64 0)) #7
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.104, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %34) #7
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i64 @fwrite(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.105, i64 0, i64 0), i64 53, i64 1, %struct._IO_FILE* %36) #7
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.106, i64 0, i64 0), i64 62, i64 1, %struct._IO_FILE* %38) #7
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i64 @fwrite(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.107, i64 0, i64 0), i64 56, i64 1, %struct._IO_FILE* %40) #7
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i64 @fwrite(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.108, i64 0, i64 0), i64 51, i64 1, %struct._IO_FILE* %42) #7
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i64 @fwrite(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.109, i64 0, i64 0), i64 61, i64 1, %struct._IO_FILE* %44) #7
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i64 @fwrite(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.110, i64 0, i64 0), i64 51, i64 1, %struct._IO_FILE* %46) #7
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i64 @fwrite(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.111, i64 0, i64 0), i64 46, i64 1, %struct._IO_FILE* %48) #7
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.112, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %50) #7
  tail call void @exit(i32 1) #8
  unreachable
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

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

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @jpeg_getc(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %3 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 1
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %20

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %9 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %8, align 8
  %10 = tail call i32 %9(%struct.jpeg_decompress_struct* nonnull %0) #6
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %20

; <label>:12:                                     ; preds = %7
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i64 0, i32 5
  store i32 22, i32* %15, align 8
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 0
  %18 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %17, align 8
  %19 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %18(%struct.jpeg_common_struct* %19) #6
  br label %20

; <label>:20:                                     ; preds = %7, %12, %1
  %21 = load i64, i64* %4, align 8
  %22 = add i64 %21, -1
  store i64 %22, i64* %4, align 8
  %23 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 0
  %24 = load i8*, i8** %23, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 1
  store i8* %25, i8** %23, align 8
  %26 = load i8, i8* %24, align 1
  %27 = zext i8 %26 to i32
  ret i32 %27
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #5

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #2

declare i32 @keymatch(i8*, i8*, i32) #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) #2

declare void @read_color_map(%struct.jpeg_decompress_struct*, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
