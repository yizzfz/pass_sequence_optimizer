; ModuleID = 'tmp1.ll'
source_filename = "pgp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.hashedpw = type { %struct.hashedpw*, [16 x i8] }
%struct.IdeaCfbContext = type { [8 x i8], [8 x i8], [52 x i16], i32 }
%struct.newkey = type { [8 x i8], %struct.newkey* }

$__llvm_profile_raw_version = comdat any

@rel_version = global [8 x i8] c"2.6.3ia\00", align 1
@rel_date = global [11 x i8] c"1996-03-04\00", align 1
@PGP_EXTENSION = global [5 x i8] c".pgp\00", align 1
@ASC_EXTENSION = global [5 x i8] c".asc\00", align 1
@SIG_EXTENSION = global [5 x i8] c".sig\00", align 1
@BAK_EXTENSION = global [5 x i8] c".bak\00", align 1
@CONSOLE_FILENAME = global [9 x i8] c"_CONSOLE\00", align 1
@verbose = global i8 0, align 1
@compressSig = internal global [10 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.50, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.52, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.53, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.54, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.55, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.57, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.59, i32 0, i32 0)], align 16
@.str = private unnamed_addr constant [6 x i8] c"-lh5-\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [21 x i8] c"\0Areceived signal %d\0A\00", align 1
@pgpout = common global %struct._IO_FILE* null, align 8
@.str.2 = private unnamed_addr constant [26 x i8] c"\0AStopped at user request\0A\00", align 1
@emit_radix_64 = global i8 0, align 1
@moreflag = global i8 0, align 1
@filter_mode = global i8 0, align 1
@clear_signatures = global i8 1, align 1
@encrypt_to_self = global i8 0, align 1
@sign_new_userids = global i8 1, align 1
@batchmode = global i8 0, align 1
@quietmode = global i8 1, align 1
@force_flag = global i8 1, align 1
@literal_mode = global i8 98, align 1
@my_name = global [256 x i8] zeroinitializer, align 16
@keepctx = global i8 0, align 1
@interactive_add = global i8 0, align 1
@compress_enabled = global i8 1, align 1
@timeshift = global i64 0, align 8
@version_byte = global i32 3, align 4
@nomanual = global i8 0, align 1
@makerandom = global i32 0, align 4
@signature_checked = global i8 0, align 1
@checksig_pass = global i32 0, align 4
@charset_header = global [16 x i8] zeroinitializer, align 16
@myArgc = global i32 2, align 4
@passwds = global %struct.hashedpw* null, align 8
@keypasswds = global %struct.hashedpw* null, align 8
@.str.3 = private unnamed_addr constant [8 x i8] c"PGPPASS\00", align 1
@passwdstail = internal global %struct.hashedpw** @passwds, align 8
@.str.4 = private unnamed_addr constant [10 x i8] c"PGPPASSFD\00", align 1
@mcguffin = internal global [256 x i8] zeroinitializer, align 16
@.str.5 = private unnamed_addr constant [7 x i8] c".pgprc\00", align 1
@.str.6 = private unnamed_addr constant [11 x i8] c"config.txt\00", align 1
@globalPubringName = common global [256 x i8] zeroinitializer, align 16
@.str.7 = private unnamed_addr constant [12 x i8] c"pubring.pgp\00", align 1
@globalSecringName = common global [256 x i8] zeroinitializer, align 16
@.str.8 = private unnamed_addr constant [12 x i8] c"secring.pgp\00", align 1
@globalRandseedName = common global [256 x i8] zeroinitializer, align 16
@.str.9 = private unnamed_addr constant [13 x i8] c"randseed.bin\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"TMP\00", align 1
@myArgv = common global i8** null, align 8
@.str.11 = private unnamed_addr constant [18 x i8] c"\0A\07Out of memory.\0A\00", align 1
@optind = external global i32, align 4
@.str.12 = private unnamed_addr constant [3 x i8] c"-@\00", align 1
@.str.13 = private unnamed_addr constant [50 x i8] c"abcdefghiklmo:prstu:vwxz:ABCDEFGHIKLMO:PRSTU:VWX?\00", align 1
@strip_sig_flag = internal global i8 0, align 1
@c_flag = internal global i8 0, align 1
@decrypt_only_flag = internal global i8 0, align 1
@preserve_filename = internal global i8 0, align 1
@optarg = external global i8*, align 8
@outputfile = internal global i8* null, align 8
@sign_flag = internal global i8 0, align 1
@u_flag = internal global i8 0, align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"CH\00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@stdout = external global %struct._IO_FILE*, align 8
@de_armor_only = internal global i8 0, align 1
@.str.17 = private unnamed_addr constant [29 x i8] c"\0AFile %s wiped and deleted. \00", align 1
@.str.18 = private unnamed_addr constant [55 x i8] c"\0A\07Error: Can't wipe out file '%s' - read only, maybe?\0A\00", align 1
@.str.19 = private unnamed_addr constant [29 x i8] c"\0A\07File '%s' does not exist.\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.20 = private unnamed_addr constant [222 x i8] c"\0AFor details on licensing and distribution, see the PGP User's Guide.\0AFor other cryptography products and custom development services, contact:\0APhilip Zimmermann, 3021 11th St, Boulder CO 80304 USA, phone +1 303 541-0140\0A\00", align 1
@.str.21 = private unnamed_addr constant [13 x i8] c"@translator@\00", align 1
@.str.22 = private unnamed_addr constant [37 x i8] c"\0AFor a usage summary, type:  pgp -h\0A\00", align 1
@.str.23 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str.24 = private unnamed_addr constant [25 x i8] c"Error writing file \22%s\22\0A\00", align 1
@.str.25 = private unnamed_addr constant [45 x i8] c"File %s created containing %d random bytes.\0A\00", align 1
@errorLvl = internal global i32 0, align 4
@.str.26 = private unnamed_addr constant [34 x i8] c"\07Invalid filename: '%s' too long\0A\00", align 1
@plainfile = common global [256 x i8] zeroinitializer, align 16
@strip_spaces = common global i8 0, align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.28 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.29 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.30 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.31 = private unnamed_addr constant [63 x i8] c"\0A\07Input file '%s' looks like it may have been created by PGP. \00", align 1
@.str.32 = private unnamed_addr constant [57 x i8] c"\0AIs it safe to assume that it was created by PGP (y/N)? \00", align 1
@.str.33 = private unnamed_addr constant [75 x i8] c"\0ANote: '%s' is not a pure text file.\0AFile will be treated as binary data.\0A\00", align 1
@.str.34 = private unnamed_addr constant [55 x i8] c"\0A\07Error: Only text files may be sent as display-only.\0A\00", align 1
@.str.35 = private unnamed_addr constant [48 x i8] c"\0AA secret key is required to make a signature. \00", align 1
@.str.36 = private unnamed_addr constant [145 x i8] c"\0AYou specified no user ID to select your secret key,\0Aso the default user ID and key will be the most recently\0Aadded key on your secret keyring.\0A\00", align 1
@.str.37 = private unnamed_addr constant [18 x i8] c"\07Signature error\0A\00", align 1
@.str.38 = private unnamed_addr constant [54 x i8] c"\0A\0ARecipients' public key(s) will be used to encrypt. \00", align 1
@.str.39 = private unnamed_addr constant [62 x i8] c"\0AA user ID is required to select the recipient's public key. \00", align 1
@.str.40 = private unnamed_addr constant [33 x i8] c"\0AEnter the recipient's user ID: \00", align 1
@.str.41 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.42 = private unnamed_addr constant [19 x i8] c"\07Encryption error\0A\00", align 1
@.str.43 = private unnamed_addr constant [22 x i8] c"\0ACiphertext file: %s\0A\00", align 1
@.str.44 = private unnamed_addr constant [21 x i8] c"\0ASignature file: %s\0A\00", align 1
@.str.45 = private unnamed_addr constant [55 x i8] c"For more detailed help, consult the PGP User's Guide.\0A\00", align 1
@.str.46 = private unnamed_addr constant [24 x i8] c"exitPGP: exitcode = %d\0A\00", align 1
@.str.47 = private unnamed_addr constant [20 x i8] c"\0AIncluding \22%s\22...\0A\00", align 1
@.str.48 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.49 = private unnamed_addr constant [4 x i8] c"PGP\00", align 1
@globalCommentString = common global [128 x i8] zeroinitializer, align 16
@use_charset_header = common global i8 0, align 1
@.str.50 = private unnamed_addr constant [5 x i8] c"PK\03\04\00", align 1
@.str.51 = private unnamed_addr constant [5 x i8] c"ZOO \00", align 1
@.str.52 = private unnamed_addr constant [5 x i8] c"GIF8\00", align 1
@.str.53 = private unnamed_addr constant [3 x i8] c"\EA`\00", align 1
@.str.54 = private unnamed_addr constant [5 x i8] c"Rar!\00", align 1
@.str.55 = private unnamed_addr constant [5 x i8] c"HPAK\00", align 1
@.str.56 = private unnamed_addr constant [3 x i8] c"\1F\8B\00", align 1
@.str.57 = private unnamed_addr constant [3 x i8] c"\1F\9D\00", align 1
@.str.58 = private unnamed_addr constant [3 x i8] c"\1A\0B\00", align 1
@.str.59 = private unnamed_addr constant [5 x i8] c"\1AHP%\00", align 1
@signon_msg.printed = internal global i8 0, align 1
@.str.60 = private unnamed_addr constant [68 x i8] c"Pretty Good Privacy(tm) %s - Public-key encryption for the masses.\0A\00", align 1
@.str.61 = private unnamed_addr constant [60 x i8] c"(c) 1990-96 Philip Zimmermann, Phil's Pretty Good Software.\00", align 1
@.str.62 = private unnamed_addr constant [5 x i8] c" %s\0A\00", align 1
@.str.63 = private unnamed_addr constant [70 x i8] c"International version - not for use in the USA. Does not use RSAREF.\0A\00", align 1
@.str.64 = private unnamed_addr constant [18 x i8] c"Current time: %s\0A\00", align 1
@.str.65 = private unnamed_addr constant [55 x i8] c"\0A\07Error: Transport armor stripping failed for file %s\0A\00", align 1
@.str.66 = private unnamed_addr constant [53 x i8] c"Stripped transport armor from '%s', producing '%s'.\0A\00", align 1
@.str.67 = private unnamed_addr constant [37 x i8] c"\0ALooking for next packet in '%s'...\0A\00", align 1
@.str.68 = private unnamed_addr constant [35 x i8] c"\0A\07Can't open ciphertext file '%s'\0A\00", align 1
@.str.69 = private unnamed_addr constant [57 x i8] c"\0AFile is encrypted.  Secret key is required to read it. \00", align 1
@.str.70 = private unnamed_addr constant [58 x i8] c"\0AThis file has a signature, which will be left in place.\0A\00", align 1
@.str.71 = private unnamed_addr constant [66 x i8] c"\0AFile has signature.  Public key is required to check signature.\0A\00", align 1
@.str.72 = private unnamed_addr constant [10 x i8] c"/dev/null\00", align 1
@.str.73 = private unnamed_addr constant [37 x i8] c"\0AFile is conventionally encrypted.  \00", align 1
@.str.74 = private unnamed_addr constant [43 x i8] c"\0AFile contains key(s).  Contents follow...\00", align 1
@.str.75 = private unnamed_addr constant [57 x i8] c"\0ADo you want to add this keyfile to keyring '%s' (y/N)? \00", align 1
@.str.76 = private unnamed_addr constant [21 x i8] c"\07Keyring add error. \00", align 1
@.str.77 = private unnamed_addr constant [57 x i8] c"\07\0AERROR: Nested data has unexpected format.  CTB=0x%02X\0A\00", align 1
@.str.78 = private unnamed_addr constant [60 x i8] c"\07\0AError: '%s' is not a ciphertext, signature, or key file.\0A\00", align 1
@.str.79 = private unnamed_addr constant [68 x i8] c"\0A\0AThis message is marked \22For your eyes only\22.  Display now (Y/n)? \00", align 1
@.str.80 = private unnamed_addr constant [32 x i8] c"\0A\0APlaintext message follows...\0A\00", align 1
@.str.81 = private unnamed_addr constant [32 x i8] c"------------------------------\0A\00", align 1
@.str.82 = private unnamed_addr constant [35 x i8] c"Save this file permanently (y/N)? \00", align 1
@.str.83 = private unnamed_addr constant [33 x i8] c"Enter filename to save file as: \00", align 1
@.str.84 = private unnamed_addr constant [7 x i8] c"[%s]: \00", align 1
@.str.85 = private unnamed_addr constant [24 x i8] c"\0APlaintext filename: %s\00", align 1
@.str.86 = private unnamed_addr constant [58 x i8] c"\0APlaintext file '%s' looks like it contains a public key.\00", align 1
@.str.87 = private unnamed_addr constant [43 x i8] c"\0APlaintext file '%s' looks like a %s file.\00", align 1
@compressName = internal global [12 x i8*] [i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.90, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.91, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.92, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.93, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.94, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.95, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.96, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.97, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.98, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.99, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.100, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.101, i32 0, i32 0)], align 16
@compressExt = internal global [12 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.102, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.104, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.105, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.106, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.107, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.108, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.109, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.110, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.111, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.112, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.113, i32 0, i32 0)], align 16
@.str.88 = private unnamed_addr constant [61 x i8] c"\0A\07Output file '%s' may contain more ciphertext or signature.\00", align 1
@.str.89 = private unnamed_addr constant [24 x i8] c"\0A\1B[0;0H\1B[J\0D           \0D\00", align 1
@.str.90 = private unnamed_addr constant [6 x i8] c"PKZIP\00", align 1
@.str.91 = private unnamed_addr constant [4 x i8] c"Zoo\00", align 1
@.str.92 = private unnamed_addr constant [4 x i8] c"GIF\00", align 1
@.str.93 = private unnamed_addr constant [4 x i8] c"Arj\00", align 1
@.str.94 = private unnamed_addr constant [4 x i8] c"RAR\00", align 1
@.str.95 = private unnamed_addr constant [6 x i8] c"Hpack\00", align 1
@.str.96 = private unnamed_addr constant [5 x i8] c"gzip\00", align 1
@.str.97 = private unnamed_addr constant [11 x i8] c"compressed\00", align 1
@.str.98 = private unnamed_addr constant [4 x i8] c"PAK\00", align 1
@.str.99 = private unnamed_addr constant [6 x i8] c"Hyper\00", align 1
@.str.100 = private unnamed_addr constant [4 x i8] c"Lha\00", align 1
@.str.101 = private unnamed_addr constant [6 x i8] c"Lharc\00", align 1
@.str.102 = private unnamed_addr constant [5 x i8] c".zip\00", align 1
@.str.103 = private unnamed_addr constant [5 x i8] c".zoo\00", align 1
@.str.104 = private unnamed_addr constant [5 x i8] c".gif\00", align 1
@.str.105 = private unnamed_addr constant [5 x i8] c".arj\00", align 1
@.str.106 = private unnamed_addr constant [5 x i8] c".rar\00", align 1
@.str.107 = private unnamed_addr constant [5 x i8] c".hpk\00", align 1
@.str.108 = private unnamed_addr constant [4 x i8] c".gz\00", align 1
@.str.109 = private unnamed_addr constant [3 x i8] c".Z\00", align 1
@.str.110 = private unnamed_addr constant [5 x i8] c".pak\00", align 1
@.str.111 = private unnamed_addr constant [5 x i8] c".hyp\00", align 1
@.str.112 = private unnamed_addr constant [5 x i8] c".lha\00", align 1
@.str.113 = private unnamed_addr constant [5 x i8] c".lzh\00", align 1
@.str.114 = private unnamed_addr constant [86 x i8] c"\07\0AError: PGP User's Guide not found.\0APGP looked for it in the following directories:\0A\00", align 1
@manual_dirs = external constant [0 x i8*], align 8
@.str.115 = private unnamed_addr constant [7 x i8] c"\09\22%s\22\0A\00", align 1
@.str.116 = private unnamed_addr constant [603 x i8] c"and the doc subdirectory of each of the above.  Please put a copy of\0Aboth volumes of the User's Guide in one of these directories.\0A\0AUnder NO CIRCUMSTANCES should PGP ever be distributed without the PGP\0AUser's Guide, which is included in the standard distribution package.\0AIf you got a copy of PGP without the manual, please inform whomever you\0Agot it from that this is an incomplete package that should not be\0Adistributed further.\0A\0APGP will not generate a key without finding the User's Guide.\0AThere is a simple way to override this restriction.  See the\0APGP User's Guide for details on how to do it.\0A\0A\00", align 1
@.str.117 = private unnamed_addr constant [16 x i8] c"\07Keygen error. \00", align 1
@.str.118 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.119 = private unnamed_addr constant [23 x i8] c"\07Keyring check error.\0A\00", align 1
@.str.120 = private unnamed_addr constant [26 x i8] c"\07Maintenance pass error. \00", align 1
@.str.121 = private unnamed_addr constant [35 x i8] c"File '%s' is not a public keyring\0A\00", align 1
@.str.122 = private unnamed_addr constant [67 x i8] c"\0AA user ID is required to select the public key you want to sign. \00", align 1
@.str.123 = private unnamed_addr constant [34 x i8] c"\0AEnter the public key's user ID: \00", align 1
@.str.124 = private unnamed_addr constant [39 x i8] c"Warning: '%s' is not a public keyring\0A\00", align 1
@.str.125 = private unnamed_addr constant [23 x i8] c"\07Key signature error. \00", align 1
@.str.126 = private unnamed_addr constant [73 x i8] c"\0AA user ID is required to select the key you want to revoke or disable. \00", align 1
@.str.127 = private unnamed_addr constant [17 x i8] c"\0AEnter user ID: \00", align 1
@.str.128 = private unnamed_addr constant [60 x i8] c"\0AA user ID is required to select the key you want to edit. \00", align 1
@.str.129 = private unnamed_addr constant [27 x i8] c"\0AEnter the key's user ID: \00", align 1
@.str.130 = private unnamed_addr constant [22 x i8] c"\07Keyring edit error. \00", align 1
@.str.131 = private unnamed_addr constant [33 x i8] c"\0A\07Key file '%s' does not exist.\0A\00", align 1
@.str.132 = private unnamed_addr constant [63 x i8] c"\0AA user ID is required to select the key you want to extract. \00", align 1
@.str.133 = private unnamed_addr constant [25 x i8] c"\07Keyring extract error. \00", align 1
@.str.134 = private unnamed_addr constant [96 x i8] c"\0AA user ID is required to select the public key you want to\0Aremove certifying signatures from. \00", align 1
@.str.135 = private unnamed_addr constant [62 x i8] c"\0AA user ID is required to select the key you want to remove. \00", align 1
@.str.136 = private unnamed_addr constant [30 x i8] c"\07Key signature remove error. \00", align 1
@.str.137 = private unnamed_addr constant [24 x i8] c"\07Keyring remove error. \00", align 1
@.str.138 = private unnamed_addr constant [22 x i8] c"\07Keyring view error. \00", align 1
@.str.139 = private unnamed_addr constant [21 x i8] c"\0AInvalid arguments.\0A\00", align 1
@ext_c_ptr = external global i8*, align 8
@CONVERSION = external global i32, align 4
@.str.140 = private unnamed_addr constant [813 x i8] c"\0AUsage summary:\0ATo encrypt a plaintext file with recipent's public key, type:\0A   pgp -e textfile her_userid [other userids] (produces textfile.pgp)\0ATo sign a plaintext file with your secret key:\0A   pgp -s textfile [-u your_userid]           (produces textfile.pgp)\0ATo sign a plaintext file with your secret key, and then encrypt it\0A   with recipent's public key, producing a .pgp file:\0A   pgp -es textfile her_userid [other userids] [-u your_userid]\0ATo encrypt with conventional encryption only:\0A   pgp -c textfile\0ATo decrypt or check a signature for a ciphertext (.pgp) file:\0A   pgp ciphertextfile [-o plaintextfile]\0ATo produce output in ASCII for email, add the -a option to other options.\0ATo generate your own unique public/secret key pair:  pgp -kg\0AFor help on other key management functions, type:   pgp -k\0A\00", align 1
@language = external global [0 x i8], align 1
@.str.141 = private unnamed_addr constant [3 x i8] c"en\00", align 1
@HLP_EXTENSION = internal global [5 x i8] c".hlp\00", align 1
@.str.142 = private unnamed_addr constant [20 x i8] c"/usr/local/lib/pgp/\00", align 1
@.str.143 = private unnamed_addr constant [4 x i8] c"pgp\00", align 1
@.str.144 = private unnamed_addr constant [4 x i8] c"key\00", align 1
@.str.145 = private unnamed_addr constant [794 x i8] c"\0AKey management functions:\0ATo generate your own unique public/secret key pair:\0A   pgp -kg\0ATo add a key file's contents to your public or secret key ring:\0A   pgp -ka keyfile [keyring]\0ATo remove a key or a user ID from your public or secret key ring:\0A   pgp -kr userid [keyring]\0ATo edit your user ID or pass phrase:\0A   pgp -ke your_userid [keyring]\0ATo extract (copy) a key from your public or secret key ring:\0A   pgp -kx userid keyfile [keyring]\0ATo view the contents of your public key ring:\0A   pgp -kv[v] [userid] [keyring]\0ATo check signatures on your public key ring:\0A   pgp -kc [userid] [keyring]\0ATo sign someone else's public key on your public key ring:\0A   pgp -ks her_userid [-u your_userid] [keyring]\0ATo remove selected signatures from a userid on a keyring:\0A   pgp -krs userid [keyring]\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_compressSignature = private constant [17 x i8] c"compressSignature"
@__profn_breakHandler = private constant [12 x i8] c"breakHandler"
@__profn_exitPGP = private constant [7 x i8] c"exitPGP"
@__profn_main = private constant [4 x i8] c"main"
@__profn_tmp1.ll_usage = private constant [13 x i8] c"tmp1.ll:usage"
@__profn_tmp1.ll_arg_error = private constant [17 x i8] c"tmp1.ll:arg_error"
@__profn_tmp1.ll_key_usage = private constant [17 x i8] c"tmp1.ll:key_usage"
@__profn_tmp1.ll_signon_msg = private constant [18 x i8] c"tmp1.ll:signon_msg"
@__profn_tmp1.ll_initsigs = private constant [16 x i8] c"tmp1.ll:initsigs"
@__profn_tmp1.ll_do_keyopt = private constant [17 x i8] c"tmp1.ll:do_keyopt"
@__profn_user_error = private constant [10 x i8] c"user_error"
@__profn_ParseRecipients = private constant [15 x i8] c"ParseRecipients"
@__profn_tmp1.ll_do_armorfile = private constant [20 x i8] c"tmp1.ll:do_armorfile"
@__profn_tmp1.ll_do_decrypt = private constant [18 x i8] c"tmp1.ll:do_decrypt"
@__profn_tmp1.ll_file_compressible = private constant [25 x i8] c"tmp1.ll:file_compressible"
@__profn_tmp1.ll_clearscreen = private constant [19 x i8] c"tmp1.ll:clearscreen"
@__profn_tmp1.ll_build_helpfile = private constant [22 x i8] c"tmp1.ll:build_helpfile"
@__profc_compressSignature = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_compressSignature = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2939954666436502228, i64 108666878354, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i32 0, i32 0), i8* bitcast (i32 (i8*)* @compressSignature to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_breakHandler = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_breakHandler = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5831817372054144725, i64 39271660290, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_breakHandler, i32 0, i32 0), i8* bitcast (void (i32)* @breakHandler to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_exitPGP = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_exitPGP = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2754745943605308112, i64 84511467252, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_exitPGP, i32 0, i32 0), i8* bitcast (void (i32)* @exitPGP to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_main = private global [187 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 72059882394290032, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 187, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_usage = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7998456694610620455, i64 65490396391, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_usage, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_arg_error = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_arg_error = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3612803167357476302, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_arg_error, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_key_usage = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_key_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6414533825981876257, i64 65490396391, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_key_usage, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_signon_msg = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_signon_msg = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4218813562038792217, i64 37869605968, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signon_msg, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_initsigs = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_initsigs = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4525029115941218011, i64 51269266127, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_initsigs, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_do_keyopt = private global [108 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_do_keyopt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2292767832127630505, i64 432346901084285732, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i32 0, i32 0), i8* null, i8* null, i32 108, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_user_error = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_user_error = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4295494398030001593, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_user_error, i32 0, i32 0), i8* bitcast (void ()* @user_error to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ParseRecipients = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ParseRecipients = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5342628051145643837, i64 293195033582, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i32 0, i32 0), i8* bitcast (i8** (i8**)* @ParseRecipients to i8*), i8* null, i32 21, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_do_armorfile = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_do_armorfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6555342663168792662, i64 235344131276, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i32 0, i32 0), i8* null, i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_do_decrypt = private global [74 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_do_decrypt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6717976885793658925, i64 964980499398, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i32 0, i32 0), i8* null, i8* null, i32 74, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_file_compressible = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_file_compressible = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9055606174812856493, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_file_compressible, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_clearscreen = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_clearscreen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6331094764568110343, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_clearscreen, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_build_helpfile = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_build_helpfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -321844421158779235, i64 67760861150, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_build_helpfile, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [286 x i8] c"\9B\02\00compressSignature\01breakHandler\01exitPGP\01main\01tmp1.ll:usage\01tmp1.ll:arg_error\01tmp1.ll:key_usage\01tmp1.ll:signon_msg\01tmp1.ll:initsigs\01tmp1.ll:do_keyopt\01user_error\01ParseRecipients\01tmp1.ll:do_armorfile\01tmp1.ll:do_decrypt\01tmp1.ll:file_compressible\01tmp1.ll:clearscreen\01tmp1.ll:build_helpfile", section "__llvm_prf_names"
@llvm.used = appending global [18 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_compressSignature to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_breakHandler to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_exitPGP to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_arg_error to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_key_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_signon_msg to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initsigs to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_do_keyopt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_user_error to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ParseRecipients to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_do_armorfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_do_decrypt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_file_compressible to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_clearscreen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_build_helpfile to i8*), i8* getelementptr inbounds ([286 x i8], [286 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @compressSignature(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 0, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %27, %1
  %6 = load i32, i32* %4, align 4
  %7 = sext i32 %6 to i64
  %8 = icmp ult i64 %7, 10
  br i1 %8, label %9, label %30

; <label>:9:                                      ; preds = %5
  %10 = load i8*, i8** %3, align 8
  %11 = load i32, i32* %4, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [10 x i8*], [10 x i8*]* @compressSig, i64 0, i64 %12
  %14 = load i8*, i8** %13, align 8
  %15 = load i32, i32* %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [10 x i8*], [10 x i8*]* @compressSig, i64 0, i64 %16
  %18 = load i8*, i8** %17, align 8
  %19 = call i64 @strlen(i8* %18) #8
  %20 = call i32 @strncmp(i8* %10, i8* %14, i64 %19) #8
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %25, label %22

; <label>:22:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 2)
  %24 = load i32, i32* %4, align 4
  store i32 %24, i32* %2, align 4
  br label %78

; <label>:25:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 1)
  br label %27

; <label>:27:                                     ; preds = %25
  %28 = load i32, i32* %4, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %4, align 4
  br label %5

; <label>:30:                                     ; preds = %5
  %31 = load i8*, i8** %3, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 2
  %33 = call i32 @strncmp(i8* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 5) #8
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %38, label %35

; <label>:35:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 4)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 4)
  %37 = load i32, i32* %4, align 4
  store i32 %37, i32* %2, align 4
  br label %78

; <label>:38:                                     ; preds = %30
  %39 = load i8*, i8** %3, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 2
  %41 = load i8, i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = icmp eq i32 %42, 45
  br i1 %43, label %44, label %76

; <label>:44:                                     ; preds = %38
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 5)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 5)
  %46 = load i8*, i8** %3, align 8
  %47 = getelementptr inbounds i8, i8* %46, i64 3
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = icmp eq i32 %49, 108
  br i1 %50, label %51, label %76

; <label>:51:                                     ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 6)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 6)
  %53 = load i8*, i8** %3, align 8
  %54 = getelementptr inbounds i8, i8* %53, i64 4
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = icmp eq i32 %56, 122
  br i1 %57, label %66, label %58

; <label>:58:                                     ; preds = %51
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 7)
  %59 = add i64 %pgocount5, 1
  store i64 %59, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 7)
  %60 = load i8*, i8** %3, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 4
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = icmp eq i32 %63, 104
  br i1 %64, label %66, label %._crit_edge

._crit_edge:                                      ; preds = %58
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 0)
  %65 = add i64 %pgocount6, 1
  store i64 %65, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 0)
  br label %76

; <label>:66:                                     ; preds = %58, %51
  %67 = load i8*, i8** %3, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 6
  %69 = load i8, i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = icmp eq i32 %70, 45
  br i1 %71, label %72, label %76

; <label>:72:                                     ; preds = %66
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 8)
  %73 = add i64 %pgocount7, 1
  store i64 %73, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 8)
  %74 = load i32, i32* %4, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %2, align 4
  br label %78

; <label>:76:                                     ; preds = %._crit_edge, %66, %44, %38
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 3)
  %77 = add i64 %pgocount8, 1
  store i64 %77, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compressSignature, i64 0, i64 3)
  store i32 -1, i32* %2, align 4
  br label %78

; <label>:78:                                     ; preds = %76, %72, %35, %22
  %79 = load i32, i32* %2, align 4
  ret i32 %79
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #1

; Function Attrs: noinline nounwind uwtable
define void @breakHandler(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 13
  br i1 %4, label %5, label %8

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_breakHandler, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_breakHandler, i64 0, i64 0)
  %7 = call void (i32)* @signal(i32 13, void (i32)* inttoptr (i64 1 to void (i32)*)) #7
  call void @exitPGP(i32 6)
  br label %8

; <label>:8:                                      ; preds = %5, %1
  %9 = load i32, i32* %2, align 4
  %10 = icmp ne i32 %9, 2
  br i1 %10, label %11, label %16

; <label>:11:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_breakHandler, i64 0, i64 1)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_breakHandler, i64 0, i64 1)
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = load i32, i32* %2, align 4
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0), i32 %14)
  br label %21

; <label>:16:                                     ; preds = %8
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_breakHandler, i64 0, i64 2)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_breakHandler, i64 0, i64 2)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %19 = call i8* @LANG(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i32 0, i32 0))
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* %19)
  br label %21

; <label>:21:                                     ; preds = %16, %11
  call void @exitPGP(i32 6)
  ret void
}

; Function Attrs: nounwind
declare void (i32)* @signal(i32, void (i32)*) #2

; Function Attrs: noinline nounwind uwtable
define void @exitPGP(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [4096 x i8], align 16
  %4 = alloca %struct.hashedpw*, align 8
  store i32 %0, i32* %2, align 4
  %5 = load i8, i8* @verbose, align 1
  %6 = icmp ne i8 %5, 0
  br i1 %6, label %7, label %12

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_exitPGP, i64 0, i64 3)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_exitPGP, i64 0, i64 3)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %10 = load i32, i32* %2, align 4
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.46, i32 0, i32 0), i32 %10)
  br label %12

; <label>:12:                                     ; preds = %7, %1
  %13 = load %struct.hashedpw*, %struct.hashedpw** @passwds, align 8
  store %struct.hashedpw* %13, %struct.hashedpw** %4, align 8
  br label %14

; <label>:14:                                     ; preds = %21, %12
  %15 = load %struct.hashedpw*, %struct.hashedpw** %4, align 8
  %16 = icmp ne %struct.hashedpw* %15, null
  br i1 %16, label %17, label %26

; <label>:17:                                     ; preds = %14
  %18 = load %struct.hashedpw*, %struct.hashedpw** %4, align 8
  %19 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %18, i32 0, i32 1
  %20 = getelementptr inbounds [16 x i8], [16 x i8]* %19, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %20, i8 0, i64 16, i32 8, i1 false)
  br label %21

; <label>:21:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_exitPGP, i64 0, i64 1)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_exitPGP, i64 0, i64 1)
  %23 = load %struct.hashedpw*, %struct.hashedpw** %4, align 8
  %24 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %23, i32 0, i32 0
  %25 = load %struct.hashedpw*, %struct.hashedpw** %24, align 8
  store %struct.hashedpw* %25, %struct.hashedpw** %4, align 8
  br label %14

; <label>:26:                                     ; preds = %14
  %27 = load %struct.hashedpw*, %struct.hashedpw** @keypasswds, align 8
  store %struct.hashedpw* %27, %struct.hashedpw** %4, align 8
  br label %28

; <label>:28:                                     ; preds = %35, %26
  %29 = load %struct.hashedpw*, %struct.hashedpw** %4, align 8
  %30 = icmp ne %struct.hashedpw* %29, null
  br i1 %30, label %31, label %40

; <label>:31:                                     ; preds = %28
  %32 = load %struct.hashedpw*, %struct.hashedpw** %4, align 8
  %33 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %32, i32 0, i32 1
  %34 = getelementptr inbounds [16 x i8], [16 x i8]* %33, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %34, i8 0, i64 16, i32 8, i1 false)
  br label %35

; <label>:35:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_exitPGP, i64 0, i64 0)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_exitPGP, i64 0, i64 0)
  %37 = load %struct.hashedpw*, %struct.hashedpw** %4, align 8
  %38 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %37, i32 0, i32 0
  %39 = load %struct.hashedpw*, %struct.hashedpw** %38, align 8
  store %struct.hashedpw* %39, %struct.hashedpw** %4, align 8
  br label %28

; <label>:40:                                     ; preds = %28
  call void @cleanup_tmpf()
  %41 = call i32 @cryptRandOpen(%struct.IdeaCfbContext* null)
  %42 = icmp sge i32 %41, 0
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_exitPGP, i64 0, i64 4)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_exitPGP, i64 0, i64 4)
  call void @cryptRandSave(%struct.IdeaCfbContext* null)
  br label %45

; <label>:45:                                     ; preds = %43, %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_exitPGP, i64 0, i64 2)
  %46 = add i64 %pgocount4, 1
  store i64 %46, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_exitPGP, i64 0, i64 2)
  %47 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %47, i8 0, i64 4096, i32 16, i1 false)
  %48 = load i32, i32* %2, align 4
  call void @exit(i32 %48) #9
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

declare i8* @LANG(i8*) #3

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i8**, align 8
  %13 = alloca i8**, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i8, align 1
  %17 = alloca i8, align 1
  %18 = alloca i8, align 1
  %19 = alloca i8, align 1
  %20 = alloca i8, align 1
  %21 = alloca i8, align 1
  %22 = alloca i8, align 1
  %23 = alloca i8, align 1
  %24 = alloca i8, align 1
  %25 = alloca i8, align 1
  %26 = alloca i8*, align 8
  %27 = alloca i8*, align 8
  %28 = alloca [256 x i8], align 16
  %29 = alloca [256 x i8], align 16
  %30 = alloca i8, align 1
  %31 = alloca i8*, align 8
  %32 = alloca i8, align 1
  %33 = alloca %struct.hashedpw*, align 8
  %34 = alloca i32, align 4
  %35 = alloca [256 x i8], align 16
  %36 = alloca [256 x i8], align 16
  %37 = alloca i8*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %6, align 8
  store i8* null, i8** %11, align 8
  store i8** null, i8*** %12, align 8
  store i8 0, i8* %16, align 1
  store i8 0, i8* %17, align 1
  store i8 0, i8* %18, align 1
  store i8 0, i8* %19, align 1
  store i8 0, i8* %20, align 1
  store i8 0, i8* %21, align 1
  store i8 0, i8* %22, align 1
  store i8 0, i8* %23, align 1
  store i8* null, i8** %26, align 8
  store i8* null, i8** %27, align 8
  store i8 0, i8* %30, align 1
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  store %struct._IO_FILE* %38, %struct._IO_FILE** @pgpout, align 8
  %39 = call i8* (i8*, ...) bitcast (i8* (...)* @getenv to i8* (i8*, ...)*)(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0))
  store i8* %39, i8** %31, align 8
  %40 = icmp ne i8* %39, null
  br i1 %40, label %41, label %56

; <label>:41:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 25)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 25)
  %43 = call i8* @xmalloc(i32 24)
  %44 = bitcast i8* %43 to %struct.hashedpw*
  store %struct.hashedpw* %44, %struct.hashedpw** %33, align 8
  %45 = load i8*, i8** %31, align 8
  %46 = load i8*, i8** %31, align 8
  %47 = call i64 @strlen(i8* %46) #8
  %48 = trunc i64 %47 to i32
  %49 = load %struct.hashedpw*, %struct.hashedpw** %33, align 8
  %50 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %49, i32 0, i32 1
  %51 = getelementptr inbounds [16 x i8], [16 x i8]* %50, i32 0, i32 0
  call void @hashpass(i8* %45, i32 %48, i8* %51)
  %52 = load %struct.hashedpw*, %struct.hashedpw** @keypasswds, align 8
  %53 = load %struct.hashedpw*, %struct.hashedpw** %33, align 8
  %54 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %53, i32 0, i32 0
  store %struct.hashedpw* %52, %struct.hashedpw** %54, align 8
  %55 = load %struct.hashedpw*, %struct.hashedpw** %33, align 8
  store %struct.hashedpw* %55, %struct.hashedpw** @keypasswds, align 8
  br label %56

; <label>:56:                                     ; preds = %41, %2
  store i32 1, i32* %10, align 4
  br label %57

; <label>:57:                                     ; preds = %126, %56
  %58 = load i32, i32* %10, align 4
  %59 = load i32, i32* %4, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %129

; <label>:61:                                     ; preds = %57
  %62 = load i8**, i8*** %5, align 8
  %63 = load i32, i32* %10, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8*, i8** %62, i64 %64
  %66 = load i8*, i8** %65, align 8
  store i8* %66, i8** %31, align 8
  %67 = load i8*, i8** %31, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 0
  %69 = load i8, i8* %68, align 1
  %70 = sext i8 %69 to i32
  %71 = icmp ne i32 %70, 45
  br i1 %71, label %79, label %72

; <label>:72:                                     ; preds = %61
  %pgocount1 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 5)
  %73 = add i64 %pgocount1, 1
  store i64 %73, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 5)
  %74 = load i8*, i8** %31, align 8
  %75 = getelementptr inbounds i8, i8* %74, i64 1
  %76 = load i8, i8* %75, align 1
  %77 = sext i8 %76 to i32
  %78 = icmp ne i32 %77, 122
  br i1 %78, label %79, label %81

; <label>:79:                                     ; preds = %72, %61
  %pgocount2 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 3)
  %80 = add i64 %pgocount2, 1
  store i64 %80, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 3)
  br label %126

; <label>:81:                                     ; preds = %72
  %82 = load i8*, i8** %31, align 8
  %83 = getelementptr inbounds i8, i8* %82, i64 2
  store i8* %83, i8** %31, align 8
  %84 = load i8*, i8** %31, align 8
  %85 = load i8, i8* %84, align 1
  %86 = icmp ne i8 %85, 0
  br i1 %86, label %95, label %87

; <label>:87:                                     ; preds = %81
  %pgocount3 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 18)
  %88 = add i64 %pgocount3, 1
  store i64 %88, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 18)
  %89 = load i8**, i8*** %5, align 8
  %90 = load i32, i32* %10, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %10, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8*, i8** %89, i64 %92
  %94 = load i8*, i8** %93, align 8
  store i8* %94, i8** %31, align 8
  br label %95

; <label>:95:                                     ; preds = %87, %81
  %96 = load i8*, i8** %31, align 8
  %97 = icmp ne i8* %96, null
  br i1 %97, label %100, label %98

; <label>:98:                                     ; preds = %95
  %pgocount4 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 105)
  %99 = add i64 %pgocount4, 1
  store i64 %99, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 105)
  br label %129

; <label>:100:                                    ; preds = %95
  %101 = call i8* @xmalloc(i32 24)
  %102 = bitcast i8* %101 to %struct.hashedpw*
  store %struct.hashedpw* %102, %struct.hashedpw** %33, align 8
  %103 = load i8*, i8** %31, align 8
  %104 = load i8*, i8** %31, align 8
  %105 = call i64 @strlen(i8* %104) #8
  %106 = trunc i64 %105 to i32
  %107 = load %struct.hashedpw*, %struct.hashedpw** %33, align 8
  %108 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %107, i32 0, i32 1
  %109 = getelementptr inbounds [16 x i8], [16 x i8]* %108, i32 0, i32 0
  call void @hashpass(i8* %103, i32 %106, i8* %109)
  br label %110

; <label>:110:                                    ; preds = %114, %100
  %111 = load i8*, i8** %31, align 8
  %112 = load i8, i8* %111, align 1
  %113 = icmp ne i8 %112, 0
  br i1 %113, label %114, label %118

; <label>:114:                                    ; preds = %110
  %pgocount5 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 1)
  %115 = add i64 %pgocount5, 1
  store i64 %115, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 1)
  %116 = load i8*, i8** %31, align 8
  %117 = getelementptr inbounds i8, i8* %116, i32 1
  store i8* %117, i8** %31, align 8
  store i8 32, i8* %116, align 1
  br label %110

; <label>:118:                                    ; preds = %110
  %pgocount6 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 11)
  %119 = add i64 %pgocount6, 1
  store i64 %119, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 11)
  %120 = load %struct.hashedpw*, %struct.hashedpw** %33, align 8
  %121 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %120, i32 0, i32 0
  store %struct.hashedpw* null, %struct.hashedpw** %121, align 8
  %122 = load %struct.hashedpw*, %struct.hashedpw** %33, align 8
  %123 = load %struct.hashedpw**, %struct.hashedpw*** @passwdstail, align 8
  store %struct.hashedpw* %122, %struct.hashedpw** %123, align 8
  %124 = load %struct.hashedpw*, %struct.hashedpw** %33, align 8
  %125 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %124, i32 0, i32 0
  store %struct.hashedpw** %125, %struct.hashedpw*** @passwdstail, align 8
  br label %126

; <label>:126:                                    ; preds = %118, %79
  %127 = load i32, i32* %10, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %10, align 4
  br label %57

; <label>:129:                                    ; preds = %98, %57
  %130 = call i8* (i8*, ...) bitcast (i8* (...)* @getenv to i8* (i8*, ...)*)(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0))
  store i8* %130, i8** %31, align 8
  %131 = icmp ne i8* %130, null
  br i1 %131, label %132, label %189

; <label>:132:                                    ; preds = %129
  %pgocount7 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 26)
  %133 = add i64 %pgocount7, 1
  store i64 %133, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 26)
  %134 = load i8*, i8** %31, align 8
  %135 = load i8, i8* %134, align 1
  %136 = sext i8 %135 to i32
  %137 = icmp ne i32 %136, 0
  br i1 %137, label %138, label %188

; <label>:138:                                    ; preds = %132
  %pgocount8 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 45)
  %139 = add i64 %pgocount8, 1
  store i64 %139, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 45)
  %140 = load i8*, i8** %31, align 8
  %141 = call i32 (i8*, ...) bitcast (i32 (...)* @atoi to i32 (i8*, ...)*)(i8* %140)
  store i32 %141, i32* %34, align 4
  %142 = icmp sge i32 %141, 0
  br i1 %142, label %143, label %188

; <label>:143:                                    ; preds = %138
  %144 = getelementptr inbounds [256 x i8], [256 x i8]* %35, i32 0, i32 0
  store i8* %144, i8** %31, align 8
  br label %145

; <label>:145:                                    ; preds = %158, %143
  %146 = load i32, i32* %34, align 4
  %147 = load i8*, i8** %31, align 8
  %148 = call i64 @read(i32 %146, i8* %147, i64 1)
  %149 = icmp eq i64 %148, 1
  br i1 %149, label %150, label %156

; <label>:150:                                    ; preds = %145
  %pgocount9 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 15)
  %151 = add i64 %pgocount9, 1
  store i64 %151, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 15)
  %152 = load i8*, i8** %31, align 8
  %153 = load i8, i8* %152, align 1
  %154 = sext i8 %153 to i32
  %155 = icmp ne i32 %154, 10
  br label %156

; <label>:156:                                    ; preds = %150, %145
  %157 = phi i1 [ false, %145 ], [ %155, %150 ]
  br i1 %157, label %158, label %162

; <label>:158:                                    ; preds = %156
  %pgocount10 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 10)
  %159 = add i64 %pgocount10, 1
  store i64 %159, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 10)
  %160 = load i8*, i8** %31, align 8
  %161 = getelementptr inbounds i8, i8* %160, i32 1
  store i8* %161, i8** %31, align 8
  br label %145

; <label>:162:                                    ; preds = %156
  %pgocount11 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 103)
  %163 = add i64 %pgocount11, 1
  store i64 %163, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 103)
  %164 = call i8* @xmalloc(i32 24)
  %165 = bitcast i8* %164 to %struct.hashedpw*
  store %struct.hashedpw* %165, %struct.hashedpw** %33, align 8
  %166 = getelementptr inbounds [256 x i8], [256 x i8]* %35, i32 0, i32 0
  %167 = load i8*, i8** %31, align 8
  %168 = getelementptr inbounds [256 x i8], [256 x i8]* %35, i32 0, i32 0
  %169 = ptrtoint i8* %167 to i64
  %170 = ptrtoint i8* %168 to i64
  %171 = sub i64 %169, %170
  %172 = trunc i64 %171 to i32
  %173 = load %struct.hashedpw*, %struct.hashedpw** %33, align 8
  %174 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %173, i32 0, i32 1
  %175 = getelementptr inbounds [16 x i8], [16 x i8]* %174, i32 0, i32 0
  call void @hashpass(i8* %166, i32 %172, i8* %175)
  %176 = getelementptr inbounds [256 x i8], [256 x i8]* %35, i32 0, i32 0
  %177 = load i8*, i8** %31, align 8
  %178 = getelementptr inbounds [256 x i8], [256 x i8]* %35, i32 0, i32 0
  %179 = ptrtoint i8* %177 to i64
  %180 = ptrtoint i8* %178 to i64
  %181 = sub i64 %179, %180
  call void @llvm.memset.p0i8.i64(i8* %176, i8 0, i64 %181, i32 16, i1 false)
  %182 = load %struct.hashedpw*, %struct.hashedpw** %33, align 8
  %183 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %182, i32 0, i32 0
  store %struct.hashedpw* null, %struct.hashedpw** %183, align 8
  %184 = load %struct.hashedpw*, %struct.hashedpw** %33, align 8
  %185 = load %struct.hashedpw**, %struct.hashedpw*** @passwdstail, align 8
  store %struct.hashedpw* %184, %struct.hashedpw** %185, align 8
  %186 = load %struct.hashedpw*, %struct.hashedpw** %33, align 8
  %187 = getelementptr inbounds %struct.hashedpw, %struct.hashedpw* %186, i32 0, i32 0
  store %struct.hashedpw** %187, %struct.hashedpw*** @passwdstail, align 8
  br label %188

; <label>:188:                                    ; preds = %162, %138, %132
  br label %189

; <label>:189:                                    ; preds = %188, %129
  store i32 0, i32* %10, align 4
  %190 = call i8* @buildsysfilename(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0))
  %191 = call i32 @access(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i32 0) #7
  %192 = icmp ne i32 %191, 0
  br i1 %192, label %193, label %196

; <label>:193:                                    ; preds = %189
  %pgocount12 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 27)
  %194 = add i64 %pgocount12, 1
  store i64 %194, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 27)
  %195 = call i8* @buildsysfilename(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i32 0, i32 0))
  br label %196

; <label>:196:                                    ; preds = %193, %189
  %197 = call i32 @access(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i32 0) #7
  %198 = icmp eq i32 %197, 0
  br i1 %198, label %199, label %204

; <label>:199:                                    ; preds = %196
  %pgocount13 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 51)
  %200 = add i64 %pgocount13, 1
  store i64 %200, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 51)
  %201 = load i32, i32* %10, align 4
  %202 = add nsw i32 %201, 1
  store i32 %202, i32* %10, align 4
  %203 = call i32 @processConfigFile(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0))
  br label %204

; <label>:204:                                    ; preds = %199, %196
  %205 = call i8* @buildfilename(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i32 0, i32 0))
  %206 = call i8* @buildfilename(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalSecringName, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i32 0, i32 0))
  %207 = call i8* @buildfilename(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalRandseedName, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.9, i32 0, i32 0))
  store i8 0, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @my_name, i64 0, i64 0), align 16
  %208 = call i8* @buildfilename(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0))
  %209 = call i32 @access(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i32 0) #7
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %211, label %214

; <label>:211:                                    ; preds = %204
  %pgocount14 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 28)
  %212 = add i64 %pgocount14, 1
  store i64 %212, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 28)
  %213 = call i8* @buildfilename(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i32 0, i32 0))
  br label %214

; <label>:214:                                    ; preds = %211, %204
  %215 = call i32 @access(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i32 0) #7
  %216 = icmp eq i32 %215, 0
  br i1 %216, label %217, label %226

; <label>:217:                                    ; preds = %214
  %218 = load i32, i32* %10, align 4
  %219 = add nsw i32 %218, 1
  store i32 %219, i32* %10, align 4
  %220 = call i32 @processConfigFile(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0))
  %221 = icmp slt i32 %220, 0
  br i1 %221, label %222, label %224

; <label>:222:                                    ; preds = %217
  %pgocount15 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 183)
  %223 = add i64 %pgocount15, 1
  store i64 %223, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 183)
  call void @exit(i32 5) #9
  unreachable

; <label>:224:                                    ; preds = %217
  %pgocount16 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 57)
  %225 = add i64 %pgocount16, 1
  store i64 %225, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 57)
  br label %226

; <label>:226:                                    ; preds = %224, %214
  call void @init_charset()
  %227 = call i8* (i8*, ...) bitcast (i8* (...)* @getenv to i8* (i8*, ...)*)(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0))
  store i8* %227, i8** %31, align 8
  %228 = icmp ne i8* %227, null
  br i1 %228, label %229, label %238

; <label>:229:                                    ; preds = %226
  %pgocount17 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 29)
  %230 = add i64 %pgocount17, 1
  store i64 %230, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 29)
  %231 = load i8*, i8** %31, align 8
  %232 = load i8, i8* %231, align 1
  %233 = sext i8 %232 to i32
  %234 = icmp ne i32 %233, 0
  br i1 %234, label %235, label %238

; <label>:235:                                    ; preds = %229
  %pgocount18 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 46)
  %236 = add i64 %pgocount18, 1
  store i64 %236, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 46)
  %237 = load i8*, i8** %31, align 8
  call void @settmpdir(i8* %237)
  br label %238

; <label>:238:                                    ; preds = %235, %229, %226
  %239 = load i32, i32* %4, align 4
  %240 = add nsw i32 %239, 2
  %241 = sext i32 %240 to i64
  %242 = mul i64 %241, 8
  %243 = call i8* (i64, ...) bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %242)
  %244 = bitcast i8* %243 to i8**
  store i8** %244, i8*** @myArgv, align 8
  %245 = icmp eq i8** %244, null
  br i1 %245, label %246, label %251

; <label>:246:                                    ; preds = %238
  %pgocount19 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 52)
  %247 = add i64 %pgocount19, 1
  store i64 %247, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 52)
  %248 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %249 = call i8* @LANG(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.11, i32 0, i32 0))
  %250 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %248, i8* %249)
  call void @exitPGP(i32 7)
  br label %251

; <label>:251:                                    ; preds = %246, %238
  %252 = load i8**, i8*** @myArgv, align 8
  %253 = getelementptr inbounds i8*, i8** %252, i64 0
  store i8* null, i8** %253, align 8
  %254 = load i8**, i8*** @myArgv, align 8
  %255 = getelementptr inbounds i8*, i8** %254, i64 1
  store i8* null, i8** %255, align 8
  br label %256

; <label>:256:                                    ; preds = %382, %323, %280, %251
  %257 = load i32, i32* @optind, align 4
  %258 = load i32, i32* %4, align 4
  %259 = icmp slt i32 %257, %258
  br i1 %259, label %260, label %383

; <label>:260:                                    ; preds = %256
  %261 = load i8**, i8*** %5, align 8
  %262 = load i32, i32* @optind, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds i8*, i8** %261, i64 %263
  %265 = load i8*, i8** %264, align 8
  %266 = call i32 @strncmp(i8* %265, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0), i64 2) #8
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %268, label %274

; <label>:268:                                    ; preds = %260
  %pgocount20 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 6)
  %269 = add i64 %pgocount20, 1
  store i64 %269, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 6)
  %270 = load i32, i32* %4, align 4
  %271 = load i8**, i8*** %5, align 8
  %272 = call i32 (i32, i8**, i8*, ...) bitcast (i32 (...)* @pgp_getopt to i32 (i32, i8**, i8*, ...)*)(i32 %270, i8** %271, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.13, i32 0, i32 0))
  store i32 %272, i32* %10, align 4
  %273 = icmp eq i32 %272, -1
  br i1 %273, label %274, label %293

; <label>:274:                                    ; preds = %268, %260
  %275 = load i32, i32* @optind, align 4
  %276 = load i32, i32* %4, align 4
  %277 = icmp eq i32 %275, %276
  br i1 %277, label %278, label %280

; <label>:278:                                    ; preds = %274
  %pgocount21 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 61)
  %279 = add i64 %pgocount21, 1
  store i64 %279, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 61)
  br label %383

; <label>:280:                                    ; preds = %274
  %pgocount22 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 7)
  %281 = add i64 %pgocount22, 1
  store i64 %281, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 7)
  %282 = load i8**, i8*** %5, align 8
  %283 = load i32, i32* @optind, align 4
  %284 = add nsw i32 %283, 1
  store i32 %284, i32* @optind, align 4
  %285 = sext i32 %283 to i64
  %286 = getelementptr inbounds i8*, i8** %282, i64 %285
  %287 = load i8*, i8** %286, align 8
  %288 = load i8**, i8*** @myArgv, align 8
  %289 = load i32, i32* @myArgc, align 4
  %290 = add nsw i32 %289, 1
  store i32 %290, i32* @myArgc, align 4
  %291 = sext i32 %289 to i64
  %292 = getelementptr inbounds i8*, i8** %288, i64 %291
  store i8* %287, i8** %292, align 8
  br label %256

; <label>:293:                                    ; preds = %268
  %294 = load i32, i32* %10, align 4
  %295 = call i32 @to_lower(i32 %294)
  store i32 %295, i32* %10, align 4
  %296 = load i8, i8* %21, align 1
  %297 = zext i8 %296 to i32
  %298 = icmp ne i32 %297, 0
  br i1 %298, label %299, label %324

; <label>:299:                                    ; preds = %293
  %pgocount23 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 12)
  %300 = add i64 %pgocount23, 1
  store i64 %300, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 12)
  %301 = load i8, i8* %30, align 1
  %302 = sext i8 %301 to i32
  %303 = icmp eq i32 %302, 0
  br i1 %303, label %313, label %304

; <label>:304:                                    ; preds = %299
  %pgocount24 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 16)
  %305 = add i64 %pgocount24, 1
  store i64 %305, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 16)
  %306 = load i8, i8* %30, align 1
  %307 = sext i8 %306 to i32
  %308 = icmp eq i32 %307, 118
  br i1 %308, label %309, label %324

; <label>:309:                                    ; preds = %304
  %pgocount25 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 21)
  %310 = add i64 %pgocount25, 1
  store i64 %310, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 21)
  %311 = load i32, i32* %10, align 4
  %312 = icmp eq i32 %311, 118
  br i1 %312, label %313, label %324

; <label>:313:                                    ; preds = %309, %299
  %314 = load i8, i8* %30, align 1
  %315 = sext i8 %314 to i32
  %316 = icmp eq i32 %315, 118
  br i1 %316, label %317, label %319

; <label>:317:                                    ; preds = %313
  %pgocount26 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 22)
  %318 = add i64 %pgocount26, 1
  store i64 %318, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 22)
  store i8 86, i8* %30, align 1
  br label %323

; <label>:319:                                    ; preds = %313
  %pgocount27 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 23)
  %320 = add i64 %pgocount27, 1
  store i64 %320, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 23)
  %321 = load i32, i32* %10, align 4
  %322 = trunc i32 %321 to i8
  store i8 %322, i8* %30, align 1
  br label %323

; <label>:323:                                    ; preds = %319, %317
  br label %256

; <label>:324:                                    ; preds = %309, %304, %293
  %325 = load i32, i32* %10, align 4
  switch i32 %325, label %380 [
    i32 97, label %327
    i32 98, label %329
    i32 99, label %331
    i32 100, label %333
    i32 101, label %335
    i32 102, label %337
    i32 63, label %._crit_edge
    i32 104, label %339
    i32 107, label %341
    i32 108, label %343
    i32 109, label %345
    i32 112, label %347
    i32 111, label %349
    i32 115, label %352
    i32 116, label %354
    i32 117, label %356
    i32 119, label %360
    i32 122, label %362
    i32 43, label %364
  ]

._crit_edge:                                      ; preds = %324
  %pgocount28 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 0)
  %326 = add i64 %pgocount28, 1
  store i64 %326, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 0)
  br label %339

; <label>:327:                                    ; preds = %324
  %pgocount29 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 67)
  %328 = add i64 %pgocount29, 1
  store i64 %328, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 67)
  store i8 1, i8* %19, align 1
  store i8 1, i8* @emit_radix_64, align 1
  br label %382

; <label>:329:                                    ; preds = %324
  %pgocount30 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 68)
  %330 = add i64 %pgocount30, 1
  store i64 %330, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 68)
  store i8 1, i8* @strip_sig_flag, align 1
  store i8 1, i8* %20, align 1
  br label %382

; <label>:331:                                    ; preds = %324
  %pgocount31 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 69)
  %332 = add i64 %pgocount31, 1
  store i64 %332, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 69)
  store i8 1, i8* %23, align 1
  store i8 1, i8* %22, align 1
  store i8 1, i8* @c_flag, align 1
  br label %382

; <label>:333:                                    ; preds = %324
  %pgocount32 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 70)
  %334 = add i64 %pgocount32, 1
  store i64 %334, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 70)
  store i8 1, i8* @decrypt_only_flag, align 1
  br label %382

; <label>:335:                                    ; preds = %324
  %pgocount33 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 71)
  %336 = add i64 %pgocount33, 1
  store i64 %336, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 71)
  store i8 1, i8* %22, align 1
  br label %382

; <label>:337:                                    ; preds = %324
  %pgocount34 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 72)
  %338 = add i64 %pgocount34, 1
  store i64 %338, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 72)
  store i8 1, i8* @filter_mode, align 1
  br label %382

; <label>:339:                                    ; preds = %._crit_edge, %324
  %pgocount35 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 40)
  %340 = add i64 %pgocount35, 1
  store i64 %340, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 40)
  call void @usage()
  br label %382

; <label>:341:                                    ; preds = %324
  %pgocount36 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 73)
  %342 = add i64 %pgocount36, 1
  store i64 %342, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 73)
  store i8 1, i8* %21, align 1
  br label %382

; <label>:343:                                    ; preds = %324
  %pgocount37 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 74)
  %344 = add i64 %pgocount37, 1
  store i64 %344, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 74)
  store i8 1, i8* @verbose, align 1
  br label %382

; <label>:345:                                    ; preds = %324
  %pgocount38 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 75)
  %346 = add i64 %pgocount38, 1
  store i64 %346, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 75)
  store i8 1, i8* @moreflag, align 1
  br label %382

; <label>:347:                                    ; preds = %324
  %pgocount39 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 76)
  %348 = add i64 %pgocount39, 1
  store i64 %348, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 76)
  store i8 1, i8* @preserve_filename, align 1
  br label %382

; <label>:349:                                    ; preds = %324
  %pgocount40 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 77)
  %350 = add i64 %pgocount40, 1
  store i64 %350, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 77)
  %351 = load i8*, i8** @optarg, align 8
  store i8* %351, i8** @outputfile, align 8
  br label %382

; <label>:352:                                    ; preds = %324
  %pgocount41 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 78)
  %353 = add i64 %pgocount41, 1
  store i64 %353, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 78)
  store i8 1, i8* @sign_flag, align 1
  br label %382

; <label>:354:                                    ; preds = %324
  %pgocount42 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 79)
  %355 = add i64 %pgocount42, 1
  store i64 %355, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 79)
  store i8 116, i8* @literal_mode, align 1
  br label %382

; <label>:356:                                    ; preds = %324
  %pgocount43 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 80)
  %357 = add i64 %pgocount43, 1
  store i64 %357, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 80)
  %358 = load i8*, i8** @optarg, align 8
  %359 = call i8* @strncpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @my_name, i32 0, i32 0), i8* %358, i64 255) #7
  store i8 1, i8* @u_flag, align 1
  br label %382

; <label>:360:                                    ; preds = %324
  %pgocount44 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 81)
  %361 = add i64 %pgocount44, 1
  store i64 %361, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 81)
  store i8 1, i8* %18, align 1
  br label %382

; <label>:362:                                    ; preds = %324
  %pgocount45 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 82)
  %363 = add i64 %pgocount45, 1
  store i64 %363, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 82)
  br label %382

; <label>:364:                                    ; preds = %324
  %365 = load i8*, i8** @optarg, align 8
  %366 = call i32 @processConfigLine(i8* %365)
  %367 = icmp eq i32 %366, 0
  br i1 %367, label %368, label %376

; <label>:368:                                    ; preds = %364
  %369 = load i8*, i8** @optarg, align 8
  %370 = call i32 @strncmp(i8* %369, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i64 2) #8
  %371 = icmp ne i32 %370, 0
  br i1 %371, label %374, label %372

; <label>:372:                                    ; preds = %368
  %pgocount46 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 151)
  %373 = add i64 %pgocount46, 1
  store i64 %373, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 151)
  call void @init_charset()
  br label %374

; <label>:374:                                    ; preds = %372, %368
  %pgocount47 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 128)
  %375 = add i64 %pgocount47, 1
  store i64 %375, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 128)
  br label %382

; <label>:376:                                    ; preds = %364
  %pgocount48 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 111)
  %377 = add i64 %pgocount48, 1
  store i64 %377, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 111)
  %378 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %379 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %378, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  br label %380

; <label>:380:                                    ; preds = %376, %324
  %pgocount49 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 44)
  %381 = add i64 %pgocount49, 1
  store i64 %381, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 44)
  call void @arg_error()
  br label %382

; <label>:382:                                    ; preds = %380, %374, %362, %360, %356, %354, %352, %349, %347, %345, %343, %341, %339, %337, %335, %333, %331, %329, %327
  br label %256

; <label>:383:                                    ; preds = %278, %256
  %384 = load i8**, i8*** @myArgv, align 8
  %385 = load i32, i32* @myArgc, align 4
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds i8*, i8** %384, i64 %386
  store i8* null, i8** %387, align 8
  %388 = load i8, i8* %21, align 1
  %389 = zext i8 %388 to i32
  %390 = icmp ne i32 %389, 0
  br i1 %390, label %391, label %398

; <label>:391:                                    ; preds = %383
  %pgocount50 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 30)
  %392 = add i64 %pgocount50, 1
  store i64 %392, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 30)
  %393 = load i8, i8* %30, align 1
  %394 = sext i8 %393 to i32
  %395 = icmp eq i32 %394, 0
  br i1 %395, label %396, label %398

; <label>:396:                                    ; preds = %391
  %pgocount51 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 86)
  %397 = add i64 %pgocount51, 1
  store i64 %397, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 86)
  call void @key_usage()
  br label %398

; <label>:398:                                    ; preds = %396, %391, %383
  call void @signon_msg()
  %399 = load i8*, i8** @outputfile, align 8
  %400 = icmp ne i8* %399, null
  br i1 %400, label %401, label %406

; <label>:401:                                    ; preds = %398
  %402 = load i8*, i8** @outputfile, align 8
  %403 = call i32 @strcmp(i8* %402, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i32 0, i32 0)) #8
  %404 = icmp eq i32 %403, 0
  %405 = zext i1 %404 to i32
  br label %410

; <label>:406:                                    ; preds = %398
  %pgocount52 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 53)
  %407 = add i64 %pgocount52, 1
  store i64 %407, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 53)
  %408 = load i8, i8* @filter_mode, align 1
  %409 = zext i8 %408 to i32
  br label %410

; <label>:410:                                    ; preds = %406, %401
  %411 = phi i32 [ %405, %401 ], [ %409, %406 ]
  %412 = trunc i32 %411 to i8
  store i8 %412, i8* %25, align 1
  %413 = load i8, i8* %25, align 1
  %414 = icmp ne i8 %413, 0
  br i1 %414, label %418, label %415

; <label>:415:                                    ; preds = %410
  %pgocount53 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 54)
  %416 = add i64 %pgocount53, 1
  store i64 %416, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 54)
  %417 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %417, %struct._IO_FILE** @pgpout, align 8
  br label %418

; <label>:418:                                    ; preds = %415, %410
  %419 = call i32 @umask(i32 63) #7
  call void @initsigs()
  %420 = call i64 @noise()
  %421 = load i8, i8* %21, align 1
  %422 = icmp ne i8 %421, 0
  br i1 %422, label %423, label %433

; <label>:423:                                    ; preds = %418
  %424 = load i8, i8* %30, align 1
  %425 = call i32 @do_keyopt(i8 signext %424)
  store i32 %425, i32* %9, align 4
  %426 = load i32, i32* %9, align 4
  %427 = icmp slt i32 %426, 0
  br i1 %427, label %428, label %430

; <label>:428:                                    ; preds = %423
  %pgocount54 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 87)
  %429 = add i64 %pgocount54, 1
  store i64 %429, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 87)
  call void @user_error()
  br label %430

; <label>:430:                                    ; preds = %428, %423
  %pgocount55 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 31)
  %431 = add i64 %pgocount55, 1
  store i64 %431, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 31)
  %432 = load i32, i32* %9, align 4
  call void @exitPGP(i32 %432)
  br label %433

; <label>:433:                                    ; preds = %430, %418
  %434 = load i8, i8* @decrypt_only_flag, align 1
  %435 = zext i8 %434 to i32
  %436 = icmp ne i32 %435, 0
  br i1 %436, label %437, label %444

; <label>:437:                                    ; preds = %433
  %pgocount56 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 32)
  %438 = add i64 %pgocount56, 1
  store i64 %438, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 32)
  %439 = load i8, i8* @strip_sig_flag, align 1
  %440 = zext i8 %439 to i32
  %441 = icmp ne i32 %440, 0
  br i1 %441, label %442, label %444

; <label>:442:                                    ; preds = %437
  %pgocount57 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 47)
  %443 = add i64 %pgocount57, 1
  store i64 %443, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 47)
  store i8 0, i8* @decrypt_only_flag, align 1
  br label %444

; <label>:444:                                    ; preds = %442, %437, %433
  %445 = load i8, i8* @decrypt_only_flag, align 1
  %446 = zext i8 %445 to i32
  %447 = icmp ne i32 %446, 0
  br i1 %447, label %448, label %455

; <label>:448:                                    ; preds = %444
  %pgocount58 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 33)
  %449 = add i64 %pgocount58, 1
  store i64 %449, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 33)
  %450 = load i8, i8* %19, align 1
  %451 = zext i8 %450 to i32
  %452 = icmp ne i32 %451, 0
  br i1 %452, label %453, label %455

; <label>:453:                                    ; preds = %448
  %pgocount59 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 48)
  %454 = add i64 %pgocount59, 1
  store i64 %454, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 48)
  store i8 1, i8* @de_armor_only, align 1
  store i8 1, i8* %17, align 1
  br label %455

; <label>:455:                                    ; preds = %453, %448, %444
  %456 = load i8*, i8** @outputfile, align 8
  %457 = icmp ne i8* %456, null
  br i1 %457, label %458, label %460

; <label>:458:                                    ; preds = %455
  %pgocount60 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 34)
  %459 = add i64 %pgocount60, 1
  store i64 %459, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 34)
  store i8 0, i8* @preserve_filename, align 1
  br label %460

; <label>:460:                                    ; preds = %458, %455
  %461 = load i8, i8* @sign_flag, align 1
  %462 = icmp ne i8 %461, 0
  br i1 %462, label %532, label %463

; <label>:463:                                    ; preds = %460
  %pgocount61 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 55)
  %464 = add i64 %pgocount61, 1
  store i64 %464, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 55)
  %465 = load i8, i8* %22, align 1
  %466 = icmp ne i8 %465, 0
  br i1 %466, label %532, label %467

; <label>:467:                                    ; preds = %463
  %pgocount62 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 118)
  %468 = add i64 %pgocount62, 1
  store i64 %468, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 118)
  %469 = load i8, i8* %23, align 1
  %470 = icmp ne i8 %469, 0
  br i1 %470, label %532, label %471

; <label>:471:                                    ; preds = %467
  %pgocount63 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 145)
  %472 = add i64 %pgocount63, 1
  store i64 %472, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 145)
  %473 = load i8, i8* %19, align 1
  %474 = icmp ne i8 %473, 0
  br i1 %474, label %532, label %475

; <label>:475:                                    ; preds = %471
  %476 = load i8, i8* %18, align 1
  %477 = icmp ne i8 %476, 0
  br i1 %477, label %478, label %530

; <label>:478:                                    ; preds = %475
  %479 = load i32, i32* @myArgc, align 4
  %480 = icmp ne i32 %479, 3
  br i1 %480, label %481, label %483

; <label>:481:                                    ; preds = %478
  %pgocount64 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 173)
  %482 = add i64 %pgocount64, 1
  store i64 %482, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 173)
  call void @arg_error()
  br label %483

; <label>:483:                                    ; preds = %481, %478
  %484 = load i8**, i8*** @myArgv, align 8
  %485 = getelementptr inbounds i8*, i8** %484, i64 2
  %486 = load i8*, i8** %485, align 8
  %487 = call i32 @wipefile(i8* %486)
  %488 = icmp eq i32 %487, 0
  br i1 %488, label %489, label %506

; <label>:489:                                    ; preds = %483
  %pgocount65 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 175)
  %490 = add i64 %pgocount65, 1
  store i64 %490, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 175)
  %491 = load i8**, i8*** @myArgv, align 8
  %492 = getelementptr inbounds i8*, i8** %491, i64 2
  %493 = load i8*, i8** %492, align 8
  %494 = call i32 @remove(i8* %493) #7
  %495 = icmp eq i32 %494, 0
  br i1 %495, label %496, label %506

; <label>:496:                                    ; preds = %489
  %pgocount66 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 179)
  %497 = add i64 %pgocount66, 1
  store i64 %497, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 179)
  %498 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %499 = call i8* @LANG(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.17, i32 0, i32 0))
  %500 = load i8**, i8*** @myArgv, align 8
  %501 = getelementptr inbounds i8*, i8** %500, i64 2
  %502 = load i8*, i8** %501, align 8
  %503 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %498, i8* %499, i8* %502)
  %504 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %505 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %504, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  call void @exitPGP(i32 0)
  br label %529

; <label>:506:                                    ; preds = %489, %483
  %507 = load i8**, i8*** @myArgv, align 8
  %508 = getelementptr inbounds i8*, i8** %507, i64 2
  %509 = load i8*, i8** %508, align 8
  %510 = call zeroext i8 @file_exists(i8* %509)
  %511 = icmp ne i8 %510, 0
  br i1 %511, label %512, label %520

; <label>:512:                                    ; preds = %506
  %pgocount67 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 172)
  %513 = add i64 %pgocount67, 1
  store i64 %513, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 172)
  %514 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %515 = call i8* @LANG(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.18, i32 0, i32 0))
  %516 = load i8**, i8*** @myArgv, align 8
  %517 = getelementptr inbounds i8*, i8** %516, i64 2
  %518 = load i8*, i8** %517, align 8
  %519 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %514, i8* %515, i8* %518)
  br label %528

; <label>:520:                                    ; preds = %506
  %pgocount68 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 177)
  %521 = add i64 %pgocount68, 1
  store i64 %521, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 177)
  %522 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %523 = call i8* @LANG(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.19, i32 0, i32 0))
  %524 = load i8**, i8*** @myArgv, align 8
  %525 = getelementptr inbounds i8*, i8** %524, i64 2
  %526 = load i8*, i8** %525, align 8
  %527 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %522, i8* %523, i8* %526)
  br label %528

; <label>:528:                                    ; preds = %520, %512
  br label %529

; <label>:529:                                    ; preds = %528, %496
  call void @exitPGP(i32 3)
  br label %530

; <label>:530:                                    ; preds = %529, %475
  %pgocount69 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 160)
  %531 = add i64 %pgocount69, 1
  store i64 %531, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 160)
  store i8 1, i8* %17, align 1
  br label %532

; <label>:532:                                    ; preds = %530, %471, %467, %463, %460
  %533 = load i32, i32* @myArgc, align 4
  %534 = icmp eq i32 %533, 2
  br i1 %534, label %535, label %589

; <label>:535:                                    ; preds = %532
  %536 = load i8, i8* @filter_mode, align 1
  %537 = icmp ne i8 %536, 0
  br i1 %537, label %563, label %538

; <label>:538:                                    ; preds = %535
  %pgocount70 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 106)
  %539 = add i64 %pgocount70, 1
  store i64 %539, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 106)
  %540 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %541 = call i32 @fileno(%struct._IO_FILE* %540) #7
  %542 = call i32 @isatty(i32 %541) #7
  %543 = icmp ne i32 %542, 0
  br i1 %543, label %563, label %544

; <label>:544:                                    ; preds = %538
  %545 = load i8, i8* @moreflag, align 1
  %546 = icmp ne i8 %545, 0
  br i1 %546, label %550, label %547

; <label>:547:                                    ; preds = %544
  %pgocount71 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 159)
  %548 = add i64 %pgocount71, 1
  store i64 %548, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 159)
  %549 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  store %struct._IO_FILE* %549, %struct._IO_FILE** @pgpout, align 8
  br label %550

; <label>:550:                                    ; preds = %547, %544
  store i8 1, i8* @filter_mode, align 1
  %551 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %552 = call i32 @fileno(%struct._IO_FILE* %551) #7
  %553 = call i32 @isatty(i32 %552) #7
  %554 = icmp ne i32 %553, 0
  br i1 %554, label %555, label %561

; <label>:555:                                    ; preds = %550
  %pgocount72 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 149)
  %556 = add i64 %pgocount72, 1
  store i64 %556, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 149)
  %557 = load i8, i8* @moreflag, align 1
  %558 = icmp ne i8 %557, 0
  br i1 %558, label %561, label %559

; <label>:559:                                    ; preds = %555
  %pgocount73 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 164)
  %560 = add i64 %pgocount73, 1
  store i64 %560, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 164)
  store i8 1, i8* @preserve_filename, align 1
  br label %561

; <label>:561:                                    ; preds = %559, %555, %550
  %pgocount74 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 142)
  %562 = add i64 %pgocount74, 1
  store i64 %562, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 142)
  br label %563

; <label>:563:                                    ; preds = %561, %538, %535
  %564 = load i8, i8* @filter_mode, align 1
  %565 = icmp ne i8 %564, 0
  br i1 %565, label %588, label %566

; <label>:566:                                    ; preds = %563
  %567 = load i8, i8* @quietmode, align 1
  %568 = icmp ne i8 %567, 0
  br i1 %568, label %569, label %571

; <label>:569:                                    ; preds = %566
  %pgocount75 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 184)
  %570 = add i64 %pgocount75, 1
  store i64 %570, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 184)
  store i8 0, i8* @quietmode, align 1
  call void @signon_msg()
  br label %571

; <label>:571:                                    ; preds = %569, %566
  %572 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %573 = call i8* @LANG(i8* getelementptr inbounds ([222 x i8], [222 x i8]* @.str.20, i32 0, i32 0))
  %574 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %572, i8* %573)
  %575 = call i8* @LANG(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.21, i32 0, i32 0))
  store i8* %575, i8** %31, align 8
  %576 = call i32 @strcmp(i8* %575, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.21, i32 0, i32 0)) #8
  %577 = icmp ne i32 %576, 0
  br i1 %577, label %578, label %583

; <label>:578:                                    ; preds = %571
  %pgocount76 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 185)
  %579 = add i64 %pgocount76, 1
  store i64 %579, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 185)
  %580 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %581 = load i8*, i8** %31, align 8
  %582 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %580, i8* %581)
  br label %583

; <label>:583:                                    ; preds = %578, %571
  %pgocount77 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 181)
  %584 = add i64 %pgocount77, 1
  store i64 %584, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 181)
  %585 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %586 = call i8* @LANG(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.22, i32 0, i32 0))
  %587 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %585, i8* %586)
  call void @exit(i32 5) #9
  unreachable

; <label>:588:                                    ; preds = %563
  br label %606

; <label>:589:                                    ; preds = %532
  %590 = load i8, i8* @filter_mode, align 1
  %591 = icmp ne i8 %590, 0
  br i1 %591, label %592, label %596

; <label>:592:                                    ; preds = %589
  %pgocount78 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 62)
  %593 = add i64 %pgocount78, 1
  store i64 %593, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 62)
  %594 = load i8**, i8*** @myArgv, align 8
  %595 = getelementptr inbounds i8*, i8** %594, i64 2
  store i8** %595, i8*** %12, align 8
  br label %603

; <label>:596:                                    ; preds = %589
  %pgocount79 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 107)
  %597 = add i64 %pgocount79, 1
  store i64 %597, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 107)
  %598 = load i8**, i8*** @myArgv, align 8
  %599 = getelementptr inbounds i8*, i8** %598, i64 2
  %600 = load i8*, i8** %599, align 8
  store i8* %600, i8** %11, align 8
  %601 = load i8**, i8*** @myArgv, align 8
  %602 = getelementptr inbounds i8*, i8** %601, i64 3
  store i8** %602, i8*** %12, align 8
  br label %603

; <label>:603:                                    ; preds = %596, %592
  %604 = load i8**, i8*** %12, align 8
  %605 = call i8** @ParseRecipients(i8** %604)
  store i8** %605, i8*** %12, align 8
  br label %606

; <label>:606:                                    ; preds = %603, %588
  %607 = load i8, i8* @filter_mode, align 1
  %608 = icmp ne i8 %607, 0
  br i1 %608, label %609, label %610

; <label>:609:                                    ; preds = %606
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.23, i32 0, i32 0), i8** %11, align 8
  br label %690

; <label>:610:                                    ; preds = %606
  %611 = load i32, i32* @makerandom, align 4
  %612 = icmp sgt i32 %611, 0
  br i1 %612, label %613, label %636

; <label>:613:                                    ; preds = %610
  %pgocount80 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 88)
  %614 = add i64 %pgocount80, 1
  store i64 %614, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 88)
  %615 = load i8*, i8** %11, align 8
  %616 = load i32, i32* @makerandom, align 4
  %617 = call i32 @cryptRandWriteFile(i8* %615, %struct.IdeaCfbContext* null, i32 %616)
  store i32 %617, i32* %9, align 4
  %618 = load i32, i32* %9, align 4
  %619 = icmp slt i32 %618, 0
  br i1 %619, label %620, label %625

; <label>:620:                                    ; preds = %613
  %pgocount81 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 131)
  %621 = add i64 %pgocount81, 1
  store i64 %621, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 131)
  %622 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %623 = load i8*, i8** %11, align 8
  %624 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %622, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.24, i32 0, i32 0), i8* %623)
  call void @exitPGP(i32 1)
  br label %625

; <label>:625:                                    ; preds = %620, %613
  %626 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %627 = call i8* @LANG(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.25, i32 0, i32 0))
  %628 = load i8*, i8** %11, align 8
  %629 = load i32, i32* @makerandom, align 4
  %630 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %626, i8* %627, i8* %628, i32 %629)
  %631 = load i8, i8* %17, align 1
  %632 = icmp ne i8 %631, 0
  br i1 %632, label %633, label %635

; <label>:633:                                    ; preds = %625
  %pgocount82 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 113)
  %634 = add i64 %pgocount82, 1
  store i64 %634, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 113)
  call void @exitPGP(i32 0)
  br label %635

; <label>:635:                                    ; preds = %633, %625
  store i8 98, i8* @literal_mode, align 1
  br label %689

; <label>:636:                                    ; preds = %610
  %637 = load i8, i8* %17, align 1
  %638 = zext i8 %637 to i32
  %639 = icmp ne i32 %638, 0
  br i1 %639, label %640, label %677

; <label>:640:                                    ; preds = %636
  %pgocount83 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 132)
  %641 = add i64 %pgocount83, 1
  store i64 %641, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 132)
  %642 = load i8*, i8** %11, align 8
  %643 = call zeroext i8 @no_extension(i8* %642)
  %644 = zext i8 %643 to i32
  %645 = icmp ne i32 %644, 0
  br i1 %645, label %646, label %677

; <label>:646:                                    ; preds = %640
  %647 = getelementptr inbounds [256 x i8], [256 x i8]* %29, i32 0, i32 0
  %648 = load i8*, i8** %11, align 8
  %649 = call i8* @strcpy(i8* %647, i8* %648) #7
  %650 = getelementptr inbounds [256 x i8], [256 x i8]* %29, i32 0, i32 0
  call void @force_extension(i8* %650, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @ASC_EXTENSION, i32 0, i32 0))
  %651 = getelementptr inbounds [256 x i8], [256 x i8]* %29, i32 0, i32 0
  %652 = call zeroext i8 @file_exists(i8* %651)
  %653 = icmp ne i8 %652, 0
  br i1 %653, label %654, label %657

; <label>:654:                                    ; preds = %646
  %pgocount84 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 152)
  %655 = add i64 %pgocount84, 1
  store i64 %655, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 152)
  %656 = getelementptr inbounds [256 x i8], [256 x i8]* %29, i32 0, i32 0
  store i8* %656, i8** %11, align 8
  br label %676

; <label>:657:                                    ; preds = %646
  %658 = getelementptr inbounds [256 x i8], [256 x i8]* %29, i32 0, i32 0
  call void @force_extension(i8* %658, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  %659 = getelementptr inbounds [256 x i8], [256 x i8]* %29, i32 0, i32 0
  %660 = call zeroext i8 @file_exists(i8* %659)
  %661 = icmp ne i8 %660, 0
  br i1 %661, label %662, label %665

; <label>:662:                                    ; preds = %657
  %pgocount85 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 165)
  %663 = add i64 %pgocount85, 1
  store i64 %663, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 165)
  %664 = getelementptr inbounds [256 x i8], [256 x i8]* %29, i32 0, i32 0
  store i8* %664, i8** %11, align 8
  br label %675

; <label>:665:                                    ; preds = %657
  %666 = getelementptr inbounds [256 x i8], [256 x i8]* %29, i32 0, i32 0
  call void @force_extension(i8* %666, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @SIG_EXTENSION, i32 0, i32 0))
  %667 = getelementptr inbounds [256 x i8], [256 x i8]* %29, i32 0, i32 0
  %668 = call zeroext i8 @file_exists(i8* %667)
  %669 = icmp ne i8 %668, 0
  br i1 %669, label %670, label %673

; <label>:670:                                    ; preds = %665
  %pgocount86 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 174)
  %671 = add i64 %pgocount86, 1
  store i64 %671, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 174)
  %672 = getelementptr inbounds [256 x i8], [256 x i8]* %29, i32 0, i32 0
  store i8* %672, i8** %11, align 8
  br label %673

; <label>:673:                                    ; preds = %670, %665
  %pgocount87 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 170)
  %674 = add i64 %pgocount87, 1
  store i64 %674, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 170)
  br label %675

; <label>:675:                                    ; preds = %673, %662
  br label %676

; <label>:676:                                    ; preds = %675, %654
  br label %677

; <label>:677:                                    ; preds = %676, %640, %636
  %678 = load i8*, i8** %11, align 8
  %679 = call zeroext i8 @file_exists(i8* %678)
  %680 = icmp ne i8 %679, 0
  br i1 %680, label %687, label %681

; <label>:681:                                    ; preds = %677
  %pgocount88 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 146)
  %682 = add i64 %pgocount88, 1
  store i64 %682, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 146)
  %683 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %684 = call i8* @LANG(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.19, i32 0, i32 0))
  %685 = load i8*, i8** %11, align 8
  %686 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %683, i8* %684, i8* %685)
  store i32 2, i32* @errorLvl, align 4
  call void @user_error()
  br label %687

; <label>:687:                                    ; preds = %681, %677
  %pgocount89 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 119)
  %688 = add i64 %pgocount89, 1
  store i64 %688, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 119)
  br label %689

; <label>:689:                                    ; preds = %687, %635
  br label %690

; <label>:690:                                    ; preds = %689, %609
  %691 = load i8*, i8** %11, align 8
  %692 = call i64 @strlen(i8* %691) #8
  %693 = icmp uge i64 %692, 252
  br i1 %693, label %694, label %700

; <label>:694:                                    ; preds = %690
  %pgocount90 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 41)
  %695 = add i64 %pgocount90, 1
  store i64 %695, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 41)
  %696 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %697 = call i8* @LANG(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.26, i32 0, i32 0))
  %698 = load i8*, i8** %11, align 8
  %699 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %696, i8* %697, i8* %698)
  store i32 1, i32* @errorLvl, align 4
  call void @user_error()
  br label %700

; <label>:700:                                    ; preds = %694, %690
  %701 = load i8*, i8** %11, align 8
  %702 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0), i8* %701) #7
  %703 = load i8, i8* @filter_mode, align 1
  %704 = icmp ne i8 %703, 0
  br i1 %704, label %705, label %706

; <label>:705:                                    ; preds = %700
  call void @setoutdir(i8* null)
  br label %716

; <label>:706:                                    ; preds = %700
  %707 = load i8*, i8** @outputfile, align 8
  %708 = icmp ne i8* %707, null
  br i1 %708, label %709, label %712

; <label>:709:                                    ; preds = %706
  %pgocount91 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 89)
  %710 = add i64 %pgocount91, 1
  store i64 %710, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 89)
  %711 = load i8*, i8** @outputfile, align 8
  call void @setoutdir(i8* %711)
  br label %715

; <label>:712:                                    ; preds = %706
  %pgocount92 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 120)
  %713 = add i64 %pgocount92, 1
  store i64 %713, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 120)
  %714 = load i8*, i8** %11, align 8
  call void @setoutdir(i8* %714)
  br label %715

; <label>:715:                                    ; preds = %712, %709
  br label %716

; <label>:716:                                    ; preds = %715, %705
  %717 = load i8, i8* @filter_mode, align 1
  %718 = icmp ne i8 %717, 0
  br i1 %718, label %719, label %723

; <label>:719:                                    ; preds = %716
  %720 = call i8* @tempfile(i32 5)
  store i8* %720, i8** %14, align 8
  %721 = load i8*, i8** %14, align 8
  %722 = call i32 @readPhantomInput(i8* %721)
  br label %726

; <label>:723:                                    ; preds = %716
  %pgocount93 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 56)
  %724 = add i64 %pgocount93, 1
  store i64 %724, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 56)
  %725 = load i8*, i8** %11, align 8
  store i8* %725, i8** %14, align 8
  br label %726

; <label>:726:                                    ; preds = %723, %719
  %727 = load i8*, i8** %14, align 8
  %728 = call i32 @get_header_info_from_file(i8* %727, i8* %32, i32 1)
  %729 = load i8, i8* %17, align 1
  %730 = icmp ne i8 %729, 0
  br i1 %730, label %731, label %782

; <label>:731:                                    ; preds = %726
  store i8 0, i8* @strip_spaces, align 1
  %732 = load i8, i8* %32, align 1
  %733 = zext i8 %732 to i32
  %734 = and i32 %733, 128
  %735 = icmp eq i32 %734, 128
  br i1 %735, label %745, label %736

; <label>:736:                                    ; preds = %731
  %pgocount94 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 63)
  %737 = add i64 %pgocount94, 1
  store i64 %737, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 63)
  %738 = load i8*, i8** %14, align 8
  %739 = call zeroext i8 @is_armor_file(i8* %738, i64 0)
  %740 = zext i8 %739 to i32
  %741 = icmp ne i32 %740, 0
  br i1 %741, label %742, label %745

; <label>:742:                                    ; preds = %736
  %pgocount95 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 104)
  %743 = add i64 %pgocount95, 1
  store i64 %743, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 104)
  %744 = load i8*, i8** %14, align 8
  call void @do_armorfile(i8* %744)
  br label %770

; <label>:745:                                    ; preds = %736, %731
  %746 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.28, i32 0, i32 0))
  store %struct._IO_FILE* %746, %struct._IO_FILE** %6, align 8
  %747 = icmp eq %struct._IO_FILE* %746, null
  br i1 %747, label %748, label %752

; <label>:748:                                    ; preds = %745
  %pgocount96 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 182)
  %749 = add i64 %pgocount96, 1
  store i64 %749, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 182)
  %750 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %751 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %750, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.29, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

; <label>:752:                                    ; preds = %745
  %753 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %754 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %753, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.30, i32 0, i32 0), i64* %8)
  %755 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %756 = call i32 @fclose(%struct._IO_FILE* %755)
  store i64 0, i64* %7, align 8
  br label %757

; <label>:757:                                    ; preds = %764, %752
  %758 = load i64, i64* %7, align 8
  %759 = load i64, i64* %8, align 8
  %760 = icmp slt i64 %758, %759
  br i1 %760, label %761, label %768

; <label>:761:                                    ; preds = %757
  %762 = load i8*, i8** %14, align 8
  %763 = call i32 @do_decrypt(i8* %762)
  br label %764

; <label>:764:                                    ; preds = %761
  %pgocount97 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 4)
  %765 = add i64 %pgocount97, 1
  store i64 %765, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 4)
  %766 = load i64, i64* %7, align 8
  %767 = add nsw i64 %766, 1
  store i64 %767, i64* %7, align 8
  br label %757

; <label>:768:                                    ; preds = %757
  %pgocount98 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 43)
  %769 = add i64 %pgocount98, 1
  store i64 %769, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 43)
  br label %770

; <label>:770:                                    ; preds = %768, %742
  %771 = load i8, i8* @batchmode, align 1
  %772 = zext i8 %771 to i32
  %773 = icmp ne i32 %772, 0
  br i1 %773, label %774, label %780

; <label>:774:                                    ; preds = %770
  %pgocount99 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 49)
  %775 = add i64 %pgocount99, 1
  store i64 %775, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 49)
  %776 = load i8, i8* @signature_checked, align 1
  %777 = icmp ne i8 %776, 0
  br i1 %777, label %780, label %778

; <label>:778:                                    ; preds = %774
  %pgocount100 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 114)
  %779 = add i64 %pgocount100, 1
  store i64 %779, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 114)
  call void @exitPGP(i32 1)
  br label %781

; <label>:780:                                    ; preds = %774, %770
  call void @exitPGP(i32 0)
  br label %781

; <label>:781:                                    ; preds = %780, %778
  br label %782

; <label>:782:                                    ; preds = %781, %726
  %783 = load i8, i8* @batchmode, align 1
  %784 = icmp ne i8 %783, 0
  br i1 %784, label %805, label %785

; <label>:785:                                    ; preds = %782
  %pgocount101 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 58)
  %786 = add i64 %pgocount101, 1
  store i64 %786, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 58)
  %787 = load i8, i8* @filter_mode, align 1
  %788 = icmp ne i8 %787, 0
  br i1 %788, label %805, label %789

; <label>:789:                                    ; preds = %785
  %pgocount102 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 121)
  %790 = add i64 %pgocount102, 1
  store i64 %790, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 121)
  %791 = load i8, i8* %32, align 1
  %792 = call zeroext i8 @legal_ctb(i8 zeroext %791)
  %793 = zext i8 %792 to i32
  %794 = icmp ne i32 %793, 0
  br i1 %794, label %795, label %805

; <label>:795:                                    ; preds = %789
  %pgocount103 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 137)
  %796 = add i64 %pgocount103, 1
  store i64 %796, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 137)
  %797 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %798 = call i8* @LANG(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.31, i32 0, i32 0))
  %799 = load i8*, i8** %11, align 8
  %800 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %797, i8* %798, i8* %799)
  %801 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %802 = call i8* @LANG(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.32, i32 0, i32 0))
  %803 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %801, i8* %802)
  %804 = call zeroext i8 @getyesno(i8 signext 110)
  store i8 %804, i8* %16, align 1
  br label %822

; <label>:805:                                    ; preds = %789, %785, %782
  %806 = load i8, i8* @force_flag, align 1
  %807 = zext i8 %806 to i32
  %808 = icmp ne i32 %807, 0
  br i1 %808, label %809, label %821

; <label>:809:                                    ; preds = %805
  %pgocount104 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 39)
  %810 = add i64 %pgocount104, 1
  store i64 %810, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 39)
  %811 = load i32, i32* @makerandom, align 4
  %812 = icmp eq i32 %811, 0
  br i1 %812, label %813, label %821

; <label>:813:                                    ; preds = %809
  %pgocount105 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 102)
  %814 = add i64 %pgocount105, 1
  store i64 %814, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 102)
  %815 = load i8, i8* %32, align 1
  %816 = call zeroext i8 @legal_ctb(i8 zeroext %815)
  %817 = zext i8 %816 to i32
  %818 = icmp ne i32 %817, 0
  br i1 %818, label %819, label %821

; <label>:819:                                    ; preds = %813
  %pgocount106 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 125)
  %820 = add i64 %pgocount106, 1
  store i64 %820, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 125)
  store i8 1, i8* %16, align 1
  br label %821

; <label>:821:                                    ; preds = %819, %813, %809, %805
  br label %822

; <label>:822:                                    ; preds = %821, %795
  %823 = load i8, i8* @moreflag, align 1
  %824 = zext i8 %823 to i32
  %825 = icmp ne i32 %824, 0
  br i1 %825, label %826, label %834

; <label>:826:                                    ; preds = %822
  %pgocount107 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 35)
  %827 = add i64 %pgocount107, 1
  store i64 %827, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 35)
  %828 = load i32, i32* @makerandom, align 4
  %829 = icmp eq i32 %828, 0
  br i1 %829, label %830, label %834

; <label>:830:                                    ; preds = %826
  %pgocount108 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 90)
  %831 = add i64 %pgocount108, 1
  store i64 %831, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 90)
  %832 = getelementptr inbounds [256 x i8], [256 x i8]* %28, i32 0, i32 0
  %833 = call i8* @strcpy(i8* %832, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @CONSOLE_FILENAME, i32 0, i32 0)) #7
  store i8 116, i8* @literal_mode, align 1
  br label %839

; <label>:834:                                    ; preds = %826, %822
  %835 = getelementptr inbounds [256 x i8], [256 x i8]* %28, i32 0, i32 0
  %836 = load i8*, i8** %11, align 8
  %837 = call i8* @file_tail(i8* %836)
  %838 = call i8* @strcpy(i8* %835, i8* %837) #7
  br label %839

; <label>:839:                                    ; preds = %834, %830
  %840 = getelementptr inbounds [256 x i8], [256 x i8]* %28, i32 0, i32 0
  store i8* %840, i8** %27, align 8
  %841 = load i8, i8* @literal_mode, align 1
  %842 = sext i8 %841 to i32
  %843 = icmp eq i32 %842, 116
  br i1 %843, label %844, label %855

; <label>:844:                                    ; preds = %839
  %pgocount109 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 42)
  %845 = add i64 %pgocount109, 1
  store i64 %845, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 42)
  %846 = load i8*, i8** %14, align 8
  %847 = call i32 @is_text_file(i8* %846)
  %848 = icmp ne i32 %847, 0
  br i1 %848, label %855, label %849

; <label>:849:                                    ; preds = %844
  %pgocount110 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 108)
  %850 = add i64 %pgocount110, 1
  store i64 %850, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 108)
  %851 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %852 = call i8* @LANG(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.33, i32 0, i32 0))
  %853 = load i8*, i8** %14, align 8
  %854 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %851, i8* %852, i8* %853)
  store i8 98, i8* @literal_mode, align 1
  br label %855

; <label>:855:                                    ; preds = %849, %844, %839
  %856 = load i8, i8* @moreflag, align 1
  %857 = zext i8 %856 to i32
  %858 = icmp ne i32 %857, 0
  br i1 %858, label %859, label %869

; <label>:859:                                    ; preds = %855
  %pgocount111 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 36)
  %860 = add i64 %pgocount111, 1
  store i64 %860, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 36)
  %861 = load i8, i8* @literal_mode, align 1
  %862 = sext i8 %861 to i32
  %863 = icmp eq i32 %862, 98
  br i1 %863, label %864, label %869

; <label>:864:                                    ; preds = %859
  %pgocount112 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 64)
  %865 = add i64 %pgocount112, 1
  store i64 %865, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 64)
  %866 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %867 = call i8* @LANG(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.34, i32 0, i32 0))
  %868 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %866, i8* %867)
  store i32 1, i32* @errorLvl, align 4
  call void @user_error()
  br label %869

; <label>:869:                                    ; preds = %864, %859, %855
  %870 = load i8, i8* @compress_enabled, align 1
  %871 = zext i8 %870 to i32
  %872 = icmp ne i32 %871, 0
  br i1 %872, label %873, label %894

; <label>:873:                                    ; preds = %869
  %pgocount113 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 37)
  %874 = add i64 %pgocount113, 1
  store i64 %874, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 37)
  %875 = load i8, i8* %20, align 1
  %876 = icmp ne i8 %875, 0
  br i1 %876, label %894, label %877

; <label>:877:                                    ; preds = %873
  %pgocount114 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 91)
  %878 = add i64 %pgocount114, 1
  store i64 %878, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 91)
  %879 = load i8, i8* %16, align 1
  %880 = icmp ne i8 %879, 0
  br i1 %880, label %894, label %881

; <label>:881:                                    ; preds = %877
  %pgocount115 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 133)
  %882 = add i64 %pgocount115, 1
  store i64 %882, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 133)
  %883 = load i8*, i8** %26, align 8
  %884 = icmp ne i8* %883, null
  br i1 %884, label %894, label %885

; <label>:885:                                    ; preds = %881
  %pgocount116 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 153)
  %886 = add i64 %pgocount116, 1
  store i64 %886, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 153)
  %887 = load i32, i32* @makerandom, align 4
  %888 = icmp eq i32 %887, 0
  br i1 %888, label %889, label %894

; <label>:889:                                    ; preds = %885
  %pgocount117 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 166)
  %890 = add i64 %pgocount117, 1
  store i64 %890, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 166)
  %891 = call zeroext i8 @file_compressible(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0))
  %892 = zext i8 %891 to i32
  %893 = icmp ne i32 %892, 0
  br label %894

; <label>:894:                                    ; preds = %889, %885, %881, %877, %873, %869
  %895 = phi i1 [ false, %885 ], [ false, %881 ], [ false, %877 ], [ false, %873 ], [ false, %869 ], [ %893, %889 ]
  %896 = zext i1 %895 to i32
  %897 = trunc i32 %896 to i8
  store i8 %897, i8* %24, align 1
  %898 = load i8, i8* @sign_flag, align 1
  %899 = icmp ne i8 %898, 0
  br i1 %899, label %900, label %1035

; <label>:900:                                    ; preds = %894
  %901 = load i8, i8* @filter_mode, align 1
  %902 = icmp ne i8 %901, 0
  br i1 %902, label %912, label %903

; <label>:903:                                    ; preds = %900
  %pgocount118 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 92)
  %904 = add i64 %pgocount118, 1
  store i64 %904, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 92)
  %905 = load i8, i8* @quietmode, align 1
  %906 = icmp ne i8 %905, 0
  br i1 %906, label %912, label %907

; <label>:907:                                    ; preds = %903
  %pgocount119 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 134)
  %908 = add i64 %pgocount119, 1
  store i64 %908, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 134)
  %909 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %910 = call i8* @LANG(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.35, i32 0, i32 0))
  %911 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %909, i8* %910)
  br label %912

; <label>:912:                                    ; preds = %907, %903, %900
  %913 = load i8, i8* @quietmode, align 1
  %914 = icmp ne i8 %913, 0
  br i1 %914, label %925, label %915

; <label>:915:                                    ; preds = %912
  %pgocount120 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 93)
  %916 = add i64 %pgocount120, 1
  store i64 %916, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 93)
  %917 = load i8, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @my_name, i64 0, i64 0), align 16
  %918 = sext i8 %917 to i32
  %919 = icmp eq i32 %918, 0
  br i1 %919, label %920, label %925

; <label>:920:                                    ; preds = %915
  %pgocount121 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 135)
  %921 = add i64 %pgocount121, 1
  store i64 %921, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 135)
  %922 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %923 = call i8* @LANG(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @.str.36, i32 0, i32 0))
  %924 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %922, i8* %923)
  br label %925

; <label>:925:                                    ; preds = %920, %915, %912
  store i8 0, i8* @strip_spaces, align 1
  store i8* null, i8** %26, align 8
  %926 = load i8, i8* @literal_mode, align 1
  %927 = sext i8 %926 to i32
  %928 = icmp eq i32 %927, 116
  br i1 %928, label %929, label %962

; <label>:929:                                    ; preds = %925
  %930 = call i8* @tempfile(i32 5)
  store i8* %930, i8** %15, align 8
  %931 = load i8, i8* %22, align 1
  %932 = icmp ne i8 %931, 0
  br i1 %932, label %950, label %933

; <label>:933:                                    ; preds = %929
  %pgocount122 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 126)
  %934 = add i64 %pgocount122, 1
  store i64 %934, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 126)
  %935 = load i8, i8* %20, align 1
  %936 = icmp ne i8 %935, 0
  br i1 %936, label %950, label %937

; <label>:937:                                    ; preds = %933
  %pgocount123 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 150)
  %938 = add i64 %pgocount123, 1
  store i64 %938, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 150)
  %939 = load i8, i8* @emit_radix_64, align 1
  %940 = zext i8 %939 to i32
  %941 = icmp ne i32 %940, 0
  br i1 %941, label %942, label %950

; <label>:942:                                    ; preds = %937
  %pgocount124 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 158)
  %943 = add i64 %pgocount124, 1
  store i64 %943, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 158)
  %944 = load i8, i8* @clear_signatures, align 1
  %945 = zext i8 %944 to i32
  %946 = icmp ne i32 %945, 0
  br i1 %946, label %947, label %950

; <label>:947:                                    ; preds = %942
  %pgocount125 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 163)
  %948 = add i64 %pgocount125, 1
  store i64 %948, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 163)
  %949 = load i8*, i8** %14, align 8
  store i8* %949, i8** %26, align 8
  store i8 1, i8* @strip_spaces, align 1
  br label %950

; <label>:950:                                    ; preds = %947, %942, %937, %933, %929
  %951 = load i8*, i8** %14, align 8
  %952 = load i8*, i8** %15, align 8
  %953 = call i32 @make_canonical(i8* %951, i8* %952)
  %954 = load i8*, i8** %26, align 8
  %955 = icmp ne i8* %954, null
  br i1 %955, label %959, label %956

; <label>:956:                                    ; preds = %950
  %pgocount126 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 127)
  %957 = add i64 %pgocount126, 1
  store i64 %957, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 127)
  %958 = load i8*, i8** %14, align 8
  call void @rmtemp(i8* %958)
  br label %959

; <label>:959:                                    ; preds = %956, %950
  %pgocount127 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 65)
  %960 = add i64 %pgocount127, 1
  store i64 %960, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 65)
  %961 = load i8*, i8** %15, align 8
  store i8* %961, i8** %14, align 8
  br label %962

; <label>:962:                                    ; preds = %959, %925
  %963 = load i8, i8* %24, align 1
  %964 = zext i8 %963 to i32
  %965 = icmp ne i32 %964, 0
  br i1 %965, label %981, label %966

; <label>:966:                                    ; preds = %962
  %pgocount128 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 94)
  %967 = add i64 %pgocount128, 1
  store i64 %967, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 94)
  %968 = load i8, i8* %22, align 1
  %969 = zext i8 %968 to i32
  %970 = icmp ne i32 %969, 0
  br i1 %970, label %981, label %971

; <label>:971:                                    ; preds = %966
  %pgocount129 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 136)
  %972 = add i64 %pgocount129, 1
  store i64 %972, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 136)
  %973 = load i8, i8* @emit_radix_64, align 1
  %974 = zext i8 %973 to i32
  %975 = icmp ne i32 %974, 0
  br i1 %975, label %981, label %976

; <label>:976:                                    ; preds = %971
  %pgocount130 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 154)
  %977 = add i64 %pgocount130, 1
  store i64 %977, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 154)
  %978 = load i8, i8* %25, align 1
  %979 = zext i8 %978 to i32
  %980 = icmp ne i32 %979, 0
  br i1 %980, label %981, label %983

; <label>:981:                                    ; preds = %976, %971, %966, %962
  %982 = call i8* @tempfile(i32 5)
  store i8* %982, i8** %15, align 8
  br label %986

; <label>:983:                                    ; preds = %976
  %pgocount131 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 167)
  %984 = add i64 %pgocount131, 1
  store i64 %984, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 167)
  %985 = call i8* @tempfile(i32 1)
  store i8* %985, i8** %15, align 8
  br label %986

; <label>:986:                                    ; preds = %983, %981
  %987 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.28, i32 0, i32 0))
  store %struct._IO_FILE* %987, %struct._IO_FILE** %6, align 8
  %988 = icmp eq %struct._IO_FILE* %987, null
  br i1 %988, label %989, label %993

; <label>:989:                                    ; preds = %986
  %pgocount132 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 180)
  %990 = add i64 %pgocount132, 1
  store i64 %990, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 180)
  %991 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %992 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %991, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.29, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

; <label>:993:                                    ; preds = %986
  %994 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %995 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %994, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.30, i32 0, i32 0), i64* %8)
  %996 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %997 = call i32 @fclose(%struct._IO_FILE* %996)
  store i64 0, i64* %7, align 8
  br label %998

; <label>:998:                                    ; preds = %1020, %993
  %999 = load i64, i64* %7, align 8
  %1000 = load i64, i64* %8, align 8
  %1001 = icmp slt i64 %999, %1000
  br i1 %1001, label %1002, label %1024

; <label>:1002:                                   ; preds = %998
  %1003 = load i8, i8* %16, align 1
  %1004 = load i8, i8* %20, align 1
  %1005 = zext i8 %1004 to i32
  %1006 = icmp ne i32 %1005, 0
  br i1 %1006, label %1011, label %1007

; <label>:1007:                                   ; preds = %1002
  %pgocount133 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 9)
  %1008 = add i64 %pgocount133, 1
  store i64 %1008, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 9)
  %1009 = load i8*, i8** %26, align 8
  %1010 = icmp ne i8* %1009, null
  br label %1011

; <label>:1011:                                   ; preds = %1007, %1002
  %1012 = phi i1 [ true, %1002 ], [ %1010, %1007 ]
  %1013 = zext i1 %1012 to i32
  %1014 = trunc i32 %1013 to i8
  %1015 = load i8*, i8** %14, align 8
  %1016 = load i8*, i8** %15, align 8
  %1017 = load i8, i8* @literal_mode, align 1
  %1018 = load i8*, i8** %27, align 8
  %1019 = call i32 @signfile(i8 zeroext %1003, i8 zeroext %1014, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @my_name, i32 0, i32 0), i8* %1015, i8* %1016, i8 signext %1017, i8* %1018)
  store i32 %1019, i32* %9, align 4
  br label %1020

; <label>:1020:                                   ; preds = %1011
  %pgocount134 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 2)
  %1021 = add i64 %pgocount134, 1
  store i64 %1021, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 2)
  %1022 = load i64, i64* %7, align 8
  %1023 = add nsw i64 %1022, 1
  store i64 %1023, i64* %7, align 8
  br label %998

; <label>:1024:                                   ; preds = %998
  %1025 = load i8*, i8** %14, align 8
  call void @rmtemp(i8* %1025)
  %1026 = load i8*, i8** %15, align 8
  store i8* %1026, i8** %14, align 8
  %1027 = load i32, i32* %9, align 4
  %1028 = icmp slt i32 %1027, 0
  br i1 %1028, label %1029, label %1034

; <label>:1029:                                   ; preds = %1024
  %pgocount135 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 101)
  %1030 = add i64 %pgocount135, 1
  store i64 %1030, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 101)
  %1031 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %1032 = call i8* @LANG(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.37, i32 0, i32 0))
  %1033 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1031, i8* %1032)
  store i32 20, i32* @errorLvl, align 4
  call void @user_error()
  br label %1034

; <label>:1034:                                   ; preds = %1029, %1024
  br label %1073

; <label>:1035:                                   ; preds = %894
  %1036 = load i8, i8* %16, align 1
  %1037 = icmp ne i8 %1036, 0
  br i1 %1037, label %1071, label %1038

; <label>:1038:                                   ; preds = %1035
  %1039 = load i8, i8* %24, align 1
  %1040 = zext i8 %1039 to i32
  %1041 = icmp ne i32 %1040, 0
  br i1 %1041, label %1057, label %1042

; <label>:1042:                                   ; preds = %1038
  %pgocount136 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 147)
  %1043 = add i64 %pgocount136, 1
  store i64 %1043, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 147)
  %1044 = load i8, i8* %22, align 1
  %1045 = zext i8 %1044 to i32
  %1046 = icmp ne i32 %1045, 0
  br i1 %1046, label %1057, label %1047

; <label>:1047:                                   ; preds = %1042
  %pgocount137 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 161)
  %1048 = add i64 %pgocount137, 1
  store i64 %1048, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 161)
  %1049 = load i8, i8* @emit_radix_64, align 1
  %1050 = zext i8 %1049 to i32
  %1051 = icmp ne i32 %1050, 0
  br i1 %1051, label %1057, label %1052

; <label>:1052:                                   ; preds = %1047
  %pgocount138 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 171)
  %1053 = add i64 %pgocount138, 1
  store i64 %1053, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 171)
  %1054 = load i8, i8* %25, align 1
  %1055 = zext i8 %1054 to i32
  %1056 = icmp ne i32 %1055, 0
  br i1 %1056, label %1057, label %1060

; <label>:1057:                                   ; preds = %1052, %1047, %1042, %1038
  %pgocount139 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 124)
  %1058 = add i64 %pgocount139, 1
  store i64 %1058, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 124)
  %1059 = call i8* @tempfile(i32 5)
  store i8* %1059, i8** %15, align 8
  br label %1063

; <label>:1060:                                   ; preds = %1052
  %pgocount140 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 178)
  %1061 = add i64 %pgocount140, 1
  store i64 %1061, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 178)
  %1062 = call i8* @tempfile(i32 1)
  store i8* %1062, i8** %15, align 8
  br label %1063

; <label>:1063:                                   ; preds = %1060, %1057
  %1064 = load i8*, i8** %14, align 8
  %1065 = load i8*, i8** %15, align 8
  %1066 = load i8, i8* @literal_mode, align 1
  %1067 = load i8*, i8** %27, align 8
  %1068 = call i32 @make_literal(i8* %1064, i8* %1065, i8 signext %1066, i8* %1067)
  store i32 %1068, i32* %9, align 4
  %1069 = load i8*, i8** %14, align 8
  call void @rmtemp(i8* %1069)
  %1070 = load i8*, i8** %15, align 8
  store i8* %1070, i8** %14, align 8
  br label %1071

; <label>:1071:                                   ; preds = %1063, %1035
  %pgocount141 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 59)
  %1072 = add i64 %pgocount141, 1
  store i64 %1072, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 59)
  br label %1073

; <label>:1073:                                   ; preds = %1071, %1034
  %1074 = load i8, i8* %22, align 1
  %1075 = icmp ne i8 %1074, 0
  br i1 %1075, label %1076, label %1193

; <label>:1076:                                   ; preds = %1073
  %1077 = load i8, i8* @emit_radix_64, align 1
  %1078 = zext i8 %1077 to i32
  %1079 = icmp ne i32 %1078, 0
  br i1 %1079, label %1085, label %1080

; <label>:1080:                                   ; preds = %1076
  %pgocount142 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 95)
  %1081 = add i64 %pgocount142, 1
  store i64 %1081, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 95)
  %1082 = load i8, i8* %25, align 1
  %1083 = zext i8 %1082 to i32
  %1084 = icmp ne i32 %1083, 0
  br i1 %1084, label %1085, label %1087

; <label>:1085:                                   ; preds = %1080, %1076
  %1086 = call i8* @tempfile(i32 5)
  store i8* %1086, i8** %15, align 8
  br label %1090

; <label>:1087:                                   ; preds = %1080
  %pgocount143 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 138)
  %1088 = add i64 %pgocount143, 1
  store i64 %1088, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 138)
  %1089 = call i8* @tempfile(i32 1)
  store i8* %1089, i8** %15, align 8
  br label %1090

; <label>:1090:                                   ; preds = %1087, %1085
  %1091 = load i8, i8* %23, align 1
  %1092 = icmp ne i8 %1091, 0
  br i1 %1092, label %1171, label %1093

; <label>:1093:                                   ; preds = %1090
  %1094 = load i8, i8* @filter_mode, align 1
  %1095 = icmp ne i8 %1094, 0
  br i1 %1095, label %1105, label %1096

; <label>:1096:                                   ; preds = %1093
  %pgocount144 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 139)
  %1097 = add i64 %pgocount144, 1
  store i64 %1097, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 139)
  %1098 = load i8, i8* @quietmode, align 1
  %1099 = icmp ne i8 %1098, 0
  br i1 %1099, label %1105, label %1100

; <label>:1100:                                   ; preds = %1096
  %pgocount145 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 155)
  %1101 = add i64 %pgocount145, 1
  store i64 %1101, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 155)
  %1102 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %1103 = call i8* @LANG(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.38, i32 0, i32 0))
  %1104 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1102, i8* %1103)
  br label %1105

; <label>:1105:                                   ; preds = %1100, %1096, %1093
  %1106 = load i8**, i8*** %12, align 8
  %1107 = icmp eq i8** %1106, null
  br i1 %1107, label %1120, label %1108

; <label>:1108:                                   ; preds = %1105
  %pgocount146 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 115)
  %1109 = add i64 %pgocount146, 1
  store i64 %1109, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 115)
  %1110 = load i8**, i8*** %12, align 8
  %1111 = load i8*, i8** %1110, align 8
  %1112 = icmp eq i8* %1111, null
  br i1 %1112, label %1120, label %1113

; <label>:1113:                                   ; preds = %1108
  %pgocount147 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 129)
  %1114 = add i64 %pgocount147, 1
  store i64 %1114, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 129)
  %1115 = load i8**, i8*** %12, align 8
  %1116 = load i8*, i8** %1115, align 8
  %1117 = load i8, i8* %1116, align 1
  %1118 = sext i8 %1117 to i32
  %1119 = icmp eq i32 %1118, 0
  br i1 %1119, label %1120, label %1142

; <label>:1120:                                   ; preds = %1113, %1108, %1105
  %1121 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %1122 = call i8* @LANG(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.39, i32 0, i32 0))
  %1123 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1121, i8* %1122)
  %1124 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %1125 = call i8* @LANG(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.40, i32 0, i32 0))
  %1126 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1124, i8* %1125)
  %1127 = call i32 @getstring(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i32 255, i32 1)
  %1128 = call i8* (i64, ...) bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 16)
  %1129 = bitcast i8* %1128 to i8**
  store i8** %1129, i8*** %13, align 8
  %1130 = icmp eq i8** %1129, null
  br i1 %1130, label %1131, label %1136

; <label>:1131:                                   ; preds = %1120
  %pgocount148 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 143)
  %1132 = add i64 %pgocount148, 1
  store i64 %1132, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 143)
  %1133 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1134 = call i8* @LANG(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.11, i32 0, i32 0))
  %1135 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1133, i8* %1134)
  call void @exitPGP(i32 7)
  br label %1136

; <label>:1136:                                   ; preds = %1131, %1120
  %pgocount149 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 109)
  %1137 = add i64 %pgocount149, 1
  store i64 %1137, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 109)
  %1138 = load i8**, i8*** %13, align 8
  %1139 = getelementptr inbounds i8*, i8** %1138, i64 0
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8** %1139, align 8
  %1140 = load i8**, i8*** %13, align 8
  %1141 = getelementptr inbounds i8*, i8** %1140, i64 1
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.41, i32 0, i32 0), i8** %1141, align 8
  br label %1145

; <label>:1142:                                   ; preds = %1113
  %pgocount150 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 144)
  %1143 = add i64 %pgocount150, 1
  store i64 %1143, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 144)
  %1144 = load i8**, i8*** %12, align 8
  store i8** %1144, i8*** %13, align 8
  br label %1145

; <label>:1145:                                   ; preds = %1142, %1136
  %1146 = load i8**, i8*** %13, align 8
  store i8** %1146, i8*** %12, align 8
  br label %1147

; <label>:1147:                                   ; preds = %1162, %1145
  %1148 = load i8**, i8*** %12, align 8
  %1149 = load i8*, i8** %1148, align 8
  %1150 = icmp ne i8* %1149, null
  br i1 %1150, label %1151, label %1158

; <label>:1151:                                   ; preds = %1147
  %pgocount151 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 13)
  %1152 = add i64 %pgocount151, 1
  store i64 %1152, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 13)
  %1153 = load i8**, i8*** %12, align 8
  %1154 = load i8*, i8** %1153, align 8
  %1155 = load i8, i8* %1154, align 1
  %1156 = sext i8 %1155 to i32
  %1157 = icmp ne i32 %1156, 0
  br label %1158

; <label>:1158:                                   ; preds = %1151, %1147
  %1159 = phi i1 [ false, %1147 ], [ %1157, %1151 ]
  br i1 %1159, label %1160, label %1165

; <label>:1160:                                   ; preds = %1158
  %pgocount152 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 8)
  %1161 = add i64 %pgocount152, 1
  store i64 %1161, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 8)
  br label %1162

; <label>:1162:                                   ; preds = %1160
  %1163 = load i8**, i8*** %12, align 8
  %1164 = getelementptr inbounds i8*, i8** %1163, i32 1
  store i8** %1164, i8*** %12, align 8
  br label %1147

; <label>:1165:                                   ; preds = %1158
  %1166 = load i8**, i8*** %13, align 8
  %1167 = load i8*, i8** %14, align 8
  %1168 = load i8*, i8** %15, align 8
  %1169 = load i8, i8* %24, align 1
  %1170 = call i32 @encryptfile(i8** %1166, i8* %1167, i8* %1168, i8 zeroext %1169)
  store i32 %1170, i32* %9, align 4
  br label %1176

; <label>:1171:                                   ; preds = %1090
  %1172 = load i8*, i8** %14, align 8
  %1173 = load i8*, i8** %15, align 8
  %1174 = load i8, i8* %24, align 1
  %1175 = call i32 @idea_encryptfile(i8* %1172, i8* %1173, i8 zeroext %1174)
  store i32 %1175, i32* %9, align 4
  br label %1176

; <label>:1176:                                   ; preds = %1171, %1165
  %1177 = load i8*, i8** %14, align 8
  call void @rmtemp(i8* %1177)
  %1178 = load i8*, i8** %15, align 8
  store i8* %1178, i8** %14, align 8
  %1179 = load i32, i32* %9, align 4
  %1180 = icmp slt i32 %1179, 0
  br i1 %1180, label %1181, label %1192

; <label>:1181:                                   ; preds = %1176
  %pgocount153 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 96)
  %1182 = add i64 %pgocount153, 1
  store i64 %1182, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 96)
  %1183 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %1184 = call i8* @LANG(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.42, i32 0, i32 0))
  %1185 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1183, i8* %1184)
  %1186 = load i8, i8* %23, align 1
  %1187 = zext i8 %1186 to i32
  %1188 = icmp ne i32 %1187, 0
  %1189 = zext i1 %1188 to i64
  %pgocount154 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 186)
  %1190 = add i64 %pgocount154, %1189
  store i64 %1190, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 186)
  %1191 = select i1 %1188, i32 22, i32 21
  store i32 %1191, i32* @errorLvl, align 4
  call void @user_error()
  br label %1192

; <label>:1192:                                   ; preds = %1181, %1176
  br label %1228

; <label>:1193:                                   ; preds = %1073
  %1194 = load i8, i8* %24, align 1
  %1195 = zext i8 %1194 to i32
  %1196 = icmp ne i32 %1195, 0
  br i1 %1196, label %1197, label %1226

; <label>:1197:                                   ; preds = %1193
  %pgocount155 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 97)
  %1198 = add i64 %pgocount155, 1
  store i64 %1198, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 97)
  %1199 = load i8, i8* %20, align 1
  %1200 = icmp ne i8 %1199, 0
  br i1 %1200, label %1226, label %1201

; <label>:1201:                                   ; preds = %1197
  %pgocount156 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 140)
  %1202 = add i64 %pgocount156, 1
  store i64 %1202, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 140)
  %1203 = load i8*, i8** %26, align 8
  %1204 = icmp ne i8* %1203, null
  br i1 %1204, label %1226, label %1205

; <label>:1205:                                   ; preds = %1201
  %1206 = load i8, i8* @emit_radix_64, align 1
  %1207 = zext i8 %1206 to i32
  %1208 = icmp ne i32 %1207, 0
  br i1 %1208, label %1214, label %1209

; <label>:1209:                                   ; preds = %1205
  %pgocount157 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 168)
  %1210 = add i64 %pgocount157, 1
  store i64 %1210, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 168)
  %1211 = load i8, i8* %25, align 1
  %1212 = zext i8 %1211 to i32
  %1213 = icmp ne i32 %1212, 0
  br i1 %1213, label %1214, label %1217

; <label>:1214:                                   ; preds = %1209, %1205
  %pgocount158 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 157)
  %1215 = add i64 %pgocount158, 1
  store i64 %1215, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 157)
  %1216 = call i8* @tempfile(i32 5)
  store i8* %1216, i8** %15, align 8
  br label %1220

; <label>:1217:                                   ; preds = %1209
  %pgocount159 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 176)
  %1218 = add i64 %pgocount159, 1
  store i64 %1218, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 176)
  %1219 = call i8* @tempfile(i32 1)
  store i8* %1219, i8** %15, align 8
  br label %1220

; <label>:1220:                                   ; preds = %1217, %1214
  %1221 = load i8*, i8** %14, align 8
  %1222 = load i8*, i8** %15, align 8
  %1223 = call i32 @squish_file(i8* %1221, i8* %1222)
  %1224 = load i8*, i8** %14, align 8
  call void @rmtemp(i8* %1224)
  %1225 = load i8*, i8** %15, align 8
  store i8* %1225, i8** %14, align 8
  br label %1226

; <label>:1226:                                   ; preds = %1220, %1201, %1197, %1193
  %pgocount160 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 60)
  %1227 = add i64 %pgocount160, 1
  store i64 %1227, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 60)
  br label %1228

; <label>:1228:                                   ; preds = %1226, %1192
  %1229 = load i8, i8* %25, align 1
  %1230 = icmp ne i8 %1229, 0
  br i1 %1230, label %1231, label %1260

; <label>:1231:                                   ; preds = %1228
  %1232 = load i8, i8* @emit_radix_64, align 1
  %1233 = icmp ne i8 %1232, 0
  br i1 %1233, label %1234, label %1250

; <label>:1234:                                   ; preds = %1231
  %1235 = load i8*, i8** %14, align 8
  %1236 = load i8*, i8** %11, align 8
  %1237 = load i8*, i8** %26, align 8
  %1238 = call i32 @armor_file(i8* %1235, i8* null, i8* %1236, i8* %1237, i8 zeroext 0)
  %1239 = icmp ne i32 %1238, 0
  br i1 %1239, label %1240, label %1242

; <label>:1240:                                   ; preds = %1234
  %pgocount161 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 84)
  %1241 = add i64 %pgocount161, 1
  store i64 %1241, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 84)
  store i32 3, i32* @errorLvl, align 4
  call void @user_error()
  br label %1242

; <label>:1242:                                   ; preds = %1240, %1234
  %1243 = load i8*, i8** %26, align 8
  %1244 = icmp ne i8* %1243, null
  br i1 %1244, label %1245, label %1248

; <label>:1245:                                   ; preds = %1242
  %pgocount162 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 85)
  %1246 = add i64 %pgocount162, 1
  store i64 %1246, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 85)
  %1247 = load i8*, i8** %26, align 8
  call void @rmtemp(i8* %1247)
  br label %1248

; <label>:1248:                                   ; preds = %1245, %1242
  %pgocount163 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 50)
  %1249 = add i64 %pgocount163, 1
  store i64 %1249, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 50)
  br label %1258

; <label>:1250:                                   ; preds = %1231
  %1251 = load i8*, i8** %14, align 8
  %1252 = call i32 @writePhantomOutput(i8* %1251)
  %1253 = icmp slt i32 %1252, 0
  br i1 %1253, label %1254, label %1256

; <label>:1254:                                   ; preds = %1250
  %pgocount164 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 141)
  %1255 = add i64 %pgocount164, 1
  store i64 %1255, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 141)
  store i32 3, i32* @errorLvl, align 4
  call void @user_error()
  br label %1256

; <label>:1256:                                   ; preds = %1254, %1250
  %pgocount165 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 98)
  %1257 = add i64 %pgocount165, 1
  store i64 %1257, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 98)
  br label %1258

; <label>:1258:                                   ; preds = %1256, %1248
  %1259 = load i8*, i8** %14, align 8
  call void @rmtemp(i8* %1259)
  br label %1395

; <label>:1260:                                   ; preds = %1228
  %1261 = load i8*, i8** @outputfile, align 8
  %1262 = icmp ne i8* %1261, null
  br i1 %1262, label %1263, label %1267

; <label>:1263:                                   ; preds = %1260
  %1264 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  %1265 = load i8*, i8** @outputfile, align 8
  %1266 = call i8* @strcpy(i8* %1264, i8* %1265) #7
  br label %1273

; <label>:1267:                                   ; preds = %1260
  %pgocount166 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 122)
  %1268 = add i64 %pgocount166, 1
  store i64 %1268, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 122)
  %1269 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  %1270 = load i8*, i8** %11, align 8
  %1271 = call i8* @strcpy(i8* %1269, i8* %1270) #7
  %1272 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  call void @drop_extension(i8* %1272)
  br label %1273

; <label>:1273:                                   ; preds = %1267, %1263
  br label %1274

; <label>:1274:                                   ; preds = %1340, %1273
  %1275 = load i8*, i8** @outputfile, align 8
  %1276 = icmp ne i8* %1275, null
  br i1 %1276, label %1306, label %1277

; <label>:1277:                                   ; preds = %1274
  %pgocount167 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 19)
  %1278 = add i64 %pgocount167, 1
  store i64 %1278, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 19)
  %1279 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  %1280 = call zeroext i8 @no_extension(i8* %1279)
  %1281 = zext i8 %1280 to i32
  %1282 = icmp ne i32 %1281, 0
  br i1 %1282, label %1283, label %1306

; <label>:1283:                                   ; preds = %1277
  %1284 = load i8, i8* @emit_radix_64, align 1
  %1285 = icmp ne i8 %1284, 0
  br i1 %1285, label %1286, label %1289

; <label>:1286:                                   ; preds = %1283
  %pgocount168 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 24)
  %1287 = add i64 %pgocount168, 1
  store i64 %1287, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 24)
  %1288 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  call void @force_extension(i8* %1288, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @ASC_EXTENSION, i32 0, i32 0))
  br label %1305

; <label>:1289:                                   ; preds = %1283
  %1290 = load i8, i8* @sign_flag, align 1
  %1291 = zext i8 %1290 to i32
  %1292 = icmp ne i32 %1291, 0
  br i1 %1292, label %1293, label %1301

; <label>:1293:                                   ; preds = %1289
  %pgocount169 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 66)
  %1294 = add i64 %pgocount169, 1
  store i64 %1294, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 66)
  %1295 = load i8, i8* %20, align 1
  %1296 = zext i8 %1295 to i32
  %1297 = icmp ne i32 %1296, 0
  br i1 %1297, label %1298, label %1301

; <label>:1298:                                   ; preds = %1293
  %pgocount170 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 110)
  %1299 = add i64 %pgocount170, 1
  store i64 %1299, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 110)
  %1300 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  call void @force_extension(i8* %1300, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @SIG_EXTENSION, i32 0, i32 0))
  br label %1304

; <label>:1301:                                   ; preds = %1293, %1289
  %pgocount171 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 83)
  %1302 = add i64 %pgocount171, 1
  store i64 %1302, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 83)
  %1303 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  call void @force_extension(i8* %1303, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  br label %1304

; <label>:1304:                                   ; preds = %1301, %1298
  br label %1305

; <label>:1305:                                   ; preds = %1304, %1286
  br label %1306

; <label>:1306:                                   ; preds = %1305, %1277, %1274
  %1307 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  %1308 = call zeroext i8 @file_exists(i8* %1307)
  %1309 = icmp ne i8 %1308, 0
  br i1 %1309, label %1312, label %1310

; <label>:1310:                                   ; preds = %1306
  %pgocount172 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 112)
  %1311 = add i64 %pgocount172, 1
  store i64 %1311, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 112)
  br label %1341

; <label>:1312:                                   ; preds = %1306
  %1313 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  %1314 = load i8*, i8** %26, align 8
  %1315 = icmp ne i8* %1314, null
  %1316 = xor i1 %1315, true
  %1317 = zext i1 %1316 to i32
  %1318 = trunc i32 %1317 to i8
  %1319 = call i8* @ck_dup_output(i8* %1313, i8 zeroext 1, i8 zeroext %1318)
  store i8* %1319, i8** %37, align 8
  %1320 = load i8*, i8** %37, align 8
  %1321 = icmp eq i8* %1320, null
  br i1 %1321, label %1322, label %1324

; <label>:1322:                                   ; preds = %1312
  %pgocount173 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 20)
  %1323 = add i64 %pgocount173, 1
  store i64 %1323, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 20)
  call void @user_error()
  br label %1324

; <label>:1324:                                   ; preds = %1322, %1312
  %1325 = load i8*, i8** %26, align 8
  %1326 = icmp ne i8* %1325, null
  br i1 %1326, label %1327, label %1335

; <label>:1327:                                   ; preds = %1324
  %pgocount174 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 17)
  %1328 = add i64 %pgocount174, 1
  store i64 %1328, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 17)
  %1329 = load i8*, i8** %37, align 8
  %1330 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  %1331 = call i32 @strcmp(i8* %1329, i8* %1330) #8
  %1332 = icmp ne i32 %1331, 0
  br i1 %1332, label %1335, label %1333

; <label>:1333:                                   ; preds = %1327
  %pgocount175 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 130)
  %1334 = add i64 %pgocount175, 1
  store i64 %1334, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 130)
  br label %1341

; <label>:1335:                                   ; preds = %1327, %1324
  %pgocount176 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 14)
  %1336 = add i64 %pgocount176, 1
  store i64 %1336, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 14)
  %1337 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  %1338 = load i8*, i8** %37, align 8
  %1339 = call i8* @strcpy(i8* %1337, i8* %1338) #7
  br label %1340

; <label>:1340:                                   ; preds = %1335
  br i1 true, label %1274, label %1341

; <label>:1341:                                   ; preds = %1340, %1333, %1310
  %1342 = load i8, i8* @emit_radix_64, align 1
  %1343 = icmp ne i8 %1342, 0
  br i1 %1343, label %1344, label %1361

; <label>:1344:                                   ; preds = %1341
  %1345 = load i8*, i8** %14, align 8
  %1346 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  %1347 = load i8*, i8** %11, align 8
  %1348 = load i8*, i8** %26, align 8
  %1349 = call i32 @armor_file(i8* %1345, i8* %1346, i8* %1347, i8* %1348, i8 zeroext 0)
  %1350 = icmp ne i32 %1349, 0
  br i1 %1350, label %1351, label %1353

; <label>:1351:                                   ; preds = %1344
  %pgocount177 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 116)
  %1352 = add i64 %pgocount177, 1
  store i64 %1352, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 116)
  store i32 3, i32* @errorLvl, align 4
  call void @user_error()
  br label %1353

; <label>:1353:                                   ; preds = %1351, %1344
  %1354 = load i8*, i8** %26, align 8
  %1355 = icmp ne i8* %1354, null
  br i1 %1355, label %1356, label %1359

; <label>:1356:                                   ; preds = %1353
  %pgocount178 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 117)
  %1357 = add i64 %pgocount178, 1
  store i64 %1357, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 117)
  %1358 = load i8*, i8** %26, align 8
  call void @rmtemp(i8* %1358)
  br label %1359

; <label>:1359:                                   ; preds = %1356, %1353
  %pgocount179 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 99)
  %1360 = add i64 %pgocount179, 1
  store i64 %1360, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 99)
  br label %1394

; <label>:1361:                                   ; preds = %1341
  %pgocount180 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 123)
  %1362 = add i64 %pgocount180, 1
  store i64 %1362, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 123)
  %1363 = load i8*, i8** %14, align 8
  %1364 = getelementptr inbounds [256 x i8], [256 x i8]* %36, i32 0, i32 0
  %1365 = call i8* @savetemp(i8* %1363, i8* %1364)
  store i8* %1365, i8** @outputfile, align 8
  %1366 = icmp eq i8* %1365, null
  br i1 %1366, label %1367, label %1369

; <label>:1367:                                   ; preds = %1361
  %pgocount181 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 148)
  %1368 = add i64 %pgocount181, 1
  store i64 %1368, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 148)
  store i32 3, i32* @errorLvl, align 4
  call void @user_error()
  br label %1369

; <label>:1369:                                   ; preds = %1367, %1361
  %1370 = load i8, i8* @quietmode, align 1
  %1371 = icmp ne i8 %1370, 0
  br i1 %1371, label %1393, label %1372

; <label>:1372:                                   ; preds = %1369
  %1373 = load i8, i8* %22, align 1
  %1374 = icmp ne i8 %1373, 0
  br i1 %1374, label %1375, label %1381

; <label>:1375:                                   ; preds = %1372
  %pgocount182 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 156)
  %1376 = add i64 %pgocount182, 1
  store i64 %1376, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 156)
  %1377 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %1378 = call i8* @LANG(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.43, i32 0, i32 0))
  %1379 = load i8*, i8** @outputfile, align 8
  %1380 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1377, i8* %1378, i8* %1379)
  br label %1392

; <label>:1381:                                   ; preds = %1372
  %pgocount183 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 162)
  %1382 = add i64 %pgocount183, 1
  store i64 %1382, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 162)
  %1383 = load i8, i8* @sign_flag, align 1
  %1384 = icmp ne i8 %1383, 0
  br i1 %1384, label %1385, label %1391

; <label>:1385:                                   ; preds = %1381
  %pgocount184 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 169)
  %1386 = add i64 %pgocount184, 1
  store i64 %1386, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 169)
  %1387 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %1388 = call i8* @LANG(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.44, i32 0, i32 0))
  %1389 = load i8*, i8** @outputfile, align 8
  %1390 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1387, i8* %1388, i8* %1389)
  br label %1391

; <label>:1391:                                   ; preds = %1385, %1381
  br label %1392

; <label>:1392:                                   ; preds = %1391, %1375
  br label %1393

; <label>:1393:                                   ; preds = %1392, %1369
  br label %1394

; <label>:1394:                                   ; preds = %1393, %1359
  br label %1395

; <label>:1395:                                   ; preds = %1394, %1258
  %1396 = load i8, i8* %18, align 1
  %1397 = icmp ne i8 %1396, 0
  br i1 %1397, label %1398, label %1414

; <label>:1398:                                   ; preds = %1395
  %1399 = load i8*, i8** %11, align 8
  %1400 = call i32 @wipefile(i8* %1399)
  %1401 = icmp eq i32 %1400, 0
  br i1 %1401, label %1402, label %1412

; <label>:1402:                                   ; preds = %1398
  %pgocount185 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 100)
  %1403 = add i64 %pgocount185, 1
  store i64 %1403, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 100)
  %1404 = load i8*, i8** %11, align 8
  %1405 = call i32 @remove(i8* %1404) #7
  %1406 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %1407 = call i8* @LANG(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.17, i32 0, i32 0))
  %1408 = load i8*, i8** %11, align 8
  %1409 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1406, i8* %1407, i8* %1408)
  %1410 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %1411 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1410, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  br label %1412

; <label>:1412:                                   ; preds = %1402, %1398
  %pgocount186 = load i64, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 38)
  %1413 = add i64 %pgocount186, 1
  store i64 %1413, i64* getelementptr inbounds ([187 x i64], [187 x i64]* @__profc_main, i64 0, i64 38)
  br label %1414

; <label>:1414:                                   ; preds = %1412, %1395
  call void @exitPGP(i32 0)
  ret i32 0
}

declare i8* @getenv(...) #3

declare i8* @xmalloc(i32) #3

declare void @hashpass(i8*, i32, i8*) #3

declare i32 @atoi(...) #3

declare i64 @read(i32, i8*, i64) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

declare i8* @buildsysfilename(i8*, i8*) #3

; Function Attrs: nounwind
declare i32 @access(i8*, i32) #2

declare i32 @processConfigFile(i8*) #3

declare i8* @buildfilename(i8*, i8*) #3

; Function Attrs: noreturn
declare void @exit(i32) #5

declare void @init_charset() #3

declare void @settmpdir(i8*) #3

declare i8* @malloc(...) #3

declare i32 @pgp_getopt(...) #3

declare i32 @to_lower(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @usage() #0 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca i8*, align 8
  %3 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i32 0, i32 0
  store i8* %3, i8** %2, align 8
  call void @signon_msg()
  %4 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i32 0, i32 0
  call void @build_helpfile(i8* %4, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.41, i32 0, i32 0))
  %5 = load i8*, i8** @ext_c_ptr, align 8
  %6 = icmp ne i8* %5, null
  br i1 %6, label %7, label %19

; <label>:7:                                      ; preds = %0
  %8 = call i8* @tempfile(i32 4)
  store i8* %8, i8** %2, align 8
  store i32 2, i32* @CONVERSION, align 4
  %9 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i32 0, i32 0
  %10 = load i8*, i8** %2, align 8
  %11 = call i32 @copyfiles_by_name(i8* %9, i8* %10)
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 4)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 4)
  %15 = load i8*, i8** %2, align 8
  call void @rmtemp(i8* %15)
  %16 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i32 0, i32 0
  store i8* %16, i8** %2, align 8
  br label %17

; <label>:17:                                     ; preds = %13, %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 1)
  store i32 0, i32* @CONVERSION, align 4
  br label %19

; <label>:19:                                     ; preds = %17, %0
  %20 = load i8*, i8** %2, align 8
  %21 = call i32 @more_file(i8* %20, i8 zeroext 0)
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 2)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 2)
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %26 = call i8* @LANG(i8* getelementptr inbounds ([813 x i8], [813 x i8]* @.str.140, i32 0, i32 0))
  %27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* %26)
  br label %28

; <label>:28:                                     ; preds = %23, %19
  %29 = load i8*, i8** @ext_c_ptr, align 8
  %30 = icmp ne i8* %29, null
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 3)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 3)
  %33 = load i8*, i8** %2, align 8
  call void @rmtemp(i8* %33)
  br label %34

; <label>:34:                                     ; preds = %31, %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %35 = add i64 %pgocount4, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  call void @exit(i32 5) #9
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #2

declare i32 @processConfigLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @arg_error() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_arg_error, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_arg_error, i64 0, i64 0)
  call void @signon_msg()
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %3 = call i8* @LANG(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.139, i32 0, i32 0))
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* %3)
  store i32 5, i32* @errorLvl, align 4
  call void @user_error()
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @key_usage() #0 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca i8*, align 8
  %3 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i32 0, i32 0
  store i8* %3, i8** %2, align 8
  call void @signon_msg()
  %4 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i32 0, i32 0
  call void @build_helpfile(i8* %4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.144, i32 0, i32 0))
  %5 = load i8*, i8** @ext_c_ptr, align 8
  %6 = icmp ne i8* %5, null
  br i1 %6, label %7, label %19

; <label>:7:                                      ; preds = %0
  %8 = call i8* @tempfile(i32 4)
  store i8* %8, i8** %2, align 8
  store i32 2, i32* @CONVERSION, align 4
  %9 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i32 0, i32 0
  %10 = load i8*, i8** %2, align 8
  %11 = call i32 @copyfiles_by_name(i8* %9, i8* %10)
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_key_usage, i64 0, i64 4)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_key_usage, i64 0, i64 4)
  %15 = load i8*, i8** %2, align 8
  call void @rmtemp(i8* %15)
  %16 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i32 0, i32 0
  store i8* %16, i8** %2, align 8
  br label %17

; <label>:17:                                     ; preds = %13, %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_key_usage, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_key_usage, i64 0, i64 1)
  store i32 0, i32* @CONVERSION, align 4
  br label %19

; <label>:19:                                     ; preds = %17, %0
  %20 = load i8*, i8** %2, align 8
  %21 = call i32 @more_file(i8* %20, i8 zeroext 0)
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_key_usage, i64 0, i64 2)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_key_usage, i64 0, i64 2)
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %26 = call i8* @LANG(i8* getelementptr inbounds ([794 x i8], [794 x i8]* @.str.145, i32 0, i32 0))
  %27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* %26)
  br label %28

; <label>:28:                                     ; preds = %23, %19
  %29 = load i8*, i8** @ext_c_ptr, align 8
  %30 = icmp ne i8* %29, null
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_key_usage, i64 0, i64 3)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_key_usage, i64 0, i64 3)
  %33 = load i8*, i8** %2, align 8
  call void @rmtemp(i8* %33)
  br label %34

; <label>:34:                                     ; preds = %31, %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_key_usage, i64 0, i64 0)
  %35 = add i64 %pgocount4, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_key_usage, i64 0, i64 0)
  call void @exit(i32 5) #9
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @signon_msg() #0 {
  %1 = alloca i64, align 8
  %2 = load i8, i8* @quietmode, align 1
  %3 = zext i8 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %10, label %5

; <label>:5:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signon_msg, i64 0, i64 1)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signon_msg, i64 0, i64 1)
  %7 = load i8, i8* @signon_msg.printed, align 1
  %8 = zext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %5, %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signon_msg, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signon_msg, i64 0, i64 0)
  br label %32

; <label>:12:                                     ; preds = %5
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signon_msg, i64 0, i64 2)
  %13 = add i64 %pgocount2, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signon_msg, i64 0, i64 2)
  store i8 1, i8* @signon_msg.printed, align 1
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i8* @LANG(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.60, i32 0, i32 0))
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @rel_version, i32 0, i32 0))
  %17 = call i8* @LANG(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.61, i32 0, i32 0))
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 @fputs(i8* %17, %struct._IO_FILE* %18)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i8* @LANG(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @rel_date, i32 0, i32 0))
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.62, i32 0, i32 0), i8* %21)
  %23 = call i8* @LANG(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.63, i32 0, i32 0))
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i32 @fputs(i8* %23, %struct._IO_FILE* %24)
  %26 = bitcast i64* %1 to i8*
  %27 = call i64 @get_timestamp(i8* %26)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %29 = call i8* @LANG(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.64, i32 0, i32 0))
  %30 = call i8* @ctdate(i64* %1)
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* %29, i8* %30)
  br label %32

; <label>:32:                                     ; preds = %12, %10
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: nounwind
declare i32 @umask(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @initsigs() #0 {
  %1 = call void (i32)* @signal(i32 2, void (i32)* inttoptr (i64 1 to void (i32)*)) #7
  %2 = icmp ne void (i32)* %1, inttoptr (i64 1 to void (i32)*)
  br i1 %2, label %3, label %6

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_initsigs, i64 0, i64 1)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_initsigs, i64 0, i64 1)
  %5 = call void (i32)* @signal(i32 2, void (i32)* @breakHandler) #7
  br label %6

; <label>:6:                                      ; preds = %3, %0
  %7 = call void (i32)* @signal(i32 1, void (i32)* inttoptr (i64 1 to void (i32)*)) #7
  %8 = icmp ne void (i32)* %7, inttoptr (i64 1 to void (i32)*)
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_initsigs, i64 0, i64 2)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_initsigs, i64 0, i64 2)
  %11 = call void (i32)* @signal(i32 1, void (i32)* @breakHandler) #7
  br label %12

; <label>:12:                                     ; preds = %9, %6
  %13 = call void (i32)* @signal(i32 3, void (i32)* inttoptr (i64 1 to void (i32)*)) #7
  %14 = icmp ne void (i32)* %13, inttoptr (i64 1 to void (i32)*)
  br i1 %14, label %15, label %18

; <label>:15:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_initsigs, i64 0, i64 3)
  %16 = add i64 %pgocount2, 1
  store i64 %16, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_initsigs, i64 0, i64 3)
  %17 = call void (i32)* @signal(i32 3, void (i32)* @breakHandler) #7
  br label %18

; <label>:18:                                     ; preds = %15, %12
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_initsigs, i64 0, i64 0)
  %19 = add i64 %pgocount3, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_initsigs, i64 0, i64 0)
  %20 = call void (i32)* @signal(i32 13, void (i32)* @breakHandler) #7
  %21 = call void (i32)* @signal(i32 15, void (i32)* @breakHandler) #7
  ret void
}

declare i64 @noise() #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @do_keyopt(i8 signext) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca [256 x i8], align 16
  %5 = alloca [256 x i8], align 16
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca [6 x i8], align 1
  %9 = alloca [6 x i8], align 1
  %10 = alloca i8*, align 8
  %11 = alloca i8**, align 8
  %12 = alloca i8, align 1
  store i8 %0, i8* %3, align 1
  %13 = load i8, i8* @filter_mode, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %21, label %16

; <label>:16:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 5)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 5)
  %18 = load i8, i8* @batchmode, align 1
  %19 = zext i8 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %48

; <label>:21:                                     ; preds = %16, %1
  %22 = load i8, i8* %3, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp eq i32 %23, 103
  br i1 %24, label %46, label %25

; <label>:25:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 4)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 4)
  %27 = load i8, i8* %3, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp eq i32 %28, 101
  br i1 %29, label %46, label %30

; <label>:30:                                     ; preds = %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 7)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 7)
  %32 = load i8, i8* %3, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %33, 100
  br i1 %34, label %46, label %35

; <label>:35:                                     ; preds = %30
  %pgocount4 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 8)
  %36 = add i64 %pgocount4, 1
  store i64 %36, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 8)
  %37 = load i8, i8* %3, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp eq i32 %38, 114
  br i1 %39, label %40, label %48

; <label>:40:                                     ; preds = %35
  %pgocount5 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 16)
  %41 = add i64 %pgocount5, 1
  store i64 %41, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 16)
  %42 = load i8, i8* @sign_flag, align 1
  %43 = zext i8 %42 to i32
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %46, label %._crit_edge1

._crit_edge1:                                     ; preds = %40
  %pgocount6 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 1)
  %45 = add i64 %pgocount6, 1
  store i64 %45, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 1)
  br label %48

; <label>:46:                                     ; preds = %40, %30, %25, %21
  %pgocount7 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 2)
  %47 = add i64 %pgocount7, 1
  store i64 %47, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 2)
  store i32 4, i32* @errorLvl, align 4
  call void @arg_error()
  br label %48

; <label>:48:                                     ; preds = %._crit_edge1, %46, %35, %16
  %49 = load i8, i8* @filter_mode, align 1
  %50 = icmp ne i8 %49, 0
  br i1 %50, label %54, label %51

; <label>:51:                                     ; preds = %48
  %pgocount8 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 6)
  %52 = add i64 %pgocount8, 1
  store i64 %52, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 6)
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %53, %struct._IO_FILE** @pgpout, align 8
  br label %54

; <label>:54:                                     ; preds = %51, %48
  %55 = load i8, i8* %3, align 1
  %56 = sext i8 %55 to i32
  switch i32 %56, label %884 [
    i32 103, label %58
    i32 99, label %137
    i32 109, label %231
    i32 115, label %279
    i32 100, label %362
    i32 101, label %425
    i32 97, label %488
    i32 120, label %587
    i32 114, label %731
    i32 118, label %._crit_edge
    i32 86, label %812
  ]

._crit_edge:                                      ; preds = %54
  %pgocount9 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 0)
  %57 = add i64 %pgocount9, 1
  store i64 %57, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 0)
  br label %812

; <label>:58:                                     ; preds = %54
  store i8* null, i8** %10, align 8
  %59 = load i8, i8* @nomanual, align 1
  %60 = icmp ne i8 %59, 0
  br i1 %60, label %87, label %61

; <label>:61:                                     ; preds = %58
  %pgocount10 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 42)
  %62 = add i64 %pgocount10, 1
  store i64 %62, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 42)
  %63 = call i32 @manuals_missing()
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %87

; <label>:65:                                     ; preds = %61
  %pgocount11 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 70)
  %66 = add i64 %pgocount11, 1
  store i64 %66, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 70)
  %67 = call i8* @LANG(i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.114, i32 0, i32 0))
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %69 = call i32 @fputs(i8* %67, %struct._IO_FILE* %68)
  store i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @manual_dirs, i32 0, i32 0), i8*** %11, align 8
  br label %70

; <label>:70:                                     ; preds = %80, %65
  %71 = load i8**, i8*** %11, align 8
  %72 = load i8*, i8** %71, align 8
  %73 = icmp ne i8* %72, null
  br i1 %73, label %74, label %83

; <label>:74:                                     ; preds = %70
  %pgocount12 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 3)
  %75 = add i64 %pgocount12, 1
  store i64 %75, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 3)
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %77 = load i8**, i8*** %11, align 8
  %78 = load i8*, i8** %77, align 8
  %79 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.115, i32 0, i32 0), i8* %78)
  br label %80

; <label>:80:                                     ; preds = %74
  %81 = load i8**, i8*** %11, align 8
  %82 = getelementptr inbounds i8*, i8** %81, i32 1
  store i8** %82, i8*** %11, align 8
  br label %70

; <label>:83:                                     ; preds = %70
  %84 = call i8* @LANG(i8* getelementptr inbounds ([603 x i8], [603 x i8]* @.str.116, i32 0, i32 0))
  %85 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %86 = call i32 @fputs(i8* %84, %struct._IO_FILE* %85)
  store i32 10, i32* %2, align 4
  br label %887

; <label>:87:                                     ; preds = %61, %58
  %88 = load i32, i32* @myArgc, align 4
  %89 = icmp sgt i32 %88, 2
  br i1 %89, label %90, label %96

; <label>:90:                                     ; preds = %87
  %91 = getelementptr inbounds [6 x i8], [6 x i8]* %8, i32 0, i32 0
  %92 = load i8**, i8*** @myArgv, align 8
  %93 = getelementptr inbounds i8*, i8** %92, i64 2
  %94 = load i8*, i8** %93, align 8
  %95 = call i8* @strncpy(i8* %91, i8* %94, i64 5) #7
  br label %99

; <label>:96:                                     ; preds = %87
  %pgocount13 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 39)
  %97 = add i64 %pgocount13, 1
  store i64 %97, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 39)
  %98 = getelementptr inbounds [6 x i8], [6 x i8]* %8, i64 0, i64 0
  store i8 0, i8* %98, align 1
  br label %99

; <label>:99:                                     ; preds = %96, %90
  %100 = load i32, i32* @myArgc, align 4
  %101 = icmp sgt i32 %100, 3
  br i1 %101, label %102, label %109

; <label>:102:                                    ; preds = %99
  %pgocount14 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 40)
  %103 = add i64 %pgocount14, 1
  store i64 %103, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 40)
  %104 = getelementptr inbounds [6 x i8], [6 x i8]* %9, i32 0, i32 0
  %105 = load i8**, i8*** @myArgv, align 8
  %106 = getelementptr inbounds i8*, i8** %105, i64 3
  %107 = load i8*, i8** %106, align 8
  %108 = call i8* @strncpy(i8* %104, i8* %107, i64 5) #7
  br label %112

; <label>:109:                                    ; preds = %99
  %pgocount15 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 41)
  %110 = add i64 %pgocount15, 1
  store i64 %110, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 41)
  %111 = getelementptr inbounds [6 x i8], [6 x i8]* %9, i64 0, i64 0
  store i8 0, i8* %111, align 1
  br label %112

; <label>:112:                                    ; preds = %109, %102
  %113 = load i8, i8* @u_flag, align 1
  %114 = zext i8 %113 to i32
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %116, label %123

; <label>:116:                                    ; preds = %112
  %pgocount16 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 37)
  %117 = add i64 %pgocount16, 1
  store i64 %117, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 37)
  %118 = load i8, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @my_name, i32 0, i32 0), align 16
  %119 = sext i8 %118 to i32
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %121, label %123

; <label>:121:                                    ; preds = %116
  %pgocount17 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 56)
  %122 = add i64 %pgocount17, 1
  store i64 %122, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 56)
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @my_name, i32 0, i32 0), i8** %10, align 8
  br label %123

; <label>:123:                                    ; preds = %121, %116, %112
  %124 = getelementptr inbounds [6 x i8], [6 x i8]* %8, i32 0, i32 0
  %125 = getelementptr inbounds [6 x i8], [6 x i8]* %9, i32 0, i32 0
  %126 = load i8*, i8** %10, align 8
  %127 = call i32 @dokeygen(i8* %124, i8* %125, i8* %126)
  store i32 %127, i32* %7, align 4
  %128 = load i32, i32* %7, align 4
  %129 = icmp slt i32 %128, 0
  br i1 %129, label %130, label %135

; <label>:130:                                    ; preds = %123
  %pgocount18 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 57)
  %131 = add i64 %pgocount18, 1
  store i64 %131, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 57)
  %132 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %133 = call i8* @LANG(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.117, i32 0, i32 0))
  %134 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %132, i8* %133)
  store i32 10, i32* @errorLvl, align 4
  br label %135

; <label>:135:                                    ; preds = %130, %123
  %136 = load i32, i32* %7, align 4
  store i32 %136, i32* %2, align 4
  br label %887

; <label>:137:                                    ; preds = %54
  %138 = load i32, i32* @myArgc, align 4
  %139 = icmp slt i32 %138, 3
  br i1 %139, label %140, label %141

; <label>:140:                                    ; preds = %137
  store i8 0, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i64 0, i64 0), align 16
  br label %152

; <label>:141:                                    ; preds = %137
  %142 = load i8**, i8*** @myArgv, align 8
  %143 = getelementptr inbounds i8*, i8** %142, i64 2
  %144 = load i8*, i8** %143, align 8
  %145 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %144) #7
  %146 = call i32 @strcmp(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.118, i32 0, i32 0)) #8
  %147 = icmp eq i32 %146, 0
  br i1 %147, label %148, label %150

; <label>:148:                                    ; preds = %141
  %pgocount19 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 75)
  %149 = add i64 %pgocount19, 1
  store i64 %149, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 75)
  store i8 0, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i64 0, i64 0), align 16
  br label %150

; <label>:150:                                    ; preds = %148, %141
  %pgocount20 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 19)
  %151 = add i64 %pgocount20, 1
  store i64 %151, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 19)
  br label %152

; <label>:152:                                    ; preds = %150, %140
  %153 = load i32, i32* @myArgc, align 4
  %154 = icmp slt i32 %153, 4
  br i1 %154, label %155, label %158

; <label>:155:                                    ; preds = %152
  %156 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %157 = call i8* @strcpy(i8* %156, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #7
  br label %165

; <label>:158:                                    ; preds = %152
  %pgocount21 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 20)
  %159 = add i64 %pgocount21, 1
  store i64 %159, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 20)
  %160 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %161 = load i8**, i8*** @myArgv, align 8
  %162 = getelementptr inbounds i8*, i8** %161, i64 3
  %163 = load i8*, i8** %162, align 8
  %164 = call i8* @strncpy(i8* %160, i8* %163, i64 255) #7
  br label %165

; <label>:165:                                    ; preds = %158, %155
  %166 = load i32, i32* @myArgc, align 4
  %167 = icmp slt i32 %166, 4
  br i1 %167, label %168, label %187

; <label>:168:                                    ; preds = %165
  %pgocount22 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 21)
  %169 = add i64 %pgocount22, 1
  store i64 %169, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 21)
  %170 = load i32, i32* @myArgc, align 4
  %171 = icmp sgt i32 %170, 2
  br i1 %171, label %172, label %187

; <label>:172:                                    ; preds = %168
  %pgocount23 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 66)
  %173 = add i64 %pgocount23, 1
  store i64 %173, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 66)
  %174 = load i8**, i8*** @myArgv, align 8
  %175 = getelementptr inbounds i8*, i8** %174, i64 2
  %176 = load i8*, i8** %175, align 8
  %177 = call zeroext i8 @has_extension(i8* %176, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  %178 = zext i8 %177 to i32
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %180, label %187

; <label>:180:                                    ; preds = %172
  %pgocount24 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 89)
  %181 = add i64 %pgocount24, 1
  store i64 %181, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 89)
  %182 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %183 = load i8**, i8*** @myArgv, align 8
  %184 = getelementptr inbounds i8*, i8** %183, i64 2
  %185 = load i8*, i8** %184, align 8
  %186 = call i8* @strcpy(i8* %182, i8* %185) #7
  store i8 0, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i64 0, i64 0), align 16
  br label %187

; <label>:187:                                    ; preds = %180, %172, %168, %165
  %188 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %189 = call i32 @dokeycheck(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %188, i32 0)
  store i32 %189, i32* %7, align 4
  %190 = load i32, i32* %7, align 4
  %191 = icmp slt i32 %190, 0
  br i1 %191, label %192, label %197

; <label>:192:                                    ; preds = %187
  %pgocount25 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 43)
  %193 = add i64 %pgocount25, 1
  store i64 %193, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 43)
  %194 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %195 = call i8* @LANG(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.119, i32 0, i32 0))
  %196 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %194, i8* %195)
  store i32 17, i32* @errorLvl, align 4
  br label %197

; <label>:197:                                    ; preds = %192, %187
  %198 = load i32, i32* %7, align 4
  %199 = icmp sge i32 %198, 0
  br i1 %199, label %200, label %208

; <label>:200:                                    ; preds = %197
  %pgocount26 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 22)
  %201 = add i64 %pgocount26, 1
  store i64 %201, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 22)
  %202 = load i8, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i64 0, i64 0), align 16
  %203 = sext i8 %202 to i32
  %204 = icmp ne i32 %203, 0
  br i1 %204, label %205, label %208

; <label>:205:                                    ; preds = %200
  %pgocount27 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 51)
  %206 = add i64 %pgocount27, 1
  store i64 %206, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 51)
  %207 = load i32, i32* %7, align 4
  store i32 %207, i32* %2, align 4
  br label %887

; <label>:208:                                    ; preds = %200, %197
  %209 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %210 = call i32 @maint_check(i8* %209, i32 0)
  store i32 %210, i32* %7, align 4
  %211 = icmp slt i32 %210, 0
  br i1 %211, label %212, label %221

; <label>:212:                                    ; preds = %208
  %pgocount28 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 61)
  %213 = add i64 %pgocount28, 1
  store i64 %213, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 61)
  %214 = load i32, i32* %7, align 4
  %215 = icmp ne i32 %214, -7
  br i1 %215, label %216, label %221

; <label>:216:                                    ; preds = %212
  %pgocount29 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 92)
  %217 = add i64 %pgocount29, 1
  store i64 %217, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 92)
  %218 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %219 = call i8* @LANG(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.120, i32 0, i32 0))
  %220 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %218, i8* %219)
  store i32 17, i32* @errorLvl, align 4
  br label %221

; <label>:221:                                    ; preds = %216, %212, %208
  %222 = load i32, i32* %7, align 4
  %223 = icmp eq i32 %222, -7
  br i1 %223, label %224, label %226

; <label>:224:                                    ; preds = %221
  %pgocount30 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 48)
  %225 = add i64 %pgocount30, 1
  store i64 %225, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 48)
  br label %229

; <label>:226:                                    ; preds = %221
  %pgocount31 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 49)
  %227 = add i64 %pgocount31, 1
  store i64 %227, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 49)
  %228 = load i32, i32* %7, align 4
  br label %229

; <label>:229:                                    ; preds = %226, %224
  %230 = phi i32 [ 0, %224 ], [ %228, %226 ]
  store i32 %230, i32* %2, align 4
  br label %887

; <label>:231:                                    ; preds = %54
  %232 = load i32, i32* @myArgc, align 4
  %233 = icmp slt i32 %232, 3
  br i1 %233, label %234, label %238

; <label>:234:                                    ; preds = %231
  %pgocount32 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 23)
  %235 = add i64 %pgocount32, 1
  store i64 %235, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 23)
  %236 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %237 = call i8* @strcpy(i8* %236, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #7
  br label %245

; <label>:238:                                    ; preds = %231
  %pgocount33 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 24)
  %239 = add i64 %pgocount33, 1
  store i64 %239, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 24)
  %240 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %241 = load i8**, i8*** @myArgv, align 8
  %242 = getelementptr inbounds i8*, i8** %241, i64 2
  %243 = load i8*, i8** %242, align 8
  %244 = call i8* @strcpy(i8* %240, i8* %243) #7
  br label %245

; <label>:245:                                    ; preds = %238, %234
  %246 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %247 = call zeroext i8 @file_exists(i8* %246)
  %248 = icmp ne i8 %247, 0
  br i1 %248, label %252, label %249

; <label>:249:                                    ; preds = %245
  %pgocount34 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 44)
  %250 = add i64 %pgocount34, 1
  store i64 %250, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 44)
  %251 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  call void @default_extension(i8* %251, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  br label %252

; <label>:252:                                    ; preds = %249, %245
  %253 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %254 = load i8, i8* @c_flag, align 1
  %255 = zext i8 %254 to i32
  %256 = icmp ne i32 %255, 0
  %257 = zext i1 %256 to i64
  %pgocount35 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 102)
  %258 = add i64 %pgocount35, %257
  store i64 %258, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 102)
  %259 = select i1 %256, i32 1, i32 0
  %260 = or i32 2, %259
  %261 = call i32 @maint_check(i8* %253, i32 %260)
  store i32 %261, i32* %7, align 4
  %262 = icmp slt i32 %261, 0
  br i1 %262, label %263, label %277

; <label>:263:                                    ; preds = %252
  %264 = load i32, i32* %7, align 4
  %265 = icmp eq i32 %264, -7
  br i1 %265, label %266, label %272

; <label>:266:                                    ; preds = %263
  %pgocount36 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 76)
  %267 = add i64 %pgocount36, 1
  store i64 %267, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 76)
  %268 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %269 = call i8* @LANG(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.121, i32 0, i32 0))
  %270 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %271 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %268, i8* %269, i8* %270)
  br label %272

; <label>:272:                                    ; preds = %266, %263
  %pgocount37 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 45)
  %273 = add i64 %pgocount37, 1
  store i64 %273, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 45)
  %274 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %275 = call i8* @LANG(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.120, i32 0, i32 0))
  %276 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %274, i8* %275)
  store i32 17, i32* @errorLvl, align 4
  br label %277

; <label>:277:                                    ; preds = %272, %252
  %278 = load i32, i32* %7, align 4
  store i32 %278, i32* %2, align 4
  br label %887

; <label>:279:                                    ; preds = %54
  %280 = load i32, i32* @myArgc, align 4
  %281 = icmp sge i32 %280, 4
  br i1 %281, label %282, label %288

; <label>:282:                                    ; preds = %279
  %283 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %284 = load i8**, i8*** @myArgv, align 8
  %285 = getelementptr inbounds i8*, i8** %284, i64 3
  %286 = load i8*, i8** %285, align 8
  %287 = call i8* @strncpy(i8* %283, i8* %286, i64 255) #7
  br label %292

; <label>:288:                                    ; preds = %279
  %pgocount38 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 25)
  %289 = add i64 %pgocount38, 1
  store i64 %289, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 25)
  %290 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %291 = call i8* @strcpy(i8* %290, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #7
  br label %292

; <label>:292:                                    ; preds = %288, %282
  %293 = load i32, i32* @myArgc, align 4
  %294 = icmp sge i32 %293, 3
  br i1 %294, label %295, label %301

; <label>:295:                                    ; preds = %292
  %pgocount39 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 26)
  %296 = add i64 %pgocount39, 1
  store i64 %296, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 26)
  %297 = load i8**, i8*** @myArgv, align 8
  %298 = getelementptr inbounds i8*, i8** %297, i64 2
  %299 = load i8*, i8** %298, align 8
  %300 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %299) #7
  br label %315

; <label>:301:                                    ; preds = %292
  %302 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %303 = call i8* @LANG(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.122, i32 0, i32 0))
  %304 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %302, i8* %303)
  %305 = load i8, i8* @batchmode, align 1
  %306 = icmp ne i8 %305, 0
  br i1 %306, label %307, label %309

; <label>:307:                                    ; preds = %301
  %pgocount40 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 52)
  %308 = add i64 %pgocount40, 1
  store i64 %308, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 52)
  store i32 -1, i32* %2, align 4
  br label %887

; <label>:309:                                    ; preds = %301
  %pgocount41 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 77)
  %310 = add i64 %pgocount41, 1
  store i64 %310, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 77)
  %311 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %312 = call i8* @LANG(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.123, i32 0, i32 0))
  %313 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %311, i8* %312)
  %314 = call i32 @getstring(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i32 255, i32 1)
  br label %315

; <label>:315:                                    ; preds = %309, %295
  %316 = load i8, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @my_name, i64 0, i64 0), align 16
  %317 = sext i8 %316 to i32
  %318 = icmp eq i32 %317, 0
  br i1 %318, label %319, label %327

; <label>:319:                                    ; preds = %315
  %pgocount42 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 62)
  %320 = add i64 %pgocount42, 1
  store i64 %320, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 62)
  %321 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %322 = call i8* @LANG(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.35, i32 0, i32 0))
  %323 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %321, i8* %322)
  %324 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %325 = call i8* @LANG(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @.str.36, i32 0, i32 0))
  %326 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %324, i8* %325)
  br label %327

; <label>:327:                                    ; preds = %319, %315
  %328 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %329 = call i32 @signkey(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* getelementptr inbounds ([256 x i8], [256 x i8]* @my_name, i32 0, i32 0), i8* %328)
  store i32 %329, i32* %7, align 4
  %330 = load i32, i32* %7, align 4
  %331 = icmp sge i32 %330, 0
  br i1 %331, label %332, label %352

; <label>:332:                                    ; preds = %327
  %333 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %334 = call i32 @maint_update(i8* %333, %struct.newkey* null)
  store i32 %334, i32* %7, align 4
  %335 = load i32, i32* %7, align 4
  %336 = icmp eq i32 %335, -7
  br i1 %336, label %337, label %342

; <label>:337:                                    ; preds = %332
  %pgocount43 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 84)
  %338 = add i64 %pgocount43, 1
  store i64 %338, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 84)
  %339 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %340 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %341 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %339, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.124, i32 0, i32 0), i8* %340)
  store i32 0, i32* %2, align 4
  br label %887

; <label>:342:                                    ; preds = %332
  %343 = load i32, i32* %7, align 4
  %344 = icmp slt i32 %343, 0
  br i1 %344, label %345, label %350

; <label>:345:                                    ; preds = %342
  %pgocount44 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 97)
  %346 = add i64 %pgocount44, 1
  store i64 %346, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 97)
  %347 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %348 = call i8* @LANG(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.120, i32 0, i32 0))
  %349 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %347, i8* %348)
  br label %350

; <label>:350:                                    ; preds = %345, %342
  %pgocount45 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 85)
  %351 = add i64 %pgocount45, 1
  store i64 %351, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 85)
  br label %352

; <label>:352:                                    ; preds = %350, %327
  %353 = load i32, i32* %7, align 4
  %354 = icmp slt i32 %353, 0
  br i1 %354, label %355, label %360

; <label>:355:                                    ; preds = %352
  %pgocount46 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 74)
  %356 = add i64 %pgocount46, 1
  store i64 %356, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 74)
  %357 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %358 = call i8* @LANG(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.125, i32 0, i32 0))
  %359 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %357, i8* %358)
  store i32 18, i32* @errorLvl, align 4
  br label %360

; <label>:360:                                    ; preds = %355, %352
  %361 = load i32, i32* %7, align 4
  store i32 %361, i32* %2, align 4
  br label %887

; <label>:362:                                    ; preds = %54
  %363 = load i32, i32* @myArgc, align 4
  %364 = icmp sge i32 %363, 4
  br i1 %364, label %365, label %371

; <label>:365:                                    ; preds = %362
  %366 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %367 = load i8**, i8*** @myArgv, align 8
  %368 = getelementptr inbounds i8*, i8** %367, i64 3
  %369 = load i8*, i8** %368, align 8
  %370 = call i8* @strncpy(i8* %366, i8* %369, i64 255) #7
  br label %375

; <label>:371:                                    ; preds = %362
  %pgocount47 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 27)
  %372 = add i64 %pgocount47, 1
  store i64 %372, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 27)
  %373 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %374 = call i8* @strcpy(i8* %373, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #7
  br label %375

; <label>:375:                                    ; preds = %371, %365
  %376 = load i32, i32* @myArgc, align 4
  %377 = icmp sge i32 %376, 3
  br i1 %377, label %378, label %384

; <label>:378:                                    ; preds = %375
  %pgocount48 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 28)
  %379 = add i64 %pgocount48, 1
  store i64 %379, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 28)
  %380 = load i8**, i8*** @myArgv, align 8
  %381 = getelementptr inbounds i8*, i8** %380, i64 2
  %382 = load i8*, i8** %381, align 8
  %383 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %382) #7
  br label %393

; <label>:384:                                    ; preds = %375
  %pgocount49 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 29)
  %385 = add i64 %pgocount49, 1
  store i64 %385, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 29)
  %386 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %387 = call i8* @LANG(i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.126, i32 0, i32 0))
  %388 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %386, i8* %387)
  %389 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %390 = call i8* @LANG(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.127, i32 0, i32 0))
  %391 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %389, i8* %390)
  %392 = call i32 @getstring(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i32 255, i32 1)
  br label %393

; <label>:393:                                    ; preds = %384, %378
  %394 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %395 = call i32 @disable_key(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %394)
  store i32 %395, i32* %7, align 4
  %396 = load i32, i32* %7, align 4
  %397 = icmp sge i32 %396, 0
  br i1 %397, label %398, label %418

; <label>:398:                                    ; preds = %393
  %399 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %400 = call i32 @maint_update(i8* %399, %struct.newkey* null)
  store i32 %400, i32* %7, align 4
  %401 = load i32, i32* %7, align 4
  %402 = icmp eq i32 %401, -7
  br i1 %402, label %403, label %408

; <label>:403:                                    ; preds = %398
  %pgocount50 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 67)
  %404 = add i64 %pgocount50, 1
  store i64 %404, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 67)
  %405 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %406 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %407 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %405, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.124, i32 0, i32 0), i8* %406)
  store i32 0, i32* %2, align 4
  br label %887

; <label>:408:                                    ; preds = %398
  %409 = load i32, i32* %7, align 4
  %410 = icmp slt i32 %409, 0
  br i1 %410, label %411, label %416

; <label>:411:                                    ; preds = %408
  %pgocount51 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 96)
  %412 = add i64 %pgocount51, 1
  store i64 %412, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 96)
  %413 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %414 = call i8* @LANG(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.120, i32 0, i32 0))
  %415 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %413, i8* %414)
  br label %416

; <label>:416:                                    ; preds = %411, %408
  %pgocount52 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 68)
  %417 = add i64 %pgocount52, 1
  store i64 %417, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 68)
  br label %418

; <label>:418:                                    ; preds = %416, %393
  %419 = load i32, i32* %7, align 4
  %420 = icmp slt i32 %419, 0
  br i1 %420, label %421, label %423

; <label>:421:                                    ; preds = %418
  %pgocount53 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 58)
  %422 = add i64 %pgocount53, 1
  store i64 %422, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 58)
  store i32 18, i32* @errorLvl, align 4
  br label %423

; <label>:423:                                    ; preds = %421, %418
  %424 = load i32, i32* %7, align 4
  store i32 %424, i32* %2, align 4
  br label %887

; <label>:425:                                    ; preds = %54
  %426 = load i32, i32* @myArgc, align 4
  %427 = icmp sge i32 %426, 4
  br i1 %427, label %428, label %434

; <label>:428:                                    ; preds = %425
  %429 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %430 = load i8**, i8*** @myArgv, align 8
  %431 = getelementptr inbounds i8*, i8** %430, i64 3
  %432 = load i8*, i8** %431, align 8
  %433 = call i8* @strncpy(i8* %429, i8* %432, i64 255) #7
  br label %438

; <label>:434:                                    ; preds = %425
  %pgocount54 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 30)
  %435 = add i64 %pgocount54, 1
  store i64 %435, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 30)
  %436 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %437 = call i8* @strcpy(i8* %436, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #7
  br label %438

; <label>:438:                                    ; preds = %434, %428
  %439 = load i32, i32* @myArgc, align 4
  %440 = icmp sge i32 %439, 3
  br i1 %440, label %441, label %447

; <label>:441:                                    ; preds = %438
  %pgocount55 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 31)
  %442 = add i64 %pgocount55, 1
  store i64 %442, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 31)
  %443 = load i8**, i8*** @myArgv, align 8
  %444 = getelementptr inbounds i8*, i8** %443, i64 2
  %445 = load i8*, i8** %444, align 8
  %446 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %445) #7
  br label %456

; <label>:447:                                    ; preds = %438
  %pgocount56 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 32)
  %448 = add i64 %pgocount56, 1
  store i64 %448, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 32)
  %449 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %450 = call i8* @LANG(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.128, i32 0, i32 0))
  %451 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %449, i8* %450)
  %452 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %453 = call i8* @LANG(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.129, i32 0, i32 0))
  %454 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %452, i8* %453)
  %455 = call i32 @getstring(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i32 255, i32 1)
  br label %456

; <label>:456:                                    ; preds = %447, %441
  %457 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %458 = call i32 @dokeyedit(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %457)
  store i32 %458, i32* %7, align 4
  %459 = load i32, i32* %7, align 4
  %460 = icmp sge i32 %459, 0
  br i1 %460, label %461, label %478

; <label>:461:                                    ; preds = %456
  %462 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %463 = call i32 @maint_update(i8* %462, %struct.newkey* null)
  store i32 %463, i32* %7, align 4
  %464 = load i32, i32* %7, align 4
  %465 = icmp eq i32 %464, -7
  br i1 %465, label %466, label %468

; <label>:466:                                    ; preds = %461
  %pgocount57 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 69)
  %467 = add i64 %pgocount57, 1
  store i64 %467, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 69)
  store i32 0, i32* %7, align 4
  br label %468

; <label>:468:                                    ; preds = %466, %461
  %469 = load i32, i32* %7, align 4
  %470 = icmp slt i32 %469, 0
  br i1 %470, label %471, label %476

; <label>:471:                                    ; preds = %468
  %pgocount58 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 78)
  %472 = add i64 %pgocount58, 1
  store i64 %472, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 78)
  %473 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %474 = call i8* @LANG(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.120, i32 0, i32 0))
  %475 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %473, i8* %474)
  br label %476

; <label>:476:                                    ; preds = %471, %468
  %pgocount59 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 33)
  %477 = add i64 %pgocount59, 1
  store i64 %477, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 33)
  br label %478

; <label>:478:                                    ; preds = %476, %456
  %479 = load i32, i32* %7, align 4
  %480 = icmp slt i32 %479, 0
  br i1 %480, label %481, label %486

; <label>:481:                                    ; preds = %478
  %pgocount60 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 46)
  %482 = add i64 %pgocount60, 1
  store i64 %482, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 46)
  %483 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %484 = call i8* @LANG(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.130, i32 0, i32 0))
  %485 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %483, i8* %484)
  store i32 14, i32* @errorLvl, align 4
  br label %486

; <label>:486:                                    ; preds = %481, %478
  %487 = load i32, i32* %7, align 4
  store i32 %487, i32* %2, align 4
  br label %887

; <label>:488:                                    ; preds = %54
  %489 = load i32, i32* @myArgc, align 4
  %490 = icmp slt i32 %489, 3
  br i1 %490, label %491, label %497

; <label>:491:                                    ; preds = %488
  %pgocount61 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 34)
  %492 = add i64 %pgocount61, 1
  store i64 %492, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 34)
  %493 = load i8, i8* @filter_mode, align 1
  %494 = icmp ne i8 %493, 0
  br i1 %494, label %497, label %495

; <label>:495:                                    ; preds = %491
  %pgocount62 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 79)
  %496 = add i64 %pgocount62, 1
  store i64 %496, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 79)
  call void @arg_error()
  br label %497

; <label>:497:                                    ; preds = %495, %491, %488
  %498 = load i8, i8* @filter_mode, align 1
  %499 = icmp ne i8 %498, 0
  br i1 %499, label %525, label %500

; <label>:500:                                    ; preds = %497
  %501 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %502 = load i8**, i8*** @myArgv, align 8
  %503 = getelementptr inbounds i8*, i8** %502, i64 2
  %504 = load i8*, i8** %503, align 8
  %505 = call i8* @strncpy(i8* %501, i8* %504, i64 255) #7
  %506 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %507 = call zeroext i8 @file_exists(i8* %506)
  %508 = icmp ne i8 %507, 0
  br i1 %508, label %512, label %509

; <label>:509:                                    ; preds = %500
  %pgocount63 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 90)
  %510 = add i64 %pgocount63, 1
  store i64 %510, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 90)
  %511 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  call void @default_extension(i8* %511, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  br label %512

; <label>:512:                                    ; preds = %509, %500
  %513 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %514 = call zeroext i8 @file_exists(i8* %513)
  %515 = icmp ne i8 %514, 0
  br i1 %515, label %522, label %516

; <label>:516:                                    ; preds = %512
  %pgocount64 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 91)
  %517 = add i64 %pgocount64, 1
  store i64 %517, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 91)
  %518 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %519 = call i8* @LANG(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.131, i32 0, i32 0))
  %520 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %521 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %518, i8* %519, i8* %520)
  store i32 11, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %887

; <label>:522:                                    ; preds = %512
  %pgocount65 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 71)
  %523 = add i64 %pgocount65, 1
  store i64 %523, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 71)
  %524 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  store i8* %524, i8** %6, align 8
  br label %529

; <label>:525:                                    ; preds = %497
  %526 = call i8* @tempfile(i32 5)
  store i8* %526, i8** %6, align 8
  %527 = load i8*, i8** %6, align 8
  %528 = call i32 @readPhantomInput(i8* %527)
  br label %529

; <label>:529:                                    ; preds = %525, %522
  %530 = load i32, i32* @myArgc, align 4
  %531 = load i8, i8* @filter_mode, align 1
  %532 = zext i8 %531 to i32
  %533 = icmp ne i32 %532, 0
  %534 = zext i1 %533 to i64
  %pgocount66 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 103)
  %535 = add i64 %pgocount66, %534
  store i64 %535, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 103)
  %536 = select i1 %533, i32 3, i32 4
  %537 = icmp slt i32 %530, %536
  br i1 %537, label %538, label %553

; <label>:538:                                    ; preds = %529
  %539 = load i8*, i8** %6, align 8
  %540 = call i32 @get_header_info_from_file(i8* %539, i8* %12, i32 1)
  %541 = load i8, i8* %12, align 1
  %542 = zext i8 %541 to i32
  %543 = icmp eq i32 %542, 149
  br i1 %543, label %544, label %548

; <label>:544:                                    ; preds = %538
  %pgocount67 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 72)
  %545 = add i64 %pgocount67, 1
  store i64 %545, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 72)
  %546 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %547 = call i8* @strcpy(i8* %546, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalSecringName, i32 0, i32 0)) #7
  br label %552

; <label>:548:                                    ; preds = %538
  %pgocount68 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 73)
  %549 = add i64 %pgocount68, 1
  store i64 %549, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 73)
  %550 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %551 = call i8* @strcpy(i8* %550, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #7
  br label %552

; <label>:552:                                    ; preds = %548, %544
  br label %568

; <label>:553:                                    ; preds = %529
  %pgocount69 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 38)
  %554 = add i64 %pgocount69, 1
  store i64 %554, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 38)
  %555 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %556 = load i8**, i8*** @myArgv, align 8
  %557 = load i8, i8* @filter_mode, align 1
  %558 = zext i8 %557 to i32
  %559 = icmp ne i32 %558, 0
  %560 = zext i1 %559 to i64
  %pgocount70 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 104)
  %561 = add i64 %pgocount70, %560
  store i64 %561, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 104)
  %562 = select i1 %559, i32 2, i32 3
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds i8*, i8** %556, i64 %563
  %565 = load i8*, i8** %564, align 8
  %566 = call i8* @strncpy(i8* %555, i8* %565, i64 255) #7
  %567 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  call void @default_extension(i8* %567, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  br label %568

; <label>:568:                                    ; preds = %553, %552
  %569 = load i8*, i8** %6, align 8
  %570 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %571 = call i32 @addto_keyring(i8* %569, i8* %570)
  store i32 %571, i32* %7, align 4
  %572 = load i8, i8* @filter_mode, align 1
  %573 = icmp ne i8 %572, 0
  br i1 %573, label %574, label %577

; <label>:574:                                    ; preds = %568
  %pgocount71 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 18)
  %575 = add i64 %pgocount71, 1
  store i64 %575, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 18)
  %576 = load i8*, i8** %6, align 8
  call void @rmtemp(i8* %576)
  br label %577

; <label>:577:                                    ; preds = %574, %568
  %578 = load i32, i32* %7, align 4
  %579 = icmp slt i32 %578, 0
  br i1 %579, label %580, label %585

; <label>:580:                                    ; preds = %577
  %pgocount72 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 50)
  %581 = add i64 %pgocount72, 1
  store i64 %581, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 50)
  %582 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %583 = call i8* @LANG(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.76, i32 0, i32 0))
  %584 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %582, i8* %583)
  store i32 12, i32* @errorLvl, align 4
  br label %585

; <label>:585:                                    ; preds = %580, %577
  %586 = load i32, i32* %7, align 4
  store i32 %586, i32* %2, align 4
  br label %887

; <label>:587:                                    ; preds = %54
  %588 = load i32, i32* @myArgc, align 4
  %589 = load i8, i8* @filter_mode, align 1
  %590 = zext i8 %589 to i32
  %591 = icmp ne i32 %590, 0
  %592 = zext i1 %591 to i64
  %pgocount73 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 105)
  %593 = add i64 %pgocount73, %592
  store i64 %593, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 105)
  %594 = select i1 %591, i32 4, i32 5
  %595 = icmp sge i32 %588, %594
  br i1 %595, label %596, label %609

; <label>:596:                                    ; preds = %587
  %597 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %598 = load i8**, i8*** @myArgv, align 8
  %599 = load i8, i8* @filter_mode, align 1
  %600 = zext i8 %599 to i32
  %601 = icmp ne i32 %600, 0
  %602 = zext i1 %601 to i64
  %pgocount74 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 106)
  %603 = add i64 %pgocount74, %602
  store i64 %603, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 106)
  %604 = select i1 %601, i32 3, i32 4
  %605 = sext i32 %604 to i64
  %606 = getelementptr inbounds i8*, i8** %598, i64 %605
  %607 = load i8*, i8** %606, align 8
  %608 = call i8* @strncpy(i8* %597, i8* %607, i64 255) #7
  br label %613

; <label>:609:                                    ; preds = %587
  %pgocount75 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 35)
  %610 = add i64 %pgocount75, 1
  store i64 %610, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 35)
  %611 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %612 = call i8* @strcpy(i8* %611, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #7
  br label %613

; <label>:613:                                    ; preds = %609, %596
  %614 = load i32, i32* @myArgc, align 4
  %615 = load i8, i8* @filter_mode, align 1
  %616 = zext i8 %615 to i32
  %617 = icmp ne i32 %616, 0
  %618 = zext i1 %617 to i64
  %pgocount76 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 107)
  %619 = add i64 %pgocount76, %618
  store i64 %619, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 107)
  %620 = select i1 %617, i32 2, i32 3
  %621 = icmp sge i32 %614, %620
  br i1 %621, label %622, label %637

; <label>:622:                                    ; preds = %613
  %623 = load i8**, i8*** @myArgv, align 8
  %624 = getelementptr inbounds i8*, i8** %623, i64 2
  %625 = load i8*, i8** %624, align 8
  %626 = icmp ne i8* %625, null
  br i1 %626, label %627, label %633

; <label>:627:                                    ; preds = %622
  %pgocount77 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 53)
  %628 = add i64 %pgocount77, 1
  store i64 %628, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 53)
  %629 = load i8**, i8*** @myArgv, align 8
  %630 = getelementptr inbounds i8*, i8** %629, i64 2
  %631 = load i8*, i8** %630, align 8
  %632 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %631) #7
  br label %636

; <label>:633:                                    ; preds = %622
  %pgocount78 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 80)
  %634 = add i64 %pgocount78, 1
  store i64 %634, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 80)
  %635 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.41, i32 0, i32 0)) #7
  br label %636

; <label>:636:                                    ; preds = %633, %627
  br label %651

; <label>:637:                                    ; preds = %613
  %638 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %639 = call i8* @LANG(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.132, i32 0, i32 0))
  %640 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %638, i8* %639)
  %641 = load i8, i8* @batchmode, align 1
  %642 = icmp ne i8 %641, 0
  br i1 %642, label %643, label %645

; <label>:643:                                    ; preds = %637
  %pgocount79 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 54)
  %644 = add i64 %pgocount79, 1
  store i64 %644, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 54)
  store i32 -1, i32* %2, align 4
  br label %887

; <label>:645:                                    ; preds = %637
  %pgocount80 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 81)
  %646 = add i64 %pgocount80, 1
  store i64 %646, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 81)
  %647 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %648 = call i8* @LANG(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.129, i32 0, i32 0))
  %649 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %647, i8* %648)
  %650 = call i32 @getstring(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i32 255, i32 1)
  br label %651

; <label>:651:                                    ; preds = %645, %636
  %652 = load i8, i8* @filter_mode, align 1
  %653 = icmp ne i8 %652, 0
  br i1 %653, label %669, label %654

; <label>:654:                                    ; preds = %651
  %655 = load i32, i32* @myArgc, align 4
  %656 = icmp sge i32 %655, 4
  br i1 %656, label %657, label %664

; <label>:657:                                    ; preds = %654
  %pgocount81 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 93)
  %658 = add i64 %pgocount81, 1
  store i64 %658, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 93)
  %659 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %660 = load i8**, i8*** @myArgv, align 8
  %661 = getelementptr inbounds i8*, i8** %660, i64 3
  %662 = load i8*, i8** %661, align 8
  %663 = call i8* @strncpy(i8* %659, i8* %662, i64 255) #7
  br label %667

; <label>:664:                                    ; preds = %654
  %pgocount82 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 94)
  %665 = add i64 %pgocount82, 1
  store i64 %665, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 94)
  %666 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 0, i64 0
  store i8 0, i8* %666, align 16
  br label %667

; <label>:667:                                    ; preds = %664, %657
  %668 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  store i8* %668, i8** %6, align 8
  br label %671

; <label>:669:                                    ; preds = %651
  %670 = call i8* @tempfile(i32 5)
  store i8* %670, i8** %6, align 8
  br label %671

; <label>:671:                                    ; preds = %669, %667
  %672 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  call void @default_extension(i8* %672, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  %673 = load i8*, i8** %6, align 8
  %674 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %675 = load i8, i8* @filter_mode, align 1
  %676 = zext i8 %675 to i32
  %677 = icmp ne i32 %676, 0
  br i1 %677, label %678, label %679

; <label>:678:                                    ; preds = %671
  br label %683

; <label>:679:                                    ; preds = %671
  %pgocount83 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 63)
  %680 = add i64 %pgocount83, 1
  store i64 %680, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 63)
  %681 = load i8, i8* @emit_radix_64, align 1
  %682 = zext i8 %681 to i32
  br label %683

; <label>:683:                                    ; preds = %679, %678
  %684 = phi i32 [ 0, %678 ], [ %682, %679 ]
  %685 = trunc i32 %684 to i8
  %686 = call i32 @extract_from_keyring(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %673, i8* %674, i8 zeroext %685)
  store i32 %686, i32* %7, align 4
  %687 = load i32, i32* %7, align 4
  %688 = icmp slt i32 %687, 0
  br i1 %688, label %689, label %701

; <label>:689:                                    ; preds = %683
  %690 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %691 = call i8* @LANG(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.133, i32 0, i32 0))
  %692 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %690, i8* %691)
  store i32 13, i32* @errorLvl, align 4
  %693 = load i8, i8* @filter_mode, align 1
  %694 = icmp ne i8 %693, 0
  br i1 %694, label %695, label %698

; <label>:695:                                    ; preds = %689
  %pgocount84 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 86)
  %696 = add i64 %pgocount84, 1
  store i64 %696, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 86)
  %697 = load i8*, i8** %6, align 8
  call void @rmtemp(i8* %697)
  br label %698

; <label>:698:                                    ; preds = %695, %689
  %pgocount85 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 64)
  %699 = add i64 %pgocount85, 1
  store i64 %699, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 64)
  %700 = load i32, i32* %7, align 4
  store i32 %700, i32* %2, align 4
  br label %887

; <label>:701:                                    ; preds = %683
  %702 = load i8, i8* @filter_mode, align 1
  %703 = zext i8 %702 to i32
  %704 = icmp ne i32 %703, 0
  br i1 %704, label %705, label %730

; <label>:705:                                    ; preds = %701
  %pgocount86 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 59)
  %706 = add i64 %pgocount86, 1
  store i64 %706, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 59)
  %707 = load i32, i32* %7, align 4
  %708 = icmp ne i32 %707, 0
  br i1 %708, label %730, label %709

; <label>:709:                                    ; preds = %705
  %710 = load i8, i8* @emit_radix_64, align 1
  %711 = icmp ne i8 %710, 0
  br i1 %711, label %712, label %720

; <label>:712:                                    ; preds = %709
  %713 = load i8*, i8** %6, align 8
  %714 = call i32 @armor_file(i8* %713, i8* null, i8* null, i8* null, i8 zeroext 0)
  %715 = icmp ne i32 %714, 0
  br i1 %715, label %716, label %718

; <label>:716:                                    ; preds = %712
  %pgocount87 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 98)
  %717 = add i64 %pgocount87, 1
  store i64 %717, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 98)
  store i32 3, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %887

; <label>:718:                                    ; preds = %712
  %pgocount88 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 99)
  %719 = add i64 %pgocount88, 1
  store i64 %719, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 99)
  br label %728

; <label>:720:                                    ; preds = %709
  %721 = load i8*, i8** %6, align 8
  %722 = call i32 @writePhantomOutput(i8* %721)
  %723 = icmp slt i32 %722, 0
  br i1 %723, label %724, label %726

; <label>:724:                                    ; preds = %720
  %pgocount89 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 101)
  %725 = add i64 %pgocount89, 1
  store i64 %725, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 101)
  store i32 3, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %887

; <label>:726:                                    ; preds = %720
  %pgocount90 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 100)
  %727 = add i64 %pgocount90, 1
  store i64 %727, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 100)
  br label %728

; <label>:728:                                    ; preds = %726, %718
  %729 = load i8*, i8** %6, align 8
  call void @rmtemp(i8* %729)
  br label %730

; <label>:730:                                    ; preds = %728, %705, %701
  store i32 0, i32* %2, align 4
  br label %887

; <label>:731:                                    ; preds = %54
  %732 = load i32, i32* @myArgc, align 4
  %733 = icmp sge i32 %732, 4
  br i1 %733, label %734, label %740

; <label>:734:                                    ; preds = %731
  %735 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %736 = load i8**, i8*** @myArgv, align 8
  %737 = getelementptr inbounds i8*, i8** %736, i64 3
  %738 = load i8*, i8** %737, align 8
  %739 = call i8* @strcpy(i8* %735, i8* %738) #7
  br label %744

; <label>:740:                                    ; preds = %731
  %pgocount91 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 36)
  %741 = add i64 %pgocount91, 1
  store i64 %741, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 36)
  %742 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %743 = call i8* @strcpy(i8* %742, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #7
  br label %744

; <label>:744:                                    ; preds = %740, %734
  %745 = load i32, i32* @myArgc, align 4
  %746 = icmp sge i32 %745, 3
  br i1 %746, label %747, label %752

; <label>:747:                                    ; preds = %744
  %748 = load i8**, i8*** @myArgv, align 8
  %749 = getelementptr inbounds i8*, i8** %748, i64 2
  %750 = load i8*, i8** %749, align 8
  %751 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %750) #7
  br label %775

; <label>:752:                                    ; preds = %744
  %753 = load i8, i8* @sign_flag, align 1
  %754 = icmp ne i8 %753, 0
  br i1 %754, label %755, label %759

; <label>:755:                                    ; preds = %752
  %756 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %757 = call i8* @LANG(i8* getelementptr inbounds ([96 x i8], [96 x i8]* @.str.134, i32 0, i32 0))
  %758 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %756, i8* %757)
  br label %764

; <label>:759:                                    ; preds = %752
  %pgocount92 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 82)
  %760 = add i64 %pgocount92, 1
  store i64 %760, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 82)
  %761 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %762 = call i8* @LANG(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.135, i32 0, i32 0))
  %763 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %761, i8* %762)
  br label %764

; <label>:764:                                    ; preds = %759, %755
  %765 = load i8, i8* @batchmode, align 1
  %766 = icmp ne i8 %765, 0
  br i1 %766, label %767, label %769

; <label>:767:                                    ; preds = %764
  %pgocount93 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 55)
  %768 = add i64 %pgocount93, 1
  store i64 %768, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 55)
  store i32 -1, i32* %2, align 4
  br label %887

; <label>:769:                                    ; preds = %764
  %pgocount94 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 83)
  %770 = add i64 %pgocount94, 1
  store i64 %770, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 83)
  %771 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %772 = call i8* @LANG(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.129, i32 0, i32 0))
  %773 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %771, i8* %772)
  %774 = call i32 @getstring(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i32 255, i32 1)
  br label %775

; <label>:775:                                    ; preds = %769, %747
  %776 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %777 = call zeroext i8 @file_exists(i8* %776)
  %778 = icmp ne i8 %777, 0
  br i1 %778, label %782, label %779

; <label>:779:                                    ; preds = %775
  %pgocount95 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 65)
  %780 = add i64 %pgocount95, 1
  store i64 %780, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 65)
  %781 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  call void @default_extension(i8* %781, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  br label %782

; <label>:782:                                    ; preds = %779, %775
  %783 = load i8, i8* @sign_flag, align 1
  %784 = icmp ne i8 %783, 0
  br i1 %784, label %785, label %796

; <label>:785:                                    ; preds = %782
  %786 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %787 = call i32 @remove_sigs(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %786)
  %788 = icmp slt i32 %787, 0
  br i1 %788, label %789, label %794

; <label>:789:                                    ; preds = %785
  %pgocount96 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 87)
  %790 = add i64 %pgocount96, 1
  store i64 %790, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 87)
  %791 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %792 = call i8* @LANG(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.136, i32 0, i32 0))
  %793 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %791, i8* %792)
  store i32 19, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %887

; <label>:794:                                    ; preds = %785
  %pgocount97 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 60)
  %795 = add i64 %pgocount97, 1
  store i64 %795, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 60)
  br label %811

; <label>:796:                                    ; preds = %782
  %797 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %798 = load i32, i32* @myArgc, align 4
  %799 = icmp slt i32 %798, 4
  %800 = zext i1 %799 to i32
  %801 = trunc i32 %800 to i8
  %802 = call i32 @remove_from_keyring(i8* null, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %797, i8 zeroext %801)
  %803 = icmp slt i32 %802, 0
  br i1 %803, label %804, label %809

; <label>:804:                                    ; preds = %796
  %pgocount98 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 95)
  %805 = add i64 %pgocount98, 1
  store i64 %805, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 95)
  %806 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %807 = call i8* @LANG(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.137, i32 0, i32 0))
  %808 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %806, i8* %807)
  store i32 16, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %887

; <label>:809:                                    ; preds = %796
  %pgocount99 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 88)
  %810 = add i64 %pgocount99, 1
  store i64 %810, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 88)
  br label %811

; <label>:811:                                    ; preds = %809, %794
  store i32 0, i32* %2, align 4
  br label %887

; <label>:812:                                    ; preds = %._crit_edge, %54
  %813 = load i32, i32* @myArgc, align 4
  %814 = icmp slt i32 %813, 4
  br i1 %814, label %815, label %818

; <label>:815:                                    ; preds = %812
  %816 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %817 = call i8* @strcpy(i8* %816, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #7
  br label %825

; <label>:818:                                    ; preds = %812
  %pgocount100 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 9)
  %819 = add i64 %pgocount100, 1
  store i64 %819, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 9)
  %820 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %821 = load i8**, i8*** @myArgv, align 8
  %822 = getelementptr inbounds i8*, i8** %821, i64 3
  %823 = load i8*, i8** %822, align 8
  %824 = call i8* @strcpy(i8* %820, i8* %823) #7
  br label %825

; <label>:825:                                    ; preds = %818, %815
  %826 = load i32, i32* @myArgc, align 4
  %827 = icmp sgt i32 %826, 2
  br i1 %827, label %828, label %839

; <label>:828:                                    ; preds = %825
  %829 = load i8**, i8*** @myArgv, align 8
  %830 = getelementptr inbounds i8*, i8** %829, i64 2
  %831 = load i8*, i8** %830, align 8
  %832 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %831) #7
  %833 = call i32 @strcmp(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.118, i32 0, i32 0)) #8
  %834 = icmp eq i32 %833, 0
  br i1 %834, label %835, label %837

; <label>:835:                                    ; preds = %828
  %pgocount101 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 47)
  %836 = add i64 %pgocount101, 1
  store i64 %836, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 47)
  store i8 0, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i64 0, i64 0), align 16
  br label %837

; <label>:837:                                    ; preds = %835, %828
  %pgocount102 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 10)
  %838 = add i64 %pgocount102, 1
  store i64 %838, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 10)
  br label %841

; <label>:839:                                    ; preds = %825
  %pgocount103 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 11)
  %840 = add i64 %pgocount103, 1
  store i64 %840, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 11)
  store i8 0, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), align 16
  br label %841

; <label>:841:                                    ; preds = %839, %837
  %842 = load i32, i32* @myArgc, align 4
  %843 = icmp eq i32 %842, 3
  br i1 %843, label %844, label %859

; <label>:844:                                    ; preds = %841
  %pgocount104 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 12)
  %845 = add i64 %pgocount104, 1
  store i64 %845, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 12)
  %846 = load i8**, i8*** @myArgv, align 8
  %847 = getelementptr inbounds i8*, i8** %846, i64 2
  %848 = load i8*, i8** %847, align 8
  %849 = call zeroext i8 @has_extension(i8* %848, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  %850 = zext i8 %849 to i32
  %851 = icmp ne i32 %850, 0
  br i1 %851, label %852, label %859

; <label>:852:                                    ; preds = %844
  %pgocount105 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 17)
  %853 = add i64 %pgocount105, 1
  store i64 %853, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 17)
  %854 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %855 = load i8**, i8*** @myArgv, align 8
  %856 = getelementptr inbounds i8*, i8** %855, i64 2
  %857 = load i8*, i8** %856, align 8
  %858 = call i8* @strcpy(i8* %854, i8* %857) #7
  store i8 0, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i64 0, i64 0), align 16
  br label %859

; <label>:859:                                    ; preds = %852, %844, %841
  %860 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %861 = call zeroext i8 @file_exists(i8* %860)
  %862 = icmp ne i8 %861, 0
  br i1 %862, label %866, label %863

; <label>:863:                                    ; preds = %859
  %pgocount106 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 14)
  %864 = add i64 %pgocount106, 1
  store i64 %864, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 14)
  %865 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  call void @default_extension(i8* %865, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  br label %866

; <label>:866:                                    ; preds = %863, %859
  %867 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i32 0, i32 0
  %868 = load i8, i8* %3, align 1
  %869 = sext i8 %868 to i32
  %870 = icmp eq i32 %869, 86
  %871 = zext i1 %870 to i32
  %872 = trunc i32 %871 to i8
  %873 = load i8, i8* @c_flag, align 1
  %874 = call i32 @view_keyring(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @mcguffin, i32 0, i32 0), i8* %867, i8 zeroext %872, i8 zeroext %873)
  store i32 %874, i32* %7, align 4
  %875 = load i32, i32* %7, align 4
  %876 = icmp slt i32 %875, 0
  br i1 %876, label %877, label %882

; <label>:877:                                    ; preds = %866
  %pgocount107 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 15)
  %878 = add i64 %pgocount107, 1
  store i64 %878, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 15)
  %879 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %880 = call i8* @LANG(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.138, i32 0, i32 0))
  %881 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %879, i8* %880)
  store i32 15, i32* @errorLvl, align 4
  br label %882

; <label>:882:                                    ; preds = %877, %866
  %883 = load i32, i32* %7, align 4
  store i32 %883, i32* %2, align 4
  br label %887

; <label>:884:                                    ; preds = %54
  call void @arg_error()
  br label %885

; <label>:885:                                    ; preds = %884
  %pgocount108 = load i64, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 13)
  %886 = add i64 %pgocount108, 1
  store i64 %886, i64* getelementptr inbounds ([108 x i64], [108 x i64]* @__profc_tmp1.ll_do_keyopt, i64 0, i64 13)
  store i32 0, i32* %2, align 4
  br label %887

; <label>:887:                                    ; preds = %885, %882, %811, %804, %789, %767, %730, %724, %716, %698, %643, %585, %516, %486, %423, %403, %360, %337, %307, %277, %229, %205, %135, %83
  %888 = load i32, i32* %2, align 4
  ret i32 %888
}

; Function Attrs: noinline nounwind uwtable
define void @user_error() #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %2 = call i8* @LANG(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.22, i32 0, i32 0))
  %3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* %2)
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %5 = call i8* @LANG(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.45, i32 0, i32 0))
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* %5)
  %7 = load i32, i32* @errorLvl, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_user_error, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_user_error, i64 0, i64 0)
  %11 = load i32, i32* @errorLvl, align 4
  br label %14

; <label>:12:                                     ; preds = %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_user_error, i64 0, i64 1)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_user_error, i64 0, i64 1)
  br label %14

; <label>:14:                                     ; preds = %12, %9
  %15 = phi i32 [ %11, %9 ], [ 127, %12 ]
  call void @exitPGP(i32 %15)
  ret void
}

declare i32 @wipefile(i8*) #3

; Function Attrs: nounwind
declare i32 @remove(i8*) #2

declare zeroext i8 @file_exists(i8*) #3

; Function Attrs: nounwind
declare i32 @isatty(i32) #2

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define i8** @ParseRecipients(i8**) #0 {
  %2 = alloca i8**, align 8
  %3 = alloca i8**, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca [256 x i8], align 16
  %11 = alloca i32, align 4
  store i8** %0, i8*** %3, align 8
  %12 = load i8**, i8*** %3, align 8
  store i8** %12, i8*** %4, align 8
  store i32 128, i32* %7, align 4
  br label %13

; <label>:13:                                     ; preds = %24, %1
  %14 = load i8**, i8*** %3, align 8
  %15 = load i8*, i8** %14, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %17, label %28

; <label>:17:                                     ; preds = %13
  %18 = load i8**, i8*** %3, align 8
  %19 = load i8*, i8** %18, align 8
  %20 = call i32 @strncmp(i8* %19, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0), i64 2) #8
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 16)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 16)
  br label %28

; <label>:24:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 6)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 6)
  %26 = load i8**, i8*** %3, align 8
  %27 = getelementptr inbounds i8*, i8** %26, i32 1
  store i8** %27, i8*** %3, align 8
  br label %13

; <label>:28:                                     ; preds = %22, %13
  %29 = load i8**, i8*** %3, align 8
  %30 = load i8*, i8** %29, align 8
  %31 = icmp ne i8* %30, null
  br i1 %31, label %35, label %32

; <label>:32:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 17)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 17)
  %34 = load i8**, i8*** %4, align 8
  store i8** %34, i8*** %2, align 8
  br label %219

; <label>:35:                                     ; preds = %28
  %36 = load i8**, i8*** %4, align 8
  store i8** %36, i8*** %3, align 8
  %37 = load i32, i32* %7, align 4
  %38 = sext i32 %37 to i64
  %39 = mul i64 %38, 8
  %40 = call i8* (i64, ...) bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %39)
  %41 = bitcast i8* %40 to i8**
  store i8** %41, i8*** %5, align 8
  %42 = icmp ne i8** %41, null
  br i1 %42, label %45, label %43

; <label>:43:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 19)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 19)
  call void @exitPGP(i32 7)
  br label %45

; <label>:45:                                     ; preds = %43, %35
  store i32 0, i32* %6, align 4
  br label %46

; <label>:46:                                     ; preds = %194, %45
  %47 = load i8**, i8*** %3, align 8
  %48 = load i8*, i8** %47, align 8
  %49 = icmp ne i8* %48, null
  br i1 %49, label %50, label %195

; <label>:50:                                     ; preds = %46
  %51 = load i8**, i8*** %3, align 8
  %52 = load i8*, i8** %51, align 8
  %53 = call i32 @strncmp(i8* %52, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0), i64 2) #8
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %83

; <label>:55:                                     ; preds = %50
  %56 = load i8**, i8*** %3, align 8
  %57 = getelementptr inbounds i8*, i8** %56, i32 1
  store i8** %57, i8*** %3, align 8
  %58 = load i8*, i8** %56, align 8
  %59 = load i8**, i8*** %5, align 8
  %60 = load i32, i32* %6, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %6, align 4
  %62 = sext i32 %60 to i64
  %63 = getelementptr inbounds i8*, i8** %59, i64 %62
  store i8* %58, i8** %63, align 8
  %64 = load i32, i32* %6, align 4
  %65 = load i32, i32* %7, align 4
  %66 = icmp eq i32 %64, %65
  br i1 %66, label %67, label %81

; <label>:67:                                     ; preds = %55
  %68 = load i32, i32* %7, align 4
  %69 = add nsw i32 %68, 128
  store i32 %69, i32* %7, align 4
  %70 = load i8**, i8*** %5, align 8
  %71 = load i32, i32* %7, align 4
  %72 = sext i32 %71 to i64
  %73 = mul i64 %72, 8
  %74 = call i8* (i8**, i64, ...) bitcast (i8* (...)* @realloc to i8* (i8**, i64, ...)*)(i8** %70, i64 %73)
  %75 = bitcast i8* %74 to i8**
  store i8** %75, i8*** %5, align 8
  %76 = icmp ne i8** %75, null
  br i1 %76, label %79, label %77

; <label>:77:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 14)
  %78 = add i64 %pgocount4, 1
  store i64 %78, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 14)
  call void @exitPGP(i32 7)
  br label %79

; <label>:79:                                     ; preds = %77, %67
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 9)
  %80 = add i64 %pgocount5, 1
  store i64 %80, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 9)
  br label %81

; <label>:81:                                     ; preds = %79, %55
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 8)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 8)
  br label %194

; <label>:83:                                     ; preds = %50
  %84 = load i8**, i8*** %3, align 8
  %85 = load i8*, i8** %84, align 8
  %86 = call i64 @strlen(i8* %85) #8
  %87 = icmp eq i64 %86, 2
  br i1 %87, label %88, label %93

; <label>:88:                                     ; preds = %83
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 11)
  %89 = add i64 %pgocount7, 1
  store i64 %89, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 11)
  %90 = load i8**, i8*** %3, align 8
  %91 = getelementptr inbounds i8*, i8** %90, i32 1
  store i8** %91, i8*** %3, align 8
  %92 = load i8*, i8** %91, align 8
  store i8* %92, i8** %9, align 8
  br label %99

; <label>:93:                                     ; preds = %83
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 12)
  %94 = add i64 %pgocount8, 1
  store i64 %94, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 12)
  %95 = load i8**, i8*** %3, align 8
  %96 = load i8*, i8** %95, align 8
  %97 = getelementptr inbounds i8, i8* %96, i64 3
  %98 = getelementptr inbounds i8, i8* %97, i64 -1
  store i8* %98, i8** %9, align 8
  br label %99

; <label>:99:                                     ; preds = %93, %88
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %101 = call i8* @LANG(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.47, i32 0, i32 0))
  %102 = load i8*, i8** %9, align 8
  %103 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %100, i8* %101, i8* %102)
  %104 = load i8*, i8** %9, align 8
  %105 = call %struct._IO_FILE* @fopen(i8* %104, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.48, i32 0, i32 0))
  store %struct._IO_FILE* %105, %struct._IO_FILE** %8, align 8
  %106 = icmp ne %struct._IO_FILE* %105, null
  br i1 %106, label %109, label %107

; <label>:107:                                    ; preds = %99
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 13)
  %108 = add i64 %pgocount9, 1
  store i64 %108, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 13)
  call void @perror(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.49, i32 0, i32 0))
  call void @exitPGP(i32 3)
  br label %109

; <label>:109:                                    ; preds = %107, %99
  br label %110

; <label>:110:                                    ; preds = %181, %127, %109
  %111 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i32 0, i32 0
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %113 = call i8* @fgets(i8* %111, i32 255, %struct._IO_FILE* %112)
  %114 = icmp ne i8* %113, null
  br i1 %114, label %115, label %183

; <label>:115:                                    ; preds = %110
  %116 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i32 0, i32 0
  %117 = call i64 @strlen(i8* %116) #8
  %118 = trunc i64 %117 to i32
  store i32 %118, i32* %11, align 4
  %119 = load i32, i32* %11, align 4
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %121, label %127

; <label>:121:                                    ; preds = %115
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 2)
  %122 = add i64 %pgocount10, 1
  store i64 %122, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 2)
  %123 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i32 0, i32 0
  %124 = load i8, i8* %123, align 16
  %125 = sext i8 %124 to i32
  %126 = icmp eq i32 %125, 35
  br i1 %126, label %127, label %129

; <label>:127:                                    ; preds = %121, %115
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 1)
  %128 = add i64 %pgocount11, 1
  store i64 %128, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 1)
  br label %110

; <label>:129:                                    ; preds = %121
  br label %130

; <label>:130:                                    ; preds = %145, %129
  %131 = call i16** @__ctype_b_loc() #10
  %132 = load i16*, i16** %131, align 8
  %133 = load i32, i32* %11, align 4
  %134 = sub nsw i32 %133, 1
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i64 0, i64 %135
  %137 = load i8, i8* %136, align 1
  %138 = sext i8 %137 to i32
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i16, i16* %132, i64 %139
  %141 = load i16, i16* %140, align 2
  %142 = zext i16 %141 to i32
  %143 = and i32 %142, 8192
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %145, label %149

; <label>:145:                                    ; preds = %130
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 0)
  %146 = add i64 %pgocount12, 1
  store i64 %146, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 0)
  %147 = load i32, i32* %11, align 4
  %148 = add nsw i32 %147, -1
  store i32 %148, i32* %11, align 4
  br label %130

; <label>:149:                                    ; preds = %130
  %150 = load i32, i32* %11, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i64 0, i64 %151
  store i8 0, i8* %152, align 1
  %153 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i32 0, i32 0
  %154 = call i8* @store_str(i8* %153)
  %155 = load i8**, i8*** %5, align 8
  %156 = load i32, i32* %6, align 4
  %157 = add nsw i32 %156, 1
  store i32 %157, i32* %6, align 4
  %158 = sext i32 %156 to i64
  %159 = getelementptr inbounds i8*, i8** %155, i64 %158
  store i8* %154, i8** %159, align 8
  %160 = icmp ne i8* %154, null
  br i1 %160, label %163, label %161

; <label>:161:                                    ; preds = %149
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 5)
  %162 = add i64 %pgocount13, 1
  store i64 %162, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 5)
  call void @exitPGP(i32 7)
  br label %163

; <label>:163:                                    ; preds = %161, %149
  %164 = load i32, i32* %6, align 4
  %165 = load i32, i32* %7, align 4
  %166 = icmp eq i32 %164, %165
  br i1 %166, label %167, label %181

; <label>:167:                                    ; preds = %163
  %168 = load i32, i32* %7, align 4
  %169 = add nsw i32 %168, 128
  store i32 %169, i32* %7, align 4
  %170 = load i8**, i8*** %5, align 8
  %171 = load i32, i32* %7, align 4
  %172 = sext i32 %171 to i64
  %173 = mul i64 %172, 8
  %174 = call i8* (i8**, i64, ...) bitcast (i8* (...)* @realloc to i8* (i8**, i64, ...)*)(i8** %170, i64 %173)
  %175 = bitcast i8* %174 to i8**
  store i8** %175, i8*** %5, align 8
  %176 = icmp ne i8** %175, null
  br i1 %176, label %179, label %177

; <label>:177:                                    ; preds = %167
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 7)
  %178 = add i64 %pgocount14, 1
  store i64 %178, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 7)
  call void @exitPGP(i32 7)
  br label %179

; <label>:179:                                    ; preds = %177, %167
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 4)
  %180 = add i64 %pgocount15, 1
  store i64 %180, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 4)
  br label %181

; <label>:181:                                    ; preds = %179, %163
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 3)
  %182 = add i64 %pgocount16, 1
  store i64 %182, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 3)
  br label %110

; <label>:183:                                    ; preds = %110
  %184 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %185 = call i32 @ferror(%struct._IO_FILE* %184) #7
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %187, label %189

; <label>:187:                                    ; preds = %183
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 10)
  %188 = add i64 %pgocount17, 1
  store i64 %188, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 10)
  call void @perror(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.49, i32 0, i32 0))
  call void @exitPGP(i32 3)
  br label %189

; <label>:189:                                    ; preds = %187, %183
  %190 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %191 = call i32 @fclose(%struct._IO_FILE* %190)
  %192 = load i8**, i8*** %3, align 8
  %193 = getelementptr inbounds i8*, i8** %192, i32 1
  store i8** %193, i8*** %3, align 8
  br label %194

; <label>:194:                                    ; preds = %189, %81
  br label %46

; <label>:195:                                    ; preds = %46
  %196 = load i32, i32* %6, align 4
  %197 = load i32, i32* %7, align 4
  %198 = icmp eq i32 %196, %197
  br i1 %198, label %199, label %212

; <label>:199:                                    ; preds = %195
  %200 = load i8**, i8*** %5, align 8
  %201 = load i32, i32* %7, align 4
  %202 = add nsw i32 %201, 1
  %203 = sext i32 %202 to i64
  %204 = mul i64 %203, 8
  %205 = call i8* (i8**, i64, ...) bitcast (i8* (...)* @realloc to i8* (i8**, i64, ...)*)(i8** %200, i64 %204)
  %206 = bitcast i8* %205 to i8**
  store i8** %206, i8*** %5, align 8
  %207 = icmp ne i8** %206, null
  br i1 %207, label %210, label %208

; <label>:208:                                    ; preds = %199
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 20)
  %209 = add i64 %pgocount18, 1
  store i64 %209, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 20)
  call void @exitPGP(i32 7)
  br label %210

; <label>:210:                                    ; preds = %208, %199
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 18)
  %211 = add i64 %pgocount19, 1
  store i64 %211, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 18)
  br label %212

; <label>:212:                                    ; preds = %210, %195
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 15)
  %213 = add i64 %pgocount20, 1
  store i64 %213, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_ParseRecipients, i64 0, i64 15)
  %214 = load i8**, i8*** %5, align 8
  %215 = load i32, i32* %6, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i8*, i8** %214, i64 %216
  store i8* null, i8** %217, align 8
  %218 = load i8**, i8*** %5, align 8
  store i8** %218, i8*** %2, align 8
  br label %219

; <label>:219:                                    ; preds = %212, %32
  %220 = load i8**, i8*** %2, align 8
  ret i8** %220
}

declare i32 @cryptRandWriteFile(i8*, %struct.IdeaCfbContext*, i32) #3

declare zeroext i8 @no_extension(i8*) #3

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

declare void @force_extension(i8*, i8*) #3

declare void @setoutdir(i8*) #3

declare i8* @tempfile(i32) #3

declare i32 @readPhantomInput(i8*) #3

declare i32 @get_header_info_from_file(i8*, i8*, i32) #3

declare zeroext i8 @is_armor_file(i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @do_armorfile(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca [256 x i8], align 16
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  store i64 0, i64* %6, align 8
  store i32 0, i32* %8, align 4
  br label %9

; <label>:9:                                      ; preds = %144, %1
  %10 = call i8* @tempfile(i32 0)
  store i8* %10, i8** %3, align 8
  store i8 0, i8* @strip_spaces, align 1
  store i8 1, i8* @use_charset_header, align 1
  %11 = load i64, i64* %6, align 8
  store i64 %11, i64* %5, align 8
  %12 = load i8*, i8** %2, align 8
  %13 = load i8*, i8** %3, align 8
  %14 = call i32 @de_armor_file(i8* %12, i8* %13, i64* %6)
  store i32 %14, i32* %7, align 4
  %15 = load i32, i32* %7, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %23

; <label>:17:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 1)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %20 = call i8* @LANG(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.65, i32 0, i32 0))
  %21 = load i8*, i8** %2, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* %20, i8* %21)
  store i32 1, i32* @errorLvl, align 4
  call void @user_error()
  br label %23

; <label>:23:                                     ; preds = %17, %9
  %24 = load i8, i8* @keepctx, align 1
  %25 = zext i8 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %32, label %27

; <label>:27:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 4)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 4)
  %29 = load i8, i8* @de_armor_only, align 1
  %30 = zext i8 %29 to i32
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %92

; <label>:32:                                     ; preds = %27, %23
  %33 = load i8*, i8** @outputfile, align 8
  %34 = icmp ne i8* %33, null
  br i1 %34, label %35, label %54

; <label>:35:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 2)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 2)
  %37 = load i8, i8* @de_armor_only, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %54

; <label>:40:                                     ; preds = %35
  %41 = load i8*, i8** @outputfile, align 8
  %42 = call i32 @strcmp(i8* %41, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i32 0, i32 0)) #8
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %49

; <label>:44:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 16)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 16)
  %46 = load i8*, i8** %3, align 8
  %47 = call i32 @writePhantomOutput(i8* %46)
  %48 = load i8*, i8** %3, align 8
  call void @rmtemp(i8* %48)
  br label %149

; <label>:49:                                     ; preds = %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 5)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 5)
  %51 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %52 = load i8*, i8** @outputfile, align 8
  %53 = call i8* @strcpy(i8* %51, i8* %52) #7
  br label %61

; <label>:54:                                     ; preds = %35, %32
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 3)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 3)
  %56 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %57 = load i8*, i8** %2, align 8
  %58 = call i8* @file_tail(i8* %57)
  %59 = call i8* @strcpy(i8* %56, i8* %58) #7
  %60 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  call void @force_extension(i8* %60, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  br label %61

; <label>:61:                                     ; preds = %54, %49
  %62 = load i8*, i8** %3, align 8
  %63 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %64 = call i8* @savetemp(i8* %62, i8* %63)
  store i8* %64, i8** %3, align 8
  %65 = icmp eq i8* %64, null
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %61
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 6)
  %67 = add i64 %pgocount6, 1
  store i64 %67, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 6)
  store i32 3, i32* @errorLvl, align 4
  call void @user_error()
  br label %68

; <label>:68:                                     ; preds = %66, %61
  %69 = load i8, i8* @quietmode, align 1
  %70 = icmp ne i8 %69, 0
  br i1 %70, label %78, label %71

; <label>:71:                                     ; preds = %68
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 7)
  %72 = add i64 %pgocount7, 1
  store i64 %72, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 7)
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %74 = call i8* @LANG(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.66, i32 0, i32 0))
  %75 = load i8*, i8** %2, align 8
  %76 = load i8*, i8** %3, align 8
  %77 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %73, i8* %74, i8* %75, i8* %76)
  br label %78

; <label>:78:                                     ; preds = %71, %68
  %79 = load i8, i8* @de_armor_only, align 1
  %80 = zext i8 %79 to i32
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %87, label %82

; <label>:82:                                     ; preds = %78
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 8)
  %83 = add i64 %pgocount8, 1
  store i64 %83, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 8)
  %84 = load i8*, i8** %3, align 8
  %85 = call i32 @do_decrypt(i8* %84)
  %86 = icmp sge i32 %85, 0
  br i1 %86, label %87, label %91

; <label>:87:                                     ; preds = %82, %78
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 0)
  %88 = add i64 %pgocount9, 1
  store i64 %88, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 0)
  %89 = load i32, i32* %8, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %8, align 4
  br label %91

; <label>:91:                                     ; preds = %87, %82
  br label %132

; <label>:92:                                     ; preds = %27
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 9)
  %93 = add i64 %pgocount10, 1
  store i64 %93, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 9)
  %94 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @charset_header, i64 0, i64 0), align 16
  %95 = icmp ne i8 %94, 0
  br i1 %95, label %96, label %98

; <label>:96:                                     ; preds = %92
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 10)
  %97 = add i64 %pgocount11, 1
  store i64 %97, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 10)
  store i32 1, i32* @checksig_pass, align 4
  br label %98

; <label>:98:                                     ; preds = %96, %92
  %99 = load i8*, i8** %3, align 8
  %100 = call i32 @do_decrypt(i8* %99)
  %101 = icmp sge i32 %100, 0
  br i1 %101, label %102, label %106

; <label>:102:                                    ; preds = %98
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 12)
  %103 = add i64 %pgocount12, 1
  store i64 %103, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 12)
  %104 = load i32, i32* %8, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %8, align 4
  br label %106

; <label>:106:                                    ; preds = %102, %98
  %107 = load i8*, i8** %3, align 8
  call void @rmtemp(i8* %107)
  %108 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @charset_header, i64 0, i64 0), align 16
  %109 = icmp ne i8 %108, 0
  br i1 %109, label %110, label %131

; <label>:110:                                    ; preds = %106
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 11)
  %111 = add i64 %pgocount13, 1
  store i64 %111, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 11)
  %112 = load i32, i32* @checksig_pass, align 4
  %113 = icmp eq i32 %112, 2
  br i1 %113, label %114, label %130

; <label>:114:                                    ; preds = %110
  %115 = call i8* @tempfile(i32 0)
  store i8* %115, i8** %3, align 8
  store i8 0, i8* @use_charset_header, align 1
  %116 = load i64, i64* %5, align 8
  store i64 %116, i64* %6, align 8
  %117 = load i8*, i8** %2, align 8
  %118 = load i8*, i8** %3, align 8
  %119 = call i32 @de_armor_file(i8* %117, i8* %118, i64* %6)
  %120 = load i8*, i8** %3, align 8
  %121 = call i32 @do_decrypt(i8* %120)
  %122 = icmp sge i32 %121, 0
  br i1 %122, label %123, label %127

; <label>:123:                                    ; preds = %114
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 15)
  %124 = add i64 %pgocount14, 1
  store i64 %124, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 15)
  %125 = load i32, i32* %8, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %8, align 4
  br label %127

; <label>:127:                                    ; preds = %123, %114
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 13)
  %128 = add i64 %pgocount15, 1
  store i64 %128, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 13)
  %129 = load i8*, i8** %3, align 8
  call void @rmtemp(i8* %129)
  br label %130

; <label>:130:                                    ; preds = %127, %110
  store i32 0, i32* @checksig_pass, align 4
  br label %131

; <label>:131:                                    ; preds = %130, %106
  br label %132

; <label>:132:                                    ; preds = %131, %91
  %133 = load i8*, i8** %2, align 8
  %134 = load i64, i64* %6, align 8
  %135 = call zeroext i8 @is_armor_file(i8* %133, i64 %134)
  %136 = icmp ne i8 %135, 0
  br i1 %136, label %144, label %137

; <label>:137:                                    ; preds = %132
  %138 = load i32, i32* %8, align 4
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %142, label %140

; <label>:140:                                    ; preds = %137
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 17)
  %141 = add i64 %pgocount16, 1
  store i64 %141, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 17)
  call void @user_error()
  br label %142

; <label>:142:                                    ; preds = %140, %137
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 14)
  %143 = add i64 %pgocount17, 1
  store i64 %143, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_do_armorfile, i64 0, i64 14)
  br label %149

; <label>:144:                                    ; preds = %132
  %145 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %146 = call i8* @LANG(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.67, i32 0, i32 0))
  %147 = load i8*, i8** %2, align 8
  %148 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %145, i8* %146, i8* %147)
  br label %9

; <label>:149:                                    ; preds = %142, %44
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

declare i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @do_decrypt(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  %8 = alloca [256 x i8], align 16
  %9 = alloca i8, align 1
  %10 = alloca [8 x i8], align 1
  %11 = alloca [256 x i8], align 16
  %12 = alloca i8*, align 8
  %13 = alloca [256 x i8], align 16
  store i8* %0, i8** %3, align 8
  store i8* null, i8** %4, align 8
  store i8 0, i8* %7, align 1
  %14 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i64 0, i64 0
  store i8 0, i8* %14, align 16
  br label %15

; <label>:15:                                     ; preds = %275, %1
  %16 = load i8, i8* %7, align 1
  %17 = icmp ne i8 %16, 0
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 0)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 0)
  %20 = load i8*, i8** %3, align 8
  call void @rmtemp(i8* %20)
  %21 = load i8*, i8** %4, align 8
  store i8* %21, i8** %3, align 8
  br label %22

; <label>:22:                                     ; preds = %18, %15
  %23 = load i8*, i8** %3, align 8
  %24 = call i32 @get_header_info_from_file(i8* %23, i8* %9, i32 1)
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %26, label %32

; <label>:26:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 12)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 12)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %29 = call i8* @LANG(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.68, i32 0, i32 0))
  %30 = load i8*, i8** %3, align 8
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* %29, i8* %30)
  store i32 2, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:32:                                     ; preds = %22
  %33 = load i8, i8* %9, align 1
  %34 = zext i8 %33 to i32
  %35 = and i32 %34, 128
  %36 = icmp eq i32 %35, 128
  br i1 %36, label %39, label %37

; <label>:37:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 13)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 13)
  br label %278

; <label>:39:                                     ; preds = %32
  %40 = load i8, i8* @moreflag, align 1
  %41 = icmp ne i8 %40, 0
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %39
  %43 = call i8* @tempfile(i32 5)
  store i8* %43, i8** %4, align 8
  br label %47

; <label>:44:                                     ; preds = %39
  %pgocount3 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 2)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 2)
  %46 = call i8* @tempfile(i32 1)
  store i8* %46, i8** %4, align 8
  br label %47

; <label>:47:                                     ; preds = %44, %42
  %48 = load i8, i8* %9, align 1
  %49 = zext i8 %48 to i32
  %50 = and i32 %49, 124
  %51 = icmp eq i32 %50, 4
  br i1 %51, label %52, label %74

; <label>:52:                                     ; preds = %47
  %53 = load i8, i8* @quietmode, align 1
  %54 = icmp ne i8 %53, 0
  br i1 %54, label %60, label %55

; <label>:55:                                     ; preds = %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 4)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 4)
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %58 = call i8* @LANG(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i32 0, i32 0))
  %59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* %58)
  br label %60

; <label>:60:                                     ; preds = %55, %52
  %61 = load i8*, i8** %3, align 8
  %62 = load i8*, i8** %4, align 8
  %63 = call i32 @decryptfile(i8* %61, i8* %62)
  store i32 %63, i32* %5, align 4
  %64 = load i32, i32* %5, align 4
  %65 = icmp slt i32 %64, 0
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 17)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 17)
  store i32 31, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:68:                                     ; preds = %60
  %pgocount6 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 1)
  %69 = add i64 %pgocount6, 1
  store i64 %69, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 1)
  %70 = load i32, i32* %5, align 4
  %71 = icmp sgt i32 %70, 0
  %72 = zext i1 %71 to i32
  %73 = trunc i32 %72 to i8
  store i8 %73, i8* %7, align 1
  br label %274

; <label>:74:                                     ; preds = %47
  %75 = load i8, i8* %9, align 1
  %76 = zext i8 %75 to i32
  %77 = and i32 %76, 124
  %78 = icmp eq i32 %77, 8
  br i1 %78, label %79, label %131

; <label>:79:                                     ; preds = %74
  %80 = load i8, i8* @decrypt_only_flag, align 1
  %81 = icmp ne i8 %80, 0
  br i1 %81, label %82, label %94

; <label>:82:                                     ; preds = %79
  %83 = load i8*, i8** %4, align 8
  call void @rmtemp(i8* %83)
  %84 = load i8*, i8** %3, align 8
  store i8* %84, i8** %4, align 8
  store i8* null, i8** %3, align 8
  %85 = load i8, i8* @quietmode, align 1
  %86 = icmp ne i8 %85, 0
  br i1 %86, label %92, label %87

; <label>:87:                                     ; preds = %82
  %pgocount7 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 30)
  %88 = add i64 %pgocount7, 1
  store i64 %88, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 30)
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %90 = call i8* @LANG(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.70, i32 0, i32 0))
  %91 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %89, i8* %90)
  br label %92

; <label>:92:                                     ; preds = %87, %82
  %pgocount8 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 21)
  %93 = add i64 %pgocount8, 1
  store i64 %93, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 21)
  store i8 0, i8* %7, align 1
  br label %278

; <label>:94:                                     ; preds = %79
  %95 = load i8, i8* @quietmode, align 1
  %96 = icmp ne i8 %95, 0
  br i1 %96, label %106, label %97

; <label>:97:                                     ; preds = %94
  %pgocount9 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 6)
  %98 = add i64 %pgocount9, 1
  store i64 %98, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 6)
  %99 = load i32, i32* @checksig_pass, align 4
  %100 = icmp sle i32 %99, 1
  br i1 %100, label %101, label %106

; <label>:101:                                    ; preds = %97
  %pgocount10 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 10)
  %102 = add i64 %pgocount10, 1
  store i64 %102, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 10)
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %104 = call i8* @LANG(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.71, i32 0, i32 0))
  %105 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %103, i8* %104)
  br label %106

; <label>:106:                                    ; preds = %101, %97, %94
  %107 = load i8*, i8** %3, align 8
  %108 = load i8*, i8** %4, align 8
  %109 = load i8, i8* @strip_sig_flag, align 1
  %110 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %111 = call i32 @check_signaturefile(i8* %107, i8* %108, i8 zeroext %109, i8* %110)
  store i32 %111, i32* %5, align 4
  %112 = load i32, i32* %5, align 4
  %113 = icmp slt i32 %112, 0
  br i1 %113, label %114, label %116

; <label>:114:                                    ; preds = %106
  %pgocount11 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 22)
  %115 = add i64 %pgocount11, 1
  store i64 %115, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 22)
  store i32 30, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:116:                                    ; preds = %106
  %117 = load i32, i32* %5, align 4
  %118 = icmp sgt i32 %117, 0
  %119 = zext i1 %118 to i32
  %120 = trunc i32 %119 to i8
  store i8 %120, i8* %7, align 1
  %121 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %122 = call i32 @strcmp(i8* %121, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.72, i32 0, i32 0)) #8
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %129

; <label>:124:                                    ; preds = %116
  %pgocount12 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 23)
  %125 = add i64 %pgocount12, 1
  store i64 %125, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 23)
  %126 = load i8*, i8** %4, align 8
  call void @rmtemp(i8* %126)
  %127 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %128 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %127, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %609

; <label>:129:                                    ; preds = %116
  %pgocount13 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 3)
  %130 = add i64 %pgocount13, 1
  store i64 %130, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 3)
  br label %273

; <label>:131:                                    ; preds = %74
  %132 = load i8, i8* %9, align 1
  %133 = zext i8 %132 to i32
  %134 = and i32 %133, 124
  %135 = icmp eq i32 %134, 36
  br i1 %135, label %136, label %158

; <label>:136:                                    ; preds = %131
  %137 = load i8, i8* @quietmode, align 1
  %138 = icmp ne i8 %137, 0
  br i1 %138, label %144, label %139

; <label>:139:                                    ; preds = %136
  %pgocount14 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 9)
  %140 = add i64 %pgocount14, 1
  store i64 %140, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 9)
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %142 = call i8* @LANG(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.73, i32 0, i32 0))
  %143 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %141, i8* %142)
  br label %144

; <label>:144:                                    ; preds = %139, %136
  %145 = load i8*, i8** %3, align 8
  %146 = load i8*, i8** %4, align 8
  %147 = call i32 @idea_decryptfile(i8* %145, i8* %146)
  store i32 %147, i32* %5, align 4
  %148 = load i32, i32* %5, align 4
  %149 = icmp slt i32 %148, 0
  br i1 %149, label %150, label %152

; <label>:150:                                    ; preds = %144
  %pgocount15 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 28)
  %151 = add i64 %pgocount15, 1
  store i64 %151, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 28)
  store i32 32, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:152:                                    ; preds = %144
  %pgocount16 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 5)
  %153 = add i64 %pgocount16, 1
  store i64 %153, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 5)
  %154 = load i32, i32* %5, align 4
  %155 = icmp sgt i32 %154, 0
  %156 = zext i1 %155 to i32
  %157 = trunc i32 %156 to i8
  store i8 %157, i8* %7, align 1
  br label %272

; <label>:158:                                    ; preds = %131
  %159 = load i8, i8* %9, align 1
  %160 = zext i8 %159 to i32
  %161 = and i32 %160, 124
  %162 = icmp eq i32 %161, 32
  br i1 %162, label %163, label %173

; <label>:163:                                    ; preds = %158
  %164 = load i8*, i8** %3, align 8
  %165 = load i8*, i8** %4, align 8
  %166 = call i32 @decompress_file(i8* %164, i8* %165)
  store i32 %166, i32* %5, align 4
  %167 = load i32, i32* %5, align 4
  %168 = icmp slt i32 %167, 0
  br i1 %168, label %169, label %171

; <label>:169:                                    ; preds = %163
  %pgocount17 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 35)
  %170 = add i64 %pgocount17, 1
  store i64 %170, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 35)
  store i32 33, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:171:                                    ; preds = %163
  %pgocount18 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 7)
  %172 = add i64 %pgocount18, 1
  store i64 %172, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 7)
  store i8 1, i8* %7, align 1
  br label %271

; <label>:173:                                    ; preds = %158
  %174 = load i8, i8* %9, align 1
  %175 = zext i8 %174 to i32
  %176 = and i32 %175, 124
  %177 = icmp eq i32 %176, 40
  br i1 %177, label %184, label %178

; <label>:178:                                    ; preds = %173
  %pgocount19 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 14)
  %179 = add i64 %pgocount19, 1
  store i64 %179, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 14)
  %180 = load i8, i8* %9, align 1
  %181 = zext i8 %180 to i32
  %182 = and i32 %181, 124
  %183 = icmp eq i32 %182, 44
  br i1 %183, label %184, label %195

; <label>:184:                                    ; preds = %178, %173
  %185 = load i8*, i8** %3, align 8
  %186 = load i8*, i8** %4, align 8
  %187 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %188 = call i32 @strip_literal(i8* %185, i8* %186, i8* %187, i8* @literal_mode)
  store i32 %188, i32* %5, align 4
  %189 = load i32, i32* %5, align 4
  %190 = icmp slt i32 %189, 0
  br i1 %190, label %191, label %193

; <label>:191:                                    ; preds = %184
  %pgocount20 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 36)
  %192 = add i64 %pgocount20, 1
  store i64 %192, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 36)
  store i32 3, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:193:                                    ; preds = %184
  %pgocount21 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 8)
  %194 = add i64 %pgocount21, 1
  store i64 %194, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 8)
  store i8 0, i8* %7, align 1
  br label %270

; <label>:195:                                    ; preds = %178
  %196 = load i8, i8* %9, align 1
  %197 = zext i8 %196 to i32
  %198 = icmp eq i32 %197, 149
  br i1 %198, label %204, label %199

; <label>:199:                                    ; preds = %195
  %pgocount22 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 47)
  %200 = add i64 %pgocount22, 1
  store i64 %200, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 47)
  %201 = load i8, i8* %9, align 1
  %202 = zext i8 %201 to i32
  %203 = icmp eq i32 %202, 153
  br i1 %203, label %204, label %268

; <label>:204:                                    ; preds = %199, %195
  %205 = load i8*, i8** %4, align 8
  call void @rmtemp(i8* %205)
  %206 = load i8, i8* @decrypt_only_flag, align 1
  %207 = icmp ne i8 %206, 0
  br i1 %207, label %208, label %211

; <label>:208:                                    ; preds = %204
  %pgocount23 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 51)
  %209 = add i64 %pgocount23, 1
  store i64 %209, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 51)
  %210 = load i8*, i8** %3, align 8
  store i8* %210, i8** %4, align 8
  store i8* null, i8** %3, align 8
  store i8 0, i8* %7, align 1
  br label %278

; <label>:211:                                    ; preds = %204
  %212 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %213 = call i8* @LANG(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.74, i32 0, i32 0))
  %214 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %212, i8* %213)
  %215 = load i8*, i8** %3, align 8
  %216 = call i32 @view_keyring(i8* null, i8* %215, i8 zeroext 1, i8 zeroext 0)
  %217 = icmp slt i32 %216, 0
  br i1 %217, label %218, label %220

; <label>:218:                                    ; preds = %211
  %pgocount24 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 64)
  %219 = add i64 %pgocount24, 1
  store i64 %219, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 64)
  store i32 15, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:220:                                    ; preds = %211
  %221 = load i8, i8* @filter_mode, align 1
  %222 = zext i8 %221 to i32
  %223 = icmp ne i32 %222, 0
  br i1 %223, label %224, label %230

; <label>:224:                                    ; preds = %220
  %pgocount25 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 63)
  %225 = add i64 %pgocount25, 1
  store i64 %225, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 63)
  %226 = load i8, i8* @preserve_filename, align 1
  %227 = icmp ne i8 %226, 0
  br i1 %227, label %230, label %228

; <label>:228:                                    ; preds = %224
  %pgocount26 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 68)
  %229 = add i64 %pgocount26, 1
  store i64 %229, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 68)
  store i32 0, i32* %2, align 4
  br label %609

; <label>:230:                                    ; preds = %224, %220
  %231 = load i8, i8* @batchmode, align 1
  %232 = icmp ne i8 %231, 0
  br i1 %232, label %233, label %235

; <label>:233:                                    ; preds = %230
  %pgocount27 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 66)
  %234 = add i64 %pgocount27, 1
  store i64 %234, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 66)
  store i32 0, i32* %2, align 4
  br label %609

; <label>:235:                                    ; preds = %230
  %236 = load i8, i8* %9, align 1
  %237 = zext i8 %236 to i32
  %238 = icmp eq i32 %237, 149
  br i1 %238, label %239, label %242

; <label>:239:                                    ; preds = %235
  %240 = getelementptr inbounds [256 x i8], [256 x i8]* %8, i32 0, i32 0
  %241 = call i8* @strcpy(i8* %240, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalSecringName, i32 0, i32 0)) #7
  br label %246

; <label>:242:                                    ; preds = %235
  %pgocount28 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 70)
  %243 = add i64 %pgocount28, 1
  store i64 %243, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 70)
  %244 = getelementptr inbounds [256 x i8], [256 x i8]* %8, i32 0, i32 0
  %245 = call i8* @strcpy(i8* %244, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalPubringName, i32 0, i32 0)) #7
  br label %246

; <label>:246:                                    ; preds = %242, %239
  %247 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %248 = call i8* @LANG(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.75, i32 0, i32 0))
  %249 = getelementptr inbounds [256 x i8], [256 x i8]* %8, i32 0, i32 0
  %250 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %247, i8* %248, i8* %249)
  %251 = call zeroext i8 @getyesno(i8 signext 110)
  %252 = icmp ne i8 %251, 0
  br i1 %252, label %255, label %253

; <label>:253:                                    ; preds = %246
  %pgocount29 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 72)
  %254 = add i64 %pgocount29, 1
  store i64 %254, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 72)
  store i32 0, i32* %2, align 4
  br label %609

; <label>:255:                                    ; preds = %246
  %256 = load i8*, i8** %3, align 8
  %257 = getelementptr inbounds [256 x i8], [256 x i8]* %8, i32 0, i32 0
  %258 = call i32 @addto_keyring(i8* %256, i8* %257)
  store i32 %258, i32* %5, align 4
  %259 = load i32, i32* %5, align 4
  %260 = icmp slt i32 %259, 0
  br i1 %260, label %261, label %266

; <label>:261:                                    ; preds = %255
  %pgocount30 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 73)
  %262 = add i64 %pgocount30, 1
  store i64 %262, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 73)
  %263 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %264 = call i8* @LANG(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.76, i32 0, i32 0))
  %265 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %263, i8* %264)
  store i32 12, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:266:                                    ; preds = %255
  %pgocount31 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 71)
  %267 = add i64 %pgocount31, 1
  store i64 %267, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 71)
  store i32 0, i32* %2, align 4
  br label %609

; <label>:268:                                    ; preds = %199
  %pgocount32 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 59)
  %269 = add i64 %pgocount32, 1
  store i64 %269, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 59)
  br label %278

; <label>:270:                                    ; preds = %193
  br label %271

; <label>:271:                                    ; preds = %270, %171
  br label %272

; <label>:272:                                    ; preds = %271, %152
  br label %273

; <label>:273:                                    ; preds = %272, %129
  br label %274

; <label>:274:                                    ; preds = %273, %68
  br label %275

; <label>:275:                                    ; preds = %274
  %276 = load i8, i8* %7, align 1
  %277 = icmp ne i8 %276, 0
  br i1 %277, label %15, label %278

; <label>:278:                                    ; preds = %275, %268, %208, %92, %37
  %279 = load i8, i8* %7, align 1
  %280 = icmp ne i8 %279, 0
  br i1 %280, label %281, label %299

; <label>:281:                                    ; preds = %278
  %282 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %283 = load i8, i8* %9, align 1
  %284 = zext i8 %283 to i32
  %285 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %282, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.77, i32 0, i32 0), i32 %284)
  %286 = load i8*, i8** %4, align 8
  %287 = icmp ne i8* %286, null
  br i1 %287, label %288, label %291

; <label>:288:                                    ; preds = %281
  %pgocount33 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 15)
  %289 = add i64 %pgocount33, 1
  store i64 %289, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 15)
  %290 = load i8*, i8** %4, align 8
  call void @rmtemp(i8* %290)
  br label %291

; <label>:291:                                    ; preds = %288, %281
  %292 = load i8*, i8** %3, align 8
  %293 = icmp ne i8* %292, null
  br i1 %293, label %294, label %297

; <label>:294:                                    ; preds = %291
  %pgocount34 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 16)
  %295 = add i64 %pgocount34, 1
  store i64 %295, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 16)
  %296 = load i8*, i8** %3, align 8
  call void @rmtemp(i8* %296)
  br label %297

; <label>:297:                                    ; preds = %294, %291
  %pgocount35 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 11)
  %298 = add i64 %pgocount35, 1
  store i64 %298, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 11)
  store i32 3, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:299:                                    ; preds = %278
  %300 = load i8*, i8** %4, align 8
  %301 = icmp eq i8* %300, null
  br i1 %301, label %302, label %318

; <label>:302:                                    ; preds = %299
  %303 = load i8, i8* @filter_mode, align 1
  %304 = icmp ne i8 %303, 0
  br i1 %304, label %315, label %305

; <label>:305:                                    ; preds = %302
  %pgocount36 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 29)
  %306 = add i64 %pgocount36, 1
  store i64 %306, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 29)
  %307 = load i8, i8* @moreflag, align 1
  %308 = icmp ne i8 %307, 0
  br i1 %308, label %315, label %309

; <label>:309:                                    ; preds = %305
  %pgocount37 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 39)
  %310 = add i64 %pgocount37, 1
  store i64 %310, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 39)
  %311 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %312 = call i8* @LANG(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.78, i32 0, i32 0))
  %313 = load i8*, i8** %3, align 8
  %314 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %311, i8* %312, i8* %313)
  store i32 3, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:315:                                    ; preds = %305, %302
  %pgocount38 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 20)
  %316 = add i64 %pgocount38, 1
  store i64 %316, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 20)
  %317 = load i8*, i8** %3, align 8
  store i8* %317, i8** %4, align 8
  br label %325

; <label>:318:                                    ; preds = %299
  %319 = load i8*, i8** %3, align 8
  %320 = icmp ne i8* %319, null
  br i1 %320, label %321, label %324

; <label>:321:                                    ; preds = %318
  %pgocount39 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 18)
  %322 = add i64 %pgocount39, 1
  store i64 %322, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 18)
  %323 = load i8*, i8** %3, align 8
  call void @rmtemp(i8* %323)
  br label %324

; <label>:324:                                    ; preds = %321, %318
  br label %325

; <label>:325:                                    ; preds = %324, %315
  %326 = load i8, i8* @moreflag, align 1
  %327 = zext i8 %326 to i32
  %328 = icmp ne i32 %327, 0
  br i1 %328, label %334, label %329

; <label>:329:                                    ; preds = %325
  %pgocount40 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 19)
  %330 = add i64 %pgocount40, 1
  store i64 %330, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 19)
  %331 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %332 = call i32 @strcmp(i8* %331, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @CONSOLE_FILENAME, i32 0, i32 0)) #8
  %333 = icmp eq i32 %332, 0
  br i1 %333, label %334, label %453

; <label>:334:                                    ; preds = %329, %325
  %335 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %336 = call i32 @strcmp(i8* %335, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @CONSOLE_FILENAME, i32 0, i32 0)) #8
  %337 = icmp eq i32 %336, 0
  br i1 %337, label %338, label %367

; <label>:338:                                    ; preds = %334
  %339 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %340 = call i8* @LANG(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.79, i32 0, i32 0))
  %341 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %339, i8* %340)
  %342 = load i8, i8* @batchmode, align 1
  %343 = zext i8 %342 to i32
  %344 = icmp ne i32 %343, 0
  br i1 %344, label %360, label %345

; <label>:345:                                    ; preds = %338
  %pgocount41 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 32)
  %346 = add i64 %pgocount41, 1
  store i64 %346, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 32)
  %347 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %348 = call i32 @fileno(%struct._IO_FILE* %347) #7
  %349 = call i32 @isatty(i32 %348) #7
  %350 = icmp ne i32 %349, 0
  br i1 %350, label %351, label %360

; <label>:351:                                    ; preds = %345
  %pgocount42 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 37)
  %352 = add i64 %pgocount42, 1
  store i64 %352, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 37)
  %353 = load i8, i8* @filter_mode, align 1
  %354 = zext i8 %353 to i32
  %355 = icmp ne i32 %354, 0
  br i1 %355, label %360, label %356

; <label>:356:                                    ; preds = %351
  %pgocount43 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 46)
  %357 = add i64 %pgocount43, 1
  store i64 %357, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 46)
  %358 = call zeroext i8 @getyesno(i8 signext 121)
  %359 = icmp ne i8 %358, 0
  br i1 %359, label %365, label %360

; <label>:360:                                    ; preds = %356, %351, %345, %338
  %pgocount44 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 25)
  %361 = add i64 %pgocount44, 1
  store i64 %361, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 25)
  %362 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %363 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %362, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  %364 = load i8*, i8** %4, align 8
  call void @rmtemp(i8* %364)
  store i32 0, i32* %2, align 4
  br label %609

; <label>:365:                                    ; preds = %356
  %pgocount45 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 55)
  %366 = add i64 %pgocount45, 1
  store i64 %366, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 55)
  br label %367

; <label>:367:                                    ; preds = %365, %334
  %368 = load i8, i8* @quietmode, align 1
  %369 = icmp ne i8 %368, 0
  br i1 %369, label %375, label %370

; <label>:370:                                    ; preds = %367
  %pgocount46 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 26)
  %371 = add i64 %pgocount46, 1
  store i64 %371, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 26)
  %372 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %373 = call i8* @LANG(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.80, i32 0, i32 0))
  %374 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %372, i8* %373)
  br label %378

; <label>:375:                                    ; preds = %367
  %376 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %377 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %376)
  br label %378

; <label>:378:                                    ; preds = %375, %370
  %379 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %380 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %379, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.81, i32 0, i32 0))
  %381 = load i8*, i8** %4, align 8
  %382 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %383 = call i32 @strcmp(i8* %382, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @CONSOLE_FILENAME, i32 0, i32 0)) #8
  %384 = icmp eq i32 %383, 0
  %385 = zext i1 %384 to i32
  %386 = trunc i32 %385 to i8
  %387 = call i32 @more_file(i8* %381, i8 zeroext %386)
  %388 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %389 = call i32 @strcmp(i8* %388, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @CONSOLE_FILENAME, i32 0, i32 0)) #8
  %390 = icmp eq i32 %389, 0
  br i1 %390, label %391, label %393

; <label>:391:                                    ; preds = %378
  %pgocount47 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 27)
  %392 = add i64 %pgocount47, 1
  store i64 %392, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 27)
  call void @clearscreen()
  br label %451

; <label>:393:                                    ; preds = %378
  %394 = load i8, i8* @quietmode, align 1
  %395 = icmp ne i8 %394, 0
  br i1 %395, label %449, label %396

; <label>:396:                                    ; preds = %393
  %pgocount48 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 31)
  %397 = add i64 %pgocount48, 1
  store i64 %397, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 31)
  %398 = load i8, i8* @batchmode, align 1
  %399 = icmp ne i8 %398, 0
  br i1 %399, label %449, label %400

; <label>:400:                                    ; preds = %396
  %401 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %402 = call i8* @LANG(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.82, i32 0, i32 0))
  %403 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %401, i8* %402)
  %404 = call zeroext i8 @getyesno(i8 signext 110)
  %405 = icmp ne i8 %404, 0
  br i1 %405, label %406, label %447

; <label>:406:                                    ; preds = %400
  %407 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %408 = call i8* @LANG(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.83, i32 0, i32 0))
  %409 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %407, i8* %408)
  %410 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i64 0, i64 0
  %411 = load i8, i8* %410, align 16
  %412 = icmp ne i8 %411, 0
  br i1 %412, label %413, label %419

; <label>:413:                                    ; preds = %406
  %pgocount49 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 52)
  %414 = add i64 %pgocount49, 1
  store i64 %414, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 52)
  %415 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %416 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %417 = call i8* @file_tail(i8* %416)
  %418 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %415, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.84, i32 0, i32 0), i8* %417)
  br label %419

; <label>:419:                                    ; preds = %413, %406
  %420 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  %421 = call i32 @getstring(i8* %420, i32 255, i32 1)
  %422 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  %423 = load i8, i8* %422, align 16
  %424 = sext i8 %423 to i32
  %425 = icmp eq i32 %424, 0
  br i1 %425, label %426, label %441

; <label>:426:                                    ; preds = %419
  %427 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %428 = load i8, i8* %427, align 16
  %429 = sext i8 %428 to i32
  %430 = icmp ne i32 %429, 0
  br i1 %430, label %431, label %437

; <label>:431:                                    ; preds = %426
  %pgocount50 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 61)
  %432 = add i64 %pgocount50, 1
  store i64 %432, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 61)
  %433 = load i8*, i8** %4, align 8
  %434 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %435 = call i8* @file_tail(i8* %434)
  %436 = call i8* @savetemp(i8* %433, i8* %435)
  br label %440

; <label>:437:                                    ; preds = %426
  %pgocount51 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 65)
  %438 = add i64 %pgocount51, 1
  store i64 %438, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 65)
  %439 = load i8*, i8** %4, align 8
  call void @rmtemp(i8* %439)
  br label %440

; <label>:440:                                    ; preds = %437, %431
  br label %446

; <label>:441:                                    ; preds = %419
  %pgocount52 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 53)
  %442 = add i64 %pgocount52, 1
  store i64 %442, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 53)
  %443 = load i8*, i8** %4, align 8
  %444 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  %445 = call i8* @savetemp(i8* %443, i8* %444)
  br label %446

; <label>:446:                                    ; preds = %441, %440
  store i32 0, i32* %2, align 4
  br label %609

; <label>:447:                                    ; preds = %400
  %pgocount53 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 54)
  %448 = add i64 %pgocount53, 1
  store i64 %448, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 54)
  br label %449

; <label>:449:                                    ; preds = %447, %396, %393
  %pgocount54 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 24)
  %450 = add i64 %pgocount54, 1
  store i64 %450, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 24)
  br label %451

; <label>:451:                                    ; preds = %449, %391
  %452 = load i8*, i8** %4, align 8
  call void @rmtemp(i8* %452)
  store i32 0, i32* %2, align 4
  br label %609

; <label>:453:                                    ; preds = %329
  %454 = load i8*, i8** @outputfile, align 8
  %455 = icmp ne i8* %454, null
  br i1 %455, label %456, label %471

; <label>:456:                                    ; preds = %453
  %457 = load i8*, i8** @outputfile, align 8
  %458 = call i32 @strcmp(i8* %457, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.72, i32 0, i32 0)) #8
  %459 = icmp ne i32 %458, 0
  br i1 %459, label %463, label %460

; <label>:460:                                    ; preds = %456
  %pgocount55 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 40)
  %461 = add i64 %pgocount55, 1
  store i64 %461, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 40)
  %462 = load i8*, i8** %4, align 8
  call void @rmtemp(i8* %462)
  store i32 0, i32* %2, align 4
  br label %609

; <label>:463:                                    ; preds = %456
  %464 = load i8*, i8** @outputfile, align 8
  %465 = call i32 @strcmp(i8* %464, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i32 0, i32 0)) #8
  %466 = icmp eq i32 %465, 0
  %467 = zext i1 %466 to i32
  %468 = trunc i32 %467 to i8
  store i8 %468, i8* @filter_mode, align 1
  %469 = load i8*, i8** @outputfile, align 8
  %470 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0), i8* %469) #7
  br label %473

; <label>:471:                                    ; preds = %453
  %pgocount56 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 33)
  %472 = add i64 %pgocount56, 1
  store i64 %472, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 33)
  call void @drop_extension(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0))
  br label %473

; <label>:473:                                    ; preds = %471, %463
  %474 = load i8, i8* @preserve_filename, align 1
  %475 = icmp ne i8 %474, 0
  br i1 %475, label %490, label %476

; <label>:476:                                    ; preds = %473
  %pgocount57 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 38)
  %477 = add i64 %pgocount57, 1
  store i64 %477, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 38)
  %478 = load i8, i8* @filter_mode, align 1
  %479 = zext i8 %478 to i32
  %480 = icmp ne i32 %479, 0
  br i1 %480, label %481, label %490

; <label>:481:                                    ; preds = %476
  %482 = load i8*, i8** %4, align 8
  %483 = call i32 @writePhantomOutput(i8* %482)
  %484 = icmp slt i32 %483, 0
  br i1 %484, label %485, label %487

; <label>:485:                                    ; preds = %481
  %pgocount58 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 56)
  %486 = add i64 %pgocount58, 1
  store i64 %486, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 56)
  store i32 3, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:487:                                    ; preds = %481
  %pgocount59 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 44)
  %488 = add i64 %pgocount59, 1
  store i64 %488, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 44)
  %489 = load i8*, i8** %4, align 8
  call void @rmtemp(i8* %489)
  store i32 0, i32* %2, align 4
  br label %609

; <label>:490:                                    ; preds = %476, %473
  %491 = load i8, i8* @preserve_filename, align 1
  %492 = zext i8 %491 to i32
  %493 = icmp ne i32 %492, 0
  br i1 %493, label %494, label %505

; <label>:494:                                    ; preds = %490
  %pgocount60 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 34)
  %495 = add i64 %pgocount60, 1
  store i64 %495, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 34)
  %496 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i64 0, i64 0
  %497 = load i8, i8* %496, align 16
  %498 = sext i8 %497 to i32
  %499 = icmp ne i32 %498, 0
  br i1 %499, label %500, label %505

; <label>:500:                                    ; preds = %494
  %pgocount61 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 41)
  %501 = add i64 %pgocount61, 1
  store i64 %501, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 41)
  %502 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i32 0, i32 0
  %503 = call i8* @file_tail(i8* %502)
  %504 = call i8* @strcpy(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0), i8* %503) #7
  br label %505

; <label>:505:                                    ; preds = %500, %494, %490
  %506 = load i8, i8* @quietmode, align 1
  %507 = icmp ne i8 %506, 0
  br i1 %507, label %508, label %516

; <label>:508:                                    ; preds = %505
  %509 = load i8*, i8** %4, align 8
  %510 = call i8* @savetemp(i8* %509, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0))
  %511 = icmp eq i8* %510, null
  br i1 %511, label %512, label %514

; <label>:512:                                    ; preds = %508
  %pgocount62 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 43)
  %513 = add i64 %pgocount62, 1
  store i64 %513, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 43)
  store i32 3, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:514:                                    ; preds = %508
  %pgocount63 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 42)
  %515 = add i64 %pgocount63, 1
  store i64 %515, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 42)
  store i32 0, i32* %2, align 4
  br label %609

; <label>:516:                                    ; preds = %505
  %517 = load i8, i8* @verbose, align 1
  %518 = icmp ne i8 %517, 0
  br i1 %518, label %524, label %519

; <label>:519:                                    ; preds = %516
  %pgocount64 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 48)
  %520 = add i64 %pgocount64, 1
  store i64 %520, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 48)
  %521 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %522 = call i8* @LANG(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.85, i32 0, i32 0))
  %523 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %521, i8* %522, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0))
  br label %524

; <label>:524:                                    ; preds = %519, %516
  %525 = load i8*, i8** %4, align 8
  %526 = getelementptr inbounds [8 x i8], [8 x i8]* %10, i32 0, i32 0
  %527 = call i32 @get_header_info_from_file(i8* %525, i8* %526, i32 8)
  store i8* null, i8** %12, align 8
  %528 = getelementptr inbounds [8 x i8], [8 x i8]* %10, i64 0, i64 0
  %529 = load i8, i8* %528, align 1
  %530 = zext i8 %529 to i32
  %531 = icmp eq i32 %530, 153
  br i1 %531, label %532, label %538

; <label>:532:                                    ; preds = %524
  %pgocount65 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 45)
  %533 = add i64 %pgocount65, 1
  store i64 %533, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 45)
  %534 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %535 = call i8* @LANG(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.86, i32 0, i32 0))
  %536 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %534, i8* %535, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0))
  %537 = call i8* @maybe_force_extension(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  store i8* %537, i8** %12, align 8
  br label %592

; <label>:538:                                    ; preds = %524
  %539 = getelementptr inbounds [8 x i8], [8 x i8]* %10, i32 0, i32 0
  %540 = call i32 @compressSignature(i8* %539)
  store i32 %540, i32* %6, align 4
  %541 = icmp sge i32 %540, 0
  br i1 %541, label %542, label %556

; <label>:542:                                    ; preds = %538
  %pgocount66 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 57)
  %543 = add i64 %pgocount66, 1
  store i64 %543, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 57)
  %544 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %545 = call i8* @LANG(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.87, i32 0, i32 0))
  %546 = load i32, i32* %6, align 4
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds [12 x i8*], [12 x i8*]* @compressName, i64 0, i64 %547
  %549 = load i8*, i8** %548, align 8
  %550 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %544, i8* %545, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0), i8* %549)
  %551 = load i32, i32* %6, align 4
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds [12 x i8*], [12 x i8*]* @compressExt, i64 0, i64 %552
  %554 = load i8*, i8** %553, align 8
  %555 = call i8* @maybe_force_extension(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0), i8* %554)
  store i8* %555, i8** %12, align 8
  br label %591

; <label>:556:                                    ; preds = %538
  %557 = getelementptr inbounds [8 x i8], [8 x i8]* %10, i64 0, i64 0
  %558 = load i8, i8* %557, align 1
  %559 = zext i8 %558 to i32
  %560 = and i32 %559, 128
  %561 = icmp eq i32 %560, 128
  br i1 %561, label %562, label %589

; <label>:562:                                    ; preds = %556
  %pgocount67 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 60)
  %563 = add i64 %pgocount67, 1
  store i64 %563, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 60)
  %564 = getelementptr inbounds [8 x i8], [8 x i8]* %10, i64 0, i64 0
  %565 = load i8, i8* %564, align 1
  %566 = zext i8 %565 to i32
  %567 = and i32 %566, 124
  %568 = icmp eq i32 %567, 4
  br i1 %568, label %583, label %569

; <label>:569:                                    ; preds = %562
  %pgocount68 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 67)
  %570 = add i64 %pgocount68, 1
  store i64 %570, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 67)
  %571 = getelementptr inbounds [8 x i8], [8 x i8]* %10, i64 0, i64 0
  %572 = load i8, i8* %571, align 1
  %573 = zext i8 %572 to i32
  %574 = and i32 %573, 124
  %575 = icmp eq i32 %574, 8
  br i1 %575, label %583, label %576

; <label>:576:                                    ; preds = %569
  %pgocount69 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 69)
  %577 = add i64 %pgocount69, 1
  store i64 %577, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 69)
  %578 = getelementptr inbounds [8 x i8], [8 x i8]* %10, i64 0, i64 0
  %579 = load i8, i8* %578, align 1
  %580 = zext i8 %579 to i32
  %581 = and i32 %580, 124
  %582 = icmp eq i32 %581, 36
  br i1 %582, label %583, label %589

; <label>:583:                                    ; preds = %576, %569, %562
  %pgocount70 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 62)
  %584 = add i64 %pgocount70, 1
  store i64 %584, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 62)
  %585 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %586 = call i8* @LANG(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.88, i32 0, i32 0))
  %587 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %585, i8* %586, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0))
  %588 = call i8* @maybe_force_extension(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  store i8* %588, i8** %12, align 8
  br label %589

; <label>:589:                                    ; preds = %583, %576, %556
  %pgocount71 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 58)
  %590 = add i64 %pgocount71, 1
  store i64 %590, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 58)
  br label %591

; <label>:591:                                    ; preds = %589, %542
  br label %592

; <label>:592:                                    ; preds = %591, %532
  %593 = load i8*, i8** %4, align 8
  %594 = load i8*, i8** %12, align 8
  %595 = icmp ne i8* %594, null
  br i1 %595, label %596, label %598

; <label>:596:                                    ; preds = %592
  %597 = load i8*, i8** %12, align 8
  br label %600

; <label>:598:                                    ; preds = %592
  %pgocount72 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 49)
  %599 = add i64 %pgocount72, 1
  store i64 %599, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 49)
  br label %600

; <label>:600:                                    ; preds = %598, %596
  %601 = phi i8* [ %597, %596 ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @plainfile, i32 0, i32 0), %598 ]
  %602 = call i8* @savetemp(i8* %593, i8* %601)
  %603 = icmp eq i8* %602, null
  br i1 %603, label %604, label %606

; <label>:604:                                    ; preds = %600
  %pgocount73 = load i64, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 50)
  %605 = add i64 %pgocount73, 1
  store i64 %605, i64* getelementptr inbounds ([74 x i64], [74 x i64]* @__profc_tmp1.ll_do_decrypt, i64 0, i64 50)
  store i32 3, i32* @errorLvl, align 4
  store i32 -1, i32* %2, align 4
  br label %609

; <label>:606:                                    ; preds = %600
  %607 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %608 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %607, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %609

; <label>:609:                                    ; preds = %606, %604, %514, %512, %487, %485, %460, %451, %446, %360, %309, %297, %266, %261, %253, %233, %228, %218, %191, %169, %150, %124, %114, %66, %26
  %610 = load i32, i32* %2, align 4
  ret i32 %610
}

declare zeroext i8 @legal_ctb(i8 zeroext) #3

declare zeroext i8 @getyesno(i8 signext) #3

declare i8* @file_tail(i8*) #3

declare i32 @is_text_file(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal zeroext i8 @file_compressible(i8*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i8*, align 8
  %4 = alloca [8 x i8], align 1
  store i8* %0, i8** %3, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i32 0, i32 0
  %7 = call i32 @get_header_info_from_file(i8* %5, i8* %6, i32 8)
  %8 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i32 0, i32 0
  %9 = call i32 @compressSignature(i8* %8)
  %10 = icmp sge i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_file_compressible, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_file_compressible, i64 0, i64 0)
  store i8 0, i8* %2, align 1
  br label %15

; <label>:13:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_file_compressible, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_file_compressible, i64 0, i64 1)
  store i8 1, i8* %2, align 1
  br label %15

; <label>:15:                                     ; preds = %13, %11
  %16 = load i8, i8* %2, align 1
  ret i8 %16
}

declare i32 @make_canonical(i8*, i8*) #3

declare void @rmtemp(i8*) #3

declare i32 @signfile(i8 zeroext, i8 zeroext, i8*, i8*, i8*, i8 signext, i8*) #3

declare i32 @make_literal(i8*, i8*, i8 signext, i8*) #3

declare i32 @getstring(i8*, i32, i32) #3

declare i32 @encryptfile(i8**, i8*, i8*, i8 zeroext) #3

declare i32 @idea_encryptfile(i8*, i8*, i8 zeroext) #3

declare i32 @squish_file(i8*, i8*) #3

declare i32 @armor_file(i8*, i8*, i8*, i8*, i8 zeroext) #3

declare i32 @writePhantomOutput(i8*) #3

declare void @drop_extension(i8*) #3

declare i8* @ck_dup_output(i8*, i8 zeroext, i8 zeroext) #3

declare i8* @savetemp(i8*, i8*) #3

declare void @cleanup_tmpf() #3

declare i32 @cryptRandOpen(%struct.IdeaCfbContext*) #3

declare void @cryptRandSave(%struct.IdeaCfbContext*) #3

declare i8* @realloc(...) #3

declare void @perror(i8*) #3

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #6

declare i8* @store_str(i8*) #3

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #2

declare i32 @fputs(i8*, %struct._IO_FILE*) #3

declare i64 @get_timestamp(i8*) #3

declare i8* @ctdate(i64*) #3

declare i32 @de_armor_file(i8*, i8*, i64*) #3

declare i32 @decryptfile(i8*, i8*) #3

declare i32 @check_signaturefile(i8*, i8*, i8 zeroext, i8*) #3

declare i32 @idea_decryptfile(i8*, i8*) #3

declare i32 @decompress_file(i8*, i8*) #3

declare i32 @strip_literal(i8*, i8*, i8*, i8*) #3

declare i32 @view_keyring(i8*, i8*, i8 zeroext, i8 zeroext) #3

declare i32 @addto_keyring(i8*, i8*) #3

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #3

declare i32 @more_file(i8*, i8 zeroext) #3

; Function Attrs: noinline nounwind uwtable
define internal void @clearscreen() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_clearscreen, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_clearscreen, i64 0, i64 0)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.89, i32 0, i32 0))
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %5 = call i32 @fflush(%struct._IO_FILE* %4)
  ret void
}

declare i8* @maybe_force_extension(i8*, i8*) #3

declare i32 @fflush(%struct._IO_FILE*) #3

declare i32 @manuals_missing() #3

declare i32 @dokeygen(i8*, i8*, i8*) #3

declare zeroext i8 @has_extension(i8*, i8*) #3

declare i32 @dokeycheck(i8*, i8*, i32) #3

declare i32 @maint_check(i8*, i32) #3

declare void @default_extension(i8*, i8*) #3

declare i32 @signkey(i8*, i8*, i8*) #3

declare i32 @maint_update(i8*, %struct.newkey*) #3

declare i32 @disable_key(i8*, i8*) #3

declare i32 @dokeyedit(i8*, i8*) #3

declare i32 @extract_from_keyring(i8*, i8*, i8*, i8 zeroext) #3

declare i32 @remove_sigs(i8*, i8*) #3

declare i32 @remove_from_keyring(i8*, i8*, i8*, i8 zeroext) #3

; Function Attrs: noinline nounwind uwtable
define internal void @build_helpfile(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = call i32 @strcmp(i8* getelementptr inbounds ([0 x i8], [0 x i8]* @language, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.141, i32 0, i32 0)) #8
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %35

; <label>:7:                                      ; preds = %2
  %8 = load i8*, i8** %3, align 8
  %9 = call i8* @buildfilename(i8* %8, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @language, i32 0, i32 0))
  %10 = load i8*, i8** %3, align 8
  %11 = load i8*, i8** %4, align 8
  %12 = call i8* @strcat(i8* %10, i8* %11) #7
  %13 = load i8*, i8** %3, align 8
  call void @force_extension(i8* %13, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @HLP_EXTENSION, i32 0, i32 0))
  %14 = load i8*, i8** %3, align 8
  %15 = call zeroext i8 @file_exists(i8* %14)
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_build_helpfile, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_build_helpfile, i64 0, i64 0)
  br label %57

; <label>:19:                                     ; preds = %7
  %20 = load i8*, i8** %3, align 8
  %21 = call i8* @strcpy(i8* %20, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.142, i32 0, i32 0)) #7
  %22 = load i8*, i8** %3, align 8
  %23 = call i8* @strcat(i8* %22, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @language, i32 0, i32 0)) #7
  %24 = load i8*, i8** %3, align 8
  %25 = load i8*, i8** %4, align 8
  %26 = call i8* @strcat(i8* %24, i8* %25) #7
  %27 = load i8*, i8** %3, align 8
  call void @force_extension(i8* %27, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @HLP_EXTENSION, i32 0, i32 0))
  %28 = load i8*, i8** %3, align 8
  %29 = call zeroext i8 @file_exists(i8* %28)
  %30 = icmp ne i8 %29, 0
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_build_helpfile, i64 0, i64 3)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_build_helpfile, i64 0, i64 3)
  br label %57

; <label>:33:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_build_helpfile, i64 0, i64 4)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_build_helpfile, i64 0, i64 4)
  br label %35

; <label>:35:                                     ; preds = %33, %2
  %36 = load i8*, i8** %3, align 8
  %37 = call i8* @buildfilename(i8* %36, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.143, i32 0, i32 0))
  %38 = load i8*, i8** %3, align 8
  %39 = load i8*, i8** %4, align 8
  %40 = call i8* @strcat(i8* %38, i8* %39) #7
  %41 = load i8*, i8** %3, align 8
  call void @force_extension(i8* %41, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @HLP_EXTENSION, i32 0, i32 0))
  %42 = load i8*, i8** %3, align 8
  %43 = call zeroext i8 @file_exists(i8* %42)
  %44 = icmp ne i8 %43, 0
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_build_helpfile, i64 0, i64 1)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_build_helpfile, i64 0, i64 1)
  br label %57

; <label>:47:                                     ; preds = %35
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_build_helpfile, i64 0, i64 2)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_build_helpfile, i64 0, i64 2)
  %49 = load i8*, i8** %3, align 8
  %50 = call i8* @strcpy(i8* %49, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.142, i32 0, i32 0)) #7
  %51 = load i8*, i8** %3, align 8
  %52 = call i8* @strcat(i8* %51, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.143, i32 0, i32 0)) #7
  %53 = load i8*, i8** %3, align 8
  %54 = load i8*, i8** %4, align 8
  %55 = call i8* @strcat(i8* %53, i8* %54) #7
  %56 = load i8*, i8** %3, align 8
  call void @force_extension(i8* %56, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @HLP_EXTENSION, i32 0, i32 0))
  br label %57

; <label>:57:                                     ; preds = %47, %45, %31, %17
  ret void
}

declare i32 @copyfiles_by_name(i8*, i8*) #3

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #7

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #7

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn }
attributes #10 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
