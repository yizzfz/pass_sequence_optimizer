; ModuleID = 'tif_print.ll'
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
@photoNames = internal unnamed_addr constant [9 x i8*] [i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.112, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.113, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.114, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.115, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.116, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.117, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.118, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.119, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.120, i32 0, i32 0)], align 16
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
@orientNames = internal unnamed_addr constant [9 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.121, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.122, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.123, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.124, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.125, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.126, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.127, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.128, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.129, i32 0, i32 0)], align 16
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
@switch.table = private unnamed_addr constant [6 x i8*] [i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.107, i64 0, i64 2), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.107, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.107, i64 0, i64 6), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.107, i64 0, i64 8), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.107, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.107, i64 0, i64 4)]

; Function Attrs: noinline nounwind uwtable
define void @TIFFPrintDirectory(%struct.tiff*, %struct._IO_FILE*, i64) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 4
  %5 = load i32, i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 %6)
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 0
  %9 = load i64, i64* %8, align 8
  %10 = and i64 %9, 32
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %36, label %12

; <label>:12:                                     ; preds = %3
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %1)
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 7
  %15 = load i32, i32* %14, align 8
  %16 = and i32 %15, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %20, label %18

; <label>:18:                                     ; preds = %12
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  br label %20

; <label>:20:                                     ; preds = %12, %18
  %.03 = phi i8* [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), %18 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0), %12 ]
  %21 = load i32, i32* %14, align 8
  %22 = and i32 %21, 2
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %26, label %24

; <label>:24:                                     ; preds = %20
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i8* %.03)
  br label %26

; <label>:26:                                     ; preds = %20, %24
  %.14 = phi i8* [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), %24 ], [ %.03, %20 ]
  %27 = load i32, i32* %14, align 8
  %28 = and i32 %27, 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %32, label %30

; <label>:30:                                     ; preds = %26
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i64 0, i64 0), i8* %.14)
  br label %32

; <label>:32:                                     ; preds = %26, %30
  %33 = load i32, i32* %14, align 8
  %34 = zext i32 %33 to i64
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.7, i64 0, i64 0), i64 %34, i64 %34)
  br label %36

; <label>:36:                                     ; preds = %3, %32
  %37 = load i64, i64* %8, align 8
  %38 = and i64 %37, 2
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %58, label %40

; <label>:40:                                     ; preds = %36
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %42 = load i32, i32* %41, align 8
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %45 = load i32, i32* %44, align 4
  %46 = zext i32 %45 to i64
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.8, i64 0, i64 0), i64 %43, i64 %46)
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 1
  %49 = load i64, i64* %48, align 8
  %50 = and i64 %49, 8
  %51 = icmp eq i64 %50, 0
  br i1 %51, label %57, label %52

; <label>:52:                                     ; preds = %40
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 3
  %54 = load i32, i32* %53, align 8
  %55 = zext i32 %54 to i64
  %56 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i64 %55)
  br label %57

; <label>:57:                                     ; preds = %40, %52
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %1)
  br label %58

; <label>:58:                                     ; preds = %36, %57
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 1
  %60 = load i64, i64* %59, align 8
  %61 = and i64 %60, 25165824
  %62 = icmp eq i64 %61, 0
  br i1 %62, label %71, label %63

; <label>:63:                                     ; preds = %58
  %64 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 67
  %65 = load i32, i32* %64, align 8
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 68
  %68 = load i32, i32* %67, align 4
  %69 = zext i32 %68 to i64
  %70 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.11, i64 0, i64 0), i64 %66, i64 %69)
  br label %71

; <label>:71:                                     ; preds = %58, %63
  %72 = load i64, i64* %59, align 8
  %73 = and i64 %72, 33554432
  %74 = icmp eq i64 %73, 0
  br i1 %74, label %78, label %75

; <label>:75:                                     ; preds = %71
  %76 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 69
  %77 = load i8*, i8** %76, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i64 0, i64 0), i8* %77)
  br label %78

; <label>:78:                                     ; preds = %71, %75
  %79 = load i64, i64* %59, align 8
  %80 = and i64 %79, 67108864
  %81 = icmp eq i64 %80, 0
  br i1 %81, label %85, label %82

; <label>:82:                                     ; preds = %78
  %83 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 70
  %84 = load i8*, i8** %83, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.13, i64 0, i64 0), i8* %84)
  br label %85

; <label>:85:                                     ; preds = %78, %82
  %86 = load i64, i64* %59, align 8
  %87 = and i64 %86, 134217728
  %88 = icmp eq i64 %87, 0
  br i1 %88, label %94, label %89

; <label>:89:                                     ; preds = %85
  %90 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 71
  %91 = load float, float* %90, align 8
  %92 = fpext float %91 to double
  %93 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.14, i64 0, i64 0), double %92)
  br label %94

; <label>:94:                                     ; preds = %85, %89
  %95 = load i64, i64* %59, align 8
  %96 = and i64 %95, 268435456
  %97 = icmp eq i64 %96, 0
  br i1 %97, label %151, label %98

; <label>:98:                                     ; preds = %94
  %99 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 72
  %100 = bitcast float** %99 to [4 x [4 x float]]**
  %101 = load [4 x [4 x float]]*, [4 x [4 x float]]** %100, align 8
  %102 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 0, i64 0
  %103 = load float, float* %102, align 4
  %104 = fpext float %103 to double
  %105 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 0, i64 1
  %106 = load float, float* %105, align 4
  %107 = fpext float %106 to double
  %108 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 0, i64 2
  %109 = load float, float* %108, align 4
  %110 = fpext float %109 to double
  %111 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 0, i64 3
  %112 = load float, float* %111, align 4
  %113 = fpext float %112 to double
  %114 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 1, i64 0
  %115 = load float, float* %114, align 4
  %116 = fpext float %115 to double
  %117 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 1, i64 1
  %118 = load float, float* %117, align 4
  %119 = fpext float %118 to double
  %120 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 1, i64 2
  %121 = load float, float* %120, align 4
  %122 = fpext float %121 to double
  %123 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 1, i64 3
  %124 = load float, float* %123, align 4
  %125 = fpext float %124 to double
  %126 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 2, i64 0
  %127 = load float, float* %126, align 4
  %128 = fpext float %127 to double
  %129 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 2, i64 1
  %130 = load float, float* %129, align 4
  %131 = fpext float %130 to double
  %132 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 2, i64 2
  %133 = load float, float* %132, align 4
  %134 = fpext float %133 to double
  %135 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 2, i64 3
  %136 = load float, float* %135, align 4
  %137 = fpext float %136 to double
  %138 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 3, i64 0
  %139 = load float, float* %138, align 4
  %140 = fpext float %139 to double
  %141 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 3, i64 1
  %142 = load float, float* %141, align 4
  %143 = fpext float %142 to double
  %144 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 3, i64 2
  %145 = load float, float* %144, align 4
  %146 = fpext float %145 to double
  %147 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %101, i64 0, i64 3, i64 3
  %148 = load float, float* %147, align 4
  %149 = fpext float %148 to double
  %150 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.15, i64 0, i64 0), double %104, double %107, double %110, double %113, double %116, double %119, double %122, double %125, double %128, double %131, double %134, double %137, double %140, double %143, double %146, double %149)
  br label %151

; <label>:151:                                    ; preds = %94, %98
  %152 = load i64, i64* %59, align 8
  %153 = and i64 %152, 536870912
  %154 = icmp eq i64 %153, 0
  br i1 %154, label %208, label %155

; <label>:155:                                    ; preds = %151
  %156 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 73
  %157 = bitcast float** %156 to [4 x [4 x float]]**
  %158 = load [4 x [4 x float]]*, [4 x [4 x float]]** %157, align 8
  %159 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 0, i64 0
  %160 = load float, float* %159, align 4
  %161 = fpext float %160 to double
  %162 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 0, i64 1
  %163 = load float, float* %162, align 4
  %164 = fpext float %163 to double
  %165 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 0, i64 2
  %166 = load float, float* %165, align 4
  %167 = fpext float %166 to double
  %168 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 0, i64 3
  %169 = load float, float* %168, align 4
  %170 = fpext float %169 to double
  %171 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 1, i64 0
  %172 = load float, float* %171, align 4
  %173 = fpext float %172 to double
  %174 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 1, i64 1
  %175 = load float, float* %174, align 4
  %176 = fpext float %175 to double
  %177 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 1, i64 2
  %178 = load float, float* %177, align 4
  %179 = fpext float %178 to double
  %180 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 1, i64 3
  %181 = load float, float* %180, align 4
  %182 = fpext float %181 to double
  %183 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 2, i64 0
  %184 = load float, float* %183, align 4
  %185 = fpext float %184 to double
  %186 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 2, i64 1
  %187 = load float, float* %186, align 4
  %188 = fpext float %187 to double
  %189 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 2, i64 2
  %190 = load float, float* %189, align 4
  %191 = fpext float %190 to double
  %192 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 2, i64 3
  %193 = load float, float* %192, align 4
  %194 = fpext float %193 to double
  %195 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 3, i64 0
  %196 = load float, float* %195, align 4
  %197 = fpext float %196 to double
  %198 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 3, i64 1
  %199 = load float, float* %198, align 4
  %200 = fpext float %199 to double
  %201 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 3, i64 2
  %202 = load float, float* %201, align 4
  %203 = fpext float %202 to double
  %204 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]]* %158, i64 0, i64 3, i64 3
  %205 = load float, float* %204, align 4
  %206 = fpext float %205 to double
  %207 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.16, i64 0, i64 0), double %161, double %164, double %167, double %170, double %173, double %176, double %179, double %182, double %185, double %188, double %191, double %194, double %197, double %200, double %203, double %206)
  br label %208

; <label>:208:                                    ; preds = %151, %155
  %209 = load i64, i64* %8, align 8
  %210 = and i64 %209, 4
  %211 = icmp eq i64 %210, 0
  br i1 %211, label %229, label %212

; <label>:212:                                    ; preds = %208
  %213 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  %214 = load i32, i32* %213, align 4
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  %217 = load i32, i32* %216, align 8
  %218 = zext i32 %217 to i64
  %219 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.17, i64 0, i64 0), i64 %215, i64 %218)
  %220 = load i64, i64* %59, align 8
  %221 = and i64 %220, 16
  %222 = icmp eq i64 %221, 0
  br i1 %222, label %228, label %223

; <label>:223:                                    ; preds = %212
  %224 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 6
  %225 = load i32, i32* %224, align 4
  %226 = zext i32 %225 to i64
  %227 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.18, i64 0, i64 0), i64 %226)
  br label %228

; <label>:228:                                    ; preds = %212, %223
  %fputc11 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %1)
  br label %229

; <label>:229:                                    ; preds = %208, %228
  %230 = load i64, i64* %8, align 8
  %231 = and i64 %230, 8
  %232 = icmp eq i64 %231, 0
  br i1 %232, label %257, label %233

; <label>:233:                                    ; preds = %229
  %234 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 21
  %235 = load float, float* %234, align 8
  %236 = fpext float %235 to double
  %237 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 22
  %238 = load float, float* %237, align 4
  %239 = fpext float %238 to double
  %240 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.19, i64 0, i64 0), double %236, double %239)
  %241 = load i64, i64* %8, align 8
  %242 = and i64 %241, 4194304
  %243 = icmp eq i64 %242, 0
  br i1 %243, label %256, label %244

; <label>:244:                                    ; preds = %233
  %245 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 23
  %246 = load i16, i16* %245, align 8
  switch i16 %246, label %253 [
    i16 1, label %247
    i16 2, label %249
    i16 3, label %251
  ]

; <label>:247:                                    ; preds = %244
  %248 = tail call i64 @fwrite(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.20, i64 0, i64 0), i64 11, i64 1, %struct._IO_FILE* %1)
  br label %256

; <label>:249:                                    ; preds = %244
  %250 = tail call i64 @fwrite(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.21, i64 0, i64 0), i64 12, i64 1, %struct._IO_FILE* %1)
  br label %256

; <label>:251:                                    ; preds = %244
  %252 = tail call i64 @fwrite(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.22, i64 0, i64 0), i64 10, i64 1, %struct._IO_FILE* %1)
  br label %256

; <label>:253:                                    ; preds = %244
  %254 = zext i16 %246 to i32
  %255 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.23, i64 0, i64 0), i32 %254, i32 %254)
  br label %256

; <label>:256:                                    ; preds = %247, %249, %251, %253, %233
  %fputc14 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %1)
  br label %257

; <label>:257:                                    ; preds = %229, %256
  %258 = load i64, i64* %8, align 8
  %259 = and i64 %258, 16
  %260 = icmp eq i64 %259, 0
  br i1 %260, label %269, label %261

; <label>:261:                                    ; preds = %257
  %262 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 25
  %263 = load float, float* %262, align 4
  %264 = fpext float %263 to double
  %265 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 26
  %266 = load float, float* %265, align 8
  %267 = fpext float %266 to double
  %268 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.24, i64 0, i64 0), double %264, double %267)
  br label %269

; <label>:269:                                    ; preds = %257, %261
  %270 = load i64, i64* %8, align 8
  %271 = and i64 %270, 64
  %272 = icmp eq i64 %271, 0
  br i1 %272, label %278, label %273

; <label>:273:                                    ; preds = %269
  %274 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %275 = load i16, i16* %274, align 4
  %276 = zext i16 %275 to i32
  %277 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.25, i64 0, i64 0), i32 %276)
  br label %278

; <label>:278:                                    ; preds = %269, %273
  %279 = load i64, i64* %59, align 8
  %280 = and i64 %279, 1
  %281 = icmp eq i64 %280, 0
  br i1 %281, label %297, label %282

; <label>:282:                                    ; preds = %278
  %283 = tail call i64 @fwrite(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.26, i64 0, i64 0), i64 17, i64 1, %struct._IO_FILE* %1)
  %284 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 9
  %285 = load i16, i16* %284, align 2
  switch i16 %285, label %294 [
    i16 4, label %286
    i16 2, label %288
    i16 1, label %290
    i16 3, label %292
  ]

; <label>:286:                                    ; preds = %282
  %287 = tail call i64 @fwrite(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.27, i64 0, i64 0), i64 5, i64 1, %struct._IO_FILE* %1)
  br label %297

; <label>:288:                                    ; preds = %282
  %289 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.28, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %1)
  br label %297

; <label>:290:                                    ; preds = %282
  %291 = tail call i64 @fwrite(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.29, i64 0, i64 0), i64 17, i64 1, %struct._IO_FILE* %1)
  br label %297

; <label>:292:                                    ; preds = %282
  %293 = tail call i64 @fwrite(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.30, i64 0, i64 0), i64 20, i64 1, %struct._IO_FILE* %1)
  br label %297

; <label>:294:                                    ; preds = %282
  %295 = zext i16 %285 to i32
  %296 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i64 0, i64 0), i32 %295, i32 %295)
  br label %297

; <label>:297:                                    ; preds = %286, %288, %290, %292, %294, %278
  %298 = load i64, i64* %8, align 8
  %299 = trunc i64 %298 to i8
  %300 = icmp slt i8 %299, 0
  br i1 %300, label %301, label %315

; <label>:301:                                    ; preds = %297
  %302 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %303 = load i16, i16* %302, align 8
  %304 = tail call %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext %303) #4
  %305 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.32, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1)
  %306 = icmp eq %struct.TIFFCodec* %304, null
  br i1 %306, label %311, label %307

; <label>:307:                                    ; preds = %301
  %308 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %304, i64 0, i32 0
  %309 = load i8*, i8** %308, align 8
  %310 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i64 0, i64 0), i8* %309)
  br label %315

; <label>:311:                                    ; preds = %301
  %312 = load i16, i16* %302, align 8
  %313 = zext i16 %312 to i32
  %314 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i64 0, i64 0), i32 %313, i32 %313)
  br label %315

; <label>:315:                                    ; preds = %307, %311, %297
  %316 = load i64, i64* %8, align 8
  %317 = and i64 %316, 256
  %318 = icmp eq i64 %317, 0
  br i1 %318, label %337, label %319

; <label>:319:                                    ; preds = %315
  %320 = tail call i64 @fwrite(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.34, i64 0, i64 0), i64 30, i64 1, %struct._IO_FILE* %1)
  %321 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 11
  %322 = load i16, i16* %321, align 2
  %323 = icmp ult i16 %322, 9
  br i1 %323, label %324, label %329

; <label>:324:                                    ; preds = %319
  %325 = zext i16 %322 to i64
  %326 = getelementptr inbounds [9 x i8*], [9 x i8*]* @photoNames, i64 0, i64 %325
  %327 = load i8*, i8** %326, align 8
  %328 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i64 0, i64 0), i8* %327)
  br label %337

; <label>:329:                                    ; preds = %319
  switch i16 %322, label %334 [
    i16 -32692, label %330
    i16 -32691, label %332
  ]

; <label>:330:                                    ; preds = %329
  %331 = tail call i64 @fwrite(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.35, i64 0, i64 0), i64 12, i64 1, %struct._IO_FILE* %1)
  br label %337

; <label>:332:                                    ; preds = %329
  %333 = tail call i64 @fwrite(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.36, i64 0, i64 0), i64 20, i64 1, %struct._IO_FILE* %1)
  br label %337

; <label>:334:                                    ; preds = %329
  %335 = zext i16 %322 to i32
  %336 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i64 0, i64 0), i32 %335, i32 %335)
  br label %337

; <label>:337:                                    ; preds = %324, %334, %332, %330, %315
  %338 = load i64, i64* %8, align 8
  %339 = trunc i64 %338 to i32
  %340 = icmp slt i32 %339, 0
  br i1 %340, label %341, label %370

; <label>:341:                                    ; preds = %337
  %342 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  %343 = load i16, i16* %342, align 4
  %344 = icmp eq i16 %343, 0
  br i1 %344, label %370, label %345

; <label>:345:                                    ; preds = %341
  %346 = zext i16 %343 to i32
  %347 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.37, i64 0, i64 0), i32 %346)
  %348 = load i16, i16* %342, align 4
  %349 = icmp eq i16 %348, 0
  br i1 %349, label %._crit_edge51, label %.lr.ph50

.lr.ph50:                                         ; preds = %345
  %350 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 31
  br label %351

; <label>:351:                                    ; preds = %.lr.ph50, %365
  %.248 = phi i8* [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.38, i64 0, i64 0), %.lr.ph50 ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i64 0, i64 0), %365 ]
  %.0547 = phi i16 [ 0, %.lr.ph50 ], [ %366, %365 ]
  %352 = load i16*, i16** %350, align 8
  %353 = zext i16 %.0547 to i64
  %354 = getelementptr inbounds i16, i16* %352, i64 %353
  %355 = load i16, i16* %354, align 2
  switch i16 %355, label %362 [
    i16 0, label %356
    i16 1, label %358
    i16 2, label %360
  ]

; <label>:356:                                    ; preds = %351
  %357 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.39, i64 0, i64 0), i8* %.248)
  br label %365

; <label>:358:                                    ; preds = %351
  %359 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.40, i64 0, i64 0), i8* %.248)
  br label %365

; <label>:360:                                    ; preds = %351
  %361 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.41, i64 0, i64 0), i8* %.248)
  br label %365

; <label>:362:                                    ; preds = %351
  %363 = zext i16 %355 to i32
  %364 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.42, i64 0, i64 0), i8* %.248, i32 %363, i32 %363)
  br label %365

; <label>:365:                                    ; preds = %356, %358, %360, %362
  %366 = add i16 %.0547, 1
  %367 = load i16, i16* %342, align 4
  %368 = icmp ult i16 %366, %367
  br i1 %368, label %351, label %._crit_edge51.loopexit

._crit_edge51.loopexit:                           ; preds = %365
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %345
  %369 = tail call i64 @fwrite(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.44, i64 0, i64 0), i64 2, i64 1, %struct._IO_FILE* %1)
  br label %370

; <label>:370:                                    ; preds = %341, %._crit_edge51, %337
  %371 = load i64, i64* %59, align 8
  %372 = and i64 %371, 4194304
  %373 = icmp eq i64 %372, 0
  br i1 %373, label %378, label %374

; <label>:374:                                    ; preds = %370
  %375 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 32
  %376 = load double, double* %375, align 8
  %377 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.45, i64 0, i64 0), double %376)
  br label %378

; <label>:378:                                    ; preds = %370, %374
  %379 = load i64, i64* %59, align 8
  %380 = and i64 %379, 8192
  %381 = icmp eq i64 %380, 0
  br i1 %381, label %391, label %382

; <label>:382:                                    ; preds = %378
  %383 = tail call i64 @fwrite(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i64 0, i64 0), i64 11, i64 1, %struct._IO_FILE* %1)
  %384 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 55
  %385 = load i16, i16* %384, align 8
  %cond = icmp eq i16 %385, 1
  br i1 %cond, label %386, label %388

; <label>:386:                                    ; preds = %382
  %387 = tail call i64 @fwrite(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.47, i64 0, i64 0), i64 5, i64 1, %struct._IO_FILE* %1)
  br label %391

; <label>:388:                                    ; preds = %382
  %389 = zext i16 %385 to i32
  %390 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i64 0, i64 0), i32 %389, i32 %389)
  br label %391

; <label>:391:                                    ; preds = %386, %388, %378
  %392 = load i64, i64* %59, align 8
  %393 = and i64 %392, 16384
  %394 = icmp eq i64 %393, 0
  br i1 %394, label %.loopexit25, label %395

; <label>:395:                                    ; preds = %391
  %396 = tail call i64 @fwrite(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.48, i64 0, i64 0), i64 13, i64 1, %struct._IO_FILE* %1)
  %397 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %398 = load i16, i16* %397, align 2
  %399 = icmp eq i16 %398, 0
  br i1 %399, label %.loopexit25, label %.lr.ph46.preheader

.lr.ph46.preheader:                               ; preds = %395
  %400 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 59
  %401 = load i8*, i8** %400, align 8
  br label %.lr.ph46

.lr.ph46:                                         ; preds = %.lr.ph46.preheader, %.lr.ph46
  %.0144 = phi i8* [ %402, %.lr.ph46 ], [ %401, %.lr.ph46.preheader ]
  %.343 = phi i8* [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i64 0, i64 0), %.lr.ph46 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.38, i64 0, i64 0), %.lr.ph46.preheader ]
  %.1642 = phi i16 [ %403, %.lr.ph46 ], [ %398, %.lr.ph46.preheader ]
  %fputs = tail call i32 @fputs(i8* nonnull %.343, %struct._IO_FILE* %1)
  tail call void @_TIFFprintAscii(%struct._IO_FILE* %1, i8* %.0144)
  %strlen = tail call i64 @strlen(i8* %.0144)
  %strchr = getelementptr i8, i8* %.0144, i64 %strlen
  %402 = getelementptr inbounds i8, i8* %strchr, i64 1
  %403 = add i16 %.1642, -1
  %404 = icmp eq i16 %403, 0
  br i1 %404, label %.loopexit25.loopexit, label %.lr.ph46

.loopexit25.loopexit:                             ; preds = %.lr.ph46
  br label %.loopexit25

.loopexit25:                                      ; preds = %.loopexit25.loopexit, %395, %391
  %405 = load i64, i64* %59, align 8
  %406 = and i64 %405, 262144
  %407 = icmp eq i64 %406, 0
  br i1 %407, label %413, label %408

; <label>:408:                                    ; preds = %.loopexit25
  %409 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 56
  %410 = load i16, i16* %409, align 2
  %411 = zext i16 %410 to i32
  %412 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.50, i64 0, i64 0), i32 %411)
  br label %413

; <label>:413:                                    ; preds = %.loopexit25, %408
  %414 = load i64, i64* %59, align 8
  %415 = trunc i64 %414 to i16
  %416 = icmp slt i16 %415, 0
  br i1 %416, label %417, label %425

; <label>:417:                                    ; preds = %413
  %418 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 57, i64 0
  %419 = load i16, i16* %418, align 4
  %420 = zext i16 %419 to i32
  %421 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 57, i64 1
  %422 = load i16, i16* %421, align 2
  %423 = zext i16 %422 to i32
  %424 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.51, i64 0, i64 0), i32 %420, i32 %423)
  br label %425

; <label>:425:                                    ; preds = %417, %413
  %426 = load i64, i64* %59, align 8
  %427 = and i64 %426, 65536
  %428 = icmp eq i64 %427, 0
  br i1 %428, label %432, label %429

; <label>:429:                                    ; preds = %425
  %430 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 60
  %431 = load i8*, i8** %430, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.52, i64 0, i64 0), i8* %431)
  br label %432

; <label>:432:                                    ; preds = %425, %429
  %433 = load i64, i64* %8, align 8
  %434 = and i64 %433, 512
  %435 = icmp eq i64 %434, 0
  br i1 %435, label %449, label %436

; <label>:436:                                    ; preds = %432
  %437 = tail call i64 @fwrite(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.53, i64 0, i64 0), i64 16, i64 1, %struct._IO_FILE* %1)
  %438 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 12
  %439 = load i16, i16* %438, align 4
  switch i16 %439, label %446 [
    i16 1, label %440
    i16 2, label %442
    i16 3, label %444
  ]

; <label>:440:                                    ; preds = %436
  %441 = tail call i64 @fwrite(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.54, i64 0, i64 0), i64 17, i64 1, %struct._IO_FILE* %1)
  br label %449

; <label>:442:                                    ; preds = %436
  %443 = tail call i64 @fwrite(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.55, i64 0, i64 0), i64 26, i64 1, %struct._IO_FILE* %1)
  br label %449

; <label>:444:                                    ; preds = %436
  %445 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.56, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %1)
  br label %449

; <label>:446:                                    ; preds = %436
  %447 = zext i16 %439 to i32
  %448 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i64 0, i64 0), i32 %447, i32 %447)
  br label %449

; <label>:449:                                    ; preds = %440, %442, %444, %446, %432
  %450 = load i64, i64* %8, align 8
  %451 = and i64 %450, 1024
  %452 = icmp eq i64 %451, 0
  br i1 %452, label %464, label %453

; <label>:453:                                    ; preds = %449
  %454 = tail call i64 @fwrite(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.57, i64 0, i64 0), i64 13, i64 1, %struct._IO_FILE* %1)
  %455 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  %456 = load i16, i16* %455, align 2
  switch i16 %456, label %461 [
    i16 1, label %457
    i16 2, label %459
  ]

; <label>:457:                                    ; preds = %453
  %458 = tail call i64 @fwrite(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.58, i64 0, i64 0), i64 11, i64 1, %struct._IO_FILE* %1)
  br label %464

; <label>:459:                                    ; preds = %453
  %460 = tail call i64 @fwrite(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.59, i64 0, i64 0), i64 11, i64 1, %struct._IO_FILE* %1)
  br label %464

; <label>:461:                                    ; preds = %453
  %462 = zext i16 %456 to i32
  %463 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i64 0, i64 0), i32 %462, i32 %462)
  br label %464

; <label>:464:                                    ; preds = %457, %459, %461, %449
  %465 = load i64, i64* %59, align 8
  %466 = trunc i64 %465 to i8
  %467 = icmp slt i8 %466, 0
  br i1 %467, label %468, label %476

; <label>:468:                                    ; preds = %464
  %469 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 0
  %470 = load i16, i16* %469, align 8
  %471 = zext i16 %470 to i32
  %472 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 1
  %473 = load i16, i16* %472, align 2
  %474 = zext i16 %473 to i32
  %475 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.60, i64 0, i64 0), i32 %471, i32 %474)
  br label %476

; <label>:476:                                    ; preds = %468, %464
  %477 = load i64, i64* %59, align 8
  %478 = and i64 %477, 256
  %479 = icmp eq i64 %478, 0
  br i1 %479, label %491, label %480

; <label>:480:                                    ; preds = %476
  %481 = tail call i64 @fwrite(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.61, i64 0, i64 0), i64 21, i64 1, %struct._IO_FILE* %1)
  %482 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 50
  %483 = load i16, i16* %482, align 4
  switch i16 %483, label %488 [
    i16 1, label %484
    i16 2, label %486
  ]

; <label>:484:                                    ; preds = %480
  %485 = tail call i64 @fwrite(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.62, i64 0, i64 0), i64 9, i64 1, %struct._IO_FILE* %1)
  br label %491

; <label>:486:                                    ; preds = %480
  %487 = tail call i64 @fwrite(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.63, i64 0, i64 0), i64 8, i64 1, %struct._IO_FILE* %1)
  br label %491

; <label>:488:                                    ; preds = %480
  %489 = zext i16 %483 to i32
  %490 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i64 0, i64 0), i32 %489, i32 %489)
  br label %491

; <label>:491:                                    ; preds = %484, %486, %488, %476
  %492 = load i64, i64* %59, align 8
  %493 = and i64 %492, 64
  %494 = icmp eq i64 %493, 0
  br i1 %494, label %507, label %495

; <label>:495:                                    ; preds = %491
  %496 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 48
  %497 = load float*, float** %496, align 8
  %498 = load float, float* %497, align 4
  %499 = fpext float %498 to double
  %500 = getelementptr inbounds float, float* %497, i64 1
  %501 = load float, float* %500, align 4
  %502 = fpext float %501 to double
  %503 = getelementptr inbounds float, float* %497, i64 2
  %504 = load float, float* %503, align 4
  %505 = fpext float %504 to double
  %506 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.64, i64 0, i64 0), double %499, double %502, double %505)
  br label %507

; <label>:507:                                    ; preds = %491, %495
  %508 = load i64, i64* %59, align 8
  %509 = and i64 %508, 32
  %510 = icmp eq i64 %509, 0
  br i1 %510, label %519, label %511

; <label>:511:                                    ; preds = %507
  %512 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 29, i64 0
  %513 = load i16, i16* %512, align 8
  %514 = zext i16 %513 to i32
  %515 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 29, i64 1
  %516 = load i16, i16* %515, align 2
  %517 = zext i16 %516 to i32
  %518 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.65, i64 0, i64 0), i32 %514, i32 %517)
  br label %519

; <label>:519:                                    ; preds = %507, %511
  %520 = load i64, i64* %8, align 8
  %521 = and i64 %520, 134217728
  %522 = icmp eq i64 %521, 0
  br i1 %522, label %526, label %523

; <label>:523:                                    ; preds = %519
  %524 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 34
  %525 = load i8*, i8** %524, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.66, i64 0, i64 0), i8* %525)
  br label %526

; <label>:526:                                    ; preds = %519, %523
  %527 = load i64, i64* %8, align 8
  %528 = and i64 %527, 268435456
  %529 = icmp eq i64 %528, 0
  br i1 %529, label %533, label %530

; <label>:530:                                    ; preds = %526
  %531 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 35
  %532 = load i8*, i8** %531, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.67, i64 0, i64 0), i8* %532)
  br label %533

; <label>:533:                                    ; preds = %526, %530
  %534 = load i64, i64* %8, align 8
  %535 = and i64 %534, 536870912
  %536 = icmp eq i64 %535, 0
  br i1 %536, label %540, label %537

; <label>:537:                                    ; preds = %533
  %538 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 36
  %539 = load i8*, i8** %538, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.68, i64 0, i64 0), i8* %539)
  br label %540

; <label>:540:                                    ; preds = %533, %537
  %541 = load i64, i64* %8, align 8
  %542 = and i64 %541, 1073741824
  %543 = icmp eq i64 %542, 0
  br i1 %543, label %547, label %544

; <label>:544:                                    ; preds = %540
  %545 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 40
  %546 = load i8*, i8** %545, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.69, i64 0, i64 0), i8* %546)
  br label %547

; <label>:547:                                    ; preds = %540, %544
  %548 = load i64, i64* %8, align 8
  %549 = and i64 %548, 2048
  %550 = icmp eq i64 %549, 0
  br i1 %550, label %554, label %551

; <label>:551:                                    ; preds = %547
  %552 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 33
  %553 = load i8*, i8** %552, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.70, i64 0, i64 0), i8* %553)
  br label %554

; <label>:554:                                    ; preds = %547, %551
  %555 = load i64, i64* %8, align 8
  %556 = and i64 %555, 4096
  %557 = icmp eq i64 %556, 0
  br i1 %557, label %561, label %558

; <label>:558:                                    ; preds = %554
  %559 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 37
  %560 = load i8*, i8** %559, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.71, i64 0, i64 0), i8* %560)
  br label %561

; <label>:561:                                    ; preds = %554, %558
  %562 = load i64, i64* %8, align 8
  %563 = and i64 %562, 8192
  %564 = icmp eq i64 %563, 0
  br i1 %564, label %568, label %565

; <label>:565:                                    ; preds = %561
  %566 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 38
  %567 = load i8*, i8** %566, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.72, i64 0, i64 0), i8* %567)
  br label %568

; <label>:568:                                    ; preds = %561, %565
  %569 = load i64, i64* %8, align 8
  %570 = and i64 %569, 16384
  %571 = icmp eq i64 %570, 0
  br i1 %571, label %575, label %572

; <label>:572:                                    ; preds = %568
  %573 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 39
  %574 = load i8*, i8** %573, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.73, i64 0, i64 0), i8* %574)
  br label %575

; <label>:575:                                    ; preds = %568, %572
  %576 = load i64, i64* %8, align 8
  %577 = trunc i64 %576 to i16
  %578 = icmp slt i16 %577, 0
  br i1 %578, label %579, label %592

; <label>:579:                                    ; preds = %575
  %580 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.74, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %1)
  %581 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 14
  %582 = load i16, i16* %581, align 8
  %583 = icmp ult i16 %582, 9
  br i1 %583, label %584, label %589

; <label>:584:                                    ; preds = %579
  %585 = zext i16 %582 to i64
  %586 = getelementptr inbounds [9 x i8*], [9 x i8*]* @orientNames, i64 0, i64 %585
  %587 = load i8*, i8** %586, align 8
  %588 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i64 0, i64 0), i8* %587)
  br label %592

; <label>:589:                                    ; preds = %579
  %590 = zext i16 %582 to i32
  %591 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i64 0, i64 0), i32 %590, i32 %590)
  br label %592

; <label>:592:                                    ; preds = %584, %589, %575
  %593 = load i64, i64* %8, align 8
  %594 = and i64 %593, 65536
  %595 = icmp eq i64 %594, 0
  br i1 %595, label %601, label %596

; <label>:596:                                    ; preds = %592
  %597 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %598 = load i16, i16* %597, align 2
  %599 = zext i16 %598 to i32
  %600 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.75, i64 0, i64 0), i32 %599)
  br label %601

; <label>:601:                                    ; preds = %592, %596
  %602 = load i64, i64* %8, align 8
  %603 = and i64 %602, 131072
  %604 = icmp eq i64 %603, 0
  br i1 %604, label %615, label %605

; <label>:605:                                    ; preds = %601
  %606 = tail call i64 @fwrite(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.76, i64 0, i64 0), i64 14, i64 1, %struct._IO_FILE* %1)
  %607 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %608 = load i32, i32* %607, align 4
  %609 = icmp eq i32 %608, -1
  br i1 %609, label %610, label %612

; <label>:610:                                    ; preds = %605
  %611 = tail call i64 @fwrite(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.77, i64 0, i64 0), i64 11, i64 1, %struct._IO_FILE* %1)
  br label %615

; <label>:612:                                    ; preds = %605
  %613 = zext i32 %608 to i64
  %614 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.78, i64 0, i64 0), i64 %613)
  br label %615

; <label>:615:                                    ; preds = %610, %612, %601
  %616 = load i64, i64* %8, align 8
  %617 = and i64 %616, 262144
  %618 = icmp eq i64 %617, 0
  br i1 %618, label %624, label %619

; <label>:619:                                    ; preds = %615
  %620 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 17
  %621 = load i16, i16* %620, align 8
  %622 = zext i16 %621 to i32
  %623 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.79, i64 0, i64 0), i32 %622)
  br label %624

; <label>:624:                                    ; preds = %615, %619
  %625 = load i64, i64* %8, align 8
  %626 = and i64 %625, 524288
  %627 = icmp eq i64 %626, 0
  br i1 %627, label %633, label %628

; <label>:628:                                    ; preds = %624
  %629 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 18
  %630 = load i16, i16* %629, align 2
  %631 = zext i16 %630 to i32
  %632 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.80, i64 0, i64 0), i32 %631)
  br label %633

; <label>:633:                                    ; preds = %624, %628
  %634 = load i64, i64* %59, align 8
  %635 = and i64 %634, 2
  %636 = icmp eq i64 %635, 0
  br i1 %636, label %641, label %637

; <label>:637:                                    ; preds = %633
  %638 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 19
  %639 = load double, double* %638, align 8
  %640 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.81, i64 0, i64 0), double %639)
  br label %641

; <label>:641:                                    ; preds = %633, %637
  %642 = load i64, i64* %59, align 8
  %643 = and i64 %642, 4
  %644 = icmp eq i64 %643, 0
  br i1 %644, label %649, label %645

; <label>:645:                                    ; preds = %641
  %646 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 20
  %647 = load double, double* %646, align 8
  %648 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.82, i64 0, i64 0), double %647)
  br label %649

; <label>:649:                                    ; preds = %641, %645
  %650 = load i64, i64* %8, align 8
  %651 = and i64 %650, 1048576
  %652 = icmp eq i64 %651, 0
  br i1 %652, label %664, label %653

; <label>:653:                                    ; preds = %649
  %654 = tail call i64 @fwrite(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.83, i64 0, i64 0), i64 24, i64 1, %struct._IO_FILE* %1)
  %655 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %656 = load i16, i16* %655, align 2
  switch i16 %656, label %661 [
    i16 1, label %657
    i16 2, label %659
  ]

; <label>:657:                                    ; preds = %653
  %658 = tail call i64 @fwrite(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.84, i64 0, i64 0), i64 19, i64 1, %struct._IO_FILE* %1)
  br label %664

; <label>:659:                                    ; preds = %653
  %660 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.85, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1)
  br label %664

; <label>:661:                                    ; preds = %653
  %662 = zext i16 %656 to i32
  %663 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i64 0, i64 0), i32 %662, i32 %662)
  br label %664

; <label>:664:                                    ; preds = %657, %659, %661, %649
  %665 = load i64, i64* %8, align 8
  %666 = and i64 %665, 2097152
  %667 = icmp eq i64 %666, 0
  br i1 %667, label %671, label %668

; <label>:668:                                    ; preds = %664
  %669 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 41
  %670 = load i8*, i8** %669, align 8
  tail call void @_TIFFprintAsciiTag(%struct._IO_FILE* %1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.86, i64 0, i64 0), i8* %670)
  br label %671

; <label>:671:                                    ; preds = %664, %668
  %672 = load i64, i64* %8, align 8
  %673 = and i64 %672, 8388608
  %674 = icmp eq i64 %673, 0
  br i1 %674, label %683, label %675

; <label>:675:                                    ; preds = %671
  %676 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 27, i64 0
  %677 = load i16, i16* %676, align 4
  %678 = zext i16 %677 to i32
  %679 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 27, i64 1
  %680 = load i16, i16* %679, align 2
  %681 = zext i16 %680 to i32
  %682 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.87, i64 0, i64 0), i32 %678, i32 %681)
  br label %683

; <label>:683:                                    ; preds = %671, %675
  %684 = load i64, i64* %8, align 8
  %685 = and i64 %684, 67108864
  %686 = icmp eq i64 %685, 0
  br i1 %686, label %.loopexit24, label %687

; <label>:687:                                    ; preds = %683
  %688 = tail call i64 @fwrite(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.88, i64 0, i64 0), i64 13, i64 1, %struct._IO_FILE* %1)
  %689 = and i64 %2, 4
  %690 = icmp eq i64 %689, 0
  br i1 %690, label %716, label %691

; <label>:691:                                    ; preds = %687
  %fputc17 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %1)
  %692 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %693 = load i16, i16* %692, align 4
  %694 = zext i16 %693 to i64
  %695 = shl i64 1, %694
  %696 = icmp eq i16 %693, 63
  br i1 %696, label %.loopexit24, label %.lr.ph41

.lr.ph41:                                         ; preds = %691
  %697 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 0
  %698 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 1
  %699 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 2
  br label %700

; <label>:700:                                    ; preds = %.lr.ph41, %700
  %.0239 = phi i64 [ 0, %.lr.ph41 ], [ %714, %700 ]
  %701 = load i16*, i16** %697, align 8
  %702 = getelementptr inbounds i16, i16* %701, i64 %.0239
  %703 = load i16, i16* %702, align 2
  %704 = zext i16 %703 to i32
  %705 = load i16*, i16** %698, align 8
  %706 = getelementptr inbounds i16, i16* %705, i64 %.0239
  %707 = load i16, i16* %706, align 2
  %708 = zext i16 %707 to i32
  %709 = load i16*, i16** %699, align 8
  %710 = getelementptr inbounds i16, i16* %709, i64 %.0239
  %711 = load i16, i16* %710, align 2
  %712 = zext i16 %711 to i32
  %713 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.89, i64 0, i64 0), i64 %.0239, i32 %704, i32 %708, i32 %712)
  %714 = add nuw nsw i64 %.0239, 1
  %715 = icmp slt i64 %714, %695
  br i1 %715, label %700, label %.loopexit24.loopexit

; <label>:716:                                    ; preds = %687
  %717 = tail call i64 @fwrite(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.90, i64 0, i64 0), i64 10, i64 1, %struct._IO_FILE* %1)
  br label %.loopexit24

.loopexit24.loopexit:                             ; preds = %700
  br label %.loopexit24

.loopexit24:                                      ; preds = %.loopexit24.loopexit, %691, %716, %683
  %718 = load i64, i64* %59, align 8
  %719 = and i64 %718, 1024
  %720 = icmp eq i64 %719, 0
  br i1 %720, label %730, label %721

; <label>:721:                                    ; preds = %.loopexit24
  %722 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 51
  %723 = load float*, float** %722, align 8
  %724 = load float, float* %723, align 4
  %725 = fpext float %724 to double
  %726 = getelementptr inbounds float, float* %723, i64 1
  %727 = load float, float* %726, align 4
  %728 = fpext float %727 to double
  %729 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.91, i64 0, i64 0), double %725, double %728)
  br label %730

; <label>:730:                                    ; preds = %.loopexit24, %721
  %731 = load i64, i64* %59, align 8
  %732 = and i64 %731, 2048
  %733 = icmp eq i64 %732, 0
  br i1 %733, label %755, label %734

; <label>:734:                                    ; preds = %730
  %735 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 52
  %736 = load float*, float** %735, align 8
  %737 = load float, float* %736, align 4
  %738 = fpext float %737 to double
  %739 = getelementptr inbounds float, float* %736, i64 1
  %740 = load float, float* %739, align 4
  %741 = fpext float %740 to double
  %742 = getelementptr inbounds float, float* %736, i64 2
  %743 = load float, float* %742, align 4
  %744 = fpext float %743 to double
  %745 = getelementptr inbounds float, float* %736, i64 3
  %746 = load float, float* %745, align 4
  %747 = fpext float %746 to double
  %748 = getelementptr inbounds float, float* %736, i64 4
  %749 = load float, float* %748, align 4
  %750 = fpext float %749 to double
  %751 = getelementptr inbounds float, float* %736, i64 5
  %752 = load float, float* %751, align 4
  %753 = fpext float %752 to double
  %754 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.92, i64 0, i64 0), double %738, double %741, double %744, double %747, double %750, double %753)
  br label %755

; <label>:755:                                    ; preds = %730, %734
  %756 = load i64, i64* %59, align 8
  %757 = and i64 %756, 512
  %758 = icmp eq i64 %757, 0
  br i1 %758, label %.loopexit23, label %759

; <label>:759:                                    ; preds = %755
  %760 = tail call i64 @fwrite(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.93, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %1)
  %761 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %762 = load i16, i16* %761, align 2
  %763 = icmp eq i16 %762, 0
  br i1 %763, label %.loopexit23, label %.lr.ph38

.lr.ph38:                                         ; preds = %759
  %764 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 53
  br label %765

; <label>:765:                                    ; preds = %.lr.ph38, %765
  %.2736 = phi i16 [ 0, %.lr.ph38 ], [ %778, %765 ]
  %766 = zext i16 %.2736 to i32
  %767 = load float*, float** %764, align 8
  %768 = zext i16 %.2736 to i64
  %769 = shl nuw nsw i64 %768, 1
  %770 = getelementptr inbounds float, float* %767, i64 %769
  %771 = load float, float* %770, align 4
  %772 = fpext float %771 to double
  %773 = or i64 %769, 1
  %774 = getelementptr inbounds float, float* %767, i64 %773
  %775 = load float, float* %774, align 4
  %776 = fpext float %775 to double
  %777 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.94, i64 0, i64 0), i32 %766, double %772, double %776)
  %778 = add i16 %.2736, 1
  %779 = load i16, i16* %761, align 2
  %780 = icmp ult i16 %778, %779
  br i1 %780, label %765, label %.loopexit23.loopexit

.loopexit23.loopexit:                             ; preds = %765
  br label %.loopexit23

.loopexit23:                                      ; preds = %.loopexit23.loopexit, %759, %755
  %781 = load i64, i64* %59, align 8
  %782 = and i64 %781, 4096
  %783 = icmp eq i64 %782, 0
  br i1 %783, label %.loopexit22, label %784

; <label>:784:                                    ; preds = %.loopexit23
  %785 = tail call i64 @fwrite(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.95, i64 0, i64 0), i64 21, i64 1, %struct._IO_FILE* %1)
  %786 = and i64 %2, 2
  %787 = icmp eq i64 %786, 0
  br i1 %787, label %817, label %788

; <label>:788:                                    ; preds = %784
  %fputc20 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %1)
  %789 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %790 = load i16, i16* %789, align 4
  %791 = zext i16 %790 to i64
  %792 = shl i64 1, %791
  %793 = icmp eq i16 %790, 63
  br i1 %793, label %.loopexit22, label %.lr.ph35

.lr.ph35:                                         ; preds = %788
  %794 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 0
  %795 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  br label %796

; <label>:796:                                    ; preds = %.lr.ph35, %._crit_edge32
  %.133 = phi i64 [ 0, %.lr.ph35 ], [ %815, %._crit_edge32 ]
  %797 = load i16*, i16** %794, align 8
  %798 = getelementptr inbounds i16, i16* %797, i64 %.133
  %799 = load i16, i16* %798, align 2
  %800 = zext i16 %799 to i32
  %801 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.96, i64 0, i64 0), i64 %.133, i32 %800)
  %802 = load i16, i16* %795, align 2
  %803 = icmp ugt i16 %802, 1
  br i1 %803, label %.lr.ph31.preheader, label %._crit_edge32

.lr.ph31.preheader:                               ; preds = %796
  br label %.lr.ph31

.lr.ph31:                                         ; preds = %.lr.ph31.preheader, %.lr.ph31
  %.3829 = phi i16 [ %811, %.lr.ph31 ], [ 1, %.lr.ph31.preheader ]
  %804 = zext i16 %.3829 to i64
  %805 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 %804
  %806 = load i16*, i16** %805, align 8
  %807 = getelementptr inbounds i16, i16* %806, i64 %.133
  %808 = load i16, i16* %807, align 2
  %809 = zext i16 %808 to i32
  %810 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.97, i64 0, i64 0), i32 %809)
  %811 = add i16 %.3829, 1
  %812 = load i16, i16* %795, align 2
  %813 = icmp ult i16 %811, %812
  br i1 %813, label %.lr.ph31, label %._crit_edge32.loopexit

._crit_edge32.loopexit:                           ; preds = %.lr.ph31
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %796
  %814 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %1)
  %815 = add nuw nsw i64 %.133, 1
  %816 = icmp slt i64 %815, %792
  br i1 %816, label %796, label %.loopexit22.loopexit

; <label>:817:                                    ; preds = %784
  %818 = tail call i64 @fwrite(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.90, i64 0, i64 0), i64 10, i64 1, %struct._IO_FILE* %1)
  br label %.loopexit22

.loopexit22.loopexit:                             ; preds = %._crit_edge32
  br label %.loopexit22

.loopexit22:                                      ; preds = %.loopexit22.loopexit, %788, %817, %.loopexit23
  %819 = load i64, i64* %59, align 8
  %820 = and i64 %819, 524288
  %821 = icmp eq i64 %820, 0
  br i1 %821, label %827, label %822

; <label>:822:                                    ; preds = %.loopexit22
  %823 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 61
  %824 = load i32, i32* %823, align 8
  %825 = zext i32 %824 to i64
  %826 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.98, i64 0, i64 0), i64 %825)
  br label %827

; <label>:827:                                    ; preds = %.loopexit22, %822
  %828 = load i64, i64* %59, align 8
  %829 = and i64 %828, 1048576
  %830 = icmp eq i64 %829, 0
  br i1 %830, label %836, label %831

; <label>:831:                                    ; preds = %827
  %832 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 63
  %833 = load i32, i32* %832, align 8
  %834 = zext i32 %833 to i64
  %835 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.99, i64 0, i64 0), i64 %834)
  br label %836

; <label>:836:                                    ; preds = %827, %831
  %837 = load i64, i64* %59, align 8
  %838 = and i64 %837, 2097152
  %839 = icmp eq i64 %838, 0
  br i1 %839, label %845, label %840

; <label>:840:                                    ; preds = %836
  %841 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 65
  %842 = load i32, i32* %841, align 8
  %843 = zext i32 %842 to i64
  %844 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.100, i64 0, i64 0), i64 %843)
  br label %845

; <label>:845:                                    ; preds = %836, %840
  %846 = load i64, i64* %59, align 8
  %847 = and i64 %846, 131072
  %848 = icmp eq i64 %847, 0
  br i1 %848, label %866, label %849

; <label>:849:                                    ; preds = %845
  %850 = tail call i64 @fwrite(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.101, i64 0, i64 0), i64 17, i64 1, %struct._IO_FILE* %1)
  %851 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 46
  %852 = load i16, i16* %851, align 8
  %853 = icmp eq i16 %852, 0
  br i1 %853, label %._crit_edge, label %.lr.ph28

.lr.ph28:                                         ; preds = %849
  %854 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 47
  br label %855

; <label>:855:                                    ; preds = %.lr.ph28, %855
  %.427 = phi i16 [ 0, %.lr.ph28 ], [ %862, %855 ]
  %856 = load i32*, i32** %854, align 8
  %857 = zext i16 %.427 to i64
  %858 = getelementptr inbounds i32, i32* %856, i64 %857
  %859 = load i32, i32* %858, align 4
  %860 = zext i32 %859 to i64
  %861 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.102, i64 0, i64 0), i64 %860)
  %862 = add i16 %.427, 1
  %863 = load i16, i16* %851, align 8
  %864 = icmp ult i16 %862, %863
  br i1 %864, label %855, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %855
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %849
  %865 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %1)
  br label %866

; <label>:866:                                    ; preds = %845, %._crit_edge
  %867 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 59
  %868 = bitcast {}** %867 to void (%struct.tiff*, %struct._IO_FILE*, i64)**
  %869 = load void (%struct.tiff*, %struct._IO_FILE*, i64)*, void (%struct.tiff*, %struct._IO_FILE*, i64)** %868, align 8
  %870 = icmp eq void (%struct.tiff*, %struct._IO_FILE*, i64)* %869, null
  br i1 %870, label %872, label %871

; <label>:871:                                    ; preds = %866
  tail call void %869(%struct.tiff* nonnull %0, %struct._IO_FILE* %1, i64 %2) #4
  br label %872

; <label>:872:                                    ; preds = %866, %871
  %873 = and i64 %2, 1
  %874 = icmp eq i64 %873, 0
  br i1 %874, label %.loopexit, label %875

; <label>:875:                                    ; preds = %872
  %876 = load i64, i64* %8, align 8
  %877 = and i64 %876, 33554432
  %878 = icmp eq i64 %877, 0
  br i1 %878, label %.loopexit, label %879

; <label>:879:                                    ; preds = %875
  %880 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %881 = load i32, i32* %880, align 4
  %882 = zext i32 %881 to i64
  %883 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %884 = load i32, i32* %883, align 8
  %885 = and i32 %884, 1024
  %886 = icmp ne i32 %885, 0
  %887 = select i1 %886, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.104, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.105, i64 0, i64 0)
  %888 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.103, i64 0, i64 0), i64 %882, i8* %887)
  %889 = load i32, i32* %880, align 4
  %890 = icmp eq i32 %889, 0
  br i1 %890, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %879
  %891 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %892 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  br label %893

; <label>:893:                                    ; preds = %.lr.ph, %893
  %.026 = phi i32 [ 0, %.lr.ph ], [ %904, %893 ]
  %894 = zext i32 %.026 to i64
  %895 = load i32*, i32** %891, align 8
  %896 = getelementptr inbounds i32, i32* %895, i64 %894
  %897 = load i32, i32* %896, align 4
  %898 = zext i32 %897 to i64
  %899 = load i32*, i32** %892, align 8
  %900 = getelementptr inbounds i32, i32* %899, i64 %894
  %901 = load i32, i32* %900, align 4
  %902 = zext i32 %901 to i64
  %903 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.106, i64 0, i64 0), i64 %894, i64 %898, i64 %902)
  %904 = add i32 %.026, 1
  %905 = load i32, i32* %880, align 4
  %906 = icmp ult i32 %904, %905
  br i1 %906, label %893, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %893
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %879, %875, %872
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFprintAsciiTag(%struct._IO_FILE* nocapture, i8*, i8* nocapture readonly) local_unnamed_addr #0 {
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.110, i64 0, i64 0), i8* %1)
  tail call void @_TIFFprintAscii(%struct._IO_FILE* %0, i8* %2)
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.111, i64 0, i64 0), i64 2, i64 1, %struct._IO_FILE* %0)
  ret void
}

declare %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @_TIFFprintAscii(%struct._IO_FILE* nocapture, i8* nocapture readonly) local_unnamed_addr #0 {
  %3 = load i8, i8* %1, align 1
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %2
  %5 = tail call i16** @__ctype_b_loc() #6
  br label %6

; <label>:6:                                      ; preds = %.lr.ph, %32
  %7 = phi i8 [ %3, %.lr.ph ], [ %34, %32 ]
  %.014 = phi i8* [ %1, %.lr.ph ], [ %33, %32 ]
  %8 = load i16*, i16** %5, align 8
  %9 = sext i8 %7 to i64
  %10 = getelementptr inbounds i16, i16* %8, i64 %9
  %11 = load i16, i16* %10, align 2
  %12 = and i16 %11, 16384
  %13 = icmp eq i16 %12, 0
  br i1 %13, label %17, label %14

; <label>:14:                                     ; preds = %6
  %15 = sext i8 %7 to i32
  %16 = tail call i32 @fputc(i32 %15, %struct._IO_FILE* %0)
  br label %32

; <label>:17:                                     ; preds = %6
  %18 = load i8, i8* %.014, align 1
  %switch.tableidx = add i8 %18, -8
  %19 = icmp ult i8 %switch.tableidx, 6
  br i1 %19, label %switch.hole_check, label %.loopexit

switch.hole_check:                                ; preds = %17
  %switch.shifted = lshr i8 47, %switch.tableidx
  %20 = and i8 %switch.shifted, 1
  %switch.lobit = icmp eq i8 %20, 0
  br i1 %switch.lobit, label %.loopexit, label %switch.lookup

switch.lookup:                                    ; preds = %switch.hole_check
  %21 = sext i8 %switch.tableidx to i64
  %switch.gep = getelementptr inbounds [6 x i8*], [6 x i8*]* @switch.table, i64 0, i64 %21
  %switch.load = load i8*, i8** %switch.gep, align 8
  %22 = getelementptr inbounds i8, i8* %switch.load, i64 1
  br label %.loopexit

.loopexit:                                        ; preds = %switch.hole_check, %17, %switch.lookup
  %.1 = phi i8* [ %22, %switch.lookup ], [ getelementptr inbounds ([11 x i8], [11 x i8]* @.str.107, i64 0, i64 10), %17 ], [ getelementptr inbounds ([11 x i8], [11 x i8]* @.str.107, i64 0, i64 10), %switch.hole_check ]
  %23 = load i8, i8* %.1, align 1
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %28, label %25

; <label>:25:                                     ; preds = %.loopexit
  %26 = sext i8 %23 to i32
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.108, i64 0, i64 0), i32 %26)
  br label %32

; <label>:28:                                     ; preds = %.loopexit
  %29 = load i8, i8* %.014, align 1
  %30 = zext i8 %29 to i32
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.109, i64 0, i64 0), i32 %30)
  br label %32

; <label>:32:                                     ; preds = %25, %28, %14
  %33 = getelementptr inbounds i8, i8* %.014, i64 1
  %34 = load i8, i8* %33, align 1
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %._crit_edge.loopexit, label %6

._crit_edge.loopexit:                             ; preds = %32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret void
}

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputs(i8* nocapture readonly, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
