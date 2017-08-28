; ModuleID = 'tmp1.ll'
source_filename = "crypto.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.hashedpw = type { %struct.hashedpw*, [16 x i8] }
%struct.IdeaCfbContext = type { [8 x i8], [8 x i8], [52 x i16], i32 }
%struct.MD5Context = type { [4 x i64], [2 x i64], [64 x i8] }
%struct.nkey = type { [8 x i8], %struct.nkey* }

$__llvm_profile_raw_version = comdat any

@timeshift = external global i64, align 8
@cdate.datebuf = internal global [20 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [11 x i8] c"          \00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"%4d/%02d/%02d\00", align 1
@ctdate.tdatebuf = internal global [40 x i8] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [17 x i8] c"%s %02d:%02d GMT\00", align 1
@pgpout = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [78 x i8] c"\0A\07Unsupported packet format - you need a newer version of PGP for this file.\0A\00", align 1
@global_precision = external global i16, align 2
@mpi_checksum = common global i16 0, align 2
@.str.4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@verbose = external global i8, align 1
@.str.5 = private unnamed_addr constant [74 x i8] c"signfile: infile = '%s', outfile = '%s', mode = '%c', literalfile = '%s'\0A\00", align 1
@globalPubringName = external global [256 x i8], align 16
@.str.6 = private unnamed_addr constant [34 x i8] c"\0A\07Can't open plaintext file '%s'\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.8 = private unnamed_addr constant [36 x i8] c"\0A\07Can't create signature file '%s'\0A\00", align 1
@.str.9 = private unnamed_addr constant [24 x i8] c"signfile: invalid mode\0A\00", align 1
@.str.10 = private unnamed_addr constant [33 x i8] c"\0A\07Can't open key ring file '%s'\0A\00", align 1
@.str.11 = private unnamed_addr constant [36 x i8] c"This key has already been revoked.\0A\00", align 1
@.str.12 = private unnamed_addr constant [48 x i8] c"\0A\07Can't create output file to update key ring.\0A\00", align 1
@.str.13 = private unnamed_addr constant [38 x i8] c"\0AKey compromise certificate created.\0A\00", align 1
@.str.14 = private unnamed_addr constant [39 x i8] c"\0A\07Key is already signed by user '%s'.\0A\00", align 1
@.str.15 = private unnamed_addr constant [229 x i8] c"\0A\0AREAD CAREFULLY:  Based on your own direct first-hand knowledge, are\0Ayou absolutely certain that you are prepared to solemnly certify that\0Athe above public key actually belongs to the user specified by the\0Aabove user ID (y/N)? \00", align 1
@.str.16 = private unnamed_addr constant [35 x i8] c"\0AKey signature certificate added.\0A\00", align 1
@.str.17 = private unnamed_addr constant [149 x i8] c"\0AError: Key for signing userid '%s'\0Adoes not appear in public keyring '%s'.\0AThus, a signature made with this key cannot be checked on this keyring.\0A\00", align 1
@.str.18 = private unnamed_addr constant [33 x i8] c"\0ALooking for key for user '%s':\0A\00", align 1
@batchmode = external global i8, align 1
@.str.19 = private unnamed_addr constant [52 x i8] c"check_signaturefile: infile = '%s', outfile = '%s'\0A\00", align 1
@.str.20 = private unnamed_addr constant [35 x i8] c"\0A\07Can't open ciphertext file '%s'\0A\00", align 1
@filter_mode = external global i8, align 1
@.str.21 = private unnamed_addr constant [10 x i8] c"/dev/null\00", align 1
@.str.22 = private unnamed_addr constant [44 x i8] c"\0AFile '%s' has signature, but with no text.\00", align 1
@myArgc = external global i32, align 4
@myArgv = external global i8**, align 8
@.str.23 = private unnamed_addr constant [38 x i8] c"\0AText is assumed to be in file '%s'.\0A\00", align 1
@.str.24 = private unnamed_addr constant [63 x i8] c"\0APlease enter filename of material that signature applies to: \00", align 1
@.str.25 = private unnamed_addr constant [24 x i8] c"\0A\07Can't open file '%s'\0A\00", align 1
@.str.26 = private unnamed_addr constant [52 x i8] c"\0A\07Error: Illegal mode byte %02x in literal packet.\0A\00", align 1
@.str.27 = private unnamed_addr constant [17 x i8] c"File type: '%c'\0A\00", align 1
@.str.28 = private unnamed_addr constant [40 x i8] c"Original plaintext file name was: '%s'\0A\00", align 1
@.str.29 = private unnamed_addr constant [37 x i8] c"\0A\07Unrecognised local binary type %s\0A\00", align 1
@.str.30 = private unnamed_addr constant [78 x i8] c"\0AWARNING: Can't find the right public key-- can't check signature integrity.\0A\00", align 1
@quietmode = external global i8, align 1
@.str.31 = private unnamed_addr constant [116 x i8] c"\07\0AUnrecognized message digest algorithm.\0AThis may require a newer version of PGP.\0ACan't check signature integrity.\0A\00", align 1
@.str.32 = private unnamed_addr constant [70 x i8] c"\07\0AMalformed or obsolete signature.  Can't check signature integrity.\0A\00", align 1
@.str.33 = private unnamed_addr constant [63 x i8] c"\07\0ASigning key is too large.  Can't check signature integrity.\0A\00", align 1
@.str.34 = private unnamed_addr constant [119 x i8] c"\0A\07Error: RSA-decrypted block is corrupted.\0AThis may be caused either by corrupted data or by using the wrong RSA key.\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.35 = private unnamed_addr constant [53 x i8] c"signature checking failed, trying in canonical mode\0A\00", align 1
@checksig_pass = external global i32, align 4
@moreflag = external global i8, align 1
@.str.36 = private unnamed_addr constant [28 x i8] c"\0APress ENTER to continue...\00", align 1
@signature_checked = external global i8, align 1
@.str.37 = private unnamed_addr constant [33 x i8] c"\0AGood signature from user \22%s\22.\0A\00", align 1
@.str.38 = private unnamed_addr constant [47 x i8] c"Signature made %s using %d-bit key, key ID %s\0A\00", align 1
@.str.39 = private unnamed_addr constant [61 x i8] c"\0ASignature and text are separate.  No output file produced. \00", align 1
@.str.40 = private unnamed_addr constant [36 x i8] c"\0A\07Can't create plaintext file '%s'\0A\00", align 1
@CONVERSION = external global i32, align 4
@SIG_EXTENSION = external global [0 x i8], align 1
@force_flag = external global i8, align 1
@.str.41 = private unnamed_addr constant [57 x i8] c"\0A\07Signature file '%s' already exists.  Overwrite (y/N)? \00", align 1
@.str.42 = private unnamed_addr constant [40 x i8] c"\0AWriting signature certificate to '%s'\0A\00", align 1
@.str.43 = private unnamed_addr constant [59 x i8] c"\0A\07Error: Badly-formed or corrupted signature certificate.\0A\00", align 1
@.str.44 = private unnamed_addr constant [54 x i8] c"File \22%s\22 does not have a properly-formed signature.\0A\00", align 1
@.str.45 = private unnamed_addr constant [44 x i8] c"squish_file: infile = '%s', outfile = '%s'\0A\00", align 1
@.str.46 = private unnamed_addr constant [37 x i8] c"\0A\07Can't create compressed file '%s'\0A\00", align 1
@.str.47 = private unnamed_addr constant [20 x i8] c"Compressing file...\00", align 1
@.str.48 = private unnamed_addr constant [14 x i8] c"compressed.  \00", align 1
@.str.49 = private unnamed_addr constant [49 x i8] c"idea_encryptfile: infile = '%s', outfile = '%s'\0A\00", align 1
@.str.50 = private unnamed_addr constant [37 x i8] c"\0A\07Can't create ciphertext file '%s'\0A\00", align 1
@passwds = external global %struct.hashedpw*, align 8
@.str.51 = private unnamed_addr constant [46 x i8] c"\0AYou need a pass phrase to encrypt the file. \00", align 1
@.str.52 = private unnamed_addr constant [17 x i8] c"Just a moment...\00", align 1
@.str.53 = private unnamed_addr constant [40 x i8] c"encryptfile: infile = %s, outfile = %s\0A\00", align 1
@already_have_md5 = internal global i8 0, align 1
@md5buf = internal global [16 x i8] zeroinitializer, align 16
@encrypt_to_self = external global i8, align 1
@keyID_list = internal global [8 x i8]* null, align 8
@my_name = external global [0 x i8], align 1
@.str.54 = private unnamed_addr constant [74 x i8] c"make_literal: infile = %s, outfile = %s, mode = '%c', literalfile = '%s'\0A\00", align 1
@.str.55 = private unnamed_addr constant [40 x i8] c"\0A\07Can't open input plaintext file '%s'\0A\00", align 1
@.str.56 = private unnamed_addr constant [45 x i8] c"\0A\07Unable to append to literal plaintext file\00", align 1
@.str.57 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.58 = private unnamed_addr constant [42 x i8] c"strip_literal: infile = %s, outfile = %s\0A\00", align 1
@.str.59 = private unnamed_addr constant [41 x i8] c"\0A\07'%s' is not a literal plaintext file.\0A\00", align 1
@.str.60 = private unnamed_addr constant [40 x i8] c"decryptfile: infile = %s, outfile = %s\0A\00", align 1
@.str.61 = private unnamed_addr constant [30 x i8] c"\0A\07'%s' is not a cipher file.\0A\00", align 1
@.str.62 = private unnamed_addr constant [18 x i8] c"\0A\07Out of memory.\0A\00", align 1
@.str.63 = private unnamed_addr constant [130 x i8] c"\07\0AError: key is too large.  RSA keys may be no longer than 1024 bits,\0Adue to limitations imposed by software provided by RSADSI.\0A\00", align 1
@.str.64 = private unnamed_addr constant [63 x i8] c"\0A\07Error: RSA block is possibly malformed.  Old format, maybe?\0A\00", align 1
@.str.65 = private unnamed_addr constant [34 x i8] c"\07\0AUnexpected error %d decrypting\0A\00", align 1
@.str.66 = private unnamed_addr constant [14 x i8] c"\0ARecipients:\0A\00", align 1
@.str.67 = private unnamed_addr constant [36 x i8] c"\0AThis message can only be read by:\0A\00", align 1
@.str.68 = private unnamed_addr constant [13 x i8] c"  keyID: %s\0A\00", align 1
@.str.69 = private unnamed_addr constant [6 x i8] c"  %s\0A\00", align 1
@.str.70 = private unnamed_addr constant [63 x i8] c"\0A\07You do not have the secret key needed to decrypt this file.\0A\00", align 1
@.str.71 = private unnamed_addr constant [32 x i8] c"\07\0ABad or missing CTB_CKE byte.\0A\00", align 1
@.str.72 = private unnamed_addr constant [44 x i8] c"\0A\07Error: Decrypted plaintext is corrupted.\0A\00", align 1
@.str.73 = private unnamed_addr constant [45 x i8] c"idea_decryptfile: infile = %s, outfile = %s\0A\00", align 1
@.str.74 = private unnamed_addr constant [47 x i8] c"\0AYou need a pass phrase to decrypt this file. \00", align 1
@.str.75 = private unnamed_addr constant [28 x i8] c"\0A\07Error:  Bad pass phrase.\0A\00", align 1
@.str.76 = private unnamed_addr constant [27 x i8] c"Pass phrase appears good. \00", align 1
@.str.77 = private unnamed_addr constant [27 x i8] c"Decompressing plaintext...\00", align 1
@.str.78 = private unnamed_addr constant [35 x i8] c"\0A\07Can't open compressed file '%s'\0A\00", align 1
@.str.79 = private unnamed_addr constant [39 x i8] c"\07\0ABad or missing CTB_COMPRESSED byte.\0A\00", align 1
@.str.80 = private unnamed_addr constant [80 x i8] c"\07\0AUnrecognized compression algorithm.\0AThis may require a newer version of PGP.\0A\00", align 1
@.str.81 = private unnamed_addr constant [39 x i8] c"\0A\07Can't create decompressed file '%s'\0A\00", align 1
@.str.82 = private unnamed_addr constant [51 x i8] c"\0A\07Decompression error.  Probable corrupted input.\0A\00", align 1
@.str.83 = private unnamed_addr constant [8 x i8] c"done.  \00", align 1
@date_ymd.mdays = internal global [12 x i16] [i16 31, i16 28, i16 31, i16 30, i16 31, i16 30, i16 31, i16 31, i16 30, i16 31, i16 30, i16 31], align 16
@.str.84 = private unnamed_addr constant [52 x i8] c"\0A\07Error: RSA key length must be at least 256 bits.\0A\00", align 1
@.str.85 = private unnamed_addr constant [46 x i8] c"\0A\07Error: System clock/calendar is set wrong.\0A\00", align 1
@.str.86 = private unnamed_addr constant [31 x i8] c"\07\0AUnexpected error %d signing\0A\00", align 1
@version_byte = external global i32, align 4
@.str.87 = private unnamed_addr constant [102 x i8] c"\07\0AWARNING:  This key has been revoked by its owner,\0Apossibly because the secret key was compromised.\0A\00", align 1
@.str.88 = private unnamed_addr constant [51 x i8] c"This could mean that this signature is a forgery.\0A\00", align 1
@.str.89 = private unnamed_addr constant [34 x i8] c"You cannot use this revoked key.\0A\00", align 1
@.str.90 = private unnamed_addr constant [165 x i8] c"\07\0AWARNING:  Because this public key is not certified with a trusted\0Asignature, it is not known with high confidence that this public key\0Aactually belongs to: \22%s\22.\0A\00", align 1
@.str.91 = private unnamed_addr constant [73 x i8] c"\07\0AWARNING:  This public key is not trusted to actually belong to:\0A\22%s\22.\0A\00", align 1
@.str.92 = private unnamed_addr constant [171 x i8] c"\07\0AWARNING:  Because this public key is not certified with enough trusted\0Asignatures, it is not known with high confidence that this public key\0Aactually belongs to: \22%s\22.\0A\00", align 1
@.str.93 = private unnamed_addr constant [59 x i8] c"But you previously approved using this public key anyway.\0A\00", align 1
@.str.94 = private unnamed_addr constant [54 x i8] c"\0AAre you sure you want to use this public key (y/N)? \00", align 1
@.str.95 = private unnamed_addr constant [3 x i8] c"r+\00", align 1
@.str.96 = private unnamed_addr constant [32 x i8] c"Preparing random session key...\00", align 1
@.str.97 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str.98 = private unnamed_addr constant [19 x i8] c"\0ACompressing [%s] \00", align 1
@plainfile = external global [0 x i8], align 1
@globalSecringName = external global [256 x i8], align 16
@.str.99 = private unnamed_addr constant [103 x i8] c"\0A\07Cannot find the public key matching userid '%s'\0AThis user will not be able to decrypt this message.\0A\00", align 1
@.str.100 = private unnamed_addr constant [20 x i8] c"Skipping userid %s\0A\00", align 1
@.str.101 = private unnamed_addr constant [34 x i8] c"\07\0AUnexpected error %d encrypting\0A\00", align 1
@textbuf = external global [4096 x i8], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_CToPascal = private constant [9 x i8] c"CToPascal"
@__profn_PascalToC = private constant [9 x i8] c"PascalToC"
@__profn_get_timestamp = private constant [13 x i8] c"get_timestamp"
@__profn_cdate = private constant [5 x i8] c"cdate"
@__profn_tmp1.ll_date_ymd = private constant [16 x i8] c"tmp1.ll:date_ymd"
@__profn_ctdate = private constant [6 x i8] c"ctdate"
@__profn_legal_ctb = private constant [9 x i8] c"legal_ctb"
@__profn_version_error = private constant [13 x i8] c"version_error"
@__profn_version_byte_error = private constant [18 x i8] c"version_byte_error"
@__profn_getpastlength = private constant [13 x i8] c"getpastlength"
@__profn_write_ctb_len = private constant [13 x i8] c"write_ctb_len"
@__profn_read_mpi = private constant [8 x i8] c"read_mpi"
@__profn_write_mpi = private constant [9 x i8] c"write_mpi"
@__profn_get_header_info_from_file = private constant [25 x i8] c"get_header_info_from_file"
@__profn_signfile = private constant [8 x i8] c"signfile"
@__profn_tmp1.ll_make_signature_certificate = private constant [34 x i8] c"tmp1.ll:make_signature_certificate"
@__profn_compromise = private constant [10 x i8] c"compromise"
@__profn_do_sign = private constant [7 x i8] c"do_sign"
@__profn_signkey = private constant [7 x i8] c"signkey"
@__profn_check_signaturefile = private constant [19 x i8] c"check_signaturefile"
@__profn_tmp1.ll_warn_signatures = private constant [23 x i8] c"tmp1.ll:warn_signatures"
@__profn_check_key_sig = private constant [13 x i8] c"check_key_sig"
@__profn_squish_file = private constant [11 x i8] c"squish_file"
@__profn_idea_encryptfile = private constant [16 x i8] c"idea_encryptfile"
@__profn_tmp1.ll_make_random_ideakey = private constant [27 x i8] c"tmp1.ll:make_random_ideakey"
@__profn_tmp1.ll_squish_and_idea_file = private constant [28 x i8] c"tmp1.ll:squish_and_idea_file"
@__profn_encryptfile = private constant [11 x i8] c"encryptfile"
@__profn_tmp1.ll_encryptkeyintofile = private constant [26 x i8] c"tmp1.ll:encryptkeyintofile"
@__profn_tmp1.ll_getmyname = private constant [17 x i8] c"tmp1.ll:getmyname"
@__profn_make_literal = private constant [12 x i8] c"make_literal"
@__profn_strip_literal = private constant [13 x i8] c"strip_literal"
@__profn_decryptfile = private constant [11 x i8] c"decryptfile"
@__profn_tmp1.ll_idea_file = private constant [17 x i8] c"tmp1.ll:idea_file"
@__profn_idea_decryptfile = private constant [16 x i8] c"idea_decryptfile"
@__profn_decompress_file = private constant [15 x i8] c"decompress_file"
@__profc_CToPascal = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_CToPascal = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2650794538981605791, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_CToPascal, i32 0, i32 0), i8* bitcast (void (i8*)* @CToPascal to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_PascalToC = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_PascalToC = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5264488730952859934, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_PascalToC, i32 0, i32 0), i8* bitcast (void (i8*)* @PascalToC to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_get_timestamp = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_get_timestamp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5390080809088424929, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_get_timestamp, i32 0, i32 0), i8* bitcast (i64 (i8*)* @get_timestamp to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_cdate = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_cdate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4848071071846260835, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cdate, i32 0, i32 0), i8* bitcast (i8* (i64*)* @cdate to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_date_ymd = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_date_ymd = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7861841450163557944, i64 44798934313, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_date_ymd, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ctdate = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ctdate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8059956443107054067, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ctdate, i32 0, i32 0), i8* bitcast (i8* (i64*)* @ctdate to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_legal_ctb = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_legal_ctb = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7863997954150721587, i64 90886501965, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i32 0, i32 0), i8* bitcast (i8 (i8)* @legal_ctb to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_version_error = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_version_error = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1741258977437761306, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_version_error, i32 0, i32 0), i8* bitcast (i32 (i32, i32)* @version_error to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_version_byte_error = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_version_byte_error = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2191964787186896085, i64 38490985531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_version_byte_error, i32 0, i32 0), i8* bitcast (i32 (i32)* @version_byte_error to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_getpastlength = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_getpastlength = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8226950643196294262, i64 78167035237, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i32 0, i32 0), i8* bitcast (i64 (i8, %struct._IO_FILE*)* @getpastlength to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_write_ctb_len = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_write_ctb_len = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7548747811999356962, i64 93688579022, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i8, i64, i8)* @write_ctb_len to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_read_mpi = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_read_mpi = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7991253177498552088, i64 115854255404, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i32 0, i32 0), i8* bitcast (i32 (i16*, %struct._IO_FILE*, i8, %struct.IdeaCfbContext*)* @read_mpi to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_write_mpi = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_write_mpi = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2791420375173645022, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_write_mpi, i32 0, i32 0), i8* bitcast (void (i16*, %struct._IO_FILE*, %struct.IdeaCfbContext*)* @write_mpi to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_get_header_info_from_file = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_get_header_info_from_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2318392987230434018, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_get_header_info_from_file, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i32)* @get_header_info_from_file to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_signfile = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_signfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -398584068982727062, i64 226706243604, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i32 0, i32 0), i8* bitcast (i32 (i8, i8, i8*, i8*, i8*, i8, i8*)* @signfile to i8*), i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_make_signature_certificate = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_make_signature_certificate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -497603761891011859, i64 180086719645, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_compromise = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_compromise = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9165206260439041423, i64 135031562921, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @compromise to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_do_sign = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_do_sign = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1315769382530816004, i64 72057807496165798, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i32 0, i32 0), i8* bitcast (i32 (i8*, i64, i32, i8*, i8*, i8*, i8)* @do_sign to i8*), i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_signkey = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_signkey = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8162080543584684091, i64 66257271633, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_signkey, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i8*)* @signkey to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_check_signaturefile = private global [86 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_check_signaturefile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 199090283299097882, i64 144116270179067107, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i8, i8*)* @check_signaturefile to i8*), i8* null, i32 86, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_warn_signatures = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_warn_signatures = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1614216708973536846, i64 190300451458, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_check_key_sig = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_check_key_sig = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4074598940101220319, i64 319023496012, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, i64, i32, i8*, %struct._IO_FILE*, i64, i8*, i8*, i8*, i8*)* @check_key_sig to i8*), i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_squish_file = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_squish_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7911967922708842731, i64 94265117822, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @squish_file to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_idea_encryptfile = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_idea_encryptfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 513651817621134021, i64 130568866461, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i8)* @idea_encryptfile to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_make_random_ideakey = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_make_random_ideakey = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3891182148109978647, i64 46621656233, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_make_random_ideakey, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_squish_and_idea_file = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_squish_and_idea_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1705238178468988890, i64 153399771224, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_encryptfile = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_encryptfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 57928532425653186, i64 252721608319, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i32 0, i32 0), i8* bitcast (i32 (i8**, i8*, i8*, i8)* @encryptfile to i8*), i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_encryptkeyintofile = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_encryptkeyintofile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 197883792864406619, i64 72057744963950947, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_getmyname = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_getmyname = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6584955328099056687, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_getmyname, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_make_literal = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_make_literal = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 439916080844406839, i64 72057778733274695, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i8, i8*)* @make_literal to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_strip_literal = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_strip_literal = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2445965343898132367, i64 72057908393208153, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i8*, i8*)* @strip_literal to i8*), i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_decryptfile = private global [36 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_decryptfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6794545771145462497, i64 72058087037599190, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @decryptfile to i8*), i8* null, i32 36, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_idea_file = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_idea_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1659880882014524267, i64 174657217206, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i32 0, i32 0), i8* null, i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_idea_decryptfile = private global [20 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_idea_decryptfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3498015530275302378, i64 265866750052, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @idea_decryptfile to i8*), i8* null, i32 20, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_decompress_file = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_decompress_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7030853636475137236, i64 144818871720, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @decompress_file to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [544 x i8] c"\9D\04\00CToPascal\01PascalToC\01get_timestamp\01cdate\01tmp1.ll:date_ymd\01ctdate\01legal_ctb\01version_error\01version_byte_error\01getpastlength\01write_ctb_len\01read_mpi\01write_mpi\01get_header_info_from_file\01signfile\01tmp1.ll:make_signature_certificate\01compromise\01do_sign\01signkey\01check_signaturefile\01tmp1.ll:warn_signatures\01check_key_sig\01squish_file\01idea_encryptfile\01tmp1.ll:make_random_ideakey\01tmp1.ll:squish_and_idea_file\01encryptfile\01tmp1.ll:encryptkeyintofile\01tmp1.ll:getmyname\01make_literal\01strip_literal\01decryptfile\01tmp1.ll:idea_file\01idea_decryptfile\01decompress_file", section "__llvm_prf_names"
@llvm.used = appending global [36 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_CToPascal to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_PascalToC to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_get_timestamp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_cdate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_date_ymd to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ctdate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_legal_ctb to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_version_error to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_version_byte_error to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_getpastlength to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_write_ctb_len to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_read_mpi to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_write_mpi to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_get_header_info_from_file to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_signfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_make_signature_certificate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_compromise to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_do_sign to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_signkey to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_check_signaturefile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_warn_signatures to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_check_key_sig to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_squish_file to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_idea_encryptfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_make_random_ideakey to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_squish_and_idea_file to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_encryptfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_encryptkeyintofile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_getmyname to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_make_literal to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_strip_literal to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_decryptfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_idea_file to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_idea_decryptfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_decompress_file to i8*), i8* getelementptr inbounds ([544 x i8], [544 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @CToPascal(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = call i32 @string_length(i8* %5)
  store i32 %6, i32* %4, align 4
  %7 = load i32, i32* %4, align 4
  store i32 %7, i32* %3, align 4
  br label %8

; <label>:8:                                      ; preds = %22, %1
  %9 = load i32, i32* %3, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %26

; <label>:11:                                     ; preds = %8
  %12 = load i8*, i8** %2, align 8
  %13 = load i32, i32* %3, align 4
  %14 = sub nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, i8* %12, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = load i8*, i8** %2, align 8
  %19 = load i32, i32* %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i8, i8* %18, i64 %20
  store i8 %17, i8* %21, align 1
  br label %22

; <label>:22:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_CToPascal, i64 0, i64 0)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_CToPascal, i64 0, i64 0)
  %24 = load i32, i32* %3, align 4
  %25 = add nsw i32 %24, -1
  store i32 %25, i32* %3, align 4
  br label %8

; <label>:26:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_CToPascal, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_CToPascal, i64 0, i64 1)
  %28 = load i32, i32* %4, align 4
  %29 = trunc i32 %28 to i8
  %30 = load i8*, i8** %2, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 0
  store i8 %29, i8* %31, align 1
  ret void
}

declare i32 @string_length(i8*) #1

; Function Attrs: noinline nounwind uwtable
define void @PascalToC(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  store i32 0, i32* %3, align 4
  %5 = load i8*, i8** %2, align 8
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = load i8, i8* %6, align 1
  %8 = zext i8 %7 to i32
  store i32 %8, i32* %4, align 4
  br label %9

; <label>:9:                                      ; preds = %24, %1
  %10 = load i32, i32* %3, align 4
  %11 = load i32, i32* %4, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %28

; <label>:13:                                     ; preds = %9
  %14 = load i8*, i8** %2, align 8
  %15 = load i32, i32* %3, align 4
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8* %14, i64 %17
  %19 = load i8, i8* %18, align 1
  %20 = load i8*, i8** %2, align 8
  %21 = load i32, i32* %3, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i8, i8* %20, i64 %22
  store i8 %19, i8* %23, align 1
  br label %24

; <label>:24:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_PascalToC, i64 0, i64 0)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_PascalToC, i64 0, i64 0)
  %26 = load i32, i32* %3, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %3, align 4
  br label %9

; <label>:28:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_PascalToC, i64 0, i64 1)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_PascalToC, i64 0, i64 1)
  %30 = load i8*, i8** %2, align 8
  %31 = load i32, i32* %3, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %30, i64 %32
  store i8 0, i8* %33, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i64 @get_timestamp(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  store i8* %0, i8** %2, align 8
  store i64 3735928559, i64* %3, align 8
  %4 = load i64, i64* @timeshift, align 8
  %5 = load i64, i64* %3, align 8
  %6 = add i64 %5, %4
  store i64 %6, i64* %3, align 8
  %7 = load i8*, i8** %2, align 8
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %15

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_get_timestamp, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_get_timestamp, i64 0, i64 1)
  %11 = load i64, i64* %3, align 8
  %12 = load i8*, i8** %2, align 8
  %13 = call i8* @put_word32(i64 %11, i8* %12)
  %14 = load i8*, i8** %2, align 8
  call void @hiloswap(i8* %14, i16 signext 4)
  br label %15

; <label>:15:                                     ; preds = %9, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_get_timestamp, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_get_timestamp, i64 0, i64 0)
  %17 = load i64, i64* %3, align 8
  ret i64 %17
}

declare i8* @put_word32(i64, i8*) #1

declare void @hiloswap(i8*, i16 signext) #1

; Function Attrs: noinline nounwind uwtable
define i8* @cdate(i64*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i64* %0, i64** %3, align 8
  %7 = load i64*, i64** %3, align 8
  %8 = load i64, i64* %7, align 8
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cdate, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cdate, i64 0, i64 1)
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i8** %2, align 8
  br label %20

; <label>:12:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cdate, i64 0, i64 0)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cdate, i64 0, i64 0)
  %14 = load i64*, i64** %3, align 8
  %15 = call i32 @date_ymd(i64* %14, i32* %6, i32* %4, i32* %5)
  %16 = load i32, i32* %6, align 4
  %17 = load i32, i32* %4, align 4
  %18 = load i32, i32* %5, align 4
  %19 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @cdate.datebuf, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 %16, i32 %17, i32 %18) #5
  store i8* getelementptr inbounds ([20 x i8], [20 x i8]* @cdate.datebuf, i32 0, i32 0), i8** %2, align 8
  br label %20

; <label>:20:                                     ; preds = %12, %10
  %21 = load i8*, i8** %2, align 8
  ret i8* %21
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @date_ymd(i64*, i32*, i32*, i32*) #0 {
  %5 = alloca i64*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i64* %0, i64** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  store i32* %3, i32** %8, align 8
  %14 = load i64*, i64** %5, align 8
  %15 = load i64, i64* %14, align 8
  %16 = udiv i64 %15, 86400
  store i64 %16, i64* %9, align 8
  %17 = load i64, i64* %9, align 8
  %18 = sub i64 %17, 730
  store i64 %18, i64* %9, align 8
  %19 = load i64, i64* %9, align 8
  %20 = mul i64 %19, 4
  %21 = udiv i64 %20, 1461
  store i64 %21, i64* %10, align 8
  %22 = load i64, i64* %9, align 8
  %23 = load i64, i64* %10, align 8
  %24 = udiv i64 %23, 4
  %25 = mul i64 %24, 1461
  %26 = sub i64 %22, %25
  %27 = trunc i64 %26 to i32
  store i32 %27, i32* %12, align 4
  %28 = load i64, i64* %10, align 8
  %29 = add i64 %28, 1972
  %30 = trunc i64 %29 to i32
  %31 = load i32*, i32** %6, align 8
  store i32 %30, i32* %31, align 4
  store i32 0, i32* %13, align 4
  br label %32

; <label>:32:                                     ; preds = %65, %4
  %33 = load i32, i32* %13, align 4
  %34 = icmp slt i32 %33, 48
  br i1 %34, label %35, label %69

; <label>:35:                                     ; preds = %32
  %36 = load i32, i32* %13, align 4
  %37 = srem i32 %36, 12
  store i32 %37, i32* %11, align 4
  %38 = load i32, i32* %11, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [12 x i16], [12 x i16]* @date_ymd.mdays, i64 0, i64 %39
  %41 = load i16, i16* %40, align 2
  %42 = sext i16 %41 to i32
  %43 = load i32, i32* %13, align 4
  %44 = icmp eq i32 %43, 1
  %45 = zext i1 %44 to i32
  %46 = add nsw i32 %42, %45
  %47 = load i32, i32* %12, align 4
  %48 = sub nsw i32 %47, %46
  store i32 %48, i32* %12, align 4
  %49 = load i32, i32* %12, align 4
  %50 = icmp slt i32 %49, 0
  br i1 %50, label %51, label %64

; <label>:51:                                     ; preds = %35
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_date_ymd, i64 0, i64 2)
  %52 = add i64 %pgocount, 1
  store i64 %52, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_date_ymd, i64 0, i64 2)
  %53 = load i32, i32* %11, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [12 x i16], [12 x i16]* @date_ymd.mdays, i64 0, i64 %54
  %56 = load i16, i16* %55, align 2
  %57 = sext i16 %56 to i32
  %58 = load i32, i32* %13, align 4
  %59 = icmp eq i32 %58, 1
  %60 = zext i1 %59 to i32
  %61 = add nsw i32 %57, %60
  %62 = load i32, i32* %12, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, i32* %12, align 4
  br label %69

; <label>:64:                                     ; preds = %35
  br label %65

; <label>:65:                                     ; preds = %64
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_date_ymd, i64 0, i64 0)
  %66 = add i64 %pgocount1, 1
  store i64 %66, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_date_ymd, i64 0, i64 0)
  %67 = load i32, i32* %13, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %13, align 4
  br label %32

; <label>:69:                                     ; preds = %51, %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_date_ymd, i64 0, i64 1)
  %70 = add i64 %pgocount2, 1
  store i64 %70, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_date_ymd, i64 0, i64 1)
  %71 = load i32, i32* %11, align 4
  %72 = add nsw i32 %71, 1
  %73 = load i32*, i32** %7, align 8
  store i32 %72, i32* %73, align 4
  %74 = load i32, i32* %12, align 4
  %75 = add nsw i32 %74, 1
  %76 = load i32*, i32** %8, align 8
  store i32 %75, i32* %76, align 4
  %77 = load i64, i64* %9, align 8
  %78 = sub i64 %77, 2
  %79 = urem i64 %78, 7
  %80 = trunc i64 %79 to i32
  store i32 %80, i32* %13, align 4
  %81 = load i32, i32* %13, align 4
  ret i32 %81
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define i8* @ctdate(i64*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ctdate, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ctdate, i64 0, i64 0)
  %3 = alloca i64*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store i64* %0, i64** %3, align 8
  %7 = load i64*, i64** %3, align 8
  %8 = load i64, i64* %7, align 8
  %9 = urem i64 %8, 86400
  store i64 %9, i64* %6, align 8
  %10 = load i64, i64* %6, align 8
  %11 = add nsw i64 %10, 30
  %12 = sdiv i64 %11, 60
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %5, align 4
  %14 = load i32, i32* %5, align 4
  %15 = sdiv i32 %14, 60
  store i32 %15, i32* %4, align 4
  %16 = load i32, i32* %5, align 4
  %17 = srem i32 %16, 60
  store i32 %17, i32* %5, align 4
  %18 = load i64*, i64** %3, align 8
  %19 = call i8* @cdate(i64* %18)
  %20 = load i32, i32* %4, align 4
  %21 = load i32, i32* %5, align 4
  %22 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @ctdate.tdatebuf, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0), i8* %19, i32 %20, i32 %21) #5
  ret i8* getelementptr inbounds ([40 x i8], [40 x i8]* @ctdate.tdatebuf, i32 0, i32 0)
}

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @legal_ctb(i8 zeroext) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  store i8 %0, i8* %3, align 1
  %6 = load i8, i8* %3, align 1
  %7 = zext i8 %6 to i32
  %8 = and i32 %7, 128
  %9 = icmp eq i32 %8, 128
  br i1 %9, label %12, label %10

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 0)
  store i8 0, i8* %2, align 1
  br label %62

; <label>:12:                                     ; preds = %1
  %13 = load i8, i8* %3, align 1
  %14 = zext i8 %13 to i32
  %15 = and i32 %14, 124
  %16 = ashr i32 %15, 2
  %17 = trunc i32 %16 to i8
  store i8 %17, i8* %5, align 1
  %18 = load i8, i8* %5, align 1
  %19 = zext i8 %18 to i32
  %20 = icmp eq i32 %19, 1
  br i1 %20, label %56, label %21

; <label>:21:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 2)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 2)
  %23 = load i8, i8* %5, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp eq i32 %24, 2
  br i1 %25, label %56, label %26

; <label>:26:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 3)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 3)
  %28 = load i8, i8* %5, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp eq i32 %29, 5
  br i1 %30, label %56, label %31

; <label>:31:                                     ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 4)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 4)
  %33 = load i8, i8* %5, align 1
  %34 = zext i8 %33 to i32
  %35 = icmp eq i32 %34, 6
  br i1 %35, label %56, label %36

; <label>:36:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 5)
  %37 = add i64 %pgocount4, 1
  store i64 %37, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 5)
  %38 = load i8, i8* %5, align 1
  %39 = zext i8 %38 to i32
  %40 = icmp eq i32 %39, 10
  br i1 %40, label %56, label %41

; <label>:41:                                     ; preds = %36
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 6)
  %42 = add i64 %pgocount5, 1
  store i64 %42, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 6)
  %43 = load i8, i8* %5, align 1
  %44 = zext i8 %43 to i32
  %45 = icmp eq i32 %44, 11
  br i1 %45, label %56, label %46

; <label>:46:                                     ; preds = %41
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 7)
  %47 = add i64 %pgocount6, 1
  store i64 %47, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 7)
  %48 = load i8, i8* %5, align 1
  %49 = zext i8 %48 to i32
  %50 = icmp eq i32 %49, 8
  br i1 %50, label %56, label %51

; <label>:51:                                     ; preds = %46
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 8)
  %52 = add i64 %pgocount7, 1
  store i64 %52, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 8)
  %53 = load i8, i8* %5, align 1
  %54 = zext i8 %53 to i32
  %55 = icmp eq i32 %54, 9
  br label %56

; <label>:56:                                     ; preds = %51, %46, %41, %36, %31, %26, %21, %12
  %57 = phi i1 [ true, %46 ], [ true, %41 ], [ true, %36 ], [ true, %31 ], [ true, %26 ], [ true, %21 ], [ true, %12 ], [ %55, %51 ]
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 1)
  %58 = add i64 %pgocount8, 1
  store i64 %58, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_legal_ctb, i64 0, i64 1)
  %59 = zext i1 %57 to i32
  %60 = trunc i32 %59 to i8
  store i8 %60, i8* %4, align 1
  %61 = load i8, i8* %4, align 1
  store i8 %61, i8* %2, align 1
  br label %62

; <label>:62:                                     ; preds = %56, %10
  %63 = load i8, i8* %2, align 1
  ret i8 %63
}

; Function Attrs: noinline nounwind uwtable
define i32 @version_error(i32, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %4, align 4
  %7 = load i32, i32* %5, align 4
  %8 = icmp ne i32 %6, %7
  br i1 %8, label %9, label %14

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_version_error, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_version_error, i64 0, i64 0)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %12 = call i8* @LANG(i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.3, i32 0, i32 0))
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* %12)
  store i32 1, i32* %3, align 4
  br label %16

; <label>:14:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_version_error, i64 0, i64 1)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_version_error, i64 0, i64 1)
  store i32 0, i32* %3, align 4
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load i32, i32* %3, align 4
  ret i32 %17
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @LANG(i8*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @version_byte_error(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp ne i32 %4, 2
  br i1 %5, label %6, label %15

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_version_byte_error, i64 0, i64 1)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_version_byte_error, i64 0, i64 1)
  %8 = load i32, i32* %3, align 4
  %9 = icmp ne i32 %8, 3
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_version_byte_error, i64 0, i64 2)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_version_byte_error, i64 0, i64 2)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %13 = call i8* @LANG(i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.3, i32 0, i32 0))
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* %13)
  store i32 1, i32* %2, align 4
  br label %17

; <label>:15:                                     ; preds = %6, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_version_byte_error, i64 0, i64 0)
  %16 = add i64 %pgocount2, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_version_byte_error, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load i32, i32* %2, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind uwtable
define i64 @getpastlength(i8 zeroext, %struct._IO_FILE*) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8, align 1
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca [8 x i8], align 1
  store i8 %0, i8* %4, align 1
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  %9 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 8, i32 1, i1 false)
  store i64 0, i64* %6, align 8
  %10 = load i8, i8* %4, align 1
  %11 = zext i8 %10 to i32
  %12 = and i32 %11, 3
  %13 = shl i32 1, %12
  store i32 %13, i32* %7, align 4
  %14 = load i32, i32* %7, align 4
  %15 = icmp eq i32 %14, 8
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 0)
  store i64 -1, i64* %3, align 8
  br label %55

; <label>:18:                                     ; preds = %2
  %19 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i32 0, i32 0
  %20 = load i32, i32* %7, align 4
  %21 = zext i32 %20 to i64
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %23 = call i64 @fread(i8* %19, i64 1, i64 %21, %struct._IO_FILE* %22)
  %24 = load i32, i32* %7, align 4
  %25 = zext i32 %24 to i64
  %26 = icmp ult i64 %23, %25
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 1)
  store i64 -2, i64* %3, align 8
  br label %55

; <label>:29:                                     ; preds = %18
  %30 = load i32, i32* %7, align 4
  %31 = icmp eq i32 %30, 1
  br i1 %31, label %32, label %37

; <label>:32:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 3)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 3)
  %34 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i64 0, i64 0
  %35 = load i8, i8* %34, align 1
  %36 = zext i8 %35 to i64
  store i64 %36, i64* %6, align 8
  br label %37

; <label>:37:                                     ; preds = %32, %29
  %38 = load i32, i32* %7, align 4
  %39 = icmp eq i32 %38, 2
  br i1 %39, label %40, label %45

; <label>:40:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 4)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 4)
  %42 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i32 0, i32 0
  %43 = call zeroext i16 @fetch_word16(i8* %42)
  %44 = zext i16 %43 to i64
  store i64 %44, i64* %6, align 8
  br label %45

; <label>:45:                                     ; preds = %40, %37
  %46 = load i32, i32* %7, align 4
  %47 = icmp eq i32 %46, 4
  br i1 %47, label %48, label %52

; <label>:48:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 5)
  %49 = add i64 %pgocount4, 1
  store i64 %49, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 5)
  %50 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i32 0, i32 0
  %51 = call i64 @fetch_word32(i8* %50)
  store i64 %51, i64* %6, align 8
  br label %52

; <label>:52:                                     ; preds = %48, %45
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 2)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_getpastlength, i64 0, i64 2)
  %54 = load i64, i64* %6, align 8
  store i64 %54, i64* %3, align 8
  br label %55

; <label>:55:                                     ; preds = %52, %27, %16
  %56 = load i64, i64* %3, align 8
  ret i64 %56
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare zeroext i16 @fetch_word16(i8*) #1

declare i64 @fetch_word32(i8*) #1

; Function Attrs: noinline nounwind uwtable
define void @write_ctb_len(%struct._IO_FILE*, i8 zeroext, i64, i8 zeroext) #0 {
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i8, align 1
  %7 = alloca i64, align 8
  %8 = alloca i8, align 1
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8, align 1
  %12 = alloca [4 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %5, align 8
  store i8 %1, i8* %6, align 1
  store i64 %2, i64* %7, align 8
  store i8 %3, i8* %8, align 1
  %13 = load i8, i8* %8, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %20, label %16

; <label>:16:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 4)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 4)
  %18 = load i64, i64* %7, align 8
  %19 = icmp ugt i64 %18, 65535
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %16, %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 0)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 0)
  store i32 4, i32* %9, align 4
  store i32 2, i32* %10, align 4
  br label %32

; <label>:22:                                     ; preds = %16
  %23 = load i64, i64* %7, align 8
  %24 = trunc i64 %23 to i16
  %25 = zext i16 %24 to i32
  %26 = icmp sgt i32 %25, 255
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 5)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 5)
  store i32 2, i32* %9, align 4
  store i32 1, i32* %10, align 4
  br label %31

; <label>:29:                                     ; preds = %22
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 6)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 6)
  store i32 1, i32* %9, align 4
  store i32 0, i32* %10, align 4
  br label %31

; <label>:31:                                     ; preds = %29, %27
  br label %32

; <label>:32:                                     ; preds = %31, %20
  %33 = load i8, i8* %6, align 1
  %34 = zext i8 %33 to i32
  %35 = mul nsw i32 4, %34
  %36 = add nsw i32 128, %35
  %37 = load i32, i32* %10, align 4
  %38 = add nsw i32 %36, %37
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %40 = call i32 @_IO_putc(i32 %38, %struct._IO_FILE* %39)
  %41 = load i32, i32* %9, align 4
  %42 = icmp eq i32 %41, 1
  br i1 %42, label %43, label %48

; <label>:43:                                     ; preds = %32
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 1)
  %44 = add i64 %pgocount4, 1
  store i64 %44, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 1)
  %45 = load i64, i64* %7, align 8
  %46 = trunc i64 %45 to i8
  %47 = getelementptr inbounds [4 x i8], [4 x i8]* %12, i64 0, i64 0
  store i8 %46, i8* %47, align 1
  br label %48

; <label>:48:                                     ; preds = %43, %32
  %49 = load i32, i32* %9, align 4
  %50 = icmp eq i32 %49, 2
  br i1 %50, label %51, label %57

; <label>:51:                                     ; preds = %48
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 2)
  %52 = add i64 %pgocount5, 1
  store i64 %52, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 2)
  %53 = load i64, i64* %7, align 8
  %54 = trunc i64 %53 to i16
  %55 = getelementptr inbounds [4 x i8], [4 x i8]* %12, i32 0, i32 0
  %56 = call i8* @put_word16(i16 zeroext %54, i8* %55)
  br label %57

; <label>:57:                                     ; preds = %51, %48
  %58 = load i32, i32* %9, align 4
  %59 = icmp eq i32 %58, 4
  br i1 %59, label %60, label %65

; <label>:60:                                     ; preds = %57
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 3)
  %61 = add i64 %pgocount6, 1
  store i64 %61, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_write_ctb_len, i64 0, i64 3)
  %62 = load i64, i64* %7, align 8
  %63 = getelementptr inbounds [4 x i8], [4 x i8]* %12, i32 0, i32 0
  %64 = call i8* @put_word32(i64 %62, i8* %63)
  br label %65

; <label>:65:                                     ; preds = %60, %57
  %66 = getelementptr inbounds [4 x i8], [4 x i8]* %12, i32 0, i32 0
  %67 = load i32, i32* %9, align 4
  %68 = sext i32 %67 to i64
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %70 = call i64 @fwrite(i8* %66, i64 1, i64 %68, %struct._IO_FILE* %69)
  ret void
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

declare i8* @put_word16(i16 zeroext, i8*) #1

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @read_mpi(i16*, %struct._IO_FILE*, i8 zeroext, %struct.IdeaCfbContext*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i16*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i8, align 1
  %9 = alloca %struct.IdeaCfbContext*, align 8
  %10 = alloca [262 x i8], align 16
  %11 = alloca i32, align 4
  %12 = alloca i16, align 2
  %13 = alloca i16, align 2
  store i16* %0, i16** %6, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %7, align 8
  store i8 %2, i8* %8, align 1
  store %struct.IdeaCfbContext* %3, %struct.IdeaCfbContext** %9, align 8
  %14 = load i16*, i16** %6, align 8
  call void @mp_init(i16* %14, i16 zeroext 0)
  %15 = getelementptr inbounds [262 x i8], [262 x i8]* %10, i32 0, i32 0
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %17 = call i64 @fread(i8* %15, i64 1, i64 2, %struct._IO_FILE* %16)
  %18 = trunc i64 %17 to i32
  store i32 %18, i32* %11, align 4
  %19 = icmp ult i32 %18, 2
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 0)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 0)
  store i32 -1, i32* %5, align 4
  br label %113

; <label>:22:                                     ; preds = %4
  %23 = getelementptr inbounds [262 x i8], [262 x i8]* %10, i32 0, i32 0
  %24 = call zeroext i16 @fetch_word16(i8* %23)
  store i16 %24, i16* %13, align 2
  %25 = load i16, i16* %13, align 2
  %26 = zext i16 %25 to i32
  %27 = add nsw i32 %26, 15
  %28 = ashr i32 %27, 4
  %29 = load i16, i16* @global_precision, align 2
  %30 = sext i16 %29 to i32
  %31 = icmp sgt i32 %28, %30
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 1)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 1)
  store i32 -1, i32* %5, align 4
  br label %113

; <label>:34:                                     ; preds = %22
  %35 = load i16, i16* %13, align 2
  %36 = zext i16 %35 to i32
  %37 = add nsw i32 %36, 7
  %38 = ashr i32 %37, 3
  %39 = trunc i32 %38 to i16
  store i16 %39, i16* %12, align 2
  %40 = getelementptr inbounds [262 x i8], [262 x i8]* %10, i32 0, i32 0
  %41 = getelementptr inbounds i8, i8* %40, i64 2
  %42 = load i16, i16* %12, align 2
  %43 = zext i16 %42 to i64
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %45 = call i64 @fread(i8* %41, i64 1, i64 %43, %struct._IO_FILE* %44)
  %46 = trunc i64 %45 to i32
  store i32 %46, i32* %11, align 4
  %47 = load i32, i32* %11, align 4
  %48 = load i16, i16* %12, align 2
  %49 = zext i16 %48 to i32
  %50 = icmp ult i32 %47, %49
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 2)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 2)
  store i32 -1, i32* %5, align 4
  br label %113

; <label>:53:                                     ; preds = %34
  %54 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %9, align 8
  %55 = icmp ne %struct.IdeaCfbContext* %54, null
  br i1 %55, label %56, label %66

; <label>:56:                                     ; preds = %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 3)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 3)
  %58 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %9, align 8
  call void @ideaCfbSync(%struct.IdeaCfbContext* %58)
  %59 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %9, align 8
  %60 = getelementptr inbounds [262 x i8], [262 x i8]* %10, i32 0, i32 0
  %61 = getelementptr inbounds i8, i8* %60, i64 2
  %62 = getelementptr inbounds [262 x i8], [262 x i8]* %10, i32 0, i32 0
  %63 = getelementptr inbounds i8, i8* %62, i64 2
  %64 = load i16, i16* %12, align 2
  %65 = zext i16 %64 to i32
  call void @ideaCfbDecrypt(%struct.IdeaCfbContext* %59, i8* %61, i8* %63, i32 %65)
  br label %66

; <label>:66:                                     ; preds = %56, %53
  %67 = getelementptr inbounds [262 x i8], [262 x i8]* %10, i32 0, i32 0
  %68 = load i16, i16* %12, align 2
  %69 = zext i16 %68 to i32
  %70 = add nsw i32 %69, 2
  %71 = trunc i32 %70 to i16
  %72 = call zeroext i16 @checksum(i8* %67, i16 zeroext %71)
  %73 = zext i16 %72 to i32
  %74 = load i16, i16* @mpi_checksum, align 2
  %75 = zext i16 %74 to i32
  %76 = add nsw i32 %75, %73
  %77 = trunc i32 %76 to i16
  store i16 %77, i16* @mpi_checksum, align 2
  %78 = load i8, i8* %8, align 1
  %79 = zext i8 %78 to i32
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %100

; <label>:81:                                     ; preds = %66
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 4)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 4)
  %83 = load i16, i16* %12, align 2
  %84 = zext i16 %83 to i32
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %86, label %100

; <label>:86:                                     ; preds = %81
  %87 = load i16, i16* %13, align 2
  %88 = zext i16 %87 to i32
  %89 = icmp sgt i32 %88, 2080
  br i1 %89, label %90, label %92

; <label>:90:                                     ; preds = %86
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 7)
  %91 = add i64 %pgocount5, 1
  store i64 %91, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 7)
  store i32 -1, i32* %5, align 4
  br label %113

; <label>:92:                                     ; preds = %86
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 8)
  %93 = add i64 %pgocount6, 1
  store i64 %93, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 8)
  %94 = load i16, i16* %13, align 2
  %95 = zext i16 %94 to i32
  %96 = add nsw i32 %95, 0
  %97 = add nsw i32 %96, 15
  %98 = ashr i32 %97, 4
  %99 = trunc i32 %98 to i16
  store i16 %99, i16* @global_precision, align 2
  br label %100

; <label>:100:                                    ; preds = %92, %81, %66
  %101 = load i16*, i16** %6, align 8
  %102 = getelementptr inbounds [262 x i8], [262 x i8]* %10, i32 0, i32 0
  %103 = call signext i16 @mpi2reg(i16* %101, i8* %102)
  %104 = sext i16 %103 to i32
  %105 = icmp eq i32 %104, -1
  br i1 %105, label %106, label %108

; <label>:106:                                    ; preds = %100
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 6)
  %107 = add i64 %pgocount7, 1
  store i64 %107, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 6)
  store i32 -1, i32* %5, align 4
  br label %113

; <label>:108:                                    ; preds = %100
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 5)
  %109 = add i64 %pgocount8, 1
  store i64 %109, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_read_mpi, i64 0, i64 5)
  %110 = bitcast [262 x i8]* %10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %110, i8 0, i64 262, i32 16, i1 false)
  %111 = load i16, i16* %13, align 2
  %112 = zext i16 %111 to i32
  store i32 %112, i32* %5, align 4
  br label %113

; <label>:113:                                    ; preds = %108, %106, %90, %51, %32, %20
  %114 = load i32, i32* %5, align 4
  ret i32 %114
}

declare void @mp_init(i16*, i16 zeroext) #1

declare void @ideaCfbSync(%struct.IdeaCfbContext*) #1

declare void @ideaCfbDecrypt(%struct.IdeaCfbContext*, i8*, i8*, i32) #1

declare zeroext i16 @checksum(i8*, i16 zeroext) #1

declare signext i16 @mpi2reg(i16*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define void @write_mpi(i16*, %struct._IO_FILE*, %struct.IdeaCfbContext*) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca %struct.IdeaCfbContext*, align 8
  %7 = alloca [262 x i8], align 16
  %8 = alloca i16, align 2
  store i16* %0, i16** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  store %struct.IdeaCfbContext* %2, %struct.IdeaCfbContext** %6, align 8
  %9 = getelementptr inbounds [262 x i8], [262 x i8]* %7, i32 0, i32 0
  %10 = load i16*, i16** %4, align 8
  %11 = call signext i16 @reg2mpi(i8* %9, i16* %10)
  store i16 %11, i16* %8, align 2
  %12 = getelementptr inbounds [262 x i8], [262 x i8]* %7, i32 0, i32 0
  %13 = load i16, i16* %8, align 2
  %14 = sext i16 %13 to i32
  %15 = add nsw i32 %14, 2
  %16 = trunc i32 %15 to i16
  %17 = call zeroext i16 @checksum(i8* %12, i16 zeroext %16)
  %18 = zext i16 %17 to i32
  %19 = load i16, i16* @mpi_checksum, align 2
  %20 = zext i16 %19 to i32
  %21 = add nsw i32 %20, %18
  %22 = trunc i32 %21 to i16
  store i16 %22, i16* @mpi_checksum, align 2
  %23 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %6, align 8
  %24 = icmp ne %struct.IdeaCfbContext* %23, null
  br i1 %24, label %25, label %35

; <label>:25:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_write_mpi, i64 0, i64 1)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_write_mpi, i64 0, i64 1)
  %27 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %6, align 8
  call void @ideaCfbSync(%struct.IdeaCfbContext* %27)
  %28 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %6, align 8
  %29 = getelementptr inbounds [262 x i8], [262 x i8]* %7, i32 0, i32 0
  %30 = getelementptr inbounds i8, i8* %29, i64 2
  %31 = getelementptr inbounds [262 x i8], [262 x i8]* %7, i32 0, i32 0
  %32 = getelementptr inbounds i8, i8* %31, i64 2
  %33 = load i16, i16* %8, align 2
  %34 = sext i16 %33 to i32
  call void @ideaCfbEncrypt(%struct.IdeaCfbContext* %28, i8* %30, i8* %32, i32 %34)
  br label %35

; <label>:35:                                     ; preds = %25, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_write_mpi, i64 0, i64 0)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_write_mpi, i64 0, i64 0)
  %37 = getelementptr inbounds [262 x i8], [262 x i8]* %7, i32 0, i32 0
  %38 = load i16, i16* %8, align 2
  %39 = sext i16 %38 to i32
  %40 = add nsw i32 %39, 2
  %41 = sext i32 %40 to i64
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %43 = call i64 @fwrite(i8* %37, i64 1, i64 %41, %struct._IO_FILE* %42)
  %44 = bitcast [262 x i8]* %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %44, i8 0, i64 262, i32 16, i1 false)
  ret void
}

declare signext i16 @reg2mpi(i8*, i16*) #1

declare void @ideaCfbEncrypt(%struct.IdeaCfbContext*, i8*, i8*, i32) #1

; Function Attrs: noinline nounwind uwtable
define i32 @get_header_info_from_file(i8*, i8*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct._IO_FILE*, align 8
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %9 = load i8*, i8** %6, align 8
  %10 = load i32, i32* %7, align 4
  %11 = sext i32 %10 to i64
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %11, i32 1, i1 false)
  %12 = load i8*, i8** %5, align 8
  %13 = call %struct._IO_FILE* @fopen(i8* %12, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %13, %struct._IO_FILE** %8, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_get_header_info_from_file, i64 0, i64 1)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_get_header_info_from_file, i64 0, i64 1)
  store i32 -1, i32* %4, align 4
  br label %28

; <label>:17:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_get_header_info_from_file, i64 0, i64 0)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_get_header_info_from_file, i64 0, i64 0)
  %19 = load i8*, i8** %6, align 8
  %20 = load i32, i32* %7, align 4
  %21 = sext i32 %20 to i64
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %23 = call i64 @fread(i8* %19, i64 1, i64 %21, %struct._IO_FILE* %22)
  %24 = trunc i64 %23 to i32
  store i32 %24, i32* %7, align 4
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %26 = call i32 @fclose(%struct._IO_FILE* %25)
  %27 = load i32, i32* %7, align 4
  store i32 %27, i32* %4, align 4
  br label %28

; <label>:28:                                     ; preds = %17, %15
  %29 = load i32, i32* %4, align 4
  ret i32 %29
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @signfile(i8 zeroext, i8 zeroext, i8*, i8*, i8*, i8 signext, i8*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i8, align 1
  %15 = alloca i8*, align 8
  %16 = alloca %struct._IO_FILE*, align 8
  %17 = alloca %struct._IO_FILE*, align 8
  %18 = alloca i32, align 4
  %19 = alloca [286 x i8], align 16
  %20 = alloca [256 x i8], align 16
  %21 = alloca i8, align 1
  %22 = alloca i64, align 8
  %23 = alloca i8*, align 8
  %24 = alloca [256 x i8], align 16
  %25 = alloca [256 x i8], align 16
  %26 = alloca i32, align 4
  %27 = alloca %struct.MD5Context, align 8
  %28 = alloca [8 x i8], align 1
  %29 = alloca [130 x i16], align 16
  %30 = alloca [130 x i16], align 16
  %31 = alloca [130 x i16], align 16
  %32 = alloca [130 x i16], align 16
  %33 = alloca [130 x i16], align 16
  %34 = alloca [130 x i16], align 16
  %35 = alloca i64, align 8
  %36 = alloca i64, align 8
  store i8 %0, i8* %9, align 1
  store i8 %1, i8* %10, align 1
  store i8* %2, i8** %11, align 8
  store i8* %3, i8** %12, align 8
  store i8* %4, i8** %13, align 8
  store i8 %5, i8* %14, align 1
  store i8* %6, i8** %15, align 8
  %37 = bitcast i64* %22 to i8*
  store i8* %37, i8** %23, align 8
  store i16 130, i16* @global_precision, align 2
  %38 = load i8, i8* @verbose, align 1
  %39 = icmp ne i8 %38, 0
  br i1 %39, label %40, label %50

; <label>:40:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 0)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 0)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %43 = load i8*, i8** %12, align 8
  %44 = load i8*, i8** %13, align 8
  %45 = load i8, i8* %14, align 1
  %46 = call signext i8 @EXT_C(i8 signext %45)
  %47 = sext i8 %46 to i32
  %48 = load i8*, i8** %15, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.5, i32 0, i32 0), i8* %43, i8* %44, i32 %47, i8* %48)
  br label %50

; <label>:50:                                     ; preds = %40, %7
  %51 = load i8*, i8** %12, align 8
  %52 = call i32 @MDfile(%struct.MD5Context* %27, i8* %51)
  %53 = icmp slt i32 %52, 0
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %50
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 2)
  %55 = add i64 %pgocount1, 1
  store i64 %55, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 2)
  store i32 -1, i32* %8, align 4
  br label %220

; <label>:56:                                     ; preds = %50
  %57 = getelementptr inbounds [256 x i8], [256 x i8]* %24, i64 0, i64 0
  store i8 0, i8* %57, align 16
  %58 = load i8*, i8** %11, align 8
  %59 = icmp ne i8* %58, null
  br i1 %59, label %60, label %65

; <label>:60:                                     ; preds = %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 1)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 1)
  %62 = getelementptr inbounds [256 x i8], [256 x i8]* %24, i32 0, i32 0
  %63 = load i8*, i8** %11, align 8
  %64 = call i8* @strcpy(i8* %62, i8* %63) #5
  br label %65

; <label>:65:                                     ; preds = %60, %56
  %66 = load i8*, i8** %23, align 8
  %67 = getelementptr inbounds [256 x i8], [256 x i8]* %24, i32 0, i32 0
  %68 = getelementptr inbounds [130 x i16], [130 x i16]* %29, i32 0, i32 0
  %69 = getelementptr inbounds [130 x i16], [130 x i16]* %30, i32 0, i32 0
  %70 = getelementptr inbounds [130 x i16], [130 x i16]* %31, i32 0, i32 0
  %71 = getelementptr inbounds [130 x i16], [130 x i16]* %32, i32 0, i32 0
  %72 = getelementptr inbounds [130 x i16], [130 x i16]* %33, i32 0, i32 0
  %73 = getelementptr inbounds [130 x i16], [130 x i16]* %34, i32 0, i32 0
  %74 = call i32 @getsecretkey(i32 0, i8* null, i8* null, i8* %66, i8* null, i8* null, i8* %67, i16* %68, i16* %69, i16* %70, i16* %71, i16* %72, i16* %73)
  %75 = icmp slt i32 %74, 0
  br i1 %75, label %76, label %78

; <label>:76:                                     ; preds = %65
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 3)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 3)
  store i32 -1, i32* %8, align 4
  br label %220

; <label>:78:                                     ; preds = %65
  %79 = getelementptr inbounds [8 x i8], [8 x i8]* %28, i32 0, i32 0
  %80 = getelementptr inbounds [130 x i16], [130 x i16]* %29, i32 0, i32 0
  call void @extract_keyID(i8* %79, i16* %80)
  %81 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  %82 = call i8* @strcpy(i8* %81, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #5
  %83 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  %84 = getelementptr inbounds [8 x i8], [8 x i8]* %28, i32 0, i32 0
  %85 = load i8*, i8** %23, align 8
  %86 = getelementptr inbounds [256 x i8], [256 x i8]* %24, i32 0, i32 0
  %87 = getelementptr inbounds [130 x i16], [130 x i16]* %29, i32 0, i32 0
  %88 = getelementptr inbounds [130 x i16], [130 x i16]* %30, i32 0, i32 0
  %89 = call i32 @getpublickey(i32 4, i8* %83, i64* null, i32* null, i8* %84, i8* %85, i8* %86, i16* %87, i16* %88)
  store i32 %89, i32* %26, align 4
  %90 = icmp slt i32 %89, 0
  br i1 %90, label %91, label %93

; <label>:91:                                     ; preds = %78
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 4)
  %92 = add i64 %pgocount4, 1
  store i64 %92, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 4)
  store i32 -1, i32* %8, align 4
  br label %220

; <label>:93:                                     ; preds = %78
  %94 = load i8, i8* %14, align 1
  %95 = sext i8 %94 to i32
  %96 = icmp eq i32 %95, 116
  br i1 %96, label %97, label %98

; <label>:97:                                     ; preds = %93
  store i8 1, i8* %21, align 1
  br label %100

; <label>:98:                                     ; preds = %93
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 5)
  %99 = add i64 %pgocount5, 1
  store i64 %99, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 5)
  store i8 0, i8* %21, align 1
  br label %100

; <label>:100:                                    ; preds = %98, %97
  %101 = getelementptr inbounds [286 x i8], [286 x i8]* %19, i32 0, i32 0
  %102 = load i8, i8* %21, align 1
  %103 = getelementptr inbounds [130 x i16], [130 x i16]* %30, i32 0, i32 0
  %104 = getelementptr inbounds [130 x i16], [130 x i16]* %31, i32 0, i32 0
  %105 = getelementptr inbounds [130 x i16], [130 x i16]* %32, i32 0, i32 0
  %106 = getelementptr inbounds [130 x i16], [130 x i16]* %33, i32 0, i32 0
  %107 = getelementptr inbounds [130 x i16], [130 x i16]* %34, i32 0, i32 0
  %108 = getelementptr inbounds [130 x i16], [130 x i16]* %29, i32 0, i32 0
  %109 = call i32 @make_signature_certificate(i8* %101, %struct.MD5Context* %27, i8 zeroext %102, i16* %103, i16* %104, i16* %105, i16* %106, i16* %107, i16* %108)
  store i32 %109, i32* %18, align 4
  %110 = load i32, i32* %18, align 4
  %111 = icmp slt i32 %110, 0
  br i1 %111, label %112, label %114

; <label>:112:                                    ; preds = %100
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 6)
  %113 = add i64 %pgocount6, 1
  store i64 %113, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 6)
  store i32 -1, i32* %8, align 4
  br label %220

; <label>:114:                                    ; preds = %100
  %115 = load i8*, i8** %12, align 8
  %116 = call %struct._IO_FILE* @fopen(i8* %115, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %116, %struct._IO_FILE** %16, align 8
  %117 = icmp eq %struct._IO_FILE* %116, null
  br i1 %117, label %118, label %124

; <label>:118:                                    ; preds = %114
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 7)
  %119 = add i64 %pgocount7, 1
  store i64 %119, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 7)
  %120 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %121 = call i8* @LANG(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i32 0, i32 0))
  %122 = load i8*, i8** %12, align 8
  %123 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %120, i8* %121, i8* %122)
  store i32 -1, i32* %8, align 4
  br label %220

; <label>:124:                                    ; preds = %114
  %125 = load i8*, i8** %13, align 8
  %126 = call %struct._IO_FILE* @fopen(i8* %125, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %126, %struct._IO_FILE** %17, align 8
  %127 = icmp eq %struct._IO_FILE* %126, null
  br i1 %127, label %128, label %136

; <label>:128:                                    ; preds = %124
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 9)
  %129 = add i64 %pgocount8, 1
  store i64 %129, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 9)
  %130 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %131 = call i8* @LANG(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.8, i32 0, i32 0))
  %132 = load i8*, i8** %13, align 8
  %133 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %130, i8* %131, i8* %132)
  %134 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %135 = call i32 @fclose(%struct._IO_FILE* %134)
  store i32 -1, i32* %8, align 4
  br label %220

; <label>:136:                                    ; preds = %124
  %137 = getelementptr inbounds [286 x i8], [286 x i8]* %19, i32 0, i32 0
  %138 = load i32, i32* %18, align 4
  %139 = sext i32 %138 to i64
  %140 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %141 = call i64 @fwrite(i8* %137, i64 1, i64 %139, %struct._IO_FILE* %140)
  %142 = load i8*, i8** %15, align 8
  %143 = icmp eq i8* %142, null
  br i1 %143, label %144, label %147

; <label>:144:                                    ; preds = %136
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 10)
  %145 = add i64 %pgocount9, 1
  store i64 %145, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 10)
  %146 = getelementptr inbounds [256 x i8], [256 x i8]* %20, i64 0, i64 0
  store i8 0, i8* %146, align 16
  br label %153

; <label>:147:                                    ; preds = %136
  %148 = getelementptr inbounds [256 x i8], [256 x i8]* %20, i32 0, i32 0
  %149 = load i8*, i8** %15, align 8
  %150 = call i8* @strcpy(i8* %148, i8* %149) #5
  %151 = getelementptr inbounds [256 x i8], [256 x i8]* %20, i32 0, i32 0
  call void @file_to_canon(i8* %151)
  %152 = getelementptr inbounds [256 x i8], [256 x i8]* %20, i32 0, i32 0
  call void @CToPascal(i8* %152)
  br label %153

; <label>:153:                                    ; preds = %147, %144
  %154 = load i8, i8* %10, align 1
  %155 = icmp ne i8 %154, 0
  br i1 %155, label %206, label %156

; <label>:156:                                    ; preds = %153
  %157 = load i8, i8* %9, align 1
  %158 = icmp ne i8 %157, 0
  br i1 %158, label %201, label %159

; <label>:159:                                    ; preds = %156
  %160 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %161 = call i64 @fsize(%struct._IO_FILE* %160)
  store i64 %161, i64* %35, align 8
  store i64 0, i64* %36, align 8
  %162 = load i8, i8* %14, align 1
  %163 = sext i8 %162 to i32
  %164 = icmp eq i32 %163, 108
  br i1 %164, label %165, label %168

; <label>:165:                                    ; preds = %159
  %166 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %167 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %166, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.9, i32 0, i32 0))
  br label %177

; <label>:168:                                    ; preds = %159
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 13)
  %169 = add i64 %pgocount10, 1
  store i64 %169, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 13)
  %170 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %171 = load i64, i64* %35, align 8
  %172 = getelementptr inbounds [256 x i8], [256 x i8]* %20, i64 0, i64 0
  %173 = load i8, i8* %172, align 16
  %174 = zext i8 %173 to i64
  %175 = add i64 %171, %174
  %176 = add i64 %175, 6
  call void @write_ctb_len(%struct._IO_FILE* %170, i8 zeroext 11, i64 %176, i8 zeroext 0)
  br label %177

; <label>:177:                                    ; preds = %168, %165
  %178 = load i8, i8* %14, align 1
  %179 = sext i8 %178 to i32
  %180 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %181 = call i32 @_IO_putc(i32 %179, %struct._IO_FILE* %180)
  %182 = load i8, i8* %14, align 1
  %183 = sext i8 %182 to i32
  %184 = icmp eq i32 %183, 108
  br i1 %184, label %185, label %187

; <label>:185:                                    ; preds = %177
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 14)
  %186 = add i64 %pgocount11, 1
  store i64 %186, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 14)
  br label %200

; <label>:187:                                    ; preds = %177
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 15)
  %188 = add i64 %pgocount12, 1
  store i64 %188, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 15)
  %189 = getelementptr inbounds [256 x i8], [256 x i8]* %20, i32 0, i32 0
  %190 = getelementptr inbounds [256 x i8], [256 x i8]* %20, i64 0, i64 0
  %191 = load i8, i8* %190, align 16
  %192 = zext i8 %191 to i32
  %193 = add nsw i32 %192, 1
  %194 = sext i32 %193 to i64
  %195 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %196 = call i64 @fwrite(i8* %189, i64 1, i64 %194, %struct._IO_FILE* %195)
  %197 = bitcast i64* %36 to i8*
  %198 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %199 = call i64 @fwrite(i8* %197, i64 1, i64 8, %struct._IO_FILE* %198)
  br label %200

; <label>:200:                                    ; preds = %187, %185
  br label %201

; <label>:201:                                    ; preds = %200, %156
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 11)
  %202 = add i64 %pgocount13, 1
  store i64 %202, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 11)
  %203 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %204 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %205 = call i32 @copyfile(%struct._IO_FILE* %203, %struct._IO_FILE* %204, i64 -1)
  br label %206

; <label>:206:                                    ; preds = %201, %153
  %207 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %208 = call i32 @fclose(%struct._IO_FILE* %207)
  %209 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %210 = call i32 @write_error(%struct._IO_FILE* %209)
  %211 = icmp ne i32 %210, 0
  br i1 %211, label %212, label %216

; <label>:212:                                    ; preds = %206
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 8)
  %213 = add i64 %pgocount14, 1
  store i64 %213, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 8)
  %214 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %215 = call i32 @fclose(%struct._IO_FILE* %214)
  store i32 -1, i32* %8, align 4
  br label %220

; <label>:216:                                    ; preds = %206
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 12)
  %217 = add i64 %pgocount15, 1
  store i64 %217, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_signfile, i64 0, i64 12)
  %218 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %219 = call i32 @fclose(%struct._IO_FILE* %218)
  store i32 0, i32* %8, align 4
  br label %220

; <label>:220:                                    ; preds = %216, %212, %128, %118, %112, %91, %76, %54
  %221 = load i32, i32* %8, align 4
  ret i32 %221
}

declare signext i8 @EXT_C(i8 signext) #1

declare i32 @MDfile(%struct.MD5Context*, i8*) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

declare i32 @getsecretkey(i32, i8*, i8*, i8*, i8*, i8*, i8*, i16*, i16*, i16*, i16*, i16*, i16*) #1

declare void @extract_keyID(i8*, i16*) #1

declare i32 @getpublickey(i32, i8*, i64*, i32*, i8*, i8*, i8*, i16*, i16*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @make_signature_certificate(i8*, %struct.MD5Context*, i8 zeroext, i16*, i16*, i16*, i16*, i16*, i16*) #0 {
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca %struct.MD5Context*, align 8
  %13 = alloca i8, align 1
  %14 = alloca i16*, align 8
  %15 = alloca i16*, align 8
  %16 = alloca i16*, align 8
  %17 = alloca i16*, align 8
  %18 = alloca i16*, align 8
  %19 = alloca i16*, align 8
  %20 = alloca [260 x i8], align 16
  %21 = alloca [262 x i8], align 16
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i16, align 2
  %28 = alloca i64, align 8
  %29 = alloca i8*, align 8
  %30 = alloca [8 x i8], align 1
  %31 = alloca i8, align 1
  %32 = alloca i32, align 4
  store i8* %0, i8** %11, align 8
  store %struct.MD5Context* %1, %struct.MD5Context** %12, align 8
  store i8 %2, i8* %13, align 1
  store i16* %3, i16** %14, align 8
  store i16* %4, i16** %15, align 8
  store i16* %5, i16** %16, align 8
  store i16* %6, i16** %17, align 8
  store i16* %7, i16** %18, align 8
  store i16* %8, i16** %19, align 8
  %33 = bitcast i64* %28 to i8*
  store i8* %33, i8** %29, align 8
  store i32 5, i32* %32, align 4
  %34 = load i16*, i16** %19, align 8
  %35 = call i32 @countbits(i16* %34)
  %36 = add nsw i32 %35, 7
  %37 = ashr i32 %36, 3
  %38 = sub nsw i32 %37, 1
  store i32 %38, i32* %25, align 4
  %39 = load i32, i32* %25, align 4
  %40 = icmp slt i32 %39, 31
  br i1 %40, label %41, label %45

; <label>:41:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 3)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 3)
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.84, i32 0, i32 0))
  store i32 -1, i32* %10, align 4
  br label %247

; <label>:45:                                     ; preds = %9
  %46 = load i8*, i8** %29, align 8
  %47 = call i64 @get_timestamp(i8* %46)
  %48 = load i64, i64* %28, align 8
  %49 = icmp ult i64 %48, 662716800
  br i1 %49, label %50, label %55

; <label>:50:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 4)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 4)
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %53 = call i8* @LANG(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.85, i32 0, i32 0))
  %54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* %53)
  store i32 -1, i32* %10, align 4
  br label %247

; <label>:55:                                     ; preds = %45
  %56 = load i8*, i8** %29, align 8
  call void @hiloswap(i8* %56, i16 signext 4)
  %57 = load %struct.MD5Context*, %struct.MD5Context** %12, align 8
  call void @MD_addbuffer(%struct.MD5Context* %57, i8* %13, i32 1, i8* null)
  %58 = load %struct.MD5Context*, %struct.MD5Context** %12, align 8
  %59 = load i8*, i8** %29, align 8
  call void @MD_addbuffer(%struct.MD5Context* %58, i8* %59, i32 4, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @md5buf, i32 0, i32 0))
  store i8 1, i8* @already_have_md5, align 1
  %60 = load i8, i8* @quietmode, align 1
  %61 = icmp ne i8 %60, 0
  br i1 %61, label %69, label %62

; <label>:62:                                     ; preds = %55
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 6)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 6)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %65 = call i8* @LANG(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.52, i32 0, i32 0))
  %66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* %65)
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %68 = call i32 @fflush(%struct._IO_FILE* %67)
  br label %69

; <label>:69:                                     ; preds = %62, %55
  %70 = getelementptr inbounds [262 x i8], [262 x i8]* %21, i32 0, i32 0
  %71 = bitcast i8* %70 to i16*
  %72 = load i16*, i16** %14, align 8
  %73 = load i16*, i16** %15, align 8
  %74 = load i16*, i16** %16, align 8
  %75 = load i16*, i16** %17, align 8
  %76 = load i16*, i16** %18, align 8
  %77 = load i16*, i16** %19, align 8
  %78 = call i32 @rsa_private_encrypt(i16* %71, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @md5buf, i32 0, i32 0), i16 signext 16, i16* %72, i16* %73, i16* %74, i16* %75, i16* %76, i16* %77)
  store i32 %78, i32* %22, align 4
  %79 = load i32, i32* %22, align 4
  %80 = icmp slt i32 %79, 0
  br i1 %80, label %81, label %103

; <label>:81:                                     ; preds = %69
  %82 = load i32, i32* %22, align 4
  %83 = icmp eq i32 %82, -4
  br i1 %83, label %84, label %88

; <label>:84:                                     ; preds = %81
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 8)
  %85 = add i64 %pgocount3, 1
  store i64 %85, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 8)
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %87 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %86, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.84, i32 0, i32 0))
  br label %101

; <label>:88:                                     ; preds = %81
  %89 = load i32, i32* %22, align 4
  %90 = icmp eq i32 %89, -3
  br i1 %90, label %91, label %95

; <label>:91:                                     ; preds = %88
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 9)
  %92 = add i64 %pgocount4, 1
  store i64 %92, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 9)
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %94 = call i32 @fputs(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @.str.63, i32 0, i32 0), %struct._IO_FILE* %93)
  br label %100

; <label>:95:                                     ; preds = %88
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 10)
  %96 = add i64 %pgocount5, 1
  store i64 %96, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 10)
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %98 = load i32, i32* %22, align 4
  %99 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %97, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.86, i32 0, i32 0), i32 %98)
  br label %100

; <label>:100:                                    ; preds = %95, %91
  br label %101

; <label>:101:                                    ; preds = %100, %84
  %102 = load i32, i32* %22, align 4
  store i32 %102, i32* %10, align 4
  br label %247

; <label>:103:                                    ; preds = %69
  %104 = getelementptr inbounds [262 x i8], [262 x i8]* %21, i32 0, i32 0
  %105 = getelementptr inbounds [262 x i8], [262 x i8]* %21, i32 0, i32 0
  %106 = bitcast i8* %105 to i16*
  %107 = call signext i16 @reg2mpi(i8* %104, i16* %106)
  %108 = sext i16 %107 to i32
  store i32 %108, i32* %26, align 4
  store i32 0, i32* %24, align 4
  %109 = load i8*, i8** %11, align 8
  %110 = load i32, i32* %24, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %24, align 4
  %112 = sext i32 %110 to i64
  %113 = getelementptr inbounds i8, i8* %109, i64 %112
  store i8 -119, i8* %113, align 1
  %114 = load i32, i32* %32, align 4
  %115 = add nsw i32 2, %114
  %116 = add nsw i32 %115, 8
  %117 = add nsw i32 %116, 1
  %118 = add nsw i32 %117, 1
  %119 = add nsw i32 %118, 2
  %120 = load i32, i32* %26, align 4
  %121 = add nsw i32 %119, %120
  %122 = add nsw i32 %121, 2
  %123 = trunc i32 %122 to i16
  store i16 %123, i16* %27, align 2
  %124 = load i16, i16* %27, align 2
  %125 = load i8*, i8** %11, align 8
  %126 = load i32, i32* %24, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i8, i8* %125, i64 %127
  %129 = call i8* @put_word16(i16 zeroext %124, i8* %128)
  %130 = load i32, i32* %24, align 4
  %131 = add nsw i32 %130, 2
  store i32 %131, i32* %24, align 4
  %132 = load i32, i32* @version_byte, align 4
  %133 = trunc i32 %132 to i8
  %134 = load i8*, i8** %11, align 8
  %135 = load i32, i32* %24, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, i32* %24, align 4
  %137 = sext i32 %135 to i64
  %138 = getelementptr inbounds i8, i8* %134, i64 %137
  store i8 %133, i8* %138, align 1
  %139 = load i32, i32* %32, align 4
  %140 = trunc i32 %139 to i8
  %141 = load i8*, i8** %11, align 8
  %142 = load i32, i32* %24, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %24, align 4
  %144 = sext i32 %142 to i64
  %145 = getelementptr inbounds i8, i8* %141, i64 %144
  store i8 %140, i8* %145, align 1
  %146 = load i8, i8* %13, align 1
  %147 = zext i8 %146 to i32
  %148 = and i32 %147, 255
  %149 = trunc i32 %148 to i8
  %150 = load i8*, i8** %11, align 8
  %151 = load i32, i32* %24, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* %24, align 4
  %153 = sext i32 %151 to i64
  %154 = getelementptr inbounds i8, i8* %150, i64 %153
  store i8 %149, i8* %154, align 1
  store i32 0, i32* %23, align 4
  br label %155

; <label>:155:                                    ; preds = %170, %103
  %156 = load i32, i32* %23, align 4
  %157 = icmp slt i32 %156, 4
  br i1 %157, label %158, label %173

; <label>:158:                                    ; preds = %155
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 0)
  %159 = add i64 %pgocount6, 1
  store i64 %159, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 0)
  %160 = load i8*, i8** %29, align 8
  %161 = load i32, i32* %23, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i8, i8* %160, i64 %162
  %164 = load i8, i8* %163, align 1
  %165 = load i8*, i8** %11, align 8
  %166 = load i32, i32* %24, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, i32* %24, align 4
  %168 = sext i32 %166 to i64
  %169 = getelementptr inbounds i8, i8* %165, i64 %168
  store i8 %164, i8* %169, align 1
  br label %170

; <label>:170:                                    ; preds = %158
  %171 = load i32, i32* %23, align 4
  %172 = add nsw i32 %171, 1
  store i32 %172, i32* %23, align 4
  br label %155

; <label>:173:                                    ; preds = %155
  %174 = getelementptr inbounds [8 x i8], [8 x i8]* %30, i32 0, i32 0
  %175 = load i16*, i16** %19, align 8
  call void @extract_keyID(i8* %174, i16* %175)
  store i32 0, i32* %22, align 4
  br label %176

; <label>:176:                                    ; preds = %190, %173
  %177 = load i32, i32* %22, align 4
  %178 = icmp slt i32 %177, 8
  br i1 %178, label %179, label %193

; <label>:179:                                    ; preds = %176
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 1)
  %180 = add i64 %pgocount7, 1
  store i64 %180, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 1)
  %181 = load i32, i32* %22, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [8 x i8], [8 x i8]* %30, i64 0, i64 %182
  %184 = load i8, i8* %183, align 1
  %185 = load i8*, i8** %11, align 8
  %186 = load i32, i32* %24, align 4
  %187 = add nsw i32 %186, 1
  store i32 %187, i32* %24, align 4
  %188 = sext i32 %186 to i64
  %189 = getelementptr inbounds i8, i8* %185, i64 %188
  store i8 %184, i8* %189, align 1
  br label %190

; <label>:190:                                    ; preds = %179
  %191 = load i32, i32* %22, align 4
  %192 = add nsw i32 %191, 1
  store i32 %192, i32* %22, align 4
  br label %176

; <label>:193:                                    ; preds = %176
  %194 = load i8*, i8** %11, align 8
  %195 = load i32, i32* %24, align 4
  %196 = add nsw i32 %195, 1
  store i32 %196, i32* %24, align 4
  %197 = sext i32 %195 to i64
  %198 = getelementptr inbounds i8, i8* %194, i64 %197
  store i8 1, i8* %198, align 1
  %199 = load i8*, i8** %11, align 8
  %200 = load i32, i32* %24, align 4
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* %24, align 4
  %202 = sext i32 %200 to i64
  %203 = getelementptr inbounds i8, i8* %199, i64 %202
  store i8 1, i8* %203, align 1
  %204 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @md5buf, i64 0, i64 0), align 16
  %205 = load i8*, i8** %11, align 8
  %206 = load i32, i32* %24, align 4
  %207 = add nsw i32 %206, 1
  store i32 %207, i32* %24, align 4
  %208 = sext i32 %206 to i64
  %209 = getelementptr inbounds i8, i8* %205, i64 %208
  store i8 %204, i8* %209, align 1
  %210 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @md5buf, i64 0, i64 1), align 1
  %211 = load i8*, i8** %11, align 8
  %212 = load i32, i32* %24, align 4
  %213 = add nsw i32 %212, 1
  store i32 %213, i32* %24, align 4
  %214 = sext i32 %212 to i64
  %215 = getelementptr inbounds i8, i8* %211, i64 %214
  store i8 %210, i8* %215, align 1
  store i32 0, i32* %22, align 4
  br label %216

; <label>:216:                                    ; preds = %232, %193
  %217 = load i32, i32* %22, align 4
  %218 = load i32, i32* %26, align 4
  %219 = add nsw i32 %218, 2
  %220 = icmp slt i32 %217, %219
  br i1 %220, label %221, label %235

; <label>:221:                                    ; preds = %216
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 2)
  %222 = add i64 %pgocount8, 1
  store i64 %222, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 2)
  %223 = load i32, i32* %22, align 4
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [262 x i8], [262 x i8]* %21, i64 0, i64 %224
  %226 = load i8, i8* %225, align 1
  %227 = load i8*, i8** %11, align 8
  %228 = load i32, i32* %24, align 4
  %229 = add nsw i32 %228, 1
  store i32 %229, i32* %24, align 4
  %230 = sext i32 %228 to i64
  %231 = getelementptr inbounds i8, i8* %227, i64 %230
  store i8 %226, i8* %231, align 1
  br label %232

; <label>:232:                                    ; preds = %221
  %233 = load i32, i32* %22, align 4
  %234 = add nsw i32 %233, 1
  store i32 %234, i32* %22, align 4
  br label %216

; <label>:235:                                    ; preds = %216
  %236 = load i8, i8* @quietmode, align 1
  %237 = icmp ne i8 %236, 0
  br i1 %237, label %242, label %238

; <label>:238:                                    ; preds = %235
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 7)
  %239 = add i64 %pgocount9, 1
  store i64 %239, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 7)
  %240 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %241 = call i32 @fputc(i32 46, %struct._IO_FILE* %240)
  br label %242

; <label>:242:                                    ; preds = %238, %235
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 5)
  %243 = add i64 %pgocount10, 1
  store i64 %243, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_make_signature_certificate, i64 0, i64 5)
  %244 = bitcast [260 x i8]* %20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %244, i8 0, i64 260, i32 16, i1 false)
  %245 = bitcast [262 x i8]* %21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %245, i8 0, i64 262, i32 16, i1 false)
  %246 = load i32, i32* %24, align 4
  store i32 %246, i32* %10, align 4
  br label %247

; <label>:247:                                    ; preds = %242, %101, %50, %41
  %248 = load i32, i32* %10, align 4
  ret i32 %248
}

declare void @file_to_canon(i8*) #1

declare i64 @fsize(%struct._IO_FILE*) #1

declare i32 @copyfile(%struct._IO_FILE*, %struct._IO_FILE*, i64) #1

declare i32 @write_error(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @compromise(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i8, align 1
  %9 = alloca i32, align 4
  %10 = alloca [286 x i8], align 16
  %11 = alloca i64, align 8
  %12 = alloca i8*, align 8
  %13 = alloca [256 x i8], align 16
  %14 = alloca [130 x i16], align 16
  %15 = alloca [130 x i16], align 16
  %16 = alloca %struct.MD5Context, align 8
  %17 = alloca [130 x i16], align 16
  %18 = alloca [130 x i16], align 16
  %19 = alloca [130 x i16], align 16
  %20 = alloca [130 x i16], align 16
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %26 = bitcast i64* %11 to i8*
  store i8* %26, i8** %12, align 8
  %27 = load i8*, i8** %5, align 8
  call void @setoutdir(i8* %27)
  %28 = call i8* @tempfile(i32 0)
  store i8* %28, i8** %25, align 8
  %29 = load i8*, i8** %4, align 8
  %30 = load i8*, i8** %12, align 8
  %31 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  %32 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  %33 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %34 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %35 = getelementptr inbounds [130 x i16], [130 x i16]* %18, i32 0, i32 0
  %36 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %37 = getelementptr inbounds [130 x i16], [130 x i16]* %20, i32 0, i32 0
  %38 = call i32 @getsecretkey(i32 0, i8* null, i8* %29, i8* %30, i8* null, i8* null, i8* %31, i16* %32, i16* %33, i16* %34, i16* %35, i16* %36, i16* %37)
  %39 = icmp slt i32 %38, 0
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 0)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 0)
  store i32 -1, i32* %3, align 4
  br label %174

; <label>:42:                                     ; preds = %2
  %43 = load i8*, i8** %5, align 8
  %44 = load i8*, i8** %4, align 8
  %45 = load i8*, i8** %12, align 8
  %46 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  %47 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  %48 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %49 = call i32 @getpublickey(i32 0, i8* %43, i64* %21, i32* %23, i8* %44, i8* %45, i8* %46, i16* %47, i16* %48)
  %50 = icmp slt i32 %49, 0
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 1)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %174

; <label>:53:                                     ; preds = %42
  %54 = load i8*, i8** %5, align 8
  %55 = call %struct._IO_FILE* @fopen(i8* %54, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %55, %struct._IO_FILE** %6, align 8
  %56 = icmp eq %struct._IO_FILE* %55, null
  br i1 %56, label %57, label %63

; <label>:57:                                     ; preds = %53
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 2)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 2)
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %60 = call i8* @LANG(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i32 0, i32 0))
  %61 = load i8*, i8** %5, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* %60, i8* %61)
  store i32 -1, i32* %3, align 4
  br label %174

; <label>:63:                                     ; preds = %53
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %65 = load i64, i64* %21, align 8
  %66 = load i32, i32* %23, align 4
  %67 = sext i32 %66 to i64
  %68 = add nsw i64 %65, %67
  %69 = call i32 @fseek(%struct._IO_FILE* %64, i64 %68, i32 0)
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %71 = call signext i16 @nextkeypacket(%struct._IO_FILE* %70, i8* %8)
  %72 = load i8, i8* %8, align 1
  %73 = zext i8 %72 to i32
  %74 = icmp eq i32 %73, 176
  br i1 %74, label %75, label %80

; <label>:75:                                     ; preds = %63
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %77 = call i64 @ftell(%struct._IO_FILE* %76)
  store i64 %77, i64* %22, align 8
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %79 = call signext i16 @nextkeypacket(%struct._IO_FILE* %78, i8* %8)
  br label %86

; <label>:80:                                     ; preds = %63
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 3)
  %81 = add i64 %pgocount3, 1
  store i64 %81, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 3)
  %82 = load i64, i64* %21, align 8
  %83 = load i32, i32* %23, align 4
  %84 = sext i32 %83 to i64
  %85 = add nsw i64 %82, %84
  store i64 %85, i64* %22, align 8
  br label %86

; <label>:86:                                     ; preds = %80, %75
  %87 = load i8, i8* %8, align 1
  %88 = zext i8 %87 to i32
  %89 = and i32 %88, 124
  %90 = icmp eq i32 %89, 8
  br i1 %90, label %91, label %98

; <label>:91:                                     ; preds = %86
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 4)
  %92 = add i64 %pgocount4, 1
  store i64 %92, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 4)
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %94 = call i8* @LANG(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.11, i32 0, i32 0))
  %95 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* %94)
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %97 = call i32 @fclose(%struct._IO_FILE* %96)
  store i32 -1, i32* %3, align 4
  br label %174

; <label>:98:                                     ; preds = %86
  %99 = load i16, i16* @global_precision, align 2
  %100 = sext i16 %99 to i32
  store i32 %100, i32* %24, align 4
  store i16 130, i16* @global_precision, align 2
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %102 = load i64, i64* %21, align 8
  %103 = call i32 @fseek(%struct._IO_FILE* %101, i64 %102, i32 0)
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %105 = load i32, i32* %23, align 4
  %106 = sext i32 %105 to i64
  %107 = call i32 @MDfile0_len(%struct.MD5Context* %16, %struct._IO_FILE* %104, i64 %106)
  %108 = icmp slt i32 %107, 0
  br i1 %108, label %109, label %113

; <label>:109:                                    ; preds = %98
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 5)
  %110 = add i64 %pgocount5, 1
  store i64 %110, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 5)
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %112 = call i32 @fclose(%struct._IO_FILE* %111)
  store i32 -1, i32* %3, align 4
  br label %174

; <label>:113:                                    ; preds = %98
  %114 = load i32, i32* %24, align 4
  %115 = trunc i32 %114 to i16
  store i16 %115, i16* @global_precision, align 2
  %116 = getelementptr inbounds [286 x i8], [286 x i8]* %10, i32 0, i32 0
  %117 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %118 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %119 = getelementptr inbounds [130 x i16], [130 x i16]* %18, i32 0, i32 0
  %120 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %121 = getelementptr inbounds [130 x i16], [130 x i16]* %20, i32 0, i32 0
  %122 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  %123 = call i32 @make_signature_certificate(i8* %116, %struct.MD5Context* %16, i8 zeroext 32, i16* %117, i16* %118, i16* %119, i16* %120, i16* %121, i16* %122)
  store i32 %123, i32* %9, align 4
  %124 = load i32, i32* %9, align 4
  %125 = icmp slt i32 %124, 0
  br i1 %125, label %126, label %130

; <label>:126:                                    ; preds = %113
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 6)
  %127 = add i64 %pgocount6, 1
  store i64 %127, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 6)
  %128 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %129 = call i32 @fclose(%struct._IO_FILE* %128)
  store i32 -1, i32* %3, align 4
  br label %174

; <label>:130:                                    ; preds = %113
  %131 = load i8*, i8** %25, align 8
  %132 = call %struct._IO_FILE* @fopen(i8* %131, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %132, %struct._IO_FILE** %7, align 8
  %133 = icmp eq %struct._IO_FILE* %132, null
  br i1 %133, label %134, label %141

; <label>:134:                                    ; preds = %130
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 8)
  %135 = add i64 %pgocount7, 1
  store i64 %135, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 8)
  %136 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %137 = call i8* @LANG(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.12, i32 0, i32 0))
  %138 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %136, i8* %137)
  %139 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %140 = call i32 @fclose(%struct._IO_FILE* %139)
  store i32 -1, i32* %3, align 4
  br label %174

; <label>:141:                                    ; preds = %130
  %142 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  call void @rewind(%struct._IO_FILE* %142)
  %143 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %144 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %145 = load i64, i64* %22, align 8
  %146 = call i32 @copyfile(%struct._IO_FILE* %143, %struct._IO_FILE* %144, i64 %145)
  %147 = getelementptr inbounds [286 x i8], [286 x i8]* %10, i32 0, i32 0
  %148 = load i32, i32* %9, align 4
  %149 = sext i32 %148 to i64
  %150 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %151 = call i64 @fwrite(i8* %147, i64 1, i64 %149, %struct._IO_FILE* %150)
  %152 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %153 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %154 = call i32 @copyfile(%struct._IO_FILE* %152, %struct._IO_FILE* %153, i64 -1)
  %155 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %156 = call i32 @fclose(%struct._IO_FILE* %155)
  %157 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %158 = call i32 @write_error(%struct._IO_FILE* %157)
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %160, label %164

; <label>:160:                                    ; preds = %141
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 7)
  %161 = add i64 %pgocount8, 1
  store i64 %161, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 7)
  %162 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %163 = call i32 @fclose(%struct._IO_FILE* %162)
  store i32 -1, i32* %3, align 4
  br label %174

; <label>:164:                                    ; preds = %141
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 9)
  %165 = add i64 %pgocount9, 1
  store i64 %165, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_compromise, i64 0, i64 9)
  %166 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %167 = call i32 @fclose(%struct._IO_FILE* %166)
  %168 = load i8*, i8** %25, align 8
  %169 = load i8*, i8** %5, align 8
  %170 = call i32 @savetempbak(i8* %168, i8* %169)
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %172 = call i8* @LANG(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.13, i32 0, i32 0))
  %173 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %171, i8* %172)
  store i32 0, i32* %3, align 4
  br label %174

; <label>:174:                                    ; preds = %164, %160, %134, %126, %109, %91, %57, %51, %40
  %175 = load i32, i32* %3, align 4
  ret i32 %175
}

declare void @setoutdir(i8*) #1

declare i8* @tempfile(i32) #1

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #1

declare signext i16 @nextkeypacket(%struct._IO_FILE*, i8*) #1

declare i64 @ftell(%struct._IO_FILE*) #1

declare i32 @MDfile0_len(%struct.MD5Context*, %struct._IO_FILE*, i64) #1

declare void @rewind(%struct._IO_FILE*) #1

declare i32 @savetempbak(i8*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @do_sign(i8*, i64, i32, i8*, i8*, i8*, i8 zeroext) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8, align 1
  %16 = alloca %struct._IO_FILE*, align 8
  %17 = alloca %struct._IO_FILE*, align 8
  %18 = alloca i8, align 1
  %19 = alloca i64, align 8
  %20 = alloca i8*, align 8
  %21 = alloca [8 x i8], align 1
  %22 = alloca [130 x i16], align 16
  %23 = alloca [130 x i16], align 16
  %24 = alloca i32, align 4
  %25 = alloca [286 x i8], align 16
  %26 = alloca i64, align 8
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i8*, align 8
  %30 = alloca i32, align 4
  %31 = alloca %struct.MD5Context, align 8
  %32 = alloca [130 x i16], align 16
  %33 = alloca [130 x i16], align 16
  %34 = alloca [130 x i16], align 16
  %35 = alloca [130 x i16], align 16
  store i8* %0, i8** %9, align 8
  store i64 %1, i64* %10, align 8
  store i32 %2, i32* %11, align 4
  store i8* %3, i8** %12, align 8
  store i8* %4, i8** %13, align 8
  store i8* %5, i8** %14, align 8
  store i8 %6, i8* %15, align 1
  %36 = bitcast i64* %19 to i8*
  store i8* %36, i8** %20, align 8
  %37 = load i8*, i8** %9, align 8
  %38 = load i64, i64* %10, align 8
  %39 = load i8*, i8** %12, align 8
  %40 = call i32 @getpubuserid(i8* %37, i64 %38, i8* %39, i64* %26, i32* %27, i8 zeroext 0)
  store i32 %40, i32* %30, align 4
  %41 = load i32, i32* %30, align 4
  %42 = icmp slt i32 %41, 0
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 3)
  %44 = add i64 %pgocount, 1
  store i64 %44, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 3)
  store i32 -1, i32* %8, align 4
  br label %261

; <label>:45:                                     ; preds = %7
  %46 = load i8*, i8** %9, align 8
  %47 = call %struct._IO_FILE* @fopen(i8* %46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %47, %struct._IO_FILE** %16, align 8
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %49 = icmp eq %struct._IO_FILE* %48, null
  br i1 %49, label %50, label %56

; <label>:50:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 4)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 4)
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %53 = call i8* @LANG(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i32 0, i32 0))
  %54 = load i8*, i8** %9, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* %53, i8* %54)
  store i32 -1, i32* %8, align 4
  br label %261

; <label>:56:                                     ; preds = %45
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %58 = load i64, i64* %26, align 8
  %59 = load i32, i32* %27, align 4
  %60 = sext i32 %59 to i64
  %61 = add nsw i64 %58, %60
  %62 = call i32 @fseek(%struct._IO_FILE* %57, i64 %61, i32 0)
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %64 = call signext i16 @nextkeypacket(%struct._IO_FILE* %63, i8* %18)
  store i32 0, i32* %28, align 4
  %65 = load i8, i8* %18, align 1
  %66 = zext i8 %65 to i32
  %67 = icmp ne i32 %66, 176
  br i1 %67, label %68, label %75

; <label>:68:                                     ; preds = %56
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %70 = load i64, i64* %26, align 8
  %71 = load i32, i32* %27, align 4
  %72 = sext i32 %71 to i64
  %73 = add nsw i64 %70, %72
  %74 = call i32 @fseek(%struct._IO_FILE* %69, i64 %73, i32 0)
  br label %85

; <label>:75:                                     ; preds = %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 5)
  %76 = add i64 %pgocount2, 1
  store i64 %76, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 5)
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %78 = call i64 @ftell(%struct._IO_FILE* %77)
  %79 = load i64, i64* %26, align 8
  %80 = load i32, i32* %27, align 4
  %81 = sext i32 %80 to i64
  %82 = add nsw i64 %79, %81
  %83 = sub nsw i64 %78, %82
  %84 = trunc i64 %83 to i32
  store i32 %84, i32* %28, align 4
  br label %85

; <label>:85:                                     ; preds = %75, %68
  br label %86

; <label>:86:                                     ; preds = %117, %85
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %88 = getelementptr inbounds [8 x i8], [8 x i8]* %21, i32 0, i32 0
  %89 = call signext i16 @readkeypacket(%struct._IO_FILE* %87, %struct.IdeaCfbContext* null, i8* %18, i8* null, i8* null, i16* null, i16* null, i16* null, i16* null, i16* null, i16* null, i8* %88, i8* null)
  %90 = sext i16 %89 to i32
  store i32 %90, i32* %30, align 4
  %91 = load i32, i32* %30, align 4
  %92 = icmp slt i32 %91, 0
  br i1 %92, label %103, label %93

; <label>:93:                                     ; preds = %86
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 0)
  %94 = add i64 %pgocount3, 1
  store i64 %94, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 0)
  %95 = load i8, i8* %18, align 1
  %96 = call i32 @is_key_ctb(i8 zeroext %95)
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %103, label %98

; <label>:98:                                     ; preds = %93
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 1)
  %99 = add i64 %pgocount4, 1
  store i64 %99, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 1)
  %100 = load i8, i8* %18, align 1
  %101 = zext i8 %100 to i32
  %102 = icmp eq i32 %101, 180
  br i1 %102, label %103, label %104

; <label>:103:                                    ; preds = %98, %93, %86
  br label %119

; <label>:104:                                    ; preds = %98
  %105 = load i8*, i8** %13, align 8
  %106 = getelementptr inbounds [8 x i8], [8 x i8]* %21, i32 0, i32 0
  %107 = call i32 @memcmp(i8* %105, i8* %106, i64 8) #6
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %117, label %109

; <label>:109:                                    ; preds = %104
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 7)
  %110 = add i64 %pgocount5, 1
  store i64 %110, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 7)
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %112 = call i8* @LANG(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.14, i32 0, i32 0))
  %113 = load i8*, i8** %14, align 8
  %114 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %111, i8* %112, i8* %113)
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %116 = call i32 @fclose(%struct._IO_FILE* %115)
  store i32 -1, i32* %8, align 4
  br label %261

; <label>:117:                                    ; preds = %104
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 2)
  %118 = add i64 %pgocount6, 1
  store i64 %118, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 2)
  br label %86

; <label>:119:                                    ; preds = %103
  %120 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  call void @rewind(%struct._IO_FILE* %120)
  %121 = load i8, i8* %15, align 1
  %122 = icmp ne i8 %121, 0
  br i1 %122, label %135, label %123

; <label>:123:                                    ; preds = %119
  %124 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %125 = call i8* @LANG(i8* getelementptr inbounds ([229 x i8], [229 x i8]* @.str.15, i32 0, i32 0))
  %126 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %124, i8* %125)
  %127 = call zeroext i8 @getyesno(i8 signext 110)
  %128 = icmp ne i8 %127, 0
  br i1 %128, label %133, label %129

; <label>:129:                                    ; preds = %123
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 10)
  %130 = add i64 %pgocount7, 1
  store i64 %130, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 10)
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %132 = call i32 @fclose(%struct._IO_FILE* %131)
  store i32 -1, i32* %8, align 4
  br label %261

; <label>:133:                                    ; preds = %123
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 8)
  %134 = add i64 %pgocount8, 1
  store i64 %134, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 8)
  br label %135

; <label>:135:                                    ; preds = %133, %119
  store i16 130, i16* @global_precision, align 2
  %136 = load i8*, i8** %9, align 8
  %137 = call %struct._IO_FILE* @fopen(i8* %136, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %137, %struct._IO_FILE** %17, align 8
  %138 = icmp eq %struct._IO_FILE* %137, null
  br i1 %138, label %139, label %147

; <label>:139:                                    ; preds = %135
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 6)
  %140 = add i64 %pgocount9, 1
  store i64 %140, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 6)
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %142 = call i32 @fclose(%struct._IO_FILE* %141)
  %143 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %144 = call i8* @LANG(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i32 0, i32 0))
  %145 = load i8*, i8** %9, align 8
  %146 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %143, i8* %144, i8* %145)
  store i32 -1, i32* %8, align 4
  br label %261

; <label>:147:                                    ; preds = %135
  %148 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %149 = load i64, i64* %10, align 8
  %150 = call i32 @fseek(%struct._IO_FILE* %148, i64 %149, i32 0)
  %151 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %152 = load i32, i32* %11, align 4
  %153 = sext i32 %152 to i64
  %154 = call i32 @MDfile0_len(%struct.MD5Context* %31, %struct._IO_FILE* %151, i64 %153)
  %155 = icmp slt i32 %154, 0
  br i1 %155, label %156, label %162

; <label>:156:                                    ; preds = %147
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 9)
  %157 = add i64 %pgocount10, 1
  store i64 %157, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 9)
  %158 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %159 = call i32 @fclose(%struct._IO_FILE* %158)
  %160 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %161 = call i32 @fclose(%struct._IO_FILE* %160)
  store i32 -1, i32* %8, align 4
  br label %261

; <label>:162:                                    ; preds = %147
  %163 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %164 = call i32 @fclose(%struct._IO_FILE* %163)
  %165 = load i8*, i8** %12, align 8
  call void @CToPascal(i8* %165)
  %166 = load i8*, i8** %12, align 8
  %167 = getelementptr inbounds i8, i8* %166, i64 1
  %168 = load i8*, i8** %12, align 8
  %169 = getelementptr inbounds i8, i8* %168, i64 0
  %170 = load i8, i8* %169, align 1
  %171 = zext i8 %170 to i32
  call void @MD5Update(%struct.MD5Context* %31, i8* %167, i32 %171)
  %172 = load i8*, i8** %12, align 8
  %173 = load i8*, i8** %14, align 8
  %174 = call i8* @strcpy(i8* %172, i8* %173) #5
  %175 = load i8, i8* %15, align 1
  %176 = zext i8 %175 to i32
  %177 = icmp ne i32 %176, 0
  %178 = zext i1 %177 to i64
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 16)
  %179 = add i64 %pgocount11, %178
  store i64 %179, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 16)
  %180 = select i1 %177, i32 0, i32 16
  %181 = load i8*, i8** %20, align 8
  %182 = load i8*, i8** %12, align 8
  %183 = getelementptr inbounds [130 x i16], [130 x i16]* %22, i32 0, i32 0
  %184 = getelementptr inbounds [130 x i16], [130 x i16]* %23, i32 0, i32 0
  %185 = getelementptr inbounds [130 x i16], [130 x i16]* %32, i32 0, i32 0
  %186 = getelementptr inbounds [130 x i16], [130 x i16]* %33, i32 0, i32 0
  %187 = getelementptr inbounds [130 x i16], [130 x i16]* %34, i32 0, i32 0
  %188 = getelementptr inbounds [130 x i16], [130 x i16]* %35, i32 0, i32 0
  %189 = call i32 @getsecretkey(i32 %180, i8* null, i8* null, i8* %181, i8* null, i8* null, i8* %182, i16* %183, i16* %184, i16* %185, i16* %186, i16* %187, i16* %188)
  %190 = icmp slt i32 %189, 0
  br i1 %190, label %191, label %195

; <label>:191:                                    ; preds = %162
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 11)
  %192 = add i64 %pgocount12, 1
  store i64 %192, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 11)
  %193 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %194 = call i32 @fclose(%struct._IO_FILE* %193)
  store i32 -1, i32* %8, align 4
  br label %261

; <label>:195:                                    ; preds = %162
  %196 = getelementptr inbounds [286 x i8], [286 x i8]* %25, i32 0, i32 0
  %197 = getelementptr inbounds [130 x i16], [130 x i16]* %23, i32 0, i32 0
  %198 = getelementptr inbounds [130 x i16], [130 x i16]* %32, i32 0, i32 0
  %199 = getelementptr inbounds [130 x i16], [130 x i16]* %33, i32 0, i32 0
  %200 = getelementptr inbounds [130 x i16], [130 x i16]* %34, i32 0, i32 0
  %201 = getelementptr inbounds [130 x i16], [130 x i16]* %35, i32 0, i32 0
  %202 = getelementptr inbounds [130 x i16], [130 x i16]* %22, i32 0, i32 0
  %203 = call i32 @make_signature_certificate(i8* %196, %struct.MD5Context* %31, i8 zeroext 16, i16* %197, i16* %198, i16* %199, i16* %200, i16* %201, i16* %202)
  store i32 %203, i32* %24, align 4
  %204 = load i32, i32* %24, align 4
  %205 = icmp slt i32 %204, 0
  br i1 %205, label %206, label %210

; <label>:206:                                    ; preds = %195
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 12)
  %207 = add i64 %pgocount13, 1
  store i64 %207, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 12)
  %208 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %209 = call i32 @fclose(%struct._IO_FILE* %208)
  store i32 -1, i32* %8, align 4
  br label %261

; <label>:210:                                    ; preds = %195
  %211 = call i8* @tempfile(i32 4)
  store i8* %211, i8** %29, align 8
  %212 = load i8*, i8** %29, align 8
  %213 = call %struct._IO_FILE* @fopen(i8* %212, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %213, %struct._IO_FILE** %17, align 8
  %214 = icmp eq %struct._IO_FILE* %213, null
  br i1 %214, label %215, label %222

; <label>:215:                                    ; preds = %210
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 14)
  %216 = add i64 %pgocount14, 1
  store i64 %216, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 14)
  %217 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %218 = call i8* @LANG(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.12, i32 0, i32 0))
  %219 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %217, i8* %218)
  %220 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %221 = call i32 @fclose(%struct._IO_FILE* %220)
  store i32 -1, i32* %8, align 4
  br label %261

; <label>:222:                                    ; preds = %210
  %223 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %224 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %225 = load i64, i64* %26, align 8
  %226 = load i32, i32* %27, align 4
  %227 = sext i32 %226 to i64
  %228 = add nsw i64 %225, %227
  %229 = load i32, i32* %28, align 4
  %230 = sext i32 %229 to i64
  %231 = add nsw i64 %228, %230
  %232 = call i32 @copyfile(%struct._IO_FILE* %223, %struct._IO_FILE* %224, i64 %231)
  %233 = getelementptr inbounds [286 x i8], [286 x i8]* %25, i32 0, i32 0
  %234 = load i32, i32* %24, align 4
  %235 = sext i32 %234 to i64
  %236 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %237 = call i64 @fwrite(i8* %233, i64 1, i64 %235, %struct._IO_FILE* %236)
  %238 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  call void @write_trust(%struct._IO_FILE* %238, i8 zeroext -57)
  %239 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %240 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %241 = call i32 @copyfile(%struct._IO_FILE* %239, %struct._IO_FILE* %240, i64 -1)
  %242 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %243 = call i32 @fclose(%struct._IO_FILE* %242)
  %244 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %245 = call i32 @write_error(%struct._IO_FILE* %244)
  %246 = icmp ne i32 %245, 0
  br i1 %246, label %247, label %251

; <label>:247:                                    ; preds = %222
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 13)
  %248 = add i64 %pgocount15, 1
  store i64 %248, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 13)
  %249 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %250 = call i32 @fclose(%struct._IO_FILE* %249)
  store i32 -1, i32* %8, align 4
  br label %261

; <label>:251:                                    ; preds = %222
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 15)
  %252 = add i64 %pgocount16, 1
  store i64 %252, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_do_sign, i64 0, i64 15)
  %253 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %254 = call i32 @fclose(%struct._IO_FILE* %253)
  %255 = load i8*, i8** %29, align 8
  %256 = load i8*, i8** %9, align 8
  %257 = call i32 @savetempbak(i8* %255, i8* %256)
  %258 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %259 = call i8* @LANG(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.16, i32 0, i32 0))
  %260 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %258, i8* %259)
  store i32 0, i32* %8, align 4
  br label %261

; <label>:261:                                    ; preds = %251, %247, %215, %206, %191, %156, %139, %129, %109, %50, %43
  %262 = load i32, i32* %8, align 4
  ret i32 %262
}

declare i32 @getpubuserid(i8*, i64, i8*, i64*, i32*, i8 zeroext) #1

declare signext i16 @readkeypacket(%struct._IO_FILE*, %struct.IdeaCfbContext*, i8*, i8*, i8*, i16*, i16*, i16*, i16*, i16*, i16*, i8*, i8*) #1

declare i32 @is_key_ctb(i8 zeroext) #1

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8*, i8*, i64) #4

declare zeroext i8 @getyesno(i8 signext) #1

declare void @MD5Update(%struct.MD5Context*, i8*, i32) #1

declare void @write_trust(%struct._IO_FILE*, i8 zeroext) #1

; Function Attrs: noinline nounwind uwtable
define i32 @signkey(i8*, i8*, i8*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca [8 x i8], align 1
  %9 = alloca i64, align 8
  %10 = alloca i8*, align 8
  %11 = alloca [256 x i8], align 16
  %12 = alloca [130 x i16], align 16
  %13 = alloca [130 x i16], align 16
  %14 = alloca i64, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  %17 = bitcast i64* %9 to i8*
  store i8* %17, i8** %10, align 8
  %18 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %19 = load i8*, i8** %6, align 8
  %20 = call i8* @strcpy(i8* %18, i8* %19) #5
  %21 = load i8*, i8** %10, align 8
  %22 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %23 = getelementptr inbounds [130 x i16], [130 x i16]* %12, i32 0, i32 0
  %24 = getelementptr inbounds [130 x i16], [130 x i16]* %13, i32 0, i32 0
  %25 = call i32 @getsecretkey(i32 0, i8* null, i8* null, i8* %21, i8* null, i8* null, i8* %22, i16* %23, i16* %24, i16* null, i16* null, i16* null, i16* null)
  store i32 %25, i32* %16, align 4
  %26 = load i32, i32* %16, align 4
  %27 = icmp slt i32 %26, 0
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_signkey, i64 0, i64 0)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_signkey, i64 0, i64 0)
  store i32 -1, i32* %4, align 4
  br label %85

; <label>:30:                                     ; preds = %3
  %31 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i32 0, i32 0
  %32 = getelementptr inbounds [130 x i16], [130 x i16]* %12, i32 0, i32 0
  call void @extract_keyID(i8* %31, i16* %32)
  %33 = load i8*, i8** %7, align 8
  %34 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i32 0, i32 0
  %35 = load i8*, i8** %10, align 8
  %36 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %37 = getelementptr inbounds [130 x i16], [130 x i16]* %12, i32 0, i32 0
  %38 = getelementptr inbounds [130 x i16], [130 x i16]* %13, i32 0, i32 0
  %39 = call i32 @getpublickey(i32 5, i8* %33, i64* %14, i32* %15, i8* %34, i8* %35, i8* %36, i16* %37, i16* %38)
  store i32 %39, i32* %16, align 4
  %40 = load i32, i32* %16, align 4
  %41 = icmp slt i32 %40, 0
  br i1 %41, label %42, label %50

; <label>:42:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_signkey, i64 0, i64 1)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_signkey, i64 0, i64 1)
  %44 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  call void @PascalToC(i8* %44)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %46 = call i8* @LANG(i8* getelementptr inbounds ([149 x i8], [149 x i8]* @.str.17, i32 0, i32 0))
  %47 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %48 = load i8*, i8** %7, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* %46, i8* %47, i8* %48)
  store i32 -1, i32* %4, align 4
  br label %85

; <label>:50:                                     ; preds = %30
  %51 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %52 = load i8*, i8** %5, align 8
  %53 = call i8* @strcpy(i8* %51, i8* %52) #5
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %55 = call i8* @LANG(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.18, i32 0, i32 0))
  %56 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* %55, i8* %56)
  %58 = load i8*, i8** %7, align 8
  %59 = load i8*, i8** %10, align 8
  %60 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %61 = getelementptr inbounds [130 x i16], [130 x i16]* %12, i32 0, i32 0
  %62 = getelementptr inbounds [130 x i16], [130 x i16]* %13, i32 0, i32 0
  %63 = call i32 @getpublickey(i32 6, i8* %58, i64* %14, i32* %15, i8* null, i8* %59, i8* %60, i16* %61, i16* %62)
  store i32 %63, i32* %16, align 4
  %64 = load i32, i32* %16, align 4
  %65 = icmp slt i32 %64, 0
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_signkey, i64 0, i64 3)
  %67 = add i64 %pgocount2, 1
  store i64 %67, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_signkey, i64 0, i64 3)
  store i32 -1, i32* %4, align 4
  br label %85

; <label>:68:                                     ; preds = %50
  %69 = getelementptr inbounds [130 x i16], [130 x i16]* %12, i32 0, i32 0
  %70 = getelementptr inbounds [130 x i16], [130 x i16]* %13, i32 0, i32 0
  call void @showKeyHash(i16* %69, i16* %70)
  %71 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  call void @PascalToC(i8* %71)
  %72 = load i8*, i8** %7, align 8
  %73 = load i64, i64* %14, align 8
  %74 = load i32, i32* %15, align 4
  %75 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %76 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i32 0, i32 0
  %77 = load i8*, i8** %6, align 8
  %78 = load i8, i8* @batchmode, align 1
  %79 = call i32 @do_sign(i8* %72, i64 %73, i32 %74, i8* %75, i8* %76, i8* %77, i8 zeroext %78)
  %80 = icmp slt i32 %79, 0
  br i1 %80, label %81, label %83

; <label>:81:                                     ; preds = %68
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_signkey, i64 0, i64 4)
  %82 = add i64 %pgocount3, 1
  store i64 %82, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_signkey, i64 0, i64 4)
  store i32 -1, i32* %4, align 4
  br label %85

; <label>:83:                                     ; preds = %68
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_signkey, i64 0, i64 2)
  %84 = add i64 %pgocount4, 1
  store i64 %84, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_signkey, i64 0, i64 2)
  store i32 0, i32* %4, align 4
  br label %85

; <label>:85:                                     ; preds = %83, %81, %66, %42, %28
  %86 = load i32, i32* %4, align 4
  ret i32 %86
}

declare void @showKeyHash(i16*, i16*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @check_signaturefile(i8*, i8*, i8 zeroext, i8*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8, align 1
  %9 = alloca i8*, align 8
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca [256 x i8], align 16
  %13 = alloca [256 x i8], align 16
  %14 = alloca [256 x i8], align 16
  %15 = alloca i8*, align 8
  %16 = alloca %struct._IO_FILE*, align 8
  %17 = alloca i64, align 8
  %18 = alloca %struct._IO_FILE*, align 8
  %19 = alloca %struct._IO_FILE*, align 8
  %20 = alloca i64, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i16, align 2
  %24 = alloca [286 x i8], align 16
  %25 = alloca i8*, align 8
  %26 = alloca [130 x i16], align 16
  %27 = alloca [130 x i16], align 16
  %28 = alloca [260 x i8], align 16
  %29 = alloca [260 x i8], align 16
  %30 = alloca [8 x i8], align 1
  %31 = alloca i64, align 8
  %32 = alloca i8*, align 8
  %33 = alloca i64, align 8
  %34 = alloca [256 x i8], align 16
  %35 = alloca %struct.MD5Context, align 8
  %36 = alloca [16 x i8], align 16
  %37 = alloca i8, align 1
  %38 = alloca i8, align 1
  %39 = alloca i8, align 1
  %40 = alloca [256 x i8], align 16
  %41 = alloca i64, align 8
  %42 = alloca i32, align 4
  %43 = alloca i8*, align 8
  %44 = alloca i8, align 1
  %45 = alloca i8, align 1
  %46 = alloca i8, align 1
  %47 = alloca i8, align 1
  %48 = alloca i8, align 1
  %49 = alloca [2 x i8], align 1
  %50 = alloca [5 x i8], align 1
  %51 = alloca i8, align 1
  %52 = alloca i32, align 4
  store i8* %0, i8** %6, align 8
  store i8* %1, i8** %7, align 8
  store i8 %2, i8* %8, align 1
  store i8* %3, i8** %9, align 8
  store i8 0, i8* %11, align 1
  %53 = bitcast i64* %31 to i8*
  store i8* %53, i8** %32, align 8
  store i8 0, i8* %38, align 1
  store i8 98, i8* %39, align 1
  store i64 -1, i64* %41, align 8
  store i8 1, i8* %51, align 1
  %54 = getelementptr inbounds [8 x i8], [8 x i8]* %30, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %54, i8 0, i64 8, i32 1, i1 false)
  store i16 130, i16* @global_precision, align 2
  %55 = getelementptr inbounds [256 x i8], [256 x i8]* %12, i32 0, i32 0
  %56 = call i8* @strcpy(i8* %55, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #5
  %57 = load i8, i8* @verbose, align 1
  %58 = icmp ne i8 %57, 0
  br i1 %58, label %59, label %65

; <label>:59:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 0)
  %60 = add i64 %pgocount, 1
  store i64 %60, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 0)
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %62 = load i8*, i8** %6, align 8
  %63 = load i8*, i8** %7, align 8
  %64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.19, i32 0, i32 0), i8* %62, i8* %63)
  br label %65

; <label>:65:                                     ; preds = %59, %4
  %66 = load i8*, i8** %9, align 8
  %67 = icmp ne i8* %66, null
  br i1 %67, label %68, label %71

; <label>:68:                                     ; preds = %65
  %pgocount1 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 1)
  %69 = add i64 %pgocount1, 1
  store i64 %69, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 1)
  %70 = load i8*, i8** %9, align 8
  store i8 0, i8* %70, align 1
  br label %71

; <label>:71:                                     ; preds = %68, %65
  %72 = load i8*, i8** %6, align 8
  %73 = call %struct._IO_FILE* @fopen(i8* %72, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %73, %struct._IO_FILE** %18, align 8
  %74 = icmp eq %struct._IO_FILE* %73, null
  br i1 %74, label %75, label %81

; <label>:75:                                     ; preds = %71
  %pgocount2 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 3)
  %76 = add i64 %pgocount2, 1
  store i64 %76, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 3)
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %78 = call i8* @LANG(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.20, i32 0, i32 0))
  %79 = load i8*, i8** %6, align 8
  %80 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %77, i8* %78, i8* %79)
  store i32 -1, i32* %5, align 4
  br label %953

; <label>:81:                                     ; preds = %71
  %82 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %83 = call i64 @fread(i8* %10, i64 1, i64 1, %struct._IO_FILE* %82)
  %84 = getelementptr inbounds [286 x i8], [286 x i8]* %24, i32 0, i32 0
  store i8* %84, i8** %25, align 8
  %85 = load i8, i8* %10, align 1
  %86 = load i8*, i8** %25, align 8
  %87 = getelementptr inbounds i8, i8* %86, i32 1
  store i8* %87, i8** %25, align 8
  store i8 %85, i8* %86, align 1
  %88 = load i8, i8* %10, align 1
  %89 = zext i8 %88 to i32
  %90 = and i32 %89, 128
  %91 = icmp eq i32 %90, 128
  br i1 %91, label %92, label %98

; <label>:92:                                     ; preds = %81
  %pgocount3 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 4)
  %93 = add i64 %pgocount3, 1
  store i64 %93, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 4)
  %94 = load i8, i8* %10, align 1
  %95 = zext i8 %94 to i32
  %96 = and i32 %95, 124
  %97 = icmp eq i32 %96, 8
  br i1 %97, label %100, label %98

; <label>:98:                                     ; preds = %92, %81
  %pgocount4 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 2)
  %99 = add i64 %pgocount4, 1
  store i64 %99, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 2)
  br label %940

; <label>:100:                                    ; preds = %92
  %101 = load i8, i8* %10, align 1
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %103 = call i64 @getpastlength(i8 zeroext %101, %struct._IO_FILE* %102)
  %104 = trunc i64 %103 to i16
  store i16 %104, i16* %23, align 2
  %105 = load i8, i8* %10, align 1
  %106 = zext i8 %105 to i32
  %107 = and i32 %106, 3
  %108 = shl i32 1, %107
  %109 = load i8*, i8** %25, align 8
  %110 = sext i32 %108 to i64
  %111 = getelementptr inbounds i8, i8* %109, i64 %110
  store i8* %111, i8** %25, align 8
  %112 = load i16, i16* %23, align 2
  %113 = zext i16 %112 to i32
  %114 = icmp sgt i32 %113, 283
  br i1 %114, label %115, label %117

; <label>:115:                                    ; preds = %100
  %pgocount5 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 7)
  %116 = add i64 %pgocount5, 1
  store i64 %116, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 7)
  br label %940

; <label>:117:                                    ; preds = %100
  %118 = load i8*, i8** %25, align 8
  %119 = load i16, i16* %23, align 2
  %120 = zext i16 %119 to i64
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %122 = call i64 @fread(i8* %118, i64 1, i64 %120, %struct._IO_FILE* %121)
  %123 = load i16, i16* %23, align 2
  %124 = zext i16 %123 to i64
  %125 = icmp ult i64 %122, %124
  br i1 %125, label %126, label %128

; <label>:126:                                    ; preds = %117
  %pgocount6 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 8)
  %127 = add i64 %pgocount6, 1
  store i64 %127, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 8)
  br label %940

; <label>:128:                                    ; preds = %117
  %129 = load i8*, i8** %25, align 8
  %130 = getelementptr inbounds i8, i8* %129, i32 1
  store i8* %130, i8** %25, align 8
  %131 = load i8, i8* %129, align 1
  store i8 %131, i8* %45, align 1
  %132 = load i8, i8* %45, align 1
  %133 = zext i8 %132 to i32
  %134 = call i32 @version_byte_error(i32 %133)
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %136, label %138

; <label>:136:                                    ; preds = %128
  %pgocount7 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 9)
  %137 = add i64 %pgocount7, 1
  store i64 %137, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 9)
  br label %948

; <label>:138:                                    ; preds = %128
  %139 = load i8*, i8** %25, align 8
  %140 = getelementptr inbounds i8, i8* %139, i32 1
  store i8* %140, i8** %25, align 8
  %141 = load i8, i8* %139, align 1
  store i8 %141, i8* %46, align 1
  store i8 %141, i8* %44, align 1
  %142 = load i8*, i8** %25, align 8
  store i8* %142, i8** %43, align 8
  %143 = load i8*, i8** %25, align 8
  %144 = getelementptr inbounds i8, i8* %143, i32 1
  store i8* %144, i8** %25, align 8
  %145 = load i8, i8* %143, align 1
  store i8 %145, i8* %47, align 1
  %146 = load i8, i8* %47, align 1
  %147 = zext i8 %146 to i32
  %148 = icmp ne i32 %147, 1
  br i1 %148, label %149, label %159

; <label>:149:                                    ; preds = %138
  %pgocount8 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 10)
  %150 = add i64 %pgocount8, 1
  store i64 %150, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 10)
  %151 = load i8, i8* %47, align 1
  %152 = zext i8 %151 to i32
  %153 = icmp ne i32 %152, 0
  br i1 %153, label %154, label %159

; <label>:154:                                    ; preds = %149
  %pgocount9 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 14)
  %155 = add i64 %pgocount9, 1
  store i64 %155, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 14)
  %156 = load i8, i8* %47, align 1
  %157 = zext i8 %156 to i32
  %158 = call i32 @version_error(i32 %157, i32 1)
  br label %948

; <label>:159:                                    ; preds = %149, %138
  %160 = load i8, i8* %46, align 1
  %161 = add i8 %160, -1
  store i8 %161, i8* %46, align 1
  %162 = load i8, i8* %46, align 1
  %163 = zext i8 %162 to i32
  %164 = icmp sgt i32 %163, 0
  br i1 %164, label %165, label %185

; <label>:165:                                    ; preds = %159
  store i32 0, i32* %21, align 4
  br label %166

; <label>:166:                                    ; preds = %179, %165
  %167 = load i32, i32* %21, align 4
  %168 = icmp slt i32 %167, 4
  br i1 %168, label %169, label %183

; <label>:169:                                    ; preds = %166
  %170 = load i8*, i8** %25, align 8
  %171 = getelementptr inbounds i8, i8* %170, i32 1
  store i8* %171, i8** %25, align 8
  %172 = load i8, i8* %170, align 1
  %173 = load i8*, i8** %32, align 8
  %174 = load i32, i32* %21, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i8, i8* %173, i64 %175
  store i8 %172, i8* %176, align 1
  %177 = load i8, i8* %46, align 1
  %178 = add i8 %177, -1
  store i8 %178, i8* %46, align 1
  br label %179

; <label>:179:                                    ; preds = %169
  %pgocount10 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 6)
  %180 = add i64 %pgocount10, 1
  store i64 %180, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 6)
  %181 = load i32, i32* %21, align 4
  %182 = add nsw i32 %181, 1
  store i32 %182, i32* %21, align 4
  br label %166

; <label>:183:                                    ; preds = %166
  %pgocount11 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 11)
  %184 = add i64 %pgocount11, 1
  store i64 %184, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 11)
  br label %185

; <label>:185:                                    ; preds = %183, %159
  %186 = load i8, i8* %46, align 1
  %187 = zext i8 %186 to i32
  %188 = icmp sgt i32 %187, 0
  br i1 %188, label %189, label %197

; <label>:189:                                    ; preds = %185
  %pgocount12 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 12)
  %190 = add i64 %pgocount12, 1
  store i64 %190, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 12)
  %191 = load i8*, i8** %25, align 8
  %192 = getelementptr inbounds i8, i8* %191, i64 2
  store i8* %192, i8** %25, align 8
  %193 = load i8, i8* %46, align 1
  %194 = zext i8 %193 to i32
  %195 = sub nsw i32 %194, 2
  %196 = trunc i32 %195 to i8
  store i8 %196, i8* %46, align 1
  br label %197

; <label>:197:                                    ; preds = %189, %185
  store i32 0, i32* %21, align 4
  br label %198

; <label>:198:                                    ; preds = %209, %197
  %199 = load i32, i32* %21, align 4
  %200 = icmp slt i32 %199, 8
  br i1 %200, label %201, label %212

; <label>:201:                                    ; preds = %198
  %pgocount13 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 5)
  %202 = add i64 %pgocount13, 1
  store i64 %202, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 5)
  %203 = load i8*, i8** %25, align 8
  %204 = getelementptr inbounds i8, i8* %203, i32 1
  store i8* %204, i8** %25, align 8
  %205 = load i8, i8* %203, align 1
  %206 = load i32, i32* %21, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [8 x i8], [8 x i8]* %30, i64 0, i64 %207
  store i8 %205, i8* %208, align 1
  br label %209

; <label>:209:                                    ; preds = %201
  %210 = load i32, i32* %21, align 4
  %211 = add nsw i32 %210, 1
  store i32 %211, i32* %21, align 4
  br label %198

; <label>:212:                                    ; preds = %198
  %213 = load i8*, i8** %25, align 8
  %214 = getelementptr inbounds i8, i8* %213, i32 1
  store i8* %214, i8** %25, align 8
  %215 = load i8, i8* %213, align 1
  store i8 %215, i8* %48, align 1
  %216 = load i8, i8* %48, align 1
  %217 = zext i8 %216 to i32
  %218 = call i32 @version_error(i32 %217, i32 1)
  %219 = icmp ne i32 %218, 0
  br i1 %219, label %220, label %222

; <label>:220:                                    ; preds = %212
  %pgocount14 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 13)
  %221 = add i64 %pgocount14, 1
  store i64 %221, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 13)
  br label %948

; <label>:222:                                    ; preds = %212
  %223 = load i8*, i8** %25, align 8
  %224 = getelementptr inbounds i8, i8* %223, i32 1
  store i8* %224, i8** %25, align 8
  %225 = load i8, i8* %223, align 1
  store i8 %225, i8* %48, align 1
  %226 = load i8, i8* %48, align 1
  %227 = zext i8 %226 to i32
  %228 = call i32 @version_error(i32 %227, i32 1)
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %230, label %232

; <label>:230:                                    ; preds = %222
  %pgocount15 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 15)
  %231 = add i64 %pgocount15, 1
  store i64 %231, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 15)
  br label %948

; <label>:232:                                    ; preds = %222
  %233 = load i8*, i8** %25, align 8
  %234 = getelementptr inbounds i8, i8* %233, i32 1
  store i8* %234, i8** %25, align 8
  %235 = load i8, i8* %233, align 1
  %236 = getelementptr inbounds [2 x i8], [2 x i8]* %49, i64 0, i64 0
  store i8 %235, i8* %236, align 1
  %237 = load i8*, i8** %25, align 8
  %238 = getelementptr inbounds i8, i8* %237, i32 1
  store i8* %238, i8** %25, align 8
  %239 = load i8, i8* %237, align 1
  %240 = getelementptr inbounds [2 x i8], [2 x i8]* %49, i64 0, i64 1
  store i8 %239, i8* %240, align 1
  %241 = getelementptr inbounds [256 x i8], [256 x i8]* %12, i32 0, i32 0
  %242 = getelementptr inbounds [8 x i8], [8 x i8]* %30, i32 0, i32 0
  %243 = bitcast i64* %33 to i8*
  %244 = getelementptr inbounds [256 x i8], [256 x i8]* %34, i32 0, i32 0
  %245 = getelementptr inbounds [130 x i16], [130 x i16]* %26, i32 0, i32 0
  %246 = getelementptr inbounds [130 x i16], [130 x i16]* %27, i32 0, i32 0
  %247 = call i32 @getpublickey(i32 0, i8* %241, i64* %17, i32* null, i8* %242, i8* %243, i8* %244, i16* %245, i16* %246)
  %248 = icmp slt i32 %247, 0
  br i1 %248, label %249, label %262

; <label>:249:                                    ; preds = %232
  store i16 130, i16* @global_precision, align 2
  %250 = load i8, i8* @filter_mode, align 1
  %251 = zext i8 %250 to i32
  %252 = icmp ne i32 %251, 0
  br i1 %252, label %258, label %253

; <label>:253:                                    ; preds = %249
  %pgocount16 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 20)
  %254 = add i64 %pgocount16, 1
  store i64 %254, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 20)
  %255 = load i8, i8* @batchmode, align 1
  %256 = zext i8 %255 to i32
  %257 = icmp ne i32 %256, 0
  br i1 %257, label %258, label %260

; <label>:258:                                    ; preds = %253, %249
  %pgocount17 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 18)
  %259 = add i64 %pgocount17, 1
  store i64 %259, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 18)
  store i8 0, i8* %51, align 1
  br label %260

; <label>:260:                                    ; preds = %258, %253
  %pgocount18 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 16)
  %261 = add i64 %pgocount18, 1
  store i64 %261, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 16)
  br label %262

; <label>:262:                                    ; preds = %260, %232
  %263 = getelementptr inbounds [260 x i8], [260 x i8]* %28, i32 0, i32 0
  %264 = bitcast i8* %263 to i16*
  %265 = load i8*, i8** %25, align 8
  %266 = call signext i16 @mpi2reg(i16* %264, i8* %265)
  %267 = sext i16 %266 to i32
  %268 = icmp eq i32 %267, -1
  br i1 %268, label %269, label %271

; <label>:269:                                    ; preds = %262
  %pgocount19 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 17)
  %270 = add i64 %pgocount19, 1
  store i64 %270, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 17)
  br label %948

; <label>:271:                                    ; preds = %262
  %272 = getelementptr inbounds [260 x i8], [260 x i8]* %28, i32 0, i32 0
  %273 = bitcast i8* %272 to i16*
  %274 = call i32 @countbits(i16* %273)
  %275 = add nsw i32 %274, 7
  %276 = ashr i32 %275, 3
  %277 = add nsw i32 %276, 2
  %278 = load i8*, i8** %25, align 8
  %279 = sext i32 %277 to i64
  %280 = getelementptr inbounds i8, i8* %278, i64 %279
  store i8* %280, i8** %25, align 8
  %281 = load i8*, i8** %25, align 8
  %282 = getelementptr inbounds [286 x i8], [286 x i8]* %24, i32 0, i32 0
  %283 = ptrtoint i8* %281 to i64
  %284 = ptrtoint i8* %282 to i64
  %285 = sub i64 %283, %284
  %286 = load i16, i16* %23, align 2
  %287 = zext i16 %286 to i32
  %288 = add nsw i32 %287, 3
  %289 = sext i32 %288 to i64
  %290 = icmp ne i64 %285, %289
  br i1 %290, label %291, label %293

; <label>:291:                                    ; preds = %271
  %pgocount20 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 19)
  %292 = add i64 %pgocount20, 1
  store i64 %292, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 19)
  br label %940

; <label>:293:                                    ; preds = %271
  %294 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %295 = call i64 @ftell(%struct._IO_FILE* %294)
  store i64 %295, i64* %20, align 8
  %296 = getelementptr inbounds [260 x i8], [260 x i8]* %29, i32 0, i32 0
  %297 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %298 = call i64 @fread(i8* %296, i64 1, i64 1, %struct._IO_FILE* %297)
  %299 = icmp ult i64 %298, 1
  br i1 %299, label %300, label %383

; <label>:300:                                    ; preds = %293
  store i8 1, i8* %37, align 1
  %301 = load i8*, i8** %9, align 8
  %302 = icmp ne i8* %301, null
  br i1 %302, label %303, label %307

; <label>:303:                                    ; preds = %300
  %pgocount21 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 22)
  %304 = add i64 %pgocount21, 1
  store i64 %304, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 22)
  %305 = load i8*, i8** %9, align 8
  %306 = call i8* @strcpy(i8* %305, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.21, i32 0, i32 0)) #5
  br label %307

; <label>:307:                                    ; preds = %303, %300
  %308 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %309 = call i32 @fclose(%struct._IO_FILE* %308)
  %310 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %311 = call i8* @LANG(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.22, i32 0, i32 0))
  %312 = load i8*, i8** %6, align 8
  %313 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %310, i8* %311, i8* %312)
  %314 = load i32, i32* @myArgc, align 4
  %315 = icmp sgt i32 %314, 3
  br i1 %315, label %316, label %333

; <label>:316:                                    ; preds = %307
  %pgocount22 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 24)
  %317 = add i64 %pgocount22, 1
  store i64 %317, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 24)
  %318 = load i8**, i8*** @myArgv, align 8
  %319 = getelementptr inbounds i8*, i8** %318, i64 3
  %320 = load i8*, i8** %319, align 8
  %321 = call zeroext i8 @file_exists(i8* %320)
  %322 = zext i8 %321 to i32
  %323 = icmp ne i32 %322, 0
  br i1 %323, label %324, label %333

; <label>:324:                                    ; preds = %316
  %pgocount23 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 28)
  %325 = add i64 %pgocount23, 1
  store i64 %325, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 28)
  %326 = load i8**, i8*** @myArgv, align 8
  %327 = getelementptr inbounds i8*, i8** %326, i64 3
  %328 = load i8*, i8** %327, align 8
  store i8* %328, i8** %7, align 8
  %329 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %330 = call i8* @LANG(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.23, i32 0, i32 0))
  %331 = load i8*, i8** %7, align 8
  %332 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %329, i8* %330, i8* %331)
  br label %368

; <label>:333:                                    ; preds = %316, %307
  %334 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i32 0, i32 0
  %335 = load i8*, i8** %7, align 8
  %336 = call i8* @strcpy(i8* %334, i8* %335) #5
  %337 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i32 0, i32 0
  store i8* %337, i8** %7, align 8
  %338 = load i8*, i8** %7, align 8
  call void @drop_extension(i8* %338)
  %339 = load i8*, i8** %7, align 8
  %340 = call zeroext i8 @file_exists(i8* %339)
  %341 = icmp ne i8 %340, 0
  br i1 %341, label %342, label %348

; <label>:342:                                    ; preds = %333
  %pgocount24 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 26)
  %343 = add i64 %pgocount24, 1
  store i64 %343, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 26)
  %344 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %345 = call i8* @LANG(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.23, i32 0, i32 0))
  %346 = load i8*, i8** %7, align 8
  %347 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %344, i8* %345, i8* %346)
  br label %367

; <label>:348:                                    ; preds = %333
  %349 = load i8, i8* @batchmode, align 1
  %350 = icmp ne i8 %349, 0
  br i1 %350, label %351, label %353

; <label>:351:                                    ; preds = %348
  %pgocount25 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 42)
  %352 = add i64 %pgocount25, 1
  store i64 %352, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 42)
  store i32 -1, i32* %5, align 4
  br label %953

; <label>:353:                                    ; preds = %348
  %354 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %355 = call i8* @LANG(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.24, i32 0, i32 0))
  %356 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %354, i8* %355)
  %357 = load i8*, i8** %7, align 8
  %358 = call i32 @getstring(i8* %357, i32 59, i32 1)
  %359 = load i8*, i8** %7, align 8
  %360 = call i64 @strlen(i8* %359) #6
  %361 = trunc i64 %360 to i32
  %362 = icmp eq i32 %361, 0
  br i1 %362, label %363, label %365

; <label>:363:                                    ; preds = %353
  %pgocount26 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 65)
  %364 = add i64 %pgocount26, 1
  store i64 %364, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 65)
  store i32 -1, i32* %5, align 4
  br label %953

; <label>:365:                                    ; preds = %353
  %pgocount27 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 59)
  %366 = add i64 %pgocount27, 1
  store i64 %366, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 59)
  br label %367

; <label>:367:                                    ; preds = %365, %342
  br label %368

; <label>:368:                                    ; preds = %367, %324
  %369 = load i8*, i8** %7, align 8
  %370 = call %struct._IO_FILE* @fopen(i8* %369, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %370, %struct._IO_FILE** %18, align 8
  %371 = icmp eq %struct._IO_FILE* %370, null
  br i1 %371, label %372, label %378

; <label>:372:                                    ; preds = %368
  %pgocount28 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 29)
  %373 = add i64 %pgocount28, 1
  store i64 %373, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 29)
  %374 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %375 = call i8* @LANG(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.25, i32 0, i32 0))
  %376 = load i8*, i8** %7, align 8
  %377 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %374, i8* %375, i8* %376)
  store i32 -1, i32* %5, align 4
  br label %953

; <label>:378:                                    ; preds = %368
  %379 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %380 = call i64 @ftell(%struct._IO_FILE* %379)
  store i64 %380, i64* %20, align 8
  %381 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %382 = call i64 @fsize(%struct._IO_FILE* %381)
  store i64 %382, i64* %41, align 8
  br label %536

; <label>:383:                                    ; preds = %293
  store i8 0, i8* %37, align 1
  %384 = getelementptr inbounds [260 x i8], [260 x i8]* %29, i64 0, i64 0
  %385 = load i8, i8* %384, align 16
  store i8 %385, i8* %11, align 1
  %386 = load i8, i8* %11, align 1
  %387 = zext i8 %386 to i32
  %388 = and i32 %387, 124
  %389 = icmp eq i32 %388, 44
  %390 = zext i1 %389 to i32
  %391 = trunc i32 %390 to i8
  store i8 %391, i8* %38, align 1
  %392 = load i8, i8* %11, align 1
  %393 = zext i8 %392 to i32
  %394 = and i32 %393, 128
  %395 = icmp eq i32 %394, 128
  br i1 %395, label %396, label %535

; <label>:396:                                    ; preds = %383
  %pgocount29 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 25)
  %397 = add i64 %pgocount29, 1
  store i64 %397, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 25)
  %398 = load i8, i8* %11, align 1
  %399 = zext i8 %398 to i32
  %400 = and i32 %399, 124
  %401 = icmp eq i32 %400, 40
  br i1 %401, label %407, label %402

; <label>:402:                                    ; preds = %396
  %pgocount30 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 31)
  %403 = add i64 %pgocount30, 1
  store i64 %403, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 31)
  %404 = load i8, i8* %38, align 1
  %405 = zext i8 %404 to i32
  %406 = icmp ne i32 %405, 0
  br i1 %406, label %407, label %535

; <label>:407:                                    ; preds = %402, %396
  %408 = load i8, i8* %11, align 1
  %409 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %410 = call i64 @getpastlength(i8 zeroext %408, %struct._IO_FILE* %409)
  store i64 %410, i64* %41, align 8
  store i8 0, i8* %39, align 1
  %411 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %412 = call i64 @fread(i8* %39, i64 1, i64 1, %struct._IO_FILE* %411)
  %413 = load i8, i8* %39, align 1
  %414 = sext i8 %413 to i32
  %415 = icmp ne i32 %414, 116
  br i1 %415, label %416, label %435

; <label>:416:                                    ; preds = %407
  %pgocount31 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 37)
  %417 = add i64 %pgocount31, 1
  store i64 %417, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 37)
  %418 = load i8, i8* %39, align 1
  %419 = sext i8 %418 to i32
  %420 = icmp ne i32 %419, 98
  br i1 %420, label %421, label %435

; <label>:421:                                    ; preds = %416
  %pgocount32 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 51)
  %422 = add i64 %pgocount32, 1
  store i64 %422, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 51)
  %423 = load i8, i8* %39, align 1
  %424 = sext i8 %423 to i32
  %425 = icmp ne i32 %424, 108
  br i1 %425, label %426, label %435

; <label>:426:                                    ; preds = %421
  %pgocount33 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 62)
  %427 = add i64 %pgocount33, 1
  store i64 %427, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 62)
  %428 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %429 = load i8, i8* %39, align 1
  %430 = sext i8 %429 to i32
  %431 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %428, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.26, i32 0, i32 0), i32 %430)
  %432 = load i8, i8* %39, align 1
  %433 = sext i8 %432 to i32
  %434 = call i32 @version_error(i32 %433, i32 98)
  br label %948

; <label>:435:                                    ; preds = %421, %416, %407
  %436 = load i8, i8* @verbose, align 1
  %437 = icmp ne i8 %436, 0
  br i1 %437, label %438, label %446

; <label>:438:                                    ; preds = %435
  %pgocount34 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 33)
  %439 = add i64 %pgocount34, 1
  store i64 %439, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 33)
  %440 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %441 = call i8* @LANG(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.27, i32 0, i32 0))
  %442 = load i8, i8* %39, align 1
  %443 = call signext i8 @EXT_C(i8 signext %442)
  %444 = sext i8 %443 to i32
  %445 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %440, i8* %441, i32 %444)
  br label %446

; <label>:446:                                    ; preds = %438, %435
  %447 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i64 0, i64 0
  store i8 0, i8* %447, align 16
  %448 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i32 0, i32 0
  %449 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %450 = call i64 @fread(i8* %448, i64 1, i64 1, %struct._IO_FILE* %449)
  %451 = load i8, i8* %38, align 1
  %452 = icmp ne i8 %451, 0
  br i1 %452, label %453, label %462

; <label>:453:                                    ; preds = %446
  %pgocount35 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 34)
  %454 = add i64 %pgocount35, 1
  store i64 %454, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 34)
  %455 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i64 0, i64 0
  %456 = load i8, i8* %455, align 16
  %457 = zext i8 %456 to i64
  %458 = add i64 %457, 8
  %459 = add i64 %458, 2
  %460 = load i64, i64* %41, align 8
  %461 = sub i64 %460, %459
  store i64 %461, i64* %41, align 8
  br label %462

; <label>:462:                                    ; preds = %453, %446
  %463 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i64 0, i64 0
  %464 = load i8, i8* %463, align 16
  %465 = zext i8 %464 to i32
  %466 = icmp sgt i32 %465, 0
  br i1 %466, label %467, label %490

; <label>:467:                                    ; preds = %462
  %468 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i64 0, i64 0
  %469 = load i8, i8* %468, align 16
  %470 = zext i8 %469 to i32
  %471 = icmp sge i32 %470, 256
  br i1 %471, label %472, label %480

; <label>:472:                                    ; preds = %467
  %pgocount36 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 49)
  %473 = add i64 %pgocount36, 1
  store i64 %473, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 49)
  %474 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %475 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i64 0, i64 0
  %476 = load i8, i8* %475, align 16
  %477 = zext i8 %476 to i64
  %478 = call i32 @fseek(%struct._IO_FILE* %474, i64 %477, i32 1)
  %479 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i64 0, i64 0
  store i8 0, i8* %479, align 16
  br label %489

; <label>:480:                                    ; preds = %467
  %pgocount37 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 50)
  %481 = add i64 %pgocount37, 1
  store i64 %481, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 50)
  %482 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i32 0, i32 0
  %483 = getelementptr inbounds i8, i8* %482, i64 1
  %484 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i64 0, i64 0
  %485 = load i8, i8* %484, align 16
  %486 = zext i8 %485 to i64
  %487 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %488 = call i64 @fread(i8* %483, i64 1, i64 %486, %struct._IO_FILE* %487)
  br label %489

; <label>:489:                                    ; preds = %480, %472
  br label %490

; <label>:490:                                    ; preds = %489, %462
  %491 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i64 0, i64 0
  %492 = load i8, i8* %491, align 16
  %493 = icmp ne i8 %492, 0
  br i1 %493, label %494, label %514

; <label>:494:                                    ; preds = %490
  %495 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i32 0, i32 0
  call void @PascalToC(i8* %495)
  %496 = load i8, i8* @verbose, align 1
  %497 = icmp ne i8 %496, 0
  br i1 %497, label %498, label %504

; <label>:498:                                    ; preds = %494
  %pgocount38 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 46)
  %499 = add i64 %pgocount38, 1
  store i64 %499, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 46)
  %500 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %501 = call i8* @LANG(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.28, i32 0, i32 0))
  %502 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i32 0, i32 0
  %503 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %500, i8* %501, i8* %502)
  br label %504

; <label>:504:                                    ; preds = %498, %494
  %505 = load i8*, i8** %9, align 8
  %506 = icmp ne i8* %505, null
  br i1 %506, label %507, label %512

; <label>:507:                                    ; preds = %504
  %pgocount39 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 47)
  %508 = add i64 %pgocount39, 1
  store i64 %508, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 47)
  %509 = load i8*, i8** %9, align 8
  %510 = getelementptr inbounds [256 x i8], [256 x i8]* %40, i32 0, i32 0
  %511 = call i8* @strcpy(i8* %509, i8* %510) #5
  br label %512

; <label>:512:                                    ; preds = %507, %504
  %pgocount40 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 35)
  %513 = add i64 %pgocount40, 1
  store i64 %513, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 35)
  br label %514

; <label>:514:                                    ; preds = %512, %490
  %515 = load i8, i8* %39, align 1
  %516 = sext i8 %515 to i32
  %517 = icmp eq i32 %516, 108
  br i1 %517, label %518, label %527

; <label>:518:                                    ; preds = %514
  %pgocount41 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 39)
  %519 = add i64 %pgocount41, 1
  store i64 %519, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 39)
  %520 = getelementptr inbounds [5 x i8], [5 x i8]* %50, i32 0, i32 0
  %521 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %522 = call i64 @fread(i8* %520, i64 1, i64 4, %struct._IO_FILE* %521)
  %523 = getelementptr inbounds [5 x i8], [5 x i8]* %50, i64 0, i64 4
  store i8 0, i8* %523, align 1
  %524 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %525 = getelementptr inbounds [5 x i8], [5 x i8]* %50, i32 0, i32 0
  %526 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %524, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.29, i32 0, i32 0), i8* %525)
  store i32 -1, i32* %5, align 4
  br label %953

; <label>:527:                                    ; preds = %514
  %528 = bitcast i64* %33 to i8*
  %529 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %530 = call i64 @fread(i8* %528, i64 1, i64 8, %struct._IO_FILE* %529)
  br label %531

; <label>:531:                                    ; preds = %527
  %pgocount42 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 40)
  %532 = add i64 %pgocount42, 1
  store i64 %532, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 40)
  %533 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %534 = call i64 @ftell(%struct._IO_FILE* %533)
  store i64 %534, i64* %20, align 8
  br label %535

; <label>:535:                                    ; preds = %531, %402, %383
  br label %536

; <label>:536:                                    ; preds = %535, %378
  %537 = load i8, i8* %51, align 1
  %538 = icmp ne i8 %537, 0
  br i1 %538, label %539, label %549

; <label>:539:                                    ; preds = %536
  %pgocount43 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 21)
  %540 = add i64 %pgocount43, 1
  store i64 %540, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 21)
  %541 = getelementptr inbounds [256 x i8], [256 x i8]* %12, i32 0, i32 0
  %542 = getelementptr inbounds [8 x i8], [8 x i8]* %30, i32 0, i32 0
  %543 = bitcast i64* %33 to i8*
  %544 = getelementptr inbounds [256 x i8], [256 x i8]* %34, i32 0, i32 0
  %545 = getelementptr inbounds [130 x i16], [130 x i16]* %26, i32 0, i32 0
  %546 = getelementptr inbounds [130 x i16], [130 x i16]* %27, i32 0, i32 0
  %547 = call i32 @getpublickey(i32 0, i8* %541, i64* %17, i32* null, i8* %542, i8* %543, i8* %544, i16* %545, i16* %546)
  %548 = icmp slt i32 %547, 0
  br i1 %548, label %549, label %553

; <label>:549:                                    ; preds = %539, %536
  %550 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %551 = call i8* @LANG(i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.30, i32 0, i32 0))
  %552 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %550, i8* %551)
  br label %760

; <label>:553:                                    ; preds = %539
  %554 = getelementptr inbounds [260 x i8], [260 x i8]* %29, i32 0, i32 0
  %555 = getelementptr inbounds [260 x i8], [260 x i8]* %28, i32 0, i32 0
  %556 = bitcast i8* %555 to i16*
  %557 = getelementptr inbounds [130 x i16], [130 x i16]* %27, i32 0, i32 0
  %558 = getelementptr inbounds [130 x i16], [130 x i16]* %26, i32 0, i32 0
  %559 = call i32 @rsa_public_decrypt(i8* %554, i16* %556, i16* %557, i16* %558)
  store i32 %559, i32* %22, align 4
  %560 = load i8, i8* @quietmode, align 1
  %561 = icmp ne i8 %560, 0
  br i1 %561, label %566, label %562

; <label>:562:                                    ; preds = %553
  %pgocount44 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 38)
  %563 = add i64 %pgocount44, 1
  store i64 %563, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 38)
  %564 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %565 = call i32 @fputc(i32 46, %struct._IO_FILE* %564)
  br label %566

; <label>:566:                                    ; preds = %562, %553
  %567 = load i32, i32* %22, align 4
  %568 = icmp eq i32 %567, -7
  br i1 %568, label %578, label %569

; <label>:569:                                    ; preds = %566
  %pgocount45 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 32)
  %570 = add i64 %pgocount45, 1
  store i64 %570, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 32)
  %571 = load i32, i32* %22, align 4
  %572 = icmp sgt i32 %571, 0
  br i1 %572, label %573, label %583

; <label>:573:                                    ; preds = %569
  %pgocount46 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 43)
  %574 = add i64 %pgocount46, 1
  store i64 %574, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 43)
  %575 = load i32, i32* %22, align 4
  %576 = sext i32 %575 to i64
  %577 = icmp ne i64 %576, 16
  br i1 %577, label %578, label %583

; <label>:578:                                    ; preds = %573, %566
  %pgocount47 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 27)
  %579 = add i64 %pgocount47, 1
  store i64 %579, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 27)
  %580 = call i8* @LANG(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @.str.31, i32 0, i32 0))
  %581 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %582 = call i32 @fputs(i8* %580, %struct._IO_FILE* %581)
  br label %760

; <label>:583:                                    ; preds = %573, %569
  %584 = load i32, i32* %22, align 4
  %585 = icmp eq i32 %584, -5
  br i1 %585, label %586, label %591

; <label>:586:                                    ; preds = %583
  %pgocount48 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 54)
  %587 = add i64 %pgocount48, 1
  store i64 %587, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 54)
  %588 = call i8* @LANG(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.32, i32 0, i32 0))
  %589 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %590 = call i32 @fputs(i8* %588, %struct._IO_FILE* %589)
  br label %760

; <label>:591:                                    ; preds = %583
  %592 = load i32, i32* %22, align 4
  %593 = icmp eq i32 %592, -3
  br i1 %593, label %594, label %599

; <label>:594:                                    ; preds = %591
  %pgocount49 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 63)
  %595 = add i64 %pgocount49, 1
  store i64 %595, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 63)
  %596 = call i8* @LANG(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.33, i32 0, i32 0))
  %597 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %598 = call i32 @fputs(i8* %596, %struct._IO_FILE* %597)
  br label %760

; <label>:599:                                    ; preds = %591
  %600 = load i32, i32* %22, align 4
  %601 = icmp slt i32 %600, 0
  br i1 %601, label %602, label %607

; <label>:602:                                    ; preds = %599
  %pgocount50 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 69)
  %603 = add i64 %pgocount50, 1
  store i64 %603, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 69)
  %604 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %605 = call i8* @LANG(i8* getelementptr inbounds ([119 x i8], [119 x i8]* @.str.34, i32 0, i32 0))
  %606 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %604, i8* %605)
  br label %760

; <label>:607:                                    ; preds = %599
  %608 = load i32, i32* %22, align 4
  %609 = sext i32 %608 to i64
  %610 = icmp eq i64 %609, 16
  %611 = zext i1 %610 to i64
  %pgocount51 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 84)
  %612 = add i64 %pgocount51, %611
  store i64 %612, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 84)
  %613 = select i1 %610, i32 0, i32 1
  store i32 %613, i32* %52, align 4
  %614 = load i32, i32* %52, align 4
  %615 = sext i32 %614 to i64
  %616 = getelementptr inbounds [260 x i8], [260 x i8]* %29, i64 0, i64 %615
  %617 = load i8, i8* %616, align 1
  %618 = zext i8 %617 to i32
  %619 = getelementptr inbounds [2 x i8], [2 x i8]* %49, i64 0, i64 0
  %620 = load i8, i8* %619, align 1
  %621 = zext i8 %620 to i32
  %622 = icmp ne i32 %618, %621
  br i1 %622, label %635, label %623

; <label>:623:                                    ; preds = %607
  %pgocount52 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 72)
  %624 = add i64 %pgocount52, 1
  store i64 %624, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 72)
  %625 = load i32, i32* %52, align 4
  %626 = add nsw i32 %625, 1
  %627 = sext i32 %626 to i64
  %628 = getelementptr inbounds [260 x i8], [260 x i8]* %29, i64 0, i64 %627
  %629 = load i8, i8* %628, align 1
  %630 = zext i8 %629 to i32
  %631 = getelementptr inbounds [2 x i8], [2 x i8]* %49, i64 0, i64 1
  %632 = load i8, i8* %631, align 1
  %633 = zext i8 %632 to i32
  %634 = icmp ne i32 %630, %633
  br i1 %634, label %635, label %640

; <label>:635:                                    ; preds = %623, %607
  %pgocount53 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 68)
  %636 = add i64 %pgocount53, 1
  store i64 %636, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 68)
  %637 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %638 = call i8* @LANG(i8* getelementptr inbounds ([119 x i8], [119 x i8]* @.str.34, i32 0, i32 0))
  %639 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %637, i8* %638)
  br label %760

; <label>:640:                                    ; preds = %623
  %641 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %642 = load i64, i64* %20, align 8
  %643 = call i32 @fseek(%struct._IO_FILE* %641, i64 %642, i32 0)
  %644 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %645 = load i64, i64* %41, align 8
  %646 = call i32 @MDfile0_len(%struct.MD5Context* %35, %struct._IO_FILE* %644, i64 %645)
  %647 = load i8*, i8** %43, align 8
  %648 = load i8, i8* %44, align 1
  %649 = zext i8 %648 to i32
  %650 = getelementptr inbounds [16 x i8], [16 x i8]* %36, i32 0, i32 0
  call void @MD_addbuffer(%struct.MD5Context* %35, i8* %647, i32 %649, i8* %650)
  %651 = load i8*, i8** %32, align 8
  call void @hiloswap(i8* %651, i16 signext 4)
  %652 = getelementptr inbounds [256 x i8], [256 x i8]* %34, i32 0, i32 0
  call void @PascalToC(i8* %652)
  %653 = getelementptr inbounds [16 x i8], [16 x i8]* %36, i32 0, i32 0
  %654 = getelementptr inbounds [260 x i8], [260 x i8]* %29, i32 0, i32 0
  %655 = load i32, i32* %52, align 4
  %656 = sext i32 %655 to i64
  %657 = getelementptr inbounds i8, i8* %654, i64 %656
  %658 = call i32 @memcmp(i8* %653, i8* %657, i64 16) #6
  %659 = icmp ne i32 %658, 0
  br i1 %659, label %660, label %738

; <label>:660:                                    ; preds = %640
  %661 = load i8, i8* %47, align 1
  %662 = zext i8 %661 to i32
  %663 = icmp eq i32 %662, 1
  br i1 %663, label %664, label %713

; <label>:664:                                    ; preds = %660
  %pgocount54 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 74)
  %665 = add i64 %pgocount54, 1
  store i64 %665, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 74)
  %666 = load i8, i8* %37, align 1
  %667 = zext i8 %666 to i32
  %668 = icmp ne i32 %667, 0
  br i1 %668, label %669, label %713

; <label>:669:                                    ; preds = %664
  %pgocount55 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 77)
  %670 = add i64 %pgocount55, 1
  store i64 %670, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 77)
  %671 = load i8*, i8** %7, align 8
  %672 = call i32 @is_text_file(i8* %671)
  %673 = icmp ne i32 %672, 0
  br i1 %673, label %674, label %713

; <label>:674:                                    ; preds = %669
  %675 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  call void @rewind(%struct._IO_FILE* %675)
  %676 = call i8* @tempfile(i32 5)
  store i8* %676, i8** %15, align 8
  %677 = load i8, i8* @verbose, align 1
  %678 = icmp ne i8 %677, 0
  br i1 %678, label %679, label %683

; <label>:679:                                    ; preds = %674
  %pgocount56 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 80)
  %680 = add i64 %pgocount56, 1
  store i64 %680, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 80)
  %681 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %682 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %681, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.35, i32 0, i32 0))
  br label %683

; <label>:683:                                    ; preds = %679, %674
  %684 = load i8*, i8** %7, align 8
  %685 = load i8*, i8** %15, align 8
  %686 = call i32 @make_canonical(i8* %684, i8* %685)
  %687 = load i8*, i8** %15, align 8
  %688 = call %struct._IO_FILE* @fopen(i8* %687, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %688, %struct._IO_FILE** %16, align 8
  %689 = icmp ne %struct._IO_FILE* %688, null
  br i1 %689, label %690, label %711

; <label>:690:                                    ; preds = %683
  %691 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %692 = call i32 @MDfile0_len(%struct.MD5Context* %35, %struct._IO_FILE* %691, i64 -1)
  %693 = load i8*, i8** %43, align 8
  %694 = load i8, i8* %44, align 1
  %695 = zext i8 %694 to i32
  %696 = getelementptr inbounds [16 x i8], [16 x i8]* %36, i32 0, i32 0
  call void @MD_addbuffer(%struct.MD5Context* %35, i8* %693, i32 %695, i8* %696)
  %697 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %698 = call i32 @fclose(%struct._IO_FILE* %697)
  %699 = load i8*, i8** %15, align 8
  call void @rmtemp(i8* %699)
  %700 = getelementptr inbounds [16 x i8], [16 x i8]* %36, i32 0, i32 0
  %701 = getelementptr inbounds [260 x i8], [260 x i8]* %29, i32 0, i32 0
  %702 = load i32, i32* %52, align 4
  %703 = sext i32 %702 to i64
  %704 = getelementptr inbounds i8, i8* %701, i64 %703
  %705 = call i32 @memcmp(i8* %700, i8* %704, i64 16) #6
  %706 = icmp ne i32 %705, 0
  br i1 %706, label %709, label %707

; <label>:707:                                    ; preds = %690
  %pgocount57 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 83)
  %708 = add i64 %pgocount57, 1
  store i64 %708, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 83)
  br label %740

; <label>:709:                                    ; preds = %690
  %pgocount58 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 82)
  %710 = add i64 %pgocount58, 1
  store i64 %710, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 82)
  br label %711

; <label>:711:                                    ; preds = %709, %683
  %pgocount59 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 79)
  %712 = add i64 %pgocount59, 1
  store i64 %712, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 79)
  br label %713

; <label>:713:                                    ; preds = %711, %669, %664, %660
  %714 = load i32, i32* @checksig_pass, align 4
  %715 = icmp eq i32 %714, 1
  br i1 %715, label %716, label %720

; <label>:716:                                    ; preds = %713
  %pgocount60 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 75)
  %717 = add i64 %pgocount60, 1
  store i64 %717, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 75)
  %718 = load i32, i32* @checksig_pass, align 4
  %719 = add nsw i32 %718, 1
  store i32 %719, i32* @checksig_pass, align 4
  store i32 -1, i32* %5, align 4
  br label %953

; <label>:720:                                    ; preds = %713
  %721 = load i8, i8* @moreflag, align 1
  %722 = zext i8 %721 to i32
  %723 = icmp ne i32 %722, 0
  br i1 %723, label %724, label %736

; <label>:724:                                    ; preds = %720
  %pgocount61 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 78)
  %725 = add i64 %pgocount61, 1
  store i64 %725, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 78)
  %726 = load i8, i8* @batchmode, align 1
  %727 = icmp ne i8 %726, 0
  br i1 %727, label %736, label %728

; <label>:728:                                    ; preds = %724
  %pgocount62 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 81)
  %729 = add i64 %pgocount62, 1
  store i64 %729, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 81)
  %730 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %731 = call i8* @LANG(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.36, i32 0, i32 0))
  %732 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %730, i8* %731)
  %733 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %734 = call i32 @fflush(%struct._IO_FILE* %733)
  %735 = call zeroext i8 @getyesno(i8 signext 110)
  br label %736

; <label>:736:                                    ; preds = %728, %724, %720
  %pgocount63 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 76)
  %737 = add i64 %pgocount63, 1
  store i64 %737, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 76)
  br label %755

; <label>:738:                                    ; preds = %640
  %pgocount64 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 73)
  %739 = add i64 %pgocount64, 1
  store i64 %739, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 73)
  br label %740

; <label>:740:                                    ; preds = %738, %707
  store i8 1, i8* @signature_checked, align 1
  %741 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %742 = call i8* @LANG(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.37, i32 0, i32 0))
  %743 = getelementptr inbounds [256 x i8], [256 x i8]* %34, i32 0, i32 0
  %744 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %741, i8* %742, i8* %743)
  %745 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %746 = call i8* @LANG(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.38, i32 0, i32 0))
  %747 = load i8*, i8** %32, align 8
  %748 = bitcast i8* %747 to i64*
  %749 = call i8* @ctdate(i64* %748)
  %750 = getelementptr inbounds [130 x i16], [130 x i16]* %26, i32 0, i32 0
  %751 = call i32 @countbits(i16* %750)
  %752 = getelementptr inbounds [130 x i16], [130 x i16]* %26, i32 0, i32 0
  %753 = call i8* @key2IDstring(i16* %752)
  %754 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %745, i8* %746, i8* %749, i32 %751, i8* %753)
  br label %755

; <label>:755:                                    ; preds = %740, %736
  %756 = getelementptr inbounds [256 x i8], [256 x i8]* %12, i32 0, i32 0
  %757 = load i64, i64* %17, align 8
  %758 = getelementptr inbounds [256 x i8], [256 x i8]* %34, i32 0, i32 0
  %759 = call i32 @warn_signatures(i8* %756, i64 %757, i8* %758, i8 zeroext 1)
  br label %760

; <label>:760:                                    ; preds = %755, %635, %602, %594, %586, %578, %549
  %761 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %762 = load i64, i64* %20, align 8
  %763 = call i32 @fseek(%struct._IO_FILE* %761, i64 %762, i32 0)
  %764 = load i8, i8* %37, align 1
  %765 = icmp ne i8 %764, 0
  br i1 %765, label %766, label %775

; <label>:766:                                    ; preds = %760
  %767 = load i8, i8* @quietmode, align 1
  %768 = icmp ne i8 %767, 0
  br i1 %768, label %774, label %769

; <label>:769:                                    ; preds = %766
  %pgocount65 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 30)
  %770 = add i64 %pgocount65, 1
  store i64 %770, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 30)
  %771 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %772 = call i8* @LANG(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.39, i32 0, i32 0))
  %773 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %771, i8* %772)
  br label %774

; <label>:774:                                    ; preds = %769, %766
  br label %911

; <label>:775:                                    ; preds = %760
  %776 = load i8, i8* %39, align 1
  %777 = sext i8 %776 to i32
  %778 = icmp eq i32 %777, 108
  br i1 %778, label %779, label %780

; <label>:779:                                    ; preds = %775
  br label %837

; <label>:780:                                    ; preds = %775
  %781 = load i8, i8* %39, align 1
  %782 = sext i8 %781 to i32
  %783 = icmp eq i32 %782, 98
  br i1 %783, label %784, label %787

; <label>:784:                                    ; preds = %780
  %785 = load i8*, i8** %7, align 8
  %786 = call %struct._IO_FILE* @fopen(i8* %785, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %786, %struct._IO_FILE** %19, align 8
  br label %791

; <label>:787:                                    ; preds = %780
  %pgocount66 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 48)
  %788 = add i64 %pgocount66, 1
  store i64 %788, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 48)
  %789 = load i8*, i8** %7, align 8
  %790 = call %struct._IO_FILE* @fopen(i8* %789, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %790, %struct._IO_FILE** %19, align 8
  br label %791

; <label>:791:                                    ; preds = %787, %784
  %792 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %793 = icmp eq %struct._IO_FILE* %792, null
  br i1 %793, label %794, label %800

; <label>:794:                                    ; preds = %791
  %pgocount67 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 52)
  %795 = add i64 %pgocount67, 1
  store i64 %795, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 52)
  %796 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %797 = call i8* @LANG(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.40, i32 0, i32 0))
  %798 = load i8*, i8** %7, align 8
  %799 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %796, i8* %797, i8* %798)
  br label %948

; <label>:800:                                    ; preds = %791
  %801 = load i8, i8* %39, align 1
  %802 = sext i8 %801 to i32
  %803 = icmp eq i32 %802, 116
  %804 = zext i1 %803 to i64
  %pgocount68 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 85)
  %805 = add i64 %pgocount68, %804
  store i64 %805, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 85)
  %806 = select i1 %803, i32 2, i32 0
  store i32 %806, i32* @CONVERSION, align 4
  %807 = load i8, i8* %39, align 1
  %808 = sext i8 %807 to i32
  %809 = icmp eq i32 %808, 98
  br i1 %809, label %810, label %816

; <label>:810:                                    ; preds = %800
  %pgocount69 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 55)
  %811 = add i64 %pgocount69, 1
  store i64 %811, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 55)
  %812 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %813 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %814 = load i64, i64* %41, align 8
  %815 = call i32 @copyfile(%struct._IO_FILE* %812, %struct._IO_FILE* %813, i64 %814)
  store i32 %815, i32* %42, align 4
  br label %822

; <label>:816:                                    ; preds = %800
  %pgocount70 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 56)
  %817 = add i64 %pgocount70, 1
  store i64 %817, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 56)
  %818 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %819 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %820 = load i64, i64* %41, align 8
  %821 = call i32 @copyfile_from_canon(%struct._IO_FILE* %818, %struct._IO_FILE* %819, i64 %820)
  store i32 %821, i32* %42, align 4
  br label %822

; <label>:822:                                    ; preds = %816, %810
  store i32 0, i32* @CONVERSION, align 4
  %823 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %824 = call i32 @write_error(%struct._IO_FILE* %823)
  %825 = icmp ne i32 %824, 0
  br i1 %825, label %830, label %826

; <label>:826:                                    ; preds = %822
  %pgocount71 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 61)
  %827 = add i64 %pgocount71, 1
  store i64 %827, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 61)
  %828 = load i32, i32* %42, align 4
  %829 = icmp slt i32 %828, 0
  br i1 %829, label %830, label %833

; <label>:830:                                    ; preds = %826, %822
  %831 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %832 = call i32 @fclose(%struct._IO_FILE* %831)
  br label %948

; <label>:833:                                    ; preds = %826
  %pgocount72 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 66)
  %834 = add i64 %pgocount72, 1
  store i64 %834, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 66)
  %835 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %836 = call i32 @fclose(%struct._IO_FILE* %835)
  br label %837

; <label>:837:                                    ; preds = %833, %779
  %838 = load i8, i8* %8, align 1
  %839 = icmp ne i8 %838, 0
  br i1 %839, label %840, label %909

; <label>:840:                                    ; preds = %837
  %841 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  %842 = load i8*, i8** %7, align 8
  %843 = call i8* @strcpy(i8* %841, i8* %842) #5
  %844 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  call void @force_extension(i8* %844, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @SIG_EXTENSION, i32 0, i32 0))
  %845 = load i8, i8* @force_flag, align 1
  %846 = icmp ne i8 %845, 0
  br i1 %846, label %864, label %847

; <label>:847:                                    ; preds = %840
  %pgocount73 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 57)
  %848 = add i64 %pgocount73, 1
  store i64 %848, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 57)
  %849 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  %850 = call zeroext i8 @file_exists(i8* %849)
  %851 = zext i8 %850 to i32
  %852 = icmp ne i32 %851, 0
  br i1 %852, label %853, label %864

; <label>:853:                                    ; preds = %847
  %854 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %855 = call i8* @LANG(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.41, i32 0, i32 0))
  %856 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  %857 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %854, i8* %855, i8* %856)
  %858 = call zeroext i8 @getyesno(i8 signext 110)
  %859 = icmp ne i8 %858, 0
  br i1 %859, label %862, label %860

; <label>:860:                                    ; preds = %853
  %pgocount74 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 70)
  %861 = add i64 %pgocount74, 1
  store i64 %861, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 70)
  br label %948

; <label>:862:                                    ; preds = %853
  %pgocount75 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 67)
  %863 = add i64 %pgocount75, 1
  store i64 %863, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 67)
  br label %864

; <label>:864:                                    ; preds = %862, %847, %840
  %865 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  %866 = call %struct._IO_FILE* @fopen(i8* %865, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %866, %struct._IO_FILE** %19, align 8
  %867 = icmp eq %struct._IO_FILE* %866, null
  br i1 %867, label %868, label %874

; <label>:868:                                    ; preds = %864
  %pgocount76 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 60)
  %869 = add i64 %pgocount76, 1
  store i64 %869, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 60)
  %870 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %871 = call i8* @LANG(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.8, i32 0, i32 0))
  %872 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  %873 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %870, i8* %871, i8* %872)
  br label %948

; <label>:874:                                    ; preds = %864
  %875 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %876 = call i32 @fseek(%struct._IO_FILE* %875, i64 0, i32 0)
  %877 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %878 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %879 = load i16, i16* %23, align 2
  %880 = zext i16 %879 to i32
  %881 = load i8, i8* %10, align 1
  %882 = zext i8 %881 to i32
  %883 = and i32 %882, 3
  %884 = shl i32 1, %883
  %885 = add nsw i32 %880, %884
  %886 = add nsw i32 %885, 1
  %887 = sext i32 %886 to i64
  %888 = call i32 @copyfile(%struct._IO_FILE* %877, %struct._IO_FILE* %878, i64 %887)
  %889 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %890 = call i32 @write_error(%struct._IO_FILE* %889)
  %891 = icmp ne i32 %890, 0
  br i1 %891, label %892, label %896

; <label>:892:                                    ; preds = %874
  %pgocount77 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 58)
  %893 = add i64 %pgocount77, 1
  store i64 %893, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 58)
  %894 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %895 = call i32 @fclose(%struct._IO_FILE* %894)
  br label %948

; <label>:896:                                    ; preds = %874
  %897 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %898 = call i32 @fclose(%struct._IO_FILE* %897)
  %899 = load i8, i8* @quietmode, align 1
  %900 = icmp ne i8 %899, 0
  br i1 %900, label %907, label %901

; <label>:901:                                    ; preds = %896
  %pgocount78 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 71)
  %902 = add i64 %pgocount78, 1
  store i64 %902, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 71)
  %903 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %904 = call i8* @LANG(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.42, i32 0, i32 0))
  %905 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  %906 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %903, i8* %904, i8* %905)
  br label %907

; <label>:907:                                    ; preds = %901, %896
  %pgocount79 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 64)
  %908 = add i64 %pgocount79, 1
  store i64 %908, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 64)
  br label %909

; <label>:909:                                    ; preds = %907, %837
  %pgocount80 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 45)
  %910 = add i64 %pgocount80, 1
  store i64 %910, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 45)
  br label %911

; <label>:911:                                    ; preds = %909, %774
  %912 = bitcast [260 x i8]* %28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %912, i8 0, i64 260, i32 16, i1 false)
  %913 = bitcast [260 x i8]* %29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %913, i8 0, i64 260, i32 16, i1 false)
  %914 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %915 = call i32 @fclose(%struct._IO_FILE* %914)
  %916 = load i8, i8* %37, align 1
  %917 = icmp ne i8 %916, 0
  br i1 %917, label %918, label %920

; <label>:918:                                    ; preds = %911
  %pgocount81 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 23)
  %919 = add i64 %pgocount81, 1
  store i64 %919, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 23)
  store i32 0, i32* %5, align 4
  br label %953

; <label>:920:                                    ; preds = %911
  %921 = load i8, i8* %11, align 1
  %922 = zext i8 %921 to i32
  %923 = and i32 %922, 128
  %924 = icmp eq i32 %923, 128
  br i1 %924, label %925, label %938

; <label>:925:                                    ; preds = %920
  %pgocount82 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 41)
  %926 = add i64 %pgocount82, 1
  store i64 %926, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 41)
  %927 = load i8, i8* %11, align 1
  %928 = zext i8 %927 to i32
  %929 = and i32 %928, 124
  %930 = icmp eq i32 %929, 40
  br i1 %930, label %936, label %931

; <label>:931:                                    ; preds = %925
  %pgocount83 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 53)
  %932 = add i64 %pgocount83, 1
  store i64 %932, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 53)
  %933 = load i8, i8* %38, align 1
  %934 = zext i8 %933 to i32
  %935 = icmp ne i32 %934, 0
  br i1 %935, label %936, label %938

; <label>:936:                                    ; preds = %931, %925
  %pgocount84 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 44)
  %937 = add i64 %pgocount84, 1
  store i64 %937, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 44)
  store i32 0, i32* %5, align 4
  br label %953

; <label>:938:                                    ; preds = %931, %920
  %pgocount85 = load i64, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 36)
  %939 = add i64 %pgocount85, 1
  store i64 %939, i64* getelementptr inbounds ([86 x i64], [86 x i64]* @__profc_check_signaturefile, i64 0, i64 36)
  store i32 1, i32* %5, align 4
  br label %953

; <label>:940:                                    ; preds = %291, %126, %115, %98
  %941 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %942 = call i8* @LANG(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.43, i32 0, i32 0))
  %943 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %941, i8* %942)
  %944 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %945 = call i8* @LANG(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.44, i32 0, i32 0))
  %946 = load i8*, i8** %6, align 8
  %947 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %944, i8* %945, i8* %946)
  br label %948

; <label>:948:                                    ; preds = %940, %892, %868, %860, %830, %794, %426, %269, %230, %220, %154, %136
  %949 = bitcast [260 x i8]* %28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %949, i8 0, i64 260, i32 16, i1 false)
  %950 = bitcast [260 x i8]* %29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %950, i8 0, i64 260, i32 16, i1 false)
  %951 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %952 = call i32 @fclose(%struct._IO_FILE* %951)
  store i32 -1, i32* %5, align 4
  br label %953

; <label>:953:                                    ; preds = %948, %938, %936, %918, %716, %518, %372, %363, %351, %75
  %954 = load i32, i32* %5, align 4
  ret i32 %954
}

declare i32 @countbits(i16*) #1

declare zeroext i8 @file_exists(i8*) #1

declare void @drop_extension(i8*) #1

declare i32 @getstring(i8*, i32, i32) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

declare i32 @rsa_public_decrypt(i8*, i16*, i16*, i16*) #1

declare i32 @fputc(i32, %struct._IO_FILE*) #1

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

declare void @MD_addbuffer(%struct.MD5Context*, i8*, i32, i8*) #1

declare i32 @is_text_file(i8*) #1

declare i32 @make_canonical(i8*, i8*) #1

declare void @rmtemp(i8*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare i8* @key2IDstring(i16*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @warn_signatures(i8*, i64, i8*, i8 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8, align 1
  %10 = alloca %struct._IO_FILE*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca i8, align 1
  %14 = alloca i32, align 4
  %15 = alloca [256 x i8], align 16
  store i8* %0, i8** %6, align 8
  store i64 %1, i64* %7, align 8
  store i8* %2, i8** %8, align 8
  store i8 %3, i8* %9, align 1
  store i32 -1, i32* %14, align 4
  store i8 0, i8* %13, align 1
  %16 = load i8*, i8** %6, align 8
  %17 = load i64, i64* %7, align 8
  %18 = load i8*, i8** %8, align 8
  %19 = call i32 @getpubuserid(i8* %16, i64 %17, i8* %18, i64* %11, i32* %12, i8 zeroext 0)
  %20 = icmp sge i32 %19, 0
  br i1 %20, label %21, label %66

; <label>:21:                                     ; preds = %4
  %22 = load i8*, i8** %6, align 8
  %23 = call %struct._IO_FILE* @fopen(i8* %22, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %23, %struct._IO_FILE** %10, align 8
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %25 = load i64, i64* %11, align 8
  %26 = load i32, i32* %12, align 4
  %27 = sext i32 %26 to i64
  %28 = add nsw i64 %25, %27
  %29 = call i32 @fseek(%struct._IO_FILE* %24, i64 %28, i32 0)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %31 = call i32 @read_trust(%struct._IO_FILE* %30, i8* %13)
  store i32 %31, i32* %14, align 4
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %33 = load i64, i64* %7, align 8
  %34 = call i32 @fseek(%struct._IO_FILE* %32, i64 %33, i32 0)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %36 = call i32 @is_compromised(%struct._IO_FILE* %35)
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %62

; <label>:38:                                     ; preds = %21
  %39 = load i8*, i8** %8, align 8
  call void @CToPascal(i8* %39)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.57, i32 0, i32 0))
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %43 = load i64, i64* %7, align 8
  %44 = call i32 @show_key(%struct._IO_FILE* %42, i64 %43, i32 0)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %46 = call i32 @fclose(%struct._IO_FILE* %45)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %48 = call i8* @LANG(i8* getelementptr inbounds ([102 x i8], [102 x i8]* @.str.87, i32 0, i32 0))
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* %48)
  %50 = load i8, i8* %9, align 1
  %51 = icmp ne i8 %50, 0
  br i1 %51, label %52, label %57

; <label>:52:                                     ; preds = %38
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 2)
  %53 = add i64 %pgocount, 1
  store i64 %53, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 2)
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %55 = call i8* @LANG(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.88, i32 0, i32 0))
  %56 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* %55)
  store i32 1, i32* %5, align 4
  br label %175

; <label>:57:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 9)
  %58 = add i64 %pgocount1, 1
  store i64 %58, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 9)
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %60 = call i8* @LANG(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.89, i32 0, i32 0))
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* %60)
  store i32 -1, i32* %5, align 4
  br label %175

; <label>:62:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 3)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 3)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %65 = call i32 @fclose(%struct._IO_FILE* %64)
  br label %66

; <label>:66:                                     ; preds = %62, %4
  %67 = load i8*, i8** %8, align 8
  call void @CToPascal(i8* %67)
  %68 = load i8, i8* %13, align 1
  %69 = zext i8 %68 to i32
  %70 = and i32 %69, 3
  %71 = icmp ne i32 %70, 3
  br i1 %71, label %72, label %173

; <label>:72:                                     ; preds = %66
  %73 = load i8*, i8** %8, align 8
  call void @PascalToC(i8* %73)
  %74 = getelementptr inbounds [256 x i8], [256 x i8]* %15, i32 0, i32 0
  %75 = load i8*, i8** %8, align 8
  %76 = call i8* @strcpy(i8* %74, i8* %75) #5
  %77 = load i8*, i8** %8, align 8
  call void @CToPascal(i8* %77)
  %78 = load i8, i8* %13, align 1
  %79 = zext i8 %78 to i32
  %80 = and i32 %79, 3
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %88

; <label>:82:                                     ; preds = %72
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 7)
  %83 = add i64 %pgocount3, 1
  store i64 %83, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 7)
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %85 = call i8* @LANG(i8* getelementptr inbounds ([165 x i8], [165 x i8]* @.str.90, i32 0, i32 0))
  %86 = getelementptr inbounds [256 x i8], [256 x i8]* %15, i32 0, i32 0
  %87 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %84, i8* %85, i8* %86)
  br label %88

; <label>:88:                                     ; preds = %82, %72
  %89 = load i8, i8* %13, align 1
  %90 = zext i8 %89 to i32
  %91 = and i32 %90, 3
  %92 = icmp eq i32 %91, 1
  br i1 %92, label %93, label %99

; <label>:93:                                     ; preds = %88
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 4)
  %94 = add i64 %pgocount4, 1
  store i64 %94, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 4)
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %96 = call i8* @LANG(i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.91, i32 0, i32 0))
  %97 = getelementptr inbounds [256 x i8], [256 x i8]* %15, i32 0, i32 0
  %98 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %95, i8* %96, i8* %97)
  br label %99

; <label>:99:                                     ; preds = %93, %88
  %100 = load i8, i8* %13, align 1
  %101 = zext i8 %100 to i32
  %102 = and i32 %101, 3
  %103 = icmp eq i32 %102, 2
  br i1 %103, label %104, label %110

; <label>:104:                                    ; preds = %99
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 5)
  %105 = add i64 %pgocount5, 1
  store i64 %105, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 5)
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %107 = call i8* @LANG(i8* getelementptr inbounds ([171 x i8], [171 x i8]* @.str.92, i32 0, i32 0))
  %108 = getelementptr inbounds [256 x i8], [256 x i8]* %15, i32 0, i32 0
  %109 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %106, i8* %107, i8* %108)
  br label %110

; <label>:110:                                    ; preds = %104, %99
  %111 = load i8, i8* %13, align 1
  %112 = zext i8 %111 to i32
  %113 = and i32 %112, 128
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %120

; <label>:115:                                    ; preds = %110
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 6)
  %116 = add i64 %pgocount6, 1
  store i64 %116, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 6)
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %118 = call i8* @LANG(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.93, i32 0, i32 0))
  %119 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %117, i8* %118)
  br label %120

; <label>:120:                                    ; preds = %115, %110
  %121 = load i8, i8* @filter_mode, align 1
  %122 = icmp ne i8 %121, 0
  br i1 %122, label %171, label %123

; <label>:123:                                    ; preds = %120
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 8)
  %124 = add i64 %pgocount7, 1
  store i64 %124, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 8)
  %125 = load i8, i8* @batchmode, align 1
  %126 = icmp ne i8 %125, 0
  br i1 %126, label %171, label %127

; <label>:127:                                    ; preds = %123
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 10)
  %128 = add i64 %pgocount8, 1
  store i64 %128, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 10)
  %129 = load i8, i8* %9, align 1
  %130 = icmp ne i8 %129, 0
  br i1 %130, label %171, label %131

; <label>:131:                                    ; preds = %127
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 11)
  %132 = add i64 %pgocount9, 1
  store i64 %132, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 11)
  %133 = load i8, i8* %13, align 1
  %134 = zext i8 %133 to i32
  %135 = and i32 %134, 128
  %136 = icmp ne i32 %135, 0
  br i1 %136, label %171, label %137

; <label>:137:                                    ; preds = %131
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %139 = call i8* @LANG(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.94, i32 0, i32 0))
  %140 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %138, i8* %139)
  %141 = call zeroext i8 @getyesno(i8 signext 110)
  %142 = icmp ne i8 %141, 0
  br i1 %142, label %145, label %143

; <label>:143:                                    ; preds = %137
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 13)
  %144 = add i64 %pgocount10, 1
  store i64 %144, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 13)
  store i32 -1, i32* %5, align 4
  br label %175

; <label>:145:                                    ; preds = %137
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 12)
  %146 = add i64 %pgocount11, 1
  store i64 %146, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 12)
  %147 = load i32, i32* %14, align 4
  %148 = icmp eq i32 %147, 0
  br i1 %148, label %149, label %170

; <label>:149:                                    ; preds = %145
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 14)
  %150 = add i64 %pgocount12, 1
  store i64 %150, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 14)
  %151 = load i8*, i8** %6, align 8
  %152 = call %struct._IO_FILE* @fopen(i8* %151, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.95, i32 0, i32 0))
  store %struct._IO_FILE* %152, %struct._IO_FILE** %10, align 8
  %153 = icmp ne %struct._IO_FILE* %152, null
  br i1 %153, label %154, label %170

; <label>:154:                                    ; preds = %149
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 15)
  %155 = add i64 %pgocount13, 1
  store i64 %155, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 15)
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %157 = load i64, i64* %11, align 8
  %158 = load i32, i32* %12, align 4
  %159 = sext i32 %158 to i64
  %160 = add nsw i64 %157, %159
  %161 = call i32 @fseek(%struct._IO_FILE* %156, i64 %160, i32 0)
  %162 = load i8, i8* %13, align 1
  %163 = zext i8 %162 to i32
  %164 = or i32 %163, 128
  %165 = trunc i32 %164 to i8
  store i8 %165, i8* %13, align 1
  %166 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %167 = load i8, i8* %13, align 1
  call void @write_trust(%struct._IO_FILE* %166, i8 zeroext %167)
  %168 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %169 = call i32 @fclose(%struct._IO_FILE* %168)
  br label %170

; <label>:170:                                    ; preds = %154, %149, %145
  br label %171

; <label>:171:                                    ; preds = %170, %131, %127, %123, %120
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 1)
  %172 = add i64 %pgocount14, 1
  store i64 %172, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 1)
  br label %173

; <label>:173:                                    ; preds = %171, %66
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 0)
  %174 = add i64 %pgocount15, 1
  store i64 %174, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_warn_signatures, i64 0, i64 0)
  store i32 0, i32* %5, align 4
  br label %175

; <label>:175:                                    ; preds = %173, %143, %57, %52
  %176 = load i32, i32* %5, align 4
  ret i32 %176
}

declare i32 @copyfile_from_canon(%struct._IO_FILE*, %struct._IO_FILE*, i64) #1

declare void @force_extension(i8*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @check_key_sig(%struct._IO_FILE*, i64, i32, i8*, %struct._IO_FILE*, i64, i8*, i8*, i8*, i8*) #0 {
  %11 = alloca i32, align 4
  %12 = alloca %struct._IO_FILE*, align 8
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca %struct._IO_FILE*, align 8
  %17 = alloca i64, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i8, align 1
  %23 = alloca i64, align 8
  %24 = alloca i16, align 2
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca [286 x i8], align 16
  %28 = alloca i8*, align 8
  %29 = alloca [130 x i16], align 16
  %30 = alloca [130 x i16], align 16
  %31 = alloca [260 x i8], align 16
  %32 = alloca [260 x i8], align 16
  %33 = alloca [8 x i8], align 1
  %34 = alloca %struct.MD5Context, align 8
  %35 = alloca [16 x i8], align 16
  %36 = alloca i8*, align 8
  %37 = alloca i64, align 8
  %38 = alloca i8*, align 8
  %39 = alloca i8, align 1
  %40 = alloca i8, align 1
  %41 = alloca i8, align 1
  %42 = alloca i8, align 1
  %43 = alloca [2 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %12, align 8
  store i64 %1, i64* %13, align 8
  store i32 %2, i32* %14, align 4
  store i8* %3, i8** %15, align 8
  store %struct._IO_FILE* %4, %struct._IO_FILE** %16, align 8
  store i64 %5, i64* %17, align 8
  store i8* %6, i8** %18, align 8
  store i8* %7, i8** %19, align 8
  store i8* %8, i8** %20, align 8
  store i8* %9, i8** %21, align 8
  %44 = bitcast i64* %37 to i8*
  store i8* %44, i8** %38, align 8
  %45 = getelementptr inbounds [8 x i8], [8 x i8]* %33, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %45, i8 0, i64 8, i32 1, i1 false)
  store i16 130, i16* @global_precision, align 2
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %47 = load i64, i64* %17, align 8
  %48 = call i32 @fseek(%struct._IO_FILE* %46, i64 %47, i32 0)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %50 = call i64 @fread(i8* %22, i64 1, i64 1, %struct._IO_FILE* %49)
  %51 = getelementptr inbounds [286 x i8], [286 x i8]* %27, i32 0, i32 0
  store i8* %51, i8** %28, align 8
  %52 = load i8, i8* %22, align 1
  %53 = load i8*, i8** %28, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %28, align 8
  store i8 %52, i8* %53, align 1
  %55 = load i8, i8* %22, align 1
  %56 = zext i8 %55 to i32
  %57 = and i32 %56, 128
  %58 = icmp eq i32 %57, 128
  br i1 %58, label %59, label %65

; <label>:59:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 1)
  %60 = add i64 %pgocount, 1
  store i64 %60, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 1)
  %61 = load i8, i8* %22, align 1
  %62 = zext i8 %61 to i32
  %63 = and i32 %62, 124
  %64 = icmp eq i32 %63, 8
  br i1 %64, label %67, label %65

; <label>:65:                                     ; preds = %59, %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 0)
  %66 = add i64 %pgocount1, 1
  store i64 %66, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 0)
  br label %322

; <label>:67:                                     ; preds = %59
  %68 = load i8, i8* %22, align 1
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %70 = call i64 @getpastlength(i8 zeroext %68, %struct._IO_FILE* %69)
  %71 = trunc i64 %70 to i16
  store i16 %71, i16* %24, align 2
  %72 = load i8, i8* %22, align 1
  %73 = zext i8 %72 to i32
  %74 = and i32 %73, 3
  %75 = shl i32 1, %74
  %76 = load i8*, i8** %28, align 8
  %77 = sext i32 %75 to i64
  %78 = getelementptr inbounds i8, i8* %76, i64 %77
  store i8* %78, i8** %28, align 8
  %79 = load i16, i16* %24, align 2
  %80 = zext i16 %79 to i32
  %81 = icmp sgt i32 %80, 283
  br i1 %81, label %82, label %84

; <label>:82:                                     ; preds = %67
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 4)
  %83 = add i64 %pgocount2, 1
  store i64 %83, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 4)
  br label %322

; <label>:84:                                     ; preds = %67
  %85 = load i8*, i8** %28, align 8
  %86 = load i16, i16* %24, align 2
  %87 = zext i16 %86 to i64
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %89 = call i64 @fread(i8* %85, i64 1, i64 %87, %struct._IO_FILE* %88)
  %90 = load i16, i16* %24, align 2
  %91 = zext i16 %90 to i64
  %92 = icmp ult i64 %89, %91
  br i1 %92, label %93, label %95

; <label>:93:                                     ; preds = %84
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 5)
  %94 = add i64 %pgocount3, 1
  store i64 %94, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 5)
  br label %322

; <label>:95:                                     ; preds = %84
  %96 = load i8*, i8** %28, align 8
  %97 = getelementptr inbounds i8, i8* %96, i32 1
  store i8* %97, i8** %28, align 8
  %98 = load i8, i8* %96, align 1
  store i8 %98, i8* %39, align 1
  %99 = load i8, i8* %39, align 1
  %100 = zext i8 %99 to i32
  %101 = call i32 @version_byte_error(i32 %100)
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %105

; <label>:103:                                    ; preds = %95
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 6)
  %104 = add i64 %pgocount4, 1
  store i64 %104, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 6)
  store i32 -8, i32* %11, align 4
  br label %326

; <label>:105:                                    ; preds = %95
  %106 = load i8*, i8** %28, align 8
  %107 = getelementptr inbounds i8, i8* %106, i32 1
  store i8* %107, i8** %28, align 8
  %108 = load i8, i8* %106, align 1
  store i8 %108, i8* %40, align 1
  %109 = load i8, i8* %40, align 1
  %110 = zext i8 %109 to i32
  %111 = call i32 @version_error(i32 %110, i32 5)
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %115

; <label>:113:                                    ; preds = %105
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 7)
  %114 = add i64 %pgocount5, 1
  store i64 %114, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 7)
  store i32 -8, i32* %11, align 4
  br label %326

; <label>:115:                                    ; preds = %105
  %116 = load i8*, i8** %28, align 8
  store i8* %116, i8** %36, align 8
  %117 = load i8*, i8** %28, align 8
  %118 = getelementptr inbounds i8, i8* %117, i32 1
  store i8* %118, i8** %28, align 8
  %119 = load i8, i8* %117, align 1
  store i8 %119, i8* %41, align 1
  %120 = load i8*, i8** %21, align 8
  store i8 %119, i8* %120, align 1
  %121 = load i8, i8* %41, align 1
  %122 = zext i8 %121 to i32
  %123 = icmp ne i32 %122, 16
  br i1 %123, label %124, label %149

; <label>:124:                                    ; preds = %115
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 9)
  %125 = add i64 %pgocount6, 1
  store i64 %125, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 9)
  %126 = load i8, i8* %41, align 1
  %127 = zext i8 %126 to i32
  %128 = icmp ne i32 %127, 17
  br i1 %128, label %129, label %149

; <label>:129:                                    ; preds = %124
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 10)
  %130 = add i64 %pgocount7, 1
  store i64 %130, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 10)
  %131 = load i8, i8* %41, align 1
  %132 = zext i8 %131 to i32
  %133 = icmp ne i32 %132, 18
  br i1 %133, label %134, label %149

; <label>:134:                                    ; preds = %129
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 12)
  %135 = add i64 %pgocount8, 1
  store i64 %135, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 12)
  %136 = load i8, i8* %41, align 1
  %137 = zext i8 %136 to i32
  %138 = icmp ne i32 %137, 19
  br i1 %138, label %139, label %149

; <label>:139:                                    ; preds = %134
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 13)
  %140 = add i64 %pgocount9, 1
  store i64 %140, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 13)
  %141 = load i8, i8* %41, align 1
  %142 = zext i8 %141 to i32
  %143 = icmp ne i32 %142, 32
  br i1 %143, label %144, label %149

; <label>:144:                                    ; preds = %139
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 16)
  %145 = add i64 %pgocount10, 1
  store i64 %145, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 16)
  %146 = load i8, i8* %41, align 1
  %147 = zext i8 %146 to i32
  %148 = call i32 @version_error(i32 %147, i32 16)
  store i32 -8, i32* %11, align 4
  br label %326

; <label>:149:                                    ; preds = %139, %134, %129, %124, %115
  store i32 0, i32* %25, align 4
  br label %150

; <label>:150:                                    ; preds = %162, %149
  %151 = load i32, i32* %25, align 4
  %152 = icmp slt i32 %151, 4
  br i1 %152, label %153, label %165

; <label>:153:                                    ; preds = %150
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 2)
  %154 = add i64 %pgocount11, 1
  store i64 %154, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 2)
  %155 = load i8*, i8** %28, align 8
  %156 = getelementptr inbounds i8, i8* %155, i32 1
  store i8* %156, i8** %28, align 8
  %157 = load i8, i8* %155, align 1
  %158 = load i8*, i8** %38, align 8
  %159 = load i32, i32* %25, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i8, i8* %158, i64 %160
  store i8 %157, i8* %161, align 1
  br label %162

; <label>:162:                                    ; preds = %153
  %163 = load i32, i32* %25, align 4
  %164 = add nsw i32 %163, 1
  store i32 %164, i32* %25, align 4
  br label %150

; <label>:165:                                    ; preds = %150
  store i32 0, i32* %25, align 4
  br label %166

; <label>:166:                                    ; preds = %177, %165
  %167 = load i32, i32* %25, align 4
  %168 = icmp slt i32 %167, 8
  br i1 %168, label %169, label %180

; <label>:169:                                    ; preds = %166
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 3)
  %170 = add i64 %pgocount12, 1
  store i64 %170, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 3)
  %171 = load i8*, i8** %28, align 8
  %172 = getelementptr inbounds i8, i8* %171, i32 1
  store i8* %172, i8** %28, align 8
  %173 = load i8, i8* %171, align 1
  %174 = load i32, i32* %25, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [8 x i8], [8 x i8]* %33, i64 0, i64 %175
  store i8 %173, i8* %176, align 1
  br label %177

; <label>:177:                                    ; preds = %169
  %178 = load i32, i32* %25, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, i32* %25, align 4
  br label %166

; <label>:180:                                    ; preds = %166
  %181 = load i8*, i8** %28, align 8
  %182 = getelementptr inbounds i8, i8* %181, i32 1
  store i8* %182, i8** %28, align 8
  %183 = load i8, i8* %181, align 1
  store i8 %183, i8* %42, align 1
  %184 = load i8, i8* %42, align 1
  %185 = zext i8 %184 to i32
  %186 = call i32 @version_error(i32 %185, i32 1)
  %187 = icmp ne i32 %186, 0
  br i1 %187, label %188, label %190

; <label>:188:                                    ; preds = %180
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 8)
  %189 = add i64 %pgocount13, 1
  store i64 %189, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 8)
  store i32 -6, i32* %11, align 4
  br label %326

; <label>:190:                                    ; preds = %180
  %191 = load i8*, i8** %28, align 8
  %192 = getelementptr inbounds i8, i8* %191, i32 1
  store i8* %192, i8** %28, align 8
  %193 = load i8, i8* %191, align 1
  store i8 %193, i8* %42, align 1
  %194 = load i8, i8* %42, align 1
  %195 = zext i8 %194 to i32
  %196 = call i32 @version_error(i32 %195, i32 1)
  %197 = icmp ne i32 %196, 0
  br i1 %197, label %198, label %200

; <label>:198:                                    ; preds = %190
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 11)
  %199 = add i64 %pgocount14, 1
  store i64 %199, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 11)
  store i32 -7, i32* %11, align 4
  br label %326

; <label>:200:                                    ; preds = %190
  %201 = load i8*, i8** %28, align 8
  %202 = getelementptr inbounds i8, i8* %201, i32 1
  store i8* %202, i8** %28, align 8
  %203 = load i8, i8* %201, align 1
  %204 = getelementptr inbounds [2 x i8], [2 x i8]* %43, i64 0, i64 0
  store i8 %203, i8* %204, align 1
  %205 = load i8*, i8** %28, align 8
  %206 = getelementptr inbounds i8, i8* %205, i32 1
  store i8* %206, i8** %28, align 8
  %207 = load i8, i8* %205, align 1
  %208 = getelementptr inbounds [2 x i8], [2 x i8]* %43, i64 0, i64 1
  store i8 %207, i8* %208, align 1
  %209 = load i8*, i8** %18, align 8
  %210 = getelementptr inbounds [8 x i8], [8 x i8]* %33, i32 0, i32 0
  %211 = load i8*, i8** %20, align 8
  %212 = load i8*, i8** %19, align 8
  %213 = getelementptr inbounds [130 x i16], [130 x i16]* %29, i32 0, i32 0
  %214 = getelementptr inbounds [130 x i16], [130 x i16]* %30, i32 0, i32 0
  %215 = call i32 @getpublickey(i32 1, i8* %209, i64* %23, i32* null, i8* %210, i8* %211, i8* %212, i16* %213, i16* %214)
  %216 = icmp slt i32 %215, 0
  br i1 %216, label %217, label %219

; <label>:217:                                    ; preds = %200
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 14)
  %218 = add i64 %pgocount15, 1
  store i64 %218, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 14)
  store i32 -2, i32* %11, align 4
  br label %326

; <label>:219:                                    ; preds = %200
  %220 = getelementptr inbounds [260 x i8], [260 x i8]* %31, i32 0, i32 0
  %221 = bitcast i8* %220 to i16*
  %222 = load i8*, i8** %28, align 8
  %223 = call signext i16 @mpi2reg(i16* %221, i8* %222)
  %224 = sext i16 %223 to i32
  %225 = icmp eq i32 %224, -1
  br i1 %225, label %226, label %228

; <label>:226:                                    ; preds = %219
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 15)
  %227 = add i64 %pgocount16, 1
  store i64 %227, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 15)
  store i32 -10, i32* %11, align 4
  br label %326

; <label>:228:                                    ; preds = %219
  %229 = getelementptr inbounds [260 x i8], [260 x i8]* %31, i32 0, i32 0
  %230 = bitcast i8* %229 to i16*
  %231 = call i32 @countbits(i16* %230)
  %232 = add nsw i32 %231, 7
  %233 = ashr i32 %232, 3
  %234 = add nsw i32 %233, 2
  %235 = load i8*, i8** %28, align 8
  %236 = sext i32 %234 to i64
  %237 = getelementptr inbounds i8, i8* %235, i64 %236
  store i8* %237, i8** %28, align 8
  %238 = load i8*, i8** %28, align 8
  %239 = getelementptr inbounds [286 x i8], [286 x i8]* %27, i32 0, i32 0
  %240 = ptrtoint i8* %238 to i64
  %241 = ptrtoint i8* %239 to i64
  %242 = sub i64 %240, %241
  %243 = load i16, i16* %24, align 2
  %244 = zext i16 %243 to i32
  %245 = add nsw i32 %244, 3
  %246 = sext i32 %245 to i64
  %247 = icmp ne i64 %242, %246
  br i1 %247, label %248, label %250

; <label>:248:                                    ; preds = %228
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 17)
  %249 = add i64 %pgocount17, 1
  store i64 %249, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 17)
  store i32 -10, i32* %11, align 4
  br label %326

; <label>:250:                                    ; preds = %228
  %251 = getelementptr inbounds [260 x i8], [260 x i8]* %32, i32 0, i32 0
  %252 = getelementptr inbounds [260 x i8], [260 x i8]* %31, i32 0, i32 0
  %253 = bitcast i8* %252 to i16*
  %254 = getelementptr inbounds [130 x i16], [130 x i16]* %30, i32 0, i32 0
  %255 = getelementptr inbounds [130 x i16], [130 x i16]* %29, i32 0, i32 0
  %256 = call i32 @rsa_public_decrypt(i8* %251, i16* %253, i16* %254, i16* %255)
  store i32 %256, i32* %26, align 4
  %257 = load i32, i32* %26, align 4
  %258 = icmp slt i32 %257, 0
  br i1 %258, label %259, label %262

; <label>:259:                                    ; preds = %250
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 18)
  %260 = add i64 %pgocount18, 1
  store i64 %260, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 18)
  %261 = load i32, i32* %26, align 4
  store i32 %261, i32* %11, align 4
  br label %326

; <label>:262:                                    ; preds = %250
  %263 = load i32, i32* %26, align 4
  %264 = sext i32 %263 to i64
  %265 = icmp ne i64 %264, 16
  br i1 %265, label %266, label %268

; <label>:266:                                    ; preds = %262
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 19)
  %267 = add i64 %pgocount19, 1
  store i64 %267, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 19)
  store i32 -9, i32* %11, align 4
  br label %326

; <label>:268:                                    ; preds = %262
  %269 = getelementptr inbounds [260 x i8], [260 x i8]* %32, i64 0, i64 0
  %270 = load i8, i8* %269, align 16
  %271 = zext i8 %270 to i32
  %272 = getelementptr inbounds [2 x i8], [2 x i8]* %43, i64 0, i64 0
  %273 = load i8, i8* %272, align 1
  %274 = zext i8 %273 to i32
  %275 = icmp ne i32 %271, %274
  br i1 %275, label %285, label %276

; <label>:276:                                    ; preds = %268
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 21)
  %277 = add i64 %pgocount20, 1
  store i64 %277, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 21)
  %278 = getelementptr inbounds [260 x i8], [260 x i8]* %32, i64 0, i64 1
  %279 = load i8, i8* %278, align 1
  %280 = zext i8 %279 to i32
  %281 = getelementptr inbounds [2 x i8], [2 x i8]* %43, i64 0, i64 1
  %282 = load i8, i8* %281, align 1
  %283 = zext i8 %282 to i32
  %284 = icmp ne i32 %280, %283
  br i1 %284, label %285, label %287

; <label>:285:                                    ; preds = %276, %268
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 20)
  %286 = add i64 %pgocount21, 1
  store i64 %286, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 20)
  store i32 -9, i32* %11, align 4
  br label %326

; <label>:287:                                    ; preds = %276
  %288 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %289 = load i64, i64* %13, align 8
  %290 = call i32 @fseek(%struct._IO_FILE* %288, i64 %289, i32 0)
  %291 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %292 = load i32, i32* %14, align 4
  %293 = sext i32 %292 to i64
  %294 = call i32 @MDfile0_len(%struct.MD5Context* %34, %struct._IO_FILE* %291, i64 %293)
  %295 = load i8, i8* %41, align 1
  %296 = zext i8 %295 to i32
  %297 = icmp ne i32 %296, 32
  br i1 %297, label %298, label %306

; <label>:298:                                    ; preds = %287
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 23)
  %299 = add i64 %pgocount22, 1
  store i64 %299, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 23)
  %300 = load i8*, i8** %15, align 8
  %301 = getelementptr inbounds i8, i8* %300, i64 1
  %302 = load i8*, i8** %15, align 8
  %303 = getelementptr inbounds i8, i8* %302, i64 0
  %304 = load i8, i8* %303, align 1
  %305 = zext i8 %304 to i32
  call void @MD5Update(%struct.MD5Context* %34, i8* %301, i32 %305)
  br label %306

; <label>:306:                                    ; preds = %298, %287
  %307 = load i8*, i8** %36, align 8
  %308 = load i8, i8* %40, align 1
  %309 = zext i8 %308 to i32
  %310 = getelementptr inbounds [16 x i8], [16 x i8]* %35, i32 0, i32 0
  call void @MD_addbuffer(%struct.MD5Context* %34, i8* %307, i32 %309, i8* %310)
  %311 = getelementptr inbounds [16 x i8], [16 x i8]* %35, i32 0, i32 0
  %312 = getelementptr inbounds [260 x i8], [260 x i8]* %32, i32 0, i32 0
  %313 = call i32 @memcmp(i8* %311, i8* %312, i64 16) #6
  %314 = icmp ne i32 %313, 0
  br i1 %314, label %315, label %317

; <label>:315:                                    ; preds = %306
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 22)
  %316 = add i64 %pgocount23, 1
  store i64 %316, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 22)
  store i32 -20, i32* %11, align 4
  br label %326

; <label>:317:                                    ; preds = %306
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 24)
  %318 = add i64 %pgocount24, 1
  store i64 %318, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_check_key_sig, i64 0, i64 24)
  %319 = load i8*, i8** %38, align 8
  call void @hiloswap(i8* %319, i16 signext 4)
  %320 = load i8*, i8** %20, align 8
  %321 = load i8*, i8** %38, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %320, i8* %321, i64 4, i32 1, i1 false)
  store i32 0, i32* %11, align 4
  br label %326

; <label>:322:                                    ; preds = %93, %82, %65
  %323 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %324 = call i8* @LANG(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.43, i32 0, i32 0))
  %325 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %323, i8* %324)
  store i32 -10, i32* %11, align 4
  br label %326

; <label>:326:                                    ; preds = %322, %317, %315, %285, %266, %259, %248, %226, %217, %198, %188, %144, %113, %103
  %327 = load i32, i32* %11, align 4
  ret i32 %327
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: noinline nounwind uwtable
define i32 @squish_file(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %8 = load i8, i8* @verbose, align 1
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 0)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %13 = load i8*, i8** %4, align 8
  %14 = load i8*, i8** %5, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.45, i32 0, i32 0), i8* %13, i8* %14)
  br label %16

; <label>:16:                                     ; preds = %10, %2
  %17 = load i8*, i8** %4, align 8
  %18 = call %struct._IO_FILE* @fopen(i8* %17, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %18, %struct._IO_FILE** %6, align 8
  %19 = icmp eq %struct._IO_FILE* %18, null
  br i1 %19, label %20, label %26

; <label>:20:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 1)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %23 = call i8* @LANG(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.25, i32 0, i32 0))
  %24 = load i8*, i8** %4, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* %23, i8* %24)
  store i32 -1, i32* %3, align 4
  br label %75

; <label>:26:                                     ; preds = %16
  %27 = load i8*, i8** %5, align 8
  %28 = call %struct._IO_FILE* @fopen(i8* %27, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %28, %struct._IO_FILE** %7, align 8
  %29 = icmp eq %struct._IO_FILE* %28, null
  br i1 %29, label %30, label %38

; <label>:30:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 5)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 5)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %33 = call i8* @LANG(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.46, i32 0, i32 0))
  %34 = load i8*, i8** %5, align 8
  %35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* %33, i8* %34)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %37 = call i32 @fclose(%struct._IO_FILE* %36)
  store i32 -1, i32* %3, align 4
  br label %75

; <label>:38:                                     ; preds = %26
  %39 = load i8, i8* @verbose, align 1
  %40 = icmp ne i8 %39, 0
  br i1 %40, label %41, label %46

; <label>:41:                                     ; preds = %38
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 2)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 2)
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %44 = call i8* @LANG(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.47, i32 0, i32 0))
  %45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* %44)
  br label %46

; <label>:46:                                     ; preds = %41, %38
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %48 = call i32 @_IO_putc(i32 163, %struct._IO_FILE* %47)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %50 = call i32 @_IO_putc(i32 1, %struct._IO_FILE* %49)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %53 = call i32 @zipup(%struct._IO_FILE* %51, %struct._IO_FILE* %52)
  %54 = load i8, i8* @verbose, align 1
  %55 = icmp ne i8 %54, 0
  br i1 %55, label %56, label %61

; <label>:56:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 3)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 3)
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %59 = call i8* @LANG(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.48, i32 0, i32 0))
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* %59)
  br label %61

; <label>:61:                                     ; preds = %56, %46
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %63 = call i32 @fclose(%struct._IO_FILE* %62)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %65 = call i32 @write_error(%struct._IO_FILE* %64)
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %71

; <label>:67:                                     ; preds = %61
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 4)
  %68 = add i64 %pgocount5, 1
  store i64 %68, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 4)
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %70 = call i32 @fclose(%struct._IO_FILE* %69)
  store i32 -1, i32* %3, align 4
  br label %75

; <label>:71:                                     ; preds = %61
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 6)
  %72 = add i64 %pgocount6, 1
  store i64 %72, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_squish_file, i64 0, i64 6)
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %74 = call i32 @fclose(%struct._IO_FILE* %73)
  store i32 0, i32* %3, align 4
  br label %75

; <label>:75:                                     ; preds = %71, %67, %30, %20
  %76 = load i32, i32* %3, align 4
  ret i32 %76
}

declare i32 @zipup(%struct._IO_FILE*, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @idea_encryptfile(i8*, i8*, i8 zeroext) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8, align 1
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca [24 x i8], align 16
  %11 = alloca %struct.hashedpw*, align 8
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8 %2, i8* %7, align 1
  %12 = load i8, i8* @verbose, align 1
  %13 = icmp ne i8 %12, 0
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 0)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %17 = load i8*, i8** %5, align 8
  %18 = load i8*, i8** %6, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.49, i32 0, i32 0), i8* %17, i8* %18)
  br label %20

; <label>:20:                                     ; preds = %14, %3
  %21 = load i8*, i8** %5, align 8
  %22 = call %struct._IO_FILE* @fopen(i8* %21, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %22, %struct._IO_FILE** %8, align 8
  %23 = icmp eq %struct._IO_FILE* %22, null
  br i1 %23, label %24, label %30

; <label>:24:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 1)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %27 = call i8* @LANG(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i32 0, i32 0))
  %28 = load i8*, i8** %5, align 8
  %29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* %27, i8* %28)
  store i32 -1, i32* %4, align 4
  br label %116

; <label>:30:                                     ; preds = %20
  %31 = load i8*, i8** %6, align 8
  %32 = call %struct._IO_FILE* @fopen(i8* %31, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %32, %struct._IO_FILE** %9, align 8
  %33 = icmp eq %struct._IO_FILE* %32, null
  br i1 %33, label %34, label %42

; <label>:34:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 2)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 2)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %37 = call i8* @LANG(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.50, i32 0, i32 0))
  %38 = load i8*, i8** %6, align 8
  %39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* %37, i8* %38)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %41 = call i32 @fclose(%struct._IO_FILE* %40)
  store i32 -1, i32* %4, align 4
  br label %116

; <label>:42:                                     ; preds = %30
  %43 = load %struct.hashedpw*, %struct.hashedpw** @passwds, align 8
  %44 = icmp ne %struct.hashedpw* %43, null
  br i1 %44, label %45, label %59

; <label>:45:                                     ; preds = %42
  %46 = getelementptr inbounds [24 x i8], [24 x i8]* %10, i32 0, i32 0
  %47 = load %struct.hashedpw*, %struct.hashedpw** @passwds, align 8
  %48 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %47, i32 0, i32 1
  %49 = getelementptr inbounds [16 x i8], [16 x i8]* %48, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %46, i8* %49, i64 24, i32 8, i1 false)
  %50 = load %struct.hashedpw*, %struct.hashedpw** @passwds, align 8
  %51 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %50, i32 0, i32 1
  %52 = getelementptr inbounds [16 x i8], [16 x i8]* %51, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %52, i8 0, i64 16, i32 8, i1 false)
  %53 = load %struct.hashedpw*, %struct.hashedpw** @passwds, align 8
  store %struct.hashedpw* %53, %struct.hashedpw** %11, align 8
  %54 = load %struct.hashedpw*, %struct.hashedpw** @passwds, align 8
  %55 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %54, i32 0, i32 0
  %56 = load %struct.hashedpw*, %struct.hashedpw** %55, align 8
  store %struct.hashedpw* %56, %struct.hashedpw** @passwds, align 8
  %57 = load %struct.hashedpw*, %struct.hashedpw** %11, align 8
  %58 = call i32 (%struct.hashedpw*, ...) bitcast (i32 (...)* @free to i32 (%struct.hashedpw*, ...)*)(%struct.hashedpw* %57)
  br label %84

; <label>:59:                                     ; preds = %42
  %60 = load i8, i8* @quietmode, align 1
  %61 = icmp ne i8 %60, 0
  br i1 %61, label %67, label %62

; <label>:62:                                     ; preds = %59
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 7)
  %63 = add i64 %pgocount3, 1
  store i64 %63, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 7)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %65 = call i8* @LANG(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.51, i32 0, i32 0))
  %66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* %65)
  br label %67

; <label>:67:                                     ; preds = %62, %59
  %68 = load i8, i8* @batchmode, align 1
  %69 = zext i8 %68 to i32
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %76, label %71

; <label>:71:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 8)
  %72 = add i64 %pgocount4, 1
  store i64 %72, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 8)
  %73 = getelementptr inbounds [24 x i8], [24 x i8]* %10, i32 0, i32 0
  %74 = call i32 @GetHashedPassPhrase(i8* %73, i8 zeroext 2)
  %75 = icmp sle i32 %74, 0
  br i1 %75, label %76, label %82

; <label>:76:                                     ; preds = %71, %67
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 4)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 4)
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %79 = call i32 @fclose(%struct._IO_FILE* %78)
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %81 = call i32 @fclose(%struct._IO_FILE* %80)
  store i32 -1, i32* %4, align 4
  br label %116

; <label>:82:                                     ; preds = %71
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 9)
  %83 = add i64 %pgocount6, 1
  store i64 %83, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 9)
  br label %84

; <label>:84:                                     ; preds = %82, %45
  %85 = getelementptr inbounds [24 x i8], [24 x i8]* %10, i32 0, i32 0
  %86 = call i32 @make_random_ideakey(i8* %85, i32 16)
  %87 = load i8, i8* @quietmode, align 1
  %88 = icmp ne i8 %87, 0
  br i1 %88, label %96, label %89

; <label>:89:                                     ; preds = %84
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 5)
  %90 = add i64 %pgocount7, 1
  store i64 %90, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 5)
  %91 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %92 = call i8* @LANG(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.52, i32 0, i32 0))
  %93 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %91, i8* %92)
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %95 = call i32 @fflush(%struct._IO_FILE* %94)
  br label %96

; <label>:96:                                     ; preds = %89, %84
  %97 = getelementptr inbounds [24 x i8], [24 x i8]* %10, i32 0, i32 0
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %99 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %100 = load i8, i8* %7, align 1
  %101 = call i32 @squish_and_idea_file(i8* %97, %struct._IO_FILE* %98, %struct._IO_FILE* %99, i8 zeroext %100)
  %102 = bitcast [24 x i8]* %10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %102, i8 0, i64 24, i32 16, i1 false)
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %104 = call i32 @fclose(%struct._IO_FILE* %103)
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %106 = call i32 @write_error(%struct._IO_FILE* %105)
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %108, label %112

; <label>:108:                                    ; preds = %96
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 3)
  %109 = add i64 %pgocount8, 1
  store i64 %109, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 3)
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %111 = call i32 @fclose(%struct._IO_FILE* %110)
  store i32 -1, i32* %4, align 4
  br label %116

; <label>:112:                                    ; preds = %96
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 6)
  %113 = add i64 %pgocount9, 1
  store i64 %113, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_idea_encryptfile, i64 0, i64 6)
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %115 = call i32 @fclose(%struct._IO_FILE* %114)
  store i32 0, i32* %4, align 4
  br label %116

; <label>:116:                                    ; preds = %112, %108, %76, %34, %24
  %117 = load i32, i32* %4, align 4
  ret i32 %117
}

declare i32 @free(...) #1

declare i32 @GetHashedPassPhrase(i8*, i8 zeroext) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @make_random_ideakey(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.IdeaCfbContext, align 4
  %7 = alloca [10 x i8], align 1
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  call void @ideaCfbInit(%struct.IdeaCfbContext* %6, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @md5buf, i32 0, i32 0))
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @md5buf, i32 0, i32 0), i8 0, i64 16, i32 16, i1 false)
  %8 = call i32 @cryptRandOpen(%struct.IdeaCfbContext* %6)
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_make_random_ideakey, i64 0, i64 2)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_make_random_ideakey, i64 0, i64 2)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %13 = call i8* @LANG(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.96, i32 0, i32 0))
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* %13)
  call void @trueRandAccum(i32 192)
  call void @cryptRandInit(%struct.IdeaCfbContext* %6)
  br label %15

; <label>:15:                                     ; preds = %10, %2
  store i32 24, i32* %5, align 4
  %16 = load i32, i32* %4, align 4
  store i32 %16, i32* %5, align 4
  br label %17

; <label>:17:                                     ; preds = %31, %15
  %18 = load i32, i32* %5, align 4
  %19 = icmp slt i32 %18, 24
  br i1 %19, label %20, label %34

; <label>:20:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_make_random_ideakey, i64 0, i64 0)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_make_random_ideakey, i64 0, i64 0)
  %22 = call zeroext i8 @cryptRandByte()
  %23 = zext i8 %22 to i32
  %24 = call i32 @trueRandByte()
  %25 = xor i32 %23, %24
  %26 = trunc i32 %25 to i8
  %27 = load i8*, i8** %3, align 8
  %28 = load i32, i32* %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %27, i64 %29
  store i8 %26, i8* %30, align 1
  br label %31

; <label>:31:                                     ; preds = %20
  %32 = load i32, i32* %5, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %5, align 4
  br label %17

; <label>:34:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_make_random_ideakey, i64 0, i64 1)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_make_random_ideakey, i64 0, i64 1)
  %36 = load i8*, i8** %3, align 8
  call void @ideaCfbInit(%struct.IdeaCfbContext* %6, i8* %36)
  %37 = getelementptr inbounds [10 x i8], [10 x i8]* %7, i32 0, i32 0
  %38 = load i8*, i8** %3, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %38, i64 8, i32 1, i1 false)
  %39 = getelementptr inbounds [10 x i8], [10 x i8]* %7, i64 0, i64 6
  %40 = load i8, i8* %39, align 1
  %41 = getelementptr inbounds [10 x i8], [10 x i8]* %7, i64 0, i64 8
  store i8 %40, i8* %41, align 1
  %42 = getelementptr inbounds [10 x i8], [10 x i8]* %7, i64 0, i64 7
  %43 = load i8, i8* %42, align 1
  %44 = getelementptr inbounds [10 x i8], [10 x i8]* %7, i64 0, i64 9
  store i8 %43, i8* %44, align 1
  %45 = getelementptr inbounds [10 x i8], [10 x i8]* %7, i32 0, i32 0
  %46 = getelementptr inbounds [10 x i8], [10 x i8]* %7, i32 0, i32 0
  call void @ideaCfbEncrypt(%struct.IdeaCfbContext* %6, i8* %45, i8* %46, i32 10)
  call void @ideaCfbSync(%struct.IdeaCfbContext* %6)
  call void @cryptRandSave(%struct.IdeaCfbContext* %6)
  call void @ideaCfbDestroy(%struct.IdeaCfbContext* %6)
  ret i32 16
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @squish_and_idea_file(i8*, %struct._IO_FILE*, %struct._IO_FILE*, i8 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca i8, align 1
  %10 = alloca %struct._IO_FILE*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  store i8* %0, i8** %6, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %7, align 8
  store %struct._IO_FILE* %2, %struct._IO_FILE** %8, align 8
  store i8 %3, i8* %9, align 1
  store i8* null, i8** %11, align 8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  call void @rewind(%struct._IO_FILE* %14)
  %15 = load i8, i8* %9, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %20, label %17

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 3)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 3)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  store %struct._IO_FILE* %19, %struct._IO_FILE** %10, align 8
  br label %79

; <label>:20:                                     ; preds = %4
  %21 = call i8* @tempfile(i32 5)
  store i8* %21, i8** %11, align 8
  %22 = icmp eq i8* %21, null
  br i1 %22, label %28, label %23

; <label>:23:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 1)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 1)
  %25 = load i8*, i8** %11, align 8
  %26 = call %struct._IO_FILE* @fopen(i8* %25, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.97, i32 0, i32 0))
  store %struct._IO_FILE* %26, %struct._IO_FILE** %10, align 8
  %27 = icmp eq %struct._IO_FILE* %26, null
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %23, %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 2)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 2)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  store %struct._IO_FILE* %30, %struct._IO_FILE** %10, align 8
  br label %78

; <label>:31:                                     ; preds = %23
  %32 = load i8, i8* @verbose, align 1
  %33 = icmp ne i8 %32, 0
  br i1 %33, label %34, label %38

; <label>:34:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 5)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 5)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.98, i32 0, i32 0), i8* getelementptr inbounds ([0 x i8], [0 x i8]* @plainfile, i32 0, i32 0))
  br label %38

; <label>:38:                                     ; preds = %34, %31
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %40 = call i32 @_IO_putc(i32 163, %struct._IO_FILE* %39)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %42 = call i32 @_IO_putc(i32 1, %struct._IO_FILE* %41)
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %45 = call i32 @zipup(%struct._IO_FILE* %43, %struct._IO_FILE* %44)
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %47 = call i32 @write_error(%struct._IO_FILE* %46)
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %59

; <label>:49:                                     ; preds = %38
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %51 = call i32 @fclose(%struct._IO_FILE* %50)
  %52 = load i8*, i8** %11, align 8
  %53 = icmp ne i8* %52, null
  br i1 %53, label %54, label %57

; <label>:54:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 7)
  %55 = add i64 %pgocount4, 1
  store i64 %55, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 7)
  %56 = load i8*, i8** %11, align 8
  call void @rmtemp(i8* %56)
  br label %57

; <label>:57:                                     ; preds = %54, %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 6)
  %58 = add i64 %pgocount5, 1
  store i64 %58, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 6)
  store i32 -1, i32* %5, align 4
  br label %115

; <label>:59:                                     ; preds = %38
  %60 = load i8, i8* @verbose, align 1
  %61 = icmp ne i8 %60, 0
  br i1 %61, label %62, label %67

; <label>:62:                                     ; preds = %59
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 8)
  %63 = add i64 %pgocount6, 1
  store i64 %63, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 8)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %65 = call i8* @LANG(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.48, i32 0, i32 0))
  %66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* %65)
  br label %76

; <label>:67:                                     ; preds = %59
  %68 = load i8, i8* @quietmode, align 1
  %69 = icmp ne i8 %68, 0
  br i1 %69, label %74, label %70

; <label>:70:                                     ; preds = %67
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 10)
  %71 = add i64 %pgocount7, 1
  store i64 %71, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 10)
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %73 = call i32 @fputc(i32 46, %struct._IO_FILE* %72)
  br label %74

; <label>:74:                                     ; preds = %70, %67
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 9)
  %75 = add i64 %pgocount8, 1
  store i64 %75, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 9)
  br label %76

; <label>:76:                                     ; preds = %74, %62
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  call void @rewind(%struct._IO_FILE* %77)
  br label %78

; <label>:78:                                     ; preds = %76, %28
  br label %79

; <label>:79:                                     ; preds = %78, %17
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %81 = call i64 @ftell(%struct._IO_FILE* %80)
  store i64 %81, i64* %13, align 8
  %82 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  call void @write_ctb_len(%struct._IO_FILE* %82, i8 zeroext 9, i64 0, i8 zeroext 1)
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %84 = call i64 @ftell(%struct._IO_FILE* %83)
  %85 = load i64, i64* %13, align 8
  %86 = sub i64 %84, %85
  store i64 %86, i64* %12, align 8
  %87 = load i8*, i8** %6, align 8
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %91 = call i64 @fsize(%struct._IO_FILE* %90)
  %92 = call i32 @idea_file(i8* %87, i8 zeroext 0, %struct._IO_FILE* %88, %struct._IO_FILE* %89, i64 %91)
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %94 = load i64, i64* %13, align 8
  %95 = call i32 @fseek(%struct._IO_FILE* %93, i64 %94, i32 0)
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %98 = call i64 @fsize(%struct._IO_FILE* %97)
  %99 = load i64, i64* %12, align 8
  %100 = sub i64 %98, %99
  call void @write_ctb_len(%struct._IO_FILE* %96, i8 zeroext 9, i64 %100, i8 zeroext 1)
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %103 = icmp ne %struct._IO_FILE* %101, %102
  br i1 %103, label %104, label %114

; <label>:104:                                    ; preds = %79
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 0)
  %105 = add i64 %pgocount9, 1
  store i64 %105, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 0)
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %107 = call i32 @fclose(%struct._IO_FILE* %106)
  %108 = load i8*, i8** %11, align 8
  %109 = icmp ne i8* %108, null
  br i1 %109, label %110, label %113

; <label>:110:                                    ; preds = %104
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 4)
  %111 = add i64 %pgocount10, 1
  store i64 %111, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_squish_and_idea_file, i64 0, i64 4)
  %112 = load i8*, i8** %11, align 8
  call void @rmtemp(i8* %112)
  br label %113

; <label>:113:                                    ; preds = %110, %104
  br label %114

; <label>:114:                                    ; preds = %113, %79
  store i32 0, i32* %5, align 4
  br label %115

; <label>:115:                                    ; preds = %114, %57
  %116 = load i32, i32* %5, align 4
  ret i32 %116
}

; Function Attrs: noinline nounwind uwtable
define i32 @encryptfile(i8**, i8*, i8*, i8 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8**, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct._IO_FILE*, align 8
  %13 = alloca %struct._IO_FILE*, align 8
  %14 = alloca [260 x i8], align 16
  %15 = alloca [24 x i8], align 16
  %16 = alloca i64, align 8
  %17 = alloca [256 x i8], align 16
  %18 = alloca i32, align 4
  %19 = alloca %struct.MD5Context, align 8
  store i8** %0, i8*** %6, align 8
  store i8* %1, i8** %7, align 8
  store i8* %2, i8** %8, align 8
  store i8 %3, i8* %9, align 1
  store i32 0, i32* %18, align 4
  %20 = load i8**, i8*** %6, align 8
  %21 = icmp eq i8** %20, null
  br i1 %21, label %34, label %22

; <label>:22:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 5)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 5)
  %24 = load i8**, i8*** %6, align 8
  %25 = load i8*, i8** %24, align 8
  %26 = icmp eq i8* %25, null
  br i1 %26, label %34, label %27

; <label>:27:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 6)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 6)
  %29 = load i8**, i8*** %6, align 8
  %30 = load i8*, i8** %29, align 8
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %27, %22, %4
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 4)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 4)
  store i32 -1, i32* %5, align 4
  br label %223

; <label>:36:                                     ; preds = %27
  %37 = load i8, i8* @verbose, align 1
  %38 = icmp ne i8 %37, 0
  br i1 %38, label %39, label %45

; <label>:39:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 7)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 7)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %42 = load i8*, i8** %7, align 8
  %43 = load i8*, i8** %8, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.53, i32 0, i32 0), i8* %42, i8* %43)
  br label %45

; <label>:45:                                     ; preds = %39, %36
  %46 = load i8*, i8** %7, align 8
  %47 = call %struct._IO_FILE* @fopen(i8* %46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %47, %struct._IO_FILE** %12, align 8
  %48 = icmp eq %struct._IO_FILE* %47, null
  br i1 %48, label %49, label %55

; <label>:49:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 8)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 8)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %52 = call i8* @LANG(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i32 0, i32 0))
  %53 = load i8*, i8** %7, align 8
  %54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* %52, i8* %53)
  store i32 -1, i32* %5, align 4
  br label %223

; <label>:55:                                     ; preds = %45
  %56 = load i8*, i8** %8, align 8
  %57 = call %struct._IO_FILE* @fopen(i8* %56, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %57, %struct._IO_FILE** %13, align 8
  %58 = icmp eq %struct._IO_FILE* %57, null
  br i1 %58, label %59, label %67

; <label>:59:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 10)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 10)
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %62 = call i8* @LANG(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.50, i32 0, i32 0))
  %63 = load i8*, i8** %8, align 8
  %64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* %62, i8* %63)
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %66 = call i32 @fclose(%struct._IO_FILE* %65)
  store i32 -1, i32* %5, align 4
  br label %223

; <label>:67:                                     ; preds = %55
  %68 = load i8, i8* @already_have_md5, align 1
  %69 = icmp ne i8 %68, 0
  br i1 %69, label %76, label %70

; <label>:70:                                     ; preds = %67
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 13)
  %71 = add i64 %pgocount6, 1
  store i64 %71, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 13)
  call void @MD5Init(%struct.MD5Context* %19)
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %73 = call i32 @MDfile0_len(%struct.MD5Context* %19, %struct._IO_FILE* %72, i64 4096)
  call void @MD5Final(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @md5buf, i32 0, i32 0), %struct.MD5Context* %19)
  store i8 1, i8* @already_have_md5, align 1
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %75 = call i32 @fseek(%struct._IO_FILE* %74, i64 0, i32 0)
  br label %76

; <label>:76:                                     ; preds = %70, %67
  %77 = getelementptr inbounds [24 x i8], [24 x i8]* %15, i32 0, i32 0
  %78 = call i32 @make_random_ideakey(i8* %77, i32 0)
  store i32 %78, i32* %11, align 4
  %79 = getelementptr inbounds [260 x i8], [260 x i8]* %14, i64 0, i64 0
  store i8 1, i8* %79, align 16
  store i32 0, i32* %10, align 4
  br label %80

; <label>:80:                                     ; preds = %94, %76
  %81 = load i32, i32* %10, align 4
  %82 = load i32, i32* %11, align 4
  %83 = icmp slt i32 %81, %82
  br i1 %83, label %84, label %97

; <label>:84:                                     ; preds = %80
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 0)
  %85 = add i64 %pgocount7, 1
  store i64 %85, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 0)
  %86 = load i32, i32* %10, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [24 x i8], [24 x i8]* %15, i64 0, i64 %87
  %89 = load i8, i8* %88, align 1
  %90 = load i32, i32* %10, align 4
  %91 = add nsw i32 %90, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [260 x i8], [260 x i8]* %14, i64 0, i64 %92
  store i8 %89, i8* %93, align 1
  br label %94

; <label>:94:                                     ; preds = %84
  %95 = load i32, i32* %10, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %10, align 4
  br label %80

; <label>:97:                                     ; preds = %80
  %98 = getelementptr inbounds [260 x i8], [260 x i8]* %14, i32 0, i32 0
  %99 = getelementptr inbounds i8, i8* %98, i64 1
  %100 = load i32, i32* %11, align 4
  %101 = trunc i32 %100 to i16
  %102 = call zeroext i16 @checksum(i8* %99, i16 zeroext %101)
  %103 = zext i16 %102 to i64
  store i64 %103, i64* %16, align 8
  %104 = load i32, i32* %11, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %11, align 4
  %106 = load i64, i64* %16, align 8
  %107 = trunc i64 %106 to i16
  %108 = getelementptr inbounds [260 x i8], [260 x i8]* %14, i32 0, i32 0
  %109 = load i32, i32* %11, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8* %108, i64 %110
  %112 = call i8* @put_word16(i16 zeroext %107, i8* %111)
  %113 = load i32, i32* %11, align 4
  %114 = add nsw i32 %113, 2
  store i32 %114, i32* %11, align 4
  store i32 0, i32* %10, align 4
  br label %115

; <label>:115:                                    ; preds = %124, %97
  %116 = load i8**, i8*** %6, align 8
  %117 = load i32, i32* %10, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8*, i8** %116, i64 %118
  %120 = load i8*, i8** %119, align 8
  %121 = icmp ne i8* %120, null
  br i1 %121, label %122, label %127

; <label>:122:                                    ; preds = %115
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 1)
  %123 = add i64 %pgocount8, 1
  store i64 %123, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 1)
  br label %124

; <label>:124:                                    ; preds = %122
  %125 = load i32, i32* %10, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %10, align 4
  br label %115

; <label>:127:                                    ; preds = %115
  %128 = load i8, i8* @encrypt_to_self, align 1
  %129 = icmp ne i8 %128, 0
  br i1 %129, label %130, label %134

; <label>:130:                                    ; preds = %127
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 9)
  %131 = add i64 %pgocount9, 1
  store i64 %131, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 9)
  %132 = load i32, i32* %10, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %10, align 4
  br label %134

; <label>:134:                                    ; preds = %130, %127
  %135 = load i32, i32* %10, align 4
  %136 = mul nsw i32 %135, 8
  %137 = call i8* @xmalloc(i32 %136)
  %138 = bitcast i8* %137 to [8 x i8]*
  store [8 x i8]* %138, [8 x i8]** @keyID_list, align 8
  br label %139

; <label>:139:                                    ; preds = %164, %134
  %140 = load i8**, i8*** %6, align 8
  %141 = load i8*, i8** %140, align 8
  %142 = icmp ne i8* %141, null
  br i1 %142, label %143, label %150

; <label>:143:                                    ; preds = %139
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 3)
  %144 = add i64 %pgocount10, 1
  store i64 %144, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 3)
  %145 = load i8**, i8*** %6, align 8
  %146 = load i8*, i8** %145, align 8
  %147 = load i8, i8* %146, align 1
  %148 = sext i8 %147 to i32
  %149 = icmp ne i32 %148, 0
  br label %150

; <label>:150:                                    ; preds = %143, %139
  %151 = phi i1 [ false, %139 ], [ %149, %143 ]
  br i1 %151, label %152, label %167

; <label>:152:                                    ; preds = %150
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 2)
  %153 = add i64 %pgocount11, 1
  store i64 %153, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 2)
  %154 = getelementptr inbounds [256 x i8], [256 x i8]* %17, i32 0, i32 0
  %155 = call i8* @strcpy(i8* %154, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #5
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %157 = load i8**, i8*** %6, align 8
  %158 = load i8*, i8** %157, align 8
  %159 = getelementptr inbounds [260 x i8], [260 x i8]* %14, i32 0, i32 0
  %160 = getelementptr inbounds [256 x i8], [256 x i8]* %17, i32 0, i32 0
  %161 = load i32, i32* %11, align 4
  %162 = load i32, i32* %18, align 4
  %163 = call i32 @encryptkeyintofile(%struct._IO_FILE* %156, i8* %158, i8* %159, i8* %160, i32 %161, i32 %162)
  store i32 %163, i32* %18, align 4
  br label %164

; <label>:164:                                    ; preds = %152
  %165 = load i8**, i8*** %6, align 8
  %166 = getelementptr inbounds i8*, i8** %165, i32 1
  store i8** %166, i8*** %6, align 8
  br label %139

; <label>:167:                                    ; preds = %150
  %168 = load i32, i32* %18, align 4
  %169 = icmp ne i32 %168, 0
  br i1 %169, label %178, label %170

; <label>:170:                                    ; preds = %167
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 14)
  %171 = add i64 %pgocount12, 1
  store i64 %171, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 14)
  %172 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %173 = call i32 @fclose(%struct._IO_FILE* %172)
  %174 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %175 = call i32 @fclose(%struct._IO_FILE* %174)
  %176 = load [8 x i8]*, [8 x i8]** @keyID_list, align 8
  %177 = call i32 ([8 x i8]*, ...) bitcast (i32 (...)* @free to i32 ([8 x i8]*, ...)*)([8 x i8]* %176)
  store i32 -1, i32* %5, align 4
  br label %223

; <label>:178:                                    ; preds = %167
  %179 = load i8, i8* @encrypt_to_self, align 1
  %180 = icmp ne i8 %179, 0
  br i1 %180, label %181, label %200

; <label>:181:                                    ; preds = %178
  %182 = load i8, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @my_name, i32 0, i32 0), align 1
  %183 = icmp ne i8 %182, 0
  br i1 %183, label %187, label %184

; <label>:184:                                    ; preds = %181
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 17)
  %185 = add i64 %pgocount13, 1
  store i64 %185, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 17)
  %186 = call i32 @getmyname(i8* getelementptr inbounds ([0 x i8], [0 x i8]* @my_name, i32 0, i32 0))
  br label %187

; <label>:187:                                    ; preds = %184, %181
  %188 = load i8, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @my_name, i32 0, i32 0), align 1
  %189 = icmp ne i8 %188, 0
  br i1 %189, label %190, label %198

; <label>:190:                                    ; preds = %187
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 15)
  %191 = add i64 %pgocount14, 1
  store i64 %191, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 15)
  %192 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %193 = getelementptr inbounds [260 x i8], [260 x i8]* %14, i32 0, i32 0
  %194 = getelementptr inbounds [256 x i8], [256 x i8]* %17, i32 0, i32 0
  %195 = load i32, i32* %11, align 4
  %196 = load i32, i32* %18, align 4
  %197 = call i32 @encryptkeyintofile(%struct._IO_FILE* %192, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @my_name, i32 0, i32 0), i8* %193, i8* %194, i32 %195, i32 %196)
  store i32 %197, i32* %18, align 4
  br label %198

; <label>:198:                                    ; preds = %190, %187
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 11)
  %199 = add i64 %pgocount15, 1
  store i64 %199, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 11)
  br label %200

; <label>:200:                                    ; preds = %198, %178
  %201 = load [8 x i8]*, [8 x i8]** @keyID_list, align 8
  %202 = call i32 ([8 x i8]*, ...) bitcast (i32 (...)* @free to i32 ([8 x i8]*, ...)*)([8 x i8]* %201)
  %203 = getelementptr inbounds [24 x i8], [24 x i8]* %15, i32 0, i32 0
  %204 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %205 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %206 = load i8, i8* %9, align 1
  %207 = call i32 @squish_and_idea_file(i8* %203, %struct._IO_FILE* %204, %struct._IO_FILE* %205, i8 zeroext %206)
  %208 = bitcast [260 x i8]* %14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %208, i8 0, i64 260, i32 16, i1 false)
  %209 = bitcast [24 x i8]* %15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %209, i8 0, i64 24, i32 16, i1 false)
  %210 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %211 = call i32 @fclose(%struct._IO_FILE* %210)
  %212 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %213 = call i32 @write_error(%struct._IO_FILE* %212)
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %215, label %219

; <label>:215:                                    ; preds = %200
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 12)
  %216 = add i64 %pgocount16, 1
  store i64 %216, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 12)
  %217 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %218 = call i32 @fclose(%struct._IO_FILE* %217)
  store i32 -1, i32* %5, align 4
  br label %223

; <label>:219:                                    ; preds = %200
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 16)
  %220 = add i64 %pgocount17, 1
  store i64 %220, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_encryptfile, i64 0, i64 16)
  %221 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %222 = call i32 @fclose(%struct._IO_FILE* %221)
  store i32 0, i32* %5, align 4
  br label %223

; <label>:223:                                    ; preds = %219, %215, %170, %59, %49, %34
  %224 = load i32, i32* %5, align 4
  ret i32 %224
}

declare void @MD5Init(%struct.MD5Context*) #1

declare void @MD5Final(i8*, %struct.MD5Context*) #1

declare i8* @xmalloc(i32) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @encryptkeyintofile(%struct._IO_FILE*, i8*, i8*, i8*, i32, i32) #0 {
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [130 x i16], align 16
  %15 = alloca [130 x i16], align 16
  %16 = alloca [8 x i8], align 1
  %17 = alloca [260 x i8], align 16
  %18 = alloca [260 x i8], align 16
  %19 = alloca i64, align 8
  %20 = alloca i8*, align 8
  %21 = alloca [256 x i8], align 16
  %22 = alloca i64, align 8
  %23 = alloca i32, align 4
  %24 = alloca [8 x i8]*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %7, align 8
  store i8* %1, i8** %8, align 8
  store i8* %2, i8** %9, align 8
  store i8* %3, i8** %10, align 8
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  %25 = bitcast i64* %19 to i8*
  store i8* %25, i8** %20, align 8
  br label %26

; <label>:26:                                     ; preds = %6
  %27 = getelementptr inbounds [256 x i8], [256 x i8]* %21, i64 0, i64 0
  store i8 0, i8* %27, align 16
  %28 = getelementptr inbounds [256 x i8], [256 x i8]* %21, i32 0, i32 0
  %29 = load i8*, i8** %8, align 8
  %30 = call i8* @strcpy(i8* %28, i8* %29) #5
  %31 = load i8, i8* @quietmode, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp ne i32 %32, 0
  %34 = zext i1 %33 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 10)
  %35 = add i64 %pgocount, %34
  store i64 %35, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 10)
  %36 = select i1 %33, i32 0, i32 2
  %37 = or i32 %36, 4
  %38 = load i8*, i8** %10, align 8
  %39 = load i8*, i8** %20, align 8
  %40 = getelementptr inbounds [256 x i8], [256 x i8]* %21, i32 0, i32 0
  %41 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  %42 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %43 = call i32 @getpublickey(i32 %37, i8* %38, i64* %22, i32* null, i8* null, i8* %39, i8* %40, i16* %41, i16* %42)
  %44 = icmp slt i32 %43, 0
  br i1 %44, label %45, label %51

; <label>:45:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 1)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 1)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %48 = call i8* @LANG(i8* getelementptr inbounds ([103 x i8], [103 x i8]* @.str.99, i32 0, i32 0))
  %49 = load i8*, i8** %8, align 8
  %50 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* %48, i8* %49)
  br label %175

; <label>:51:                                     ; preds = %26
  %52 = getelementptr inbounds [8 x i8], [8 x i8]* %16, i32 0, i32 0
  %53 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  call void @extract_keyID(i8* %52, i16* %53)
  %54 = load [8 x i8]*, [8 x i8]** @keyID_list, align 8
  store [8 x i8]* %54, [8 x i8]** %24, align 8
  br label %55

; <label>:55:                                     ; preds = %71, %51
  %56 = load [8 x i8]*, [8 x i8]** %24, align 8
  %57 = load [8 x i8]*, [8 x i8]** @keyID_list, align 8
  %58 = load i32, i32* %12, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [8 x i8], [8 x i8]* %57, i64 %59
  %61 = icmp ult [8 x i8]* %56, %60
  br i1 %61, label %62, label %75

; <label>:62:                                     ; preds = %55
  %63 = load [8 x i8]*, [8 x i8]** %24, align 8
  %64 = bitcast [8 x i8]* %63 to i8*
  %65 = getelementptr inbounds [8 x i8], [8 x i8]* %16, i32 0, i32 0
  %66 = call i32 @memcmp(i8* %64, i8* %65, i64 8) #6
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %70, label %68

; <label>:68:                                     ; preds = %62
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 3)
  %69 = add i64 %pgocount2, 1
  store i64 %69, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 3)
  br label %75

; <label>:70:                                     ; preds = %62
  br label %71

; <label>:71:                                     ; preds = %70
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 0)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 0)
  %73 = load [8 x i8]*, [8 x i8]** %24, align 8
  %74 = getelementptr inbounds [8 x i8], [8 x i8]* %73, i32 1
  store [8 x i8]* %74, [8 x i8]** %24, align 8
  br label %55

; <label>:75:                                     ; preds = %68, %55
  %76 = load [8 x i8]*, [8 x i8]** %24, align 8
  %77 = load [8 x i8]*, [8 x i8]** @keyID_list, align 8
  %78 = load i32, i32* %12, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [8 x i8], [8 x i8]* %77, i64 %79
  %81 = icmp ult [8 x i8]* %76, %80
  br i1 %81, label %82, label %84

; <label>:82:                                     ; preds = %75
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 2)
  %83 = add i64 %pgocount4, 1
  store i64 %83, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 2)
  br label %175

; <label>:84:                                     ; preds = %75
  %85 = load [8 x i8]*, [8 x i8]** %24, align 8
  %86 = bitcast [8 x i8]* %85 to i8*
  %87 = getelementptr inbounds [8 x i8], [8 x i8]* %16, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %86, i8* %87, i64 8, i32 1, i1 false)
  %88 = getelementptr inbounds [256 x i8], [256 x i8]* %21, i32 0, i32 0
  call void @PascalToC(i8* %88)
  %89 = load i8*, i8** %10, align 8
  %90 = load i64, i64* %22, align 8
  %91 = getelementptr inbounds [256 x i8], [256 x i8]* %21, i32 0, i32 0
  %92 = call i32 @warn_signatures(i8* %89, i64 %90, i8* %91, i8 zeroext 0)
  %93 = icmp slt i32 %92, 0
  br i1 %93, label %94, label %100

; <label>:94:                                     ; preds = %84
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 4)
  %95 = add i64 %pgocount5, 1
  store i64 %95, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 4)
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %97 = call i8* @LANG(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.100, i32 0, i32 0))
  %98 = load i8*, i8** %8, align 8
  %99 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %96, i8* %97, i8* %98)
  br label %175

; <label>:100:                                    ; preds = %84
  %101 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  %102 = call i32 @countbits(i16* %101)
  %103 = add nsw i32 %102, 7
  %104 = ashr i32 %103, 3
  %105 = sub nsw i32 %104, 1
  store i32 %105, i32* %23, align 4
  %106 = load i32, i32* %23, align 4
  %107 = icmp slt i32 %106, 31
  br i1 %107, label %108, label %115

; <label>:108:                                    ; preds = %100
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 5)
  %109 = add i64 %pgocount6, 1
  store i64 %109, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 5)
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %111 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %110, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.84, i32 0, i32 0))
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %113 = load i8*, i8** %8, align 8
  %114 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %112, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.100, i32 0, i32 0), i8* %113)
  br label %175

; <label>:115:                                    ; preds = %100
  %116 = getelementptr inbounds [260 x i8], [260 x i8]* %18, i32 0, i32 0
  %117 = bitcast i8* %116 to i16*
  %118 = load i8*, i8** %9, align 8
  %119 = load i32, i32* %11, align 4
  %120 = trunc i32 %119 to i16
  %121 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %122 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  %123 = call i32 @rsa_public_encrypt(i16* %117, i8* %118, i16 signext %120, i16* %121, i16* %122)
  store i32 %123, i32* %13, align 4
  %124 = load i32, i32* %13, align 4
  %125 = icmp slt i32 %124, 0
  br i1 %125, label %126, label %151

; <label>:126:                                    ; preds = %115
  %127 = load i32, i32* %13, align 4
  %128 = icmp eq i32 %127, -4
  br i1 %128, label %129, label %133

; <label>:129:                                    ; preds = %126
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 7)
  %130 = add i64 %pgocount7, 1
  store i64 %130, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 7)
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %132 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %131, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.84, i32 0, i32 0))
  br label %146

; <label>:133:                                    ; preds = %126
  %134 = load i32, i32* %13, align 4
  %135 = icmp eq i32 %134, -3
  br i1 %135, label %136, label %140

; <label>:136:                                    ; preds = %133
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 8)
  %137 = add i64 %pgocount8, 1
  store i64 %137, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 8)
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %139 = call i32 @fputs(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @.str.63, i32 0, i32 0), %struct._IO_FILE* %138)
  br label %145

; <label>:140:                                    ; preds = %133
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 9)
  %141 = add i64 %pgocount9, 1
  store i64 %141, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 9)
  %142 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %143 = load i32, i32* %13, align 4
  %144 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %142, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.101, i32 0, i32 0), i32 %143)
  br label %145

; <label>:145:                                    ; preds = %140, %136
  br label %146

; <label>:146:                                    ; preds = %145, %129
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %148 = call i8* @LANG(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.100, i32 0, i32 0))
  %149 = load i8*, i8** %8, align 8
  %150 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %147, i8* %148, i8* %149)
  br label %175

; <label>:151:                                    ; preds = %115
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 6)
  %152 = add i64 %pgocount10, 1
  store i64 %152, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_encryptkeyintofile, i64 0, i64 6)
  %153 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %154 = getelementptr inbounds [260 x i8], [260 x i8]* %18, i32 0, i32 0
  %155 = bitcast i8* %154 to i16*
  %156 = call i32 @countbits(i16* %155)
  %157 = add nsw i32 %156, 7
  %158 = ashr i32 %157, 3
  %159 = add nsw i32 12, %158
  %160 = sext i32 %159 to i64
  call void @write_ctb_len(%struct._IO_FILE* %153, i8 zeroext 1, i64 %160, i8 zeroext 0)
  %161 = load i32, i32* @version_byte, align 4
  %162 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %163 = call i32 @_IO_putc(i32 %161, %struct._IO_FILE* %162)
  %164 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  %165 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  call void @writekeyID(i16* %164, %struct._IO_FILE* %165)
  %166 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %167 = call i32 @_IO_putc(i32 1, %struct._IO_FILE* %166)
  %168 = getelementptr inbounds [260 x i8], [260 x i8]* %18, i32 0, i32 0
  %169 = bitcast i8* %168 to i16*
  %170 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  call void @write_mpi(i16* %169, %struct._IO_FILE* %170, %struct.IdeaCfbContext* null)
  %171 = bitcast [260 x i8]* %17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %171, i8 0, i64 260, i32 16, i1 false)
  %172 = bitcast [260 x i8]* %18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %172, i8 0, i64 260, i32 16, i1 false)
  %173 = load i32, i32* %12, align 4
  %174 = add nsw i32 %173, 1
  store i32 %174, i32* %12, align 4
  br label %175

; <label>:175:                                    ; preds = %151, %146, %108, %94, %82, %45
  %176 = load i32, i32* %12, align 4
  ret i32 %176
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @getmyname(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_getmyname, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_getmyname, i64 0, i64 0)
  %3 = alloca i8*, align 8
  %4 = alloca [256 x i8], align 16
  %5 = alloca [130 x i16], align 16
  %6 = alloca [130 x i16], align 16
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  %11 = bitcast i64* %7 to i8*
  store i8* %11, i8** %8, align 8
  %12 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %13 = call i8* @strcpy(i8* %12, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalSecringName, i32 0, i32 0)) #5
  %14 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %15 = load i8*, i8** %8, align 8
  %16 = load i8*, i8** %3, align 8
  %17 = getelementptr inbounds [130 x i16], [130 x i16]* %5, i32 0, i32 0
  %18 = getelementptr inbounds [130 x i16], [130 x i16]* %6, i32 0, i32 0
  %19 = call i32 @getpublickey(i32 32, i8* %14, i64* %9, i32* null, i8* null, i8* %15, i8* %16, i16* %17, i16* %18)
  %20 = load i8*, i8** %3, align 8
  call void @PascalToC(i8* %20)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define i32 @make_literal(i8*, i8*, i8 signext, i8*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8, align 1
  %9 = alloca i8*, align 8
  %10 = alloca [256 x i8], align 16
  %11 = alloca %struct._IO_FILE*, align 8
  %12 = alloca %struct._IO_FILE*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store i8* %0, i8** %6, align 8
  store i8* %1, i8** %7, align 8
  store i8 %2, i8* %8, align 1
  store i8* %3, i8** %9, align 8
  store i32 0, i32* %13, align 4
  store i64 0, i64* %16, align 8
  %17 = load i8, i8* @verbose, align 1
  %18 = icmp ne i8 %17, 0
  br i1 %18, label %19, label %29

; <label>:19:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 0)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %22 = load i8*, i8** %6, align 8
  %23 = load i8*, i8** %7, align 8
  %24 = load i8, i8* %8, align 1
  %25 = call signext i8 @EXT_C(i8 signext %24)
  %26 = sext i8 %25 to i32
  %27 = load i8*, i8** %9, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.54, i32 0, i32 0), i8* %22, i8* %23, i32 %26, i8* %27)
  br label %29

; <label>:29:                                     ; preds = %19, %4
  %30 = load i8, i8* %8, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp eq i32 %31, 116
  br i1 %32, label %33, label %36

; <label>:33:                                     ; preds = %29
  %34 = load i8*, i8** %6, align 8
  %35 = call %struct._IO_FILE* @fopen(i8* %34, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %35, %struct._IO_FILE** %11, align 8
  br label %40

; <label>:36:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 1)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 1)
  %38 = load i8*, i8** %6, align 8
  %39 = call %struct._IO_FILE* @fopen(i8* %38, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %39, %struct._IO_FILE** %11, align 8
  br label %40

; <label>:40:                                     ; preds = %36, %33
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %42 = icmp eq %struct._IO_FILE* %41, null
  br i1 %42, label %43, label %49

; <label>:43:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 2)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 2)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %46 = call i8* @LANG(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.55, i32 0, i32 0))
  %47 = load i8*, i8** %6, align 8
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* %46, i8* %47)
  store i32 -1, i32* %5, align 4
  br label %171

; <label>:49:                                     ; preds = %40
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %51 = call i64 @fsize(%struct._IO_FILE* %50)
  store i64 %51, i64* %14, align 8
  %52 = load i8*, i8** %7, align 8
  %53 = call %struct._IO_FILE* @fopen(i8* %52, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %53, %struct._IO_FILE** %12, align 8
  %54 = icmp eq %struct._IO_FILE* %53, null
  br i1 %54, label %55, label %61

; <label>:55:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 3)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 3)
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %58 = call i8* @LANG(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.40, i32 0, i32 0))
  %59 = load i8*, i8** %7, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* %58, i8* %59)
  br label %168

; <label>:61:                                     ; preds = %49
  %62 = load i8*, i8** %9, align 8
  %63 = icmp eq i8* %62, null
  br i1 %63, label %64, label %67

; <label>:64:                                     ; preds = %61
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 8)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 8)
  %66 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i64 0, i64 0
  store i8 0, i8* %66, align 16
  br label %73

; <label>:67:                                     ; preds = %61
  %68 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i32 0, i32 0
  %69 = load i8*, i8** %9, align 8
  %70 = call i8* @strcpy(i8* %68, i8* %69) #5
  %71 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i32 0, i32 0
  call void @file_to_canon(i8* %71)
  %72 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i32 0, i32 0
  call void @CToPascal(i8* %72)
  br label %73

; <label>:73:                                     ; preds = %67, %64
  %74 = load i8, i8* %8, align 1
  %75 = sext i8 %74 to i32
  %76 = icmp eq i32 %75, 98
  br i1 %76, label %77, label %85

; <label>:77:                                     ; preds = %73
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %79 = load i64, i64* %14, align 8
  %80 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i64 0, i64 0
  %81 = load i8, i8* %80, align 16
  %82 = zext i8 %81 to i64
  %83 = add i64 %79, %82
  %84 = add i64 %83, 6
  call void @write_ctb_len(%struct._IO_FILE* %78, i8 zeroext 11, i64 %84, i8 zeroext 0)
  br label %88

; <label>:85:                                     ; preds = %73
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 4)
  %86 = add i64 %pgocount5, 1
  store i64 %86, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 4)
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  call void @write_ctb_len(%struct._IO_FILE* %87, i8 zeroext 11, i64 0, i8 zeroext 1)
  br label %88

; <label>:88:                                     ; preds = %85, %77
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %90 = call i64 @ftell(%struct._IO_FILE* %89)
  store i64 %90, i64* %15, align 8
  %91 = load i8, i8* %8, align 1
  %92 = sext i8 %91 to i32
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %94 = call i32 @_IO_putc(i32 %92, %struct._IO_FILE* %93)
  %95 = load i8, i8* %8, align 1
  %96 = sext i8 %95 to i32
  %97 = icmp eq i32 %96, 108
  br i1 %97, label %98, label %99

; <label>:98:                                     ; preds = %88
  br label %112

; <label>:99:                                     ; preds = %88
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 5)
  %100 = add i64 %pgocount6, 1
  store i64 %100, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 5)
  %101 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i32 0, i32 0
  %102 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i64 0, i64 0
  %103 = load i8, i8* %102, align 16
  %104 = zext i8 %103 to i32
  %105 = add nsw i32 %104, 1
  %106 = sext i32 %105 to i64
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %108 = call i64 @fwrite(i8* %101, i64 1, i64 %106, %struct._IO_FILE* %107)
  %109 = bitcast i64* %16 to i8*
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %111 = call i64 @fwrite(i8* %109, i64 1, i64 8, %struct._IO_FILE* %110)
  br label %112

; <label>:112:                                    ; preds = %99, %98
  %113 = load i8, i8* %8, align 1
  %114 = sext i8 %113 to i32
  %115 = icmp eq i32 %114, 98
  br i1 %115, label %121, label %116

; <label>:116:                                    ; preds = %112
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 6)
  %117 = add i64 %pgocount7, 1
  store i64 %117, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 6)
  %118 = load i8, i8* %8, align 1
  %119 = sext i8 %118 to i32
  %120 = icmp eq i32 %119, 108
  br i1 %120, label %121, label %134

; <label>:121:                                    ; preds = %116, %112
  %122 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %123 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %124 = call i32 @copyfile(%struct._IO_FILE* %122, %struct._IO_FILE* %123, i64 -1)
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %132

; <label>:126:                                    ; preds = %121
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 7)
  %127 = add i64 %pgocount8, 1
  store i64 %127, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 7)
  %128 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %129 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %128, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.56, i32 0, i32 0))
  call void @perror(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.57, i32 0, i32 0))
  %130 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %131 = call i32 @fclose(%struct._IO_FILE* %130)
  br label %168

; <label>:132:                                    ; preds = %121
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 9)
  %133 = add i64 %pgocount9, 1
  store i64 %133, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 9)
  br label %151

; <label>:134:                                    ; preds = %116
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 10)
  %135 = add i64 %pgocount10, 1
  store i64 %135, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 10)
  %136 = load i8, i8* %8, align 1
  %137 = sext i8 %136 to i32
  %138 = icmp eq i32 %137, 116
  %139 = zext i1 %138 to i64
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 13)
  %140 = add i64 %pgocount11, %139
  store i64 %140, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 13)
  %141 = select i1 %138, i32 1, i32 0
  store i32 %141, i32* @CONVERSION, align 4
  %142 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %143 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %144 = call i32 @copyfile_to_canon(%struct._IO_FILE* %142, %struct._IO_FILE* %143, i64 -1)
  store i32 %144, i32* %13, align 4
  store i32 0, i32* @CONVERSION, align 4
  %145 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  call void @rewind(%struct._IO_FILE* %145)
  %146 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %148 = call i64 @fsize(%struct._IO_FILE* %147)
  %149 = load i64, i64* %15, align 8
  %150 = sub i64 %148, %149
  call void @write_ctb_len(%struct._IO_FILE* %146, i8 zeroext 11, i64 %150, i8 zeroext 1)
  br label %151

; <label>:151:                                    ; preds = %134, %132
  %152 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %153 = call i32 @write_error(%struct._IO_FILE* %152)
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %159, label %155

; <label>:155:                                    ; preds = %151
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 11)
  %156 = add i64 %pgocount12, 1
  store i64 %156, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 11)
  %157 = load i32, i32* %13, align 4
  %158 = icmp slt i32 %157, 0
  br i1 %158, label %159, label %162

; <label>:159:                                    ; preds = %155, %151
  %160 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %161 = call i32 @fclose(%struct._IO_FILE* %160)
  br label %168

; <label>:162:                                    ; preds = %155
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 12)
  %163 = add i64 %pgocount13, 1
  store i64 %163, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_make_literal, i64 0, i64 12)
  %164 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %165 = call i32 @fclose(%struct._IO_FILE* %164)
  %166 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %167 = call i32 @fclose(%struct._IO_FILE* %166)
  store i32 0, i32* %5, align 4
  br label %171

; <label>:168:                                    ; preds = %159, %126, %55
  %169 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %170 = call i32 @fclose(%struct._IO_FILE* %169)
  store i32 -1, i32* %5, align 4
  br label %171

; <label>:171:                                    ; preds = %168, %162, %43
  %172 = load i32, i32* %5, align 4
  ret i32 %172
}

declare void @perror(i8*) #1

declare i32 @copyfile_to_canon(%struct._IO_FILE*, %struct._IO_FILE*, i64) #1

; Function Attrs: noinline nounwind uwtable
define i32 @strip_literal(i8*, i8*, i8*, i8*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8, align 1
  %11 = alloca %struct._IO_FILE*, align 8
  %12 = alloca %struct._IO_FILE*, align 8
  %13 = alloca i64, align 8
  %14 = alloca [256 x i8], align 16
  %15 = alloca i64, align 8
  %16 = alloca [5 x i8], align 1
  %17 = alloca i32, align 4
  store i8* %0, i8** %6, align 8
  store i8* %1, i8** %7, align 8
  store i8* %2, i8** %8, align 8
  store i8* %3, i8** %9, align 8
  store i64 0, i64* %13, align 8
  %18 = load i8*, i8** %9, align 8
  store i8 98, i8* %18, align 1
  %19 = load i8, i8* @verbose, align 1
  %20 = icmp ne i8 %19, 0
  br i1 %20, label %21, label %27

; <label>:21:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 0)
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %24 = load i8*, i8** %6, align 8
  %25 = load i8*, i8** %7, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.58, i32 0, i32 0), i8* %24, i8* %25)
  br label %27

; <label>:27:                                     ; preds = %21, %4
  %28 = load i8*, i8** %8, align 8
  %29 = icmp ne i8* %28, null
  br i1 %29, label %30, label %33

; <label>:30:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 1)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 1)
  %32 = load i8*, i8** %8, align 8
  store i8 0, i8* %32, align 1
  br label %33

; <label>:33:                                     ; preds = %30, %27
  %34 = load i8*, i8** %6, align 8
  %35 = call %struct._IO_FILE* @fopen(i8* %34, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %35, %struct._IO_FILE** %11, align 8
  %36 = icmp eq %struct._IO_FILE* %35, null
  br i1 %36, label %37, label %43

; <label>:37:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 3)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 3)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %40 = call i8* @LANG(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.55, i32 0, i32 0))
  %41 = load i8*, i8** %6, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* %40, i8* %41)
  store i32 -1, i32* %5, align 4
  br label %275

; <label>:43:                                     ; preds = %33
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %45 = call i64 @fread(i8* %10, i64 1, i64 1, %struct._IO_FILE* %44)
  %46 = load i8, i8* %10, align 1
  %47 = zext i8 %46 to i32
  %48 = and i32 %47, 128
  %49 = icmp eq i32 %48, 128
  br i1 %49, label %50, label %62

; <label>:50:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 4)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 4)
  %52 = load i8, i8* %10, align 1
  %53 = zext i8 %52 to i32
  %54 = and i32 %53, 124
  %55 = icmp eq i32 %54, 40
  br i1 %55, label %69, label %56

; <label>:56:                                     ; preds = %50
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 5)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 5)
  %58 = load i8, i8* %10, align 1
  %59 = zext i8 %58 to i32
  %60 = and i32 %59, 124
  %61 = icmp eq i32 %60, 44
  br i1 %61, label %69, label %62

; <label>:62:                                     ; preds = %56, %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 2)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 2)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %65 = load i8*, i8** %6, align 8
  %66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.59, i32 0, i32 0), i8* %65)
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %68 = call i32 @fclose(%struct._IO_FILE* %67)
  store i32 -1, i32* %5, align 4
  br label %275

; <label>:69:                                     ; preds = %56, %50
  %70 = load i8, i8* %10, align 1
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %72 = call i64 @getpastlength(i8 zeroext %70, %struct._IO_FILE* %71)
  store i64 %72, i64* %13, align 8
  %73 = load i8*, i8** %9, align 8
  store i8 0, i8* %73, align 1
  %74 = load i8*, i8** %9, align 8
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %76 = call i64 @fread(i8* %74, i64 1, i64 1, %struct._IO_FILE* %75)
  %77 = load i8*, i8** %9, align 8
  %78 = load i8, i8* %77, align 1
  %79 = sext i8 %78 to i32
  %80 = icmp ne i32 %79, 98
  br i1 %80, label %81, label %101

; <label>:81:                                     ; preds = %69
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 8)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 8)
  %83 = load i8*, i8** %9, align 8
  %84 = load i8, i8* %83, align 1
  %85 = sext i8 %84 to i32
  %86 = icmp ne i32 %85, 116
  br i1 %86, label %87, label %101

; <label>:87:                                     ; preds = %81
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 15)
  %88 = add i64 %pgocount7, 1
  store i64 %88, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 15)
  %89 = load i8*, i8** %9, align 8
  %90 = load i8, i8* %89, align 1
  %91 = sext i8 %90 to i32
  %92 = icmp ne i32 %91, 108
  br i1 %92, label %93, label %101

; <label>:93:                                     ; preds = %87
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 17)
  %94 = add i64 %pgocount8, 1
  store i64 %94, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 17)
  %95 = load i8*, i8** %9, align 8
  %96 = load i8, i8* %95, align 1
  %97 = sext i8 %96 to i32
  %98 = call i32 @version_error(i32 %97, i32 116)
  %99 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %100 = call i32 @fclose(%struct._IO_FILE* %99)
  store i32 -1, i32* %5, align 4
  br label %275

; <label>:101:                                    ; preds = %87, %81, %69
  %102 = load i8, i8* @verbose, align 1
  %103 = icmp ne i8 %102, 0
  br i1 %103, label %104, label %113

; <label>:104:                                    ; preds = %101
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 6)
  %105 = add i64 %pgocount9, 1
  store i64 %105, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 6)
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %107 = call i8* @LANG(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.27, i32 0, i32 0))
  %108 = load i8*, i8** %9, align 8
  %109 = load i8, i8* %108, align 1
  %110 = call signext i8 @EXT_C(i8 signext %109)
  %111 = sext i8 %110 to i32
  %112 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %106, i8* %107, i32 %111)
  br label %113

; <label>:113:                                    ; preds = %104, %101
  %114 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i64 0, i64 0
  store i8 0, i8* %114, align 16
  %115 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i32 0, i32 0
  %116 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %117 = call i64 @fread(i8* %115, i64 1, i64 1, %struct._IO_FILE* %116)
  %118 = load i8, i8* %10, align 1
  %119 = zext i8 %118 to i32
  %120 = and i32 %119, 124
  %121 = icmp eq i32 %120, 44
  br i1 %121, label %122, label %132

; <label>:122:                                    ; preds = %113
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 9)
  %123 = add i64 %pgocount10, 1
  store i64 %123, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 9)
  %124 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i64 0, i64 0
  %125 = load i8, i8* %124, align 16
  %126 = zext i8 %125 to i32
  %127 = add nsw i32 %126, 2
  %128 = sext i32 %127 to i64
  %129 = add i64 %128, 8
  %130 = load i64, i64* %13, align 8
  %131 = sub i64 %130, %129
  store i64 %131, i64* %13, align 8
  br label %132

; <label>:132:                                    ; preds = %122, %113
  %133 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i64 0, i64 0
  %134 = load i8, i8* %133, align 16
  %135 = zext i8 %134 to i32
  %136 = icmp sgt i32 %135, 0
  br i1 %136, label %137, label %160

; <label>:137:                                    ; preds = %132
  %138 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i64 0, i64 0
  %139 = load i8, i8* %138, align 16
  %140 = zext i8 %139 to i32
  %141 = icmp sge i32 %140, 256
  br i1 %141, label %142, label %150

; <label>:142:                                    ; preds = %137
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 13)
  %143 = add i64 %pgocount11, 1
  store i64 %143, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 13)
  %144 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %145 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i64 0, i64 0
  %146 = load i8, i8* %145, align 16
  %147 = zext i8 %146 to i64
  %148 = call i32 @fseek(%struct._IO_FILE* %144, i64 %147, i32 1)
  %149 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i64 0, i64 0
  store i8 0, i8* %149, align 16
  br label %159

; <label>:150:                                    ; preds = %137
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 14)
  %151 = add i64 %pgocount12, 1
  store i64 %151, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 14)
  %152 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i32 0, i32 0
  %153 = getelementptr inbounds i8, i8* %152, i64 1
  %154 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i64 0, i64 0
  %155 = load i8, i8* %154, align 16
  %156 = zext i8 %155 to i64
  %157 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %158 = call i64 @fread(i8* %153, i64 1, i64 %156, %struct._IO_FILE* %157)
  br label %159

; <label>:159:                                    ; preds = %150, %142
  br label %160

; <label>:160:                                    ; preds = %159, %132
  %161 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i64 0, i64 0
  %162 = load i8, i8* %161, align 16
  %163 = icmp ne i8 %162, 0
  br i1 %163, label %164, label %184

; <label>:164:                                    ; preds = %160
  %165 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i32 0, i32 0
  call void @PascalToC(i8* %165)
  %166 = load i8, i8* @verbose, align 1
  %167 = icmp ne i8 %166, 0
  br i1 %167, label %168, label %174

; <label>:168:                                    ; preds = %164
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 11)
  %169 = add i64 %pgocount13, 1
  store i64 %169, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 11)
  %170 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %171 = call i8* @LANG(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.28, i32 0, i32 0))
  %172 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i32 0, i32 0
  %173 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %170, i8* %171, i8* %172)
  br label %174

; <label>:174:                                    ; preds = %168, %164
  %175 = load i8*, i8** %8, align 8
  %176 = icmp ne i8* %175, null
  br i1 %176, label %177, label %182

; <label>:177:                                    ; preds = %174
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 12)
  %178 = add i64 %pgocount14, 1
  store i64 %178, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 12)
  %179 = load i8*, i8** %8, align 8
  %180 = getelementptr inbounds [256 x i8], [256 x i8]* %14, i32 0, i32 0
  %181 = call i8* @strcpy(i8* %179, i8* %180) #5
  br label %182

; <label>:182:                                    ; preds = %177, %174
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 7)
  %183 = add i64 %pgocount15, 1
  store i64 %183, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 7)
  br label %184

; <label>:184:                                    ; preds = %182, %160
  %185 = load i8*, i8** %9, align 8
  %186 = load i8, i8* %185, align 1
  %187 = sext i8 %186 to i32
  %188 = icmp eq i32 %187, 108
  br i1 %188, label %189, label %198

; <label>:189:                                    ; preds = %184
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 10)
  %190 = add i64 %pgocount16, 1
  store i64 %190, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 10)
  %191 = getelementptr inbounds [5 x i8], [5 x i8]* %16, i32 0, i32 0
  %192 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %193 = call i64 @fread(i8* %191, i64 1, i64 4, %struct._IO_FILE* %192)
  %194 = getelementptr inbounds [5 x i8], [5 x i8]* %16, i64 0, i64 4
  store i8 0, i8* %194, align 1
  %195 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %196 = getelementptr inbounds [5 x i8], [5 x i8]* %16, i32 0, i32 0
  %197 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %195, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.29, i32 0, i32 0), i8* %196)
  store i32 -1, i32* %5, align 4
  br label %275

; <label>:198:                                    ; preds = %184
  %199 = bitcast i64* %15 to i8*
  %200 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %201 = call i64 @fread(i8* %199, i64 1, i64 8, %struct._IO_FILE* %200)
  br label %202

; <label>:202:                                    ; preds = %198
  %203 = load i8*, i8** %9, align 8
  %204 = load i8, i8* %203, align 1
  %205 = sext i8 %204 to i32
  %206 = icmp eq i32 %205, 108
  br i1 %206, label %207, label %209

; <label>:207:                                    ; preds = %202
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 16)
  %208 = add i64 %pgocount17, 1
  store i64 %208, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 16)
  br label %269

; <label>:209:                                    ; preds = %202
  %210 = load i8*, i8** %9, align 8
  %211 = load i8, i8* %210, align 1
  %212 = sext i8 %211 to i32
  %213 = icmp eq i32 %212, 116
  br i1 %213, label %214, label %217

; <label>:214:                                    ; preds = %209
  %215 = load i8*, i8** %7, align 8
  %216 = call %struct._IO_FILE* @fopen(i8* %215, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %216, %struct._IO_FILE** %12, align 8
  br label %221

; <label>:217:                                    ; preds = %209
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 18)
  %218 = add i64 %pgocount18, 1
  store i64 %218, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 18)
  %219 = load i8*, i8** %7, align 8
  %220 = call %struct._IO_FILE* @fopen(i8* %219, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %220, %struct._IO_FILE** %12, align 8
  br label %221

; <label>:221:                                    ; preds = %217, %214
  %222 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %223 = icmp eq %struct._IO_FILE* %222, null
  br i1 %223, label %224, label %230

; <label>:224:                                    ; preds = %221
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 19)
  %225 = add i64 %pgocount19, 1
  store i64 %225, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 19)
  %226 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %227 = call i8* @LANG(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.40, i32 0, i32 0))
  %228 = load i8*, i8** %7, align 8
  %229 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %226, i8* %227, i8* %228)
  br label %272

; <label>:230:                                    ; preds = %221
  %231 = load i8*, i8** %9, align 8
  %232 = load i8, i8* %231, align 1
  %233 = sext i8 %232 to i32
  %234 = icmp eq i32 %233, 116
  %235 = zext i1 %234 to i64
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 24)
  %236 = add i64 %pgocount20, %235
  store i64 %236, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 24)
  %237 = select i1 %234, i32 2, i32 0
  store i32 %237, i32* @CONVERSION, align 4
  %238 = load i8*, i8** %9, align 8
  %239 = load i8, i8* %238, align 1
  %240 = sext i8 %239 to i32
  %241 = icmp eq i32 %240, 98
  br i1 %241, label %242, label %248

; <label>:242:                                    ; preds = %230
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 20)
  %243 = add i64 %pgocount21, 1
  store i64 %243, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 20)
  %244 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %245 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %246 = load i64, i64* %13, align 8
  %247 = call i32 @copyfile(%struct._IO_FILE* %244, %struct._IO_FILE* %245, i64 %246)
  store i32 %247, i32* %17, align 4
  br label %254

; <label>:248:                                    ; preds = %230
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 21)
  %249 = add i64 %pgocount22, 1
  store i64 %249, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 21)
  %250 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %251 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %252 = load i64, i64* %13, align 8
  %253 = call i32 @copyfile_from_canon(%struct._IO_FILE* %250, %struct._IO_FILE* %251, i64 %252)
  store i32 %253, i32* %17, align 4
  br label %254

; <label>:254:                                    ; preds = %248, %242
  store i32 0, i32* @CONVERSION, align 4
  %255 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %256 = call i32 @write_error(%struct._IO_FILE* %255)
  %257 = icmp ne i32 %256, 0
  br i1 %257, label %262, label %258

; <label>:258:                                    ; preds = %254
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 22)
  %259 = add i64 %pgocount23, 1
  store i64 %259, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 22)
  %260 = load i32, i32* %17, align 4
  %261 = icmp slt i32 %260, 0
  br i1 %261, label %262, label %265

; <label>:262:                                    ; preds = %258, %254
  %263 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %264 = call i32 @fclose(%struct._IO_FILE* %263)
  br label %272

; <label>:265:                                    ; preds = %258
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 23)
  %266 = add i64 %pgocount24, 1
  store i64 %266, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strip_literal, i64 0, i64 23)
  %267 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %268 = call i32 @fclose(%struct._IO_FILE* %267)
  br label %269

; <label>:269:                                    ; preds = %265, %207
  %270 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %271 = call i32 @fclose(%struct._IO_FILE* %270)
  store i32 0, i32* %5, align 4
  br label %275

; <label>:272:                                    ; preds = %262, %224
  %273 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %274 = call i32 @fclose(%struct._IO_FILE* %273)
  store i32 -1, i32* %5, align 4
  br label %275

; <label>:275:                                    ; preds = %272, %269, %189, %93, %62, %37
  %276 = load i32, i32* %5, align 4
  ret i32 %276
}

; Function Attrs: noinline nounwind uwtable
define i32 @decryptfile(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca [130 x i16], align 16
  %16 = alloca [130 x i16], align 16
  %17 = alloca [130 x i16], align 16
  %18 = alloca [130 x i16], align 16
  %19 = alloca [130 x i16], align 16
  %20 = alloca [130 x i16], align 16
  %21 = alloca [260 x i8], align 16
  %22 = alloca [260 x i8], align 16
  %23 = alloca [8 x i8], align 1
  %24 = alloca i64, align 8
  %25 = alloca i8*, align 8
  %26 = alloca [256 x i8], align 16
  %27 = alloca i64, align 8
  %28 = alloca i64, align 8
  %29 = alloca i8, align 1
  %30 = alloca i8, align 1
  %31 = alloca i16, align 2
  %32 = alloca i16, align 2
  %33 = alloca %struct.nkey*, align 8
  %34 = alloca %struct.nkey*, align 8
  %35 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 0, i32* %10, align 4
  %36 = bitcast i64* %24 to i8*
  store i8* %36, i8** %25, align 8
  store i64 0, i64* %28, align 8
  store i16 0, i16* %31, align 2
  store %struct.nkey* null, %struct.nkey** %34, align 8
  %37 = load i8, i8* @verbose, align 1
  %38 = icmp ne i8 %37, 0
  br i1 %38, label %39, label %45

; <label>:39:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 10)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 10)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %42 = load i8*, i8** %4, align 8
  %43 = load i8*, i8** %5, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.60, i32 0, i32 0), i8* %42, i8* %43)
  br label %45

; <label>:45:                                     ; preds = %39, %2
  %46 = load i8*, i8** %4, align 8
  %47 = call %struct._IO_FILE* @fopen(i8* %46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %47, %struct._IO_FILE** %8, align 8
  %48 = icmp eq %struct._IO_FILE* %47, null
  br i1 %48, label %49, label %55

; <label>:49:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 12)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 12)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %52 = call i8* @LANG(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.20, i32 0, i32 0))
  %53 = load i8*, i8** %4, align 8
  %54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* %52, i8* %53)
  store i32 -1, i32* %3, align 4
  br label %443

; <label>:55:                                     ; preds = %45
  store i32 0, i32* %14, align 4
  store i32 0, i32* %13, align 4
  br label %56

; <label>:56:                                     ; preds = %235, %55
  store i32 0, i32* %12, align 4
  store i16 130, i16* @global_precision, align 2
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %58 = call i64 @fread(i8* %6, i64 1, i64 1, %struct._IO_FILE* %57)
  %59 = load i8, i8* %6, align 1
  %60 = zext i8 %59 to i32
  %61 = and i32 %60, 128
  %62 = icmp eq i32 %61, 128
  br i1 %62, label %71, label %63

; <label>:63:                                     ; preds = %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 13)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 13)
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %66 = call i8* @LANG(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.61, i32 0, i32 0))
  %67 = load i8*, i8** %4, align 8
  %68 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %65, i8* %66, i8* %67)
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %70 = call i32 @fclose(%struct._IO_FILE* %69)
  store i32 -1, i32* %3, align 4
  br label %443

; <label>:71:                                     ; preds = %56
  %72 = load i8, i8* %6, align 1
  %73 = zext i8 %72 to i32
  %74 = and i32 %73, 124
  %75 = icmp eq i32 %74, 4
  br i1 %75, label %78, label %76

; <label>:76:                                     ; preds = %71
  %pgocount3 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 1)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 1)
  store i32 1, i32* %14, align 4
  br label %235

; <label>:78:                                     ; preds = %71
  %79 = load i8, i8* %6, align 1
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %81 = call i64 @getpastlength(i8 zeroext %79, %struct._IO_FILE* %80)
  %82 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %83 = call i32 @_IO_getc(%struct._IO_FILE* %82)
  %84 = trunc i32 %83 to i8
  store i8 %84, i8* %29, align 1
  %85 = load i8, i8* %29, align 1
  %86 = zext i8 %85 to i32
  %87 = call i32 @version_byte_error(i32 %86)
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %93

; <label>:89:                                     ; preds = %78
  %pgocount4 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 15)
  %90 = add i64 %pgocount4, 1
  store i64 %90, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 15)
  %91 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %92 = call i32 @fclose(%struct._IO_FILE* %91)
  store i32 -1, i32* %3, align 4
  br label %443

; <label>:93:                                     ; preds = %78
  %94 = getelementptr inbounds [8 x i8], [8 x i8]* %23, i32 0, i32 0
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %96 = call i64 @fread(i8* %94, i64 1, i64 8, %struct._IO_FILE* %95)
  %97 = call i8* (i64, ...) bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 16)
  %98 = bitcast i8* %97 to %struct.nkey*
  store %struct.nkey* %98, %struct.nkey** %33, align 8
  %99 = load %struct.nkey*, %struct.nkey** %33, align 8
  %100 = icmp eq %struct.nkey* %99, null
  br i1 %100, label %101, label %106

; <label>:101:                                    ; preds = %93
  %pgocount5 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 6)
  %102 = add i64 %pgocount5, 1
  store i64 %102, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 6)
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %104 = call i8* @LANG(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.62, i32 0, i32 0))
  %105 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %103, i8* %104)
  call void @exitPGP(i32 7)
  br label %106

; <label>:106:                                    ; preds = %101, %93
  %107 = load %struct.nkey*, %struct.nkey** %33, align 8
  %108 = getelementptr inbounds %struct.nkey, %struct.nkey* %107, i32 0, i32 0
  %109 = getelementptr inbounds [8 x i8], [8 x i8]* %108, i32 0, i32 0
  %110 = getelementptr inbounds [8 x i8], [8 x i8]* %23, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %109, i8* %110, i64 8, i32 1, i1 false)
  %111 = load %struct.nkey*, %struct.nkey** %34, align 8
  %112 = load %struct.nkey*, %struct.nkey** %33, align 8
  %113 = getelementptr inbounds %struct.nkey, %struct.nkey* %112, i32 0, i32 1
  store %struct.nkey* %111, %struct.nkey** %113, align 8
  %114 = load %struct.nkey*, %struct.nkey** %33, align 8
  store %struct.nkey* %114, %struct.nkey** %34, align 8
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %116 = call i32 @_IO_getc(%struct._IO_FILE* %115)
  %117 = trunc i32 %116 to i8
  store i8 %117, i8* %30, align 1
  %118 = load i8, i8* %30, align 1
  %119 = zext i8 %118 to i32
  %120 = call i32 @version_error(i32 %119, i32 1)
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %122, label %126

; <label>:122:                                    ; preds = %106
  %pgocount6 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 16)
  %123 = add i64 %pgocount6, 1
  store i64 %123, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 16)
  %124 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %125 = call i32 @fclose(%struct._IO_FILE* %124)
  store i32 -1, i32* %3, align 4
  br label %443

; <label>:126:                                    ; preds = %106
  %127 = load i32, i32* %13, align 4
  %128 = icmp ne i32 %127, 0
  br i1 %128, label %154, label %129

; <label>:129:                                    ; preds = %126
  %130 = load i8, i8* @quietmode, align 1
  %131 = zext i8 %130 to i32
  %132 = icmp ne i32 %131, 0
  %133 = zext i1 %132 to i64
  %pgocount7 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 35)
  %134 = add i64 %pgocount7, %133
  store i64 %134, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 35)
  %135 = select i1 %132, i32 0, i32 2
  %136 = or i32 1, %135
  %137 = getelementptr inbounds [8 x i8], [8 x i8]* %23, i32 0, i32 0
  %138 = load i8*, i8** %25, align 8
  %139 = getelementptr inbounds [256 x i8], [256 x i8]* %26, i32 0, i32 0
  %140 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %141 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  %142 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %143 = getelementptr inbounds [130 x i16], [130 x i16]* %18, i32 0, i32 0
  %144 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %145 = getelementptr inbounds [130 x i16], [130 x i16]* %20, i32 0, i32 0
  %146 = call i32 @getsecretkey(i32 %136, i8* null, i8* %137, i8* %138, i8* null, i8* null, i8* %139, i16* %140, i16* %141, i16* %142, i16* %143, i16* %144, i16* %145)
  %147 = icmp eq i32 %146, 0
  br i1 %147, label %148, label %151

; <label>:148:                                    ; preds = %129
  %pgocount8 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 11)
  %149 = add i64 %pgocount8, 1
  store i64 %149, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 11)
  store i32 1, i32* %13, align 4
  store i32 1, i32* %12, align 4
  %150 = load i16, i16* @global_precision, align 2
  store i16 %150, i16* %31, align 2
  br label %153

; <label>:151:                                    ; preds = %129
  %pgocount9 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 7)
  %152 = add i64 %pgocount9, 1
  store i64 %152, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 7)
  store i16 130, i16* @global_precision, align 2
  br label %153

; <label>:153:                                    ; preds = %151, %148
  br label %154

; <label>:154:                                    ; preds = %153, %126
  %155 = getelementptr inbounds [260 x i8], [260 x i8]* %21, i32 0, i32 0
  %156 = bitcast i8* %155 to i16*
  %157 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %158 = call i32 @read_mpi(i16* %156, %struct._IO_FILE* %157, i8 zeroext 0, %struct.IdeaCfbContext* null)
  %159 = load i32, i32* %12, align 4
  %160 = icmp ne i32 %159, 0
  br i1 %160, label %161, label %231

; <label>:161:                                    ; preds = %154
  %162 = load i8, i8* @quietmode, align 1
  %163 = icmp ne i8 %162, 0
  br i1 %163, label %171, label %164

; <label>:164:                                    ; preds = %161
  %pgocount10 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 8)
  %165 = add i64 %pgocount10, 1
  store i64 %165, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 8)
  %166 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %167 = call i8* @LANG(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.52, i32 0, i32 0))
  %168 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %166, i8* %167)
  %169 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %170 = call i32 @fflush(%struct._IO_FILE* %169)
  br label %171

; <label>:171:                                    ; preds = %164, %161
  %172 = getelementptr inbounds [260 x i8], [260 x i8]* %22, i32 0, i32 0
  %173 = getelementptr inbounds [260 x i8], [260 x i8]* %21, i32 0, i32 0
  %174 = bitcast i8* %173 to i16*
  %175 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  %176 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %177 = getelementptr inbounds [130 x i16], [130 x i16]* %18, i32 0, i32 0
  %178 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %179 = getelementptr inbounds [130 x i16], [130 x i16]* %20, i32 0, i32 0
  %180 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %181 = call i32 @rsa_private_decrypt(i8* %172, i16* %174, i16* %175, i16* %176, i16* %177, i16* %178, i16* %179, i16* %180)
  store i32 %181, i32* %10, align 4
  %182 = load i32, i32* %10, align 4
  %183 = icmp slt i32 %182, 0
  br i1 %183, label %184, label %222

; <label>:184:                                    ; preds = %171
  %185 = load i32, i32* %10, align 4
  %186 = icmp eq i32 %185, -3
  br i1 %186, label %187, label %191

; <label>:187:                                    ; preds = %184
  %pgocount11 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 21)
  %188 = add i64 %pgocount11, 1
  store i64 %188, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 21)
  %189 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %190 = call i32 @fputs(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @.str.63, i32 0, i32 0), %struct._IO_FILE* %189)
  br label %218

; <label>:191:                                    ; preds = %184
  %192 = load i32, i32* %10, align 4
  %193 = icmp eq i32 %192, -9
  br i1 %193, label %198, label %194

; <label>:194:                                    ; preds = %191
  %pgocount12 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 24)
  %195 = add i64 %pgocount12, 1
  store i64 %195, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 24)
  %196 = load i32, i32* %10, align 4
  %197 = icmp eq i32 %196, -7
  br i1 %197, label %198, label %203

; <label>:198:                                    ; preds = %194, %191
  %pgocount13 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 23)
  %199 = add i64 %pgocount13, 1
  store i64 %199, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 23)
  %200 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %201 = call i8* @LANG(i8* getelementptr inbounds ([119 x i8], [119 x i8]* @.str.34, i32 0, i32 0))
  %202 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %200, i8* %201)
  br label %217

; <label>:203:                                    ; preds = %194
  %204 = load i32, i32* %10, align 4
  %205 = icmp eq i32 %204, -5
  br i1 %205, label %206, label %211

; <label>:206:                                    ; preds = %203
  %pgocount14 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 28)
  %207 = add i64 %pgocount14, 1
  store i64 %207, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 28)
  %208 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %209 = call i8* @LANG(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.64, i32 0, i32 0))
  %210 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %208, i8* %209)
  br label %216

; <label>:211:                                    ; preds = %203
  %pgocount15 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 29)
  %212 = add i64 %pgocount15, 1
  store i64 %212, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 29)
  %213 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %214 = load i32, i32* %10, align 4
  %215 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %213, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.65, i32 0, i32 0), i32 %214)
  br label %216

; <label>:216:                                    ; preds = %211, %206
  br label %217

; <label>:217:                                    ; preds = %216, %198
  br label %218

; <label>:218:                                    ; preds = %217, %187
  %219 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %220 = call i32 @fclose(%struct._IO_FILE* %219)
  %221 = load i32, i32* %10, align 4
  store i32 %221, i32* %3, align 4
  br label %443

; <label>:222:                                    ; preds = %171
  %223 = load i8, i8* @quietmode, align 1
  %224 = icmp ne i8 %223, 0
  br i1 %224, label %229, label %225

; <label>:225:                                    ; preds = %222
  %pgocount16 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 9)
  %226 = add i64 %pgocount16, 1
  store i64 %226, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 9)
  %227 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %228 = call i32 @fputc(i32 46, %struct._IO_FILE* %227)
  br label %229

; <label>:229:                                    ; preds = %225, %222
  %pgocount17 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 4)
  %230 = add i64 %pgocount17, 1
  store i64 %230, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 4)
  br label %231

; <label>:231:                                    ; preds = %229, %154
  %pgocount18 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 2)
  %232 = add i64 %pgocount18, 1
  store i64 %232, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 2)
  %233 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %234 = call i64 @ftell(%struct._IO_FILE* %233)
  store i64 %234, i64* %28, align 8
  br label %235

; <label>:235:                                    ; preds = %231, %76
  %236 = load i32, i32* %14, align 4
  %237 = icmp ne i32 %236, 0
  %238 = xor i1 %237, true
  br i1 %238, label %56, label %239

; <label>:239:                                    ; preds = %235
  %240 = load i32, i32* %13, align 4
  %241 = icmp ne i32 %240, 0
  br i1 %241, label %242, label %247

; <label>:242:                                    ; preds = %239
  %pgocount19 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 14)
  %243 = add i64 %pgocount19, 1
  store i64 %243, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 14)
  %244 = load i8, i8* @verbose, align 1
  %245 = zext i8 %244 to i32
  %246 = icmp ne i32 %245, 0
  br i1 %246, label %247, label %292

; <label>:247:                                    ; preds = %242, %239
  %248 = call i32 @setkrent(i8* null)
  %249 = call i32 @init_userhash()
  %250 = load i32, i32* %13, align 4
  %251 = icmp ne i32 %250, 0
  br i1 %251, label %252, label %256

; <label>:252:                                    ; preds = %247
  %pgocount20 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 17)
  %253 = add i64 %pgocount20, 1
  store i64 %253, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 17)
  %254 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %255 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %254, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.66, i32 0, i32 0))
  br label %261

; <label>:256:                                    ; preds = %247
  %pgocount21 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 20)
  %257 = add i64 %pgocount21, 1
  store i64 %257, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 20)
  %258 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %259 = call i8* @LANG(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.67, i32 0, i32 0))
  %260 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %258, i8* %259)
  br label %261

; <label>:261:                                    ; preds = %256, %252
  %262 = load %struct.nkey*, %struct.nkey** %34, align 8
  store %struct.nkey* %262, %struct.nkey** %33, align 8
  br label %263

; <label>:263:                                    ; preds = %287, %261
  %264 = load %struct.nkey*, %struct.nkey** %33, align 8
  %265 = icmp ne %struct.nkey* %264, null
  br i1 %265, label %266, label %291

; <label>:266:                                    ; preds = %263
  %267 = load %struct.nkey*, %struct.nkey** %33, align 8
  %268 = getelementptr inbounds %struct.nkey, %struct.nkey* %267, i32 0, i32 0
  %269 = getelementptr inbounds [8 x i8], [8 x i8]* %268, i32 0, i32 0
  %270 = call i8* @user_from_keyID(i8* %269)
  store i8* %270, i8** %35, align 8
  %271 = icmp eq i8* %270, null
  br i1 %271, label %272, label %281

; <label>:272:                                    ; preds = %266
  %pgocount22 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 5)
  %273 = add i64 %pgocount22, 1
  store i64 %273, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 5)
  %274 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %275 = call i8* @LANG(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.68, i32 0, i32 0))
  %276 = load %struct.nkey*, %struct.nkey** %33, align 8
  %277 = getelementptr inbounds %struct.nkey, %struct.nkey* %276, i32 0, i32 0
  %278 = getelementptr inbounds [8 x i8], [8 x i8]* %277, i32 0, i32 0
  %279 = call i8* @keyIDstring(i8* %278)
  %280 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %274, i8* %275, i8* %279)
  br label %286

; <label>:281:                                    ; preds = %266
  %pgocount23 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 3)
  %282 = add i64 %pgocount23, 1
  store i64 %282, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 3)
  %283 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %284 = load i8*, i8** %35, align 8
  %285 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %283, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.69, i32 0, i32 0), i8* %284)
  br label %286

; <label>:286:                                    ; preds = %281, %272
  br label %287

; <label>:287:                                    ; preds = %286
  %288 = load %struct.nkey*, %struct.nkey** %33, align 8
  %289 = getelementptr inbounds %struct.nkey, %struct.nkey* %288, i32 0, i32 1
  %290 = load %struct.nkey*, %struct.nkey** %289, align 8
  store %struct.nkey* %290, %struct.nkey** %33, align 8
  br label %263

; <label>:291:                                    ; preds = %263
  call void @endkrent()
  br label %292

; <label>:292:                                    ; preds = %291, %242
  %293 = load %struct.nkey*, %struct.nkey** %34, align 8
  store %struct.nkey* %293, %struct.nkey** %33, align 8
  br label %294

; <label>:294:                                    ; preds = %297, %292
  %295 = load %struct.nkey*, %struct.nkey** %33, align 8
  %296 = icmp ne %struct.nkey* %295, null
  br i1 %296, label %297, label %305

; <label>:297:                                    ; preds = %294
  %pgocount24 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 0)
  %298 = add i64 %pgocount24, 1
  store i64 %298, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 0)
  %299 = load %struct.nkey*, %struct.nkey** %33, align 8
  %300 = getelementptr inbounds %struct.nkey, %struct.nkey* %299, i32 0, i32 1
  %301 = load %struct.nkey*, %struct.nkey** %300, align 8
  store %struct.nkey* %301, %struct.nkey** %33, align 8
  %302 = load %struct.nkey*, %struct.nkey** %34, align 8
  %303 = call i32 (%struct.nkey*, ...) bitcast (i32 (...)* @free to i32 (%struct.nkey*, ...)*)(%struct.nkey* %302)
  %304 = load %struct.nkey*, %struct.nkey** %33, align 8
  store %struct.nkey* %304, %struct.nkey** %34, align 8
  br label %294

; <label>:305:                                    ; preds = %294
  %306 = load i32, i32* %13, align 4
  %307 = icmp ne i32 %306, 0
  br i1 %307, label %308, label %313

; <label>:308:                                    ; preds = %305
  %309 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %310 = load i64, i64* %28, align 8
  %311 = call i32 @fseek(%struct._IO_FILE* %309, i64 %310, i32 0)
  %312 = load i16, i16* %31, align 2
  store i16 %312, i16* @global_precision, align 2
  br label %320

; <label>:313:                                    ; preds = %305
  %pgocount25 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 19)
  %314 = add i64 %pgocount25, 1
  store i64 %314, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 19)
  %315 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %316 = call i8* @LANG(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.70, i32 0, i32 0))
  %317 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %315, i8* %316)
  %318 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %319 = call i32 @fclose(%struct._IO_FILE* %318)
  store i32 -1, i32* %3, align 4
  br label %443

; <label>:320:                                    ; preds = %308
  %321 = load i32, i32* %10, align 4
  %322 = add nsw i32 %321, -1
  store i32 %322, i32* %10, align 4
  %323 = getelementptr inbounds [260 x i8], [260 x i8]* %22, i64 0, i64 0
  %324 = load i8, i8* %323, align 16
  %325 = zext i8 %324 to i32
  %326 = call i32 @version_error(i32 %325, i32 1)
  %327 = icmp ne i32 %326, 0
  br i1 %327, label %328, label %332

; <label>:328:                                    ; preds = %320
  %pgocount26 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 18)
  %329 = add i64 %pgocount26, 1
  store i64 %329, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 18)
  %330 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %331 = call i32 @fclose(%struct._IO_FILE* %330)
  store i32 -1, i32* %3, align 4
  br label %443

; <label>:332:                                    ; preds = %320
  %333 = load i32, i32* %10, align 4
  %334 = sub nsw i32 %333, 2
  store i32 %334, i32* %10, align 4
  %335 = getelementptr inbounds [260 x i8], [260 x i8]* %22, i32 0, i32 0
  %336 = getelementptr inbounds i8, i8* %335, i64 1
  %337 = load i32, i32* %10, align 4
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds i8, i8* %336, i64 %338
  %340 = call zeroext i16 @fetch_word16(i8* %339)
  store i16 %340, i16* %32, align 2
  %341 = load i16, i16* %32, align 2
  %342 = zext i16 %341 to i32
  %343 = getelementptr inbounds [260 x i8], [260 x i8]* %22, i32 0, i32 0
  %344 = getelementptr inbounds i8, i8* %343, i64 1
  %345 = load i32, i32* %10, align 4
  %346 = trunc i32 %345 to i16
  %347 = call zeroext i16 @checksum(i8* %344, i16 zeroext %346)
  %348 = zext i16 %347 to i32
  %349 = icmp ne i32 %342, %348
  br i1 %349, label %350, label %357

; <label>:350:                                    ; preds = %332
  %pgocount27 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 22)
  %351 = add i64 %pgocount27, 1
  store i64 %351, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 22)
  %352 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %353 = call i8* @LANG(i8* getelementptr inbounds ([119 x i8], [119 x i8]* @.str.34, i32 0, i32 0))
  %354 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %352, i8* %353)
  %355 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %356 = call i32 @fclose(%struct._IO_FILE* %355)
  store i32 -1, i32* %3, align 4
  br label %443

; <label>:357:                                    ; preds = %332
  %358 = load i8*, i8** %5, align 8
  %359 = call %struct._IO_FILE* @fopen(i8* %358, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %359, %struct._IO_FILE** %9, align 8
  %360 = icmp eq %struct._IO_FILE* %359, null
  br i1 %360, label %361, label %367

; <label>:361:                                    ; preds = %357
  %pgocount28 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 26)
  %362 = add i64 %pgocount28, 1
  store i64 %362, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 26)
  %363 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %364 = call i8* @LANG(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.40, i32 0, i32 0))
  %365 = load i8*, i8** %5, align 8
  %366 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %363, i8* %364, i8* %365)
  br label %434

; <label>:367:                                    ; preds = %357
  %368 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %369 = call i64 @fread(i8* %7, i64 1, i64 1, %struct._IO_FILE* %368)
  %370 = load i8, i8* %7, align 1
  %371 = zext i8 %370 to i32
  %372 = and i32 %371, 128
  %373 = icmp eq i32 %372, 128
  br i1 %373, label %374, label %380

; <label>:374:                                    ; preds = %367
  %pgocount29 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 27)
  %375 = add i64 %pgocount29, 1
  store i64 %375, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 27)
  %376 = load i8, i8* %7, align 1
  %377 = zext i8 %376 to i32
  %378 = and i32 %377, 124
  %379 = icmp eq i32 %378, 36
  br i1 %379, label %384, label %380

; <label>:380:                                    ; preds = %374, %367
  %pgocount30 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 25)
  %381 = add i64 %pgocount30, 1
  store i64 %381, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 25)
  %382 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %383 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %382, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.71, i32 0, i32 0))
  br label %434

; <label>:384:                                    ; preds = %374
  %385 = load i8, i8* %7, align 1
  %386 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %387 = call i64 @getpastlength(i8 zeroext %385, %struct._IO_FILE* %386)
  store i64 %387, i64* %27, align 8
  %388 = getelementptr inbounds [260 x i8], [260 x i8]* %22, i32 0, i32 0
  %389 = getelementptr inbounds i8, i8* %388, i64 1
  %390 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %391 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %392 = load i64, i64* %27, align 8
  %393 = call i32 @idea_file(i8* %389, i8 zeroext 1, %struct._IO_FILE* %390, %struct._IO_FILE* %391, i64 %392)
  store i32 %393, i32* %11, align 4
  %394 = load i32, i32* %11, align 4
  %395 = icmp slt i32 %394, 0
  br i1 %395, label %396, label %401

; <label>:396:                                    ; preds = %384
  %pgocount31 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 31)
  %397 = add i64 %pgocount31, 1
  store i64 %397, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 31)
  %398 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %399 = call i8* @LANG(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.72, i32 0, i32 0))
  %400 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %398, i8* %399)
  br label %401

; <label>:401:                                    ; preds = %396, %384
  %402 = load i8, i8* @quietmode, align 1
  %403 = icmp ne i8 %402, 0
  br i1 %403, label %408, label %404

; <label>:404:                                    ; preds = %401
  %pgocount32 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 32)
  %405 = add i64 %pgocount32, 1
  store i64 %405, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 32)
  %406 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %407 = call i32 @fputc(i32 46, %struct._IO_FILE* %406)
  br label %408

; <label>:408:                                    ; preds = %404, %401
  %409 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %410 = call i32 @write_error(%struct._IO_FILE* %409)
  %411 = icmp ne i32 %410, 0
  br i1 %411, label %412, label %416

; <label>:412:                                    ; preds = %408
  %pgocount33 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 30)
  %413 = add i64 %pgocount33, 1
  store i64 %413, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 30)
  %414 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %415 = call i32 @fclose(%struct._IO_FILE* %414)
  br label %434

; <label>:416:                                    ; preds = %408
  %417 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %418 = call i32 @fclose(%struct._IO_FILE* %417)
  %419 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %420 = call i32 @fclose(%struct._IO_FILE* %419)
  %421 = bitcast [260 x i8]* %21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %421, i8 0, i64 260, i32 16, i1 false)
  %422 = bitcast [260 x i8]* %22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %422, i8 0, i64 260, i32 16, i1 false)
  %423 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  call void @mp_init(i16* %423, i16 zeroext 0)
  %424 = getelementptr inbounds [130 x i16], [130 x i16]* %18, i32 0, i32 0
  call void @mp_init(i16* %424, i16 zeroext 0)
  %425 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  call void @mp_init(i16* %425, i16 zeroext 0)
  %426 = getelementptr inbounds [130 x i16], [130 x i16]* %20, i32 0, i32 0
  call void @mp_init(i16* %426, i16 zeroext 0)
  %427 = load i32, i32* %11, align 4
  %428 = icmp slt i32 %427, 0
  br i1 %428, label %429, label %432

; <label>:429:                                    ; preds = %416
  %pgocount34 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 34)
  %430 = add i64 %pgocount34, 1
  store i64 %430, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 34)
  %431 = load i32, i32* %11, align 4
  store i32 %431, i32* %3, align 4
  br label %443

; <label>:432:                                    ; preds = %416
  %pgocount35 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 33)
  %433 = add i64 %pgocount35, 1
  store i64 %433, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_decryptfile, i64 0, i64 33)
  store i32 1, i32* %3, align 4
  br label %443

; <label>:434:                                    ; preds = %412, %380, %361
  %435 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %436 = call i32 @fclose(%struct._IO_FILE* %435)
  %437 = bitcast [260 x i8]* %21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %437, i8 0, i64 260, i32 16, i1 false)
  %438 = bitcast [260 x i8]* %22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %438, i8 0, i64 260, i32 16, i1 false)
  %439 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  call void @mp_init(i16* %439, i16 zeroext 0)
  %440 = getelementptr inbounds [130 x i16], [130 x i16]* %18, i32 0, i32 0
  call void @mp_init(i16* %440, i16 zeroext 0)
  %441 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  call void @mp_init(i16* %441, i16 zeroext 0)
  %442 = getelementptr inbounds [130 x i16], [130 x i16]* %20, i32 0, i32 0
  call void @mp_init(i16* %442, i16 zeroext 0)
  store i32 -1, i32* %3, align 4
  br label %443

; <label>:443:                                    ; preds = %434, %432, %429, %350, %328, %313, %218, %122, %89, %63, %49
  %444 = load i32, i32* %3, align 4
  ret i32 %444
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

declare i8* @malloc(...) #1

declare void @exitPGP(i32) #1

declare i32 @rsa_private_decrypt(i8*, i16*, i16*, i16*, i16*, i16*, i16*, i16*) #1

declare i32 @setkrent(i8*) #1

declare i32 @init_userhash() #1

declare i8* @user_from_keyID(i8*) #1

declare i8* @keyIDstring(i8*) #1

declare void @endkrent() #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @idea_file(i8*, i8 zeroext, %struct._IO_FILE*, %struct._IO_FILE*, i64) #0 {
  %6 = alloca i8*, align 8
  %7 = alloca i8, align 1
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.IdeaCfbContext, align 4
  store i8* %0, i8** %6, align 8
  store i8 %1, i8* %7, align 1
  store %struct._IO_FILE* %2, %struct._IO_FILE** %8, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** %9, align 8
  store i64 %4, i64* %10, align 8
  store i32 0, i32* %12, align 4
  %14 = load i8*, i8** %6, align 8
  call void @ideaCfbInit(%struct.IdeaCfbContext* %13, i8* %14)
  %15 = load i8, i8* %7, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 7)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 7)
  %19 = load i8*, i8** %6, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i8* %20, i64 8, i32 1, i1 false)
  %21 = load i8, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i64 0, i64 6), align 2
  store i8 %21, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i64 0, i64 8), align 8
  %22 = load i8, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i64 0, i64 7), align 1
  store i8 %22, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i64 0, i64 9), align 1
  call void @ideaCfbEncrypt(%struct.IdeaCfbContext* %13, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i32 10)
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i64 1, i64 10, %struct._IO_FILE* %23)
  br label %55

; <label>:25:                                     ; preds = %5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %27 = call i64 @fread(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i64 1, i64 10, %struct._IO_FILE* %26)
  %28 = trunc i64 %27 to i32
  store i32 %28, i32* %11, align 4
  %29 = load i32, i32* %11, align 4
  %30 = sext i32 %29 to i64
  %31 = load i64, i64* %10, align 8
  %32 = sub i64 %31, %30
  store i64 %32, i64* %10, align 8
  %33 = load i32, i32* %11, align 4
  %34 = icmp eq i32 %33, 10
  br i1 %34, label %35, label %52

; <label>:35:                                     ; preds = %25
  call void @ideaCfbDecrypt(%struct.IdeaCfbContext* %13, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i32 10)
  %36 = load i8, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i64 0, i64 8), align 8
  %37 = zext i8 %36 to i32
  %38 = load i8, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i64 0, i64 6), align 2
  %39 = zext i8 %38 to i32
  %40 = icmp ne i32 %37, %39
  br i1 %40, label %48, label %41

; <label>:41:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 11)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 11)
  %43 = load i8, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i64 0, i64 9), align 1
  %44 = zext i8 %43 to i32
  %45 = load i8, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i64 0, i64 7), align 1
  %46 = zext i8 %45 to i32
  %47 = icmp ne i32 %44, %46
  br i1 %47, label %48, label %50

; <label>:48:                                     ; preds = %41, %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 10)
  %49 = add i64 %pgocount2, 1
  store i64 %49, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 10)
  store i32 -2, i32* %12, align 4
  br label %50

; <label>:50:                                     ; preds = %48, %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 8)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 8)
  br label %54

; <label>:52:                                     ; preds = %25
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 9)
  %53 = add i64 %pgocount4, 1
  store i64 %53, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 9)
  store i32 -3, i32* %12, align 4
  br label %54

; <label>:54:                                     ; preds = %52, %50
  br label %55

; <label>:55:                                     ; preds = %54, %17
  call void @ideaCfbSync(%struct.IdeaCfbContext* %13)
  %56 = load i64, i64* %10, align 8
  %57 = icmp ult i64 %56, 4096
  br i1 %57, label %58, label %61

; <label>:58:                                     ; preds = %55
  %59 = load i64, i64* %10, align 8
  %60 = trunc i64 %59 to i32
  br label %63

; <label>:61:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 5)
  %62 = add i64 %pgocount5, 1
  store i64 %62, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 5)
  br label %63

; <label>:63:                                     ; preds = %61, %58
  %64 = phi i32 [ %60, %58 ], [ 4096, %61 ]
  store i32 %64, i32* %11, align 4
  br label %65

; <label>:65:                                     ; preds = %114, %63
  %66 = load i32, i32* %11, align 4
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %72

; <label>:68:                                     ; preds = %65
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 0)
  %69 = add i64 %pgocount6, 1
  store i64 %69, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 0)
  %70 = load i32, i32* %12, align 4
  %71 = icmp eq i32 %70, 0
  br label %72

; <label>:72:                                     ; preds = %68, %65
  %73 = phi i1 [ false, %65 ], [ %71, %68 ]
  br i1 %73, label %74, label %116

; <label>:74:                                     ; preds = %72
  %75 = load i32, i32* %11, align 4
  %76 = sext i32 %75 to i64
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %78 = call i64 @fread(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i64 1, i64 %76, %struct._IO_FILE* %77)
  %79 = trunc i64 %78 to i32
  store i32 %79, i32* %11, align 4
  %80 = icmp sle i32 %79, 0
  br i1 %80, label %81, label %83

; <label>:81:                                     ; preds = %74
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 6)
  %82 = add i64 %pgocount7, 1
  store i64 %82, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 6)
  store i32 -3, i32* %12, align 4
  br label %116

; <label>:83:                                     ; preds = %74
  %84 = load i32, i32* %11, align 4
  %85 = sext i32 %84 to i64
  %86 = load i64, i64* %10, align 8
  %87 = sub i64 %86, %85
  store i64 %87, i64* %10, align 8
  %88 = load i8, i8* %7, align 1
  %89 = icmp ne i8 %88, 0
  br i1 %89, label %90, label %92

; <label>:90:                                     ; preds = %83
  %91 = load i32, i32* %11, align 4
  call void @ideaCfbDecrypt(%struct.IdeaCfbContext* %13, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i32 %91)
  br label %95

; <label>:92:                                     ; preds = %83
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 4)
  %93 = add i64 %pgocount8, 1
  store i64 %93, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 4)
  %94 = load i32, i32* %11, align 4
  call void @ideaCfbEncrypt(%struct.IdeaCfbContext* %13, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i32 %94)
  br label %95

; <label>:95:                                     ; preds = %92, %90
  %96 = load i32, i32* %11, align 4
  %97 = sext i32 %96 to i64
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %99 = call i64 @fwrite(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i64 1, i64 %97, %struct._IO_FILE* %98)
  %100 = load i32, i32* %11, align 4
  %101 = sext i32 %100 to i64
  %102 = icmp ne i64 %99, %101
  br i1 %102, label %103, label %105

; <label>:103:                                    ; preds = %95
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 1)
  %104 = add i64 %pgocount9, 1
  store i64 %104, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 1)
  store i32 -3, i32* %12, align 4
  br label %105

; <label>:105:                                    ; preds = %103, %95
  %106 = load i64, i64* %10, align 8
  %107 = icmp ult i64 %106, 4096
  br i1 %107, label %108, label %112

; <label>:108:                                    ; preds = %105
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 2)
  %109 = add i64 %pgocount10, 1
  store i64 %109, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 2)
  %110 = load i64, i64* %10, align 8
  %111 = trunc i64 %110 to i32
  br label %114

; <label>:112:                                    ; preds = %105
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 3)
  %113 = add i64 %pgocount11, 1
  store i64 %113, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_idea_file, i64 0, i64 3)
  br label %114

; <label>:114:                                    ; preds = %112, %108
  %115 = phi i32 [ %111, %108 ], [ 4096, %112 ]
  store i32 %115, i32* %11, align 4
  br label %65

; <label>:116:                                    ; preds = %81, %72
  call void @ideaCfbDestroy(%struct.IdeaCfbContext* %13)
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @textbuf, i32 0, i32 0), i8 0, i64 4096, i32 16, i1 false)
  %117 = load i32, i32* %12, align 4
  ret i32 %117
}

; Function Attrs: noinline nounwind uwtable
define i32 @idea_decryptfile(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8, align 1
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca [16 x i8], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.hashedpw*, align 8
  %13 = alloca %struct.hashedpw**, align 8
  %14 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 0, i32* %11, align 4
  %15 = load i8, i8* @verbose, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %23

; <label>:17:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 7)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 7)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %20 = load i8*, i8** %4, align 8
  %21 = load i8*, i8** %5, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.73, i32 0, i32 0), i8* %20, i8* %21)
  br label %23

; <label>:23:                                     ; preds = %17, %2
  %24 = load i8*, i8** %4, align 8
  %25 = call %struct._IO_FILE* @fopen(i8* %24, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %25, %struct._IO_FILE** %7, align 8
  %26 = icmp eq %struct._IO_FILE* %25, null
  br i1 %26, label %27, label %33

; <label>:27:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 8)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 8)
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %30 = call i8* @LANG(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.20, i32 0, i32 0))
  %31 = load i8*, i8** %4, align 8
  %32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* %30, i8* %31)
  store i32 -1, i32* %3, align 4
  br label %203

; <label>:33:                                     ; preds = %23
  %34 = load i8*, i8** %5, align 8
  %35 = call %struct._IO_FILE* @fopen(i8* %34, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %35, %struct._IO_FILE** %8, align 8
  %36 = icmp eq %struct._IO_FILE* %35, null
  br i1 %36, label %37, label %43

; <label>:37:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 9)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 9)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %40 = call i8* @LANG(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.40, i32 0, i32 0))
  %41 = load i8*, i8** %5, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* %40, i8* %41)
  br label %200

; <label>:43:                                     ; preds = %33
  store %struct.hashedpw** @passwds, %struct.hashedpw*** %13, align 8
  %44 = load %struct.hashedpw**, %struct.hashedpw*** %13, align 8
  %45 = load %struct.hashedpw*, %struct.hashedpw** %44, align 8
  store %struct.hashedpw* %45, %struct.hashedpw** %12, align 8
  br label %46

; <label>:46:                                     ; preds = %156, %43
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %48 = call i64 @fread(i8* %6, i64 1, i64 1, %struct._IO_FILE* %47)
  %49 = load i8, i8* %6, align 1
  %50 = zext i8 %49 to i32
  %51 = and i32 %50, 128
  %52 = icmp eq i32 %51, 128
  br i1 %52, label %53, label %59

; <label>:53:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 0)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 0)
  %55 = load i8, i8* %6, align 1
  %56 = zext i8 %55 to i32
  %57 = and i32 %56, 124
  %58 = icmp eq i32 %57, 36
  br i1 %58, label %65, label %59

; <label>:59:                                     ; preds = %53, %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 10)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 10)
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.71, i32 0, i32 0))
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %64 = call i32 @fclose(%struct._IO_FILE* %63)
  br label %200

; <label>:65:                                     ; preds = %53
  %66 = load i8, i8* %6, align 1
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %68 = call i64 @getpastlength(i8 zeroext %66, %struct._IO_FILE* %67)
  store i64 %68, i64* %14, align 8
  %69 = load %struct.hashedpw*, %struct.hashedpw** %12, align 8
  %70 = icmp ne %struct.hashedpw* %69, null
  br i1 %70, label %71, label %76

; <label>:71:                                     ; preds = %65
  %72 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i32 0, i32 0
  %73 = load %struct.hashedpw*, %struct.hashedpw** %12, align 8
  %74 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %73, i32 0, i32 1
  %75 = getelementptr inbounds [16 x i8], [16 x i8]* %74, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %72, i8* %75, i64 16, i32 8, i1 false)
  br label %96

; <label>:76:                                     ; preds = %65
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %78 = call i8* @LANG(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.74, i32 0, i32 0))
  %79 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %77, i8* %78)
  %80 = load i8, i8* @batchmode, align 1
  %81 = zext i8 %80 to i32
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %88, label %83

; <label>:83:                                     ; preds = %76
  %pgocount5 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 4)
  %84 = add i64 %pgocount5, 1
  store i64 %84, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 4)
  %85 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i32 0, i32 0
  %86 = call i32 @GetHashedPassPhrase(i8* %85, i8 zeroext 1)
  %87 = icmp sle i32 %86, 0
  br i1 %87, label %88, label %94

; <label>:88:                                     ; preds = %83, %76
  %pgocount6 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 13)
  %89 = add i64 %pgocount6, 1
  store i64 %89, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 13)
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %91 = call i32 @fclose(%struct._IO_FILE* %90)
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %93 = call i32 @fclose(%struct._IO_FILE* %92)
  store i32 -1, i32* %3, align 4
  br label %203

; <label>:94:                                     ; preds = %83
  %pgocount7 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 6)
  %95 = add i64 %pgocount7, 1
  store i64 %95, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 6)
  br label %96

; <label>:96:                                     ; preds = %94, %71
  %97 = load i8, i8* @quietmode, align 1
  %98 = icmp ne i8 %97, 0
  br i1 %98, label %106, label %99

; <label>:99:                                     ; preds = %96
  %pgocount8 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 3)
  %100 = add i64 %pgocount8, 1
  store i64 %100, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 3)
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %102 = call i8* @LANG(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.52, i32 0, i32 0))
  %103 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %101, i8* %102)
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %105 = call i32 @fflush(%struct._IO_FILE* %104)
  br label %106

; <label>:106:                                    ; preds = %99, %96
  %107 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i32 0, i32 0
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %109 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %110 = load i64, i64* %14, align 8
  %111 = call i32 @idea_file(i8* %107, i8 zeroext 1, %struct._IO_FILE* %108, %struct._IO_FILE* %109, i64 %110)
  store i32 %111, i32* %10, align 4
  %112 = load i32, i32* %10, align 4
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %130

; <label>:114:                                    ; preds = %106
  %115 = load %struct.hashedpw*, %struct.hashedpw** %12, align 8
  %116 = icmp ne %struct.hashedpw* %115, null
  br i1 %116, label %117, label %128

; <label>:117:                                    ; preds = %114
  %pgocount9 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 15)
  %118 = add i64 %pgocount9, 1
  store i64 %118, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 15)
  %119 = load %struct.hashedpw*, %struct.hashedpw** %12, align 8
  %120 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %119, i32 0, i32 0
  %121 = load %struct.hashedpw*, %struct.hashedpw** %120, align 8
  %122 = load %struct.hashedpw**, %struct.hashedpw*** %13, align 8
  store %struct.hashedpw* %121, %struct.hashedpw** %122, align 8
  %123 = load %struct.hashedpw*, %struct.hashedpw** %12, align 8
  %124 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %123, i32 0, i32 1
  %125 = getelementptr inbounds [16 x i8], [16 x i8]* %124, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %125, i8 0, i64 16, i32 8, i1 false)
  %126 = load %struct.hashedpw*, %struct.hashedpw** %12, align 8
  %127 = call i32 (%struct.hashedpw*, ...) bitcast (i32 (...)* @free to i32 (%struct.hashedpw*, ...)*)(%struct.hashedpw* %126)
  br label %128

; <label>:128:                                    ; preds = %117, %114
  %pgocount10 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 12)
  %129 = add i64 %pgocount10, 1
  store i64 %129, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 12)
  br label %158

; <label>:130:                                    ; preds = %106
  %131 = load %struct.hashedpw*, %struct.hashedpw** %12, align 8
  %132 = icmp ne %struct.hashedpw* %131, null
  br i1 %132, label %133, label %139

; <label>:133:                                    ; preds = %130
  %pgocount11 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 1)
  %134 = add i64 %pgocount11, 1
  store i64 %134, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 1)
  %135 = load %struct.hashedpw*, %struct.hashedpw** %12, align 8
  %136 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %135, i32 0, i32 0
  store %struct.hashedpw** %136, %struct.hashedpw*** %13, align 8
  %137 = load %struct.hashedpw**, %struct.hashedpw*** %13, align 8
  %138 = load %struct.hashedpw*, %struct.hashedpw** %137, align 8
  store %struct.hashedpw* %138, %struct.hashedpw** %12, align 8
  br label %146

; <label>:139:                                    ; preds = %130
  %pgocount12 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 5)
  %140 = add i64 %pgocount12, 1
  store i64 %140, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 5)
  %141 = load i32, i32* %11, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* %11, align 4
  %143 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %144 = call i8* @LANG(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.75, i32 0, i32 0))
  %145 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %143, i8* %144)
  br label %146

; <label>:146:                                    ; preds = %139, %133
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  call void @rewind(%struct._IO_FILE* %147)
  %148 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  call void @rewind(%struct._IO_FILE* %148)
  br label %149

; <label>:149:                                    ; preds = %146
  %150 = load i32, i32* %10, align 4
  %151 = icmp eq i32 %150, -2
  br i1 %151, label %152, label %156

; <label>:152:                                    ; preds = %149
  %pgocount13 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 2)
  %153 = add i64 %pgocount13, 1
  store i64 %153, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 2)
  %154 = load i32, i32* %11, align 4
  %155 = icmp slt i32 %154, 2
  br label %156

; <label>:156:                                    ; preds = %152, %149
  %157 = phi i1 [ false, %149 ], [ %155, %152 ]
  br i1 %157, label %46, label %158

; <label>:158:                                    ; preds = %156, %128
  %159 = bitcast [16 x i8]* %9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %159, i8 0, i64 16, i32 16, i1 false)
  %160 = load i32, i32* %10, align 4
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %162, label %170

; <label>:162:                                    ; preds = %158
  %pgocount14 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 14)
  %163 = add i64 %pgocount14, 1
  store i64 %163, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 14)
  %164 = load i8, i8* @quietmode, align 1
  %165 = icmp ne i8 %164, 0
  br i1 %165, label %170, label %166

; <label>:166:                                    ; preds = %162
  %pgocount15 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 17)
  %167 = add i64 %pgocount15, 1
  store i64 %167, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 17)
  %168 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %169 = call i32 @fputc(i32 46, %struct._IO_FILE* %168)
  br label %170

; <label>:170:                                    ; preds = %166, %162, %158
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %172 = call i32 @write_error(%struct._IO_FILE* %171)
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %178

; <label>:174:                                    ; preds = %170
  %pgocount16 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 11)
  %175 = add i64 %pgocount16, 1
  store i64 %175, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 11)
  %176 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %177 = call i32 @fclose(%struct._IO_FILE* %176)
  br label %200

; <label>:178:                                    ; preds = %170
  %179 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %180 = call i32 @fclose(%struct._IO_FILE* %179)
  %181 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %182 = call i32 @fclose(%struct._IO_FILE* %181)
  %183 = load i32, i32* %10, align 4
  %184 = icmp slt i32 %183, 0
  br i1 %184, label %185, label %190

; <label>:185:                                    ; preds = %178
  %pgocount17 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 18)
  %186 = add i64 %pgocount17, 1
  store i64 %186, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 18)
  %187 = load i8*, i8** %5, align 8
  %188 = call i32 @remove(i8* %187) #5
  %189 = load i32, i32* %10, align 4
  store i32 %189, i32* %3, align 4
  br label %203

; <label>:190:                                    ; preds = %178
  %191 = load i8, i8* @quietmode, align 1
  %192 = icmp ne i8 %191, 0
  br i1 %192, label %198, label %193

; <label>:193:                                    ; preds = %190
  %pgocount18 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 19)
  %194 = add i64 %pgocount18, 1
  store i64 %194, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 19)
  %195 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %196 = call i8* @LANG(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.76, i32 0, i32 0))
  %197 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %195, i8* %196)
  br label %198

; <label>:198:                                    ; preds = %193, %190
  %pgocount19 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 16)
  %199 = add i64 %pgocount19, 1
  store i64 %199, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_idea_decryptfile, i64 0, i64 16)
  store i32 1, i32* %3, align 4
  br label %203

; <label>:200:                                    ; preds = %174, %59, %37
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %202 = call i32 @fclose(%struct._IO_FILE* %201)
  store i32 -1, i32* %3, align 4
  br label %203

; <label>:203:                                    ; preds = %200, %198, %185, %88, %27
  %204 = load i32, i32* %3, align 4
  ret i32 %204
}

; Function Attrs: nounwind
declare i32 @remove(i8*) #2

; Function Attrs: noinline nounwind uwtable
define i32 @decompress_file(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8, align 1
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca %struct._IO_FILE*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %9 = load i8, i8* @verbose, align 1
  %10 = icmp ne i8 %9, 0
  br i1 %10, label %11, label %16

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 0)
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %14 = call i8* @LANG(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.77, i32 0, i32 0))
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* %14)
  br label %16

; <label>:16:                                     ; preds = %11, %2
  %17 = load i8*, i8** %4, align 8
  %18 = call %struct._IO_FILE* @fopen(i8* %17, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %18, %struct._IO_FILE** %7, align 8
  %19 = icmp eq %struct._IO_FILE* %18, null
  br i1 %19, label %20, label %26

; <label>:20:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 1)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %23 = call i8* @LANG(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.78, i32 0, i32 0))
  %24 = load i8*, i8** %4, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* %23, i8* %24)
  store i32 -1, i32* %3, align 4
  br label %105

; <label>:26:                                     ; preds = %16
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %28 = call i64 @fread(i8* %6, i64 1, i64 1, %struct._IO_FILE* %27)
  %29 = load i8, i8* %6, align 1
  %30 = zext i8 %29 to i32
  %31 = and i32 %30, 124
  %32 = icmp eq i32 %31, 32
  br i1 %32, label %37, label %33

; <label>:33:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 2)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 2)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.79, i32 0, i32 0))
  br label %102

; <label>:37:                                     ; preds = %26
  %38 = load i8, i8* %6, align 1
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %40 = call i64 @getpastlength(i8 zeroext %38, %struct._IO_FILE* %39)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %42 = call i64 @fread(i8* %6, i64 1, i64 1, %struct._IO_FILE* %41)
  %43 = load i8, i8* %6, align 1
  %44 = zext i8 %43 to i32
  %45 = icmp ne i32 %44, 1
  br i1 %45, label %46, label %51

; <label>:46:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 3)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 3)
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %49 = call i8* @LANG(i8* getelementptr inbounds ([80 x i8], [80 x i8]* @.str.80, i32 0, i32 0))
  %50 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* %49)
  br label %102

; <label>:51:                                     ; preds = %37
  %52 = load i8*, i8** %5, align 8
  %53 = call %struct._IO_FILE* @fopen(i8* %52, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %53, %struct._IO_FILE** %8, align 8
  %54 = icmp eq %struct._IO_FILE* %53, null
  br i1 %54, label %55, label %61

; <label>:55:                                     ; preds = %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 5)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 5)
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %58 = call i8* @LANG(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.81, i32 0, i32 0))
  %59 = load i8*, i8** %5, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* %58, i8* %59)
  br label %102

; <label>:61:                                     ; preds = %51
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %64 = call i32 @unzip(%struct._IO_FILE* %62, %struct._IO_FILE* %63)
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %71

; <label>:66:                                     ; preds = %61
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 4)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 4)
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %69 = call i8* @LANG(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.82, i32 0, i32 0))
  %70 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* %69)
  br label %99

; <label>:71:                                     ; preds = %61
  %72 = load i8, i8* @verbose, align 1
  %73 = icmp ne i8 %72, 0
  br i1 %73, label %74, label %78

; <label>:74:                                     ; preds = %71
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %76 = call i8* @LANG(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.83, i32 0, i32 0))
  %77 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %75, i8* %76)
  br label %87

; <label>:78:                                     ; preds = %71
  %79 = load i8, i8* @quietmode, align 1
  %80 = icmp ne i8 %79, 0
  br i1 %80, label %85, label %81

; <label>:81:                                     ; preds = %78
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 9)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 9)
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %84 = call i32 @fputc(i32 46, %struct._IO_FILE* %83)
  br label %85

; <label>:85:                                     ; preds = %81, %78
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 7)
  %86 = add i64 %pgocount7, 1
  store i64 %86, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 7)
  br label %87

; <label>:87:                                     ; preds = %85, %74
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %89 = call i32 @write_error(%struct._IO_FILE* %88)
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %93

; <label>:91:                                     ; preds = %87
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 6)
  %92 = add i64 %pgocount8, 1
  store i64 %92, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 6)
  br label %99

; <label>:93:                                     ; preds = %87
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 8)
  %94 = add i64 %pgocount9, 1
  store i64 %94, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_decompress_file, i64 0, i64 8)
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %96 = call i32 @fclose(%struct._IO_FILE* %95)
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %98 = call i32 @fclose(%struct._IO_FILE* %97)
  store i32 1, i32* %3, align 4
  br label %105

; <label>:99:                                     ; preds = %91, %66
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %101 = call i32 @fclose(%struct._IO_FILE* %100)
  br label %102

; <label>:102:                                    ; preds = %99, %55, %46, %33
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %104 = call i32 @fclose(%struct._IO_FILE* %103)
  store i32 -1, i32* %3, align 4
  br label %105

; <label>:105:                                    ; preds = %102, %93, %20
  %106 = load i32, i32* %3, align 4
  ret i32 %106
}

declare i32 @unzip(%struct._IO_FILE*, %struct._IO_FILE*) #1

declare i32 @rsa_private_encrypt(i16*, i8*, i16 signext, i16*, i16*, i16*, i16*, i16*, i16*) #1

declare i32 @read_trust(%struct._IO_FILE*, i8*) #1

declare i32 @is_compromised(%struct._IO_FILE*) #1

declare i32 @show_key(%struct._IO_FILE*, i64, i32) #1

declare void @ideaCfbInit(%struct.IdeaCfbContext*, i8*) #1

declare i32 @cryptRandOpen(%struct.IdeaCfbContext*) #1

declare void @trueRandAccum(i32) #1

declare void @cryptRandInit(%struct.IdeaCfbContext*) #1

declare zeroext i8 @cryptRandByte() #1

declare i32 @trueRandByte() #1

declare void @cryptRandSave(%struct.IdeaCfbContext*) #1

declare void @ideaCfbDestroy(%struct.IdeaCfbContext*) #1

declare i32 @rsa_public_encrypt(i16*, i8*, i16 signext, i16*, i16*) #1

declare void @writekeyID(i16*, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
