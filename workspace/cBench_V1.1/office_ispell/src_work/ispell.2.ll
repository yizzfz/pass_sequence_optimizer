; ModuleID = 'tmp1.ll'
source_filename = "ispell.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.hashheader = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i8], [13 x i8], i8, i8, i8, [228 x i16], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [128 x i8], [100 x [11 x i8]], [100 x i32], [100 x i32], i16 }
%struct.success = type { %struct.dent*, %struct.flagent*, %struct.flagent* }
%struct.dent = type { %struct.dent*, i8*, [1 x i64] }
%struct.flagent = type { i8*, i8*, i16, i16, i16, i16, i16, [228 x i8] }
%struct.flagptr = type { %union.ptr_union, i32 }
%union.ptr_union = type { %struct.flagptr* }
%struct.strchartype = type { i8*, i8*, i8* }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

$__llvm_profile_raw_version = comdat any

@minimenusize = global i32 2, align 4
@eflag = global i32 0, align 4
@dumpflag = global i32 0, align 4
@fflag = global i32 0, align 4
@sflag = global i32 0, align 4
@vflag = global i32 0, align 4
@xflag = global i32 0, align 4
@deftflag = global i32 -1, align 4
@tflag = global i32 0, align 4
@prefstringchar = global i32 -1, align 4
@terse = global i32 0, align 4
@tempfile = global [4096 x i8] zeroinitializer, align 16
@minword = global i32 1, align 4
@sortit = global i32 1, align 4
@compoundflag = global i32 -1, align 4
@tryhardflag = global i32 -1, align 4
@currentfile = global i8* null, align 8
@math_mode = global i32 0, align 4
@LaTeX_Mode = global i8 80, align 1
@main.libdictname = internal global [13 x i8] zeroinitializer, align 1
@main.outbuf = internal global [8192 x i8] zeroinitializer, align 16
@Cmd = internal global i8* null, align 8
@Trynum = common global i32 0, align 4
@.str = private unnamed_addr constant [11 x i8] c"DICTIONARY\00", align 1
@hashname = common global [4096 x i8] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [6 x i8] c"%s/%s\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c".hash\00", align 1
@LibDict = internal global i8* null, align 8
@.str.4 = private unnamed_addr constant [13 x i8] c"english.hash\00", align 1
@Version_ID = internal global [40 x i8*] [i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.146, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.147, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.148, i32 0, i32 0), i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.149, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.150, i32 0, i32 0), i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.151, i32 0, i32 0), i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.152, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.153, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.150, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.154, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.155, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.156, i32 0, i32 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.157, i32 0, i32 0), i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.158, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.159, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.160, i32 0, i32 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.161, i32 0, i32 0), i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.162, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.163, i32 0, i32 0), i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.164, i32 0, i32 0), i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.165, i32 0, i32 0), i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.166, i32 0, i32 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.167, i32 0, i32 0), i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.168, i32 0, i32 0), i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.169, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.170, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.150, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.171, i32 0, i32 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.172, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.173, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.174, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.175, i32 0, i32 0), i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.176, i32 0, i32 0), i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.177, i32 0, i32 0), i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.178, i32 0, i32 0), i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.179, i32 0, i32 0), i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.180, i32 0, i32 0), i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.181, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.182, i32 0, i32 0), i8* null], align 16
@.str.5 = private unnamed_addr constant [5 x i8] c"(#) \00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"Compiled-in options:\0A\00", align 1
@.str.8 = private unnamed_addr constant [13 x i8] c"\09!USG (BSD)\0A\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"\09BAKEXT = \22%s\22\0A\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c".bak\00", align 1
@.str.11 = private unnamed_addr constant [16 x i8] c"\09BINDIR = \22%s\22\0A\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"/usr/local/bin\00", align 1
@.str.13 = private unnamed_addr constant [17 x i8] c"\09!BOTTOMCONTEXT\0A\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"\09CBREAK\0A\00", align 1
@.str.15 = private unnamed_addr constant [12 x i8] c"\09CC = \22%s\22\0A\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"cc\00", align 1
@.str.17 = private unnamed_addr constant [16 x i8] c"\09CFLAGS = \22%s\22\0A\00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"-O\00", align 1
@.str.19 = private unnamed_addr constant [19 x i8] c"\09!COMMANDFORSPACE\0A\00", align 1
@.str.20 = private unnamed_addr constant [18 x i8] c"\09!CONTEXTROUNDUP\0A\00", align 1
@.str.21 = private unnamed_addr constant [18 x i8] c"\09CONTEXTPCT = %d\0A\00", align 1
@.str.22 = private unnamed_addr constant [21 x i8] c"\09COUNTSUFFIX = \22%s\22\0A\00", align 1
@.str.23 = private unnamed_addr constant [5 x i8] c".cnt\00", align 1
@.str.24 = private unnamed_addr constant [17 x i8] c"\09DEFHASH = \22%s\22\0A\00", align 1
@.str.25 = private unnamed_addr constant [19 x i8] c"\09DEFINCSTR = \22%s\22\0A\00", align 1
@.str.26 = private unnamed_addr constant [15 x i8] c"&Include_File&\00", align 1
@.str.27 = private unnamed_addr constant [17 x i8] c"\09DEFLANG = \22%s\22\0A\00", align 1
@.str.28 = private unnamed_addr constant [12 x i8] c"english.aff\00", align 1
@.str.29 = private unnamed_addr constant [23 x i8] c"\09DEFNOBACKUPFLAG = %d\0A\00", align 1
@.str.30 = private unnamed_addr constant [17 x i8] c"\09DEFPAFF = \22%s\22\0A\00", align 1
@.str.31 = private unnamed_addr constant [6 x i8] c"words\00", align 1
@.str.32 = private unnamed_addr constant [18 x i8] c"\09DEFPDICT = \22%s\22\0A\00", align 1
@.str.33 = private unnamed_addr constant [9 x i8] c".ispell_\00", align 1
@.str.34 = private unnamed_addr constant [18 x i8] c"\09DEFTEXFLAG = %d\0A\00", align 1
@.str.35 = private unnamed_addr constant [18 x i8] c"\09EGREPCMD = \22%s\22\0A\00", align 1
@.str.36 = private unnamed_addr constant [18 x i8] c"/usr/bin/egrep -i\00", align 1
@.str.37 = private unnamed_addr constant [18 x i8] c"\09ELISPDIR = \22%s\22\0A\00", align 1
@.str.38 = private unnamed_addr constant [31 x i8] c"/usr/local/lib/emacs/site-lisp\00", align 1
@.str.39 = private unnamed_addr constant [15 x i8] c"\09EMACS = \22%s\22\0A\00", align 1
@.str.40 = private unnamed_addr constant [6 x i8] c"emacs\00", align 1
@.str.41 = private unnamed_addr constant [17 x i8] c"\09!EQUAL_COLUMNS\0A\00", align 1
@.str.42 = private unnamed_addr constant [27 x i8] c"\09!GENERATE_LIBRARY_PROTOS\0A\00", align 1
@.str.43 = private unnamed_addr constant [14 x i8] c"\09!HAS_RENAME\0A\00", align 1
@.str.44 = private unnamed_addr constant [20 x i8] c"\09HASHSUFFIX = \22%s\22\0A\00", align 1
@.str.45 = private unnamed_addr constant [14 x i8] c"\09HOME = \22%s\22\0A\00", align 1
@.str.46 = private unnamed_addr constant [5 x i8] c"HOME\00", align 1
@.str.47 = private unnamed_addr constant [13 x i8] c"\09!IGNOREBIB\0A\00", align 1
@.str.48 = private unnamed_addr constant [19 x i8] c"\09INCSTRVAR = \22%s\22\0A\00", align 1
@.str.49 = private unnamed_addr constant [15 x i8] c"INCLUDE_STRING\00", align 1
@.str.50 = private unnamed_addr constant [20 x i8] c"\09INPUTWORDLEN = %d\0A\00", align 1
@.str.51 = private unnamed_addr constant [19 x i8] c"\09LANGUAGES = \22%s\22\0A\00", align 1
@.str.52 = private unnamed_addr constant [81 x i8] c"{american,MASTERDICTS=american.med+,HASHFILES=americanmed+.hash,EXTRADICT=words}\00", align 1
@.str.53 = private unnamed_addr constant [16 x i8] c"\09LIBDIR = \22%s\22\0A\00", align 1
@.str.54 = private unnamed_addr constant [15 x i8] c"\09LIBES = \22%s\22\0A\00", align 1
@.str.55 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.56 = private unnamed_addr constant [14 x i8] c"\09LINT = \22%s\22\0A\00", align 1
@.str.57 = private unnamed_addr constant [5 x i8] c"lint\00", align 1
@.str.58 = private unnamed_addr constant [19 x i8] c"\09LINTFLAGS = \22%s\22\0A\00", align 1
@.str.59 = private unnamed_addr constant [14 x i8] c"\09LOOK = \22%s\22\0A\00", align 1
@.str.60 = private unnamed_addr constant [9 x i8] c"look -df\00", align 1
@.str.61 = private unnamed_addr constant [22 x i8] c"\09MAKE_SORTTMP = \22%s\22\0A\00", align 1
@.str.62 = private unnamed_addr constant [18 x i8] c"-T ${TMPDIR-/tmp}\00", align 1
@.str.63 = private unnamed_addr constant [24 x i8] c"\09MALLOC_INCREMENT = %d\0A\00", align 1
@.str.64 = private unnamed_addr constant [17 x i8] c"\09MAN1DIR = \22%s\22\0A\00", align 1
@.str.65 = private unnamed_addr constant [20 x i8] c"/usr/local/man/man1\00", align 1
@.str.66 = private unnamed_addr constant [17 x i8] c"\09MAN1EXT = \22%s\22\0A\00", align 1
@.str.67 = private unnamed_addr constant [3 x i8] c".1\00", align 1
@.str.68 = private unnamed_addr constant [17 x i8] c"\09MAN4DIR = \22%s\22\0A\00", align 1
@.str.69 = private unnamed_addr constant [20 x i8] c"/usr/local/man/man4\00", align 1
@.str.70 = private unnamed_addr constant [17 x i8] c"\09MAN4EXT = \22%s\22\0A\00", align 1
@.str.71 = private unnamed_addr constant [3 x i8] c".4\00", align 1
@.str.72 = private unnamed_addr constant [16 x i8] c"\09MASKBITS = %d\0A\00", align 1
@.str.73 = private unnamed_addr constant [16 x i8] c"\09MASKTYPE = %s\0A\00", align 1
@.str.74 = private unnamed_addr constant [5 x i8] c"long\00", align 1
@.str.75 = private unnamed_addr constant [22 x i8] c"\09MASKTYPE_WIDTH = %d\0A\00", align 1
@.str.76 = private unnamed_addr constant [20 x i8] c"\09MASTERHASH = \22%s\22\0A\00", align 1
@.str.77 = private unnamed_addr constant [18 x i8] c"americanmed+.hash\00", align 1
@.str.78 = private unnamed_addr constant [19 x i8] c"\09MAXAFFIXLEN = %d\0A\00", align 1
@.str.79 = private unnamed_addr constant [18 x i8] c"\09MAXCONTEXT = %d\0A\00", align 1
@.str.80 = private unnamed_addr constant [23 x i8] c"\09MAXINCLUDEFILES = %d\0A\00", align 1
@.str.81 = private unnamed_addr constant [17 x i8] c"\09MAXNAMLEN = %d\0A\00", align 1
@.str.82 = private unnamed_addr constant [18 x i8] c"\09MAXPATHLEN = %d\0A\00", align 1
@.str.83 = private unnamed_addr constant [14 x i8] c"\09MAXPCT = %d\0A\00", align 1
@.str.84 = private unnamed_addr constant [17 x i8] c"\09MAXSEARCH = %d\0A\00", align 1
@.str.85 = private unnamed_addr constant [24 x i8] c"\09MAXSTRINGCHARLEN = %d\0A\00", align 1
@.str.86 = private unnamed_addr constant [22 x i8] c"\09MAXSTRINGCHARS = %d\0A\00", align 1
@.str.87 = private unnamed_addr constant [16 x i8] c"\09MAX_CAPS = %d\0A\00", align 1
@.str.88 = private unnamed_addr constant [16 x i8] c"\09MAX_HITS = %d\0A\00", align 1
@.str.89 = private unnamed_addr constant [23 x i8] c"\09MAX_SCREEN_SIZE = %d\0A\00", align 1
@.str.90 = private unnamed_addr constant [18 x i8] c"\09MINCONTEXT = %d\0A\00", align 1
@.str.91 = private unnamed_addr constant [11 x i8] c"\09MINIMENU\0A\00", align 1
@.str.92 = private unnamed_addr constant [15 x i8] c"\09MINWORD = %d\0A\00", align 1
@.str.93 = private unnamed_addr constant [27 x i8] c"\09MSDOS_BINARY_OPEN = 0x%x\0A\00", align 1
@.str.94 = private unnamed_addr constant [15 x i8] c"\09MSGLANG = %s\0A\00", align 1
@.str.95 = private unnamed_addr constant [8 x i8] c"english\00", align 1
@.str.96 = private unnamed_addr constant [29 x i8] c"\09!NO_CAPITALIZATION_SUPPORT\0A\00", align 1
@.str.97 = private unnamed_addr constant [26 x i8] c"\09!NO_STDLIB_H (STDLIB_H)\0A\00", align 1
@.str.98 = private unnamed_addr constant [9 x i8] c"\09NO8BIT\0A\00", align 1
@.str.99 = private unnamed_addr constant [19 x i8] c"\09NRSPECIAL = \22%s\22\0A\00", align 1
@.str.100 = private unnamed_addr constant [6 x i8] c"().\5C*\00", align 1
@.str.101 = private unnamed_addr constant [17 x i8] c"\09OLDPAFF = \22%s\22\0A\00", align 1
@.str.102 = private unnamed_addr constant [18 x i8] c"\09OLDPDICT = \22%s\22\0A\00", align 1
@.str.103 = private unnamed_addr constant [26 x i8] c"\09PDICTHOME = (undefined)\0A\00", align 1
@.str.104 = private unnamed_addr constant [18 x i8] c"\09PDICTVAR = \22%s\22\0A\00", align 1
@.str.105 = private unnamed_addr constant [9 x i8] c"WORDLIST\00", align 1
@.str.106 = private unnamed_addr constant [25 x i8] c"\09!PIECEMEAL_HASH_WRITES\0A\00", align 1
@.str.107 = private unnamed_addr constant [16 x i8] c"\09!REGEX_LOOKUP\0A\00", align 1
@.str.108 = private unnamed_addr constant [16 x i8] c"\09REGLIB = \22%s\22\0A\00", align 1
@.str.109 = private unnamed_addr constant [19 x i8] c"\09SIGNAL_TYPE = %s\0A\00", align 1
@.str.110 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@.str.111 = private unnamed_addr constant [20 x i8] c"\09SORTPERSONAL = %d\0A\00", align 1
@.str.112 = private unnamed_addr constant [20 x i8] c"\09STATSUFFIX = \22%s\22\0A\00", align 1
@.str.113 = private unnamed_addr constant [6 x i8] c".stat\00", align 1
@.str.114 = private unnamed_addr constant [18 x i8] c"\09TEMPNAME = \22%s\22\0A\00", align 1
@.str.115 = private unnamed_addr constant [18 x i8] c"/tmp/ispellXXXXXX\00", align 1
@.str.116 = private unnamed_addr constant [17 x i8] c"\09TERMLIB = \22%s\22\0A\00", align 1
@.str.117 = private unnamed_addr constant [20 x i8] c"\09TEXINFODIR = \22%s\22\0A\00", align 1
@.str.118 = private unnamed_addr constant [16 x i8] c"/usr/local/info\00", align 1
@.str.119 = private unnamed_addr constant [20 x i8] c"\09TEXSPECIAL = \22%s\22\0A\00", align 1
@.str.120 = private unnamed_addr constant [14 x i8] c"()[]{}<>\5C$*.%\00", align 1
@.str.121 = private unnamed_addr constant [15 x i8] c"\09!TRUNCATEBAK\0A\00", align 1
@.str.122 = private unnamed_addr constant [9 x i8] c"\09!USESH\0A\00", align 1
@.str.123 = private unnamed_addr constant [15 x i8] c"\09WORDS = \22%s\22\0A\00", align 1
@.str.124 = private unnamed_addr constant [16 x i8] c"/usr/dict/words\00", align 1
@.str.125 = private unnamed_addr constant [14 x i8] c"\09YACC = \22%s\22\0A\00", align 1
@.str.126 = private unnamed_addr constant [5 x i8] c"yacc\00", align 1
@.str.127 = private unnamed_addr constant [6 x i8] c"nroff\00", align 1
@.str.128 = private unnamed_addr constant [4 x i8] c"tex\00", align 1
@incfileflag = common global i32 0, align 4
@aflag = common global i32 0, align 4
@nodictflag = common global i32 0, align 4
@cflag = common global i32 0, align 4
@lflag = common global i32 0, align 4
@askfilename = common global i8* null, align 8
@contextsize = common global i32 0, align 4
@cbench_print = common global i32 0, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str.129 = private unnamed_addr constant [40 x i8] c"ispell:  specified file does not exist\0A\00", align 1
@.str.130 = private unnamed_addr constant [39 x i8] c"ispell:  specified files do not exist\0A\00", align 1
@.str.131 = private unnamed_addr constant [43 x i8] c"ispell:  unrecognized formatter type '%s'\0A\00", align 1
@defdupchar = common global i32 0, align 4
@hashheader = common global %struct.hashheader zeroinitializer, align 4
@.str.132 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.133 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.134 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.135 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@infile1 = common global %struct._IO_FILE* null, align 8
@.str.136 = private unnamed_addr constant [32 x i8] c"\0AError: Can't open input file!\0A\00", align 1
@.str.137 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.138 = private unnamed_addr constant [3 x i8] c"wt\00", align 1
@outfile1 = common global %struct._IO_FILE* null, align 8
@stdin = external global %struct._IO_FILE*, align 8
@infile = common global %struct._IO_FILE* null, align 8
@outfile = common global %struct._IO_FILE* null, align 8
@BC = common global i8* null, align 8
@cd = common global i8* null, align 8
@cl = common global i8* null, align 8
@cm = common global i8* null, align 8
@ho = common global i8* null, align 8
@nd = common global i8* null, align 8
@so = common global i8* null, align 8
@se = common global i8* null, align 8
@sg = common global i32 0, align 4
@ti = common global i8* null, align 8
@te = common global i8* null, align 8
@li = common global i32 0, align 4
@co = common global i32 0, align 4
@contextbufs = common global [10 x [8192 x i8]] zeroinitializer, align 16
@contextoffset = common global i32 0, align 4
@currentchar = common global i8* null, align 8
@ctoken = common global [120 x i8] zeroinitializer, align 16
@itoken = common global [120 x i8] zeroinitializer, align 16
@termcap = common global [2048 x i8] zeroinitializer, align 16
@termstr = common global [2048 x i8] zeroinitializer, align 16
@termptr = common global i8* null, align 8
@numhits = common global i32 0, align 4
@hits = common global [10 x %struct.success] zeroinitializer, align 16
@hashstrings = common global i8* null, align 8
@hashtbl = common global %struct.dent* null, align 8
@hashsize = common global i32 0, align 4
@uerasechar = common global i32 0, align 4
@ukillchar = common global i32 0, align 4
@laststringch = common global i32 0, align 4
@numpflags = common global i32 0, align 4
@numsflags = common global i32 0, align 4
@pflagindex = common global [228 x %struct.flagptr] zeroinitializer, align 16
@pflaglist = common global %struct.flagent* null, align 8
@sflagindex = common global [228 x %struct.flagptr] zeroinitializer, align 16
@sflaglist = common global %struct.flagent* null, align 8
@chartypes = common global %struct.strchartype* null, align 8
@changes = common global i32 0, align 4
@readonly = common global i32 0, align 4
@quit = common global i32 0, align 4
@possibilities = common global [100 x [120 x i8]] zeroinitializer, align 16
@pcount = common global i32 0, align 4
@maxposslen = common global i32 0, align 4
@easypossibilities = common global i32 0, align 4
@Try = common global [228 x i8] zeroinitializer, align 16
@.str.139 = private unnamed_addr constant [137 x i8] c"Usage: %s [-dfile | -pfile | -wchars | -Wn | -t | -n | -x | -b | -S | -B | -C | -P | -m | -Lcontext | -M | -N | -Ttype | -V] file .....\0A\00", align 1
@.str.140 = private unnamed_addr constant [67 x i8] c"       %s [-dfile | -pfile | -wchars | -Wn | -t | -n | -Ttype] -l\0A\00", align 1
@.str.141 = private unnamed_addr constant [98 x i8] c"       %s [-dfile | -pfile | -ffile | -Wn | -t | -n | -s | -B | -C | -P | -m | -Ttype] {-a | -A}\0A\00", align 1
@.str.142 = private unnamed_addr constant [39 x i8] c"       %s [-dfile] [-wchars | -Wn] -c\0A\00", align 1
@.str.143 = private unnamed_addr constant [38 x i8] c"       %s [-dfile] [-wchars] -e[1-4]\0A\00", align 1
@.str.144 = private unnamed_addr constant [33 x i8] c"       %s [-dfile] [-wchars] -D\0A\00", align 1
@.str.145 = private unnamed_addr constant [14 x i8] c"       %s -v\0A\00", align 1
@.str.146 = private unnamed_addr constant [50 x i8] c"@(#) International Ispell Version 3.1.20 10/10/95\00", align 1
@.str.147 = private unnamed_addr constant [44 x i8] c"@(#) Copyright (c), 1983, by Pace Willisson\00", align 1
@.str.148 = private unnamed_addr constant [64 x i8] c"@(#) International version Copyright (c) 1987, 1988, 1990-1995,\00", align 1
@.str.149 = private unnamed_addr constant [65 x i8] c"@(#) by Geoff Kuenning, Granada Hills, CA.  All rights reserved.\00", align 1
@.str.150 = private unnamed_addr constant [5 x i8] c"@(#)\00", align 1
@.str.151 = private unnamed_addr constant [72 x i8] c"@(#) Redistribution and use in source and binary forms, with or without\00", align 1
@.str.152 = private unnamed_addr constant [72 x i8] c"@(#) modification, are permitted provided that the following conditions\00", align 1
@.str.153 = private unnamed_addr constant [14 x i8] c"@(#) are met:\00", align 1
@.str.154 = private unnamed_addr constant [71 x i8] c"@(#) 1. Redistributions of source code must retain the above copyright\00", align 1
@.str.155 = private unnamed_addr constant [70 x i8] c"@(#)    notice, this list of conditions and the following disclaimer.\00", align 1
@.str.156 = private unnamed_addr constant [64 x i8] c"@(#) 2. Redistributions in binary form must reproduce the above\00", align 1
@.str.157 = private unnamed_addr constant [68 x i8] c"@(#)    copyright notice, this list of conditions and the following\00", align 1
@.str.158 = private unnamed_addr constant [72 x i8] c"@(#)    disclaimer in the documentation and/or other materials provided\00", align 1
@.str.159 = private unnamed_addr constant [31 x i8] c"@(#)    with the distribution.\00", align 1
@.str.160 = private unnamed_addr constant [71 x i8] c"@(#) 3. All modifications to the source code must be clearly marked as\00", align 1
@.str.161 = private unnamed_addr constant [68 x i8] c"@(#)    such.  Binary redistributions based on modified source code\00", align 1
@.str.162 = private unnamed_addr constant [73 x i8] c"@(#)    must be clearly marked as modified versions in the documentation\00", align 1
@.str.163 = private unnamed_addr constant [63 x i8] c"@(#)    and/or other materials provided with the distribution.\00", align 1
@.str.164 = private unnamed_addr constant [69 x i8] c"@(#) 4. All advertising materials mentioning features or use of this\00", align 1
@.str.165 = private unnamed_addr constant [60 x i8] c"@(#)    software must display the following acknowledgment:\00", align 1
@.str.166 = private unnamed_addr constant [73 x i8] c"@(#)      This product includes software developed by Geoff Kuenning and\00", align 1
@.str.167 = private unnamed_addr constant [37 x i8] c"@(#)      other unpaid contributors.\00", align 1
@.str.168 = private unnamed_addr constant [73 x i8] c"@(#) 5. The name of Geoff Kuenning may not be used to endorse or promote\00", align 1
@.str.169 = private unnamed_addr constant [67 x i8] c"@(#)    products derived from this software without specific prior\00", align 1
@.str.170 = private unnamed_addr constant [28 x i8] c"@(#)    written permission.\00", align 1
@.str.171 = private unnamed_addr constant [71 x i8] c"@(#) THIS SOFTWARE IS PROVIDED BY GEOFF KUENNING AND CONTRIBUTORS ``AS\00", align 1
@.str.172 = private unnamed_addr constant [68 x i8] c"@(#) IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT\00", align 1
@.str.173 = private unnamed_addr constant [71 x i8] c"@(#) LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS\00", align 1
@.str.174 = private unnamed_addr constant [71 x i8] c"@(#) FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL GEOFF\00", align 1
@.str.175 = private unnamed_addr constant [66 x i8] c"@(#) KUENNING OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,\00", align 1
@.str.176 = private unnamed_addr constant [62 x i8] c"@(#) INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES\00", align 1
@.str.177 = private unnamed_addr constant [72 x i8] c"@(#) (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR\00", align 1
@.str.178 = private unnamed_addr constant [72 x i8] c"@(#) SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)\00", align 1
@.str.179 = private unnamed_addr constant [73 x i8] c"@(#) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,\00", align 1
@.str.180 = private unnamed_addr constant [67 x i8] c"@(#) STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)\00", align 1
@.str.181 = private unnamed_addr constant [73 x i8] c"@(#) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED\00", align 1
@.str.182 = private unnamed_addr constant [40 x i8] c"@(#) OF THE POSSIBILITY OF SUCH DAMAGE.\00", align 1
@.str.183 = private unnamed_addr constant [5 x i8] c".tex\00", align 1
@.str.184 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.185 = private unnamed_addr constant [16 x i8] c"Can't open %s\0D\0A\00", align 1
@.str.186 = private unnamed_addr constant [30 x i8] c"Warning:  Can't write to %s\0D\0A\00", align 1
@.str.187 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.188 = private unnamed_addr constant [18 x i8] c"Can't create %s\0D\0A\00", align 1
@.str.189 = private unnamed_addr constant [15 x i8] c"temporary file\00", align 1
@.str.190 = private unnamed_addr constant [34 x i8] c"temporary file disappeared (%s)\0D\0A\00", align 1
@.str.191 = private unnamed_addr constant [7 x i8] c"%.*s%s\00", align 1
@.str.192 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str.193 = private unnamed_addr constant [38 x i8] c"\0D\0AIllegal affix flag character '%c'\0D\0A\00", align 1
@.str.194 = private unnamed_addr constant [51 x i8] c"\0D\0AWord '%s' too long at line %d of %s, truncated\0D\0A\00", align 1
@.str.195 = private unnamed_addr constant [9 x i8] c"ispell.c\00", align 1
@.str.196 = private unnamed_addr constant [4 x i8] c" %f\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_tmp1.ll_usage = private constant [13 x i8] c"tmp1.ll:usage"
@__profn_tmp1.ll_initckch = private constant [16 x i8] c"tmp1.ll:initckch"
@__profn_tmp1.ll_expandmode = private constant [18 x i8] c"tmp1.ll:expandmode"
@__profn_tmp1.ll_dofile = private constant [14 x i8] c"tmp1.ll:dofile"
@__profn_tmp1.ll_update_file = private constant [19 x i8] c"tmp1.ll:update_file"
@__profc_main = private global [125 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 144116678006305545, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 125, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_usage = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7998456694610620455, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_initckch = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_initckch = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5517863458742872441, i64 253064844786, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i32 0, i32 0), i8* null, i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_expandmode = private global [20 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_expandmode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4890556081953462483, i64 258443850724, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i32 0, i32 0), i8* null, i8* null, i32 20, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_dofile = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_dofile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5762881377394810106, i64 144115384724405641, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i32 0, i32 0), i8* null, i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_update_file = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_update_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7852544604465089352, i64 145824727475, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [66 x i8] c"Y@x\DA\CBM\CC\CCc,\C9-0\D4\CB\C9\B1*-NLO\85\F32\F32K\92\B3\933\E0\02\A9\15\05\89y)\B9\F9)\085)\F9i\999\08niAJbIj<H\0C\00\8B\03\1F\F1", section "__llvm_prf_names"
@llvm.used = appending global [7 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initckch to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_expandmode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_dofile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_update_file to i8*), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8**, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %6, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %7, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %8, align 8
  store i8* null, i8** %14, align 8
  store i8* null, i8** %15, align 8
  %18 = load i8**, i8*** %5, align 8
  %19 = load i8*, i8** %18, align 8
  store i8* %19, i8** @Cmd, align 8
  store i32 0, i32* @Trynum, align 4
  %20 = call i8* @getenv(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0)) #7
  store i8* %20, i8** %11, align 8
  %21 = load i8*, i8** %11, align 8
  %22 = icmp ne i8* %21, null
  br i1 %22, label %23, label %67

; <label>:23:                                     ; preds = %2
  %24 = load i8*, i8** %11, align 8
  %25 = call i8* @index(i8* %24, i32 47) #8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %30

; <label>:27:                                     ; preds = %23
  %28 = load i8*, i8** %11, align 8
  %29 = call i8* @strcpy(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0), i8* %28) #7
  br label %34

; <label>:30:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 64)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 64)
  %32 = load i8*, i8** %11, align 8
  %33 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8* %32) #7
  br label %34

; <label>:34:                                     ; preds = %30, %27
  %35 = load i8*, i8** %11, align 8
  %36 = call i8* @strcpy(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @main.libdictname, i32 0, i32 0), i8* %35) #7
  %37 = load i8*, i8** %11, align 8
  %38 = call i8* @rindex(i8* %37, i32 46) #8
  store i8* %38, i8** %11, align 8
  %39 = load i8*, i8** %11, align 8
  %40 = icmp eq i8* %39, null
  br i1 %40, label %46, label %41

; <label>:41:                                     ; preds = %34
  %pgocount5 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 31)
  %42 = add i64 %pgocount5, 1
  store i64 %42, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 31)
  %43 = load i8*, i8** %11, align 8
  %44 = call i32 @strcmp(i8* %43, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0)) #8
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %49

; <label>:46:                                     ; preds = %41, %34
  %pgocount6 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 30)
  %47 = add i64 %pgocount6, 1
  store i64 %47, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 30)
  %48 = call i8* @strcat(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0)) #7
  br label %49

; <label>:49:                                     ; preds = %46, %41
  %50 = call i8* @rindex(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @main.libdictname, i32 0, i32 0), i32 47) #8
  store i8* %50, i8** @LibDict, align 8
  %51 = load i8*, i8** @LibDict, align 8
  %52 = icmp ne i8* %51, null
  br i1 %52, label %53, label %57

; <label>:53:                                     ; preds = %49
  %pgocount7 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 32)
  %54 = add i64 %pgocount7, 1
  store i64 %54, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 32)
  %55 = load i8*, i8** @LibDict, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** @LibDict, align 8
  br label %59

; <label>:57:                                     ; preds = %49
  %pgocount8 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 65)
  %58 = add i64 %pgocount8, 1
  store i64 %58, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 65)
  store i8* getelementptr inbounds ([13 x i8], [13 x i8]* @main.libdictname, i32 0, i32 0), i8** @LibDict, align 8
  br label %59

; <label>:59:                                     ; preds = %57, %53
  %60 = call i8* @rindex(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @main.libdictname, i32 0, i32 0), i32 46) #8
  store i8* %60, i8** %11, align 8
  %61 = load i8*, i8** %11, align 8
  %62 = icmp ne i8* %61, null
  br i1 %62, label %63, label %66

; <label>:63:                                     ; preds = %59
  %pgocount9 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 33)
  %64 = add i64 %pgocount9, 1
  store i64 %64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 33)
  %65 = load i8*, i8** %11, align 8
  store i8 0, i8* %65, align 1
  br label %66

; <label>:66:                                     ; preds = %63, %59
  br label %70

; <label>:67:                                     ; preds = %2
  %pgocount10 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 34)
  %68 = add i64 %pgocount10, 1
  store i64 %68, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 34)
  %69 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i32 0, i32 0)) #7
  br label %70

; <label>:70:                                     ; preds = %67, %66
  store i8* null, i8** %12, align 8
  %71 = load i8**, i8*** %5, align 8
  %72 = getelementptr inbounds i8*, i8** %71, i32 1
  store i8** %72, i8*** %5, align 8
  %73 = load i32, i32* %4, align 4
  %74 = add nsw i32 %73, -1
  store i32 %74, i32* %4, align 4
  br label %75

; <label>:75:                                     ; preds = %661, %70
  %76 = load i32, i32* %4, align 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %79, label %._crit_edge

._crit_edge:                                      ; preds = %75
  %pgocount11 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 0)
  %78 = add i64 %pgocount11, 1
  store i64 %78, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 0)
  br label %85

; <label>:79:                                     ; preds = %75
  %80 = load i8**, i8*** %5, align 8
  %81 = load i8*, i8** %80, align 8
  %82 = load i8, i8* %81, align 1
  %83 = sext i8 %82 to i32
  %84 = icmp eq i32 %83, 45
  br label %85

; <label>:85:                                     ; preds = %._crit_edge, %79
  %86 = phi i1 [ false, %._crit_edge ], [ %84, %79 ]
  br i1 %86, label %87, label %666

; <label>:87:                                     ; preds = %85
  %88 = load i8**, i8*** %5, align 8
  %89 = load i8*, i8** %88, align 8
  %90 = call i64 @strlen(i8* %89) #8
  %91 = trunc i64 %90 to i32
  store i32 %91, i32* %17, align 4
  %92 = load i8**, i8*** %5, align 8
  %93 = load i8*, i8** %92, align 8
  %94 = getelementptr inbounds i8, i8* %93, i64 1
  %95 = load i8, i8* %94, align 1
  %96 = sext i8 %95 to i32
  switch i32 %96, label %659 [
    i32 118, label %97
    i32 110, label %217
    i32 116, label %229
    i32 84, label %241
    i32 65, label %265
    i32 97, label %272
    i32 68, label %281
    i32 101, label %292
    i32 99, label %344
    i32 98, label %357
    i32 120, label %364
    i32 102, label %371
    i32 76, label %404
    i32 108, label %429
    i32 115, label %438
    i32 83, label %447
    i32 66, label %454
    i32 67, label %461
    i32 80, label %468
    i32 109, label %475
    i32 78, label %482
    i32 77, label %489
    i32 112, label %496
    i32 100, label %526
    i32 86, label %601
    i32 119, label %608
    i32 87, label %631
  ]

; <label>:97:                                     ; preds = %87
  %98 = load i32, i32* %17, align 4
  %99 = icmp sgt i32 %98, 3
  br i1 %99, label %100, label %102

; <label>:100:                                    ; preds = %97
  %pgocount12 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 62)
  %101 = add i64 %pgocount12, 1
  store i64 %101, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 62)
  call void @usage()
  br label %102

; <label>:102:                                    ; preds = %100, %97
  store i8** getelementptr inbounds ([40 x i8*], [40 x i8*]* @Version_ID, i32 0, i32 0), i8*** %13, align 8
  br label %103

; <label>:103:                                    ; preds = %119, %102
  %104 = load i8**, i8*** %13, align 8
  %105 = load i8*, i8** %104, align 8
  %106 = icmp ne i8* %105, null
  br i1 %106, label %107, label %122

; <label>:107:                                    ; preds = %103
  %108 = load i8**, i8*** %13, align 8
  %109 = getelementptr inbounds i8*, i8** %108, i32 1
  store i8** %109, i8*** %13, align 8
  %110 = load i8*, i8** %108, align 8
  store i8* %110, i8** %11, align 8
  %111 = load i8*, i8** %11, align 8
  %112 = call i32 @strncmp(i8* %111, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i64 5) #8
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %115, label %._crit_edge1

._crit_edge1:                                     ; preds = %107
  %pgocount13 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 3)
  %114 = add i64 %pgocount13, 1
  store i64 %114, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 3)
  br label %119

; <label>:115:                                    ; preds = %107
  %pgocount14 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 1)
  %116 = add i64 %pgocount14, 1
  store i64 %116, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 1)
  %117 = load i8*, i8** %11, align 8
  %118 = getelementptr inbounds i8, i8* %117, i64 5
  store i8* %118, i8** %11, align 8
  br label %119

; <label>:119:                                    ; preds = %._crit_edge1, %115
  %120 = load i8*, i8** %11, align 8
  %121 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i8* %120)
  br label %103

; <label>:122:                                    ; preds = %103
  %123 = load i8**, i8*** %5, align 8
  %124 = load i8*, i8** %123, align 8
  %125 = getelementptr inbounds i8, i8* %124, i64 2
  %126 = load i8, i8* %125, align 1
  %127 = sext i8 %126 to i32
  %128 = icmp eq i32 %127, 118
  br i1 %128, label %129, label %216

; <label>:129:                                    ; preds = %122
  %pgocount15 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 63)
  %130 = add i64 %pgocount15, 1
  store i64 %130, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 63)
  %131 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i32 0, i32 0))
  %132 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.8, i32 0, i32 0))
  %133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0))
  %134 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i32 0, i32 0))
  %135 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.13, i32 0, i32 0))
  %136 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i32 0, i32 0))
  %137 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.16, i32 0, i32 0))
  %138 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i32 0, i32 0))
  %139 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.19, i32 0, i32 0))
  %140 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.20, i32 0, i32 0))
  %141 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.21, i32 0, i32 0), i32 10)
  %142 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.23, i32 0, i32 0))
  %143 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i32 0, i32 0))
  %144 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.26, i32 0, i32 0))
  %145 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %146 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.29, i32 0, i32 0), i32 0)
  %147 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.31, i32 0, i32 0))
  %148 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0))
  %149 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.34, i32 0, i32 0), i32 0)
  %150 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.36, i32 0, i32 0))
  %151 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.38, i32 0, i32 0))
  %152 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.39, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.40, i32 0, i32 0))
  %153 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.41, i32 0, i32 0))
  %154 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.42, i32 0, i32 0))
  %155 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.43, i32 0, i32 0))
  %156 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.44, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  %157 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.45, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.46, i32 0, i32 0))
  %158 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.47, i32 0, i32 0))
  %159 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.49, i32 0, i32 0))
  %160 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.50, i32 0, i32 0), i32 100)
  %161 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.51, i32 0, i32 0), i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.52, i32 0, i32 0))
  %162 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.53, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %163 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.54, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.55, i32 0, i32 0))
  %164 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.56, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.57, i32 0, i32 0))
  %165 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.58, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.55, i32 0, i32 0))
  %166 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.59, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.60, i32 0, i32 0))
  %167 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.62, i32 0, i32 0))
  %168 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.63, i32 0, i32 0), i32 4088)
  %169 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.64, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.65, i32 0, i32 0))
  %170 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.66, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.67, i32 0, i32 0))
  %171 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.68, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.69, i32 0, i32 0))
  %172 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.70, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.71, i32 0, i32 0))
  %173 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.72, i32 0, i32 0), i32 32)
  %174 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.73, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.74, i32 0, i32 0))
  %175 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.75, i32 0, i32 0), i32 32)
  %176 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.77, i32 0, i32 0))
  %177 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.78, i32 0, i32 0), i32 20)
  %178 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.79, i32 0, i32 0), i32 10)
  %179 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.80, i32 0, i32 0), i32 5)
  %180 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.81, i32 0, i32 0), i32 255)
  %181 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.82, i32 0, i32 0), i32 4096)
  %182 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.83, i32 0, i32 0), i32 70)
  %183 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.84, i32 0, i32 0), i32 4)
  %184 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.85, i32 0, i32 0), i32 10)
  %185 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.86, i32 0, i32 0), i32 100)
  %186 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.87, i32 0, i32 0), i32 10)
  %187 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.88, i32 0, i32 0), i32 10)
  %188 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.89, i32 0, i32 0), i32 0)
  %189 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.90, i32 0, i32 0), i32 2)
  %190 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.91, i32 0, i32 0))
  %191 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.92, i32 0, i32 0), i32 1)
  %192 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.93, i32 0, i32 0), i32 0)
  %193 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.94, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.95, i32 0, i32 0))
  %194 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.96, i32 0, i32 0))
  %195 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.97, i32 0, i32 0))
  %196 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.98, i32 0, i32 0))
  %197 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.99, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.100, i32 0, i32 0))
  %198 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.101, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.31, i32 0, i32 0))
  %199 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.102, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0))
  %200 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.103, i32 0, i32 0))
  %201 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.104, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.105, i32 0, i32 0))
  %202 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.106, i32 0, i32 0))
  %203 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.107, i32 0, i32 0))
  %204 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.108, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.55, i32 0, i32 0))
  %205 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.109, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.110, i32 0, i32 0))
  %206 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.111, i32 0, i32 0), i32 1000)
  %207 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.112, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.113, i32 0, i32 0))
  %208 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.114, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.115, i32 0, i32 0))
  %209 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.116, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.55, i32 0, i32 0))
  %210 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.117, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.118, i32 0, i32 0))
  %211 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.119, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.120, i32 0, i32 0))
  %212 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.121, i32 0, i32 0))
  %213 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.122, i32 0, i32 0))
  %214 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.123, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.124, i32 0, i32 0))
  %215 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.125, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.126, i32 0, i32 0))
  br label %216

; <label>:216:                                    ; preds = %129, %122
  call void @exit(i32 0) #9
  unreachable

; <label>:217:                                    ; preds = %87
  %pgocount16 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 7)
  %218 = add i64 %pgocount16, 1
  store i64 %218, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 7)
  %219 = load i32, i32* %17, align 4
  %220 = icmp sgt i32 %219, 2
  br i1 %220, label %221, label %223

; <label>:221:                                    ; preds = %217
  %pgocount17 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 41)
  %222 = add i64 %pgocount17, 1
  store i64 %222, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 41)
  call void @usage()
  br label %223

; <label>:223:                                    ; preds = %221, %217
  store i32 0, i32* @tflag, align 4
  store i32 0, i32* @deftflag, align 4
  %224 = load i8*, i8** %15, align 8
  %225 = icmp eq i8* %224, null
  br i1 %225, label %226, label %228

; <label>:226:                                    ; preds = %223
  %pgocount18 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 67)
  %227 = add i64 %pgocount18, 1
  store i64 %227, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 67)
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.127, i32 0, i32 0), i8** %15, align 8
  br label %228

; <label>:228:                                    ; preds = %226, %223
  br label %661

; <label>:229:                                    ; preds = %87
  %pgocount19 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 8)
  %230 = add i64 %pgocount19, 1
  store i64 %230, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 8)
  %231 = load i32, i32* %17, align 4
  %232 = icmp sgt i32 %231, 2
  br i1 %232, label %233, label %235

; <label>:233:                                    ; preds = %229
  %pgocount20 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 42)
  %234 = add i64 %pgocount20, 1
  store i64 %234, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 42)
  call void @usage()
  br label %235

; <label>:235:                                    ; preds = %233, %229
  store i32 1, i32* @tflag, align 4
  store i32 1, i32* @deftflag, align 4
  %236 = load i8*, i8** %15, align 8
  %237 = icmp eq i8* %236, null
  br i1 %237, label %238, label %240

; <label>:238:                                    ; preds = %235
  %pgocount21 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 68)
  %239 = add i64 %pgocount21, 1
  store i64 %239, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 68)
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.128, i32 0, i32 0), i8** %15, align 8
  br label %240

; <label>:240:                                    ; preds = %238, %235
  br label %661

; <label>:241:                                    ; preds = %87
  %pgocount22 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 9)
  %242 = add i64 %pgocount22, 1
  store i64 %242, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 9)
  %243 = load i8**, i8*** %5, align 8
  %244 = load i8*, i8** %243, align 8
  %245 = getelementptr inbounds i8, i8* %244, i64 2
  store i8* %245, i8** %11, align 8
  %246 = load i8*, i8** %11, align 8
  %247 = load i8, i8* %246, align 1
  %248 = sext i8 %247 to i32
  %249 = icmp eq i32 %248, 0
  br i1 %249, label %250, label %263

; <label>:250:                                    ; preds = %241
  %251 = load i8**, i8*** %5, align 8
  %252 = getelementptr inbounds i8*, i8** %251, i32 1
  store i8** %252, i8*** %5, align 8
  %253 = load i32, i32* %4, align 4
  %254 = add nsw i32 %253, -1
  store i32 %254, i32* %4, align 4
  %255 = load i32, i32* %4, align 4
  %256 = icmp eq i32 %255, 0
  br i1 %256, label %257, label %259

; <label>:257:                                    ; preds = %250
  %pgocount23 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 99)
  %258 = add i64 %pgocount23, 1
  store i64 %258, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 99)
  call void @usage()
  br label %259

; <label>:259:                                    ; preds = %257, %250
  %pgocount24 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 72)
  %260 = add i64 %pgocount24, 1
  store i64 %260, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 72)
  %261 = load i8**, i8*** %5, align 8
  %262 = load i8*, i8** %261, align 8
  store i8* %262, i8** %11, align 8
  br label %263

; <label>:263:                                    ; preds = %259, %241
  %264 = load i8*, i8** %11, align 8
  store i8* %264, i8** %15, align 8
  br label %661

; <label>:265:                                    ; preds = %87
  %pgocount25 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 10)
  %266 = add i64 %pgocount25, 1
  store i64 %266, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 10)
  %267 = load i32, i32* %17, align 4
  %268 = icmp sgt i32 %267, 2
  br i1 %268, label %269, label %271

; <label>:269:                                    ; preds = %265
  %pgocount26 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 49)
  %270 = add i64 %pgocount26, 1
  store i64 %270, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 49)
  call void @usage()
  br label %271

; <label>:271:                                    ; preds = %269, %265
  store i32 1, i32* @incfileflag, align 4
  store i32 1, i32* @aflag, align 4
  br label %661

; <label>:272:                                    ; preds = %87
  %pgocount27 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 11)
  %273 = add i64 %pgocount27, 1
  store i64 %273, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 11)
  %274 = load i32, i32* %17, align 4
  %275 = icmp sgt i32 %274, 2
  br i1 %275, label %276, label %278

; <label>:276:                                    ; preds = %272
  %pgocount28 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 50)
  %277 = add i64 %pgocount28, 1
  store i64 %277, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 50)
  call void @usage()
  br label %278

; <label>:278:                                    ; preds = %276, %272
  %279 = load i32, i32* @aflag, align 4
  %280 = add nsw i32 %279, 1
  store i32 %280, i32* @aflag, align 4
  br label %661

; <label>:281:                                    ; preds = %87
  %pgocount29 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 12)
  %282 = add i64 %pgocount29, 1
  store i64 %282, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 12)
  %283 = load i32, i32* %17, align 4
  %284 = icmp sgt i32 %283, 2
  br i1 %284, label %285, label %287

; <label>:285:                                    ; preds = %281
  %pgocount30 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 51)
  %286 = add i64 %pgocount30, 1
  store i64 %286, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 51)
  call void @usage()
  br label %287

; <label>:287:                                    ; preds = %285, %281
  %288 = load i32, i32* @dumpflag, align 4
  %289 = add nsw i32 %288, 1
  store i32 %289, i32* @dumpflag, align 4
  %290 = load i32, i32* @nodictflag, align 4
  %291 = add nsw i32 %290, 1
  store i32 %291, i32* @nodictflag, align 4
  br label %661

; <label>:292:                                    ; preds = %87
  %293 = load i32, i32* %17, align 4
  %294 = icmp sgt i32 %293, 3
  br i1 %294, label %295, label %297

; <label>:295:                                    ; preds = %292
  %pgocount31 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 43)
  %296 = add i64 %pgocount31, 1
  store i64 %296, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 43)
  call void @usage()
  br label %297

; <label>:297:                                    ; preds = %295, %292
  store i32 1, i32* @eflag, align 4
  %298 = load i8**, i8*** %5, align 8
  %299 = load i8*, i8** %298, align 8
  %300 = getelementptr inbounds i8, i8* %299, i64 2
  %301 = load i8, i8* %300, align 1
  %302 = sext i8 %301 to i32
  %303 = icmp eq i32 %302, 101
  br i1 %303, label %304, label %306

; <label>:304:                                    ; preds = %297
  %pgocount32 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 44)
  %305 = add i64 %pgocount32, 1
  store i64 %305, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 44)
  store i32 2, i32* @eflag, align 4
  br label %341

; <label>:306:                                    ; preds = %297
  %307 = load i8**, i8*** %5, align 8
  %308 = load i8*, i8** %307, align 8
  %309 = getelementptr inbounds i8, i8* %308, i64 2
  %310 = load i8, i8* %309, align 1
  %311 = sext i8 %310 to i32
  %312 = icmp sge i32 %311, 49
  br i1 %312, label %313, label %329

; <label>:313:                                    ; preds = %306
  %pgocount33 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 87)
  %314 = add i64 %pgocount33, 1
  store i64 %314, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 87)
  %315 = load i8**, i8*** %5, align 8
  %316 = load i8*, i8** %315, align 8
  %317 = getelementptr inbounds i8, i8* %316, i64 2
  %318 = load i8, i8* %317, align 1
  %319 = sext i8 %318 to i32
  %320 = icmp sle i32 %319, 52
  br i1 %320, label %321, label %329

; <label>:321:                                    ; preds = %313
  %pgocount34 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 107)
  %322 = add i64 %pgocount34, 1
  store i64 %322, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 107)
  %323 = load i8**, i8*** %5, align 8
  %324 = load i8*, i8** %323, align 8
  %325 = getelementptr inbounds i8, i8* %324, i64 2
  %326 = load i8, i8* %325, align 1
  %327 = sext i8 %326 to i32
  %328 = sub nsw i32 %327, 48
  store i32 %328, i32* @eflag, align 4
  br label %340

; <label>:329:                                    ; preds = %313, %306
  %330 = load i8**, i8*** %5, align 8
  %331 = load i8*, i8** %330, align 8
  %332 = getelementptr inbounds i8, i8* %331, i64 2
  %333 = load i8, i8* %332, align 1
  %334 = sext i8 %333 to i32
  %335 = icmp ne i32 %334, 0
  br i1 %335, label %336, label %338

; <label>:336:                                    ; preds = %329
  %pgocount35 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 88)
  %337 = add i64 %pgocount35, 1
  store i64 %337, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 88)
  call void @usage()
  br label %338

; <label>:338:                                    ; preds = %336, %329
  %pgocount36 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 69)
  %339 = add i64 %pgocount36, 1
  store i64 %339, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 69)
  br label %340

; <label>:340:                                    ; preds = %338, %321
  br label %341

; <label>:341:                                    ; preds = %340, %304
  %342 = load i32, i32* @nodictflag, align 4
  %343 = add nsw i32 %342, 1
  store i32 %343, i32* @nodictflag, align 4
  br label %661

; <label>:344:                                    ; preds = %87
  %pgocount37 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 13)
  %345 = add i64 %pgocount37, 1
  store i64 %345, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 13)
  %346 = load i32, i32* %17, align 4
  %347 = icmp sgt i32 %346, 2
  br i1 %347, label %348, label %350

; <label>:348:                                    ; preds = %344
  %pgocount38 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 45)
  %349 = add i64 %pgocount38, 1
  store i64 %349, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 45)
  call void @usage()
  br label %350

; <label>:350:                                    ; preds = %348, %344
  %351 = load i32, i32* @cflag, align 4
  %352 = add nsw i32 %351, 1
  store i32 %352, i32* @cflag, align 4
  %353 = load i32, i32* @lflag, align 4
  %354 = add nsw i32 %353, 1
  store i32 %354, i32* @lflag, align 4
  %355 = load i32, i32* @nodictflag, align 4
  %356 = add nsw i32 %355, 1
  store i32 %356, i32* @nodictflag, align 4
  br label %661

; <label>:357:                                    ; preds = %87
  %pgocount39 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 14)
  %358 = add i64 %pgocount39, 1
  store i64 %358, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 14)
  %359 = load i32, i32* %17, align 4
  %360 = icmp sgt i32 %359, 2
  br i1 %360, label %361, label %363

; <label>:361:                                    ; preds = %357
  %pgocount40 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 52)
  %362 = add i64 %pgocount40, 1
  store i64 %362, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 52)
  call void @usage()
  br label %363

; <label>:363:                                    ; preds = %361, %357
  store i32 0, i32* @xflag, align 4
  br label %661

; <label>:364:                                    ; preds = %87
  %pgocount41 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 15)
  %365 = add i64 %pgocount41, 1
  store i64 %365, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 15)
  %366 = load i32, i32* %17, align 4
  %367 = icmp sgt i32 %366, 2
  br i1 %367, label %368, label %370

; <label>:368:                                    ; preds = %364
  %pgocount42 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 53)
  %369 = add i64 %pgocount42, 1
  store i64 %369, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 53)
  call void @usage()
  br label %370

; <label>:370:                                    ; preds = %368, %364
  store i32 1, i32* @xflag, align 4
  br label %661

; <label>:371:                                    ; preds = %87
  %pgocount43 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 16)
  %372 = add i64 %pgocount43, 1
  store i64 %372, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 16)
  %373 = load i32, i32* @fflag, align 4
  %374 = add nsw i32 %373, 1
  store i32 %374, i32* @fflag, align 4
  %375 = load i8**, i8*** %5, align 8
  %376 = load i8*, i8** %375, align 8
  %377 = getelementptr inbounds i8, i8* %376, i64 2
  store i8* %377, i8** %11, align 8
  %378 = load i8*, i8** %11, align 8
  %379 = load i8, i8* %378, align 1
  %380 = sext i8 %379 to i32
  %381 = icmp eq i32 %380, 0
  br i1 %381, label %382, label %395

; <label>:382:                                    ; preds = %371
  %383 = load i8**, i8*** %5, align 8
  %384 = getelementptr inbounds i8*, i8** %383, i32 1
  store i8** %384, i8*** %5, align 8
  %385 = load i32, i32* %4, align 4
  %386 = add nsw i32 %385, -1
  store i32 %386, i32* %4, align 4
  %387 = load i32, i32* %4, align 4
  %388 = icmp eq i32 %387, 0
  br i1 %388, label %389, label %391

; <label>:389:                                    ; preds = %382
  %pgocount44 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 100)
  %390 = add i64 %pgocount44, 1
  store i64 %390, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 100)
  call void @usage()
  br label %391

; <label>:391:                                    ; preds = %389, %382
  %pgocount45 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 73)
  %392 = add i64 %pgocount45, 1
  store i64 %392, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 73)
  %393 = load i8**, i8*** %5, align 8
  %394 = load i8*, i8** %393, align 8
  store i8* %394, i8** %11, align 8
  br label %395

; <label>:395:                                    ; preds = %391, %371
  %396 = load i8*, i8** %11, align 8
  store i8* %396, i8** @askfilename, align 8
  %397 = load i8*, i8** @askfilename, align 8
  %398 = load i8, i8* %397, align 1
  %399 = sext i8 %398 to i32
  %400 = icmp eq i32 %399, 0
  br i1 %400, label %401, label %403

; <label>:401:                                    ; preds = %395
  %pgocount46 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 74)
  %402 = add i64 %pgocount46, 1
  store i64 %402, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 74)
  store i8* null, i8** @askfilename, align 8
  br label %403

; <label>:403:                                    ; preds = %401, %395
  br label %661

; <label>:404:                                    ; preds = %87
  %pgocount47 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 17)
  %405 = add i64 %pgocount47, 1
  store i64 %405, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 17)
  %406 = load i8**, i8*** %5, align 8
  %407 = load i8*, i8** %406, align 8
  %408 = getelementptr inbounds i8, i8* %407, i64 2
  store i8* %408, i8** %11, align 8
  %409 = load i8*, i8** %11, align 8
  %410 = load i8, i8* %409, align 1
  %411 = sext i8 %410 to i32
  %412 = icmp eq i32 %411, 0
  br i1 %412, label %413, label %426

; <label>:413:                                    ; preds = %404
  %414 = load i8**, i8*** %5, align 8
  %415 = getelementptr inbounds i8*, i8** %414, i32 1
  store i8** %415, i8*** %5, align 8
  %416 = load i32, i32* %4, align 4
  %417 = add nsw i32 %416, -1
  store i32 %417, i32* %4, align 4
  %418 = load i32, i32* %4, align 4
  %419 = icmp eq i32 %418, 0
  br i1 %419, label %420, label %422

; <label>:420:                                    ; preds = %413
  %pgocount48 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 101)
  %421 = add i64 %pgocount48, 1
  store i64 %421, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 101)
  call void @usage()
  br label %422

; <label>:422:                                    ; preds = %420, %413
  %pgocount49 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 75)
  %423 = add i64 %pgocount49, 1
  store i64 %423, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 75)
  %424 = load i8**, i8*** %5, align 8
  %425 = load i8*, i8** %424, align 8
  store i8* %425, i8** %11, align 8
  br label %426

; <label>:426:                                    ; preds = %422, %404
  %427 = load i8*, i8** %11, align 8
  %428 = call i32 @atoi(i8* %427) #8
  store i32 %428, i32* @contextsize, align 4
  br label %661

; <label>:429:                                    ; preds = %87
  %pgocount50 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 18)
  %430 = add i64 %pgocount50, 1
  store i64 %430, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 18)
  %431 = load i32, i32* %17, align 4
  %432 = icmp sgt i32 %431, 2
  br i1 %432, label %433, label %435

; <label>:433:                                    ; preds = %429
  %pgocount51 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 54)
  %434 = add i64 %pgocount51, 1
  store i64 %434, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 54)
  call void @usage()
  br label %435

; <label>:435:                                    ; preds = %433, %429
  %436 = load i32, i32* @lflag, align 4
  %437 = add nsw i32 %436, 1
  store i32 %437, i32* @lflag, align 4
  br label %661

; <label>:438:                                    ; preds = %87
  %pgocount52 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 19)
  %439 = add i64 %pgocount52, 1
  store i64 %439, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 19)
  %440 = load i32, i32* %17, align 4
  %441 = icmp sgt i32 %440, 2
  br i1 %441, label %442, label %444

; <label>:442:                                    ; preds = %438
  %pgocount53 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 55)
  %443 = add i64 %pgocount53, 1
  store i64 %443, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 55)
  call void @usage()
  br label %444

; <label>:444:                                    ; preds = %442, %438
  %445 = load i32, i32* @sflag, align 4
  %446 = add nsw i32 %445, 1
  store i32 %446, i32* @sflag, align 4
  br label %661

; <label>:447:                                    ; preds = %87
  %pgocount54 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 20)
  %448 = add i64 %pgocount54, 1
  store i64 %448, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 20)
  %449 = load i32, i32* %17, align 4
  %450 = icmp sgt i32 %449, 2
  br i1 %450, label %451, label %453

; <label>:451:                                    ; preds = %447
  %pgocount55 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 46)
  %452 = add i64 %pgocount55, 1
  store i64 %452, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 46)
  call void @usage()
  br label %453

; <label>:453:                                    ; preds = %451, %447
  store i32 0, i32* @sortit, align 4
  br label %661

; <label>:454:                                    ; preds = %87
  %pgocount56 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 21)
  %455 = add i64 %pgocount56, 1
  store i64 %455, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 21)
  %456 = load i32, i32* %17, align 4
  %457 = icmp sgt i32 %456, 2
  br i1 %457, label %458, label %460

; <label>:458:                                    ; preds = %454
  %pgocount57 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 57)
  %459 = add i64 %pgocount57, 1
  store i64 %459, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 57)
  call void @usage()
  br label %460

; <label>:460:                                    ; preds = %458, %454
  store i32 0, i32* @compoundflag, align 4
  br label %661

; <label>:461:                                    ; preds = %87
  %pgocount58 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 22)
  %462 = add i64 %pgocount58, 1
  store i64 %462, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 22)
  %463 = load i32, i32* %17, align 4
  %464 = icmp sgt i32 %463, 2
  br i1 %464, label %465, label %467

; <label>:465:                                    ; preds = %461
  %pgocount59 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 47)
  %466 = add i64 %pgocount59, 1
  store i64 %466, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 47)
  call void @usage()
  br label %467

; <label>:467:                                    ; preds = %465, %461
  store i32 1, i32* @compoundflag, align 4
  br label %661

; <label>:468:                                    ; preds = %87
  %pgocount60 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 23)
  %469 = add i64 %pgocount60, 1
  store i64 %469, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 23)
  %470 = load i32, i32* %17, align 4
  %471 = icmp sgt i32 %470, 2
  br i1 %471, label %472, label %474

; <label>:472:                                    ; preds = %468
  %pgocount61 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 58)
  %473 = add i64 %pgocount61, 1
  store i64 %473, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 58)
  call void @usage()
  br label %474

; <label>:474:                                    ; preds = %472, %468
  store i32 0, i32* @tryhardflag, align 4
  br label %661

; <label>:475:                                    ; preds = %87
  %pgocount62 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 24)
  %476 = add i64 %pgocount62, 1
  store i64 %476, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 24)
  %477 = load i32, i32* %17, align 4
  %478 = icmp sgt i32 %477, 2
  br i1 %478, label %479, label %481

; <label>:479:                                    ; preds = %475
  %pgocount63 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 56)
  %480 = add i64 %pgocount63, 1
  store i64 %480, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 56)
  call void @usage()
  br label %481

; <label>:481:                                    ; preds = %479, %475
  store i32 1, i32* @tryhardflag, align 4
  br label %661

; <label>:482:                                    ; preds = %87
  %pgocount64 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 25)
  %483 = add i64 %pgocount64, 1
  store i64 %483, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 25)
  %484 = load i32, i32* %17, align 4
  %485 = icmp sgt i32 %484, 2
  br i1 %485, label %486, label %488

; <label>:486:                                    ; preds = %482
  %pgocount65 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 59)
  %487 = add i64 %pgocount65, 1
  store i64 %487, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 59)
  call void @usage()
  br label %488

; <label>:488:                                    ; preds = %486, %482
  store i32 0, i32* @minimenusize, align 4
  br label %661

; <label>:489:                                    ; preds = %87
  %pgocount66 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 26)
  %490 = add i64 %pgocount66, 1
  store i64 %490, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 26)
  %491 = load i32, i32* %17, align 4
  %492 = icmp sgt i32 %491, 2
  br i1 %492, label %493, label %495

; <label>:493:                                    ; preds = %489
  %pgocount67 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 48)
  %494 = add i64 %pgocount67, 1
  store i64 %494, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 48)
  call void @usage()
  br label %495

; <label>:495:                                    ; preds = %493, %489
  store i32 2, i32* @minimenusize, align 4
  br label %661

; <label>:496:                                    ; preds = %87
  %pgocount68 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 27)
  %497 = add i64 %pgocount68, 1
  store i64 %497, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 27)
  %498 = load i8**, i8*** %5, align 8
  %499 = load i8*, i8** %498, align 8
  %500 = getelementptr inbounds i8, i8* %499, i64 2
  store i8* %500, i8** %12, align 8
  %501 = load i8*, i8** %12, align 8
  %502 = load i8, i8* %501, align 1
  %503 = sext i8 %502 to i32
  %504 = icmp eq i32 %503, 0
  br i1 %504, label %505, label %525

; <label>:505:                                    ; preds = %496
  %506 = load i8**, i8*** %5, align 8
  %507 = getelementptr inbounds i8*, i8** %506, i32 1
  store i8** %507, i8*** %5, align 8
  %508 = load i32, i32* %4, align 4
  %509 = add nsw i32 %508, -1
  store i32 %509, i32* %4, align 4
  %510 = load i32, i32* %4, align 4
  %511 = icmp eq i32 %510, 0
  br i1 %511, label %512, label %514

; <label>:512:                                    ; preds = %505
  %pgocount69 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 96)
  %513 = add i64 %pgocount69, 1
  store i64 %513, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 96)
  call void @usage()
  br label %514

; <label>:514:                                    ; preds = %512, %505
  %515 = load i8**, i8*** %5, align 8
  %516 = load i8*, i8** %515, align 8
  store i8* %516, i8** %12, align 8
  %517 = load i8*, i8** %12, align 8
  %518 = load i8, i8* %517, align 1
  %519 = sext i8 %518 to i32
  %520 = icmp eq i32 %519, 0
  br i1 %520, label %521, label %523

; <label>:521:                                    ; preds = %514
  %pgocount70 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 97)
  %522 = add i64 %pgocount70, 1
  store i64 %522, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 97)
  store i8* null, i8** %12, align 8
  br label %523

; <label>:523:                                    ; preds = %521, %514
  %pgocount71 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 70)
  %524 = add i64 %pgocount71, 1
  store i64 %524, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 70)
  br label %525

; <label>:525:                                    ; preds = %523, %496
  store i8* null, i8** @LibDict, align 8
  br label %661

; <label>:526:                                    ; preds = %87
  %527 = load i8**, i8*** %5, align 8
  %528 = load i8*, i8** %527, align 8
  %529 = getelementptr inbounds i8, i8* %528, i64 2
  store i8* %529, i8** %11, align 8
  %530 = load i8*, i8** %11, align 8
  %531 = load i8, i8* %530, align 1
  %532 = sext i8 %531 to i32
  %533 = icmp eq i32 %532, 0
  br i1 %533, label %534, label %547

; <label>:534:                                    ; preds = %526
  %535 = load i8**, i8*** %5, align 8
  %536 = getelementptr inbounds i8*, i8** %535, i32 1
  store i8** %536, i8*** %5, align 8
  %537 = load i32, i32* %4, align 4
  %538 = add nsw i32 %537, -1
  store i32 %538, i32* %4, align 4
  %539 = load i32, i32* %4, align 4
  %540 = icmp eq i32 %539, 0
  br i1 %540, label %541, label %543

; <label>:541:                                    ; preds = %534
  %pgocount72 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 102)
  %542 = add i64 %pgocount72, 1
  store i64 %542, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 102)
  call void @usage()
  br label %543

; <label>:543:                                    ; preds = %541, %534
  %pgocount73 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 77)
  %544 = add i64 %pgocount73, 1
  store i64 %544, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 77)
  %545 = load i8**, i8*** %5, align 8
  %546 = load i8*, i8** %545, align 8
  store i8* %546, i8** %11, align 8
  br label %547

; <label>:547:                                    ; preds = %543, %526
  %548 = load i8*, i8** %11, align 8
  %549 = call i8* @index(i8* %548, i32 47) #8
  %550 = icmp ne i8* %549, null
  br i1 %550, label %551, label %555

; <label>:551:                                    ; preds = %547
  %pgocount74 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 36)
  %552 = add i64 %pgocount74, 1
  store i64 %552, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 36)
  %553 = load i8*, i8** %11, align 8
  %554 = call i8* @strcpy(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0), i8* %553) #7
  br label %559

; <label>:555:                                    ; preds = %547
  %pgocount75 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 78)
  %556 = add i64 %pgocount75, 1
  store i64 %556, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 78)
  %557 = load i8*, i8** %11, align 8
  %558 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8* %557) #7
  br label %559

; <label>:559:                                    ; preds = %555, %551
  %560 = load i8*, i8** %12, align 8
  %561 = icmp eq i8* %560, null
  br i1 %561, label %562, label %571

; <label>:562:                                    ; preds = %559
  %pgocount76 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 79)
  %563 = add i64 %pgocount76, 1
  store i64 %563, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 79)
  %564 = load i8*, i8** %11, align 8
  %565 = load i8, i8* %564, align 1
  %566 = sext i8 %565 to i32
  %567 = icmp ne i32 %566, 0
  br i1 %567, label %568, label %571

; <label>:568:                                    ; preds = %562
  %pgocount77 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 89)
  %569 = add i64 %pgocount77, 1
  store i64 %569, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 89)
  %570 = load i8*, i8** %11, align 8
  store i8* %570, i8** @LibDict, align 8
  br label %571

; <label>:571:                                    ; preds = %568, %562, %559
  %572 = load i8*, i8** %11, align 8
  %573 = call i8* @rindex(i8* %572, i32 46) #8
  store i8* %573, i8** %11, align 8
  %574 = load i8*, i8** %11, align 8
  %575 = icmp ne i8* %574, null
  br i1 %575, label %576, label %584

; <label>:576:                                    ; preds = %571
  %pgocount78 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 37)
  %577 = add i64 %pgocount78, 1
  store i64 %577, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 37)
  %578 = load i8*, i8** %11, align 8
  %579 = call i32 @strcmp(i8* %578, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0)) #8
  %580 = icmp eq i32 %579, 0
  br i1 %580, label %581, label %584

; <label>:581:                                    ; preds = %576
  %pgocount79 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 90)
  %582 = add i64 %pgocount79, 1
  store i64 %582, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 90)
  %583 = load i8*, i8** %11, align 8
  store i8 0, i8* %583, align 1
  br label %586

; <label>:584:                                    ; preds = %576, %571
  %585 = call i8* @strcat(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0)) #7
  br label %586

; <label>:586:                                    ; preds = %584, %581
  %587 = load i8*, i8** @LibDict, align 8
  %588 = icmp ne i8* %587, null
  br i1 %588, label %589, label %600

; <label>:589:                                    ; preds = %586
  %590 = load i8*, i8** @LibDict, align 8
  %591 = call i8* @rindex(i8* %590, i32 47) #8
  store i8* %591, i8** %11, align 8
  %592 = load i8*, i8** %11, align 8
  %593 = icmp ne i8* %592, null
  br i1 %593, label %594, label %598

; <label>:594:                                    ; preds = %589
  %pgocount80 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 66)
  %595 = add i64 %pgocount80, 1
  store i64 %595, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 66)
  %596 = load i8*, i8** %11, align 8
  %597 = getelementptr inbounds i8, i8* %596, i64 1
  store i8* %597, i8** @LibDict, align 8
  br label %598

; <label>:598:                                    ; preds = %594, %589
  %pgocount81 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 38)
  %599 = add i64 %pgocount81, 1
  store i64 %599, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 38)
  br label %600

; <label>:600:                                    ; preds = %598, %586
  br label %661

; <label>:601:                                    ; preds = %87
  %pgocount82 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 28)
  %602 = add i64 %pgocount82, 1
  store i64 %602, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 28)
  %603 = load i32, i32* %17, align 4
  %604 = icmp sgt i32 %603, 2
  br i1 %604, label %605, label %607

; <label>:605:                                    ; preds = %601
  %pgocount83 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 40)
  %606 = add i64 %pgocount83, 1
  store i64 %606, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 40)
  call void @usage()
  br label %607

; <label>:607:                                    ; preds = %605, %601
  store i32 1, i32* @vflag, align 4
  br label %661

; <label>:608:                                    ; preds = %87
  %pgocount84 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 29)
  %609 = add i64 %pgocount84, 1
  store i64 %609, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 29)
  %610 = load i8**, i8*** %5, align 8
  %611 = load i8*, i8** %610, align 8
  %612 = getelementptr inbounds i8, i8* %611, i64 2
  store i8* %612, i8** %14, align 8
  %613 = load i8*, i8** %14, align 8
  %614 = load i8, i8* %613, align 1
  %615 = sext i8 %614 to i32
  %616 = icmp eq i32 %615, 0
  br i1 %616, label %617, label %630

; <label>:617:                                    ; preds = %608
  %618 = load i8**, i8*** %5, align 8
  %619 = getelementptr inbounds i8*, i8** %618, i32 1
  store i8** %619, i8*** %5, align 8
  %620 = load i32, i32* %4, align 4
  %621 = add nsw i32 %620, -1
  store i32 %621, i32* %4, align 4
  %622 = load i32, i32* %4, align 4
  %623 = icmp eq i32 %622, 0
  br i1 %623, label %624, label %626

; <label>:624:                                    ; preds = %617
  %pgocount85 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 103)
  %625 = add i64 %pgocount85, 1
  store i64 %625, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 103)
  call void @usage()
  br label %626

; <label>:626:                                    ; preds = %624, %617
  %pgocount86 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 76)
  %627 = add i64 %pgocount86, 1
  store i64 %627, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 76)
  %628 = load i8**, i8*** %5, align 8
  %629 = load i8*, i8** %628, align 8
  store i8* %629, i8** %14, align 8
  br label %630

; <label>:630:                                    ; preds = %626, %608
  br label %661

; <label>:631:                                    ; preds = %87
  %632 = load i8**, i8*** %5, align 8
  %633 = load i8*, i8** %632, align 8
  %634 = getelementptr inbounds i8, i8* %633, i64 2
  %635 = load i8, i8* %634, align 1
  %636 = sext i8 %635 to i32
  %637 = icmp eq i32 %636, 0
  br i1 %637, label %638, label %652

; <label>:638:                                    ; preds = %631
  %639 = load i8**, i8*** %5, align 8
  %640 = getelementptr inbounds i8*, i8** %639, i32 1
  store i8** %640, i8*** %5, align 8
  %641 = load i32, i32* %4, align 4
  %642 = add nsw i32 %641, -1
  store i32 %642, i32* %4, align 4
  %643 = load i32, i32* %4, align 4
  %644 = icmp eq i32 %643, 0
  br i1 %644, label %645, label %647

; <label>:645:                                    ; preds = %638
  %pgocount87 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 98)
  %646 = add i64 %pgocount87, 1
  store i64 %646, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 98)
  call void @usage()
  br label %647

; <label>:647:                                    ; preds = %645, %638
  %pgocount88 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 71)
  %648 = add i64 %pgocount88, 1
  store i64 %648, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 71)
  %649 = load i8**, i8*** %5, align 8
  %650 = load i8*, i8** %649, align 8
  %651 = call i32 @atoi(i8* %650) #8
  store i32 %651, i32* @minword, align 4
  br label %658

; <label>:652:                                    ; preds = %631
  %pgocount89 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 35)
  %653 = add i64 %pgocount89, 1
  store i64 %653, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 35)
  %654 = load i8**, i8*** %5, align 8
  %655 = load i8*, i8** %654, align 8
  %656 = getelementptr inbounds i8, i8* %655, i64 2
  %657 = call i32 @atoi(i8* %656) #8
  store i32 %657, i32* @minword, align 4
  br label %658

; <label>:658:                                    ; preds = %652, %647
  br label %661

; <label>:659:                                    ; preds = %87
  %pgocount90 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 6)
  %660 = add i64 %pgocount90, 1
  store i64 %660, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 6)
  call void @usage()
  br label %661

; <label>:661:                                    ; preds = %659, %658, %630, %607, %600, %525, %495, %488, %481, %474, %467, %460, %453, %444, %435, %426, %403, %370, %363, %350, %341, %287, %278, %271, %263, %240, %228
  %662 = load i8**, i8*** %5, align 8
  %663 = getelementptr inbounds i8*, i8** %662, i32 1
  store i8** %663, i8*** %5, align 8
  %664 = load i32, i32* %4, align 4
  %665 = add nsw i32 %664, -1
  store i32 %665, i32* %4, align 4
  br label %75

; <label>:666:                                    ; preds = %85
  %667 = load i32, i32* %4, align 4
  %668 = icmp ne i32 %667, 0
  br i1 %668, label %687, label %669

; <label>:669:                                    ; preds = %666
  %pgocount91 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 80)
  %670 = add i64 %pgocount91, 1
  store i64 %670, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 80)
  %671 = load i32, i32* @lflag, align 4
  %672 = icmp ne i32 %671, 0
  br i1 %672, label %687, label %673

; <label>:673:                                    ; preds = %669
  %674 = load i32, i32* @aflag, align 4
  %675 = icmp ne i32 %674, 0
  br i1 %675, label %._crit_edge3, label %677

._crit_edge3:                                     ; preds = %673
  %pgocount92 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 105)
  %676 = add i64 %pgocount92, 1
  store i64 %676, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 105)
  br label %687

; <label>:677:                                    ; preds = %673
  %pgocount93 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 110)
  %678 = add i64 %pgocount93, 1
  store i64 %678, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 110)
  %679 = load i32, i32* @eflag, align 4
  %680 = icmp ne i32 %679, 0
  br i1 %680, label %687, label %681

; <label>:681:                                    ; preds = %677
  %pgocount94 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 112)
  %682 = add i64 %pgocount94, 1
  store i64 %682, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 112)
  %683 = load i32, i32* @dumpflag, align 4
  %684 = icmp ne i32 %683, 0
  br i1 %684, label %687, label %685

; <label>:685:                                    ; preds = %681
  %pgocount95 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 113)
  %686 = add i64 %pgocount95, 1
  store i64 %686, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 113)
  call void @usage()
  br label %687

; <label>:687:                                    ; preds = %._crit_edge3, %685, %681, %677, %669, %666
  store i32 0, i32* %16, align 4
  br label %688

; <label>:688:                                    ; preds = %703, %687
  %689 = load i32, i32* %16, align 4
  %690 = load i32, i32* %4, align 4
  %691 = icmp slt i32 %689, %690
  br i1 %691, label %692, label %707

; <label>:692:                                    ; preds = %688
  %693 = load i8**, i8*** %5, align 8
  %694 = load i32, i32* %16, align 4
  %695 = sext i32 %694 to i64
  %696 = getelementptr inbounds i8*, i8** %693, i64 %695
  %697 = load i8*, i8** %696, align 8
  %698 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @access to i32 (i8*, i32, ...)*)(i8* %697, i32 4)
  %699 = icmp sge i32 %698, 0
  br i1 %699, label %700, label %702

; <label>:700:                                    ; preds = %692
  %pgocount96 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 61)
  %701 = add i64 %pgocount96, 1
  store i64 %701, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 61)
  br label %707

; <label>:702:                                    ; preds = %692
  br label %703

; <label>:703:                                    ; preds = %702
  %pgocount97 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 5)
  %704 = add i64 %pgocount97, 1
  store i64 %704, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 5)
  %705 = load i32, i32* %16, align 4
  %706 = add nsw i32 %705, 1
  store i32 %706, i32* %16, align 4
  br label %688

; <label>:707:                                    ; preds = %700, %688
  %708 = load i32, i32* %16, align 4
  %709 = load i32, i32* %4, align 4
  %710 = icmp sge i32 %708, %709
  br i1 %710, label %712, label %._crit_edge2

._crit_edge2:                                     ; preds = %707
  %pgocount98 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 60)
  %711 = add i64 %pgocount98, 1
  store i64 %711, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 60)
  br label %741

; <label>:712:                                    ; preds = %707
  %713 = load i32, i32* @lflag, align 4
  %714 = icmp ne i32 %713, 0
  br i1 %714, label %741, label %715

; <label>:715:                                    ; preds = %712
  %pgocount99 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 95)
  %716 = add i64 %pgocount99, 1
  store i64 %716, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 95)
  %717 = load i32, i32* @aflag, align 4
  %718 = icmp ne i32 %717, 0
  br i1 %718, label %741, label %719

; <label>:719:                                    ; preds = %715
  %pgocount100 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 109)
  %720 = add i64 %pgocount100, 1
  store i64 %720, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 109)
  %721 = load i32, i32* @eflag, align 4
  %722 = icmp ne i32 %721, 0
  br i1 %722, label %741, label %723

; <label>:723:                                    ; preds = %719
  %pgocount101 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 111)
  %724 = add i64 %pgocount101, 1
  store i64 %724, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 111)
  %725 = load i32, i32* @dumpflag, align 4
  %726 = icmp ne i32 %725, 0
  br i1 %726, label %741, label %727

; <label>:727:                                    ; preds = %723
  %728 = load i32, i32* @cbench_print, align 4
  %729 = icmp ne i32 %728, 0
  br i1 %729, label %730, label %739

; <label>:730:                                    ; preds = %727
  %pgocount102 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 122)
  %731 = add i64 %pgocount102, 1
  store i64 %731, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 122)
  %732 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %733 = load i32, i32* %4, align 4
  %734 = icmp eq i32 %733, 1
  %735 = zext i1 %734 to i64
  %pgocount103 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 123)
  %736 = add i64 %pgocount103, %735
  store i64 %736, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 123)
  %737 = select i1 %734, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.129, i32 0, i32 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.130, i32 0, i32 0)
  %738 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %732, i8* %737)
  br label %739

; <label>:739:                                    ; preds = %730, %727
  %pgocount104 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 121)
  %740 = add i64 %pgocount104, 1
  store i64 %740, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 121)
  call void @exit(i32 1) #9
  unreachable

; <label>:741:                                    ; preds = %._crit_edge2, %723, %719, %715, %712
  %742 = call i32 @linit()
  %743 = icmp slt i32 %742, 0
  br i1 %743, label %744, label %746

; <label>:744:                                    ; preds = %741
  %pgocount105 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 114)
  %745 = add i64 %pgocount105, 1
  store i64 %745, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 114)
  call void @exit(i32 1) #9
  unreachable

; <label>:746:                                    ; preds = %741
  %747 = load i8*, i8** %15, align 8
  %748 = icmp ne i8* %747, null
  br i1 %748, label %749, label %781

; <label>:749:                                    ; preds = %746
  %750 = load i8*, i8** %15, align 8
  %751 = load i32, i32* @deftflag, align 4
  %752 = icmp slt i32 %751, 0
  %753 = zext i1 %752 to i64
  %pgocount106 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 124)
  %754 = add i64 %pgocount106, %753
  store i64 %754, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 124)
  %755 = select i1 %752, i32* @deftflag, i32* null
  %756 = call i32 @findfiletype(i8* %750, i32 1, i32* %755)
  store i32 %756, i32* @prefstringchar, align 4
  %757 = load i32, i32* @prefstringchar, align 4
  %758 = icmp slt i32 %757, 0
  br i1 %758, label %759, label %779

; <label>:759:                                    ; preds = %749
  %760 = load i8*, i8** %15, align 8
  %761 = call i32 @strcmp(i8* %760, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.128, i32 0, i32 0)) #8
  %762 = icmp ne i32 %761, 0
  br i1 %762, label %764, label %._crit_edge4

._crit_edge4:                                     ; preds = %759
  %pgocount107 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 106)
  %763 = add i64 %pgocount107, 1
  store i64 %763, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 106)
  br label %779

; <label>:764:                                    ; preds = %759
  %pgocount108 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 104)
  %765 = add i64 %pgocount108, 1
  store i64 %765, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 104)
  %766 = load i8*, i8** %15, align 8
  %767 = call i32 @strcmp(i8* %766, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.127, i32 0, i32 0)) #8
  %768 = icmp ne i32 %767, 0
  br i1 %768, label %769, label %779

; <label>:769:                                    ; preds = %764
  %770 = load i32, i32* @cbench_print, align 4
  %771 = icmp ne i32 %770, 0
  br i1 %771, label %772, label %777

; <label>:772:                                    ; preds = %769
  %pgocount109 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 120)
  %773 = add i64 %pgocount109, 1
  store i64 %773, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 120)
  %774 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %775 = load i8*, i8** %15, align 8
  %776 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %774, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.131, i32 0, i32 0), i8* %775)
  br label %777

; <label>:777:                                    ; preds = %772, %769
  %pgocount110 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 119)
  %778 = add i64 %pgocount110, 1
  store i64 %778, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 119)
  call void @exit(i32 1) #9
  unreachable

; <label>:779:                                    ; preds = %._crit_edge4, %764, %749
  %pgocount111 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 39)
  %780 = add i64 %pgocount111, 1
  store i64 %780, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 39)
  br label %781

; <label>:781:                                    ; preds = %779, %746
  %782 = load i32, i32* @prefstringchar, align 4
  %783 = icmp slt i32 %782, 0
  br i1 %783, label %784, label %786

; <label>:784:                                    ; preds = %781
  %pgocount112 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 81)
  %785 = add i64 %pgocount112, 1
  store i64 %785, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 81)
  store i32 0, i32* @defdupchar, align 4
  br label %788

; <label>:786:                                    ; preds = %781
  %787 = load i32, i32* @prefstringchar, align 4
  store i32 %787, i32* @defdupchar, align 4
  br label %788

; <label>:788:                                    ; preds = %786, %784
  %789 = load i32, i32* @compoundflag, align 4
  %790 = icmp slt i32 %789, 0
  br i1 %790, label %791, label %795

; <label>:791:                                    ; preds = %788
  %pgocount113 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 82)
  %792 = add i64 %pgocount113, 1
  store i64 %792, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 82)
  %793 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 17), align 2
  %794 = sext i8 %793 to i32
  store i32 %794, i32* @compoundflag, align 4
  br label %795

; <label>:795:                                    ; preds = %791, %788
  %796 = load i32, i32* @tryhardflag, align 4
  %797 = icmp slt i32 %796, 0
  br i1 %797, label %798, label %802

; <label>:798:                                    ; preds = %795
  %pgocount114 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 83)
  %799 = add i64 %pgocount114, 1
  store i64 %799, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 83)
  %800 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 18), align 1
  %801 = sext i8 %800 to i32
  store i32 %801, i32* @tryhardflag, align 4
  br label %802

; <label>:802:                                    ; preds = %798, %795
  %803 = load i8*, i8** %14, align 8
  call void @initckch(i8* %803)
  %804 = load i8*, i8** @LibDict, align 8
  %805 = icmp eq i8* %804, null
  br i1 %805, label %806, label %821

; <label>:806:                                    ; preds = %802
  %807 = call i8* @strcpy(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @main.libdictname, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i32 0, i32 0)) #7
  store i8* getelementptr inbounds ([13 x i8], [13 x i8]* @main.libdictname, i32 0, i32 0), i8** @LibDict, align 8
  %808 = call i8* @rindex(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @main.libdictname, i32 0, i32 0), i32 46) #8
  store i8* %808, i8** %11, align 8
  %809 = load i8*, i8** %11, align 8
  %810 = icmp ne i8* %809, null
  br i1 %810, label %811, label %819

; <label>:811:                                    ; preds = %806
  %pgocount115 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 91)
  %812 = add i64 %pgocount115, 1
  store i64 %812, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 91)
  %813 = load i8*, i8** %11, align 8
  %814 = call i32 @strcmp(i8* %813, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0)) #8
  %815 = icmp eq i32 %814, 0
  br i1 %815, label %816, label %819

; <label>:816:                                    ; preds = %811
  %pgocount116 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 108)
  %817 = add i64 %pgocount116, 1
  store i64 %817, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 108)
  %818 = load i8*, i8** %11, align 8
  store i8 0, i8* %818, align 1
  br label %819

; <label>:819:                                    ; preds = %816, %811, %806
  %pgocount117 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 84)
  %820 = add i64 %pgocount117, 1
  store i64 %820, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 84)
  br label %821

; <label>:821:                                    ; preds = %819, %802
  %822 = load i32, i32* @nodictflag, align 4
  %823 = icmp ne i32 %822, 0
  br i1 %823, label %828, label %824

; <label>:824:                                    ; preds = %821
  %pgocount118 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 85)
  %825 = add i64 %pgocount118, 1
  store i64 %825, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 85)
  %826 = load i8*, i8** %12, align 8
  %827 = load i8*, i8** @LibDict, align 8
  call void @treeinit(i8* %826, i8* %827)
  br label %828

; <label>:828:                                    ; preds = %824, %821
  %829 = load i32, i32* @aflag, align 4
  %830 = icmp ne i32 %829, 0
  br i1 %830, label %831, label %879

; <label>:831:                                    ; preds = %828
  %832 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.132, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.133, i32 0, i32 0))
  store %struct._IO_FILE* %832, %struct._IO_FILE** %6, align 8
  %833 = icmp eq %struct._IO_FILE* %832, null
  br i1 %833, label %834, label %838

; <label>:834:                                    ; preds = %831
  %pgocount119 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 115)
  %835 = add i64 %pgocount119, 1
  store i64 %835, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 115)
  %836 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %837 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %836, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.134, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

; <label>:838:                                    ; preds = %831
  %839 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %840 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %839, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.135, i32 0, i32 0), i64* %10)
  %841 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %842 = call i32 @fclose(%struct._IO_FILE* %841)
  store i64 0, i64* %9, align 8
  br label %843

; <label>:843:                                    ; preds = %873, %838
  %844 = load i64, i64* %9, align 8
  %845 = load i64, i64* %10, align 8
  %846 = icmp slt i64 %844, %845
  br i1 %846, label %847, label %877

; <label>:847:                                    ; preds = %843
  %848 = load i64, i64* %9, align 8
  %849 = load i64, i64* %10, align 8
  %850 = sub nsw i64 %849, 1
  %851 = icmp eq i64 %848, %850
  %852 = zext i1 %851 to i32
  store i32 %852, i32* @cbench_print, align 4
  %853 = load i8**, i8*** %5, align 8
  %854 = load i8*, i8** %853, align 8
  %855 = call %struct._IO_FILE* @fopen(i8* %854, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.133, i32 0, i32 0))
  store %struct._IO_FILE* %855, %struct._IO_FILE** @infile1, align 8
  %856 = icmp eq %struct._IO_FILE* %855, null
  br i1 %856, label %857, label %861

; <label>:857:                                    ; preds = %847
  %pgocount120 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 93)
  %858 = add i64 %pgocount120, 1
  store i64 %858, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 93)
  %859 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %860 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %859, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.136, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

; <label>:861:                                    ; preds = %847
  %862 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.137, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.138, i32 0, i32 0))
  store %struct._IO_FILE* %862, %struct._IO_FILE** @outfile1, align 8
  %863 = icmp eq %struct._IO_FILE* %862, null
  br i1 %863, label %864, label %868

; <label>:864:                                    ; preds = %861
  %pgocount121 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 94)
  %865 = add i64 %pgocount121, 1
  store i64 %865, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 94)
  %866 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %867 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %866, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.136, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

; <label>:868:                                    ; preds = %861
  call void @askmode()
  call void @treeoutput()
  %869 = load %struct._IO_FILE*, %struct._IO_FILE** @infile1, align 8
  %870 = call i32 @fclose(%struct._IO_FILE* %869)
  %871 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %872 = call i32 @fclose(%struct._IO_FILE* %871)
  br label %873

; <label>:873:                                    ; preds = %868
  %pgocount122 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 4)
  %874 = add i64 %pgocount122, 1
  store i64 %874, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 4)
  %875 = load i64, i64* %9, align 8
  %876 = add nsw i64 %875, 1
  store i64 %876, i64* %9, align 8
  br label %843

; <label>:877:                                    ; preds = %843
  %pgocount123 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 92)
  %878 = add i64 %pgocount123, 1
  store i64 %878, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 92)
  call void @exit(i32 0) #9
  unreachable

; <label>:879:                                    ; preds = %828
  %880 = load i32, i32* @eflag, align 4
  %881 = icmp ne i32 %880, 0
  br i1 %881, label %882, label %885

; <label>:882:                                    ; preds = %879
  %pgocount124 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 116)
  %883 = add i64 %pgocount124, 1
  store i64 %883, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 116)
  %884 = load i32, i32* @eflag, align 4
  call void @expandmode(i32 %884)
  call void @exit(i32 0) #9
  unreachable

; <label>:885:                                    ; preds = %879
  %886 = load i32, i32* @dumpflag, align 4
  %887 = icmp ne i32 %886, 0
  br i1 %887, label %888, label %890

; <label>:888:                                    ; preds = %885
  %pgocount125 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 117)
  %889 = add i64 %pgocount125, 1
  store i64 %889, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 117)
  call void @dumpmode()
  call void @exit(i32 0) #9
  unreachable

; <label>:890:                                    ; preds = %885
  br label %891

; <label>:891:                                    ; preds = %890
  br label %892

; <label>:892:                                    ; preds = %891
  %893 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  call void @setbuf(%struct._IO_FILE* %893, i8* getelementptr inbounds ([8192 x i8], [8192 x i8]* @main.outbuf, i32 0, i32 0)) #7
  %894 = load i32, i32* @lflag, align 4
  %895 = icmp ne i32 %894, 0
  br i1 %895, label %896, label %900

; <label>:896:                                    ; preds = %892
  %pgocount126 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 118)
  %897 = add i64 %pgocount126, 1
  store i64 %897, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 118)
  %898 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %898, %struct._IO_FILE** @infile, align 8
  %899 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  store %struct._IO_FILE* %899, %struct._IO_FILE** @outfile, align 8
  call void @checkfile()
  call void @exit(i32 0) #9
  unreachable

; <label>:900:                                    ; preds = %892
  call void @terminit()
  br label %901

; <label>:901:                                    ; preds = %905, %900
  %902 = load i32, i32* %4, align 4
  %903 = add nsw i32 %902, -1
  store i32 %903, i32* %4, align 4
  %904 = icmp ne i32 %902, 0
  br i1 %904, label %905, label %910

; <label>:905:                                    ; preds = %901
  %pgocount127 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 2)
  %906 = add i64 %pgocount127, 1
  store i64 %906, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 2)
  %907 = load i8**, i8*** %5, align 8
  %908 = getelementptr inbounds i8*, i8** %907, i32 1
  store i8** %908, i8*** %5, align 8
  %909 = load i8*, i8** %907, align 8
  call void @dofile(i8* %909)
  br label %901

; <label>:910:                                    ; preds = %901
  %pgocount128 = load i64, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 86)
  %911 = add i64 %pgocount128, 1
  store i64 %911, i64* getelementptr inbounds ([125 x i64], [125 x i64]* @__profc_main, i64 0, i64 86)
  call void @done(i32 0)
  ret i32 0
}

; Function Attrs: nounwind
declare i8* @getenv(i8*) #1

; Function Attrs: nounwind readonly
declare i8* @index(i8*, i32) #2

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #1

; Function Attrs: nounwind readonly
declare i8* @rindex(i8*, i32) #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind uwtable
define internal void @usage() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = load i8*, i8** @Cmd, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([137 x i8], [137 x i8]* @.str.139, i32 0, i32 0), i8* %3)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = load i8*, i8** @Cmd, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.140, i32 0, i32 0), i8* %6)
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = load i8*, i8** @Cmd, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([98 x i8], [98 x i8]* @.str.141, i32 0, i32 0), i8* %9)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = load i8*, i8** @Cmd, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.142, i32 0, i32 0), i8* %12)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = load i8*, i8** @Cmd, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.143, i32 0, i32 0), i8* %15)
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = load i8*, i8** @Cmd, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.144, i32 0, i32 0), i8* %18)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = load i8*, i8** @Cmd, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.145, i32 0, i32 0), i8* %21)
  call void @givehelp(i32 0)
  call void @exit(i32 1) #9
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare i32 @access(...) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

declare i32 @linit() #3

declare i32 @findfiletype(i8*, i32, i32*) #3

; Function Attrs: nounwind uwtable
define internal void @initckch(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8, align 1
  %4 = alloca [4 x i8], align 1
  store i8* %0, i8** %2, align 8
  store i8 0, i8* %3, align 1
  br label %5

; <label>:5:                                      ; preds = %52, %1
  %6 = load i8, i8* %3, align 1
  %7 = zext i8 %6 to i32
  %8 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 12), align 4
  %9 = add nsw i32 128, %8
  %10 = trunc i32 %9 to i8
  %11 = zext i8 %10 to i32
  %12 = icmp slt i32 %7, %11
  br i1 %12, label %13, label %55

; <label>:13:                                     ; preds = %5
  %14 = load i8, i8* %3, align 1
  %15 = zext i8 %14 to i64
  %16 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 23), i64 0, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = icmp ne i8 %17, 0
  br i1 %18, label %19, label %35

; <label>:19:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 0)
  %21 = load i8, i8* %3, align 1
  %22 = zext i8 %21 to i64
  %23 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 25), i64 0, i64 %22
  %24 = load i8, i8* %23, align 1
  %25 = icmp ne i8 %24, 0
  br i1 %25, label %34, label %26

; <label>:26:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 4)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 4)
  %28 = load i8, i8* %3, align 1
  %29 = load i32, i32* @Trynum, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [228 x i8], [228 x i8]* @Try, i64 0, i64 %30
  store i8 %28, i8* %31, align 1
  %32 = load i32, i32* @Trynum, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* @Trynum, align 4
  br label %34

; <label>:34:                                     ; preds = %26, %19
  br label %51

; <label>:35:                                     ; preds = %13
  %36 = load i8, i8* %3, align 1
  %37 = zext i8 %36 to i64
  %38 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 26), i64 0, i64 %37
  %39 = load i8, i8* %38, align 1
  %40 = icmp ne i8 %39, 0
  br i1 %40, label %41, label %49

; <label>:41:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 9)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 9)
  %43 = load i8, i8* %3, align 1
  %44 = load i32, i32* @Trynum, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [228 x i8], [228 x i8]* @Try, i64 0, i64 %45
  store i8 %43, i8* %46, align 1
  %47 = load i32, i32* @Trynum, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* @Trynum, align 4
  br label %49

; <label>:49:                                     ; preds = %41, %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 1)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 1)
  br label %51

; <label>:51:                                     ; preds = %49, %34
  br label %52

; <label>:52:                                     ; preds = %51
  %53 = load i8, i8* %3, align 1
  %54 = add i8 %53, 1
  store i8 %54, i8* %3, align 1
  br label %5

; <label>:55:                                     ; preds = %5
  %56 = load i8*, i8** %2, align 8
  %57 = icmp ne i8* %56, null
  br i1 %57, label %58, label %249

; <label>:58:                                     ; preds = %55
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 17)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 17)
  br label %60

; <label>:60:                                     ; preds = %247, %58
  %61 = load i32, i32* @Trynum, align 4
  %62 = icmp slt i32 %61, 128
  br i1 %62, label %63, label %69

; <label>:63:                                     ; preds = %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 2)
  %64 = add i64 %pgocount5, 1
  store i64 %64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 2)
  %65 = load i8*, i8** %2, align 8
  %66 = load i8, i8* %65, align 1
  %67 = sext i8 %66 to i32
  %68 = icmp ne i32 %67, 0
  br label %69

; <label>:69:                                     ; preds = %63, %60
  %70 = phi i1 [ false, %60 ], [ %68, %63 ]
  br i1 %70, label %71, label %248

; <label>:71:                                     ; preds = %69
  %72 = load i8*, i8** %2, align 8
  %73 = load i8, i8* %72, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp ne i32 %74, 110
  br i1 %75, label %76, label %88

; <label>:76:                                     ; preds = %71
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 3)
  %77 = add i64 %pgocount6, 1
  store i64 %77, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 3)
  %78 = load i8*, i8** %2, align 8
  %79 = load i8, i8* %78, align 1
  %80 = sext i8 %79 to i32
  %81 = icmp ne i32 %80, 92
  br i1 %81, label %82, label %88

; <label>:82:                                     ; preds = %76
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 10)
  %83 = add i64 %pgocount7, 1
  store i64 %83, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 10)
  %84 = load i8*, i8** %2, align 8
  %85 = load i8, i8* %84, align 1
  store i8 %85, i8* %3, align 1
  %86 = load i8*, i8** %2, align 8
  %87 = getelementptr inbounds i8, i8* %86, i32 1
  store i8* %87, i8** %2, align 8
  br label %220

; <label>:88:                                     ; preds = %76, %71
  %89 = load i8*, i8** %2, align 8
  %90 = getelementptr inbounds i8, i8* %89, i32 1
  store i8* %90, i8** %2, align 8
  %91 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 0
  store i8 0, i8* %91, align 1
  %92 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 1
  store i8 0, i8* %92, align 1
  %93 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 2
  store i8 0, i8* %93, align 1
  %94 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 3
  store i8 0, i8* %94, align 1
  %95 = call i16** @__ctype_b_loc() #10
  %96 = load i16*, i16** %95, align 8
  %97 = load i8*, i8** %2, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 0
  %99 = load i8, i8* %98, align 1
  %100 = sext i8 %99 to i32
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i16, i16* %96, i64 %101
  %103 = load i16, i16* %102, align 2
  %104 = zext i16 %103 to i32
  %105 = and i32 %104, 2048
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %107, label %151

; <label>:107:                                    ; preds = %88
  %108 = load i8*, i8** %2, align 8
  %109 = getelementptr inbounds i8, i8* %108, i64 0
  %110 = load i8, i8* %109, align 1
  %111 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 0
  store i8 %110, i8* %111, align 1
  %112 = call i16** @__ctype_b_loc() #10
  %113 = load i16*, i16** %112, align 8
  %114 = load i8*, i8** %2, align 8
  %115 = getelementptr inbounds i8, i8* %114, i64 1
  %116 = load i8, i8* %115, align 1
  %117 = sext i8 %116 to i32
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i16, i16* %113, i64 %118
  %120 = load i16, i16* %119, align 2
  %121 = zext i16 %120 to i32
  %122 = and i32 %121, 2048
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %149

; <label>:124:                                    ; preds = %107
  %125 = load i8*, i8** %2, align 8
  %126 = getelementptr inbounds i8, i8* %125, i64 1
  %127 = load i8, i8* %126, align 1
  %128 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 1
  store i8 %127, i8* %128, align 1
  %129 = call i16** @__ctype_b_loc() #10
  %130 = load i16*, i16** %129, align 8
  %131 = load i8*, i8** %2, align 8
  %132 = getelementptr inbounds i8, i8* %131, i64 2
  %133 = load i8, i8* %132, align 1
  %134 = sext i8 %133 to i32
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i16, i16* %130, i64 %135
  %137 = load i16, i16* %136, align 2
  %138 = zext i16 %137 to i32
  %139 = and i32 %138, 2048
  %140 = icmp ne i32 %139, 0
  br i1 %140, label %141, label %147

; <label>:141:                                    ; preds = %124
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 15)
  %142 = add i64 %pgocount8, 1
  store i64 %142, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 15)
  %143 = load i8*, i8** %2, align 8
  %144 = getelementptr inbounds i8, i8* %143, i64 2
  %145 = load i8, i8* %144, align 1
  %146 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 2
  store i8 %145, i8* %146, align 1
  br label %147

; <label>:147:                                    ; preds = %141, %124
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 14)
  %148 = add i64 %pgocount9, 1
  store i64 %148, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 14)
  br label %149

; <label>:149:                                    ; preds = %147, %107
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 5)
  %150 = add i64 %pgocount10, 1
  store i64 %150, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 5)
  br label %151

; <label>:151:                                    ; preds = %149, %88
  %152 = load i8*, i8** %2, align 8
  %153 = getelementptr inbounds i8, i8* %152, i64 -1
  %154 = load i8, i8* %153, align 1
  %155 = sext i8 %154 to i32
  %156 = icmp eq i32 %155, 110
  br i1 %156, label %157, label %166

; <label>:157:                                    ; preds = %151
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 6)
  %158 = add i64 %pgocount11, 1
  store i64 %158, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 6)
  %159 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i32 0, i32 0
  %160 = call i64 @strlen(i8* %159) #8
  %161 = load i8*, i8** %2, align 8
  %162 = getelementptr inbounds i8, i8* %161, i64 %160
  store i8* %162, i8** %2, align 8
  %163 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i32 0, i32 0
  %164 = call i32 @atoi(i8* %163) #8
  %165 = trunc i32 %164 to i8
  store i8 %165, i8* %3, align 1
  br label %219

; <label>:166:                                    ; preds = %151
  %167 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i32 0, i32 0
  %168 = call i64 @strlen(i8* %167) #8
  %169 = load i8*, i8** %2, align 8
  %170 = getelementptr inbounds i8, i8* %169, i64 %168
  store i8* %170, i8** %2, align 8
  store i8 0, i8* %3, align 1
  %171 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 0
  %172 = load i8, i8* %171, align 1
  %173 = icmp ne i8 %172, 0
  br i1 %173, label %174, label %181

; <label>:174:                                    ; preds = %166
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 11)
  %175 = add i64 %pgocount12, 1
  store i64 %175, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 11)
  %176 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 0
  %177 = load i8, i8* %176, align 1
  %178 = sext i8 %177 to i32
  %179 = sub nsw i32 %178, 48
  %180 = trunc i32 %179 to i8
  store i8 %180, i8* %3, align 1
  br label %181

; <label>:181:                                    ; preds = %174, %166
  %182 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 1
  %183 = load i8, i8* %182, align 1
  %184 = icmp ne i8 %183, 0
  br i1 %184, label %185, label %199

; <label>:185:                                    ; preds = %181
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 12)
  %186 = add i64 %pgocount13, 1
  store i64 %186, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 12)
  %187 = load i8, i8* %3, align 1
  %188 = zext i8 %187 to i32
  %189 = shl i32 %188, 3
  %190 = trunc i32 %189 to i8
  store i8 %190, i8* %3, align 1
  %191 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 1
  %192 = load i8, i8* %191, align 1
  %193 = sext i8 %192 to i32
  %194 = sub nsw i32 %193, 48
  %195 = load i8, i8* %3, align 1
  %196 = zext i8 %195 to i32
  %197 = add nsw i32 %196, %194
  %198 = trunc i32 %197 to i8
  store i8 %198, i8* %3, align 1
  br label %199

; <label>:199:                                    ; preds = %185, %181
  %200 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 2
  %201 = load i8, i8* %200, align 1
  %202 = icmp ne i8 %201, 0
  br i1 %202, label %203, label %217

; <label>:203:                                    ; preds = %199
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 13)
  %204 = add i64 %pgocount14, 1
  store i64 %204, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 13)
  %205 = load i8, i8* %3, align 1
  %206 = zext i8 %205 to i32
  %207 = shl i32 %206, 3
  %208 = trunc i32 %207 to i8
  store i8 %208, i8* %3, align 1
  %209 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i64 0, i64 2
  %210 = load i8, i8* %209, align 1
  %211 = sext i8 %210 to i32
  %212 = sub nsw i32 %211, 48
  %213 = load i8, i8* %3, align 1
  %214 = zext i8 %213 to i32
  %215 = add nsw i32 %214, %212
  %216 = trunc i32 %215 to i8
  store i8 %216, i8* %3, align 1
  br label %217

; <label>:217:                                    ; preds = %203, %199
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 7)
  %218 = add i64 %pgocount15, 1
  store i64 %218, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 7)
  br label %219

; <label>:219:                                    ; preds = %217, %157
  br label %220

; <label>:220:                                    ; preds = %219, %82
  %221 = load i8, i8* %3, align 1
  %222 = zext i8 %221 to i32
  %223 = and i32 %222, 127
  %224 = trunc i32 %223 to i8
  store i8 %224, i8* %3, align 1
  %225 = load i8, i8* %3, align 1
  %226 = zext i8 %225 to i64
  %227 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 23), i64 0, i64 %226
  %228 = load i8, i8* %227, align 1
  %229 = icmp ne i8 %228, 0
  br i1 %229, label %247, label %230

; <label>:230:                                    ; preds = %220
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 8)
  %231 = add i64 %pgocount16, 1
  store i64 %231, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 8)
  %232 = load i8, i8* %3, align 1
  %233 = zext i8 %232 to i64
  %234 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 23), i64 0, i64 %233
  store i8 1, i8* %234, align 1
  %235 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 11), align 4
  %236 = add nsw i32 %235, 1
  store i32 %236, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 11), align 4
  %237 = trunc i32 %235 to i16
  %238 = load i8, i8* %3, align 1
  %239 = zext i8 %238 to i64
  %240 = getelementptr inbounds [228 x i16], [228 x i16]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 20), i64 0, i64 %239
  store i16 %237, i16* %240, align 2
  %241 = load i8, i8* %3, align 1
  %242 = load i32, i32* @Trynum, align 4
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [228 x i8], [228 x i8]* @Try, i64 0, i64 %243
  store i8 %241, i8* %244, align 1
  %245 = load i32, i32* @Trynum, align 4
  %246 = add nsw i32 %245, 1
  store i32 %246, i32* @Trynum, align 4
  br label %247

; <label>:247:                                    ; preds = %230, %220
  br label %60

; <label>:248:                                    ; preds = %69
  br label %249

; <label>:249:                                    ; preds = %248, %55
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 16)
  %250 = add i64 %pgocount17, 1
  store i64 %250, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initckch, i64 0, i64 16)
  ret void
}

declare void @treeinit(i8*, i8*) #3

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

declare i32 @fclose(%struct._IO_FILE*) #3

declare void @askmode() #3

declare void @treeoutput() #3

; Function Attrs: nounwind uwtable
define internal void @expandmode(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [8192 x i8], align 16
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca [8192 x i8], align 16
  %7 = alloca [1 x i64], align 8
  %8 = alloca [8192 x i8], align 16
  %9 = alloca [20 x i8], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  br label %12

; <label>:12:                                     ; preds = %217, %1
  %13 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @infile1, align 8
  %15 = call i8* @xgets(i8* %13, i32 8192, %struct._IO_FILE* %14)
  %16 = icmp ne i8* %15, null
  br i1 %16, label %17, label %219

; <label>:17:                                     ; preds = %12
  %18 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  %19 = call i64 @strlen(i8* %18) #8
  %20 = trunc i64 %19 to i32
  store i32 %20, i32* %10, align 4
  %21 = load i32, i32* %10, align 4
  %22 = sub nsw i32 %21, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i64 0, i64 %23
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 10
  br i1 %27, label %28, label %34

; <label>:28:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 10)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 10)
  %30 = load i32, i32* %10, align 4
  %31 = add nsw i32 %30, -1
  store i32 %31, i32* %10, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i64 0, i64 %32
  store i8 0, i8* %33, align 1
  br label %34

; <label>:34:                                     ; preds = %28, %17
  %35 = getelementptr inbounds [8192 x i8], [8192 x i8]* %8, i32 0, i32 0
  %36 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  %37 = call i8* @strcpy(i8* %35, i8* %36) #7
  %38 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  %39 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %40 = sext i8 %39 to i32
  %41 = call i8* @index(i8* %38, i32 %40) #8
  store i8* %41, i8** %5, align 8
  %42 = icmp ne i8* %41, null
  br i1 %42, label %43, label %53

; <label>:43:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 7)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 7)
  %45 = load i8*, i8** %5, align 8
  %46 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  %47 = ptrtoint i8* %45 to i64
  %48 = ptrtoint i8* %46 to i64
  %49 = sub i64 %47, %48
  %50 = trunc i64 %49 to i32
  store i32 %50, i32* %10, align 4
  %51 = load i8*, i8** %5, align 8
  %52 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %52, i8** %5, align 8
  store i8 0, i8* %51, align 1
  br label %53

; <label>:53:                                     ; preds = %43, %34
  %54 = load i32, i32* %2, align 4
  %55 = icmp eq i32 %54, 2
  br i1 %55, label %64, label %56

; <label>:56:                                     ; preds = %53
  %pgocount2 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 11)
  %57 = add i64 %pgocount2, 1
  store i64 %57, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 11)
  %58 = load i32, i32* %2, align 4
  %59 = icmp eq i32 %58, 3
  br i1 %59, label %64, label %60

; <label>:60:                                     ; preds = %56
  %pgocount3 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 16)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 16)
  %62 = load i32, i32* %2, align 4
  %63 = icmp eq i32 %62, 4
  br i1 %63, label %64, label %68

; <label>:64:                                     ; preds = %60, %56, %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 6)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 6)
  %66 = getelementptr inbounds [8192 x i8], [8192 x i8]* %8, i32 0, i32 0
  %67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.192, i32 0, i32 0), i8* %66)
  br label %68

; <label>:68:                                     ; preds = %64, %60
  %69 = load i8*, i8** %5, align 8
  %70 = icmp ne i8* %69, null
  br i1 %70, label %71, label %83

; <label>:71:                                     ; preds = %68
  %72 = load i8*, i8** %5, align 8
  %73 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  %74 = ptrtoint i8* %72 to i64
  %75 = ptrtoint i8* %73 to i64
  %76 = sub i64 %74, %75
  %77 = icmp sgt i64 %76, 100
  br i1 %77, label %78, label %81

; <label>:78:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 14)
  %79 = add i64 %pgocount5, 1
  store i64 %79, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 14)
  %80 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i64 0, i64 100
  store i8 0, i8* %80, align 4
  br label %81

; <label>:81:                                     ; preds = %78, %71
  %pgocount6 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 8)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 8)
  br label %93

; <label>:83:                                     ; preds = %68
  %84 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  %85 = call i64 @strlen(i8* %84) #8
  %86 = trunc i64 %85 to i32
  %87 = icmp sgt i32 %86, 99
  br i1 %87, label %88, label %91

; <label>:88:                                     ; preds = %83
  %pgocount7 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 18)
  %89 = add i64 %pgocount7, 1
  store i64 %89, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 18)
  %90 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i64 0, i64 100
  store i8 0, i8* %90, align 4
  br label %91

; <label>:91:                                     ; preds = %88, %83
  %pgocount8 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 13)
  %92 = add i64 %pgocount8, 1
  store i64 %92, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 13)
  br label %93

; <label>:93:                                     ; preds = %91, %81
  %94 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %96 = call i32 @fputs(i8* %94, %struct._IO_FILE* %95)
  %97 = load i8*, i8** %5, align 8
  %98 = icmp ne i8* %97, null
  br i1 %98, label %99, label %217

; <label>:99:                                     ; preds = %93
  %100 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i32 0, i32 0
  %101 = bitcast i64* %100 to i8*
  call void @llvm.memset.p0i8.i64(i8* %101, i8 0, i64 8, i32 8, i1 false)
  br label %102

; <label>:102:                                    ; preds = %159, %99
  %103 = load i8*, i8** %5, align 8
  %104 = load i8, i8* %103, align 1
  %105 = sext i8 %104 to i32
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %107, label %113

; <label>:107:                                    ; preds = %102
  %pgocount9 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 1)
  %108 = add i64 %pgocount9, 1
  store i64 %108, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 1)
  %109 = load i8*, i8** %5, align 8
  %110 = load i8, i8* %109, align 1
  %111 = sext i8 %110 to i32
  %112 = icmp ne i32 %111, 10
  br label %113

; <label>:113:                                    ; preds = %107, %102
  %114 = phi i1 [ false, %102 ], [ %112, %107 ]
  br i1 %114, label %115, label %160

; <label>:115:                                    ; preds = %113
  %116 = load i8*, i8** %5, align 8
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  %119 = sub nsw i32 %118, 65
  store i32 %119, i32* %11, align 4
  %120 = load i32, i32* %11, align 4
  %121 = icmp sge i32 %120, 0
  br i1 %121, label %122, label %134

; <label>:122:                                    ; preds = %115
  %pgocount10 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 2)
  %123 = add i64 %pgocount10, 1
  store i64 %123, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 2)
  %124 = load i32, i32* %11, align 4
  %125 = icmp sle i32 %124, 26
  br i1 %125, label %126, label %134

; <label>:126:                                    ; preds = %122
  %pgocount11 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 5)
  %127 = add i64 %pgocount11, 1
  store i64 %127, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 5)
  %128 = load i32, i32* %11, align 4
  %129 = zext i32 %128 to i64
  %130 = shl i64 1, %129
  %131 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i64 0, i64 0
  %132 = load i64, i64* %131, align 8
  %133 = or i64 %132, %130
  store i64 %133, i64* %131, align 8
  br label %146

; <label>:134:                                    ; preds = %122, %115
  %135 = load i32, i32* @cbench_print, align 4
  %136 = icmp ne i32 %135, 0
  br i1 %136, label %137, label %144

; <label>:137:                                    ; preds = %134
  %pgocount12 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 4)
  %138 = add i64 %pgocount12, 1
  store i64 %138, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 4)
  %139 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %140 = load i8*, i8** %5, align 8
  %141 = load i8, i8* %140, align 1
  %142 = zext i8 %141 to i32
  %143 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %139, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.193, i32 0, i32 0), i32 %142)
  br label %144

; <label>:144:                                    ; preds = %137, %134
  %pgocount13 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 0)
  %145 = add i64 %pgocount13, 1
  store i64 %145, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 0)
  br label %146

; <label>:146:                                    ; preds = %144, %126
  %147 = load i8*, i8** %5, align 8
  %148 = getelementptr inbounds i8, i8* %147, i32 1
  store i8* %148, i8** %5, align 8
  %149 = load i8*, i8** %5, align 8
  %150 = load i8, i8* %149, align 1
  %151 = sext i8 %150 to i32
  %152 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %153 = sext i8 %152 to i32
  %154 = icmp eq i32 %151, %153
  br i1 %154, label %155, label %159

; <label>:155:                                    ; preds = %146
  %pgocount14 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 3)
  %156 = add i64 %pgocount14, 1
  store i64 %156, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 3)
  %157 = load i8*, i8** %5, align 8
  %158 = getelementptr inbounds i8, i8* %157, i32 1
  store i8* %158, i8** %5, align 8
  br label %159

; <label>:159:                                    ; preds = %155, %146
  br label %102

; <label>:160:                                    ; preds = %113
  %161 = getelementptr inbounds [8192 x i8], [8192 x i8]* %6, i32 0, i32 0
  %162 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  %163 = call i32 @strtoichar(i8* %161, i8* %162, i32 8192, i32 1)
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %165, label %175

; <label>:165:                                    ; preds = %160
  %166 = load i32, i32* @cbench_print, align 4
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %173

; <label>:168:                                    ; preds = %165
  %pgocount15 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 17)
  %169 = add i64 %pgocount15, 1
  store i64 %169, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 17)
  %170 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %171 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  %172 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %170, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.194, i32 0, i32 0), i8* %171, i32 1040, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.195, i32 0, i32 0))
  br label %173

; <label>:173:                                    ; preds = %168, %165
  %pgocount16 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 12)
  %174 = add i64 %pgocount16, 1
  store i64 %174, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 12)
  br label %175

; <label>:175:                                    ; preds = %173, %160
  %176 = getelementptr inbounds [8192 x i8], [8192 x i8]* %8, i32 0, i32 0
  %177 = getelementptr inbounds [8192 x i8], [8192 x i8]* %6, i32 0, i32 0
  %178 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i32 0, i32 0
  %179 = load i32, i32* %2, align 4
  %180 = call i32 @expand_pre(i8* %176, i8* %177, i64* %178, i32 %179, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.55, i32 0, i32 0))
  store i32 %180, i32* %4, align 4
  %181 = getelementptr inbounds [8192 x i8], [8192 x i8]* %8, i32 0, i32 0
  %182 = getelementptr inbounds [8192 x i8], [8192 x i8]* %6, i32 0, i32 0
  %183 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i32 0, i32 0
  %184 = load i32, i32* %2, align 4
  %185 = call i32 @expand_suf(i8* %181, i8* %182, i64* %183, i32 0, i32 %184, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.55, i32 0, i32 0))
  %186 = load i32, i32* %4, align 4
  %187 = add nsw i32 %186, %185
  store i32 %187, i32* %4, align 4
  %188 = load i32, i32* %10, align 4
  %189 = load i32, i32* %4, align 4
  %190 = add nsw i32 %189, %188
  store i32 %190, i32* %4, align 4
  %191 = load i32, i32* %2, align 4
  %192 = icmp eq i32 %191, 4
  br i1 %192, label %193, label %215

; <label>:193:                                    ; preds = %175
  %pgocount17 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 15)
  %194 = add i64 %pgocount17, 1
  store i64 %194, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 15)
  %195 = getelementptr inbounds [20 x i8], [20 x i8]* %9, i32 0, i32 0
  %196 = load i32, i32* %4, align 4
  %197 = sitofp i32 %196 to double
  %198 = load i32, i32* %10, align 4
  %199 = sitofp i32 %198 to double
  %200 = fdiv double %197, %199
  %201 = call i32 (i8*, i8*, ...) @sprintf(i8* %195, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.196, i32 0, i32 0), double %200) #7
  %202 = getelementptr inbounds [20 x i8], [20 x i8]* %9, i32 0, i32 0
  %203 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %204 = call i32 @fputs(i8* %202, %struct._IO_FILE* %203)
  %205 = getelementptr inbounds [8192 x i8], [8192 x i8]* %8, i32 0, i32 0
  %206 = getelementptr inbounds [8192 x i8], [8192 x i8]* %6, i32 0, i32 0
  %207 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i32 0, i32 0
  %208 = getelementptr inbounds [20 x i8], [20 x i8]* %9, i32 0, i32 0
  %209 = call i32 @expand_pre(i8* %205, i8* %206, i64* %207, i32 3, i8* %208)
  %210 = getelementptr inbounds [8192 x i8], [8192 x i8]* %8, i32 0, i32 0
  %211 = getelementptr inbounds [8192 x i8], [8192 x i8]* %6, i32 0, i32 0
  %212 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i32 0, i32 0
  %213 = getelementptr inbounds [20 x i8], [20 x i8]* %9, i32 0, i32 0
  %214 = call i32 @expand_suf(i8* %210, i8* %211, i64* %212, i32 0, i32 3, i8* %213)
  br label %215

; <label>:215:                                    ; preds = %193, %175
  %pgocount18 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 9)
  %216 = add i64 %pgocount18, 1
  store i64 %216, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 9)
  br label %217

; <label>:217:                                    ; preds = %215, %93
  %218 = call i32 @putchar(i32 10)
  br label %12

; <label>:219:                                    ; preds = %12
  %pgocount19 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 19)
  %220 = add i64 %pgocount19, 1
  store i64 %220, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_expandmode, i64 0, i64 19)
  ret void
}

declare void @dumpmode() #3

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE*, i8*) #1

declare void @checkfile() #3

declare void @terminit() #3

; Function Attrs: nounwind uwtable
define internal void @dofile(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.stat, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  store i8* %5, i8** @currentfile, align 8
  %6 = load i32, i32* @deftflag, align 4
  store i32 %6, i32* @tflag, align 4
  %7 = load i32, i32* @tflag, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %22

; <label>:9:                                      ; preds = %1
  %10 = load i8*, i8** %2, align 8
  %11 = call i8* @rindex(i8* %10, i32 46) #8
  store i8* %11, i8** %4, align 8
  %12 = icmp ne i8* %11, null
  br i1 %12, label %13, label %18

; <label>:13:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 9)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 9)
  %15 = load i8*, i8** %4, align 8
  %16 = call i32 @strcmp(i8* %15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.183, i32 0, i32 0)) #8
  %17 = icmp eq i32 %16, 0
  br label %18

; <label>:18:                                     ; preds = %13, %9
  %19 = phi i1 [ false, %9 ], [ %17, %13 ]
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 3)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 3)
  %21 = zext i1 %19 to i32
  store i32 %21, i32* @tflag, align 4
  br label %22

; <label>:22:                                     ; preds = %18, %1
  %23 = load i32, i32* @prefstringchar, align 4
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %25, label %39

; <label>:25:                                     ; preds = %22
  %26 = load i8*, i8** %2, align 8
  %27 = load i32, i32* @deftflag, align 4
  %28 = icmp slt i32 %27, 0
  %29 = zext i1 %28 to i64
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 16)
  %30 = add i64 %pgocount2, %29
  store i64 %30, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 16)
  %31 = select i1 %28, i32* @tflag, i32* null
  %32 = call i32 @findfiletype(i8* %26, i32 0, i32* %31)
  store i32 %32, i32* @defdupchar, align 4
  %33 = load i32, i32* @defdupchar, align 4
  %34 = icmp slt i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 12)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 12)
  store i32 0, i32* @defdupchar, align 4
  br label %37

; <label>:37:                                     ; preds = %35, %25
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 4)
  %38 = add i64 %pgocount4, 1
  store i64 %38, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 4)
  br label %39

; <label>:39:                                     ; preds = %37, %22
  %40 = load i8*, i8** %2, align 8
  %41 = call %struct._IO_FILE* @fopen(i8* %40, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.184, i32 0, i32 0))
  store %struct._IO_FILE* %41, %struct._IO_FILE** @infile, align 8
  %42 = icmp eq %struct._IO_FILE* %41, null
  br i1 %42, label %43, label %54

; <label>:43:                                     ; preds = %39
  %44 = load i32, i32* @cbench_print, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %51

; <label>:46:                                     ; preds = %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 10)
  %47 = add i64 %pgocount5, 1
  store i64 %47, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 10)
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = load i8*, i8** %2, align 8
  %50 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.185, i32 0, i32 0), i8* %49)
  br label %51

; <label>:51:                                     ; preds = %46, %43
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 5)
  %52 = add i64 %pgocount6, 1
  store i64 %52, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 5)
  %53 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 2)
  br label %129

; <label>:54:                                     ; preds = %39
  %55 = load i8*, i8** %2, align 8
  %56 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @access to i32 (i8*, i32, ...)*)(i8* %55, i32 2)
  %57 = icmp slt i32 %56, 0
  %58 = zext i1 %57 to i32
  store i32 %58, i32* @readonly, align 4
  %59 = load i32, i32* @readonly, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %72

; <label>:61:                                     ; preds = %54
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 1)
  %62 = add i64 %pgocount7, 1
  store i64 %62, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 1)
  %63 = load i32, i32* @cbench_print, align 4
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %70

; <label>:65:                                     ; preds = %61
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 7)
  %66 = add i64 %pgocount8, 1
  store i64 %66, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 7)
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %68 = load i8*, i8** %2, align 8
  %69 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %67, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.186, i32 0, i32 0), i8* %68)
  br label %70

; <label>:70:                                     ; preds = %65, %61
  %71 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 2)
  br label %72

; <label>:72:                                     ; preds = %70, %54
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @infile, align 8
  %74 = call i32 @fileno(%struct._IO_FILE* %73) #7
  %75 = call i32 @fstat(i32 %74, %struct.stat* %3) #7
  %76 = call i8* @strcpy(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.115, i32 0, i32 0)) #7
  %77 = call i8* @mktemp(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i32 0, i32 0)) #7
  %78 = icmp eq i8* %77, null
  br i1 %78, label %88, label %79

; <label>:79:                                     ; preds = %72
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 2)
  %80 = add i64 %pgocount9, 1
  store i64 %80, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 2)
  %81 = load i8, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i64 0, i64 0), align 16
  %82 = sext i8 %81 to i32
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %88, label %84

; <label>:84:                                     ; preds = %79
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 8)
  %85 = add i64 %pgocount10, 1
  store i64 %85, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 8)
  %86 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.187, i32 0, i32 0))
  store %struct._IO_FILE* %86, %struct._IO_FILE** @outfile, align 8
  %87 = icmp eq %struct._IO_FILE* %86, null
  br i1 %87, label %88, label %104

; <label>:88:                                     ; preds = %84, %79, %72
  %89 = load i32, i32* @cbench_print, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %101

; <label>:91:                                     ; preds = %88
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 6)
  %92 = add i64 %pgocount11, 1
  store i64 %92, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 6)
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %94 = load i8, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i64 0, i64 0), align 16
  %95 = sext i8 %94 to i32
  %96 = icmp eq i32 %95, 0
  %97 = zext i1 %96 to i64
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 17)
  %98 = add i64 %pgocount12, %97
  store i64 %98, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 17)
  %99 = select i1 %96, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.189, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i32 0, i32 0)
  %100 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.188, i32 0, i32 0), i8* %99)
  br label %101

; <label>:101:                                    ; preds = %91, %88
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 0)
  %102 = add i64 %pgocount13, 1
  store i64 %102, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 0)
  %103 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 2)
  br label %129

; <label>:104:                                    ; preds = %84
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 11)
  %105 = add i64 %pgocount14, 1
  store i64 %105, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 11)
  %106 = getelementptr inbounds %struct.stat, %struct.stat* %3, i32 0, i32 3
  %107 = load i32, i32* %106, align 8
  %108 = call i32 @chmod(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i32 0, i32 0), i32 %107) #7
  store i32 0, i32* @quit, align 4
  store i32 0, i32* @changes, align 4
  call void @checkfile()
  %109 = load %struct._IO_FILE*, %struct._IO_FILE** @infile, align 8
  %110 = call i32 @fclose(%struct._IO_FILE* %109)
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %112 = call i32 @fclose(%struct._IO_FILE* %111)
  %113 = load i32, i32* @cflag, align 4
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %117, label %115

; <label>:115:                                    ; preds = %104
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 14)
  %116 = add i64 %pgocount15, 1
  store i64 %116, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 14)
  call void @treeoutput()
  br label %117

; <label>:117:                                    ; preds = %115, %104
  %118 = load i32, i32* @changes, align 4
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %127

; <label>:120:                                    ; preds = %117
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 13)
  %121 = add i64 %pgocount16, 1
  store i64 %121, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 13)
  %122 = load i32, i32* @readonly, align 4
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %127, label %124

; <label>:124:                                    ; preds = %120
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 15)
  %125 = add i64 %pgocount17, 1
  store i64 %125, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_dofile, i64 0, i64 15)
  %126 = load i8*, i8** %2, align 8
  call void @update_file(i8* %126, %struct.stat* %3)
  br label %127

; <label>:127:                                    ; preds = %124, %120, %117
  %128 = call i32 (i8*, ...) bitcast (i32 (...)* @unlink to i32 (i8*, ...)*)(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i32 0, i32 0))
  br label %129

; <label>:129:                                    ; preds = %127, %101, %51
  ret void
}

declare void @done(i32) #3

declare void @givehelp(i32) #3

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #5

declare i32 @sleep(...) #3

; Function Attrs: nounwind
declare i32 @fstat(i32, %struct.stat*) #1

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i8* @mktemp(i8*) #1

; Function Attrs: nounwind
declare i32 @chmod(i8*, i32) #1

; Function Attrs: nounwind uwtable
define internal void @update_file(i8*, %struct.stat*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.stat*, align 8
  %5 = alloca [4096 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store %struct.stat* %1, %struct.stat** %4, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.184, i32 0, i32 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** @infile, align 8
  %9 = icmp eq %struct._IO_FILE* %8, null
  br i1 %9, label %10, label %20

; <label>:10:                                     ; preds = %2
  %11 = load i32, i32* @cbench_print, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 5)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 5)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.190, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i32 0, i32 0))
  br label %17

; <label>:17:                                     ; preds = %13, %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 3)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 3)
  %19 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 2)
  br label %112

; <label>:20:                                     ; preds = %2
  %21 = getelementptr inbounds [4096 x i8], [4096 x i8]* %5, i32 0, i32 0
  %22 = load i8*, i8** %3, align 8
  %23 = call i32 (i8*, i8*, ...) @sprintf(i8* %21, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.191, i32 0, i32 0), i32 4091, i8* %22, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0)) #7
  %24 = getelementptr inbounds [4096 x i8], [4096 x i8]* %5, i32 0, i32 0
  %25 = call i8* @rindex(i8* %24, i32 47) #8
  store i8* %25, i8** %7, align 8
  %26 = load i8*, i8** %7, align 8
  %27 = icmp eq i8* %26, null
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 6)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 6)
  %30 = getelementptr inbounds [4096 x i8], [4096 x i8]* %5, i32 0, i32 0
  store i8* %30, i8** %7, align 8
  br label %34

; <label>:31:                                     ; preds = %20
  %32 = load i8*, i8** %7, align 8
  %33 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %33, i8** %7, align 8
  br label %34

; <label>:34:                                     ; preds = %31, %28
  %35 = load i8*, i8** %3, align 8
  %36 = getelementptr inbounds [4096 x i8], [4096 x i8]* %5, i32 0, i32 0
  %37 = load i8*, i8** %7, align 8
  %38 = getelementptr inbounds [4096 x i8], [4096 x i8]* %5, i32 0, i32 0
  %39 = ptrtoint i8* %37 to i64
  %40 = ptrtoint i8* %38 to i64
  %41 = sub i64 %39, %40
  %42 = add nsw i64 %41, 255
  %43 = call i32 @strncmp(i8* %35, i8* %36, i64 %42) #8
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %49

; <label>:45:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 1)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 1)
  %47 = getelementptr inbounds [4096 x i8], [4096 x i8]* %5, i32 0, i32 0
  %48 = call i32 (i8*, ...) bitcast (i32 (...)* @unlink to i32 (i8*, ...)*)(i8* %47)
  br label %49

; <label>:49:                                     ; preds = %45, %34
  %50 = load i8*, i8** %3, align 8
  %51 = getelementptr inbounds [4096 x i8], [4096 x i8]* %5, i32 0, i32 0
  %52 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @link to i32 (i8*, i8*, ...)*)(i8* %50, i8* %51)
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %58

; <label>:54:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 7)
  %55 = add i64 %pgocount4, 1
  store i64 %55, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 7)
  %56 = load i8*, i8** %3, align 8
  %57 = call i32 (i8*, ...) bitcast (i32 (...)* @unlink to i32 (i8*, ...)*)(i8* %56)
  br label %58

; <label>:58:                                     ; preds = %54, %49
  %59 = load i8*, i8** %3, align 8
  %60 = call %struct._IO_FILE* @fopen(i8* %59, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.187, i32 0, i32 0))
  store %struct._IO_FILE* %60, %struct._IO_FILE** @outfile, align 8
  %61 = icmp eq %struct._IO_FILE* %60, null
  br i1 %61, label %62, label %73

; <label>:62:                                     ; preds = %58
  %63 = load i32, i32* @cbench_print, align 4
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %70

; <label>:65:                                     ; preds = %62
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 10)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 10)
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %68 = load i8*, i8** %3, align 8
  %69 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %67, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.188, i32 0, i32 0), i8* %68)
  br label %70

; <label>:70:                                     ; preds = %65, %62
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 8)
  %71 = add i64 %pgocount6, 1
  store i64 %71, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 8)
  %72 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 2)
  br label %112

; <label>:73:                                     ; preds = %58
  %74 = load i8*, i8** %3, align 8
  %75 = load %struct.stat*, %struct.stat** %4, align 8
  %76 = getelementptr inbounds %struct.stat, %struct.stat* %75, i32 0, i32 3
  %77 = load i32, i32* %76, align 8
  %78 = call i32 @chmod(i8* %74, i32 %77) #7
  br label %79

; <label>:79:                                     ; preds = %83, %73
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** @infile, align 8
  %81 = call i32 @_IO_getc(%struct._IO_FILE* %80)
  store i32 %81, i32* %6, align 4
  %82 = icmp ne i32 %81, -1
  br i1 %82, label %83, label %88

; <label>:83:                                     ; preds = %79
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 0)
  %84 = add i64 %pgocount7, 1
  store i64 %84, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 0)
  %85 = load i32, i32* %6, align 4
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %87 = call i32 @_IO_putc(i32 %85, %struct._IO_FILE* %86)
  br label %79

; <label>:88:                                     ; preds = %79
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 2)
  %89 = add i64 %pgocount8, 1
  store i64 %89, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 2)
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** @infile, align 8
  %91 = call i32 @fclose(%struct._IO_FILE* %90)
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %93 = call i32 @fclose(%struct._IO_FILE* %92)
  %94 = load i32, i32* @xflag, align 4
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %112

; <label>:96:                                     ; preds = %88
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 4)
  %97 = add i64 %pgocount9, 1
  store i64 %97, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 4)
  %98 = load i8*, i8** %3, align 8
  %99 = getelementptr inbounds [4096 x i8], [4096 x i8]* %5, i32 0, i32 0
  %100 = load i8*, i8** %7, align 8
  %101 = getelementptr inbounds [4096 x i8], [4096 x i8]* %5, i32 0, i32 0
  %102 = ptrtoint i8* %100 to i64
  %103 = ptrtoint i8* %101 to i64
  %104 = sub i64 %102, %103
  %105 = add nsw i64 %104, 255
  %106 = call i32 @strncmp(i8* %98, i8* %99, i64 %105) #8
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %108, label %112

; <label>:108:                                    ; preds = %96
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 9)
  %109 = add i64 %pgocount10, 1
  store i64 %109, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_update_file, i64 0, i64 9)
  %110 = getelementptr inbounds [4096 x i8], [4096 x i8]* %5, i32 0, i32 0
  %111 = call i32 (i8*, ...) bitcast (i32 (...)* @unlink to i32 (i8*, ...)*)(i8* %110)
  br label %112

; <label>:112:                                    ; preds = %108, %96, %88, %70, %17
  ret void
}

declare i32 @unlink(...) #3

declare i32 @link(...) #3

declare i32 @_IO_getc(%struct._IO_FILE*) #3

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #3

declare i8* @xgets(i8*, i32, %struct._IO_FILE*) #3

declare i32 @fputs(i8*, %struct._IO_FILE*) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #6

declare i32 @strtoichar(i8*, i8*, i32, i32) #3

declare i32 @expand_pre(i8*, i8*, i64*, i32, i8*) #3

declare i32 @expand_suf(i8*, i8*, i64*, i32, i32, i8*) #3

declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #7

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #7

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
