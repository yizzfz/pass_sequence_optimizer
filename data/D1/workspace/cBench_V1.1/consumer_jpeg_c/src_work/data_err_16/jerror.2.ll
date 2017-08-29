; ModuleID = 'tmp1.ll'
source_filename = "jerror.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [22 x i8] c"Bogus message code %d\00", align 1
@.str.1 = private unnamed_addr constant [57 x i8] c"Sorry, there are legal restrictions on arithmetic coding\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"ALIGN_TYPE is wrong, please fix\00", align 1
@.str.3 = private unnamed_addr constant [37 x i8] c"MAX_ALLOC_CHUNK is wrong, please fix\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"Bogus buffer control mode\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"Invalid component ID %d in SOS\00", align 1
@.str.6 = private unnamed_addr constant [40 x i8] c"IDCT output block size %d not supported\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"Bogus input colorspace\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"Bogus JPEG colorspace\00", align 1
@.str.9 = private unnamed_addr constant [20 x i8] c"Bogus marker length\00", align 1
@.str.10 = private unnamed_addr constant [61 x i8] c"Wrong JPEG library version: library is %d, caller expects %d\00", align 1
@.str.11 = private unnamed_addr constant [48 x i8] c"Sampling factors too large for interleaved scan\00", align 1
@.str.12 = private unnamed_addr constant [28 x i8] c"Invalid memory pool code %d\00", align 1
@.str.13 = private unnamed_addr constant [35 x i8] c"Unsupported JPEG data precision %d\00", align 1
@.str.14 = private unnamed_addr constant [55 x i8] c"Invalid progressive parameters Ss=%d Se=%d Ah=%d Al=%d\00", align 1
@.str.15 = private unnamed_addr constant [55 x i8] c"Invalid progressive parameters at scan script entry %d\00", align 1
@.str.16 = private unnamed_addr constant [23 x i8] c"Bogus sampling factors\00", align 1
@.str.17 = private unnamed_addr constant [32 x i8] c"Invalid scan script at entry %d\00", align 1
@.str.18 = private unnamed_addr constant [42 x i8] c"Improper call to JPEG library in state %d\00", align 1
@.str.19 = private unnamed_addr constant [77 x i8] c"JPEG parameter struct mismatch: library thinks size is %u, caller expects %u\00", align 1
@.str.20 = private unnamed_addr constant [27 x i8] c"Bogus virtual array access\00", align 1
@.str.21 = private unnamed_addr constant [43 x i8] c"Buffer passed to JPEG library is too small\00", align 1
@.str.22 = private unnamed_addr constant [28 x i8] c"Suspension not allowed here\00", align 1
@.str.23 = private unnamed_addr constant [37 x i8] c"CCIR601 sampling not implemented yet\00", align 1
@.str.24 = private unnamed_addr constant [38 x i8] c"Too many color components: %d, max %d\00", align 1
@.str.25 = private unnamed_addr constant [37 x i8] c"Unsupported color conversion request\00", align 1
@.str.26 = private unnamed_addr constant [19 x i8] c"Bogus DAC index %d\00", align 1
@.str.27 = private unnamed_addr constant [21 x i8] c"Bogus DAC value 0x%x\00", align 1
@.str.28 = private unnamed_addr constant [17 x i8] c"Bogus DHT counts\00", align 1
@.str.29 = private unnamed_addr constant [19 x i8] c"Bogus DHT index %d\00", align 1
@.str.30 = private unnamed_addr constant [19 x i8] c"Bogus DQT index %d\00", align 1
@.str.31 = private unnamed_addr constant [37 x i8] c"Empty JPEG image (DNL not supported)\00", align 1
@.str.32 = private unnamed_addr constant [21 x i8] c"Read from EMS failed\00", align 1
@.str.33 = private unnamed_addr constant [20 x i8] c"Write to EMS failed\00", align 1
@.str.34 = private unnamed_addr constant [33 x i8] c"Didn't expect more than one scan\00", align 1
@.str.35 = private unnamed_addr constant [22 x i8] c"Input file read error\00", align 1
@.str.36 = private unnamed_addr constant [47 x i8] c"Output file write error --- out of disk space?\00", align 1
@.str.37 = private unnamed_addr constant [40 x i8] c"Fractional sampling not implemented yet\00", align 1
@.str.38 = private unnamed_addr constant [33 x i8] c"Huffman code size table overflow\00", align 1
@.str.39 = private unnamed_addr constant [33 x i8] c"Missing Huffman code table entry\00", align 1
@.str.40 = private unnamed_addr constant [47 x i8] c"Maximum supported image dimension is %u pixels\00", align 1
@.str.41 = private unnamed_addr constant [17 x i8] c"Empty input file\00", align 1
@.str.42 = private unnamed_addr constant [28 x i8] c"Premature end of input file\00", align 1
@.str.43 = private unnamed_addr constant [62 x i8] c"Cannot transcode due to multiple use of quantization table %d\00", align 1
@.str.44 = private unnamed_addr constant [39 x i8] c"Scan script does not transmit all data\00", align 1
@.str.45 = private unnamed_addr constant [39 x i8] c"Invalid color quantization mode change\00", align 1
@.str.46 = private unnamed_addr constant [20 x i8] c"Not implemented yet\00", align 1
@.str.47 = private unnamed_addr constant [46 x i8] c"Requested feature was omitted at compile time\00", align 1
@.str.48 = private unnamed_addr constant [28 x i8] c"Backing store not supported\00", align 1
@.str.49 = private unnamed_addr constant [37 x i8] c"Huffman table 0x%02x was not defined\00", align 1
@.str.50 = private unnamed_addr constant [34 x i8] c"JPEG datastream contains no image\00", align 1
@.str.51 = private unnamed_addr constant [42 x i8] c"Quantization table 0x%02x was not defined\00", align 1
@.str.52 = private unnamed_addr constant [43 x i8] c"Not a JPEG file: starts with 0x%02x 0x%02x\00", align 1
@.str.53 = private unnamed_addr constant [30 x i8] c"Insufficient memory (case %d)\00", align 1
@.str.54 = private unnamed_addr constant [46 x i8] c"Cannot quantize more than %d color components\00", align 1
@.str.55 = private unnamed_addr constant [40 x i8] c"Cannot quantize to fewer than %d colors\00", align 1
@.str.56 = private unnamed_addr constant [39 x i8] c"Cannot quantize to more than %d colors\00", align 1
@.str.57 = private unnamed_addr constant [45 x i8] c"Invalid JPEG file structure: two SOF markers\00", align 1
@.str.58 = private unnamed_addr constant [48 x i8] c"Invalid JPEG file structure: missing SOS marker\00", align 1
@.str.59 = private unnamed_addr constant [42 x i8] c"Unsupported JPEG process: SOF type 0x%02x\00", align 1
@.str.60 = private unnamed_addr constant [45 x i8] c"Invalid JPEG file structure: two SOI markers\00", align 1
@.str.61 = private unnamed_addr constant [44 x i8] c"Invalid JPEG file structure: SOS before SOF\00", align 1
@.str.62 = private unnamed_addr constant [35 x i8] c"Failed to create temporary file %s\00", align 1
@.str.63 = private unnamed_addr constant [30 x i8] c"Read failed on temporary file\00", align 1
@.str.64 = private unnamed_addr constant [30 x i8] c"Seek failed on temporary file\00", align 1
@.str.65 = private unnamed_addr constant [54 x i8] c"Write failed on temporary file --- out of disk space?\00", align 1
@.str.66 = private unnamed_addr constant [42 x i8] c"Application transferred too few scanlines\00", align 1
@.str.67 = private unnamed_addr constant [31 x i8] c"Unsupported marker type 0x%02x\00", align 1
@.str.68 = private unnamed_addr constant [35 x i8] c"Virtual array controller messed up\00", align 1
@.str.69 = private unnamed_addr constant [39 x i8] c"Image too wide for this implementation\00", align 1
@.str.70 = private unnamed_addr constant [21 x i8] c"Read from XMS failed\00", align 1
@.str.71 = private unnamed_addr constant [20 x i8] c"Write to XMS failed\00", align 1
@.str.72 = private unnamed_addr constant [35 x i8] c"Copyright (C) 1996, Thomas G. Lane\00", align 1
@.str.73 = private unnamed_addr constant [13 x i8] c"6a  7-Feb-96\00", align 1
@.str.74 = private unnamed_addr constant [62 x i8] c"Caution: quantization tables are too coarse for baseline JPEG\00", align 1
@.str.75 = private unnamed_addr constant [66 x i8] c"Adobe APP14 marker: version %d, flags 0x%04x 0x%04x, transform %d\00", align 1
@.str.76 = private unnamed_addr constant [42 x i8] c"Unknown APP0 marker (not JFIF), length %u\00", align 1
@.str.77 = private unnamed_addr constant [44 x i8] c"Unknown APP14 marker (not Adobe), length %u\00", align 1
@.str.78 = private unnamed_addr constant [39 x i8] c"Define Arithmetic Table 0x%02x: 0x%02x\00", align 1
@.str.79 = private unnamed_addr constant [28 x i8] c"Define Huffman Table 0x%02x\00", align 1
@.str.80 = private unnamed_addr constant [43 x i8] c"Define Quantization Table %d  precision %d\00", align 1
@.str.81 = private unnamed_addr constant [27 x i8] c"Define Restart Interval %u\00", align 1
@.str.82 = private unnamed_addr constant [20 x i8] c"Freed EMS handle %u\00", align 1
@.str.83 = private unnamed_addr constant [23 x i8] c"Obtained EMS handle %u\00", align 1
@.str.84 = private unnamed_addr constant [13 x i8] c"End Of Image\00", align 1
@.str.85 = private unnamed_addr constant [40 x i8] c"        %3d %3d %3d %3d %3d %3d %3d %3d\00", align 1
@.str.86 = private unnamed_addr constant [36 x i8] c"JFIF APP0 marker, density %dx%d  %d\00", align 1
@.str.87 = private unnamed_addr constant [60 x i8] c"Warning: thumbnail image size does not match data length %u\00", align 1
@.str.88 = private unnamed_addr constant [43 x i8] c"Unknown JFIF minor revision number %d.%02d\00", align 1
@.str.89 = private unnamed_addr constant [33 x i8] c"    with %d x %d thumbnail image\00", align 1
@.str.90 = private unnamed_addr constant [34 x i8] c"Skipping marker 0x%02x, length %u\00", align 1
@.str.91 = private unnamed_addr constant [25 x i8] c"Unexpected marker 0x%02x\00", align 1
@.str.92 = private unnamed_addr constant [40 x i8] c"        %4u %4u %4u %4u %4u %4u %4u %4u\00", align 1
@.str.93 = private unnamed_addr constant [35 x i8] c"Quantizing to %d = %d*%d*%d colors\00", align 1
@.str.94 = private unnamed_addr constant [24 x i8] c"Quantizing to %d colors\00", align 1
@.str.95 = private unnamed_addr constant [36 x i8] c"Selected %d colors for quantization\00", align 1
@.str.96 = private unnamed_addr constant [37 x i8] c"At marker 0x%02x, recovery action %d\00", align 1
@.str.97 = private unnamed_addr constant [6 x i8] c"RST%d\00", align 1
@.str.98 = private unnamed_addr constant [57 x i8] c"Smoothing not supported with nonstandard sampling ratios\00", align 1
@.str.99 = private unnamed_addr constant [58 x i8] c"Start Of Frame 0x%02x: width=%u, height=%u, components=%d\00", align 1
@.str.100 = private unnamed_addr constant [31 x i8] c"    Component %d: %dhx%dv q=%d\00", align 1
@.str.101 = private unnamed_addr constant [15 x i8] c"Start of Image\00", align 1
@.str.102 = private unnamed_addr constant [29 x i8] c"Start Of Scan: %d components\00", align 1
@.str.103 = private unnamed_addr constant [30 x i8] c"    Component %d: dc=%d ac=%d\00", align 1
@.str.104 = private unnamed_addr constant [29 x i8] c"  Ss=%d, Se=%d, Ah=%d, Al=%d\00", align 1
@.str.105 = private unnamed_addr constant [25 x i8] c"Closed temporary file %s\00", align 1
@.str.106 = private unnamed_addr constant [25 x i8] c"Opened temporary file %s\00", align 1
@.str.107 = private unnamed_addr constant [52 x i8] c"Unrecognized component IDs %d %d %d, assuming YCbCr\00", align 1
@.str.108 = private unnamed_addr constant [20 x i8] c"Freed XMS handle %u\00", align 1
@.str.109 = private unnamed_addr constant [23 x i8] c"Obtained XMS handle %u\00", align 1
@.str.110 = private unnamed_addr constant [38 x i8] c"Unknown Adobe color transform code %d\00", align 1
@.str.111 = private unnamed_addr constant [66 x i8] c"Inconsistent progression sequence for component %d coefficient %d\00", align 1
@.str.112 = private unnamed_addr constant [60 x i8] c"Corrupt JPEG data: %u extraneous bytes before marker 0x%02x\00", align 1
@.str.113 = private unnamed_addr constant [49 x i8] c"Corrupt JPEG data: premature end of data segment\00", align 1
@.str.114 = private unnamed_addr constant [36 x i8] c"Corrupt JPEG data: bad Huffman code\00", align 1
@.str.115 = private unnamed_addr constant [46 x i8] c"Warning: unknown JFIF revision number %d.%02d\00", align 1
@.str.116 = private unnamed_addr constant [27 x i8] c"Premature end of JPEG file\00", align 1
@.str.117 = private unnamed_addr constant [56 x i8] c"Corrupt JPEG data: found marker 0x%02x instead of RST%d\00", align 1
@.str.118 = private unnamed_addr constant [43 x i8] c"Invalid SOS parameters for sequential JPEG\00", align 1
@.str.119 = private unnamed_addr constant [43 x i8] c"Application transferred too many scanlines\00", align 1
@jpeg_std_message_table = constant [121 x i8*] [i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.39, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.44, i32 0, i32 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.45, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.46, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.47, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.49, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.50, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.51, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.52, i32 0, i32 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.53, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.54, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.55, i32 0, i32 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.56, i32 0, i32 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.57, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.58, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.59, i32 0, i32 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.60, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.63, i32 0, i32 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.64, i32 0, i32 0), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.65, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.66, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.67, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.68, i32 0, i32 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.69, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.70, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.71, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.72, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.73, i32 0, i32 0), i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.74, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.75, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.77, i32 0, i32 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.78, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.79, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.80, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.81, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.83, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.84, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.85, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.86, i32 0, i32 0), i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.87, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.88, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.89, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.90, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.91, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.92, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.93, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.94, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.95, i32 0, i32 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.96, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.97, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.98, i32 0, i32 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.99, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.100, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.101, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.102, i32 0, i32 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.104, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.105, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.106, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.107, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.108, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.109, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.110, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.111, i32 0, i32 0), i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.112, i32 0, i32 0), i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.113, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.114, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.115, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.116, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.117, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.118, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.119, i32 0, i32 0), i8* null], align 16
@stderr = external global %struct._IO_FILE*, align 8
@.str.120 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_std_error = private constant [14 x i8] c"jpeg_std_error"
@__profn_tmp1.ll_error_exit = private constant [18 x i8] c"tmp1.ll:error_exit"
@__profn_tmp1.ll_emit_message = private constant [20 x i8] c"tmp1.ll:emit_message"
@__profn_tmp1.ll_output_message = private constant [22 x i8] c"tmp1.ll:output_message"
@__profn_tmp1.ll_format_message = private constant [22 x i8] c"tmp1.ll:format_message"
@__profn_tmp1.ll_reset_error_mgr = private constant [23 x i8] c"tmp1.ll:reset_error_mgr"
@__profc_jpeg_std_error = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_std_error = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1058090775856073801, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_std_error, i32 0, i32 0), i8* bitcast (%struct.jpeg_error_mgr* (%struct.jpeg_error_mgr*)* @jpeg_std_error to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_error_exit = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_error_exit = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_error_exit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -874370577001356343, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_error_exit, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*)* @error_exit to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_error_exit to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_message = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_emit_message = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_emit_message = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9124810655980576735, i64 563011100111938, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_emit_message, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*, i32)* @emit_message to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_emit_message to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_output_message = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_output_message = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_output_message = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1109436116933006536, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_output_message, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*)* @output_message to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_output_message to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_format_message = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_format_message = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5669076624474491182, i64 138452743561, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*, i8*)* @format_message to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_reset_error_mgr = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_reset_error_mgr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5125468084044206322, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_reset_error_mgr, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*)* @reset_error_mgr to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [126 x i8] c"|\00jpeg_std_error\01tmp1.ll:error_exit\01tmp1.ll:emit_message\01tmp1.ll:output_message\01tmp1.ll:format_message\01tmp1.ll:reset_error_mgr", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_std_error to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_error_exit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_message to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_output_message to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_format_message to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_reset_error_mgr to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([126 x i8], [126 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_std_error, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_std_error, i64 0, i64 0)
  %3 = alloca %struct.jpeg_error_mgr*, align 8
  store %struct.jpeg_error_mgr* %0, %struct.jpeg_error_mgr** %3, align 8
  %4 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %4, i32 0, i32 0
  store void (%struct.jpeg_common_struct*)* @error_exit, void (%struct.jpeg_common_struct*)** %5, align 8
  %6 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i32 0, i32 1
  store void (%struct.jpeg_common_struct*, i32)* @emit_message, void (%struct.jpeg_common_struct*, i32)** %7, align 8
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i32 0, i32 2
  store void (%struct.jpeg_common_struct*)* @output_message, void (%struct.jpeg_common_struct*)** %9, align 8
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i32 0, i32 3
  store void (%struct.jpeg_common_struct*, i8*)* @format_message, void (%struct.jpeg_common_struct*, i8*)** %11, align 8
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i32 0, i32 4
  store void (%struct.jpeg_common_struct*)* @reset_error_mgr, void (%struct.jpeg_common_struct*)** %13, align 8
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i32 0, i32 7
  store i32 0, i32* %15, align 4
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i32 0, i32 8
  store i64 0, i64* %17, align 8
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i32 0, i32 5
  store i32 0, i32* %19, align 8
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i32 0, i32 9
  store i8** getelementptr inbounds ([121 x i8*], [121 x i8*]* @jpeg_std_message_table, i32 0, i32 0), i8*** %21, align 8
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i32 0, i32 10
  store i32 119, i32* %23, align 8
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 11
  store i8** null, i8*** %25, align 8
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i32 0, i32 12
  store i32 0, i32* %27, align 8
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i32 0, i32 13
  store i32 0, i32* %29, align 4
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %3, align 8
  ret %struct.jpeg_error_mgr* %30
}

; Function Attrs: noinline nounwind uwtable
define internal void @error_exit(%struct.jpeg_common_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_error_exit, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_error_exit, i64 0, i64 0)
  %3 = alloca %struct.jpeg_common_struct*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %3, align 8
  %4 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %4, i32 0, i32 0
  %6 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i32 0, i32 2
  %8 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %7, align 8
  %9 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %10 = ptrtoint void (%struct.jpeg_common_struct*)* %8 to i64
  call void @__llvm_profile_instrument_target(i64 %10, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_error_exit to i8*), i32 0)
  call void %8(%struct.jpeg_common_struct* %9)
  %11 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  call void @jpeg_destroy(%struct.jpeg_common_struct* %11)
  call void @exit(i32 1) #5
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_message(%struct.jpeg_common_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_common_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_error_mgr*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %6, i32 0, i32 0
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  store %struct.jpeg_error_mgr* %8, %struct.jpeg_error_mgr** %5, align 8
  %9 = load i32, i32* %4, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %35

; <label>:11:                                     ; preds = %2
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i32 0, i32 8
  %14 = load i64, i64* %13, align 8
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %22, label %16

; <label>:16:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_emit_message, i64 0, i64 4)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_emit_message, i64 0, i64 4)
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i32 0, i32 7
  %20 = load i32, i32* %19, align 4
  %21 = icmp sge i32 %20, 3
  br i1 %21, label %22, label %29

; <label>:22:                                     ; preds = %16, %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_emit_message, i64 0, i64 3)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_emit_message, i64 0, i64 3)
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 2
  %26 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %25, align 8
  %27 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %28 = ptrtoint void (%struct.jpeg_common_struct*)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %28, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_message to i8*), i32 0)
  call void %26(%struct.jpeg_common_struct* %27)
  br label %29

; <label>:29:                                     ; preds = %22, %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_emit_message, i64 0, i64 1)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_emit_message, i64 0, i64 1)
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i32 0, i32 8
  %33 = load i64, i64* %32, align 8
  %34 = add nsw i64 %33, 1
  store i64 %34, i64* %32, align 8
  br label %50

; <label>:35:                                     ; preds = %2
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i32 0, i32 7
  %38 = load i32, i32* %37, align 4
  %39 = load i32, i32* %4, align 4
  %40 = icmp sge i32 %38, %39
  br i1 %40, label %41, label %48

; <label>:41:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_emit_message, i64 0, i64 2)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_emit_message, i64 0, i64 2)
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i32 0, i32 2
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  %46 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %47 = ptrtoint void (%struct.jpeg_common_struct*)* %45 to i64
  call void @__llvm_profile_instrument_target(i64 %47, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_message to i8*), i32 1)
  call void %45(%struct.jpeg_common_struct* %46)
  br label %48

; <label>:48:                                     ; preds = %41, %35
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_emit_message, i64 0, i64 0)
  %49 = add i64 %pgocount4, 1
  store i64 %49, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_emit_message, i64 0, i64 0)
  br label %50

; <label>:50:                                     ; preds = %48, %29
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @output_message(%struct.jpeg_common_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_output_message, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_output_message, i64 0, i64 0)
  %3 = alloca %struct.jpeg_common_struct*, align 8
  %4 = alloca [200 x i8], align 16
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %3, align 8
  %5 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %5, i32 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i32 0, i32 3
  %9 = load void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*, i8*)** %8, align 8
  %10 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %11 = getelementptr inbounds [200 x i8], [200 x i8]* %4, i32 0, i32 0
  %12 = ptrtoint void (%struct.jpeg_common_struct*, i8*)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_output_message to i8*), i32 0)
  call void %9(%struct.jpeg_common_struct* %10, i8* %11)
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [200 x i8], [200 x i8]* %4, i32 0, i32 0
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.120, i32 0, i32 0), i8* %14)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @format_message(%struct.jpeg_common_struct*, i8*) #0 {
  %3 = alloca %struct.jpeg_common_struct*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.jpeg_error_mgr*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %3, align 8
  store i8* %1, i8** %4, align 8
  %11 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %11, i32 0, i32 0
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  store %struct.jpeg_error_mgr* %13, %struct.jpeg_error_mgr** %5, align 8
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i32 0, i32 5
  %16 = load i32, i32* %15, align 8
  store i32 %16, i32* %6, align 4
  store i8* null, i8** %7, align 8
  %17 = load i32, i32* %6, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %35

; <label>:19:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 1)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 1)
  %21 = load i32, i32* %6, align 4
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i32 0, i32 10
  %24 = load i32, i32* %23, align 8
  %25 = icmp sle i32 %21, %24
  br i1 %25, label %26, label %35

; <label>:26:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 7)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 7)
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i32 0, i32 9
  %30 = load i8**, i8*** %29, align 8
  %31 = load i32, i32* %6, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8*, i8** %30, i64 %32
  %34 = load i8*, i8** %33, align 8
  store i8* %34, i8** %7, align 8
  br label %68

; <label>:35:                                     ; preds = %19, %2
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i32 0, i32 11
  %38 = load i8**, i8*** %37, align 8
  %39 = icmp ne i8** %38, null
  br i1 %39, label %40, label %67

; <label>:40:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 4)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 4)
  %42 = load i32, i32* %6, align 4
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i32 0, i32 12
  %45 = load i32, i32* %44, align 8
  %46 = icmp sge i32 %42, %45
  br i1 %46, label %47, label %67

; <label>:47:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 9)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 9)
  %49 = load i32, i32* %6, align 4
  %50 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %51 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %50, i32 0, i32 13
  %52 = load i32, i32* %51, align 4
  %53 = icmp sle i32 %49, %52
  br i1 %53, label %54, label %67

; <label>:54:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 10)
  %55 = add i64 %pgocount4, 1
  store i64 %55, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 10)
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i32 0, i32 11
  %58 = load i8**, i8*** %57, align 8
  %59 = load i32, i32* %6, align 4
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i32 0, i32 12
  %62 = load i32, i32* %61, align 8
  %63 = sub nsw i32 %59, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8*, i8** %58, i64 %64
  %66 = load i8*, i8** %65, align 8
  store i8* %66, i8** %7, align 8
  br label %67

; <label>:67:                                     ; preds = %54, %47, %40, %35
  br label %68

; <label>:68:                                     ; preds = %67, %26
  %69 = load i8*, i8** %7, align 8
  %70 = icmp eq i8* %69, null
  br i1 %70, label %71, label %83

; <label>:71:                                     ; preds = %68
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 5)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 5)
  %73 = load i32, i32* %6, align 4
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %75 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %74, i32 0, i32 6
  %76 = bitcast %union.anon* %75 to [8 x i32]*
  %77 = getelementptr inbounds [8 x i32], [8 x i32]* %76, i64 0, i64 0
  store i32 %73, i32* %77, align 4
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i32 0, i32 9
  %80 = load i8**, i8*** %79, align 8
  %81 = getelementptr inbounds i8*, i8** %80, i64 0
  %82 = load i8*, i8** %81, align 8
  store i8* %82, i8** %7, align 8
  br label %83

; <label>:83:                                     ; preds = %71, %68
  store i32 0, i32* %10, align 4
  %84 = load i8*, i8** %7, align 8
  store i8* %84, i8** %8, align 8
  br label %85

; <label>:85:                                     ; preds = %104, %83
  %86 = load i8*, i8** %8, align 8
  %87 = getelementptr inbounds i8, i8* %86, i32 1
  store i8* %87, i8** %8, align 8
  %88 = load i8, i8* %86, align 1
  store i8 %88, i8* %9, align 1
  %89 = sext i8 %88 to i32
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %106

; <label>:91:                                     ; preds = %85
  %92 = load i8, i8* %9, align 1
  %93 = sext i8 %92 to i32
  %94 = icmp eq i32 %93, 37
  br i1 %94, label %95, label %104

; <label>:95:                                     ; preds = %91
  %96 = load i8*, i8** %8, align 8
  %97 = load i8, i8* %96, align 1
  %98 = sext i8 %97 to i32
  %99 = icmp eq i32 %98, 115
  br i1 %99, label %100, label %102

; <label>:100:                                    ; preds = %95
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 8)
  %101 = add i64 %pgocount6, 1
  store i64 %101, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 8)
  store i32 1, i32* %10, align 4
  br label %102

; <label>:102:                                    ; preds = %100, %95
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 3)
  %103 = add i64 %pgocount7, 1
  store i64 %103, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 3)
  br label %106

; <label>:104:                                    ; preds = %91
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 0)
  %105 = add i64 %pgocount8, 1
  store i64 %105, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 0)
  br label %85

; <label>:106:                                    ; preds = %102, %85
  %107 = load i32, i32* %10, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %118

; <label>:109:                                    ; preds = %106
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 2)
  %110 = add i64 %pgocount9, 1
  store i64 %110, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 2)
  %111 = load i8*, i8** %4, align 8
  %112 = load i8*, i8** %7, align 8
  %113 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %114 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %113, i32 0, i32 6
  %115 = bitcast %union.anon* %114 to [80 x i8]*
  %116 = getelementptr inbounds [80 x i8], [80 x i8]* %115, i32 0, i32 0
  %117 = call i32 (i8*, i8*, ...) @sprintf(i8* %111, i8* %112, i8* %116) #4
  br label %163

; <label>:118:                                    ; preds = %106
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 6)
  %119 = add i64 %pgocount10, 1
  store i64 %119, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_format_message, i64 0, i64 6)
  %120 = load i8*, i8** %4, align 8
  %121 = load i8*, i8** %7, align 8
  %122 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %123 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %122, i32 0, i32 6
  %124 = bitcast %union.anon* %123 to [8 x i32]*
  %125 = getelementptr inbounds [8 x i32], [8 x i32]* %124, i64 0, i64 0
  %126 = load i32, i32* %125, align 4
  %127 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %128 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %127, i32 0, i32 6
  %129 = bitcast %union.anon* %128 to [8 x i32]*
  %130 = getelementptr inbounds [8 x i32], [8 x i32]* %129, i64 0, i64 1
  %131 = load i32, i32* %130, align 4
  %132 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %133 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %132, i32 0, i32 6
  %134 = bitcast %union.anon* %133 to [8 x i32]*
  %135 = getelementptr inbounds [8 x i32], [8 x i32]* %134, i64 0, i64 2
  %136 = load i32, i32* %135, align 4
  %137 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %138 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %137, i32 0, i32 6
  %139 = bitcast %union.anon* %138 to [8 x i32]*
  %140 = getelementptr inbounds [8 x i32], [8 x i32]* %139, i64 0, i64 3
  %141 = load i32, i32* %140, align 4
  %142 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %143 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %142, i32 0, i32 6
  %144 = bitcast %union.anon* %143 to [8 x i32]*
  %145 = getelementptr inbounds [8 x i32], [8 x i32]* %144, i64 0, i64 4
  %146 = load i32, i32* %145, align 4
  %147 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %148 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %147, i32 0, i32 6
  %149 = bitcast %union.anon* %148 to [8 x i32]*
  %150 = getelementptr inbounds [8 x i32], [8 x i32]* %149, i64 0, i64 5
  %151 = load i32, i32* %150, align 4
  %152 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %153 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %152, i32 0, i32 6
  %154 = bitcast %union.anon* %153 to [8 x i32]*
  %155 = getelementptr inbounds [8 x i32], [8 x i32]* %154, i64 0, i64 6
  %156 = load i32, i32* %155, align 4
  %157 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %158 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %157, i32 0, i32 6
  %159 = bitcast %union.anon* %158 to [8 x i32]*
  %160 = getelementptr inbounds [8 x i32], [8 x i32]* %159, i64 0, i64 7
  %161 = load i32, i32* %160, align 4
  %162 = call i32 (i8*, i8*, ...) @sprintf(i8* %120, i8* %121, i32 %126, i32 %131, i32 %136, i32 %141, i32 %146, i32 %151, i32 %156, i32 %161) #4
  br label %163

; <label>:163:                                    ; preds = %118, %109
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @reset_error_mgr(%struct.jpeg_common_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_reset_error_mgr, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_reset_error_mgr, i64 0, i64 0)
  %3 = alloca %struct.jpeg_common_struct*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %3, align 8
  %4 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %4, i32 0, i32 0
  %6 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i32 0, i32 8
  store i64 0, i64* %7, align 8
  %8 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %8, i32 0, i32 0
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i32 0, i32 5
  store i32 0, i32* %11, align 8
  ret void
}

declare void @jpeg_destroy(%struct.jpeg_common_struct*) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #3

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
