; ModuleID = 'tmp1.ll'
source_filename = "keyadd.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.hashent = type { %struct.hashent*, [8 x i8], i64 }
%struct.sig_list = type { %struct.sig_list*, i64 }
%struct.bufpool = type { %struct.bufpool*, [1 x i8] }
%struct.newkey = type { [8 x i8], %struct.newkey* }
%struct.IdeaCfbContext = type { [8 x i8], [8 x i8], [52 x i16], i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@pgpout = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [28 x i8] c"\0A\07Can't open key file '%s'\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.3 = private unnamed_addr constant [40 x i8] c"\0AKey ring file '%s' cannot be created.\0A\00", align 1
@newrvks = internal global i32 0, align 4
@newids = internal global i32 0, align 4
@newsigs = internal global i32 0, align 4
@newkeys = internal global i32 0, align 4
@.str.4 = private unnamed_addr constant [26 x i8] c"\0ALooking for new keys...\0A\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"\0A\07Could not read key from file '%s'.\0A\00", align 1
@publickey = internal global i8 0, align 1
@.str.6 = private unnamed_addr constant [199 x i8] c"\0A\07Warning: Key ID %s matches key ID of key already on \0Akey ring '%s', but the keys themselves differ.\0AThis is highly suspicious.  This key will not be added to ring.\0AAcknowledge by pressing return: \00", align 1
@interactive_add = external global i8, align 1
@.str.7 = private unnamed_addr constant [53 x i8] c"\0ADo you want to add this key to keyring '%s' (y/N)? \00", align 1
@batchmode = external global i8, align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"Key has been revoked.\0A\00", align 1
@.str.9 = private unnamed_addr constant [64 x i8] c"\0A\07Key file contains duplicate keys: cannot be added to keyring\0A\00", align 1
@mykeyID = internal global [8 x i8] zeroinitializer, align 1
@verbose = external global i8, align 1
@.str.10 = private unnamed_addr constant [20 x i8] c"Merging key ID: %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [39 x i8] c"No new keys or signatures in keyfile.\0A\00", align 1
@.str.12 = private unnamed_addr constant [39 x i8] c"addto_keyring: dokeycheck returned %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [20 x i8] c"\0AKeyfile contains:\0A\00", align 1
@.str.14 = private unnamed_addr constant [16 x i8] c"%4d new key(s)\0A\00", align 1
@.str.15 = private unnamed_addr constant [23 x i8] c"%4d new signatures(s)\0A\00", align 1
@.str.16 = private unnamed_addr constant [20 x i8] c"%4d new user ID(s)\0A\00", align 1
@.str.17 = private unnamed_addr constant [23 x i8] c"%4d new revocation(s)\0A\00", align 1
@ask_first = internal global i8 0, align 1
@filter_mode = external global i8, align 1
@.str.18 = private unnamed_addr constant [41 x i8] c"addto_keyring: maint_update returned %d\0A\00", align 1
@.str.19 = private unnamed_addr constant [25 x i8] c"\0ANo keys found in '%s'.\0A\00", align 1
@gpkf = internal global %struct._IO_FILE* null, align 8
@.str.20 = private unnamed_addr constant [24 x i8] c"gpk_open: already open\0A\00", align 1
@PGP_EXTENSION = external global [0 x i8], align 1
@hashtbl = internal global %struct.hashent** null, align 8
@.str.21 = private unnamed_addr constant [40 x i8] c"Warning: duplicate key in keyring '%s'\0A\00", align 1
@hashleft = internal global i32 0, align 4
@hashptr = internal global %struct.hashent* null, align 8
@.str.22 = private unnamed_addr constant [39 x i8] c"Key revocation certificate from \22%s\22.\0A\00", align 1
@.str.23 = private unnamed_addr constant [60 x i8] c"\0A\07WARNING:  File '%s' contains bad revocation certificate.\0A\00", align 1
@.str.24 = private unnamed_addr constant [19 x i8] c"New userid: \22%s\22.\0A\00", align 1
@.str.25 = private unnamed_addr constant [38 x i8] c"\0AWill be added to the following key:\0A\00", align 1
@.str.26 = private unnamed_addr constant [25 x i8] c"\0AAdd this userid (y/N)? \00", align 1
@.str.27 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.28 = private unnamed_addr constant [21 x i8] c"ring: %lx  key: %lx\0A\00", align 1
@.str.29 = private unnamed_addr constant [50 x i8] c"Replacing signature from keyID %s on userid \22%s\22\0A\00", align 1
@.str.30 = private unnamed_addr constant [29 x i8] c"Verifying signature from %s\0A\00", align 1
@.str.31 = private unnamed_addr constant [16 x i8] c"on userid \22%s\22\0A\00", align 1
@.str.32 = private unnamed_addr constant [29 x i8] c"Replacing signature from %s\0A\00", align 1
@.str.33 = private unnamed_addr constant [21 x i8] c"Verification Failed\0A\00", align 1
@.str.34 = private unnamed_addr constant [44 x i8] c"New signature from keyID %s on userid \22%s\22\0A\00", align 1
@.str.35 = private unnamed_addr constant [23 x i8] c"New signature from %s\0A\00", align 1
@siglist = internal global %struct.sig_list* null, align 8
@.str.36 = private unnamed_addr constant [112 x i8] c"\0AOne or more of the new keys are not fully certified.\0ADo you want to certify any of these keys yourself (y/N)? \00", align 1
@.str.37 = private unnamed_addr constant [50 x i8] c"\0ADo you want to certify this key yourself (y/N)? \00", align 1
@my_name = external global [0 x i8], align 1
@bufpool = internal global %struct.bufpool* null, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn__addto_keyring = private constant [14 x i8] c"_addto_keyring"
@__profn_gpk_open = private constant [8 x i8] c"gpk_open"
@__profn_get_publickey = private constant [13 x i8] c"get_publickey"
@__profn_gpk_close = private constant [9 x i8] c"gpk_close"
@__profn_tmp1.ll_mergekeys = private constant [17 x i8] c"tmp1.ll:mergekeys"
@__profn_tmp1.ll_ask_to_sign = private constant [19 x i8] c"tmp1.ll:ask_to_sign"
@__profn_addto_keyring = private constant [13 x i8] c"addto_keyring"
@__profn_tmp1.ll_find_keyID = private constant [18 x i8] c"tmp1.ll:find_keyID"
@__profn_tmp1.ll_allocbuf = private constant [16 x i8] c"tmp1.ll:allocbuf"
@__profn_tmp1.ll_freebufpool = private constant [19 x i8] c"tmp1.ll:freebufpool"
@__profn_tmp1.ll_mergesigs = private constant [17 x i8] c"tmp1.ll:mergesigs"
@__profn_tmp1.ll_sig_list_add = private constant [20 x i8] c"tmp1.ll:sig_list_add"
@__profn_tmp1.ll_sig_list_find = private constant [21 x i8] c"tmp1.ll:sig_list_find"
@__profn_tmp1.ll_sig_list_clear = private constant [22 x i8] c"tmp1.ll:sig_list_clear"
@__profc__addto_keyring = private global [61 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__addto_keyring = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1036872851614254286, i64 811454602119, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @_addto_keyring to i8*), i8* null, i32 61, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gpk_open = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gpk_open = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 363478682198509479, i64 132045139980, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i32 0, i32 0), i8* bitcast (i32 (i8*)* @gpk_open to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_get_publickey = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_get_publickey = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3469411543771350434, i64 126390409467, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i32 0, i32 0), i8* bitcast (i32 (i64*, i32*, i8*, i8*, i8*, i16*, i16*)* @get_publickey to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gpk_close = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gpk_close = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1146243315752176633, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gpk_close, i32 0, i32 0), i8* bitcast (void ()* @gpk_close to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_mergekeys = private global [34 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_mergekeys = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7086903038312826360, i64 450059674480, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i32 0, i32 0), i8* null, i8* null, i32 34, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ask_to_sign = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ask_to_sign = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6114141384077571121, i64 210995932332, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_addto_keyring = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_addto_keyring = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6768632832970601785, i64 84390798676, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @addto_keyring to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_find_keyID = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_find_keyID = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1993995802490708510, i64 51054561640, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_keyID, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_allocbuf = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_allocbuf = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2681538370070118655, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_allocbuf, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_freebufpool = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_freebufpool = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4630928197787964180, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_freebufpool, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_mergesigs = private global [32 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_mergesigs = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9151742662213008560, i64 414483245605, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i32 0, i32 0), i8* null, i8* null, i32 32, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_sig_list_add = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_sig_list_add = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7864022970032618679, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_sig_list_add, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_sig_list_find = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_sig_list_find = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3013014177073221342, i64 51054561640, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_sig_list_find, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_sig_list_clear = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_sig_list_clear = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3972372742239646736, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig_list_clear, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [242 x i8] c"\EF\01\00_addto_keyring\01gpk_open\01get_publickey\01gpk_close\01tmp1.ll:mergekeys\01tmp1.ll:ask_to_sign\01addto_keyring\01tmp1.ll:find_keyID\01tmp1.ll:allocbuf\01tmp1.ll:freebufpool\01tmp1.ll:mergesigs\01tmp1.ll:sig_list_add\01tmp1.ll:sig_list_find\01tmp1.ll:sig_list_clear", section "__llvm_prf_names"
@llvm.used = appending global [15 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__addto_keyring to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gpk_open to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_get_publickey to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gpk_close to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_mergekeys to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ask_to_sign to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_addto_keyring to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_find_keyID to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_allocbuf to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_freebufpool to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_mergesigs to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_sig_list_add to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_sig_list_find to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_sig_list_clear to i8*), i8* getelementptr inbounds ([242 x i8], [242 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @_addto_keyring(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8, align 1
  %13 = alloca i32, align 4
  %14 = alloca [130 x i16], align 16
  %15 = alloca [130 x i16], align 16
  %16 = alloca [130 x i16], align 16
  %17 = alloca [8 x i8], align 1
  %18 = alloca [256 x i8], align 16
  %19 = alloca [256 x i8], align 16
  %20 = alloca i64, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i8, align 1
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca %struct.newkey*, align 8
  %26 = alloca %struct.newkey*, align 8
  %27 = alloca i8*, align 8
  %28 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %29 = bitcast i64* %20 to i8*
  store i8* %29, i8** %21, align 8
  store i8 0, i8* %22, align 1
  store i32 0, i32* %23, align 4
  store %struct.newkey* null, %struct.newkey** %26, align 8
  %30 = load i8*, i8** %4, align 8
  %31 = call %struct._IO_FILE* @fopen(i8* %30, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %31, %struct._IO_FILE** %6, align 8
  %32 = icmp eq %struct._IO_FILE* %31, null
  br i1 %32, label %33, label %39

; <label>:33:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 3)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 3)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %36 = call i8* @LANG(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i32 0, i32 0))
  %37 = load i8*, i8** %4, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* %36, i8* %37)
  store i32 -1, i32* %3, align 4
  br label %609

; <label>:39:                                     ; preds = %2
  store i8 0, i8* %12, align 1
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %41 = call i64 @fread(i8* %12, i64 1, i64 1, %struct._IO_FILE* %40)
  %42 = icmp ne i64 %41, 1
  br i1 %42, label %48, label %43

; <label>:43:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 4)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 4)
  %45 = load i8, i8* %12, align 1
  %46 = call i32 @is_key_ctb(i8 zeroext %45)
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %52, label %48

; <label>:48:                                     ; preds = %43, %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 1)
  %49 = add i64 %pgocount2, 1
  store i64 %49, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 1)
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %51 = call i32 @fclose(%struct._IO_FILE* %50)
  store i32 -1, i32* %3, align 4
  br label %609

; <label>:52:                                     ; preds = %43
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  call void @rewind(%struct._IO_FILE* %53)
  %54 = load i8*, i8** %5, align 8
  call void @setoutdir(i8* %54)
  %55 = call i8* @tempfile(i32 0)
  store i8* %55, i8** %27, align 8
  %56 = load i8*, i8** %5, align 8
  %57 = call i32 @setkrent(i8* %56)
  %58 = load i8*, i8** %4, align 8
  %59 = call i32 @setkrent(i8* %58)
  %60 = call i32 @init_userhash()
  %61 = load i8*, i8** %5, align 8
  %62 = call zeroext i8 @file_exists(i8* %61)
  %63 = icmp ne i8 %62, 0
  br i1 %63, label %81, label %64

; <label>:64:                                     ; preds = %52
  %65 = load i8*, i8** %5, align 8
  %66 = call %struct._IO_FILE* @fopen(i8* %65, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %66, %struct._IO_FILE** %7, align 8
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %68 = icmp eq %struct._IO_FILE* %67, null
  br i1 %68, label %69, label %77

; <label>:69:                                     ; preds = %64
  %pgocount3 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 24)
  %70 = add i64 %pgocount3, 1
  store i64 %70, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 24)
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %72 = call i8* @LANG(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.3, i32 0, i32 0))
  %73 = load i8*, i8** %5, align 8
  %74 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %71, i8* %72, i8* %73)
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %76 = call i32 @fclose(%struct._IO_FILE* %75)
  br label %607

; <label>:77:                                     ; preds = %64
  %pgocount4 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 18)
  %78 = add i64 %pgocount4, 1
  store i64 %78, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 18)
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %80 = call i32 @fclose(%struct._IO_FILE* %79)
  br label %81

; <label>:81:                                     ; preds = %77, %52
  %82 = load i8*, i8** %27, align 8
  %83 = call %struct._IO_FILE* @fopen(i8* %82, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %83, %struct._IO_FILE** %7, align 8
  %84 = icmp eq %struct._IO_FILE* %83, null
  br i1 %84, label %85, label %89

; <label>:85:                                     ; preds = %81
  %pgocount5 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 13)
  %86 = add i64 %pgocount5, 1
  store i64 %86, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 13)
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %88 = call i32 @fclose(%struct._IO_FILE* %87)
  br label %607

; <label>:89:                                     ; preds = %81
  store i32 0, i32* @newrvks, align 4
  store i32 0, i32* @newids, align 4
  store i32 0, i32* @newsigs, align 4
  store i32 0, i32* @newkeys, align 4
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %91 = call i8* @LANG(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i32 0, i32 0))
  %92 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %90, i8* %91)
  store i32 0, i32* %24, align 4
  %93 = load i8*, i8** %5, align 8
  %94 = call i32 @gpk_open(i8* %93)
  %95 = icmp slt i32 %94, 0
  br i1 %95, label %96, label %102

; <label>:96:                                     ; preds = %89
  %pgocount6 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 20)
  %97 = add i64 %pgocount6, 1
  store i64 %97, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 20)
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %99 = call i32 @fclose(%struct._IO_FILE* %98)
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %101 = call i32 @fclose(%struct._IO_FILE* %100)
  br label %607

; <label>:102:                                    ; preds = %89
  br label %103

; <label>:103:                                    ; preds = %313, %136, %102
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %105 = call i64 @ftell(%struct._IO_FILE* %104)
  store i64 %105, i64* %9, align 8
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %107 = load i8*, i8** %21, align 8
  %108 = getelementptr inbounds [256 x i8], [256 x i8]* %18, i32 0, i32 0
  %109 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  %110 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %111 = call signext i16 @readkeypacket(%struct._IO_FILE* %106, %struct.IdeaCfbContext* null, i8* %12, i8* %107, i8* %108, i16* %109, i16* %110, i16* null, i16* null, i16* null, i16* null, i8* null, i8* null)
  %112 = sext i16 %111 to i32
  store i32 %112, i32* %13, align 4
  %113 = load i32, i32* %13, align 4
  %114 = icmp eq i32 %113, -1
  br i1 %114, label %115, label %116

; <label>:115:                                    ; preds = %103
  br label %314

; <label>:116:                                    ; preds = %103
  %117 = load i32, i32* %13, align 4
  %118 = icmp eq i32 %117, -2
  br i1 %118, label %123, label %119

; <label>:119:                                    ; preds = %116
  %pgocount7 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 0)
  %120 = add i64 %pgocount7, 1
  store i64 %120, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 0)
  %121 = load i32, i32* %13, align 4
  %122 = icmp eq i32 %121, -3
  br i1 %122, label %123, label %133

; <label>:123:                                    ; preds = %119, %116
  %pgocount8 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 19)
  %124 = add i64 %pgocount8, 1
  store i64 %124, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 19)
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %126 = call i8* @LANG(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i32 0, i32 0))
  %127 = load i8*, i8** %4, align 8
  %128 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %125, i8* %126, i8* %127)
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %130 = call i32 @fclose(%struct._IO_FILE* %129)
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %132 = call i32 @fclose(%struct._IO_FILE* %131)
  br label %607

; <label>:133:                                    ; preds = %119
  %134 = load i32, i32* %13, align 4
  %135 = icmp slt i32 %134, 0
  br i1 %135, label %136, label %138

; <label>:136:                                    ; preds = %133
  %pgocount9 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 6)
  %137 = add i64 %pgocount9, 1
  store i64 %137, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 6)
  store i32 0, i32* %24, align 4
  br label %103

; <label>:138:                                    ; preds = %133
  %pgocount10 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 2)
  %139 = add i64 %pgocount10, 1
  store i64 %139, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 2)
  %140 = load i8, i8* %12, align 1
  %141 = call i32 @is_key_ctb(i8 zeroext %140)
  %142 = icmp ne i32 %141, 0
  br i1 %142, label %143, label %242

; <label>:143:                                    ; preds = %138
  %144 = getelementptr inbounds [8 x i8], [8 x i8]* %17, i32 0, i32 0
  %145 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  call void @extract_keyID(i8* %144, i16* %145)
  %146 = load i8, i8* %12, align 1
  %147 = zext i8 %146 to i32
  %148 = and i32 %147, 124
  %149 = icmp eq i32 %148, 24
  %150 = zext i1 %149 to i32
  %151 = trunc i32 %150 to i8
  store i8 %151, i8* @publickey, align 1
  %152 = getelementptr inbounds [8 x i8], [8 x i8]* %17, i32 0, i32 0
  %153 = load i8*, i8** %21, align 8
  %154 = getelementptr inbounds [256 x i8], [256 x i8]* %18, i32 0, i32 0
  %155 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  %156 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %157 = call i32 @get_publickey(i64* %10, i32* null, i8* %152, i8* %153, i8* %154, i16* %155, i16* %156)
  store i32 %157, i32* %13, align 4
  %158 = load i32, i32* %13, align 4
  %159 = icmp eq i32 %158, 0
  br i1 %159, label %160, label %180

; <label>:160:                                    ; preds = %143
  %161 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  %162 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  %163 = call signext i16 @mp_compare(i16* %161, i16* %162)
  %164 = sext i16 %163 to i32
  %165 = icmp ne i32 %164, 0
  br i1 %165, label %166, label %175

; <label>:166:                                    ; preds = %160
  %pgocount11 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 14)
  %167 = add i64 %pgocount11, 1
  store i64 %167, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 14)
  %168 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %169 = call i8* @LANG(i8* getelementptr inbounds ([199 x i8], [199 x i8]* @.str.6, i32 0, i32 0))
  %170 = getelementptr inbounds [8 x i8], [8 x i8]* %17, i32 0, i32 0
  %171 = call i8* @keyIDstring(i8* %170)
  %172 = load i8*, i8** %5, align 8
  %173 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %168, i8* %169, i8* %171, i8* %172)
  %174 = call zeroext i8 @getyesno(i8 signext 110)
  br label %179

; <label>:175:                                    ; preds = %160
  %pgocount12 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 23)
  %176 = add i64 %pgocount12, 1
  store i64 %176, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 23)
  %177 = load i32, i32* %23, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %23, align 4
  br label %179

; <label>:179:                                    ; preds = %175, %166
  store i32 0, i32* %24, align 4
  br label %241

; <label>:180:                                    ; preds = %143
  %181 = load i32, i32* %13, align 4
  %182 = icmp eq i32 %181, -1
  br i1 %182, label %183, label %238

; <label>:183:                                    ; preds = %180
  %184 = load i32, i32* @newkeys, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* @newkeys, align 4
  %186 = load i8, i8* @interactive_add, align 1
  %187 = icmp ne i8 %186, 0
  br i1 %187, label %188, label %204

; <label>:188:                                    ; preds = %183
  %189 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %190 = load i64, i64* %9, align 8
  %191 = call i32 @show_key(%struct._IO_FILE* %189, i64 %190, i32 3)
  %192 = icmp ne i32 %191, 0
  br i1 %192, label %201, label %193

; <label>:193:                                    ; preds = %188
  %pgocount13 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 29)
  %194 = add i64 %pgocount13, 1
  store i64 %194, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 29)
  %195 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %196 = call i8* @LANG(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.7, i32 0, i32 0))
  %197 = load i8*, i8** %5, align 8
  %198 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %195, i8* %196, i8* %197)
  %199 = call zeroext i8 @getyesno(i8 signext 110)
  %200 = zext i8 %199 to i32
  store i32 %200, i32* %24, align 4
  br label %203

; <label>:201:                                    ; preds = %188
  %pgocount14 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 26)
  %202 = add i64 %pgocount14, 1
  store i64 %202, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 26)
  store i32 0, i32* %24, align 4
  br label %203

; <label>:203:                                    ; preds = %201, %193
  br label %214

; <label>:204:                                    ; preds = %183
  %205 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %206 = load i64, i64* %9, align 8
  %207 = call i32 @show_key(%struct._IO_FILE* %205, i64 %206, i32 8)
  %208 = icmp ne i32 %207, 0
  br i1 %208, label %211, label %209

; <label>:209:                                    ; preds = %204
  %pgocount15 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 34)
  %210 = add i64 %pgocount15, 1
  store i64 %210, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 34)
  store i32 1, i32* %24, align 4
  br label %213

; <label>:211:                                    ; preds = %204
  %pgocount16 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 28)
  %212 = add i64 %pgocount16, 1
  store i64 %212, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 28)
  store i32 0, i32* %24, align 4
  br label %213

; <label>:213:                                    ; preds = %211, %209
  br label %214

; <label>:214:                                    ; preds = %213, %203
  %215 = load i8, i8* @batchmode, align 1
  %216 = icmp ne i8 %215, 0
  br i1 %216, label %217, label %222

; <label>:217:                                    ; preds = %214
  %pgocount17 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 21)
  %218 = add i64 %pgocount17, 1
  store i64 %218, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 21)
  %219 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %220 = load i64, i64* %9, align 8
  %221 = call i32 @show_key(%struct._IO_FILE* %219, i64 %220, i32 16)
  br label %222

; <label>:222:                                    ; preds = %217, %214
  %223 = load i32, i32* %24, align 4
  %224 = icmp ne i32 %223, 0
  br i1 %224, label %225, label %237

; <label>:225:                                    ; preds = %222
  %pgocount18 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 22)
  %226 = add i64 %pgocount18, 1
  store i64 %226, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 22)
  %227 = call i8* @xmalloc(i32 16)
  %228 = bitcast i8* %227 to %struct.newkey*
  store %struct.newkey* %228, %struct.newkey** %25, align 8
  %229 = load %struct.newkey*, %struct.newkey** %25, align 8
  %230 = getelementptr inbounds %struct.newkey, %struct.newkey* %229, i32 0, i32 0
  %231 = getelementptr inbounds [8 x i8], [8 x i8]* %230, i32 0, i32 0
  %232 = getelementptr inbounds [8 x i8], [8 x i8]* %17, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %231, i8* %232, i64 8, i32 1, i1 false)
  %233 = load %struct.newkey*, %struct.newkey** %26, align 8
  %234 = load %struct.newkey*, %struct.newkey** %25, align 8
  %235 = getelementptr inbounds %struct.newkey, %struct.newkey* %234, i32 0, i32 1
  store %struct.newkey* %233, %struct.newkey** %235, align 8
  %236 = load %struct.newkey*, %struct.newkey** %25, align 8
  store %struct.newkey* %236, %struct.newkey** %26, align 8
  br label %237

; <label>:237:                                    ; preds = %225, %222
  br label %240

; <label>:238:                                    ; preds = %180
  %pgocount19 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 8)
  %239 = add i64 %pgocount19, 1
  store i64 %239, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 8)
  store i32 0, i32* %24, align 4
  br label %240

; <label>:240:                                    ; preds = %238, %237
  br label %241

; <label>:241:                                    ; preds = %240, %179
  br label %242

; <label>:242:                                    ; preds = %241, %138
  %243 = load i32, i32* %24, align 4
  %244 = icmp ne i32 %243, 0
  br i1 %244, label %245, label %313

; <label>:245:                                    ; preds = %242
  %pgocount20 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 5)
  %246 = add i64 %pgocount20, 1
  store i64 %246, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 5)
  %247 = load i8, i8* %12, align 1
  %248 = call i32 @is_key_ctb(i8 zeroext %247)
  %249 = icmp ne i32 %248, 0
  br i1 %249, label %261, label %250

; <label>:250:                                    ; preds = %245
  %pgocount21 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 9)
  %251 = add i64 %pgocount21, 1
  store i64 %251, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 9)
  %252 = load i8, i8* %12, align 1
  %253 = zext i8 %252 to i32
  %254 = icmp eq i32 %253, 180
  br i1 %254, label %261, label %255

; <label>:255:                                    ; preds = %250
  %pgocount22 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 17)
  %256 = add i64 %pgocount22, 1
  store i64 %256, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 17)
  %257 = load i8, i8* %12, align 1
  %258 = zext i8 %257 to i32
  %259 = and i32 %258, 124
  %260 = icmp eq i32 %259, 8
  br i1 %260, label %261, label %313

; <label>:261:                                    ; preds = %255, %250, %245
  %262 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %263 = call i64 @ftell(%struct._IO_FILE* %262)
  %264 = load i64, i64* %9, align 8
  %265 = sub nsw i64 %263, %264
  %266 = trunc i64 %265 to i32
  store i32 %266, i32* %11, align 4
  %267 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %268 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %269 = load i32, i32* %11, align 4
  %270 = sext i32 %269 to i64
  %271 = load i64, i64* %9, align 8
  %272 = call i32 @copyfilepos(%struct._IO_FILE* %267, %struct._IO_FILE* %268, i64 %270, i64 %271)
  %273 = load i8, i8* @publickey, align 1
  %274 = icmp ne i8 %273, 0
  br i1 %274, label %275, label %311

; <label>:275:                                    ; preds = %261
  %276 = load i8, i8* %12, align 1
  %277 = call i32 @is_key_ctb(i8 zeroext %276)
  %278 = icmp ne i32 %277, 0
  br i1 %278, label %279, label %282

; <label>:279:                                    ; preds = %275
  %pgocount23 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 10)
  %280 = add i64 %pgocount23, 1
  store i64 %280, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 10)
  %281 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  call void @write_trust(%struct._IO_FILE* %281, i8 zeroext 0)
  store i8 0, i8* %22, align 1
  br label %310

; <label>:282:                                    ; preds = %275
  %283 = load i8, i8* %12, align 1
  %284 = zext i8 %283 to i32
  %285 = and i32 %284, 124
  %286 = icmp eq i32 %285, 8
  br i1 %286, label %287, label %299

; <label>:287:                                    ; preds = %282
  %288 = load i8, i8* %22, align 1
  %289 = icmp ne i8 %288, 0
  br i1 %289, label %290, label %293

; <label>:290:                                    ; preds = %287
  %pgocount24 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 27)
  %291 = add i64 %pgocount24, 1
  store i64 %291, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 27)
  %292 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  call void @write_trust(%struct._IO_FILE* %292, i8 zeroext 0)
  br label %298

; <label>:293:                                    ; preds = %287
  %pgocount25 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 31)
  %294 = add i64 %pgocount25, 1
  store i64 %294, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 31)
  %295 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %296 = call i8* @LANG(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
  %297 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %295, i8* %296)
  br label %298

; <label>:298:                                    ; preds = %293, %290
  br label %309

; <label>:299:                                    ; preds = %282
  %300 = load i8, i8* %12, align 1
  %301 = zext i8 %300 to i32
  %302 = and i32 %301, 124
  %303 = icmp eq i32 %302, 52
  br i1 %303, label %304, label %307

; <label>:304:                                    ; preds = %299
  %pgocount26 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 30)
  %305 = add i64 %pgocount26, 1
  store i64 %305, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 30)
  %306 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  call void @write_trust(%struct._IO_FILE* %306, i8 zeroext 0)
  store i8 1, i8* %22, align 1
  br label %307

; <label>:307:                                    ; preds = %304, %299
  %pgocount27 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 25)
  %308 = add i64 %pgocount27, 1
  store i64 %308, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 25)
  br label %309

; <label>:309:                                    ; preds = %307, %298
  br label %310

; <label>:310:                                    ; preds = %309, %279
  br label %311

; <label>:311:                                    ; preds = %310, %261
  %pgocount28 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 7)
  %312 = add i64 %pgocount28, 1
  store i64 %312, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 7)
  br label %313

; <label>:313:                                    ; preds = %311, %255, %242
  br label %103

; <label>:314:                                    ; preds = %115
  call void @gpk_close()
  %315 = load i8*, i8** %5, align 8
  %316 = call %struct._IO_FILE* @fopen(i8* %315, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %316, %struct._IO_FILE** %8, align 8
  %317 = icmp ne %struct._IO_FILE* %316, null
  br i1 %317, label %318, label %466

; <label>:318:                                    ; preds = %314
  %319 = load i8*, i8** %4, align 8
  %320 = call i32 @gpk_open(i8* %319)
  %321 = icmp slt i32 %320, 0
  br i1 %321, label %322, label %330

; <label>:322:                                    ; preds = %318
  %pgocount29 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 37)
  %323 = add i64 %pgocount29, 1
  store i64 %323, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 37)
  %324 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %325 = call i32 @fclose(%struct._IO_FILE* %324)
  %326 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %327 = call i32 @fclose(%struct._IO_FILE* %326)
  %328 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %329 = call i32 @fclose(%struct._IO_FILE* %328)
  br label %607

; <label>:330:                                    ; preds = %318
  br label %331

; <label>:331:                                    ; preds = %457, %330
  %332 = load i32, i32* %23, align 4
  %333 = icmp ne i32 %332, 0
  br i1 %333, label %334, label %459

; <label>:334:                                    ; preds = %331
  %335 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %336 = call i64 @ftell(%struct._IO_FILE* %335)
  store i64 %336, i64* %9, align 8
  %337 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %338 = getelementptr inbounds [256 x i8], [256 x i8]* %18, i32 0, i32 0
  %339 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  %340 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %341 = call signext i16 @readkeypacket(%struct._IO_FILE* %337, %struct.IdeaCfbContext* null, i8* %12, i8* null, i8* %338, i16* %339, i16* %340, i16* null, i16* null, i16* null, i16* null, i8* null, i8* null)
  %342 = sext i16 %341 to i32
  store i32 %342, i32* %13, align 4
  %343 = load i32, i32* %13, align 4
  %344 = icmp eq i32 %343, -1
  br i1 %344, label %349, label %345

; <label>:345:                                    ; preds = %334
  %pgocount30 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 11)
  %346 = add i64 %pgocount30, 1
  store i64 %346, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 11)
  %347 = load i32, i32* %13, align 4
  %348 = icmp eq i32 %347, -3
  br i1 %348, label %349, label %370

; <label>:349:                                    ; preds = %345, %334
  %350 = load i32, i32* %13, align 4
  %351 = icmp eq i32 %350, -1
  br i1 %351, label %352, label %357

; <label>:352:                                    ; preds = %349
  %pgocount31 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 42)
  %353 = add i64 %pgocount31, 1
  store i64 %353, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 42)
  %354 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %355 = call i8* @LANG(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.9, i32 0, i32 0))
  %356 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %354, i8* %355)
  br label %363

; <label>:357:                                    ; preds = %349
  %pgocount32 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 39)
  %358 = add i64 %pgocount32, 1
  store i64 %358, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 39)
  %359 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %360 = call i8* @LANG(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i32 0, i32 0))
  %361 = load i8*, i8** %5, align 8
  %362 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %359, i8* %360, i8* %361)
  br label %363

; <label>:363:                                    ; preds = %357, %352
  %364 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %365 = call i32 @fclose(%struct._IO_FILE* %364)
  %366 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %367 = call i32 @fclose(%struct._IO_FILE* %366)
  %368 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %369 = call i32 @fclose(%struct._IO_FILE* %368)
  br label %607

; <label>:370:                                    ; preds = %345
  %371 = getelementptr inbounds [256 x i8], [256 x i8]* %18, i32 0, i32 0
  call void @PascalToC(i8* %371)
  %372 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %373 = call i64 @ftell(%struct._IO_FILE* %372)
  %374 = load i64, i64* %9, align 8
  %375 = sub nsw i64 %373, %374
  %376 = trunc i64 %375 to i32
  store i32 %376, i32* %11, align 4
  %377 = load i8, i8* %12, align 1
  %378 = call i32 @is_key_ctb(i8 zeroext %377)
  %379 = icmp ne i32 %378, 0
  br i1 %379, label %380, label %442

; <label>:380:                                    ; preds = %370
  store i32 1, i32* %24, align 4
  %381 = load i32, i32* %13, align 4
  %382 = icmp eq i32 %381, 0
  br i1 %382, label %383, label %440

; <label>:383:                                    ; preds = %380
  %384 = getelementptr inbounds [8 x i8], [8 x i8]* %17, i32 0, i32 0
  %385 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  call void @extract_keyID(i8* %384, i16* %385)
  %386 = getelementptr inbounds [130 x i16], [130 x i16]* %14, i32 0, i32 0
  call void @extract_keyID(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @mykeyID, i32 0, i32 0), i16* %386)
  %387 = load i8, i8* %12, align 1
  %388 = zext i8 %387 to i32
  %389 = and i32 %388, 124
  %390 = icmp eq i32 %389, 24
  %391 = zext i1 %390 to i32
  %392 = trunc i32 %391 to i8
  store i8 %392, i8* @publickey, align 1
  %393 = getelementptr inbounds [8 x i8], [8 x i8]* %17, i32 0, i32 0
  %394 = load i8*, i8** %21, align 8
  %395 = getelementptr inbounds [256 x i8], [256 x i8]* %19, i32 0, i32 0
  %396 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  %397 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %398 = call i32 @get_publickey(i64* %28, i32* null, i8* %393, i8* %394, i8* %395, i16* %396, i16* %397)
  store i32 %398, i32* %13, align 4
  %399 = icmp sge i32 %398, 0
  br i1 %399, label %400, label %430

; <label>:400:                                    ; preds = %383
  %401 = load i8, i8* @verbose, align 1
  %402 = icmp ne i8 %401, 0
  br i1 %402, label %403, label %409

; <label>:403:                                    ; preds = %400
  %pgocount33 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 36)
  %404 = add i64 %pgocount33, 1
  store i64 %404, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 36)
  %405 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %406 = getelementptr inbounds [8 x i8], [8 x i8]* %17, i32 0, i32 0
  %407 = call i8* @keyIDstring(i8* %406)
  %408 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %405, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.10, i32 0, i32 0), i8* %407)
  br label %409

; <label>:409:                                    ; preds = %403, %400
  %410 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %411 = load i8*, i8** %4, align 8
  %412 = load i64, i64* %28, align 8
  %413 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %414 = load i8*, i8** %5, align 8
  %415 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %416 = call i32 @mergekeys(%struct._IO_FILE* %410, i8* %411, i64 %412, %struct._IO_FILE* %413, i8* %414, i64* %9, %struct._IO_FILE* %415)
  %417 = icmp slt i32 %416, 0
  br i1 %417, label %418, label %426

; <label>:418:                                    ; preds = %409
  %pgocount34 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 55)
  %419 = add i64 %pgocount34, 1
  store i64 %419, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 55)
  %420 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %421 = call i32 @fclose(%struct._IO_FILE* %420)
  %422 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %423 = call i32 @fclose(%struct._IO_FILE* %422)
  %424 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %425 = call i32 @fclose(%struct._IO_FILE* %424)
  br label %607

; <label>:426:                                    ; preds = %409
  %pgocount35 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 33)
  %427 = add i64 %pgocount35, 1
  store i64 %427, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 33)
  store i32 0, i32* %24, align 4
  %428 = load i32, i32* %23, align 4
  %429 = add nsw i32 %428, -1
  store i32 %429, i32* %23, align 4
  br label %439

; <label>:430:                                    ; preds = %383
  %431 = load i32, i32* %13, align 4
  %432 = icmp eq i32 %431, -3
  br i1 %432, label %433, label %437

; <label>:433:                                    ; preds = %430
  %pgocount36 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 38)
  %434 = add i64 %pgocount36, 1
  store i64 %434, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 38)
  %435 = load i32, i32* %23, align 4
  %436 = add nsw i32 %435, -1
  store i32 %436, i32* %23, align 4
  br label %437

; <label>:437:                                    ; preds = %433, %430
  %pgocount37 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 32)
  %438 = add i64 %pgocount37, 1
  store i64 %438, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 32)
  br label %439

; <label>:439:                                    ; preds = %437, %426
  br label %440

; <label>:440:                                    ; preds = %439, %380
  %pgocount38 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 16)
  %441 = add i64 %pgocount38, 1
  store i64 %441, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 16)
  br label %442

; <label>:442:                                    ; preds = %440, %370
  %443 = load i32, i32* %24, align 4
  %444 = icmp ne i32 %443, 0
  br i1 %444, label %445, label %457

; <label>:445:                                    ; preds = %442
  %pgocount39 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 15)
  %446 = add i64 %pgocount39, 1
  store i64 %446, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 15)
  %447 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %448 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %449 = load i32, i32* %11, align 4
  %450 = sext i32 %449 to i64
  %451 = load i64, i64* %9, align 8
  %452 = call i32 @copyfilepos(%struct._IO_FILE* %447, %struct._IO_FILE* %448, i64 %450, i64 %451)
  %453 = load i32, i32* %11, align 4
  %454 = sext i32 %453 to i64
  %455 = load i64, i64* %9, align 8
  %456 = add nsw i64 %455, %454
  store i64 %456, i64* %9, align 8
  br label %457

; <label>:457:                                    ; preds = %445, %442
  %pgocount40 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 12)
  %458 = add i64 %pgocount40, 1
  store i64 %458, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 12)
  br label %331

; <label>:459:                                    ; preds = %331
  %pgocount41 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 40)
  %460 = add i64 %pgocount41, 1
  store i64 %460, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 40)
  call void @gpk_close()
  %461 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %462 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %463 = call i32 @copyfile(%struct._IO_FILE* %461, %struct._IO_FILE* %462, i64 -1)
  %464 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %465 = call i32 @fclose(%struct._IO_FILE* %464)
  br label %466

; <label>:466:                                    ; preds = %459, %314
  %467 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %468 = call i32 @fclose(%struct._IO_FILE* %467)
  %469 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %470 = call i32 @write_error(%struct._IO_FILE* %469)
  %471 = icmp ne i32 %470, 0
  br i1 %471, label %472, label %476

; <label>:472:                                    ; preds = %466
  %pgocount42 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 35)
  %473 = add i64 %pgocount42, 1
  store i64 %473, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 35)
  %474 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %475 = call i32 @fclose(%struct._IO_FILE* %474)
  br label %607

; <label>:476:                                    ; preds = %466
  %477 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %478 = call i32 @fclose(%struct._IO_FILE* %477)
  %479 = load i32, i32* @newsigs, align 4
  %480 = icmp eq i32 %479, 0
  br i1 %480, label %481, label %499

; <label>:481:                                    ; preds = %476
  %pgocount43 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 45)
  %482 = add i64 %pgocount43, 1
  store i64 %482, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 45)
  %483 = load i32, i32* @newkeys, align 4
  %484 = icmp eq i32 %483, 0
  br i1 %484, label %485, label %499

; <label>:485:                                    ; preds = %481
  %pgocount44 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 54)
  %486 = add i64 %pgocount44, 1
  store i64 %486, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 54)
  %487 = load i32, i32* @newids, align 4
  %488 = icmp eq i32 %487, 0
  br i1 %488, label %489, label %499

; <label>:489:                                    ; preds = %485
  %pgocount45 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 57)
  %490 = add i64 %pgocount45, 1
  store i64 %490, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 57)
  %491 = load i32, i32* @newrvks, align 4
  %492 = icmp eq i32 %491, 0
  br i1 %492, label %493, label %499

; <label>:493:                                    ; preds = %489
  %pgocount46 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 59)
  %494 = add i64 %pgocount46, 1
  store i64 %494, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 59)
  %495 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %496 = call i8* @LANG(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.11, i32 0, i32 0))
  %497 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %495, i8* %496)
  %498 = load i8*, i8** %27, align 8
  call void @rmtemp(i8* %498)
  call void @endkrent()
  store i32 0, i32* %3, align 4
  br label %609

; <label>:499:                                    ; preds = %489, %485, %481, %476
  %500 = load i8*, i8** %27, align 8
  %501 = call i32 @dokeycheck(i8* null, i8* %500, i32 1)
  store i32 %501, i32* %13, align 4
  %502 = icmp ne i32 %501, 0
  br i1 %502, label %503, label %513

; <label>:503:                                    ; preds = %499
  %504 = load i8, i8* @verbose, align 1
  %505 = icmp ne i8 %504, 0
  br i1 %505, label %506, label %511

; <label>:506:                                    ; preds = %503
  %pgocount47 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 44)
  %507 = add i64 %pgocount47, 1
  store i64 %507, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 44)
  %508 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %509 = load i32, i32* %13, align 4
  %510 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %508, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.12, i32 0, i32 0), i32 %509)
  br label %511

; <label>:511:                                    ; preds = %506, %503
  %pgocount48 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 41)
  %512 = add i64 %pgocount48, 1
  store i64 %512, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 41)
  br label %607

; <label>:513:                                    ; preds = %499
  call void @endkrent()
  %514 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %515 = call i8* @LANG(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.13, i32 0, i32 0))
  %516 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %514, i8* %515)
  %517 = load i32, i32* @newkeys, align 4
  %518 = icmp ne i32 %517, 0
  br i1 %518, label %519, label %525

; <label>:519:                                    ; preds = %513
  %pgocount49 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 47)
  %520 = add i64 %pgocount49, 1
  store i64 %520, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 47)
  %521 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %522 = call i8* @LANG(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i32 0, i32 0))
  %523 = load i32, i32* @newkeys, align 4
  %524 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %521, i8* %522, i32 %523)
  br label %525

; <label>:525:                                    ; preds = %519, %513
  %526 = load i32, i32* @newsigs, align 4
  %527 = icmp ne i32 %526, 0
  br i1 %527, label %528, label %534

; <label>:528:                                    ; preds = %525
  %pgocount50 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 48)
  %529 = add i64 %pgocount50, 1
  store i64 %529, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 48)
  %530 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %531 = call i8* @LANG(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.15, i32 0, i32 0))
  %532 = load i32, i32* @newsigs, align 4
  %533 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %530, i8* %531, i32 %532)
  br label %534

; <label>:534:                                    ; preds = %528, %525
  %535 = load i32, i32* @newids, align 4
  %536 = icmp ne i32 %535, 0
  br i1 %536, label %537, label %543

; <label>:537:                                    ; preds = %534
  %pgocount51 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 49)
  %538 = add i64 %pgocount51, 1
  store i64 %538, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 49)
  %539 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %540 = call i8* @LANG(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16, i32 0, i32 0))
  %541 = load i32, i32* @newids, align 4
  %542 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %539, i8* %540, i32 %541)
  br label %543

; <label>:543:                                    ; preds = %537, %534
  %544 = load i32, i32* @newrvks, align 4
  %545 = icmp ne i32 %544, 0
  br i1 %545, label %546, label %552

; <label>:546:                                    ; preds = %543
  %pgocount52 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 50)
  %547 = add i64 %pgocount52, 1
  store i64 %547, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 50)
  %548 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %549 = call i8* @LANG(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.17, i32 0, i32 0))
  %550 = load i32, i32* @newrvks, align 4
  %551 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %548, i8* %549, i32 %550)
  br label %552

; <label>:552:                                    ; preds = %546, %543
  store i8 1, i8* @ask_first, align 1
  %553 = load i8*, i8** %27, align 8
  %554 = load %struct.newkey*, %struct.newkey** %26, align 8
  %555 = call i32 @maint_update(i8* %553, %struct.newkey* %554)
  store i32 %555, i32* %13, align 4
  %556 = load i32, i32* %13, align 4
  %557 = icmp sge i32 %556, 0
  br i1 %557, label %558, label %588

; <label>:558:                                    ; preds = %552
  %pgocount53 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 52)
  %559 = add i64 %pgocount53, 1
  store i64 %559, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 52)
  %560 = load i8, i8* @filter_mode, align 1
  %561 = icmp ne i8 %560, 0
  br i1 %561, label %588, label %562

; <label>:562:                                    ; preds = %558
  %pgocount54 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 56)
  %563 = add i64 %pgocount54, 1
  store i64 %563, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 56)
  %564 = load i8, i8* @batchmode, align 1
  %565 = icmp ne i8 %564, 0
  br i1 %565, label %588, label %566

; <label>:566:                                    ; preds = %562
  %567 = load %struct.newkey*, %struct.newkey** %26, align 8
  store %struct.newkey* %567, %struct.newkey** %25, align 8
  br label %568

; <label>:568:                                    ; preds = %581, %566
  %569 = load %struct.newkey*, %struct.newkey** %25, align 8
  %570 = icmp ne %struct.newkey* %569, null
  br i1 %570, label %571, label %586

; <label>:571:                                    ; preds = %568
  %572 = load %struct.newkey*, %struct.newkey** %25, align 8
  %573 = getelementptr inbounds %struct.newkey, %struct.newkey* %572, i32 0, i32 0
  %574 = getelementptr inbounds [8 x i8], [8 x i8]* %573, i32 0, i32 0
  %575 = load i8*, i8** %27, align 8
  %576 = call i32 @ask_to_sign(i8* %574, i8* %575)
  %577 = icmp ne i32 %576, 0
  br i1 %577, label %578, label %580

; <label>:578:                                    ; preds = %571
  %pgocount55 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 60)
  %579 = add i64 %pgocount55, 1
  store i64 %579, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 60)
  br label %586

; <label>:580:                                    ; preds = %571
  br label %581

; <label>:581:                                    ; preds = %580
  %pgocount56 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 43)
  %582 = add i64 %pgocount56, 1
  store i64 %582, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 43)
  %583 = load %struct.newkey*, %struct.newkey** %25, align 8
  %584 = getelementptr inbounds %struct.newkey, %struct.newkey* %583, i32 0, i32 1
  %585 = load %struct.newkey*, %struct.newkey** %584, align 8
  store %struct.newkey* %585, %struct.newkey** %25, align 8
  br label %568

; <label>:586:                                    ; preds = %578, %568
  %pgocount57 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 58)
  %587 = add i64 %pgocount57, 1
  store i64 %587, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 58)
  br label %588

; <label>:588:                                    ; preds = %586, %562, %558, %552
  %589 = load i32, i32* %13, align 4
  %590 = icmp ne i32 %589, 0
  br i1 %590, label %591, label %601

; <label>:591:                                    ; preds = %588
  %pgocount58 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 51)
  %592 = add i64 %pgocount58, 1
  store i64 %592, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 51)
  %593 = load i8, i8* @verbose, align 1
  %594 = zext i8 %593 to i32
  %595 = icmp ne i32 %594, 0
  br i1 %595, label %596, label %601

; <label>:596:                                    ; preds = %591
  %pgocount59 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 53)
  %597 = add i64 %pgocount59, 1
  store i64 %597, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 53)
  %598 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %599 = load i32, i32* %13, align 4
  %600 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %598, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.18, i32 0, i32 0), i32 %599)
  br label %601

; <label>:601:                                    ; preds = %596, %591, %588
  %pgocount60 = load i64, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 46)
  %602 = add i64 %pgocount60, 1
  store i64 %602, i64* getelementptr inbounds ([61 x i64], [61 x i64]* @__profc__addto_keyring, i64 0, i64 46)
  %603 = load %struct.newkey*, %struct.newkey** %26, align 8
  call void @free_newkeys(%struct.newkey* %603)
  %604 = load i8*, i8** %27, align 8
  %605 = load i8*, i8** %5, align 8
  %606 = call i32 @savetempbak(i8* %604, i8* %605)
  store i32 0, i32* %3, align 4
  br label %609

; <label>:607:                                    ; preds = %511, %472, %418, %363, %322, %123, %96, %85, %69
  call void @gpk_close()
  call void @endkrent()
  %608 = load i8*, i8** %27, align 8
  call void @rmtemp(i8* %608)
  store i32 -1, i32* %3, align 4
  br label %609

; <label>:609:                                    ; preds = %607, %601, %493, %48, %33
  %610 = load i32, i32* %3, align 4
  ret i32 %610
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @LANG(i8*) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @is_key_ctb(i8 zeroext) #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare void @rewind(%struct._IO_FILE*) #1

declare void @setoutdir(i8*) #1

declare i8* @tempfile(i32) #1

declare i32 @setkrent(i8*) #1

declare i32 @init_userhash() #1

declare zeroext i8 @file_exists(i8*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @gpk_open(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca [8 x i8], align 1
  %7 = alloca i8, align 1
  store i8* %0, i8** %3, align 8
  store i64 0, i64* %5, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @gpkf, align 8
  %9 = icmp ne %struct._IO_FILE* %8, null
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 4)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 4)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.20, i32 0, i32 0))
  store i32 -1, i32* %2, align 4
  br label %108

; <label>:14:                                     ; preds = %1
  %15 = load i8*, i8** %3, align 8
  call void @default_extension(i8* %15, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @PGP_EXTENSION, i32 0, i32 0))
  %16 = load i8*, i8** %3, align 8
  %17 = call %struct._IO_FILE* @fopen(i8* %16, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %17, %struct._IO_FILE** @gpkf, align 8
  %18 = icmp eq %struct._IO_FILE* %17, null
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 8)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 8)
  store i32 -1, i32* %2, align 4
  br label %108

; <label>:21:                                     ; preds = %14
  %22 = call i8* @allocbuf(i32 2048)
  %23 = bitcast i8* %22 to %struct.hashent**
  store %struct.hashent** %23, %struct.hashent*** @hashtbl, align 8
  %24 = load %struct.hashent**, %struct.hashent*** @hashtbl, align 8
  %25 = bitcast %struct.hashent** %24 to i8*
  call void @llvm.memset.p0i8.i64(i8* %25, i8 0, i64 2048, i32 8, i1 false)
  br label %26

; <label>:26:                                     ; preds = %102, %21
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @gpkf, align 8
  %28 = getelementptr inbounds [8 x i8], [8 x i8]* %6, i32 0, i32 0
  %29 = call i32 @readkpacket(%struct._IO_FILE* %27, i8* %7, i8* null, i8* %28, i8* null)
  store i32 %29, i32* %4, align 4
  %30 = icmp ne i32 %29, -1
  br i1 %30, label %31, label %106

; <label>:31:                                     ; preds = %26
  %32 = load i32, i32* %4, align 4
  %33 = icmp eq i32 %32, -2
  br i1 %33, label %38, label %34

; <label>:34:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 0)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 0)
  %36 = load i32, i32* %4, align 4
  %37 = icmp eq i32 %36, -3
  br i1 %37, label %38, label %46

; <label>:38:                                     ; preds = %34, %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 7)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 7)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %41 = call i8* @LANG(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i32 0, i32 0))
  %42 = load i8*, i8** %3, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* %41, i8* %42)
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @gpkf, align 8
  %45 = call i32 @fclose(%struct._IO_FILE* %44)
  store i32 -1, i32* %2, align 4
  br label %108

; <label>:46:                                     ; preds = %34
  %47 = load i8, i8* %7, align 1
  %48 = call i32 @is_key_ctb(i8 zeroext %47)
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %102

; <label>:50:                                     ; preds = %46
  %51 = load i32, i32* %4, align 4
  %52 = icmp ne i32 %51, -4
  br i1 %52, label %53, label %100

; <label>:53:                                     ; preds = %50
  %54 = getelementptr inbounds [8 x i8], [8 x i8]* %6, i32 0, i32 0
  %55 = call i64 @find_keyID(i8* %54)
  %56 = icmp ne i64 %55, -1
  br i1 %56, label %57, label %62

; <label>:57:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 5)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 5)
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %60 = load i8*, i8** %3, align 8
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.21, i32 0, i32 0), i8* %60)
  br label %62

; <label>:62:                                     ; preds = %57, %53
  %63 = load i32, i32* @hashleft, align 4
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %69, label %65

; <label>:65:                                     ; preds = %62
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 6)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 6)
  %67 = call i8* @allocbuf(i32 9600)
  %68 = bitcast i8* %67 to %struct.hashent*
  store %struct.hashent* %68, %struct.hashent** @hashptr, align 8
  store i32 400, i32* @hashleft, align 4
  br label %69

; <label>:69:                                     ; preds = %65, %62
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 3)
  %70 = add i64 %pgocount6, 1
  store i64 %70, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 3)
  %71 = load %struct.hashent*, %struct.hashent** @hashptr, align 8
  %72 = getelementptr inbounds %struct.hashent, %struct.hashent* %71, i32 0, i32 1
  %73 = getelementptr inbounds [8 x i8], [8 x i8]* %72, i32 0, i32 0
  %74 = getelementptr inbounds [8 x i8], [8 x i8]* %6, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %73, i8* %74, i64 8, i32 1, i1 false)
  %75 = load i64, i64* %5, align 8
  %76 = load %struct.hashent*, %struct.hashent** @hashptr, align 8
  %77 = getelementptr inbounds %struct.hashent, %struct.hashent* %76, i32 0, i32 2
  store i64 %75, i64* %77, align 8
  %78 = load %struct.hashent**, %struct.hashent*** @hashtbl, align 8
  %79 = getelementptr inbounds [8 x i8], [8 x i8]* %6, i32 0, i32 0
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = and i32 %81, 255
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds %struct.hashent*, %struct.hashent** %78, i64 %83
  %85 = load %struct.hashent*, %struct.hashent** %84, align 8
  %86 = load %struct.hashent*, %struct.hashent** @hashptr, align 8
  %87 = getelementptr inbounds %struct.hashent, %struct.hashent* %86, i32 0, i32 0
  store %struct.hashent* %85, %struct.hashent** %87, align 8
  %88 = load %struct.hashent*, %struct.hashent** @hashptr, align 8
  %89 = load %struct.hashent**, %struct.hashent*** @hashtbl, align 8
  %90 = getelementptr inbounds [8 x i8], [8 x i8]* %6, i32 0, i32 0
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i32
  %93 = and i32 %92, 255
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds %struct.hashent*, %struct.hashent** %89, i64 %94
  store %struct.hashent* %88, %struct.hashent** %95, align 8
  %96 = load %struct.hashent*, %struct.hashent** @hashptr, align 8
  %97 = getelementptr inbounds %struct.hashent, %struct.hashent* %96, i32 1
  store %struct.hashent* %97, %struct.hashent** @hashptr, align 8
  %98 = load i32, i32* @hashleft, align 4
  %99 = add nsw i32 %98, -1
  store i32 %99, i32* @hashleft, align 4
  br label %100

; <label>:100:                                    ; preds = %69, %50
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 2)
  %101 = add i64 %pgocount7, 1
  store i64 %101, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 2)
  br label %102

; <label>:102:                                    ; preds = %100, %46
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 1)
  %103 = add i64 %pgocount8, 1
  store i64 %103, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 1)
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** @gpkf, align 8
  %105 = call i64 @ftell(%struct._IO_FILE* %104)
  store i64 %105, i64* %5, align 8
  br label %26

; <label>:106:                                    ; preds = %26
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 9)
  %107 = add i64 %pgocount9, 1
  store i64 %107, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_gpk_open, i64 0, i64 9)
  store i32 0, i32* %2, align 4
  br label %108

; <label>:108:                                    ; preds = %106, %38, %19, %10
  %109 = load i32, i32* %2, align 4
  ret i32 %109
}

declare i64 @ftell(%struct._IO_FILE*) #1

declare signext i16 @readkeypacket(%struct._IO_FILE*, %struct.IdeaCfbContext*, i8*, i8*, i8*, i16*, i16*, i16*, i16*, i16*, i16*, i8*, i8*) #1

declare void @extract_keyID(i8*, i16*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @get_publickey(i64*, i32*, i8*, i8*, i8*, i16*, i16*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i64*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i16*, align 8
  %15 = alloca i16*, align 8
  %16 = alloca i8, align 1
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i64, align 8
  store i64* %0, i64** %9, align 8
  store i32* %1, i32** %10, align 8
  store i8* %2, i8** %11, align 8
  store i8* %3, i8** %12, align 8
  store i8* %4, i8** %13, align 8
  store i16* %5, i16** %14, align 8
  store i16* %6, i16** %15, align 8
  store i32 -1, i32* %18, align 4
  %20 = load i8*, i8** %11, align 8
  %21 = call i64 @find_keyID(i8* %20)
  store i64 %21, i64* %19, align 8
  %22 = icmp eq i64 %21, -1
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 6)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 6)
  store i32 -1, i32* %8, align 4
  br label %91

; <label>:25:                                     ; preds = %7
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @gpkf, align 8
  %27 = load i64, i64* %19, align 8
  %28 = call i32 @fseek(%struct._IO_FILE* %26, i64 %27, i32 0)
  br label %29

; <label>:29:                                     ; preds = %89, %25
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @gpkf, align 8
  %31 = call i64 @ftell(%struct._IO_FILE* %30)
  store i64 %31, i64* %19, align 8
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @gpkf, align 8
  %33 = load i8*, i8** %12, align 8
  %34 = load i8*, i8** %13, align 8
  %35 = load i16*, i16** %14, align 8
  %36 = load i16*, i16** %15, align 8
  %37 = call signext i16 @readkeypacket(%struct._IO_FILE* %32, %struct.IdeaCfbContext* null, i8* %16, i8* %33, i8* %34, i16* %35, i16* %36, i16* null, i16* null, i16* null, i16* null, i8* null, i8* null)
  %38 = sext i16 %37 to i32
  store i32 %38, i32* %17, align 4
  %39 = load i32, i32* %17, align 4
  %40 = icmp slt i32 %39, 0
  br i1 %40, label %41, label %52

; <label>:41:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 4)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 4)
  %43 = load i32, i32* %17, align 4
  %44 = icmp ne i32 %43, -4
  br i1 %44, label %45, label %52

; <label>:45:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 5)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 5)
  %47 = load i32, i32* %17, align 4
  %48 = icmp ne i32 %47, -6
  br i1 %48, label %49, label %52

; <label>:49:                                     ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 9)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 9)
  %51 = load i32, i32* %17, align 4
  store i32 %51, i32* %8, align 4
  br label %91

; <label>:52:                                     ; preds = %45, %41, %29
  %53 = load i8, i8* %16, align 1
  %54 = call i32 @is_key_ctb(i8 zeroext %53)
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %82

; <label>:56:                                     ; preds = %52
  %57 = load i64*, i64** %9, align 8
  %58 = icmp ne i64* %57, null
  br i1 %58, label %59, label %63

; <label>:59:                                     ; preds = %56
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 2)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 2)
  %61 = load i64, i64* %19, align 8
  %62 = load i64*, i64** %9, align 8
  store i64 %61, i64* %62, align 8
  br label %63

; <label>:63:                                     ; preds = %59, %56
  %64 = load i32*, i32** %10, align 8
  %65 = icmp ne i32* %64, null
  br i1 %65, label %66, label %74

; <label>:66:                                     ; preds = %63
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 3)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 3)
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @gpkf, align 8
  %69 = call i64 @ftell(%struct._IO_FILE* %68)
  %70 = load i64, i64* %19, align 8
  %71 = sub nsw i64 %69, %70
  %72 = trunc i64 %71 to i32
  %73 = load i32*, i32** %10, align 8
  store i32 %72, i32* %73, align 4
  br label %74

; <label>:74:                                     ; preds = %66, %63
  %75 = load i32, i32* %18, align 4
  %76 = icmp ne i32 %75, -1
  br i1 %76, label %77, label %79

; <label>:77:                                     ; preds = %74
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 8)
  %78 = add i64 %pgocount6, 1
  store i64 %78, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 8)
  store i32 -3, i32* %8, align 4
  br label %91

; <label>:79:                                     ; preds = %74
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 1)
  %80 = add i64 %pgocount7, 1
  store i64 %80, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 1)
  %81 = load i32, i32* %17, align 4
  store i32 %81, i32* %18, align 4
  br label %82

; <label>:82:                                     ; preds = %79, %52
  %83 = load i8, i8* %16, align 1
  %84 = zext i8 %83 to i32
  %85 = icmp eq i32 %84, 180
  br i1 %85, label %86, label %89

; <label>:86:                                     ; preds = %82
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 7)
  %87 = add i64 %pgocount8, 1
  store i64 %87, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 7)
  %88 = load i32, i32* %18, align 4
  store i32 %88, i32* %8, align 4
  br label %91

; <label>:89:                                     ; preds = %82
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 0)
  %90 = add i64 %pgocount9, 1
  store i64 %90, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_get_publickey, i64 0, i64 0)
  br label %29

; <label>:91:                                     ; preds = %86, %77, %49, %23
  %92 = load i32, i32* %8, align 4
  ret i32 %92
}

declare signext i16 @mp_compare(i16*, i16*) #1

declare i8* @keyIDstring(i8*) #1

declare zeroext i8 @getyesno(i8 signext) #1

declare i32 @show_key(%struct._IO_FILE*, i64, i32) #1

declare i8* @xmalloc(i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare i32 @copyfilepos(%struct._IO_FILE*, %struct._IO_FILE*, i64, i64) #1

declare void @write_trust(%struct._IO_FILE*, i8 zeroext) #1

; Function Attrs: noinline nounwind uwtable
define void @gpk_close() #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @gpkf, align 8
  %2 = icmp ne %struct._IO_FILE* %1, null
  br i1 %2, label %5, label %3

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gpk_close, i64 0, i64 1)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gpk_close, i64 0, i64 1)
  br label %9

; <label>:5:                                      ; preds = %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gpk_close, i64 0, i64 0)
  %6 = add i64 %pgocount1, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gpk_close, i64 0, i64 0)
  store i32 0, i32* @hashleft, align 4
  store %struct.hashent** null, %struct.hashent*** @hashtbl, align 8
  call void @freebufpool()
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @gpkf, align 8
  %8 = call i32 @fclose(%struct._IO_FILE* %7)
  store %struct._IO_FILE* null, %struct._IO_FILE** @gpkf, align 8
  br label %9

; <label>:9:                                      ; preds = %5, %3
  ret void
}

declare void @PascalToC(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @mergekeys(%struct._IO_FILE*, i8*, i64, %struct._IO_FILE*, i8*, i64*, %struct._IO_FILE*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i64, align 8
  %12 = alloca %struct._IO_FILE*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i64*, align 8
  %15 = alloca %struct._IO_FILE*, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i8, align 1
  %23 = alloca i32, align 4
  %24 = alloca i8, align 1
  %25 = alloca [256 x i8], align 16
  %26 = alloca i64, align 8
  %27 = alloca i8, align 1
  %28 = alloca i32, align 4
  %29 = alloca i64, align 8
  %30 = alloca i32, align 4
  %31 = alloca i64, align 8
  %32 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %9, align 8
  store i8* %1, i8** %10, align 8
  store i64 %2, i64* %11, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** %12, align 8
  store i8* %4, i8** %13, align 8
  store i64* %5, i64** %14, align 8
  store %struct._IO_FILE* %6, %struct._IO_FILE** %15, align 8
  store i8 0, i8* %24, align 1
  %33 = load i64*, i64** %14, align 8
  %34 = load i64, i64* %33, align 8
  store i64 %34, i64* %18, align 8
  store i64 %34, i64* %16, align 8
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %36 = load i64, i64* %18, align 8
  %37 = call i32 @fseek(%struct._IO_FILE* %35, i64 %36, i32 0)
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %39 = call signext i16 @nextkeypacket(%struct._IO_FILE* %38, i8* %22)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %41 = call i64 @ftell(%struct._IO_FILE* %40)
  %42 = load i64, i64* %18, align 8
  %43 = sub nsw i64 %41, %42
  %44 = trunc i64 %43 to i32
  store i32 %44, i32* %19, align 4
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %47 = load i32, i32* %19, align 4
  %48 = sext i32 %47 to i64
  %49 = load i64, i64* %18, align 8
  %50 = call i32 @copyfilepos(%struct._IO_FILE* %45, %struct._IO_FILE* %46, i64 %48, i64 %49)
  br label %51

; <label>:51:                                     ; preds = %78, %7
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %53 = call i64 @ftell(%struct._IO_FILE* %52)
  store i64 %53, i64* %18, align 8
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %55 = call signext i16 @nextkeypacket(%struct._IO_FILE* %54, i8* %22)
  %56 = sext i16 %55 to i32
  store i32 %56, i32* %21, align 4
  %57 = load i32, i32* %21, align 4
  %58 = icmp slt i32 %57, 0
  br i1 %58, label %69, label %59

; <label>:59:                                     ; preds = %51
  %pgocount = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 0)
  %60 = add i64 %pgocount, 1
  store i64 %60, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 0)
  %61 = load i8, i8* %22, align 1
  %62 = call i32 @is_key_ctb(i8 zeroext %61)
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %69, label %64

; <label>:64:                                     ; preds = %59
  %pgocount1 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 2)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 2)
  %66 = load i8, i8* %22, align 1
  %67 = zext i8 %66 to i32
  %68 = icmp eq i32 %67, 180
  br i1 %68, label %69, label %70

; <label>:69:                                     ; preds = %64, %59, %51
  br label %90

; <label>:70:                                     ; preds = %64
  %pgocount2 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 5)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 5)
  %72 = load i8, i8* %22, align 1
  %73 = zext i8 %72 to i32
  %74 = and i32 %73, 124
  %75 = icmp eq i32 %74, 8
  br i1 %75, label %76, label %78

; <label>:76:                                     ; preds = %70
  %pgocount3 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 10)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 10)
  store i8 1, i8* %24, align 1
  br label %78

; <label>:78:                                     ; preds = %76, %70
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %80 = call i64 @ftell(%struct._IO_FILE* %79)
  %81 = load i64, i64* %18, align 8
  %82 = sub nsw i64 %80, %81
  %83 = trunc i64 %82 to i32
  store i32 %83, i32* %19, align 4
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %85 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %86 = load i32, i32* %19, align 4
  %87 = sext i32 %86 to i64
  %88 = load i64, i64* %18, align 8
  %89 = call i32 @copyfilepos(%struct._IO_FILE* %84, %struct._IO_FILE* %85, i64 %87, i64 %88)
  br label %51

; <label>:90:                                     ; preds = %69
  %91 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %92 = load i64, i64* %18, align 8
  %93 = call i32 @fseek(%struct._IO_FILE* %91, i64 %92, i32 0)
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %95 = load i64, i64* %11, align 8
  %96 = call i32 @fseek(%struct._IO_FILE* %94, i64 %95, i32 0)
  %97 = load i64, i64* %11, align 8
  store i64 %97, i64* %17, align 8
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %99 = call signext i16 @nextkeypacket(%struct._IO_FILE* %98, i8* %22)
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %101 = call i64 @ftell(%struct._IO_FILE* %100)
  %102 = load i64, i64* %11, align 8
  %103 = sub nsw i64 %101, %102
  %104 = trunc i64 %103 to i32
  store i32 %104, i32* %20, align 4
  br label %105

; <label>:105:                                    ; preds = %125, %90
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %107 = call i64 @ftell(%struct._IO_FILE* %106)
  store i64 %107, i64* %11, align 8
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %109 = call signext i16 @nextkeypacket(%struct._IO_FILE* %108, i8* %22)
  %110 = sext i16 %109 to i32
  store i32 %110, i32* %21, align 4
  %111 = load i32, i32* %21, align 4
  %112 = icmp slt i32 %111, 0
  br i1 %112, label %124, label %113

; <label>:113:                                    ; preds = %105
  %pgocount4 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 1)
  %114 = add i64 %pgocount4, 1
  store i64 %114, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 1)
  %115 = load i8, i8* %22, align 1
  %116 = zext i8 %115 to i32
  %117 = icmp eq i32 %116, 180
  br i1 %117, label %124, label %118

; <label>:118:                                    ; preds = %113
  %pgocount5 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 3)
  %119 = add i64 %pgocount5, 1
  store i64 %119, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 3)
  %120 = load i8, i8* %22, align 1
  %121 = zext i8 %120 to i32
  %122 = and i32 %121, 124
  %123 = icmp eq i32 %122, 8
  br i1 %123, label %124, label %125

; <label>:124:                                    ; preds = %118, %113, %105
  br label %127

; <label>:125:                                    ; preds = %118
  %pgocount6 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 6)
  %126 = add i64 %pgocount6, 1
  store i64 %126, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 6)
  br label %105

; <label>:127:                                    ; preds = %124
  %128 = load i8, i8* %24, align 1
  %129 = icmp ne i8 %128, 0
  br i1 %129, label %189, label %130

; <label>:130:                                    ; preds = %127
  %pgocount7 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 25)
  %131 = add i64 %pgocount7, 1
  store i64 %131, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 25)
  %132 = load i8, i8* %22, align 1
  %133 = zext i8 %132 to i32
  %134 = and i32 %133, 124
  %135 = icmp eq i32 %134, 8
  br i1 %135, label %136, label %189

; <label>:136:                                    ; preds = %130
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %138 = call i64 @ftell(%struct._IO_FILE* %137)
  %139 = load i64, i64* %11, align 8
  %140 = sub nsw i64 %138, %139
  %141 = trunc i64 %140 to i32
  store i32 %141, i32* %28, align 4
  %142 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %143 = load i64, i64* %17, align 8
  %144 = load i32, i32* %20, align 4
  %145 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  %146 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %147 = load i64, i64* %11, align 8
  %148 = load i8*, i8** %13, align 8
  %149 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  %150 = bitcast i64* %26 to i8*
  %151 = call i32 @check_key_sig(%struct._IO_FILE* %142, i64 %143, i32 %144, i8* %145, %struct._IO_FILE* %146, i64 %147, i8* %148, i8* %149, i8* %150, i8* %27)
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %153, label %182

; <label>:153:                                    ; preds = %136
  %pgocount8 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 30)
  %154 = add i64 %pgocount8, 1
  store i64 %154, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 30)
  %155 = load i8, i8* %27, align 1
  %156 = zext i8 %155 to i32
  %157 = icmp eq i32 %156, 32
  br i1 %157, label %158, label %182

; <label>:158:                                    ; preds = %153
  %159 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  call void @PascalToC(i8* %159)
  %160 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %161 = call i8* @LANG(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.22, i32 0, i32 0))
  %162 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  %163 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %160, i8* %161, i8* %162)
  %164 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %165 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %166 = load i32, i32* %28, align 4
  %167 = sext i32 %166 to i64
  %168 = load i64, i64* %11, align 8
  %169 = call i32 @copyfilepos(%struct._IO_FILE* %164, %struct._IO_FILE* %165, i64 %167, i64 %168)
  %170 = load i8, i8* @batchmode, align 1
  %171 = icmp ne i8 %170, 0
  br i1 %171, label %172, label %178

; <label>:172:                                    ; preds = %158
  %pgocount9 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 33)
  %173 = add i64 %pgocount9, 1
  store i64 %173, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 33)
  %174 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %175 = load i64*, i64** %14, align 8
  %176 = load i64, i64* %175, align 8
  %177 = call i32 @show_key(%struct._IO_FILE* %174, i64 %176, i32 16)
  br label %178

; <label>:178:                                    ; preds = %172, %158
  %pgocount10 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 32)
  %179 = add i64 %pgocount10, 1
  store i64 %179, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 32)
  %180 = load i32, i32* @newrvks, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, i32* @newrvks, align 4
  br label %188

; <label>:182:                                    ; preds = %153, %136
  %pgocount11 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 29)
  %183 = add i64 %pgocount11, 1
  store i64 %183, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 29)
  %184 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %185 = call i8* @LANG(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.23, i32 0, i32 0))
  %186 = load i8*, i8** %10, align 8
  %187 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %184, i8* %185, i8* %186)
  br label %188

; <label>:188:                                    ; preds = %182, %178
  br label %189

; <label>:189:                                    ; preds = %188, %130, %127
  %190 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %191 = load i64, i64* %11, align 8
  %192 = call i32 @fseek(%struct._IO_FILE* %190, i64 %191, i32 0)
  store i32 0, i32* %23, align 4
  br label %193

; <label>:193:                                    ; preds = %322, %222, %189
  %194 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %195 = call i64 @ftell(%struct._IO_FILE* %194)
  store i64 %195, i64* %11, align 8
  %196 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %197 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  %198 = call signext i16 @readkeypacket(%struct._IO_FILE* %196, %struct.IdeaCfbContext* null, i8* %22, i8* null, i8* %197, i16* null, i16* null, i16* null, i16* null, i16* null, i16* null, i8* null, i8* null)
  %199 = sext i16 %198 to i32
  store i32 %199, i32* %21, align 4
  %200 = load i32, i32* %21, align 4
  %201 = icmp eq i32 %200, -3
  br i1 %201, label %202, label %205

; <label>:202:                                    ; preds = %193
  %pgocount12 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 26)
  %203 = add i64 %pgocount12, 1
  store i64 %203, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 26)
  %204 = load i32, i32* %21, align 4
  store i32 %204, i32* %8, align 4
  br label %407

; <label>:205:                                    ; preds = %193
  %206 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %207 = call i64 @ftell(%struct._IO_FILE* %206)
  %208 = load i64, i64* %11, align 8
  %209 = sub nsw i64 %207, %208
  %210 = trunc i64 %209 to i32
  store i32 %210, i32* %20, align 4
  %211 = load i32, i32* %21, align 4
  %212 = icmp eq i32 %211, -1
  br i1 %212, label %218, label %213

; <label>:213:                                    ; preds = %205
  %pgocount13 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 4)
  %214 = add i64 %pgocount13, 1
  store i64 %214, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 4)
  %215 = load i8, i8* %22, align 1
  %216 = call i32 @is_key_ctb(i8 zeroext %215)
  %217 = icmp ne i32 %216, 0
  br i1 %217, label %218, label %219

; <label>:218:                                    ; preds = %213, %205
  br label %323

; <label>:219:                                    ; preds = %213
  %220 = load i32, i32* %21, align 4
  %221 = icmp slt i32 %220, 0
  br i1 %221, label %222, label %224

; <label>:222:                                    ; preds = %219
  %pgocount14 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 13)
  %223 = add i64 %pgocount14, 1
  store i64 %223, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 13)
  br label %193

; <label>:224:                                    ; preds = %219
  %pgocount15 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 8)
  %225 = add i64 %pgocount15, 1
  store i64 %225, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 8)
  %226 = load i8, i8* %22, align 1
  %227 = zext i8 %226 to i32
  %228 = icmp eq i32 %227, 180
  br i1 %228, label %229, label %284

; <label>:229:                                    ; preds = %224
  %230 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  call void @PascalToC(i8* %230)
  %231 = load i8*, i8** %13, align 8
  %232 = load i64, i64* %16, align 8
  %233 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  %234 = call i32 @getpubuserid(i8* %231, i64 %232, i8* %233, i64* %29, i32* %30, i8 zeroext 1)
  %235 = icmp slt i32 %234, 0
  %236 = zext i1 %235 to i32
  store i32 %236, i32* %23, align 4
  %237 = load i32, i32* %23, align 4
  %238 = icmp ne i32 %237, 0
  br i1 %238, label %239, label %282

; <label>:239:                                    ; preds = %229
  %240 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %241 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %240)
  %242 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %243 = call i8* @LANG(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.24, i32 0, i32 0))
  %244 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  %245 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %242, i8* %243, i8* %244)
  %246 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %247 = call i8* @LANG(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.25, i32 0, i32 0))
  %248 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %246, i8* %247)
  %249 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %250 = load i64*, i64** %14, align 8
  %251 = load i64, i64* %250, align 8
  %252 = call i32 @show_key(%struct._IO_FILE* %249, i64 %251, i32 0)
  %253 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %254 = call i8* @LANG(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.26, i32 0, i32 0))
  %255 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %253, i8* %254)
  %256 = load i8, i8* @batchmode, align 1
  %257 = zext i8 %256 to i32
  %258 = icmp ne i32 %257, 0
  br i1 %258, label %264, label %259

; <label>:259:                                    ; preds = %239
  %pgocount16 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 23)
  %260 = add i64 %pgocount16, 1
  store i64 %260, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 23)
  %261 = call zeroext i8 @getyesno(i8 signext 110)
  %262 = zext i8 %261 to i32
  %263 = icmp ne i32 %262, 0
  br i1 %263, label %264, label %279

; <label>:264:                                    ; preds = %259, %239
  %265 = load i32, i32* @newids, align 4
  %266 = add nsw i32 %265, 1
  store i32 %266, i32* @newids, align 4
  %267 = load i8, i8* @batchmode, align 1
  %268 = icmp ne i8 %267, 0
  br i1 %268, label %269, label %277

; <label>:269:                                    ; preds = %264
  %pgocount17 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 20)
  %270 = add i64 %pgocount17, 1
  store i64 %270, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 20)
  %271 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %272 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %271, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.27, i32 0, i32 0))
  %273 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %274 = load i64*, i64** %14, align 8
  %275 = load i64, i64* %274, align 8
  %276 = call i32 @show_key(%struct._IO_FILE* %273, i64 %275, i32 16)
  br label %277

; <label>:277:                                    ; preds = %269, %264
  %pgocount18 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 17)
  %278 = add i64 %pgocount18, 1
  store i64 %278, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 17)
  br label %281

; <label>:279:                                    ; preds = %259
  %pgocount19 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 27)
  %280 = add i64 %pgocount19, 1
  store i64 %280, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 27)
  store i32 0, i32* %23, align 4
  br label %281

; <label>:281:                                    ; preds = %279, %277
  br label %282

; <label>:282:                                    ; preds = %281, %229
  %pgocount20 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 14)
  %283 = add i64 %pgocount20, 1
  store i64 %283, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 14)
  br label %284

; <label>:284:                                    ; preds = %282, %224
  %285 = load i32, i32* %23, align 4
  %286 = icmp ne i32 %285, 0
  br i1 %286, label %287, label %322

; <label>:287:                                    ; preds = %284
  %288 = load i8, i8* %22, align 1
  %289 = zext i8 %288 to i32
  %290 = icmp eq i32 %289, 180
  br i1 %290, label %297, label %291

; <label>:291:                                    ; preds = %287
  %pgocount21 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 16)
  %292 = add i64 %pgocount21, 1
  store i64 %292, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 16)
  %293 = load i8, i8* %22, align 1
  %294 = zext i8 %293 to i32
  %295 = and i32 %294, 124
  %296 = icmp eq i32 %295, 8
  br i1 %296, label %297, label %320

; <label>:297:                                    ; preds = %291, %287
  %298 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %299 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %300 = load i32, i32* %20, align 4
  %301 = sext i32 %300 to i64
  %302 = load i64, i64* %11, align 8
  %303 = call i32 @copyfilepos(%struct._IO_FILE* %298, %struct._IO_FILE* %299, i64 %301, i64 %302)
  %304 = load i8, i8* @publickey, align 1
  %305 = icmp ne i8 %304, 0
  br i1 %305, label %306, label %318

; <label>:306:                                    ; preds = %297
  %307 = load i8, i8* %22, align 1
  %308 = zext i8 %307 to i32
  %309 = and i32 %308, 124
  %310 = icmp eq i32 %309, 8
  br i1 %310, label %311, label %314

; <label>:311:                                    ; preds = %306
  %pgocount22 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 21)
  %312 = add i64 %pgocount22, 1
  store i64 %312, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 21)
  %313 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  call void @write_trust(%struct._IO_FILE* %313, i8 zeroext 0)
  br label %317

; <label>:314:                                    ; preds = %306
  %pgocount23 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 22)
  %315 = add i64 %pgocount23, 1
  store i64 %315, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 22)
  %316 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  call void @write_trust(%struct._IO_FILE* %316, i8 zeroext 0)
  br label %317

; <label>:317:                                    ; preds = %314, %311
  br label %318

; <label>:318:                                    ; preds = %317, %297
  %pgocount24 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 15)
  %319 = add i64 %pgocount24, 1
  store i64 %319, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 15)
  br label %320

; <label>:320:                                    ; preds = %318, %291
  %pgocount25 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 11)
  %321 = add i64 %pgocount25, 1
  store i64 %321, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 11)
  br label %322

; <label>:322:                                    ; preds = %320, %284
  br label %193

; <label>:323:                                    ; preds = %218
  %324 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %325 = load i64, i64* %18, align 8
  %326 = call i32 @fseek(%struct._IO_FILE* %324, i64 %325, i32 0)
  %327 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %328 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  %329 = call signext i16 @readkeypacket(%struct._IO_FILE* %327, %struct.IdeaCfbContext* null, i8* %22, i8* null, i8* %328, i16* null, i16* null, i16* null, i16* null, i16* null, i16* null, i8* null, i8* null)
  %330 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %331 = load i64, i64* %18, align 8
  %332 = call i32 @fseek(%struct._IO_FILE* %330, i64 %331, i32 0)
  br label %333

; <label>:333:                                    ; preds = %398, %323
  %334 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %335 = call i64 @ftell(%struct._IO_FILE* %334)
  store i64 %335, i64* %18, align 8
  %336 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %337 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  %338 = call signext i16 @readkeypacket(%struct._IO_FILE* %336, %struct.IdeaCfbContext* null, i8* %22, i8* null, i8* %337, i16* null, i16* null, i16* null, i16* null, i16* null, i16* null, i8* null, i8* null)
  %339 = sext i16 %338 to i32
  store i32 %339, i32* %21, align 4
  %340 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %341 = call i64 @ftell(%struct._IO_FILE* %340)
  %342 = load i64, i64* %18, align 8
  %343 = sub nsw i64 %341, %342
  %344 = trunc i64 %343 to i32
  store i32 %344, i32* %19, align 4
  %345 = load i32, i32* %21, align 4
  %346 = icmp eq i32 %345, -3
  br i1 %346, label %347, label %350

; <label>:347:                                    ; preds = %333
  %pgocount26 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 28)
  %348 = add i64 %pgocount26, 1
  store i64 %348, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 28)
  %349 = load i32, i32* %21, align 4
  store i32 %349, i32* %8, align 4
  br label %407

; <label>:350:                                    ; preds = %333
  %351 = load i32, i32* %21, align 4
  %352 = icmp eq i32 %351, -1
  br i1 %352, label %358, label %353

; <label>:353:                                    ; preds = %350
  %pgocount27 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 7)
  %354 = add i64 %pgocount27, 1
  store i64 %354, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 7)
  %355 = load i8, i8* %22, align 1
  %356 = call i32 @is_key_ctb(i8 zeroext %355)
  %357 = icmp ne i32 %356, 0
  br i1 %357, label %358, label %359

; <label>:358:                                    ; preds = %353, %350
  br label %400

; <label>:359:                                    ; preds = %353
  %360 = load i8, i8* %22, align 1
  %361 = zext i8 %360 to i32
  %362 = icmp eq i32 %361, 180
  br i1 %362, label %363, label %387

; <label>:363:                                    ; preds = %359
  %364 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  call void @PascalToC(i8* %364)
  %365 = load i8*, i8** %10, align 8
  %366 = load i64, i64* %17, align 8
  %367 = getelementptr inbounds [256 x i8], [256 x i8]* %25, i32 0, i32 0
  %368 = call i32 @getpubuserid(i8* %365, i64 %366, i8* %367, i64* %31, i32* %32, i8 zeroext 1)
  %369 = icmp sge i32 %368, 0
  br i1 %369, label %370, label %384

; <label>:370:                                    ; preds = %363
  %371 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %372 = load i8*, i8** %10, align 8
  %373 = load i64, i64* %31, align 8
  %374 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %375 = load i8*, i8** %13, align 8
  %376 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %377 = call i32 @mergesigs(%struct._IO_FILE* %371, i8* %372, i64 %373, %struct._IO_FILE* %374, i8* %375, i64* %18, %struct._IO_FILE* %376)
  store i32 %377, i32* %21, align 4
  %378 = icmp slt i32 %377, 0
  br i1 %378, label %379, label %382

; <label>:379:                                    ; preds = %370
  %pgocount28 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 31)
  %380 = add i64 %pgocount28, 1
  store i64 %380, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 31)
  %381 = load i32, i32* %21, align 4
  store i32 %381, i32* %8, align 4
  br label %407

; <label>:382:                                    ; preds = %370
  %pgocount29 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 19)
  %383 = add i64 %pgocount29, 1
  store i64 %383, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 19)
  store i32 0, i32* %23, align 4
  br label %386

; <label>:384:                                    ; preds = %363
  %pgocount30 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 18)
  %385 = add i64 %pgocount30, 1
  store i64 %385, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 18)
  store i32 1, i32* %23, align 4
  br label %386

; <label>:386:                                    ; preds = %384, %382
  br label %387

; <label>:387:                                    ; preds = %386, %359
  %388 = load i32, i32* %23, align 4
  %389 = icmp ne i32 %388, 0
  br i1 %389, label %390, label %398

; <label>:390:                                    ; preds = %387
  %pgocount31 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 12)
  %391 = add i64 %pgocount31, 1
  store i64 %391, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 12)
  %392 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %393 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %394 = load i32, i32* %19, align 4
  %395 = sext i32 %394 to i64
  %396 = load i64, i64* %18, align 8
  %397 = call i32 @copyfilepos(%struct._IO_FILE* %392, %struct._IO_FILE* %393, i64 %395, i64 %396)
  br label %398

; <label>:398:                                    ; preds = %390, %387
  %pgocount32 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 9)
  %399 = add i64 %pgocount32, 1
  store i64 %399, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 9)
  br label %333

; <label>:400:                                    ; preds = %358
  %pgocount33 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 24)
  %401 = add i64 %pgocount33, 1
  store i64 %401, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_mergekeys, i64 0, i64 24)
  %402 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %403 = load i64, i64* %18, align 8
  %404 = call i32 @fseek(%struct._IO_FILE* %402, i64 %403, i32 0)
  %405 = load i64, i64* %18, align 8
  %406 = load i64*, i64** %14, align 8
  store i64 %405, i64* %406, align 8
  store i32 0, i32* %8, align 4
  br label %407

; <label>:407:                                    ; preds = %400, %379, %347, %202
  %408 = load i32, i32* %8, align 4
  ret i32 %408
}

declare i32 @copyfile(%struct._IO_FILE*, %struct._IO_FILE*, i64) #1

declare i32 @write_error(%struct._IO_FILE*) #1

declare void @rmtemp(i8*) #1

declare void @endkrent() #1

declare i32 @dokeycheck(i8*, i8*, i32) #1

declare i32 @maint_update(i8*, %struct.newkey*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @ask_to_sign(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  %10 = alloca [130 x i16], align 16
  %11 = alloca [130 x i16], align 16
  %12 = alloca [256 x i8], align 16
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %15 = load i8*, i8** %5, align 8
  %16 = load i8*, i8** %4, align 8
  %17 = bitcast i64* %7 to i8*
  %18 = getelementptr inbounds [256 x i8], [256 x i8]* %12, i32 0, i32 0
  %19 = getelementptr inbounds [130 x i16], [130 x i16]* %10, i32 0, i32 0
  %20 = getelementptr inbounds [130 x i16], [130 x i16]* %11, i32 0, i32 0
  %21 = call i32 @getpublickey(i32 1, i8* %15, i64* %13, i32* null, i8* %16, i8* %17, i8* %18, i16* %19, i16* %20)
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 1)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %147

; <label>:25:                                     ; preds = %2
  %26 = load i8*, i8** %5, align 8
  %27 = call %struct._IO_FILE* @fopen(i8* %26, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %27, %struct._IO_FILE** %6, align 8
  %28 = icmp eq %struct._IO_FILE* %27, null
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 4)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 4)
  store i32 -1, i32* %3, align 4
  br label %147

; <label>:31:                                     ; preds = %25
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %13, align 8
  %34 = call i32 @fseek(%struct._IO_FILE* %32, i64 %33, i32 0)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @is_compromised(%struct._IO_FILE* %35)
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %42

; <label>:38:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 3)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 3)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %41 = call i32 @fclose(%struct._IO_FILE* %40)
  store i32 0, i32* %3, align 4
  br label %147

; <label>:42:                                     ; preds = %31
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %44 = call signext i16 @nextkeypacket(%struct._IO_FILE* %43, i8* %8)
  %45 = sext i16 %44 to i32
  %46 = icmp slt i32 %45, 0
  br i1 %46, label %47, label %51

; <label>:47:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 5)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 5)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %50 = call i32 @fclose(%struct._IO_FILE* %49)
  store i32 -1, i32* %3, align 4
  br label %147

; <label>:51:                                     ; preds = %42
  %52 = load i8, i8* %8, align 1
  %53 = zext i8 %52 to i32
  %54 = icmp ne i32 %53, 153
  br i1 %54, label %55, label %59

; <label>:55:                                     ; preds = %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 6)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 6)
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %58 = call i32 @fclose(%struct._IO_FILE* %57)
  store i32 0, i32* %3, align 4
  br label %147

; <label>:59:                                     ; preds = %51
  br label %60

; <label>:60:                                     ; preds = %79, %59
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %62 = call signext i16 @nextkeypacket(%struct._IO_FILE* %61, i8* %8)
  %63 = sext i16 %62 to i32
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %71

; <label>:65:                                     ; preds = %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 2)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 2)
  %67 = load i8, i8* %8, align 1
  %68 = call i32 @is_key_ctb(i8 zeroext %67)
  %69 = icmp ne i32 %68, 0
  %70 = xor i1 %69, true
  br label %71

; <label>:71:                                     ; preds = %65, %60
  %72 = phi i1 [ false, %60 ], [ %70, %65 ]
  br i1 %72, label %73, label %81

; <label>:73:                                     ; preds = %71
  %74 = load i8, i8* %8, align 1
  %75 = zext i8 %74 to i32
  %76 = icmp eq i32 %75, 180
  br i1 %76, label %77, label %79

; <label>:77:                                     ; preds = %73
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 8)
  %78 = add i64 %pgocount6, 1
  store i64 %78, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 8)
  br label %81

; <label>:79:                                     ; preds = %73
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 0)
  %80 = add i64 %pgocount7, 1
  store i64 %80, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 0)
  br label %60

; <label>:81:                                     ; preds = %77, %71
  %82 = load i8, i8* %8, align 1
  %83 = zext i8 %82 to i32
  %84 = icmp ne i32 %83, 180
  br i1 %84, label %85, label %89

; <label>:85:                                     ; preds = %81
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 7)
  %86 = add i64 %pgocount8, 1
  store i64 %86, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 7)
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %88 = call i32 @fclose(%struct._IO_FILE* %87)
  store i32 -1, i32* %3, align 4
  br label %147

; <label>:89:                                     ; preds = %81
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %91 = call i32 @read_trust(%struct._IO_FILE* %90, i8* %9)
  store i32 %91, i32* %14, align 4
  %92 = icmp slt i32 %91, 0
  br i1 %92, label %93, label %98

; <label>:93:                                     ; preds = %89
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 9)
  %94 = add i64 %pgocount9, 1
  store i64 %94, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 9)
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %96 = call i32 @fclose(%struct._IO_FILE* %95)
  %97 = load i32, i32* %14, align 4
  store i32 %97, i32* %3, align 4
  br label %147

; <label>:98:                                     ; preds = %89
  %99 = load i8, i8* %9, align 1
  %100 = zext i8 %99 to i32
  %101 = and i32 %100, 3
  %102 = icmp eq i32 %101, 3
  br i1 %102, label %103, label %107

; <label>:103:                                    ; preds = %98
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 10)
  %104 = add i64 %pgocount10, 1
  store i64 %104, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 10)
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %106 = call i32 @fclose(%struct._IO_FILE* %105)
  store i32 0, i32* %3, align 4
  br label %147

; <label>:107:                                    ; preds = %98
  %108 = load i8, i8* @ask_first, align 1
  %109 = icmp ne i8 %108, 0
  br i1 %109, label %110, label %122

; <label>:110:                                    ; preds = %107
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %112 = call i8* @LANG(i8* getelementptr inbounds ([112 x i8], [112 x i8]* @.str.36, i32 0, i32 0))
  %113 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %111, i8* %112)
  %114 = call zeroext i8 @getyesno(i8 signext 110)
  %115 = icmp ne i8 %114, 0
  br i1 %115, label %120, label %116

; <label>:116:                                    ; preds = %110
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 14)
  %117 = add i64 %pgocount11, 1
  store i64 %117, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 14)
  %118 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %119 = call i32 @fclose(%struct._IO_FILE* %118)
  store i32 1, i32* %3, align 4
  br label %147

; <label>:120:                                    ; preds = %110
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 13)
  %121 = add i64 %pgocount12, 1
  store i64 %121, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 13)
  br label %122

; <label>:122:                                    ; preds = %120, %107
  store i8 0, i8* @ask_first, align 1
  %123 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %124 = load i64, i64* %13, align 8
  %125 = call i32 @show_key(%struct._IO_FILE* %123, i64 %124, i32 7)
  %126 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %127 = call i32 @fclose(%struct._IO_FILE* %126)
  %128 = getelementptr inbounds [256 x i8], [256 x i8]* %12, i32 0, i32 0
  call void @PascalToC(i8* %128)
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %130 = call i8* @LANG(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.37, i32 0, i32 0))
  %131 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %129, i8* %130)
  %132 = call zeroext i8 @getyesno(i8 signext 110)
  %133 = icmp ne i8 %132, 0
  br i1 %133, label %134, label %145

; <label>:134:                                    ; preds = %122
  %135 = getelementptr inbounds [256 x i8], [256 x i8]* %12, i32 0, i32 0
  %136 = load i8*, i8** %5, align 8
  %137 = call i32 @signkey(i8* %135, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @my_name, i32 0, i32 0), i8* %136)
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %139, label %143

; <label>:139:                                    ; preds = %134
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 15)
  %140 = add i64 %pgocount13, 1
  store i64 %140, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 15)
  %141 = load i8*, i8** %5, align 8
  %142 = call i32 @maint_update(i8* %141, %struct.newkey* null)
  br label %143

; <label>:143:                                    ; preds = %139, %134
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 12)
  %144 = add i64 %pgocount14, 1
  store i64 %144, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 12)
  br label %145

; <label>:145:                                    ; preds = %143, %122
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 11)
  %146 = add i64 %pgocount15, 1
  store i64 %146, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_ask_to_sign, i64 0, i64 11)
  store i32 0, i32* %3, align 4
  br label %147

; <label>:147:                                    ; preds = %145, %116, %103, %93, %85, %55, %47, %38, %29, %23
  %148 = load i32, i32* %3, align 4
  ret i32 %148
}

declare void @free_newkeys(%struct.newkey*) #1

declare i32 @savetempbak(i8*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @addto_keyring(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i64 0, i64* %6, align 8
  store i32 0, i32* %8, align 4
  %9 = load i8*, i8** %4, align 8
  %10 = load i8*, i8** %5, align 8
  %11 = call i32 @_addto_keyring(i8* %9, i8* %10)
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 2)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 2)
  store i32 0, i32* %3, align 4
  br label %51

; <label>:15:                                     ; preds = %2
  br label %16

; <label>:16:                                     ; preds = %37, %15
  %17 = load i8*, i8** %4, align 8
  %18 = load i64, i64* %6, align 8
  %19 = call zeroext i8 @is_armor_file(i8* %17, i64 %18)
  %20 = icmp ne i8 %19, 0
  br i1 %20, label %21, label %40

; <label>:21:                                     ; preds = %16
  %22 = call i8* @tempfile(i32 5)
  store i8* %22, i8** %7, align 8
  %23 = load i8*, i8** %4, align 8
  %24 = load i8*, i8** %7, align 8
  %25 = call i32 @de_armor_file(i8* %23, i8* %24, i64* %6)
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %30

; <label>:27:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 3)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 3)
  %29 = load i8*, i8** %7, align 8
  call void @rmtemp(i8* %29)
  store i32 -1, i32* %3, align 4
  br label %51

; <label>:30:                                     ; preds = %21
  %31 = load i8*, i8** %7, align 8
  %32 = load i8*, i8** %5, align 8
  %33 = call i32 @_addto_keyring(i8* %31, i8* %32)
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 1)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 1)
  store i32 1, i32* %8, align 4
  br label %37

; <label>:37:                                     ; preds = %35, %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 0)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 0)
  %39 = load i8*, i8** %7, align 8
  call void @rmtemp(i8* %39)
  br label %16

; <label>:40:                                     ; preds = %16
  %41 = load i32, i32* %8, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %49, label %43

; <label>:43:                                     ; preds = %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 5)
  %44 = add i64 %pgocount4, 1
  store i64 %44, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 5)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %46 = call i8* @LANG(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.19, i32 0, i32 0))
  %47 = load i8*, i8** %4, align 8
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* %46, i8* %47)
  store i32 -1, i32* %3, align 4
  br label %51

; <label>:49:                                     ; preds = %40
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 4)
  %50 = add i64 %pgocount5, 1
  store i64 %50, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addto_keyring, i64 0, i64 4)
  store i32 0, i32* %3, align 4
  br label %51

; <label>:51:                                     ; preds = %49, %43, %27, %13
  %52 = load i32, i32* %3, align 4
  ret i32 %52
}

declare zeroext i8 @is_armor_file(i8*, i64) #1

declare i32 @de_armor_file(i8*, i8*, i64*) #1

; Function Attrs: noinline nounwind uwtable
define internal i64 @find_keyID(i8*) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %struct.hashent*, align 8
  store i8* %0, i8** %3, align 8
  %5 = load %struct.hashent**, %struct.hashent*** @hashtbl, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = load i8, i8* %6, align 1
  %8 = zext i8 %7 to i32
  %9 = and i32 %8, 255
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %struct.hashent*, %struct.hashent** %5, i64 %10
  %12 = load %struct.hashent*, %struct.hashent** %11, align 8
  store %struct.hashent* %12, %struct.hashent** %4, align 8
  br label %13

; <label>:13:                                     ; preds = %29, %1
  %14 = load %struct.hashent*, %struct.hashent** %4, align 8
  %15 = icmp ne %struct.hashent* %14, null
  br i1 %15, label %16, label %34

; <label>:16:                                     ; preds = %13
  %17 = load i8*, i8** %3, align 8
  %18 = load %struct.hashent*, %struct.hashent** %4, align 8
  %19 = getelementptr inbounds %struct.hashent, %struct.hashent* %18, i32 0, i32 1
  %20 = getelementptr inbounds [8 x i8], [8 x i8]* %19, i32 0, i32 0
  %21 = call i32 @memcmp(i8* %17, i8* %20, i64 8) #5
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_keyID, i64 0, i64 2)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_keyID, i64 0, i64 2)
  %25 = load %struct.hashent*, %struct.hashent** %4, align 8
  %26 = getelementptr inbounds %struct.hashent, %struct.hashent* %25, i32 0, i32 2
  %27 = load i64, i64* %26, align 8
  store i64 %27, i64* %2, align 8
  br label %36

; <label>:28:                                     ; preds = %16
  br label %29

; <label>:29:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_keyID, i64 0, i64 0)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_keyID, i64 0, i64 0)
  %31 = load %struct.hashent*, %struct.hashent** %4, align 8
  %32 = getelementptr inbounds %struct.hashent, %struct.hashent* %31, i32 0, i32 0
  %33 = load %struct.hashent*, %struct.hashent** %32, align 8
  store %struct.hashent* %33, %struct.hashent** %4, align 8
  br label %13

; <label>:34:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_keyID, i64 0, i64 1)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_keyID, i64 0, i64 1)
  store i64 -1, i64* %2, align 8
  br label %36

; <label>:36:                                     ; preds = %34, %23
  %37 = load i64, i64* %2, align 8
  ret i64 %37
}

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #1

declare void @default_extension(i8*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @allocbuf(i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_allocbuf, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_allocbuf, i64 0, i64 0)
  %3 = alloca i32, align 4
  %4 = alloca %struct.bufpool*, align 8
  store i32 %0, i32* %3, align 4
  %5 = load i32, i32* %3, align 4
  %6 = sext i32 %5 to i64
  %7 = add i64 %6, 8
  %8 = trunc i64 %7 to i32
  %9 = call i8* @xmalloc(i32 %8)
  %10 = bitcast i8* %9 to %struct.bufpool*
  store %struct.bufpool* %10, %struct.bufpool** %4, align 8
  %11 = load %struct.bufpool*, %struct.bufpool** @bufpool, align 8
  %12 = load %struct.bufpool*, %struct.bufpool** %4, align 8
  %13 = getelementptr inbounds %struct.bufpool, %struct.bufpool* %12, i32 0, i32 0
  store %struct.bufpool* %11, %struct.bufpool** %13, align 8
  %14 = load %struct.bufpool*, %struct.bufpool** %4, align 8
  store %struct.bufpool* %14, %struct.bufpool** @bufpool, align 8
  %15 = load %struct.bufpool*, %struct.bufpool** %4, align 8
  %16 = getelementptr inbounds %struct.bufpool, %struct.bufpool* %15, i32 0, i32 1
  %17 = getelementptr inbounds [1 x i8], [1 x i8]* %16, i32 0, i32 0
  ret i8* %17
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

declare i32 @readkpacket(%struct._IO_FILE*, i8*, i8*, i8*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @freebufpool() #0 {
  %1 = alloca %struct.bufpool*, align 8
  br label %2

; <label>:2:                                      ; preds = %5, %0
  %3 = load %struct.bufpool*, %struct.bufpool** @bufpool, align 8
  %4 = icmp ne %struct.bufpool* %3, null
  br i1 %4, label %5, label %13

; <label>:5:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_freebufpool, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_freebufpool, i64 0, i64 0)
  %7 = load %struct.bufpool*, %struct.bufpool** @bufpool, align 8
  store %struct.bufpool* %7, %struct.bufpool** %1, align 8
  %8 = load %struct.bufpool*, %struct.bufpool** @bufpool, align 8
  %9 = getelementptr inbounds %struct.bufpool, %struct.bufpool* %8, i32 0, i32 0
  %10 = load %struct.bufpool*, %struct.bufpool** %9, align 8
  store %struct.bufpool* %10, %struct.bufpool** @bufpool, align 8
  %11 = load %struct.bufpool*, %struct.bufpool** %1, align 8
  %12 = call i32 (%struct.bufpool*, ...) bitcast (i32 (...)* @free to i32 (%struct.bufpool*, ...)*)(%struct.bufpool* %11)
  br label %2

; <label>:13:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_freebufpool, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_freebufpool, i64 0, i64 1)
  ret void
}

declare signext i16 @nextkeypacket(%struct._IO_FILE*, i8*) #1

declare i32 @check_key_sig(%struct._IO_FILE*, i64, i32, i8*, %struct._IO_FILE*, i64, i8*, i8*, i8*, i8*) #1

declare i32 @getpubuserid(i8*, i64, i8*, i64*, i32*, i8 zeroext) #1

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @mergesigs(%struct._IO_FILE*, i8*, i64, %struct._IO_FILE*, i8*, i64*, %struct._IO_FILE*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i64, align 8
  %12 = alloca %struct._IO_FILE*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i64*, align 8
  %15 = alloca %struct._IO_FILE*, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i8, align 1
  %22 = alloca i32, align 4
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  %25 = alloca i64, align 8
  %26 = alloca [8 x i8], align 1
  %27 = alloca [256 x i8], align 16
  %28 = alloca i64, align 8
  %29 = alloca i32, align 4
  %30 = alloca i64, align 8
  %31 = alloca i8*, align 8
  %32 = alloca i64, align 8
  %33 = alloca i64, align 8
  %34 = alloca i64, align 8
  %35 = alloca i32, align 4
  %36 = alloca i8, align 1
  %37 = alloca i8*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %9, align 8
  store i8* %1, i8** %10, align 8
  store i64 %2, i64* %11, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** %12, align 8
  store i8* %4, i8** %13, align 8
  store i64* %5, i64** %14, align 8
  store %struct._IO_FILE* %6, %struct._IO_FILE** %15, align 8
  %38 = load i64*, i64** %14, align 8
  %39 = load i64, i64* %38, align 8
  store i64 %39, i64* %17, align 8
  store i64 %39, i64* %16, align 8
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %41 = load i64, i64* %17, align 8
  %42 = call i32 @fseek(%struct._IO_FILE* %40, i64 %41, i32 0)
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %44 = getelementptr inbounds [256 x i8], [256 x i8]* %27, i32 0, i32 0
  %45 = call signext i16 @readkeypacket(%struct._IO_FILE* %43, %struct.IdeaCfbContext* null, i8* %21, i8* null, i8* %44, i16* null, i16* null, i16* null, i16* null, i16* null, i16* null, i8* null, i8* null)
  %46 = getelementptr inbounds [256 x i8], [256 x i8]* %27, i32 0, i32 0
  call void @PascalToC(i8* %46)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %48 = call i64 @ftell(%struct._IO_FILE* %47)
  %49 = load i64, i64* %17, align 8
  %50 = sub nsw i64 %48, %49
  %51 = trunc i64 %50 to i32
  store i32 %51, i32* %18, align 4
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %54 = load i32, i32* %18, align 4
  %55 = sext i32 %54 to i64
  %56 = load i64, i64* %17, align 8
  %57 = call i32 @copyfilepos(%struct._IO_FILE* %52, %struct._IO_FILE* %53, i64 %55, i64 %56)
  br label %58

; <label>:58:                                     ; preds = %83, %7
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %60 = call i64 @ftell(%struct._IO_FILE* %59)
  store i64 %60, i64* %17, align 8
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %62 = call signext i16 @nextkeypacket(%struct._IO_FILE* %61, i8* %21)
  %63 = sext i16 %62 to i32
  store i32 %63, i32* %20, align 4
  %64 = load i32, i32* %20, align 4
  %65 = icmp slt i32 %64, 0
  br i1 %65, label %82, label %66

; <label>:66:                                     ; preds = %58
  %pgocount = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 3)
  %67 = add i64 %pgocount, 1
  store i64 %67, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 3)
  %68 = load i8, i8* %21, align 1
  %69 = call i32 @is_key_ctb(i8 zeroext %68)
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %82, label %71

; <label>:71:                                     ; preds = %66
  %pgocount1 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 5)
  %72 = add i64 %pgocount1, 1
  store i64 %72, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 5)
  %73 = load i8, i8* %21, align 1
  %74 = zext i8 %73 to i32
  %75 = icmp eq i32 %74, 180
  br i1 %75, label %82, label %76

; <label>:76:                                     ; preds = %71
  %pgocount2 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 9)
  %77 = add i64 %pgocount2, 1
  store i64 %77, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 9)
  %78 = load i8, i8* %21, align 1
  %79 = zext i8 %78 to i32
  %80 = and i32 %79, 124
  %81 = icmp eq i32 %80, 8
  br i1 %81, label %82, label %83

; <label>:82:                                     ; preds = %76, %71, %66, %58
  br label %96

; <label>:83:                                     ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 13)
  %84 = add i64 %pgocount3, 1
  store i64 %84, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 13)
  %85 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %86 = call i64 @ftell(%struct._IO_FILE* %85)
  %87 = load i64, i64* %17, align 8
  %88 = sub nsw i64 %86, %87
  %89 = trunc i64 %88 to i32
  store i32 %89, i32* %18, align 4
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %91 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %92 = load i32, i32* %18, align 4
  %93 = sext i32 %92 to i64
  %94 = load i64, i64* %17, align 8
  %95 = call i32 @copyfilepos(%struct._IO_FILE* %90, %struct._IO_FILE* %91, i64 %93, i64 %94)
  br label %58

; <label>:96:                                     ; preds = %82
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %98 = load i64, i64* %17, align 8
  %99 = call i32 @fseek(%struct._IO_FILE* %97, i64 %98, i32 0)
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %101 = load i64, i64* %11, align 8
  %102 = call i32 @fseek(%struct._IO_FILE* %100, i64 %101, i32 0)
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %104 = call signext i16 @nextkeypacket(%struct._IO_FILE* %103, i8* %21)
  br label %105

; <label>:105:                                    ; preds = %130, %96
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %107 = call i64 @ftell(%struct._IO_FILE* %106)
  store i64 %107, i64* %11, align 8
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %109 = call signext i16 @nextkeypacket(%struct._IO_FILE* %108, i8* %21)
  %110 = sext i16 %109 to i32
  store i32 %110, i32* %20, align 4
  %111 = load i32, i32* %20, align 4
  %112 = icmp slt i32 %111, 0
  br i1 %112, label %129, label %113

; <label>:113:                                    ; preds = %105
  %pgocount4 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 4)
  %114 = add i64 %pgocount4, 1
  store i64 %114, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 4)
  %115 = load i8, i8* %21, align 1
  %116 = call i32 @is_key_ctb(i8 zeroext %115)
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %129, label %118

; <label>:118:                                    ; preds = %113
  %pgocount5 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 6)
  %119 = add i64 %pgocount5, 1
  store i64 %119, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 6)
  %120 = load i8, i8* %21, align 1
  %121 = zext i8 %120 to i32
  %122 = icmp eq i32 %121, 180
  br i1 %122, label %129, label %123

; <label>:123:                                    ; preds = %118
  %pgocount6 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 10)
  %124 = add i64 %pgocount6, 1
  store i64 %124, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 10)
  %125 = load i8, i8* %21, align 1
  %126 = zext i8 %125 to i32
  %127 = and i32 %126, 124
  %128 = icmp eq i32 %127, 8
  br i1 %128, label %129, label %130

; <label>:129:                                    ; preds = %123, %118, %113, %105
  br label %132

; <label>:130:                                    ; preds = %123
  %pgocount7 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 14)
  %131 = add i64 %pgocount7, 1
  store i64 %131, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 14)
  br label %105

; <label>:132:                                    ; preds = %129
  %133 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %134 = load i64, i64* %11, align 8
  %135 = call i32 @fseek(%struct._IO_FILE* %133, i64 %134, i32 0)
  store i32 0, i32* %22, align 4
  br label %136

; <label>:136:                                    ; preds = %344, %171, %132
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %138 = call i64 @ftell(%struct._IO_FILE* %137)
  store i64 %138, i64* %11, align 8
  %139 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %140 = bitcast i64* %24 to i8*
  %141 = getelementptr inbounds [8 x i8], [8 x i8]* %26, i32 0, i32 0
  %142 = call signext i16 @readkeypacket(%struct._IO_FILE* %139, %struct.IdeaCfbContext* null, i8* %21, i8* %140, i8* null, i16* null, i16* null, i16* null, i16* null, i16* null, i16* null, i8* %141, i8* null)
  %143 = sext i16 %142 to i32
  store i32 %143, i32* %20, align 4
  %144 = load i32, i32* %20, align 4
  %145 = icmp eq i32 %144, -3
  br i1 %145, label %146, label %149

; <label>:146:                                    ; preds = %136
  %pgocount8 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 27)
  %147 = add i64 %pgocount8, 1
  store i64 %147, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 27)
  %148 = load i32, i32* %20, align 4
  store i32 %148, i32* %8, align 4
  br label %413

; <label>:149:                                    ; preds = %136
  %150 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %151 = call i64 @ftell(%struct._IO_FILE* %150)
  %152 = load i64, i64* %11, align 8
  %153 = sub nsw i64 %151, %152
  %154 = trunc i64 %153 to i32
  store i32 %154, i32* %19, align 4
  %155 = load i32, i32* %20, align 4
  %156 = icmp eq i32 %155, -1
  br i1 %156, label %167, label %157

; <label>:157:                                    ; preds = %149
  %pgocount9 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 7)
  %158 = add i64 %pgocount9, 1
  store i64 %158, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 7)
  %159 = load i8, i8* %21, align 1
  %160 = call i32 @is_key_ctb(i8 zeroext %159)
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %167, label %162

; <label>:162:                                    ; preds = %157
  %pgocount10 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 11)
  %163 = add i64 %pgocount10, 1
  store i64 %163, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 11)
  %164 = load i8, i8* %21, align 1
  %165 = zext i8 %164 to i32
  %166 = icmp eq i32 %165, 180
  br i1 %166, label %167, label %168

; <label>:167:                                    ; preds = %162, %157, %149
  br label %345

; <label>:168:                                    ; preds = %162
  %169 = load i32, i32* %20, align 4
  %170 = icmp slt i32 %169, 0
  br i1 %170, label %171, label %173

; <label>:171:                                    ; preds = %168
  %pgocount11 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 18)
  %172 = add i64 %pgocount11, 1
  store i64 %172, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 18)
  br label %136

; <label>:173:                                    ; preds = %168
  %pgocount12 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 16)
  %174 = add i64 %pgocount12, 1
  store i64 %174, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 16)
  %175 = load i8, i8* %21, align 1
  %176 = zext i8 %175 to i32
  %177 = and i32 %176, 124
  %178 = icmp eq i32 %177, 8
  br i1 %178, label %179, label %321

; <label>:179:                                    ; preds = %173
  %180 = load i8*, i8** %13, align 8
  %181 = load i64, i64* %16, align 8
  %182 = getelementptr inbounds [8 x i8], [8 x i8]* %26, i32 0, i32 0
  %183 = bitcast i64* %23 to i8*
  %184 = call i32 @getpubusersig(i8* %180, i64 %181, i8* %182, i8* %183, i64* %28, i32* %29)
  %185 = icmp slt i32 %184, 0
  %186 = zext i1 %185 to i32
  store i32 %186, i32* %22, align 4
  %187 = load i32, i32* %22, align 4
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %289, label %189

; <label>:189:                                    ; preds = %179
  %190 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %191 = call i64 @ftell(%struct._IO_FILE* %190)
  store i64 %191, i64* %30, align 8
  %192 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %193 = load i64, i64* %11, align 8
  %194 = add nsw i64 %193, 6
  %195 = call i32 @fseek(%struct._IO_FILE* %192, i64 %194, i32 0)
  %196 = bitcast i64* %24 to i8*
  %197 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %198 = call i64 @fread(i8* %196, i64 1, i64 4, %struct._IO_FILE* %197)
  %199 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %200 = load i64, i64* %30, align 8
  %201 = call i32 @fseek(%struct._IO_FILE* %199, i64 %200, i32 0)
  %202 = bitcast i64* %24 to i8*
  call void @hiloswap(i8* %202, i16 signext 4)
  %203 = load i8, i8* @verbose, align 1
  %204 = icmp ne i8 %203, 0
  br i1 %204, label %205, label %211

; <label>:205:                                    ; preds = %189
  %pgocount13 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 25)
  %206 = add i64 %pgocount13, 1
  store i64 %206, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 25)
  %207 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %208 = load i64, i64* %23, align 8
  %209 = load i64, i64* %24, align 8
  %210 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %207, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.28, i32 0, i32 0), i64 %208, i64 %209)
  br label %211

; <label>:211:                                    ; preds = %205, %189
  %212 = load i64, i64* %24, align 8
  %213 = load i64, i64* %23, align 8
  %214 = icmp ugt i64 %212, %213
  br i1 %214, label %215, label %287

; <label>:215:                                    ; preds = %211
  %216 = getelementptr inbounds [8 x i8], [8 x i8]* %26, i32 0, i32 0
  %217 = call i8* @user_from_keyID(i8* %216)
  store i8* %217, i8** %31, align 8
  %218 = icmp eq i8* %217, null
  br i1 %218, label %219, label %227

; <label>:219:                                    ; preds = %215
  %pgocount14 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 29)
  %220 = add i64 %pgocount14, 1
  store i64 %220, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 29)
  %221 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %222 = call i8* @LANG(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.29, i32 0, i32 0))
  %223 = getelementptr inbounds [8 x i8], [8 x i8]* %26, i32 0, i32 0
  %224 = call i8* @keyIDstring(i8* %223)
  %225 = getelementptr inbounds [256 x i8], [256 x i8]* %27, i32 0, i32 0
  %226 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %221, i8* %222, i8* %224, i8* %225)
  br label %286

; <label>:227:                                    ; preds = %215
  %228 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %229 = call i8* @LANG(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.30, i32 0, i32 0))
  %230 = load i8*, i8** %31, align 8
  %231 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %228, i8* %229, i8* %230)
  %232 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %233 = call i8* @LANG(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.31, i32 0, i32 0))
  %234 = getelementptr inbounds [256 x i8], [256 x i8]* %27, i32 0, i32 0
  %235 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %232, i8* %233, i8* %234)
  %236 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %237 = call i64 @ftell(%struct._IO_FILE* %236)
  store i64 %237, i64* %32, align 8
  %238 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %239 = call i64 @ftell(%struct._IO_FILE* %238)
  store i64 %239, i64* %33, align 8
  %240 = load i8*, i8** %13, align 8
  %241 = getelementptr inbounds [256 x i8], [256 x i8]* %27, i32 0, i32 0
  %242 = call i32 @getpublickey(i32 1, i8* %240, i64* %34, i32* %35, i8* null, i8* null, i8* %241, i16* null, i16* null)
  store i32 %242, i32* %20, align 4
  %243 = load i32, i32* %20, align 4
  %244 = icmp ne i32 %243, 0
  br i1 %244, label %256, label %245

; <label>:245:                                    ; preds = %227
  %pgocount15 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 30)
  %246 = add i64 %pgocount15, 1
  store i64 %246, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 30)
  %247 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %248 = load i64, i64* %34, align 8
  %249 = load i32, i32* %35, align 4
  %250 = getelementptr inbounds [256 x i8], [256 x i8]* %27, i32 0, i32 0
  %251 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %252 = load i64, i64* %11, align 8
  %253 = load i8*, i8** %13, align 8
  %254 = bitcast i64* %25 to i8*
  %255 = call i32 @check_key_sig(%struct._IO_FILE* %247, i64 %248, i32 %249, i8* %250, %struct._IO_FILE* %251, i64 %252, i8* %253, i8* null, i8* %254, i8* %36)
  store i32 %255, i32* %20, align 4
  br label %256

; <label>:256:                                    ; preds = %245, %227
  %257 = getelementptr inbounds [256 x i8], [256 x i8]* %27, i32 0, i32 0
  call void @PascalToC(i8* %257)
  %258 = load i8*, i8** %31, align 8
  call void @PascalToC(i8* %258)
  %259 = load i32, i32* %20, align 4
  %260 = icmp ne i32 %259, 0
  br i1 %260, label %274, label %261

; <label>:261:                                    ; preds = %256
  %pgocount16 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 31)
  %262 = add i64 %pgocount16, 1
  store i64 %262, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 31)
  %263 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %264 = call i8* @LANG(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.32, i32 0, i32 0))
  %265 = load i8*, i8** %31, align 8
  %266 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %263, i8* %264, i8* %265)
  %267 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %268 = call i8* @LANG(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.31, i32 0, i32 0))
  %269 = getelementptr inbounds [256 x i8], [256 x i8]* %27, i32 0, i32 0
  %270 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %267, i8* %268, i8* %269)
  %271 = load i64, i64* %28, align 8
  call void @sig_list_add(i64 %271)
  %272 = load i32, i32* @newsigs, align 4
  %273 = add nsw i32 %272, 1
  store i32 %273, i32* @newsigs, align 4
  store i32 1, i32* %22, align 4
  br label %279

; <label>:274:                                    ; preds = %256
  %pgocount17 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 28)
  %275 = add i64 %pgocount17, 1
  store i64 %275, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 28)
  %276 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %277 = call i8* @LANG(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.33, i32 0, i32 0))
  %278 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %276, i8* %277)
  br label %279

; <label>:279:                                    ; preds = %274, %261
  %280 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %281 = load i64, i64* %33, align 8
  %282 = call i32 @fseek(%struct._IO_FILE* %280, i64 %281, i32 0)
  %283 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %284 = load i64, i64* %32, align 8
  %285 = call i32 @fseek(%struct._IO_FILE* %283, i64 %284, i32 0)
  br label %286

; <label>:286:                                    ; preds = %279, %219
  br label %287

; <label>:287:                                    ; preds = %286, %211
  %pgocount18 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 23)
  %288 = add i64 %pgocount18, 1
  store i64 %288, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 23)
  br label %320

; <label>:289:                                    ; preds = %179
  %290 = getelementptr inbounds [8 x i8], [8 x i8]* %26, i32 0, i32 0
  %291 = call i8* @user_from_keyID(i8* %290)
  store i8* %291, i8** %37, align 8
  %292 = icmp eq i8* %291, null
  br i1 %292, label %293, label %301

; <label>:293:                                    ; preds = %289
  %pgocount19 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 26)
  %294 = add i64 %pgocount19, 1
  store i64 %294, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 26)
  %295 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %296 = call i8* @LANG(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.34, i32 0, i32 0))
  %297 = getelementptr inbounds [8 x i8], [8 x i8]* %26, i32 0, i32 0
  %298 = call i8* @keyIDstring(i8* %297)
  %299 = getelementptr inbounds [256 x i8], [256 x i8]* %27, i32 0, i32 0
  %300 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %295, i8* %296, i8* %298, i8* %299)
  br label %311

; <label>:301:                                    ; preds = %289
  %pgocount20 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 20)
  %302 = add i64 %pgocount20, 1
  store i64 %302, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 20)
  %303 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %304 = call i8* @LANG(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35, i32 0, i32 0))
  %305 = load i8*, i8** %37, align 8
  %306 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %303, i8* %304, i8* %305)
  %307 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %308 = call i8* @LANG(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.31, i32 0, i32 0))
  %309 = getelementptr inbounds [256 x i8], [256 x i8]* %27, i32 0, i32 0
  %310 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %307, i8* %308, i8* %309)
  br label %311

; <label>:311:                                    ; preds = %301, %293
  %312 = load i32, i32* @newsigs, align 4
  %313 = add nsw i32 %312, 1
  store i32 %313, i32* @newsigs, align 4
  %314 = load i8, i8* @batchmode, align 1
  %315 = icmp ne i8 %314, 0
  br i1 %315, label %316, label %319

; <label>:316:                                    ; preds = %311
  %pgocount21 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 21)
  %317 = add i64 %pgocount21, 1
  store i64 %317, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 21)
  %318 = call i8* @keyIDstring(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @mykeyID, i32 0, i32 0))
  call void @show_update(i8* %318)
  br label %319

; <label>:319:                                    ; preds = %316, %311
  br label %320

; <label>:320:                                    ; preds = %319, %287
  br label %321

; <label>:321:                                    ; preds = %320, %173
  %322 = load i32, i32* %22, align 4
  %323 = icmp ne i32 %322, 0
  br i1 %323, label %324, label %344

; <label>:324:                                    ; preds = %321
  %pgocount22 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 17)
  %325 = add i64 %pgocount22, 1
  store i64 %325, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 17)
  %326 = load i8, i8* %21, align 1
  %327 = zext i8 %326 to i32
  %328 = and i32 %327, 124
  %329 = icmp eq i32 %328, 8
  br i1 %329, label %330, label %344

; <label>:330:                                    ; preds = %324
  %331 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %332 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %333 = load i32, i32* %19, align 4
  %334 = sext i32 %333 to i64
  %335 = load i64, i64* %11, align 8
  %336 = call i32 @copyfilepos(%struct._IO_FILE* %331, %struct._IO_FILE* %332, i64 %334, i64 %335)
  %337 = load i8, i8* @publickey, align 1
  %338 = icmp ne i8 %337, 0
  br i1 %338, label %339, label %342

; <label>:339:                                    ; preds = %330
  %pgocount23 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 22)
  %340 = add i64 %pgocount23, 1
  store i64 %340, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 22)
  %341 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  call void @write_trust(%struct._IO_FILE* %341, i8 zeroext 0)
  br label %342

; <label>:342:                                    ; preds = %339, %330
  %pgocount24 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 19)
  %343 = add i64 %pgocount24, 1
  store i64 %343, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 19)
  br label %344

; <label>:344:                                    ; preds = %342, %324, %321
  br label %136

; <label>:345:                                    ; preds = %167
  %346 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %347 = load i64, i64* %17, align 8
  %348 = call i32 @fseek(%struct._IO_FILE* %346, i64 %347, i32 0)
  br label %349

; <label>:349:                                    ; preds = %398, %374, %345
  %350 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %351 = call i64 @ftell(%struct._IO_FILE* %350)
  store i64 %351, i64* %17, align 8
  %352 = load i64, i64* %17, align 8
  %353 = call i32 @sig_list_find(i64 %352)
  %354 = icmp ne i32 %353, 0
  br i1 %354, label %355, label %376

; <label>:355:                                    ; preds = %349
  %356 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %357 = call signext i16 @nextkeypacket(%struct._IO_FILE* %356, i8* %21)
  %358 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %359 = call i64 @ftell(%struct._IO_FILE* %358)
  store i64 %359, i64* %17, align 8
  %360 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %361 = call signext i16 @nextkeypacket(%struct._IO_FILE* %360, i8* %21)
  %362 = sext i16 %361 to i32
  %363 = icmp slt i32 %362, 0
  br i1 %363, label %369, label %364

; <label>:364:                                    ; preds = %355
  %pgocount25 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 2)
  %365 = add i64 %pgocount25, 1
  store i64 %365, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 2)
  %366 = load i8, i8* %21, align 1
  %367 = zext i8 %366 to i32
  %368 = icmp ne i32 %367, 176
  br i1 %368, label %369, label %374

; <label>:369:                                    ; preds = %364, %355
  %pgocount26 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 1)
  %370 = add i64 %pgocount26, 1
  store i64 %370, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 1)
  %371 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %372 = load i64, i64* %17, align 8
  %373 = call i32 @fseek(%struct._IO_FILE* %371, i64 %372, i32 0)
  br label %374

; <label>:374:                                    ; preds = %369, %364
  %pgocount27 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 0)
  %375 = add i64 %pgocount27, 1
  store i64 %375, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 0)
  br label %349

; <label>:376:                                    ; preds = %349
  %377 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %378 = call signext i16 @nextkeypacket(%struct._IO_FILE* %377, i8* %21)
  %379 = sext i16 %378 to i32
  store i32 %379, i32* %20, align 4
  %380 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %381 = call i64 @ftell(%struct._IO_FILE* %380)
  %382 = load i64, i64* %17, align 8
  %383 = sub nsw i64 %381, %382
  %384 = trunc i64 %383 to i32
  store i32 %384, i32* %18, align 4
  %385 = load i32, i32* %20, align 4
  %386 = icmp slt i32 %385, 0
  br i1 %386, label %397, label %387

; <label>:387:                                    ; preds = %376
  %pgocount28 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 8)
  %388 = add i64 %pgocount28, 1
  store i64 %388, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 8)
  %389 = load i8, i8* %21, align 1
  %390 = call i32 @is_key_ctb(i8 zeroext %389)
  %391 = icmp ne i32 %390, 0
  br i1 %391, label %397, label %392

; <label>:392:                                    ; preds = %387
  %pgocount29 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 12)
  %393 = add i64 %pgocount29, 1
  store i64 %393, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 12)
  %394 = load i8, i8* %21, align 1
  %395 = zext i8 %394 to i32
  %396 = icmp eq i32 %395, 180
  br i1 %396, label %397, label %398

; <label>:397:                                    ; preds = %392, %387, %376
  br label %406

; <label>:398:                                    ; preds = %392
  %pgocount30 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 15)
  %399 = add i64 %pgocount30, 1
  store i64 %399, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 15)
  %400 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %401 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %402 = load i32, i32* %18, align 4
  %403 = sext i32 %402 to i64
  %404 = load i64, i64* %17, align 8
  %405 = call i32 @copyfilepos(%struct._IO_FILE* %400, %struct._IO_FILE* %401, i64 %403, i64 %404)
  br label %349

; <label>:406:                                    ; preds = %397
  %pgocount31 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 24)
  %407 = add i64 %pgocount31, 1
  store i64 %407, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_tmp1.ll_mergesigs, i64 0, i64 24)
  call void @sig_list_clear()
  %408 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %409 = load i64, i64* %17, align 8
  %410 = call i32 @fseek(%struct._IO_FILE* %408, i64 %409, i32 0)
  %411 = load i64, i64* %17, align 8
  %412 = load i64*, i64** %14, align 8
  store i64 %411, i64* %412, align 8
  store i32 0, i32* %8, align 4
  br label %413

; <label>:413:                                    ; preds = %406, %146
  %414 = load i32, i32* %8, align 4
  ret i32 %414
}

declare i32 @getpubusersig(i8*, i64, i8*, i8*, i64*, i32*) #1

declare void @hiloswap(i8*, i16 signext) #1

declare i8* @user_from_keyID(i8*) #1

declare i32 @getpublickey(i32, i8*, i64*, i32*, i8*, i8*, i8*, i16*, i16*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @sig_list_add(i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_sig_list_add, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_sig_list_add, i64 0, i64 0)
  %3 = alloca i64, align 8
  %4 = alloca %struct.sig_list*, align 8
  store i64 %0, i64* %3, align 8
  %5 = call i8* @xmalloc(i32 16)
  %6 = bitcast i8* %5 to %struct.sig_list*
  store %struct.sig_list* %6, %struct.sig_list** %4, align 8
  %7 = load i64, i64* %3, align 8
  %8 = load %struct.sig_list*, %struct.sig_list** %4, align 8
  %9 = getelementptr inbounds %struct.sig_list, %struct.sig_list* %8, i32 0, i32 1
  store i64 %7, i64* %9, align 8
  %10 = load %struct.sig_list*, %struct.sig_list** @siglist, align 8
  %11 = load %struct.sig_list*, %struct.sig_list** %4, align 8
  %12 = getelementptr inbounds %struct.sig_list, %struct.sig_list* %11, i32 0, i32 0
  store %struct.sig_list* %10, %struct.sig_list** %12, align 8
  %13 = load %struct.sig_list*, %struct.sig_list** %4, align 8
  store %struct.sig_list* %13, %struct.sig_list** @siglist, align 8
  ret void
}

declare void @show_update(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @sig_list_find(i64) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca %struct.sig_list*, align 8
  store i64 %0, i64* %3, align 8
  %5 = load %struct.sig_list*, %struct.sig_list** @siglist, align 8
  store %struct.sig_list* %5, %struct.sig_list** %4, align 8
  br label %6

; <label>:6:                                      ; preds = %18, %1
  %7 = load %struct.sig_list*, %struct.sig_list** %4, align 8
  %8 = icmp ne %struct.sig_list* %7, null
  br i1 %8, label %9, label %23

; <label>:9:                                      ; preds = %6
  %10 = load %struct.sig_list*, %struct.sig_list** %4, align 8
  %11 = getelementptr inbounds %struct.sig_list, %struct.sig_list* %10, i32 0, i32 1
  %12 = load i64, i64* %11, align 8
  %13 = load i64, i64* %3, align 8
  %14 = icmp eq i64 %12, %13
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_sig_list_find, i64 0, i64 2)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_sig_list_find, i64 0, i64 2)
  store i32 1, i32* %2, align 4
  br label %25

; <label>:17:                                     ; preds = %9
  br label %18

; <label>:18:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_sig_list_find, i64 0, i64 0)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_sig_list_find, i64 0, i64 0)
  %20 = load %struct.sig_list*, %struct.sig_list** %4, align 8
  %21 = getelementptr inbounds %struct.sig_list, %struct.sig_list* %20, i32 0, i32 0
  %22 = load %struct.sig_list*, %struct.sig_list** %21, align 8
  store %struct.sig_list* %22, %struct.sig_list** %4, align 8
  br label %6

; <label>:23:                                     ; preds = %6
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_sig_list_find, i64 0, i64 1)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_sig_list_find, i64 0, i64 1)
  store i32 0, i32* %2, align 4
  br label %25

; <label>:25:                                     ; preds = %23, %15
  %26 = load i32, i32* %2, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind uwtable
define internal void @sig_list_clear() #0 {
  %1 = alloca %struct.sig_list*, align 8
  %2 = alloca %struct.sig_list*, align 8
  %3 = load %struct.sig_list*, %struct.sig_list** @siglist, align 8
  store %struct.sig_list* %3, %struct.sig_list** %1, align 8
  br label %4

; <label>:4:                                      ; preds = %13, %0
  %5 = load %struct.sig_list*, %struct.sig_list** %1, align 8
  %6 = icmp ne %struct.sig_list* %5, null
  br i1 %6, label %7, label %16

; <label>:7:                                      ; preds = %4
  %8 = load %struct.sig_list*, %struct.sig_list** %1, align 8
  %9 = getelementptr inbounds %struct.sig_list, %struct.sig_list* %8, i32 0, i32 0
  %10 = load %struct.sig_list*, %struct.sig_list** %9, align 8
  store %struct.sig_list* %10, %struct.sig_list** %2, align 8
  %11 = load %struct.sig_list*, %struct.sig_list** %1, align 8
  %12 = call i32 (%struct.sig_list*, ...) bitcast (i32 (...)* @free to i32 (%struct.sig_list*, ...)*)(%struct.sig_list* %11)
  br label %13

; <label>:13:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig_list_clear, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig_list_clear, i64 0, i64 0)
  %15 = load %struct.sig_list*, %struct.sig_list** %2, align 8
  store %struct.sig_list* %15, %struct.sig_list** %1, align 8
  br label %4

; <label>:16:                                     ; preds = %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig_list_clear, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig_list_clear, i64 0, i64 1)
  store %struct.sig_list* null, %struct.sig_list** @siglist, align 8
  ret void
}

declare i32 @free(...) #1

declare i32 @is_compromised(%struct._IO_FILE*) #1

declare i32 @read_trust(%struct._IO_FILE*, i8*) #1

declare i32 @signkey(i8*, i8*, i8*) #1

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8*, i8*, i64) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
