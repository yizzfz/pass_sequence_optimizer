; ModuleID = 'bzip2.ll'
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

@.str = private unnamed_addr constant [5 x i8] c".bz2\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c".bz\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c".tbz2\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c".tbz\00", align 1
@zSuffix = local_unnamed_addr global [4 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0)], align 16
@.str.4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.5 = private unnamed_addr constant [5 x i8] c".tar\00", align 1
@unzSuffix = local_unnamed_addr global [4 x i8*] [i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0)], align 16
@outputHandleJustInCase = common local_unnamed_addr global %struct._IO_FILE* null, align 8
@smallMode = common local_unnamed_addr global i8 0, align 1
@keepInputFiles = common local_unnamed_addr global i8 0, align 1
@forceOverwrite = common local_unnamed_addr global i8 0, align 1
@noisy = common local_unnamed_addr global i8 0, align 1
@verbosity = common local_unnamed_addr global i32 0, align 4
@blockSize100k = common local_unnamed_addr global i32 0, align 4
@testFailsExist = common local_unnamed_addr global i8 0, align 1
@unzFailsExist = common local_unnamed_addr global i8 0, align 1
@numFileNames = common local_unnamed_addr global i32 0, align 4
@numFilesProcessed = common local_unnamed_addr global i32 0, align 4
@workFactor = common local_unnamed_addr global i32 0, align 4
@deleteOutputOnInterrupt = common local_unnamed_addr global i8 0, align 1
@exitValue = common local_unnamed_addr global i32 0, align 4
@inName = common global [1034 x i8] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [7 x i8] c"(none)\00", align 1
@outName = common global [1034 x i8] zeroinitializer, align 16
@progNameReally = common global [1034 x i8] zeroinitializer, align 16
@progName = common local_unnamed_addr global i8* null, align 8
@.str.7 = private unnamed_addr constant [6 x i8] c"BZIP2\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"BZIP\00", align 1
@longestFileName = common local_unnamed_addr global i32 0, align 4
@.str.9 = private unnamed_addr constant [3 x i8] c"--\00", align 1
@srcMode = common local_unnamed_addr global i32 0, align 4
@opMode = common local_unnamed_addr global i32 0, align 4
@.str.10 = private unnamed_addr constant [6 x i8] c"unzip\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"UNZIP\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"z2cat\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"Z2CAT\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"zcat\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"ZCAT\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
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
@.str.57 = private unnamed_addr constant [35 x i8] c"%s: Can't open input file %s: %s.\0A\00", align 1
@.str.58 = private unnamed_addr constant [42 x i8] c"%s: Input file %s already has %s suffix.\0A\00", align 1
@.str.59 = private unnamed_addr constant [35 x i8] c"%s: Input file %s is a directory.\0A\00", align 1
@.str.60 = private unnamed_addr constant [41 x i8] c"%s: Input file %s is not a normal file.\0A\00", align 1
@.str.61 = private unnamed_addr constant [36 x i8] c"%s: Output file %s already exists.\0A\00", align 1
@.str.62 = private unnamed_addr constant [40 x i8] c"%s: Input file %s has %d other link%s.\0A\00", align 1
@.str.63 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@stdin = external local_unnamed_addr global %struct._IO_FILE*, align 8
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8
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

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca %struct.zzzz*, align 8
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
  %4 = tail call void (i32)* @signal(i32 11, void (i32)* nonnull @mySIGSEGVorSIGBUScatcher) #11
  %5 = tail call void (i32)* @signal(i32 7, void (i32)* nonnull @mySIGSEGVorSIGBUScatcher) #11
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0))
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0))
  %6 = load i8*, i8** %1, align 8
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @progNameReally, i64 0, i64 0), i8* %6)
  store i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @progNameReally, i64 0, i64 0), i8** @progName, align 8
  br label %7

; <label>:7:                                      ; preds = %11, %2
  %.010 = phi i8* [ getelementptr inbounds ([1034 x i8], [1034 x i8]* @progNameReally, i64 0, i64 0), %2 ], [ %12, %11 ]
  %8 = load i8, i8* %.010, align 1
  switch i8 %8, label %11 [
    i8 0, label %13
    i8 47, label %9
  ]

; <label>:9:                                      ; preds = %7
  %10 = getelementptr inbounds i8, i8* %.010, i64 1
  store i8* %10, i8** @progName, align 8
  br label %11

; <label>:11:                                     ; preds = %7, %9
  %12 = getelementptr inbounds i8, i8* %.010, i64 1
  br label %7

; <label>:13:                                     ; preds = %7
  store %struct.zzzz* null, %struct.zzzz** %3, align 8
  call fastcc void @addFlagsFromEnvVar(%struct.zzzz** nonnull %3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i64 0, i64 0))
  call fastcc void @addFlagsFromEnvVar(%struct.zzzz** nonnull %3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0))
  %14 = icmp sgt i32 %0, 1
  %.promoted = load %struct.zzzz*, %struct.zzzz** %3, align 8
  br i1 %14, label %.lr.ph68, label %thread-pre-split

.lr.ph68:                                         ; preds = %13
  %wide.trip.count = zext i32 %0 to i64
  br label %15

; <label>:15:                                     ; preds = %15, %.lr.ph68
  %indvars.iv75 = phi i64 [ 1, %.lr.ph68 ], [ %indvars.iv.next76, %15 ]
  %16 = phi %struct.zzzz* [ %.promoted, %.lr.ph68 ], [ %19, %15 ]
  %17 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv75
  %18 = load i8*, i8** %17, align 8
  %19 = tail call fastcc %struct.zzzz* @snocString(%struct.zzzz* %16, i8* %18)
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond = icmp eq i64 %indvars.iv.next76, %wide.trip.count
  br i1 %exitcond, label %._crit_edge69, label %15

._crit_edge69:                                    ; preds = %15
  store %struct.zzzz* %19, %struct.zzzz** %3, align 8
  br label %thread-pre-split

thread-pre-split:                                 ; preds = %13, %._crit_edge69
  %.0160 = phi %struct.zzzz* [ %19, %._crit_edge69 ], [ %.promoted, %13 ]
  store i32 7, i32* @longestFileName, align 4
  store i32 0, i32* @numFileNames, align 4
  %20 = icmp eq %struct.zzzz* %.0160, null
  br i1 %20, label %._crit_edge65, label %.lr.ph64.preheader

.lr.ph64.preheader:                               ; preds = %thread-pre-split
  br label %.lr.ph64

.lr.ph64:                                         ; preds = %.lr.ph64.preheader, %38
  %.0162 = phi %struct.zzzz* [ %.01, %38 ], [ %.0160, %.lr.ph64.preheader ]
  %.061 = phi i8 [ %.1, %38 ], [ 1, %.lr.ph64.preheader ]
  %21 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.0162, i64 0, i32 0
  %22 = load i8*, i8** %21, align 8
  %23 = tail call i32 @strcmp(i8* %22, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #12
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %38, label %25

; <label>:25:                                     ; preds = %.lr.ph64
  %26 = load i8, i8* %22, align 1
  %27 = icmp ne i8 %26, 45
  %28 = icmp eq i8 %.061, 0
  %or.cond = or i1 %28, %27
  br i1 %or.cond, label %29, label %38

; <label>:29:                                     ; preds = %25
  %30 = load i32, i32* @numFileNames, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* @numFileNames, align 4
  %32 = load i32, i32* @longestFileName, align 4
  %33 = load i8*, i8** %21, align 8
  %34 = tail call i64 @strlen(i8* %33) #12
  %35 = trunc i64 %34 to i32
  %36 = icmp slt i32 %32, %35
  br i1 %36, label %37, label %38

; <label>:37:                                     ; preds = %29
  store i32 %35, i32* @longestFileName, align 4
  br label %38

; <label>:38:                                     ; preds = %29, %37, %25, %.lr.ph64
  %.1 = phi i8 [ 0, %.lr.ph64 ], [ %.061, %25 ], [ %.061, %37 ], [ %.061, %29 ]
  %39 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.0162, i64 0, i32 1
  %.01 = load %struct.zzzz*, %struct.zzzz** %39, align 8
  %40 = icmp eq %struct.zzzz* %.01, null
  br i1 %40, label %._crit_edge65.loopexit, label %.lr.ph64

._crit_edge65.loopexit:                           ; preds = %38
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %thread-pre-split
  %41 = load i32, i32* @numFileNames, align 4
  %42 = icmp eq i32 %41, 0
  %. = select i1 %42, i32 1, i32 3
  store i32 %., i32* @srcMode, align 4
  store i32 1, i32* @opMode, align 4
  %43 = load i8*, i8** @progName, align 8
  %44 = tail call i8* @strstr(i8* %43, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i64 0, i64 0)) #12
  %45 = icmp eq i8* %44, null
  br i1 %45, label %46, label %49

; <label>:46:                                     ; preds = %._crit_edge65
  %47 = tail call i8* @strstr(i8* %43, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i64 0, i64 0)) #12
  %48 = icmp eq i8* %47, null
  br i1 %48, label %50, label %49

; <label>:49:                                     ; preds = %46, %._crit_edge65
  store i32 2, i32* @opMode, align 4
  br label %50

; <label>:50:                                     ; preds = %46, %49
  %51 = load i8*, i8** @progName, align 8
  %52 = tail call i8* @strstr(i8* %51, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i64 0, i64 0)) #12
  %53 = icmp eq i8* %52, null
  br i1 %53, label %54, label %63

; <label>:54:                                     ; preds = %50
  %55 = tail call i8* @strstr(i8* %51, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i64 0, i64 0)) #12
  %56 = icmp eq i8* %55, null
  br i1 %56, label %57, label %63

; <label>:57:                                     ; preds = %54
  %58 = tail call i8* @strstr(i8* %51, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i64 0, i64 0)) #12
  %59 = icmp eq i8* %58, null
  br i1 %59, label %60, label %63

; <label>:60:                                     ; preds = %57
  %61 = tail call i8* @strstr(i8* %51, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15, i64 0, i64 0)) #12
  %62 = icmp eq i8* %61, null
  br i1 %62, label %.preheader32, label %63

; <label>:63:                                     ; preds = %60, %57, %54, %50
  store i32 2, i32* @opMode, align 4
  %64 = load i32, i32* @numFileNames, align 4
  %65 = icmp eq i32 %64, 0
  %66 = select i1 %65, i32 1, i32 2
  store i32 %66, i32* @srcMode, align 4
  br label %.preheader32

.preheader32:                                     ; preds = %60, %63
  %.1256 = load %struct.zzzz*, %struct.zzzz** %3, align 8
  %67 = icmp eq %struct.zzzz* %.1256, null
  br i1 %67, label %._crit_edge52, label %.lr.ph58.preheader

.lr.ph58.preheader:                               ; preds = %.preheader32
  br label %.lr.ph58

.preheader29:                                     ; preds = %.loopexit31, %.lr.ph58
  %.2349.pr = load %struct.zzzz*, %struct.zzzz** %3, align 8
  %68 = icmp eq %struct.zzzz* %.2349.pr, null
  br i1 %68, label %._crit_edge52, label %.lr.ph51.preheader

.lr.ph51.preheader:                               ; preds = %.preheader29
  br label %.lr.ph51

.lr.ph58:                                         ; preds = %.lr.ph58.preheader, %.loopexit31
  %.1257 = phi %struct.zzzz* [ %.12, %.loopexit31 ], [ %.1256, %.lr.ph58.preheader ]
  %69 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.1257, i64 0, i32 0
  %70 = load i8*, i8** %69, align 8
  %71 = tail call i32 @strcmp(i8* %70, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #12
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %.preheader29, label %73

; <label>:73:                                     ; preds = %.lr.ph58
  %74 = load i8, i8* %70, align 1
  %75 = icmp eq i8 %74, 45
  br i1 %75, label %76, label %.loopexit31

; <label>:76:                                     ; preds = %73
  %77 = getelementptr inbounds i8, i8* %70, i64 1
  %78 = load i8, i8* %77, align 1
  %79 = icmp eq i8 %78, 45
  br i1 %79, label %.loopexit31, label %.preheader30

.preheader30:                                     ; preds = %76
  %80 = load i8*, i8** %69, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 1
  %82 = load i8, i8* %81, align 1
  %83 = icmp eq i8 %82, 0
  br i1 %83, label %.loopexit31, label %.lr.ph55.preheader

.lr.ph55.preheader:                               ; preds = %.preheader30
  br label %.lr.ph55

.lr.ph55:                                         ; preds = %.lr.ph55.preheader, %115
  %indvars.iv = phi i64 [ %indvars.iv.next, %115 ], [ 1, %.lr.ph55.preheader ]
  %84 = phi i8 [ %118, %115 ], [ %82, %.lr.ph55.preheader ]
  %85 = phi i8* [ %116, %115 ], [ %80, %.lr.ph55.preheader ]
  %86 = sext i8 %84 to i32
  switch i32 %86, label %110 [
    i32 99, label %87
    i32 100, label %88
    i32 122, label %89
    i32 102, label %90
    i32 116, label %91
    i32 107, label %92
    i32 115, label %93
    i32 113, label %94
    i32 49, label %95
    i32 50, label %96
    i32 51, label %97
    i32 52, label %98
    i32 53, label %99
    i32 54, label %100
    i32 55, label %101
    i32 56, label %102
    i32 57, label %103
    i32 86, label %104
    i32 76, label %104
    i32 118, label %105
    i32 104, label %108
  ]

; <label>:87:                                     ; preds = %.lr.ph55
  store i32 2, i32* @srcMode, align 4
  br label %115

; <label>:88:                                     ; preds = %.lr.ph55
  store i32 2, i32* @opMode, align 4
  br label %115

; <label>:89:                                     ; preds = %.lr.ph55
  store i32 1, i32* @opMode, align 4
  br label %115

; <label>:90:                                     ; preds = %.lr.ph55
  store i8 1, i8* @forceOverwrite, align 1
  br label %115

; <label>:91:                                     ; preds = %.lr.ph55
  store i32 3, i32* @opMode, align 4
  br label %115

; <label>:92:                                     ; preds = %.lr.ph55
  store i8 1, i8* @keepInputFiles, align 1
  br label %115

; <label>:93:                                     ; preds = %.lr.ph55
  store i8 1, i8* @smallMode, align 1
  br label %115

; <label>:94:                                     ; preds = %.lr.ph55
  store i8 0, i8* @noisy, align 1
  br label %115

; <label>:95:                                     ; preds = %.lr.ph55
  store i32 1, i32* @blockSize100k, align 4
  br label %115

; <label>:96:                                     ; preds = %.lr.ph55
  store i32 2, i32* @blockSize100k, align 4
  br label %115

; <label>:97:                                     ; preds = %.lr.ph55
  store i32 3, i32* @blockSize100k, align 4
  br label %115

; <label>:98:                                     ; preds = %.lr.ph55
  store i32 4, i32* @blockSize100k, align 4
  br label %115

; <label>:99:                                     ; preds = %.lr.ph55
  store i32 5, i32* @blockSize100k, align 4
  br label %115

; <label>:100:                                    ; preds = %.lr.ph55
  store i32 6, i32* @blockSize100k, align 4
  br label %115

; <label>:101:                                    ; preds = %.lr.ph55
  store i32 7, i32* @blockSize100k, align 4
  br label %115

; <label>:102:                                    ; preds = %.lr.ph55
  store i32 8, i32* @blockSize100k, align 4
  br label %115

; <label>:103:                                    ; preds = %.lr.ph55
  store i32 9, i32* @blockSize100k, align 4
  br label %115

; <label>:104:                                    ; preds = %.lr.ph55, %.lr.ph55
  tail call fastcc void @license()
  br label %115

; <label>:105:                                    ; preds = %.lr.ph55
  %106 = load i32, i32* @verbosity, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* @verbosity, align 4
  br label %115

; <label>:108:                                    ; preds = %.lr.ph55
  %109 = load i8*, i8** @progName, align 8
  tail call fastcc void @usage(i8* %109)
  tail call void @exit(i32 0) #13
  unreachable

; <label>:110:                                    ; preds = %.lr.ph55
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %112 = load i8*, i8** @progName, align 8
  %113 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %111, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16, i64 0, i64 0), i8* %112, i8* %85) #14
  %114 = load i8*, i8** @progName, align 8
  tail call fastcc void @usage(i8* %114)
  tail call void @exit(i32 1) #13
  unreachable

; <label>:115:                                    ; preds = %87, %88, %89, %90, %91, %92, %93, %94, %95, %96, %97, %98, %99, %100, %101, %102, %103, %104, %105
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %116 = load i8*, i8** %69, align 8
  %117 = getelementptr inbounds i8, i8* %116, i64 %indvars.iv.next
  %118 = load i8, i8* %117, align 1
  %119 = icmp eq i8 %118, 0
  br i1 %119, label %.loopexit31.loopexit, label %.lr.ph55

.loopexit31.loopexit:                             ; preds = %115
  br label %.loopexit31

.loopexit31:                                      ; preds = %.loopexit31.loopexit, %.preheader30, %73, %76
  %120 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.1257, i64 0, i32 1
  %.12 = load %struct.zzzz*, %struct.zzzz** %120, align 8
  %121 = icmp eq %struct.zzzz* %.12, null
  br i1 %121, label %.preheader29, label %.lr.ph58

.lr.ph51:                                         ; preds = %.lr.ph51.preheader, %205
  %.2350 = phi %struct.zzzz* [ %.23, %205 ], [ %.2349.pr, %.lr.ph51.preheader ]
  %122 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.2350, i64 0, i32 0
  %123 = load i8*, i8** %122, align 8
  %124 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #12
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %._crit_edge52.loopexit, label %126

; <label>:126:                                    ; preds = %.lr.ph51
  %127 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.17, i64 0, i64 0)) #12
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %129, label %130

; <label>:129:                                    ; preds = %126
  store i32 2, i32* @srcMode, align 4
  br label %205

; <label>:130:                                    ; preds = %126
  %131 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18, i64 0, i64 0)) #12
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %133, label %134

; <label>:133:                                    ; preds = %130
  store i32 2, i32* @opMode, align 4
  br label %205

; <label>:134:                                    ; preds = %130
  %135 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.19, i64 0, i64 0)) #12
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %137, label %138

; <label>:137:                                    ; preds = %134
  store i32 1, i32* @opMode, align 4
  br label %205

; <label>:138:                                    ; preds = %134
  %139 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20, i64 0, i64 0)) #12
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %141, label %142

; <label>:141:                                    ; preds = %138
  store i8 1, i8* @forceOverwrite, align 1
  br label %205

; <label>:142:                                    ; preds = %138
  %143 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i64 0, i64 0)) #12
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %145, label %146

; <label>:145:                                    ; preds = %142
  store i32 3, i32* @opMode, align 4
  br label %205

; <label>:146:                                    ; preds = %142
  %147 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i64 0, i64 0)) #12
  %148 = icmp eq i32 %147, 0
  br i1 %148, label %149, label %150

; <label>:149:                                    ; preds = %146
  store i8 1, i8* @keepInputFiles, align 1
  br label %205

; <label>:150:                                    ; preds = %146
  %151 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.23, i64 0, i64 0)) #12
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %153, label %154

; <label>:153:                                    ; preds = %150
  store i8 1, i8* @smallMode, align 1
  br label %205

; <label>:154:                                    ; preds = %150
  %155 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i64 0, i64 0)) #12
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %157, label %158

; <label>:157:                                    ; preds = %154
  store i8 0, i8* @noisy, align 1
  br label %205

; <label>:158:                                    ; preds = %154
  %159 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i64 0, i64 0)) #12
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %161, label %162

; <label>:161:                                    ; preds = %158
  tail call fastcc void @license()
  br label %205

; <label>:162:                                    ; preds = %158
  %163 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.26, i64 0, i64 0)) #12
  %164 = icmp eq i32 %163, 0
  br i1 %164, label %165, label %166

; <label>:165:                                    ; preds = %162
  tail call fastcc void @license()
  br label %205

; <label>:166:                                    ; preds = %162
  %167 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.27, i64 0, i64 0)) #12
  %168 = icmp eq i32 %167, 0
  br i1 %168, label %169, label %170

; <label>:169:                                    ; preds = %166
  store i32 1, i32* @workFactor, align 4
  br label %205

; <label>:170:                                    ; preds = %166
  %171 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.28, i64 0, i64 0)) #12
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %173, label %174

; <label>:173:                                    ; preds = %170
  tail call fastcc void @redundant(i8* %123)
  br label %205

; <label>:174:                                    ; preds = %170
  %175 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.29, i64 0, i64 0)) #12
  %176 = icmp eq i32 %175, 0
  br i1 %176, label %177, label %178

; <label>:177:                                    ; preds = %174
  tail call fastcc void @redundant(i8* %123)
  br label %205

; <label>:178:                                    ; preds = %174
  %179 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i64 0, i64 0)) #12
  %180 = icmp eq i32 %179, 0
  br i1 %180, label %181, label %182

; <label>:181:                                    ; preds = %178
  store i32 1, i32* @blockSize100k, align 4
  br label %205

; <label>:182:                                    ; preds = %178
  %183 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.31, i64 0, i64 0)) #12
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %186

; <label>:185:                                    ; preds = %182
  store i32 9, i32* @blockSize100k, align 4
  br label %205

; <label>:186:                                    ; preds = %182
  %187 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.32, i64 0, i64 0)) #12
  %188 = icmp eq i32 %187, 0
  br i1 %188, label %189, label %192

; <label>:189:                                    ; preds = %186
  %190 = load i32, i32* @verbosity, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, i32* @verbosity, align 4
  br label %205

; <label>:192:                                    ; preds = %186
  %193 = tail call i32 @strcmp(i8* %123, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.33, i64 0, i64 0)) #12
  %194 = icmp eq i32 %193, 0
  br i1 %194, label %195, label %197

; <label>:195:                                    ; preds = %192
  %196 = load i8*, i8** @progName, align 8
  tail call fastcc void @usage(i8* %196)
  tail call void @exit(i32 0) #13
  unreachable

; <label>:197:                                    ; preds = %192
  %198 = tail call i32 @strncmp(i8* %123, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0), i64 2) #12
  %199 = icmp eq i32 %198, 0
  br i1 %199, label %200, label %205

; <label>:200:                                    ; preds = %197
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %202 = load i8*, i8** @progName, align 8
  %203 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %201, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16, i64 0, i64 0), i8* %202, i8* %123) #14
  %204 = load i8*, i8** @progName, align 8
  tail call fastcc void @usage(i8* %204)
  tail call void @exit(i32 1) #13
  unreachable

; <label>:205:                                    ; preds = %129, %137, %145, %153, %161, %169, %177, %185, %197, %189, %181, %173, %165, %157, %149, %141, %133
  %206 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.2350, i64 0, i32 1
  %.23 = load %struct.zzzz*, %struct.zzzz** %206, align 8
  %207 = icmp eq %struct.zzzz* %.23, null
  br i1 %207, label %._crit_edge52.loopexit, label %.lr.ph51

._crit_edge52.loopexit:                           ; preds = %.lr.ph51, %205
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge52.loopexit, %.preheader32, %.preheader29
  %208 = load i32, i32* @verbosity, align 4
  %209 = icmp sgt i32 %208, 4
  br i1 %209, label %210, label %211

; <label>:210:                                    ; preds = %._crit_edge52
  store i32 4, i32* @verbosity, align 4
  br label %211

; <label>:211:                                    ; preds = %210, %._crit_edge52
  %212 = load i32, i32* @opMode, align 4
  %213 = load i8, i8* @smallMode, align 1
  %notlhs = icmp eq i32 %212, 1
  %notrhs = icmp ne i8 %213, 0
  %or.cond12.not = and i1 %notlhs, %notrhs
  %214 = load i32, i32* @blockSize100k, align 4
  %215 = icmp sgt i32 %214, 2
  %or.cond14 = and i1 %or.cond12.not, %215
  br i1 %or.cond14, label %216, label %217

; <label>:216:                                    ; preds = %211
  store i32 2, i32* @blockSize100k, align 4
  br label %217

; <label>:217:                                    ; preds = %211, %216
  %218 = load i32, i32* @opMode, align 4
  %219 = icmp eq i32 %218, 3
  %220 = load i32, i32* @srcMode, align 4
  %221 = icmp eq i32 %220, 2
  %or.cond16 = and i1 %219, %221
  br i1 %or.cond16, label %222, label %226

; <label>:222:                                    ; preds = %217
  %223 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %224 = load i8*, i8** @progName, align 8
  %225 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %223, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.34, i64 0, i64 0), i8* %224) #14
  tail call void @exit(i32 1) #13
  unreachable

; <label>:226:                                    ; preds = %217
  %227 = load i32, i32* @numFileNames, align 4
  %228 = icmp eq i32 %227, 0
  %or.cond18 = and i1 %221, %228
  br i1 %or.cond18, label %229, label %230

; <label>:229:                                    ; preds = %226
  store i32 1, i32* @srcMode, align 4
  br label %230

; <label>:230:                                    ; preds = %229, %226
  %231 = load i32, i32* @opMode, align 4
  %232 = icmp eq i32 %231, 1
  br i1 %232, label %234, label %233

; <label>:233:                                    ; preds = %230
  store i32 0, i32* @blockSize100k, align 4
  br label %234

; <label>:234:                                    ; preds = %230, %233
  %235 = load i32, i32* @srcMode, align 4
  %236 = icmp eq i32 %235, 3
  br i1 %236, label %237, label %241

; <label>:237:                                    ; preds = %234
  %238 = tail call void (i32)* @signal(i32 2, void (i32)* nonnull @mySignalCatcher) #11
  %239 = tail call void (i32)* @signal(i32 15, void (i32)* nonnull @mySignalCatcher) #11
  %240 = tail call void (i32)* @signal(i32 1, void (i32)* nonnull @mySignalCatcher) #11
  br label %241

; <label>:241:                                    ; preds = %237, %234
  %242 = load i32, i32* @opMode, align 4
  switch i32 %242, label %287 [
    i32 1, label %243
    i32 2, label %263
  ]

; <label>:243:                                    ; preds = %241
  %244 = load i32, i32* @srcMode, align 4
  %245 = icmp eq i32 %244, 1
  br i1 %245, label %247, label %.preheader25

.preheader25:                                     ; preds = %243
  %.3441 = load %struct.zzzz*, %struct.zzzz** %3, align 8
  %246 = icmp eq %struct.zzzz* %.3441, null
  br i1 %246, label %._crit_edge, label %.lr.ph44.preheader

.lr.ph44.preheader:                               ; preds = %.preheader25
  br label %.lr.ph44

; <label>:247:                                    ; preds = %243
  tail call fastcc void @compress(i8* null)
  br label %.loopexit26

.lr.ph44:                                         ; preds = %.lr.ph44.preheader, %260
  %.3443 = phi %struct.zzzz* [ %.34, %260 ], [ %.3441, %.lr.ph44.preheader ]
  %.242 = phi i8 [ %.3, %260 ], [ 1, %.lr.ph44.preheader ]
  %248 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.3443, i64 0, i32 0
  %249 = load i8*, i8** %248, align 8
  %250 = tail call i32 @strcmp(i8* %249, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #12
  %251 = icmp eq i32 %250, 0
  br i1 %251, label %260, label %252

; <label>:252:                                    ; preds = %.lr.ph44
  %253 = load i8, i8* %249, align 1
  %254 = icmp ne i8 %253, 45
  %255 = icmp eq i8 %.242, 0
  %or.cond19 = or i1 %255, %254
  br i1 %or.cond19, label %256, label %260

; <label>:256:                                    ; preds = %252
  %257 = load i32, i32* @numFilesProcessed, align 4
  %258 = add nsw i32 %257, 1
  store i32 %258, i32* @numFilesProcessed, align 4
  %259 = load i8*, i8** %248, align 8
  tail call fastcc void @compress(i8* %259)
  br label %260

; <label>:260:                                    ; preds = %252, %.lr.ph44, %256
  %.3 = phi i8 [ %.242, %256 ], [ 0, %.lr.ph44 ], [ %.242, %252 ]
  %261 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.3443, i64 0, i32 1
  %.34 = load %struct.zzzz*, %struct.zzzz** %261, align 8
  %262 = icmp eq %struct.zzzz* %.34, null
  br i1 %262, label %.loopexit26.loopexit, label %.lr.ph44

; <label>:263:                                    ; preds = %241
  store i8 0, i8* @unzFailsExist, align 1
  %264 = load i32, i32* @srcMode, align 4
  %265 = icmp eq i32 %264, 1
  br i1 %265, label %267, label %.preheader27

.preheader27:                                     ; preds = %263
  %.4545 = load %struct.zzzz*, %struct.zzzz** %3, align 8
  %266 = icmp eq %struct.zzzz* %.4545, null
  br i1 %266, label %.loopexit28, label %.lr.ph48.preheader

.lr.ph48.preheader:                               ; preds = %.preheader27
  br label %.lr.ph48

; <label>:267:                                    ; preds = %263
  tail call fastcc void @uncompress(i8* null)
  br label %.loopexit28

.lr.ph48:                                         ; preds = %.lr.ph48.preheader, %280
  %.4547 = phi %struct.zzzz* [ %.45, %280 ], [ %.4545, %.lr.ph48.preheader ]
  %.446 = phi i8 [ %.5, %280 ], [ 1, %.lr.ph48.preheader ]
  %268 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.4547, i64 0, i32 0
  %269 = load i8*, i8** %268, align 8
  %270 = tail call i32 @strcmp(i8* %269, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #12
  %271 = icmp eq i32 %270, 0
  br i1 %271, label %280, label %272

; <label>:272:                                    ; preds = %.lr.ph48
  %273 = load i8, i8* %269, align 1
  %274 = icmp ne i8 %273, 45
  %275 = icmp eq i8 %.446, 0
  %or.cond20 = or i1 %275, %274
  br i1 %or.cond20, label %276, label %280

; <label>:276:                                    ; preds = %272
  %277 = load i32, i32* @numFilesProcessed, align 4
  %278 = add nsw i32 %277, 1
  store i32 %278, i32* @numFilesProcessed, align 4
  %279 = load i8*, i8** %268, align 8
  tail call fastcc void @uncompress(i8* %279)
  br label %280

; <label>:280:                                    ; preds = %272, %.lr.ph48, %276
  %.5 = phi i8 [ %.446, %276 ], [ 0, %.lr.ph48 ], [ %.446, %272 ]
  %281 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.4547, i64 0, i32 1
  %.45 = load %struct.zzzz*, %struct.zzzz** %281, align 8
  %282 = icmp eq %struct.zzzz* %.45, null
  br i1 %282, label %.loopexit28.loopexit, label %.lr.ph48

.loopexit28.loopexit:                             ; preds = %280
  br label %.loopexit28

.loopexit28:                                      ; preds = %.loopexit28.loopexit, %.preheader27, %267
  %283 = load i8, i8* @unzFailsExist, align 1
  %284 = icmp eq i8 %283, 0
  br i1 %284, label %.loopexit26, label %285

; <label>:285:                                    ; preds = %.loopexit28
  tail call fastcc void @setExit(i32 2)
  %286 = load i32, i32* @exitValue, align 4
  tail call void @exit(i32 %286) #13
  unreachable

; <label>:287:                                    ; preds = %241
  store i8 0, i8* @testFailsExist, align 1
  %288 = load i32, i32* @srcMode, align 4
  %289 = icmp eq i32 %288, 1
  br i1 %289, label %291, label %.preheader

.preheader:                                       ; preds = %287
  %.5637 = load %struct.zzzz*, %struct.zzzz** %3, align 8
  %290 = icmp eq %struct.zzzz* %.5637, null
  br i1 %290, label %.loopexit, label %.lr.ph40.preheader

.lr.ph40.preheader:                               ; preds = %.preheader
  br label %.lr.ph40

; <label>:291:                                    ; preds = %287
  tail call fastcc void @testf(i8* null)
  br label %.loopexit

.lr.ph40:                                         ; preds = %.lr.ph40.preheader, %304
  %.5639 = phi %struct.zzzz* [ %.56, %304 ], [ %.5637, %.lr.ph40.preheader ]
  %.638 = phi i8 [ %.7, %304 ], [ 1, %.lr.ph40.preheader ]
  %292 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.5639, i64 0, i32 0
  %293 = load i8*, i8** %292, align 8
  %294 = tail call i32 @strcmp(i8* %293, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #12
  %295 = icmp eq i32 %294, 0
  br i1 %295, label %304, label %296

; <label>:296:                                    ; preds = %.lr.ph40
  %297 = load i8, i8* %293, align 1
  %298 = icmp ne i8 %297, 45
  %299 = icmp eq i8 %.638, 0
  %or.cond21 = or i1 %299, %298
  br i1 %or.cond21, label %300, label %304

; <label>:300:                                    ; preds = %296
  %301 = load i32, i32* @numFilesProcessed, align 4
  %302 = add nsw i32 %301, 1
  store i32 %302, i32* @numFilesProcessed, align 4
  %303 = load i8*, i8** %292, align 8
  tail call fastcc void @testf(i8* %303)
  br label %304

; <label>:304:                                    ; preds = %296, %.lr.ph40, %300
  %.7 = phi i8 [ %.638, %300 ], [ 0, %.lr.ph40 ], [ %.638, %296 ]
  %305 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.5639, i64 0, i32 1
  %.56 = load %struct.zzzz*, %struct.zzzz** %305, align 8
  %306 = icmp eq %struct.zzzz* %.56, null
  br i1 %306, label %.loopexit.loopexit, label %.lr.ph40

.loopexit.loopexit:                               ; preds = %304
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %291
  %307 = load i8, i8* @testFailsExist, align 1
  %308 = icmp eq i8 %307, 0
  %309 = load i8, i8* @noisy, align 1
  %310 = icmp eq i8 %309, 0
  %or.cond23 = or i1 %308, %310
  br i1 %or.cond23, label %.loopexit26, label %311

; <label>:311:                                    ; preds = %.loopexit
  %312 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %313 = tail call i64 @fwrite(i8* getelementptr inbounds ([113 x i8], [113 x i8]* @.str.35, i64 0, i64 0), i64 112, i64 1, %struct._IO_FILE* %312) #14
  tail call fastcc void @setExit(i32 2)
  %314 = load i32, i32* @exitValue, align 4
  tail call void @exit(i32 %314) #13
  unreachable

.loopexit26.loopexit:                             ; preds = %260
  br label %.loopexit26

.loopexit26:                                      ; preds = %.loopexit26.loopexit, %.loopexit28, %.loopexit, %247
  %.pr = load %struct.zzzz*, %struct.zzzz** %3, align 8
  %315 = icmp eq %struct.zzzz* %.pr, null
  br i1 %315, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.loopexit26
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %323
  %.in = phi %struct.zzzz* [ %318, %323 ], [ %.pr, %.lr.ph.preheader ]
  %316 = bitcast %struct.zzzz* %.in to i8*
  %317 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.in, i64 0, i32 1
  %318 = load %struct.zzzz*, %struct.zzzz** %317, align 8
  %319 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.in, i64 0, i32 0
  %320 = load i8*, i8** %319, align 8
  %321 = icmp eq i8* %320, null
  br i1 %321, label %323, label %322

; <label>:322:                                    ; preds = %.lr.ph
  tail call void @free(i8* nonnull %320) #11
  br label %323

; <label>:323:                                    ; preds = %.lr.ph, %322
  tail call void @free(i8* nonnull %316) #11
  %324 = icmp eq %struct.zzzz* %318, null
  br i1 %324, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %323
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader25, %.loopexit26
  %325 = load i32, i32* @exitValue, align 4
  ret i32 %325
}

; Function Attrs: nounwind
declare void (i32)* @signal(i32, void (i32)*) local_unnamed_addr #1

; Function Attrs: noinline noreturn nounwind uwtable
define internal void @mySIGSEGVorSIGBUScatcher(i32) #2 {
  %2 = load i32, i32* @opMode, align 4
  %3 = icmp eq i32 %2, 1
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = load i8*, i8** @progName, align 8
  br i1 %3, label %6, label %8

; <label>:6:                                      ; preds = %1
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([869 x i8], [869 x i8]* @.str.36, i64 0, i64 0), i8* %5) #14
  br label %10

; <label>:8:                                      ; preds = %1
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([996 x i8], [996 x i8]* @.str.37, i64 0, i64 0), i8* %5) #14
  br label %10

; <label>:10:                                     ; preds = %8, %6
  tail call fastcc void @showFileNames()
  %11 = load i32, i32* @opMode, align 4
  %12 = icmp eq i32 %11, 1
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @cleanUpAndFail(i32 3) #15
  unreachable

; <label>:14:                                     ; preds = %10
  tail call fastcc void @cadvise()
  tail call fastcc void @cleanUpAndFail(i32 2) #15
  unreachable
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @copyFileName(i8*, i8*) unnamed_addr #0 {
  %3 = tail call i64 @strlen(i8* %1) #12
  %4 = icmp ugt i64 %3, 1024
  br i1 %4, label %5, label %9

; <label>:5:                                      ; preds = %2
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([120 x i8], [120 x i8]* @.str.47, i64 0, i64 0), i8* %1, i32 1024) #14
  tail call fastcc void @setExit(i32 1)
  %8 = load i32, i32* @exitValue, align 4
  tail call void @exit(i32 %8) #13
  unreachable

; <label>:9:                                      ; preds = %2
  %10 = tail call i8* @strncpy(i8* %0, i8* %1, i64 1024) #11
  %11 = getelementptr inbounds i8, i8* %0, i64 1024
  store i8 0, i8* %11, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @addFlagsFromEnvVar(%struct.zzzz** nocapture, i8* nocapture readonly) unnamed_addr #0 {
  %3 = tail call i8* @getenv(i8* %1) #11
  %4 = icmp eq i8* %3, null
  br i1 %4, label %.loopexit, label %.preheader6

.preheader6:                                      ; preds = %2
  %5 = load i8, i8* %3, align 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %.loopexit, label %.preheader5.lr.ph

.preheader5.lr.ph:                                ; preds = %.preheader6
  %7 = tail call i16** @__ctype_b_loc() #16
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.lr.ph, %.backedge
  %8 = phi i8* [ %3, %.preheader5.lr.ph ], [ %93, %.backedge ]
  %9 = load i16*, i16** %7, align 8
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader5
  %.1 = phi i8* [ %17, %10 ], [ %8, %.preheader5 ]
  %11 = load i8, i8* %.1, align 1
  %12 = sext i8 %11 to i64
  %13 = getelementptr inbounds i16, i16* %9, i64 %12
  %14 = load i16, i16* %13, align 2
  %15 = and i16 %14, 8192
  %16 = icmp eq i16 %15, 0
  %17 = getelementptr inbounds i8, i8* %.1, i64 1
  br i1 %16, label %.preheader, label %10

.preheader:                                       ; preds = %10
  %18 = load i8, i8* %.1, align 1
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %.backedge, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader
  %20 = load i16*, i16** %7, align 8
  br label %21

; <label>:21:                                     ; preds = %.lr.ph, %29
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %29 ]
  %22 = phi i8 [ %18, %.lr.ph ], [ %32, %29 ]
  %.137 = phi i32 [ 0, %.lr.ph ], [ %30, %29 ]
  %23 = sext i8 %22 to i64
  %24 = getelementptr inbounds i16, i16* %20, i64 %23
  %25 = load i16, i16* %24, align 2
  %26 = and i16 %25, 8192
  %27 = icmp eq i16 %26, 0
  %28 = trunc i64 %indvars.iv to i32
  br i1 %27, label %29, label %.critedge

; <label>:29:                                     ; preds = %21
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %30 = add nuw nsw i32 %.137, 1
  %31 = getelementptr inbounds i8, i8* %.1, i64 %indvars.iv.next
  %32 = load i8, i8* %31, align 1
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %.critedge, label %21

.critedge:                                        ; preds = %21, %29
  %.13.lcssa = phi i32 [ %28, %21 ], [ %30, %29 ]
  %34 = icmp sgt i32 %.13.lcssa, 0
  br i1 %34, label %.lr.ph11.preheader, label %.backedge

.lr.ph11.preheader:                               ; preds = %.critedge
  %35 = icmp slt i32 %.13.lcssa, 1024
  %..13 = select i1 %35, i32 %.13.lcssa, i32 1024
  %36 = sext i32 %..13 to i64
  %37 = icmp sgt i64 %36, 1
  %smax = select i1 %37, i64 %36, i64 1
  %min.iters.check = icmp ult i64 %smax, 32
  br i1 %min.iters.check, label %.lr.ph11.preheader21, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph11.preheader
  %n.vec = and i64 %smax, 9223372036854775776
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph11.preheader21, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %38 = icmp sgt i64 %36, 1
  %smax17 = select i1 %38, i64 %36, i64 1
  %scevgep = getelementptr [1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 %smax17
  %scevgep18 = getelementptr i8, i8* %.1, i64 %smax17
  %bound0 = icmp ugt i8* %scevgep18, getelementptr inbounds ([1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 0)
  %bound1 = icmp ult i8* %.1, %scevgep
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph11.preheader21, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %39 = add nsw i64 %n.vec, -32
  %40 = lshr exact i64 %39, 5
  %41 = add nuw nsw i64 %40, 1
  %xtraiter = and i64 %41, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %42 = getelementptr inbounds i8, i8* %.1, i64 %index.prol
  %43 = bitcast i8* %42 to <16 x i8>*
  %wide.load.prol = load <16 x i8>, <16 x i8>* %43, align 1, !alias.scope !1
  %44 = getelementptr i8, i8* %42, i64 16
  %45 = bitcast i8* %44 to <16 x i8>*
  %wide.load20.prol = load <16 x i8>, <16 x i8>* %45, align 1, !alias.scope !1
  %46 = getelementptr inbounds [1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 %index.prol
  %47 = bitcast i8* %46 to <16 x i8>*
  store <16 x i8> %wide.load.prol, <16 x i8>* %47, align 16, !alias.scope !4, !noalias !1
  %48 = getelementptr i8, i8* %46, i64 16
  %49 = bitcast i8* %48 to <16 x i8>*
  store <16 x i8> %wide.load20.prol, <16 x i8>* %49, align 16, !alias.scope !4, !noalias !1
  %index.next.prol = add i64 %index.prol, 32
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !6

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %50 = icmp ult i64 %39, 96
  br i1 %50, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %51 = getelementptr inbounds i8, i8* %.1, i64 %index
  %52 = bitcast i8* %51 to <16 x i8>*
  %wide.load = load <16 x i8>, <16 x i8>* %52, align 1, !alias.scope !1
  %53 = getelementptr i8, i8* %51, i64 16
  %54 = bitcast i8* %53 to <16 x i8>*
  %wide.load20 = load <16 x i8>, <16 x i8>* %54, align 1, !alias.scope !1
  %55 = getelementptr inbounds [1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 %index
  %56 = bitcast i8* %55 to <16 x i8>*
  store <16 x i8> %wide.load, <16 x i8>* %56, align 16, !alias.scope !4, !noalias !1
  %57 = getelementptr i8, i8* %55, i64 16
  %58 = bitcast i8* %57 to <16 x i8>*
  store <16 x i8> %wide.load20, <16 x i8>* %58, align 16, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 32
  %59 = getelementptr inbounds i8, i8* %.1, i64 %index.next
  %60 = bitcast i8* %59 to <16 x i8>*
  %wide.load.1 = load <16 x i8>, <16 x i8>* %60, align 1, !alias.scope !1
  %61 = getelementptr i8, i8* %59, i64 16
  %62 = bitcast i8* %61 to <16 x i8>*
  %wide.load20.1 = load <16 x i8>, <16 x i8>* %62, align 1, !alias.scope !1
  %63 = getelementptr inbounds [1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 %index.next
  %64 = bitcast i8* %63 to <16 x i8>*
  store <16 x i8> %wide.load.1, <16 x i8>* %64, align 16, !alias.scope !4, !noalias !1
  %65 = getelementptr i8, i8* %63, i64 16
  %66 = bitcast i8* %65 to <16 x i8>*
  store <16 x i8> %wide.load20.1, <16 x i8>* %66, align 16, !alias.scope !4, !noalias !1
  %index.next.1 = add i64 %index, 64
  %67 = getelementptr inbounds i8, i8* %.1, i64 %index.next.1
  %68 = bitcast i8* %67 to <16 x i8>*
  %wide.load.2 = load <16 x i8>, <16 x i8>* %68, align 1, !alias.scope !1
  %69 = getelementptr i8, i8* %67, i64 16
  %70 = bitcast i8* %69 to <16 x i8>*
  %wide.load20.2 = load <16 x i8>, <16 x i8>* %70, align 1, !alias.scope !1
  %71 = getelementptr inbounds [1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 %index.next.1
  %72 = bitcast i8* %71 to <16 x i8>*
  store <16 x i8> %wide.load.2, <16 x i8>* %72, align 16, !alias.scope !4, !noalias !1
  %73 = getelementptr i8, i8* %71, i64 16
  %74 = bitcast i8* %73 to <16 x i8>*
  store <16 x i8> %wide.load20.2, <16 x i8>* %74, align 16, !alias.scope !4, !noalias !1
  %index.next.2 = add i64 %index, 96
  %75 = getelementptr inbounds i8, i8* %.1, i64 %index.next.2
  %76 = bitcast i8* %75 to <16 x i8>*
  %wide.load.3 = load <16 x i8>, <16 x i8>* %76, align 1, !alias.scope !1
  %77 = getelementptr i8, i8* %75, i64 16
  %78 = bitcast i8* %77 to <16 x i8>*
  %wide.load20.3 = load <16 x i8>, <16 x i8>* %78, align 1, !alias.scope !1
  %79 = getelementptr inbounds [1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 %index.next.2
  %80 = bitcast i8* %79 to <16 x i8>*
  store <16 x i8> %wide.load.3, <16 x i8>* %80, align 16, !alias.scope !4, !noalias !1
  %81 = getelementptr i8, i8* %79, i64 16
  %82 = bitcast i8* %81 to <16 x i8>*
  store <16 x i8> %wide.load20.3, <16 x i8>* %82, align 16, !alias.scope !4, !noalias !1
  %index.next.3 = add i64 %index, 128
  %83 = icmp eq i64 %index.next.3, %n.vec
  br i1 %83, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !8

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph11.preheader21

.lr.ph11.preheader21:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph11.preheader
  %indvars.iv14.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph11.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %.lr.ph11.preheader21, %.lr.ph11
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %.lr.ph11 ], [ %indvars.iv14.ph, %.lr.ph11.preheader21 ]
  %84 = getelementptr inbounds i8, i8* %.1, i64 %indvars.iv14
  %85 = load i8, i8* %84, align 1
  %86 = getelementptr inbounds [1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 %indvars.iv14
  store i8 %85, i8* %86, align 1
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %87 = icmp slt i64 %indvars.iv.next15, %36
  br i1 %87, label %.lr.ph11, label %._crit_edge.loopexit, !llvm.loop !11

._crit_edge.loopexit:                             ; preds = %.lr.ph11
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block
  %88 = sext i32 %..13 to i64
  %89 = getelementptr inbounds [1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 %88
  store i8 0, i8* %89, align 1
  %90 = load %struct.zzzz*, %struct.zzzz** %0, align 8
  %91 = tail call fastcc %struct.zzzz* @snocString(%struct.zzzz* %90, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @tmpName, i64 0, i64 0))
  store %struct.zzzz* %91, %struct.zzzz** %0, align 8
  br label %.backedge

.backedge:                                        ; preds = %.preheader, %._crit_edge, %.critedge
  %.13.lcssa16 = phi i32 [ %.13.lcssa, %._crit_edge ], [ %.13.lcssa, %.critedge ], [ 0, %.preheader ]
  %92 = sext i32 %.13.lcssa16 to i64
  %93 = getelementptr inbounds i8, i8* %.1, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = icmp eq i8 %94, 0
  br i1 %95, label %.loopexit.loopexit, label %.preheader5

.loopexit.loopexit:                               ; preds = %.backedge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader6, %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc %struct.zzzz* @snocString(%struct.zzzz*, i8* nocapture) unnamed_addr #0 {
  %3 = icmp eq %struct.zzzz* %0, null
  br i1 %3, label %4, label %.preheader.preheader

.preheader.preheader:                             ; preds = %2
  br label %.preheader

; <label>:4:                                      ; preds = %2
  %5 = tail call fastcc %struct.zzzz* @mkCell()
  %6 = tail call i64 @strlen(i8* %1) #12
  %7 = add i64 %6, 5
  %8 = trunc i64 %7 to i32
  %9 = tail call fastcc i8* @myMalloc(i32 %8)
  %10 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %5, i64 0, i32 0
  store i8* %9, i8** %10, align 8
  %11 = tail call i8* @strcpy(i8* %9, i8* %1) #11
  ret %struct.zzzz* %5

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.01 = phi %struct.zzzz* [ %13, %.preheader ], [ %0, %.preheader.preheader ]
  %12 = getelementptr inbounds %struct.zzzz, %struct.zzzz* %.01, i64 0, i32 1
  %13 = load %struct.zzzz*, %struct.zzzz** %12, align 8
  %14 = icmp eq %struct.zzzz* %13, null
  br i1 %14, label %15, label %.preheader

; <label>:15:                                     ; preds = %.preheader
  %16 = tail call fastcc %struct.zzzz* @snocString(%struct.zzzz* %13, i8* %1)
  store %struct.zzzz* %16, %struct.zzzz** %12, align 8
  ret %struct.zzzz* %0
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i8* @strstr(i8*, i8* nocapture) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @license() unnamed_addr #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i8* @BZ2_bzlibVersion() #11
  %3 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([531 x i8], [531 x i8]* @.str.49, i64 0, i64 0), i8* %2) #14
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @usage(i8*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i8* @BZ2_bzlibVersion() #11
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([1230 x i8], [1230 x i8]* @.str.50, i64 0, i64 0), i8* %3, i8* %0) #14
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @redundant(i8*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = load i8*, i8** @progName, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.51, i64 0, i64 0), i8* %3, i8* %0) #14
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind uwtable
define internal void @mySignalCatcher(i32) #2 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = load i8*, i8** @progName, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.52, i64 0, i64 0), i8* %3) #14
  tail call fastcc void @cleanUpAndFail(i32 1) #15
  unreachable
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @compress(i8*) unnamed_addr #0 {
  %2 = alloca %struct.stat, align 8
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %3 = icmp ne i8* %0, null
  %4 = load i32, i32* @srcMode, align 4
  %5 = icmp eq i32 %4, 1
  %or.cond = or i1 %3, %5
  br i1 %or.cond, label %7, label %6

; <label>:6:                                      ; preds = %1
  tail call fastcc void @panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.53, i64 0, i64 0)) #15
  unreachable

; <label>:7:                                      ; preds = %1
  switch i32 %4, label %11 [
    i32 1, label %8
    i32 3, label %9
    i32 2, label %10
  ]

; <label>:8:                                      ; preds = %7
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.54, i64 0, i64 0))
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.55, i64 0, i64 0))
  br label %11

; <label>:9:                                      ; preds = %7
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %0)
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* %0)
  %strlen = tail call i64 @strlen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0))
  %endptr = getelementptr [1034 x i8], [1034 x i8]* @outName, i64 0, i64 %strlen
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %endptr, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 5, i32 1, i1 false)
  br label %11

; <label>:10:                                     ; preds = %7
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %0)
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.55, i64 0, i64 0))
  br label %11

; <label>:11:                                     ; preds = %10, %9, %8, %7
  %12 = load i32, i32* @srcMode, align 4
  %13 = icmp eq i32 %12, 1
  br i1 %13, label %.preheader, label %14

; <label>:14:                                     ; preds = %11
  %15 = tail call fastcc zeroext i8 @fileExists(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0))
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %17, label %.preheader

; <label>:17:                                     ; preds = %14
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = load i8*, i8** @progName, align 8
  %20 = tail call i32* @__errno_location() #16
  %21 = load i32, i32* %20, align 4
  %22 = tail call i8* @strerror(i32 %21) #11
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.57, i64 0, i64 0), i8* %19, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %22) #14
  tail call fastcc void @setExit(i32 1)
  br label %183

.preheader.114:                                   ; preds = %.preheader
  %24 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @zSuffix, i64 0, i64 1), align 8
  %25 = tail call fastcc zeroext i8 @hasSuffix(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %24)
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %.preheader.215, label %30

.preheader:                                       ; preds = %11, %14
  %27 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @zSuffix, i64 0, i64 0), align 16
  %28 = tail call fastcc zeroext i8 @hasSuffix(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %27)
  %29 = icmp eq i8 %28, 0
  br i1 %29, label %.preheader.114, label %30

; <label>:30:                                     ; preds = %.preheader.316, %.preheader.215, %.preheader.114, %.preheader
  %.lcssa = phi i8* [ %27, %.preheader ], [ %24, %.preheader.114 ], [ %184, %.preheader.215 ], [ %187, %.preheader.316 ]
  %31 = load i8, i8* @noisy, align 1
  %32 = icmp eq i8 %31, 0
  br i1 %32, label %37, label %33

; <label>:33:                                     ; preds = %30
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = load i8*, i8** @progName, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.58, i64 0, i64 0), i8* %35, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %.lcssa) #14
  br label %37

; <label>:37:                                     ; preds = %30, %33
  tail call fastcc void @setExit(i32 1)
  br label %183

; <label>:38:                                     ; preds = %190
  %39 = call i32 @stat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), %struct.stat* nonnull %2) #11
  %40 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 3
  %41 = load i32, i32* %40, align 8
  %42 = and i32 %41, 61440
  %43 = icmp eq i32 %42, 16384
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %38
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = load i8*, i8** @progName, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.59, i64 0, i64 0), i8* %46, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #14
  tail call fastcc void @setExit(i32 1)
  br label %183

; <label>:48:                                     ; preds = %190, %38
  %49 = load i32, i32* @srcMode, align 4
  %50 = icmp eq i32 %49, 3
  %51 = load i8, i8* @forceOverwrite, align 1
  %52 = icmp eq i8 %51, 0
  %or.cond7 = and i1 %50, %52
  br i1 %or.cond7, label %53, label %64

; <label>:53:                                     ; preds = %48
  %54 = tail call fastcc zeroext i8 @notAStandardFile()
  %55 = icmp eq i8 %54, 0
  br i1 %55, label %thread-pre-split, label %56

; <label>:56:                                     ; preds = %53
  %57 = load i8, i8* @noisy, align 1
  %58 = icmp eq i8 %57, 0
  br i1 %58, label %63, label %59

; <label>:59:                                     ; preds = %56
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %61 = load i8*, i8** @progName, align 8
  %62 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.60, i64 0, i64 0), i8* %61, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #14
  br label %63

; <label>:63:                                     ; preds = %56, %59
  tail call fastcc void @setExit(i32 1)
  br label %183

thread-pre-split:                                 ; preds = %53
  %.pr = load i32, i32* @srcMode, align 4
  br label %64

; <label>:64:                                     ; preds = %thread-pre-split, %48
  %65 = phi i32 [ %.pr, %thread-pre-split ], [ %49, %48 ]
  %66 = icmp eq i32 %65, 3
  br i1 %66, label %67, label %79

; <label>:67:                                     ; preds = %64
  %68 = tail call fastcc zeroext i8 @fileExists(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0))
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %79, label %70

; <label>:70:                                     ; preds = %67
  %71 = load i8, i8* @forceOverwrite, align 1
  %72 = icmp eq i8 %71, 0
  br i1 %72, label %75, label %73

; <label>:73:                                     ; preds = %70
  %74 = tail call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0)) #11
  br label %79

; <label>:75:                                     ; preds = %70
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %77 = load i8*, i8** @progName, align 8
  %78 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.61, i64 0, i64 0), i8* %77, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0)) #14
  tail call fastcc void @setExit(i32 1)
  br label %183

; <label>:79:                                     ; preds = %67, %73, %64
  %80 = load i32, i32* @srcMode, align 4
  %81 = icmp eq i32 %80, 3
  %82 = load i8, i8* @forceOverwrite, align 1
  %83 = icmp eq i8 %82, 0
  %or.cond9 = and i1 %81, %83
  br i1 %or.cond9, label %84, label %93

; <label>:84:                                     ; preds = %79
  %85 = tail call fastcc i32 @countHardLinks()
  %86 = icmp sgt i32 %85, 0
  br i1 %86, label %87, label %thread-pre-split10

; <label>:87:                                     ; preds = %84
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %89 = load i8*, i8** @progName, align 8
  %90 = icmp ne i32 %85, 1
  %91 = select i1 %90, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.63, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i64 0, i64 0)
  %92 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %88, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.62, i64 0, i64 0), i8* %89, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i32 %85, i8* %91) #14
  tail call fastcc void @setExit(i32 1)
  br label %183

thread-pre-split10:                               ; preds = %84
  %.pr11 = load i32, i32* @srcMode, align 4
  br label %93

; <label>:93:                                     ; preds = %thread-pre-split10, %79
  %94 = phi i32 [ %.pr11, %thread-pre-split10 ], [ %80, %79 ]
  %95 = icmp eq i32 %94, 3
  br i1 %95, label %96, label %97

; <label>:96:                                     ; preds = %93
  tail call fastcc void @saveInputFileMetaInfo()
  br label %97

; <label>:97:                                     ; preds = %96, %93
  %98 = load i32, i32* @srcMode, align 4
  switch i32 %98, label %163 [
    i32 1, label %99
    i32 2, label %112
    i32 3, label %138
  ]

; <label>:99:                                     ; preds = %97
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %102 = tail call i32 @fileno(%struct._IO_FILE* %101) #11
  %103 = tail call i32 @isatty(i32 %102) #11
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %164, label %105

; <label>:105:                                    ; preds = %99
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %107 = load i8*, i8** @progName, align 8
  %108 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %106, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.64, i64 0, i64 0), i8* %107) #14
  %109 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %110 = load i8*, i8** @progName, align 8
  %111 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %109, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.65, i64 0, i64 0), i8* %110, i8* %110) #14
  tail call fastcc void @setExit(i32 1)
  br label %183

; <label>:112:                                    ; preds = %97
  %113 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i64 0, i64 0))
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %115 = tail call i32 @fileno(%struct._IO_FILE* %114) #11
  %116 = tail call i32 @isatty(i32 %115) #11
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %129, label %118

; <label>:118:                                    ; preds = %112
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %120 = load i8*, i8** @progName, align 8
  %121 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %119, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.64, i64 0, i64 0), i8* %120) #14
  %122 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %123 = load i8*, i8** @progName, align 8
  %124 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %122, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.65, i64 0, i64 0), i8* %123, i8* %123) #14
  %125 = icmp eq %struct._IO_FILE* %113, null
  br i1 %125, label %128, label %126

; <label>:126:                                    ; preds = %118
  %127 = tail call i32 @fclose(%struct._IO_FILE* nonnull %113)
  br label %128

; <label>:128:                                    ; preds = %118, %126
  tail call fastcc void @setExit(i32 1)
  br label %183

; <label>:129:                                    ; preds = %112
  %130 = icmp eq %struct._IO_FILE* %113, null
  br i1 %130, label %131, label %164

; <label>:131:                                    ; preds = %129
  %132 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %133 = load i8*, i8** @progName, align 8
  %134 = tail call i32* @__errno_location() #16
  %135 = load i32, i32* %134, align 4
  %136 = tail call i8* @strerror(i32 %135) #11
  %137 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %132, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.57, i64 0, i64 0), i8* %133, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %136) #14
  tail call fastcc void @setExit(i32 1)
  br label %183

; <label>:138:                                    ; preds = %97
  %139 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i64 0, i64 0))
  %140 = tail call fastcc %struct._IO_FILE* @fopen_output_safely()
  %141 = icmp eq %struct._IO_FILE* %140, null
  br i1 %141, label %142, label %153

; <label>:142:                                    ; preds = %138
  %143 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %144 = load i8*, i8** @progName, align 8
  %145 = tail call i32* @__errno_location() #16
  %146 = load i32, i32* %145, align 4
  %147 = tail call i8* @strerror(i32 %146) #11
  %148 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %143, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.68, i64 0, i64 0), i8* %144, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* %147) #14
  %149 = icmp eq %struct._IO_FILE* %139, null
  br i1 %149, label %152, label %150

; <label>:150:                                    ; preds = %142
  %151 = tail call i32 @fclose(%struct._IO_FILE* nonnull %139)
  br label %152

; <label>:152:                                    ; preds = %142, %150
  tail call fastcc void @setExit(i32 1)
  br label %183

; <label>:153:                                    ; preds = %138
  %154 = icmp eq %struct._IO_FILE* %139, null
  br i1 %154, label %155, label %164

; <label>:155:                                    ; preds = %153
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %157 = load i8*, i8** @progName, align 8
  %158 = tail call i32* @__errno_location() #16
  %159 = load i32, i32* %158, align 4
  %160 = tail call i8* @strerror(i32 %159) #11
  %161 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %156, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.57, i64 0, i64 0), i8* %157, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %160) #14
  %162 = tail call i32 @fclose(%struct._IO_FILE* nonnull %140)
  tail call fastcc void @setExit(i32 1)
  br label %183

; <label>:163:                                    ; preds = %97
  tail call fastcc void @panic(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.69, i64 0, i64 0)) #15
  unreachable

; <label>:164:                                    ; preds = %153, %129, %99
  %.02 = phi %struct._IO_FILE* [ %101, %99 ], [ %114, %129 ], [ %140, %153 ]
  %.01 = phi %struct._IO_FILE* [ %100, %99 ], [ %113, %129 ], [ %139, %153 ]
  %165 = load i32, i32* @verbosity, align 4
  %166 = icmp sgt i32 %165, 0
  br i1 %166, label %167, label %172

; <label>:167:                                    ; preds = %164
  %168 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %169 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %168, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.70, i64 0, i64 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #14
  tail call fastcc void @pad()
  %170 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %171 = tail call i32 @fflush(%struct._IO_FILE* %170)
  br label %172

; <label>:172:                                    ; preds = %167, %164
  store %struct._IO_FILE* %.02, %struct._IO_FILE** @outputHandleJustInCase, align 8
  store i8 1, i8* @deleteOutputOnInterrupt, align 1
  tail call fastcc void @compressStream(%struct._IO_FILE* %.01, %struct._IO_FILE* %.02)
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %173 = load i32, i32* @srcMode, align 4
  %174 = icmp eq i32 %173, 3
  br i1 %174, label %175, label %182

; <label>:175:                                    ; preds = %172
  tail call fastcc void @applySavedTimeInfoToOutputFile()
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %176 = load i8, i8* @keepInputFiles, align 1
  %177 = icmp eq i8 %176, 0
  br i1 %177, label %178, label %182

; <label>:178:                                    ; preds = %175
  %179 = tail call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #11
  %180 = icmp eq i32 %179, 0
  br i1 %180, label %182, label %181

; <label>:181:                                    ; preds = %178
  tail call fastcc void @ioError() #15
  unreachable

; <label>:182:                                    ; preds = %175, %178, %172
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  br label %183

; <label>:183:                                    ; preds = %182, %155, %152, %131, %128, %105, %87, %75, %63, %44, %37, %17
  ret void

.preheader.215:                                   ; preds = %.preheader.114
  %184 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @zSuffix, i64 0, i64 2), align 16
  %185 = tail call fastcc zeroext i8 @hasSuffix(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %184)
  %186 = icmp eq i8 %185, 0
  br i1 %186, label %.preheader.316, label %30

.preheader.316:                                   ; preds = %.preheader.215
  %187 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @zSuffix, i64 0, i64 3), align 8
  %188 = tail call fastcc zeroext i8 @hasSuffix(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %187)
  %189 = icmp eq i8 %188, 0
  br i1 %189, label %190, label %30

; <label>:190:                                    ; preds = %.preheader.316
  %191 = load i32, i32* @srcMode, align 4
  %192 = and i32 %191, -2
  %switch = icmp eq i32 %192, 2
  br i1 %switch, label %38, label %48
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @uncompress(i8*) unnamed_addr #0 {
  %2 = alloca %struct.stat, align 8
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %3 = icmp ne i8* %0, null
  %4 = load i32, i32* @srcMode, align 4
  %5 = icmp eq i32 %4, 1
  %or.cond = or i1 %3, %5
  br i1 %or.cond, label %7, label %6

; <label>:6:                                      ; preds = %1
  tail call fastcc void @panic(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.79, i64 0, i64 0)) #15
  unreachable

; <label>:7:                                      ; preds = %1
  switch i32 %4, label %.loopexit [
    i32 1, label %8
    i32 3, label %14
    i32 2, label %19
  ]

; <label>:8:                                      ; preds = %7
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.54, i64 0, i64 0))
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.55, i64 0, i64 0))
  br label %.loopexit

; <label>:9:                                      ; preds = %14
  %10 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @zSuffix, i64 0, i64 1), align 8
  %11 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @unzSuffix, i64 0, i64 1), align 8
  %12 = tail call fastcc zeroext i8 @mapSuffix(i8* %10, i8* %11)
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %199, label %.loopexit

; <label>:14:                                     ; preds = %7
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %0)
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* %0)
  %15 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @zSuffix, i64 0, i64 0), align 16
  %16 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @unzSuffix, i64 0, i64 0), align 16
  %17 = tail call fastcc zeroext i8 @mapSuffix(i8* %15, i8* %16)
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %9, label %.loopexit

; <label>:19:                                     ; preds = %7
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %0)
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.55, i64 0, i64 0))
  br label %.loopexit

.loopexit:                                        ; preds = %14, %9, %199, %204, %7, %8, %209, %19
  %.1 = phi i8 [ 0, %7 ], [ 0, %19 ], [ 1, %209 ], [ 0, %8 ], [ 0, %204 ], [ 0, %199 ], [ 0, %9 ], [ 0, %14 ]
  %20 = load i32, i32* @srcMode, align 4
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %32, label %22

; <label>:22:                                     ; preds = %.loopexit
  %23 = tail call fastcc zeroext i8 @fileExists(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0))
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %25, label %32

; <label>:25:                                     ; preds = %22
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = load i8*, i8** @progName, align 8
  %28 = tail call i32* @__errno_location() #16
  %29 = load i32, i32* %28, align 4
  %30 = tail call i8* @strerror(i32 %29) #11
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.57, i64 0, i64 0), i8* %27, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %30) #14
  tail call fastcc void @setExit(i32 1)
  br label %198

; <label>:32:                                     ; preds = %22, %.loopexit
  %33 = load i32, i32* @srcMode, align 4
  %34 = and i32 %33, -2
  %switch = icmp eq i32 %34, 2
  br i1 %switch, label %35, label %45

; <label>:35:                                     ; preds = %32
  %36 = call i32 @stat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), %struct.stat* nonnull %2) #11
  %37 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 3
  %38 = load i32, i32* %37, align 8
  %39 = and i32 %38, 61440
  %40 = icmp eq i32 %39, 16384
  br i1 %40, label %41, label %45

; <label>:41:                                     ; preds = %35
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = load i8*, i8** @progName, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.59, i64 0, i64 0), i8* %43, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #14
  tail call fastcc void @setExit(i32 1)
  br label %198

; <label>:45:                                     ; preds = %32, %35
  %46 = load i32, i32* @srcMode, align 4
  %47 = icmp eq i32 %46, 3
  %48 = load i8, i8* @forceOverwrite, align 1
  %49 = icmp eq i8 %48, 0
  %or.cond8 = and i1 %47, %49
  br i1 %or.cond8, label %50, label %61

; <label>:50:                                     ; preds = %45
  %51 = tail call fastcc zeroext i8 @notAStandardFile()
  %52 = icmp eq i8 %51, 0
  br i1 %52, label %61, label %53

; <label>:53:                                     ; preds = %50
  %54 = load i8, i8* @noisy, align 1
  %55 = icmp eq i8 %54, 0
  br i1 %55, label %60, label %56

; <label>:56:                                     ; preds = %53
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = load i8*, i8** @progName, align 8
  %59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.60, i64 0, i64 0), i8* %58, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #14
  br label %60

; <label>:60:                                     ; preds = %53, %56
  tail call fastcc void @setExit(i32 1)
  br label %198

; <label>:61:                                     ; preds = %50, %45
  %62 = icmp eq i8 %.1, 0
  %63 = load i8, i8* @noisy, align 1
  %64 = icmp eq i8 %63, 0
  %or.cond12 = or i1 %62, %64
  br i1 %or.cond12, label %69, label %65

; <label>:65:                                     ; preds = %61
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %67 = load i8*, i8** @progName, align 8
  %68 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %66, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.81, i64 0, i64 0), i8* %67, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0)) #14
  br label %69

; <label>:69:                                     ; preds = %65, %61
  %70 = load i32, i32* @srcMode, align 4
  %71 = icmp eq i32 %70, 3
  br i1 %71, label %72, label %84

; <label>:72:                                     ; preds = %69
  %73 = tail call fastcc zeroext i8 @fileExists(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0))
  %74 = icmp eq i8 %73, 0
  br i1 %74, label %84, label %75

; <label>:75:                                     ; preds = %72
  %76 = load i8, i8* @forceOverwrite, align 1
  %77 = icmp eq i8 %76, 0
  br i1 %77, label %80, label %78

; <label>:78:                                     ; preds = %75
  %79 = tail call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0)) #11
  br label %84

; <label>:80:                                     ; preds = %75
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %82 = load i8*, i8** @progName, align 8
  %83 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.61, i64 0, i64 0), i8* %82, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0)) #14
  tail call fastcc void @setExit(i32 1)
  br label %198

; <label>:84:                                     ; preds = %72, %78, %69
  %85 = load i32, i32* @srcMode, align 4
  %86 = icmp eq i32 %85, 3
  %87 = load i8, i8* @forceOverwrite, align 1
  %88 = icmp eq i8 %87, 0
  %or.cond10 = and i1 %86, %88
  br i1 %or.cond10, label %89, label %98

; <label>:89:                                     ; preds = %84
  %90 = tail call fastcc i32 @countHardLinks()
  %91 = icmp sgt i32 %90, 0
  br i1 %91, label %92, label %thread-pre-split

; <label>:92:                                     ; preds = %89
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %94 = load i8*, i8** @progName, align 8
  %95 = icmp ne i32 %90, 1
  %96 = select i1 %95, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.63, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i64 0, i64 0)
  %97 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.62, i64 0, i64 0), i8* %94, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i32 %90, i8* %96) #14
  tail call fastcc void @setExit(i32 1)
  br label %198

thread-pre-split:                                 ; preds = %89
  %.pr = load i32, i32* @srcMode, align 4
  br label %98

; <label>:98:                                     ; preds = %thread-pre-split, %84
  %99 = phi i32 [ %.pr, %thread-pre-split ], [ %85, %84 ]
  %100 = icmp eq i32 %99, 3
  br i1 %100, label %101, label %102

; <label>:101:                                    ; preds = %98
  tail call fastcc void @saveInputFileMetaInfo()
  br label %102

; <label>:102:                                    ; preds = %101, %98
  %103 = load i32, i32* @srcMode, align 4
  switch i32 %103, label %154 [
    i32 1, label %104
    i32 2, label %117
    i32 3, label %129
  ]

; <label>:104:                                    ; preds = %102
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %107 = tail call i32 @fileno(%struct._IO_FILE* %105) #11
  %108 = tail call i32 @isatty(i32 %107) #11
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %155, label %110

; <label>:110:                                    ; preds = %104
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %112 = load i8*, i8** @progName, align 8
  %113 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %111, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.82, i64 0, i64 0), i8* %112) #14
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %115 = load i8*, i8** @progName, align 8
  %116 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %114, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.65, i64 0, i64 0), i8* %115, i8* %115) #14
  tail call fastcc void @setExit(i32 1)
  br label %198

; <label>:117:                                    ; preds = %102
  %118 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i64 0, i64 0))
  %119 = icmp eq %struct._IO_FILE* %118, null
  br i1 %119, label %120, label %127

; <label>:120:                                    ; preds = %117
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %122 = load i8*, i8** @progName, align 8
  %123 = tail call i32* @__errno_location() #16
  %124 = load i32, i32* %123, align 4
  %125 = tail call i8* @strerror(i32 %124) #11
  %126 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %121, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.83, i64 0, i64 0), i8* %122, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %125) #14
  tail call fastcc void @setExit(i32 1)
  br label %198

; <label>:127:                                    ; preds = %117
  %128 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  br label %155

; <label>:129:                                    ; preds = %102
  %130 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i64 0, i64 0))
  %131 = tail call fastcc %struct._IO_FILE* @fopen_output_safely()
  %132 = icmp eq %struct._IO_FILE* %131, null
  br i1 %132, label %133, label %144

; <label>:133:                                    ; preds = %129
  %134 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %135 = load i8*, i8** @progName, align 8
  %136 = tail call i32* @__errno_location() #16
  %137 = load i32, i32* %136, align 4
  %138 = tail call i8* @strerror(i32 %137) #11
  %139 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %134, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.68, i64 0, i64 0), i8* %135, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* %138) #14
  %140 = icmp eq %struct._IO_FILE* %130, null
  br i1 %140, label %143, label %141

; <label>:141:                                    ; preds = %133
  %142 = tail call i32 @fclose(%struct._IO_FILE* nonnull %130)
  br label %143

; <label>:143:                                    ; preds = %133, %141
  tail call fastcc void @setExit(i32 1)
  br label %198

; <label>:144:                                    ; preds = %129
  %145 = icmp eq %struct._IO_FILE* %130, null
  br i1 %145, label %146, label %155

; <label>:146:                                    ; preds = %144
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %148 = load i8*, i8** @progName, align 8
  %149 = tail call i32* @__errno_location() #16
  %150 = load i32, i32* %149, align 4
  %151 = tail call i8* @strerror(i32 %150) #11
  %152 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %147, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.57, i64 0, i64 0), i8* %148, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %151) #14
  %153 = tail call i32 @fclose(%struct._IO_FILE* nonnull %131)
  tail call fastcc void @setExit(i32 1)
  br label %198

; <label>:154:                                    ; preds = %102
  tail call fastcc void @panic(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.84, i64 0, i64 0)) #15
  unreachable

; <label>:155:                                    ; preds = %144, %104, %127
  %.02 = phi %struct._IO_FILE* [ %128, %127 ], [ %106, %104 ], [ %131, %144 ]
  %.01 = phi %struct._IO_FILE* [ %118, %127 ], [ %105, %104 ], [ %130, %144 ]
  %156 = load i32, i32* @verbosity, align 4
  %157 = icmp sgt i32 %156, 0
  br i1 %157, label %158, label %163

; <label>:158:                                    ; preds = %155
  %159 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %160 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %159, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.70, i64 0, i64 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #14
  tail call fastcc void @pad()
  %161 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %162 = tail call i32 @fflush(%struct._IO_FILE* %161)
  br label %163

; <label>:163:                                    ; preds = %158, %155
  store %struct._IO_FILE* %.02, %struct._IO_FILE** @outputHandleJustInCase, align 8
  store i8 1, i8* @deleteOutputOnInterrupt, align 1
  %164 = tail call fastcc zeroext i8 @uncompressStream(%struct._IO_FILE* %.01, %struct._IO_FILE* %.02)
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %165 = icmp eq i8 %164, 0
  br i1 %165, label %176, label %166

; <label>:166:                                    ; preds = %163
  %167 = load i32, i32* @srcMode, align 4
  %168 = icmp eq i32 %167, 3
  br i1 %168, label %169, label %183

; <label>:169:                                    ; preds = %166
  tail call fastcc void @applySavedTimeInfoToOutputFile()
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %170 = load i8, i8* @keepInputFiles, align 1
  %171 = icmp eq i8 %170, 0
  br i1 %171, label %172, label %183

; <label>:172:                                    ; preds = %169
  %173 = tail call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #11
  %174 = icmp eq i32 %173, 0
  br i1 %174, label %183, label %175

; <label>:175:                                    ; preds = %172
  tail call fastcc void @ioError() #15
  unreachable

; <label>:176:                                    ; preds = %163
  store i8 1, i8* @unzFailsExist, align 1
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %177 = load i32, i32* @srcMode, align 4
  %178 = icmp eq i32 %177, 3
  br i1 %178, label %179, label %189

; <label>:179:                                    ; preds = %176
  %180 = tail call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0)) #11
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %189, label %182

; <label>:182:                                    ; preds = %179
  tail call fastcc void @ioError() #15
  unreachable

; <label>:183:                                    ; preds = %166, %172, %169
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %184 = load i32, i32* @verbosity, align 4
  %185 = icmp sgt i32 %184, 0
  br i1 %185, label %186, label %198

; <label>:186:                                    ; preds = %183
  %187 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %188 = tail call i64 @fwrite(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.85, i64 0, i64 0), i64 5, i64 1, %struct._IO_FILE* %187) #14
  br label %198

; <label>:189:                                    ; preds = %179, %176
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  tail call fastcc void @setExit(i32 2)
  %190 = load i32, i32* @verbosity, align 4
  %191 = icmp sgt i32 %190, 0
  %192 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %191, label %193, label %195

; <label>:193:                                    ; preds = %189
  %194 = tail call i64 @fwrite(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.86, i64 0, i64 0), i64 18, i64 1, %struct._IO_FILE* %192) #14
  br label %198

; <label>:195:                                    ; preds = %189
  %196 = load i8*, i8** @progName, align 8
  %197 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %192, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.87, i64 0, i64 0), i8* %196, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #14
  br label %198

; <label>:198:                                    ; preds = %193, %195, %183, %186, %146, %143, %120, %110, %92, %80, %60, %41, %25
  ret void

; <label>:199:                                    ; preds = %9
  %200 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @zSuffix, i64 0, i64 2), align 16
  %201 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @unzSuffix, i64 0, i64 2), align 16
  %202 = tail call fastcc zeroext i8 @mapSuffix(i8* %200, i8* %201)
  %203 = icmp eq i8 %202, 0
  br i1 %203, label %204, label %.loopexit

; <label>:204:                                    ; preds = %199
  %205 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @zSuffix, i64 0, i64 3), align 8
  %206 = load i8*, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @unzSuffix, i64 0, i64 3), align 8
  %207 = tail call fastcc zeroext i8 @mapSuffix(i8* %205, i8* %206)
  %208 = icmp eq i8 %207, 0
  br i1 %208, label %209, label %.loopexit

; <label>:209:                                    ; preds = %204
  %strlen = tail call i64 @strlen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0))
  %endptr = getelementptr [1034 x i8], [1034 x i8]* @outName, i64 0, i64 %strlen
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %endptr, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.80, i64 0, i64 0), i64 5, i32 1, i1 false)
  br label %.loopexit
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @setExit(i32) unnamed_addr #5 {
  %2 = load i32, i32* @exitValue, align 4
  %3 = icmp slt i32 %2, %0
  br i1 %3, label %4, label %5

; <label>:4:                                      ; preds = %1
  store i32 %0, i32* @exitValue, align 4
  br label %5

; <label>:5:                                      ; preds = %4, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @testf(i8*) unnamed_addr #0 {
  %2 = alloca %struct.stat, align 8
  store i8 0, i8* @deleteOutputOnInterrupt, align 1
  %3 = icmp ne i8* %0, null
  %4 = load i32, i32* @srcMode, align 4
  %5 = icmp eq i32 %4, 1
  %or.cond = or i1 %3, %5
  br i1 %or.cond, label %7, label %6

; <label>:6:                                      ; preds = %1
  tail call fastcc void @panic(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.94, i64 0, i64 0)) #15
  unreachable

; <label>:7:                                      ; preds = %1
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0))
  %8 = load i32, i32* @srcMode, align 4
  switch i32 %8, label %thread-pre-split [
    i32 1, label %9
    i32 3, label %10
    i32 2, label %11
  ]

; <label>:9:                                      ; preds = %7
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.54, i64 0, i64 0))
  br label %thread-pre-splitthread-pre-split

; <label>:10:                                     ; preds = %7
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %0)
  br label %thread-pre-splitthread-pre-split

; <label>:11:                                     ; preds = %7
  tail call fastcc void @copyFileName(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %0)
  br label %thread-pre-splitthread-pre-split

thread-pre-splitthread-pre-split:                 ; preds = %11, %10, %9
  %.pr = load i32, i32* @srcMode, align 4
  br label %thread-pre-split

thread-pre-split:                                 ; preds = %thread-pre-splitthread-pre-split, %7
  %12 = phi i32 [ %.pr, %thread-pre-splitthread-pre-split ], [ %8, %7 ]
  %13 = icmp eq i32 %12, 1
  br i1 %13, label %.thread8, label %14

; <label>:14:                                     ; preds = %thread-pre-split
  %15 = tail call fastcc zeroext i8 @fileExists(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0))
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %17, label %24

; <label>:17:                                     ; preds = %14
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = load i8*, i8** @progName, align 8
  %20 = tail call i32* @__errno_location() #16
  %21 = load i32, i32* %20, align 4
  %22 = tail call i8* @strerror(i32 %21) #11
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.95, i64 0, i64 0), i8* %19, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %22) #14
  tail call fastcc void @setExit(i32 1)
  br label %78

; <label>:24:                                     ; preds = %14
  %.pr5 = load i32, i32* @srcMode, align 4
  %25 = icmp eq i32 %.pr5, 1
  br i1 %25, label %.thread8, label %26

; <label>:26:                                     ; preds = %24
  %27 = call i32 @stat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), %struct.stat* nonnull %2) #11
  %28 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 3
  %29 = load i32, i32* %28, align 8
  %30 = and i32 %29, 61440
  %31 = icmp eq i32 %30, 16384
  br i1 %31, label %32, label %.thread

; <label>:32:                                     ; preds = %26
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = load i8*, i8** @progName, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.59, i64 0, i64 0), i8* %34, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #14
  tail call fastcc void @setExit(i32 1)
  br label %78

.thread:                                          ; preds = %26
  %.pr7.pr = load i32, i32* @srcMode, align 4
  switch i32 %.pr7.pr, label %59 [
    i32 1, label %.thread8
    i32 2, label %49
    i32 3, label %49
  ]

.thread8:                                         ; preds = %thread-pre-split, %24, %.thread
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %37 = tail call i32 @fileno(%struct._IO_FILE* %36) #11
  %38 = tail call i32 @isatty(i32 %37) #11
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %47, label %40

; <label>:40:                                     ; preds = %.thread8
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = load i8*, i8** @progName, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.82, i64 0, i64 0), i8* %42) #14
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = load i8*, i8** @progName, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.65, i64 0, i64 0), i8* %45, i8* %45) #14
  tail call fastcc void @setExit(i32 1)
  br label %78

; <label>:47:                                     ; preds = %.thread8
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  br label %60

; <label>:49:                                     ; preds = %.thread, %.thread
  %50 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i64 0, i64 0))
  %51 = icmp eq %struct._IO_FILE* %50, null
  br i1 %51, label %52, label %60

; <label>:52:                                     ; preds = %49
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %54 = load i8*, i8** @progName, align 8
  %55 = tail call i32* @__errno_location() #16
  %56 = load i32, i32* %55, align 4
  %57 = tail call i8* @strerror(i32 %56) #11
  %58 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.83, i64 0, i64 0), i8* %54, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* %57) #14
  tail call fastcc void @setExit(i32 1)
  br label %78

; <label>:59:                                     ; preds = %.thread
  tail call fastcc void @panic(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.96, i64 0, i64 0)) #15
  unreachable

; <label>:60:                                     ; preds = %49, %47
  %.0 = phi %struct._IO_FILE* [ %48, %47 ], [ %50, %49 ]
  %61 = load i32, i32* @verbosity, align 4
  %62 = icmp sgt i32 %61, 0
  br i1 %62, label %63, label %68

; <label>:63:                                     ; preds = %60
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %65 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.70, i64 0, i64 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #14
  tail call fastcc void @pad()
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %67 = tail call i32 @fflush(%struct._IO_FILE* %66)
  br label %68

; <label>:68:                                     ; preds = %63, %60
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %69 = tail call fastcc zeroext i8 @testStream(%struct._IO_FILE* %.0)
  %70 = icmp ne i8 %69, 0
  %71 = load i32, i32* @verbosity, align 4
  %72 = icmp sgt i32 %71, 0
  %or.cond3 = and i1 %70, %72
  br i1 %or.cond3, label %.thread9, label %75

.thread9:                                         ; preds = %68
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %74 = tail call i64 @fwrite(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.97, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE* %73) #14
  br label %78

; <label>:75:                                     ; preds = %68
  %76 = icmp eq i8 %69, 0
  br i1 %76, label %77, label %78

; <label>:77:                                     ; preds = %75
  store i8 1, i8* @testFailsExist, align 1
  br label %78

; <label>:78:                                     ; preds = %.thread9, %75, %77, %52, %40, %32, %17
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @showFileNames() unnamed_addr #0 {
  %1 = load i8, i8* @noisy, align 1
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %6, label %3

; <label>:3:                                      ; preds = %0
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0)) #14
  br label %6

; <label>:6:                                      ; preds = %0, %3
  ret void
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @cleanUpAndFail(i32) unnamed_addr #2 {
  %2 = alloca %struct.stat, align 8
  %3 = load i32, i32* @srcMode, align 4
  %4 = icmp ne i32 %3, 3
  %5 = load i32, i32* @opMode, align 4
  %6 = icmp eq i32 %5, 3
  %or.cond = or i1 %4, %6
  %7 = load i8, i8* @deleteOutputOnInterrupt, align 1
  %8 = icmp eq i8 %7, 0
  %or.cond3 = or i1 %or.cond, %8
  br i1 %or.cond3, label %44, label %9

; <label>:9:                                      ; preds = %1
  %10 = call i32 @stat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), %struct.stat* nonnull %2) #11
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %31

; <label>:12:                                     ; preds = %9
  %13 = load i8, i8* @noisy, align 1
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %19, label %15

; <label>:15:                                     ; preds = %12
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = load i8*, i8** @progName, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.39, i64 0, i64 0), i8* %17, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0)) #14
  br label %19

; <label>:19:                                     ; preds = %12, %15
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %21 = icmp eq %struct._IO_FILE* %20, null
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %19
  %23 = tail call i32 @fclose(%struct._IO_FILE* nonnull %20)
  br label %24

; <label>:24:                                     ; preds = %19, %22
  %25 = tail call i32 @remove(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0)) #11
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %44, label %27

; <label>:27:                                     ; preds = %24
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = load i8*, i8** @progName, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.40, i64 0, i64 0), i8* %29) #14
  br label %44

; <label>:31:                                     ; preds = %9
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = load i8*, i8** @progName, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.41, i64 0, i64 0), i8* %33) #14
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = load i8*, i8** @progName, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.42, i64 0, i64 0), i8* %36) #14
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = load i8*, i8** @progName, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.43, i64 0, i64 0), i8* %39, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0)) #14
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = load i8*, i8** @progName, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.44, i64 0, i64 0), i8* %42) #14
  br label %44

; <label>:44:                                     ; preds = %31, %24, %27, %1
  %45 = load i8, i8* @noisy, align 1
  %46 = icmp ne i8 %45, 0
  %47 = load i32, i32* @numFileNames, align 4
  %48 = icmp sgt i32 %47, 0
  %or.cond5 = and i1 %46, %48
  br i1 %or.cond5, label %49, label %57

; <label>:49:                                     ; preds = %44
  %50 = load i32, i32* @numFilesProcessed, align 4
  %51 = icmp sgt i32 %47, %50
  br i1 %51, label %52, label %57

; <label>:52:                                     ; preds = %49
  %53 = sub nsw i32 %47, %50
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = load i8*, i8** @progName, align 8
  %56 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([110 x i8], [110 x i8]* @.str.45, i64 0, i64 0), i8* %55, i8* %55, i32 %47, i32 %53) #14
  br label %57

; <label>:57:                                     ; preds = %44, %52, %49
  tail call fastcc void @setExit(i32 %0)
  %58 = load i32, i32* @exitValue, align 4
  tail call void @exit(i32 %58) #13
  unreachable
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @cadvise() unnamed_addr #0 {
  %1 = load i8, i8* @noisy, align 1
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %6, label %3

; <label>:3:                                      ; preds = %0
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([241 x i8], [241 x i8]* @.str.46, i64 0, i64 0), i64 240, i64 1, %struct._IO_FILE* %4) #14
  br label %6

; <label>:6:                                      ; preds = %0, %3
  ret void
}

; Function Attrs: nounwind
declare i32 @stat(i8* nocapture readonly, %struct.stat* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @remove(i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8* nocapture readonly, i64) local_unnamed_addr #1

; Function Attrs: nounwind readonly
declare i8* @getenv(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() local_unnamed_addr #6

; Function Attrs: noinline nounwind uwtable
define internal fastcc noalias %struct.zzzz* @mkCell() unnamed_addr #0 {
  %1 = tail call fastcc i8* @myMalloc(i32 16)
  %2 = bitcast i8* %1 to %struct.zzzz*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 16, i32 8, i1 false)
  ret %struct.zzzz* %2
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc noalias i8* @myMalloc(i32) unnamed_addr #0 {
  %2 = sext i32 %0 to i64
  %3 = tail call noalias i8* @malloc(i64 %2) #11
  %4 = icmp eq i8* %3, null
  br i1 %4, label %5, label %6

; <label>:5:                                      ; preds = %1
  tail call fastcc void @outOfMemory() #15
  unreachable

; <label>:6:                                      ; preds = %1
  ret i8* %3
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @outOfMemory() unnamed_addr #2 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = load i8*, i8** @progName, align 8
  %3 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.48, i64 0, i64 0), i8* %2) #14
  tail call fastcc void @showFileNames()
  tail call fastcc void @cleanUpAndFail(i32 1) #15
  unreachable
}

declare i8* @BZ2_bzlibVersion() local_unnamed_addr #7

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @panic(i8*) unnamed_addr #2 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = load i8*, i8** @progName, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([109 x i8], [109 x i8]* @.str.71, i64 0, i64 0), i8* %3, i8* %0) #14
  tail call fastcc void @showFileNames()
  tail call fastcc void @cleanUpAndFail(i32 3) #15
  unreachable
}

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc zeroext i8 @fileExists(i8* nocapture readonly) unnamed_addr #0 {
  %2 = tail call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i64 0, i64 0))
  %3 = icmp ne %struct._IO_FILE* %2, null
  %4 = zext i1 %3 to i8
  %5 = icmp eq %struct._IO_FILE* %2, null
  br i1 %5, label %8, label %6

; <label>:6:                                      ; preds = %1
  %7 = tail call i32 @fclose(%struct._IO_FILE* nonnull %2)
  br label %8

; <label>:8:                                      ; preds = %1, %6
  ret i8 %4
}

; Function Attrs: nounwind
declare i8* @strerror(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare i32* @__errno_location() local_unnamed_addr #6

; Function Attrs: noinline nounwind readonly uwtable
define internal fastcc zeroext i8 @hasSuffix(i8* nocapture readonly, i8* nocapture readonly) unnamed_addr #8 {
  %3 = tail call i64 @strlen(i8* %0) #12
  %4 = trunc i64 %3 to i32
  %5 = tail call i64 @strlen(i8* %1) #12
  %6 = trunc i64 %5 to i32
  %7 = icmp slt i32 %4, %6
  br i1 %7, label %16, label %8

; <label>:8:                                      ; preds = %2
  %sext = shl i64 %3, 32
  %9 = ashr exact i64 %sext, 32
  %10 = getelementptr inbounds i8, i8* %0, i64 %9
  %sext1 = shl i64 %5, 32
  %11 = ashr exact i64 %sext1, 32
  %12 = sub nsw i64 0, %11
  %13 = getelementptr inbounds i8, i8* %10, i64 %12
  %14 = tail call i32 @strcmp(i8* %13, i8* %1) #12
  %15 = icmp eq i32 %14, 0
  %. = zext i1 %15 to i8
  br label %16

; <label>:16:                                     ; preds = %8, %2
  %.0 = phi i8 [ 0, %2 ], [ %., %8 ]
  ret i8 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc zeroext i8 @notAStandardFile() unnamed_addr #0 {
  %1 = alloca %struct.stat, align 8
  %2 = call i32 @lstat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), %struct.stat* nonnull %1) #11
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %8

; <label>:4:                                      ; preds = %0
  %5 = getelementptr inbounds %struct.stat, %struct.stat* %1, i64 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 61440
  %not. = icmp ne i32 %7, 32768
  %. = zext i1 %not. to i8
  br label %8

; <label>:8:                                      ; preds = %4, %0
  %.0 = phi i8 [ 1, %0 ], [ %., %4 ]
  ret i8 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @countHardLinks() unnamed_addr #0 {
  %1 = alloca %struct.stat, align 8
  %2 = call i32 @lstat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), %struct.stat* nonnull %1) #11
  %3 = icmp eq i32 %2, 0
  %4 = getelementptr inbounds %struct.stat, %struct.stat* %1, i64 0, i32 2
  %5 = load i64, i64* %4, align 8
  %6 = add i64 %5, 4294967295
  %7 = trunc i64 %6 to i32
  %.0 = select i1 %3, i32 %7, i32 0
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @saveInputFileMetaInfo() unnamed_addr #0 {
  %1 = tail call i32 @stat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0), %struct.stat* nonnull @fileMetaInfo) #11
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %4, label %3

; <label>:3:                                      ; preds = %0
  tail call fastcc void @ioError() #15
  unreachable

; <label>:4:                                      ; preds = %0
  ret void
}

; Function Attrs: nounwind
declare i32 @isatty(i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc noalias %struct._IO_FILE* @fopen_output_safely() unnamed_addr #0 {
  %1 = tail call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i32 193, i32 384) #11
  %2 = icmp eq i32 %1, -1
  br i1 %2, label %8, label %3

; <label>:3:                                      ; preds = %0
  %4 = tail call %struct._IO_FILE* @fdopen(i32 %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.67, i64 0, i64 0)) #11
  %5 = icmp eq %struct._IO_FILE* %4, null
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %3
  %7 = tail call i32 @close(i32 %1) #11
  br label %8

; <label>:8:                                      ; preds = %3, %6, %0
  %.0 = phi %struct._IO_FILE* [ null, %0 ], [ null, %6 ], [ %4, %3 ]
  ret %struct._IO_FILE* %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @pad() unnamed_addr #0 {
  %1 = tail call i64 @strlen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #12
  %2 = trunc i64 %1 to i32
  %3 = load i32, i32* @longestFileName, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %0
  %5 = load i32, i32* @longestFileName, align 4
  %6 = tail call i64 @strlen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #12
  %7 = trunc i64 %6 to i32
  %8 = icmp sgt i32 %5, %7
  br i1 %8, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.01 = phi i32 [ %10, %.lr.ph ], [ 1, %.lr.ph.preheader ]
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 32, %struct._IO_FILE* %9) #14
  %10 = add nuw nsw i32 %.01, 1
  %11 = load i32, i32* @longestFileName, align 4
  %12 = tail call i64 @strlen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #12
  %13 = trunc i64 %12 to i32
  %14 = sub nsw i32 %11, %13
  %15 = icmp slt i32 %.01, %14
  br i1 %15, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %0
  ret void
}

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @compressStream(%struct._IO_FILE* nocapture, %struct._IO_FILE*) unnamed_addr #0 {
  %3 = alloca [5000 x i8], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [32 x i8], align 16
  %11 = alloca [32 x i8], align 16
  %12 = alloca %struct.UInt64, align 1
  %13 = alloca %struct.UInt64, align 1
  %14 = tail call i32 @ferror(%struct._IO_FILE* %0) #11
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %.loopexit

; <label>:16:                                     ; preds = %2
  %17 = tail call i32 @ferror(%struct._IO_FILE* %1) #11
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %.loopexit

; <label>:19:                                     ; preds = %16
  %20 = load i32, i32* @blockSize100k, align 4
  %21 = load i32, i32* @verbosity, align 4
  %22 = load i32, i32* @workFactor, align 4
  %23 = call i8* @BZ2_bzWriteOpen(i32* nonnull %8, %struct._IO_FILE* %1, i32 %20, i32 %21, i32 %22) #11
  %24 = load i32, i32* %8, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %.loopexit2

; <label>:26:                                     ; preds = %19
  %27 = load i32, i32* @verbosity, align 4
  %28 = icmp sgt i32 %27, 1
  br i1 %28, label %29, label %.preheader

; <label>:29:                                     ; preds = %26
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %30) #14
  br label %.preheader

.preheader:                                       ; preds = %29, %26
  %31 = getelementptr inbounds [5000 x i8], [5000 x i8]* %3, i64 0, i64 0
  br label %32

; <label>:32:                                     ; preds = %.preheader, %43
  %33 = call fastcc zeroext i8 @myfeof(%struct._IO_FILE* %0)
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %35, label %46

; <label>:35:                                     ; preds = %32
  %36 = call i64 @fread(i8* nonnull %31, i64 1, i64 5000, %struct._IO_FILE* %0)
  %37 = trunc i64 %36 to i32
  %38 = call i32 @ferror(%struct._IO_FILE* %0) #11
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %.loopexit.loopexit

; <label>:40:                                     ; preds = %35
  %41 = icmp sgt i32 %37, 0
  br i1 %41, label %42, label %43

; <label>:42:                                     ; preds = %40
  call void @BZ2_bzWrite(i32* nonnull %8, i8* %23, i8* nonnull %31, i32 %37) #11
  br label %43

; <label>:43:                                     ; preds = %42, %40
  %44 = load i32, i32* %8, align 4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %32, label %.loopexit2.loopexit

; <label>:46:                                     ; preds = %32
  call void @BZ2_bzWriteClose64(i32* nonnull %8, i8* %23, i32 0, i32* nonnull %4, i32* nonnull %5, i32* nonnull %6, i32* nonnull %7) #11
  %47 = load i32, i32* %8, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %.loopexit2

; <label>:49:                                     ; preds = %46
  %50 = call i32 @ferror(%struct._IO_FILE* %1) #11
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %.loopexit

; <label>:52:                                     ; preds = %49
  %53 = call i32 @fflush(%struct._IO_FILE* %1)
  %54 = icmp eq i32 %53, -1
  br i1 %54, label %.loopexit, label %55

; <label>:55:                                     ; preds = %52
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %57 = icmp eq %struct._IO_FILE* %56, %1
  br i1 %57, label %64, label %58

; <label>:58:                                     ; preds = %55
  %59 = call i32 @fileno(%struct._IO_FILE* %1) #11
  %60 = icmp slt i32 %59, 0
  br i1 %60, label %.loopexit, label %61

; <label>:61:                                     ; preds = %58
  call fastcc void @applySavedFileAttrToOutputFile(i32 %59)
  %62 = call i32 @fclose(%struct._IO_FILE* %1)
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %63 = icmp eq i32 %62, -1
  br i1 %63, label %.loopexit, label %64

; <label>:64:                                     ; preds = %61, %55
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %65 = call i32 @ferror(%struct._IO_FILE* %0) #11
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %.loopexit

; <label>:67:                                     ; preds = %64
  %68 = call i32 @fclose(%struct._IO_FILE* %0)
  %69 = icmp eq i32 %68, -1
  br i1 %69, label %.loopexit, label %70

; <label>:70:                                     ; preds = %67
  %71 = load i32, i32* @verbosity, align 4
  %72 = icmp sgt i32 %71, 0
  br i1 %72, label %73, label %96

; <label>:73:                                     ; preds = %70
  %74 = load i32, i32* %4, align 4
  %75 = load i32, i32* %5, align 4
  %76 = or i32 %75, %74
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %81

; <label>:78:                                     ; preds = %73
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %80 = call i64 @fwrite(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.74, i64 0, i64 0), i64 21, i64 1, %struct._IO_FILE* %79) #14
  br label %96

; <label>:81:                                     ; preds = %73
  call fastcc void @uInt64_from_UInt32s(%struct.UInt64* nonnull %12, i32 %74, i32 %75)
  %82 = load i32, i32* %6, align 4
  %83 = load i32, i32* %7, align 4
  call fastcc void @uInt64_from_UInt32s(%struct.UInt64* nonnull %13, i32 %82, i32 %83)
  %84 = call fastcc double @uInt64_to_double(%struct.UInt64* nonnull %12)
  %85 = call fastcc double @uInt64_to_double(%struct.UInt64* nonnull %13)
  %86 = getelementptr inbounds [32 x i8], [32 x i8]* %10, i64 0, i64 0
  call fastcc void @uInt64_toAscii(i8* nonnull %86, %struct.UInt64* nonnull %12)
  %87 = getelementptr inbounds [32 x i8], [32 x i8]* %11, i64 0, i64 0
  call fastcc void @uInt64_toAscii(i8* nonnull %87, %struct.UInt64* nonnull %13)
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %89 = fdiv double %84, %85
  %90 = fmul double %85, 8.000000e+00
  %91 = fdiv double %90, %84
  %92 = fdiv double %85, %84
  %93 = fsub double 1.000000e+00, %92
  %94 = fmul double %93, 1.000000e+02
  %95 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %88, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.75, i64 0, i64 0), double %89, double %91, double %94, i8* nonnull %86, i8* nonnull %87) #14
  br label %96

; <label>:96:                                     ; preds = %78, %81, %70
  ret void

.loopexit2.loopexit:                              ; preds = %43
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %46, %19
  call void @BZ2_bzWriteClose64(i32* nonnull %9, i8* %23, i32 1, i32* nonnull %4, i32* nonnull %5, i32* nonnull %6, i32* nonnull %7) #11
  %97 = load i32, i32* %8, align 4
  switch i32 %97, label %100 [
    i32 -9, label %98
    i32 -3, label %99
    i32 -6, label %.loopexit
  ]

; <label>:98:                                     ; preds = %.loopexit2
  call fastcc void @configError() #15
  unreachable

; <label>:99:                                     ; preds = %.loopexit2
  call fastcc void @outOfMemory() #15
  unreachable

.loopexit.loopexit:                               ; preds = %35
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.loopexit2, %67, %64, %61, %58, %52, %49, %16, %2
  call fastcc void @ioError() #15
  unreachable

; <label>:100:                                    ; preds = %.loopexit2
  call fastcc void @panic(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.76, i64 0, i64 0)) #15
  unreachable
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @applySavedTimeInfoToOutputFile() unnamed_addr #0 {
  %1 = alloca %struct.utimbuf, align 8
  %2 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @fileMetaInfo, i64 0, i32 11, i32 0), align 8
  %3 = getelementptr inbounds %struct.utimbuf, %struct.utimbuf* %1, i64 0, i32 0
  store i64 %2, i64* %3, align 8
  %4 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @fileMetaInfo, i64 0, i32 12, i32 0), align 8
  %5 = getelementptr inbounds %struct.utimbuf, %struct.utimbuf* %1, i64 0, i32 1
  store i64 %4, i64* %5, align 8
  %6 = call i32 @utime(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), %struct.utimbuf* nonnull %1) #11
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %9, label %8

; <label>:8:                                      ; preds = %0
  tail call fastcc void @ioError() #15
  unreachable

; <label>:9:                                      ; preds = %0
  ret void
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @ioError() unnamed_addr #2 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = load i8*, i8** @progName, align 8
  %3 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.78, i64 0, i64 0), i8* %2) #14
  %4 = load i8*, i8** @progName, align 8
  tail call void @perror(i8* %4) #14
  tail call fastcc void @showFileNames()
  tail call fastcc void @cleanUpAndFail(i32 1) #15
  unreachable
}

; Function Attrs: nounwind
declare i32 @lstat(i8* nocapture readonly, %struct.stat* nocapture) local_unnamed_addr #1

declare i32 @open(i8* nocapture readonly, i32, ...) local_unnamed_addr #7

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fdopen(i32, i8* nocapture readonly) local_unnamed_addr #1

declare i32 @close(i32) local_unnamed_addr #7

; Function Attrs: nounwind readonly
declare i32 @ferror(%struct._IO_FILE* nocapture) local_unnamed_addr #3

declare i8* @BZ2_bzWriteOpen(i32*, %struct._IO_FILE*, i32, i32, i32) local_unnamed_addr #7

; Function Attrs: noinline nounwind uwtable
define internal fastcc zeroext i8 @myfeof(%struct._IO_FILE* nocapture) unnamed_addr #0 {
  %2 = tail call i32 @fgetc(%struct._IO_FILE* %0)
  %3 = icmp eq i32 %2, -1
  br i1 %3, label %6, label %4

; <label>:4:                                      ; preds = %1
  %5 = tail call i32 @ungetc(i32 %2, %struct._IO_FILE* %0)
  br label %6

; <label>:6:                                      ; preds = %1, %4
  %.0 = phi i8 [ 0, %4 ], [ 1, %1 ]
  ret i8 %.0
}

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #1

declare void @BZ2_bzWrite(i32*, i8*, i8*, i32) local_unnamed_addr #7

declare void @BZ2_bzWriteClose64(i32*, i8*, i32, i32*, i32*, i32*, i32*) local_unnamed_addr #7

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @applySavedFileAttrToOutputFile(i32) unnamed_addr #0 {
  %2 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @fileMetaInfo, i64 0, i32 3), align 8
  %3 = tail call i32 @fchmod(i32 %0, i32 %2) #11
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

; <label>:5:                                      ; preds = %1
  tail call fastcc void @ioError() #15
  unreachable

; <label>:6:                                      ; preds = %1
  %7 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @fileMetaInfo, i64 0, i32 4), align 4
  %8 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @fileMetaInfo, i64 0, i32 5), align 8
  %9 = tail call i32 @fchown(i32 %0, i32 %7, i32 %8) #11
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @uInt64_from_UInt32s(%struct.UInt64* nocapture, i32, i32) unnamed_addr #5 {
  %4 = lshr i32 %2, 24
  %5 = trunc i32 %4 to i8
  %6 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 7
  store i8 %5, i8* %6, align 1
  %7 = lshr i32 %2, 16
  %8 = trunc i32 %7 to i8
  %9 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 6
  store i8 %8, i8* %9, align 1
  %10 = lshr i32 %2, 8
  %11 = trunc i32 %10 to i8
  %12 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 5
  store i8 %11, i8* %12, align 1
  %13 = trunc i32 %2 to i8
  %14 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 4
  store i8 %13, i8* %14, align 1
  %15 = lshr i32 %1, 24
  %16 = trunc i32 %15 to i8
  %17 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 3
  store i8 %16, i8* %17, align 1
  %18 = lshr i32 %1, 16
  %19 = trunc i32 %18 to i8
  %20 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 2
  store i8 %19, i8* %20, align 1
  %21 = lshr i32 %1, 8
  %22 = trunc i32 %21 to i8
  %23 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 1
  store i8 %22, i8* %23, align 1
  %24 = trunc i32 %1 to i8
  %25 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 0
  store i8 %24, i8* %25, align 1
  ret void
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc double @uInt64_to_double(%struct.UInt64* nocapture readonly) unnamed_addr #9 {
  %2 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 0
  %3 = load i8, i8* %2, align 1
  %4 = uitofp i8 %3 to double
  %5 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 1
  %6 = load i8, i8* %5, align 1
  %7 = uitofp i8 %6 to double
  %8 = fmul double %7, 2.560000e+02
  %9 = fadd double %4, %8
  %10 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 2
  %11 = load i8, i8* %10, align 1
  %12 = uitofp i8 %11 to double
  %13 = fmul double %12, 6.553600e+04
  %14 = fadd double %9, %13
  %15 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 3
  %16 = load i8, i8* %15, align 1
  %17 = uitofp i8 %16 to double
  %18 = fmul double %17, 0x4170000000000000
  %19 = fadd double %14, %18
  %20 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 4
  %21 = load i8, i8* %20, align 1
  %22 = uitofp i8 %21 to double
  %23 = fmul double %22, 0x41F0000000000000
  %24 = fadd double %19, %23
  %25 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 5
  %26 = load i8, i8* %25, align 1
  %27 = uitofp i8 %26 to double
  %28 = fmul double %27, 0x4270000000000000
  %29 = fadd double %24, %28
  %30 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 6
  %31 = load i8, i8* %30, align 1
  %32 = uitofp i8 %31 to double
  %33 = fmul double %32, 0x42F0000000000000
  %34 = fadd double %29, %33
  %35 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 7
  %36 = load i8, i8* %35, align 1
  %37 = uitofp i8 %36 to double
  %38 = fmul double %37, 0x4370000000000000
  %39 = fadd double %34, %38
  ret double %39
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @uInt64_toAscii(i8* nocapture, %struct.UInt64* nocapture readonly) unnamed_addr #5 {
  %3 = alloca [32 x i8], align 16
  %4 = alloca i64, align 8
  %tmpcast = bitcast i64* %4 to %struct.UInt64*
  %5 = bitcast %struct.UInt64* %1 to i64*
  %6 = load i64, i64* %5, align 1
  store i64 %6, i64* %4, align 8
  br label %7

; <label>:7:                                      ; preds = %7, %2
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %7 ], [ 0, %2 ]
  %8 = call fastcc i32 @uInt64_qrm10(%struct.UInt64* nonnull %tmpcast)
  %9 = add nsw i32 %8, 48
  %10 = trunc i32 %9 to i8
  %11 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 %indvars.iv3
  store i8 %10, i8* %11, align 1
  %indvars.iv.next4 = add nuw i64 %indvars.iv3, 1
  %12 = call fastcc zeroext i8 @uInt64_isZero(%struct.UInt64* nonnull %tmpcast)
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %7, label %14

; <label>:14:                                     ; preds = %7
  %15 = trunc i64 %indvars.iv3 to i32
  %sext = shl i64 %indvars.iv.next4, 32
  %16 = ashr exact i64 %sext, 32
  %17 = getelementptr inbounds i8, i8* %0, i64 %16
  store i8 0, i8* %17, align 1
  %18 = icmp slt i32 %15, 0
  br i1 %18, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %14
  %19 = add i32 %15, 1
  %xtraiter = and i32 %19, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %20 = sub i64 %indvars.iv3, %indvars.iv.prol
  %sext9 = shl i64 %20, 32
  %21 = ashr exact i64 %sext9, 32
  %22 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = getelementptr inbounds i8, i8* %0, i64 %indvars.iv.prol
  store i8 %23, i8* %24, align 1
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !12

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %25 = icmp ult i32 %15, 3
  br i1 %25, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.3 = zext i32 %19 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %26 = sub i64 %indvars.iv3, %indvars.iv
  %sext5 = shl i64 %26, 32
  %27 = ashr exact i64 %sext5, 32
  %28 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = getelementptr inbounds i8, i8* %0, i64 %indvars.iv
  store i8 %29, i8* %30, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = sub i64 %indvars.iv3, %indvars.iv.next
  %sext6 = shl i64 %31, 32
  %32 = ashr exact i64 %sext6, 32
  %33 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 %32
  %34 = load i8, i8* %33, align 1
  %35 = getelementptr inbounds i8, i8* %0, i64 %indvars.iv.next
  store i8 %34, i8* %35, align 1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %36 = sub i64 %indvars.iv3, %indvars.iv.next.1
  %sext7 = shl i64 %36, 32
  %37 = ashr exact i64 %sext7, 32
  %38 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 %37
  %39 = load i8, i8* %38, align 1
  %40 = getelementptr inbounds i8, i8* %0, i64 %indvars.iv.next.1
  store i8 %39, i8* %40, align 1
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %41 = sub i64 %indvars.iv3, %indvars.iv.next.2
  %sext8 = shl i64 %41, 32
  %42 = ashr exact i64 %sext8, 32
  %43 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = getelementptr inbounds i8, i8* %0, i64 %indvars.iv.next.2
  store i8 %44, i8* %45, align 1
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %14
  ret void
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @configError() unnamed_addr #2 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([236 x i8], [236 x i8]* @.str.77, i64 0, i64 0), i64 235, i64 1, %struct._IO_FILE* %1) #14
  tail call fastcc void @setExit(i32 3)
  %3 = load i32, i32* @exitValue, align 4
  tail call void @exit(i32 %3) #13
  unreachable
}

; Function Attrs: nounwind
declare i32 @fgetc(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @ungetc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fchmod(i32, i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fchown(i32, i32, i32) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #10

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @uInt64_qrm10(%struct.UInt64* nocapture) unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 7
  %3 = load i8, i8* %2, align 1
  %div = udiv i8 %3, 10
  store i8 %div, i8* %2, align 1
  %4 = urem i8 %3, 10
  %5 = zext i8 %4 to i32
  %6 = shl nuw nsw i32 %5, 8
  %7 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 6
  %8 = load i8, i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = or i32 %9, %6
  %11 = udiv i32 %10, 10
  %12 = trunc i32 %11 to i8
  store i8 %12, i8* %7, align 1
  %13 = urem i32 %10, 10
  %14 = shl nuw nsw i32 %13, 8
  %15 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 5
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = or i32 %17, %14
  %19 = udiv i32 %18, 10
  %20 = trunc i32 %19 to i8
  store i8 %20, i8* %15, align 1
  %21 = urem i32 %18, 10
  %22 = shl nuw nsw i32 %21, 8
  %23 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 4
  %24 = load i8, i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = or i32 %25, %22
  %27 = udiv i32 %26, 10
  %28 = trunc i32 %27 to i8
  store i8 %28, i8* %23, align 1
  %29 = urem i32 %26, 10
  %30 = shl nuw nsw i32 %29, 8
  %31 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 3
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = or i32 %33, %30
  %35 = udiv i32 %34, 10
  %36 = trunc i32 %35 to i8
  store i8 %36, i8* %31, align 1
  %37 = urem i32 %34, 10
  %38 = shl nuw nsw i32 %37, 8
  %39 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 2
  %40 = load i8, i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = or i32 %41, %38
  %43 = udiv i32 %42, 10
  %44 = trunc i32 %43 to i8
  store i8 %44, i8* %39, align 1
  %45 = urem i32 %42, 10
  %46 = shl nuw nsw i32 %45, 8
  %47 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 1
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = or i32 %49, %46
  %51 = udiv i32 %50, 10
  %52 = trunc i32 %51 to i8
  store i8 %52, i8* %47, align 1
  %53 = urem i32 %50, 10
  %54 = shl nuw nsw i32 %53, 8
  %55 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 0
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = or i32 %57, %54
  %59 = udiv i32 %58, 10
  %60 = trunc i32 %59 to i8
  store i8 %60, i8* %55, align 1
  %61 = urem i32 %58, 10
  ret i32 %61
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc zeroext i8 @uInt64_isZero(%struct.UInt64* nocapture readonly) unnamed_addr #9 {
  %2 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 0
  %3 = load i8, i8* %2, align 1
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %5, label %9

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 1
  %7 = load i8, i8* %6, align 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %10, label %9

; <label>:9:                                      ; preds = %26, %22, %18, %14, %10, %5, %1
  ret i8 0

; <label>:10:                                     ; preds = %5
  %11 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 2
  %12 = load i8, i8* %11, align 1
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %14, label %9

; <label>:14:                                     ; preds = %10
  %15 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 3
  %16 = load i8, i8* %15, align 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %18, label %9

; <label>:18:                                     ; preds = %14
  %19 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 4
  %20 = load i8, i8* %19, align 1
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %22, label %9

; <label>:22:                                     ; preds = %18
  %23 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 5
  %24 = load i8, i8* %23, align 1
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %26, label %9

; <label>:26:                                     ; preds = %22
  %27 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 6
  %28 = load i8, i8* %27, align 1
  %29 = icmp eq i8 %28, 0
  br i1 %29, label %30, label %9

; <label>:30:                                     ; preds = %26
  %31 = getelementptr inbounds %struct.UInt64, %struct.UInt64* %0, i64 0, i32 0, i64 7
  %32 = load i8, i8* %31, align 1
  %33 = icmp eq i8 %32, 0
  %. = zext i1 %33 to i8
  ret i8 %.
}

; Function Attrs: nounwind
declare i32 @utime(i8* nocapture readonly, %struct.utimbuf* nocapture readonly) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @perror(i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc zeroext i8 @mapSuffix(i8* nocapture readonly, i8* nocapture readonly) unnamed_addr #0 {
  %3 = tail call fastcc zeroext i8 @hasSuffix(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* %0)
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %11, label %5

; <label>:5:                                      ; preds = %2
  %6 = tail call i64 @strlen(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0)) #12
  %7 = tail call i64 @strlen(i8* %0) #12
  %8 = sub i64 %6, %7
  %9 = getelementptr inbounds [1034 x i8], [1034 x i8]* @outName, i64 0, i64 %8
  store i8 0, i8* %9, align 1
  %10 = tail call i8* @strcat(i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @outName, i64 0, i64 0), i8* %1) #11
  br label %11

; <label>:11:                                     ; preds = %2, %5
  %.0 = phi i8 [ 1, %5 ], [ 0, %2 ]
  ret i8 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc zeroext i8 @uncompressStream(%struct._IO_FILE*, %struct._IO_FILE* nocapture) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [5000 x i8], align 16
  %6 = alloca [5000 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store i32 0, i32* %7, align 4
  %9 = tail call i32 @ferror(%struct._IO_FILE* %1) #11
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.loopexit7

; <label>:11:                                     ; preds = %2
  %12 = tail call i32 @ferror(%struct._IO_FILE* %0) #11
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %.preheader, label %.loopexit7

.preheader:                                       ; preds = %11
  %14 = load i32, i32* @verbosity, align 4
  %15 = load i8, i8* @smallMode, align 1
  %16 = zext i8 %15 to i32
  %17 = getelementptr inbounds [5000 x i8], [5000 x i8]* %6, i64 0, i64 0
  %18 = load i32, i32* %7, align 4
  %19 = call i8* @BZ2_bzReadOpen(i32* nonnull %3, %struct._IO_FILE* %0, i32 %14, i32 %16, i8* nonnull %17, i32 %18) #11
  %20 = icmp ne i8* %19, null
  %21 = load i32, i32* %3, align 4
  %22 = icmp eq i32 %21, 0
  %or.cond33 = and i1 %20, %22
  br i1 %or.cond33, label %.lr.ph35, label %.loopexit8

.lr.ph35:                                         ; preds = %.preheader
  %23 = getelementptr inbounds [5000 x i8], [5000 x i8]* %5, i64 0, i64 0
  br label %24

; <label>:24:                                     ; preds = %.lr.ph35, %.backedge
  %25 = phi i8* [ %19, %.lr.ph35 ], [ %70, %.backedge ]
  %.0234 = phi i32 [ 0, %.lr.ph35 ], [ %26, %.backedge ]
  %26 = add nuw nsw i32 %.0234, 1
  br label %27

; <label>:27:                                     ; preds = %40, %24
  %28 = load i32, i32* %3, align 4
  switch i32 %28, label %.loopexit8.loopexit [
    i32 0, label %29
    i32 4, label %43
  ]

; <label>:29:                                     ; preds = %27
  %30 = call i32 @BZ2_bzRead(i32* nonnull %3, i8* nonnull %25, i8* nonnull %23, i32 5000) #11
  %31 = load i32, i32* %3, align 4
  %32 = icmp eq i32 %31, -5
  br i1 %32, label %104, label %33

; <label>:33:                                     ; preds = %29
  %34 = or i32 %31, 4
  %35 = icmp eq i32 %34, 4
  %36 = icmp sgt i32 %30, 0
  %or.cond6 = and i1 %36, %35
  br i1 %or.cond6, label %37, label %40

; <label>:37:                                     ; preds = %33
  %38 = sext i32 %30 to i64
  %39 = call i64 @fwrite(i8* nonnull %23, i64 1, i64 %38, %struct._IO_FILE* %1)
  br label %40

; <label>:40:                                     ; preds = %33, %37
  %41 = call i32 @ferror(%struct._IO_FILE* %1) #11
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %27, label %.loopexit7.loopexit88

; <label>:43:                                     ; preds = %27
  call void @BZ2_bzReadGetUnused(i32* nonnull %3, i8* nonnull %25, i8** nonnull %8, i32* nonnull %7) #11
  %44 = load i32, i32* %3, align 4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %47, label %46

; <label>:46:                                     ; preds = %43
  call fastcc void @panic(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.88, i64 0, i64 0)) #15
  unreachable

; <label>:47:                                     ; preds = %43
  %48 = load i8*, i8** %8, align 8
  %49 = load i32, i32* %7, align 4
  %50 = icmp sgt i32 %49, 0
  br i1 %50, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %47
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %51 = getelementptr inbounds i8, i8* %48, i64 %indvars.iv
  %52 = load i8, i8* %51, align 1
  %53 = getelementptr inbounds [5000 x i8], [5000 x i8]* %6, i64 0, i64 %indvars.iv
  store i8 %52, i8* %53, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %54 = load i32, i32* %7, align 4
  %55 = sext i32 %54 to i64
  %56 = icmp slt i64 %indvars.iv.next, %55
  br i1 %56, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %47
  call void @BZ2_bzReadClose(i32* nonnull %3, i8* nonnull %25) #11
  %57 = load i32, i32* %3, align 4
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %60, label %59

; <label>:59:                                     ; preds = %._crit_edge
  call fastcc void @panic(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.88, i64 0, i64 0)) #15
  unreachable

; <label>:60:                                     ; preds = %._crit_edge
  %61 = load i32, i32* %7, align 4
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %.backedge

; <label>:63:                                     ; preds = %60
  %64 = call fastcc zeroext i8 @myfeof(%struct._IO_FILE* %0)
  %65 = icmp eq i8 %64, 0
  br i1 %65, label %.backedge, label %.loopexit.loopexit89

.backedge:                                        ; preds = %63, %60
  %66 = load i32, i32* @verbosity, align 4
  %67 = load i8, i8* @smallMode, align 1
  %68 = zext i8 %67 to i32
  %69 = load i32, i32* %7, align 4
  %70 = call i8* @BZ2_bzReadOpen(i32* nonnull %3, %struct._IO_FILE* %0, i32 %66, i32 %68, i8* nonnull %17, i32 %69) #11
  %71 = icmp ne i8* %70, null
  %72 = load i32, i32* %3, align 4
  %73 = icmp eq i32 %72, 0
  %or.cond = and i1 %71, %73
  br i1 %or.cond, label %24, label %.loopexit8.loopexit90

.loopexit.loopexit:                               ; preds = %108
  br label %.loopexit

.loopexit.loopexit89:                             ; preds = %63
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit89, %.loopexit.loopexit
  %74 = call i32 @ferror(%struct._IO_FILE* %0) #11
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %.loopexit7

; <label>:76:                                     ; preds = %.loopexit
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %78 = icmp eq %struct._IO_FILE* %77, %1
  br i1 %78, label %83, label %79

; <label>:79:                                     ; preds = %76
  %80 = call i32 @fileno(%struct._IO_FILE* %1) #11
  %81 = icmp slt i32 %80, 0
  br i1 %81, label %.loopexit7, label %82

; <label>:82:                                     ; preds = %79
  call fastcc void @applySavedFileAttrToOutputFile(i32 %80)
  br label %83

; <label>:83:                                     ; preds = %76, %82
  %84 = call i32 @fclose(%struct._IO_FILE* %0)
  %85 = icmp eq i32 %84, -1
  br i1 %85, label %.loopexit7, label %86

; <label>:86:                                     ; preds = %83
  %87 = call i32 @ferror(%struct._IO_FILE* %1) #11
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %89, label %.loopexit7

; <label>:89:                                     ; preds = %86
  %90 = call i32 @fflush(%struct._IO_FILE* %1)
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %.loopexit7

; <label>:92:                                     ; preds = %89
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %94 = icmp eq %struct._IO_FILE* %93, %1
  br i1 %94, label %98, label %95

; <label>:95:                                     ; preds = %92
  %96 = call i32 @fclose(%struct._IO_FILE* %1)
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %97 = icmp eq i32 %96, -1
  br i1 %97, label %.loopexit7, label %98

; <label>:98:                                     ; preds = %95, %92
  store %struct._IO_FILE* null, %struct._IO_FILE** @outputHandleJustInCase, align 8
  %99 = load i32, i32* @verbosity, align 4
  %100 = icmp sgt i32 %99, 1
  br i1 %100, label %101, label %150

; <label>:101:                                    ; preds = %98
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %103 = call i64 @fwrite(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.89, i64 0, i64 0), i64 5, i64 1, %struct._IO_FILE* %102) #14
  br label %150

; <label>:104:                                    ; preds = %29
  %105 = load i8, i8* @forceOverwrite, align 1
  %106 = icmp eq i8 %105, 0
  br i1 %106, label %.loopexit8, label %107

; <label>:107:                                    ; preds = %104
  call void @rewind(%struct._IO_FILE* %0)
  br label %108

; <label>:108:                                    ; preds = %121, %107
  %109 = call fastcc zeroext i8 @myfeof(%struct._IO_FILE* %0)
  %110 = icmp eq i8 %109, 0
  br i1 %110, label %111, label %.loopexit.loopexit

; <label>:111:                                    ; preds = %108
  %112 = call i64 @fread(i8* nonnull %23, i64 1, i64 5000, %struct._IO_FILE* %0)
  %113 = call i32 @ferror(%struct._IO_FILE* %0) #11
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %115, label %.loopexit7.loopexit

; <label>:115:                                    ; preds = %111
  %116 = trunc i64 %112 to i32
  %117 = icmp sgt i32 %116, 0
  br i1 %117, label %118, label %121

; <label>:118:                                    ; preds = %115
  %sext = shl i64 %112, 32
  %119 = ashr exact i64 %sext, 32
  %120 = call i64 @fwrite(i8* nonnull %23, i64 1, i64 %119, %struct._IO_FILE* %1)
  br label %121

; <label>:121:                                    ; preds = %118, %115
  %122 = call i32 @ferror(%struct._IO_FILE* %1) #11
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %108, label %.loopexit7.loopexit

.loopexit8.loopexit:                              ; preds = %27
  br label %.loopexit8

.loopexit8.loopexit90:                            ; preds = %.backedge
  br label %.loopexit8

.loopexit8:                                       ; preds = %.loopexit8.loopexit90, %.loopexit8.loopexit, %.preheader, %104
  %124 = phi i8* [ %25, %104 ], [ %19, %.preheader ], [ %25, %.loopexit8.loopexit ], [ %70, %.loopexit8.loopexit90 ]
  %.1 = phi i32 [ %26, %104 ], [ 0, %.preheader ], [ %26, %.loopexit8.loopexit ], [ %26, %.loopexit8.loopexit90 ]
  call void @BZ2_bzReadClose(i32* nonnull %4, i8* %124) #11
  %125 = load i32, i32* %3, align 4
  switch i32 %125, label %149 [
    i32 -9, label %126
    i32 -6, label %.loopexit7
    i32 -4, label %127
    i32 -3, label %128
    i32 -7, label %129
    i32 -5, label %130
  ]

; <label>:126:                                    ; preds = %.loopexit8
  call fastcc void @configError() #15
  unreachable

.loopexit7.loopexit:                              ; preds = %111, %121
  br label %.loopexit7

.loopexit7.loopexit88:                            ; preds = %40
  br label %.loopexit7

.loopexit7:                                       ; preds = %.loopexit7.loopexit88, %.loopexit7.loopexit, %.loopexit8, %95, %89, %86, %83, %79, %.loopexit, %11, %2
  call fastcc void @ioError() #15
  unreachable

; <label>:127:                                    ; preds = %.loopexit8
  call fastcc void @crcError() #15
  unreachable

; <label>:128:                                    ; preds = %.loopexit8
  call fastcc void @outOfMemory() #15
  unreachable

; <label>:129:                                    ; preds = %.loopexit8
  call fastcc void @compressedStreamEOF() #15
  unreachable

; <label>:130:                                    ; preds = %.loopexit8
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %132 = icmp eq %struct._IO_FILE* %131, %0
  br i1 %132, label %135, label %133

; <label>:133:                                    ; preds = %130
  %134 = call i32 @fclose(%struct._IO_FILE* %0)
  br label %135

; <label>:135:                                    ; preds = %130, %133
  %136 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %137 = icmp eq %struct._IO_FILE* %136, %1
  br i1 %137, label %140, label %138

; <label>:138:                                    ; preds = %135
  %139 = call i32 @fclose(%struct._IO_FILE* %1)
  br label %140

; <label>:140:                                    ; preds = %135, %138
  %141 = icmp eq i32 %.1, 1
  br i1 %141, label %150, label %142

; <label>:142:                                    ; preds = %140
  %143 = load i8, i8* @noisy, align 1
  %144 = icmp eq i8 %143, 0
  br i1 %144, label %150, label %145

; <label>:145:                                    ; preds = %142
  %146 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %147 = load i8*, i8** @progName, align 8
  %148 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %146, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.90, i64 0, i64 0), i8* %147, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #14
  br label %150

; <label>:149:                                    ; preds = %.loopexit8
  call fastcc void @panic(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.91, i64 0, i64 0)) #15
  unreachable

; <label>:150:                                    ; preds = %145, %142, %140, %98, %101
  %.0 = phi i8 [ 1, %101 ], [ 1, %98 ], [ 0, %140 ], [ 1, %142 ], [ 1, %145 ]
  ret i8 %.0
}

declare i8* @BZ2_bzReadOpen(i32*, %struct._IO_FILE*, i32, i32, i8*, i32) local_unnamed_addr #7

declare i32 @BZ2_bzRead(i32*, i8*, i8*, i32) local_unnamed_addr #7

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #1

declare void @BZ2_bzReadGetUnused(i32*, i8*, i8**, i32*) local_unnamed_addr #7

declare void @BZ2_bzReadClose(i32*, i8*) local_unnamed_addr #7

; Function Attrs: nounwind
declare void @rewind(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @crcError() unnamed_addr #2 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = load i8*, i8** @progName, align 8
  %3 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.92, i64 0, i64 0), i8* %2) #14
  tail call fastcc void @showFileNames()
  tail call fastcc void @cadvise()
  tail call fastcc void @cleanUpAndFail(i32 2) #15
  unreachable
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @compressedStreamEOF() unnamed_addr #2 {
  %1 = load i8, i8* @noisy, align 1
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %8, label %3

; <label>:3:                                      ; preds = %0
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = load i8*, i8** @progName, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([95 x i8], [95 x i8]* @.str.93, i64 0, i64 0), i8* %5) #14
  %7 = load i8*, i8** @progName, align 8
  tail call void @perror(i8* %7) #14
  tail call fastcc void @showFileNames()
  tail call fastcc void @cadvise()
  br label %8

; <label>:8:                                      ; preds = %0, %3
  tail call fastcc void @cleanUpAndFail(i32 2) #15
  unreachable
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc zeroext i8 @testStream(%struct._IO_FILE*) unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [5000 x i8], align 16
  %5 = alloca [5000 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store i32 0, i32* %6, align 4
  %8 = tail call i32 @ferror(%struct._IO_FILE* %0) #11
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %.preheader, label %82

.preheader:                                       ; preds = %1
  %10 = load i32, i32* @verbosity, align 4
  %11 = load i8, i8* @smallMode, align 1
  %12 = zext i8 %11 to i32
  %13 = getelementptr inbounds [5000 x i8], [5000 x i8]* %5, i64 0, i64 0
  %14 = load i32, i32* %6, align 4
  %15 = call i8* @BZ2_bzReadOpen(i32* nonnull %2, %struct._IO_FILE* %0, i32 %10, i32 %12, i8* nonnull %13, i32 %14) #11
  %16 = icmp ne i8* %15, null
  %17 = load i32, i32* %2, align 4
  %18 = icmp eq i32 %17, 0
  %or.cond18 = and i1 %16, %18
  br i1 %or.cond18, label %.lr.ph20, label %.loopexit

.lr.ph20:                                         ; preds = %.preheader
  %19 = getelementptr inbounds [5000 x i8], [5000 x i8]* %4, i64 0, i64 0
  br label %20

; <label>:20:                                     ; preds = %.lr.ph20, %.backedge
  %21 = phi i8* [ %15, %.lr.ph20 ], [ %56, %.backedge ]
  %.0219 = phi i32 [ 0, %.lr.ph20 ], [ %22, %.backedge ]
  %22 = add nuw nsw i32 %.0219, 1
  %.pr = load i32, i32* %2, align 4
  br label %23

; <label>:23:                                     ; preds = %25, %20
  %24 = phi i32 [ %27, %25 ], [ %.pr, %20 ]
  switch i32 %24, label %.loopexit.loopexit [
    i32 0, label %25
    i32 4, label %29
  ]

; <label>:25:                                     ; preds = %23
  %26 = call i32 @BZ2_bzRead(i32* nonnull %2, i8* nonnull %21, i8* nonnull %19, i32 5000) #11
  %27 = load i32, i32* %2, align 4
  %28 = icmp eq i32 %27, -5
  br i1 %28, label %.loopexit.loopexit, label %23

; <label>:29:                                     ; preds = %23
  call void @BZ2_bzReadGetUnused(i32* nonnull %2, i8* nonnull %21, i8** nonnull %7, i32* nonnull %6) #11
  %30 = load i32, i32* %2, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %33, label %32

; <label>:32:                                     ; preds = %29
  call fastcc void @panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.98, i64 0, i64 0)) #15
  unreachable

; <label>:33:                                     ; preds = %29
  %34 = load i8*, i8** %7, align 8
  %35 = load i32, i32* %6, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %33
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %37 = getelementptr inbounds i8, i8* %34, i64 %indvars.iv
  %38 = load i8, i8* %37, align 1
  %39 = getelementptr inbounds [5000 x i8], [5000 x i8]* %5, i64 0, i64 %indvars.iv
  store i8 %38, i8* %39, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %40 = load i32, i32* %6, align 4
  %41 = sext i32 %40 to i64
  %42 = icmp slt i64 %indvars.iv.next, %41
  br i1 %42, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %33
  call void @BZ2_bzReadClose(i32* nonnull %2, i8* nonnull %21) #11
  %43 = load i32, i32* %2, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %46, label %45

; <label>:45:                                     ; preds = %._crit_edge
  call fastcc void @panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.98, i64 0, i64 0)) #15
  unreachable

; <label>:46:                                     ; preds = %._crit_edge
  %47 = load i32, i32* %6, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %.backedge

; <label>:49:                                     ; preds = %46
  %50 = call fastcc zeroext i8 @myfeof(%struct._IO_FILE* %0)
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %.backedge, label %60

.backedge:                                        ; preds = %49, %46
  %52 = load i32, i32* @verbosity, align 4
  %53 = load i8, i8* @smallMode, align 1
  %54 = zext i8 %53 to i32
  %55 = load i32, i32* %6, align 4
  %56 = call i8* @BZ2_bzReadOpen(i32* nonnull %2, %struct._IO_FILE* %0, i32 %52, i32 %54, i8* nonnull %13, i32 %55) #11
  %57 = icmp ne i8* %56, null
  %58 = load i32, i32* %2, align 4
  %59 = icmp eq i32 %58, 0
  %or.cond = and i1 %57, %59
  br i1 %or.cond, label %20, label %.loopexit.loopexit55

; <label>:60:                                     ; preds = %49
  %61 = call i32 @ferror(%struct._IO_FILE* %0) #11
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %82

; <label>:63:                                     ; preds = %60
  %64 = call i32 @fclose(%struct._IO_FILE* %0)
  %65 = icmp eq i32 %64, -1
  br i1 %65, label %82, label %66

; <label>:66:                                     ; preds = %63
  %67 = load i32, i32* @verbosity, align 4
  %68 = icmp sgt i32 %67, 1
  br i1 %68, label %69, label %107

; <label>:69:                                     ; preds = %66
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %71 = call i64 @fwrite(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.89, i64 0, i64 0), i64 5, i64 1, %struct._IO_FILE* %70) #14
  br label %107

.loopexit.loopexit:                               ; preds = %25, %23
  br label %.loopexit

.loopexit.loopexit55:                             ; preds = %.backedge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit55, %.loopexit.loopexit, %.preheader
  %72 = phi i8* [ %15, %.preheader ], [ %21, %.loopexit.loopexit ], [ %56, %.loopexit.loopexit55 ]
  %.1 = phi i32 [ 0, %.preheader ], [ %22, %.loopexit.loopexit ], [ %22, %.loopexit.loopexit55 ]
  call void @BZ2_bzReadClose(i32* nonnull %3, i8* %72) #11
  %73 = load i32, i32* @verbosity, align 4
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %79

; <label>:75:                                     ; preds = %.loopexit
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %77 = load i8*, i8** @progName, align 8
  %78 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.99, i64 0, i64 0), i8* %77, i8* getelementptr inbounds ([1034 x i8], [1034 x i8]* @inName, i64 0, i64 0)) #14
  br label %79

; <label>:79:                                     ; preds = %75, %.loopexit
  %80 = load i32, i32* %2, align 4
  switch i32 %80, label %106 [
    i32 -9, label %81
    i32 -6, label %82
    i32 -4, label %83
    i32 -3, label %86
    i32 -7, label %87
    i32 -5, label %90
  ]

; <label>:81:                                     ; preds = %79
  call fastcc void @configError() #15
  unreachable

; <label>:82:                                     ; preds = %79, %63, %60, %1
  call fastcc void @ioError() #15
  unreachable

; <label>:83:                                     ; preds = %79
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %85 = call i64 @fwrite(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.100, i64 0, i64 0), i64 35, i64 1, %struct._IO_FILE* %84) #14
  br label %107

; <label>:86:                                     ; preds = %79
  call fastcc void @outOfMemory() #15
  unreachable

; <label>:87:                                     ; preds = %79
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %89 = call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.101, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %88) #14
  br label %107

; <label>:90:                                     ; preds = %79
  %91 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %92 = icmp eq %struct._IO_FILE* %91, %0
  br i1 %92, label %95, label %93

; <label>:93:                                     ; preds = %90
  %94 = call i32 @fclose(%struct._IO_FILE* %0)
  br label %95

; <label>:95:                                     ; preds = %90, %93
  %96 = icmp eq i32 %.1, 1
  br i1 %96, label %97, label %100

; <label>:97:                                     ; preds = %95
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %99 = call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.102, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %98) #14
  br label %107

; <label>:100:                                    ; preds = %95
  %101 = load i8, i8* @noisy, align 1
  %102 = icmp eq i8 %101, 0
  br i1 %102, label %107, label %103

; <label>:103:                                    ; preds = %100
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %105 = call i64 @fwrite(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.103, i64 0, i64 0), i64 35, i64 1, %struct._IO_FILE* %104) #14
  br label %107

; <label>:106:                                    ; preds = %79
  call fastcc void @panic(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.104, i64 0, i64 0)) #15
  unreachable

; <label>:107:                                    ; preds = %103, %100, %66, %69, %97, %87, %83
  %.0 = phi i8 [ 0, %97 ], [ 0, %87 ], [ 0, %83 ], [ 1, %69 ], [ 1, %66 ], [ 1, %100 ], [ 1, %103 ]
  ret i8 %.0
}

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #11

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #10

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noinline nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { argmemonly nounwind }
attributes #11 = { nounwind }
attributes #12 = { nounwind readonly }
attributes #13 = { noreturn nounwind }
attributes #14 = { cold }
attributes #15 = { noreturn }
attributes #16 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = distinct !{!12, !7}
