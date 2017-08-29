; ModuleID = 'tmp1.ll'
source_filename = "tif_print.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, {}* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.TIFFCodec = type { i8*, i16, i32 (%struct.tiff*, i32)* }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [32 x i8] c"TIFF Directory at offset 0x%lx\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"  Subfile Type:\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"%sreduced-resolution image\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"%smulti-page document\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"%stransparency mask\00", align 1
@.str.7 = private unnamed_addr constant [16 x i8] c" (%lu = 0x%lx)\0A\00", align 1
@.str.8 = private unnamed_addr constant [37 x i8] c"  Image Width: %lu Image Length: %lu\00", align 1
@.str.9 = private unnamed_addr constant [18 x i8] c" Image Depth: %lu\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.11 = private unnamed_addr constant [54 x i8] c"  Pixar Full Image Width: %lu Full Image Length: %lu\0A\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"Texture Format\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"Texture Wrap Modes\00", align 1
@.str.14 = private unnamed_addr constant [31 x i8] c"  Field of View Cotangent: %g\0A\00", align 1
@.str.15 = private unnamed_addr constant [66 x i8] c"  Matrix NP:\0A\09%g %g %g %g\0A\09%g %g %g %g\0A\09%g %g %g %g\0A\09%g %g %g %g\0A\00", align 1
@.str.16 = private unnamed_addr constant [66 x i8] c"  Matrix Nl:\0A\09%g %g %g %g\0A\09%g %g %g %g\0A\09%g %g %g %g\0A\09%g %g %g %g\0A\00", align 1
@.str.17 = private unnamed_addr constant [35 x i8] c"  Tile Width: %lu Tile Length: %lu\00", align 1
@.str.18 = private unnamed_addr constant [17 x i8] c" Tile Depth: %lu\00", align 1
@.str.19 = private unnamed_addr constant [21 x i8] c"  Resolution: %g, %g\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c" (unitless)\00", align 1
@.str.21 = private unnamed_addr constant [13 x i8] c" pixels/inch\00", align 1
@.str.22 = private unnamed_addr constant [11 x i8] c" pixels/cm\00", align 1
@.str.23 = private unnamed_addr constant [18 x i8] c" (unit %u = 0x%x)\00", align 1
@.str.24 = private unnamed_addr constant [20 x i8] c"  Position: %g, %g\0A\00", align 1
@.str.25 = private unnamed_addr constant [19 x i8] c"  Bits/Sample: %u\0A\00", align 1
@.str.26 = private unnamed_addr constant [18 x i8] c"  Sample Format: \00", align 1
@.str.27 = private unnamed_addr constant [6 x i8] c"void\0A\00", align 1
@.str.28 = private unnamed_addr constant [16 x i8] c"signed integer\0A\00", align 1
@.str.29 = private unnamed_addr constant [18 x i8] c"unsigned integer\0A\00", align 1
@.str.30 = private unnamed_addr constant [21 x i8] c"IEEE floating point\0A\00", align 1
@.str.31 = private unnamed_addr constant [11 x i8] c"%u (0x%x)\0A\00", align 1
@.str.32 = private unnamed_addr constant [23 x i8] c"  Compression Scheme: \00", align 1
@.str.33 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.34 = private unnamed_addr constant [31 x i8] c"  Photometric Interpretation: \00", align 1
@photoNames = internal global [9 x i8*] [i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.112, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.113, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.114, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.115, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.116, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.117, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.118, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.119, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.120, i32 0, i32 0)], align 16
@.str.35 = private unnamed_addr constant [13 x i8] c"CIE Log2(L)\0A\00", align 1
@.str.36 = private unnamed_addr constant [21 x i8] c"CIE Log2(L) (u',v')\0A\00", align 1
@.str.37 = private unnamed_addr constant [21 x i8] c"  Extra Samples: %u<\00", align 1
@.str.38 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.39 = private unnamed_addr constant [14 x i8] c"%sunspecified\00", align 1
@.str.40 = private unnamed_addr constant [14 x i8] c"%sassoc-alpha\00", align 1
@.str.41 = private unnamed_addr constant [16 x i8] c"%sunassoc-alpha\00", align 1
@.str.42 = private unnamed_addr constant [12 x i8] c"%s%u (0x%x)\00", align 1
@.str.43 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.44 = private unnamed_addr constant [3 x i8] c">\0A\00", align 1
@.str.45 = private unnamed_addr constant [42 x i8] c"  Sample to Nits conversion factor: %.4e\0A\00", align 1
@.str.46 = private unnamed_addr constant [12 x i8] c"  Ink Set: \00", align 1
@.str.47 = private unnamed_addr constant [6 x i8] c"CMYK\0A\00", align 1
@.str.48 = private unnamed_addr constant [14 x i8] c"  Ink Names: \00", align 1
@.str.49 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.50 = private unnamed_addr constant [21 x i8] c" Number of Inks: %u\0A\00", align 1
@.str.51 = private unnamed_addr constant [20 x i8] c"  Dot Range: %u-%u\0A\00", align 1
@.str.52 = private unnamed_addr constant [15 x i8] c"Target Printer\00", align 1
@.str.53 = private unnamed_addr constant [17 x i8] c"  Thresholding: \00", align 1
@.str.54 = private unnamed_addr constant [18 x i8] c"bilevel art scan\0A\00", align 1
@.str.55 = private unnamed_addr constant [27 x i8] c"halftone or dithered scan\0A\00", align 1
@.str.56 = private unnamed_addr constant [16 x i8] c"error diffused\0A\00", align 1
@.str.57 = private unnamed_addr constant [14 x i8] c"  FillOrder: \00", align 1
@.str.58 = private unnamed_addr constant [12 x i8] c"msb-to-lsb\0A\00", align 1
@.str.59 = private unnamed_addr constant [12 x i8] c"lsb-to-msb\0A\00", align 1
@.str.60 = private unnamed_addr constant [29 x i8] c"  YCbCr Subsampling: %u, %u\0A\00", align 1
@.str.61 = private unnamed_addr constant [22 x i8] c"  YCbCr Positioning: \00", align 1
@.str.62 = private unnamed_addr constant [10 x i8] c"centered\0A\00", align 1
@.str.63 = private unnamed_addr constant [9 x i8] c"cosited\0A\00", align 1
@.str.64 = private unnamed_addr constant [34 x i8] c"  YCbCr Coefficients: %g, %g, %g\0A\00", align 1
@.str.65 = private unnamed_addr constant [36 x i8] c"  Halftone Hints: light %u dark %u\0A\00", align 1
@.str.66 = private unnamed_addr constant [7 x i8] c"Artist\00", align 1
@.str.67 = private unnamed_addr constant [12 x i8] c"Date & Time\00", align 1
@.str.68 = private unnamed_addr constant [14 x i8] c"Host Computer\00", align 1
@.str.69 = private unnamed_addr constant [9 x i8] c"Software\00", align 1
@.str.70 = private unnamed_addr constant [14 x i8] c"Document Name\00", align 1
@.str.71 = private unnamed_addr constant [18 x i8] c"Image Description\00", align 1
@.str.72 = private unnamed_addr constant [5 x i8] c"Make\00", align 1
@.str.73 = private unnamed_addr constant [6 x i8] c"Model\00", align 1
@.str.74 = private unnamed_addr constant [16 x i8] c"  Orientation: \00", align 1
@orientNames = internal global [9 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.121, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.122, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.123, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.124, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.125, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.126, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.127, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.128, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.129, i32 0, i32 0)], align 16
@.str.75 = private unnamed_addr constant [21 x i8] c"  Samples/Pixel: %u\0A\00", align 1
@.str.76 = private unnamed_addr constant [15 x i8] c"  Rows/Strip: \00", align 1
@.str.77 = private unnamed_addr constant [12 x i8] c"(infinite)\0A\00", align 1
@.str.78 = private unnamed_addr constant [5 x i8] c"%lu\0A\00", align 1
@.str.79 = private unnamed_addr constant [24 x i8] c"  Min Sample Value: %u\0A\00", align 1
@.str.80 = private unnamed_addr constant [24 x i8] c"  Max Sample Value: %u\0A\00", align 1
@.str.81 = private unnamed_addr constant [25 x i8] c"  SMin Sample Value: %g\0A\00", align 1
@.str.82 = private unnamed_addr constant [25 x i8] c"  SMax Sample Value: %g\0A\00", align 1
@.str.83 = private unnamed_addr constant [25 x i8] c"  Planar Configuration: \00", align 1
@.str.84 = private unnamed_addr constant [20 x i8] c"single image plane\0A\00", align 1
@.str.85 = private unnamed_addr constant [23 x i8] c"separate image planes\0A\00", align 1
@.str.86 = private unnamed_addr constant [10 x i8] c"Page Name\00", align 1
@.str.87 = private unnamed_addr constant [22 x i8] c"  Page Number: %u-%u\0A\00", align 1
@.str.88 = private unnamed_addr constant [14 x i8] c"  Color Map: \00", align 1
@.str.89 = private unnamed_addr constant [22 x i8] c"   %5lu: %5u %5u %5u\0A\00", align 1
@.str.90 = private unnamed_addr constant [11 x i8] c"(present)\0A\00", align 1
@.str.91 = private unnamed_addr constant [22 x i8] c"  White Point: %g-%g\0A\00", align 1
@.str.92 = private unnamed_addr constant [45 x i8] c"  Primary Chromaticities: %g,%g %g,%g %g,%g\0A\00", align 1
@.str.93 = private unnamed_addr constant [26 x i8] c"  Reference Black/White:\0A\00", align 1
@.str.94 = private unnamed_addr constant [18 x i8] c"    %2d: %5g %5g\0A\00", align 1
@.str.95 = private unnamed_addr constant [22 x i8] c"  Transfer Function: \00", align 1
@.str.96 = private unnamed_addr constant [14 x i8] c"    %2lu: %5u\00", align 1
@.str.97 = private unnamed_addr constant [5 x i8] c" %5u\00", align 1
@.str.98 = private unnamed_addr constant [37 x i8] c"  ICC Profile: <present>, %lu bytes\0A\00", align 1
@.str.99 = private unnamed_addr constant [40 x i8] c"  Photoshop Data: <present>, %lu bytes\0A\00", align 1
@.str.100 = private unnamed_addr constant [43 x i8] c"  RichTIFFIPTC Data: <present>, %lu bytes\0A\00", align 1
@.str.101 = private unnamed_addr constant [18 x i8] c"  SubIFD Offsets:\00", align 1
@.str.102 = private unnamed_addr constant [6 x i8] c" %5lu\00", align 1
@.str.103 = private unnamed_addr constant [11 x i8] c"  %lu %s:\0A\00", align 1
@.str.104 = private unnamed_addr constant [6 x i8] c"Tiles\00", align 1
@.str.105 = private unnamed_addr constant [7 x i8] c"Strips\00", align 1
@.str.106 = private unnamed_addr constant [24 x i8] c"    %3lu: [%8lu, %8lu]\0A\00", align 1
@.str.107 = private unnamed_addr constant [11 x i8] c"\09t\08b\0Dr\0An\0Bv\00", align 1
@.str.108 = private unnamed_addr constant [4 x i8] c"\5C%c\00", align 1
@.str.109 = private unnamed_addr constant [6 x i8] c"\5C%03o\00", align 1
@.str.110 = private unnamed_addr constant [8 x i8] c"  %s: \22\00", align 1
@.str.111 = private unnamed_addr constant [3 x i8] c"\22\0A\00", align 1
@.str.112 = private unnamed_addr constant [13 x i8] c"min-is-white\00", align 1
@.str.113 = private unnamed_addr constant [13 x i8] c"min-is-black\00", align 1
@.str.114 = private unnamed_addr constant [10 x i8] c"RGB color\00", align 1
@.str.115 = private unnamed_addr constant [34 x i8] c"palette color (RGB from colormap)\00", align 1
@.str.116 = private unnamed_addr constant [18 x i8] c"transparency mask\00", align 1
@.str.117 = private unnamed_addr constant [10 x i8] c"separated\00", align 1
@.str.118 = private unnamed_addr constant [6 x i8] c"YCbCr\00", align 1
@.str.119 = private unnamed_addr constant [8 x i8] c"7 (0x7)\00", align 1
@.str.120 = private unnamed_addr constant [11 x i8] c"CIE L*a*b*\00", align 1
@.str.121 = private unnamed_addr constant [8 x i8] c"0 (0x0)\00", align 1
@.str.122 = private unnamed_addr constant [21 x i8] c"row 0 top, col 0 lhs\00", align 1
@.str.123 = private unnamed_addr constant [21 x i8] c"row 0 top, col 0 rhs\00", align 1
@.str.124 = private unnamed_addr constant [24 x i8] c"row 0 bottom, col 0 rhs\00", align 1
@.str.125 = private unnamed_addr constant [24 x i8] c"row 0 bottom, col 0 lhs\00", align 1
@.str.126 = private unnamed_addr constant [21 x i8] c"row 0 lhs, col 0 top\00", align 1
@.str.127 = private unnamed_addr constant [21 x i8] c"row 0 rhs, col 0 top\00", align 1
@.str.128 = private unnamed_addr constant [24 x i8] c"row 0 rhs, col 0 bottom\00", align 1
@.str.129 = private unnamed_addr constant [24 x i8] c"row 0 lhs, col 0 bottom\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFPrintDirectory = private constant [18 x i8] c"TIFFPrintDirectory"
@__profn__TIFFprintAsciiTag = private constant [18 x i8] c"_TIFFprintAsciiTag"
@__profn__TIFFprintAscii = private constant [15 x i8] c"_TIFFprintAscii"
@__profc_TIFFPrintDirectory = private global [104 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFPrintDirectory = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFPrintDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1437954127327020918, i64 72340460195868963, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, %struct._IO_FILE*, i64)* @TIFFPrintDirectory to i8*), i8* bitcast ([1 x i64]* @__profvp_TIFFPrintDirectory to i8*), i32 104, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc__TIFFprintAsciiTag = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFprintAsciiTag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 587707852642566320, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFprintAsciiTag, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i8*, i8*)* @_TIFFprintAsciiTag to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFprintAscii = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFprintAscii = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5003678972795224996, i64 97300861709, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i8*)* @_TIFFprintAscii to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [55 x i8] c"5\00TIFFPrintDirectory\01_TIFFprintAsciiTag\01_TIFFprintAscii", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFPrintDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFprintAsciiTag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFprintAscii to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @TIFFPrintDirectory(%struct.tiff*, %struct._IO_FILE*, i64) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.TIFFDirectory*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i16, align 2
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca [4 x [4 x float]]*, align 8
  %13 = alloca [4 x [4 x float]]*, align 8
  %14 = alloca %struct.TIFFCodec*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  store i64 %2, i64* %6, align 8
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %18 = load %struct.tiff*, %struct.tiff** %4, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %18, i32 0, i32 4
  %20 = load i32, i32* %19, align 4
  %21 = sext i32 %20 to i64
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0), i64 %21)
  %23 = load %struct.tiff*, %struct.tiff** %4, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %23, i32 0, i32 6
  store %struct.TIFFDirectory* %24, %struct.TIFFDirectory** %7, align 8
  %25 = load %struct.tiff*, %struct.tiff** %4, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 6
  %27 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %26, i32 0, i32 0
  %28 = getelementptr inbounds [3 x i64], [3 x i64]* %27, i64 0, i64 0
  %29 = load i64, i64* %28, align 8
  %30 = and i64 %29, 32
  %31 = icmp ne i64 %30, 0
  br i1 %31, label %32, label %79

; <label>:32:                                     ; preds = %3
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0))
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8** %8, align 8
  %35 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %36 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %35, i32 0, i32 7
  %37 = load i32, i32* %36, align 8
  %38 = and i32 %37, 1
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %45

; <label>:40:                                     ; preds = %32
  %pgocount = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 61)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 61)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %43 = load i8*, i8** %8, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i32 0, i32 0), i8* %43)
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %8, align 8
  br label %45

; <label>:45:                                     ; preds = %40, %32
  %46 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %47 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %46, i32 0, i32 7
  %48 = load i32, i32* %47, align 8
  %49 = and i32 %48, 2
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %56

; <label>:51:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 62)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 62)
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %54 = load i8*, i8** %8, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i32 0, i32 0), i8* %54)
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %8, align 8
  br label %56

; <label>:56:                                     ; preds = %51, %45
  %57 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %58 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %57, i32 0, i32 7
  %59 = load i32, i32* %58, align 8
  %60 = and i32 %59, 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %67

; <label>:62:                                     ; preds = %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 63)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 63)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %65 = load i8*, i8** %8, align 8
  %66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i32 0, i32 0), i8* %65)
  br label %67

; <label>:67:                                     ; preds = %62, %56
  %pgocount3 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 14)
  %68 = add i64 %pgocount3, 1
  store i64 %68, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 14)
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %70 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %71 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %70, i32 0, i32 7
  %72 = load i32, i32* %71, align 8
  %73 = zext i32 %72 to i64
  %74 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %75 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %74, i32 0, i32 7
  %76 = load i32, i32* %75, align 8
  %77 = zext i32 %76 to i64
  %78 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.7, i32 0, i32 0), i64 %73, i64 %77)
  br label %79

; <label>:79:                                     ; preds = %67, %3
  %80 = load %struct.tiff*, %struct.tiff** %4, align 8
  %81 = getelementptr inbounds %struct.tiff, %struct.tiff* %80, i32 0, i32 6
  %82 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %81, i32 0, i32 0
  %83 = getelementptr inbounds [3 x i64], [3 x i64]* %82, i64 0, i64 0
  %84 = load i64, i64* %83, align 8
  %85 = and i64 %84, 2
  %86 = icmp ne i64 %85, 0
  br i1 %86, label %87, label %117

; <label>:87:                                     ; preds = %79
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %89 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %90 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %89, i32 0, i32 1
  %91 = load i32, i32* %90, align 8
  %92 = zext i32 %91 to i64
  %93 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %94 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %93, i32 0, i32 2
  %95 = load i32, i32* %94, align 4
  %96 = zext i32 %95 to i64
  %97 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %88, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.8, i32 0, i32 0), i64 %92, i64 %96)
  %98 = load %struct.tiff*, %struct.tiff** %4, align 8
  %99 = getelementptr inbounds %struct.tiff, %struct.tiff* %98, i32 0, i32 6
  %100 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %99, i32 0, i32 0
  %101 = getelementptr inbounds [3 x i64], [3 x i64]* %100, i64 0, i64 1
  %102 = load i64, i64* %101, align 8
  %103 = and i64 %102, 8
  %104 = icmp ne i64 %103, 0
  br i1 %104, label %105, label %113

; <label>:105:                                    ; preds = %87
  %pgocount4 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 64)
  %106 = add i64 %pgocount4, 1
  store i64 %106, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 64)
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %108 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %109 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %108, i32 0, i32 3
  %110 = load i32, i32* %109, align 8
  %111 = zext i32 %110 to i64
  %112 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %107, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i32 0, i32 0), i64 %111)
  br label %113

; <label>:113:                                    ; preds = %105, %87
  %pgocount5 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 15)
  %114 = add i64 %pgocount5, 1
  store i64 %114, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 15)
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %116 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %115, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  br label %117

; <label>:117:                                    ; preds = %113, %79
  %118 = load %struct.tiff*, %struct.tiff** %4, align 8
  %119 = getelementptr inbounds %struct.tiff, %struct.tiff* %118, i32 0, i32 6
  %120 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %119, i32 0, i32 0
  %121 = getelementptr inbounds [3 x i64], [3 x i64]* %120, i64 0, i64 1
  %122 = load i64, i64* %121, align 8
  %123 = and i64 %122, 8388608
  %124 = icmp ne i64 %123, 0
  br i1 %124, label %134, label %125

; <label>:125:                                    ; preds = %117
  %pgocount6 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 16)
  %126 = add i64 %pgocount6, 1
  store i64 %126, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 16)
  %127 = load %struct.tiff*, %struct.tiff** %4, align 8
  %128 = getelementptr inbounds %struct.tiff, %struct.tiff* %127, i32 0, i32 6
  %129 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %128, i32 0, i32 0
  %130 = getelementptr inbounds [3 x i64], [3 x i64]* %129, i64 0, i64 1
  %131 = load i64, i64* %130, align 8
  %132 = and i64 %131, 16777216
  %133 = icmp ne i64 %132, 0
  br i1 %133, label %134, label %146

; <label>:134:                                    ; preds = %125, %117
  %pgocount7 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 12)
  %135 = add i64 %pgocount7, 1
  store i64 %135, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 12)
  %136 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %137 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %138 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %137, i32 0, i32 67
  %139 = load i32, i32* %138, align 8
  %140 = zext i32 %139 to i64
  %141 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %142 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %141, i32 0, i32 68
  %143 = load i32, i32* %142, align 4
  %144 = zext i32 %143 to i64
  %145 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %136, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.11, i32 0, i32 0), i64 %140, i64 %144)
  br label %146

; <label>:146:                                    ; preds = %134, %125
  %147 = load %struct.tiff*, %struct.tiff** %4, align 8
  %148 = getelementptr inbounds %struct.tiff, %struct.tiff* %147, i32 0, i32 6
  %149 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %148, i32 0, i32 0
  %150 = getelementptr inbounds [3 x i64], [3 x i64]* %149, i64 0, i64 1
  %151 = load i64, i64* %150, align 8
  %152 = and i64 %151, 33554432
  %153 = icmp ne i64 %152, 0
  br i1 %153, label %154, label %160

; <label>:154:                                    ; preds = %146
  %pgocount8 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 17)
  %155 = add i64 %pgocount8, 1
  store i64 %155, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 17)
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %157 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %158 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %157, i32 0, i32 69
  %159 = load i8*, i8** %158, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %156, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i32 0, i32 0), i8* %159)
  br label %160

; <label>:160:                                    ; preds = %154, %146
  %161 = load %struct.tiff*, %struct.tiff** %4, align 8
  %162 = getelementptr inbounds %struct.tiff, %struct.tiff* %161, i32 0, i32 6
  %163 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %162, i32 0, i32 0
  %164 = getelementptr inbounds [3 x i64], [3 x i64]* %163, i64 0, i64 1
  %165 = load i64, i64* %164, align 8
  %166 = and i64 %165, 67108864
  %167 = icmp ne i64 %166, 0
  br i1 %167, label %168, label %174

; <label>:168:                                    ; preds = %160
  %pgocount9 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 18)
  %169 = add i64 %pgocount9, 1
  store i64 %169, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 18)
  %170 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %171 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %172 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %171, i32 0, i32 70
  %173 = load i8*, i8** %172, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %170, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.13, i32 0, i32 0), i8* %173)
  br label %174

; <label>:174:                                    ; preds = %168, %160
  %175 = load %struct.tiff*, %struct.tiff** %4, align 8
  %176 = getelementptr inbounds %struct.tiff, %struct.tiff* %175, i32 0, i32 6
  %177 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %176, i32 0, i32 0
  %178 = getelementptr inbounds [3 x i64], [3 x i64]* %177, i64 0, i64 1
  %179 = load i64, i64* %178, align 8
  %180 = and i64 %179, 134217728
  %181 = icmp ne i64 %180, 0
  br i1 %181, label %182, label %190

; <label>:182:                                    ; preds = %174
  %pgocount10 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 19)
  %183 = add i64 %pgocount10, 1
  store i64 %183, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 19)
  %184 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %185 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %186 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %185, i32 0, i32 71
  %187 = load float, float* %186, align 8
  %188 = fpext float %187 to double
  %189 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %184, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.14, i32 0, i32 0), double %188)
  br label %190

; <label>:190:                                    ; preds = %182, %174
  %191 = load %struct.tiff*, %struct.tiff** %4, align 8
  %192 = getelementptr inbounds %struct.tiff, %struct.tiff* %191, i32 0, i32 6
  %193 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %192, i32 0, i32 0
  %194 = getelementptr inbounds [3 x i64], [3 x i64]* %193, i64 0, i64 1
  %195 = load i64, i64* %194, align 8
  %196 = and i64 %195, 268435456
  %197 = icmp ne i64 %196, 0
  br i1 %197, label %198, label %286

; <label>:198:                                    ; preds = %190
  %pgocount11 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 20)
  %199 = add i64 %pgocount11, 1
  store i64 %199, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 20)
  %200 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %201 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %200, i32 0, i32 72
  %202 = load float*, float** %201, align 8
  %203 = bitcast float* %202 to [4 x [4 x float]]*
  store [4 x [4 x float]]* %203, [4 x [4 x float]]** %12, align 8
  %204 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %205 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %206 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %205, i64 0, i64 0
  %207 = getelementptr inbounds [4 x float], [4 x float]* %206, i64 0, i64 0
  %208 = load float, float* %207, align 4
  %209 = fpext float %208 to double
  %210 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %211 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %210, i64 0, i64 0
  %212 = getelementptr inbounds [4 x float], [4 x float]* %211, i64 0, i64 1
  %213 = load float, float* %212, align 4
  %214 = fpext float %213 to double
  %215 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %216 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %215, i64 0, i64 0
  %217 = getelementptr inbounds [4 x float], [4 x float]* %216, i64 0, i64 2
  %218 = load float, float* %217, align 4
  %219 = fpext float %218 to double
  %220 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %221 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %220, i64 0, i64 0
  %222 = getelementptr inbounds [4 x float], [4 x float]* %221, i64 0, i64 3
  %223 = load float, float* %222, align 4
  %224 = fpext float %223 to double
  %225 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %226 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %225, i64 0, i64 1
  %227 = getelementptr inbounds [4 x float], [4 x float]* %226, i64 0, i64 0
  %228 = load float, float* %227, align 4
  %229 = fpext float %228 to double
  %230 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %231 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %230, i64 0, i64 1
  %232 = getelementptr inbounds [4 x float], [4 x float]* %231, i64 0, i64 1
  %233 = load float, float* %232, align 4
  %234 = fpext float %233 to double
  %235 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %236 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %235, i64 0, i64 1
  %237 = getelementptr inbounds [4 x float], [4 x float]* %236, i64 0, i64 2
  %238 = load float, float* %237, align 4
  %239 = fpext float %238 to double
  %240 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %241 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %240, i64 0, i64 1
  %242 = getelementptr inbounds [4 x float], [4 x float]* %241, i64 0, i64 3
  %243 = load float, float* %242, align 4
  %244 = fpext float %243 to double
  %245 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %246 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %245, i64 0, i64 2
  %247 = getelementptr inbounds [4 x float], [4 x float]* %246, i64 0, i64 0
  %248 = load float, float* %247, align 4
  %249 = fpext float %248 to double
  %250 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %251 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %250, i64 0, i64 2
  %252 = getelementptr inbounds [4 x float], [4 x float]* %251, i64 0, i64 1
  %253 = load float, float* %252, align 4
  %254 = fpext float %253 to double
  %255 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %256 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %255, i64 0, i64 2
  %257 = getelementptr inbounds [4 x float], [4 x float]* %256, i64 0, i64 2
  %258 = load float, float* %257, align 4
  %259 = fpext float %258 to double
  %260 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %261 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %260, i64 0, i64 2
  %262 = getelementptr inbounds [4 x float], [4 x float]* %261, i64 0, i64 3
  %263 = load float, float* %262, align 4
  %264 = fpext float %263 to double
  %265 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %266 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %265, i64 0, i64 3
  %267 = getelementptr inbounds [4 x float], [4 x float]* %266, i64 0, i64 0
  %268 = load float, float* %267, align 4
  %269 = fpext float %268 to double
  %270 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %271 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %270, i64 0, i64 3
  %272 = getelementptr inbounds [4 x float], [4 x float]* %271, i64 0, i64 1
  %273 = load float, float* %272, align 4
  %274 = fpext float %273 to double
  %275 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %276 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %275, i64 0, i64 3
  %277 = getelementptr inbounds [4 x float], [4 x float]* %276, i64 0, i64 2
  %278 = load float, float* %277, align 4
  %279 = fpext float %278 to double
  %280 = load [4 x [4 x float]]*, [4 x [4 x float]]** %12, align 8
  %281 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %280, i64 0, i64 3
  %282 = getelementptr inbounds [4 x float], [4 x float]* %281, i64 0, i64 3
  %283 = load float, float* %282, align 4
  %284 = fpext float %283 to double
  %285 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %204, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.15, i32 0, i32 0), double %209, double %214, double %219, double %224, double %229, double %234, double %239, double %244, double %249, double %254, double %259, double %264, double %269, double %274, double %279, double %284)
  br label %286

; <label>:286:                                    ; preds = %198, %190
  %287 = load %struct.tiff*, %struct.tiff** %4, align 8
  %288 = getelementptr inbounds %struct.tiff, %struct.tiff* %287, i32 0, i32 6
  %289 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %288, i32 0, i32 0
  %290 = getelementptr inbounds [3 x i64], [3 x i64]* %289, i64 0, i64 1
  %291 = load i64, i64* %290, align 8
  %292 = and i64 %291, 536870912
  %293 = icmp ne i64 %292, 0
  br i1 %293, label %294, label %382

; <label>:294:                                    ; preds = %286
  %pgocount12 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 21)
  %295 = add i64 %pgocount12, 1
  store i64 %295, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 21)
  %296 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %297 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %296, i32 0, i32 73
  %298 = load float*, float** %297, align 8
  %299 = bitcast float* %298 to [4 x [4 x float]]*
  store [4 x [4 x float]]* %299, [4 x [4 x float]]** %13, align 8
  %300 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %301 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %302 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %301, i64 0, i64 0
  %303 = getelementptr inbounds [4 x float], [4 x float]* %302, i64 0, i64 0
  %304 = load float, float* %303, align 4
  %305 = fpext float %304 to double
  %306 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %307 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %306, i64 0, i64 0
  %308 = getelementptr inbounds [4 x float], [4 x float]* %307, i64 0, i64 1
  %309 = load float, float* %308, align 4
  %310 = fpext float %309 to double
  %311 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %312 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %311, i64 0, i64 0
  %313 = getelementptr inbounds [4 x float], [4 x float]* %312, i64 0, i64 2
  %314 = load float, float* %313, align 4
  %315 = fpext float %314 to double
  %316 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %317 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %316, i64 0, i64 0
  %318 = getelementptr inbounds [4 x float], [4 x float]* %317, i64 0, i64 3
  %319 = load float, float* %318, align 4
  %320 = fpext float %319 to double
  %321 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %322 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %321, i64 0, i64 1
  %323 = getelementptr inbounds [4 x float], [4 x float]* %322, i64 0, i64 0
  %324 = load float, float* %323, align 4
  %325 = fpext float %324 to double
  %326 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %327 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %326, i64 0, i64 1
  %328 = getelementptr inbounds [4 x float], [4 x float]* %327, i64 0, i64 1
  %329 = load float, float* %328, align 4
  %330 = fpext float %329 to double
  %331 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %332 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %331, i64 0, i64 1
  %333 = getelementptr inbounds [4 x float], [4 x float]* %332, i64 0, i64 2
  %334 = load float, float* %333, align 4
  %335 = fpext float %334 to double
  %336 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %337 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %336, i64 0, i64 1
  %338 = getelementptr inbounds [4 x float], [4 x float]* %337, i64 0, i64 3
  %339 = load float, float* %338, align 4
  %340 = fpext float %339 to double
  %341 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %342 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %341, i64 0, i64 2
  %343 = getelementptr inbounds [4 x float], [4 x float]* %342, i64 0, i64 0
  %344 = load float, float* %343, align 4
  %345 = fpext float %344 to double
  %346 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %347 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %346, i64 0, i64 2
  %348 = getelementptr inbounds [4 x float], [4 x float]* %347, i64 0, i64 1
  %349 = load float, float* %348, align 4
  %350 = fpext float %349 to double
  %351 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %352 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %351, i64 0, i64 2
  %353 = getelementptr inbounds [4 x float], [4 x float]* %352, i64 0, i64 2
  %354 = load float, float* %353, align 4
  %355 = fpext float %354 to double
  %356 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %357 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %356, i64 0, i64 2
  %358 = getelementptr inbounds [4 x float], [4 x float]* %357, i64 0, i64 3
  %359 = load float, float* %358, align 4
  %360 = fpext float %359 to double
  %361 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %362 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %361, i64 0, i64 3
  %363 = getelementptr inbounds [4 x float], [4 x float]* %362, i64 0, i64 0
  %364 = load float, float* %363, align 4
  %365 = fpext float %364 to double
  %366 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %367 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %366, i64 0, i64 3
  %368 = getelementptr inbounds [4 x float], [4 x float]* %367, i64 0, i64 1
  %369 = load float, float* %368, align 4
  %370 = fpext float %369 to double
  %371 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %372 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %371, i64 0, i64 3
  %373 = getelementptr inbounds [4 x float], [4 x float]* %372, i64 0, i64 2
  %374 = load float, float* %373, align 4
  %375 = fpext float %374 to double
  %376 = load [4 x [4 x float]]*, [4 x [4 x float]]** %13, align 8
  %377 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %376, i64 0, i64 3
  %378 = getelementptr inbounds [4 x float], [4 x float]* %377, i64 0, i64 3
  %379 = load float, float* %378, align 4
  %380 = fpext float %379 to double
  %381 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %300, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.16, i32 0, i32 0), double %305, double %310, double %315, double %320, double %325, double %330, double %335, double %340, double %345, double %350, double %355, double %360, double %365, double %370, double %375, double %380)
  br label %382

; <label>:382:                                    ; preds = %294, %286
  %383 = load %struct.tiff*, %struct.tiff** %4, align 8
  %384 = getelementptr inbounds %struct.tiff, %struct.tiff* %383, i32 0, i32 6
  %385 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %384, i32 0, i32 0
  %386 = getelementptr inbounds [3 x i64], [3 x i64]* %385, i64 0, i64 0
  %387 = load i64, i64* %386, align 8
  %388 = and i64 %387, 4
  %389 = icmp ne i64 %388, 0
  br i1 %389, label %390, label %420

; <label>:390:                                    ; preds = %382
  %391 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %392 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %393 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %392, i32 0, i32 4
  %394 = load i32, i32* %393, align 4
  %395 = zext i32 %394 to i64
  %396 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %397 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %396, i32 0, i32 5
  %398 = load i32, i32* %397, align 8
  %399 = zext i32 %398 to i64
  %400 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %391, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.17, i32 0, i32 0), i64 %395, i64 %399)
  %401 = load %struct.tiff*, %struct.tiff** %4, align 8
  %402 = getelementptr inbounds %struct.tiff, %struct.tiff* %401, i32 0, i32 6
  %403 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %402, i32 0, i32 0
  %404 = getelementptr inbounds [3 x i64], [3 x i64]* %403, i64 0, i64 1
  %405 = load i64, i64* %404, align 8
  %406 = and i64 %405, 16
  %407 = icmp ne i64 %406, 0
  br i1 %407, label %408, label %416

; <label>:408:                                    ; preds = %390
  %pgocount13 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 65)
  %409 = add i64 %pgocount13, 1
  store i64 %409, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 65)
  %410 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %411 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %412 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %411, i32 0, i32 6
  %413 = load i32, i32* %412, align 4
  %414 = zext i32 %413 to i64
  %415 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %410, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.18, i32 0, i32 0), i64 %414)
  br label %416

; <label>:416:                                    ; preds = %408, %390
  %pgocount14 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 22)
  %417 = add i64 %pgocount14, 1
  store i64 %417, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 22)
  %418 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %419 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %418, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  br label %420

; <label>:420:                                    ; preds = %416, %382
  %421 = load %struct.tiff*, %struct.tiff** %4, align 8
  %422 = getelementptr inbounds %struct.tiff, %struct.tiff* %421, i32 0, i32 6
  %423 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %422, i32 0, i32 0
  %424 = getelementptr inbounds [3 x i64], [3 x i64]* %423, i64 0, i64 0
  %425 = load i64, i64* %424, align 8
  %426 = and i64 %425, 8
  %427 = icmp ne i64 %426, 0
  br i1 %427, label %428, label %480

; <label>:428:                                    ; preds = %420
  %429 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %430 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %431 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %430, i32 0, i32 21
  %432 = load float, float* %431, align 8
  %433 = fpext float %432 to double
  %434 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %435 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %434, i32 0, i32 22
  %436 = load float, float* %435, align 4
  %437 = fpext float %436 to double
  %438 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %429, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.19, i32 0, i32 0), double %433, double %437)
  %439 = load %struct.tiff*, %struct.tiff** %4, align 8
  %440 = getelementptr inbounds %struct.tiff, %struct.tiff* %439, i32 0, i32 6
  %441 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %440, i32 0, i32 0
  %442 = getelementptr inbounds [3 x i64], [3 x i64]* %441, i64 0, i64 0
  %443 = load i64, i64* %442, align 8
  %444 = and i64 %443, 4194304
  %445 = icmp ne i64 %444, 0
  br i1 %445, label %446, label %476

; <label>:446:                                    ; preds = %428
  %447 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %448 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %447, i32 0, i32 23
  %449 = load i16, i16* %448, align 8
  %450 = zext i16 %449 to i32
  switch i32 %450, label %463 [
    i32 1, label %451
    i32 2, label %455
    i32 3, label %459
  ]

; <label>:451:                                    ; preds = %446
  %pgocount15 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 101)
  %452 = add i64 %pgocount15, 1
  store i64 %452, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 101)
  %453 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %454 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %453, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.20, i32 0, i32 0))
  br label %475

; <label>:455:                                    ; preds = %446
  %pgocount16 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 99)
  %456 = add i64 %pgocount16, 1
  store i64 %456, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 99)
  %457 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %458 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %457, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.21, i32 0, i32 0))
  br label %475

; <label>:459:                                    ; preds = %446
  %pgocount17 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 100)
  %460 = add i64 %pgocount17, 1
  store i64 %460, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 100)
  %461 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %462 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %461, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.22, i32 0, i32 0))
  br label %475

; <label>:463:                                    ; preds = %446
  %pgocount18 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 102)
  %464 = add i64 %pgocount18, 1
  store i64 %464, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 102)
  %465 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %466 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %467 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %466, i32 0, i32 23
  %468 = load i16, i16* %467, align 8
  %469 = zext i16 %468 to i32
  %470 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %471 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %470, i32 0, i32 23
  %472 = load i16, i16* %471, align 8
  %473 = zext i16 %472 to i32
  %474 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %465, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.23, i32 0, i32 0), i32 %469, i32 %473)
  br label %475

; <label>:475:                                    ; preds = %463, %459, %455, %451
  br label %476

; <label>:476:                                    ; preds = %475, %428
  %pgocount19 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 23)
  %477 = add i64 %pgocount19, 1
  store i64 %477, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 23)
  %478 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %479 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %478, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  br label %480

; <label>:480:                                    ; preds = %476, %420
  %481 = load %struct.tiff*, %struct.tiff** %4, align 8
  %482 = getelementptr inbounds %struct.tiff, %struct.tiff* %481, i32 0, i32 6
  %483 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %482, i32 0, i32 0
  %484 = getelementptr inbounds [3 x i64], [3 x i64]* %483, i64 0, i64 0
  %485 = load i64, i64* %484, align 8
  %486 = and i64 %485, 16
  %487 = icmp ne i64 %486, 0
  br i1 %487, label %488, label %500

; <label>:488:                                    ; preds = %480
  %pgocount20 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 24)
  %489 = add i64 %pgocount20, 1
  store i64 %489, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 24)
  %490 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %491 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %492 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %491, i32 0, i32 25
  %493 = load float, float* %492, align 4
  %494 = fpext float %493 to double
  %495 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %496 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %495, i32 0, i32 26
  %497 = load float, float* %496, align 8
  %498 = fpext float %497 to double
  %499 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %490, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.24, i32 0, i32 0), double %494, double %498)
  br label %500

; <label>:500:                                    ; preds = %488, %480
  %501 = load %struct.tiff*, %struct.tiff** %4, align 8
  %502 = getelementptr inbounds %struct.tiff, %struct.tiff* %501, i32 0, i32 6
  %503 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %502, i32 0, i32 0
  %504 = getelementptr inbounds [3 x i64], [3 x i64]* %503, i64 0, i64 0
  %505 = load i64, i64* %504, align 8
  %506 = and i64 %505, 64
  %507 = icmp ne i64 %506, 0
  br i1 %507, label %508, label %516

; <label>:508:                                    ; preds = %500
  %pgocount21 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 25)
  %509 = add i64 %pgocount21, 1
  store i64 %509, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 25)
  %510 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %511 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %512 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %511, i32 0, i32 8
  %513 = load i16, i16* %512, align 4
  %514 = zext i16 %513 to i32
  %515 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %510, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.25, i32 0, i32 0), i32 %514)
  br label %516

; <label>:516:                                    ; preds = %508, %500
  %517 = load %struct.tiff*, %struct.tiff** %4, align 8
  %518 = getelementptr inbounds %struct.tiff, %struct.tiff* %517, i32 0, i32 6
  %519 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %518, i32 0, i32 0
  %520 = getelementptr inbounds [3 x i64], [3 x i64]* %519, i64 0, i64 1
  %521 = load i64, i64* %520, align 8
  %522 = and i64 %521, 1
  %523 = icmp ne i64 %522, 0
  br i1 %523, label %524, label %560

; <label>:524:                                    ; preds = %516
  %525 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %526 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %525, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.26, i32 0, i32 0))
  %527 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %528 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %527, i32 0, i32 9
  %529 = load i16, i16* %528, align 2
  %530 = zext i16 %529 to i32
  switch i32 %530, label %547 [
    i32 4, label %531
    i32 2, label %535
    i32 1, label %539
    i32 3, label %543
  ]

; <label>:531:                                    ; preds = %524
  %pgocount22 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 91)
  %532 = add i64 %pgocount22, 1
  store i64 %532, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 91)
  %533 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %534 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %533, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.27, i32 0, i32 0))
  br label %559

; <label>:535:                                    ; preds = %524
  %pgocount23 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 92)
  %536 = add i64 %pgocount23, 1
  store i64 %536, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 92)
  %537 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %538 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %537, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.28, i32 0, i32 0))
  br label %559

; <label>:539:                                    ; preds = %524
  %pgocount24 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 93)
  %540 = add i64 %pgocount24, 1
  store i64 %540, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 93)
  %541 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %542 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %541, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.29, i32 0, i32 0))
  br label %559

; <label>:543:                                    ; preds = %524
  %pgocount25 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 94)
  %544 = add i64 %pgocount25, 1
  store i64 %544, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 94)
  %545 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %546 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %545, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.30, i32 0, i32 0))
  br label %559

; <label>:547:                                    ; preds = %524
  %pgocount26 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 95)
  %548 = add i64 %pgocount26, 1
  store i64 %548, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 95)
  %549 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %550 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %551 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %550, i32 0, i32 9
  %552 = load i16, i16* %551, align 2
  %553 = zext i16 %552 to i32
  %554 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %555 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %554, i32 0, i32 9
  %556 = load i16, i16* %555, align 2
  %557 = zext i16 %556 to i32
  %558 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %549, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i32 0, i32 0), i32 %553, i32 %557)
  br label %559

; <label>:559:                                    ; preds = %547, %543, %539, %535, %531
  br label %560

; <label>:560:                                    ; preds = %559, %516
  %561 = load %struct.tiff*, %struct.tiff** %4, align 8
  %562 = getelementptr inbounds %struct.tiff, %struct.tiff* %561, i32 0, i32 6
  %563 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %562, i32 0, i32 0
  %564 = getelementptr inbounds [3 x i64], [3 x i64]* %563, i64 0, i64 0
  %565 = load i64, i64* %564, align 8
  %566 = and i64 %565, 128
  %567 = icmp ne i64 %566, 0
  br i1 %567, label %568, label %597

; <label>:568:                                    ; preds = %560
  %569 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %570 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %569, i32 0, i32 10
  %571 = load i16, i16* %570, align 8
  %572 = call %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext %571)
  store %struct.TIFFCodec* %572, %struct.TIFFCodec** %14, align 8
  %573 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %574 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %573, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.32, i32 0, i32 0))
  %575 = load %struct.TIFFCodec*, %struct.TIFFCodec** %14, align 8
  %576 = icmp ne %struct.TIFFCodec* %575, null
  br i1 %576, label %577, label %584

; <label>:577:                                    ; preds = %568
  %pgocount27 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 58)
  %578 = add i64 %pgocount27, 1
  store i64 %578, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 58)
  %579 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %580 = load %struct.TIFFCodec*, %struct.TIFFCodec** %14, align 8
  %581 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %580, i32 0, i32 0
  %582 = load i8*, i8** %581, align 8
  %583 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %579, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i32 0, i32 0), i8* %582)
  br label %596

; <label>:584:                                    ; preds = %568
  %pgocount28 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 76)
  %585 = add i64 %pgocount28, 1
  store i64 %585, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 76)
  %586 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %587 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %588 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %587, i32 0, i32 10
  %589 = load i16, i16* %588, align 8
  %590 = zext i16 %589 to i32
  %591 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %592 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %591, i32 0, i32 10
  %593 = load i16, i16* %592, align 8
  %594 = zext i16 %593 to i32
  %595 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %586, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i32 0, i32 0), i32 %590, i32 %594)
  br label %596

; <label>:596:                                    ; preds = %584, %577
  br label %597

; <label>:597:                                    ; preds = %596, %560
  %598 = load %struct.tiff*, %struct.tiff** %4, align 8
  %599 = getelementptr inbounds %struct.tiff, %struct.tiff* %598, i32 0, i32 6
  %600 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %599, i32 0, i32 0
  %601 = getelementptr inbounds [3 x i64], [3 x i64]* %600, i64 0, i64 0
  %602 = load i64, i64* %601, align 8
  %603 = and i64 %602, 256
  %604 = icmp ne i64 %603, 0
  br i1 %604, label %605, label %650

; <label>:605:                                    ; preds = %597
  %606 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %607 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %606, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.34, i32 0, i32 0))
  %608 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %609 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %608, i32 0, i32 11
  %610 = load i16, i16* %609, align 2
  %611 = zext i16 %610 to i64
  %612 = icmp ult i64 %611, 9
  br i1 %612, label %613, label %623

; <label>:613:                                    ; preds = %605
  %pgocount29 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 66)
  %614 = add i64 %pgocount29, 1
  store i64 %614, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 66)
  %615 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %616 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %617 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %616, i32 0, i32 11
  %618 = load i16, i16* %617, align 2
  %619 = zext i16 %618 to i64
  %620 = getelementptr inbounds [9 x i8*], [9 x i8*]* @photoNames, i64 0, i64 %619
  %621 = load i8*, i8** %620, align 8
  %622 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %615, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i32 0, i32 0), i8* %621)
  br label %649

; <label>:623:                                    ; preds = %605
  %624 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %625 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %624, i32 0, i32 11
  %626 = load i16, i16* %625, align 2
  %627 = zext i16 %626 to i32
  switch i32 %627, label %636 [
    i32 32844, label %628
    i32 32845, label %632
  ]

; <label>:628:                                    ; preds = %623
  %pgocount30 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 96)
  %629 = add i64 %pgocount30, 1
  store i64 %629, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 96)
  %630 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %631 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %630, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.35, i32 0, i32 0))
  br label %648

; <label>:632:                                    ; preds = %623
  %pgocount31 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 97)
  %633 = add i64 %pgocount31, 1
  store i64 %633, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 97)
  %634 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %635 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %634, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.36, i32 0, i32 0))
  br label %648

; <label>:636:                                    ; preds = %623
  %pgocount32 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 98)
  %637 = add i64 %pgocount32, 1
  store i64 %637, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 98)
  %638 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %639 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %640 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %639, i32 0, i32 11
  %641 = load i16, i16* %640, align 2
  %642 = zext i16 %641 to i32
  %643 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %644 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %643, i32 0, i32 11
  %645 = load i16, i16* %644, align 2
  %646 = zext i16 %645 to i32
  %647 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %638, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i32 0, i32 0), i32 %642, i32 %646)
  br label %648

; <label>:648:                                    ; preds = %636, %632, %628
  br label %649

; <label>:649:                                    ; preds = %648, %613
  br label %650

; <label>:650:                                    ; preds = %649, %597
  %651 = load %struct.tiff*, %struct.tiff** %4, align 8
  %652 = getelementptr inbounds %struct.tiff, %struct.tiff* %651, i32 0, i32 6
  %653 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %652, i32 0, i32 0
  %654 = getelementptr inbounds [3 x i64], [3 x i64]* %653, i64 0, i64 0
  %655 = load i64, i64* %654, align 8
  %656 = and i64 %655, 2147483648
  %657 = icmp ne i64 %656, 0
  br i1 %657, label %658, label %733

; <label>:658:                                    ; preds = %650
  %pgocount33 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 26)
  %659 = add i64 %pgocount33, 1
  store i64 %659, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 26)
  %660 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %661 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %660, i32 0, i32 30
  %662 = load i16, i16* %661, align 4
  %663 = zext i16 %662 to i32
  %664 = icmp ne i32 %663, 0
  br i1 %664, label %665, label %733

; <label>:665:                                    ; preds = %658
  %666 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %667 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %668 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %667, i32 0, i32 30
  %669 = load i16, i16* %668, align 4
  %670 = zext i16 %669 to i32
  %671 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %666, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.37, i32 0, i32 0), i32 %670)
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.38, i32 0, i32 0), i8** %8, align 8
  store i16 0, i16* %9, align 2
  br label %672

; <label>:672:                                    ; preds = %726, %665
  %673 = load i16, i16* %9, align 2
  %674 = zext i16 %673 to i32
  %675 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %676 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %675, i32 0, i32 30
  %677 = load i16, i16* %676, align 4
  %678 = zext i16 %677 to i32
  %679 = icmp slt i32 %674, %678
  br i1 %679, label %680, label %729

; <label>:680:                                    ; preds = %672
  %681 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %682 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %681, i32 0, i32 31
  %683 = load i16*, i16** %682, align 8
  %684 = load i16, i16* %9, align 2
  %685 = zext i16 %684 to i64
  %686 = getelementptr inbounds i16, i16* %683, i64 %685
  %687 = load i16, i16* %686, align 2
  %688 = zext i16 %687 to i32
  switch i32 %688, label %704 [
    i32 0, label %689
    i32 1, label %694
    i32 2, label %699
  ]

; <label>:689:                                    ; preds = %680
  %pgocount34 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 9)
  %690 = add i64 %pgocount34, 1
  store i64 %690, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 9)
  %691 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %692 = load i8*, i8** %8, align 8
  %693 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %691, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.39, i32 0, i32 0), i8* %692)
  br label %725

; <label>:694:                                    ; preds = %680
  %pgocount35 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 7)
  %695 = add i64 %pgocount35, 1
  store i64 %695, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 7)
  %696 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %697 = load i8*, i8** %8, align 8
  %698 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %696, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.40, i32 0, i32 0), i8* %697)
  br label %725

; <label>:699:                                    ; preds = %680
  %pgocount36 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 8)
  %700 = add i64 %pgocount36, 1
  store i64 %700, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 8)
  %701 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %702 = load i8*, i8** %8, align 8
  %703 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %701, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.41, i32 0, i32 0), i8* %702)
  br label %725

; <label>:704:                                    ; preds = %680
  %pgocount37 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 10)
  %705 = add i64 %pgocount37, 1
  store i64 %705, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 10)
  %706 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %707 = load i8*, i8** %8, align 8
  %708 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %709 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %708, i32 0, i32 31
  %710 = load i16*, i16** %709, align 8
  %711 = load i16, i16* %9, align 2
  %712 = zext i16 %711 to i64
  %713 = getelementptr inbounds i16, i16* %710, i64 %712
  %714 = load i16, i16* %713, align 2
  %715 = zext i16 %714 to i32
  %716 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %717 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %716, i32 0, i32 31
  %718 = load i16*, i16** %717, align 8
  %719 = load i16, i16* %9, align 2
  %720 = zext i16 %719 to i64
  %721 = getelementptr inbounds i16, i16* %718, i64 %720
  %722 = load i16, i16* %721, align 2
  %723 = zext i16 %722 to i32
  %724 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %706, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.42, i32 0, i32 0), i8* %707, i32 %715, i32 %723)
  br label %725

; <label>:725:                                    ; preds = %704, %699, %694, %689
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0), i8** %8, align 8
  br label %726

; <label>:726:                                    ; preds = %725
  %727 = load i16, i16* %9, align 2
  %728 = add i16 %727, 1
  store i16 %728, i16* %9, align 2
  br label %672

; <label>:729:                                    ; preds = %672
  %pgocount38 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 59)
  %730 = add i64 %pgocount38, 1
  store i64 %730, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 59)
  %731 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %732 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %731, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.44, i32 0, i32 0))
  br label %733

; <label>:733:                                    ; preds = %729, %658, %650
  %734 = load %struct.tiff*, %struct.tiff** %4, align 8
  %735 = getelementptr inbounds %struct.tiff, %struct.tiff* %734, i32 0, i32 6
  %736 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %735, i32 0, i32 0
  %737 = getelementptr inbounds [3 x i64], [3 x i64]* %736, i64 0, i64 1
  %738 = load i64, i64* %737, align 8
  %739 = and i64 %738, 4194304
  %740 = icmp ne i64 %739, 0
  br i1 %740, label %741, label %748

; <label>:741:                                    ; preds = %733
  %pgocount39 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 27)
  %742 = add i64 %pgocount39, 1
  store i64 %742, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 27)
  %743 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %744 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %745 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %744, i32 0, i32 32
  %746 = load double, double* %745, align 8
  %747 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %743, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.45, i32 0, i32 0), double %746)
  br label %748

; <label>:748:                                    ; preds = %741, %733
  %749 = load %struct.tiff*, %struct.tiff** %4, align 8
  %750 = getelementptr inbounds %struct.tiff, %struct.tiff* %749, i32 0, i32 6
  %751 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %750, i32 0, i32 0
  %752 = getelementptr inbounds [3 x i64], [3 x i64]* %751, i64 0, i64 1
  %753 = load i64, i64* %752, align 8
  %754 = and i64 %753, 8192
  %755 = icmp ne i64 %754, 0
  br i1 %755, label %756, label %780

; <label>:756:                                    ; preds = %748
  %757 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %758 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %757, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0))
  %759 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %760 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %759, i32 0, i32 55
  %761 = load i16, i16* %760, align 8
  %762 = zext i16 %761 to i32
  switch i32 %762, label %767 [
    i32 1, label %763
  ]

; <label>:763:                                    ; preds = %756
  %pgocount40 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 67)
  %764 = add i64 %pgocount40, 1
  store i64 %764, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 67)
  %765 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %766 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %765, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.47, i32 0, i32 0))
  br label %779

; <label>:767:                                    ; preds = %756
  %pgocount41 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 68)
  %768 = add i64 %pgocount41, 1
  store i64 %768, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 68)
  %769 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %770 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %771 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %770, i32 0, i32 55
  %772 = load i16, i16* %771, align 8
  %773 = zext i16 %772 to i32
  %774 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %775 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %774, i32 0, i32 55
  %776 = load i16, i16* %775, align 8
  %777 = zext i16 %776 to i32
  %778 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %769, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i32 0, i32 0), i32 %773, i32 %777)
  br label %779

; <label>:779:                                    ; preds = %767, %763
  br label %780

; <label>:780:                                    ; preds = %779, %748
  %781 = load %struct.tiff*, %struct.tiff** %4, align 8
  %782 = getelementptr inbounds %struct.tiff, %struct.tiff* %781, i32 0, i32 6
  %783 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %782, i32 0, i32 0
  %784 = getelementptr inbounds [3 x i64], [3 x i64]* %783, i64 0, i64 1
  %785 = load i64, i64* %784, align 8
  %786 = and i64 %785, 16384
  %787 = icmp ne i64 %786, 0
  br i1 %787, label %788, label %816

; <label>:788:                                    ; preds = %780
  %789 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %790 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %789, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.48, i32 0, i32 0))
  %791 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %792 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %791, i32 0, i32 15
  %793 = load i16, i16* %792, align 2
  store i16 %793, i16* %9, align 2
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.38, i32 0, i32 0), i8** %8, align 8
  %794 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %795 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %794, i32 0, i32 59
  %796 = load i8*, i8** %795, align 8
  store i8* %796, i8** %15, align 8
  br label %797

; <label>:797:                                    ; preds = %807, %788
  %798 = load i16, i16* %9, align 2
  %799 = zext i16 %798 to i32
  %800 = icmp sgt i32 %799, 0
  br i1 %800, label %801, label %814

; <label>:801:                                    ; preds = %797
  %802 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %803 = load i8*, i8** %8, align 8
  %804 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %802, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.49, i32 0, i32 0), i8* %803)
  %805 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %806 = load i8*, i8** %15, align 8
  call void @_TIFFprintAscii(%struct._IO_FILE* %805, i8* %806)
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0), i8** %8, align 8
  br label %807

; <label>:807:                                    ; preds = %801
  %pgocount42 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 1)
  %808 = add i64 %pgocount42, 1
  store i64 %808, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 1)
  %809 = load i8*, i8** %15, align 8
  %810 = call i8* @strchr(i8* %809, i32 0) #5
  %811 = getelementptr inbounds i8, i8* %810, i64 1
  store i8* %811, i8** %15, align 8
  %812 = load i16, i16* %9, align 2
  %813 = add i16 %812, -1
  store i16 %813, i16* %9, align 2
  br label %797

; <label>:814:                                    ; preds = %797
  %pgocount43 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 28)
  %815 = add i64 %pgocount43, 1
  store i64 %815, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 28)
  br label %816

; <label>:816:                                    ; preds = %814, %780
  %817 = load %struct.tiff*, %struct.tiff** %4, align 8
  %818 = getelementptr inbounds %struct.tiff, %struct.tiff* %817, i32 0, i32 6
  %819 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %818, i32 0, i32 0
  %820 = getelementptr inbounds [3 x i64], [3 x i64]* %819, i64 0, i64 1
  %821 = load i64, i64* %820, align 8
  %822 = and i64 %821, 262144
  %823 = icmp ne i64 %822, 0
  br i1 %823, label %824, label %832

; <label>:824:                                    ; preds = %816
  %pgocount44 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 29)
  %825 = add i64 %pgocount44, 1
  store i64 %825, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 29)
  %826 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %827 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %828 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %827, i32 0, i32 56
  %829 = load i16, i16* %828, align 2
  %830 = zext i16 %829 to i32
  %831 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %826, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.50, i32 0, i32 0), i32 %830)
  br label %832

; <label>:832:                                    ; preds = %824, %816
  %833 = load %struct.tiff*, %struct.tiff** %4, align 8
  %834 = getelementptr inbounds %struct.tiff, %struct.tiff* %833, i32 0, i32 6
  %835 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %834, i32 0, i32 0
  %836 = getelementptr inbounds [3 x i64], [3 x i64]* %835, i64 0, i64 1
  %837 = load i64, i64* %836, align 8
  %838 = and i64 %837, 32768
  %839 = icmp ne i64 %838, 0
  br i1 %839, label %840, label %854

; <label>:840:                                    ; preds = %832
  %pgocount45 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 30)
  %841 = add i64 %pgocount45, 1
  store i64 %841, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 30)
  %842 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %843 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %844 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %843, i32 0, i32 57
  %845 = getelementptr inbounds [2 x i16], [2 x i16]* %844, i64 0, i64 0
  %846 = load i16, i16* %845, align 4
  %847 = zext i16 %846 to i32
  %848 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %849 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %848, i32 0, i32 57
  %850 = getelementptr inbounds [2 x i16], [2 x i16]* %849, i64 0, i64 1
  %851 = load i16, i16* %850, align 2
  %852 = zext i16 %851 to i32
  %853 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %842, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.51, i32 0, i32 0), i32 %847, i32 %852)
  br label %854

; <label>:854:                                    ; preds = %840, %832
  %855 = load %struct.tiff*, %struct.tiff** %4, align 8
  %856 = getelementptr inbounds %struct.tiff, %struct.tiff* %855, i32 0, i32 6
  %857 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %856, i32 0, i32 0
  %858 = getelementptr inbounds [3 x i64], [3 x i64]* %857, i64 0, i64 1
  %859 = load i64, i64* %858, align 8
  %860 = and i64 %859, 65536
  %861 = icmp ne i64 %860, 0
  br i1 %861, label %862, label %868

; <label>:862:                                    ; preds = %854
  %pgocount46 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 31)
  %863 = add i64 %pgocount46, 1
  store i64 %863, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 31)
  %864 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %865 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %866 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %865, i32 0, i32 60
  %867 = load i8*, i8** %866, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %864, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.52, i32 0, i32 0), i8* %867)
  br label %868

; <label>:868:                                    ; preds = %862, %854
  %869 = load %struct.tiff*, %struct.tiff** %4, align 8
  %870 = getelementptr inbounds %struct.tiff, %struct.tiff* %869, i32 0, i32 6
  %871 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %870, i32 0, i32 0
  %872 = getelementptr inbounds [3 x i64], [3 x i64]* %871, i64 0, i64 0
  %873 = load i64, i64* %872, align 8
  %874 = and i64 %873, 512
  %875 = icmp ne i64 %874, 0
  br i1 %875, label %876, label %908

; <label>:876:                                    ; preds = %868
  %877 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %878 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %877, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.53, i32 0, i32 0))
  %879 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %880 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %879, i32 0, i32 12
  %881 = load i16, i16* %880, align 4
  %882 = zext i16 %881 to i32
  switch i32 %882, label %895 [
    i32 1, label %883
    i32 2, label %887
    i32 3, label %891
  ]

; <label>:883:                                    ; preds = %876
  %pgocount47 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 89)
  %884 = add i64 %pgocount47, 1
  store i64 %884, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 89)
  %885 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %886 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %885, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.54, i32 0, i32 0))
  br label %907

; <label>:887:                                    ; preds = %876
  %pgocount48 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 87)
  %888 = add i64 %pgocount48, 1
  store i64 %888, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 87)
  %889 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %890 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %889, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.55, i32 0, i32 0))
  br label %907

; <label>:891:                                    ; preds = %876
  %pgocount49 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 88)
  %892 = add i64 %pgocount49, 1
  store i64 %892, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 88)
  %893 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %894 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %893, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.56, i32 0, i32 0))
  br label %907

; <label>:895:                                    ; preds = %876
  %pgocount50 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 90)
  %896 = add i64 %pgocount50, 1
  store i64 %896, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 90)
  %897 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %898 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %899 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %898, i32 0, i32 12
  %900 = load i16, i16* %899, align 4
  %901 = zext i16 %900 to i32
  %902 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %903 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %902, i32 0, i32 12
  %904 = load i16, i16* %903, align 4
  %905 = zext i16 %904 to i32
  %906 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %897, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i32 0, i32 0), i32 %901, i32 %905)
  br label %907

; <label>:907:                                    ; preds = %895, %891, %887, %883
  br label %908

; <label>:908:                                    ; preds = %907, %868
  %909 = load %struct.tiff*, %struct.tiff** %4, align 8
  %910 = getelementptr inbounds %struct.tiff, %struct.tiff* %909, i32 0, i32 6
  %911 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %910, i32 0, i32 0
  %912 = getelementptr inbounds [3 x i64], [3 x i64]* %911, i64 0, i64 0
  %913 = load i64, i64* %912, align 8
  %914 = and i64 %913, 1024
  %915 = icmp ne i64 %914, 0
  br i1 %915, label %916, label %944

; <label>:916:                                    ; preds = %908
  %917 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %918 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %917, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.57, i32 0, i32 0))
  %919 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %920 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %919, i32 0, i32 13
  %921 = load i16, i16* %920, align 2
  %922 = zext i16 %921 to i32
  switch i32 %922, label %931 [
    i32 1, label %923
    i32 2, label %927
  ]

; <label>:923:                                    ; preds = %916
  %pgocount51 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 78)
  %924 = add i64 %pgocount51, 1
  store i64 %924, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 78)
  %925 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %926 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %925, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.58, i32 0, i32 0))
  br label %943

; <label>:927:                                    ; preds = %916
  %pgocount52 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 79)
  %928 = add i64 %pgocount52, 1
  store i64 %928, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 79)
  %929 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %930 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %929, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.59, i32 0, i32 0))
  br label %943

; <label>:931:                                    ; preds = %916
  %pgocount53 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 80)
  %932 = add i64 %pgocount53, 1
  store i64 %932, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 80)
  %933 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %934 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %935 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %934, i32 0, i32 13
  %936 = load i16, i16* %935, align 2
  %937 = zext i16 %936 to i32
  %938 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %939 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %938, i32 0, i32 13
  %940 = load i16, i16* %939, align 2
  %941 = zext i16 %940 to i32
  %942 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %933, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i32 0, i32 0), i32 %937, i32 %941)
  br label %943

; <label>:943:                                    ; preds = %931, %927, %923
  br label %944

; <label>:944:                                    ; preds = %943, %908
  %945 = load %struct.tiff*, %struct.tiff** %4, align 8
  %946 = getelementptr inbounds %struct.tiff, %struct.tiff* %945, i32 0, i32 6
  %947 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %946, i32 0, i32 0
  %948 = getelementptr inbounds [3 x i64], [3 x i64]* %947, i64 0, i64 1
  %949 = load i64, i64* %948, align 8
  %950 = and i64 %949, 128
  %951 = icmp ne i64 %950, 0
  br i1 %951, label %952, label %966

; <label>:952:                                    ; preds = %944
  %pgocount54 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 32)
  %953 = add i64 %pgocount54, 1
  store i64 %953, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 32)
  %954 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %955 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %956 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %955, i32 0, i32 49
  %957 = getelementptr inbounds [2 x i16], [2 x i16]* %956, i64 0, i64 0
  %958 = load i16, i16* %957, align 8
  %959 = zext i16 %958 to i32
  %960 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %961 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %960, i32 0, i32 49
  %962 = getelementptr inbounds [2 x i16], [2 x i16]* %961, i64 0, i64 1
  %963 = load i16, i16* %962, align 2
  %964 = zext i16 %963 to i32
  %965 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %954, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.60, i32 0, i32 0), i32 %959, i32 %964)
  br label %966

; <label>:966:                                    ; preds = %952, %944
  %967 = load %struct.tiff*, %struct.tiff** %4, align 8
  %968 = getelementptr inbounds %struct.tiff, %struct.tiff* %967, i32 0, i32 6
  %969 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %968, i32 0, i32 0
  %970 = getelementptr inbounds [3 x i64], [3 x i64]* %969, i64 0, i64 1
  %971 = load i64, i64* %970, align 8
  %972 = and i64 %971, 256
  %973 = icmp ne i64 %972, 0
  br i1 %973, label %974, label %1002

; <label>:974:                                    ; preds = %966
  %975 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %976 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %975, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.61, i32 0, i32 0))
  %977 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %978 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %977, i32 0, i32 50
  %979 = load i16, i16* %978, align 4
  %980 = zext i16 %979 to i32
  switch i32 %980, label %989 [
    i32 1, label %981
    i32 2, label %985
  ]

; <label>:981:                                    ; preds = %974
  %pgocount55 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 81)
  %982 = add i64 %pgocount55, 1
  store i64 %982, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 81)
  %983 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %984 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %983, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.62, i32 0, i32 0))
  br label %1001

; <label>:985:                                    ; preds = %974
  %pgocount56 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 82)
  %986 = add i64 %pgocount56, 1
  store i64 %986, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 82)
  %987 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %988 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %987, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.63, i32 0, i32 0))
  br label %1001

; <label>:989:                                    ; preds = %974
  %pgocount57 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 83)
  %990 = add i64 %pgocount57, 1
  store i64 %990, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 83)
  %991 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %992 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %993 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %992, i32 0, i32 50
  %994 = load i16, i16* %993, align 4
  %995 = zext i16 %994 to i32
  %996 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %997 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %996, i32 0, i32 50
  %998 = load i16, i16* %997, align 4
  %999 = zext i16 %998 to i32
  %1000 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %991, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i32 0, i32 0), i32 %995, i32 %999)
  br label %1001

; <label>:1001:                                   ; preds = %989, %985, %981
  br label %1002

; <label>:1002:                                   ; preds = %1001, %966
  %1003 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1004 = getelementptr inbounds %struct.tiff, %struct.tiff* %1003, i32 0, i32 6
  %1005 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1004, i32 0, i32 0
  %1006 = getelementptr inbounds [3 x i64], [3 x i64]* %1005, i64 0, i64 1
  %1007 = load i64, i64* %1006, align 8
  %1008 = and i64 %1007, 64
  %1009 = icmp ne i64 %1008, 0
  br i1 %1009, label %1010, label %1032

; <label>:1010:                                   ; preds = %1002
  %pgocount58 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 33)
  %1011 = add i64 %pgocount58, 1
  store i64 %1011, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 33)
  %1012 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1013 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1014 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1013, i32 0, i32 48
  %1015 = load float*, float** %1014, align 8
  %1016 = getelementptr inbounds float, float* %1015, i64 0
  %1017 = load float, float* %1016, align 4
  %1018 = fpext float %1017 to double
  %1019 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1020 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1019, i32 0, i32 48
  %1021 = load float*, float** %1020, align 8
  %1022 = getelementptr inbounds float, float* %1021, i64 1
  %1023 = load float, float* %1022, align 4
  %1024 = fpext float %1023 to double
  %1025 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1026 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1025, i32 0, i32 48
  %1027 = load float*, float** %1026, align 8
  %1028 = getelementptr inbounds float, float* %1027, i64 2
  %1029 = load float, float* %1028, align 4
  %1030 = fpext float %1029 to double
  %1031 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1012, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.64, i32 0, i32 0), double %1018, double %1024, double %1030)
  br label %1032

; <label>:1032:                                   ; preds = %1010, %1002
  %1033 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1034 = getelementptr inbounds %struct.tiff, %struct.tiff* %1033, i32 0, i32 6
  %1035 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1034, i32 0, i32 0
  %1036 = getelementptr inbounds [3 x i64], [3 x i64]* %1035, i64 0, i64 1
  %1037 = load i64, i64* %1036, align 8
  %1038 = and i64 %1037, 32
  %1039 = icmp ne i64 %1038, 0
  br i1 %1039, label %1040, label %1054

; <label>:1040:                                   ; preds = %1032
  %pgocount59 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 34)
  %1041 = add i64 %pgocount59, 1
  store i64 %1041, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 34)
  %1042 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1043 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1044 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1043, i32 0, i32 29
  %1045 = getelementptr inbounds [2 x i16], [2 x i16]* %1044, i64 0, i64 0
  %1046 = load i16, i16* %1045, align 8
  %1047 = zext i16 %1046 to i32
  %1048 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1049 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1048, i32 0, i32 29
  %1050 = getelementptr inbounds [2 x i16], [2 x i16]* %1049, i64 0, i64 1
  %1051 = load i16, i16* %1050, align 2
  %1052 = zext i16 %1051 to i32
  %1053 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1042, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.65, i32 0, i32 0), i32 %1047, i32 %1052)
  br label %1054

; <label>:1054:                                   ; preds = %1040, %1032
  %1055 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1056 = getelementptr inbounds %struct.tiff, %struct.tiff* %1055, i32 0, i32 6
  %1057 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1056, i32 0, i32 0
  %1058 = getelementptr inbounds [3 x i64], [3 x i64]* %1057, i64 0, i64 0
  %1059 = load i64, i64* %1058, align 8
  %1060 = and i64 %1059, 134217728
  %1061 = icmp ne i64 %1060, 0
  br i1 %1061, label %1062, label %1068

; <label>:1062:                                   ; preds = %1054
  %pgocount60 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 35)
  %1063 = add i64 %pgocount60, 1
  store i64 %1063, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 35)
  %1064 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1065 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1066 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1065, i32 0, i32 34
  %1067 = load i8*, i8** %1066, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1064, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.66, i32 0, i32 0), i8* %1067)
  br label %1068

; <label>:1068:                                   ; preds = %1062, %1054
  %1069 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1070 = getelementptr inbounds %struct.tiff, %struct.tiff* %1069, i32 0, i32 6
  %1071 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1070, i32 0, i32 0
  %1072 = getelementptr inbounds [3 x i64], [3 x i64]* %1071, i64 0, i64 0
  %1073 = load i64, i64* %1072, align 8
  %1074 = and i64 %1073, 268435456
  %1075 = icmp ne i64 %1074, 0
  br i1 %1075, label %1076, label %1082

; <label>:1076:                                   ; preds = %1068
  %pgocount61 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 36)
  %1077 = add i64 %pgocount61, 1
  store i64 %1077, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 36)
  %1078 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1079 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1080 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1079, i32 0, i32 35
  %1081 = load i8*, i8** %1080, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1078, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.67, i32 0, i32 0), i8* %1081)
  br label %1082

; <label>:1082:                                   ; preds = %1076, %1068
  %1083 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1084 = getelementptr inbounds %struct.tiff, %struct.tiff* %1083, i32 0, i32 6
  %1085 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1084, i32 0, i32 0
  %1086 = getelementptr inbounds [3 x i64], [3 x i64]* %1085, i64 0, i64 0
  %1087 = load i64, i64* %1086, align 8
  %1088 = and i64 %1087, 536870912
  %1089 = icmp ne i64 %1088, 0
  br i1 %1089, label %1090, label %1096

; <label>:1090:                                   ; preds = %1082
  %pgocount62 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 37)
  %1091 = add i64 %pgocount62, 1
  store i64 %1091, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 37)
  %1092 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1093 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1094 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1093, i32 0, i32 36
  %1095 = load i8*, i8** %1094, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1092, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.68, i32 0, i32 0), i8* %1095)
  br label %1096

; <label>:1096:                                   ; preds = %1090, %1082
  %1097 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1098 = getelementptr inbounds %struct.tiff, %struct.tiff* %1097, i32 0, i32 6
  %1099 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1098, i32 0, i32 0
  %1100 = getelementptr inbounds [3 x i64], [3 x i64]* %1099, i64 0, i64 0
  %1101 = load i64, i64* %1100, align 8
  %1102 = and i64 %1101, 1073741824
  %1103 = icmp ne i64 %1102, 0
  br i1 %1103, label %1104, label %1110

; <label>:1104:                                   ; preds = %1096
  %pgocount63 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 38)
  %1105 = add i64 %pgocount63, 1
  store i64 %1105, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 38)
  %1106 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1107 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1108 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1107, i32 0, i32 40
  %1109 = load i8*, i8** %1108, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1106, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.69, i32 0, i32 0), i8* %1109)
  br label %1110

; <label>:1110:                                   ; preds = %1104, %1096
  %1111 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1112 = getelementptr inbounds %struct.tiff, %struct.tiff* %1111, i32 0, i32 6
  %1113 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1112, i32 0, i32 0
  %1114 = getelementptr inbounds [3 x i64], [3 x i64]* %1113, i64 0, i64 0
  %1115 = load i64, i64* %1114, align 8
  %1116 = and i64 %1115, 2048
  %1117 = icmp ne i64 %1116, 0
  br i1 %1117, label %1118, label %1124

; <label>:1118:                                   ; preds = %1110
  %pgocount64 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 39)
  %1119 = add i64 %pgocount64, 1
  store i64 %1119, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 39)
  %1120 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1121 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1122 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1121, i32 0, i32 33
  %1123 = load i8*, i8** %1122, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1120, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.70, i32 0, i32 0), i8* %1123)
  br label %1124

; <label>:1124:                                   ; preds = %1118, %1110
  %1125 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1126 = getelementptr inbounds %struct.tiff, %struct.tiff* %1125, i32 0, i32 6
  %1127 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1126, i32 0, i32 0
  %1128 = getelementptr inbounds [3 x i64], [3 x i64]* %1127, i64 0, i64 0
  %1129 = load i64, i64* %1128, align 8
  %1130 = and i64 %1129, 4096
  %1131 = icmp ne i64 %1130, 0
  br i1 %1131, label %1132, label %1138

; <label>:1132:                                   ; preds = %1124
  %pgocount65 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 40)
  %1133 = add i64 %pgocount65, 1
  store i64 %1133, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 40)
  %1134 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1135 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1136 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1135, i32 0, i32 37
  %1137 = load i8*, i8** %1136, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1134, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.71, i32 0, i32 0), i8* %1137)
  br label %1138

; <label>:1138:                                   ; preds = %1132, %1124
  %1139 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1140 = getelementptr inbounds %struct.tiff, %struct.tiff* %1139, i32 0, i32 6
  %1141 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1140, i32 0, i32 0
  %1142 = getelementptr inbounds [3 x i64], [3 x i64]* %1141, i64 0, i64 0
  %1143 = load i64, i64* %1142, align 8
  %1144 = and i64 %1143, 8192
  %1145 = icmp ne i64 %1144, 0
  br i1 %1145, label %1146, label %1152

; <label>:1146:                                   ; preds = %1138
  %pgocount66 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 41)
  %1147 = add i64 %pgocount66, 1
  store i64 %1147, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 41)
  %1148 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1149 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1150 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1149, i32 0, i32 38
  %1151 = load i8*, i8** %1150, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1148, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.72, i32 0, i32 0), i8* %1151)
  br label %1152

; <label>:1152:                                   ; preds = %1146, %1138
  %1153 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1154 = getelementptr inbounds %struct.tiff, %struct.tiff* %1153, i32 0, i32 6
  %1155 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1154, i32 0, i32 0
  %1156 = getelementptr inbounds [3 x i64], [3 x i64]* %1155, i64 0, i64 0
  %1157 = load i64, i64* %1156, align 8
  %1158 = and i64 %1157, 16384
  %1159 = icmp ne i64 %1158, 0
  br i1 %1159, label %1160, label %1166

; <label>:1160:                                   ; preds = %1152
  %pgocount67 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 42)
  %1161 = add i64 %pgocount67, 1
  store i64 %1161, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 42)
  %1162 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1163 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1164 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1163, i32 0, i32 39
  %1165 = load i8*, i8** %1164, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1162, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.73, i32 0, i32 0), i8* %1165)
  br label %1166

; <label>:1166:                                   ; preds = %1160, %1152
  %1167 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1168 = getelementptr inbounds %struct.tiff, %struct.tiff* %1167, i32 0, i32 6
  %1169 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1168, i32 0, i32 0
  %1170 = getelementptr inbounds [3 x i64], [3 x i64]* %1169, i64 0, i64 0
  %1171 = load i64, i64* %1170, align 8
  %1172 = and i64 %1171, 32768
  %1173 = icmp ne i64 %1172, 0
  br i1 %1173, label %1174, label %1205

; <label>:1174:                                   ; preds = %1166
  %1175 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1176 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1175, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.74, i32 0, i32 0))
  %1177 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1178 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1177, i32 0, i32 14
  %1179 = load i16, i16* %1178, align 8
  %1180 = zext i16 %1179 to i64
  %1181 = icmp ult i64 %1180, 9
  br i1 %1181, label %1182, label %1192

; <label>:1182:                                   ; preds = %1174
  %pgocount68 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 69)
  %1183 = add i64 %pgocount68, 1
  store i64 %1183, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 69)
  %1184 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1185 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1186 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1185, i32 0, i32 14
  %1187 = load i16, i16* %1186, align 8
  %1188 = zext i16 %1187 to i64
  %1189 = getelementptr inbounds [9 x i8*], [9 x i8*]* @orientNames, i64 0, i64 %1188
  %1190 = load i8*, i8** %1189, align 8
  %1191 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1184, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i32 0, i32 0), i8* %1190)
  br label %1204

; <label>:1192:                                   ; preds = %1174
  %pgocount69 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 70)
  %1193 = add i64 %pgocount69, 1
  store i64 %1193, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 70)
  %1194 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1195 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1196 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1195, i32 0, i32 14
  %1197 = load i16, i16* %1196, align 8
  %1198 = zext i16 %1197 to i32
  %1199 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1200 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1199, i32 0, i32 14
  %1201 = load i16, i16* %1200, align 8
  %1202 = zext i16 %1201 to i32
  %1203 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1194, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i32 0, i32 0), i32 %1198, i32 %1202)
  br label %1204

; <label>:1204:                                   ; preds = %1192, %1182
  br label %1205

; <label>:1205:                                   ; preds = %1204, %1166
  %1206 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1207 = getelementptr inbounds %struct.tiff, %struct.tiff* %1206, i32 0, i32 6
  %1208 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1207, i32 0, i32 0
  %1209 = getelementptr inbounds [3 x i64], [3 x i64]* %1208, i64 0, i64 0
  %1210 = load i64, i64* %1209, align 8
  %1211 = and i64 %1210, 65536
  %1212 = icmp ne i64 %1211, 0
  br i1 %1212, label %1213, label %1221

; <label>:1213:                                   ; preds = %1205
  %pgocount70 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 43)
  %1214 = add i64 %pgocount70, 1
  store i64 %1214, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 43)
  %1215 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1216 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1217 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1216, i32 0, i32 15
  %1218 = load i16, i16* %1217, align 2
  %1219 = zext i16 %1218 to i32
  %1220 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1215, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.75, i32 0, i32 0), i32 %1219)
  br label %1221

; <label>:1221:                                   ; preds = %1213, %1205
  %1222 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1223 = getelementptr inbounds %struct.tiff, %struct.tiff* %1222, i32 0, i32 6
  %1224 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1223, i32 0, i32 0
  %1225 = getelementptr inbounds [3 x i64], [3 x i64]* %1224, i64 0, i64 0
  %1226 = load i64, i64* %1225, align 8
  %1227 = and i64 %1226, 131072
  %1228 = icmp ne i64 %1227, 0
  br i1 %1228, label %1229, label %1249

; <label>:1229:                                   ; preds = %1221
  %1230 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1231 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1230, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.76, i32 0, i32 0))
  %1232 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1233 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1232, i32 0, i32 16
  %1234 = load i32, i32* %1233, align 4
  %1235 = icmp eq i32 %1234, -1
  br i1 %1235, label %1236, label %1240

; <label>:1236:                                   ; preds = %1229
  %pgocount71 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 77)
  %1237 = add i64 %pgocount71, 1
  store i64 %1237, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 77)
  %1238 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1239 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1238, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.77, i32 0, i32 0))
  br label %1248

; <label>:1240:                                   ; preds = %1229
  %pgocount72 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 60)
  %1241 = add i64 %pgocount72, 1
  store i64 %1241, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 60)
  %1242 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1243 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1244 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1243, i32 0, i32 16
  %1245 = load i32, i32* %1244, align 4
  %1246 = zext i32 %1245 to i64
  %1247 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1242, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.78, i32 0, i32 0), i64 %1246)
  br label %1248

; <label>:1248:                                   ; preds = %1240, %1236
  br label %1249

; <label>:1249:                                   ; preds = %1248, %1221
  %1250 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1251 = getelementptr inbounds %struct.tiff, %struct.tiff* %1250, i32 0, i32 6
  %1252 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1251, i32 0, i32 0
  %1253 = getelementptr inbounds [3 x i64], [3 x i64]* %1252, i64 0, i64 0
  %1254 = load i64, i64* %1253, align 8
  %1255 = and i64 %1254, 262144
  %1256 = icmp ne i64 %1255, 0
  br i1 %1256, label %1257, label %1265

; <label>:1257:                                   ; preds = %1249
  %pgocount73 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 44)
  %1258 = add i64 %pgocount73, 1
  store i64 %1258, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 44)
  %1259 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1260 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1261 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1260, i32 0, i32 17
  %1262 = load i16, i16* %1261, align 8
  %1263 = zext i16 %1262 to i32
  %1264 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1259, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.79, i32 0, i32 0), i32 %1263)
  br label %1265

; <label>:1265:                                   ; preds = %1257, %1249
  %1266 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1267 = getelementptr inbounds %struct.tiff, %struct.tiff* %1266, i32 0, i32 6
  %1268 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1267, i32 0, i32 0
  %1269 = getelementptr inbounds [3 x i64], [3 x i64]* %1268, i64 0, i64 0
  %1270 = load i64, i64* %1269, align 8
  %1271 = and i64 %1270, 524288
  %1272 = icmp ne i64 %1271, 0
  br i1 %1272, label %1273, label %1281

; <label>:1273:                                   ; preds = %1265
  %pgocount74 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 45)
  %1274 = add i64 %pgocount74, 1
  store i64 %1274, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 45)
  %1275 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1276 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1277 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1276, i32 0, i32 18
  %1278 = load i16, i16* %1277, align 2
  %1279 = zext i16 %1278 to i32
  %1280 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1275, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.80, i32 0, i32 0), i32 %1279)
  br label %1281

; <label>:1281:                                   ; preds = %1273, %1265
  %1282 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1283 = getelementptr inbounds %struct.tiff, %struct.tiff* %1282, i32 0, i32 6
  %1284 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1283, i32 0, i32 0
  %1285 = getelementptr inbounds [3 x i64], [3 x i64]* %1284, i64 0, i64 1
  %1286 = load i64, i64* %1285, align 8
  %1287 = and i64 %1286, 2
  %1288 = icmp ne i64 %1287, 0
  br i1 %1288, label %1289, label %1296

; <label>:1289:                                   ; preds = %1281
  %pgocount75 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 46)
  %1290 = add i64 %pgocount75, 1
  store i64 %1290, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 46)
  %1291 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1292 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1293 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1292, i32 0, i32 19
  %1294 = load double, double* %1293, align 8
  %1295 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1291, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.81, i32 0, i32 0), double %1294)
  br label %1296

; <label>:1296:                                   ; preds = %1289, %1281
  %1297 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1298 = getelementptr inbounds %struct.tiff, %struct.tiff* %1297, i32 0, i32 6
  %1299 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1298, i32 0, i32 0
  %1300 = getelementptr inbounds [3 x i64], [3 x i64]* %1299, i64 0, i64 1
  %1301 = load i64, i64* %1300, align 8
  %1302 = and i64 %1301, 4
  %1303 = icmp ne i64 %1302, 0
  br i1 %1303, label %1304, label %1311

; <label>:1304:                                   ; preds = %1296
  %pgocount76 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 47)
  %1305 = add i64 %pgocount76, 1
  store i64 %1305, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 47)
  %1306 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1307 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1308 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1307, i32 0, i32 20
  %1309 = load double, double* %1308, align 8
  %1310 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1306, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.82, i32 0, i32 0), double %1309)
  br label %1311

; <label>:1311:                                   ; preds = %1304, %1296
  %1312 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1313 = getelementptr inbounds %struct.tiff, %struct.tiff* %1312, i32 0, i32 6
  %1314 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1313, i32 0, i32 0
  %1315 = getelementptr inbounds [3 x i64], [3 x i64]* %1314, i64 0, i64 0
  %1316 = load i64, i64* %1315, align 8
  %1317 = and i64 %1316, 1048576
  %1318 = icmp ne i64 %1317, 0
  br i1 %1318, label %1319, label %1347

; <label>:1319:                                   ; preds = %1311
  %1320 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1321 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1320, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.83, i32 0, i32 0))
  %1322 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1323 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1322, i32 0, i32 24
  %1324 = load i16, i16* %1323, align 2
  %1325 = zext i16 %1324 to i32
  switch i32 %1325, label %1334 [
    i32 1, label %1326
    i32 2, label %1330
  ]

; <label>:1326:                                   ; preds = %1319
  %pgocount77 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 84)
  %1327 = add i64 %pgocount77, 1
  store i64 %1327, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 84)
  %1328 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1329 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1328, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.84, i32 0, i32 0))
  br label %1346

; <label>:1330:                                   ; preds = %1319
  %pgocount78 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 85)
  %1331 = add i64 %pgocount78, 1
  store i64 %1331, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 85)
  %1332 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1333 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1332, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.85, i32 0, i32 0))
  br label %1346

; <label>:1334:                                   ; preds = %1319
  %pgocount79 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 86)
  %1335 = add i64 %pgocount79, 1
  store i64 %1335, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 86)
  %1336 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1337 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1338 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1337, i32 0, i32 24
  %1339 = load i16, i16* %1338, align 2
  %1340 = zext i16 %1339 to i32
  %1341 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1342 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1341, i32 0, i32 24
  %1343 = load i16, i16* %1342, align 2
  %1344 = zext i16 %1343 to i32
  %1345 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1336, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i32 0, i32 0), i32 %1340, i32 %1344)
  br label %1346

; <label>:1346:                                   ; preds = %1334, %1330, %1326
  br label %1347

; <label>:1347:                                   ; preds = %1346, %1311
  %1348 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1349 = getelementptr inbounds %struct.tiff, %struct.tiff* %1348, i32 0, i32 6
  %1350 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1349, i32 0, i32 0
  %1351 = getelementptr inbounds [3 x i64], [3 x i64]* %1350, i64 0, i64 0
  %1352 = load i64, i64* %1351, align 8
  %1353 = and i64 %1352, 2097152
  %1354 = icmp ne i64 %1353, 0
  br i1 %1354, label %1355, label %1361

; <label>:1355:                                   ; preds = %1347
  %pgocount80 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 48)
  %1356 = add i64 %pgocount80, 1
  store i64 %1356, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 48)
  %1357 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1358 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1359 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1358, i32 0, i32 41
  %1360 = load i8*, i8** %1359, align 8
  call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1357, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.86, i32 0, i32 0), i8* %1360)
  br label %1361

; <label>:1361:                                   ; preds = %1355, %1347
  %1362 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1363 = getelementptr inbounds %struct.tiff, %struct.tiff* %1362, i32 0, i32 6
  %1364 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1363, i32 0, i32 0
  %1365 = getelementptr inbounds [3 x i64], [3 x i64]* %1364, i64 0, i64 0
  %1366 = load i64, i64* %1365, align 8
  %1367 = and i64 %1366, 8388608
  %1368 = icmp ne i64 %1367, 0
  br i1 %1368, label %1369, label %1383

; <label>:1369:                                   ; preds = %1361
  %pgocount81 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 49)
  %1370 = add i64 %pgocount81, 1
  store i64 %1370, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 49)
  %1371 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1372 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1373 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1372, i32 0, i32 27
  %1374 = getelementptr inbounds [2 x i16], [2 x i16]* %1373, i64 0, i64 0
  %1375 = load i16, i16* %1374, align 4
  %1376 = zext i16 %1375 to i32
  %1377 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1378 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1377, i32 0, i32 27
  %1379 = getelementptr inbounds [2 x i16], [2 x i16]* %1378, i64 0, i64 1
  %1380 = load i16, i16* %1379, align 2
  %1381 = zext i16 %1380 to i32
  %1382 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1371, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.87, i32 0, i32 0), i32 %1376, i32 %1381)
  br label %1383

; <label>:1383:                                   ; preds = %1369, %1361
  %1384 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1385 = getelementptr inbounds %struct.tiff, %struct.tiff* %1384, i32 0, i32 6
  %1386 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1385, i32 0, i32 0
  %1387 = getelementptr inbounds [3 x i64], [3 x i64]* %1386, i64 0, i64 0
  %1388 = load i64, i64* %1387, align 8
  %1389 = and i64 %1388, 67108864
  %1390 = icmp ne i64 %1389, 0
  br i1 %1390, label %1391, label %1449

; <label>:1391:                                   ; preds = %1383
  %1392 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1393 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1392, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.88, i32 0, i32 0))
  %1394 = load i64, i64* %6, align 8
  %1395 = and i64 %1394, 4
  %1396 = icmp ne i64 %1395, 0
  br i1 %1396, label %1397, label %1444

; <label>:1397:                                   ; preds = %1391
  %1398 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1399 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1398, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  %1400 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1401 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1400, i32 0, i32 8
  %1402 = load i16, i16* %1401, align 4
  %1403 = zext i16 %1402 to i32
  %1404 = zext i32 %1403 to i64
  %1405 = shl i64 1, %1404
  store i64 %1405, i64* %11, align 8
  store i64 0, i64* %10, align 8
  br label %1406

; <label>:1406:                                   ; preds = %1438, %1397
  %1407 = load i64, i64* %10, align 8
  %1408 = load i64, i64* %11, align 8
  %1409 = icmp slt i64 %1407, %1408
  br i1 %1409, label %1410, label %1442

; <label>:1410:                                   ; preds = %1406
  %1411 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1412 = load i64, i64* %10, align 8
  %1413 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1414 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1413, i32 0, i32 28
  %1415 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1414, i64 0, i64 0
  %1416 = load i16*, i16** %1415, align 8
  %1417 = load i64, i64* %10, align 8
  %1418 = getelementptr inbounds i16, i16* %1416, i64 %1417
  %1419 = load i16, i16* %1418, align 2
  %1420 = zext i16 %1419 to i32
  %1421 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1422 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1421, i32 0, i32 28
  %1423 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1422, i64 0, i64 1
  %1424 = load i16*, i16** %1423, align 8
  %1425 = load i64, i64* %10, align 8
  %1426 = getelementptr inbounds i16, i16* %1424, i64 %1425
  %1427 = load i16, i16* %1426, align 2
  %1428 = zext i16 %1427 to i32
  %1429 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1430 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1429, i32 0, i32 28
  %1431 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1430, i64 0, i64 2
  %1432 = load i16*, i16** %1431, align 8
  %1433 = load i64, i64* %10, align 8
  %1434 = getelementptr inbounds i16, i16* %1432, i64 %1433
  %1435 = load i16, i16* %1434, align 2
  %1436 = zext i16 %1435 to i32
  %1437 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1411, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.89, i32 0, i32 0), i64 %1412, i32 %1420, i32 %1428, i32 %1436)
  br label %1438

; <label>:1438:                                   ; preds = %1410
  %pgocount82 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 4)
  %1439 = add i64 %pgocount82, 1
  store i64 %1439, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 4)
  %1440 = load i64, i64* %10, align 8
  %1441 = add nsw i64 %1440, 1
  store i64 %1441, i64* %10, align 8
  br label %1406

; <label>:1442:                                   ; preds = %1406
  %pgocount83 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 71)
  %1443 = add i64 %pgocount83, 1
  store i64 %1443, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 71)
  br label %1448

; <label>:1444:                                   ; preds = %1391
  %pgocount84 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 72)
  %1445 = add i64 %pgocount84, 1
  store i64 %1445, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 72)
  %1446 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1447 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1446, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.90, i32 0, i32 0))
  br label %1448

; <label>:1448:                                   ; preds = %1444, %1442
  br label %1449

; <label>:1449:                                   ; preds = %1448, %1383
  %1450 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1451 = getelementptr inbounds %struct.tiff, %struct.tiff* %1450, i32 0, i32 6
  %1452 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1451, i32 0, i32 0
  %1453 = getelementptr inbounds [3 x i64], [3 x i64]* %1452, i64 0, i64 1
  %1454 = load i64, i64* %1453, align 8
  %1455 = and i64 %1454, 1024
  %1456 = icmp ne i64 %1455, 0
  br i1 %1456, label %1457, label %1473

; <label>:1457:                                   ; preds = %1449
  %pgocount85 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 50)
  %1458 = add i64 %pgocount85, 1
  store i64 %1458, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 50)
  %1459 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1460 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1461 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1460, i32 0, i32 51
  %1462 = load float*, float** %1461, align 8
  %1463 = getelementptr inbounds float, float* %1462, i64 0
  %1464 = load float, float* %1463, align 4
  %1465 = fpext float %1464 to double
  %1466 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1467 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1466, i32 0, i32 51
  %1468 = load float*, float** %1467, align 8
  %1469 = getelementptr inbounds float, float* %1468, i64 1
  %1470 = load float, float* %1469, align 4
  %1471 = fpext float %1470 to double
  %1472 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1459, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.91, i32 0, i32 0), double %1465, double %1471)
  br label %1473

; <label>:1473:                                   ; preds = %1457, %1449
  %1474 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1475 = getelementptr inbounds %struct.tiff, %struct.tiff* %1474, i32 0, i32 6
  %1476 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1475, i32 0, i32 0
  %1477 = getelementptr inbounds [3 x i64], [3 x i64]* %1476, i64 0, i64 1
  %1478 = load i64, i64* %1477, align 8
  %1479 = and i64 %1478, 2048
  %1480 = icmp ne i64 %1479, 0
  br i1 %1480, label %1481, label %1521

; <label>:1481:                                   ; preds = %1473
  %pgocount86 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 51)
  %1482 = add i64 %pgocount86, 1
  store i64 %1482, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 51)
  %1483 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1484 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1485 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1484, i32 0, i32 52
  %1486 = load float*, float** %1485, align 8
  %1487 = getelementptr inbounds float, float* %1486, i64 0
  %1488 = load float, float* %1487, align 4
  %1489 = fpext float %1488 to double
  %1490 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1491 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1490, i32 0, i32 52
  %1492 = load float*, float** %1491, align 8
  %1493 = getelementptr inbounds float, float* %1492, i64 1
  %1494 = load float, float* %1493, align 4
  %1495 = fpext float %1494 to double
  %1496 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1497 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1496, i32 0, i32 52
  %1498 = load float*, float** %1497, align 8
  %1499 = getelementptr inbounds float, float* %1498, i64 2
  %1500 = load float, float* %1499, align 4
  %1501 = fpext float %1500 to double
  %1502 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1503 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1502, i32 0, i32 52
  %1504 = load float*, float** %1503, align 8
  %1505 = getelementptr inbounds float, float* %1504, i64 3
  %1506 = load float, float* %1505, align 4
  %1507 = fpext float %1506 to double
  %1508 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1509 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1508, i32 0, i32 52
  %1510 = load float*, float** %1509, align 8
  %1511 = getelementptr inbounds float, float* %1510, i64 4
  %1512 = load float, float* %1511, align 4
  %1513 = fpext float %1512 to double
  %1514 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1515 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1514, i32 0, i32 52
  %1516 = load float*, float** %1515, align 8
  %1517 = getelementptr inbounds float, float* %1516, i64 5
  %1518 = load float, float* %1517, align 4
  %1519 = fpext float %1518 to double
  %1520 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1483, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.92, i32 0, i32 0), double %1489, double %1495, double %1501, double %1507, double %1513, double %1519)
  br label %1521

; <label>:1521:                                   ; preds = %1481, %1473
  %1522 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1523 = getelementptr inbounds %struct.tiff, %struct.tiff* %1522, i32 0, i32 6
  %1524 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1523, i32 0, i32 0
  %1525 = getelementptr inbounds [3 x i64], [3 x i64]* %1524, i64 0, i64 1
  %1526 = load i64, i64* %1525, align 8
  %1527 = and i64 %1526, 512
  %1528 = icmp ne i64 %1527, 0
  br i1 %1528, label %1529, label %1573

; <label>:1529:                                   ; preds = %1521
  %1530 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1531 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1530, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.93, i32 0, i32 0))
  store i16 0, i16* %9, align 2
  br label %1532

; <label>:1532:                                   ; preds = %1567, %1529
  %1533 = load i16, i16* %9, align 2
  %1534 = zext i16 %1533 to i32
  %1535 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1536 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1535, i32 0, i32 15
  %1537 = load i16, i16* %1536, align 2
  %1538 = zext i16 %1537 to i32
  %1539 = icmp slt i32 %1534, %1538
  br i1 %1539, label %1540, label %1571

; <label>:1540:                                   ; preds = %1532
  %1541 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1542 = load i16, i16* %9, align 2
  %1543 = zext i16 %1542 to i32
  %1544 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1545 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1544, i32 0, i32 53
  %1546 = load float*, float** %1545, align 8
  %1547 = load i16, i16* %9, align 2
  %1548 = zext i16 %1547 to i32
  %1549 = mul nsw i32 2, %1548
  %1550 = add nsw i32 %1549, 0
  %1551 = sext i32 %1550 to i64
  %1552 = getelementptr inbounds float, float* %1546, i64 %1551
  %1553 = load float, float* %1552, align 4
  %1554 = fpext float %1553 to double
  %1555 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1556 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1555, i32 0, i32 53
  %1557 = load float*, float** %1556, align 8
  %1558 = load i16, i16* %9, align 2
  %1559 = zext i16 %1558 to i32
  %1560 = mul nsw i32 2, %1559
  %1561 = add nsw i32 %1560, 1
  %1562 = sext i32 %1561 to i64
  %1563 = getelementptr inbounds float, float* %1557, i64 %1562
  %1564 = load float, float* %1563, align 4
  %1565 = fpext float %1564 to double
  %1566 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1541, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.94, i32 0, i32 0), i32 %1543, double %1554, double %1565)
  br label %1567

; <label>:1567:                                   ; preds = %1540
  %pgocount87 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 2)
  %1568 = add i64 %pgocount87, 1
  store i64 %1568, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 2)
  %1569 = load i16, i16* %9, align 2
  %1570 = add i16 %1569, 1
  store i16 %1570, i16* %9, align 2
  br label %1532

; <label>:1571:                                   ; preds = %1532
  %pgocount88 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 52)
  %1572 = add i64 %pgocount88, 1
  store i64 %1572, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 52)
  br label %1573

; <label>:1573:                                   ; preds = %1571, %1521
  %1574 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1575 = getelementptr inbounds %struct.tiff, %struct.tiff* %1574, i32 0, i32 6
  %1576 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1575, i32 0, i32 0
  %1577 = getelementptr inbounds [3 x i64], [3 x i64]* %1576, i64 0, i64 1
  %1578 = load i64, i64* %1577, align 8
  %1579 = and i64 %1578, 4096
  %1580 = icmp ne i64 %1579, 0
  br i1 %1580, label %1581, label %1651

; <label>:1581:                                   ; preds = %1573
  %1582 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1583 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1582, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.95, i32 0, i32 0))
  %1584 = load i64, i64* %6, align 8
  %1585 = and i64 %1584, 2
  %1586 = icmp ne i64 %1585, 0
  br i1 %1586, label %1587, label %1646

; <label>:1587:                                   ; preds = %1581
  %1588 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1589 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1588, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  %1590 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1591 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1590, i32 0, i32 8
  %1592 = load i16, i16* %1591, align 4
  %1593 = zext i16 %1592 to i32
  %1594 = zext i32 %1593 to i64
  %1595 = shl i64 1, %1594
  store i64 %1595, i64* %11, align 8
  store i64 0, i64* %10, align 8
  br label %1596

; <label>:1596:                                   ; preds = %1640, %1587
  %1597 = load i64, i64* %10, align 8
  %1598 = load i64, i64* %11, align 8
  %1599 = icmp slt i64 %1597, %1598
  br i1 %1599, label %1600, label %1644

; <label>:1600:                                   ; preds = %1596
  %1601 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1602 = load i64, i64* %10, align 8
  %1603 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1604 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1603, i32 0, i32 54
  %1605 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1604, i64 0, i64 0
  %1606 = load i16*, i16** %1605, align 8
  %1607 = load i64, i64* %10, align 8
  %1608 = getelementptr inbounds i16, i16* %1606, i64 %1607
  %1609 = load i16, i16* %1608, align 2
  %1610 = zext i16 %1609 to i32
  %1611 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1601, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.96, i32 0, i32 0), i64 %1602, i32 %1610)
  store i16 1, i16* %9, align 2
  br label %1612

; <label>:1612:                                   ; preds = %1633, %1600
  %1613 = load i16, i16* %9, align 2
  %1614 = zext i16 %1613 to i32
  %1615 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1616 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1615, i32 0, i32 15
  %1617 = load i16, i16* %1616, align 2
  %1618 = zext i16 %1617 to i32
  %1619 = icmp slt i32 %1614, %1618
  br i1 %1619, label %1620, label %1637

; <label>:1620:                                   ; preds = %1612
  %1621 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1622 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1623 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1622, i32 0, i32 54
  %1624 = load i16, i16* %9, align 2
  %1625 = zext i16 %1624 to i64
  %1626 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1623, i64 0, i64 %1625
  %1627 = load i16*, i16** %1626, align 8
  %1628 = load i64, i64* %10, align 8
  %1629 = getelementptr inbounds i16, i16* %1627, i64 %1628
  %1630 = load i16, i16* %1629, align 2
  %1631 = zext i16 %1630 to i32
  %1632 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1621, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.97, i32 0, i32 0), i32 %1631)
  br label %1633

; <label>:1633:                                   ; preds = %1620
  %pgocount89 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 0)
  %1634 = add i64 %pgocount89, 1
  store i64 %1634, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 0)
  %1635 = load i16, i16* %9, align 2
  %1636 = add i16 %1635, 1
  store i16 %1636, i16* %9, align 2
  br label %1612

; <label>:1637:                                   ; preds = %1612
  %1638 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1639 = call i32 @fputc(i32 10, %struct._IO_FILE* %1638)
  br label %1640

; <label>:1640:                                   ; preds = %1637
  %pgocount90 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 5)
  %1641 = add i64 %pgocount90, 1
  store i64 %1641, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 5)
  %1642 = load i64, i64* %10, align 8
  %1643 = add nsw i64 %1642, 1
  store i64 %1643, i64* %10, align 8
  br label %1596

; <label>:1644:                                   ; preds = %1596
  %pgocount91 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 73)
  %1645 = add i64 %pgocount91, 1
  store i64 %1645, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 73)
  br label %1650

; <label>:1646:                                   ; preds = %1581
  %pgocount92 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 74)
  %1647 = add i64 %pgocount92, 1
  store i64 %1647, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 74)
  %1648 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1649 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1648, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.90, i32 0, i32 0))
  br label %1650

; <label>:1650:                                   ; preds = %1646, %1644
  br label %1651

; <label>:1651:                                   ; preds = %1650, %1573
  %1652 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1653 = getelementptr inbounds %struct.tiff, %struct.tiff* %1652, i32 0, i32 6
  %1654 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1653, i32 0, i32 0
  %1655 = getelementptr inbounds [3 x i64], [3 x i64]* %1654, i64 0, i64 1
  %1656 = load i64, i64* %1655, align 8
  %1657 = and i64 %1656, 524288
  %1658 = icmp ne i64 %1657, 0
  br i1 %1658, label %1659, label %1667

; <label>:1659:                                   ; preds = %1651
  %pgocount93 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 53)
  %1660 = add i64 %pgocount93, 1
  store i64 %1660, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 53)
  %1661 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1662 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1663 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1662, i32 0, i32 61
  %1664 = load i32, i32* %1663, align 8
  %1665 = zext i32 %1664 to i64
  %1666 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1661, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.98, i32 0, i32 0), i64 %1665)
  br label %1667

; <label>:1667:                                   ; preds = %1659, %1651
  %1668 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1669 = getelementptr inbounds %struct.tiff, %struct.tiff* %1668, i32 0, i32 6
  %1670 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1669, i32 0, i32 0
  %1671 = getelementptr inbounds [3 x i64], [3 x i64]* %1670, i64 0, i64 1
  %1672 = load i64, i64* %1671, align 8
  %1673 = and i64 %1672, 1048576
  %1674 = icmp ne i64 %1673, 0
  br i1 %1674, label %1675, label %1683

; <label>:1675:                                   ; preds = %1667
  %pgocount94 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 54)
  %1676 = add i64 %pgocount94, 1
  store i64 %1676, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 54)
  %1677 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1678 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1679 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1678, i32 0, i32 63
  %1680 = load i32, i32* %1679, align 8
  %1681 = zext i32 %1680 to i64
  %1682 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1677, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.99, i32 0, i32 0), i64 %1681)
  br label %1683

; <label>:1683:                                   ; preds = %1675, %1667
  %1684 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1685 = getelementptr inbounds %struct.tiff, %struct.tiff* %1684, i32 0, i32 6
  %1686 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1685, i32 0, i32 0
  %1687 = getelementptr inbounds [3 x i64], [3 x i64]* %1686, i64 0, i64 1
  %1688 = load i64, i64* %1687, align 8
  %1689 = and i64 %1688, 2097152
  %1690 = icmp ne i64 %1689, 0
  br i1 %1690, label %1691, label %1699

; <label>:1691:                                   ; preds = %1683
  %pgocount95 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 55)
  %1692 = add i64 %pgocount95, 1
  store i64 %1692, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 55)
  %1693 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1694 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1695 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1694, i32 0, i32 65
  %1696 = load i32, i32* %1695, align 8
  %1697 = zext i32 %1696 to i64
  %1698 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1693, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.100, i32 0, i32 0), i64 %1697)
  br label %1699

; <label>:1699:                                   ; preds = %1691, %1683
  %1700 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1701 = getelementptr inbounds %struct.tiff, %struct.tiff* %1700, i32 0, i32 6
  %1702 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1701, i32 0, i32 0
  %1703 = getelementptr inbounds [3 x i64], [3 x i64]* %1702, i64 0, i64 1
  %1704 = load i64, i64* %1703, align 8
  %1705 = and i64 %1704, 131072
  %1706 = icmp ne i64 %1705, 0
  br i1 %1706, label %1707, label %1737

; <label>:1707:                                   ; preds = %1699
  %1708 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1709 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1708, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.101, i32 0, i32 0))
  store i16 0, i16* %9, align 2
  br label %1710

; <label>:1710:                                   ; preds = %1729, %1707
  %1711 = load i16, i16* %9, align 2
  %1712 = zext i16 %1711 to i32
  %1713 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1714 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1713, i32 0, i32 46
  %1715 = load i16, i16* %1714, align 8
  %1716 = zext i16 %1715 to i32
  %1717 = icmp slt i32 %1712, %1716
  br i1 %1717, label %1718, label %1733

; <label>:1718:                                   ; preds = %1710
  %1719 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1720 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1721 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1720, i32 0, i32 47
  %1722 = load i32*, i32** %1721, align 8
  %1723 = load i16, i16* %9, align 2
  %1724 = zext i16 %1723 to i64
  %1725 = getelementptr inbounds i32, i32* %1722, i64 %1724
  %1726 = load i32, i32* %1725, align 4
  %1727 = zext i32 %1726 to i64
  %1728 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1719, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.102, i32 0, i32 0), i64 %1727)
  br label %1729

; <label>:1729:                                   ; preds = %1718
  %pgocount96 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 3)
  %1730 = add i64 %pgocount96, 1
  store i64 %1730, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 3)
  %1731 = load i16, i16* %9, align 2
  %1732 = add i16 %1731, 1
  store i16 %1732, i16* %9, align 2
  br label %1710

; <label>:1733:                                   ; preds = %1710
  %pgocount97 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 56)
  %1734 = add i64 %pgocount97, 1
  store i64 %1734, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 56)
  %1735 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1736 = call i32 @fputc(i32 10, %struct._IO_FILE* %1735)
  br label %1737

; <label>:1737:                                   ; preds = %1733, %1699
  %1738 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1739 = getelementptr inbounds %struct.tiff, %struct.tiff* %1738, i32 0, i32 59
  %1740 = bitcast {}** %1739 to void (%struct.tiff*, %struct._IO_FILE*, i64)**
  %1741 = load void (%struct.tiff*, %struct._IO_FILE*, i64)*, void (%struct.tiff*, %struct._IO_FILE*, i64)** %1740, align 8
  %1742 = icmp ne void (%struct.tiff*, %struct._IO_FILE*, i64)* %1741, null
  br i1 %1742, label %1743, label %1753

; <label>:1743:                                   ; preds = %1737
  %pgocount98 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 13)
  %1744 = add i64 %pgocount98, 1
  store i64 %1744, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 13)
  %1745 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1746 = getelementptr inbounds %struct.tiff, %struct.tiff* %1745, i32 0, i32 59
  %1747 = bitcast {}** %1746 to void (%struct.tiff*, %struct._IO_FILE*, i64)**
  %1748 = load void (%struct.tiff*, %struct._IO_FILE*, i64)*, void (%struct.tiff*, %struct._IO_FILE*, i64)** %1747, align 8
  %1749 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1750 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1751 = load i64, i64* %6, align 8
  %1752 = ptrtoint void (%struct.tiff*, %struct._IO_FILE*, i64)* %1748 to i64
  call void @__llvm_profile_instrument_target(i64 %1752, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFPrintDirectory to i8*), i32 0)
  call void %1748(%struct.tiff* %1749, %struct._IO_FILE* %1750, i64 %1751)
  br label %1753

; <label>:1753:                                   ; preds = %1743, %1737
  %1754 = load i64, i64* %6, align 8
  %1755 = and i64 %1754, 1
  %1756 = icmp ne i64 %1755, 0
  br i1 %1756, label %1757, label %1814

; <label>:1757:                                   ; preds = %1753
  %pgocount99 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 57)
  %1758 = add i64 %pgocount99, 1
  store i64 %1758, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 57)
  %1759 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1760 = getelementptr inbounds %struct.tiff, %struct.tiff* %1759, i32 0, i32 6
  %1761 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1760, i32 0, i32 0
  %1762 = getelementptr inbounds [3 x i64], [3 x i64]* %1761, i64 0, i64 0
  %1763 = load i64, i64* %1762, align 8
  %1764 = and i64 %1763, 33554432
  %1765 = icmp ne i64 %1764, 0
  br i1 %1765, label %1766, label %1814

; <label>:1766:                                   ; preds = %1757
  %1767 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1768 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1769 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1768, i32 0, i32 43
  %1770 = load i32, i32* %1769, align 4
  %1771 = zext i32 %1770 to i64
  %1772 = load %struct.tiff*, %struct.tiff** %4, align 8
  %1773 = getelementptr inbounds %struct.tiff, %struct.tiff* %1772, i32 0, i32 3
  %1774 = load i32, i32* %1773, align 8
  %1775 = and i32 %1774, 1024
  %1776 = icmp ne i32 %1775, 0
  %1777 = zext i1 %1776 to i64
  %pgocount100 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 103)
  %1778 = add i64 %pgocount100, %1777
  store i64 %1778, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 103)
  %1779 = select i1 %1776, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.104, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.105, i32 0, i32 0)
  %1780 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1767, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.103, i32 0, i32 0), i64 %1771, i8* %1779)
  store i32 0, i32* %16, align 4
  br label %1781

; <label>:1781:                                   ; preds = %1808, %1766
  %1782 = load i32, i32* %16, align 4
  %1783 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1784 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1783, i32 0, i32 43
  %1785 = load i32, i32* %1784, align 4
  %1786 = icmp ult i32 %1782, %1785
  br i1 %1786, label %1787, label %1812

; <label>:1787:                                   ; preds = %1781
  %1788 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %1789 = load i32, i32* %16, align 4
  %1790 = zext i32 %1789 to i64
  %1791 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1792 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1791, i32 0, i32 44
  %1793 = load i32*, i32** %1792, align 8
  %1794 = load i32, i32* %16, align 4
  %1795 = zext i32 %1794 to i64
  %1796 = getelementptr inbounds i32, i32* %1793, i64 %1795
  %1797 = load i32, i32* %1796, align 4
  %1798 = zext i32 %1797 to i64
  %1799 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1800 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1799, i32 0, i32 45
  %1801 = load i32*, i32** %1800, align 8
  %1802 = load i32, i32* %16, align 4
  %1803 = zext i32 %1802 to i64
  %1804 = getelementptr inbounds i32, i32* %1801, i64 %1803
  %1805 = load i32, i32* %1804, align 4
  %1806 = zext i32 %1805 to i64
  %1807 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1788, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.106, i32 0, i32 0), i64 %1790, i64 %1798, i64 %1806)
  br label %1808

; <label>:1808:                                   ; preds = %1787
  %pgocount101 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 6)
  %1809 = add i64 %pgocount101, 1
  store i64 %1809, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 6)
  %1810 = load i32, i32* %16, align 4
  %1811 = add i32 %1810, 1
  store i32 %1811, i32* %16, align 4
  br label %1781

; <label>:1812:                                   ; preds = %1781
  %pgocount102 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 75)
  %1813 = add i64 %pgocount102, 1
  store i64 %1813, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 75)
  br label %1814

; <label>:1814:                                   ; preds = %1812, %1757, %1753
  %pgocount103 = load i64, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 11)
  %1815 = add i64 %pgocount103, 1
  store i64 %1815, i64* getelementptr inbounds ([104 x i64], [104 x i64]* @__profc_TIFFPrintDirectory, i64 0, i64 11)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFprintAsciiTag(%struct._IO_FILE*, i8*, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFprintAsciiTag, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFprintAsciiTag, i64 0, i64 0)
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %9 = load i8*, i8** %6, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.110, i32 0, i32 0), i8* %9)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %12 = load i8*, i8** %7, align 8
  call void @_TIFFprintAscii(%struct._IO_FILE* %11, i8* %12)
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.111, i32 0, i32 0))
  ret void
}

declare %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext) #1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFprintAscii(%struct._IO_FILE*, i8*) #0 {
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store i8* %1, i8** %4, align 8
  br label %6

; <label>:6:                                      ; preds = %71, %2
  %7 = load i8*, i8** %4, align 8
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %74

; <label>:11:                                     ; preds = %6
  %12 = call i16** @__ctype_b_loc() #6
  %13 = load i16*, i16** %12, align 8
  %14 = load i8*, i8** %4, align 8
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i16, i16* %13, i64 %17
  %19 = load i16, i16* %18, align 2
  %20 = zext i16 %19 to i32
  %21 = and i32 %20, 16384
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %30

; <label>:23:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 1)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 1)
  %25 = load i8*, i8** %4, align 8
  %26 = load i8, i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %29 = call i32 @fputc(i32 %27, %struct._IO_FILE* %28)
  br label %71

; <label>:30:                                     ; preds = %11
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.107, i32 0, i32 0), i8** %5, align 8
  br label %31

; <label>:31:                                     ; preds = %47, %30
  %32 = load i8*, i8** %5, align 8
  %33 = load i8, i8* %32, align 1
  %34 = icmp ne i8 %33, 0
  br i1 %34, label %35, label %51

; <label>:35:                                     ; preds = %31
  %36 = load i8*, i8** %5, align 8
  %37 = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %37, i8** %5, align 8
  %38 = load i8, i8* %36, align 1
  %39 = sext i8 %38 to i32
  %40 = load i8*, i8** %4, align 8
  %41 = load i8, i8* %40, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp eq i32 %39, %42
  br i1 %43, label %44, label %46

; <label>:44:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 3)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 3)
  br label %51

; <label>:46:                                     ; preds = %35
  br label %47

; <label>:47:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 0)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 0)
  %49 = load i8*, i8** %5, align 8
  %50 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %50, i8** %5, align 8
  br label %31

; <label>:51:                                     ; preds = %44, %31
  %52 = load i8*, i8** %5, align 8
  %53 = load i8, i8* %52, align 1
  %54 = icmp ne i8 %53, 0
  br i1 %54, label %55, label %62

; <label>:55:                                     ; preds = %51
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 2)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 2)
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %58 = load i8*, i8** %5, align 8
  %59 = load i8, i8* %58, align 1
  %60 = sext i8 %59 to i32
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.108, i32 0, i32 0), i32 %60)
  br label %70

; <label>:62:                                     ; preds = %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 4)
  %63 = add i64 %pgocount4, 1
  store i64 %63, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 4)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %65 = load i8*, i8** %4, align 8
  %66 = load i8, i8* %65, align 1
  %67 = sext i8 %66 to i32
  %68 = and i32 %67, 255
  %69 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.109, i32 0, i32 0), i32 %68)
  br label %70

; <label>:70:                                     ; preds = %62, %55
  br label %71

; <label>:71:                                     ; preds = %70, %23
  %72 = load i8*, i8** %4, align 8
  %73 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %73, i8** %4, align 8
  br label %6

; <label>:74:                                     ; preds = %6
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 5)
  %75 = add i64 %pgocount5, 1
  store i64 %75, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFprintAscii, i64 0, i64 5)
  ret void
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #2

declare i32 @fputc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
