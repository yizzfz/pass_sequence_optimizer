; ModuleID = 'cjpeg.ll'
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

@progname = internal unnamed_addr global i8* null, align 8
@.str = private unnamed_addr constant [6 x i8] c"cjpeg\00", align 1
@cdjpeg_message_table = internal constant [44 x i8*] [i8* null, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.39, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.44, i32 0, i32 0), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.45, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.46, i32 0, i32 0), i8* null], align 16
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [25 x i8] c"%s: only one input file\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"%s: can't open %s\0A\00", align 1
@outfilename = internal unnamed_addr global i8* null, align 8
@.str.4 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@stdin = external local_unnamed_addr global %struct._IO_FILE*, align 8
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8
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
@is_targa = internal unnamed_addr global i1 false, align 4
@.str.47 = private unnamed_addr constant [11 x i8] c"arithmetic\00", align 1
@.str.48 = private unnamed_addr constant [44 x i8] c"%s: sorry, arithmetic coding not supported\0A\00", align 1
@.str.49 = private unnamed_addr constant [9 x i8] c"baseline\00", align 1
@.str.50 = private unnamed_addr constant [4 x i8] c"dct\00", align 1
@.str.51 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.52 = private unnamed_addr constant [5 x i8] c"fast\00", align 1
@.str.53 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.54 = private unnamed_addr constant [6 x i8] c"debug\00", align 1
@.str.55 = private unnamed_addr constant [8 x i8] c"verbose\00", align 1
@parse_switches.printed_version = internal unnamed_addr global i1 false, align 4
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

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca %struct.jpeg_compress_struct, align 8
  %4 = alloca %struct.jpeg_error_mgr, align 8
  %5 = bitcast i8** %1 to i64*
  %6 = load i64, i64* %5, align 8
  store i64 %6, i64* bitcast (i8** @progname to i64*), align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %12, label %8

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** @progname, align 8
  %10 = load i8, i8* %9, align 1
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %8, %2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** @progname, align 8
  br label %13

; <label>:13:                                     ; preds = %8, %12
  %14 = call %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr* nonnull %4) #5
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %3, i64 0, i32 0
  store %struct.jpeg_error_mgr* %14, %struct.jpeg_error_mgr** %15, align 8
  call void @jpeg_CreateCompress(%struct.jpeg_compress_struct* nonnull %3, i32 61, i64 496) #5
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %4, i64 0, i32 11
  store i8** getelementptr inbounds ([44 x i8*], [44 x i8*]* @cdjpeg_message_table, i64 0, i64 0), i8*** %16, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %4, i64 0, i32 12
  store i32 1000, i32* %17, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %4, i64 0, i32 13
  store i32 1043, i32* %18, align 4
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %3, i64 0, i32 9
  store i32 2, i32* %19, align 4
  call void @jpeg_set_defaults(%struct.jpeg_compress_struct* nonnull %3) #5
  %20 = call fastcc i32 @parse_switches(%struct.jpeg_compress_struct* nonnull %3, i32 %0, i8** nonnull %1, i32 0)
  %21 = add nsw i32 %0, -1
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %13
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = load i8*, i8** @progname, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i8* %25) #6
  call fastcc void @usage()
  unreachable

; <label>:27:                                     ; preds = %13
  %28 = icmp slt i32 %20, %0
  br i1 %28, label %29, label %40

; <label>:29:                                     ; preds = %27
  %30 = sext i32 %20 to i64
  %31 = getelementptr inbounds i8*, i8** %1, i64 %30
  %32 = load i8*, i8** %31, align 8
  %33 = call %struct._IO_FILE* @fopen(i8* %32, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0))
  %34 = icmp eq %struct._IO_FILE* %33, null
  br i1 %34, label %35, label %42

; <label>:35:                                     ; preds = %29
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = load i8*, i8** @progname, align 8
  %sunkaddr = ptrtoint i8** %1 to i64
  %sunkaddr2 = shl nsw i64 %30, 3
  %sunkaddr3 = add i64 %sunkaddr, %sunkaddr2
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i8**
  %38 = load i8*, i8** %sunkaddr4, align 8
  %39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i8* %37, i8* %38) #6
  call void @exit(i32 1) #7
  unreachable

; <label>:40:                                     ; preds = %27
  %41 = call %struct._IO_FILE* @read_stdin() #5
  br label %42

; <label>:42:                                     ; preds = %29, %40
  %.01 = phi %struct._IO_FILE* [ %41, %40 ], [ %33, %29 ]
  %43 = load i8*, i8** @outfilename, align 8
  %44 = icmp eq i8* %43, null
  br i1 %44, label %53, label %45

; <label>:45:                                     ; preds = %42
  %46 = call %struct._IO_FILE* @fopen(i8* nonnull %43, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0))
  %47 = icmp eq %struct._IO_FILE* %46, null
  br i1 %47, label %48, label %55

; <label>:48:                                     ; preds = %45
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = load i8*, i8** @progname, align 8
  %51 = load i8*, i8** @outfilename, align 8
  %52 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i8* %50, i8* %51) #6
  call void @exit(i32 1) #7
  unreachable

; <label>:53:                                     ; preds = %42
  %54 = call %struct._IO_FILE* @write_stdout() #5
  br label %55

; <label>:55:                                     ; preds = %45, %53
  %.0 = phi %struct._IO_FILE* [ %54, %53 ], [ %46, %45 ]
  %56 = call fastcc %struct.cjpeg_source_struct* @select_file_type(%struct.jpeg_compress_struct* nonnull %3, %struct._IO_FILE* %.01)
  %57 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %56, i64 0, i32 3
  store %struct._IO_FILE* %.01, %struct._IO_FILE** %57, align 8
  %58 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %56, i64 0, i32 0
  %59 = load void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %58, align 8
  call void %59(%struct.jpeg_compress_struct* nonnull %3, %struct.cjpeg_source_struct* %56) #5
  call void @jpeg_default_colorspace(%struct.jpeg_compress_struct* nonnull %3) #5
  %60 = call fastcc i32 @parse_switches(%struct.jpeg_compress_struct* nonnull %3, i32 %0, i8** nonnull %1, i32 1)
  call void @jpeg_stdio_dest(%struct.jpeg_compress_struct* nonnull %3, %struct._IO_FILE* %.0) #5
  call void @jpeg_start_compress(%struct.jpeg_compress_struct* nonnull %3, i32 1) #5
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %3, i64 0, i32 36
  %62 = load i32, i32* %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %3, i64 0, i32 7
  %64 = load i32, i32* %63, align 4
  %65 = icmp ult i32 %62, %64
  br i1 %65, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %55
  %sunkaddr25 = ptrtoint %struct.cjpeg_source_struct* %56 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 8
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  %sunkaddr28 = ptrtoint %struct.cjpeg_source_struct* %56 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 32
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i8***
  %sunkaddr31 = ptrtoint %struct.jpeg_compress_struct* %3 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 296
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i32*
  %sunkaddr34 = ptrtoint %struct.jpeg_compress_struct* %3 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 44
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %66 = load i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %sunkaddr27, align 8
  %67 = call i32 %66(%struct.jpeg_compress_struct* nonnull %3, %struct.cjpeg_source_struct* %56) #5
  %68 = load i8**, i8*** %sunkaddr30, align 8
  %69 = call i32 @jpeg_write_scanlines(%struct.jpeg_compress_struct* nonnull %3, i8** %68, i32 %67) #5
  %70 = load i32, i32* %sunkaddr33, align 8
  %71 = load i32, i32* %sunkaddr36, align 4
  %72 = icmp ult i32 %70, %71
  br i1 %72, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %55
  %73 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %56, i64 0, i32 2
  %74 = load void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %73, align 8
  call void %74(%struct.jpeg_compress_struct* nonnull %3, %struct.cjpeg_source_struct* %56) #5
  call void @jpeg_finish_compress(%struct.jpeg_compress_struct* nonnull %3) #5
  call void @jpeg_destroy_compress(%struct.jpeg_compress_struct* nonnull %3) #5
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %76 = icmp eq %struct._IO_FILE* %.01, %75
  br i1 %76, label %79, label %77

; <label>:77:                                     ; preds = %._crit_edge
  %78 = call i32 @fclose(%struct._IO_FILE* %.01)
  br label %79

; <label>:79:                                     ; preds = %._crit_edge, %77
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %81 = icmp eq %struct._IO_FILE* %.0, %80
  br i1 %81, label %84, label %82

; <label>:82:                                     ; preds = %79
  %83 = call i32 @fclose(%struct._IO_FILE* %.0)
  br label %84

; <label>:84:                                     ; preds = %79, %82
  ret i32 0
}

declare %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr*) local_unnamed_addr #1

declare void @jpeg_CreateCompress(%struct.jpeg_compress_struct*, i32, i64) local_unnamed_addr #1

declare void @jpeg_set_defaults(%struct.jpeg_compress_struct*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @parse_switches(%struct.jpeg_compress_struct*, i32, i8** nocapture readonly, i32) unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i8, align 1
  %8 = alloca i64, align 8
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  store i32 75, i32* %5, align 4
  store i1 false, i1* @is_targa, align 4
  store i8* null, i8** @outfilename, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 7
  store i32 0, i32* %13, align 4
  %14 = icmp sgt i32 %1, 1
  br i1 %14, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %4
  %sunkaddr21 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 264
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  %sunkaddr18 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 276
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  %sunkaddr15 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 272
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  %sunkaddr12 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 256
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  %sunkaddr9 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 8
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to %struct.jpeg_memory_mgr**
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %16 = ptrtoint i8** %2 to i64
  %17 = ptrtoint i8** %2 to i64
  %sunkaddr6 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 268
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr, 268
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %sunkaddr1 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr2 = add i64 %sunkaddr1, 268
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %237
  %.0253 = phi i8* [ %.15, %237 ], [ null, %.lr.ph.preheader ]
  %.01252 = phi i8* [ %.1419, %237 ], [ null, %.lr.ph.preheader ]
  %.020251 = phi i8* [ %.1131, %237 ], [ null, %.lr.ph.preheader ]
  %.032250 = phi i8* [ %.1244, %237 ], [ null, %.lr.ph.preheader ]
  %.045249 = phi i32 [ %.954, %237 ], [ 0, %.lr.ph.preheader ]
  %.055248 = phi i32 [ %238, %237 ], [ 1, %.lr.ph.preheader ]
  %.072247 = phi i32 [ %.1082, %237 ], [ 100, %.lr.ph.preheader ]
  %.083246 = phi i32 [ %.285, %237 ], [ 0, %.lr.ph.preheader ]
  %18 = sext i32 %.055248 to i64
  %19 = getelementptr inbounds i8*, i8** %2, i64 %18
  %20 = load i8*, i8** %19, align 8
  %21 = load i8, i8* %20, align 1
  %22 = icmp eq i8 %21, 45
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = icmp sgt i32 %.055248, 0
  br i1 %24, label %._crit_edge.loopexit, label %25

; <label>:25:                                     ; preds = %23
  store i8* null, i8** @outfilename, align 8
  br label %237

; <label>:26:                                     ; preds = %.lr.ph
  %27 = getelementptr inbounds i8, i8* %20, i64 1
  %28 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.47, i64 0, i64 0), i32 1) #5
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %34, label %30

; <label>:30:                                     ; preds = %26
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = load i8*, i8** @progname, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.48, i64 0, i64 0), i8* %32) #6
  call void @exit(i32 1) #7
  unreachable

; <label>:34:                                     ; preds = %26
  %35 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.49, i64 0, i64 0), i32 1) #5
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %237

; <label>:37:                                     ; preds = %34
  %38 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.50, i64 0, i64 0), i32 2) #5
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %62, label %40

; <label>:40:                                     ; preds = %37
  %41 = add nsw i32 %.055248, 1
  %42 = icmp slt i32 %41, %1
  br i1 %42, label %44, label %43

; <label>:43:                                     ; preds = %40
  call fastcc void @usage()
  unreachable

; <label>:44:                                     ; preds = %40
  %45 = sext i32 %41 to i64
  %46 = getelementptr inbounds i8*, i8** %2, i64 %45
  %47 = load i8*, i8** %46, align 8
  %48 = call i32 @keymatch(i8* %47, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.51, i64 0, i64 0), i32 1) #5
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %51, label %50

; <label>:50:                                     ; preds = %44
  store i32 0, i32* %sunkaddr3, align 4
  br label %237

; <label>:51:                                     ; preds = %44
  %sunkaddr273 = shl nsw i64 %45, 3
  %sunkaddr274 = add i64 %16, %sunkaddr273
  %sunkaddr275 = inttoptr i64 %sunkaddr274 to i8**
  %52 = load i8*, i8** %sunkaddr275, align 8
  %53 = call i32 @keymatch(i8* %52, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.52, i64 0, i64 0), i32 2) #5
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %56, label %55

; <label>:55:                                     ; preds = %51
  store i32 1, i32* %sunkaddr5, align 4
  br label %237

; <label>:56:                                     ; preds = %51
  %sunkaddr280 = shl nsw i64 %45, 3
  %sunkaddr281 = add i64 %17, %sunkaddr280
  %sunkaddr282 = inttoptr i64 %sunkaddr281 to i8**
  %57 = load i8*, i8** %sunkaddr282, align 8
  %58 = call i32 @keymatch(i8* %57, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.53, i64 0, i64 0), i32 2) #5
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %61, label %60

; <label>:60:                                     ; preds = %56
  store i32 2, i32* %sunkaddr8, align 4
  br label %237

; <label>:61:                                     ; preds = %56
  call fastcc void @usage()
  unreachable

; <label>:62:                                     ; preds = %37
  %63 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.54, i64 0, i64 0), i32 1) #5
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %68

; <label>:65:                                     ; preds = %62
  %66 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.55, i64 0, i64 0), i32 1) #5
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %77, label %68

; <label>:68:                                     ; preds = %65, %62
  %.b = load i1, i1* @parse_switches.printed_version, align 4
  br i1 %.b, label %72, label %69

; <label>:69:                                     ; preds = %68
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %71 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %70, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.56, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.57, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.58, i64 0, i64 0)) #6
  store i1 true, i1* @parse_switches.printed_version, align 4
  br label %72

; <label>:72:                                     ; preds = %68, %69
  %73 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %74 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %73, i64 0, i32 7
  %75 = load i32, i32* %74, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %74, align 4
  br label %237

; <label>:77:                                     ; preds = %65
  %78 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.59, i64 0, i64 0), i32 2) #5
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %83

; <label>:80:                                     ; preds = %77
  %81 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.60, i64 0, i64 0), i32 2) #5
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %84, label %83

; <label>:83:                                     ; preds = %80, %77
  call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* %0, i32 1) #5
  br label %237

; <label>:84:                                     ; preds = %80
  %85 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.61, i64 0, i64 0), i32 3) #5
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %108, label %87

; <label>:87:                                     ; preds = %84
  store i8 120, i8* %7, align 1
  %88 = add nsw i32 %.055248, 1
  %89 = icmp slt i32 %88, %1
  br i1 %89, label %91, label %90

; <label>:90:                                     ; preds = %87
  call fastcc void @usage()
  unreachable

; <label>:91:                                     ; preds = %87
  %92 = sext i32 %88 to i64
  %93 = getelementptr inbounds i8*, i8** %2, i64 %92
  %94 = load i8*, i8** %93, align 8
  %95 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %94, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.62, i64 0, i64 0), i64* nonnull %6, i8* nonnull %7) #5
  %96 = icmp slt i32 %95, 1
  br i1 %96, label %97, label %98

; <label>:97:                                     ; preds = %91
  call fastcc void @usage()
  unreachable

; <label>:98:                                     ; preds = %91
  %99 = load i8, i8* %7, align 1
  switch i8 %99, label %103 [
    i8 109, label %100
    i8 77, label %100
  ]

; <label>:100:                                    ; preds = %98, %98
  %101 = load i64, i64* %6, align 8
  %102 = mul nsw i64 %101, 1000
  store i64 %102, i64* %6, align 8
  br label %103

; <label>:103:                                    ; preds = %98, %100
  %104 = load i64, i64* %6, align 8
  %105 = mul nsw i64 %104, 1000
  %106 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr11, align 8
  %107 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %106, i64 0, i32 11
  store i64 %105, i64* %107, align 8
  br label %237

; <label>:108:                                    ; preds = %84
  %109 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.63, i64 0, i64 0), i32 1) #5
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %114

; <label>:111:                                    ; preds = %108
  %112 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.64, i64 0, i64 0), i32 1) #5
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %115, label %114

; <label>:114:                                    ; preds = %111, %108
  store i32 1, i32* %sunkaddr14, align 8
  br label %237

; <label>:115:                                    ; preds = %111
  %116 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.65, i64 0, i64 0), i32 4) #5
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %127, label %118

; <label>:118:                                    ; preds = %115
  %119 = add nsw i32 %.055248, 1
  %120 = icmp slt i32 %119, %1
  br i1 %120, label %122, label %121

; <label>:121:                                    ; preds = %118
  call fastcc void @usage()
  unreachable

; <label>:122:                                    ; preds = %118
  %123 = sext i32 %119 to i64
  %124 = getelementptr inbounds i8*, i8** %2, i64 %123
  %125 = bitcast i8** %124 to i64*
  %126 = load i64, i64* %125, align 8
  store i64 %126, i64* bitcast (i8** @outfilename to i64*), align 8
  br label %237

; <label>:127:                                    ; preds = %115
  %128 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.66, i64 0, i64 0), i32 1) #5
  %129 = icmp eq i32 %128, 0
  br i1 %129, label %130, label %237

; <label>:130:                                    ; preds = %127
  %131 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.67, i64 0, i64 0), i32 1) #5
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %147, label %133

; <label>:133:                                    ; preds = %130
  %134 = add nsw i32 %.055248, 1
  %135 = icmp slt i32 %134, %1
  br i1 %135, label %137, label %136

; <label>:136:                                    ; preds = %133
  call fastcc void @usage()
  unreachable

; <label>:137:                                    ; preds = %133
  %138 = sext i32 %134 to i64
  %139 = getelementptr inbounds i8*, i8** %2, i64 %138
  %140 = load i8*, i8** %139, align 8
  %141 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %140, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.68, i64 0, i64 0), i32* nonnull %5) #5
  %142 = icmp eq i32 %141, 1
  br i1 %142, label %144, label %143

; <label>:143:                                    ; preds = %137
  call fastcc void @usage()
  unreachable

; <label>:144:                                    ; preds = %137
  %145 = load i32, i32* %5, align 4
  %146 = call i32 @jpeg_quality_scaling(i32 %145) #5
  br label %237

; <label>:147:                                    ; preds = %130
  %148 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.69, i64 0, i64 0), i32 2) #5
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %158, label %150

; <label>:150:                                    ; preds = %147
  %151 = add nsw i32 %.055248, 1
  %152 = icmp slt i32 %151, %1
  br i1 %152, label %154, label %153

; <label>:153:                                    ; preds = %150
  call fastcc void @usage()
  unreachable

; <label>:154:                                    ; preds = %150
  %155 = sext i32 %151 to i64
  %156 = getelementptr inbounds i8*, i8** %2, i64 %155
  %157 = load i8*, i8** %156, align 8
  br label %237

; <label>:158:                                    ; preds = %147
  %159 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.70, i64 0, i64 0), i32 2) #5
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %169, label %161

; <label>:161:                                    ; preds = %158
  %162 = add nsw i32 %.055248, 1
  %163 = icmp slt i32 %162, %1
  br i1 %163, label %165, label %164

; <label>:164:                                    ; preds = %161
  call fastcc void @usage()
  unreachable

; <label>:165:                                    ; preds = %161
  %166 = sext i32 %162 to i64
  %167 = getelementptr inbounds i8*, i8** %2, i64 %166
  %168 = load i8*, i8** %167, align 8
  br label %237

; <label>:169:                                    ; preds = %158
  %170 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.71, i64 0, i64 0), i32 1) #5
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %191, label %172

; <label>:172:                                    ; preds = %169
  store i8 120, i8* %9, align 1
  %173 = add nsw i32 %.055248, 1
  %174 = icmp slt i32 %173, %1
  br i1 %174, label %176, label %175

; <label>:175:                                    ; preds = %172
  call fastcc void @usage()
  unreachable

; <label>:176:                                    ; preds = %172
  %177 = sext i32 %173 to i64
  %178 = getelementptr inbounds i8*, i8** %2, i64 %177
  %179 = load i8*, i8** %178, align 8
  %180 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %179, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.62, i64 0, i64 0), i64* nonnull %8, i8* nonnull %9) #5
  %181 = icmp slt i32 %180, 1
  br i1 %181, label %182, label %183

; <label>:182:                                    ; preds = %176
  call fastcc void @usage()
  unreachable

; <label>:183:                                    ; preds = %176
  %184 = load i64, i64* %8, align 8
  %185 = icmp ugt i64 %184, 65535
  br i1 %185, label %186, label %187

; <label>:186:                                    ; preds = %183
  call fastcc void @usage()
  unreachable

; <label>:187:                                    ; preds = %183
  %188 = load i8, i8* %9, align 1
  %189 = trunc i64 %184 to i32
  switch i8 %188, label %._crit_edge314 [
    i8 98, label %190
    i8 66, label %190
  ]

; <label>:190:                                    ; preds = %187, %187
  store i32 %189, i32* %sunkaddr17, align 8
  br label %._crit_edge314

._crit_edge314:                                   ; preds = %187, %190
  %.sink = phi i32 [ 0, %190 ], [ %189, %187 ]
  store i32 %.sink, i32* %sunkaddr20, align 4
  br label %237

; <label>:191:                                    ; preds = %169
  %192 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.72, i64 0, i64 0), i32 2) #5
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %202, label %194

; <label>:194:                                    ; preds = %191
  %195 = add nsw i32 %.055248, 1
  %196 = icmp slt i32 %195, %1
  br i1 %196, label %198, label %197

; <label>:197:                                    ; preds = %194
  call fastcc void @usage()
  unreachable

; <label>:198:                                    ; preds = %194
  %199 = sext i32 %195 to i64
  %200 = getelementptr inbounds i8*, i8** %2, i64 %199
  %201 = load i8*, i8** %200, align 8
  br label %237

; <label>:202:                                    ; preds = %191
  %203 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.73, i64 0, i64 0), i32 2) #5
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %213, label %205

; <label>:205:                                    ; preds = %202
  %206 = add nsw i32 %.055248, 1
  %207 = icmp slt i32 %206, %1
  br i1 %207, label %209, label %208

; <label>:208:                                    ; preds = %205
  call fastcc void @usage()
  unreachable

; <label>:209:                                    ; preds = %205
  %210 = sext i32 %206 to i64
  %211 = getelementptr inbounds i8*, i8** %2, i64 %210
  %212 = load i8*, i8** %211, align 8
  br label %237

; <label>:213:                                    ; preds = %202
  %214 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.74, i64 0, i64 0), i32 2) #5
  %215 = icmp eq i32 %214, 0
  br i1 %215, label %232, label %216

; <label>:216:                                    ; preds = %213
  %217 = add nsw i32 %.055248, 1
  %218 = icmp slt i32 %217, %1
  br i1 %218, label %220, label %219

; <label>:219:                                    ; preds = %216
  call fastcc void @usage()
  unreachable

; <label>:220:                                    ; preds = %216
  %221 = sext i32 %217 to i64
  %222 = getelementptr inbounds i8*, i8** %2, i64 %221
  %223 = load i8*, i8** %222, align 8
  %224 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %223, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.68, i64 0, i64 0), i32* nonnull %10) #5
  %225 = icmp eq i32 %224, 1
  br i1 %225, label %227, label %226

; <label>:226:                                    ; preds = %220
  call fastcc void @usage()
  unreachable

; <label>:227:                                    ; preds = %220
  %228 = load i32, i32* %10, align 4
  %229 = icmp ugt i32 %228, 100
  br i1 %229, label %230, label %231

; <label>:230:                                    ; preds = %227
  call fastcc void @usage()
  unreachable

; <label>:231:                                    ; preds = %227
  store i32 %228, i32* %sunkaddr23, align 8
  br label %237

; <label>:232:                                    ; preds = %213
  %233 = call i32 @keymatch(i8* %27, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.75, i64 0, i64 0), i32 1) #5
  %234 = icmp eq i32 %233, 0
  br i1 %234, label %236, label %235

; <label>:235:                                    ; preds = %232
  store i1 true, i1* @is_targa, align 4
  br label %237

; <label>:236:                                    ; preds = %232
  call fastcc void @usage()
  unreachable

; <label>:237:                                    ; preds = %127, %34, %55, %60, %50, %83, %114, %154, %._crit_edge314, %209, %235, %231, %198, %165, %144, %122, %103, %72, %25
  %.285 = phi i32 [ %.083246, %25 ], [ %.083246, %72 ], [ %.083246, %103 ], [ %.083246, %122 ], [ %.083246, %144 ], [ %.083246, %165 ], [ %.083246, %198 ], [ %.083246, %231 ], [ %.083246, %235 ], [ %.083246, %209 ], [ %.083246, %._crit_edge314 ], [ %.083246, %154 ], [ %.083246, %114 ], [ %.083246, %83 ], [ %.083246, %50 ], [ %.083246, %60 ], [ %.083246, %55 ], [ 1, %34 ], [ %.083246, %127 ]
  %.1082 = phi i32 [ %.072247, %25 ], [ %.072247, %72 ], [ %.072247, %103 ], [ %.072247, %122 ], [ %146, %144 ], [ %.072247, %165 ], [ %.072247, %198 ], [ %.072247, %231 ], [ %.072247, %235 ], [ %.072247, %209 ], [ %.072247, %._crit_edge314 ], [ %.072247, %154 ], [ %.072247, %114 ], [ %.072247, %83 ], [ %.072247, %50 ], [ %.072247, %60 ], [ %.072247, %55 ], [ %.072247, %34 ], [ %.072247, %127 ]
  %.1671 = phi i32 [ %.055248, %25 ], [ %.055248, %72 ], [ %88, %103 ], [ %119, %122 ], [ %134, %144 ], [ %162, %165 ], [ %195, %198 ], [ %217, %231 ], [ %.055248, %235 ], [ %206, %209 ], [ %173, %._crit_edge314 ], [ %151, %154 ], [ %.055248, %114 ], [ %.055248, %83 ], [ %41, %50 ], [ %41, %60 ], [ %41, %55 ], [ %.055248, %34 ], [ %.055248, %127 ]
  %.954 = phi i32 [ %.045249, %25 ], [ %.045249, %72 ], [ %.045249, %103 ], [ %.045249, %122 ], [ %.045249, %144 ], [ %.045249, %165 ], [ %.045249, %198 ], [ %.045249, %231 ], [ %.045249, %235 ], [ %.045249, %209 ], [ %.045249, %._crit_edge314 ], [ %.045249, %154 ], [ %.045249, %114 ], [ %.045249, %83 ], [ %.045249, %50 ], [ %.045249, %60 ], [ %.045249, %55 ], [ %.045249, %34 ], [ 1, %127 ]
  %.1244 = phi i8* [ %.032250, %25 ], [ %.032250, %72 ], [ %.032250, %103 ], [ %.032250, %122 ], [ %.032250, %144 ], [ %168, %165 ], [ %.032250, %198 ], [ %.032250, %231 ], [ %.032250, %235 ], [ %.032250, %209 ], [ %.032250, %._crit_edge314 ], [ %.032250, %154 ], [ %.032250, %114 ], [ %.032250, %83 ], [ %.032250, %50 ], [ %.032250, %60 ], [ %.032250, %55 ], [ %.032250, %34 ], [ %.032250, %127 ]
  %.1131 = phi i8* [ %.020251, %25 ], [ %.020251, %72 ], [ %.020251, %103 ], [ %.020251, %122 ], [ %.020251, %144 ], [ %.020251, %165 ], [ %.020251, %198 ], [ %.020251, %231 ], [ %.020251, %235 ], [ %.020251, %209 ], [ %.020251, %._crit_edge314 ], [ %157, %154 ], [ %.020251, %114 ], [ %.020251, %83 ], [ %.020251, %50 ], [ %.020251, %60 ], [ %.020251, %55 ], [ %.020251, %34 ], [ %.020251, %127 ]
  %.1419 = phi i8* [ %.01252, %25 ], [ %.01252, %72 ], [ %.01252, %103 ], [ %.01252, %122 ], [ %.01252, %144 ], [ %.01252, %165 ], [ %201, %198 ], [ %.01252, %231 ], [ %.01252, %235 ], [ %.01252, %209 ], [ %.01252, %._crit_edge314 ], [ %.01252, %154 ], [ %.01252, %114 ], [ %.01252, %83 ], [ %.01252, %50 ], [ %.01252, %60 ], [ %.01252, %55 ], [ %.01252, %34 ], [ %.01252, %127 ]
  %.15 = phi i8* [ %.0253, %25 ], [ %.0253, %72 ], [ %.0253, %103 ], [ %.0253, %122 ], [ %.0253, %144 ], [ %.0253, %165 ], [ %.0253, %198 ], [ %.0253, %231 ], [ %.0253, %235 ], [ %212, %209 ], [ %.0253, %._crit_edge314 ], [ %.0253, %154 ], [ %.0253, %114 ], [ %.0253, %83 ], [ %.0253, %50 ], [ %.0253, %60 ], [ %.0253, %55 ], [ %.0253, %34 ], [ %.0253, %127 ]
  %238 = add nsw i32 %.1671, 1
  %239 = icmp slt i32 %238, %1
  br i1 %239, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %23, %237
  %.083.lcssa.ph = phi i32 [ %.083246, %23 ], [ %.285, %237 ]
  %.072.lcssa.ph = phi i32 [ %.072247, %23 ], [ %.1082, %237 ]
  %.055.lcssa.ph = phi i32 [ %.055248, %23 ], [ %238, %237 ]
  %.045.lcssa.ph = phi i32 [ %.045249, %23 ], [ %.954, %237 ]
  %.032.lcssa.ph = phi i8* [ %.032250, %23 ], [ %.1244, %237 ]
  %.020.lcssa.ph = phi i8* [ %.020251, %23 ], [ %.1131, %237 ]
  %.01.lcssa.ph = phi i8* [ %.01252, %23 ], [ %.1419, %237 ]
  %.0.lcssa.ph = phi i8* [ %.0253, %23 ], [ %.15, %237 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %.083.lcssa = phi i32 [ 0, %4 ], [ %.083.lcssa.ph, %._crit_edge.loopexit ]
  %.072.lcssa = phi i32 [ 100, %4 ], [ %.072.lcssa.ph, %._crit_edge.loopexit ]
  %.055.lcssa = phi i32 [ 1, %4 ], [ %.055.lcssa.ph, %._crit_edge.loopexit ]
  %.045.lcssa = phi i32 [ 0, %4 ], [ %.045.lcssa.ph, %._crit_edge.loopexit ]
  %.032.lcssa = phi i8* [ null, %4 ], [ %.032.lcssa.ph, %._crit_edge.loopexit ]
  %.020.lcssa = phi i8* [ null, %4 ], [ %.020.lcssa.ph, %._crit_edge.loopexit ]
  %.01.lcssa = phi i8* [ null, %4 ], [ %.01.lcssa.ph, %._crit_edge.loopexit ]
  %.0.lcssa = phi i8* [ null, %4 ], [ %.0.lcssa.ph, %._crit_edge.loopexit ]
  %240 = icmp eq i32 %3, 0
  br i1 %240, label %269, label %241

; <label>:241:                                    ; preds = %._crit_edge
  %242 = load i32, i32* %5, align 4
  call void @jpeg_set_quality(%struct.jpeg_compress_struct* %0, i32 %242, i32 %.083.lcssa) #5
  %243 = icmp eq i8* %.032.lcssa, null
  br i1 %243, label %248, label %244

; <label>:244:                                    ; preds = %241
  %245 = call i32 @read_quant_tables(%struct.jpeg_compress_struct* %0, i8* nonnull %.032.lcssa, i32 %.072.lcssa, i32 %.083.lcssa) #5
  %246 = icmp eq i32 %245, 0
  br i1 %246, label %247, label %248

; <label>:247:                                    ; preds = %244
  call fastcc void @usage()
  unreachable

; <label>:248:                                    ; preds = %244, %241
  %249 = icmp eq i8* %.020.lcssa, null
  br i1 %249, label %254, label %250

; <label>:250:                                    ; preds = %248
  %251 = call i32 @set_quant_slots(%struct.jpeg_compress_struct* %0, i8* nonnull %.020.lcssa) #5
  %252 = icmp eq i32 %251, 0
  br i1 %252, label %253, label %254

; <label>:253:                                    ; preds = %250
  call fastcc void @usage()
  unreachable

; <label>:254:                                    ; preds = %250, %248
  %255 = icmp eq i8* %.01.lcssa, null
  br i1 %255, label %260, label %256

; <label>:256:                                    ; preds = %254
  %257 = call i32 @set_sample_factors(%struct.jpeg_compress_struct* %0, i8* nonnull %.01.lcssa) #5
  %258 = icmp eq i32 %257, 0
  br i1 %258, label %259, label %260

; <label>:259:                                    ; preds = %256
  call fastcc void @usage()
  unreachable

; <label>:260:                                    ; preds = %256, %254
  %261 = icmp eq i32 %.045.lcssa, 0
  br i1 %261, label %263, label %262

; <label>:262:                                    ; preds = %260
  call void @jpeg_simple_progression(%struct.jpeg_compress_struct* %0) #5
  br label %263

; <label>:263:                                    ; preds = %260, %262
  %264 = icmp eq i8* %.0.lcssa, null
  br i1 %264, label %269, label %265

; <label>:265:                                    ; preds = %263
  %266 = call i32 @read_scan_script(%struct.jpeg_compress_struct* %0, i8* nonnull %.0.lcssa) #5
  %267 = icmp eq i32 %266, 0
  br i1 %267, label %268, label %269

; <label>:268:                                    ; preds = %265
  call fastcc void @usage()
  unreachable

; <label>:269:                                    ; preds = %265, %263, %._crit_edge
  ret i32 %.055.lcssa
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @usage() unnamed_addr #3 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = load i8*, i8** @progname, align 8
  %3 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.76, i64 0, i64 0), i8* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.77, i64 0, i64 0), i64 12, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.78, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %6) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.79, i64 0, i64 0), i64 68, i64 1, %struct._IO_FILE* %8) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.80, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %10) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.81, i64 0, i64 0), i64 77, i64 1, %struct._IO_FILE* %12) #6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.82, i64 0, i64 0), i64 46, i64 1, %struct._IO_FILE* %14) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.83, i64 0, i64 0), i64 65, i64 1, %struct._IO_FILE* %16) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.84, i64 0, i64 0), i64 29, i64 1, %struct._IO_FILE* %18) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.85, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.86, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.87, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.88, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.89, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.88, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.90, i64 0, i64 0), i64 67, i64 1, %struct._IO_FILE* %26) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.91, i64 0, i64 0), i64 62, i64 1, %struct._IO_FILE* %28) #6
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i64 @fwrite(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.92, i64 0, i64 0), i64 51, i64 1, %struct._IO_FILE* %30) #6
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.93, i64 0, i64 0), i64 46, i64 1, %struct._IO_FILE* %32) #6
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.94, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %34) #6
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.95, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %36) #6
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.96, i64 0, i64 0), i64 39, i64 1, %struct._IO_FILE* %38) #6
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i64 @fwrite(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.97, i64 0, i64 0), i64 55, i64 1, %struct._IO_FILE* %40) #6
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i64 @fwrite(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.98, i64 0, i64 0), i64 55, i64 1, %struct._IO_FILE* %42) #6
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i64 @fwrite(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.99, i64 0, i64 0), i64 52, i64 1, %struct._IO_FILE* %44) #6
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i64 @fwrite(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.100, i64 0, i64 0), i64 56, i64 1, %struct._IO_FILE* %46) #6
  tail call void @exit(i32 1) #7
  unreachable
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

declare %struct._IO_FILE* @read_stdin() local_unnamed_addr #1

declare %struct._IO_FILE* @write_stdout() local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc %struct.cjpeg_source_struct* @select_file_type(%struct.jpeg_compress_struct*, %struct._IO_FILE* nocapture) unnamed_addr #0 {
  %.b = load i1, i1* @is_targa, align 4
  br i1 %.b, label %3, label %5

; <label>:3:                                      ; preds = %2
  %4 = tail call %struct.cjpeg_source_struct* @jinit_read_targa(%struct.jpeg_compress_struct* %0) #5
  ret %struct.cjpeg_source_struct* %4

; <label>:5:                                      ; preds = %2
  %6 = tail call i32 @_IO_getc(%struct._IO_FILE* %1)
  %7 = icmp eq i32 %6, -1
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %5
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 5
  store i32 41, i32* %11, align 8
  %12 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %15 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %15) #5
  br label %16

; <label>:16:                                     ; preds = %5, %8
  %17 = tail call i32 @ungetc(i32 %6, %struct._IO_FILE* %1)
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %19, label %27

; <label>:19:                                     ; preds = %16
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i64 0, i32 5
  store i32 1040, i32* %22, align 8
  %23 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %24 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %23, align 8
  %25 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %24, align 8
  %26 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %25(%struct.jpeg_common_struct* %26) #5
  br label %27

; <label>:27:                                     ; preds = %16, %19
  switch i32 %6, label %36 [
    i32 66, label %28
    i32 71, label %30
    i32 80, label %32
    i32 0, label %34
  ]

; <label>:28:                                     ; preds = %27
  %29 = tail call %struct.cjpeg_source_struct* @jinit_read_bmp(%struct.jpeg_compress_struct* %0) #5
  ret %struct.cjpeg_source_struct* %29

; <label>:30:                                     ; preds = %27
  %31 = tail call %struct.cjpeg_source_struct* @jinit_read_gif(%struct.jpeg_compress_struct* %0) #5
  ret %struct.cjpeg_source_struct* %31

; <label>:32:                                     ; preds = %27
  %33 = tail call %struct.cjpeg_source_struct* @jinit_read_ppm(%struct.jpeg_compress_struct* %0) #5
  ret %struct.cjpeg_source_struct* %33

; <label>:34:                                     ; preds = %27
  %35 = tail call %struct.cjpeg_source_struct* @jinit_read_targa(%struct.jpeg_compress_struct* %0) #5
  ret %struct.cjpeg_source_struct* %35

; <label>:36:                                     ; preds = %27
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i64 0, i32 5
  store i32 1041, i32* %39, align 8
  %40 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %41 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %40, align 8
  %42 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %41, align 8
  %43 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %42(%struct.jpeg_common_struct* %43) #5
  ret %struct.cjpeg_source_struct* null
}

declare void @jpeg_default_colorspace(%struct.jpeg_compress_struct*) local_unnamed_addr #1

declare void @jpeg_stdio_dest(%struct.jpeg_compress_struct*, %struct._IO_FILE*) local_unnamed_addr #1

declare void @jpeg_start_compress(%struct.jpeg_compress_struct*, i32) local_unnamed_addr #1

declare i32 @jpeg_write_scanlines(%struct.jpeg_compress_struct*, i8**, i32) local_unnamed_addr #1

declare void @jpeg_finish_compress(%struct.jpeg_compress_struct*) local_unnamed_addr #1

declare void @jpeg_destroy_compress(%struct.jpeg_compress_struct*) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #2

declare i32 @keymatch(i8*, i8*, i32) local_unnamed_addr #1

declare void @jpeg_set_colorspace(%struct.jpeg_compress_struct*, i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) local_unnamed_addr #2

declare i32 @jpeg_quality_scaling(i32) local_unnamed_addr #1

declare void @jpeg_set_quality(%struct.jpeg_compress_struct*, i32, i32) local_unnamed_addr #1

declare i32 @read_quant_tables(%struct.jpeg_compress_struct*, i8*, i32, i32) local_unnamed_addr #1

declare i32 @set_quant_slots(%struct.jpeg_compress_struct*, i8*) local_unnamed_addr #1

declare i32 @set_sample_factors(%struct.jpeg_compress_struct*, i8*) local_unnamed_addr #1

declare void @jpeg_simple_progression(%struct.jpeg_compress_struct*) local_unnamed_addr #1

declare i32 @read_scan_script(%struct.jpeg_compress_struct*, i8*) local_unnamed_addr #1

declare %struct.cjpeg_source_struct* @jinit_read_targa(%struct.jpeg_compress_struct*) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @ungetc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #2

declare %struct.cjpeg_source_struct* @jinit_read_bmp(%struct.jpeg_compress_struct*) local_unnamed_addr #1

declare %struct.cjpeg_source_struct* @jinit_read_gif(%struct.jpeg_compress_struct*) local_unnamed_addr #1

declare %struct.cjpeg_source_struct* @jinit_read_ppm(%struct.jpeg_compress_struct*) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
