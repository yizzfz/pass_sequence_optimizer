; ModuleID = 'tmp1.ll'
source_filename = "fileio.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.anon = type { [256 x i8], i32, i32 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [3 x i8] c"r+\00", align 1
@DIRSEPS = internal constant [2 x i8] c"/\00", align 1
@ASC_EXTENSION = external global [0 x i8], align 1
@PGP_EXTENSION = external global [0 x i8], align 1
@SIG_EXTENSION = external global [0 x i8], align 1
@getyesno.yes = internal global [8 x i8] zeroinitializer, align 1
@getyesno.no = internal global [8 x i8] zeroinitializer, align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@batchmode = external global i8, align 1
@maybe_force_extension.newname = internal global [256 x i8] zeroinitializer, align 16
@pgpout = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [40 x i8] c"\0AShould '%s' be renamed to '%s' (Y/n)? \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"HOME\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c".pgp\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"/usr/local/lib/pgp/\00", align 1
@.str.8 = private unnamed_addr constant [13 x i8] c"\0ADisk full.\0A\00", align 1
@.str.9 = private unnamed_addr constant [20 x i8] c"\0AFile write error.\0A\00", align 1
@textbuf = common global [4096 x i8] zeroinitializer, align 16
@CONVERSION = external global i32, align 4
@textbuf2 = internal global [2048 x i32] zeroinitializer, align 16
@strip_spaces = external global i8, align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@verbose = external global i8, align 1
@.str.12 = private unnamed_addr constant [26 x i8] c"writing stdin to file %s\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.13 = private unnamed_addr constant [27 x i8] c"writing file %s to stdout\0A\00", align 1
@stdout = external global %struct._IO_FILE*, align 8
@.str.14 = private unnamed_addr constant [25 x i8] c"\07Write error on stdout.\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.15 = private unnamed_addr constant [18 x i8] c"\0A\07Out of memory.\0A\00", align 1
@tmpdir = internal global [256 x i8] zeroinitializer, align 16
@.str.16 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@outdir = internal global [256 x i8] zeroinitializer, align 16
@tmpbasename = internal global [64 x i8] c"pgptemp\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@tmpf = internal global [8 x %struct.anon] zeroinitializer, align 16
@.str.17 = private unnamed_addr constant [26 x i8] c"\0A\07Out of temporary files\0A\00", align 1
@.str.18 = private unnamed_addr constant [12 x i8] c"%s%s.%c%02d\00", align 1
@.str.19 = private unnamed_addr constant [37 x i8] c"\0A\07tempfile: cannot find unique name\0A\00", align 1
@.str.20 = private unnamed_addr constant [6 x i8] c"/tmp/\00", align 1
@.str.21 = private unnamed_addr constant [37 x i8] c"\0A\07Cannot create temporary file '%s'\0A\00", align 1
@.str.22 = private unnamed_addr constant [24 x i8] c"tempfile: created '%s'\0A\00", align 1
@.str.23 = private unnamed_addr constant [23 x i8] c"rmtemp: removing '%s'\0A\00", align 1
@.str.24 = private unnamed_addr constant [29 x i8] c"\0Armtemp: Failed to remove %s\00", align 1
@.str.25 = private unnamed_addr constant [7 x i8] c"\0AError\00", align 1
@.str.26 = private unnamed_addr constant [27 x i8] c"rmtemp: not removing '%s'\0A\00", align 1
@.str.27 = private unnamed_addr constant [37 x i8] c"savetemp: not renaming '%s' to '%s'\0A\00", align 1
@.str.28 = private unnamed_addr constant [33 x i8] c"savetemp: renaming '%s' to '%s'\0A\00", align 1
@.str.29 = private unnamed_addr constant [31 x i8] c"Can't create output file '%s'\0A\00", align 1
@ck_dup_output.buf = internal global [256 x i8] zeroinitializer, align 16
@force_flag = external global i8, align 1
@.str.30 = private unnamed_addr constant [36 x i8] c"\0A\07Output file '%s' already exists.\0A\00", align 1
@.str.31 = private unnamed_addr constant [54 x i8] c"\0A\07Output file '%s' already exists.  Overwrite (y/N)? \00", align 1
@.str.32 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.33 = private unnamed_addr constant [21 x i8] c"Enter new file name:\00", align 1
@.str.34 = private unnamed_addr constant [2 x i8] c" \00", align 1
@BAK_EXTENSION = external global [0 x i8], align 1
@.str.35 = private unnamed_addr constant [9 x i8] c"$PGPPATH\00", align 1
@.str.36 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.37 = private unnamed_addr constant [4 x i8] c"pgp\00", align 1
@.str.38 = private unnamed_addr constant [6 x i8] c"pgp26\00", align 1
@.str.39 = private unnamed_addr constant [7 x i8] c"pgp263\00", align 1
@.str.40 = private unnamed_addr constant [11 x i8] c"$HOME/.pgp\00", align 1
@.str.41 = private unnamed_addr constant [6 x i8] c"$HOME\00", align 1
@.str.42 = private unnamed_addr constant [10 x i8] c"$HOME/pgp\00", align 1
@.str.43 = private unnamed_addr constant [12 x i8] c"$HOME/pgp26\00", align 1
@.str.44 = private unnamed_addr constant [3 x i8] c"..\00", align 1
@manual_dirs = constant [12 x i8*] [i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.39, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.44, i32 0, i32 0), i8* null], align 16
@.str.45 = private unnamed_addr constant [26 x i8] c"Truncating filename '%s' \00", align 1
@.str.46 = private unnamed_addr constant [9 x i8] c"to '%s'\0A\00", align 1
@.str.47 = private unnamed_addr constant [29 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ$_\00", align 1
@.str.48 = private unnamed_addr constant [4 x i8] c"doc\00", align 1
@files_missing.names = internal constant [3 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.49, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.50, i32 0, i32 0), i8* null], align 16
@.str.49 = private unnamed_addr constant [8 x i8] c"pgpdoc1\00", align 1
@.str.50 = private unnamed_addr constant [8 x i8] c"pgpdoc2\00", align 1
@ext_missing.extensions = internal constant [6 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.52, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.53, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.54, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.36, i32 0, i32 0), i8* null], align 16
@.str.51 = private unnamed_addr constant [5 x i8] c".doc\00", align 1
@.str.52 = private unnamed_addr constant [5 x i8] c".txt\00", align 1
@.str.53 = private unnamed_addr constant [5 x i8] c".man\00", align 1
@.str.54 = private unnamed_addr constant [5 x i8] c".tex\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_file_exists = private constant [11 x i8] c"file_exists"
@__profn_wipefile = private constant [8 x i8] c"wipefile"
@__profn_tmp1.ll_wipeout = private constant [15 x i8] c"tmp1.ll:wipeout"
@__profn_file_tail = private constant [9 x i8] c"file_tail"
@__profn_has_extension = private constant [13 x i8] c"has_extension"
@__profn_is_tempfile = private constant [11 x i8] c"is_tempfile"
@__profn_no_extension = private constant [12 x i8] c"no_extension"
@__profn_drop_extension = private constant [14 x i8] c"drop_extension"
@__profn_default_extension = private constant [17 x i8] c"default_extension"
@__profn_force_extension = private constant [15 x i8] c"force_extension"
@__profn_tmp1.ll_truncate_name = private constant [21 x i8] c"tmp1.ll:truncate_name"
@__profn_getyesno = private constant [8 x i8] c"getyesno"
@__profn_maybe_force_extension = private constant [21 x i8] c"maybe_force_extension"
@__profn_buildfilename = private constant [13 x i8] c"buildfilename"
@__profn_tmp1.ll_addslash = private constant [16 x i8] c"tmp1.ll:addslash"
@__profn_buildsysfilename = private constant [16 x i8] c"buildsysfilename"
@__profn_file_to_canon = private constant [13 x i8] c"file_to_canon"
@__profn_write_error = private constant [11 x i8] c"write_error"
@__profn_copyfile = private constant [8 x i8] c"copyfile"
@__profn_copyfilepos = private constant [11 x i8] c"copyfilepos"
@__profn_copyfile_to_canon = private constant [17 x i8] c"copyfile_to_canon"
@__profn_copyfile_from_canon = private constant [19 x i8] c"copyfile_from_canon"
@__profn_copyfiles_by_name = private constant [17 x i8] c"copyfiles_by_name"
@__profn_make_canonical = private constant [14 x i8] c"make_canonical"
@__profn_rename2 = private constant [7 x i8] c"rename2"
@__profn_tmp1.ll_is_regular_file = private constant [23 x i8] c"tmp1.ll:is_regular_file"
@__profn_readPhantomInput = private constant [16 x i8] c"readPhantomInput"
@__profn_writePhantomOutput = private constant [18 x i8] c"writePhantomOutput"
@__profn_fsize = private constant [5 x i8] c"fsize"
@__profn_is_text_file = private constant [12 x i8] c"is_text_file"
@__profn_xmalloc = private constant [7 x i8] c"xmalloc"
@__profn_settmpdir = private constant [9 x i8] c"settmpdir"
@__profn_setoutdir = private constant [9 x i8] c"setoutdir"
@__profn_tempfile = private constant [8 x i8] c"tempfile"
@__profn_rmtemp = private constant [6 x i8] c"rmtemp"
@__profn_savetemp = private constant [8 x i8] c"savetemp"
@__profn_ck_dup_output = private constant [13 x i8] c"ck_dup_output"
@__profn_savetempbak = private constant [11 x i8] c"savetempbak"
@__profn_cleanup_tmpf = private constant [12 x i8] c"cleanup_tmpf"
@__profn_manuals_missing = private constant [15 x i8] c"manuals_missing"
@__profn_tmp1.ll_expand_env = private constant [18 x i8] c"tmp1.ll:expand_env"
@__profn_tmp1.ll_doc_missing = private constant [19 x i8] c"tmp1.ll:doc_missing"
@__profn_tmp1.ll_files_missing = private constant [21 x i8] c"tmp1.ll:files_missing"
@__profn_tmp1.ll_ext_missing = private constant [19 x i8] c"tmp1.ll:ext_missing"
@__profc_file_exists = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_file_exists = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6938419872200725183, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_file_exists, i32 0, i32 0), i8* bitcast (i8 (i8*)* @file_exists to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_wipefile = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_wipefile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5242038235850474897, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_wipefile, i32 0, i32 0), i8* bitcast (i32 (i8*)* @wipefile to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_wipeout = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_wipeout = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2772608684053200690, i64 151277680935, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_file_tail = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_file_tail = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2919728901618934986, i64 41122367911, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_file_tail, i32 0, i32 0), i8* bitcast (i8* (i8*)* @file_tail to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_has_extension = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_has_extension = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6299078857536615155, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_has_extension, i32 0, i32 0), i8* bitcast (i8 (i8*, i8*)* @has_extension to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_is_tempfile = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_is_tempfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5123753911104332, i64 49430584994, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_is_tempfile, i32 0, i32 0), i8* bitcast (i8 (i8*)* @is_tempfile to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_no_extension = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_no_extension = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3914878891967276578, i64 54830550829, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_no_extension, i32 0, i32 0), i8* bitcast (i8 (i8*)* @no_extension to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_drop_extension = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_drop_extension = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4451440473589432003, i64 22759827559, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_drop_extension, i32 0, i32 0), i8* bitcast (void (i8*)* @drop_extension to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_default_extension = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_default_extension = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2045996320554921529, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_default_extension, i32 0, i32 0), i8* bitcast (void (i8*, i8*)* @default_extension to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_force_extension = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_force_extension = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4337951666369362364, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_force_extension, i32 0, i32 0), i8* bitcast (void (i8*, i8*)* @force_extension to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_truncate_name = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_truncate_name = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8534738306287991464, i64 109685239297, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_getyesno = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_getyesno = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2686338817306107973, i64 72057688138894686, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i32 0, i32 0), i8* bitcast (i8 (i8)* @getyesno to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_maybe_force_extension = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_maybe_force_extension = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6216356020932690314, i64 52195948381, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_maybe_force_extension, i32 0, i32 0), i8* bitcast (i8* (i8*, i8*)* @maybe_force_extension to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_buildfilename = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_buildfilename = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3942065630069002256, i64 58518109126, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_buildfilename, i32 0, i32 0), i8* bitcast (i8* (i8*, i8*)* @buildfilename to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_addslash = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_addslash = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8675552757836196005, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_addslash, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_buildsysfilename = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_buildsysfilename = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3674387434881535661, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_buildsysfilename, i32 0, i32 0), i8* bitcast (i8* (i8*, i8*)* @buildsysfilename to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_file_to_canon = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_file_to_canon = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4981443515327912891, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_file_to_canon, i32 0, i32 0), i8* bitcast (void (i8*)* @file_to_canon to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_write_error = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_write_error = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3040956384309230292, i64 46000771972, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_write_error, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*)* @write_error to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_copyfile = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_copyfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1608062998551921527, i64 122111526581, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, %struct._IO_FILE*, i64)* @copyfile to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_copyfilepos = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_copyfilepos = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3416725699722639808, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_copyfilepos, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, %struct._IO_FILE*, i64, i64)* @copyfilepos to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_copyfile_to_canon = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_copyfile_to_canon = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5998587417765464783, i64 209858688927, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, %struct._IO_FILE*, i64)* @copyfile_to_canon to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_copyfile_from_canon = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_copyfile_from_canon = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8507636707274501193, i64 128919215456, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, %struct._IO_FILE*, i64)* @copyfile_from_canon to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_copyfiles_by_name = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_copyfiles_by_name = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8657267467385064968, i64 55167759196, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_copyfiles_by_name, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @copyfiles_by_name to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_make_canonical = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_make_canonical = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8986805130215513598, i64 51375187908, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_make_canonical, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @make_canonical to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_rename2 = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_rename2 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3377823496993906411, i64 96832479886, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @rename2 to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_is_regular_file = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_is_regular_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6268543111665391954, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_is_regular_file, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_readPhantomInput = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_readPhantomInput = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3651669744537473546, i64 84512249617, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i32 0, i32 0), i8* bitcast (i32 (i8*)* @readPhantomInput to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_writePhantomOutput = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_writePhantomOutput = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6048192969846885333, i64 64588838391, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_writePhantomOutput, i32 0, i32 0), i8* bitcast (i32 (i8*)* @writePhantomOutput to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_fsize = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_fsize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 965005025741892232, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_fsize, i32 0, i32 0), i8* bitcast (i64 (%struct._IO_FILE*)* @fsize to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_is_text_file = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_is_text_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6196495388931297030, i64 144575860824, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i32 0, i32 0), i8* bitcast (i32 (i8*)* @is_text_file to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_xmalloc = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_xmalloc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5327979493986329667, i64 36496524737, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_xmalloc, i32 0, i32 0), i8* bitcast (i8* (i32)* @xmalloc to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_settmpdir = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_settmpdir = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2373803550568807430, i64 90476250161, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i32 0, i32 0), i8* bitcast (void (i8*)* @settmpdir to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_setoutdir = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_setoutdir = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6701859142133999071, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_setoutdir, i32 0, i32 0), i8* bitcast (void (i8*)* @setoutdir to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tempfile = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tempfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3153678586884785679, i64 72057853283186878, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i32 0, i32 0), i8* bitcast (i8* (i32)* @tempfile to i8*), i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_rmtemp = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_rmtemp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7692083154451699680, i64 161681367094, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i32 0, i32 0), i8* bitcast (void (i8*)* @rmtemp to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_savetemp = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_savetemp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7106443933812651203, i64 168468770939, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i32 0, i32 0), i8* bitcast (i8* (i8*, i8*)* @savetemp to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ck_dup_output = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ck_dup_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5444521558350410246, i64 168295603449, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i32 0, i32 0), i8* bitcast (i8* (i8*, i8, i8)* @ck_dup_output to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_savetempbak = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_savetempbak = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5040059101321810594, i64 94560637332, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @savetempbak to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_cleanup_tmpf = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_cleanup_tmpf = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -496919299114004397, i64 45130900406, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cleanup_tmpf, i32 0, i32 0), i8* bitcast (void ()* @cleanup_tmpf to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_manuals_missing = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_manuals_missing = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5036964328265221915, i64 57679611136, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_manuals_missing, i32 0, i32 0), i8* bitcast (i32 ()* @manuals_missing to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_expand_env = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_expand_env = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 555297702759825670, i64 65702056769, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_expand_env, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_doc_missing = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_doc_missing = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5961863774043935465, i64 49876089698, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_doc_missing, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_files_missing = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_files_missing = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8973891240533017303, i64 92677027992, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ext_missing = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ext_missing = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6591319042398531030, i64 51054561640, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ext_missing, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [632 x i8] c"\F5\04\00file_exists\01wipefile\01tmp1.ll:wipeout\01file_tail\01has_extension\01is_tempfile\01no_extension\01drop_extension\01default_extension\01force_extension\01tmp1.ll:truncate_name\01getyesno\01maybe_force_extension\01buildfilename\01tmp1.ll:addslash\01buildsysfilename\01file_to_canon\01write_error\01copyfile\01copyfilepos\01copyfile_to_canon\01copyfile_from_canon\01copyfiles_by_name\01make_canonical\01rename2\01tmp1.ll:is_regular_file\01readPhantomInput\01writePhantomOutput\01fsize\01is_text_file\01xmalloc\01settmpdir\01setoutdir\01tempfile\01rmtemp\01savetemp\01ck_dup_output\01savetempbak\01cleanup_tmpf\01manuals_missing\01tmp1.ll:expand_env\01tmp1.ll:doc_missing\01tmp1.ll:files_missing\01tmp1.ll:ext_missing", section "__llvm_prf_names"
@llvm.used = appending global [45 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_file_exists to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_wipefile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_wipeout to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_file_tail to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_has_extension to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_is_tempfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_no_extension to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_drop_extension to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_default_extension to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_force_extension to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_truncate_name to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_getyesno to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_maybe_force_extension to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_buildfilename to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_addslash to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_buildsysfilename to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_file_to_canon to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_write_error to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_copyfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_copyfilepos to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_copyfile_to_canon to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_copyfile_from_canon to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_copyfiles_by_name to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_make_canonical to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_rename2 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_is_regular_file to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_readPhantomInput to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_writePhantomOutput to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_fsize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_is_text_file to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_xmalloc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_settmpdir to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_setoutdir to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tempfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_rmtemp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_savetemp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ck_dup_output to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_savetempbak to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_cleanup_tmpf to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_manuals_missing to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_expand_env to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_doc_missing to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_files_missing to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ext_missing to i8*), i8* getelementptr inbounds ([632 x i8], [632 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @file_exists(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_file_exists, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_file_exists, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load i8*, i8** %3, align 8
  %5 = call i32 @access(i8* %4, i32 0) #6
  %6 = icmp eq i32 %5, 0
  %7 = zext i1 %6 to i32
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

; Function Attrs: nounwind
declare i32 @access(i8*, i32) #1

; Function Attrs: noinline nounwind uwtable
define i32 @wipefile(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  store i8* %0, i8** %3, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = call %struct._IO_FILE* @fopen(i8* %5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %6, %struct._IO_FILE** %4, align 8
  %7 = icmp eq %struct._IO_FILE* %6, null
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_wipefile, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_wipefile, i64 0, i64 1)
  store i32 -1, i32* %2, align 4
  br label %15

; <label>:10:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_wipefile, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_wipefile, i64 0, i64 0)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  call void @wipeout(%struct._IO_FILE* %12)
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %14 = call i32 @fclose(%struct._IO_FILE* %13)
  store i32 0, i32* %2, align 4
  br label %15

; <label>:15:                                     ; preds = %10, %8
  %16 = load i32, i32* %2, align 4
  ret i32 %16
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @wipeout(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %10 = call i32 @fseek(%struct._IO_FILE* %9, i64 0, i32 2)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %12 = call i64 @ftell(%struct._IO_FILE* %11)
  store i64 %12, i64* %6, align 8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  call void @rewind(%struct._IO_FILE* %13)
  %14 = load i64, i64* %6, align 8
  %15 = xor i64 %14, -1
  store i64 %15, i64* %7, align 8
  store i32* getelementptr inbounds ([2048 x i32], [2048 x i32]* @textbuf2, i32 0, i64 55), i32** %3, align 8
  br label %16

; <label>:16:                                     ; preds = %44, %1
  store i32 0, i32* %8, align 4
  br label %17

; <label>:17:                                     ; preds = %35, %16
  %18 = load i32, i32* %8, align 4
  %19 = icmp slt i32 %18, 32
  br i1 %19, label %20, label %38

; <label>:20:                                     ; preds = %17
  %21 = load i64, i64* %7, align 8
  %22 = and i64 %21, 2147483648
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %29

; <label>:24:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 3)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 3)
  %26 = load i64, i64* %7, align 8
  %27 = shl i64 %26, 1
  %28 = xor i64 %27, 79764919
  br label %33

; <label>:29:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 4)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 4)
  %31 = load i64, i64* %7, align 8
  %32 = shl i64 %31, 1
  br label %33

; <label>:33:                                     ; preds = %29, %24
  %34 = phi i64 [ %28, %24 ], [ %32, %29 ]
  store i64 %34, i64* %7, align 8
  br label %35

; <label>:35:                                     ; preds = %33
  %36 = load i32, i32* %8, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %8, align 4
  br label %17

; <label>:38:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 5)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 5)
  %40 = load i64, i64* %7, align 8
  %41 = trunc i64 %40 to i32
  %42 = load i32*, i32** %3, align 8
  %43 = getelementptr inbounds i32, i32* %42, i32 -1
  store i32* %43, i32** %3, align 8
  store i32 %41, i32* %43, align 4
  br label %44

; <label>:44:                                     ; preds = %38
  %45 = load i32*, i32** %3, align 8
  %46 = icmp ugt i32* %45, getelementptr inbounds ([2048 x i32], [2048 x i32]* @textbuf2, i32 0, i32 0)
  br i1 %46, label %16, label %47

; <label>:47:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 8)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 8)
  br label %49

; <label>:49:                                     ; preds = %111, %47
  %50 = load i64, i64* %6, align 8
  %51 = icmp ne i64 %50, 0
  br i1 %51, label %52, label %112

; <label>:52:                                     ; preds = %49
  store i32* getelementptr inbounds ([2048 x i32], [2048 x i32]* @textbuf2, i32 0, i64 55), i32** %5, align 8
  store i32* getelementptr inbounds ([2048 x i32], [2048 x i32]* @textbuf2, i32 0, i64 24), i32** %4, align 8
  store i32* getelementptr inbounds (i32, i32* getelementptr inbounds ([2048 x i32], [2048 x i32]* @textbuf2, i32 0, i32 0), i64 2048), i32** %3, align 8
  br label %53

; <label>:53:                                     ; preds = %64, %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 0)
  %54 = add i64 %pgocount4, 1
  store i64 %54, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 0)
  %55 = load i32*, i32** %4, align 8
  %56 = getelementptr inbounds i32, i32* %55, i32 -1
  store i32* %56, i32** %4, align 8
  %57 = load i32, i32* %56, align 4
  %58 = load i32*, i32** %5, align 8
  %59 = getelementptr inbounds i32, i32* %58, i32 -1
  store i32* %59, i32** %5, align 8
  %60 = load i32, i32* %59, align 4
  %61 = add i32 %57, %60
  %62 = load i32*, i32** %3, align 8
  %63 = getelementptr inbounds i32, i32* %62, i32 -1
  store i32* %63, i32** %3, align 8
  store i32 %61, i32* %63, align 4
  br label %64

; <label>:64:                                     ; preds = %53
  %65 = load i32*, i32** %4, align 8
  %66 = icmp ugt i32* %65, getelementptr inbounds ([2048 x i32], [2048 x i32]* @textbuf2, i32 0, i32 0)
  br i1 %66, label %53, label %67

; <label>:67:                                     ; preds = %64
  store i32* getelementptr inbounds (i32, i32* getelementptr inbounds ([2048 x i32], [2048 x i32]* @textbuf2, i32 0, i32 0), i64 2048), i32** %4, align 8
  br label %68

; <label>:68:                                     ; preds = %79, %67
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 1)
  %69 = add i64 %pgocount5, 1
  store i64 %69, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 1)
  %70 = load i32*, i32** %4, align 8
  %71 = getelementptr inbounds i32, i32* %70, i32 -1
  store i32* %71, i32** %4, align 8
  %72 = load i32, i32* %71, align 4
  %73 = load i32*, i32** %5, align 8
  %74 = getelementptr inbounds i32, i32* %73, i32 -1
  store i32* %74, i32** %5, align 8
  %75 = load i32, i32* %74, align 4
  %76 = add i32 %72, %75
  %77 = load i32*, i32** %3, align 8
  %78 = getelementptr inbounds i32, i32* %77, i32 -1
  store i32* %78, i32** %3, align 8
  store i32 %76, i32* %78, align 4
  br label %79

; <label>:79:                                     ; preds = %68
  %80 = load i32*, i32** %5, align 8
  %81 = icmp ugt i32* %80, getelementptr inbounds ([2048 x i32], [2048 x i32]* @textbuf2, i32 0, i32 0)
  br i1 %81, label %68, label %82

; <label>:82:                                     ; preds = %79
  store i32* getelementptr inbounds (i32, i32* getelementptr inbounds ([2048 x i32], [2048 x i32]* @textbuf2, i32 0, i32 0), i64 2048), i32** %5, align 8
  br label %83

; <label>:83:                                     ; preds = %94, %82
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 2)
  %84 = add i64 %pgocount6, 1
  store i64 %84, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 2)
  %85 = load i32*, i32** %4, align 8
  %86 = getelementptr inbounds i32, i32* %85, i32 -1
  store i32* %86, i32** %4, align 8
  %87 = load i32, i32* %86, align 4
  %88 = load i32*, i32** %5, align 8
  %89 = getelementptr inbounds i32, i32* %88, i32 -1
  store i32* %89, i32** %5, align 8
  %90 = load i32, i32* %89, align 4
  %91 = add i32 %87, %90
  %92 = load i32*, i32** %3, align 8
  %93 = getelementptr inbounds i32, i32* %92, i32 -1
  store i32* %93, i32** %3, align 8
  store i32 %91, i32* %93, align 4
  br label %94

; <label>:94:                                     ; preds = %83
  %95 = load i32*, i32** %3, align 8
  %96 = icmp ugt i32* %95, getelementptr inbounds ([2048 x i32], [2048 x i32]* @textbuf2, i32 0, i32 0)
  br i1 %96, label %83, label %97

; <label>:97:                                     ; preds = %94
  %98 = load i64, i64* %6, align 8
  %99 = icmp ugt i64 %98, 8192
  br i1 %99, label %100, label %106

; <label>:100:                                    ; preds = %97
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 6)
  %101 = add i64 %pgocount7, 1
  store i64 %101, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 6)
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %103 = call i64 @fwrite(i8* bitcast ([2048 x i32]* @textbuf2 to i8*), i64 8192, i64 1, %struct._IO_FILE* %102)
  %104 = load i64, i64* %6, align 8
  %105 = sub i64 %104, 8192
  store i64 %105, i64* %6, align 8
  br label %111

; <label>:106:                                    ; preds = %97
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 7)
  %107 = add i64 %pgocount8, 1
  store i64 %107, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_wipeout, i64 0, i64 7)
  %108 = load i64, i64* %6, align 8
  %109 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %110 = call i64 @fwrite(i8* bitcast ([2048 x i32]* @textbuf2 to i8*), i64 %108, i64 1, %struct._IO_FILE* %109)
  store i64 0, i64* %6, align 8
  br label %111

; <label>:111:                                    ; preds = %106, %100
  br label %49

; <label>:112:                                    ; preds = %49
  ret void
}

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define i8* @file_tail(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @DIRSEPS, i32 0, i32 0), i8** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %21, %1
  %6 = load i8*, i8** %4, align 8
  %7 = load i8, i8* %6, align 1
  %8 = icmp ne i8 %7, 0
  br i1 %8, label %9, label %25

; <label>:9:                                      ; preds = %5
  %10 = load i8*, i8** %2, align 8
  %11 = load i8*, i8** %4, align 8
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = call i8* @strrchr(i8* %10, i32 %13) #7
  store i8* %14, i8** %3, align 8
  %15 = load i8*, i8** %3, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %17, label %21

; <label>:17:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_file_tail, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_file_tail, i64 0, i64 1)
  %19 = load i8*, i8** %3, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 1
  store i8* %20, i8** %2, align 8
  br label %21

; <label>:21:                                     ; preds = %17, %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_file_tail, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_file_tail, i64 0, i64 0)
  %23 = load i8*, i8** %4, align 8
  %24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %24, i8** %4, align 8
  br label %5

; <label>:25:                                     ; preds = %5
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_file_tail, i64 0, i64 2)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_file_tail, i64 0, i64 2)
  %27 = load i8*, i8** %2, align 8
  ret i8* %27
}

; Function Attrs: nounwind readonly
declare i8* @strrchr(i8*, i32) #3

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @has_extension(i8*, i8*) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %8 = load i8*, i8** %4, align 8
  %9 = call i64 @strlen(i8* %8) #7
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %6, align 4
  %11 = load i8*, i8** %5, align 8
  %12 = call i64 @strlen(i8* %11) #7
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %7, align 4
  %14 = load i32, i32* %6, align 4
  %15 = load i32, i32* %7, align 4
  %16 = icmp sle i32 %14, %15
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_has_extension, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_has_extension, i64 0, i64 0)
  store i8 0, i8* %3, align 1
  br label %35

; <label>:19:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_has_extension, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_has_extension, i64 0, i64 1)
  %21 = load i8*, i8** %4, align 8
  %22 = load i32, i32* %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8* %21, i64 %23
  %25 = load i32, i32* %7, align 4
  %26 = sext i32 %25 to i64
  %27 = sub i64 0, %26
  %28 = getelementptr inbounds i8, i8* %24, i64 %27
  %29 = load i8*, i8** %5, align 8
  %30 = call i32 @strcmp(i8* %28, i8* %29) #7
  %31 = icmp ne i32 %30, 0
  %32 = xor i1 %31, true
  %33 = zext i1 %32 to i32
  %34 = trunc i32 %33 to i8
  store i8 %34, i8* %3, align 1
  br label %35

; <label>:35:                                     ; preds = %19, %17
  %36 = load i8, i8* %3, align 1
  ret i8 %36
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @is_tempfile(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i8* @strrchr(i8* %4, i32 46) #7
  store i8* %5, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = icmp ne i8* %6, null
  br i1 %7, label %8, label %50

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_is_tempfile, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_is_tempfile, i64 0, i64 1)
  %10 = load i8*, i8** %3, align 8
  %11 = getelementptr inbounds i8, i8* %10, i64 1
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp eq i32 %13, 36
  br i1 %14, label %15, label %50

; <label>:15:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_is_tempfile, i64 0, i64 2)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_is_tempfile, i64 0, i64 2)
  %17 = call i16** @__ctype_b_loc() #8
  %18 = load i16*, i16** %17, align 8
  %19 = load i8*, i8** %3, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 2
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i16, i16* %18, i64 %23
  %25 = load i16, i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = and i32 %26, 2048
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %50

; <label>:29:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_is_tempfile, i64 0, i64 3)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_is_tempfile, i64 0, i64 3)
  %31 = call i16** @__ctype_b_loc() #8
  %32 = load i16*, i16** %31, align 8
  %33 = load i8*, i8** %3, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 3
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i16, i16* %32, i64 %37
  %39 = load i16, i16* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = and i32 %40, 2048
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %50

; <label>:43:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_is_tempfile, i64 0, i64 4)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_is_tempfile, i64 0, i64 4)
  %45 = load i8*, i8** %3, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 4
  %47 = load i8, i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %48, 0
  br label %50

; <label>:50:                                     ; preds = %43, %29, %15, %8, %1
  %51 = phi i1 [ false, %29 ], [ false, %15 ], [ false, %8 ], [ false, %1 ], [ %49, %43 ]
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_is_tempfile, i64 0, i64 0)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_is_tempfile, i64 0, i64 0)
  %53 = zext i1 %51 to i32
  %54 = trunc i32 %53 to i8
  ret i8 %54
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #4

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @no_extension(i8*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load i8*, i8** %3, align 8
  %5 = call zeroext i8 @has_extension(i8* %4, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @ASC_EXTENSION, i32 0, i32 0))
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %26, label %8

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_no_extension, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_no_extension, i64 0, i64 1)
  %10 = load i8*, i8** %3, align 8
  %11 = call zeroext i8 @has_extension(i8* %10, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  %12 = zext i8 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %26, label %14

; <label>:14:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_no_extension, i64 0, i64 2)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_no_extension, i64 0, i64 2)
  %16 = load i8*, i8** %3, align 8
  %17 = call zeroext i8 @has_extension(i8* %16, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @SIG_EXTENSION, i32 0, i32 0))
  %18 = zext i8 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %26, label %20

; <label>:20:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_no_extension, i64 0, i64 3)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_no_extension, i64 0, i64 3)
  %22 = load i8*, i8** %3, align 8
  %23 = call zeroext i8 @is_tempfile(i8* %22)
  %24 = zext i8 %23 to i32
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %20, %14, %8, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_no_extension, i64 0, i64 0)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_no_extension, i64 0, i64 0)
  store i8 0, i8* %2, align 1
  br label %30

; <label>:28:                                     ; preds = %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_no_extension, i64 0, i64 4)
  %29 = add i64 %pgocount4, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_no_extension, i64 0, i64 4)
  store i8 1, i8* %2, align 1
  br label %30

; <label>:30:                                     ; preds = %28, %26
  %31 = load i8, i8* %2, align 1
  ret i8 %31
}

; Function Attrs: noinline nounwind uwtable
define void @drop_extension(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call zeroext i8 @no_extension(i8* %3)
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %10, label %6

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_drop_extension, i64 0, i64 1)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_drop_extension, i64 0, i64 1)
  %8 = load i8*, i8** %2, align 8
  %9 = call i8* @strrchr(i8* %8, i32 46) #7
  store i8 0, i8* %9, align 1
  br label %10

; <label>:10:                                     ; preds = %6, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_drop_extension, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_drop_extension, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @default_extension(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = call zeroext i8 @no_extension(i8* %5)
  %7 = icmp ne i8 %6, 0
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_default_extension, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_default_extension, i64 0, i64 1)
  %10 = load i8*, i8** %3, align 8
  %11 = load i8*, i8** %4, align 8
  %12 = call i8* @strcat(i8* %10, i8* %11) #6
  br label %13

; <label>:13:                                     ; preds = %8, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_default_extension, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_default_extension, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define void @force_extension(i8*, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_force_extension, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_force_extension, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load i8*, i8** %4, align 8
  call void @drop_extension(i8* %6)
  %7 = load i8*, i8** %4, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = call i64 @strlen(i8* %8) #7
  %10 = trunc i64 %9 to i32
  call void @truncate_name(i8* %7, i32 %10)
  %11 = load i8*, i8** %4, align 8
  %12 = load i8*, i8** %5, align 8
  %13 = call i8* @strcat(i8* %11, i8* %12) #6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @truncate_name(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca [256 x i8], align 16
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = getelementptr inbounds [256 x i8], [256 x i8]* %7, i32 0, i32 0
  %9 = load i8*, i8** %3, align 8
  %10 = call i8* @strcpy(i8* %8, i8* %9) #6
  %11 = getelementptr inbounds [256 x i8], [256 x i8]* %7, i32 0, i32 0
  %12 = call i8* @strrchr(i8* %11, i32 47) #7
  store i8* %12, i8** %5, align 8
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 1)
  %16 = getelementptr inbounds [256 x i8], [256 x i8]* %7, i32 0, i32 0
  %17 = call i8* @strcpy(i8* %16, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0)) #6
  br label %28

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %5, align 8
  %20 = getelementptr inbounds [256 x i8], [256 x i8]* %7, i32 0, i32 0
  %21 = icmp eq i8* %19, %20
  br i1 %21, label %22, label %26

; <label>:22:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 3)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 3)
  %24 = load i8*, i8** %5, align 8
  %25 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %25, i8** %5, align 8
  br label %26

; <label>:26:                                     ; preds = %22, %18
  %27 = load i8*, i8** %5, align 8
  store i8 0, i8* %27, align 1
  br label %28

; <label>:28:                                     ; preds = %26, %14
  %29 = getelementptr inbounds [256 x i8], [256 x i8]* %7, i32 0, i32 0
  %30 = call i64 @pathconf(i8* %29, i32 3) #6
  %31 = trunc i64 %30 to i32
  store i32 %31, i32* %6, align 4
  %32 = load i32, i32* %4, align 4
  %33 = icmp sle i32 %31, %32
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 0)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 0)
  br label %79

; <label>:36:                                     ; preds = %28
  %37 = load i8*, i8** %3, align 8
  %38 = call i8* @strrchr(i8* %37, i32 47) #7
  store i8* %38, i8** %5, align 8
  %39 = icmp eq i8* %38, null
  br i1 %39, label %40, label %43

; <label>:40:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 5)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 5)
  %42 = load i8*, i8** %3, align 8
  store i8* %42, i8** %5, align 8
  br label %47

; <label>:43:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 2)
  %44 = add i64 %pgocount4, 1
  store i64 %44, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 2)
  %45 = load i8*, i8** %5, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %5, align 8
  br label %47

; <label>:47:                                     ; preds = %43, %40
  %48 = load i8*, i8** %5, align 8
  %49 = call i64 @strlen(i8* %48) #7
  %50 = load i32, i32* %6, align 4
  %51 = load i32, i32* %4, align 4
  %52 = sub nsw i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = icmp ugt i64 %49, %53
  br i1 %54, label %55, label %79

; <label>:55:                                     ; preds = %47
  %56 = load i8, i8* @verbose, align 1
  %57 = icmp ne i8 %56, 0
  br i1 %57, label %58, label %63

; <label>:58:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 6)
  %59 = add i64 %pgocount5, 1
  store i64 %59, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 6)
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %61 = load i8*, i8** %3, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.45, i32 0, i32 0), i8* %61)
  br label %63

; <label>:63:                                     ; preds = %58, %55
  %64 = load i8*, i8** %5, align 8
  %65 = load i32, i32* %6, align 4
  %66 = load i32, i32* %4, align 4
  %67 = sub nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8* %64, i64 %68
  store i8 0, i8* %69, align 1
  %70 = load i8, i8* @verbose, align 1
  %71 = icmp ne i8 %70, 0
  br i1 %71, label %72, label %77

; <label>:72:                                     ; preds = %63
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 7)
  %73 = add i64 %pgocount6, 1
  store i64 %73, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 7)
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %75 = load i8*, i8** %3, align 8
  %76 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %74, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.46, i32 0, i32 0), i8* %75)
  br label %77

; <label>:77:                                     ; preds = %72, %63
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 4)
  %78 = add i64 %pgocount7, 1
  store i64 %78, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_truncate_name, i64 0, i64 4)
  br label %79

; <label>:79:                                     ; preds = %77, %47, %34
  ret void
}

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @getyesno(i8 signext) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca [8 x i8], align 1
  store i8 %0, i8* %3, align 1
  %5 = load i8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @getyesno.yes, i64 0, i64 0), align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %14

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 1)
  %10 = call i8* @LANG(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  %11 = call i8* @strncpy(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @getyesno.yes, i32 0, i32 0), i8* %10, i64 7) #6
  %12 = call i8* @LANG(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %13 = call i8* @strncpy(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @getyesno.no, i32 0, i32 0), i8* %12, i64 7) #6
  br label %14

; <label>:14:                                     ; preds = %8, %1
  %15 = load i8, i8* @batchmode, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %51, label %17

; <label>:17:                                     ; preds = %14
  %18 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i32 0, i32 0
  %19 = call i32 @getstring(i8* %18, i32 6, i32 1)
  %20 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i32 0, i32 0
  %21 = call i8* @strlwr(i8* %20)
  %22 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i32 0, i32 0
  %23 = call i64 @strlen(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @getyesno.no, i32 0, i32 0)) #7
  %24 = call i32 @strncmp(i8* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @getyesno.no, i32 0, i32 0), i64 %23) #7
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %28, label %26

; <label>:26:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 2)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 2)
  store i8 0, i8* %2, align 1
  br label %60

; <label>:28:                                     ; preds = %17
  %29 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i32 0, i32 0
  %30 = call i64 @strlen(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @getyesno.yes, i32 0, i32 0)) #7
  %31 = call i32 @strncmp(i8* %29, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @getyesno.yes, i32 0, i32 0), i64 %30) #7
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %35, label %33

; <label>:33:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 3)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 3)
  store i8 1, i8* %2, align 1
  br label %60

; <label>:35:                                     ; preds = %28
  %36 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i64 0, i64 0
  %37 = load i8, i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp eq i32 %38, 110
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 4)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 4)
  store i8 0, i8* %2, align 1
  br label %60

; <label>:42:                                     ; preds = %35
  %43 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i64 0, i64 0
  %44 = load i8, i8* %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 121
  br i1 %46, label %47, label %49

; <label>:47:                                     ; preds = %42
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 5)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 5)
  store i8 1, i8* %2, align 1
  br label %60

; <label>:49:                                     ; preds = %42
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 6)
  %50 = add i64 %pgocount5, 1
  store i64 %50, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 6)
  br label %51

; <label>:51:                                     ; preds = %49, %14
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 0)
  %52 = add i64 %pgocount6, 1
  store i64 %52, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 0)
  %53 = load i8, i8* %3, align 1
  %54 = sext i8 %53 to i32
  %55 = icmp eq i32 %54, 121
  %56 = zext i1 %55 to i64
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 7)
  %57 = add i64 %pgocount7, %56
  store i64 %57, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_getyesno, i64 0, i64 7)
  %58 = select i1 %55, i32 1, i32 0
  %59 = trunc i32 %58 to i8
  store i8 %59, i8* %2, align 1
  br label %60

; <label>:60:                                     ; preds = %51, %47, %40, %33, %26
  %61 = load i8, i8* %2, align 1
  ret i8 %61
}

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #1

declare i8* @LANG(i8*) #2

declare i32 @getstring(i8*, i32, i32) #2

declare i8* @strlwr(i8*) #2

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define i8* @maybe_force_extension(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load i8*, i8** %4, align 8
  %7 = load i8*, i8** %5, align 8
  %8 = call zeroext i8 @has_extension(i8* %6, i8* %7)
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %29, label %10

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %4, align 8
  %12 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @maybe_force_extension.newname, i32 0, i32 0), i8* %11) #6
  %13 = load i8*, i8** %5, align 8
  call void @force_extension(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @maybe_force_extension.newname, i32 0, i32 0), i8* %13)
  %14 = call zeroext i8 @file_exists(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @maybe_force_extension.newname, i32 0, i32 0))
  %15 = icmp ne i8 %14, 0
  br i1 %15, label %27, label %16

; <label>:16:                                     ; preds = %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %18 = call i8* @LANG(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.3, i32 0, i32 0))
  %19 = load i8*, i8** %4, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* %18, i8* %19, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @maybe_force_extension.newname, i32 0, i32 0))
  %21 = call zeroext i8 @getyesno(i8 signext 121)
  %22 = icmp ne i8 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_maybe_force_extension, i64 0, i64 2)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_maybe_force_extension, i64 0, i64 2)
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @maybe_force_extension.newname, i32 0, i32 0), i8** %3, align 8
  br label %31

; <label>:25:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_maybe_force_extension, i64 0, i64 3)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_maybe_force_extension, i64 0, i64 3)
  br label %27

; <label>:27:                                     ; preds = %25, %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_maybe_force_extension, i64 0, i64 1)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_maybe_force_extension, i64 0, i64 1)
  br label %29

; <label>:29:                                     ; preds = %27, %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_maybe_force_extension, i64 0, i64 0)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_maybe_force_extension, i64 0, i64 0)
  store i8* null, i8** %3, align 8
  br label %31

; <label>:31:                                     ; preds = %29, %23
  %32 = load i8*, i8** %3, align 8
  ret i8* %32
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define i8* @buildfilename(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %5, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  store i8 0, i8* %7, align 1
  %8 = load i8*, i8** %5, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %20

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_buildfilename, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_buildfilename, i64 0, i64 1)
  %12 = load i8*, i8** %5, align 8
  %13 = call i64 @strlen(i8* %12) #7
  %14 = icmp ule i64 %13, 50
  br i1 %14, label %15, label %20

; <label>:15:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_buildfilename, i64 0, i64 3)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_buildfilename, i64 0, i64 3)
  %17 = load i8*, i8** %3, align 8
  %18 = load i8*, i8** %5, align 8
  %19 = call i8* @strcpy(i8* %17, i8* %18) #6
  br label %39

; <label>:20:                                     ; preds = %10, %2
  %21 = call i8* (i8*, ...) bitcast (i8* (...)* @getenv to i8* (i8*, ...)*)(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0))
  store i8* %21, i8** %5, align 8
  %22 = load i8*, i8** %5, align 8
  %23 = icmp ne i8* %22, null
  br i1 %23, label %24, label %37

; <label>:24:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_buildfilename, i64 0, i64 2)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_buildfilename, i64 0, i64 2)
  %26 = load i8*, i8** %5, align 8
  %27 = call i64 @strlen(i8* %26) #7
  %28 = icmp ule i64 %27, 50
  br i1 %28, label %29, label %37

; <label>:29:                                     ; preds = %24
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_buildfilename, i64 0, i64 4)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_buildfilename, i64 0, i64 4)
  %31 = load i8*, i8** %3, align 8
  %32 = load i8*, i8** %5, align 8
  %33 = call i8* @strcpy(i8* %31, i8* %32) #6
  %34 = load i8*, i8** %3, align 8
  call void @addslash(i8* %34)
  %35 = load i8*, i8** %3, align 8
  %36 = call i8* @strcat(i8* %35, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0)) #6
  br label %37

; <label>:37:                                     ; preds = %29, %24, %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_buildfilename, i64 0, i64 0)
  %38 = add i64 %pgocount4, 1
  store i64 %38, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_buildfilename, i64 0, i64 0)
  br label %39

; <label>:39:                                     ; preds = %37, %15
  %40 = load i8*, i8** %3, align 8
  call void @addslash(i8* %40)
  %41 = load i8*, i8** %3, align 8
  %42 = load i8*, i8** %4, align 8
  %43 = call i8* @strcat(i8* %41, i8* %42) #6
  %44 = load i8*, i8** %3, align 8
  ret i8* %44
}

declare i8* @getenv(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @addslash(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i64 @strlen(i8* %4) #7
  %6 = trunc i64 %5 to i32
  store i32 %6, i32* %3, align 4
  %7 = load i32, i32* %3, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %32

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_addslash, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_addslash, i64 0, i64 1)
  %11 = load i8*, i8** %2, align 8
  %12 = load i32, i32* %3, align 4
  %13 = sub nsw i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8* %11, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = call i8* @strchr(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @DIRSEPS, i32 0, i32 0), i32 %17) #7
  %19 = icmp ne i8* %18, null
  br i1 %19, label %32, label %20

; <label>:20:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_addslash, i64 0, i64 2)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_addslash, i64 0, i64 2)
  %22 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @DIRSEPS, i64 0, i64 0), align 1
  %23 = load i8*, i8** %2, align 8
  %24 = load i32, i32* %3, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, i8* %23, i64 %25
  store i8 %22, i8* %26, align 1
  %27 = load i8*, i8** %2, align 8
  %28 = load i32, i32* %3, align 4
  %29 = add nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8* %27, i64 %30
  store i8 0, i8* %31, align 1
  br label %32

; <label>:32:                                     ; preds = %20, %9, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_addslash, i64 0, i64 0)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_addslash, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i8* @buildsysfilename(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load i8*, i8** %4, align 8
  %7 = call i8* @strcpy(i8* %6, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i32 0, i32 0)) #6
  %8 = load i8*, i8** %4, align 8
  %9 = load i8*, i8** %5, align 8
  %10 = call i8* @strcat(i8* %8, i8* %9) #6
  %11 = load i8*, i8** %4, align 8
  %12 = call zeroext i8 @file_exists(i8* %11)
  %13 = icmp ne i8 %12, 0
  br i1 %13, label %14, label %17

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_buildsysfilename, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_buildsysfilename, i64 0, i64 0)
  %16 = load i8*, i8** %4, align 8
  store i8* %16, i8** %3, align 8
  br label %23

; <label>:17:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_buildsysfilename, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_buildsysfilename, i64 0, i64 1)
  %19 = load i8*, i8** %4, align 8
  %20 = load i8*, i8** %5, align 8
  %21 = call i8* @buildfilename(i8* %19, i8* %20)
  %22 = load i8*, i8** %4, align 8
  store i8* %22, i8** %3, align 8
  br label %23

; <label>:23:                                     ; preds = %17, %14
  %24 = load i8*, i8** %3, align 8
  ret i8* %24
}

; Function Attrs: noinline nounwind uwtable
define void @file_to_canon(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_file_to_canon, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_file_to_canon, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @write_error(%struct._IO_FILE*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = call i32 @fflush(%struct._IO_FILE* %4)
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %7 = call i32 @ferror(%struct._IO_FILE* %6) #6
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %24

; <label>:9:                                      ; preds = %1
  %10 = call i32* @__errno_location() #8
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 28
  br i1 %12, label %13, label %18

; <label>:13:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_write_error, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_write_error, i64 0, i64 1)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %16 = call i8* @LANG(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.8, i32 0, i32 0))
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* %16)
  br label %23

; <label>:18:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_write_error, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_write_error, i64 0, i64 2)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %21 = call i8* @LANG(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i32 0, i32 0))
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* %21)
  br label %23

; <label>:23:                                     ; preds = %18, %13
  store i32 -1, i32* %2, align 4
  br label %26

; <label>:24:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_write_error, i64 0, i64 0)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_write_error, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %26

; <label>:26:                                     ; preds = %24, %23
  %27 = load i32, i32* %2, align 4
  ret i32 %27
}

declare i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #1

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #4

; Function Attrs: noinline nounwind uwtable
define i32 @copyfile(%struct._IO_FILE*, %struct._IO_FILE*, i64) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  store i64 %2, i64* %6, align 8
  store i32 0, i32* %8, align 4
  br label %10

; <label>:10:                                     ; preds = %82, %3
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %11, 4096
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 3)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 3)
  %15 = load i64, i64* %6, align 8
  %16 = trunc i64 %15 to i32
  store i32 %16, i32* %7, align 4
  br label %19

; <label>:17:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 4)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 4)
  store i32 4096, i32* %7, align 4
  br label %19

; <label>:19:                                     ; preds = %17, %13
  %20 = load i32, i32* %7, align 4
  %21 = sext i32 %20 to i64
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %23 = call i64 @fread(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i64 1, i64 %21, %struct._IO_FILE* %22)
  %24 = trunc i64 %23 to i32
  store i32 %24, i32* %7, align 4
  %25 = load i32, i32* %7, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %81

; <label>:27:                                     ; preds = %19
  %28 = load i32, i32* @CONVERSION, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %65

; <label>:30:                                     ; preds = %27
  store i32 0, i32* %9, align 4
  br label %31

; <label>:31:                                     ; preds = %60, %30
  %32 = load i32, i32* %9, align 4
  %33 = load i32, i32* %7, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %63

; <label>:35:                                     ; preds = %31
  %36 = load i32, i32* @CONVERSION, align 4
  %37 = icmp eq i32 %36, 2
  br i1 %37, label %38, label %46

; <label>:38:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 0)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 0)
  %40 = load i32, i32* %9, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [4096 x i8], [4096 x i8]* @textbuf, i64 0, i64 %41
  %43 = load i8, i8* %42, align 1
  %44 = call signext i8 @EXT_C(i8 signext %43)
  %45 = sext i8 %44 to i32
  br label %54

; <label>:46:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 1)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 1)
  %48 = load i32, i32* %9, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [4096 x i8], [4096 x i8]* @textbuf, i64 0, i64 %49
  %51 = load i8, i8* %50, align 1
  %52 = call signext i8 @INT_C(i8 signext %51)
  %53 = sext i8 %52 to i32
  br label %54

; <label>:54:                                     ; preds = %46, %38
  %55 = phi i32 [ %45, %38 ], [ %53, %46 ]
  %56 = trunc i32 %55 to i8
  %57 = load i32, i32* %9, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [4096 x i8], [4096 x i8]* @textbuf, i64 0, i64 %58
  store i8 %56, i8* %59, align 1
  br label %60

; <label>:60:                                     ; preds = %54
  %61 = load i32, i32* %9, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %9, align 4
  br label %31

; <label>:63:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 5)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 5)
  br label %65

; <label>:65:                                     ; preds = %63, %27
  %66 = load i32, i32* %7, align 4
  %67 = sext i32 %66 to i64
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %69 = call i64 @fwrite(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i64 1, i64 %67, %struct._IO_FILE* %68)
  %70 = load i32, i32* %7, align 4
  %71 = sext i32 %70 to i64
  %72 = icmp ne i64 %69, %71
  br i1 %72, label %73, label %75

; <label>:73:                                     ; preds = %65
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 7)
  %74 = add i64 %pgocount5, 1
  store i64 %74, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 7)
  store i32 -1, i32* %8, align 4
  br label %85

; <label>:75:                                     ; preds = %65
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 2)
  %76 = add i64 %pgocount6, 1
  store i64 %76, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 2)
  %77 = load i32, i32* %7, align 4
  %78 = sext i32 %77 to i64
  %79 = load i64, i64* %6, align 8
  %80 = sub i64 %79, %78
  store i64 %80, i64* %6, align 8
  br label %81

; <label>:81:                                     ; preds = %75, %19
  br label %82

; <label>:82:                                     ; preds = %81
  %83 = load i32, i32* %7, align 4
  %84 = icmp eq i32 %83, 4096
  br i1 %84, label %10, label %85

; <label>:85:                                     ; preds = %82, %73
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 6)
  %86 = add i64 %pgocount7, 1
  store i64 %86, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_copyfile, i64 0, i64 6)
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i8 0, i64 4096, i32 16, i1 false)
  %87 = load i32, i32* %8, align 4
  ret i32 %87
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #2

declare signext i8 @EXT_C(i8 signext) #2

declare signext i8 @INT_C(i8 signext) #2

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

; Function Attrs: noinline nounwind uwtable
define i32 @copyfilepos(%struct._IO_FILE*, %struct._IO_FILE*, i64, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_copyfilepos, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_copyfilepos, i64 0, i64 0)
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %6, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %7, align 8
  store i64 %2, i64* %8, align 8
  store i64 %3, i64* %9, align 8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %11 = load i64, i64* %9, align 8
  %12 = call i32 @fseek(%struct._IO_FILE* %10, i64 %11, i32 0)
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %15 = load i64, i64* %8, align 8
  %16 = call i32 @copyfile(%struct._IO_FILE* %13, %struct._IO_FILE* %14, i64 %15)
  ret i32 %16
}

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #2

; Function Attrs: noinline nounwind uwtable
define i32 @copyfile_to_canon(%struct._IO_FILE*, %struct._IO_FILE*, i64) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  store i64 %2, i64* %6, align 8
  store i32 0, i32* %8, align 4
  store i32 0, i32* %14, align 4
  br label %15

; <label>:15:                                     ; preds = %132, %3
  %16 = load i64, i64* %6, align 8
  %17 = icmp ult i64 %16, 4096
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 10)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 10)
  %20 = load i64, i64* %6, align 8
  %21 = trunc i64 %20 to i32
  store i32 %21, i32* %7, align 4
  br label %24

; <label>:22:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 11)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 11)
  store i32 4096, i32* %7, align 4
  br label %24

; <label>:24:                                     ; preds = %22, %18
  %25 = load i32, i32* %7, align 4
  %26 = sext i32 %25 to i64
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %28 = call i64 @fread(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i64 1, i64 %26, %struct._IO_FILE* %27)
  %29 = trunc i64 %28 to i32
  store i32 %29, i32* %7, align 4
  %30 = load i32, i32* %7, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %131

; <label>:32:                                     ; preds = %24
  store i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i8** %10, align 8
  store i8* bitcast ([2048 x i32]* @textbuf2 to i8*), i8** %11, align 8
  store i32 0, i32* %12, align 4
  br label %33

; <label>:33:                                     ; preds = %108, %32
  %34 = load i32, i32* %12, align 4
  %35 = load i32, i32* %7, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %111

; <label>:37:                                     ; preds = %33
  %38 = load i32, i32* @CONVERSION, align 4
  switch i32 %38, label %51 [
    i32 2, label %39
    i32 1, label %45
  ]

; <label>:39:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 1)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 1)
  %41 = load i8*, i8** %10, align 8
  %42 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %42, i8** %10, align 8
  %43 = load i8, i8* %41, align 1
  %44 = call signext i8 @EXT_C(i8 signext %43)
  store i8 %44, i8* %9, align 1
  br label %56

; <label>:45:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 2)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 2)
  %47 = load i8*, i8** %10, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %10, align 8
  %49 = load i8, i8* %47, align 1
  %50 = call signext i8 @INT_C(i8 signext %49)
  store i8 %50, i8* %9, align 1
  br label %56

; <label>:51:                                     ; preds = %37
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 3)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 3)
  %53 = load i8*, i8** %10, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %10, align 8
  %55 = load i8, i8* %53, align 1
  store i8 %55, i8* %9, align 1
  br label %56

; <label>:56:                                     ; preds = %51, %45, %39
  %57 = load i8, i8* @strip_spaces, align 1
  %58 = icmp ne i8 %57, 0
  br i1 %58, label %59, label %95

; <label>:59:                                     ; preds = %56
  %60 = load i8, i8* %9, align 1
  %61 = zext i8 %60 to i32
  %62 = icmp eq i32 %61, 32
  br i1 %62, label %63, label %67

; <label>:63:                                     ; preds = %59
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 4)
  %64 = add i64 %pgocount5, 1
  store i64 %64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 4)
  %65 = load i32, i32* %14, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %14, align 4
  br label %94

; <label>:67:                                     ; preds = %59
  %68 = load i8, i8* %9, align 1
  %69 = zext i8 %68 to i32
  %70 = icmp eq i32 %69, 10
  br i1 %70, label %71, label %75

; <label>:71:                                     ; preds = %67
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 8)
  %72 = add i64 %pgocount6, 1
  store i64 %72, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 8)
  %73 = load i8*, i8** %11, align 8
  %74 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %74, i8** %11, align 8
  store i8 13, i8* %73, align 1
  store i32 0, i32* %14, align 4
  br label %75

; <label>:75:                                     ; preds = %71, %67
  %76 = load i32, i32* %14, align 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %89

; <label>:78:                                     ; preds = %75
  br label %79

; <label>:79:                                     ; preds = %83, %78
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 0)
  %80 = add i64 %pgocount7, 1
  store i64 %80, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 0)
  %81 = load i8*, i8** %11, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %82, i8** %11, align 8
  store i8 32, i8* %81, align 1
  br label %83

; <label>:83:                                     ; preds = %79
  %84 = load i32, i32* %14, align 4
  %85 = add nsw i32 %84, -1
  store i32 %85, i32* %14, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %79, label %87

; <label>:87:                                     ; preds = %83
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 6)
  %88 = add i64 %pgocount8, 1
  store i64 %88, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 6)
  br label %89

; <label>:89:                                     ; preds = %87, %75
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 5)
  %90 = add i64 %pgocount9, 1
  store i64 %90, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 5)
  %91 = load i8, i8* %9, align 1
  %92 = load i8*, i8** %11, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %11, align 8
  store i8 %91, i8* %92, align 1
  br label %94

; <label>:94:                                     ; preds = %89, %63
  br label %107

; <label>:95:                                     ; preds = %56
  %96 = load i8, i8* %9, align 1
  %97 = zext i8 %96 to i32
  %98 = icmp eq i32 %97, 10
  br i1 %98, label %99, label %103

; <label>:99:                                     ; preds = %95
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 7)
  %100 = add i64 %pgocount10, 1
  store i64 %100, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 7)
  %101 = load i8*, i8** %11, align 8
  %102 = getelementptr inbounds i8, i8* %101, i32 1
  store i8* %102, i8** %11, align 8
  store i8 13, i8* %101, align 1
  br label %103

; <label>:103:                                    ; preds = %99, %95
  %104 = load i8, i8* %9, align 1
  %105 = load i8*, i8** %11, align 8
  %106 = getelementptr inbounds i8, i8* %105, i32 1
  store i8* %106, i8** %11, align 8
  store i8 %104, i8* %105, align 1
  br label %107

; <label>:107:                                    ; preds = %103, %94
  br label %108

; <label>:108:                                    ; preds = %107
  %109 = load i32, i32* %12, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %12, align 4
  br label %33

; <label>:111:                                    ; preds = %33
  %112 = load i8*, i8** %11, align 8
  %113 = ptrtoint i8* %112 to i64
  %114 = sub i64 %113, ptrtoint ([2048 x i32]* @textbuf2 to i64)
  %115 = trunc i64 %114 to i32
  store i32 %115, i32* %13, align 4
  %116 = load i32, i32* %13, align 4
  %117 = sext i32 %116 to i64
  %118 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %119 = call i64 @fwrite(i8* bitcast ([2048 x i32]* @textbuf2 to i8*), i64 1, i64 %117, %struct._IO_FILE* %118)
  %120 = load i32, i32* %13, align 4
  %121 = sext i32 %120 to i64
  %122 = icmp ne i64 %119, %121
  br i1 %122, label %123, label %125

; <label>:123:                                    ; preds = %111
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 13)
  %124 = add i64 %pgocount11, 1
  store i64 %124, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 13)
  store i32 -1, i32* %8, align 4
  br label %135

; <label>:125:                                    ; preds = %111
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 9)
  %126 = add i64 %pgocount12, 1
  store i64 %126, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 9)
  %127 = load i32, i32* %7, align 4
  %128 = sext i32 %127 to i64
  %129 = load i64, i64* %6, align 8
  %130 = sub i64 %129, %128
  store i64 %130, i64* %6, align 8
  br label %131

; <label>:131:                                    ; preds = %125, %24
  br label %132

; <label>:132:                                    ; preds = %131
  %133 = load i32, i32* %7, align 4
  %134 = icmp eq i32 %133, 4096
  br i1 %134, label %15, label %135

; <label>:135:                                    ; preds = %132, %123
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 12)
  %136 = add i64 %pgocount13, 1
  store i64 %136, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_copyfile_to_canon, i64 0, i64 12)
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i8 0, i64 4096, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([2048 x i32]* @textbuf2 to i8*), i8 0, i64 8192, i32 16, i1 false)
  %137 = load i32, i32* %8, align 4
  ret i32 %137
}

; Function Attrs: noinline nounwind uwtable
define i32 @copyfile_from_canon(%struct._IO_FILE*, %struct._IO_FILE*, i64) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  store i64 %2, i64* %6, align 8
  store i32 0, i32* %8, align 4
  br label %14

; <label>:14:                                     ; preds = %89, %3
  %15 = load i64, i64* %6, align 8
  %16 = icmp ult i64 %15, 4096
  br i1 %16, label %17, label %21

; <label>:17:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 5)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 5)
  %19 = load i64, i64* %6, align 8
  %20 = trunc i64 %19 to i32
  store i32 %20, i32* %7, align 4
  br label %23

; <label>:21:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 6)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 6)
  store i32 4096, i32* %7, align 4
  br label %23

; <label>:23:                                     ; preds = %21, %17
  %24 = load i32, i32* %7, align 4
  %25 = sext i32 %24 to i64
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %27 = call i64 @fread(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i64 1, i64 %25, %struct._IO_FILE* %26)
  %28 = trunc i64 %27 to i32
  store i32 %28, i32* %7, align 4
  %29 = load i32, i32* %7, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %88

; <label>:31:                                     ; preds = %23
  store i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i8** %10, align 8
  store i8* bitcast ([2048 x i32]* @textbuf2 to i8*), i8** %11, align 8
  store i32 0, i32* %12, align 4
  br label %32

; <label>:32:                                     ; preds = %65, %31
  %33 = load i32, i32* %12, align 4
  %34 = load i32, i32* %7, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %68

; <label>:36:                                     ; preds = %32
  %37 = load i32, i32* @CONVERSION, align 4
  switch i32 %37, label %50 [
    i32 2, label %38
    i32 1, label %44
  ]

; <label>:38:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 1)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 1)
  %40 = load i8*, i8** %10, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %10, align 8
  %42 = load i8, i8* %40, align 1
  %43 = call signext i8 @EXT_C(i8 signext %42)
  store i8 %43, i8* %9, align 1
  br label %55

; <label>:44:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 2)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 2)
  %46 = load i8*, i8** %10, align 8
  %47 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %47, i8** %10, align 8
  %48 = load i8, i8* %46, align 1
  %49 = call signext i8 @INT_C(i8 signext %48)
  store i8 %49, i8* %9, align 1
  br label %55

; <label>:50:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 3)
  %51 = add i64 %pgocount4, 1
  store i64 %51, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 3)
  %52 = load i8*, i8** %10, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %10, align 8
  %54 = load i8, i8* %52, align 1
  store i8 %54, i8* %9, align 1
  br label %55

; <label>:55:                                     ; preds = %50, %44, %38
  %56 = load i8, i8* %9, align 1
  %57 = zext i8 %56 to i32
  %58 = icmp ne i32 %57, 13
  br i1 %58, label %59, label %64

; <label>:59:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 0)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 0)
  %61 = load i8, i8* %9, align 1
  %62 = load i8*, i8** %11, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %11, align 8
  store i8 %61, i8* %62, align 1
  br label %64

; <label>:64:                                     ; preds = %59, %55
  br label %65

; <label>:65:                                     ; preds = %64
  %66 = load i32, i32* %12, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %12, align 4
  br label %32

; <label>:68:                                     ; preds = %32
  %69 = load i8*, i8** %11, align 8
  %70 = ptrtoint i8* %69 to i64
  %71 = sub i64 %70, ptrtoint ([2048 x i32]* @textbuf2 to i64)
  %72 = trunc i64 %71 to i32
  store i32 %72, i32* %13, align 4
  %73 = load i32, i32* %13, align 4
  %74 = sext i32 %73 to i64
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %76 = call i64 @fwrite(i8* bitcast ([2048 x i32]* @textbuf2 to i8*), i64 1, i64 %74, %struct._IO_FILE* %75)
  %77 = load i32, i32* %13, align 4
  %78 = sext i32 %77 to i64
  %79 = icmp ne i64 %76, %78
  br i1 %79, label %80, label %82

; <label>:80:                                     ; preds = %68
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 8)
  %81 = add i64 %pgocount6, 1
  store i64 %81, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 8)
  store i32 -1, i32* %8, align 4
  br label %92

; <label>:82:                                     ; preds = %68
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 4)
  %83 = add i64 %pgocount7, 1
  store i64 %83, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 4)
  %84 = load i32, i32* %7, align 4
  %85 = sext i32 %84 to i64
  %86 = load i64, i64* %6, align 8
  %87 = sub i64 %86, %85
  store i64 %87, i64* %6, align 8
  br label %88

; <label>:88:                                     ; preds = %82, %23
  br label %89

; <label>:89:                                     ; preds = %88
  %90 = load i32, i32* %7, align 4
  %91 = icmp eq i32 %90, 4096
  br i1 %91, label %14, label %92

; <label>:92:                                     ; preds = %89, %80
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 7)
  %93 = add i64 %pgocount8, 1
  store i64 %93, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_copyfile_from_canon, i64 0, i64 7)
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i8 0, i64 4096, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([2048 x i32]* @textbuf2 to i8*), i8 0, i64 8192, i32 16, i1 false)
  %94 = load i32, i32* %8, align 4
  ret i32 %94
}

; Function Attrs: noinline nounwind uwtable
define i32 @copyfiles_by_name(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 0, i32* %8, align 4
  %10 = load i8*, i8** %4, align 8
  %11 = call %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  store %struct._IO_FILE* %11, %struct._IO_FILE** %6, align 8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %13 = icmp eq %struct._IO_FILE* %12, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_copyfiles_by_name, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_copyfiles_by_name, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %47

; <label>:16:                                     ; preds = %2
  %17 = load i8*, i8** %5, align 8
  %18 = call %struct._IO_FILE* @fopen(i8* %17, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0))
  store %struct._IO_FILE* %18, %struct._IO_FILE** %7, align 8
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %20 = icmp eq %struct._IO_FILE* %19, null
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_copyfiles_by_name, i64 0, i64 3)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_copyfiles_by_name, i64 0, i64 3)
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %24 = call i32 @fclose(%struct._IO_FILE* %23)
  store i32 -1, i32* %3, align 4
  br label %47

; <label>:25:                                     ; preds = %16
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %27 = call i32 @fseek(%struct._IO_FILE* %26, i64 0, i32 2)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %29 = call i64 @ftell(%struct._IO_FILE* %28)
  store i64 %29, i64* %9, align 8
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  call void @rewind(%struct._IO_FILE* %30)
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %33 = load i64, i64* %9, align 8
  %34 = call i32 @copyfile(%struct._IO_FILE* %31, %struct._IO_FILE* %32, i64 %33)
  store i32 %34, i32* %8, align 4
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %38 = call i32 @write_error(%struct._IO_FILE* %37)
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_copyfiles_by_name, i64 0, i64 2)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_copyfiles_by_name, i64 0, i64 2)
  store i32 -1, i32* %8, align 4
  br label %42

; <label>:42:                                     ; preds = %40, %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_copyfiles_by_name, i64 0, i64 0)
  %43 = add i64 %pgocount3, 1
  store i64 %43, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_copyfiles_by_name, i64 0, i64 0)
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %45 = call i32 @fclose(%struct._IO_FILE* %44)
  %46 = load i32, i32* %8, align 4
  store i32 %46, i32* %3, align 4
  br label %47

; <label>:47:                                     ; preds = %42, %21, %14
  %48 = load i32, i32* %3, align 4
  ret i32 %48
}

declare i64 @ftell(%struct._IO_FILE*) #2

declare void @rewind(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define i32 @make_canonical(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 0, i32* %8, align 4
  %10 = load i8*, i8** %4, align 8
  %11 = call %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  store %struct._IO_FILE* %11, %struct._IO_FILE** %6, align 8
  %12 = icmp eq %struct._IO_FILE* %11, null
  br i1 %12, label %18, label %13

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_make_canonical, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_make_canonical, i64 0, i64 0)
  %15 = load i8*, i8** %5, align 8
  %16 = call %struct._IO_FILE* @fopen(i8* %15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0))
  store %struct._IO_FILE* %16, %struct._IO_FILE** %7, align 8
  %17 = icmp eq %struct._IO_FILE* %16, null
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_make_canonical, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_make_canonical, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %42

; <label>:20:                                     ; preds = %13
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %22 = call i32 @fseek(%struct._IO_FILE* %21, i64 0, i32 2)
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %24 = call i64 @ftell(%struct._IO_FILE* %23)
  store i64 %24, i64* %9, align 8
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  call void @rewind(%struct._IO_FILE* %25)
  store i32 1, i32* @CONVERSION, align 4
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %28 = load i64, i64* %9, align 8
  %29 = call i32 @copyfile_to_canon(%struct._IO_FILE* %26, %struct._IO_FILE* %27, i64 %28)
  store i32 %29, i32* %8, align 4
  store i32 0, i32* @CONVERSION, align 4
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %33 = call i32 @write_error(%struct._IO_FILE* %32)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_make_canonical, i64 0, i64 3)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_make_canonical, i64 0, i64 3)
  store i32 -1, i32* %8, align 4
  br label %37

; <label>:37:                                     ; preds = %35, %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_make_canonical, i64 0, i64 2)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_make_canonical, i64 0, i64 2)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %40 = call i32 @fclose(%struct._IO_FILE* %39)
  %41 = load i32, i32* %8, align 4
  store i32 %41, i32* %3, align 4
  br label %42

; <label>:42:                                     ; preds = %37, %18
  %43 = load i32, i32* %3, align 4
  ret i32 %43
}

; Function Attrs: noinline nounwind uwtable
define i32 @rename2(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 0, i32* %8, align 4
  %10 = load i8*, i8** %4, align 8
  %11 = load i8*, i8** %5, align 8
  %12 = call i32 @rename(i8* %10, i8* %11) #6
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %71

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %4, align 8
  %16 = call %struct._IO_FILE* @fopen(i8* %15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  store %struct._IO_FILE* %16, %struct._IO_FILE** %6, align 8
  %17 = icmp eq %struct._IO_FILE* %16, null
  br i1 %17, label %23, label %18

; <label>:18:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 1)
  %20 = load i8*, i8** %5, align 8
  %21 = call %struct._IO_FILE* @fopen(i8* %20, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0))
  store %struct._IO_FILE* %21, %struct._IO_FILE** %7, align 8
  %22 = icmp eq %struct._IO_FILE* %21, null
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %18, %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 2)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 2)
  store i32 -1, i32* %3, align 4
  br label %74

; <label>:25:                                     ; preds = %18
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %27 = call i32 @fseek(%struct._IO_FILE* %26, i64 0, i32 2)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %29 = call i64 @ftell(%struct._IO_FILE* %28)
  store i64 %29, i64* %9, align 8
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  call void @rewind(%struct._IO_FILE* %30)
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %33 = load i64, i64* %9, align 8
  %34 = call i32 @copyfile(%struct._IO_FILE* %31, %struct._IO_FILE* %32, i64 %33)
  store i32 %34, i32* %8, align 4
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %36 = call i32 @write_error(%struct._IO_FILE* %35)
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 3)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 3)
  store i32 -1, i32* %8, align 4
  br label %40

; <label>:40:                                     ; preds = %38, %25
  %41 = load i32, i32* %8, align 4
  %42 = icmp sge i32 %41, 0
  br i1 %42, label %43, label %52

; <label>:43:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 4)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 4)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  call void @wipeout(%struct._IO_FILE* %45)
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %47 = call i32 @fclose(%struct._IO_FILE* %46)
  %48 = load i8*, i8** %4, align 8
  %49 = call i32 @remove(i8* %48) #6
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %51 = call i32 @fclose(%struct._IO_FILE* %50)
  br label %70

; <label>:52:                                     ; preds = %40
  %53 = load i8*, i8** %5, align 8
  %54 = call zeroext i8 @is_regular_file(i8* %53)
  %55 = icmp ne i8 %54, 0
  br i1 %55, label %56, label %63

; <label>:56:                                     ; preds = %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 5)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 5)
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  call void @wipeout(%struct._IO_FILE* %58)
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %60 = call i32 @fclose(%struct._IO_FILE* %59)
  %61 = load i8*, i8** %5, align 8
  %62 = call i32 @remove(i8* %61) #6
  br label %67

; <label>:63:                                     ; preds = %52
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 6)
  %64 = add i64 %pgocount5, 1
  store i64 %64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 6)
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %66 = call i32 @fclose(%struct._IO_FILE* %65)
  br label %67

; <label>:67:                                     ; preds = %63, %56
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %69 = call i32 @fclose(%struct._IO_FILE* %68)
  br label %70

; <label>:70:                                     ; preds = %67, %43
  br label %71

; <label>:71:                                     ; preds = %70, %2
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 0)
  %72 = add i64 %pgocount6, 1
  store i64 %72, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rename2, i64 0, i64 0)
  %73 = load i32, i32* %8, align 4
  store i32 %73, i32* %3, align 4
  br label %74

; <label>:74:                                     ; preds = %71, %23
  %75 = load i32, i32* %3, align 4
  ret i32 %75
}

; Function Attrs: nounwind
declare i32 @rename(i8*, i8*) #1

; Function Attrs: nounwind
declare i32 @remove(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal zeroext i8 @is_regular_file(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.stat, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i32 @stat(i8* %4, %struct.stat* %3) #6
  %6 = icmp ne i32 %5, -1
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_is_regular_file, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_is_regular_file, i64 0, i64 1)
  %9 = getelementptr inbounds %struct.stat, %struct.stat* %3, i32 0, i32 3
  %10 = load i32, i32* %9, align 8
  %11 = and i32 %10, 61440
  %12 = icmp eq i32 %11, 32768
  br label %13

; <label>:13:                                     ; preds = %7, %1
  %14 = phi i1 [ false, %1 ], [ %12, %7 ]
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_is_regular_file, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_is_regular_file, i64 0, i64 0)
  %16 = zext i1 %14 to i32
  %17 = trunc i32 %16 to i8
  ret i8 %17
}

; Function Attrs: noinline nounwind uwtable
define i32 @readPhantomInput(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca [512 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 0, i32* %7, align 4
  %8 = load i8, i8* @verbose, align 1
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 1)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %13 = load i8*, i8** %3, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.12, i32 0, i32 0), i8* %13)
  br label %15

; <label>:15:                                     ; preds = %10, %1
  %16 = load i8*, i8** %3, align 8
  %17 = call %struct._IO_FILE* @fopen(i8* %16, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0))
  store %struct._IO_FILE* %17, %struct._IO_FILE** %4, align 8
  %18 = icmp eq %struct._IO_FILE* %17, null
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 4)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 4)
  store i32 -1, i32* %2, align 4
  br label %52

; <label>:21:                                     ; preds = %15
  br label %22

; <label>:22:                                     ; preds = %39, %21
  %23 = getelementptr inbounds [512 x i8], [512 x i8]* %5, i32 0, i32 0
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %25 = call i64 @fread(i8* %23, i64 1, i64 512, %struct._IO_FILE* %24)
  %26 = trunc i64 %25 to i32
  store i32 %26, i32* %6, align 4
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %41

; <label>:28:                                     ; preds = %22
  %29 = getelementptr inbounds [512 x i8], [512 x i8]* %5, i32 0, i32 0
  %30 = load i32, i32* %6, align 4
  %31 = sext i32 %30 to i64
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %33 = call i64 @fwrite(i8* %29, i64 1, i64 %31, %struct._IO_FILE* %32)
  %34 = load i32, i32* %6, align 4
  %35 = sext i32 %34 to i64
  %36 = icmp ne i64 %33, %35
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 5)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 5)
  store i32 -1, i32* %7, align 4
  br label %41

; <label>:39:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 0)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 0)
  br label %22

; <label>:41:                                     ; preds = %37, %22
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %43 = call i32 @write_error(%struct._IO_FILE* %42)
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 3)
  %46 = add i64 %pgocount4, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 3)
  store i32 -1, i32* %7, align 4
  br label %47

; <label>:47:                                     ; preds = %45, %41
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 2)
  %48 = add i64 %pgocount5, 1
  store i64 %48, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_readPhantomInput, i64 0, i64 2)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %50 = call i32 @fclose(%struct._IO_FILE* %49)
  %51 = load i32, i32* %7, align 4
  store i32 %51, i32* %2, align 4
  br label %52

; <label>:52:                                     ; preds = %47, %19
  %53 = load i32, i32* %2, align 4
  ret i32 %53
}

; Function Attrs: noinline nounwind uwtable
define i32 @writePhantomOutput(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca [512 x i8], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  store i32 0, i32* %6, align 4
  %7 = load i8, i8* @verbose, align 1
  %8 = icmp ne i8 %7, 0
  br i1 %8, label %9, label %14

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_writePhantomOutput, i64 0, i64 2)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_writePhantomOutput, i64 0, i64 2)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %12 = load i8*, i8** %2, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.13, i32 0, i32 0), i8* %12)
  br label %14

; <label>:14:                                     ; preds = %9, %1
  %15 = load i8*, i8** %2, align 8
  %16 = call %struct._IO_FILE* @fopen(i8* %15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  store %struct._IO_FILE* %16, %struct._IO_FILE** %3, align 8
  br label %17

; <label>:17:                                     ; preds = %34, %14
  %18 = getelementptr inbounds [512 x i8], [512 x i8]* %4, i32 0, i32 0
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %20 = call i64 @fread(i8* %18, i64 1, i64 512, %struct._IO_FILE* %19)
  %21 = trunc i64 %20 to i32
  store i32 %21, i32* %5, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %36

; <label>:23:                                     ; preds = %17
  %24 = getelementptr inbounds [512 x i8], [512 x i8]* %4, i32 0, i32 0
  %25 = load i32, i32* %5, align 4
  %26 = sext i32 %25 to i64
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %28 = call i64 @fwrite(i8* %24, i64 1, i64 %26, %struct._IO_FILE* %27)
  %29 = load i32, i32* %5, align 4
  %30 = sext i32 %29 to i64
  %31 = icmp ne i64 %28, %30
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_writePhantomOutput, i64 0, i64 4)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_writePhantomOutput, i64 0, i64 4)
  store i32 -1, i32* %6, align 4
  br label %36

; <label>:34:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_writePhantomOutput, i64 0, i64 0)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_writePhantomOutput, i64 0, i64 0)
  br label %17

; <label>:36:                                     ; preds = %32, %17
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %38 = call i32 @fclose(%struct._IO_FILE* %37)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %40 = call i32 @fflush(%struct._IO_FILE* %39)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %42 = call i32 @ferror(%struct._IO_FILE* %41) #6
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %49

; <label>:44:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_writePhantomOutput, i64 0, i64 3)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_writePhantomOutput, i64 0, i64 3)
  store i32 -1, i32* %6, align 4
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %47 = call i8* @LANG(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.14, i32 0, i32 0))
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* %47)
  br label %49

; <label>:49:                                     ; preds = %44, %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_writePhantomOutput, i64 0, i64 1)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_writePhantomOutput, i64 0, i64 1)
  %51 = load i32, i32* %6, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define i64 @fsize(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_fsize, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_fsize, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %7 = call i64 @ftell(%struct._IO_FILE* %6)
  store i64 %7, i64* %4, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %9 = call i32 @fseek(%struct._IO_FILE* %8, i64 0, i32 2)
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %11 = call i64 @ftell(%struct._IO_FILE* %10)
  store i64 %11, i64* %5, align 8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %13 = load i64, i64* %4, align 8
  %14 = call i32 @fseek(%struct._IO_FILE* %12, i64 %13, i32 0)
  %15 = load i64, i64* %5, align 8
  %16 = load i64, i64* %4, align 8
  %17 = sub nsw i64 %15, %16
  ret i64 %17
}

; Function Attrs: noinline nounwind uwtable
define i32 @is_text_file(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [512 x i8], align 16
  %9 = alloca i8*, align 8
  %10 = alloca i8, align 1
  store i8* %0, i8** %3, align 8
  %11 = load i8*, i8** %3, align 8
  %12 = call %struct._IO_FILE* @fopen(i8* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  store %struct._IO_FILE* %12, %struct._IO_FILE** %4, align 8
  store i32 0, i32* %7, align 4
  %13 = getelementptr inbounds [512 x i8], [512 x i8]* %8, i32 0, i32 0
  store i8* %13, i8** %9, align 8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %15 = icmp ne %struct._IO_FILE* %14, null
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 5)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 5)
  store i32 0, i32* %2, align 4
  br label %87

; <label>:18:                                     ; preds = %1
  %19 = getelementptr inbounds [512 x i8], [512 x i8]* %8, i32 0, i32 0
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %21 = call i64 @fread(i8* %19, i64 1, i64 512, %struct._IO_FILE* %20)
  %22 = trunc i64 %21 to i32
  store i32 %22, i32* %6, align 4
  store i32 %22, i32* %5, align 4
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %24 = call i32 @fclose(%struct._IO_FILE* %23)
  %25 = load i32, i32* %6, align 4
  %26 = icmp sle i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 6)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 6)
  store i32 0, i32* %2, align 4
  br label %87

; <label>:29:                                     ; preds = %18
  %30 = getelementptr inbounds [512 x i8], [512 x i8]* %8, i32 0, i32 0
  %31 = call i32 @compressSignature(i8* %30)
  %32 = icmp sge i32 %31, 0
  br i1 %32, label %33, label %35

; <label>:33:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 8)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 8)
  store i32 0, i32* %2, align 4
  br label %87

; <label>:35:                                     ; preds = %29
  br label %36

; <label>:36:                                     ; preds = %84, %35
  %37 = load i32, i32* %5, align 4
  %38 = add nsw i32 %37, -1
  store i32 %38, i32* %5, align 4
  %39 = icmp ne i32 %37, 0
  br i1 %39, label %40, label %85

; <label>:40:                                     ; preds = %36
  %41 = load i8*, i8** %9, align 8
  %42 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %42, i8** %9, align 8
  %43 = load i8, i8* %41, align 1
  store i8 %43, i8* %10, align 1
  %44 = load i8, i8* %10, align 1
  %45 = zext i8 %44 to i32
  %46 = icmp eq i32 %45, 10
  br i1 %46, label %52, label %47

; <label>:47:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 1)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 1)
  %49 = load i8, i8* %10, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, 13
  br i1 %51, label %52, label %54

; <label>:52:                                     ; preds = %47, %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 0)
  %53 = add i64 %pgocount4, 1
  store i64 %53, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 0)
  store i32 0, i32* %7, align 4
  br label %84

; <label>:54:                                     ; preds = %47
  %55 = load i8, i8* %10, align 1
  %56 = zext i8 %55 to i32
  %57 = icmp slt i32 %56, 7
  br i1 %57, label %78, label %58

; <label>:58:                                     ; preds = %54
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 2)
  %59 = add i64 %pgocount5, 1
  store i64 %59, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 2)
  %60 = load i8, i8* %10, align 1
  %61 = zext i8 %60 to i32
  %62 = icmp sgt i32 %61, 13
  br i1 %62, label %63, label %80

; <label>:63:                                     ; preds = %58
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 4)
  %64 = add i64 %pgocount6, 1
  store i64 %64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 4)
  %65 = load i8, i8* %10, align 1
  %66 = zext i8 %65 to i32
  %67 = icmp slt i32 %66, 32
  br i1 %67, label %68, label %80

; <label>:68:                                     ; preds = %63
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 7)
  %69 = add i64 %pgocount7, 1
  store i64 %69, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 7)
  %70 = load i8, i8* %10, align 1
  %71 = zext i8 %70 to i32
  %72 = icmp ne i32 %71, 26
  br i1 %72, label %73, label %80

; <label>:73:                                     ; preds = %68
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 10)
  %74 = add i64 %pgocount8, 1
  store i64 %74, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 10)
  %75 = load i8, i8* %10, align 1
  %76 = zext i8 %75 to i32
  %77 = icmp ne i32 %76, 27
  br i1 %77, label %78, label %80

; <label>:78:                                     ; preds = %73, %54
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 11)
  %79 = add i64 %pgocount9, 1
  store i64 %79, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 11)
  store i32 0, i32* %2, align 4
  br label %87

; <label>:80:                                     ; preds = %73, %68, %63, %58
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 3)
  %81 = add i64 %pgocount10, 1
  store i64 %81, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 3)
  %82 = load i32, i32* %7, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %7, align 4
  br label %84

; <label>:84:                                     ; preds = %80, %52
  br label %36

; <label>:85:                                     ; preds = %36
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 9)
  %86 = add i64 %pgocount11, 1
  store i64 %86, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_is_text_file, i64 0, i64 9)
  store i32 1, i32* %2, align 4
  br label %87

; <label>:87:                                     ; preds = %85, %78, %33, %27, %16
  %88 = load i32, i32* %2, align 4
  ret i32 %88
}

declare i32 @compressSignature(i8*) #2

; Function Attrs: noinline nounwind uwtable
define i8* @xmalloc(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  store i32 %0, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %10

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_xmalloc, i64 0, i64 1)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_xmalloc, i64 0, i64 1)
  %8 = load i32, i32* %2, align 4
  %9 = add i32 %8, 1
  store i32 %9, i32* %2, align 4
  br label %10

; <label>:10:                                     ; preds = %6, %1
  %11 = load i32, i32* %2, align 4
  %12 = call i8* (i32, ...) bitcast (i8* (...)* @malloc to i8* (i32, ...)*)(i32 %11)
  store i8* %12, i8** %3, align 8
  %13 = load i8*, i8** %3, align 8
  %14 = icmp eq i8* %13, null
  br i1 %14, label %15, label %20

; <label>:15:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_xmalloc, i64 0, i64 2)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_xmalloc, i64 0, i64 2)
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i8* @LANG(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.15, i32 0, i32 0))
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* %18)
  call void @exitPGP(i32 1)
  br label %20

; <label>:20:                                     ; preds = %15, %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_xmalloc, i64 0, i64 0)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_xmalloc, i64 0, i64 0)
  %22 = load i8*, i8** %3, align 8
  ret i8* %22
}

declare i8* @malloc(...) #2

declare void @exitPGP(i32) #2

; Function Attrs: noinline nounwind uwtable
define void @settmpdir(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = icmp eq i8* %4, null
  br i1 %5, label %12, label %6

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 0)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 0)
  %8 = load i8*, i8** %2, align 8
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %6, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 1)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 1)
  store i8 0, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i64 0, i64 0), align 16
  br label %56

; <label>:14:                                     ; preds = %6
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 2)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 2)
  %16 = load i8*, i8** %2, align 8
  %17 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i32 0, i32 0), i8* %16) #6
  %18 = call i64 @strlen(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i32 0, i32 0)) #7
  %19 = getelementptr inbounds i8, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i32 0, i32 0), i64 %18
  %20 = getelementptr inbounds i8, i8* %19, i64 -1
  store i8* %20, i8** %3, align 8
  %21 = load i8*, i8** %3, align 8
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 47
  br i1 %24, label %25, label %56

; <label>:25:                                     ; preds = %14
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 3)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 3)
  %27 = load i8*, i8** %3, align 8
  %28 = load i8, i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp ne i32 %29, 92
  br i1 %30, label %31, label %56

; <label>:31:                                     ; preds = %25
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 4)
  %32 = add i64 %pgocount4, 1
  store i64 %32, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 4)
  %33 = load i8*, i8** %3, align 8
  %34 = load i8, i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp ne i32 %35, 93
  br i1 %36, label %37, label %56

; <label>:37:                                     ; preds = %31
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 5)
  %38 = add i64 %pgocount5, 1
  store i64 %38, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 5)
  %39 = load i8*, i8** %3, align 8
  %40 = load i8, i8* %39, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp ne i32 %41, 58
  br i1 %42, label %43, label %56

; <label>:43:                                     ; preds = %37
  %44 = call i8* @strchr(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i32 0, i32 0), i32 47) #7
  store i8* %44, i8** %3, align 8
  %45 = icmp eq i8* %44, null
  br i1 %45, label %46, label %52

; <label>:46:                                     ; preds = %43
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 7)
  %47 = add i64 %pgocount6, 1
  store i64 %47, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 7)
  %48 = call i8* @strchr(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i32 0, i32 0), i32 92) #7
  store i8* %48, i8** %3, align 8
  %49 = icmp eq i8* %48, null
  br i1 %49, label %50, label %52

; <label>:50:                                     ; preds = %46
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 8)
  %51 = add i64 %pgocount7, 1
  store i64 %51, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 8)
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i32 0, i32 0), i8** %3, align 8
  br label %52

; <label>:52:                                     ; preds = %50, %46, %43
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 6)
  %53 = add i64 %pgocount8, 1
  store i64 %53, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_settmpdir, i64 0, i64 6)
  %54 = load i8*, i8** %3, align 8
  %55 = call i8* @strncat(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i32 0, i32 0), i8* %54, i64 1) #6
  br label %56

; <label>:56:                                     ; preds = %52, %37, %31, %25, %14, %12
  ret void
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #3

; Function Attrs: nounwind
declare i8* @strncat(i8*, i8*, i64) #1

; Function Attrs: noinline nounwind uwtable
define void @setoutdir(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = icmp eq i8* %4, null
  br i1 %5, label %6, label %9

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_setoutdir, i64 0, i64 1)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_setoutdir, i64 0, i64 1)
  %8 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @outdir, i32 0, i32 0), i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i32 0, i32 0)) #6
  br label %17

; <label>:9:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_setoutdir, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_setoutdir, i64 0, i64 0)
  %11 = load i8*, i8** %2, align 8
  %12 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @outdir, i32 0, i32 0), i8* %11) #6
  %13 = call i8* @file_tail(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @outdir, i32 0, i32 0))
  store i8* %13, i8** %3, align 8
  %14 = load i8*, i8** %3, align 8
  %15 = call i8* @strcpy(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @tmpbasename, i32 0, i32 0), i8* %14) #6
  %16 = load i8*, i8** %3, align 8
  store i8 0, i8* %16, align 1
  call void @drop_extension(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @tmpbasename, i32 0, i32 0))
  store i8 0, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @tmpbasename, i64 0, i64 10), align 2
  br label %17

; <label>:17:                                     ; preds = %9, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i8* @tempfile(i32) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %8

; <label>:8:                                      ; preds = %22, %1
  %9 = load i32, i32* %4, align 4
  %10 = icmp slt i32 %9, 8
  br i1 %10, label %11, label %25

; <label>:11:                                     ; preds = %8
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.anon, %struct.anon* %14, i32 0, i32 1
  %16 = load i32, i32* %15, align 8
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 12)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 12)
  br label %25

; <label>:20:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 6)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 6)
  br label %22

; <label>:22:                                     ; preds = %20
  %23 = load i32, i32* %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %4, align 4
  br label %8

; <label>:25:                                     ; preds = %18, %8
  %26 = load i32, i32* %4, align 4
  %27 = icmp eq i32 %26, 8
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 11)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 11)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.17, i32 0, i32 0))
  store i8* null, i8** %2, align 8
  br label %185

; <label>:32:                                     ; preds = %25
  br label %33

; <label>:33:                                     ; preds = %136, %128, %32
  store i32 0, i32* %6, align 4
  br label %34

; <label>:34:                                     ; preds = %98, %33
  store i32 0, i32* %5, align 4
  br label %35

; <label>:35:                                     ; preds = %57, %34
  %36 = load i32, i32* %5, align 4
  %37 = icmp slt i32 %36, 8
  br i1 %37, label %38, label %61

; <label>:38:                                     ; preds = %35
  %39 = load i32, i32* %5, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %40
  %42 = getelementptr inbounds %struct.anon, %struct.anon* %41, i32 0, i32 1
  %43 = load i32, i32* %42, align 8
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %56

; <label>:45:                                     ; preds = %38
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 1)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 1)
  %47 = load i32, i32* %5, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %48
  %50 = getelementptr inbounds %struct.anon, %struct.anon* %49, i32 0, i32 2
  %51 = load i32, i32* %50, align 4
  %52 = load i32, i32* %6, align 4
  %53 = icmp eq i32 %51, %52
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 4)
  %55 = add i64 %pgocount4, 1
  store i64 %55, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 4)
  br label %61

; <label>:56:                                     ; preds = %45, %38
  br label %57

; <label>:57:                                     ; preds = %56
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 0)
  %58 = add i64 %pgocount5, 1
  store i64 %58, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 0)
  %59 = load i32, i32* %5, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %5, align 4
  br label %35

; <label>:61:                                     ; preds = %54, %35
  %62 = load i32, i32* %5, align 4
  %63 = icmp slt i32 %62, 8
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %61
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 2)
  %65 = add i64 %pgocount6, 1
  store i64 %65, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 2)
  br label %98

; <label>:66:                                     ; preds = %61
  %67 = load i32, i32* %4, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %68
  %70 = getelementptr inbounds %struct.anon, %struct.anon* %69, i32 0, i32 0
  %71 = getelementptr inbounds [256 x i8], [256 x i8]* %70, i32 0, i32 0
  %72 = load i32, i32* %3, align 4
  %73 = and i32 %72, 4
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %80

; <label>:75:                                     ; preds = %66
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 5)
  %76 = add i64 %pgocount7, 1
  store i64 %76, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 5)
  %77 = load i8, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i32 0, i32 0), align 16
  %78 = sext i8 %77 to i32
  %79 = icmp ne i32 %78, 0
  br label %80

; <label>:80:                                     ; preds = %75, %66
  %81 = phi i1 [ false, %66 ], [ %79, %75 ]
  %82 = zext i1 %81 to i64
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 18)
  %83 = add i64 %pgocount8, %82
  store i64 %83, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 18)
  %84 = select i1 %81, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i32 0, i32 0), i8* getelementptr inbounds ([256 x i8], [256 x i8]* @outdir, i32 0, i32 0)
  %85 = load i32, i32* %6, align 4
  %86 = call i32 (i8*, i8*, ...) @sprintf(i8* %71, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.18, i32 0, i32 0), i8* %84, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @tmpbasename, i32 0, i32 0), i32 36, i32 %85) #6
  %87 = load i32, i32* %4, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %88
  %90 = getelementptr inbounds %struct.anon, %struct.anon* %89, i32 0, i32 0
  %91 = getelementptr inbounds [256 x i8], [256 x i8]* %90, i32 0, i32 0
  %92 = call zeroext i8 @file_exists(i8* %91)
  %93 = icmp ne i8 %92, 0
  br i1 %93, label %96, label %94

; <label>:94:                                     ; preds = %80
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 10)
  %95 = add i64 %pgocount9, 1
  store i64 %95, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 10)
  br label %102

; <label>:96:                                     ; preds = %80
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 3)
  %97 = add i64 %pgocount10, 1
  store i64 %97, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 3)
  br label %98

; <label>:98:                                     ; preds = %96, %64
  %99 = load i32, i32* %6, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %6, align 4
  %101 = icmp slt i32 %100, 100
  br i1 %101, label %34, label %102

; <label>:102:                                    ; preds = %98, %94
  %103 = load i32, i32* %6, align 4
  %104 = icmp eq i32 %103, 100
  br i1 %104, label %105, label %109

; <label>:105:                                    ; preds = %102
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 14)
  %106 = add i64 %pgocount11, 1
  store i64 %106, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 14)
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %108 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %107, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.19, i32 0, i32 0))
  store i8* null, i8** %2, align 8
  br label %185

; <label>:109:                                    ; preds = %102
  %110 = load i32, i32* %4, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %111
  %113 = getelementptr inbounds %struct.anon, %struct.anon* %112, i32 0, i32 0
  %114 = getelementptr inbounds [256 x i8], [256 x i8]* %113, i32 0, i32 0
  %115 = call i32 (i8*, i32, ...) @open(i8* %114, i32 194, i32 384)
  store i32 %115, i32* %7, align 4
  %116 = icmp ne i32 %115, -1
  br i1 %116, label %117, label %121

; <label>:117:                                    ; preds = %109
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 7)
  %118 = add i64 %pgocount12, 1
  store i64 %118, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 7)
  %119 = load i32, i32* %7, align 4
  %120 = call i32 @close(i32 %119)
  br label %121

; <label>:121:                                    ; preds = %117, %109
  %122 = load i32, i32* %7, align 4
  %123 = icmp eq i32 %122, -1
  br i1 %123, label %124, label %142

; <label>:124:                                    ; preds = %121
  %125 = load i32, i32* %3, align 4
  %126 = and i32 %125, 4
  %127 = icmp ne i32 %126, 0
  br i1 %127, label %132, label %128

; <label>:128:                                    ; preds = %124
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 8)
  %129 = add i64 %pgocount13, 1
  store i64 %129, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 8)
  %130 = load i32, i32* %3, align 4
  %131 = or i32 %130, 4
  store i32 %131, i32* %3, align 4
  br label %33

; <label>:132:                                    ; preds = %124
  %133 = load i8, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i64 0, i64 0), align 16
  %134 = sext i8 %133 to i32
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %136, label %139

; <label>:136:                                    ; preds = %132
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 9)
  %137 = add i64 %pgocount14, 1
  store i64 %137, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 9)
  %138 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @tmpdir, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.20, i32 0, i32 0)) #6
  br label %33

; <label>:139:                                    ; preds = %132
  br label %140

; <label>:140:                                    ; preds = %139
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 17)
  %141 = add i64 %pgocount15, 1
  store i64 %141, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 17)
  br label %142

; <label>:142:                                    ; preds = %140, %121
  %143 = load i32, i32* %7, align 4
  %144 = icmp eq i32 %143, -1
  br i1 %144, label %145, label %155

; <label>:145:                                    ; preds = %142
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 16)
  %146 = add i64 %pgocount16, 1
  store i64 %146, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 16)
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %148 = call i8* @LANG(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.21, i32 0, i32 0))
  %149 = load i32, i32* %4, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %150
  %152 = getelementptr inbounds %struct.anon, %struct.anon* %151, i32 0, i32 0
  %153 = getelementptr inbounds [256 x i8], [256 x i8]* %152, i32 0, i32 0
  %154 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %147, i8* %148, i8* %153)
  call void @user_error()
  br label %155

; <label>:155:                                    ; preds = %145, %142
  %156 = load i32, i32* %6, align 4
  %157 = load i32, i32* %4, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %158
  %160 = getelementptr inbounds %struct.anon, %struct.anon* %159, i32 0, i32 2
  store i32 %156, i32* %160, align 4
  %161 = load i32, i32* %3, align 4
  %162 = or i32 %161, 2
  %163 = load i32, i32* %4, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %164
  %166 = getelementptr inbounds %struct.anon, %struct.anon* %165, i32 0, i32 1
  store i32 %162, i32* %166, align 8
  %167 = load i8, i8* @verbose, align 1
  %168 = icmp ne i8 %167, 0
  br i1 %168, label %169, label %178

; <label>:169:                                    ; preds = %155
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 15)
  %170 = add i64 %pgocount17, 1
  store i64 %170, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 15)
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %172 = load i32, i32* %4, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %173
  %175 = getelementptr inbounds %struct.anon, %struct.anon* %174, i32 0, i32 0
  %176 = getelementptr inbounds [256 x i8], [256 x i8]* %175, i32 0, i32 0
  %177 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %171, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.22, i32 0, i32 0), i8* %176)
  br label %178

; <label>:178:                                    ; preds = %169, %155
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 13)
  %179 = add i64 %pgocount18, 1
  store i64 %179, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tempfile, i64 0, i64 13)
  %180 = load i32, i32* %4, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %181
  %183 = getelementptr inbounds %struct.anon, %struct.anon* %182, i32 0, i32 0
  %184 = getelementptr inbounds [256 x i8], [256 x i8]* %183, i32 0, i32 0
  store i8* %184, i8** %2, align 8
  br label %185

; <label>:185:                                    ; preds = %178, %105, %28
  %186 = load i8*, i8** %2, align 8
  ret i8* %186
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #1

declare i32 @open(i8*, i32, ...) #2

declare i32 @close(i32) #2

declare void @user_error() #2

; Function Attrs: noinline nounwind uwtable
define void @rmtemp(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  store i32 0, i32* %3, align 4
  br label %4

; <label>:4:                                      ; preds = %27, %1
  %5 = load i32, i32* %3, align 4
  %6 = icmp slt i32 %5, 8
  br i1 %6, label %7, label %31

; <label>:7:                                      ; preds = %4
  %8 = load i32, i32* %3, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.anon, %struct.anon* %10, i32 0, i32 1
  %12 = load i32, i32* %11, align 8
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %26

; <label>:14:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 1)
  %16 = load i32, i32* %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.anon, %struct.anon* %18, i32 0, i32 0
  %20 = getelementptr inbounds [256 x i8], [256 x i8]* %19, i32 0, i32 0
  %21 = load i8*, i8** %2, align 8
  %22 = call i32 @strcmp(i8* %20, i8* %21) #7
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 3)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 3)
  br label %31

; <label>:26:                                     ; preds = %14, %7
  br label %27

; <label>:27:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 0)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 0)
  %29 = load i32, i32* %3, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %3, align 4
  br label %4

; <label>:31:                                     ; preds = %24, %4
  %32 = load i32, i32* %3, align 4
  %33 = icmp slt i32 %32, 8
  br i1 %33, label %34, label %100

; <label>:34:                                     ; preds = %31
  %35 = load i8*, i8** %2, align 8
  %36 = call i64 @strlen(i8* %35) #7
  %37 = icmp ugt i64 %36, 3
  br i1 %37, label %38, label %89

; <label>:38:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 5)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 5)
  %40 = load i8*, i8** %2, align 8
  %41 = load i8*, i8** %2, align 8
  %42 = call i64 @strlen(i8* %41) #7
  %43 = sub i64 %42, 3
  %44 = getelementptr inbounds i8, i8* %40, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = icmp eq i32 %46, 36
  br i1 %47, label %48, label %89

; <label>:48:                                     ; preds = %38
  %49 = load i8, i8* @verbose, align 1
  %50 = icmp ne i8 %49, 0
  br i1 %50, label %51, label %56

; <label>:51:                                     ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 7)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 7)
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %54 = load i8*, i8** %2, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.23, i32 0, i32 0), i8* %54)
  br label %56

; <label>:56:                                     ; preds = %51, %48
  %57 = load i32, i32* %3, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %58
  %60 = getelementptr inbounds %struct.anon, %struct.anon* %59, i32 0, i32 1
  %61 = load i32, i32* %60, align 8
  %62 = and i32 %61, 1
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %68

; <label>:64:                                     ; preds = %56
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 9)
  %65 = add i64 %pgocount5, 1
  store i64 %65, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 9)
  %66 = load i8*, i8** %2, align 8
  %67 = call i32 @wipefile(i8* %66)
  br label %68

; <label>:68:                                     ; preds = %64, %56
  %69 = load i8*, i8** %2, align 8
  %70 = call i32 @remove(i8* %69) #6
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %78, label %72

; <label>:72:                                     ; preds = %68
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 11)
  %73 = add i64 %pgocount6, 1
  store i64 %73, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 11)
  %74 = load i32, i32* %3, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %75
  %77 = getelementptr inbounds %struct.anon, %struct.anon* %76, i32 0, i32 1
  store i32 0, i32* %77, align 8
  br label %88

; <label>:78:                                     ; preds = %68
  %79 = load i8, i8* @verbose, align 1
  %80 = icmp ne i8 %79, 0
  br i1 %80, label %81, label %86

; <label>:81:                                     ; preds = %78
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 10)
  %82 = add i64 %pgocount7, 1
  store i64 %82, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 10)
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %84 = load i8*, i8** %2, align 8
  %85 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %83, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.24, i32 0, i32 0), i8* %84)
  call void @perror(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.25, i32 0, i32 0))
  br label %86

; <label>:86:                                     ; preds = %81, %78
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 8)
  %87 = add i64 %pgocount8, 1
  store i64 %87, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 8)
  br label %88

; <label>:88:                                     ; preds = %86, %72
  br label %99

; <label>:89:                                     ; preds = %38, %34
  %90 = load i8, i8* @verbose, align 1
  %91 = icmp ne i8 %90, 0
  br i1 %91, label %92, label %97

; <label>:92:                                     ; preds = %89
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 6)
  %93 = add i64 %pgocount9, 1
  store i64 %93, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 6)
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %95 = load i8*, i8** %2, align 8
  %96 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %94, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.26, i32 0, i32 0), i8* %95)
  br label %97

; <label>:97:                                     ; preds = %92, %89
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 4)
  %98 = add i64 %pgocount10, 1
  store i64 %98, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 4)
  br label %99

; <label>:99:                                     ; preds = %97, %88
  br label %100

; <label>:100:                                    ; preds = %99, %31
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 2)
  %101 = add i64 %pgocount11, 1
  store i64 %101, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rmtemp, i64 0, i64 2)
  ret void
}

declare void @perror(i8*) #2

; Function Attrs: noinline nounwind uwtable
define i8* @savetemp(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %8 = load i8*, i8** %4, align 8
  %9 = load i8*, i8** %5, align 8
  %10 = call i32 @strcmp(i8* %8, i8* %9) #7
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %15

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 2)
  %14 = load i8*, i8** %4, align 8
  store i8* %14, i8** %3, align 8
  br label %113

; <label>:15:                                     ; preds = %2
  store i32 0, i32* %6, align 4
  br label %16

; <label>:16:                                     ; preds = %39, %15
  %17 = load i32, i32* %6, align 4
  %18 = icmp slt i32 %17, 8
  br i1 %18, label %19, label %43

; <label>:19:                                     ; preds = %16
  %20 = load i32, i32* %6, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.anon, %struct.anon* %22, i32 0, i32 1
  %24 = load i32, i32* %23, align 8
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %38

; <label>:26:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 1)
  %28 = load i32, i32* %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.anon, %struct.anon* %30, i32 0, i32 0
  %32 = getelementptr inbounds [256 x i8], [256 x i8]* %31, i32 0, i32 0
  %33 = load i8*, i8** %4, align 8
  %34 = call i32 @strcmp(i8* %32, i8* %33) #7
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %38

; <label>:36:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 3)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 3)
  br label %43

; <label>:38:                                     ; preds = %26, %19
  br label %39

; <label>:39:                                     ; preds = %38
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 0)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 0)
  %41 = load i32, i32* %6, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %6, align 4
  br label %16

; <label>:43:                                     ; preds = %36, %16
  %44 = load i32, i32* %6, align 4
  %45 = icmp slt i32 %44, 8
  br i1 %45, label %46, label %74

; <label>:46:                                     ; preds = %43
  %47 = load i8*, i8** %4, align 8
  %48 = call i64 @strlen(i8* %47) #7
  %49 = icmp ult i64 %48, 4
  br i1 %49, label %60, label %50

; <label>:50:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 5)
  %51 = add i64 %pgocount4, 1
  store i64 %51, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 5)
  %52 = load i8*, i8** %4, align 8
  %53 = load i8*, i8** %4, align 8
  %54 = call i64 @strlen(i8* %53) #7
  %55 = sub i64 %54, 3
  %56 = getelementptr inbounds i8, i8* %52, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp ne i32 %58, 36
  br i1 %59, label %60, label %72

; <label>:60:                                     ; preds = %50, %46
  %61 = load i8, i8* @verbose, align 1
  %62 = icmp ne i8 %61, 0
  br i1 %62, label %63, label %69

; <label>:63:                                     ; preds = %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 6)
  %64 = add i64 %pgocount5, 1
  store i64 %64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 6)
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %66 = load i8*, i8** %4, align 8
  %67 = load i8*, i8** %5, align 8
  %68 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %65, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.27, i32 0, i32 0), i8* %66, i8* %67)
  br label %69

; <label>:69:                                     ; preds = %63, %60
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 4)
  %70 = add i64 %pgocount6, 1
  store i64 %70, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 4)
  %71 = load i8*, i8** %4, align 8
  store i8* %71, i8** %3, align 8
  br label %113

; <label>:72:                                     ; preds = %50
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 11)
  %73 = add i64 %pgocount7, 1
  store i64 %73, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 11)
  br label %74

; <label>:74:                                     ; preds = %72, %43
  %75 = load i8*, i8** %5, align 8
  %76 = call i8* @ck_dup_output(i8* %75, i8 zeroext 0, i8 zeroext 1)
  store i8* %76, i8** %5, align 8
  %77 = load i8*, i8** %5, align 8
  %78 = icmp eq i8* %77, null
  br i1 %78, label %79, label %81

; <label>:79:                                     ; preds = %74
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 7)
  %80 = add i64 %pgocount8, 1
  store i64 %80, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 7)
  store i8* null, i8** %3, align 8
  br label %113

; <label>:81:                                     ; preds = %74
  %82 = load i8, i8* @verbose, align 1
  %83 = icmp ne i8 %82, 0
  br i1 %83, label %84, label %90

; <label>:84:                                     ; preds = %81
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 8)
  %85 = add i64 %pgocount9, 1
  store i64 %85, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 8)
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %87 = load i8*, i8** %4, align 8
  %88 = load i8*, i8** %5, align 8
  %89 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %86, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.28, i32 0, i32 0), i8* %87, i8* %88)
  br label %90

; <label>:90:                                     ; preds = %84, %81
  %91 = load i8*, i8** %4, align 8
  %92 = load i8*, i8** %5, align 8
  %93 = call i32 @rename2(i8* %91, i8* %92)
  %94 = icmp slt i32 %93, 0
  br i1 %94, label %95, label %101

; <label>:95:                                     ; preds = %90
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 10)
  %96 = add i64 %pgocount10, 1
  store i64 %96, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 10)
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %98 = call i8* @LANG(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.29, i32 0, i32 0))
  %99 = load i8*, i8** %5, align 8
  %100 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %97, i8* %98, i8* %99)
  store i8* null, i8** %3, align 8
  br label %113

; <label>:101:                                    ; preds = %90
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 9)
  %102 = add i64 %pgocount11, 1
  store i64 %102, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 9)
  %103 = load i32, i32* %6, align 4
  %104 = icmp slt i32 %103, 8
  br i1 %104, label %105, label %111

; <label>:105:                                    ; preds = %101
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 12)
  %106 = add i64 %pgocount12, 1
  store i64 %106, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_savetemp, i64 0, i64 12)
  %107 = load i32, i32* %6, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %108
  %110 = getelementptr inbounds %struct.anon, %struct.anon* %109, i32 0, i32 1
  store i32 0, i32* %110, align 8
  br label %111

; <label>:111:                                    ; preds = %105, %101
  %112 = load i8*, i8** %5, align 8
  store i8* %112, i8** %3, align 8
  br label %113

; <label>:113:                                    ; preds = %111, %95, %79, %69, %12
  %114 = load i8*, i8** %3, align 8
  ret i8* %114
}

; Function Attrs: noinline nounwind uwtable
define i8* @ck_dup_output(i8*, i8 zeroext, i8 zeroext) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8 %1, i8* %6, align 1
  store i8 %2, i8* %7, align 1
  br label %9

; <label>:9:                                      ; preds = %95, %3
  %10 = load i8*, i8** %5, align 8
  %11 = call zeroext i8 @file_exists(i8* %10)
  %12 = icmp ne i8 %11, 0
  br i1 %12, label %13, label %96

; <label>:13:                                     ; preds = %9
  %14 = load i8, i8* @batchmode, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %27

; <label>:17:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 0)
  %19 = load i8, i8* @force_flag, align 1
  %20 = icmp ne i8 %19, 0
  br i1 %20, label %27, label %21

; <label>:21:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 6)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 6)
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %24 = call i8* @LANG(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30, i32 0, i32 0))
  %25 = load i8*, i8** %5, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* %24, i8* %25)
  store i8* null, i8** %4, align 8
  br label %99

; <label>:27:                                     ; preds = %17, %13
  %28 = load i8*, i8** %5, align 8
  %29 = call zeroext i8 @is_regular_file(i8* %28)
  %30 = icmp ne i8 %29, 0
  br i1 %30, label %31, label %50

; <label>:31:                                     ; preds = %27
  %32 = load i8, i8* @force_flag, align 1
  %33 = icmp ne i8 %32, 0
  br i1 %33, label %34, label %43

; <label>:34:                                     ; preds = %31
  %35 = load i8, i8* %7, align 1
  %36 = icmp ne i8 %35, 0
  br i1 %36, label %37, label %41

; <label>:37:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 9)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 9)
  %39 = load i8*, i8** %5, align 8
  %40 = call i32 @remove(i8* %39) #6
  br label %41

; <label>:41:                                     ; preds = %37, %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 7)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 7)
  br label %96

; <label>:43:                                     ; preds = %31
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %45 = call i8* @LANG(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.31, i32 0, i32 0))
  %46 = load i8*, i8** %5, align 8
  %47 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* %45, i8* %46)
  %48 = call zeroext i8 @getyesno(i8 signext 110)
  %49 = zext i8 %48 to i32
  store i32 %49, i32* %8, align 4
  br label %61

; <label>:50:                                     ; preds = %27
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %52 = call i8* @LANG(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30, i32 0, i32 0))
  %53 = load i8*, i8** %5, align 8
  %54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* %52, i8* %53)
  %55 = load i8, i8* @force_flag, align 1
  %56 = icmp ne i8 %55, 0
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %50
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 10)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 10)
  store i8* null, i8** %4, align 8
  br label %99

; <label>:59:                                     ; preds = %50
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 2)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 2)
  store i32 0, i32* %8, align 4
  br label %61

; <label>:61:                                     ; preds = %59, %43
  %62 = load i32, i32* %8, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %80, label %64

; <label>:64:                                     ; preds = %61
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %65, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.32, i32 0, i32 0))
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %68 = call i8* @LANG(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.33, i32 0, i32 0))
  %69 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %67, i8* %68)
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %71 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %70, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.34, i32 0, i32 0))
  %72 = call i32 @getstring(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @ck_dup_output.buf, i32 0, i32 0), i32 255, i32 1)
  %73 = load i8, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @ck_dup_output.buf, i64 0, i64 0), align 16
  %74 = sext i8 %73 to i32
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %78

; <label>:76:                                     ; preds = %64
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 11)
  %77 = add i64 %pgocount6, 1
  store i64 %77, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 11)
  store i8* null, i8** %4, align 8
  br label %99

; <label>:78:                                     ; preds = %64
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 3)
  %79 = add i64 %pgocount7, 1
  store i64 %79, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 3)
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @ck_dup_output.buf, i32 0, i32 0), i8** %5, align 8
  br label %90

; <label>:80:                                     ; preds = %61
  %81 = load i8, i8* %7, align 1
  %82 = icmp ne i8 %81, 0
  br i1 %82, label %83, label %87

; <label>:83:                                     ; preds = %80
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 1)
  %84 = add i64 %pgocount8, 1
  store i64 %84, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 1)
  %85 = load i8*, i8** %5, align 8
  %86 = call i32 @remove(i8* %85) #6
  br label %89

; <label>:87:                                     ; preds = %80
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 8)
  %88 = add i64 %pgocount9, 1
  store i64 %88, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 8)
  br label %96

; <label>:89:                                     ; preds = %83
  br label %90

; <label>:90:                                     ; preds = %89, %78
  %91 = load i8, i8* %6, align 1
  %92 = icmp ne i8 %91, 0
  br i1 %92, label %93, label %95

; <label>:93:                                     ; preds = %90
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 5)
  %94 = add i64 %pgocount10, 1
  store i64 %94, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 5)
  br label %96

; <label>:95:                                     ; preds = %90
  br label %9

; <label>:96:                                     ; preds = %93, %87, %41, %9
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 4)
  %97 = add i64 %pgocount11, 1
  store i64 %97, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_ck_dup_output, i64 0, i64 4)
  %98 = load i8*, i8** %5, align 8
  store i8* %98, i8** %4, align 8
  br label %99

; <label>:99:                                     ; preds = %96, %76, %57, %21
  %100 = load i8*, i8** %4, align 8
  ret i8* %100
}

; Function Attrs: noinline nounwind uwtable
define i32 @savetempbak(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca [256 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca %struct.stat, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 -1, i32* %7, align 4
  %9 = load i8*, i8** %5, align 8
  %10 = call zeroext i8 @is_tempfile(i8* %9)
  %11 = icmp ne i8 %10, 0
  br i1 %11, label %12, label %15

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %5, align 8
  %14 = call i32 @remove(i8* %13) #6
  br label %45

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %5, align 8
  %17 = call zeroext i8 @file_exists(i8* %16)
  %18 = icmp ne i8 %17, 0
  br i1 %18, label %19, label %43

; <label>:19:                                     ; preds = %15
  %20 = load i8*, i8** %5, align 8
  %21 = call i32 @stat(i8* %20, %struct.stat* %8) #6
  %22 = icmp ne i32 %21, -1
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 4)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 4)
  %25 = getelementptr inbounds %struct.stat, %struct.stat* %8, i32 0, i32 3
  %26 = load i32, i32* %25, align 8
  %27 = and i32 %26, 4095
  store i32 %27, i32* %7, align 4
  br label %28

; <label>:28:                                     ; preds = %23, %19
  %29 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i32 0, i32 0
  %30 = load i8*, i8** %5, align 8
  %31 = call i8* @strcpy(i8* %29, i8* %30) #6
  %32 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i32 0, i32 0
  call void @force_extension(i8* %32, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @BAK_EXTENSION, i32 0, i32 0))
  %33 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i32 0, i32 0
  %34 = call i32 @remove(i8* %33) #6
  %35 = load i8*, i8** %5, align 8
  %36 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i32 0, i32 0
  %37 = call i32 @rename(i8* %35, i8* %36) #6
  %38 = icmp eq i32 %37, -1
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 6)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 6)
  store i32 -1, i32* %3, align 4
  br label %62

; <label>:41:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 5)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 5)
  br label %43

; <label>:43:                                     ; preds = %41, %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 3)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 3)
  br label %45

; <label>:45:                                     ; preds = %43, %12
  %46 = load i8*, i8** %4, align 8
  %47 = load i8*, i8** %5, align 8
  %48 = call i8* @savetemp(i8* %46, i8* %47)
  %49 = icmp eq i8* %48, null
  br i1 %49, label %50, label %52

; <label>:50:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 1)
  %51 = add i64 %pgocount4, 1
  store i64 %51, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %62

; <label>:52:                                     ; preds = %45
  %53 = load i32, i32* %7, align 4
  %54 = icmp ne i32 %53, -1
  br i1 %54, label %55, label %60

; <label>:55:                                     ; preds = %52
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 2)
  %56 = add i64 %pgocount5, 1
  store i64 %56, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 2)
  %57 = load i8*, i8** %5, align 8
  %58 = load i32, i32* %7, align 4
  %59 = call i32 @chmod(i8* %57, i32 %58) #6
  br label %60

; <label>:60:                                     ; preds = %55, %52
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 0)
  %61 = add i64 %pgocount6, 1
  store i64 %61, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_savetempbak, i64 0, i64 0)
  store i32 0, i32* %3, align 4
  br label %62

; <label>:62:                                     ; preds = %60, %50, %39
  %63 = load i32, i32* %3, align 4
  ret i32 %63
}

; Function Attrs: nounwind
declare i32 @stat(i8*, %struct.stat*) #1

; Function Attrs: nounwind
declare i32 @chmod(i8*, i32) #1

; Function Attrs: noinline nounwind uwtable
define void @cleanup_tmpf() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %2

; <label>:2:                                      ; preds = %20, %0
  %3 = load i32, i32* %1, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %24

; <label>:5:                                      ; preds = %2
  %6 = load i32, i32* %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.anon, %struct.anon* %8, i32 0, i32 1
  %10 = load i32, i32* %9, align 8
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %19

; <label>:12:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cleanup_tmpf, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cleanup_tmpf, i64 0, i64 1)
  %14 = load i32, i32* %1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @tmpf, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.anon, %struct.anon* %16, i32 0, i32 0
  %18 = getelementptr inbounds [256 x i8], [256 x i8]* %17, i32 0, i32 0
  call void @rmtemp(i8* %18)
  br label %19

; <label>:19:                                     ; preds = %12, %5
  br label %20

; <label>:20:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cleanup_tmpf, i64 0, i64 0)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cleanup_tmpf, i64 0, i64 0)
  %22 = load i32, i32* %1, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %1, align 4
  br label %2

; <label>:24:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cleanup_tmpf, i64 0, i64 2)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cleanup_tmpf, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @manuals_missing() #0 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 -1, i32* %2, align 4
  store i8** getelementptr inbounds ([12 x i8*], [12 x i8*]* @manual_dirs, i32 0, i32 0), i8*** %3, align 8
  br label %4

; <label>:4:                                      ; preds = %27, %0
  %5 = load i8**, i8*** %3, align 8
  %6 = load i8*, i8** %5, align 8
  %7 = icmp ne i8* %6, null
  br i1 %7, label %8, label %30

; <label>:8:                                      ; preds = %4
  %9 = load i8**, i8*** %3, align 8
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i32 0, i32 0
  %12 = call i32 @expand_env(i8* %10, i8* %11)
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_manuals_missing, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_manuals_missing, i64 0, i64 1)
  br label %27

; <label>:16:                                     ; preds = %8
  %17 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i32 0, i32 0
  %18 = call i32 @doc_missing(i8* %17)
  %19 = load i32, i32* %2, align 4
  %20 = and i32 %19, %18
  store i32 %20, i32* %2, align 4
  %21 = load i32, i32* %2, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %25, label %23

; <label>:23:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_manuals_missing, i64 0, i64 3)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_manuals_missing, i64 0, i64 3)
  br label %30

; <label>:25:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_manuals_missing, i64 0, i64 0)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_manuals_missing, i64 0, i64 0)
  br label %27

; <label>:27:                                     ; preds = %25, %14
  %28 = load i8**, i8*** %3, align 8
  %29 = getelementptr inbounds i8*, i8** %28, i32 1
  store i8** %29, i8*** %3, align 8
  br label %4

; <label>:30:                                     ; preds = %23, %4
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_manuals_missing, i64 0, i64 2)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_manuals_missing, i64 0, i64 2)
  %32 = load i32, i32* %2, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @expand_env(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %9 = load i8*, i8** %4, align 8
  %10 = load i8, i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp ne i32 %11, 36
  br i1 %12, label %13, label %18

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_expand_env, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_expand_env, i64 0, i64 0)
  %15 = load i8*, i8** %5, align 8
  %16 = load i8*, i8** %4, align 8
  %17 = call i8* @strcpy(i8* %15, i8* %16) #6
  store i32 0, i32* %3, align 4
  br label %80

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %4, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 1
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 123
  br i1 %23, label %24, label %41

; <label>:24:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_expand_env, i64 0, i64 2)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_expand_env, i64 0, i64 2)
  %26 = load i8*, i8** %4, align 8
  %27 = getelementptr inbounds i8, i8* %26, i64 2
  store i8* %27, i8** %6, align 8
  %28 = load i8*, i8** %6, align 8
  %29 = call i8* @strchr(i8* %28, i32 125) #7
  %30 = load i8*, i8** %6, align 8
  %31 = ptrtoint i8* %29 to i64
  %32 = ptrtoint i8* %30 to i64
  %33 = sub i64 %31, %32
  %34 = trunc i64 %33 to i32
  store i32 %34, i32* %8, align 4
  %35 = load i8*, i8** %4, align 8
  %36 = getelementptr inbounds i8, i8* %35, i64 2
  %37 = load i32, i32* %8, align 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8* %36, i64 %38
  %40 = getelementptr inbounds i8, i8* %39, i64 1
  store i8* %40, i8** %7, align 8
  br label %53

; <label>:41:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_expand_env, i64 0, i64 3)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_expand_env, i64 0, i64 3)
  %43 = load i8*, i8** %4, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 1
  store i8* %44, i8** %6, align 8
  %45 = load i8*, i8** %6, align 8
  %46 = call i64 @strspn(i8* %45, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.47, i32 0, i32 0)) #7
  %47 = trunc i64 %46 to i32
  store i32 %47, i32* %8, align 4
  %48 = load i8*, i8** %4, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 1
  %50 = load i32, i32* %8, align 4
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %49, i64 %51
  store i8* %52, i8** %7, align 8
  br label %53

; <label>:53:                                     ; preds = %41, %24
  %54 = load i8*, i8** %5, align 8
  %55 = load i8*, i8** %6, align 8
  %56 = load i32, i32* %8, align 4
  %57 = zext i32 %56 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %54, i8* %55, i64 %57, i32 1, i1 false)
  %58 = load i8*, i8** %5, align 8
  %59 = load i32, i32* %8, align 4
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %58, i64 %60
  store i8 0, i8* %61, align 1
  %62 = load i8*, i8** %5, align 8
  %63 = call i8* (i8*, ...) bitcast (i8* (...)* @getenv to i8* (i8*, ...)*)(i8* %62)
  store i8* %63, i8** %6, align 8
  %64 = load i8*, i8** %6, align 8
  %65 = icmp ne i8* %64, null
  br i1 %65, label %66, label %71

; <label>:66:                                     ; preds = %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_expand_env, i64 0, i64 1)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_expand_env, i64 0, i64 1)
  %68 = load i8*, i8** %6, align 8
  %69 = load i8, i8* %68, align 1
  %70 = icmp ne i8 %69, 0
  br i1 %70, label %72, label %71

; <label>:71:                                     ; preds = %66, %53
  store i32 -1, i32* %3, align 4
  br label %80

; <label>:72:                                     ; preds = %66
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_expand_env, i64 0, i64 4)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_expand_env, i64 0, i64 4)
  %74 = load i8*, i8** %5, align 8
  %75 = load i8*, i8** %6, align 8
  %76 = call i8* @strcpy(i8* %74, i8* %75) #6
  %77 = load i8*, i8** %5, align 8
  %78 = load i8*, i8** %7, align 8
  %79 = call i8* @strcat(i8* %77, i8* %78) #6
  store i32 0, i32* %3, align 4
  br label %80

; <label>:80:                                     ; preds = %72, %71, %13
  %81 = load i32, i32* %3, align 4
  ret i32 %81
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @doc_missing(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = call i64 @strlen(i8* %6) #7
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %5, align 4
  %9 = load i8*, i8** %3, align 8
  %10 = call i32 @files_missing(i8* %9)
  store i32 %10, i32* %4, align 4
  %11 = load i32, i32* %4, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %15, label %13

; <label>:13:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_doc_missing, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_doc_missing, i64 0, i64 1)
  store i32 0, i32* %2, align 4
  br label %54

; <label>:15:                                     ; preds = %1
  %16 = load i32, i32* %5, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %38

; <label>:18:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_doc_missing, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_doc_missing, i64 0, i64 2)
  %20 = load i8*, i8** %3, align 8
  %21 = load i32, i32* %5, align 4
  %22 = sub nsw i32 %21, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8* %20, i64 %23
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @DIRSEPS, i64 0, i64 0), align 1
  %28 = sext i8 %27 to i32
  %29 = icmp ne i32 %26, %28
  br i1 %29, label %30, label %38

; <label>:30:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_doc_missing, i64 0, i64 3)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_doc_missing, i64 0, i64 3)
  %32 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @DIRSEPS, i64 0, i64 0), align 1
  %33 = load i8*, i8** %3, align 8
  %34 = load i32, i32* %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %5, align 4
  %36 = sext i32 %34 to i64
  %37 = getelementptr inbounds i8, i8* %33, i64 %36
  store i8 %32, i8* %37, align 1
  br label %38

; <label>:38:                                     ; preds = %30, %18, %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_doc_missing, i64 0, i64 0)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_doc_missing, i64 0, i64 0)
  %40 = load i8*, i8** %3, align 8
  %41 = load i32, i32* %5, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %40, i64 %42
  %44 = call i8* @strcpy(i8* %43, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0)) #6
  %45 = load i8*, i8** %3, align 8
  %46 = call i32 @files_missing(i8* %45)
  %47 = load i32, i32* %4, align 4
  %48 = and i32 %47, %46
  store i32 %48, i32* %4, align 4
  %49 = load i8*, i8** %3, align 8
  %50 = load i32, i32* %5, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %49, i64 %51
  store i8 0, i8* %52, align 1
  %53 = load i32, i32* %4, align 4
  store i32 %53, i32* %2, align 4
  br label %54

; <label>:54:                                     ; preds = %38, %13
  %55 = load i32, i32* %2, align 4
  ret i32 %55
}

; Function Attrs: nounwind
declare i64 @pathconf(i8*, i32) #1

; Function Attrs: nounwind readonly
declare i64 @strspn(i8*, i8*) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @files_missing(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 3, i32* %6, align 4
  %8 = load i8*, i8** %3, align 8
  %9 = call i64 @strlen(i8* %8) #7
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %7, align 4
  %11 = load i8*, i8** %3, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 0
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %24

; <label>:16:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 3)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 3)
  %18 = load i8*, i8** %3, align 8
  %19 = call zeroext i8 @file_exists(i8* %18)
  %20 = icmp ne i8 %19, 0
  br i1 %20, label %24, label %21

; <label>:21:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 5)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 5)
  %23 = load i32, i32* %6, align 4
  store i32 %23, i32* %2, align 4
  br label %78

; <label>:24:                                     ; preds = %16, %1
  %25 = load i32, i32* %7, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %46

; <label>:27:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 4)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 4)
  %29 = load i8*, i8** %3, align 8
  %30 = load i32, i32* %7, align 4
  %31 = sub nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %29, i64 %32
  %34 = load i8, i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = call i8* @strchr(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @DIRSEPS, i32 0, i32 0), i32 %35) #7
  %37 = icmp eq i8* %36, null
  br i1 %37, label %38, label %46

; <label>:38:                                     ; preds = %27
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 6)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 6)
  %40 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @DIRSEPS, i64 0, i64 0), align 1
  %41 = load i8*, i8** %3, align 8
  %42 = load i32, i32* %7, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %7, align 4
  %44 = sext i32 %42 to i64
  %45 = getelementptr inbounds i8, i8* %41, i64 %44
  store i8 %40, i8* %45, align 1
  br label %46

; <label>:46:                                     ; preds = %38, %27, %24
  store i8** getelementptr inbounds ([3 x i8*], [3 x i8*]* @files_missing.names, i32 0, i32 0), i8*** %4, align 8
  store i32 1, i32* %5, align 4
  br label %47

; <label>:47:                                     ; preds = %70, %46
  %48 = load i8**, i8*** %4, align 8
  %49 = load i8*, i8** %48, align 8
  %50 = icmp ne i8* %49, null
  br i1 %50, label %51, label %75

; <label>:51:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 0)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 0)
  %53 = load i8*, i8** %3, align 8
  %54 = load i32, i32* %7, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8* %53, i64 %55
  %57 = load i8**, i8*** %4, align 8
  %58 = load i8*, i8** %57, align 8
  %59 = call i8* @strcpy(i8* %56, i8* %58) #6
  %60 = load i8*, i8** %3, align 8
  %61 = call i32 @ext_missing(i8* %60)
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %69, label %63

; <label>:63:                                     ; preds = %51
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 1)
  %64 = add i64 %pgocount5, 1
  store i64 %64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 1)
  %65 = load i32, i32* %5, align 4
  %66 = xor i32 %65, -1
  %67 = load i32, i32* %6, align 4
  %68 = and i32 %67, %66
  store i32 %68, i32* %6, align 4
  br label %69

; <label>:69:                                     ; preds = %63, %51
  br label %70

; <label>:70:                                     ; preds = %69
  %71 = load i8**, i8*** %4, align 8
  %72 = getelementptr inbounds i8*, i8** %71, i32 1
  store i8** %72, i8*** %4, align 8
  %73 = load i32, i32* %5, align 4
  %74 = shl i32 %73, 1
  store i32 %74, i32* %5, align 4
  br label %47

; <label>:75:                                     ; preds = %47
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 2)
  %76 = add i64 %pgocount6, 1
  store i64 %76, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_files_missing, i64 0, i64 2)
  %77 = load i32, i32* %6, align 4
  store i32 %77, i32* %2, align 4
  br label %78

; <label>:78:                                     ; preds = %75, %21
  %79 = load i32, i32* %2, align 4
  ret i32 %79
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @ext_missing(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = call i64 @strlen(i8* %7) #7
  %9 = getelementptr inbounds i8, i8* %6, i64 %8
  store i8* %9, i8** %5, align 8
  store i8** getelementptr inbounds ([6 x i8*], [6 x i8*]* @ext_missing.extensions, i32 0, i32 0), i8*** %4, align 8
  br label %10

; <label>:10:                                     ; preds = %25, %1
  %11 = load i8**, i8*** %4, align 8
  %12 = load i8*, i8** %11, align 8
  %13 = icmp ne i8* %12, null
  br i1 %13, label %14, label %29

; <label>:14:                                     ; preds = %10
  %15 = load i8*, i8** %5, align 8
  %16 = load i8**, i8*** %4, align 8
  %17 = load i8*, i8** %16, align 8
  %18 = call i8* @strcpy(i8* %15, i8* %17) #6
  %19 = load i8*, i8** %3, align 8
  %20 = call zeroext i8 @file_exists(i8* %19)
  %21 = icmp ne i8 %20, 0
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ext_missing, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ext_missing, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %31

; <label>:24:                                     ; preds = %14
  br label %25

; <label>:25:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ext_missing, i64 0, i64 0)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ext_missing, i64 0, i64 0)
  %27 = load i8**, i8*** %4, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i32 1
  store i8** %28, i8*** %4, align 8
  br label %10

; <label>:29:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ext_missing, i64 0, i64 1)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ext_missing, i64 0, i64 1)
  store i32 1, i32* %2, align 4
  br label %31

; <label>:31:                                     ; preds = %29, %22
  %32 = load i32, i32* %2, align 4
  ret i32 %32
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
