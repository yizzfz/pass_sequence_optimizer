; ModuleID = 'bzip2.2.ll'
source_filename = "bzip2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.zzzz = type { i8*, %struct.zzzz* }
%struct.UInt64 = type { [8 x i8] }
%struct.utimbuf = type { i64, i64 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [5 x i8] c".bz2\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c".bz\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c".tbz2\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c".tbz\00", align 1
@zSuffix = global [4 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0)], align 16
@.str.4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.5 = private unnamed_addr constant [5 x i8] c".tar\00", align 1
@unzSuffix = global [4 x i8*] [i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0)], align 16
@outputHandleJustInCase = common global %struct._IO_FILE* null, align 8
@smallMode = common global i8 0, align 1
@keepInputFiles = common global i8 0, align 1
@forceOverwrite = common global i8 0, align 1
@noisy = common global i8 0, align 1
@verbosity = common global i32 0, align 4
@blockSize100k = common global i32 0, align 4
@testFailsExist = common global i8 0, align 1
@unzFailsExist = common global i8 0, align 1
@numFileNames = common global i32 0, align 4
@numFilesProcessed = common global i32 0, align 4
@workFactor = common global i32 0, align 4
@deleteOutputOnInterrupt = common global i8 0, align 1
@exitValue = common global i32 0, align 4
@inName = common global [1034 x i8] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [7 x i8] c"(none)\00", align 1
@outName = common global [1034 x i8] zeroinitializer, align 16
@progNameReally = common global [1034 x i8] zeroinitializer, align 16
@progName = common global i8* null, align 8
@.str.7 = private unnamed_addr constant [6 x i8] c"BZIP2\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"BZIP\00", align 1
@longestFileName = common global i32 0, align 4
@.str.9 = private unnamed_addr constant [3 x i8] c"--\00", align 1
@srcMode = common global i32 0, align 4
@opMode = common global i32 0, align 4
@.str.10 = private unnamed_addr constant [6 x i8] c"unzip\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"UNZIP\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"z2cat\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"Z2CAT\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"zcat\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"ZCAT\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.16 = private unnamed_addr constant [19 x i8] c"%s: Bad flag `%s'\0A\00", align 1
@.str.17 = private unnamed_addr constant [9 x i8] c"--stdout\00", align 1
@.str.18 = private unnamed_addr constant [13 x i8] c"--decompress\00", align 1
@.str.19 = private unnamed_addr constant [11 x i8] c"--compress\00", align 1
@.str.20 = private unnamed_addr constant [8 x i8] c"--force\00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c"--test\00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c"--keep\00", align 1
@.str.23 = private unnamed_addr constant [8 x i8] c"--small\00", align 1
@.str.24 = private unnamed_addr constant [8 x i8] c"--quiet\00", align 1
@.str.25 = private unnamed_addr constant [10 x i8] c"--version\00", align 1
@.str.26 = private unnamed_addr constant [10 x i8] c"--license\00", align 1
@.str.27 = private unnamed_addr constant [14 x i8] c"--exponential\00", align 1
@.str.28 = private unnamed_addr constant [18 x i8] c"--repetitive-best\00", align 1
@.str.29 = private unnamed_addr constant [18 x i8] c"--repetitive-fast\00", align 1
@.str.30 = private unnamed_addr constant [7 x i8] c"--fast\00", align 1
@.str.31 = private unnamed_addr constant [7 x i8] c"--best\00", align 1
@.str.32 = private unnamed_addr constant [10 x i8] c"--verbose\00", align 1
@.str.33 = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@.str.34 = private unnamed_addr constant [40 x i8] c"%s: -c and -t cannot be used together.\0A\00", align 1
@.str.35 = private unnamed_addr constant [113 x i8] c"\0AYou can use the `bzip2recover' program to attempt to recover\0Adata from undamaged sections of corrupted files.\0A\0A\00", align 1
@tmpName = common global [1034 x i8] zeroinitializer, align 16
@.str.36 = private unnamed_addr constant [869 x i8] c"\0A%s: Caught a SIGSEGV or SIGBUS whilst compressing.\0A\0A   Possible causes are (most likely first):\0A   (1) This computer has unreliable memory or cache hardware\0A       (a surprisingly common problem; try a different machine.)\0A   (2) A bug in the compiler used to create this executable\0A       (unlikely, if you didn't compile bzip2 yourself.)\0A   (3) A real bug in bzip2 -- I hope this should never be the case.\0A   The user's manual, Section 4.3, has more info on (1) and (2).\0A   \0A   If you suspect this is a bug in bzip2, or are unsure about (1)\0A   or (2), feel free to report it to me at: jseward@bzip.org.\0A   Section 4.3 of the user's manual describes the info a useful\0A   bug report should have.  If the manual is available on your\0A   system, please try and read it before mailing me.  If you don't\0A   have the manual or can't be bothered to read it, mail me anyway.\0A\0A\00", align 1
@.str.37 = private unnamed_addr constant [996 x i8] c"\0A%s: Caught a SIGSEGV or SIGBUS whilst decompressing.\0A\0A   Possible causes are (most likely first):\0A   (1) The compressed data is corrupted, and bzip2's usual checks\0A       failed to detect this.  Try bzip2 -tvv my_file.bz2.\0A   (2) This computer has unreliable memory or cache hardware\0A       (a surprisingly common problem; try a different machine.)\0A   (3) A bug in the compiler used to create this executable\0A       (unlikely, if you didn't compile bzip2 yourself.)\0A   (4) A real bug in bzip2 -- I hope this should never be the case.\0A   The user's manual, Section 4.3, has more info on (2) and (3).\0A   \0A   If you suspect this is a bug in bzip2, or are unsure about (2)\0A   or (3), feel free to report it to me at: jseward@bzip.org.\0A   Section 4.3 of the user's manual describes the info a useful\0A   bug report should have.  If the manual is available on your\0A   system, please try and read it before mailing me.  If you don't\0A   have the manual or can't be bothered to read it, mail me anyway.\0A\0A\00", align 1
@.str.38 = private unnamed_addr constant [36 x i8] c"\09Input file = %s, output file = %s\0A\00", align 1
@.str.39 = private unnamed_addr constant [44 x i8] c"%s: Deleting output file %s, if it exists.\0A\00", align 1
@.str.40 = private unnamed_addr constant [59 x i8] c"%s: WARNING: deletion of output file (apparently) failed.\0A\00", align 1
@.str.41 = private unnamed_addr constant [49 x i8] c"%s: WARNING: deletion of output file suppressed\0A\00", align 1
@.str.42 = private unnamed_addr constant [56 x i8] c"%s:    since input file no longer exists.  Output file\0A\00", align 1
@.str.43 = private unnamed_addr constant [32 x i8] c"%s:    `%s' may be incomplete.\0A\00", align 1
@.str.44 = private unnamed_addr constant [61 x i8] c"%s:    I suggest doing an integrity test (bzip2 -tv) of it.\0A\00", align 1
@.str.45 = private unnamed_addr constant [110 x i8] c"%s: WARNING: some files have not been processed:\0A%s:    %d specified on command line, %d not processed yet.\0A\0A\00", align 1
@.str.46 = private unnamed_addr constant [241 x i8] c"\0AIt is possible that the compressed file(s) have become corrupted.\0AYou can use the -tvv option to test integrity of such files.\0A\0AYou can use the `bzip2recover' program to attempt to recover\0Adata from undamaged sections of corrupted files.\0A\0A\00", align 1
@.str.47 = private unnamed_addr constant [120 x i8] c"bzip2: file name\0A`%s'\0Ais suspiciously (more than %d chars) long.\0ATry using a reasonable file name instead.  Sorry! :-)\0A\00", align 1
@.str.48 = private unnamed_addr constant [38 x i8] c"\0A%s: couldn't allocate enough memory\0A\00", align 1
@.str.49 = private unnamed_addr constant [531 x i8] c"bzip2, a block-sorting file compressor.  Version %s.\0A   \0A   Copyright (C) 1996-2006 by Julian Seward.\0A   \0A   This program is free software; you can redistribute it and/or modify\0A   it under the terms set out in the LICENSE file, which is included\0A   in the bzip2-1.0.4 source distribution.\0A   \0A   This program is distributed in the hope that it will be useful,\0A   but WITHOUT ANY WARRANTY; without even the implied warranty of\0A   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\0A   LICENSE file for more details.\0A   \0A\00", align 1
@.str.50 = private unnamed_addr constant [1230 x i8] c"bzip2, a block-sorting file compressor.  Version %s.\0A\0A   usage: %s [flags and input files in any order]\0A\0A   -h --help           print this message\0A   -d --decompress     force decompression\0A   -z --compress       force compression\0A   -k --keep           keep (don't delete) input files\0A   -f --force          overwrite existing output files\0A   -t --test           test compressed file integrity\0A   -c --stdout         output to standard out\0A   -q --quiet          suppress noncritical error messages\0A   -v --verbose        be verbose (a 2nd -v gives more)\0A   -L --license        display software version & license\0A   -V --version        display software version & license\0A   -s --small          use less memory (at most 2500k)\0A   -1 .. -9            set block size to 100k .. 900k\0A   --fast              alias for -1\0A   --best              alias for -9\0A\0A   If invoked as `bzip2', default action is to compress.\0A              as `bunzip2',  default action is to decompress.\0A              as `bzcat', default action is to decompress to stdout.\0A\0A   If no file names are given, bzip2 compresses or decompresses\0A   from standard input to standard output.  You can combine\0A   short flags, so `-v -4' means the same as -v4 or -4v, &c.\0A\0A\00", align 1
@.str.51 = private unnamed_addr constant [49 x i8] c"%s: %s is redundant in versions 0.9.5 and above\0A\00", align 1
@.str.52 = private unnamed_addr constant [45 x i8] c"\0A%s: Control-C or similar caught, quitting.\0A\00", align 1
@.str.53 = private unnamed_addr constant [21 x i8] c"compress: bad modes\0A\00", align 1
@.str.54 = private unnamed_addr constant [8 x i8] c"(stdin)\00", align 1
@.str.55 = private unnamed_addr constant [9 x i8] c"(stdout)\00", align 1
@.str.56 = private unnamed_addr constant [39 x i8] c"%s: There are no files matching `%s'.\0A\00", align 1
@.str.57 = private unnamed_addr constant [35 x i8] c"%s: Can't open input file %s: %s.\0A\00", align 1
@.str.58 = private unnamed_addr constant [42 x i8] c"%s: Input file %s already has %s suffix.\0A\00", align 1
@.str.59 = private unnamed_addr constant [35 x i8] c"%s: Input file %s is a directory.\0A\00", align 1
@.str.60 = private unnamed_addr constant [41 x i8] c"%s: Input file %s is not a normal file.\0A\00", align 1
@.str.61 = private unnamed_addr constant [36 x i8] c"%s: Output file %s already exists.\0A\00", align 1
@.str.62 = private unnamed_addr constant [40 x i8] c"%s: Input file %s has %d other link%s.\0A\00", align 1
@.str.63 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@stdout = external global %struct._IO_FILE*, align 8
@.str.64 = private unnamed_addr constant [50 x i8] c"%s: I won't write compressed data to a terminal.\0A\00", align 1
@.str.65 = private unnamed_addr constant [34 x i8] c"%s: For help, type: `%s --help'.\0A\00", align 1
@.str.66 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.67 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.68 = private unnamed_addr constant [38 x i8] c"%s: Can't create output file %s: %s.\0A\00", align 1
@.str.69 = private unnamed_addr constant [22 x i8] c"compress: bad srcMode\00", align 1
@.str.70 = private unnamed_addr constant [7 x i8] c"  %s: \00", align 1
@.str.71 = private unnamed_addr constant [109 x i8] c"\0A%s: PANIC -- internal consistency error:\0A\09%s\0A\09This is a BUG.  Please report it to me at:\0A\09jseward@bzip.org\0A\00", align 1
@fileMetaInfo = internal global %struct.stat zeroinitializer, align 8
@.str.72 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.73 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.74 = private unnamed_addr constant [22 x i8] c" no data compressed.\0A\00", align 1
@.str.75 = private unnamed_addr constant [57 x i8] c"%6.3f:1, %6.3f bits/byte, %5.2f%% saved, %s in, %s out.\0A\00", align 1
@.str.76 = private unnamed_addr constant [26 x i8] c"compress:unexpected error\00", align 1
@.str.77 = private unnamed_addr constant [236 x i8] c"bzip2: I'm not configured correctly for this platform!\0A\09I require Int32, Int16 and Char to have sizes\0A\09of 4, 2 and 1 bytes to run properly, and they don't.\0A\09Probably you can fix this by defining them correctly,\0A\09and recompiling.  Bye!\0A\00", align 1
@.str.78 = private unnamed_addr constant [65 x i8] c"\0A%s: I/O or other error, bailing out.  Possible reason follows.\0A\00", align 1
@.str.79 = private unnamed_addr constant [23 x i8] c"uncompress: bad modes\0A\00", align 1
@.str.80 = private unnamed_addr constant [5 x i8] c".out\00", align 1
@.str.81 = private unnamed_addr constant [50 x i8] c"%s: Can't guess original name for %s -- using %s\0A\00", align 1
@.str.82 = private unnamed_addr constant [51 x i8] c"%s: I won't read compressed data from a terminal.\0A\00", align 1
@.str.83 = private unnamed_addr constant [34 x i8] c"%s: Can't open input file %s:%s.\0A\00", align 1
@.str.84 = private unnamed_addr constant [24 x i8] c"uncompress: bad srcMode\00", align 1
@.str.85 = private unnamed_addr constant [6 x i8] c"done\0A\00", align 1
@.str.86 = private unnamed_addr constant [19 x i8] c"not a bzip2 file.\0A\00", align 1
@.str.87 = private unnamed_addr constant [29 x i8] c"%s: %s is not a bzip2 file.\0A\00", align 1
@.str.88 = private unnamed_addr constant [27 x i8] c"decompress:bzReadGetUnused\00", align 1
@.str.89 = private unnamed_addr constant [6 x i8] c"\0A    \00", align 1
@.str.90 = private unnamed_addr constant [45 x i8] c"\0A%s: %s: trailing garbage after EOF ignored\0A\00", align 1
@.str.91 = private unnamed_addr constant [28 x i8] c"decompress:unexpected error\00", align 1
@.str.92 = private unnamed_addr constant [47 x i8] c"\0A%s: Data integrity error when decompressing.\0A\00", align 1
@.str.93 = private unnamed_addr constant [95 x i8] c"\0A%s: Compressed file ends unexpectedly;\0A\09perhaps it is corrupted?  *Possible* reason follows.\0A\00", align 1
@.str.94 = private unnamed_addr constant [18 x i8] c"testf: bad modes\0A\00", align 1
@.str.95 = private unnamed_addr constant [30 x i8] c"%s: Can't open input %s: %s.\0A\00", align 1
@.str.96 = private unnamed_addr constant [19 x i8] c"testf: bad srcMode\00", align 1
@.str.97 = private unnamed_addr constant [4 x i8] c"ok\0A\00", align 1
@.str.98 = private unnamed_addr constant [21 x i8] c"test:bzReadGetUnused\00", align 1
@.str.99 = private unnamed_addr constant [9 x i8] c"%s: %s: \00", align 1
@.str.100 = private unnamed_addr constant [36 x i8] c"data integrity (CRC) error in data\0A\00", align 1
@.str.101 = private unnamed_addr constant [24 x i8] c"file ends unexpectedly\0A\00", align 1
@.str.102 = private unnamed_addr constant [46 x i8] c"bad magic number (file not created by bzip2)\0A\00", align 1
@.str.103 = private unnamed_addr constant [36 x i8] c"trailing garbage after EOF ignored\0A\00", align 1
@.str.104 = private unnamed_addr constant [22 x i8] c"test:unexpected error\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main1 = private constant [5 x i8] c"main1"
@__profn_tmp1.ll_mySIGSEGVorSIGBUScatcher = private constant [32 x i8] c"tmp1.ll:mySIGSEGVorSIGBUScatcher"
@__profn_tmp1.ll_copyFileName = private constant [20 x i8] c"tmp1.ll:copyFileName"
@__profn_tmp1.ll_addFlagsFromEnvVar = private constant [26 x i8] c"tmp1.ll:addFlagsFromEnvVar"
@__profn_tmp1.ll_snocString = private constant [18 x i8] c"tmp1.ll:snocString"
@__profn_tmp1.ll_license = private constant [15 x i8] c"tmp1.ll:license"
@__profn_tmp1.ll_usage = private constant [13 x i8] c"tmp1.ll:usage"
@__profn_tmp1.ll_redundant = private constant [17 x i8] c"tmp1.ll:redundant"
@__profn_tmp1.ll_mySignalCatcher = private constant [23 x i8] c"tmp1.ll:mySignalCatcher"
@__profn_tmp1.ll_compress = private constant [16 x i8] c"tmp1.ll:compress"
@__profn_tmp1.ll_uncompress = private constant [18 x i8] c"tmp1.ll:uncompress"
@__profn_tmp1.ll_setExit = private constant [15 x i8] c"tmp1.ll:setExit"
@__profn_tmp1.ll_testf = private constant [13 x i8] c"tmp1.ll:testf"
@__profn_tmp1.ll_showFileNames = private constant [21 x i8] c"tmp1.ll:showFileNames"
@__profn_tmp1.ll_cleanUpAndFail = private constant [22 x i8] c"tmp1.ll:cleanUpAndFail"
@__profn_tmp1.ll_cadvise = private constant [15 x i8] c"tmp1.ll:cadvise"
@__profn_tmp1.ll_mkCell = private constant [14 x i8] c"tmp1.ll:mkCell"
@__profn_tmp1.ll_myMalloc = private constant [16 x i8] c"tmp1.ll:myMalloc"
@__profn_tmp1.ll_outOfMemory = private constant [19 x i8] c"tmp1.ll:outOfMemory"
@__profn_tmp1.ll_panic = private constant [13 x i8] c"tmp1.ll:panic"
@__profn_tmp1.ll_containsDubiousChars = private constant [28 x i8] c"tmp1.ll:containsDubiousChars"
@__profn_tmp1.ll_fileExists = private constant [18 x i8] c"tmp1.ll:fileExists"
@__profn_tmp1.ll_hasSuffix = private constant [17 x i8] c"tmp1.ll:hasSuffix"
@__profn_tmp1.ll_notAStandardFile = private constant [24 x i8] c"tmp1.ll:notAStandardFile"
@__profn_tmp1.ll_countHardLinks = private constant [22 x i8] c"tmp1.ll:countHardLinks"
@__profn_tmp1.ll_saveInputFileMetaInfo = private constant [29 x i8] c"tmp1.ll:saveInputFileMetaInfo"
@__profn_tmp1.ll_fopen_output_safely = private constant [27 x i8] c"tmp1.ll:fopen_output_safely"
@__profn_tmp1.ll_pad = private constant [11 x i8] c"tmp1.ll:pad"
@__profn_tmp1.ll_compressStream = private constant [22 x i8] c"tmp1.ll:compressStream"
@__profn_tmp1.ll_applySavedTimeInfoToOutputFile = private constant [38 x i8] c"tmp1.ll:applySavedTimeInfoToOutputFile"
@__profn_tmp1.ll_ioError = private constant [15 x i8] c"tmp1.ll:ioError"
@__profn_tmp1.ll_myfeof = private constant [14 x i8] c"tmp1.ll:myfeof"
@__profn_tmp1.ll_applySavedFileAttrToOutputFile = private constant [38 x i8] c"tmp1.ll:applySavedFileAttrToOutputFile"
@__profn_tmp1.ll_uInt64_from_UInt32s = private constant [27 x i8] c"tmp1.ll:uInt64_from_UInt32s"
@__profn_tmp1.ll_uInt64_to_double = private constant [24 x i8] c"tmp1.ll:uInt64_to_double"
@__profn_tmp1.ll_uInt64_toAscii = private constant [22 x i8] c"tmp1.ll:uInt64_toAscii"
@__profn_tmp1.ll_configError = private constant [19 x i8] c"tmp1.ll:configError"
@__profn_tmp1.ll_uInt64_qrm10 = private constant [20 x i8] c"tmp1.ll:uInt64_qrm10"
@__profn_tmp1.ll_uInt64_isZero = private constant [21 x i8] c"tmp1.ll:uInt64_isZero"
@__profn_tmp1.ll_mapSuffix = private constant [17 x i8] c"tmp1.ll:mapSuffix"
@__profn_tmp1.ll_uncompressStream = private constant [24 x i8] c"tmp1.ll:uncompressStream"
@__profn_tmp1.ll_crcError = private constant [16 x i8] c"tmp1.ll:crcError"
@__profn_tmp1.ll_compressedStreamEOF = private constant [27 x i8] c"tmp1.ll:compressedStreamEOF"
@__profn_tmp1.ll_testStream = private constant [18 x i8] c"tmp1.ll:testStream"
@__profc_main1 = private global [95 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 72058837426256935, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main1 to i8*), i8* null, i32 95, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_mySIGSEGVorSIGBUScatcher = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_mySIGSEGVorSIGBUScatcher = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6998174608852064418, i64 45366678106, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mySIGSEGVorSIGBUScatcher, i32 0, i32 0), i8* bitcast (void (i32)* @mySIGSEGVorSIGBUScatcher to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_copyFileName = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_copyFileName = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3670836534623851060, i64 24868915205, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_copyFileName, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_addFlagsFromEnvVar = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_addFlagsFromEnvVar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6686568660611971258, i64 139595842259, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_snocString = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_snocString = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1508157897407341788, i64 45078935416, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_snocString, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_license = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_license = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -637619718866853506, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_license, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_usage = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7998456694610620455, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_redundant = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_redundant = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4645439195399335948, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_redundant, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_mySignalCatcher = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_mySignalCatcher = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6154001784326048573, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_mySignalCatcher, i32 0, i32 0), i8* bitcast (void (i32)* @mySignalCatcher to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compress = private global [44 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_compress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -383981242448351142, i64 72058112671232259, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i32 0, i32 0), i8* null, i8* null, i32 44, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_uncompress = private global [50 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_uncompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4840130944952855881, i64 72058202112477994, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i32 0, i32 0), i8* null, i8* null, i32 50, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_setExit = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_setExit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2545758869459021019, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_setExit, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_testf = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_testf = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2291055318888007488, i64 245154069446, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i32 0, i32 0), i8* null, i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_showFileNames = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_showFileNames = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8277055890253047181, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_showFileNames, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_cleanUpAndFail = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_cleanUpAndFail = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1067629892497786252, i64 130149391925, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_cadvise = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_cadvise = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6217049961697629376, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cadvise, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_mkCell = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_mkCell = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7795998769954356378, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_mkCell, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_myMalloc = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_myMalloc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4746537520632425406, i64 24868915205, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myMalloc, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_outOfMemory = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_outOfMemory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2371025967639576581, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_outOfMemory, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_panic = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_panic = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1770791489126994856, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_panic, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_containsDubiousChars = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_containsDubiousChars = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2676225624941792997, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_containsDubiousChars, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fileExists = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fileExists = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5624587290110514422, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_fileExists, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_hasSuffix = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_hasSuffix = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2211277246325175146, i64 42754363654, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_hasSuffix, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_notAStandardFile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_notAStandardFile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6115788847621320394, i64 42754363654, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_notAStandardFile, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_countHardLinks = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_countHardLinks = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5573360832683278765, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_countHardLinks, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_saveInputFileMetaInfo = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_saveInputFileMetaInfo = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5344225690683777509, i64 24868915205, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_saveInputFileMetaInfo, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fopen_output_safely = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fopen_output_safely = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8156445892026078226, i64 41716471419, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fopen_output_safely, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pad = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pad = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1505777631869121660, i64 47042151824, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pad, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compressStream = private global [23 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_compressStream = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2127118983829356826, i64 303594396555, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i32 0, i32 0), i8* null, i8* null, i32 23, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_applySavedTimeInfoToOutputFile = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_applySavedTimeInfoToOutputFile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8152077011929633603, i64 24868915205, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_applySavedTimeInfoToOutputFile, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ioError = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ioError = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3686238478938721110, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_ioError, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_myfeof = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_myfeof = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5503725093352131782, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myfeof, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_applySavedFileAttrToOutputFile = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_applySavedFileAttrToOutputFile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2551960861907816716, i64 24868915205, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_applySavedFileAttrToOutputFile, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_uInt64_from_UInt32s = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_uInt64_from_UInt32s = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5802371739439182929, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_uInt64_from_UInt32s, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_uInt64_to_double = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_uInt64_to_double = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8596550185943630995, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_uInt64_to_double, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_uInt64_toAscii = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_uInt64_toAscii = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6629990541677114014, i64 48034428264, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_toAscii, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_configError = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_configError = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 987707099977809639, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_configError, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_uInt64_qrm10 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_uInt64_qrm10 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -296560667221547126, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_uInt64_qrm10, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_uInt64_isZero = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_uInt64_isZero = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6905368823497083492, i64 51054561640, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_isZero, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_mapSuffix = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_mapSuffix = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3361063605290279281, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mapSuffix, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_uncompressStream = private global [41 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_uncompressStream = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7320112023137452228, i64 539474557367, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i32 0, i32 0), i8* null, i8* null, i32 41, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_crcError = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_crcError = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8469256377339117261, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_crcError, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compressedStreamEOF = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_compressedStreamEOF = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3363946420005823861, i64 29866266370, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compressedStreamEOF, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_testStream = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_testStream = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2723238787396001269, i64 322692001194, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i32 0, i32 0), i8* null, i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [935 x i8] c"\A4\07\00main1\01tmp1.ll:mySIGSEGVorSIGBUScatcher\01tmp1.ll:copyFileName\01tmp1.ll:addFlagsFromEnvVar\01tmp1.ll:snocString\01tmp1.ll:license\01tmp1.ll:usage\01tmp1.ll:redundant\01tmp1.ll:mySignalCatcher\01tmp1.ll:compress\01tmp1.ll:uncompress\01tmp1.ll:setExit\01tmp1.ll:testf\01tmp1.ll:showFileNames\01tmp1.ll:cleanUpAndFail\01tmp1.ll:cadvise\01tmp1.ll:mkCell\01tmp1.ll:myMalloc\01tmp1.ll:outOfMemory\01tmp1.ll:panic\01tmp1.ll:containsDubiousChars\01tmp1.ll:fileExists\01tmp1.ll:hasSuffix\01tmp1.ll:notAStandardFile\01tmp1.ll:countHardLinks\01tmp1.ll:saveInputFileMetaInfo\01tmp1.ll:fopen_output_safely\01tmp1.ll:pad\01tmp1.ll:compressStream\01tmp1.ll:applySavedTimeInfoToOutputFile\01tmp1.ll:ioError\01tmp1.ll:myfeof\01tmp1.ll:applySavedFileAttrToOutputFile\01tmp1.ll:uInt64_from_UInt32s\01tmp1.ll:uInt64_to_double\01tmp1.ll:uInt64_toAscii\01tmp1.ll:configError\01tmp1.ll:uInt64_qrm10\01tmp1.ll:uInt64_isZero\01tmp1.ll:mapSuffix\01tmp1.ll:uncompressStream\01tmp1.ll:crcError\01tmp1.ll:compressedStreamEOF\01tmp1.ll:testStream", section "__llvm_prf_names"
@llvm.used = appending global [45 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_mySIGSEGVorSIGBUScatcher to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_copyFileName to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_addFlagsFromEnvVar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_snocString to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_license to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_redundant to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_mySignalCatcher to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_uncompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_setExit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_testf to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_showFileNames to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_cleanUpAndFail to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_cadvise to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_mkCell to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_myMalloc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_outOfMemory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_panic to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_containsDubiousChars to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fileExists to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_hasSuffix to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_notAStandardFile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_countHardLinks to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_saveInputFileMetaInfo to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fopen_output_safely to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pad to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compressStream to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_applySavedTimeInfoToOutputFile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ioError to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_myfeof to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_applySavedFileAttrToOutputFile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_uInt64_from_UInt32s to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_uInt64_to_double to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_uInt64_toAscii to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_configError to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_uInt64_qrm10 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_uInt64_isZero to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_mapSuffix to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_uncompressStream to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_crcError to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compressedStreamEOF to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_testStream to i8*), i8* getelementptr inbounds ([935 x i8], [935 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca %struct.zzzz*, align 8
  %9 = alloca %struct.zzzz*, align 8
  %10 = alloca i8, align 1
  %11 = alloca %struct.zzzz*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  store i8 0, i8* @smallMode, align 1
  store i8 0, i8* @keepInputFiles, align 1
  store i8 0, i8* @forceOverwrite, align 1
  store i8 1, i8* @noisy, align 1
  store i32 0, i32* @verbosity, align 4
  store i32 9, i32* @blockSize100k, align 4
  store i8 0, i8* @testFailsExist, align 1
  store i8 0, i8* @unzFailsExist, align 1
  store i32 0, i32* @numFileNames, align 4
  store i32 0, i32* @numFilesProcessed, align 4
  store i32 30, i32* @workFactor, align 4
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  store i32 0, i32* @exitValue, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %5, align 4
  %12 = call void (i32)* @signal(i32 11, void (i32)* @mySIGSEGVorSIGBUScatcher) #8
  %13 = call void (i32)* @signal(i32 7, void (i32)* @mySIGSEGVorSIGBUScatcher) #8
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0))
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0))
  %14 = load i8**, i8*** %4, align 8
  %15 = getelementptr inbounds i8*, i8** %14, i64 0
  %16 = load i8*, i8** %15, align 8
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @progNameReally, i32 0, i32 0), i8* %16)
  store i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @progNameReally, i64 0, i64 0), i8** @progName, align 8
  store i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @progNameReally, i64 0, i64 0), i8** %7, align 8
  br label %17

; <label>:17:                                     ; preds = %33, %2
  %18 = load i8*, i8** %7, align 8
  %19 = load i8, i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %36

; <label>:22:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 34)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 34)
  %24 = load i8*, i8** %7, align 8
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 47
  br i1 %27, label %29, label %._crit_edge3

._crit_edge3:                                     ; preds = %22
  %pgocount11 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 6)
  %28 = add i64 %pgocount11, 1
  store i64 %28, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 6)
  br label %32

; <label>:29:                                     ; preds = %22
  %30 = load i8*, i8** %7, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 1
  store i8* %31, i8** @progName, align 8
  br label %32

; <label>:32:                                     ; preds = %29, %._crit_edge3
  br label %33

; <label>:33:                                     ; preds = %32
  %34 = load i8*, i8** %7, align 8
  %35 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %35, i8** %7, align 8
  br label %17

; <label>:36:                                     ; preds = %17
  store %struct.zzzz* null, %struct.zzzz** %8, align 8
  call void @addFlagsFromEnvVar(%struct.zzzz** %8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0))
  call void @addFlagsFromEnvVar(%struct.zzzz** %8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0))
  store i32 1, i32* %5, align 4
  br label %37

; <label>:37:                                     ; preds = %51, %36
  %38 = load i32, i32* %5, align 4
  %39 = load i32, i32* %3, align 4
  %40 = sub nsw i32 %39, 1
  %41 = icmp sle i32 %38, %40
  br i1 %41, label %42, label %54

; <label>:42:                                     ; preds = %37
  %pgocount12 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 35)
  %43 = add i64 %pgocount12, 1
  store i64 %43, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 35)
  %44 = load %struct.zzzz*, %struct.zzzz** %8, align 8
  %45 = load i8**, i8*** %4, align 8
  %46 = load i32, i32* %5, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8*, i8** %45, i64 %47
  %49 = load i8*, i8** %48, align 8
  %50 = call %struct.zzzz* @snocString(%struct.zzzz* %44, i8* %49)
  store %struct.zzzz* %50, %struct.zzzz** %8, align 8
  br label %51

; <label>:51:                                     ; preds = %42
  %52 = load i32, i32* %5, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %5, align 4
  br label %37

; <label>:54:                                     ; preds = %37
  store i32 7, i32* @longestFileName, align 4
  store i32 0, i32* @numFileNames, align 4
  store i8 1, i8* %10, align 1
  %55 = load %struct.zzzz*, %struct.zzzz** %8, align 8
  store %struct.zzzz* %55, %struct.zzzz** %9, align 8
  br label %56

; <label>:56:                                     ; preds = %101, %54
  %57 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %58 = icmp ne %struct.zzzz* %57, null
  br i1 %58, label %59, label %105

; <label>:59:                                     ; preds = %56
  %pgocount13 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 36)
  %60 = add i64 %pgocount13, 1
  store i64 %60, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 36)
  %61 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %62 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %61, i32 0, i32 0
  %63 = load i8*, i8** %62, align 8
  %64 = call i32 @strcmp(i8* %63, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0)) #9
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %67

; <label>:66:                                     ; preds = %59
  store i8 0, i8* %10, align 1
  br label %101

; <label>:67:                                     ; preds = %59
  %68 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %69 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %68, i32 0, i32 0
  %70 = load i8*, i8** %69, align 8
  %71 = getelementptr inbounds i8, i8* %70, i64 0
  %72 = load i8, i8* %71, align 1
  %73 = sext i8 %72 to i32
  %74 = icmp eq i32 %73, 45
  br i1 %74, label %75, label %82

; <label>:75:                                     ; preds = %67
  %pgocount14 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 42)
  %76 = add i64 %pgocount14, 1
  store i64 %76, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 42)
  %77 = load i8, i8* %10, align 1
  %78 = zext i8 %77 to i32
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %82

; <label>:80:                                     ; preds = %75
  %pgocount15 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 7)
  %81 = add i64 %pgocount15, 1
  store i64 %81, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 7)
  br label %101

; <label>:82:                                     ; preds = %75, %67
  %83 = load i32, i32* @numFileNames, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* @numFileNames, align 4
  %85 = load i32, i32* @longestFileName, align 4
  %86 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %87 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %86, i32 0, i32 0
  %88 = load i8*, i8** %87, align 8
  %89 = call i64 @strlen(i8* %88) #9
  %90 = trunc i64 %89 to i32
  %91 = icmp slt i32 %85, %90
  br i1 %91, label %93, label %._crit_edge6

._crit_edge6:                                     ; preds = %82
  %pgocount16 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 43)
  %92 = add i64 %pgocount16, 1
  store i64 %92, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 43)
  br label %99

; <label>:93:                                     ; preds = %82
  %94 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %95 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %94, i32 0, i32 0
  %96 = load i8*, i8** %95, align 8
  %97 = call i64 @strlen(i8* %96) #9
  %98 = trunc i64 %97 to i32
  store i32 %98, i32* @longestFileName, align 4
  br label %99

; <label>:99:                                     ; preds = %93, %._crit_edge6
  %pgocount17 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 50)
  %100 = add i64 %pgocount17, 1
  store i64 %100, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 50)
  br label %101

; <label>:101:                                    ; preds = %99, %80, %66
  %102 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %103 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %102, i32 0, i32 1
  %104 = load %struct.zzzz*, %struct.zzzz** %103, align 8
  store %struct.zzzz* %104, %struct.zzzz** %9, align 8
  br label %56

; <label>:105:                                    ; preds = %56
  %106 = load i32, i32* @numFileNames, align 4
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %108, label %110

; <label>:108:                                    ; preds = %105
  %pgocount18 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 61)
  %109 = add i64 %pgocount18, 1
  store i64 %109, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 61)
  store i32 1, i32* @srcMode, align 4
  br label %111

; <label>:110:                                    ; preds = %105
  store i32 3, i32* @srcMode, align 4
  br label %111

; <label>:111:                                    ; preds = %110, %108
  store i32 1, i32* @opMode, align 4
  %112 = load i8*, i8** @progName, align 8
  %113 = call i8* @strstr(i8* %112, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0)) #9
  %114 = icmp ne i8* %113, null
  br i1 %114, label %._crit_edge9, label %116

._crit_edge9:                                     ; preds = %111
  %pgocount19 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 63)
  %115 = add i64 %pgocount19, 1
  store i64 %115, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 63)
  br label %121

; <label>:116:                                    ; preds = %111
  %117 = load i8*, i8** @progName, align 8
  %118 = call i8* @strstr(i8* %117, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i32 0, i32 0)) #9
  %119 = icmp ne i8* %118, null
  br i1 %119, label %121, label %._crit_edge8

._crit_edge8:                                     ; preds = %116
  %pgocount20 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 60)
  %120 = add i64 %pgocount20, 1
  store i64 %120, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 60)
  br label %122

; <label>:121:                                    ; preds = %116, %._crit_edge9
  store i32 2, i32* @opMode, align 4
  br label %122

; <label>:122:                                    ; preds = %121, %._crit_edge8
  %123 = load i8*, i8** @progName, align 8
  %124 = call i8* @strstr(i8* %123, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0)) #9
  %125 = icmp ne i8* %124, null
  br i1 %125, label %._crit_edge10, label %127

._crit_edge10:                                    ; preds = %122
  %pgocount21 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 64)
  %126 = add i64 %pgocount21, 1
  store i64 %126, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 64)
  br label %141

; <label>:127:                                    ; preds = %122
  %128 = load i8*, i8** @progName, align 8
  %129 = call i8* @strstr(i8* %128, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i32 0, i32 0)) #9
  %130 = icmp ne i8* %129, null
  br i1 %130, label %141, label %131

; <label>:131:                                    ; preds = %127
  %pgocount22 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 72)
  %132 = add i64 %pgocount22, 1
  store i64 %132, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 72)
  %133 = load i8*, i8** @progName, align 8
  %134 = call i8* @strstr(i8* %133, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i32 0, i32 0)) #9
  %135 = icmp ne i8* %134, null
  br i1 %135, label %141, label %136

; <label>:136:                                    ; preds = %131
  %pgocount23 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 79)
  %137 = add i64 %pgocount23, 1
  store i64 %137, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 79)
  %138 = load i8*, i8** @progName, align 8
  %139 = call i8* @strstr(i8* %138, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15, i32 0, i32 0)) #9
  %140 = icmp ne i8* %139, null
  br i1 %140, label %141, label %148

; <label>:141:                                    ; preds = %136, %131, %127, %._crit_edge10
  %pgocount24 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 45)
  %142 = add i64 %pgocount24, 1
  store i64 %142, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 45)
  store i32 2, i32* @opMode, align 4
  %143 = load i32, i32* @numFileNames, align 4
  %144 = icmp eq i32 %143, 0
  %145 = zext i1 %144 to i64
  %pgocount25 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 94)
  %146 = add i64 %pgocount25, %145
  store i64 %146, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 94)
  %147 = select i1 %144, i32 1, i32 2
  store i32 %147, i32* @srcMode, align 4
  br label %148

; <label>:148:                                    ; preds = %141, %136
  %149 = load %struct.zzzz*, %struct.zzzz** %8, align 8
  store %struct.zzzz* %149, %struct.zzzz** %9, align 8
  br label %150

; <label>:150:                                    ; preds = %258, %148
  %151 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %152 = icmp ne %struct.zzzz* %151, null
  br i1 %152, label %153, label %263

; <label>:153:                                    ; preds = %150
  %154 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %155 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %154, i32 0, i32 0
  %156 = load i8*, i8** %155, align 8
  %157 = call i32 @strcmp(i8* %156, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0)) #9
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %159, label %161

; <label>:159:                                    ; preds = %153
  %pgocount26 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 58)
  %160 = add i64 %pgocount26, 1
  store i64 %160, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 58)
  br label %263

; <label>:161:                                    ; preds = %153
  %162 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %163 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %162, i32 0, i32 0
  %164 = load i8*, i8** %163, align 8
  %165 = getelementptr inbounds i8, i8* %164, i64 0
  %166 = load i8, i8* %165, align 1
  %167 = sext i8 %166 to i32
  %168 = icmp eq i32 %167, 45
  br i1 %168, label %170, label %._crit_edge

._crit_edge:                                      ; preds = %161
  %pgocount27 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 2)
  %169 = add i64 %pgocount27, 1
  store i64 %169, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 2)
  br label %257

; <label>:170:                                    ; preds = %161
  %171 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %172 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %171, i32 0, i32 0
  %173 = load i8*, i8** %172, align 8
  %174 = getelementptr inbounds i8, i8* %173, i64 1
  %175 = load i8, i8* %174, align 1
  %176 = sext i8 %175 to i32
  %177 = icmp ne i32 %176, 45
  br i1 %177, label %179, label %._crit_edge4

._crit_edge4:                                     ; preds = %170
  %pgocount28 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 38)
  %178 = add i64 %pgocount28, 1
  store i64 %178, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 38)
  br label %257

; <label>:179:                                    ; preds = %170
  store i32 1, i32* %6, align 4
  br label %180

; <label>:180:                                    ; preds = %253, %179
  %181 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %182 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %181, i32 0, i32 0
  %183 = load i8*, i8** %182, align 8
  %184 = load i32, i32* %6, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i8, i8* %183, i64 %185
  %187 = load i8, i8* %186, align 1
  %188 = sext i8 %187 to i32
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %190, label %256

; <label>:190:                                    ; preds = %180
  %191 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %192 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %191, i32 0, i32 0
  %193 = load i8*, i8** %192, align 8
  %194 = load i32, i32* %6, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i8, i8* %193, i64 %195
  %197 = load i8, i8* %196, align 1
  %198 = sext i8 %197 to i32
  switch i32 %198, label %243 [
    i32 99, label %201
    i32 100, label %203
    i32 122, label %205
    i32 102, label %207
    i32 116, label %209
    i32 107, label %211
    i32 115, label %213
    i32 113, label %215
    i32 49, label %217
    i32 50, label %219
    i32 51, label %221
    i32 52, label %223
    i32 53, label %225
    i32 54, label %227
    i32 55, label %229
    i32 56, label %231
    i32 57, label %233
    i32 86, label %._crit_edge1
    i32 76, label %._crit_edge2
    i32 118, label %236
    i32 104, label %240
  ]

._crit_edge2:                                     ; preds = %190
  %pgocount29 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 5)
  %199 = add i64 %pgocount29, 1
  store i64 %199, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 5)
  br label %235

._crit_edge1:                                     ; preds = %190
  %pgocount30 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 4)
  %200 = add i64 %pgocount30, 1
  store i64 %200, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 4)
  br label %235

; <label>:201:                                    ; preds = %190
  %pgocount31 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 11)
  %202 = add i64 %pgocount31, 1
  store i64 %202, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 11)
  store i32 2, i32* @srcMode, align 4
  br label %252

; <label>:203:                                    ; preds = %190
  %pgocount32 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 12)
  %204 = add i64 %pgocount32, 1
  store i64 %204, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 12)
  store i32 2, i32* @opMode, align 4
  br label %252

; <label>:205:                                    ; preds = %190
  %pgocount33 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 13)
  %206 = add i64 %pgocount33, 1
  store i64 %206, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 13)
  store i32 1, i32* @opMode, align 4
  br label %252

; <label>:207:                                    ; preds = %190
  %pgocount34 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 14)
  %208 = add i64 %pgocount34, 1
  store i64 %208, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 14)
  store i8 1, i8* @forceOverwrite, align 1
  br label %252

; <label>:209:                                    ; preds = %190
  %pgocount35 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 23)
  %210 = add i64 %pgocount35, 1
  store i64 %210, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 23)
  store i32 3, i32* @opMode, align 4
  br label %252

; <label>:211:                                    ; preds = %190
  %pgocount36 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 24)
  %212 = add i64 %pgocount36, 1
  store i64 %212, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 24)
  store i8 1, i8* @keepInputFiles, align 1
  br label %252

; <label>:213:                                    ; preds = %190
  %pgocount37 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 25)
  %214 = add i64 %pgocount37, 1
  store i64 %214, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 25)
  store i8 1, i8* @smallMode, align 1
  br label %252

; <label>:215:                                    ; preds = %190
  %pgocount38 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 21)
  %216 = add i64 %pgocount38, 1
  store i64 %216, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 21)
  store i8 0, i8* @noisy, align 1
  br label %252

; <label>:217:                                    ; preds = %190
  %pgocount39 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 27)
  %218 = add i64 %pgocount39, 1
  store i64 %218, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 27)
  store i32 1, i32* @blockSize100k, align 4
  br label %252

; <label>:219:                                    ; preds = %190
  %pgocount40 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 22)
  %220 = add i64 %pgocount40, 1
  store i64 %220, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 22)
  store i32 2, i32* @blockSize100k, align 4
  br label %252

; <label>:221:                                    ; preds = %190
  %pgocount41 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 19)
  %222 = add i64 %pgocount41, 1
  store i64 %222, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 19)
  store i32 3, i32* @blockSize100k, align 4
  br label %252

; <label>:223:                                    ; preds = %190
  %pgocount42 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 28)
  %224 = add i64 %pgocount42, 1
  store i64 %224, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 28)
  store i32 4, i32* @blockSize100k, align 4
  br label %252

; <label>:225:                                    ; preds = %190
  %pgocount43 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 15)
  %226 = add i64 %pgocount43, 1
  store i64 %226, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 15)
  store i32 5, i32* @blockSize100k, align 4
  br label %252

; <label>:227:                                    ; preds = %190
  %pgocount44 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 16)
  %228 = add i64 %pgocount44, 1
  store i64 %228, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 16)
  store i32 6, i32* @blockSize100k, align 4
  br label %252

; <label>:229:                                    ; preds = %190
  %pgocount45 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 17)
  %230 = add i64 %pgocount45, 1
  store i64 %230, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 17)
  store i32 7, i32* @blockSize100k, align 4
  br label %252

; <label>:231:                                    ; preds = %190
  %pgocount46 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 20)
  %232 = add i64 %pgocount46, 1
  store i64 %232, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 20)
  store i32 8, i32* @blockSize100k, align 4
  br label %252

; <label>:233:                                    ; preds = %190
  %pgocount47 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 18)
  %234 = add i64 %pgocount47, 1
  store i64 %234, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 18)
  store i32 9, i32* @blockSize100k, align 4
  br label %252

; <label>:235:                                    ; preds = %._crit_edge1, %._crit_edge2
  call void @license()
  br label %252

; <label>:236:                                    ; preds = %190
  %pgocount48 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 26)
  %237 = add i64 %pgocount48, 1
  store i64 %237, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 26)
  %238 = load i32, i32* @verbosity, align 4
  %239 = add nsw i32 %238, 1
  store i32 %239, i32* @verbosity, align 4
  br label %252

; <label>:240:                                    ; preds = %190
  %pgocount49 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 87)
  %241 = add i64 %pgocount49, 1
  store i64 %241, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 87)
  %242 = load i8*, i8** @progName, align 8
  call void @usage(i8* %242)
  call void @exit(i32 0) #10
  unreachable

; <label>:243:                                    ; preds = %190
  %pgocount50 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 88)
  %244 = add i64 %pgocount50, 1
  store i64 %244, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 88)
  %245 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %246 = load i8*, i8** @progName, align 8
  %247 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %248 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %247, i32 0, i32 0
  %249 = load i8*, i8** %248, align 8
  %250 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %245, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16, i32 0, i32 0), i8* %246, i8* %249)
  %251 = load i8*, i8** @progName, align 8
  call void @usage(i8* %251)
  call void @exit(i32 1) #10
  unreachable

; <label>:252:                                    ; preds = %236, %235, %233, %231, %229, %227, %225, %223, %221, %219, %217, %215, %213, %211, %209, %207, %205, %203, %201
  br label %253

; <label>:253:                                    ; preds = %252
  %254 = load i32, i32* %6, align 4
  %255 = add nsw i32 %254, 1
  store i32 %255, i32* %6, align 4
  br label %180

; <label>:256:                                    ; preds = %180
  br label %257

; <label>:257:                                    ; preds = %256, %._crit_edge4, %._crit_edge
  br label %258

; <label>:258:                                    ; preds = %257
  %pgocount51 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 1)
  %259 = add i64 %pgocount51, 1
  store i64 %259, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 1)
  %260 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %261 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %260, i32 0, i32 1
  %262 = load %struct.zzzz*, %struct.zzzz** %261, align 8
  store %struct.zzzz* %262, %struct.zzzz** %9, align 8
  br label %150

; <label>:263:                                    ; preds = %159, %150
  %264 = load %struct.zzzz*, %struct.zzzz** %8, align 8
  store %struct.zzzz* %264, %struct.zzzz** %9, align 8
  br label %265

; <label>:265:                                    ; preds = %455, %263
  %266 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %267 = icmp ne %struct.zzzz* %266, null
  br i1 %267, label %268, label %459

; <label>:268:                                    ; preds = %265
  %269 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %270 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %269, i32 0, i32 0
  %271 = load i8*, i8** %270, align 8
  %272 = call i32 @strcmp(i8* %271, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0)) #9
  %273 = icmp eq i32 %272, 0
  br i1 %273, label %274, label %276

; <label>:274:                                    ; preds = %268
  %pgocount52 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 59)
  %275 = add i64 %pgocount52, 1
  store i64 %275, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 59)
  br label %459

; <label>:276:                                    ; preds = %268
  %277 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %278 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %277, i32 0, i32 0
  %279 = load i8*, i8** %278, align 8
  %280 = call i32 @strcmp(i8* %279, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.17, i32 0, i32 0)) #9
  %281 = icmp eq i32 %280, 0
  br i1 %281, label %282, label %284

; <label>:282:                                    ; preds = %276
  %pgocount53 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 30)
  %283 = add i64 %pgocount53, 1
  store i64 %283, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 30)
  store i32 2, i32* @srcMode, align 4
  br label %454

; <label>:284:                                    ; preds = %276
  %285 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %286 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %285, i32 0, i32 0
  %287 = load i8*, i8** %286, align 8
  %288 = call i32 @strcmp(i8* %287, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18, i32 0, i32 0)) #9
  %289 = icmp eq i32 %288, 0
  br i1 %289, label %290, label %291

; <label>:290:                                    ; preds = %284
  store i32 2, i32* @opMode, align 4
  br label %452

; <label>:291:                                    ; preds = %284
  %292 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %293 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %292, i32 0, i32 0
  %294 = load i8*, i8** %293, align 8
  %295 = call i32 @strcmp(i8* %294, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.19, i32 0, i32 0)) #9
  %296 = icmp eq i32 %295, 0
  br i1 %296, label %297, label %298

; <label>:297:                                    ; preds = %291
  store i32 1, i32* @opMode, align 4
  br label %450

; <label>:298:                                    ; preds = %291
  %299 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %300 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %299, i32 0, i32 0
  %301 = load i8*, i8** %300, align 8
  %302 = call i32 @strcmp(i8* %301, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20, i32 0, i32 0)) #9
  %303 = icmp eq i32 %302, 0
  br i1 %303, label %304, label %306

; <label>:304:                                    ; preds = %298
  %pgocount54 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 33)
  %305 = add i64 %pgocount54, 1
  store i64 %305, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 33)
  store i8 1, i8* @forceOverwrite, align 1
  br label %449

; <label>:306:                                    ; preds = %298
  %307 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %308 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %307, i32 0, i32 0
  %309 = load i8*, i8** %308, align 8
  %310 = call i32 @strcmp(i8* %309, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i32 0, i32 0)) #9
  %311 = icmp eq i32 %310, 0
  br i1 %311, label %312, label %314

; <label>:312:                                    ; preds = %306
  %pgocount55 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 46)
  %313 = add i64 %pgocount55, 1
  store i64 %313, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 46)
  store i32 3, i32* @opMode, align 4
  br label %448

; <label>:314:                                    ; preds = %306
  %315 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %316 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %315, i32 0, i32 0
  %317 = load i8*, i8** %316, align 8
  %318 = call i32 @strcmp(i8* %317, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i32 0, i32 0)) #9
  %319 = icmp eq i32 %318, 0
  br i1 %319, label %320, label %322

; <label>:320:                                    ; preds = %314
  %pgocount56 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 51)
  %321 = add i64 %pgocount56, 1
  store i64 %321, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 51)
  store i8 1, i8* @keepInputFiles, align 1
  br label %447

; <label>:322:                                    ; preds = %314
  %323 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %324 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %323, i32 0, i32 0
  %325 = load i8*, i8** %324, align 8
  %326 = call i32 @strcmp(i8* %325, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.23, i32 0, i32 0)) #9
  %327 = icmp eq i32 %326, 0
  br i1 %327, label %328, label %330

; <label>:328:                                    ; preds = %322
  %pgocount57 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 62)
  %329 = add i64 %pgocount57, 1
  store i64 %329, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 62)
  store i8 1, i8* @smallMode, align 1
  br label %446

; <label>:330:                                    ; preds = %322
  %331 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %332 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %331, i32 0, i32 0
  %333 = load i8*, i8** %332, align 8
  %334 = call i32 @strcmp(i8* %333, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0)) #9
  %335 = icmp eq i32 %334, 0
  br i1 %335, label %336, label %338

; <label>:336:                                    ; preds = %330
  %pgocount58 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 68)
  %337 = add i64 %pgocount58, 1
  store i64 %337, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 68)
  store i8 0, i8* @noisy, align 1
  br label %445

; <label>:338:                                    ; preds = %330
  %339 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %340 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %339, i32 0, i32 0
  %341 = load i8*, i8** %340, align 8
  %342 = call i32 @strcmp(i8* %341, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i32 0, i32 0)) #9
  %343 = icmp eq i32 %342, 0
  br i1 %343, label %344, label %346

; <label>:344:                                    ; preds = %338
  %pgocount59 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 73)
  %345 = add i64 %pgocount59, 1
  store i64 %345, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 73)
  call void @license()
  br label %444

; <label>:346:                                    ; preds = %338
  %347 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %348 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %347, i32 0, i32 0
  %349 = load i8*, i8** %348, align 8
  %350 = call i32 @strcmp(i8* %349, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.26, i32 0, i32 0)) #9
  %351 = icmp eq i32 %350, 0
  br i1 %351, label %352, label %354

; <label>:352:                                    ; preds = %346
  %pgocount60 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 78)
  %353 = add i64 %pgocount60, 1
  store i64 %353, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 78)
  call void @license()
  br label %443

; <label>:354:                                    ; preds = %346
  %355 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %356 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %355, i32 0, i32 0
  %357 = load i8*, i8** %356, align 8
  %358 = call i32 @strcmp(i8* %357, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.27, i32 0, i32 0)) #9
  %359 = icmp eq i32 %358, 0
  br i1 %359, label %360, label %362

; <label>:360:                                    ; preds = %354
  %pgocount61 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 80)
  %361 = add i64 %pgocount61, 1
  store i64 %361, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 80)
  store i32 1, i32* @workFactor, align 4
  br label %442

; <label>:362:                                    ; preds = %354
  %363 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %364 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %363, i32 0, i32 0
  %365 = load i8*, i8** %364, align 8
  %366 = call i32 @strcmp(i8* %365, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.28, i32 0, i32 0)) #9
  %367 = icmp eq i32 %366, 0
  br i1 %367, label %368, label %373

; <label>:368:                                    ; preds = %362
  %pgocount62 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 81)
  %369 = add i64 %pgocount62, 1
  store i64 %369, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 81)
  %370 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %371 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %370, i32 0, i32 0
  %372 = load i8*, i8** %371, align 8
  call void @redundant(i8* %372)
  br label %441

; <label>:373:                                    ; preds = %362
  %374 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %375 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %374, i32 0, i32 0
  %376 = load i8*, i8** %375, align 8
  %377 = call i32 @strcmp(i8* %376, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.29, i32 0, i32 0)) #9
  %378 = icmp eq i32 %377, 0
  br i1 %378, label %379, label %384

; <label>:379:                                    ; preds = %373
  %pgocount63 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 82)
  %380 = add i64 %pgocount63, 1
  store i64 %380, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 82)
  %381 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %382 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %381, i32 0, i32 0
  %383 = load i8*, i8** %382, align 8
  call void @redundant(i8* %383)
  br label %440

; <label>:384:                                    ; preds = %373
  %385 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %386 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %385, i32 0, i32 0
  %387 = load i8*, i8** %386, align 8
  %388 = call i32 @strcmp(i8* %387, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i32 0, i32 0)) #9
  %389 = icmp eq i32 %388, 0
  br i1 %389, label %390, label %392

; <label>:390:                                    ; preds = %384
  %pgocount64 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 83)
  %391 = add i64 %pgocount64, 1
  store i64 %391, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 83)
  store i32 1, i32* @blockSize100k, align 4
  br label %439

; <label>:392:                                    ; preds = %384
  %393 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %394 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %393, i32 0, i32 0
  %395 = load i8*, i8** %394, align 8
  %396 = call i32 @strcmp(i8* %395, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.31, i32 0, i32 0)) #9
  %397 = icmp eq i32 %396, 0
  br i1 %397, label %398, label %400

; <label>:398:                                    ; preds = %392
  %pgocount65 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 85)
  %399 = add i64 %pgocount65, 1
  store i64 %399, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 85)
  store i32 9, i32* @blockSize100k, align 4
  br label %438

; <label>:400:                                    ; preds = %392
  %401 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %402 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %401, i32 0, i32 0
  %403 = load i8*, i8** %402, align 8
  %404 = call i32 @strcmp(i8* %403, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.32, i32 0, i32 0)) #9
  %405 = icmp eq i32 %404, 0
  br i1 %405, label %406, label %410

; <label>:406:                                    ; preds = %400
  %pgocount66 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 86)
  %407 = add i64 %pgocount66, 1
  store i64 %407, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 86)
  %408 = load i32, i32* @verbosity, align 4
  %409 = add nsw i32 %408, 1
  store i32 %409, i32* @verbosity, align 4
  br label %437

; <label>:410:                                    ; preds = %400
  %411 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %412 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %411, i32 0, i32 0
  %413 = load i8*, i8** %412, align 8
  %414 = call i32 @strcmp(i8* %413, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.33, i32 0, i32 0)) #9
  %415 = icmp eq i32 %414, 0
  br i1 %415, label %416, label %419

; <label>:416:                                    ; preds = %410
  %pgocount67 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 92)
  %417 = add i64 %pgocount67, 1
  store i64 %417, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 92)
  %418 = load i8*, i8** @progName, align 8
  call void @usage(i8* %418)
  call void @exit(i32 0) #10
  unreachable

; <label>:419:                                    ; preds = %410
  %420 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %421 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %420, i32 0, i32 0
  %422 = load i8*, i8** %421, align 8
  %423 = call i32 @strncmp(i8* %422, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i64 2) #9
  %424 = icmp eq i32 %423, 0
  br i1 %424, label %425, label %434

; <label>:425:                                    ; preds = %419
  %pgocount68 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 93)
  %426 = add i64 %pgocount68, 1
  store i64 %426, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 93)
  %427 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %428 = load i8*, i8** @progName, align 8
  %429 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %430 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %429, i32 0, i32 0
  %431 = load i8*, i8** %430, align 8
  %432 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %427, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16, i32 0, i32 0), i8* %428, i8* %431)
  %433 = load i8*, i8** @progName, align 8
  call void @usage(i8* %433)
  call void @exit(i32 1) #10
  unreachable

; <label>:434:                                    ; preds = %419
  br label %435

; <label>:435:                                    ; preds = %434
  %pgocount69 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 84)
  %436 = add i64 %pgocount69, 1
  store i64 %436, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 84)
  br label %437

; <label>:437:                                    ; preds = %435, %406
  br label %438

; <label>:438:                                    ; preds = %437, %398
  br label %439

; <label>:439:                                    ; preds = %438, %390
  br label %440

; <label>:440:                                    ; preds = %439, %379
  br label %441

; <label>:441:                                    ; preds = %440, %368
  br label %442

; <label>:442:                                    ; preds = %441, %360
  br label %443

; <label>:443:                                    ; preds = %442, %352
  br label %444

; <label>:444:                                    ; preds = %443, %344
  br label %445

; <label>:445:                                    ; preds = %444, %336
  br label %446

; <label>:446:                                    ; preds = %445, %328
  br label %447

; <label>:447:                                    ; preds = %446, %320
  br label %448

; <label>:448:                                    ; preds = %447, %312
  br label %449

; <label>:449:                                    ; preds = %448, %304
  br label %450

; <label>:450:                                    ; preds = %449, %297
  %pgocount70 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 8)
  %451 = add i64 %pgocount70, 1
  store i64 %451, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 8)
  br label %452

; <label>:452:                                    ; preds = %450, %290
  %pgocount71 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 44)
  %453 = add i64 %pgocount71, 1
  store i64 %453, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 44)
  br label %454

; <label>:454:                                    ; preds = %452, %282
  br label %455

; <label>:455:                                    ; preds = %454
  %456 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %457 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %456, i32 0, i32 1
  %458 = load %struct.zzzz*, %struct.zzzz** %457, align 8
  store %struct.zzzz* %458, %struct.zzzz** %9, align 8
  br label %265

; <label>:459:                                    ; preds = %274, %265
  %460 = load i32, i32* @verbosity, align 4
  %461 = icmp sgt i32 %460, 4
  br i1 %461, label %462, label %464

; <label>:462:                                    ; preds = %459
  %pgocount72 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 52)
  %463 = add i64 %pgocount72, 1
  store i64 %463, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 52)
  store i32 4, i32* @verbosity, align 4
  br label %464

; <label>:464:                                    ; preds = %462, %459
  %465 = load i32, i32* @opMode, align 4
  %466 = icmp eq i32 %465, 1
  br i1 %466, label %467, label %478

; <label>:467:                                    ; preds = %464
  %468 = load i8, i8* @smallMode, align 1
  %469 = zext i8 %468 to i32
  %470 = icmp ne i32 %469, 0
  br i1 %470, label %472, label %._crit_edge7

._crit_edge7:                                     ; preds = %467
  %pgocount73 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 57)
  %471 = add i64 %pgocount73, 1
  store i64 %471, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 57)
  br label %478

; <label>:472:                                    ; preds = %467
  %pgocount74 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 65)
  %473 = add i64 %pgocount74, 1
  store i64 %473, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 65)
  %474 = load i32, i32* @blockSize100k, align 4
  %475 = icmp sgt i32 %474, 2
  br i1 %475, label %476, label %478

; <label>:476:                                    ; preds = %472
  %pgocount75 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 70)
  %477 = add i64 %pgocount75, 1
  store i64 %477, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 70)
  store i32 2, i32* @blockSize100k, align 4
  br label %478

; <label>:478:                                    ; preds = %476, %472, %._crit_edge7, %464
  %479 = load i32, i32* @opMode, align 4
  %480 = icmp eq i32 %479, 3
  br i1 %480, label %481, label %490

; <label>:481:                                    ; preds = %478
  %pgocount76 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 53)
  %482 = add i64 %pgocount76, 1
  store i64 %482, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 53)
  %483 = load i32, i32* @srcMode, align 4
  %484 = icmp eq i32 %483, 2
  br i1 %484, label %485, label %490

; <label>:485:                                    ; preds = %481
  %pgocount77 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 89)
  %486 = add i64 %pgocount77, 1
  store i64 %486, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 89)
  %487 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %488 = load i8*, i8** @progName, align 8
  %489 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %487, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.34, i32 0, i32 0), i8* %488)
  call void @exit(i32 1) #10
  unreachable

; <label>:490:                                    ; preds = %481, %478
  %491 = load i32, i32* @srcMode, align 4
  %492 = icmp eq i32 %491, 2
  br i1 %492, label %493, label %499

; <label>:493:                                    ; preds = %490
  %pgocount78 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 54)
  %494 = add i64 %pgocount78, 1
  store i64 %494, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 54)
  %495 = load i32, i32* @numFileNames, align 4
  %496 = icmp eq i32 %495, 0
  br i1 %496, label %497, label %499

; <label>:497:                                    ; preds = %493
  %pgocount79 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 69)
  %498 = add i64 %pgocount79, 1
  store i64 %498, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 69)
  store i32 1, i32* @srcMode, align 4
  br label %499

; <label>:499:                                    ; preds = %497, %493, %490
  %500 = load i32, i32* @opMode, align 4
  %501 = icmp ne i32 %500, 1
  br i1 %501, label %502, label %504

; <label>:502:                                    ; preds = %499
  %pgocount80 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 55)
  %503 = add i64 %pgocount80, 1
  store i64 %503, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 55)
  store i32 0, i32* @blockSize100k, align 4
  br label %504

; <label>:504:                                    ; preds = %502, %499
  %505 = load i32, i32* @srcMode, align 4
  %506 = icmp eq i32 %505, 3
  br i1 %506, label %507, label %512

; <label>:507:                                    ; preds = %504
  %pgocount81 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 56)
  %508 = add i64 %pgocount81, 1
  store i64 %508, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 56)
  %509 = call void (i32)* @signal(i32 2, void (i32)* @mySignalCatcher) #8
  %510 = call void (i32)* @signal(i32 15, void (i32)* @mySignalCatcher) #8
  %511 = call void (i32)* @signal(i32 1, void (i32)* @mySignalCatcher) #8
  br label %512

; <label>:512:                                    ; preds = %507, %504
  %513 = load i32, i32* @opMode, align 4
  %514 = icmp eq i32 %513, 1
  br i1 %514, label %515, label %562

; <label>:515:                                    ; preds = %512
  %516 = load i32, i32* @srcMode, align 4
  %517 = icmp eq i32 %516, 1
  br i1 %517, label %518, label %520

; <label>:518:                                    ; preds = %515
  %pgocount82 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 66)
  %519 = add i64 %pgocount82, 1
  store i64 %519, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 66)
  call void @compress(i8* null)
  br label %561

; <label>:520:                                    ; preds = %515
  store i8 1, i8* %10, align 1
  %521 = load %struct.zzzz*, %struct.zzzz** %8, align 8
  store %struct.zzzz* %521, %struct.zzzz** %9, align 8
  br label %522

; <label>:522:                                    ; preds = %555, %520
  %523 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %524 = icmp ne %struct.zzzz* %523, null
  br i1 %524, label %525, label %559

; <label>:525:                                    ; preds = %522
  %526 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %527 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %526, i32 0, i32 0
  %528 = load i8*, i8** %527, align 8
  %529 = call i32 @strcmp(i8* %528, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0)) #9
  %530 = icmp eq i32 %529, 0
  br i1 %530, label %531, label %533

; <label>:531:                                    ; preds = %525
  %pgocount83 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 0)
  %532 = add i64 %pgocount83, 1
  store i64 %532, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 0)
  store i8 0, i8* %10, align 1
  br label %555

; <label>:533:                                    ; preds = %525
  %pgocount84 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 49)
  %534 = add i64 %pgocount84, 1
  store i64 %534, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 49)
  %535 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %536 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %535, i32 0, i32 0
  %537 = load i8*, i8** %536, align 8
  %538 = getelementptr inbounds i8, i8* %537, i64 0
  %539 = load i8, i8* %538, align 1
  %540 = sext i8 %539 to i32
  %541 = icmp eq i32 %540, 45
  br i1 %541, label %542, label %549

; <label>:542:                                    ; preds = %533
  %pgocount85 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 3)
  %543 = add i64 %pgocount85, 1
  store i64 %543, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 3)
  %544 = load i8, i8* %10, align 1
  %545 = zext i8 %544 to i32
  %546 = icmp ne i32 %545, 0
  br i1 %546, label %547, label %549

; <label>:547:                                    ; preds = %542
  %pgocount86 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 29)
  %548 = add i64 %pgocount86, 1
  store i64 %548, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 29)
  br label %555

; <label>:549:                                    ; preds = %542, %533
  %550 = load i32, i32* @numFilesProcessed, align 4
  %551 = add nsw i32 %550, 1
  store i32 %551, i32* @numFilesProcessed, align 4
  %552 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %553 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %552, i32 0, i32 0
  %554 = load i8*, i8** %553, align 8
  call void @compress(i8* %554)
  br label %555

; <label>:555:                                    ; preds = %549, %547, %531
  %556 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %557 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %556, i32 0, i32 1
  %558 = load %struct.zzzz*, %struct.zzzz** %557, align 8
  store %struct.zzzz* %558, %struct.zzzz** %9, align 8
  br label %522

; <label>:559:                                    ; preds = %522
  %pgocount87 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 67)
  %560 = add i64 %pgocount87, 1
  store i64 %560, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 67)
  br label %561

; <label>:561:                                    ; preds = %559, %518
  br label %680

; <label>:562:                                    ; preds = %512
  %563 = load i32, i32* @opMode, align 4
  %564 = icmp eq i32 %563, 2
  br i1 %564, label %565, label %618

; <label>:565:                                    ; preds = %562
  store i8 0, i8* @unzFailsExist, align 1
  %566 = load i32, i32* @srcMode, align 4
  %567 = icmp eq i32 %566, 1
  br i1 %567, label %568, label %570

; <label>:568:                                    ; preds = %565
  %pgocount88 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 74)
  %569 = add i64 %pgocount88, 1
  store i64 %569, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 74)
  call void @uncompress(i8* null)
  br label %611

; <label>:570:                                    ; preds = %565
  store i8 1, i8* %10, align 1
  %571 = load %struct.zzzz*, %struct.zzzz** %8, align 8
  store %struct.zzzz* %571, %struct.zzzz** %9, align 8
  br label %572

; <label>:572:                                    ; preds = %605, %570
  %573 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %574 = icmp ne %struct.zzzz* %573, null
  br i1 %574, label %575, label %609

; <label>:575:                                    ; preds = %572
  %576 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %577 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %576, i32 0, i32 0
  %578 = load i8*, i8** %577, align 8
  %579 = call i32 @strcmp(i8* %578, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0)) #9
  %580 = icmp eq i32 %579, 0
  br i1 %580, label %581, label %583

; <label>:581:                                    ; preds = %575
  %pgocount89 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 31)
  %582 = add i64 %pgocount89, 1
  store i64 %582, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 31)
  store i8 0, i8* %10, align 1
  br label %605

; <label>:583:                                    ; preds = %575
  %584 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %585 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %584, i32 0, i32 0
  %586 = load i8*, i8** %585, align 8
  %587 = getelementptr inbounds i8, i8* %586, i64 0
  %588 = load i8, i8* %587, align 1
  %589 = sext i8 %588 to i32
  %590 = icmp eq i32 %589, 45
  br i1 %590, label %591, label %598

; <label>:591:                                    ; preds = %583
  %pgocount90 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 40)
  %592 = add i64 %pgocount90, 1
  store i64 %592, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 40)
  %593 = load i8, i8* %10, align 1
  %594 = zext i8 %593 to i32
  %595 = icmp ne i32 %594, 0
  br i1 %595, label %596, label %598

; <label>:596:                                    ; preds = %591
  %pgocount91 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 47)
  %597 = add i64 %pgocount91, 1
  store i64 %597, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 47)
  br label %605

; <label>:598:                                    ; preds = %591, %583
  %pgocount92 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 9)
  %599 = add i64 %pgocount92, 1
  store i64 %599, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 9)
  %600 = load i32, i32* @numFilesProcessed, align 4
  %601 = add nsw i32 %600, 1
  store i32 %601, i32* @numFilesProcessed, align 4
  %602 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %603 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %602, i32 0, i32 0
  %604 = load i8*, i8** %603, align 8
  call void @uncompress(i8* %604)
  br label %605

; <label>:605:                                    ; preds = %598, %596, %581
  %606 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %607 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %606, i32 0, i32 1
  %608 = load %struct.zzzz*, %struct.zzzz** %607, align 8
  store %struct.zzzz* %608, %struct.zzzz** %9, align 8
  br label %572

; <label>:609:                                    ; preds = %572
  %pgocount93 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 75)
  %610 = add i64 %pgocount93, 1
  store i64 %610, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 75)
  br label %611

; <label>:611:                                    ; preds = %609, %568
  %612 = load i8, i8* @unzFailsExist, align 1
  %613 = icmp ne i8 %612, 0
  br i1 %613, label %614, label %617

; <label>:614:                                    ; preds = %611
  %pgocount94 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 90)
  %615 = add i64 %pgocount94, 1
  store i64 %615, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 90)
  call void @setExit(i32 2)
  %616 = load i32, i32* @exitValue, align 4
  call void @exit(i32 %616) #10
  unreachable

; <label>:617:                                    ; preds = %611
  br label %679

; <label>:618:                                    ; preds = %562
  store i8 0, i8* @testFailsExist, align 1
  %619 = load i32, i32* @srcMode, align 4
  %620 = icmp eq i32 %619, 1
  br i1 %620, label %621, label %623

; <label>:621:                                    ; preds = %618
  %pgocount95 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 76)
  %622 = add i64 %pgocount95, 1
  store i64 %622, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 76)
  call void @testf(i8* null)
  br label %664

; <label>:623:                                    ; preds = %618
  store i8 1, i8* %10, align 1
  %624 = load %struct.zzzz*, %struct.zzzz** %8, align 8
  store %struct.zzzz* %624, %struct.zzzz** %9, align 8
  br label %625

; <label>:625:                                    ; preds = %658, %623
  %626 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %627 = icmp ne %struct.zzzz* %626, null
  br i1 %627, label %628, label %662

; <label>:628:                                    ; preds = %625
  %629 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %630 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %629, i32 0, i32 0
  %631 = load i8*, i8** %630, align 8
  %632 = call i32 @strcmp(i8* %631, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0)) #9
  %633 = icmp eq i32 %632, 0
  br i1 %633, label %634, label %636

; <label>:634:                                    ; preds = %628
  %pgocount96 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 32)
  %635 = add i64 %pgocount96, 1
  store i64 %635, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 32)
  store i8 0, i8* %10, align 1
  br label %658

; <label>:636:                                    ; preds = %628
  %637 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %638 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %637, i32 0, i32 0
  %639 = load i8*, i8** %638, align 8
  %640 = getelementptr inbounds i8, i8* %639, i64 0
  %641 = load i8, i8* %640, align 1
  %642 = sext i8 %641 to i32
  %643 = icmp eq i32 %642, 45
  br i1 %643, label %644, label %651

; <label>:644:                                    ; preds = %636
  %pgocount97 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 41)
  %645 = add i64 %pgocount97, 1
  store i64 %645, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 41)
  %646 = load i8, i8* %10, align 1
  %647 = zext i8 %646 to i32
  %648 = icmp ne i32 %647, 0
  br i1 %648, label %649, label %651

; <label>:649:                                    ; preds = %644
  %pgocount98 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 48)
  %650 = add i64 %pgocount98, 1
  store i64 %650, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 48)
  br label %658

; <label>:651:                                    ; preds = %644, %636
  %pgocount99 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 10)
  %652 = add i64 %pgocount99, 1
  store i64 %652, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 10)
  %653 = load i32, i32* @numFilesProcessed, align 4
  %654 = add nsw i32 %653, 1
  store i32 %654, i32* @numFilesProcessed, align 4
  %655 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %656 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %655, i32 0, i32 0
  %657 = load i8*, i8** %656, align 8
  call void @testf(i8* %657)
  br label %658

; <label>:658:                                    ; preds = %651, %649, %634
  %659 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %660 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %659, i32 0, i32 1
  %661 = load %struct.zzzz*, %struct.zzzz** %660, align 8
  store %struct.zzzz* %661, %struct.zzzz** %9, align 8
  br label %625

; <label>:662:                                    ; preds = %625
  %pgocount100 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 77)
  %663 = add i64 %pgocount100, 1
  store i64 %663, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 77)
  br label %664

; <label>:664:                                    ; preds = %662, %621
  %665 = load i8, i8* @testFailsExist, align 1
  %666 = zext i8 %665 to i32
  %667 = icmp ne i32 %666, 0
  br i1 %667, label %668, label %678

; <label>:668:                                    ; preds = %664
  %pgocount101 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 71)
  %669 = add i64 %pgocount101, 1
  store i64 %669, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 71)
  %670 = load i8, i8* @noisy, align 1
  %671 = zext i8 %670 to i32
  %672 = icmp ne i32 %671, 0
  br i1 %672, label %673, label %678

; <label>:673:                                    ; preds = %668
  %pgocount102 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 91)
  %674 = add i64 %pgocount102, 1
  store i64 %674, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 91)
  %675 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %676 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %675, i8* getelementptr inbounds ([113 x i8], [113 x i8]* @.str.35, i32 0, i32 0))
  call void @setExit(i32 2)
  %677 = load i32, i32* @exitValue, align 4
  call void @exit(i32 %677) #10
  unreachable

; <label>:678:                                    ; preds = %668, %664
  br label %679

; <label>:679:                                    ; preds = %678, %617
  br label %680

; <label>:680:                                    ; preds = %679, %561
  %681 = load %struct.zzzz*, %struct.zzzz** %8, align 8
  store %struct.zzzz* %681, %struct.zzzz** %9, align 8
  br label %682

; <label>:682:                                    ; preds = %698, %680
  %683 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %684 = icmp ne %struct.zzzz* %683, null
  br i1 %684, label %685, label %703

; <label>:685:                                    ; preds = %682
  %686 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %687 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %686, i32 0, i32 1
  %688 = load %struct.zzzz*, %struct.zzzz** %687, align 8
  store %struct.zzzz* %688, %struct.zzzz** %11, align 8
  %689 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %690 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %689, i32 0, i32 0
  %691 = load i8*, i8** %690, align 8
  %692 = icmp ne i8* %691, null
  br i1 %692, label %694, label %._crit_edge5

._crit_edge5:                                     ; preds = %685
  %pgocount103 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 39)
  %693 = add i64 %pgocount103, 1
  store i64 %693, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 39)
  br label %698

; <label>:694:                                    ; preds = %685
  %695 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %696 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %695, i32 0, i32 0
  %697 = load i8*, i8** %696, align 8
  call void @free(i8* %697) #8
  br label %698

; <label>:698:                                    ; preds = %694, %._crit_edge5
  %pgocount104 = load i64, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 37)
  %699 = add i64 %pgocount104, 1
  store i64 %699, i64* getelementptr inbounds ([95 x i64], [95 x i64]* @__profc_main1, i64 0, i64 37)
  %700 = load %struct.zzzz*, %struct.zzzz** %9, align 8
  %701 = bitcast %struct.zzzz* %700 to i8*
  call void @free(i8* %701) #8
  %702 = load %struct.zzzz*, %struct.zzzz** %11, align 8
  store %struct.zzzz* %702, %struct.zzzz** %9, align 8
  br label %682

; <label>:703:                                    ; preds = %682
  %704 = load i32, i32* @exitValue, align 4
  ret i32 %704
}

; Function Attrs: nounwind
declare void (i32)* @signal(i32, void (i32)*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @mySIGSEGVorSIGBUScatcher(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* @opMode, align 4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %9

; <label>:5:                                      ; preds = %1
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = load i8*, i8** @progName, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([869 x i8], [869 x i8]* @.str.36, i32 0, i32 0), i8* %7)
  br label %14

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mySIGSEGVorSIGBUScatcher, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mySIGSEGVorSIGBUScatcher, i64 0, i64 0)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = load i8*, i8** @progName, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([996 x i8], [996 x i8]* @.str.37, i32 0, i32 0), i8* %12)
  br label %14

; <label>:14:                                     ; preds = %9, %5
  call void @showFileNames()
  %15 = load i32, i32* @opMode, align 4
  %16 = icmp eq i32 %15, 1
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mySIGSEGVorSIGBUScatcher, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mySIGSEGVorSIGBUScatcher, i64 0, i64 1)
  call void @cleanUpAndFail(i32 3) #11
  unreachable

; <label>:19:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mySIGSEGVorSIGBUScatcher, i64 0, i64 2)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mySIGSEGVorSIGBUScatcher, i64 0, i64 2)
  call void @cadvise()
  call void @cleanUpAndFail(i32 2) #11
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @copyFileName(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = call i64 @strlen(i8* %5) #9
  %7 = icmp ugt i64 %6, 1024
  br i1 %7, label %8, label %14

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_copyFileName, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_copyFileName, i64 0, i64 1)
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = load i8*, i8** %4, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([120 x i8], [120 x i8]* @.str.47, i32 0, i32 0), i8* %11, i32 1024)
  call void @setExit(i32 1)
  %13 = load i32, i32* @exitValue, align 4
  call void @exit(i32 %13) #10
  unreachable

; <label>:14:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_copyFileName, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_copyFileName, i64 0, i64 0)
  %16 = load i8*, i8** %3, align 8
  %17 = load i8*, i8** %4, align 8
  %18 = call i8* @strncpy(i8* %16, i8* %17, i64 1024) #8
  %19 = load i8*, i8** %3, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 1024
  store i8 0, i8* %20, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @addFlagsFromEnvVar(%struct.zzzz**, i8*) #0 {
  %3 = alloca %struct.zzzz**, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  store %struct.zzzz** %0, %struct.zzzz*** %3, align 8
  store i8* %1, i8** %4, align 8
  %10 = load i8*, i8** %4, align 8
  %11 = call i8* @getenv(i8* %10) #8
  store i8* %11, i8** %8, align 8
  %12 = load i8*, i8** %8, align 8
  %13 = icmp ne i8* %12, null
  br i1 %13, label %14, label %119

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %8, align 8
  store i8* %15, i8** %9, align 8
  store i32 0, i32* %5, align 4
  br label %16

; <label>:16:                                     ; preds = %116, %14
  %17 = load i8*, i8** %9, align 8
  %18 = load i32, i32* %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8* %17, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 8)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 8)
  br label %118

; <label>:26:                                     ; preds = %16
  %27 = load i32, i32* %5, align 4
  %28 = load i8*, i8** %9, align 8
  %29 = sext i32 %27 to i64
  %30 = getelementptr inbounds i8, i8* %28, i64 %29
  store i8* %30, i8** %9, align 8
  store i32 0, i32* %5, align 4
  br label %31

; <label>:31:                                     ; preds = %44, %26
  %32 = call i16** @__ctype_b_loc() #12
  %33 = load i16*, i16** %32, align 8
  %34 = load i8*, i8** %9, align 8
  %35 = getelementptr inbounds i8, i8* %34, i64 0
  %36 = load i8, i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i16, i16* %33, i64 %38
  %40 = load i16, i16* %39, align 2
  %41 = zext i16 %40 to i32
  %42 = and i32 %41, 8192
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 0)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 0)
  %46 = load i8*, i8** %9, align 8
  %47 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %47, i8** %9, align 8
  br label %31

; <label>:48:                                     ; preds = %31
  br label %49

; <label>:49:                                     ; preds = %76, %48
  %50 = load i8*, i8** %9, align 8
  %51 = load i32, i32* %5, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8* %50, i64 %52
  %54 = load i8, i8* %53, align 1
  %55 = sext i8 %54 to i32
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %74

; <label>:57:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 2)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 2)
  %59 = call i16** @__ctype_b_loc() #12
  %60 = load i16*, i16** %59, align 8
  %61 = load i8*, i8** %9, align 8
  %62 = load i32, i32* %5, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8* %61, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = sext i8 %65 to i32
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i16, i16* %60, i64 %67
  %69 = load i16, i16* %68, align 2
  %70 = zext i16 %69 to i32
  %71 = and i32 %70, 8192
  %72 = icmp ne i32 %71, 0
  %73 = xor i1 %72, true
  br label %74

; <label>:74:                                     ; preds = %57, %49
  %75 = phi i1 [ false, %49 ], [ %73, %57 ]
  br i1 %75, label %76, label %80

; <label>:76:                                     ; preds = %74
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 1)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 1)
  %78 = load i32, i32* %5, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %5, align 4
  br label %49

; <label>:80:                                     ; preds = %74
  %81 = load i32, i32* %5, align 4
  %82 = icmp sgt i32 %81, 0
  br i1 %82, label %83, label %116

; <label>:83:                                     ; preds = %80
  %84 = load i32, i32* %5, align 4
  store i32 %84, i32* %7, align 4
  %85 = load i32, i32* %7, align 4
  %86 = icmp sgt i32 %85, 1024
  br i1 %86, label %87, label %89

; <label>:87:                                     ; preds = %83
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 6)
  %88 = add i64 %pgocount4, 1
  store i64 %88, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 6)
  store i32 1024, i32* %7, align 4
  br label %89

; <label>:89:                                     ; preds = %87, %83
  store i32 0, i32* %6, align 4
  br label %90

; <label>:90:                                     ; preds = %103, %89
  %91 = load i32, i32* %6, align 4
  %92 = load i32, i32* %7, align 4
  %93 = icmp slt i32 %91, %92
  br i1 %93, label %94, label %107

; <label>:94:                                     ; preds = %90
  %95 = load i8*, i8** %9, align 8
  %96 = load i32, i32* %6, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8* %95, i64 %97
  %99 = load i8, i8* %98, align 1
  %100 = load i32, i32* %6, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 %101
  store i8 %99, i8* %102, align 1
  br label %103

; <label>:103:                                    ; preds = %94
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 3)
  %104 = add i64 %pgocount5, 1
  store i64 %104, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 3)
  %105 = load i32, i32* %6, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %6, align 4
  br label %90

; <label>:107:                                    ; preds = %90
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 5)
  %108 = add i64 %pgocount6, 1
  store i64 %108, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 5)
  %109 = load i32, i32* %7, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 %110
  store i8 0, i8* %111, align 1
  %112 = load %struct.zzzz**, %struct.zzzz*** %3, align 8
  %113 = load %struct.zzzz*, %struct.zzzz** %112, align 8
  %114 = call %struct.zzzz* @snocString(%struct.zzzz* %113, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @tmpName, i32 0, i32 0))
  %115 = load %struct.zzzz**, %struct.zzzz*** %3, align 8
  store %struct.zzzz* %114, %struct.zzzz** %115, align 8
  br label %116

; <label>:116:                                    ; preds = %107, %80
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 4)
  %117 = add i64 %pgocount7, 1
  store i64 %117, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 4)
  br label %16

; <label>:118:                                    ; preds = %24
  br label %119

; <label>:119:                                    ; preds = %118, %2
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 7)
  %120 = add i64 %pgocount8, 1
  store i64 %120, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_addFlagsFromEnvVar, i64 0, i64 7)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.zzzz* @snocString(%struct.zzzz*, i8*) #0 {
  %3 = alloca %struct.zzzz*, align 8
  %4 = alloca %struct.zzzz*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.zzzz*, align 8
  %7 = alloca %struct.zzzz*, align 8
  store %struct.zzzz* %0, %struct.zzzz** %4, align 8
  store i8* %1, i8** %5, align 8
  %8 = load %struct.zzzz*, %struct.zzzz** %4, align 8
  %9 = icmp eq %struct.zzzz* %8, null
  br i1 %9, label %10, label %26

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_snocString, i64 0, i64 2)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_snocString, i64 0, i64 2)
  %12 = call %struct.zzzz* @mkCell()
  store %struct.zzzz* %12, %struct.zzzz** %6, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = call i64 @strlen(i8* %13) #9
  %15 = add i64 5, %14
  %16 = trunc i64 %15 to i32
  %17 = call i8* @myMalloc(i32 %16)
  %18 = load %struct.zzzz*, %struct.zzzz** %6, align 8
  %19 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %18, i32 0, i32 0
  store i8* %17, i8** %19, align 8
  %20 = load %struct.zzzz*, %struct.zzzz** %6, align 8
  %21 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %20, i32 0, i32 0
  %22 = load i8*, i8** %21, align 8
  %23 = load i8*, i8** %5, align 8
  %24 = call i8* @strcpy(i8* %22, i8* %23) #8
  %25 = load %struct.zzzz*, %struct.zzzz** %6, align 8
  store %struct.zzzz* %25, %struct.zzzz** %3, align 8
  br label %48

; <label>:26:                                     ; preds = %2
  %27 = load %struct.zzzz*, %struct.zzzz** %4, align 8
  store %struct.zzzz* %27, %struct.zzzz** %7, align 8
  br label %28

; <label>:28:                                     ; preds = %33, %26
  %29 = load %struct.zzzz*, %struct.zzzz** %7, align 8
  %30 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %29, i32 0, i32 1
  %31 = load %struct.zzzz*, %struct.zzzz** %30, align 8
  %32 = icmp ne %struct.zzzz* %31, null
  br i1 %32, label %33, label %38

; <label>:33:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_snocString, i64 0, i64 0)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_snocString, i64 0, i64 0)
  %35 = load %struct.zzzz*, %struct.zzzz** %7, align 8
  %36 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %35, i32 0, i32 1
  %37 = load %struct.zzzz*, %struct.zzzz** %36, align 8
  store %struct.zzzz* %37, %struct.zzzz** %7, align 8
  br label %28

; <label>:38:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_snocString, i64 0, i64 1)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_snocString, i64 0, i64 1)
  %40 = load %struct.zzzz*, %struct.zzzz** %7, align 8
  %41 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %40, i32 0, i32 1
  %42 = load %struct.zzzz*, %struct.zzzz** %41, align 8
  %43 = load i8*, i8** %5, align 8
  %44 = call %struct.zzzz* @snocString(%struct.zzzz* %42, i8* %43)
  %45 = load %struct.zzzz*, %struct.zzzz** %7, align 8
  %46 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %45, i32 0, i32 1
  store %struct.zzzz* %44, %struct.zzzz** %46, align 8
  %47 = load %struct.zzzz*, %struct.zzzz** %4, align 8
  store %struct.zzzz* %47, %struct.zzzz** %3, align 8
  br label %48

; <label>:48:                                     ; preds = %38, %10
  %49 = load %struct.zzzz*, %struct.zzzz** %3, align 8
  ret %struct.zzzz* %49
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind readonly
declare i8* @strstr(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @license() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_license, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_license, i64 0, i64 0)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i8* @BZ2_bzlibVersion()
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([531 x i8], [531 x i8]* @.str.49, i32 0, i32 0), i8* %3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @usage(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i8* @BZ2_bzlibVersion()
  %6 = load i8*, i8** %3, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([1230 x i8], [1230 x i8]* @.str.50, i32 0, i32 0), i8* %5, i8* %6)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define internal void @redundant(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_redundant, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_redundant, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = load i8*, i8** @progName, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.51, i32 0, i32 0), i8* %5, i8* %6)
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @mySignalCatcher(i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_mySignalCatcher, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_mySignalCatcher, i64 0, i64 0)
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = load i8*, i8** @progName, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.52, i32 0, i32 0), i8* %5)
  call void @cleanUpAndFail(i32 1) #11
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @compress(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.stat, align 8
  %8 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %9 = load i8*, i8** %2, align 8
  %10 = icmp eq i8* %9, null
  br i1 %10, label %11, label %17

; <label>:11:                                     ; preds = %1
  %12 = load i32, i32* @srcMode, align 4
  %13 = icmp ne i32 %12, 1
  br i1 %13, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 4)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 4)
  br label %17

; <label>:15:                                     ; preds = %11
  %pgocount6 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 40)
  %16 = add i64 %pgocount6, 1
  store i64 %16, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 40)
  call void @panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.53, i32 0, i32 0)) #11
  unreachable

; <label>:17:                                     ; preds = %._crit_edge, %1
  %18 = load i32, i32* @srcMode, align 4
  switch i32 %18, label %._crit_edge2 [
    i32 1, label %20
    i32 3, label %21
    i32 2, label %26
  ]

._crit_edge2:                                     ; preds = %17
  %pgocount7 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 9)
  %19 = add i64 %pgocount7, 1
  store i64 %19, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 9)
  br label %29

; <label>:20:                                     ; preds = %17
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.54, i32 0, i32 0))
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.55, i32 0, i32 0))
  br label %29

; <label>:21:                                     ; preds = %17
  %pgocount8 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 1)
  %22 = add i64 %pgocount8, 1
  store i64 %22, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 1)
  %23 = load i8*, i8** %2, align 8
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %23)
  %24 = load i8*, i8** %2, align 8
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* %24)
  %25 = call i8* @strcat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)) #8
  br label %29

; <label>:26:                                     ; preds = %17
  %pgocount9 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 2)
  %27 = add i64 %pgocount9, 1
  store i64 %27, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 2)
  %28 = load i8*, i8** %2, align 8
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %28)
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.55, i32 0, i32 0))
  br label %29

; <label>:29:                                     ; preds = %26, %21, %20, %._crit_edge2
  %30 = load i32, i32* @srcMode, align 4
  %31 = icmp ne i32 %30, 1
  br i1 %31, label %32, label %47

; <label>:32:                                     ; preds = %29
  %33 = call zeroext i8 @containsDubiousChars(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  %34 = zext i8 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %37, label %._crit_edge4

._crit_edge4:                                     ; preds = %32
  %pgocount10 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 13)
  %36 = add i64 %pgocount10, 1
  store i64 %36, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 13)
  br label %47

; <label>:37:                                     ; preds = %32
  %38 = load i8, i8* @noisy, align 1
  %39 = icmp ne i8 %38, 0
  br i1 %39, label %41, label %._crit_edge5

._crit_edge5:                                     ; preds = %37
  %pgocount11 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 18)
  %40 = add i64 %pgocount11, 1
  store i64 %40, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 18)
  br label %46

; <label>:41:                                     ; preds = %37
  %pgocount12 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 3)
  %42 = add i64 %pgocount12, 1
  store i64 %42, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 3)
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = load i8*, i8** @progName, align 8
  %45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.56, i32 0, i32 0), i8* %44, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  br label %46

; <label>:46:                                     ; preds = %41, %._crit_edge5
  call void @setExit(i32 1)
  br label %308

; <label>:47:                                     ; preds = %._crit_edge4, %29
  %48 = load i32, i32* @srcMode, align 4
  %49 = icmp ne i32 %48, 1
  br i1 %49, label %51, label %._crit_edge1

._crit_edge1:                                     ; preds = %47
  %pgocount13 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 5)
  %50 = add i64 %pgocount13, 1
  store i64 %50, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 5)
  br label %63

; <label>:51:                                     ; preds = %47
  %52 = call zeroext i8 @fileExists(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  %53 = icmp ne i8 %52, 0
  br i1 %53, label %._crit_edge3, label %55

._crit_edge3:                                     ; preds = %51
  %pgocount14 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 10)
  %54 = add i64 %pgocount14, 1
  store i64 %54, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 10)
  br label %63

; <label>:55:                                     ; preds = %51
  %pgocount15 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 8)
  %56 = add i64 %pgocount15, 1
  store i64 %56, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 8)
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = load i8*, i8** @progName, align 8
  %59 = call i32* @__errno_location() #12
  %60 = load i32, i32* %59, align 4
  %61 = call i8* @strerror(i32 %60) #8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.57, i32 0, i32 0), i8* %58, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %61)
  call void @setExit(i32 1)
  br label %308

; <label>:63:                                     ; preds = %._crit_edge3, %._crit_edge1
  store i32 0, i32* %6, align 4
  br label %64

; <label>:64:                                     ; preds = %88, %63
  %65 = load i32, i32* %6, align 4
  %66 = icmp slt i32 %65, 4
  br i1 %66, label %67, label %92

; <label>:67:                                     ; preds = %64
  %68 = load i32, i32* %6, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [4 x i8*], [4 x i8*]* @zSuffix, i64 0, i64 %69
  %71 = load i8*, i8** %70, align 8
  %72 = call zeroext i8 @hasSuffix(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %71)
  %73 = icmp ne i8 %72, 0
  br i1 %73, label %74, label %87

; <label>:74:                                     ; preds = %67
  %75 = load i8, i8* @noisy, align 1
  %76 = icmp ne i8 %75, 0
  br i1 %76, label %77, label %86

; <label>:77:                                     ; preds = %74
  %pgocount16 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 6)
  %78 = add i64 %pgocount16, 1
  store i64 %78, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 6)
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %80 = load i8*, i8** @progName, align 8
  %81 = load i32, i32* %6, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [4 x i8*], [4 x i8*]* @zSuffix, i64 0, i64 %82
  %84 = load i8*, i8** %83, align 8
  %85 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %79, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.58, i32 0, i32 0), i8* %80, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %84)
  br label %86

; <label>:86:                                     ; preds = %77, %74
  call void @setExit(i32 1)
  br label %308

; <label>:87:                                     ; preds = %67
  br label %88

; <label>:88:                                     ; preds = %87
  %pgocount17 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 0)
  %89 = add i64 %pgocount17, 1
  store i64 %89, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 0)
  %90 = load i32, i32* %6, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %6, align 4
  br label %64

; <label>:92:                                     ; preds = %64
  %93 = load i32, i32* @srcMode, align 4
  %94 = icmp eq i32 %93, 3
  br i1 %94, label %99, label %95

; <label>:95:                                     ; preds = %92
  %pgocount18 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 7)
  %96 = add i64 %pgocount18, 1
  store i64 %96, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 7)
  %97 = load i32, i32* @srcMode, align 4
  %98 = icmp eq i32 %97, 2
  br i1 %98, label %99, label %112

; <label>:99:                                     ; preds = %95, %92
  %100 = call i32 @stat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), %struct.stat* %7) #8
  %101 = getelementptr inbounds %struct.stat, %struct.stat* %7, i32 0, i32 3
  %102 = load i32, i32* %101, align 8
  %103 = and i32 %102, 61440
  %104 = icmp eq i32 %103, 16384
  br i1 %104, label %105, label %110

; <label>:105:                                    ; preds = %99
  %pgocount19 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 11)
  %106 = add i64 %pgocount19, 1
  store i64 %106, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 11)
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %108 = load i8*, i8** @progName, align 8
  %109 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %107, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.59, i32 0, i32 0), i8* %108, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  call void @setExit(i32 1)
  br label %308

; <label>:110:                                    ; preds = %99
  %pgocount20 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 12)
  %111 = add i64 %pgocount20, 1
  store i64 %111, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 12)
  br label %112

; <label>:112:                                    ; preds = %110, %95
  %113 = load i32, i32* @srcMode, align 4
  %114 = icmp eq i32 %113, 3
  br i1 %114, label %115, label %134

; <label>:115:                                    ; preds = %112
  %pgocount21 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 14)
  %116 = add i64 %pgocount21, 1
  store i64 %116, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 14)
  %117 = load i8, i8* @forceOverwrite, align 1
  %118 = icmp ne i8 %117, 0
  br i1 %118, label %134, label %119

; <label>:119:                                    ; preds = %115
  %pgocount22 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 19)
  %120 = add i64 %pgocount22, 1
  store i64 %120, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 19)
  %121 = call zeroext i8 @notAStandardFile(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  %122 = zext i8 %121 to i32
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %134

; <label>:124:                                    ; preds = %119
  %125 = load i8, i8* @noisy, align 1
  %126 = icmp ne i8 %125, 0
  br i1 %126, label %127, label %132

; <label>:127:                                    ; preds = %124
  %pgocount23 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 33)
  %128 = add i64 %pgocount23, 1
  store i64 %128, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 33)
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %130 = load i8*, i8** @progName, align 8
  %131 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %129, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.60, i32 0, i32 0), i8* %130, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  br label %132

; <label>:132:                                    ; preds = %127, %124
  %pgocount24 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 24)
  %133 = add i64 %pgocount24, 1
  store i64 %133, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 24)
  call void @setExit(i32 1)
  br label %308

; <label>:134:                                    ; preds = %119, %115, %112
  %135 = load i32, i32* @srcMode, align 4
  %136 = icmp eq i32 %135, 3
  br i1 %136, label %137, label %154

; <label>:137:                                    ; preds = %134
  %pgocount25 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 15)
  %138 = add i64 %pgocount25, 1
  store i64 %138, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 15)
  %139 = call zeroext i8 @fileExists(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0))
  %140 = zext i8 %139 to i32
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %154

; <label>:142:                                    ; preds = %137
  %143 = load i8, i8* @forceOverwrite, align 1
  %144 = icmp ne i8 %143, 0
  br i1 %144, label %145, label %148

; <label>:145:                                    ; preds = %142
  %pgocount26 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 20)
  %146 = add i64 %pgocount26, 1
  store i64 %146, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 20)
  %147 = call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0)) #8
  br label %153

; <label>:148:                                    ; preds = %142
  %pgocount27 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 27)
  %149 = add i64 %pgocount27, 1
  store i64 %149, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 27)
  %150 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %151 = load i8*, i8** @progName, align 8
  %152 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %150, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.61, i32 0, i32 0), i8* %151, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0))
  call void @setExit(i32 1)
  br label %308

; <label>:153:                                    ; preds = %145
  br label %154

; <label>:154:                                    ; preds = %153, %137, %134
  %155 = load i32, i32* @srcMode, align 4
  %156 = icmp eq i32 %155, 3
  br i1 %156, label %157, label %176

; <label>:157:                                    ; preds = %154
  %pgocount28 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 16)
  %158 = add i64 %pgocount28, 1
  store i64 %158, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 16)
  %159 = load i8, i8* @forceOverwrite, align 1
  %160 = icmp ne i8 %159, 0
  br i1 %160, label %176, label %161

; <label>:161:                                    ; preds = %157
  %pgocount29 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 21)
  %162 = add i64 %pgocount29, 1
  store i64 %162, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 21)
  %163 = call i32 @countHardLinks(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  store i32 %163, i32* %5, align 4
  %164 = icmp sgt i32 %163, 0
  br i1 %164, label %165, label %176

; <label>:165:                                    ; preds = %161
  %pgocount30 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 28)
  %166 = add i64 %pgocount30, 1
  store i64 %166, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 28)
  %167 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %168 = load i8*, i8** @progName, align 8
  %169 = load i32, i32* %5, align 4
  %170 = load i32, i32* %5, align 4
  %171 = icmp sgt i32 %170, 1
  %172 = zext i1 %171 to i64
  %pgocount31 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 43)
  %173 = add i64 %pgocount31, %172
  store i64 %173, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 43)
  %174 = select i1 %171, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.63, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0)
  %175 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %167, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.62, i32 0, i32 0), i8* %168, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i32 %169, i8* %174)
  call void @setExit(i32 1)
  br label %308

; <label>:176:                                    ; preds = %161, %157, %154
  %177 = load i32, i32* @srcMode, align 4
  %178 = icmp eq i32 %177, 3
  br i1 %178, label %179, label %181

; <label>:179:                                    ; preds = %176
  %pgocount32 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 17)
  %180 = add i64 %pgocount32, 1
  store i64 %180, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 17)
  call void @saveInputFileMetaInfo(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  br label %181

; <label>:181:                                    ; preds = %179, %176
  %182 = load i32, i32* @srcMode, align 4
  switch i32 %182, label %277 [
    i32 1, label %183
    i32 2, label %201
    i32 3, label %237
  ]

; <label>:183:                                    ; preds = %181
  %184 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %184, %struct._IO_FILE** %3, align 8
  %185 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %185, %struct._IO_FILE** %4, align 8
  %186 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %187 = call i32 @fileno(%struct._IO_FILE* %186) #8
  %188 = call i32 @isatty(i32 %187) #8
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %190, label %199

; <label>:190:                                    ; preds = %183
  %pgocount33 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 22)
  %191 = add i64 %pgocount33, 1
  store i64 %191, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 22)
  %192 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %193 = load i8*, i8** @progName, align 8
  %194 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %192, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.64, i32 0, i32 0), i8* %193)
  %195 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %196 = load i8*, i8** @progName, align 8
  %197 = load i8*, i8** @progName, align 8
  %198 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %195, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.65, i32 0, i32 0), i8* %196, i8* %197)
  call void @setExit(i32 1)
  br label %308

; <label>:199:                                    ; preds = %183
  %pgocount34 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 31)
  %200 = add i64 %pgocount34, 1
  store i64 %200, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 31)
  br label %279

; <label>:201:                                    ; preds = %181
  %202 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0))
  store %struct._IO_FILE* %202, %struct._IO_FILE** %3, align 8
  %203 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %203, %struct._IO_FILE** %4, align 8
  %204 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %205 = call i32 @fileno(%struct._IO_FILE* %204) #8
  %206 = call i32 @isatty(i32 %205) #8
  %207 = icmp ne i32 %206, 0
  br i1 %207, label %208, label %224

; <label>:208:                                    ; preds = %201
  %209 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %210 = load i8*, i8** @progName, align 8
  %211 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %209, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.64, i32 0, i32 0), i8* %210)
  %212 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %213 = load i8*, i8** @progName, align 8
  %214 = load i8*, i8** @progName, align 8
  %215 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %212, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.65, i32 0, i32 0), i8* %213, i8* %214)
  %216 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %217 = icmp ne %struct._IO_FILE* %216, null
  br i1 %217, label %218, label %222

; <label>:218:                                    ; preds = %208
  %pgocount35 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 29)
  %219 = add i64 %pgocount35, 1
  store i64 %219, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 29)
  %220 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %221 = call i32 @fclose(%struct._IO_FILE* %220)
  br label %222

; <label>:222:                                    ; preds = %218, %208
  %pgocount36 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 23)
  %223 = add i64 %pgocount36, 1
  store i64 %223, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 23)
  call void @setExit(i32 1)
  br label %308

; <label>:224:                                    ; preds = %201
  %225 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %226 = icmp eq %struct._IO_FILE* %225, null
  br i1 %226, label %227, label %235

; <label>:227:                                    ; preds = %224
  %pgocount37 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 39)
  %228 = add i64 %pgocount37, 1
  store i64 %228, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 39)
  %229 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %230 = load i8*, i8** @progName, align 8
  %231 = call i32* @__errno_location() #12
  %232 = load i32, i32* %231, align 4
  %233 = call i8* @strerror(i32 %232) #8
  %234 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %229, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.57, i32 0, i32 0), i8* %230, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %233)
  call void @setExit(i32 1)
  br label %308

; <label>:235:                                    ; preds = %224
  %pgocount38 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 34)
  %236 = add i64 %pgocount38, 1
  store i64 %236, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 34)
  br label %279

; <label>:237:                                    ; preds = %181
  %238 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0))
  store %struct._IO_FILE* %238, %struct._IO_FILE** %3, align 8
  %239 = call %struct._IO_FILE* @fopen_output_safely(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.67, i32 0, i32 0))
  store %struct._IO_FILE* %239, %struct._IO_FILE** %4, align 8
  %240 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %241 = icmp eq %struct._IO_FILE* %240, null
  br i1 %241, label %242, label %257

; <label>:242:                                    ; preds = %237
  %243 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %244 = load i8*, i8** @progName, align 8
  %245 = call i32* @__errno_location() #12
  %246 = load i32, i32* %245, align 4
  %247 = call i8* @strerror(i32 %246) #8
  %248 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %243, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.68, i32 0, i32 0), i8* %244, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* %247)
  %249 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %250 = icmp ne %struct._IO_FILE* %249, null
  br i1 %250, label %251, label %255

; <label>:251:                                    ; preds = %242
  %pgocount39 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 35)
  %252 = add i64 %pgocount39, 1
  store i64 %252, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 35)
  %253 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %254 = call i32 @fclose(%struct._IO_FILE* %253)
  br label %255

; <label>:255:                                    ; preds = %251, %242
  %pgocount40 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 32)
  %256 = add i64 %pgocount40, 1
  store i64 %256, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 32)
  call void @setExit(i32 1)
  br label %308

; <label>:257:                                    ; preds = %237
  %258 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %259 = icmp eq %struct._IO_FILE* %258, null
  br i1 %259, label %260, label %275

; <label>:260:                                    ; preds = %257
  %261 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %262 = load i8*, i8** @progName, align 8
  %263 = call i32* @__errno_location() #12
  %264 = load i32, i32* %263, align 4
  %265 = call i8* @strerror(i32 %264) #8
  %266 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %261, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.57, i32 0, i32 0), i8* %262, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %265)
  %267 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %268 = icmp ne %struct._IO_FILE* %267, null
  br i1 %268, label %269, label %273

; <label>:269:                                    ; preds = %260
  %pgocount41 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 38)
  %270 = add i64 %pgocount41, 1
  store i64 %270, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 38)
  %271 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %272 = call i32 @fclose(%struct._IO_FILE* %271)
  br label %273

; <label>:273:                                    ; preds = %269, %260
  %pgocount42 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 36)
  %274 = add i64 %pgocount42, 1
  store i64 %274, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 36)
  call void @setExit(i32 1)
  br label %308

; <label>:275:                                    ; preds = %257
  %pgocount43 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 30)
  %276 = add i64 %pgocount43, 1
  store i64 %276, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 30)
  br label %279

; <label>:277:                                    ; preds = %181
  %pgocount44 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 41)
  %278 = add i64 %pgocount44, 1
  store i64 %278, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 41)
  call void @panic(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.69, i32 0, i32 0)) #11
  unreachable

; <label>:279:                                    ; preds = %275, %235, %199
  %280 = load i32, i32* @verbosity, align 4
  %281 = icmp sge i32 %280, 1
  br i1 %281, label %282, label %288

; <label>:282:                                    ; preds = %279
  %pgocount45 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 25)
  %283 = add i64 %pgocount45, 1
  store i64 %283, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 25)
  %284 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %285 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %284, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.70, i32 0, i32 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  call void @pad(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  %286 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %287 = call i32 @fflush(%struct._IO_FILE* %286)
  br label %288

; <label>:288:                                    ; preds = %282, %279
  %289 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  store %struct._IO_FILE* %289, %struct._IO_FILE** @outputHandleJustInCase, align 8
  store i8 1, i8* @deleteOutputOnInterrupt, align 1
  %290 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %291 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  call void @compressStream(%struct._IO_FILE* %290, %struct._IO_FILE* %291)
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %292 = load i32, i32* @srcMode, align 4
  %293 = icmp eq i32 %292, 3
  br i1 %293, label %294, label %307

; <label>:294:                                    ; preds = %288
  call void @applySavedTimeInfoToOutputFile(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0))
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %295 = load i8, i8* @keepInputFiles, align 1
  %296 = icmp ne i8 %295, 0
  br i1 %296, label %305, label %297

; <label>:297:                                    ; preds = %294
  %298 = call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0)) #8
  store i32 %298, i32* %8, align 4
  %299 = load i32, i32* %8, align 4
  %300 = icmp ne i32 %299, 0
  br i1 %300, label %301, label %303

; <label>:301:                                    ; preds = %297
  %pgocount46 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 42)
  %302 = add i64 %pgocount46, 1
  store i64 %302, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 42)
  call void @ioError() #11
  unreachable

; <label>:303:                                    ; preds = %297
  %pgocount47 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 37)
  %304 = add i64 %pgocount47, 1
  store i64 %304, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 37)
  br label %305

; <label>:305:                                    ; preds = %303, %294
  %pgocount48 = load i64, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 26)
  %306 = add i64 %pgocount48, 1
  store i64 %306, i64* getelementptr inbounds ([44 x i64], [44 x i64]* @__profc_tmp1.ll_compress, i64 0, i64 26)
  br label %307

; <label>:307:                                    ; preds = %305, %288
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  br label %308

; <label>:308:                                    ; preds = %307, %273, %255, %227, %222, %190, %165, %148, %132, %105, %86, %55, %46
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @uncompress(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca %struct.stat, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %12 = load i8*, i8** %2, align 8
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 2)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 2)
  %16 = load i32, i32* @srcMode, align 4
  %17 = icmp ne i32 %16, 1
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 45)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 45)
  call void @panic(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.79, i32 0, i32 0)) #11
  unreachable

; <label>:20:                                     ; preds = %14, %1
  store i8 0, i8* %8, align 1
  %21 = load i32, i32* @srcMode, align 4
  switch i32 %21, label %54 [
    i32 1, label %22
    i32 3, label %24
    i32 2, label %51
  ]

; <label>:22:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 6)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 6)
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.54, i32 0, i32 0))
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.55, i32 0, i32 0))
  br label %54

; <label>:24:                                     ; preds = %20
  %25 = load i8*, i8** %2, align 8
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %25)
  %26 = load i8*, i8** %2, align 8
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* %26)
  store i32 0, i32* %6, align 4
  br label %27

; <label>:27:                                     ; preds = %44, %24
  %28 = load i32, i32* %6, align 4
  %29 = icmp slt i32 %28, 4
  br i1 %29, label %30, label %48

; <label>:30:                                     ; preds = %27
  %31 = load i32, i32* %6, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [4 x i8*], [4 x i8*]* @zSuffix, i64 0, i64 %32
  %34 = load i8*, i8** %33, align 8
  %35 = load i32, i32* %6, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [4 x i8*], [4 x i8*]* @unzSuffix, i64 0, i64 %36
  %38 = load i8*, i8** %37, align 8
  %39 = call zeroext i8 @mapSuffix(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* %34, i8* %38)
  %40 = icmp ne i8 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 17)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 17)
  br label %55

; <label>:43:                                     ; preds = %30
  br label %44

; <label>:44:                                     ; preds = %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 0)
  %45 = add i64 %pgocount4, 1
  store i64 %45, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 0)
  %46 = load i32, i32* %6, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %6, align 4
  br label %27

; <label>:48:                                     ; preds = %27
  %pgocount5 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 16)
  %49 = add i64 %pgocount5, 1
  store i64 %49, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 16)
  store i8 1, i8* %8, align 1
  %50 = call i8* @strcat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.80, i32 0, i32 0)) #8
  br label %54

; <label>:51:                                     ; preds = %20
  %pgocount6 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 7)
  %52 = add i64 %pgocount6, 1
  store i64 %52, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 7)
  %53 = load i8*, i8** %2, align 8
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %53)
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.55, i32 0, i32 0))
  br label %54

; <label>:54:                                     ; preds = %51, %48, %22, %20
  br label %55

; <label>:55:                                     ; preds = %54, %41
  %56 = load i32, i32* @srcMode, align 4
  %57 = icmp ne i32 %56, 1
  br i1 %57, label %58, label %73

; <label>:58:                                     ; preds = %55
  %59 = call zeroext i8 @containsDubiousChars(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  %60 = zext i8 %59 to i32
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %63, label %._crit_edge

._crit_edge:                                      ; preds = %58
  %pgocount7 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 1)
  %62 = add i64 %pgocount7, 1
  store i64 %62, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 1)
  br label %73

; <label>:63:                                     ; preds = %58
  %64 = load i8, i8* @noisy, align 1
  %65 = icmp ne i8 %64, 0
  br i1 %65, label %66, label %71

; <label>:66:                                     ; preds = %63
  %pgocount8 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 10)
  %67 = add i64 %pgocount8, 1
  store i64 %67, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 10)
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %69 = load i8*, i8** @progName, align 8
  %70 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.56, i32 0, i32 0), i8* %69, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  br label %71

; <label>:71:                                     ; preds = %66, %63
  %pgocount9 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 4)
  %72 = add i64 %pgocount9, 1
  store i64 %72, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 4)
  call void @setExit(i32 1)
  br label %344

; <label>:73:                                     ; preds = %._crit_edge, %55
  %74 = load i32, i32* @srcMode, align 4
  %75 = icmp ne i32 %74, 1
  br i1 %75, label %76, label %88

; <label>:76:                                     ; preds = %73
  %pgocount10 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 3)
  %77 = add i64 %pgocount10, 1
  store i64 %77, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 3)
  %78 = call zeroext i8 @fileExists(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  %79 = icmp ne i8 %78, 0
  br i1 %79, label %88, label %80

; <label>:80:                                     ; preds = %76
  %pgocount11 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 15)
  %81 = add i64 %pgocount11, 1
  store i64 %81, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 15)
  %82 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %83 = load i8*, i8** @progName, align 8
  %84 = call i32* @__errno_location() #12
  %85 = load i32, i32* %84, align 4
  %86 = call i8* @strerror(i32 %85) #8
  %87 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %82, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.57, i32 0, i32 0), i8* %83, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %86)
  call void @setExit(i32 1)
  br label %344

; <label>:88:                                     ; preds = %76, %73
  %89 = load i32, i32* @srcMode, align 4
  %90 = icmp eq i32 %89, 3
  br i1 %90, label %95, label %91

; <label>:91:                                     ; preds = %88
  %pgocount12 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 5)
  %92 = add i64 %pgocount12, 1
  store i64 %92, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 5)
  %93 = load i32, i32* @srcMode, align 4
  %94 = icmp eq i32 %93, 2
  br i1 %94, label %95, label %108

; <label>:95:                                     ; preds = %91, %88
  %96 = call i32 @stat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), %struct.stat* %9) #8
  %97 = getelementptr inbounds %struct.stat, %struct.stat* %9, i32 0, i32 3
  %98 = load i32, i32* %97, align 8
  %99 = and i32 %98, 61440
  %100 = icmp eq i32 %99, 16384
  br i1 %100, label %101, label %106

; <label>:101:                                    ; preds = %95
  %pgocount13 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 8)
  %102 = add i64 %pgocount13, 1
  store i64 %102, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 8)
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %104 = load i8*, i8** @progName, align 8
  %105 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %103, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.59, i32 0, i32 0), i8* %104, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  call void @setExit(i32 1)
  br label %344

; <label>:106:                                    ; preds = %95
  %pgocount14 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 9)
  %107 = add i64 %pgocount14, 1
  store i64 %107, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 9)
  br label %108

; <label>:108:                                    ; preds = %106, %91
  %109 = load i32, i32* @srcMode, align 4
  %110 = icmp eq i32 %109, 3
  br i1 %110, label %111, label %130

; <label>:111:                                    ; preds = %108
  %pgocount15 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 12)
  %112 = add i64 %pgocount15, 1
  store i64 %112, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 12)
  %113 = load i8, i8* @forceOverwrite, align 1
  %114 = icmp ne i8 %113, 0
  br i1 %114, label %130, label %115

; <label>:115:                                    ; preds = %111
  %pgocount16 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 20)
  %116 = add i64 %pgocount16, 1
  store i64 %116, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 20)
  %117 = call zeroext i8 @notAStandardFile(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  %118 = zext i8 %117 to i32
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %130

; <label>:120:                                    ; preds = %115
  %121 = load i8, i8* @noisy, align 1
  %122 = icmp ne i8 %121, 0
  br i1 %122, label %123, label %128

; <label>:123:                                    ; preds = %120
  %pgocount17 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 36)
  %124 = add i64 %pgocount17, 1
  store i64 %124, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 36)
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %126 = load i8*, i8** @progName, align 8
  %127 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %125, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.60, i32 0, i32 0), i8* %126, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  br label %128

; <label>:128:                                    ; preds = %123, %120
  %pgocount18 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 27)
  %129 = add i64 %pgocount18, 1
  store i64 %129, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 27)
  call void @setExit(i32 1)
  br label %344

; <label>:130:                                    ; preds = %115, %111, %108
  %131 = load i8, i8* %8, align 1
  %132 = icmp ne i8 %131, 0
  br i1 %132, label %133, label %143

; <label>:133:                                    ; preds = %130
  %134 = load i8, i8* @noisy, align 1
  %135 = icmp ne i8 %134, 0
  br i1 %135, label %136, label %141

; <label>:136:                                    ; preds = %133
  %pgocount19 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 18)
  %137 = add i64 %pgocount19, 1
  store i64 %137, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 18)
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %139 = load i8*, i8** @progName, align 8
  %140 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %138, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.81, i32 0, i32 0), i8* %139, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0))
  br label %141

; <label>:141:                                    ; preds = %136, %133
  %pgocount20 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 11)
  %142 = add i64 %pgocount20, 1
  store i64 %142, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 11)
  br label %143

; <label>:143:                                    ; preds = %141, %130
  %144 = load i32, i32* @srcMode, align 4
  %145 = icmp eq i32 %144, 3
  br i1 %145, label %146, label %163

; <label>:146:                                    ; preds = %143
  %pgocount21 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 13)
  %147 = add i64 %pgocount21, 1
  store i64 %147, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 13)
  %148 = call zeroext i8 @fileExists(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0))
  %149 = zext i8 %148 to i32
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %151, label %163

; <label>:151:                                    ; preds = %146
  %152 = load i8, i8* @forceOverwrite, align 1
  %153 = icmp ne i8 %152, 0
  br i1 %153, label %154, label %156

; <label>:154:                                    ; preds = %151
  %155 = call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0)) #8
  br label %161

; <label>:156:                                    ; preds = %151
  %pgocount22 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 28)
  %157 = add i64 %pgocount22, 1
  store i64 %157, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 28)
  %158 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %159 = load i8*, i8** @progName, align 8
  %160 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %158, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.61, i32 0, i32 0), i8* %159, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0))
  call void @setExit(i32 1)
  br label %344

; <label>:161:                                    ; preds = %154
  %pgocount23 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 21)
  %162 = add i64 %pgocount23, 1
  store i64 %162, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 21)
  br label %163

; <label>:163:                                    ; preds = %161, %146, %143
  %164 = load i32, i32* @srcMode, align 4
  %165 = icmp eq i32 %164, 3
  br i1 %165, label %166, label %185

; <label>:166:                                    ; preds = %163
  %pgocount24 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 14)
  %167 = add i64 %pgocount24, 1
  store i64 %167, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 14)
  %168 = load i8, i8* @forceOverwrite, align 1
  %169 = icmp ne i8 %168, 0
  br i1 %169, label %185, label %170

; <label>:170:                                    ; preds = %166
  %pgocount25 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 23)
  %171 = add i64 %pgocount25, 1
  store i64 %171, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 23)
  %172 = call i32 @countHardLinks(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  store i32 %172, i32* %5, align 4
  %173 = icmp sgt i32 %172, 0
  br i1 %173, label %174, label %185

; <label>:174:                                    ; preds = %170
  %pgocount26 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 31)
  %175 = add i64 %pgocount26, 1
  store i64 %175, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 31)
  %176 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %177 = load i8*, i8** @progName, align 8
  %178 = load i32, i32* %5, align 4
  %179 = load i32, i32* %5, align 4
  %180 = icmp sgt i32 %179, 1
  %181 = zext i1 %180 to i64
  %pgocount27 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 49)
  %182 = add i64 %pgocount27, %181
  store i64 %182, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 49)
  %183 = select i1 %180, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.63, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0)
  %184 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %176, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.62, i32 0, i32 0), i8* %177, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i32 %178, i8* %183)
  call void @setExit(i32 1)
  br label %344

; <label>:185:                                    ; preds = %170, %166, %163
  %186 = load i32, i32* @srcMode, align 4
  %187 = icmp eq i32 %186, 3
  br i1 %187, label %188, label %190

; <label>:188:                                    ; preds = %185
  %pgocount28 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 19)
  %189 = add i64 %pgocount28, 1
  store i64 %189, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 19)
  call void @saveInputFileMetaInfo(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  br label %190

; <label>:190:                                    ; preds = %188, %185
  %191 = load i32, i32* @srcMode, align 4
  switch i32 %191, label %272 [
    i32 1, label %192
    i32 2, label %210
    i32 3, label %232
  ]

; <label>:192:                                    ; preds = %190
  %193 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %193, %struct._IO_FILE** %3, align 8
  %194 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %194, %struct._IO_FILE** %4, align 8
  %195 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %196 = call i32 @fileno(%struct._IO_FILE* %195) #8
  %197 = call i32 @isatty(i32 %196) #8
  %198 = icmp ne i32 %197, 0
  br i1 %198, label %199, label %208

; <label>:199:                                    ; preds = %192
  %pgocount29 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 24)
  %200 = add i64 %pgocount29, 1
  store i64 %200, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 24)
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %202 = load i8*, i8** @progName, align 8
  %203 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %201, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.82, i32 0, i32 0), i8* %202)
  %204 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %205 = load i8*, i8** @progName, align 8
  %206 = load i8*, i8** @progName, align 8
  %207 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %204, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.65, i32 0, i32 0), i8* %205, i8* %206)
  call void @setExit(i32 1)
  br label %344

; <label>:208:                                    ; preds = %192
  %pgocount30 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 33)
  %209 = add i64 %pgocount30, 1
  store i64 %209, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 33)
  br label %274

; <label>:210:                                    ; preds = %190
  %211 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0))
  store %struct._IO_FILE* %211, %struct._IO_FILE** %3, align 8
  %212 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %212, %struct._IO_FILE** %4, align 8
  %213 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %214 = icmp eq %struct._IO_FILE* %213, null
  br i1 %214, label %215, label %230

; <label>:215:                                    ; preds = %210
  %216 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %217 = load i8*, i8** @progName, align 8
  %218 = call i32* @__errno_location() #12
  %219 = load i32, i32* %218, align 4
  %220 = call i8* @strerror(i32 %219) #8
  %221 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %216, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.83, i32 0, i32 0), i8* %217, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %220)
  %222 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %223 = icmp ne %struct._IO_FILE* %222, null
  br i1 %223, label %224, label %228

; <label>:224:                                    ; preds = %215
  %pgocount31 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 40)
  %225 = add i64 %pgocount31, 1
  store i64 %225, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 40)
  %226 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %227 = call i32 @fclose(%struct._IO_FILE* %226)
  br label %228

; <label>:228:                                    ; preds = %224, %215
  %pgocount32 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 34)
  %229 = add i64 %pgocount32, 1
  store i64 %229, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 34)
  call void @setExit(i32 1)
  br label %344

; <label>:230:                                    ; preds = %210
  %pgocount33 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 25)
  %231 = add i64 %pgocount33, 1
  store i64 %231, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 25)
  br label %274

; <label>:232:                                    ; preds = %190
  %233 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0))
  store %struct._IO_FILE* %233, %struct._IO_FILE** %3, align 8
  %234 = call %struct._IO_FILE* @fopen_output_safely(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.67, i32 0, i32 0))
  store %struct._IO_FILE* %234, %struct._IO_FILE** %4, align 8
  %235 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %236 = icmp eq %struct._IO_FILE* %235, null
  br i1 %236, label %237, label %252

; <label>:237:                                    ; preds = %232
  %238 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %239 = load i8*, i8** @progName, align 8
  %240 = call i32* @__errno_location() #12
  %241 = load i32, i32* %240, align 4
  %242 = call i8* @strerror(i32 %241) #8
  %243 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %238, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.68, i32 0, i32 0), i8* %239, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* %242)
  %244 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %245 = icmp ne %struct._IO_FILE* %244, null
  br i1 %245, label %246, label %250

; <label>:246:                                    ; preds = %237
  %pgocount34 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 41)
  %247 = add i64 %pgocount34, 1
  store i64 %247, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 41)
  %248 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %249 = call i32 @fclose(%struct._IO_FILE* %248)
  br label %250

; <label>:250:                                    ; preds = %246, %237
  %pgocount35 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 35)
  %251 = add i64 %pgocount35, 1
  store i64 %251, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 35)
  call void @setExit(i32 1)
  br label %344

; <label>:252:                                    ; preds = %232
  %253 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %254 = icmp eq %struct._IO_FILE* %253, null
  br i1 %254, label %255, label %270

; <label>:255:                                    ; preds = %252
  %256 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %257 = load i8*, i8** @progName, align 8
  %258 = call i32* @__errno_location() #12
  %259 = load i32, i32* %258, align 4
  %260 = call i8* @strerror(i32 %259) #8
  %261 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %256, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.57, i32 0, i32 0), i8* %257, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %260)
  %262 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %263 = icmp ne %struct._IO_FILE* %262, null
  br i1 %263, label %264, label %268

; <label>:264:                                    ; preds = %255
  %pgocount36 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 44)
  %265 = add i64 %pgocount36, 1
  store i64 %265, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 44)
  %266 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %267 = call i32 @fclose(%struct._IO_FILE* %266)
  br label %268

; <label>:268:                                    ; preds = %264, %255
  %pgocount37 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 42)
  %269 = add i64 %pgocount37, 1
  store i64 %269, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 42)
  call void @setExit(i32 1)
  br label %344

; <label>:270:                                    ; preds = %252
  %pgocount38 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 32)
  %271 = add i64 %pgocount38, 1
  store i64 %271, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 32)
  br label %274

; <label>:272:                                    ; preds = %190
  %pgocount39 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 46)
  %273 = add i64 %pgocount39, 1
  store i64 %273, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 46)
  call void @panic(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.84, i32 0, i32 0)) #11
  unreachable

; <label>:274:                                    ; preds = %270, %230, %208
  %275 = load i32, i32* @verbosity, align 4
  %276 = icmp sge i32 %275, 1
  br i1 %276, label %277, label %283

; <label>:277:                                    ; preds = %274
  %pgocount40 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 22)
  %278 = add i64 %pgocount40, 1
  store i64 %278, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 22)
  %279 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %280 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %279, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.70, i32 0, i32 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  call void @pad(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  %281 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %282 = call i32 @fflush(%struct._IO_FILE* %281)
  br label %283

; <label>:283:                                    ; preds = %277, %274
  %284 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  store %struct._IO_FILE* %284, %struct._IO_FILE** @outputHandleJustInCase, align 8
  store i8 1, i8* @deleteOutputOnInterrupt, align 1
  %285 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %286 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %287 = call zeroext i8 @uncompressStream(%struct._IO_FILE* %285, %struct._IO_FILE* %286)
  store i8 %287, i8* %7, align 1
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %288 = load i8, i8* %7, align 1
  %289 = icmp ne i8 %288, 0
  br i1 %289, label %290, label %307

; <label>:290:                                    ; preds = %283
  %291 = load i32, i32* @srcMode, align 4
  %292 = icmp eq i32 %291, 3
  br i1 %292, label %293, label %306

; <label>:293:                                    ; preds = %290
  call void @applySavedTimeInfoToOutputFile(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0))
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %294 = load i8, i8* @keepInputFiles, align 1
  %295 = icmp ne i8 %294, 0
  br i1 %295, label %304, label %296

; <label>:296:                                    ; preds = %293
  %297 = call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0)) #8
  store i32 %297, i32* %10, align 4
  %298 = load i32, i32* %10, align 4
  %299 = icmp ne i32 %298, 0
  br i1 %299, label %300, label %302

; <label>:300:                                    ; preds = %296
  %pgocount41 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 48)
  %301 = add i64 %pgocount41, 1
  store i64 %301, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 48)
  call void @ioError() #11
  unreachable

; <label>:302:                                    ; preds = %296
  %pgocount42 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 43)
  %303 = add i64 %pgocount42, 1
  store i64 %303, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 43)
  br label %304

; <label>:304:                                    ; preds = %302, %293
  %pgocount43 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 30)
  %305 = add i64 %pgocount43, 1
  store i64 %305, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 30)
  br label %306

; <label>:306:                                    ; preds = %304, %290
  br label %320

; <label>:307:                                    ; preds = %283
  store i8 1, i8* @unzFailsExist, align 1
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %308 = load i32, i32* @srcMode, align 4
  %309 = icmp eq i32 %308, 3
  br i1 %309, label %310, label %318

; <label>:310:                                    ; preds = %307
  %311 = call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0)) #8
  store i32 %311, i32* %11, align 4
  %312 = load i32, i32* %11, align 4
  %313 = icmp ne i32 %312, 0
  br i1 %313, label %314, label %316

; <label>:314:                                    ; preds = %310
  %pgocount44 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 47)
  %315 = add i64 %pgocount44, 1
  store i64 %315, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 47)
  call void @ioError() #11
  unreachable

; <label>:316:                                    ; preds = %310
  %pgocount45 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 39)
  %317 = add i64 %pgocount45, 1
  store i64 %317, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 39)
  br label %318

; <label>:318:                                    ; preds = %316, %307
  %pgocount46 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 26)
  %319 = add i64 %pgocount46, 1
  store i64 %319, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 26)
  br label %320

; <label>:320:                                    ; preds = %318, %306
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %321 = load i8, i8* %7, align 1
  %322 = icmp ne i8 %321, 0
  br i1 %322, label %323, label %331

; <label>:323:                                    ; preds = %320
  %324 = load i32, i32* @verbosity, align 4
  %325 = icmp sge i32 %324, 1
  br i1 %325, label %326, label %330

; <label>:326:                                    ; preds = %323
  %pgocount47 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 29)
  %327 = add i64 %pgocount47, 1
  store i64 %327, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 29)
  %328 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %329 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %328, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.85, i32 0, i32 0))
  br label %330

; <label>:330:                                    ; preds = %326, %323
  br label %344

; <label>:331:                                    ; preds = %320
  call void @setExit(i32 2)
  %332 = load i32, i32* @verbosity, align 4
  %333 = icmp sge i32 %332, 1
  br i1 %333, label %334, label %338

; <label>:334:                                    ; preds = %331
  %pgocount48 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 37)
  %335 = add i64 %pgocount48, 1
  store i64 %335, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 37)
  %336 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %337 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %336, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.86, i32 0, i32 0))
  br label %343

; <label>:338:                                    ; preds = %331
  %pgocount49 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 38)
  %339 = add i64 %pgocount49, 1
  store i64 %339, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_tmp1.ll_uncompress, i64 0, i64 38)
  %340 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %341 = load i8*, i8** @progName, align 8
  %342 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %340, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.87, i32 0, i32 0), i8* %341, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  br label %343

; <label>:343:                                    ; preds = %338, %334
  br label %344

; <label>:344:                                    ; preds = %343, %330, %268, %250, %228, %199, %174, %156, %128, %101, %80, %71
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @setExit(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = load i32, i32* @exitValue, align 4
  %5 = icmp sgt i32 %3, %4
  br i1 %5, label %6, label %9

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_setExit, i64 0, i64 1)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_setExit, i64 0, i64 1)
  %8 = load i32, i32* %2, align 4
  store i32 %8, i32* @exitValue, align 4
  br label %9

; <label>:9:                                      ; preds = %6, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_setExit, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_setExit, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @testf(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8, align 1
  %5 = alloca %struct.stat, align 8
  store i8* %0, i8** %2, align 8
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %6 = load i8*, i8** %2, align 8
  %7 = icmp eq i8* %6, null
  br i1 %7, label %8, label %14

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 2)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 2)
  %10 = load i32, i32* @srcMode, align 4
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 21)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 21)
  call void @panic(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.94, i32 0, i32 0)) #11
  unreachable

; <label>:14:                                     ; preds = %8, %1
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0))
  %15 = load i32, i32* @srcMode, align 4
  switch i32 %15, label %24 [
    i32 1, label %16
    i32 3, label %18
    i32 2, label %21
  ]

; <label>:16:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 5)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 5)
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.54, i32 0, i32 0))
  br label %24

; <label>:18:                                     ; preds = %14
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 6)
  %19 = add i64 %pgocount3, 1
  store i64 %19, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 6)
  %20 = load i8*, i8** %2, align 8
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %20)
  br label %24

; <label>:21:                                     ; preds = %14
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 7)
  %22 = add i64 %pgocount4, 1
  store i64 %22, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 7)
  %23 = load i8*, i8** %2, align 8
  call void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %23)
  br label %24

; <label>:24:                                     ; preds = %21, %18, %16, %14
  %25 = load i32, i32* @srcMode, align 4
  %26 = icmp ne i32 %25, 1
  br i1 %26, label %27, label %42

; <label>:27:                                     ; preds = %24
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 1)
  %28 = add i64 %pgocount5, 1
  store i64 %28, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 1)
  %29 = call zeroext i8 @containsDubiousChars(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  %30 = zext i8 %29 to i32
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %42

; <label>:32:                                     ; preds = %27
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 4)
  %33 = add i64 %pgocount6, 1
  store i64 %33, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 4)
  %34 = load i8, i8* @noisy, align 1
  %35 = icmp ne i8 %34, 0
  br i1 %35, label %36, label %41

; <label>:36:                                     ; preds = %32
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 8)
  %37 = add i64 %pgocount7, 1
  store i64 %37, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 8)
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = load i8*, i8** @progName, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.56, i32 0, i32 0), i8* %39, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  br label %41

; <label>:41:                                     ; preds = %36, %32
  call void @setExit(i32 1)
  br label %137

; <label>:42:                                     ; preds = %27, %24
  %43 = load i32, i32* @srcMode, align 4
  %44 = icmp ne i32 %43, 1
  br i1 %44, label %45, label %57

; <label>:45:                                     ; preds = %42
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 3)
  %46 = add i64 %pgocount8, 1
  store i64 %46, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 3)
  %47 = call zeroext i8 @fileExists(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  %48 = icmp ne i8 %47, 0
  br i1 %48, label %57, label %49

; <label>:49:                                     ; preds = %45
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 13)
  %50 = add i64 %pgocount9, 1
  store i64 %50, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 13)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = load i8*, i8** @progName, align 8
  %53 = call i32* @__errno_location() #12
  %54 = load i32, i32* %53, align 4
  %55 = call i8* @strerror(i32 %54) #8
  %56 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.95, i32 0, i32 0), i8* %52, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %55)
  call void @setExit(i32 1)
  br label %137

; <label>:57:                                     ; preds = %45, %42
  %58 = load i32, i32* @srcMode, align 4
  %59 = icmp ne i32 %58, 1
  br i1 %59, label %60, label %73

; <label>:60:                                     ; preds = %57
  %61 = call i32 @stat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), %struct.stat* %5) #8
  %62 = getelementptr inbounds %struct.stat, %struct.stat* %5, i32 0, i32 3
  %63 = load i32, i32* %62, align 8
  %64 = and i32 %63, 61440
  %65 = icmp eq i32 %64, 16384
  br i1 %65, label %66, label %71

; <label>:66:                                     ; preds = %60
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 11)
  %67 = add i64 %pgocount10, 1
  store i64 %67, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 11)
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %69 = load i8*, i8** @progName, align 8
  %70 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.59, i32 0, i32 0), i8* %69, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  call void @setExit(i32 1)
  br label %137

; <label>:71:                                     ; preds = %60
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 12)
  %72 = add i64 %pgocount11, 1
  store i64 %72, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 12)
  br label %73

; <label>:73:                                     ; preds = %71, %57
  %74 = load i32, i32* @srcMode, align 4
  switch i32 %74, label %107 [
    i32 1, label %76
    i32 2, label %._crit_edge
    i32 3, label %93
  ]

._crit_edge:                                      ; preds = %73
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 0)
  %75 = add i64 %pgocount12, 1
  store i64 %75, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 0)
  br label %93

; <label>:76:                                     ; preds = %73
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %78 = call i32 @fileno(%struct._IO_FILE* %77) #8
  %79 = call i32 @isatty(i32 %78) #8
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %90

; <label>:81:                                     ; preds = %76
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 16)
  %82 = add i64 %pgocount13, 1
  store i64 %82, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 16)
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %84 = load i8*, i8** @progName, align 8
  %85 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %83, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.82, i32 0, i32 0), i8* %84)
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %87 = load i8*, i8** @progName, align 8
  %88 = load i8*, i8** @progName, align 8
  %89 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %86, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.65, i32 0, i32 0), i8* %87, i8* %88)
  call void @setExit(i32 1)
  br label %137

; <label>:90:                                     ; preds = %76
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 19)
  %91 = add i64 %pgocount14, 1
  store i64 %91, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 19)
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %92, %struct._IO_FILE** %3, align 8
  br label %109

; <label>:93:                                     ; preds = %._crit_edge, %73
  %94 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0))
  store %struct._IO_FILE* %94, %struct._IO_FILE** %3, align 8
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %96 = icmp eq %struct._IO_FILE* %95, null
  br i1 %96, label %97, label %105

; <label>:97:                                     ; preds = %93
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 15)
  %98 = add i64 %pgocount15, 1
  store i64 %98, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 15)
  %99 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %100 = load i8*, i8** @progName, align 8
  %101 = call i32* @__errno_location() #12
  %102 = load i32, i32* %101, align 4
  %103 = call i8* @strerror(i32 %102) #8
  %104 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %99, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.83, i32 0, i32 0), i8* %100, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* %103)
  call void @setExit(i32 1)
  br label %137

; <label>:105:                                    ; preds = %93
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 9)
  %106 = add i64 %pgocount16, 1
  store i64 %106, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 9)
  br label %109

; <label>:107:                                    ; preds = %73
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 20)
  %108 = add i64 %pgocount17, 1
  store i64 %108, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 20)
  call void @panic(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.96, i32 0, i32 0)) #11
  unreachable

; <label>:109:                                    ; preds = %105, %90
  %110 = load i32, i32* @verbosity, align 4
  %111 = icmp sge i32 %110, 1
  br i1 %111, label %112, label %118

; <label>:112:                                    ; preds = %109
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 14)
  %113 = add i64 %pgocount18, 1
  store i64 %113, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 14)
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %115 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %114, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.70, i32 0, i32 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  call void @pad(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  %116 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %117 = call i32 @fflush(%struct._IO_FILE* %116)
  br label %118

; <label>:118:                                    ; preds = %112, %109
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %120 = call zeroext i8 @testStream(%struct._IO_FILE* %119)
  store i8 %120, i8* %4, align 1
  %121 = load i8, i8* %4, align 1
  %122 = zext i8 %121 to i32
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %132

; <label>:124:                                    ; preds = %118
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 10)
  %125 = add i64 %pgocount19, 1
  store i64 %125, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 10)
  %126 = load i32, i32* @verbosity, align 4
  %127 = icmp sge i32 %126, 1
  br i1 %127, label %128, label %132

; <label>:128:                                    ; preds = %124
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 18)
  %129 = add i64 %pgocount20, 1
  store i64 %129, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 18)
  %130 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %131 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %130, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.97, i32 0, i32 0))
  br label %132

; <label>:132:                                    ; preds = %128, %124, %118
  %133 = load i8, i8* %4, align 1
  %134 = icmp ne i8 %133, 0
  br i1 %134, label %137, label %135

; <label>:135:                                    ; preds = %132
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 17)
  %136 = add i64 %pgocount21, 1
  store i64 %136, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_testf, i64 0, i64 17)
  store i8 1, i8* @testFailsExist, align 1
  br label %137

; <label>:137:                                    ; preds = %135, %132, %97, %81, %66, %49, %41
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @showFileNames() #0 {
  %1 = load i8, i8* @noisy, align 1
  %2 = icmp ne i8 %1, 0
  br i1 %2, label %3, label %7

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_showFileNames, i64 0, i64 1)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_showFileNames, i64 0, i64 1)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0))
  br label %7

; <label>:7:                                      ; preds = %3, %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_showFileNames, i64 0, i64 0)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_showFileNames, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal void @cleanUpAndFail(i32) #5 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.stat, align 8
  store i32 %0, i32* %2, align 4
  %5 = load i32, i32* @srcMode, align 4
  %6 = icmp eq i32 %5, 3
  br i1 %6, label %7, label %61

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 1)
  %9 = load i32, i32* @opMode, align 4
  %10 = icmp ne i32 %9, 3
  br i1 %10, label %11, label %61

; <label>:11:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 3)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 3)
  %13 = load i8, i8* @deleteOutputOnInterrupt, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %61

; <label>:16:                                     ; preds = %11
  %17 = call i32 @stat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0), %struct.stat* %4) #8
  store i32 %17, i32* %3, align 4
  %18 = load i32, i32* %3, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %46

; <label>:20:                                     ; preds = %16
  %21 = load i8, i8* @noisy, align 1
  %22 = icmp ne i8 %21, 0
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 8)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 8)
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = load i8*, i8** @progName, align 8
  %27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.39, i32 0, i32 0), i8* %26, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0))
  br label %28

; <label>:28:                                     ; preds = %23, %20
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %30 = icmp ne %struct._IO_FILE* %29, null
  br i1 %30, label %31, label %35

; <label>:31:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 9)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 9)
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %34 = call i32 @fclose(%struct._IO_FILE* %33)
  br label %35

; <label>:35:                                     ; preds = %31, %28
  %36 = call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0)) #8
  store i32 %36, i32* %3, align 4
  %37 = load i32, i32* %3, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %44

; <label>:39:                                     ; preds = %35
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 10)
  %40 = add i64 %pgocount4, 1
  store i64 %40, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 10)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = load i8*, i8** @progName, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.40, i32 0, i32 0), i8* %42)
  br label %44

; <label>:44:                                     ; preds = %39, %35
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 6)
  %45 = add i64 %pgocount5, 1
  store i64 %45, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 6)
  br label %60

; <label>:46:                                     ; preds = %16
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 7)
  %47 = add i64 %pgocount6, 1
  store i64 %47, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 7)
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = load i8*, i8** @progName, align 8
  %50 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.41, i32 0, i32 0), i8* %49)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = load i8*, i8** @progName, align 8
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.42, i32 0, i32 0), i8* %52)
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = load i8*, i8** @progName, align 8
  %56 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.43, i32 0, i32 0), i8* %55, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i32 0, i32 0))
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = load i8*, i8** @progName, align 8
  %59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.44, i32 0, i32 0), i8* %58)
  br label %60

; <label>:60:                                     ; preds = %46, %44
  br label %61

; <label>:61:                                     ; preds = %60, %11, %7, %1
  %62 = load i8, i8* @noisy, align 1
  %63 = zext i8 %62 to i32
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %84

; <label>:65:                                     ; preds = %61
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 2)
  %66 = add i64 %pgocount7, 1
  store i64 %66, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 2)
  %67 = load i32, i32* @numFileNames, align 4
  %68 = icmp sgt i32 %67, 0
  br i1 %68, label %69, label %84

; <label>:69:                                     ; preds = %65
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 4)
  %70 = add i64 %pgocount8, 1
  store i64 %70, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 4)
  %71 = load i32, i32* @numFilesProcessed, align 4
  %72 = load i32, i32* @numFileNames, align 4
  %73 = icmp slt i32 %71, %72
  br i1 %73, label %74, label %84

; <label>:74:                                     ; preds = %69
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 5)
  %75 = add i64 %pgocount9, 1
  store i64 %75, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 5)
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %77 = load i8*, i8** @progName, align 8
  %78 = load i8*, i8** @progName, align 8
  %79 = load i32, i32* @numFileNames, align 4
  %80 = load i32, i32* @numFileNames, align 4
  %81 = load i32, i32* @numFilesProcessed, align 4
  %82 = sub nsw i32 %80, %81
  %83 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([110 x i8], [110 x i8]* @.str.45, i32 0, i32 0), i8* %77, i8* %78, i32 %79, i32 %82)
  br label %84

; <label>:84:                                     ; preds = %74, %69, %65, %61
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 0)
  %85 = add i64 %pgocount10, 1
  store i64 %85, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_cleanUpAndFail, i64 0, i64 0)
  %86 = load i32, i32* %2, align 4
  call void @setExit(i32 %86)
  %87 = load i32, i32* @exitValue, align 4
  call void @exit(i32 %87) #10
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @cadvise() #0 {
  %1 = load i8, i8* @noisy, align 1
  %2 = icmp ne i8 %1, 0
  br i1 %2, label %3, label %7

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cadvise, i64 0, i64 1)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cadvise, i64 0, i64 1)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([241 x i8], [241 x i8]* @.str.46, i32 0, i32 0))
  br label %7

; <label>:7:                                      ; preds = %3, %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cadvise, i64 0, i64 0)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cadvise, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind
declare i32 @stat(i8*, %struct.stat*) #1

declare i32 @fclose(%struct._IO_FILE*) #4

; Function Attrs: nounwind
declare i32 @remove(i8*) #1

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #1

; Function Attrs: nounwind
declare i8* @getenv(i8*) #1

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #6

; Function Attrs: noinline nounwind uwtable
define internal %struct.zzzz* @mkCell() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_mkCell, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_mkCell, i64 0, i64 0)
  %2 = alloca %struct.zzzz*, align 8
  %3 = call i8* @myMalloc(i32 16)
  %4 = bitcast i8* %3 to %struct.zzzz*
  store %struct.zzzz* %4, %struct.zzzz** %2, align 8
  %5 = load %struct.zzzz*, %struct.zzzz** %2, align 8
  %6 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %5, i32 0, i32 0
  store i8* null, i8** %6, align 8
  %7 = load %struct.zzzz*, %struct.zzzz** %2, align 8
  %8 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %7, i32 0, i32 1
  store %struct.zzzz* null, %struct.zzzz** %8, align 8
  %9 = load %struct.zzzz*, %struct.zzzz** %2, align 8
  ret %struct.zzzz* %9
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @myMalloc(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  store i32 %0, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = sext i32 %4 to i64
  %6 = call noalias i8* @malloc(i64 %5) #8
  store i8* %6, i8** %3, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = icmp eq i8* %7, null
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myMalloc, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myMalloc, i64 0, i64 1)
  call void @outOfMemory() #11
  unreachable

; <label>:11:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myMalloc, i64 0, i64 0)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myMalloc, i64 0, i64 0)
  %13 = load i8*, i8** %3, align 8
  ret i8* %13
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline noreturn nounwind uwtable
define internal void @outOfMemory() #5 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_outOfMemory, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_outOfMemory, i64 0, i64 0)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = load i8*, i8** @progName, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.48, i32 0, i32 0), i8* %3)
  call void @showFileNames()
  call void @cleanUpAndFail(i32 1) #11
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i8* @BZ2_bzlibVersion() #4

; Function Attrs: noinline noreturn nounwind uwtable
define internal void @panic(i8*) #5 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_panic, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_panic, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = load i8*, i8** @progName, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([109 x i8], [109 x i8]* @.str.71, i32 0, i32 0), i8* %5, i8* %6)
  call void @showFileNames()
  call void @cleanUpAndFail(i32 3) #11
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal zeroext i8 @containsDubiousChars(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_containsDubiousChars, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_containsDubiousChars, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  ret i8 0
}

; Function Attrs: noinline nounwind uwtable
define internal zeroext i8 @fileExists(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8, align 1
  store i8* %0, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = call %struct._IO_FILE* @fopen(i8* %5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0))
  store %struct._IO_FILE* %6, %struct._IO_FILE** %3, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %8 = icmp ne %struct._IO_FILE* %7, null
  %9 = zext i1 %8 to i32
  %10 = trunc i32 %9 to i8
  store i8 %10, i8* %4, align 1
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %12 = icmp ne %struct._IO_FILE* %11, null
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_fileExists, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_fileExists, i64 0, i64 1)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %16 = call i32 @fclose(%struct._IO_FILE* %15)
  br label %17

; <label>:17:                                     ; preds = %13, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_fileExists, i64 0, i64 0)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_fileExists, i64 0, i64 0)
  %19 = load i8, i8* %4, align 1
  ret i8 %19
}

; Function Attrs: nounwind
declare i8* @strerror(i32) #1

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #6

; Function Attrs: noinline nounwind uwtable
define internal zeroext i8 @hasSuffix(i8*, i8*) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %8 = load i8*, i8** %4, align 8
  %9 = call i64 @strlen(i8* %8) #9
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %6, align 4
  %11 = load i8*, i8** %5, align 8
  %12 = call i64 @strlen(i8* %11) #9
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %7, align 4
  %14 = load i32, i32* %6, align 4
  %15 = load i32, i32* %7, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_hasSuffix, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_hasSuffix, i64 0, i64 0)
  store i8 0, i8* %3, align 1
  br label %35

; <label>:19:                                     ; preds = %2
  %20 = load i8*, i8** %4, align 8
  %21 = load i32, i32* %6, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i8, i8* %20, i64 %22
  %24 = load i32, i32* %7, align 4
  %25 = sext i32 %24 to i64
  %26 = sub i64 0, %25
  %27 = getelementptr inbounds i8, i8* %23, i64 %26
  %28 = load i8*, i8** %5, align 8
  %29 = call i32 @strcmp(i8* %27, i8* %28) #9
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_hasSuffix, i64 0, i64 2)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_hasSuffix, i64 0, i64 2)
  store i8 1, i8* %3, align 1
  br label %35

; <label>:33:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_hasSuffix, i64 0, i64 1)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_hasSuffix, i64 0, i64 1)
  store i8 0, i8* %3, align 1
  br label %35

; <label>:35:                                     ; preds = %33, %31, %17
  %36 = load i8, i8* %3, align 1
  ret i8 %36
}

; Function Attrs: noinline nounwind uwtable
define internal zeroext i8 @notAStandardFile(i8*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.stat, align 8
  store i8* %0, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = call i32 @lstat(i8* %6, %struct.stat* %5) #8
  store i32 %7, i32* %4, align 4
  %8 = load i32, i32* %4, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_notAStandardFile, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_notAStandardFile, i64 0, i64 0)
  store i8 1, i8* %2, align 1
  br label %21

; <label>:12:                                     ; preds = %1
  %13 = getelementptr inbounds %struct.stat, %struct.stat* %5, i32 0, i32 3
  %14 = load i32, i32* %13, align 8
  %15 = and i32 %14, 61440
  %16 = icmp eq i32 %15, 32768
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_notAStandardFile, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_notAStandardFile, i64 0, i64 1)
  store i8 0, i8* %2, align 1
  br label %21

; <label>:19:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_notAStandardFile, i64 0, i64 2)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_notAStandardFile, i64 0, i64 2)
  store i8 1, i8* %2, align 1
  br label %21

; <label>:21:                                     ; preds = %19, %17, %10
  %22 = load i8, i8* %2, align 1
  ret i8 %22
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @countHardLinks(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.stat, align 8
  store i8* %0, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = call i32 @lstat(i8* %6, %struct.stat* %5) #8
  store i32 %7, i32* %4, align 4
  %8 = load i32, i32* %4, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_countHardLinks, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_countHardLinks, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %18

; <label>:12:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_countHardLinks, i64 0, i64 1)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_countHardLinks, i64 0, i64 1)
  %14 = getelementptr inbounds %struct.stat, %struct.stat* %5, i32 0, i32 2
  %15 = load i64, i64* %14, align 8
  %16 = sub i64 %15, 1
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %2, align 4
  br label %18

; <label>:18:                                     ; preds = %12, %10
  %19 = load i32, i32* %2, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind uwtable
define internal void @saveInputFileMetaInfo(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i32 @stat(i8* %4, %struct.stat* @fileMetaInfo) #8
  store i32 %5, i32* %3, align 4
  %6 = load i32, i32* %3, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_saveInputFileMetaInfo, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_saveInputFileMetaInfo, i64 0, i64 1)
  call void @ioError() #11
  unreachable

; <label>:10:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_saveInputFileMetaInfo, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_saveInputFileMetaInfo, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind
declare i32 @isatty(i32) #1

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE*) #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal %struct._IO_FILE* @fopen_output_safely(i8*, i8*) #0 {
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %8 = load i8*, i8** %4, align 8
  %9 = call i32 (i8*, i32, ...) @open(i8* %8, i32 193, i32 384)
  store i32 %9, i32* %7, align 4
  %10 = load i32, i32* %7, align 4
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fopen_output_safely, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fopen_output_safely, i64 0, i64 1)
  store %struct._IO_FILE* null, %struct._IO_FILE** %3, align 8
  br label %27

; <label>:14:                                     ; preds = %2
  %15 = load i32, i32* %7, align 4
  %16 = load i8*, i8** %5, align 8
  %17 = call %struct._IO_FILE* @fdopen(i32 %15, i8* %16) #8
  store %struct._IO_FILE* %17, %struct._IO_FILE** %6, align 8
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %19 = icmp eq %struct._IO_FILE* %18, null
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fopen_output_safely, i64 0, i64 2)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fopen_output_safely, i64 0, i64 2)
  %22 = load i32, i32* %7, align 4
  %23 = call i32 @close(i32 %22)
  br label %24

; <label>:24:                                     ; preds = %20, %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fopen_output_safely, i64 0, i64 0)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fopen_output_safely, i64 0, i64 0)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  store %struct._IO_FILE* %26, %struct._IO_FILE** %3, align 8
  br label %27

; <label>:27:                                     ; preds = %24, %12
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  ret %struct._IO_FILE* %28
}

; Function Attrs: noinline nounwind uwtable
define internal void @pad(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i64 @strlen(i8* %4) #9
  %6 = trunc i64 %5 to i32
  %7 = load i32, i32* @longestFileName, align 4
  %8 = icmp sge i32 %6, %7
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pad, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pad, i64 0, i64 1)
  br label %28

; <label>:11:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pad, i64 0, i64 2)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pad, i64 0, i64 2)
  store i32 1, i32* %3, align 4
  br label %13

; <label>:13:                                     ; preds = %24, %11
  %14 = load i32, i32* %3, align 4
  %15 = load i32, i32* @longestFileName, align 4
  %16 = load i8*, i8** %2, align 8
  %17 = call i64 @strlen(i8* %16) #9
  %18 = trunc i64 %17 to i32
  %19 = sub nsw i32 %15, %18
  %20 = icmp sle i32 %14, %19
  br i1 %20, label %21, label %28

; <label>:21:                                     ; preds = %13
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.72, i32 0, i32 0))
  br label %24

; <label>:24:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pad, i64 0, i64 0)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pad, i64 0, i64 0)
  %26 = load i32, i32* %3, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %3, align 4
  br label %13

; <label>:28:                                     ; preds = %13, %9
  ret void
}

declare i32 @fflush(%struct._IO_FILE*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @compressStream(%struct._IO_FILE*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca [5000 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca [32 x i8], align 16
  %17 = alloca [32 x i8], align 16
  %18 = alloca %struct.UInt64, align 1
  %19 = alloca %struct.UInt64, align 1
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  store i8* null, i8** %5, align 8
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %23 = call i32 @ferror(%struct._IO_FILE* %22) #8
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 13)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 13)
  br label %185

; <label>:27:                                     ; preds = %2
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %29 = call i32 @ferror(%struct._IO_FILE* %28) #8
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 14)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 14)
  br label %185

; <label>:33:                                     ; preds = %27
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %35 = load i32, i32* @blockSize100k, align 4
  %36 = load i32, i32* @verbosity, align 4
  %37 = load i32, i32* @workFactor, align 4
  %38 = call i8* @BZ2_bzWriteOpen(i32* %12, %struct._IO_FILE* %34, i32 %35, i32 %36, i32 %37)
  store i8* %38, i8** %5, align 8
  %39 = load i32, i32* %12, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 15)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 15)
  br label %176

; <label>:43:                                     ; preds = %33
  %44 = load i32, i32* @verbosity, align 4
  %45 = icmp sge i32 %44, 2
  br i1 %45, label %46, label %50

; <label>:46:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 4)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 4)
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.73, i32 0, i32 0))
  br label %50

; <label>:50:                                     ; preds = %46, %43
  br label %51

; <label>:51:                                     ; preds = %78, %50
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %53 = call zeroext i8 @myfeof(%struct._IO_FILE* %52)
  %54 = icmp ne i8 %53, 0
  br i1 %54, label %55, label %56

; <label>:55:                                     ; preds = %51
  br label %80

; <label>:56:                                     ; preds = %51
  %57 = getelementptr inbounds [5000 x i8], [5000 x i8]* %6, i32 0, i32 0
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %59 = call i64 @fread(i8* %57, i64 1, i64 5000, %struct._IO_FILE* %58)
  %60 = trunc i64 %59 to i32
  store i32 %60, i32* %7, align 4
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %62 = call i32 @ferror(%struct._IO_FILE* %61) #8
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %56
  %pgocount4 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 8)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 8)
  br label %185

; <label>:66:                                     ; preds = %56
  %67 = load i32, i32* %7, align 4
  %68 = icmp sgt i32 %67, 0
  br i1 %68, label %69, label %74

; <label>:69:                                     ; preds = %66
  %pgocount5 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 1)
  %70 = add i64 %pgocount5, 1
  store i64 %70, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 1)
  %71 = load i8*, i8** %5, align 8
  %72 = getelementptr inbounds [5000 x i8], [5000 x i8]* %6, i32 0, i32 0
  %73 = load i32, i32* %7, align 4
  call void @BZ2_bzWrite(i32* %12, i8* %71, i8* %72, i32 %73)
  br label %74

; <label>:74:                                     ; preds = %69, %66
  %75 = load i32, i32* %12, align 4
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %78

; <label>:77:                                     ; preds = %74
  br label %176

; <label>:78:                                     ; preds = %74
  %pgocount6 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 0)
  %79 = add i64 %pgocount6, 1
  store i64 %79, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 0)
  br label %51

; <label>:80:                                     ; preds = %55
  %81 = load i8*, i8** %5, align 8
  call void @BZ2_bzWriteClose64(i32* %12, i8* %81, i32 0, i32* %8, i32* %9, i32* %10, i32* %11)
  %82 = load i32, i32* %12, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %86

; <label>:84:                                     ; preds = %80
  %pgocount7 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 16)
  %85 = add i64 %pgocount7, 1
  store i64 %85, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 16)
  br label %176

; <label>:86:                                     ; preds = %80
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %88 = call i32 @ferror(%struct._IO_FILE* %87) #8
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %90, label %92

; <label>:90:                                     ; preds = %86
  %pgocount8 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 17)
  %91 = add i64 %pgocount8, 1
  store i64 %91, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 17)
  br label %185

; <label>:92:                                     ; preds = %86
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %94 = call i32 @fflush(%struct._IO_FILE* %93)
  store i32 %94, i32* %14, align 4
  %95 = load i32, i32* %14, align 4
  %96 = icmp eq i32 %95, -1
  br i1 %96, label %97, label %99

; <label>:97:                                     ; preds = %92
  %pgocount9 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 18)
  %98 = add i64 %pgocount9, 1
  store i64 %98, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 18)
  br label %185

; <label>:99:                                     ; preds = %92
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %102 = icmp ne %struct._IO_FILE* %100, %101
  br i1 %102, label %103, label %120

; <label>:103:                                    ; preds = %99
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %105 = call i32 @fileno(%struct._IO_FILE* %104) #8
  store i32 %105, i32* %15, align 4
  %106 = load i32, i32* %15, align 4
  %107 = icmp slt i32 %106, 0
  br i1 %107, label %108, label %110

; <label>:108:                                    ; preds = %103
  %pgocount10 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 21)
  %109 = add i64 %pgocount10, 1
  store i64 %109, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 21)
  br label %185

; <label>:110:                                    ; preds = %103
  %111 = load i32, i32* %15, align 4
  call void @applySavedFileAttrToOutputFile(i32 %111)
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %113 = call i32 @fclose(%struct._IO_FILE* %112)
  store i32 %113, i32* %14, align 4
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %114 = load i32, i32* %14, align 4
  %115 = icmp eq i32 %114, -1
  br i1 %115, label %116, label %118

; <label>:116:                                    ; preds = %110
  %pgocount11 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 22)
  %117 = add i64 %pgocount11, 1
  store i64 %117, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 22)
  br label %185

; <label>:118:                                    ; preds = %110
  %pgocount12 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 3)
  %119 = add i64 %pgocount12, 1
  store i64 %119, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 3)
  br label %120

; <label>:120:                                    ; preds = %118, %99
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %122 = call i32 @ferror(%struct._IO_FILE* %121) #8
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %126

; <label>:124:                                    ; preds = %120
  %pgocount13 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 19)
  %125 = add i64 %pgocount13, 1
  store i64 %125, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 19)
  br label %185

; <label>:126:                                    ; preds = %120
  %127 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %128 = call i32 @fclose(%struct._IO_FILE* %127)
  store i32 %128, i32* %14, align 4
  %129 = load i32, i32* %14, align 4
  %130 = icmp eq i32 %129, -1
  br i1 %130, label %131, label %133

; <label>:131:                                    ; preds = %126
  %pgocount14 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 20)
  %132 = add i64 %pgocount14, 1
  store i64 %132, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 20)
  br label %185

; <label>:133:                                    ; preds = %126
  %pgocount15 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 2)
  %134 = add i64 %pgocount15, 1
  store i64 %134, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 2)
  %135 = load i32, i32* @verbosity, align 4
  %136 = icmp sge i32 %135, 1
  br i1 %136, label %137, label %175

; <label>:137:                                    ; preds = %133
  %138 = load i32, i32* %8, align 4
  %139 = icmp eq i32 %138, 0
  br i1 %139, label %140, label %148

; <label>:140:                                    ; preds = %137
  %pgocount16 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 6)
  %141 = add i64 %pgocount16, 1
  store i64 %141, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 6)
  %142 = load i32, i32* %9, align 4
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %144, label %148

; <label>:144:                                    ; preds = %140
  %pgocount17 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 7)
  %145 = add i64 %pgocount17, 1
  store i64 %145, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 7)
  %146 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %147 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %146, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.74, i32 0, i32 0))
  br label %174

; <label>:148:                                    ; preds = %140, %137
  %pgocount18 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 5)
  %149 = add i64 %pgocount18, 1
  store i64 %149, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 5)
  %150 = load i32, i32* %8, align 4
  %151 = load i32, i32* %9, align 4
  call void @uInt64_from_UInt32s(%struct.UInt64* %18, i32 %150, i32 %151)
  %152 = load i32, i32* %10, align 4
  %153 = load i32, i32* %11, align 4
  call void @uInt64_from_UInt32s(%struct.UInt64* %19, i32 %152, i32 %153)
  %154 = call double @uInt64_to_double(%struct.UInt64* %18)
  store double %154, double* %20, align 8
  %155 = call double @uInt64_to_double(%struct.UInt64* %19)
  store double %155, double* %21, align 8
  %156 = getelementptr inbounds [32 x i8], [32 x i8]* %16, i32 0, i32 0
  call void @uInt64_toAscii(i8* %156, %struct.UInt64* %18)
  %157 = getelementptr inbounds [32 x i8], [32 x i8]* %17, i32 0, i32 0
  call void @uInt64_toAscii(i8* %157, %struct.UInt64* %19)
  %158 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %159 = load double, double* %20, align 8
  %160 = load double, double* %21, align 8
  %161 = fdiv double %159, %160
  %162 = load double, double* %21, align 8
  %163 = fmul double 8.000000e+00, %162
  %164 = load double, double* %20, align 8
  %165 = fdiv double %163, %164
  %166 = load double, double* %21, align 8
  %167 = load double, double* %20, align 8
  %168 = fdiv double %166, %167
  %169 = fsub double 1.000000e+00, %168
  %170 = fmul double 1.000000e+02, %169
  %171 = getelementptr inbounds [32 x i8], [32 x i8]* %16, i32 0, i32 0
  %172 = getelementptr inbounds [32 x i8], [32 x i8]* %17, i32 0, i32 0
  %173 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %158, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.75, i32 0, i32 0), double %161, double %165, double %170, i8* %171, i8* %172)
  br label %174

; <label>:174:                                    ; preds = %148, %144
  br label %175

; <label>:175:                                    ; preds = %174, %133
  ret void

; <label>:176:                                    ; preds = %84, %77, %41
  %177 = load i8*, i8** %5, align 8
  call void @BZ2_bzWriteClose64(i32* %13, i8* %177, i32 1, i32* %8, i32* %9, i32* %10, i32* %11)
  %178 = load i32, i32* %12, align 4
  switch i32 %178, label %186 [
    i32 -9, label %179
    i32 -3, label %181
    i32 -6, label %183
  ]

; <label>:179:                                    ; preds = %176
  %pgocount19 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 9)
  %180 = add i64 %pgocount19, 1
  store i64 %180, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 9)
  call void @configError() #11
  unreachable

; <label>:181:                                    ; preds = %176
  %pgocount20 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 10)
  %182 = add i64 %pgocount20, 1
  store i64 %182, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 10)
  call void @outOfMemory() #11
  unreachable

; <label>:183:                                    ; preds = %176
  %pgocount21 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 11)
  %184 = add i64 %pgocount21, 1
  store i64 %184, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 11)
  br label %185

; <label>:185:                                    ; preds = %183, %131, %124, %116, %108, %97, %90, %64, %31, %25
  call void @ioError() #11
  unreachable

; <label>:186:                                    ; preds = %176
  %pgocount22 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 12)
  %187 = add i64 %pgocount22, 1
  store i64 %187, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_compressStream, i64 0, i64 12)
  call void @panic(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.76, i32 0, i32 0)) #11
  unreachable
}

; Function Attrs: noinline nounwind uwtable
define internal void @applySavedTimeInfoToOutputFile(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.utimbuf, align 8
  store i8* %0, i8** %2, align 8
  %5 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @fileMetaInfo, i32 0, i32 11, i32 0), align 8
  %6 = getelementptr inbounds %struct.utimbuf, %struct.utimbuf* %4, i32 0, i32 0
  store i64 %5, i64* %6, align 8
  %7 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @fileMetaInfo, i32 0, i32 12, i32 0), align 8
  %8 = getelementptr inbounds %struct.utimbuf, %struct.utimbuf* %4, i32 0, i32 1
  store i64 %7, i64* %8, align 8
  %9 = load i8*, i8** %2, align 8
  %10 = call i32 @utime(i8* %9, %struct.utimbuf* %4) #8
  store i32 %10, i32* %3, align 4
  %11 = load i32, i32* %3, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_applySavedTimeInfoToOutputFile, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_applySavedTimeInfoToOutputFile, i64 0, i64 1)
  call void @ioError() #11
  unreachable

; <label>:15:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_applySavedTimeInfoToOutputFile, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_applySavedTimeInfoToOutputFile, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal void @ioError() #5 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_ioError, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_ioError, i64 0, i64 0)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = load i8*, i8** @progName, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.78, i32 0, i32 0), i8* %3)
  %5 = load i8*, i8** @progName, align 8
  call void @perror(i8* %5)
  call void @showFileNames()
  call void @cleanUpAndFail(i32 1) #11
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind
declare i32 @lstat(i8*, %struct.stat*) #1

declare i32 @open(i8*, i32, ...) #4

; Function Attrs: nounwind
declare %struct._IO_FILE* @fdopen(i32, i8*) #1

declare i32 @close(i32) #4

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #1

declare i8* @BZ2_bzWriteOpen(i32*, %struct._IO_FILE*, i32, i32, i32) #4

; Function Attrs: noinline nounwind uwtable
define internal zeroext i8 @myfeof(%struct._IO_FILE*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %6 = call i32 @fgetc(%struct._IO_FILE* %5)
  store i32 %6, i32* %4, align 4
  %7 = load i32, i32* %4, align 4
  %8 = icmp eq i32 %7, -1
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myfeof, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myfeof, i64 0, i64 1)
  store i8 1, i8* %2, align 1
  br label %16

; <label>:11:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myfeof, i64 0, i64 0)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myfeof, i64 0, i64 0)
  %13 = load i32, i32* %4, align 4
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %15 = call i32 @ungetc(i32 %13, %struct._IO_FILE* %14)
  store i8 0, i8* %2, align 1
  br label %16

; <label>:16:                                     ; preds = %11, %9
  %17 = load i8, i8* %2, align 1
  ret i8 %17
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #4

declare void @BZ2_bzWrite(i32*, i8*, i8*, i32) #4

declare void @BZ2_bzWriteClose64(i32*, i8*, i32, i32*, i32*, i32*, i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @applySavedFileAttrToOutputFile(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @fileMetaInfo, i32 0, i32 3), align 8
  %6 = call i32 @fchmod(i32 %4, i32 %5) #8
  store i32 %6, i32* %3, align 4
  %7 = load i32, i32* %3, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_applySavedFileAttrToOutputFile, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_applySavedFileAttrToOutputFile, i64 0, i64 1)
  call void @ioError() #11
  unreachable

; <label>:11:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_applySavedFileAttrToOutputFile, i64 0, i64 0)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_applySavedFileAttrToOutputFile, i64 0, i64 0)
  %13 = load i32, i32* %2, align 4
  %14 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @fileMetaInfo, i32 0, i32 4), align 4
  %15 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @fileMetaInfo, i32 0, i32 5), align 8
  %16 = call i32 @fchown(i32 %13, i32 %14, i32 %15) #8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @uInt64_from_UInt32s(%struct.UInt64*, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_uInt64_from_UInt32s, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_uInt64_from_UInt32s, i64 0, i64 0)
  %5 = alloca %struct.UInt64*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.UInt64* %0, %struct.UInt64** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %8 = load i32, i32* %7, align 4
  %9 = lshr i32 %8, 24
  %10 = and i32 %9, 255
  %11 = trunc i32 %10 to i8
  %12 = load %struct.UInt64*, %struct.UInt64** %5, align 8
  %13 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %12, i32 0, i32 0
  %14 = getelementptr inbounds [8 x i8], [8 x i8]* %13, i64 0, i64 7
  store i8 %11, i8* %14, align 1
  %15 = load i32, i32* %7, align 4
  %16 = lshr i32 %15, 16
  %17 = and i32 %16, 255
  %18 = trunc i32 %17 to i8
  %19 = load %struct.UInt64*, %struct.UInt64** %5, align 8
  %20 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %19, i32 0, i32 0
  %21 = getelementptr inbounds [8 x i8], [8 x i8]* %20, i64 0, i64 6
  store i8 %18, i8* %21, align 1
  %22 = load i32, i32* %7, align 4
  %23 = lshr i32 %22, 8
  %24 = and i32 %23, 255
  %25 = trunc i32 %24 to i8
  %26 = load %struct.UInt64*, %struct.UInt64** %5, align 8
  %27 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %26, i32 0, i32 0
  %28 = getelementptr inbounds [8 x i8], [8 x i8]* %27, i64 0, i64 5
  store i8 %25, i8* %28, align 1
  %29 = load i32, i32* %7, align 4
  %30 = and i32 %29, 255
  %31 = trunc i32 %30 to i8
  %32 = load %struct.UInt64*, %struct.UInt64** %5, align 8
  %33 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %32, i32 0, i32 0
  %34 = getelementptr inbounds [8 x i8], [8 x i8]* %33, i64 0, i64 4
  store i8 %31, i8* %34, align 1
  %35 = load i32, i32* %6, align 4
  %36 = lshr i32 %35, 24
  %37 = and i32 %36, 255
  %38 = trunc i32 %37 to i8
  %39 = load %struct.UInt64*, %struct.UInt64** %5, align 8
  %40 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %39, i32 0, i32 0
  %41 = getelementptr inbounds [8 x i8], [8 x i8]* %40, i64 0, i64 3
  store i8 %38, i8* %41, align 1
  %42 = load i32, i32* %6, align 4
  %43 = lshr i32 %42, 16
  %44 = and i32 %43, 255
  %45 = trunc i32 %44 to i8
  %46 = load %struct.UInt64*, %struct.UInt64** %5, align 8
  %47 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %46, i32 0, i32 0
  %48 = getelementptr inbounds [8 x i8], [8 x i8]* %47, i64 0, i64 2
  store i8 %45, i8* %48, align 1
  %49 = load i32, i32* %6, align 4
  %50 = lshr i32 %49, 8
  %51 = and i32 %50, 255
  %52 = trunc i32 %51 to i8
  %53 = load %struct.UInt64*, %struct.UInt64** %5, align 8
  %54 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %53, i32 0, i32 0
  %55 = getelementptr inbounds [8 x i8], [8 x i8]* %54, i64 0, i64 1
  store i8 %52, i8* %55, align 1
  %56 = load i32, i32* %6, align 4
  %57 = and i32 %56, 255
  %58 = trunc i32 %57 to i8
  %59 = load %struct.UInt64*, %struct.UInt64** %5, align 8
  %60 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %59, i32 0, i32 0
  %61 = getelementptr inbounds [8 x i8], [8 x i8]* %60, i64 0, i64 0
  store i8 %58, i8* %61, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal double @uInt64_to_double(%struct.UInt64*) #0 {
  %2 = alloca %struct.UInt64*, align 8
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store %struct.UInt64* %0, %struct.UInt64** %2, align 8
  store double 1.000000e+00, double* %4, align 8
  store double 0.000000e+00, double* %5, align 8
  store i32 0, i32* %3, align 4
  br label %6

; <label>:6:                                      ; preds = %23, %1
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %9, label %27

; <label>:9:                                      ; preds = %6
  %10 = load double, double* %4, align 8
  %11 = load %struct.UInt64*, %struct.UInt64** %2, align 8
  %12 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %11, i32 0, i32 0
  %13 = load i32, i32* %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i8], [8 x i8]* %12, i64 0, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = uitofp i8 %16 to double
  %18 = fmul double %10, %17
  %19 = load double, double* %5, align 8
  %20 = fadd double %19, %18
  store double %20, double* %5, align 8
  %21 = load double, double* %4, align 8
  %22 = fmul double %21, 2.560000e+02
  store double %22, double* %4, align 8
  br label %23

; <label>:23:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_uInt64_to_double, i64 0, i64 0)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_uInt64_to_double, i64 0, i64 0)
  %25 = load i32, i32* %3, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %3, align 4
  br label %6

; <label>:27:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_uInt64_to_double, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_uInt64_to_double, i64 0, i64 1)
  %29 = load double, double* %5, align 8
  ret double %29
}

; Function Attrs: noinline nounwind uwtable
define internal void @uInt64_toAscii(i8*, %struct.UInt64*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.UInt64*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [32 x i8], align 16
  %8 = alloca i32, align 4
  %9 = alloca %struct.UInt64, align 1
  store i8* %0, i8** %3, align 8
  store %struct.UInt64* %1, %struct.UInt64** %4, align 8
  store i32 0, i32* %8, align 4
  %10 = load %struct.UInt64*, %struct.UInt64** %4, align 8
  %11 = bitcast %struct.UInt64* %9 to i8*
  %12 = bitcast %struct.UInt64* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 8, i32 1, i1 false)
  br label %13

; <label>:13:                                     ; preds = %24, %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_toAscii, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_toAscii, i64 0, i64 0)
  %15 = call i32 @uInt64_qrm10(%struct.UInt64* %9)
  store i32 %15, i32* %6, align 4
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %16, 48
  %18 = trunc i32 %17 to i8
  %19 = load i32, i32* %8, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [32 x i8], [32 x i8]* %7, i64 0, i64 %20
  store i8 %18, i8* %21, align 1
  %22 = load i32, i32* %8, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %8, align 4
  br label %24

; <label>:24:                                     ; preds = %13
  %25 = call zeroext i8 @uInt64_isZero(%struct.UInt64* %9)
  %26 = icmp ne i8 %25, 0
  %27 = xor i1 %26, true
  br i1 %27, label %13, label %28

; <label>:28:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_toAscii, i64 0, i64 2)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_toAscii, i64 0, i64 2)
  %30 = load i8*, i8** %3, align 8
  %31 = load i32, i32* %8, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %30, i64 %32
  store i8 0, i8* %33, align 1
  store i32 0, i32* %5, align 4
  br label %34

; <label>:34:                                     ; preds = %50, %28
  %35 = load i32, i32* %5, align 4
  %36 = load i32, i32* %8, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %54

; <label>:38:                                     ; preds = %34
  %39 = load i32, i32* %8, align 4
  %40 = load i32, i32* %5, align 4
  %41 = sub nsw i32 %39, %40
  %42 = sub nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [32 x i8], [32 x i8]* %7, i64 0, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = load i8*, i8** %3, align 8
  %47 = load i32, i32* %5, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8* %46, i64 %48
  store i8 %45, i8* %49, align 1
  br label %50

; <label>:50:                                     ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_toAscii, i64 0, i64 1)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_toAscii, i64 0, i64 1)
  %52 = load i32, i32* %5, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %5, align 4
  br label %34

; <label>:54:                                     ; preds = %34
  ret void
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal void @configError() #5 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_configError, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_configError, i64 0, i64 0)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([236 x i8], [236 x i8]* @.str.77, i32 0, i32 0))
  call void @setExit(i32 3)
  %4 = load i32, i32* @exitValue, align 4
  call void @exit(i32 %4) #10
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i32 @fgetc(%struct._IO_FILE*) #4

declare i32 @ungetc(i32, %struct._IO_FILE*) #4

; Function Attrs: nounwind
declare i32 @fchmod(i32, i32) #1

; Function Attrs: nounwind
declare i32 @fchown(i32, i32, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #7

; Function Attrs: noinline nounwind uwtable
define internal i32 @uInt64_qrm10(%struct.UInt64*) #0 {
  %2 = alloca %struct.UInt64*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.UInt64* %0, %struct.UInt64** %2, align 8
  store i32 0, i32* %3, align 4
  store i32 7, i32* %5, align 4
  br label %6

; <label>:6:                                      ; preds = %30, %1
  %7 = load i32, i32* %5, align 4
  %8 = icmp sge i32 %7, 0
  br i1 %8, label %9, label %34

; <label>:9:                                      ; preds = %6
  %10 = load i32, i32* %3, align 4
  %11 = mul i32 %10, 256
  %12 = load %struct.UInt64*, %struct.UInt64** %2, align 8
  %13 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %12, i32 0, i32 0
  %14 = load i32, i32* %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [8 x i8], [8 x i8]* %13, i64 0, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = add i32 %11, %18
  store i32 %19, i32* %4, align 4
  %20 = load i32, i32* %4, align 4
  %21 = udiv i32 %20, 10
  %22 = trunc i32 %21 to i8
  %23 = load %struct.UInt64*, %struct.UInt64** %2, align 8
  %24 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %23, i32 0, i32 0
  %25 = load i32, i32* %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x i8], [8 x i8]* %24, i64 0, i64 %26
  store i8 %22, i8* %27, align 1
  %28 = load i32, i32* %4, align 4
  %29 = urem i32 %28, 10
  store i32 %29, i32* %3, align 4
  br label %30

; <label>:30:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_uInt64_qrm10, i64 0, i64 0)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_uInt64_qrm10, i64 0, i64 0)
  %32 = load i32, i32* %5, align 4
  %33 = add nsw i32 %32, -1
  store i32 %33, i32* %5, align 4
  br label %6

; <label>:34:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_uInt64_qrm10, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_uInt64_qrm10, i64 0, i64 1)
  %36 = load i32, i32* %3, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind uwtable
define internal zeroext i8 @uInt64_isZero(%struct.UInt64*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca %struct.UInt64*, align 8
  %4 = alloca i32, align 4
  store %struct.UInt64* %0, %struct.UInt64** %3, align 8
  store i32 0, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %20, %1
  %6 = load i32, i32* %4, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %24

; <label>:8:                                      ; preds = %5
  %9 = load %struct.UInt64*, %struct.UInt64** %3, align 8
  %10 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %9, i32 0, i32 0
  %11 = load i32, i32* %4, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [8 x i8], [8 x i8]* %10, i64 0, i64 %12
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_isZero, i64 0, i64 2)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_isZero, i64 0, i64 2)
  store i8 0, i8* %2, align 1
  br label %26

; <label>:19:                                     ; preds = %8
  br label %20

; <label>:20:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_isZero, i64 0, i64 0)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_isZero, i64 0, i64 0)
  %22 = load i32, i32* %4, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %4, align 4
  br label %5

; <label>:24:                                     ; preds = %5
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_isZero, i64 0, i64 1)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_uInt64_isZero, i64 0, i64 1)
  store i8 1, i8* %2, align 1
  br label %26

; <label>:26:                                     ; preds = %24, %17
  %27 = load i8, i8* %2, align 1
  ret i8 %27
}

; Function Attrs: nounwind
declare i32 @utime(i8*, %struct.utimbuf*) #1

declare void @perror(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal zeroext i8 @mapSuffix(i8*, i8*, i8*) #0 {
  %4 = alloca i8, align 1
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = load i8*, i8** %6, align 8
  %10 = call zeroext i8 @hasSuffix(i8* %8, i8* %9)
  %11 = icmp ne i8 %10, 0
  br i1 %11, label %14, label %12

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mapSuffix, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mapSuffix, i64 0, i64 1)
  store i8 0, i8* %4, align 1
  br label %26

; <label>:14:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mapSuffix, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mapSuffix, i64 0, i64 0)
  %16 = load i8*, i8** %5, align 8
  %17 = load i8*, i8** %5, align 8
  %18 = call i64 @strlen(i8* %17) #9
  %19 = load i8*, i8** %6, align 8
  %20 = call i64 @strlen(i8* %19) #9
  %21 = sub i64 %18, %20
  %22 = getelementptr inbounds i8, i8* %16, i64 %21
  store i8 0, i8* %22, align 1
  %23 = load i8*, i8** %5, align 8
  %24 = load i8*, i8** %7, align 8
  %25 = call i8* @strcat(i8* %23, i8* %24) #8
  store i8 1, i8* %4, align 1
  br label %26

; <label>:26:                                     ; preds = %14, %12
  %27 = load i8, i8* %4, align 1
  ret i8 %27
}

; Function Attrs: noinline nounwind uwtable
define internal zeroext i8 @uncompressStream(%struct._IO_FILE*, %struct._IO_FILE*) #0 {
  %3 = alloca i8, align 1
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [5000 x i8], align 16
  %14 = alloca [5000 x i8], align 16
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  store i8* null, i8** %6, align 8
  store i32 0, i32* %15, align 4
  store i32 0, i32* %11, align 4
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %20 = call i32 @ferror(%struct._IO_FILE* %19) #8
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 25)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 25)
  br label %245

; <label>:24:                                     ; preds = %2
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %26 = call i32 @ferror(%struct._IO_FILE* %25) #8
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %24
  %pgocount3 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 26)
  %29 = add i64 %pgocount3, 1
  store i64 %29, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 26)
  br label %245

; <label>:30:                                     ; preds = %24
  br label %31

; <label>:31:                                     ; preds = %132, %30
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %33 = load i32, i32* @verbosity, align 4
  %34 = load i8, i8* @smallMode, align 1
  %35 = zext i8 %34 to i32
  %36 = getelementptr inbounds [5000 x i8], [5000 x i8]* %14, i32 0, i32 0
  %37 = load i32, i32* %15, align 4
  %38 = call i8* @BZ2_bzReadOpen(i32* %7, %struct._IO_FILE* %32, i32 %33, i32 %35, i8* %36, i32 %37)
  store i8* %38, i8** %6, align 8
  %39 = load i8*, i8** %6, align 8
  %40 = icmp eq i8* %39, null
  br i1 %40, label %45, label %41

; <label>:41:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 7)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 7)
  %43 = load i32, i32* %7, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %41, %31
  %pgocount5 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 19)
  %46 = add i64 %pgocount5, 1
  store i64 %46, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 19)
  br label %238

; <label>:47:                                     ; preds = %41
  %48 = load i32, i32* %11, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %11, align 4
  br label %50

; <label>:50:                                     ; preds = %85, %47
  %51 = load i32, i32* %7, align 4
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %86

; <label>:53:                                     ; preds = %50
  %54 = load i8*, i8** %6, align 8
  %55 = getelementptr inbounds [5000 x i8], [5000 x i8]* %13, i32 0, i32 0
  %56 = call i32 @BZ2_bzRead(i32* %7, i8* %54, i8* %55, i32 5000)
  store i32 %56, i32* %10, align 4
  %57 = load i32, i32* %7, align 4
  %58 = icmp eq i32 %57, -5
  br i1 %58, label %59, label %60

; <label>:59:                                     ; preds = %53
  br label %197

; <label>:60:                                     ; preds = %53
  %61 = load i32, i32* %7, align 4
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %._crit_edge, label %64

._crit_edge:                                      ; preds = %60
  %pgocount6 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 2)
  %63 = add i64 %pgocount6, 1
  store i64 %63, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 2)
  br label %69

; <label>:64:                                     ; preds = %60
  %65 = load i32, i32* %7, align 4
  %66 = icmp eq i32 %65, 4
  br i1 %66, label %._crit_edge1, label %._crit_edge2

._crit_edge2:                                     ; preds = %64
  %pgocount7 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 6)
  %67 = add i64 %pgocount7, 1
  store i64 %67, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 6)
  br label %79

._crit_edge1:                                     ; preds = %64
  %pgocount8 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 5)
  %68 = add i64 %pgocount8, 1
  store i64 %68, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 5)
  br label %69

; <label>:69:                                     ; preds = %._crit_edge1, %._crit_edge
  %70 = load i32, i32* %10, align 4
  %71 = icmp sgt i32 %70, 0
  br i1 %71, label %72, label %79

; <label>:72:                                     ; preds = %69
  %pgocount9 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 3)
  %73 = add i64 %pgocount9, 1
  store i64 %73, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 3)
  %74 = getelementptr inbounds [5000 x i8], [5000 x i8]* %13, i32 0, i32 0
  %75 = load i32, i32* %10, align 4
  %76 = sext i32 %75 to i64
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %78 = call i64 @fwrite(i8* %74, i64 1, i64 %76, %struct._IO_FILE* %77)
  br label %79

; <label>:79:                                     ; preds = %72, %69, %._crit_edge2
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %81 = call i32 @ferror(%struct._IO_FILE* %80) #8
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %85

; <label>:83:                                     ; preds = %79
  %pgocount10 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 22)
  %84 = add i64 %pgocount10, 1
  store i64 %84, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 22)
  br label %245

; <label>:85:                                     ; preds = %79
  br label %50

; <label>:86:                                     ; preds = %50
  %87 = load i32, i32* %7, align 4
  %88 = icmp ne i32 %87, 4
  br i1 %88, label %89, label %91

; <label>:89:                                     ; preds = %86
  %pgocount11 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 20)
  %90 = add i64 %pgocount11, 1
  store i64 %90, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 20)
  br label %238

; <label>:91:                                     ; preds = %86
  %92 = load i8*, i8** %6, align 8
  call void @BZ2_bzReadGetUnused(i32* %7, i8* %92, i8** %16, i32* %15)
  %93 = load i32, i32* %7, align 4
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %97

; <label>:95:                                     ; preds = %91
  %pgocount12 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 27)
  %96 = add i64 %pgocount12, 1
  store i64 %96, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 27)
  call void @panic(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.88, i32 0, i32 0)) #11
  unreachable

; <label>:97:                                     ; preds = %91
  %98 = load i8*, i8** %16, align 8
  store i8* %98, i8** %17, align 8
  store i32 0, i32* %12, align 4
  br label %99

; <label>:99:                                     ; preds = %113, %97
  %100 = load i32, i32* %12, align 4
  %101 = load i32, i32* %15, align 4
  %102 = icmp slt i32 %100, %101
  br i1 %102, label %103, label %116

; <label>:103:                                    ; preds = %99
  %pgocount13 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 0)
  %104 = add i64 %pgocount13, 1
  store i64 %104, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 0)
  %105 = load i8*, i8** %17, align 8
  %106 = load i32, i32* %12, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8* %105, i64 %107
  %109 = load i8, i8* %108, align 1
  %110 = load i32, i32* %12, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [5000 x i8], [5000 x i8]* %14, i64 0, i64 %111
  store i8 %109, i8* %112, align 1
  br label %113

; <label>:113:                                    ; preds = %103
  %114 = load i32, i32* %12, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %12, align 4
  br label %99

; <label>:116:                                    ; preds = %99
  %117 = load i8*, i8** %6, align 8
  call void @BZ2_bzReadClose(i32* %7, i8* %117)
  %118 = load i32, i32* %7, align 4
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %122

; <label>:120:                                    ; preds = %116
  %pgocount14 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 28)
  %121 = add i64 %pgocount14, 1
  store i64 %121, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 28)
  call void @panic(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.88, i32 0, i32 0)) #11
  unreachable

; <label>:122:                                    ; preds = %116
  %123 = load i32, i32* %15, align 4
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %125, label %132

; <label>:125:                                    ; preds = %122
  %pgocount15 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 12)
  %126 = add i64 %pgocount15, 1
  store i64 %126, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 12)
  %127 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %128 = call zeroext i8 @myfeof(%struct._IO_FILE* %127)
  %129 = zext i8 %128 to i32
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %131, label %132

; <label>:131:                                    ; preds = %125
  br label %134

; <label>:132:                                    ; preds = %125, %122
  %pgocount16 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 8)
  %133 = add i64 %pgocount16, 1
  store i64 %133, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 8)
  br label %31

; <label>:134:                                    ; preds = %131
  %pgocount17 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 21)
  %135 = add i64 %pgocount17, 1
  store i64 %135, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 21)
  br label %136

; <label>:136:                                    ; preds = %235, %134
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %138 = call i32 @ferror(%struct._IO_FILE* %137) #8
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %140, label %142

; <label>:140:                                    ; preds = %136
  %pgocount18 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 29)
  %141 = add i64 %pgocount18, 1
  store i64 %141, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 29)
  br label %245

; <label>:142:                                    ; preds = %136
  %143 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %144 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %145 = icmp ne %struct._IO_FILE* %143, %144
  br i1 %145, label %146, label %156

; <label>:146:                                    ; preds = %142
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %148 = call i32 @fileno(%struct._IO_FILE* %147) #8
  store i32 %148, i32* %18, align 4
  %149 = load i32, i32* %18, align 4
  %150 = icmp slt i32 %149, 0
  br i1 %150, label %151, label %153

; <label>:151:                                    ; preds = %146
  %pgocount19 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 33)
  %152 = add i64 %pgocount19, 1
  store i64 %152, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 33)
  br label %245

; <label>:153:                                    ; preds = %146
  %pgocount20 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 10)
  %154 = add i64 %pgocount20, 1
  store i64 %154, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 10)
  %155 = load i32, i32* %18, align 4
  call void @applySavedFileAttrToOutputFile(i32 %155)
  br label %156

; <label>:156:                                    ; preds = %153, %142
  %157 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %158 = call i32 @fclose(%struct._IO_FILE* %157)
  store i32 %158, i32* %9, align 4
  %159 = load i32, i32* %9, align 4
  %160 = icmp eq i32 %159, -1
  br i1 %160, label %161, label %163

; <label>:161:                                    ; preds = %156
  %pgocount21 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 30)
  %162 = add i64 %pgocount21, 1
  store i64 %162, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 30)
  br label %245

; <label>:163:                                    ; preds = %156
  %164 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %165 = call i32 @ferror(%struct._IO_FILE* %164) #8
  %166 = icmp ne i32 %165, 0
  br i1 %166, label %167, label %169

; <label>:167:                                    ; preds = %163
  %pgocount22 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 31)
  %168 = add i64 %pgocount22, 1
  store i64 %168, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 31)
  br label %245

; <label>:169:                                    ; preds = %163
  %170 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %171 = call i32 @fflush(%struct._IO_FILE* %170)
  store i32 %171, i32* %9, align 4
  %172 = load i32, i32* %9, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %176

; <label>:174:                                    ; preds = %169
  %pgocount23 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 32)
  %175 = add i64 %pgocount23, 1
  store i64 %175, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 32)
  br label %245

; <label>:176:                                    ; preds = %169
  %177 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %178 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %179 = icmp ne %struct._IO_FILE* %177, %178
  br i1 %179, label %180, label %189

; <label>:180:                                    ; preds = %176
  %181 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %182 = call i32 @fclose(%struct._IO_FILE* %181)
  store i32 %182, i32* %9, align 4
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %183 = load i32, i32* %9, align 4
  %184 = icmp eq i32 %183, -1
  br i1 %184, label %185, label %187

; <label>:185:                                    ; preds = %180
  %pgocount24 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 34)
  %186 = add i64 %pgocount24, 1
  store i64 %186, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 34)
  br label %245

; <label>:187:                                    ; preds = %180
  %pgocount25 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 11)
  %188 = add i64 %pgocount25, 1
  store i64 %188, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 11)
  br label %189

; <label>:189:                                    ; preds = %187, %176
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %190 = load i32, i32* @verbosity, align 4
  %191 = icmp sge i32 %190, 2
  br i1 %191, label %192, label %196

; <label>:192:                                    ; preds = %189
  %pgocount26 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 15)
  %193 = add i64 %pgocount26, 1
  store i64 %193, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 15)
  %194 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %195 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %194, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.89, i32 0, i32 0))
  br label %196

; <label>:196:                                    ; preds = %192, %189
  store i8 1, i8* %3, align 1
  br label %285

; <label>:197:                                    ; preds = %59
  %198 = load i8, i8* @forceOverwrite, align 1
  %199 = icmp ne i8 %198, 0
  br i1 %199, label %200, label %237

; <label>:200:                                    ; preds = %197
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  call void @rewind(%struct._IO_FILE* %201)
  br label %202

; <label>:202:                                    ; preds = %233, %200
  %203 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %204 = call zeroext i8 @myfeof(%struct._IO_FILE* %203)
  %205 = icmp ne i8 %204, 0
  br i1 %205, label %206, label %207

; <label>:206:                                    ; preds = %202
  br label %235

; <label>:207:                                    ; preds = %202
  %208 = getelementptr inbounds [5000 x i8], [5000 x i8]* %13, i32 0, i32 0
  %209 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %210 = call i64 @fread(i8* %208, i64 1, i64 5000, %struct._IO_FILE* %209)
  %211 = trunc i64 %210 to i32
  store i32 %211, i32* %10, align 4
  %212 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %213 = call i32 @ferror(%struct._IO_FILE* %212) #8
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %215, label %217

; <label>:215:                                    ; preds = %207
  %pgocount27 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 23)
  %216 = add i64 %pgocount27, 1
  store i64 %216, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 23)
  br label %245

; <label>:217:                                    ; preds = %207
  %218 = load i32, i32* %10, align 4
  %219 = icmp sgt i32 %218, 0
  br i1 %219, label %220, label %227

; <label>:220:                                    ; preds = %217
  %pgocount28 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 4)
  %221 = add i64 %pgocount28, 1
  store i64 %221, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 4)
  %222 = getelementptr inbounds [5000 x i8], [5000 x i8]* %13, i32 0, i32 0
  %223 = load i32, i32* %10, align 4
  %224 = sext i32 %223 to i64
  %225 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %226 = call i64 @fwrite(i8* %222, i64 1, i64 %224, %struct._IO_FILE* %225)
  br label %227

; <label>:227:                                    ; preds = %220, %217
  %228 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %229 = call i32 @ferror(%struct._IO_FILE* %228) #8
  %230 = icmp ne i32 %229, 0
  br i1 %230, label %231, label %233

; <label>:231:                                    ; preds = %227
  %pgocount29 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 24)
  %232 = add i64 %pgocount29, 1
  store i64 %232, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 24)
  br label %245

; <label>:233:                                    ; preds = %227
  %pgocount30 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 1)
  %234 = add i64 %pgocount30, 1
  store i64 %234, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 1)
  br label %202

; <label>:235:                                    ; preds = %206
  %pgocount31 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 9)
  %236 = add i64 %pgocount31, 1
  store i64 %236, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 9)
  br label %136

; <label>:237:                                    ; preds = %197
  br label %238

; <label>:238:                                    ; preds = %237, %89, %45
  %239 = load i8*, i8** %6, align 8
  call void @BZ2_bzReadClose(i32* %8, i8* %239)
  %240 = load i32, i32* %7, align 4
  switch i32 %240, label %283 [
    i32 -9, label %241
    i32 -6, label %243
    i32 -4, label %246
    i32 -3, label %248
    i32 -7, label %250
    i32 -5, label %252
  ]

; <label>:241:                                    ; preds = %238
  %pgocount32 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 36)
  %242 = add i64 %pgocount32, 1
  store i64 %242, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 36)
  call void @configError() #11
  unreachable

; <label>:243:                                    ; preds = %238
  %pgocount33 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 37)
  %244 = add i64 %pgocount33, 1
  store i64 %244, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 37)
  br label %245

; <label>:245:                                    ; preds = %243, %231, %215, %185, %174, %167, %161, %151, %140, %83, %28, %22
  call void @ioError() #11
  unreachable

; <label>:246:                                    ; preds = %238
  %pgocount34 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 38)
  %247 = add i64 %pgocount34, 1
  store i64 %247, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 38)
  call void @crcError() #11
  unreachable

; <label>:248:                                    ; preds = %238
  %pgocount35 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 39)
  %249 = add i64 %pgocount35, 1
  store i64 %249, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 39)
  call void @outOfMemory() #11
  unreachable

; <label>:250:                                    ; preds = %238
  %pgocount36 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 40)
  %251 = add i64 %pgocount36, 1
  store i64 %251, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 40)
  call void @compressedStreamEOF() #11
  unreachable

; <label>:252:                                    ; preds = %238
  %253 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %254 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %255 = icmp ne %struct._IO_FILE* %253, %254
  br i1 %255, label %256, label %260

; <label>:256:                                    ; preds = %252
  %pgocount37 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 13)
  %257 = add i64 %pgocount37, 1
  store i64 %257, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 13)
  %258 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %259 = call i32 @fclose(%struct._IO_FILE* %258)
  br label %260

; <label>:260:                                    ; preds = %256, %252
  %261 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %262 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %263 = icmp ne %struct._IO_FILE* %261, %262
  br i1 %263, label %264, label %268

; <label>:264:                                    ; preds = %260
  %pgocount38 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 14)
  %265 = add i64 %pgocount38, 1
  store i64 %265, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 14)
  %266 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %267 = call i32 @fclose(%struct._IO_FILE* %266)
  br label %268

; <label>:268:                                    ; preds = %264, %260
  %269 = load i32, i32* %11, align 4
  %270 = icmp eq i32 %269, 1
  br i1 %270, label %271, label %273

; <label>:271:                                    ; preds = %268
  %pgocount39 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 16)
  %272 = add i64 %pgocount39, 1
  store i64 %272, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 16)
  store i8 0, i8* %3, align 1
  br label %285

; <label>:273:                                    ; preds = %268
  %274 = load i8, i8* @noisy, align 1
  %275 = icmp ne i8 %274, 0
  br i1 %275, label %276, label %281

; <label>:276:                                    ; preds = %273
  %pgocount40 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 18)
  %277 = add i64 %pgocount40, 1
  store i64 %277, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 18)
  %278 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %279 = load i8*, i8** @progName, align 8
  %280 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %278, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.90, i32 0, i32 0), i8* %279, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  br label %281

; <label>:281:                                    ; preds = %276, %273
  %pgocount41 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 17)
  %282 = add i64 %pgocount41, 1
  store i64 %282, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 17)
  store i8 1, i8* %3, align 1
  br label %285

; <label>:283:                                    ; preds = %238
  %pgocount42 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 35)
  %284 = add i64 %pgocount42, 1
  store i64 %284, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_uncompressStream, i64 0, i64 35)
  call void @panic(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.91, i32 0, i32 0)) #11
  unreachable

; <label>:285:                                    ; preds = %281, %271, %196
  %286 = load i8, i8* %3, align 1
  ret i8 %286
}

declare i8* @BZ2_bzReadOpen(i32*, %struct._IO_FILE*, i32, i32, i8*, i32) #4

declare i32 @BZ2_bzRead(i32*, i8*, i8*, i32) #4

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #4

declare void @BZ2_bzReadGetUnused(i32*, i8*, i8**, i32*) #4

declare void @BZ2_bzReadClose(i32*, i8*) #4

declare void @rewind(%struct._IO_FILE*) #4

; Function Attrs: noinline noreturn nounwind uwtable
define internal void @crcError() #5 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_crcError, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_crcError, i64 0, i64 0)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = load i8*, i8** @progName, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.92, i32 0, i32 0), i8* %3)
  call void @showFileNames()
  call void @cadvise()
  call void @cleanUpAndFail(i32 2) #11
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal void @compressedStreamEOF() #5 {
  %1 = load i8, i8* @noisy, align 1
  %2 = icmp ne i8 %1, 0
  br i1 %2, label %3, label %9

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compressedStreamEOF, i64 0, i64 1)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compressedStreamEOF, i64 0, i64 1)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = load i8*, i8** @progName, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([95 x i8], [95 x i8]* @.str.93, i32 0, i32 0), i8* %6)
  %8 = load i8*, i8** @progName, align 8
  call void @perror(i8* %8)
  call void @showFileNames()
  call void @cadvise()
  br label %9

; <label>:9:                                      ; preds = %3, %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compressedStreamEOF, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compressedStreamEOF, i64 0, i64 0)
  call void @cleanUpAndFail(i32 2) #11
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal zeroext i8 @testStream(%struct._IO_FILE*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [5000 x i8], align 16
  %12 = alloca [5000 x i8], align 16
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store i8* null, i8** %4, align 8
  store i32 0, i32* %13, align 4
  store i32 0, i32* %9, align 4
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %17 = call i32 @ferror(%struct._IO_FILE* %16) #8
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 16)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 16)
  br label %138

; <label>:21:                                     ; preds = %1
  br label %22

; <label>:22:                                     ; preds = %99, %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %24 = load i32, i32* @verbosity, align 4
  %25 = load i8, i8* @smallMode, align 1
  %26 = zext i8 %25 to i32
  %27 = getelementptr inbounds [5000 x i8], [5000 x i8]* %12, i32 0, i32 0
  %28 = load i32, i32* %13, align 4
  %29 = call i8* @BZ2_bzReadOpen(i32* %5, %struct._IO_FILE* %23, i32 %24, i32 %26, i8* %27, i32 %28)
  store i8* %29, i8** %4, align 8
  %30 = load i8*, i8** %4, align 8
  %31 = icmp eq i8* %30, null
  br i1 %31, label %._crit_edge, label %33

._crit_edge:                                      ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 0)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 0)
  br label %36

; <label>:33:                                     ; preds = %22
  %34 = load i32, i32* %5, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %38

; <label>:36:                                     ; preds = %33, %._crit_edge
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 11)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 11)
  br label %123

; <label>:38:                                     ; preds = %33
  %39 = load i32, i32* %9, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %9, align 4
  br label %41

; <label>:41:                                     ; preds = %51, %38
  %42 = load i32, i32* %5, align 4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %53

; <label>:44:                                     ; preds = %41
  %45 = load i8*, i8** %4, align 8
  %46 = getelementptr inbounds [5000 x i8], [5000 x i8]* %11, i32 0, i32 0
  %47 = call i32 @BZ2_bzRead(i32* %5, i8* %45, i8* %46, i32 5000)
  store i32 %47, i32* %8, align 4
  %48 = load i32, i32* %5, align 4
  %49 = icmp eq i32 %48, -5
  br i1 %49, label %50, label %51

; <label>:50:                                     ; preds = %44
  br label %123

; <label>:51:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 1)
  %52 = add i64 %pgocount3, 1
  store i64 %52, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 1)
  br label %41

; <label>:53:                                     ; preds = %41
  %54 = load i32, i32* %5, align 4
  %55 = icmp ne i32 %54, 4
  br i1 %55, label %56, label %58

; <label>:56:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 13)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 13)
  br label %123

; <label>:58:                                     ; preds = %53
  %59 = load i8*, i8** %4, align 8
  call void @BZ2_bzReadGetUnused(i32* %5, i8* %59, i8** %14, i32* %13)
  %60 = load i32, i32* %5, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %64

; <label>:62:                                     ; preds = %58
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 17)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 17)
  call void @panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.98, i32 0, i32 0)) #11
  unreachable

; <label>:64:                                     ; preds = %58
  %65 = load i8*, i8** %14, align 8
  store i8* %65, i8** %15, align 8
  store i32 0, i32* %10, align 4
  br label %66

; <label>:66:                                     ; preds = %79, %64
  %67 = load i32, i32* %10, align 4
  %68 = load i32, i32* %13, align 4
  %69 = icmp slt i32 %67, %68
  br i1 %69, label %70, label %83

; <label>:70:                                     ; preds = %66
  %71 = load i8*, i8** %15, align 8
  %72 = load i32, i32* %10, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8* %71, i64 %73
  %75 = load i8, i8* %74, align 1
  %76 = load i32, i32* %10, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [5000 x i8], [5000 x i8]* %12, i64 0, i64 %77
  store i8 %75, i8* %78, align 1
  br label %79

; <label>:79:                                     ; preds = %70
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 2)
  %80 = add i64 %pgocount6, 1
  store i64 %80, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 2)
  %81 = load i32, i32* %10, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %10, align 4
  br label %66

; <label>:83:                                     ; preds = %66
  %84 = load i8*, i8** %4, align 8
  call void @BZ2_bzReadClose(i32* %5, i8* %84)
  %85 = load i32, i32* %5, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %89

; <label>:87:                                     ; preds = %83
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 18)
  %88 = add i64 %pgocount7, 1
  store i64 %88, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 18)
  call void @panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.98, i32 0, i32 0)) #11
  unreachable

; <label>:89:                                     ; preds = %83
  %90 = load i32, i32* %13, align 4
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %99

; <label>:92:                                     ; preds = %89
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 7)
  %93 = add i64 %pgocount8, 1
  store i64 %93, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 7)
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %95 = call zeroext i8 @myfeof(%struct._IO_FILE* %94)
  %96 = zext i8 %95 to i32
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %99

; <label>:98:                                     ; preds = %92
  br label %101

; <label>:99:                                     ; preds = %92, %89
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 3)
  %100 = add i64 %pgocount9, 1
  store i64 %100, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 3)
  br label %22

; <label>:101:                                    ; preds = %98
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %103 = call i32 @ferror(%struct._IO_FILE* %102) #8
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %105, label %107

; <label>:105:                                    ; preds = %101
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 23)
  %106 = add i64 %pgocount10, 1
  store i64 %106, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 23)
  br label %138

; <label>:107:                                    ; preds = %101
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %109 = call i32 @fclose(%struct._IO_FILE* %108)
  store i32 %109, i32* %7, align 4
  %110 = load i32, i32* %7, align 4
  %111 = icmp eq i32 %110, -1
  br i1 %111, label %112, label %114

; <label>:112:                                    ; preds = %107
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 24)
  %113 = add i64 %pgocount11, 1
  store i64 %113, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 24)
  br label %138

; <label>:114:                                    ; preds = %107
  %115 = load i32, i32* @verbosity, align 4
  %116 = icmp sge i32 %115, 2
  br i1 %116, label %117, label %121

; <label>:117:                                    ; preds = %114
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 15)
  %118 = add i64 %pgocount12, 1
  store i64 %118, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 15)
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %120 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %119, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.89, i32 0, i32 0))
  br label %121

; <label>:121:                                    ; preds = %117, %114
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 14)
  %122 = add i64 %pgocount13, 1
  store i64 %122, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 14)
  store i8 1, i8* %2, align 1
  br label %175

; <label>:123:                                    ; preds = %56, %50, %36
  %124 = load i8*, i8** %4, align 8
  call void @BZ2_bzReadClose(i32* %6, i8* %124)
  %125 = load i32, i32* @verbosity, align 4
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %127, label %132

; <label>:127:                                    ; preds = %123
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 4)
  %128 = add i64 %pgocount14, 1
  store i64 %128, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 4)
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %130 = load i8*, i8** @progName, align 8
  %131 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %129, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.99, i32 0, i32 0), i8* %130, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i32 0, i32 0))
  br label %132

; <label>:132:                                    ; preds = %127, %123
  %133 = load i32, i32* %5, align 4
  switch i32 %133, label %173 [
    i32 -9, label %134
    i32 -6, label %136
    i32 -4, label %139
    i32 -3, label %143
    i32 -7, label %145
    i32 -5, label %149
  ]

; <label>:134:                                    ; preds = %132
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 19)
  %135 = add i64 %pgocount15, 1
  store i64 %135, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 19)
  call void @configError() #11
  unreachable

; <label>:136:                                    ; preds = %132
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 20)
  %137 = add i64 %pgocount16, 1
  store i64 %137, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 20)
  br label %138

; <label>:138:                                    ; preds = %136, %112, %105, %19
  call void @ioError() #11
  unreachable

; <label>:139:                                    ; preds = %132
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 5)
  %140 = add i64 %pgocount17, 1
  store i64 %140, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 5)
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %142 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %141, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.100, i32 0, i32 0))
  store i8 0, i8* %2, align 1
  br label %175

; <label>:143:                                    ; preds = %132
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 21)
  %144 = add i64 %pgocount18, 1
  store i64 %144, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 21)
  call void @outOfMemory() #11
  unreachable

; <label>:145:                                    ; preds = %132
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 6)
  %146 = add i64 %pgocount19, 1
  store i64 %146, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 6)
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %148 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %147, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.101, i32 0, i32 0))
  store i8 0, i8* %2, align 1
  br label %175

; <label>:149:                                    ; preds = %132
  %150 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %151 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %152 = icmp ne %struct._IO_FILE* %150, %151
  br i1 %152, label %153, label %157

; <label>:153:                                    ; preds = %149
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 8)
  %154 = add i64 %pgocount20, 1
  store i64 %154, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 8)
  %155 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %156 = call i32 @fclose(%struct._IO_FILE* %155)
  br label %157

; <label>:157:                                    ; preds = %153, %149
  %158 = load i32, i32* %9, align 4
  %159 = icmp eq i32 %158, 1
  br i1 %159, label %160, label %164

; <label>:160:                                    ; preds = %157
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 9)
  %161 = add i64 %pgocount21, 1
  store i64 %161, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 9)
  %162 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %163 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %162, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.102, i32 0, i32 0))
  store i8 0, i8* %2, align 1
  br label %175

; <label>:164:                                    ; preds = %157
  %165 = load i8, i8* @noisy, align 1
  %166 = icmp ne i8 %165, 0
  br i1 %166, label %167, label %171

; <label>:167:                                    ; preds = %164
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 12)
  %168 = add i64 %pgocount22, 1
  store i64 %168, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 12)
  %169 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %170 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %169, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.103, i32 0, i32 0))
  br label %171

; <label>:171:                                    ; preds = %167, %164
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 10)
  %172 = add i64 %pgocount23, 1
  store i64 %172, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 10)
  store i8 1, i8* %2, align 1
  br label %175

; <label>:173:                                    ; preds = %132
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 22)
  %174 = add i64 %pgocount24, 1
  store i64 %174, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_testStream, i64 0, i64 22)
  call void @panic(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.104, i32 0, i32 0)) #11
  unreachable

; <label>:175:                                    ; preds = %171, %160, %145, %139, %121
  %176 = load i8, i8* %2, align 1
  ret i8 %176
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #8

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #8

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind }
attributes #8 = { nounwind }
attributes #9 = { nounwind readonly }
attributes #10 = { noreturn nounwind }
attributes #11 = { noreturn }
attributes #12 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
