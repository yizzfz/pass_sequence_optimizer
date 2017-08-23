; ModuleID = 'tmp1.ll'
source_filename = "makedent.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashheader = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i8], [13 x i8], i8, i8, i8, [228 x i16], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [128 x i8], [100 x [11 x i8]], [100 x i32], [100 x i32], i16 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.strchartype = type { i8*, i8*, i8* }
%struct.dent = type { %struct.dent*, i8*, [1 x i64] }

$__llvm_profile_raw_version = comdat any

@hashheader = external global %struct.hashheader, align 4
@cbench_print = external global i32, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [51 x i8] c"\0D\0AWord '%s' too long at line %d of %s, truncated\0D\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"makedent.c\00", align 1
@.str.2 = private unnamed_addr constant [42 x i8] c"\0D\0AWord '%s' contains illegal characters\0D\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"\0D\0ACouldn't allocate space for word '%s'\0D\0A\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"\0D\0AIllegal affix flag character '%c'\0D\0A\00", align 1
@defdupchar = external global i32, align 4
@laststringch = external global i32, align 4
@strtosichar.out = internal global [184 x i8] zeroinitializer, align 16
@ichartosstr.out = internal global [184 x i8] zeroinitializer, align 16
@printichar.out = internal global [11 x i8] zeroinitializer, align 1
@chartypes = external global %struct.strchartype*, align 8
@.str.5 = private unnamed_addr constant [4 x i8] c"tex\00", align 1
@has_marker = internal global i32 0, align 4
@.str.6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_makedent = private constant [8 x i8] c"makedent"
@__profn_strtoichar = private constant [10 x i8] c"strtoichar"
@__profn_ichartostr = private constant [10 x i8] c"ichartostr"
@__profn_whatcap = private constant [7 x i8] c"whatcap"
@__profn_chupcase = private constant [8 x i8] c"chupcase"
@__profn_addvheader = private constant [10 x i8] c"addvheader"
@__profn_combinecaps = private constant [11 x i8] c"combinecaps"
@__profn_tmp1.ll_combine_two_entries = private constant [27 x i8] c"tmp1.ll:combine_two_entries"
@__profn_tmp1.ll_forcevheader = private constant [20 x i8] c"tmp1.ll:forcevheader"
@__profn_tmp1.ll_combineaffixes = private constant [22 x i8] c"tmp1.ll:combineaffixes"
@__profn_upcase = private constant [6 x i8] c"upcase"
@__profn_lowcase = private constant [7 x i8] c"lowcase"
@__profn_strtosichar = private constant [11 x i8] c"strtosichar"
@__profn_toutent = private constant [7 x i8] c"toutent"
@__profn_tmp1.ll_toutword = private constant [16 x i8] c"tmp1.ll:toutword"
@__profn_ichartosstr = private constant [11 x i8] c"ichartosstr"
@__profn_stringcharlen = private constant [13 x i8] c"stringcharlen"
@__profn_printichar = private constant [10 x i8] c"printichar"
@__profn_findfiletype = private constant [12 x i8] c"findfiletype"
@__profn_tmp1.ll_acoversb = private constant [16 x i8] c"tmp1.ll:acoversb"
@__profn_tmp1.ll_issubset = private constant [16 x i8] c"tmp1.ll:issubset"
@__profn_tmp1.ll_flagout = private constant [15 x i8] c"tmp1.ll:flagout"
@__profc_makedent = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_makedent = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7166142241715394079, i64 310829295306, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, %struct.dent*)* @makedent to i8*), i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_strtoichar = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_strtoichar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7013936283616679145, i64 93931457526, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i32, i32)* @strtoichar to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ichartostr = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ichartostr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8290205195142120502, i64 126136700242, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i32, i32)* @ichartostr to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_whatcap = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_whatcap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2667096979688898770, i64 155487538745, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i32 0, i32 0), i8* bitcast (i64 (i8*)* @whatcap to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_chupcase = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_chupcase = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -312814799877443967, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_chupcase, i32 0, i32 0), i8* bitcast (void (i8*)* @chupcase to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_addvheader = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_addvheader = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5681055503819976335, i64 82911446923, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i32 0, i32 0), i8* bitcast (i32 (%struct.dent*)* @addvheader to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_combinecaps = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_combinecaps = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8876820306568853305, i64 116888126998, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i32 0, i32 0), i8* bitcast (i32 (%struct.dent*, %struct.dent*)* @combinecaps to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_combine_two_entries = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_combine_two_entries = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3575788537177063397, i64 75451048629, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_forcevheader = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_forcevheader = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2741207667384423775, i64 50509324029, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forcevheader, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_combineaffixes = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_combineaffixes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8688265796984806847, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_combineaffixes, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_upcase = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_upcase = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6852210443857658039, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_upcase, i32 0, i32 0), i8* bitcast (void (i8*)* @upcase to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lowcase = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lowcase = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7329910641104413876, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_lowcase, i32 0, i32 0), i8* bitcast (void (i8*)* @lowcase to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_strtosichar = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_strtosichar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7483591500495972656, i64 35373395463, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_strtosichar, i32 0, i32 0), i8* bitcast (i8* (i8*, i32)* @strtosichar to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_toutent = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_toutent = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8203461719301897682, i64 142396149237, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, %struct.dent*, i32)* @toutent to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_toutword = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_toutword = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2906200358782811829, i64 45130900406, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_toutword, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ichartosstr = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ichartosstr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1838760679804510027, i64 35373395463, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ichartosstr, i32 0, i32 0), i8* bitcast (i8* (i8*, i32)* @ichartosstr to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_stringcharlen = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_stringcharlen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8416989569685119878, i64 160475650953, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i32 0, i32 0), i8* bitcast (i32 (i8*, i32)* @stringcharlen to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_printichar = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_printichar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4805801380253710118, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_printichar, i32 0, i32 0), i8* bitcast (i8* (i32)* @printichar to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_findfiletype = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_findfiletype = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8420867083706512686, i64 152815404349, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32*)* @findfiletype to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_acoversb = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_acoversb = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9000487164867782534, i64 146229084440, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i32 0, i32 0), i8* null, i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_issubset = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_issubset = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7813439663547469813, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_issubset, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_flagout = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_flagout = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1108893861422394127, i64 22759827559, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flagout, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [168 x i8] c"\A6\02\A4\01x\DA]\8E\DD\0E\C3 \08\85\C3\0B-\D9\ED^\A6\A1\8A\D5\CC\8A\11Z\B7\B7\9F\F67\D9\05\12\0E\1E\CE7\E3\9B,%\05\D1\A2\1C\8C\C7\02\DB\AB\DC\14\A8\1E\D5`\06\E3\97lP\08\D0\DA\D5\13Z*`x\1EC\A2\B6\16\D09?\1F1\BE\0Em\D0\CAC\BBZ\02\DD;\C7\C5\D0i\FE3\A0s\E1\D3\FE\1E)\91\EB\D67(\D9\A9\94\17\ED\A0\A7\B3\CF\95\8B\BDp;o\AB\90\A6.DJ\90\DB\A0\BB\DB\85d]\88\A4\DFL\D7\094\BCR\91\F1\12\82\C82\0A\DD!.\E2\D4r~\C1Ynm", section "__llvm_prf_names"
@llvm.used = appending global [23 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_makedent to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_strtoichar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ichartostr to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_whatcap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_chupcase to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_addvheader to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_combinecaps to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_combine_two_entries to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_forcevheader to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_combineaffixes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_upcase to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lowcase to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_strtosichar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_toutent to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_toutword to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ichartosstr to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_stringcharlen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_printichar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_findfiletype to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_acoversb to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_issubset to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_flagout to i8*), i8* getelementptr inbounds ([168 x i8], [168 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @makedent(i8*, i32, %struct.dent*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.dent*, align 8
  %8 = alloca [120 x i8], align 16
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.dent* %2, %struct.dent** %7, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = call i64 @strlen(i8* %13) #6
  %15 = sub i64 %14, 1
  %16 = trunc i64 %15 to i32
  store i32 %16, i32* %12, align 4
  %17 = load i8*, i8** %5, align 8
  %18 = load i32, i32* %12, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8* %17, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 10
  br i1 %23, label %24, label %30

; <label>:24:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 7)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 7)
  %26 = load i8*, i8** %5, align 8
  %27 = load i32, i32* %12, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8* %26, i64 %28
  store i8 0, i8* %29, align 1
  br label %30

; <label>:30:                                     ; preds = %24, %3
  %31 = load %struct.dent*, %struct.dent** %7, align 8
  %32 = getelementptr inbounds %struct.dent, %struct.dent* %31, i32 0, i32 0
  store %struct.dent* null, %struct.dent** %32, align 8
  %33 = load %struct.dent*, %struct.dent** %7, align 8
  %34 = getelementptr inbounds %struct.dent, %struct.dent* %33, i32 0, i32 2
  %35 = getelementptr inbounds [1 x i64], [1 x i64]* %34, i64 0, i64 0
  store i64 0, i64* %35, align 8
  %36 = load %struct.dent*, %struct.dent** %7, align 8
  %37 = getelementptr inbounds %struct.dent, %struct.dent* %36, i32 0, i32 2
  %38 = getelementptr inbounds [1 x i64], [1 x i64]* %37, i32 0, i32 0
  %39 = bitcast i64* %38 to i8*
  call void @llvm.memset.p0i8.i64(i8* %39, i8 0, i64 8, i32 8, i1 false)
  %40 = load %struct.dent*, %struct.dent** %7, align 8
  %41 = getelementptr inbounds %struct.dent, %struct.dent* %40, i32 0, i32 2
  %42 = getelementptr inbounds [1 x i64], [1 x i64]* %41, i64 0, i64 0
  %43 = load i64, i64* %42, align 8
  %44 = or i64 %43, 67108864
  store i64 %44, i64* %42, align 8
  %45 = load %struct.dent*, %struct.dent** %7, align 8
  %46 = getelementptr inbounds %struct.dent, %struct.dent* %45, i32 0, i32 2
  %47 = getelementptr inbounds [1 x i64], [1 x i64]* %46, i64 0, i64 0
  %48 = load i64, i64* %47, align 8
  %49 = and i64 %48, -134217729
  store i64 %49, i64* %47, align 8
  %50 = load i8*, i8** %5, align 8
  %51 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %52 = sext i8 %51 to i32
  %53 = call i8* @index(i8* %50, i32 %52) #6
  store i8* %53, i8** %10, align 8
  %54 = load i8*, i8** %10, align 8
  %55 = icmp ne i8* %54, null
  br i1 %55, label %56, label %59

; <label>:56:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 5)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 5)
  %58 = load i8*, i8** %10, align 8
  store i8 0, i8* %58, align 1
  br label %59

; <label>:59:                                     ; preds = %56, %30
  %60 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %61 = load i8*, i8** %5, align 8
  %62 = call i32 @strtoichar(i8* %60, i8* %61, i32 100, i32 1)
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %71, label %64

; <label>:64:                                     ; preds = %59
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 8)
  %65 = add i64 %pgocount2, 1
  store i64 %65, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 8)
  %66 = load i8*, i8** %5, align 8
  %67 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %68 = load i32, i32* %6, align 4
  %69 = call i32 @ichartostr(i8* %66, i8* %67, i32 %68, i32 1)
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %81

; <label>:71:                                     ; preds = %64, %59
  %72 = load i32, i32* @cbench_print, align 4
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %79

; <label>:74:                                     ; preds = %71
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 6)
  %75 = add i64 %pgocount3, 1
  store i64 %75, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 6)
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %77 = load i8*, i8** %5, align 8
  %78 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i8* %77, i32 156, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %79

; <label>:79:                                     ; preds = %74, %71
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 1)
  %80 = add i64 %pgocount4, 1
  store i64 %80, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 1)
  store i32 -1, i32* %4, align 4
  br label %261

; <label>:81:                                     ; preds = %64
  %82 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  store i8* %82, i8** %9, align 8
  br label %83

; <label>:83:                                     ; preds = %127, %81
  %84 = load i8*, i8** %9, align 8
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %131

; <label>:88:                                     ; preds = %83
  %89 = load i8*, i8** %9, align 8
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i64
  %92 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 23), i64 0, i64 %91
  %93 = load i8, i8* %92, align 1
  %94 = icmp ne i8 %93, 0
  br i1 %94, label %126, label %95

; <label>:95:                                     ; preds = %88
  %96 = load i8*, i8** %9, align 8
  %97 = load i8, i8* %96, align 1
  %98 = zext i8 %97 to i64
  %99 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 26), i64 0, i64 %98
  %100 = load i8, i8* %99, align 1
  %101 = icmp ne i8 %100, 0
  br i1 %101, label %102, label %114

; <label>:102:                                    ; preds = %95
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 2)
  %103 = add i64 %pgocount5, 1
  store i64 %103, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 2)
  %104 = load i8*, i8** %9, align 8
  %105 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %106 = icmp eq i8* %104, %105
  br i1 %106, label %114, label %107

; <label>:107:                                    ; preds = %102
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 3)
  %108 = add i64 %pgocount6, 1
  store i64 %108, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 3)
  %109 = load i8*, i8** %9, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 1
  %111 = load i8, i8* %110, align 1
  %112 = zext i8 %111 to i32
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %124

; <label>:114:                                    ; preds = %107, %102, %95
  %115 = load i32, i32* @cbench_print, align 4
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %117, label %122

; <label>:117:                                    ; preds = %114
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 16)
  %118 = add i64 %pgocount7, 1
  store i64 %118, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 16)
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %120 = load i8*, i8** %5, align 8
  %121 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %119, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.2, i32 0, i32 0), i8* %120)
  br label %122

; <label>:122:                                    ; preds = %117, %114
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 15)
  %123 = add i64 %pgocount8, 1
  store i64 %123, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 15)
  store i32 -1, i32* %4, align 4
  br label %261

; <label>:124:                                    ; preds = %107
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 4)
  %125 = add i64 %pgocount9, 1
  store i64 %125, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 4)
  br label %126

; <label>:126:                                    ; preds = %124, %88
  br label %127

; <label>:127:                                    ; preds = %126
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 0)
  %128 = add i64 %pgocount10, 1
  store i64 %128, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 0)
  %129 = load i8*, i8** %9, align 8
  %130 = getelementptr inbounds i8, i8* %129, i32 1
  store i8* %130, i8** %9, align 8
  br label %83

; <label>:131:                                    ; preds = %83
  %132 = load i8*, i8** %5, align 8
  %133 = call i64 @strlen(i8* %132) #6
  %134 = trunc i64 %133 to i32
  store i32 %134, i32* %12, align 4
  %135 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %136 = call i64 @whatcap(i8* %135)
  %137 = load %struct.dent*, %struct.dent** %7, align 8
  %138 = getelementptr inbounds %struct.dent, %struct.dent* %137, i32 0, i32 2
  %139 = getelementptr inbounds [1 x i64], [1 x i64]* %138, i64 0, i64 0
  %140 = load i64, i64* %139, align 8
  %141 = or i64 %140, %136
  store i64 %141, i64* %139, align 8
  %142 = load i32, i32* %12, align 4
  %143 = icmp sgt i32 %142, 99
  br i1 %143, label %144, label %154

; <label>:144:                                    ; preds = %131
  %145 = load i32, i32* @cbench_print, align 4
  %146 = icmp ne i32 %145, 0
  br i1 %146, label %147, label %152

; <label>:147:                                    ; preds = %144
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 18)
  %148 = add i64 %pgocount11, 1
  store i64 %148, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 18)
  %149 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %150 = load i8*, i8** %5, align 8
  %151 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %149, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i8* %150, i32 186, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %152

; <label>:152:                                    ; preds = %147, %144
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 17)
  %153 = add i64 %pgocount12, 1
  store i64 %153, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 17)
  store i32 -1, i32* %4, align 4
  br label %261

; <label>:154:                                    ; preds = %131
  %155 = load i32, i32* %12, align 4
  %156 = add i32 %155, 1
  %157 = call i8* @mymalloc(i32 %156)
  %158 = load %struct.dent*, %struct.dent** %7, align 8
  %159 = getelementptr inbounds %struct.dent, %struct.dent* %158, i32 0, i32 1
  store i8* %157, i8** %159, align 8
  %160 = load %struct.dent*, %struct.dent** %7, align 8
  %161 = getelementptr inbounds %struct.dent, %struct.dent* %160, i32 0, i32 1
  %162 = load i8*, i8** %161, align 8
  %163 = icmp eq i8* %162, null
  br i1 %163, label %164, label %174

; <label>:164:                                    ; preds = %154
  %165 = load i32, i32* @cbench_print, align 4
  %166 = icmp ne i32 %165, 0
  br i1 %166, label %167, label %172

; <label>:167:                                    ; preds = %164
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 22)
  %168 = add i64 %pgocount13, 1
  store i64 %168, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 22)
  %169 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %170 = load i8*, i8** %5, align 8
  %171 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %169, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), i8* %170)
  br label %172

; <label>:172:                                    ; preds = %167, %164
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 20)
  %173 = add i64 %pgocount14, 1
  store i64 %173, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 20)
  store i32 -1, i32* %4, align 4
  br label %261

; <label>:174:                                    ; preds = %154
  %175 = load %struct.dent*, %struct.dent** %7, align 8
  %176 = getelementptr inbounds %struct.dent, %struct.dent* %175, i32 0, i32 1
  %177 = load i8*, i8** %176, align 8
  %178 = load i8*, i8** %5, align 8
  %179 = call i8* @strcpy(i8* %177, i8* %178) #5
  %180 = load %struct.dent*, %struct.dent** %7, align 8
  %181 = getelementptr inbounds %struct.dent, %struct.dent* %180, i32 0, i32 2
  %182 = getelementptr inbounds [1 x i64], [1 x i64]* %181, i64 0, i64 0
  %183 = load i64, i64* %182, align 8
  %184 = and i64 %183, 805306368
  %185 = icmp ne i64 %184, 805306368
  br i1 %185, label %186, label %191

; <label>:186:                                    ; preds = %174
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 21)
  %187 = add i64 %pgocount15, 1
  store i64 %187, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 21)
  %188 = load %struct.dent*, %struct.dent** %7, align 8
  %189 = getelementptr inbounds %struct.dent, %struct.dent* %188, i32 0, i32 1
  %190 = load i8*, i8** %189, align 8
  call void @chupcase(i8* %190)
  br label %191

; <label>:191:                                    ; preds = %186, %174
  %192 = load i8*, i8** %10, align 8
  %193 = icmp eq i8* %192, null
  br i1 %193, label %194, label %196

; <label>:194:                                    ; preds = %191
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 23)
  %195 = add i64 %pgocount16, 1
  store i64 %195, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 23)
  store i32 0, i32* %4, align 4
  br label %261

; <label>:196:                                    ; preds = %191
  %197 = load i8*, i8** %10, align 8
  %198 = getelementptr inbounds i8, i8* %197, i32 1
  store i8* %198, i8** %10, align 8
  br label %199

; <label>:199:                                    ; preds = %258, %196
  %200 = load i8*, i8** %10, align 8
  %201 = load i8, i8* %200, align 1
  %202 = sext i8 %201 to i32
  %203 = icmp ne i32 %202, 0
  br i1 %203, label %204, label %210

; <label>:204:                                    ; preds = %199
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 10)
  %205 = add i64 %pgocount17, 1
  store i64 %205, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 10)
  %206 = load i8*, i8** %10, align 8
  %207 = load i8, i8* %206, align 1
  %208 = sext i8 %207 to i32
  %209 = icmp ne i32 %208, 10
  br label %210

; <label>:210:                                    ; preds = %204, %199
  %211 = phi i1 [ false, %199 ], [ %209, %204 ]
  br i1 %211, label %212, label %259

; <label>:212:                                    ; preds = %210
  %213 = load i8*, i8** %10, align 8
  %214 = load i8, i8* %213, align 1
  %215 = zext i8 %214 to i32
  %216 = sub nsw i32 %215, 65
  store i32 %216, i32* %11, align 4
  %217 = load i32, i32* %11, align 4
  %218 = icmp sge i32 %217, 0
  br i1 %218, label %219, label %233

; <label>:219:                                    ; preds = %212
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 11)
  %220 = add i64 %pgocount18, 1
  store i64 %220, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 11)
  %221 = load i32, i32* %11, align 4
  %222 = icmp sle i32 %221, 26
  br i1 %222, label %223, label %233

; <label>:223:                                    ; preds = %219
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 14)
  %224 = add i64 %pgocount19, 1
  store i64 %224, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 14)
  %225 = load i32, i32* %11, align 4
  %226 = zext i32 %225 to i64
  %227 = shl i64 1, %226
  %228 = load %struct.dent*, %struct.dent** %7, align 8
  %229 = getelementptr inbounds %struct.dent, %struct.dent* %228, i32 0, i32 2
  %230 = getelementptr inbounds [1 x i64], [1 x i64]* %229, i64 0, i64 0
  %231 = load i64, i64* %230, align 8
  %232 = or i64 %231, %227
  store i64 %232, i64* %230, align 8
  br label %245

; <label>:233:                                    ; preds = %219, %212
  %234 = load i32, i32* @cbench_print, align 4
  %235 = icmp ne i32 %234, 0
  br i1 %235, label %236, label %243

; <label>:236:                                    ; preds = %233
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 13)
  %237 = add i64 %pgocount20, 1
  store i64 %237, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 13)
  %238 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %239 = load i8*, i8** %10, align 8
  %240 = load i8, i8* %239, align 1
  %241 = zext i8 %240 to i32
  %242 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %238, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0), i32 %241)
  br label %243

; <label>:243:                                    ; preds = %236, %233
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 9)
  %244 = add i64 %pgocount21, 1
  store i64 %244, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 9)
  br label %245

; <label>:245:                                    ; preds = %243, %223
  %246 = load i8*, i8** %10, align 8
  %247 = getelementptr inbounds i8, i8* %246, i32 1
  store i8* %247, i8** %10, align 8
  %248 = load i8*, i8** %10, align 8
  %249 = load i8, i8* %248, align 1
  %250 = sext i8 %249 to i32
  %251 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %252 = sext i8 %251 to i32
  %253 = icmp eq i32 %250, %252
  br i1 %253, label %254, label %258

; <label>:254:                                    ; preds = %245
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 12)
  %255 = add i64 %pgocount22, 1
  store i64 %255, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 12)
  %256 = load i8*, i8** %10, align 8
  %257 = getelementptr inbounds i8, i8* %256, i32 1
  store i8* %257, i8** %10, align 8
  br label %258

; <label>:258:                                    ; preds = %254, %245
  br label %199

; <label>:259:                                    ; preds = %210
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 19)
  %260 = add i64 %pgocount23, 1
  store i64 %260, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_makedent, i64 0, i64 19)
  store i32 0, i32* %4, align 4
  br label %261

; <label>:261:                                    ; preds = %259, %194, %172, %152, %122, %79
  %262 = load i32, i32* %4, align 4
  ret i32 %262
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: nounwind readonly
declare i8* @index(i8*, i32) #1

; Function Attrs: nounwind uwtable
define i32 @strtoichar(i8*, i8*, i32, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %10 = load i32, i32* %7, align 4
  %11 = sext i32 %10 to i64
  %12 = udiv i64 %11, 1
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %7, align 4
  br label %14

; <label>:14:                                     ; preds = %65, %4
  %15 = load i32, i32* %7, align 4
  %16 = add nsw i32 %15, -1
  store i32 %16, i32* %7, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %24

; <label>:18:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 0)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 0)
  %20 = load i8*, i8** %6, align 8
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp ne i32 %22, 0
  br label %24

; <label>:24:                                     ; preds = %18, %14
  %25 = phi i1 [ false, %14 ], [ %23, %18 ]
  br i1 %25, label %26, label %70

; <label>:26:                                     ; preds = %24
  store i32 1, i32* %9, align 4
  %27 = load i8*, i8** %6, align 8
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i64
  %30 = getelementptr inbounds [128 x i8], [128 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 27), i64 0, i64 %29
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %46

; <label>:34:                                     ; preds = %26
  %35 = load i8*, i8** %6, align 8
  %36 = load i32, i32* %8, align 4
  %37 = call i32 @stringcharlen(i8* %35, i32 %36)
  store i32 %37, i32* %9, align 4
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 3)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 3)
  br label %43

; <label>:41:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 4)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 4)
  store i32 1, i32* %9, align 4
  br label %43

; <label>:43:                                     ; preds = %41, %39
  %44 = phi i32 [ 1, %39 ], [ 0, %41 ]
  %45 = icmp ne i32 %44, 0
  br label %46

; <label>:46:                                     ; preds = %43, %26
  %47 = phi i1 [ false, %26 ], [ %45, %43 ]
  br i1 %47, label %48, label %55

; <label>:48:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 1)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 1)
  %50 = load i32, i32* @laststringch, align 4
  %51 = add i32 128, %50
  %52 = trunc i32 %51 to i8
  %53 = load i8*, i8** %5, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %5, align 8
  store i8 %52, i8* %53, align 1
  br label %64

; <label>:55:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 2)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 2)
  %57 = load i8*, i8** %6, align 8
  %58 = load i8, i8* %57, align 1
  %59 = sext i8 %58 to i32
  %60 = and i32 %59, 127
  %61 = trunc i32 %60 to i8
  %62 = load i8*, i8** %5, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %5, align 8
  store i8 %61, i8* %62, align 1
  br label %64

; <label>:64:                                     ; preds = %55, %48
  br label %65

; <label>:65:                                     ; preds = %64
  %66 = load i32, i32* %9, align 4
  %67 = load i8*, i8** %6, align 8
  %68 = sext i32 %66 to i64
  %69 = getelementptr inbounds i8, i8* %67, i64 %68
  store i8* %69, i8** %6, align 8
  br label %14

; <label>:70:                                     ; preds = %24
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 5)
  %71 = add i64 %pgocount5, 1
  store i64 %71, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strtoichar, i64 0, i64 5)
  %72 = load i8*, i8** %5, align 8
  store i8 0, i8* %72, align 1
  %73 = load i32, i32* %7, align 4
  %74 = icmp sle i32 %73, 0
  %75 = zext i1 %74 to i32
  ret i32 %75
}

; Function Attrs: nounwind uwtable
define i32 @ichartostr(i8*, i8*, i32, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  br label %12

; <label>:12:                                     ; preds = %86, %4
  %13 = load i32, i32* %7, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, i32* %7, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %23

; <label>:16:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 3)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 3)
  %18 = load i8*, i8** %6, align 8
  %19 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %19, i8** %6, align 8
  %20 = load i8, i8* %18, align 1
  %21 = zext i8 %20 to i32
  store i32 %21, i32* %9, align 4
  %22 = icmp ne i32 %21, 0
  br label %23

; <label>:23:                                     ; preds = %16, %12
  %24 = phi i1 [ false, %12 ], [ %22, %16 ]
  br i1 %24, label %25, label %87

; <label>:25:                                     ; preds = %23
  %26 = load i32, i32* %9, align 4
  %27 = icmp slt i32 %26, 128
  br i1 %27, label %28, label %34

; <label>:28:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 4)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 4)
  %30 = load i32, i32* %9, align 4
  %31 = trunc i32 %30 to i8
  %32 = load i8*, i8** %5, align 8
  %33 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %33, i8** %5, align 8
  store i8 %31, i8* %32, align 1
  br label %86

; <label>:34:                                     ; preds = %25
  %35 = load i32, i32* %9, align 4
  %36 = sub nsw i32 %35, 128
  store i32 %36, i32* %9, align 4
  %37 = load i32, i32* %8, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %67, label %39

; <label>:39:                                     ; preds = %34
  %40 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 12), align 4
  store i32 %40, i32* %10, align 4
  br label %41

; <label>:41:                                     ; preds = %63, %39
  %42 = load i32, i32* %10, align 4
  %43 = add nsw i32 %42, -1
  store i32 %43, i32* %10, align 4
  %44 = icmp sge i32 %43, 0
  br i1 %44, label %45, label %65

; <label>:45:                                     ; preds = %41
  %46 = load i32, i32* %10, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [100 x i32], [100 x i32]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 30), i64 0, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = load i32, i32* @defdupchar, align 4
  %51 = icmp eq i32 %49, %50
  br i1 %51, label %52, label %63

; <label>:52:                                     ; preds = %45
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 2)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 2)
  %54 = load i32, i32* %10, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [100 x i32], [100 x i32]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 29), i64 0, i64 %55
  %57 = load i32, i32* %56, align 4
  %58 = load i32, i32* %9, align 4
  %59 = icmp eq i32 %57, %58
  br i1 %59, label %60, label %63

; <label>:60:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 7)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 7)
  %62 = load i32, i32* %10, align 4
  store i32 %62, i32* %9, align 4
  br label %65

; <label>:63:                                     ; preds = %52, %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 1)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 1)
  br label %41

; <label>:65:                                     ; preds = %60, %41
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 6)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 6)
  br label %67

; <label>:67:                                     ; preds = %65, %34
  %68 = load i32, i32* %9, align 4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds [100 x [11 x i8]], [100 x [11 x i8]]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 28), i64 0, i64 %69
  %71 = getelementptr inbounds [11 x i8], [11 x i8]* %70, i32 0, i32 0
  store i8* %71, i8** %11, align 8
  br label %72

; <label>:72:                                     ; preds = %80, %67
  %73 = load i8*, i8** %11, align 8
  %74 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %74, i8** %11, align 8
  %75 = load i8, i8* %73, align 1
  %76 = load i8*, i8** %5, align 8
  %77 = getelementptr inbounds i8, i8* %76, i32 1
  store i8* %77, i8** %5, align 8
  store i8 %75, i8* %76, align 1
  %78 = sext i8 %75 to i32
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %82

; <label>:80:                                     ; preds = %72
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 0)
  %81 = add i64 %pgocount6, 1
  store i64 %81, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 0)
  br label %72

; <label>:82:                                     ; preds = %72
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 5)
  %83 = add i64 %pgocount7, 1
  store i64 %83, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 5)
  %84 = load i8*, i8** %5, align 8
  %85 = getelementptr inbounds i8, i8* %84, i32 -1
  store i8* %85, i8** %5, align 8
  br label %86

; <label>:86:                                     ; preds = %82, %28
  br label %12

; <label>:87:                                     ; preds = %23
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 8)
  %88 = add i64 %pgocount8, 1
  store i64 %88, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_ichartostr, i64 0, i64 8)
  %89 = load i8*, i8** %5, align 8
  store i8 0, i8* %89, align 1
  %90 = load i32, i32* %7, align 4
  %91 = icmp sle i32 %90, 0
  %92 = zext i1 %91 to i32
  ret i32 %92
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define i64 @whatcap(i8*) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %5 = load i8*, i8** %3, align 8
  store i8* %5, i8** %4, align 8
  br label %6

; <label>:6:                                      ; preds = %21, %1
  %7 = load i8*, i8** %4, align 8
  %8 = load i8, i8* %7, align 1
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %10, label %24

; <label>:10:                                     ; preds = %6
  %11 = load i8*, i8** %4, align 8
  %12 = load i8, i8* %11, align 1
  %13 = zext i8 %12 to i64
  %14 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 25), i64 0, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 3)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 3)
  br label %24

; <label>:19:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 0)
  br label %21

; <label>:21:                                     ; preds = %19
  %22 = load i8*, i8** %4, align 8
  %23 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %23, i8** %4, align 8
  br label %6

; <label>:24:                                     ; preds = %17, %6
  %25 = load i8*, i8** %4, align 8
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 5)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 5)
  store i64 268435456, i64* %2, align 8
  br label %91

; <label>:31:                                     ; preds = %24
  br label %32

; <label>:32:                                     ; preds = %47, %31
  %33 = load i8*, i8** %4, align 8
  %34 = load i8, i8* %33, align 1
  %35 = icmp ne i8 %34, 0
  br i1 %35, label %36, label %50

; <label>:36:                                     ; preds = %32
  %37 = load i8*, i8** %4, align 8
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i64
  %40 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %39
  %41 = load i8, i8* %40, align 1
  %42 = icmp ne i8 %41, 0
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 6)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 6)
  br label %50

; <label>:45:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 1)
  %46 = add i64 %pgocount4, 1
  store i64 %46, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 1)
  br label %47

; <label>:47:                                     ; preds = %45
  %48 = load i8*, i8** %4, align 8
  %49 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %49, i8** %4, align 8
  br label %32

; <label>:50:                                     ; preds = %43, %32
  %51 = load i8*, i8** %4, align 8
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %89

; <label>:55:                                     ; preds = %50
  %56 = load i8*, i8** %3, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 0
  %58 = load i8, i8* %57, align 1
  %59 = zext i8 %58 to i64
  %60 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %59
  %61 = load i8, i8* %60, align 1
  %62 = icmp ne i8 %61, 0
  br i1 %62, label %63, label %87

; <label>:63:                                     ; preds = %55
  %64 = load i8*, i8** %3, align 8
  %65 = getelementptr inbounds i8, i8* %64, i64 1
  store i8* %65, i8** %4, align 8
  br label %66

; <label>:66:                                     ; preds = %81, %63
  %67 = load i8*, i8** %4, align 8
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %85

; <label>:71:                                     ; preds = %66
  %72 = load i8*, i8** %4, align 8
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i64
  %75 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %74
  %76 = load i8, i8* %75, align 1
  %77 = icmp ne i8 %76, 0
  br i1 %77, label %78, label %80

; <label>:78:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 9)
  %79 = add i64 %pgocount5, 1
  store i64 %79, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 9)
  store i64 805306368, i64* %2, align 8
  br label %91

; <label>:80:                                     ; preds = %71
  br label %81

; <label>:81:                                     ; preds = %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 2)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 2)
  %83 = load i8*, i8** %4, align 8
  %84 = getelementptr inbounds i8, i8* %83, i32 1
  store i8* %84, i8** %4, align 8
  br label %66

; <label>:85:                                     ; preds = %66
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 8)
  %86 = add i64 %pgocount7, 1
  store i64 %86, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 8)
  store i64 536870912, i64* %2, align 8
  br label %91

; <label>:87:                                     ; preds = %55
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 7)
  %88 = add i64 %pgocount8, 1
  store i64 %88, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 7)
  store i64 0, i64* %2, align 8
  br label %91

; <label>:89:                                     ; preds = %50
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 4)
  %90 = add i64 %pgocount9, 1
  store i64 %90, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_whatcap, i64 0, i64 4)
  store i64 805306368, i64* %2, align 8
  br label %91

; <label>:91:                                     ; preds = %89, %87, %85, %78, %29
  %92 = load i64, i64* %2, align 8
  ret i64 %92
}

declare i8* @mymalloc(i32) #3

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #4

; Function Attrs: nounwind uwtable
define void @chupcase(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_chupcase, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_chupcase, i64 0, i64 0)
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = call i8* @strtosichar(i8* %5, i32 1)
  store i8* %6, i8** %4, align 8
  %7 = load i8*, i8** %4, align 8
  call void @upcase(i8* %7)
  %8 = load i8*, i8** %3, align 8
  %9 = load i8*, i8** %4, align 8
  %10 = load i8*, i8** %3, align 8
  %11 = call i64 @strlen(i8* %10) #6
  %12 = add i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = call i32 @ichartostr(i8* %8, i8* %9, i32 %13, i32 1)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @addvheader(%struct.dent*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.dent*, align 8
  %4 = alloca %struct.dent*, align 8
  store %struct.dent* %0, %struct.dent** %3, align 8
  %5 = call i8* @mymalloc(i32 24)
  %6 = bitcast i8* %5 to %struct.dent*
  store %struct.dent* %6, %struct.dent** %4, align 8
  %7 = load %struct.dent*, %struct.dent** %4, align 8
  %8 = icmp eq %struct.dent* %7, null
  br i1 %8, label %9, label %21

; <label>:9:                                      ; preds = %1
  %10 = load i32, i32* @cbench_print, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %19

; <label>:12:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 2)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = load %struct.dent*, %struct.dent** %3, align 8
  %16 = getelementptr inbounds %struct.dent, %struct.dent* %15, i32 0, i32 1
  %17 = load i8*, i8** %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), i8* %17)
  br label %19

; <label>:19:                                     ; preds = %12, %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 0)
  store i32 -1, i32* %2, align 4
  br label %90

; <label>:21:                                     ; preds = %1
  %22 = load %struct.dent*, %struct.dent** %4, align 8
  %23 = load %struct.dent*, %struct.dent** %3, align 8
  %24 = bitcast %struct.dent* %22 to i8*
  %25 = bitcast %struct.dent* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* %25, i64 24, i32 8, i1 false)
  %26 = load %struct.dent*, %struct.dent** %4, align 8
  %27 = getelementptr inbounds %struct.dent, %struct.dent* %26, i32 0, i32 2
  %28 = getelementptr inbounds [1 x i64], [1 x i64]* %27, i64 0, i64 0
  %29 = load i64, i64* %28, align 8
  %30 = and i64 %29, 805306368
  %31 = icmp ne i64 %30, 805306368
  br i1 %31, label %32, label %36

; <label>:32:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 1)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 1)
  %34 = load %struct.dent*, %struct.dent** %4, align 8
  %35 = getelementptr inbounds %struct.dent, %struct.dent* %34, i32 0, i32 1
  store i8* null, i8** %35, align 8
  br label %73

; <label>:36:                                     ; preds = %21
  %37 = load %struct.dent*, %struct.dent** %4, align 8
  %38 = getelementptr inbounds %struct.dent, %struct.dent* %37, i32 0, i32 1
  %39 = load i8*, i8** %38, align 8
  %40 = call i64 @strlen(i8* %39) #6
  %41 = trunc i64 %40 to i32
  %42 = add i32 %41, 1
  %43 = call i8* @mymalloc(i32 %42)
  %44 = load %struct.dent*, %struct.dent** %4, align 8
  %45 = getelementptr inbounds %struct.dent, %struct.dent* %44, i32 0, i32 1
  store i8* %43, i8** %45, align 8
  %46 = load %struct.dent*, %struct.dent** %4, align 8
  %47 = getelementptr inbounds %struct.dent, %struct.dent* %46, i32 0, i32 1
  %48 = load i8*, i8** %47, align 8
  %49 = icmp eq i8* %48, null
  br i1 %49, label %50, label %64

; <label>:50:                                     ; preds = %36
  %51 = load i32, i32* @cbench_print, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %60

; <label>:53:                                     ; preds = %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 5)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 5)
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %56 = load %struct.dent*, %struct.dent** %3, align 8
  %57 = getelementptr inbounds %struct.dent, %struct.dent* %56, i32 0, i32 1
  %58 = load i8*, i8** %57, align 8
  %59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %55, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), i8* %58)
  br label %60

; <label>:60:                                     ; preds = %53, %50
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 4)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 4)
  %62 = load %struct.dent*, %struct.dent** %4, align 8
  %63 = bitcast %struct.dent* %62 to i8*
  call void @myfree(i8* %63)
  store i32 -1, i32* %2, align 4
  br label %90

; <label>:64:                                     ; preds = %36
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 3)
  %65 = add i64 %pgocount5, 1
  store i64 %65, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_addvheader, i64 0, i64 3)
  %66 = load %struct.dent*, %struct.dent** %4, align 8
  %67 = getelementptr inbounds %struct.dent, %struct.dent* %66, i32 0, i32 1
  %68 = load i8*, i8** %67, align 8
  %69 = load %struct.dent*, %struct.dent** %3, align 8
  %70 = getelementptr inbounds %struct.dent, %struct.dent* %69, i32 0, i32 1
  %71 = load i8*, i8** %70, align 8
  %72 = call i8* @strcpy(i8* %68, i8* %71) #5
  br label %73

; <label>:73:                                     ; preds = %64, %32
  %74 = load %struct.dent*, %struct.dent** %3, align 8
  %75 = getelementptr inbounds %struct.dent, %struct.dent* %74, i32 0, i32 1
  %76 = load i8*, i8** %75, align 8
  call void @chupcase(i8* %76)
  %77 = load %struct.dent*, %struct.dent** %4, align 8
  %78 = load %struct.dent*, %struct.dent** %3, align 8
  %79 = getelementptr inbounds %struct.dent, %struct.dent* %78, i32 0, i32 0
  store %struct.dent* %77, %struct.dent** %79, align 8
  %80 = load %struct.dent*, %struct.dent** %3, align 8
  %81 = getelementptr inbounds %struct.dent, %struct.dent* %80, i32 0, i32 2
  %82 = getelementptr inbounds [1 x i64], [1 x i64]* %81, i64 0, i64 0
  %83 = load i64, i64* %82, align 8
  %84 = and i64 %83, -805306369
  store i64 %84, i64* %82, align 8
  %85 = load %struct.dent*, %struct.dent** %3, align 8
  %86 = getelementptr inbounds %struct.dent, %struct.dent* %85, i32 0, i32 2
  %87 = getelementptr inbounds [1 x i64], [1 x i64]* %86, i64 0, i64 0
  %88 = load i64, i64* %87, align 8
  %89 = or i64 %88, 1342177280
  store i64 %89, i64* %87, align 8
  store i32 0, i32* %2, align 4
  br label %90

; <label>:90:                                     ; preds = %73, %60, %19
  %91 = load i32, i32* %2, align 4
  ret i32 %91
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare void @myfree(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @combinecaps(%struct.dent*, %struct.dent*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.dent*, align 8
  %6 = alloca %struct.dent*, align 8
  %7 = alloca %struct.dent*, align 8
  %8 = alloca i32, align 4
  store %struct.dent* %0, %struct.dent** %4, align 8
  store %struct.dent* %1, %struct.dent** %5, align 8
  store i32 0, i32* %8, align 4
  %9 = load %struct.dent*, %struct.dent** %4, align 8
  store %struct.dent* %9, %struct.dent** %6, align 8
  %10 = load %struct.dent*, %struct.dent** %6, align 8
  %11 = getelementptr inbounds %struct.dent, %struct.dent* %10, i32 0, i32 2
  %12 = getelementptr inbounds [1 x i64], [1 x i64]* %11, i64 0, i64 0
  %13 = load i64, i64* %12, align 8
  %14 = and i64 %13, 1879048192
  %15 = icmp eq i64 %14, 1342177280
  br i1 %15, label %16, label %40

; <label>:16:                                     ; preds = %2
  br label %17

; <label>:17:                                     ; preds = %36, %16
  %18 = load %struct.dent*, %struct.dent** %6, align 8
  %19 = getelementptr inbounds %struct.dent, %struct.dent* %18, i32 0, i32 2
  %20 = getelementptr inbounds [1 x i64], [1 x i64]* %19, i64 0, i64 0
  %21 = load i64, i64* %20, align 8
  %22 = and i64 %21, 1073741824
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %38

; <label>:24:                                     ; preds = %17
  %25 = load %struct.dent*, %struct.dent** %6, align 8
  %26 = getelementptr inbounds %struct.dent, %struct.dent* %25, i32 0, i32 0
  %27 = load %struct.dent*, %struct.dent** %26, align 8
  store %struct.dent* %27, %struct.dent** %6, align 8
  %28 = load %struct.dent*, %struct.dent** %4, align 8
  %29 = load %struct.dent*, %struct.dent** %6, align 8
  %30 = load %struct.dent*, %struct.dent** %5, align 8
  %31 = call i32 @combine_two_entries(%struct.dent* %28, %struct.dent* %29, %struct.dent* %30)
  store i32 %31, i32* %8, align 4
  %32 = load i32, i32* %8, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 3)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 3)
  br label %38

; <label>:36:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 0)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 0)
  br label %17

; <label>:38:                                     ; preds = %34, %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 1)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 1)
  br label %46

; <label>:40:                                     ; preds = %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 2)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 2)
  %42 = load %struct.dent*, %struct.dent** %4, align 8
  %43 = load %struct.dent*, %struct.dent** %6, align 8
  %44 = load %struct.dent*, %struct.dent** %5, align 8
  %45 = call i32 @combine_two_entries(%struct.dent* %42, %struct.dent* %43, %struct.dent* %44)
  store i32 %45, i32* %8, align 4
  br label %46

; <label>:46:                                     ; preds = %40, %38
  %47 = load i32, i32* %8, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %130

; <label>:49:                                     ; preds = %46
  %50 = load %struct.dent*, %struct.dent** %4, align 8
  %51 = load %struct.dent*, %struct.dent** %6, align 8
  %52 = load %struct.dent*, %struct.dent** %5, align 8
  call void @forcevheader(%struct.dent* %50, %struct.dent* %51, %struct.dent* %52)
  %53 = call i8* @mymalloc(i32 24)
  %54 = bitcast i8* %53 to %struct.dent*
  store %struct.dent* %54, %struct.dent** %7, align 8
  %55 = load %struct.dent*, %struct.dent** %7, align 8
  %56 = icmp eq %struct.dent* %55, null
  br i1 %56, label %57, label %69

; <label>:57:                                     ; preds = %49
  %58 = load i32, i32* @cbench_print, align 4
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %67

; <label>:60:                                     ; preds = %57
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 7)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 7)
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %63 = load %struct.dent*, %struct.dent** %5, align 8
  %64 = getelementptr inbounds %struct.dent, %struct.dent* %63, i32 0, i32 1
  %65 = load i8*, i8** %64, align 8
  %66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), i8* %65)
  br label %67

; <label>:67:                                     ; preds = %60, %57
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 4)
  %68 = add i64 %pgocount5, 1
  store i64 %68, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 4)
  store i32 -1, i32* %3, align 4
  br label %132

; <label>:69:                                     ; preds = %49
  %70 = load %struct.dent*, %struct.dent** %7, align 8
  %71 = load %struct.dent*, %struct.dent** %5, align 8
  %72 = bitcast %struct.dent* %70 to i8*
  %73 = bitcast %struct.dent* %71 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %72, i8* %73, i64 24, i32 8, i1 false)
  %74 = load %struct.dent*, %struct.dent** %4, align 8
  %75 = getelementptr inbounds %struct.dent, %struct.dent* %74, i32 0, i32 0
  %76 = load %struct.dent*, %struct.dent** %75, align 8
  %77 = load %struct.dent*, %struct.dent** %7, align 8
  %78 = getelementptr inbounds %struct.dent, %struct.dent* %77, i32 0, i32 0
  store %struct.dent* %76, %struct.dent** %78, align 8
  %79 = load %struct.dent*, %struct.dent** %7, align 8
  %80 = load %struct.dent*, %struct.dent** %4, align 8
  %81 = getelementptr inbounds %struct.dent, %struct.dent* %80, i32 0, i32 0
  store %struct.dent* %79, %struct.dent** %81, align 8
  %82 = load %struct.dent*, %struct.dent** %4, align 8
  %83 = getelementptr inbounds %struct.dent, %struct.dent* %82, i32 0, i32 2
  %84 = getelementptr inbounds [1 x i64], [1 x i64]* %83, i64 0, i64 0
  %85 = load i64, i64* %84, align 8
  %86 = and i64 %85, 1073741824
  %87 = load %struct.dent*, %struct.dent** %7, align 8
  %88 = getelementptr inbounds %struct.dent, %struct.dent* %87, i32 0, i32 2
  %89 = getelementptr inbounds [1 x i64], [1 x i64]* %88, i64 0, i64 0
  %90 = load i64, i64* %89, align 8
  %91 = or i64 %90, %86
  store i64 %91, i64* %89, align 8
  %92 = load %struct.dent*, %struct.dent** %4, align 8
  %93 = getelementptr inbounds %struct.dent, %struct.dent* %92, i32 0, i32 2
  %94 = getelementptr inbounds [1 x i64], [1 x i64]* %93, i64 0, i64 0
  %95 = load i64, i64* %94, align 8
  %96 = or i64 %95, 1073741824
  store i64 %96, i64* %94, align 8
  %97 = load %struct.dent*, %struct.dent** %4, align 8
  %98 = load %struct.dent*, %struct.dent** %5, align 8
  call void @combineaffixes(%struct.dent* %97, %struct.dent* %98)
  %99 = load %struct.dent*, %struct.dent** %5, align 8
  %100 = getelementptr inbounds %struct.dent, %struct.dent* %99, i32 0, i32 2
  %101 = getelementptr inbounds [1 x i64], [1 x i64]* %100, i64 0, i64 0
  %102 = load i64, i64* %101, align 8
  %103 = and i64 %102, 134217728
  %104 = load %struct.dent*, %struct.dent** %4, align 8
  %105 = getelementptr inbounds %struct.dent, %struct.dent* %104, i32 0, i32 2
  %106 = getelementptr inbounds [1 x i64], [1 x i64]* %105, i64 0, i64 0
  %107 = load i64, i64* %106, align 8
  %108 = or i64 %107, %103
  store i64 %108, i64* %106, align 8
  %109 = load %struct.dent*, %struct.dent** %5, align 8
  %110 = getelementptr inbounds %struct.dent, %struct.dent* %109, i32 0, i32 2
  %111 = getelementptr inbounds [1 x i64], [1 x i64]* %110, i64 0, i64 0
  %112 = load i64, i64* %111, align 8
  %113 = and i64 %112, 805306368
  %114 = icmp eq i64 %113, 805306368
  br i1 %114, label %115, label %122

; <label>:115:                                    ; preds = %69
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 5)
  %116 = add i64 %pgocount6, 1
  store i64 %116, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 5)
  %117 = load %struct.dent*, %struct.dent** %5, align 8
  %118 = getelementptr inbounds %struct.dent, %struct.dent* %117, i32 0, i32 1
  %119 = load i8*, i8** %118, align 8
  %120 = load %struct.dent*, %struct.dent** %7, align 8
  %121 = getelementptr inbounds %struct.dent, %struct.dent* %120, i32 0, i32 1
  store i8* %119, i8** %121, align 8
  br label %129

; <label>:122:                                    ; preds = %69
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 6)
  %123 = add i64 %pgocount7, 1
  store i64 %123, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_combinecaps, i64 0, i64 6)
  %124 = load %struct.dent*, %struct.dent** %7, align 8
  %125 = getelementptr inbounds %struct.dent, %struct.dent* %124, i32 0, i32 1
  store i8* null, i8** %125, align 8
  %126 = load %struct.dent*, %struct.dent** %5, align 8
  %127 = getelementptr inbounds %struct.dent, %struct.dent* %126, i32 0, i32 1
  %128 = load i8*, i8** %127, align 8
  call void @myfree(i8* %128)
  br label %129

; <label>:129:                                    ; preds = %122, %115
  br label %130

; <label>:130:                                    ; preds = %129, %46
  %131 = load i32, i32* %8, align 4
  store i32 %131, i32* %3, align 4
  br label %132

; <label>:132:                                    ; preds = %130, %67
  %133 = load i32, i32* %3, align 4
  ret i32 %133
}

; Function Attrs: nounwind uwtable
define internal i32 @combine_two_entries(%struct.dent*, %struct.dent*, %struct.dent*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.dent*, align 8
  %6 = alloca %struct.dent*, align 8
  %7 = alloca %struct.dent*, align 8
  store %struct.dent* %0, %struct.dent** %5, align 8
  store %struct.dent* %1, %struct.dent** %6, align 8
  store %struct.dent* %2, %struct.dent** %7, align 8
  %8 = load %struct.dent*, %struct.dent** %6, align 8
  %9 = load %struct.dent*, %struct.dent** %7, align 8
  %10 = call i32 @acoversb(%struct.dent* %8, %struct.dent* %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %39

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 0)
  %14 = load %struct.dent*, %struct.dent** %6, align 8
  %15 = load %struct.dent*, %struct.dent** %7, align 8
  call void @combineaffixes(%struct.dent* %14, %struct.dent* %15)
  %16 = load %struct.dent*, %struct.dent** %7, align 8
  %17 = getelementptr inbounds %struct.dent, %struct.dent* %16, i32 0, i32 2
  %18 = getelementptr inbounds [1 x i64], [1 x i64]* %17, i64 0, i64 0
  %19 = load i64, i64* %18, align 8
  %20 = and i64 %19, 134217728
  %21 = load %struct.dent*, %struct.dent** %6, align 8
  %22 = getelementptr inbounds %struct.dent, %struct.dent* %21, i32 0, i32 2
  %23 = getelementptr inbounds [1 x i64], [1 x i64]* %22, i64 0, i64 0
  %24 = load i64, i64* %23, align 8
  %25 = or i64 %24, %20
  store i64 %25, i64* %23, align 8
  %26 = load %struct.dent*, %struct.dent** %7, align 8
  %27 = getelementptr inbounds %struct.dent, %struct.dent* %26, i32 0, i32 2
  %28 = getelementptr inbounds [1 x i64], [1 x i64]* %27, i64 0, i64 0
  %29 = load i64, i64* %28, align 8
  %30 = and i64 %29, 134217728
  %31 = load %struct.dent*, %struct.dent** %5, align 8
  %32 = getelementptr inbounds %struct.dent, %struct.dent* %31, i32 0, i32 2
  %33 = getelementptr inbounds [1 x i64], [1 x i64]* %32, i64 0, i64 0
  %34 = load i64, i64* %33, align 8
  %35 = or i64 %34, %30
  store i64 %35, i64* %33, align 8
  %36 = load %struct.dent*, %struct.dent** %7, align 8
  %37 = getelementptr inbounds %struct.dent, %struct.dent* %36, i32 0, i32 1
  %38 = load i8*, i8** %37, align 8
  call void @myfree(i8* %38)
  store i32 1, i32* %4, align 4
  br label %120

; <label>:39:                                     ; preds = %3
  %40 = load %struct.dent*, %struct.dent** %7, align 8
  %41 = load %struct.dent*, %struct.dent** %6, align 8
  %42 = call i32 @acoversb(%struct.dent* %40, %struct.dent* %41)
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %118

; <label>:44:                                     ; preds = %39
  %45 = load %struct.dent*, %struct.dent** %7, align 8
  %46 = load %struct.dent*, %struct.dent** %6, align 8
  call void @combineaffixes(%struct.dent* %45, %struct.dent* %46)
  %47 = load %struct.dent*, %struct.dent** %6, align 8
  %48 = getelementptr inbounds %struct.dent, %struct.dent* %47, i32 0, i32 2
  %49 = getelementptr inbounds [1 x i64], [1 x i64]* %48, i64 0, i64 0
  %50 = load i64, i64* %49, align 8
  %51 = and i64 %50, 1207959552
  %52 = load %struct.dent*, %struct.dent** %7, align 8
  %53 = getelementptr inbounds %struct.dent, %struct.dent* %52, i32 0, i32 2
  %54 = getelementptr inbounds [1 x i64], [1 x i64]* %53, i64 0, i64 0
  %55 = load i64, i64* %54, align 8
  %56 = or i64 %55, %51
  store i64 %56, i64* %54, align 8
  %57 = load %struct.dent*, %struct.dent** %7, align 8
  %58 = getelementptr inbounds %struct.dent, %struct.dent* %57, i32 0, i32 2
  %59 = getelementptr inbounds [1 x i64], [1 x i64]* %58, i64 0, i64 0
  %60 = load i64, i64* %59, align 8
  %61 = and i64 %60, 134217728
  %62 = load %struct.dent*, %struct.dent** %5, align 8
  %63 = getelementptr inbounds %struct.dent, %struct.dent* %62, i32 0, i32 2
  %64 = getelementptr inbounds [1 x i64], [1 x i64]* %63, i64 0, i64 0
  %65 = load i64, i64* %64, align 8
  %66 = or i64 %65, %61
  store i64 %66, i64* %64, align 8
  %67 = load %struct.dent*, %struct.dent** %6, align 8
  %68 = getelementptr inbounds %struct.dent, %struct.dent* %67, i32 0, i32 0
  %69 = load %struct.dent*, %struct.dent** %68, align 8
  %70 = load %struct.dent*, %struct.dent** %7, align 8
  %71 = getelementptr inbounds %struct.dent, %struct.dent* %70, i32 0, i32 0
  store %struct.dent* %69, %struct.dent** %71, align 8
  %72 = load %struct.dent*, %struct.dent** %6, align 8
  %73 = getelementptr inbounds %struct.dent, %struct.dent* %72, i32 0, i32 1
  %74 = load i8*, i8** %73, align 8
  %75 = icmp ne i8* %74, null
  br i1 %75, label %76, label %85

; <label>:76:                                     ; preds = %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 2)
  %77 = add i64 %pgocount1, 1
  store i64 %77, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 2)
  %78 = load %struct.dent*, %struct.dent** %6, align 8
  %79 = getelementptr inbounds %struct.dent, %struct.dent* %78, i32 0, i32 1
  %80 = load i8*, i8** %79, align 8
  %81 = load %struct.dent*, %struct.dent** %7, align 8
  %82 = getelementptr inbounds %struct.dent, %struct.dent* %81, i32 0, i32 1
  %83 = load i8*, i8** %82, align 8
  %84 = call i8* @strcpy(i8* %80, i8* %83) #5
  br label %85

; <label>:85:                                     ; preds = %76, %44
  %86 = load %struct.dent*, %struct.dent** %7, align 8
  %87 = getelementptr inbounds %struct.dent, %struct.dent* %86, i32 0, i32 1
  %88 = load i8*, i8** %87, align 8
  call void @myfree(i8* %88)
  %89 = load %struct.dent*, %struct.dent** %6, align 8
  %90 = getelementptr inbounds %struct.dent, %struct.dent* %89, i32 0, i32 1
  %91 = load i8*, i8** %90, align 8
  %92 = load %struct.dent*, %struct.dent** %7, align 8
  %93 = getelementptr inbounds %struct.dent, %struct.dent* %92, i32 0, i32 1
  store i8* %91, i8** %93, align 8
  %94 = load %struct.dent*, %struct.dent** %6, align 8
  %95 = load %struct.dent*, %struct.dent** %7, align 8
  %96 = bitcast %struct.dent* %94 to i8*
  %97 = bitcast %struct.dent* %95 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %96, i8* %97, i64 24, i32 8, i1 false)
  %98 = load %struct.dent*, %struct.dent** %7, align 8
  %99 = getelementptr inbounds %struct.dent, %struct.dent* %98, i32 0, i32 2
  %100 = getelementptr inbounds [1 x i64], [1 x i64]* %99, i64 0, i64 0
  %101 = load i64, i64* %100, align 8
  %102 = and i64 %101, 805306368
  %103 = icmp eq i64 %102, 805306368
  br i1 %103, label %104, label %116

; <label>:104:                                    ; preds = %85
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 4)
  %105 = add i64 %pgocount2, 1
  store i64 %105, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 4)
  %106 = load %struct.dent*, %struct.dent** %5, align 8
  %107 = getelementptr inbounds %struct.dent, %struct.dent* %106, i32 0, i32 2
  %108 = getelementptr inbounds [1 x i64], [1 x i64]* %107, i64 0, i64 0
  %109 = load i64, i64* %108, align 8
  %110 = and i64 %109, 1879048192
  %111 = icmp ne i64 %110, 1342177280
  br i1 %111, label %112, label %116

; <label>:112:                                    ; preds = %104
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 5)
  %113 = add i64 %pgocount3, 1
  store i64 %113, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 5)
  %114 = load %struct.dent*, %struct.dent** %5, align 8
  %115 = call i32 @addvheader(%struct.dent* %114)
  br label %116

; <label>:116:                                    ; preds = %112, %104, %85
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 1)
  %117 = add i64 %pgocount4, 1
  store i64 %117, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 1)
  store i32 1, i32* %4, align 4
  br label %120

; <label>:118:                                    ; preds = %39
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 3)
  %119 = add i64 %pgocount5, 1
  store i64 %119, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_combine_two_entries, i64 0, i64 3)
  store i32 0, i32* %4, align 4
  br label %120

; <label>:120:                                    ; preds = %118, %116, %12
  %121 = load i32, i32* %4, align 4
  ret i32 %121
}

; Function Attrs: nounwind uwtable
define internal void @forcevheader(%struct.dent*, %struct.dent*, %struct.dent*) #0 {
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.dent*, align 8
  %6 = alloca %struct.dent*, align 8
  store %struct.dent* %0, %struct.dent** %4, align 8
  store %struct.dent* %1, %struct.dent** %5, align 8
  store %struct.dent* %2, %struct.dent** %6, align 8
  %7 = load %struct.dent*, %struct.dent** %4, align 8
  %8 = getelementptr inbounds %struct.dent, %struct.dent* %7, i32 0, i32 2
  %9 = getelementptr inbounds [1 x i64], [1 x i64]* %8, i64 0, i64 0
  %10 = load i64, i64* %9, align 8
  %11 = and i64 %10, 1879048192
  %12 = icmp eq i64 %11, 268435456
  br i1 %12, label %13, label %28

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forcevheader, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forcevheader, i64 0, i64 1)
  %15 = load %struct.dent*, %struct.dent** %5, align 8
  %16 = getelementptr inbounds %struct.dent, %struct.dent* %15, i32 0, i32 2
  %17 = getelementptr inbounds [1 x i64], [1 x i64]* %16, i64 0, i64 0
  %18 = load i64, i64* %17, align 8
  %19 = load %struct.dent*, %struct.dent** %6, align 8
  %20 = getelementptr inbounds %struct.dent, %struct.dent* %19, i32 0, i32 2
  %21 = getelementptr inbounds [1 x i64], [1 x i64]* %20, i64 0, i64 0
  %22 = load i64, i64* %21, align 8
  %23 = xor i64 %18, %22
  %24 = and i64 %23, 134217728
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forcevheader, i64 0, i64 3)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forcevheader, i64 0, i64 3)
  br label %41

; <label>:28:                                     ; preds = %13, %3
  %29 = load %struct.dent*, %struct.dent** %4, align 8
  %30 = getelementptr inbounds %struct.dent, %struct.dent* %29, i32 0, i32 2
  %31 = getelementptr inbounds [1 x i64], [1 x i64]* %30, i64 0, i64 0
  %32 = load i64, i64* %31, align 8
  %33 = and i64 %32, 1879048192
  %34 = icmp ne i64 %33, 1342177280
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forcevheader, i64 0, i64 2)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forcevheader, i64 0, i64 2)
  %37 = load %struct.dent*, %struct.dent** %4, align 8
  %38 = call i32 @addvheader(%struct.dent* %37)
  br label %39

; <label>:39:                                     ; preds = %35, %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forcevheader, i64 0, i64 0)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forcevheader, i64 0, i64 0)
  br label %41

; <label>:41:                                     ; preds = %39, %26
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @combineaffixes(%struct.dent*, %struct.dent*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_combineaffixes, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_combineaffixes, i64 0, i64 0)
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.dent*, align 8
  store %struct.dent* %0, %struct.dent** %4, align 8
  store %struct.dent* %1, %struct.dent** %5, align 8
  %6 = load %struct.dent*, %struct.dent** %5, align 8
  %7 = getelementptr inbounds %struct.dent, %struct.dent* %6, i32 0, i32 2
  %8 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i64 0, i64 0
  %9 = load i64, i64* %8, align 8
  %10 = and i64 %9, -2080374785
  %11 = load %struct.dent*, %struct.dent** %4, align 8
  %12 = getelementptr inbounds %struct.dent, %struct.dent* %11, i32 0, i32 2
  %13 = getelementptr inbounds [1 x i64], [1 x i64]* %12, i64 0, i64 0
  %14 = load i64, i64* %13, align 8
  %15 = or i64 %14, %10
  store i64 %15, i64* %13, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @upcase(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  br label %3

; <label>:3:                                      ; preds = %7, %1
  %4 = load i8*, i8** %2, align 8
  %5 = load i8, i8* %4, align 1
  %6 = icmp ne i8 %5, 0
  br i1 %6, label %7, label %17

; <label>:7:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_upcase, i64 0, i64 0)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_upcase, i64 0, i64 0)
  %9 = load i8*, i8** %2, align 8
  %10 = load i8, i8* %9, align 1
  %11 = zext i8 %10 to i64
  %12 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 22), i64 0, i64 %11
  %13 = load i8, i8* %12, align 1
  %14 = load i8*, i8** %2, align 8
  store i8 %13, i8* %14, align 1
  %15 = load i8*, i8** %2, align 8
  %16 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %16, i8** %2, align 8
  br label %3

; <label>:17:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_upcase, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_upcase, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define void @lowcase(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  br label %3

; <label>:3:                                      ; preds = %7, %1
  %4 = load i8*, i8** %2, align 8
  %5 = load i8, i8* %4, align 1
  %6 = icmp ne i8 %5, 0
  br i1 %6, label %7, label %17

; <label>:7:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_lowcase, i64 0, i64 0)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_lowcase, i64 0, i64 0)
  %9 = load i8*, i8** %2, align 8
  %10 = load i8, i8* %9, align 1
  %11 = zext i8 %10 to i64
  %12 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 21), i64 0, i64 %11
  %13 = load i8, i8* %12, align 1
  %14 = load i8*, i8** %2, align 8
  store i8 %13, i8* %14, align 1
  %15 = load i8*, i8** %2, align 8
  %16 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %16, i8** %2, align 8
  br label %3

; <label>:17:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_lowcase, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_lowcase, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define i8* @strtosichar(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i8*, i8** %3, align 8
  %6 = load i32, i32* %4, align 4
  %7 = call i32 @strtoichar(i8* getelementptr inbounds ([184 x i8], [184 x i8]* @strtosichar.out, i32 0, i32 0), i8* %5, i32 184, i32 %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %19

; <label>:9:                                      ; preds = %2
  %10 = load i32, i32* @cbench_print, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_strtosichar, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_strtosichar, i64 0, i64 2)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = load i8*, i8** %3, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i8* %15, i32 942, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %17

; <label>:17:                                     ; preds = %12, %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_strtosichar, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_strtosichar, i64 0, i64 1)
  br label %19

; <label>:19:                                     ; preds = %17, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_strtosichar, i64 0, i64 0)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_strtosichar, i64 0, i64 0)
  ret i8* getelementptr inbounds ([184 x i8], [184 x i8]* @strtosichar.out, i32 0, i32 0)
}

; Function Attrs: nounwind uwtable
define void @toutent(%struct._IO_FILE*, %struct.dent*, i32) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca %struct.dent*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.dent*, align 8
  %8 = alloca [120 x i8], align 16
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store %struct.dent* %1, %struct.dent** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.dent*, %struct.dent** %5, align 8
  store %struct.dent* %9, %struct.dent** %7, align 8
  %10 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %11 = load %struct.dent*, %struct.dent** %7, align 8
  %12 = getelementptr inbounds %struct.dent, %struct.dent* %11, i32 0, i32 1
  %13 = load i8*, i8** %12, align 8
  %14 = call i32 @strtoichar(i8* %10, i8* %13, i32 100, i32 1)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %28

; <label>:16:                                     ; preds = %3
  %17 = load i32, i32* @cbench_print, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %26

; <label>:19:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 11)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 11)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = load %struct.dent*, %struct.dent** %7, align 8
  %23 = getelementptr inbounds %struct.dent, %struct.dent* %22, i32 0, i32 1
  %24 = load i8*, i8** %23, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i8* %24, i32 698, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %26

; <label>:26:                                     ; preds = %19, %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 10)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 10)
  br label %28

; <label>:28:                                     ; preds = %26, %3
  br label %29

; <label>:29:                                     ; preds = %108, %28
  %30 = load i32, i32* %6, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %40

; <label>:32:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 2)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 2)
  %34 = load %struct.dent*, %struct.dent** %7, align 8
  %35 = getelementptr inbounds %struct.dent, %struct.dent* %34, i32 0, i32 2
  %36 = getelementptr inbounds [1 x i64], [1 x i64]* %35, i64 0, i64 0
  %37 = load i64, i64* %36, align 8
  %38 = and i64 %37, 134217728
  %39 = icmp ne i64 %38, 0
  br i1 %39, label %40, label %96

; <label>:40:                                     ; preds = %32, %29
  %41 = load %struct.dent*, %struct.dent** %7, align 8
  %42 = getelementptr inbounds %struct.dent, %struct.dent* %41, i32 0, i32 2
  %43 = getelementptr inbounds [1 x i64], [1 x i64]* %42, i64 0, i64 0
  %44 = load i64, i64* %43, align 8
  %45 = and i64 %44, 805306368
  switch i64 %45, label %94 [
    i64 0, label %46
    i64 268435456, label %53
    i64 536870912, label %74
    i64 805306368, label %87
  ]

; <label>:46:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 3)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 3)
  %48 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  call void @lowcase(i8* %48)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %50 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %51 = call i8* @ichartosstr(i8* %50, i32 1)
  %52 = load %struct.dent*, %struct.dent** %7, align 8
  call void @toutword(%struct._IO_FILE* %49, i8* %51, %struct.dent* %52)
  br label %94

; <label>:53:                                     ; preds = %40
  %54 = load %struct.dent*, %struct.dent** %7, align 8
  %55 = getelementptr inbounds %struct.dent, %struct.dent* %54, i32 0, i32 2
  %56 = getelementptr inbounds [1 x i64], [1 x i64]* %55, i64 0, i64 0
  %57 = load i64, i64* %56, align 8
  %58 = and i64 %57, 1073741824
  %59 = icmp eq i64 %58, 0
  br i1 %59, label %65, label %60

; <label>:60:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 8)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 8)
  %62 = load %struct.dent*, %struct.dent** %7, align 8
  %63 = load %struct.dent*, %struct.dent** %5, align 8
  %64 = icmp ne %struct.dent* %62, %63
  br i1 %64, label %65, label %72

; <label>:65:                                     ; preds = %60, %53
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 7)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 7)
  %67 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  call void @upcase(i8* %67)
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %69 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %70 = call i8* @ichartosstr(i8* %69, i32 1)
  %71 = load %struct.dent*, %struct.dent** %7, align 8
  call void @toutword(%struct._IO_FILE* %68, i8* %70, %struct.dent* %71)
  br label %72

; <label>:72:                                     ; preds = %65, %60
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 4)
  %73 = add i64 %pgocount6, 1
  store i64 %73, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 4)
  br label %94

; <label>:74:                                     ; preds = %40
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 5)
  %75 = add i64 %pgocount7, 1
  store i64 %75, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 5)
  %76 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  call void @lowcase(i8* %76)
  %77 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i64 0, i64 0
  %78 = load i8, i8* %77, align 16
  %79 = zext i8 %78 to i64
  %80 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 22), i64 0, i64 %79
  %81 = load i8, i8* %80, align 1
  %82 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i64 0, i64 0
  store i8 %81, i8* %82, align 16
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %84 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %85 = call i8* @ichartosstr(i8* %84, i32 1)
  %86 = load %struct.dent*, %struct.dent** %7, align 8
  call void @toutword(%struct._IO_FILE* %83, i8* %85, %struct.dent* %86)
  br label %94

; <label>:87:                                     ; preds = %40
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 6)
  %88 = add i64 %pgocount8, 1
  store i64 %88, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 6)
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %90 = load %struct.dent*, %struct.dent** %7, align 8
  %91 = getelementptr inbounds %struct.dent, %struct.dent* %90, i32 0, i32 1
  %92 = load i8*, i8** %91, align 8
  %93 = load %struct.dent*, %struct.dent** %7, align 8
  call void @toutword(%struct._IO_FILE* %89, i8* %92, %struct.dent* %93)
  br label %94

; <label>:94:                                     ; preds = %87, %74, %72, %46, %40
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 1)
  %95 = add i64 %pgocount9, 1
  store i64 %95, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 1)
  br label %96

; <label>:96:                                     ; preds = %94, %32
  %97 = load %struct.dent*, %struct.dent** %7, align 8
  %98 = getelementptr inbounds %struct.dent, %struct.dent* %97, i32 0, i32 2
  %99 = getelementptr inbounds [1 x i64], [1 x i64]* %98, i64 0, i64 0
  %100 = load i64, i64* %99, align 8
  %101 = and i64 %100, 1073741824
  %102 = icmp ne i64 %101, 0
  br i1 %102, label %103, label %107

; <label>:103:                                    ; preds = %96
  %104 = load %struct.dent*, %struct.dent** %7, align 8
  %105 = getelementptr inbounds %struct.dent, %struct.dent* %104, i32 0, i32 0
  %106 = load %struct.dent*, %struct.dent** %105, align 8
  store %struct.dent* %106, %struct.dent** %7, align 8
  br label %108

; <label>:107:                                    ; preds = %96
  br label %110

; <label>:108:                                    ; preds = %103
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 0)
  %109 = add i64 %pgocount10, 1
  store i64 %109, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 0)
  br label %29

; <label>:110:                                    ; preds = %107
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 9)
  %111 = add i64 %pgocount11, 1
  store i64 %111, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_toutent, i64 0, i64 9)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @toutword(%struct._IO_FILE*, i8*, %struct.dent*) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.dent*, align 8
  %7 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i8* %1, i8** %5, align 8
  store %struct.dent* %2, %struct.dent** %6, align 8
  store i32 0, i32* @has_marker, align 4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %9 = load i8*, i8** %5, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* %9)
  store i32 0, i32* %7, align 4
  br label %11

; <label>:11:                                     ; preds = %30, %3
  %12 = load i32, i32* %7, align 4
  %13 = icmp slt i32 %12, 26
  br i1 %13, label %14, label %34

; <label>:14:                                     ; preds = %11
  %15 = load %struct.dent*, %struct.dent** %6, align 8
  %16 = getelementptr inbounds %struct.dent, %struct.dent* %15, i32 0, i32 2
  %17 = getelementptr inbounds [1 x i64], [1 x i64]* %16, i64 0, i64 0
  %18 = load i64, i64* %17, align 8
  %19 = load i32, i32* %7, align 4
  %20 = zext i32 %19 to i64
  %21 = shl i64 1, %20
  %22 = and i64 %18, %21
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %29

; <label>:24:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_toutword, i64 0, i64 1)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_toutword, i64 0, i64 1)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %27 = load i32, i32* %7, align 4
  %28 = add nsw i32 %27, 65
  call void @flagout(%struct._IO_FILE* %26, i32 %28)
  br label %29

; <label>:29:                                     ; preds = %24, %14
  br label %30

; <label>:30:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_toutword, i64 0, i64 0)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_toutword, i64 0, i64 0)
  %32 = load i32, i32* %7, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %7, align 4
  br label %11

; <label>:34:                                     ; preds = %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_toutword, i64 0, i64 2)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_toutword, i64 0, i64 2)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define i8* @ichartosstr(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i8*, i8** %3, align 8
  %6 = load i32, i32* %4, align 4
  %7 = call i32 @ichartostr(i8* getelementptr inbounds ([184 x i8], [184 x i8]* @ichartosstr.out, i32 0, i32 0), i8* %5, i32 184, i32 %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %18

; <label>:9:                                      ; preds = %2
  %10 = load i32, i32* @cbench_print, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ichartosstr, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ichartosstr, i64 0, i64 2)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([184 x i8], [184 x i8]* @ichartosstr.out, i32 0, i32 0), i32 956, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %16

; <label>:16:                                     ; preds = %12, %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ichartosstr, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ichartosstr, i64 0, i64 1)
  br label %18

; <label>:18:                                     ; preds = %16, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ichartosstr, i64 0, i64 0)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ichartosstr, i64 0, i64 0)
  ret i8* getelementptr inbounds ([184 x i8], [184 x i8]* @ichartosstr.out, i32 0, i32 0)
}

; Function Attrs: nounwind uwtable
define i32 @stringcharlen(i8*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 0, i32* %9, align 4
  %12 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 12), align 4
  %13 = sub nsw i32 %12, 1
  store i32 %13, i32* %10, align 4
  %14 = load i32, i32* %5, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 7)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 7)
  br label %21

; <label>:18:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 8)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 8)
  %20 = load i32, i32* @defdupchar, align 4
  br label %21

; <label>:21:                                     ; preds = %18, %16
  %22 = phi i32 [ 0, %16 ], [ %20, %18 ]
  store i32 %22, i32* %11, align 4
  br label %23

; <label>:23:                                     ; preds = %136, %21
  %24 = load i32, i32* %9, align 4
  %25 = load i32, i32* %10, align 4
  %26 = icmp sle i32 %24, %25
  br i1 %26, label %27, label %137

; <label>:27:                                     ; preds = %23
  %28 = load i32, i32* %9, align 4
  %29 = load i32, i32* %10, align 4
  %30 = add nsw i32 %28, %29
  %31 = ashr i32 %30, 1
  store i32 %31, i32* %8, align 4
  %32 = load i32, i32* %8, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [100 x [11 x i8]], [100 x [11 x i8]]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 28), i64 0, i64 %33
  %35 = getelementptr inbounds [11 x i8], [11 x i8]* %34, i64 0, i64 0
  store i8* %35, i8** %7, align 8
  %36 = load i8*, i8** %4, align 8
  store i8* %36, i8** %6, align 8
  br label %37

; <label>:37:                                     ; preds = %54, %27
  %38 = load i8*, i8** %7, align 8
  %39 = load i8, i8* %38, align 1
  %40 = icmp ne i8 %39, 0
  br i1 %40, label %41, label %58

; <label>:41:                                     ; preds = %37
  %42 = load i8*, i8** %6, align 8
  %43 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %43, i8** %6, align 8
  %44 = load i8, i8* %42, align 1
  %45 = sext i8 %44 to i32
  %46 = load i8*, i8** %7, align 8
  %47 = load i8, i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = xor i32 %45, %48
  %50 = and i32 %49, 127
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %54

; <label>:52:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 2)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 2)
  br label %58

; <label>:54:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 0)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 0)
  %56 = load i8*, i8** %7, align 8
  %57 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %57, i8** %7, align 8
  br label %37

; <label>:58:                                     ; preds = %52, %37
  %59 = load i8*, i8** %7, align 8
  %60 = load i8, i8* %59, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %90

; <label>:63:                                     ; preds = %58
  %64 = load i32, i32* %8, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [100 x i32], [100 x i32]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 30), i64 0, i64 %65
  %67 = load i32, i32* %66, align 4
  %68 = load i32, i32* %11, align 4
  %69 = icmp eq i32 %67, %68
  br i1 %69, label %70, label %85

; <label>:70:                                     ; preds = %63
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 9)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 9)
  %72 = load i32, i32* %8, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [100 x i32], [100 x i32]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 29), i64 0, i64 %73
  %75 = load i32, i32* %74, align 4
  store i32 %75, i32* @laststringch, align 4
  %76 = load i8*, i8** %7, align 8
  %77 = load i32, i32* %8, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [100 x [11 x i8]], [100 x [11 x i8]]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 28), i64 0, i64 %78
  %80 = getelementptr inbounds [11 x i8], [11 x i8]* %79, i64 0, i64 0
  %81 = ptrtoint i8* %76 to i64
  %82 = ptrtoint i8* %80 to i64
  %83 = sub i64 %81, %82
  %84 = trunc i64 %83 to i32
  store i32 %84, i32* %3, align 4
  br label %138

; <label>:85:                                     ; preds = %63
  %86 = load i8*, i8** %7, align 8
  %87 = getelementptr inbounds i8, i8* %86, i32 -1
  store i8* %87, i8** %7, align 8
  br label %88

; <label>:88:                                     ; preds = %85
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 3)
  %89 = add i64 %pgocount5, 1
  store i64 %89, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 3)
  br label %90

; <label>:90:                                     ; preds = %88, %58
  %91 = load i8*, i8** %6, align 8
  %92 = getelementptr inbounds i8, i8* %91, i32 -1
  store i8* %92, i8** %6, align 8
  %93 = load i8, i8* %92, align 1
  %94 = sext i8 %93 to i32
  %95 = and i32 %94, 127
  %96 = load i8*, i8** %7, align 8
  %97 = load i8, i8* %96, align 1
  %98 = sext i8 %97 to i32
  %99 = and i32 %98, 127
  %100 = icmp slt i32 %95, %99
  br i1 %100, label %101, label %105

; <label>:101:                                    ; preds = %90
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 1)
  %102 = add i64 %pgocount6, 1
  store i64 %102, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 1)
  %103 = load i32, i32* %8, align 4
  %104 = sub nsw i32 %103, 1
  store i32 %104, i32* %10, align 4
  br label %136

; <label>:105:                                    ; preds = %90
  %106 = load i8*, i8** %6, align 8
  %107 = load i8, i8* %106, align 1
  %108 = sext i8 %107 to i32
  %109 = and i32 %108, 127
  %110 = load i8*, i8** %7, align 8
  %111 = load i8, i8* %110, align 1
  %112 = sext i8 %111 to i32
  %113 = and i32 %112, 127
  %114 = icmp sgt i32 %109, %113
  br i1 %114, label %115, label %119

; <label>:115:                                    ; preds = %105
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 4)
  %116 = add i64 %pgocount7, 1
  store i64 %116, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 4)
  %117 = load i32, i32* %8, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %9, align 4
  br label %135

; <label>:119:                                    ; preds = %105
  %120 = load i32, i32* %11, align 4
  %121 = load i32, i32* %8, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [100 x i32], [100 x i32]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 30), i64 0, i64 %122
  %124 = load i32, i32* %123, align 4
  %125 = icmp slt i32 %120, %124
  br i1 %125, label %126, label %130

; <label>:126:                                    ; preds = %119
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 5)
  %127 = add i64 %pgocount8, 1
  store i64 %127, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 5)
  %128 = load i32, i32* %8, align 4
  %129 = sub nsw i32 %128, 1
  store i32 %129, i32* %10, align 4
  br label %134

; <label>:130:                                    ; preds = %119
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 6)
  %131 = add i64 %pgocount9, 1
  store i64 %131, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_stringcharlen, i64 0, i64 6)
  %132 = load i32, i32* %8, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %9, align 4
  br label %134

; <label>:134:                                    ; preds = %130, %126
  br label %135

; <label>:135:                                    ; preds = %134, %115
  br label %136

; <label>:136:                                    ; preds = %135, %101
  br label %23

; <label>:137:                                    ; preds = %23
  store i32 -1, i32* @laststringch, align 4
  store i32 0, i32* %3, align 4
  br label %138

; <label>:138:                                    ; preds = %137, %70
  %139 = load i32, i32* %3, align 4
  ret i32 %139
}

; Function Attrs: nounwind uwtable
define i8* @printichar(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp slt i32 %3, 128
  br i1 %4, label %5, label %9

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_printichar, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_printichar, i64 0, i64 0)
  %7 = load i32, i32* %2, align 4
  %8 = trunc i32 %7 to i8
  store i8 %8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @printichar.out, i64 0, i64 0), align 1
  store i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @printichar.out, i64 0, i64 1), align 1
  br label %17

; <label>:9:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_printichar, i64 0, i64 1)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_printichar, i64 0, i64 1)
  %11 = load i32, i32* %2, align 4
  %12 = sub i32 %11, 128
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds [100 x [11 x i8]], [100 x [11 x i8]]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 28), i64 0, i64 %13
  %15 = getelementptr inbounds [11 x i8], [11 x i8]* %14, i32 0, i32 0
  %16 = call i8* @strcpy(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @printichar.out, i32 0, i32 0), i8* %15) #5
  br label %17

; <label>:17:                                     ; preds = %9, %5
  ret i8* getelementptr inbounds ([11 x i8], [11 x i8]* @printichar.out, i32 0, i32 0)
}

; Function Attrs: nounwind uwtable
define i32 @findfiletype(i8*, i32, i32*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32* %2, i32** %7, align 8
  %12 = load i8*, i8** %5, align 8
  %13 = call i64 @strlen(i8* %12) #6
  %14 = trunc i64 %13 to i32
  store i32 %14, i32* %11, align 4
  %15 = load i32, i32* %6, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %57

; <label>:17:                                     ; preds = %3
  store i32 0, i32* %10, align 4
  br label %18

; <label>:18:                                     ; preds = %52, %17
  %19 = load i32, i32* %10, align 4
  %20 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 13), align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %55

; <label>:22:                                     ; preds = %18
  %23 = load i8*, i8** %5, align 8
  %24 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %25 = load i32, i32* %10, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %24, i64 %26
  %28 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %27, i32 0, i32 0
  %29 = load i8*, i8** %28, align 8
  %30 = call i32 @strcmp(i8* %23, i8* %29) #6
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %50

; <label>:32:                                     ; preds = %22
  %33 = load i32*, i32** %7, align 8
  %34 = icmp ne i32* %33, null
  br i1 %34, label %35, label %47

; <label>:35:                                     ; preds = %32
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 8)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 8)
  %37 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %38 = load i32, i32* %10, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %37, i64 %39
  %41 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %40, i32 0, i32 1
  %42 = load i8*, i8** %41, align 8
  %43 = call i32 @strcmp(i8* %42, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0)) #6
  %44 = icmp eq i32 %43, 0
  %45 = zext i1 %44 to i32
  %46 = load i32*, i32** %7, align 8
  store i32 %45, i32* %46, align 4
  br label %47

; <label>:47:                                     ; preds = %35, %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 7)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 7)
  %49 = load i32, i32* %10, align 4
  store i32 %49, i32* %4, align 4
  br label %125

; <label>:50:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 2)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 2)
  br label %52

; <label>:52:                                     ; preds = %50
  %53 = load i32, i32* %10, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %10, align 4
  br label %18

; <label>:55:                                     ; preds = %18
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 6)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 6)
  br label %57

; <label>:57:                                     ; preds = %55, %3
  store i32 0, i32* %10, align 4
  br label %58

; <label>:58:                                     ; preds = %119, %57
  %59 = load i32, i32* %10, align 4
  %60 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 13), align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %123

; <label>:62:                                     ; preds = %58
  %63 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %64 = load i32, i32* %10, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %63, i64 %65
  %67 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %66, i32 0, i32 2
  %68 = load i8*, i8** %67, align 8
  store i8* %68, i8** %8, align 8
  br label %69

; <label>:69:                                     ; preds = %111, %62
  %70 = load i8*, i8** %8, align 8
  %71 = load i8, i8* %70, align 1
  %72 = sext i8 %71 to i32
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %118

; <label>:74:                                     ; preds = %69
  %75 = load i8*, i8** %8, align 8
  %76 = call i64 @strlen(i8* %75) #6
  %77 = trunc i64 %76 to i32
  store i32 %77, i32* %9, align 4
  %78 = load i32, i32* %11, align 4
  %79 = load i32, i32* %9, align 4
  %80 = icmp sge i32 %78, %79
  br i1 %80, label %81, label %110

; <label>:81:                                     ; preds = %74
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 1)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 1)
  %83 = load i8*, i8** %5, align 8
  %84 = load i32, i32* %11, align 4
  %85 = load i32, i32* %9, align 4
  %86 = sub nsw i32 %84, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i8, i8* %83, i64 %87
  %89 = load i8*, i8** %8, align 8
  %90 = call i32 @strcmp(i8* %88, i8* %89) #6
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %110

; <label>:92:                                     ; preds = %81
  %93 = load i32*, i32** %7, align 8
  %94 = icmp ne i32* %93, null
  br i1 %94, label %95, label %107

; <label>:95:                                     ; preds = %92
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 5)
  %96 = add i64 %pgocount5, 1
  store i64 %96, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 5)
  %97 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %98 = load i32, i32* %10, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %97, i64 %99
  %101 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %100, i32 0, i32 1
  %102 = load i8*, i8** %101, align 8
  %103 = call i32 @strcmp(i8* %102, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0)) #6
  %104 = icmp eq i32 %103, 0
  %105 = zext i1 %104 to i32
  %106 = load i32*, i32** %7, align 8
  store i32 %105, i32* %106, align 4
  br label %107

; <label>:107:                                    ; preds = %95, %92
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 4)
  %108 = add i64 %pgocount6, 1
  store i64 %108, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 4)
  %109 = load i32, i32* %10, align 4
  store i32 %109, i32* %4, align 4
  br label %125

; <label>:110:                                    ; preds = %81, %74
  br label %111

; <label>:111:                                    ; preds = %110
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 0)
  %112 = add i64 %pgocount7, 1
  store i64 %112, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 0)
  %113 = load i32, i32* %9, align 4
  %114 = add nsw i32 %113, 1
  %115 = load i8*, i8** %8, align 8
  %116 = sext i32 %114 to i64
  %117 = getelementptr inbounds i8, i8* %115, i64 %116
  store i8* %117, i8** %8, align 8
  br label %69

; <label>:118:                                    ; preds = %69
  br label %119

; <label>:119:                                    ; preds = %118
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 3)
  %120 = add i64 %pgocount8, 1
  store i64 %120, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 3)
  %121 = load i32, i32* %10, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, i32* %10, align 4
  br label %58

; <label>:123:                                    ; preds = %58
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 9)
  %124 = add i64 %pgocount9, 1
  store i64 %124, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_findfiletype, i64 0, i64 9)
  store i32 -1, i32* %4, align 4
  br label %125

; <label>:125:                                    ; preds = %123, %107, %47
  %126 = load i32, i32* %4, align 4
  ret i32 %126
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define internal i32 @acoversb(%struct.dent*, %struct.dent*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.dent*, align 8
  %6 = alloca i32, align 4
  store %struct.dent* %0, %struct.dent** %4, align 8
  store %struct.dent* %1, %struct.dent** %5, align 8
  %7 = load %struct.dent*, %struct.dent** %5, align 8
  %8 = load %struct.dent*, %struct.dent** %4, align 8
  %9 = call i32 @issubset(%struct.dent* %7, %struct.dent* %8)
  store i32 %9, i32* %6, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %34

; <label>:11:                                     ; preds = %2
  %12 = load %struct.dent*, %struct.dent** %4, align 8
  %13 = getelementptr inbounds %struct.dent, %struct.dent* %12, i32 0, i32 2
  %14 = getelementptr inbounds [1 x i64], [1 x i64]* %13, i64 0, i64 0
  %15 = load i64, i64* %14, align 8
  %16 = load %struct.dent*, %struct.dent** %5, align 8
  %17 = getelementptr inbounds %struct.dent, %struct.dent* %16, i32 0, i32 2
  %18 = getelementptr inbounds [1 x i64], [1 x i64]* %17, i64 0, i64 0
  %19 = load i64, i64* %18, align 8
  %20 = xor i64 %15, %19
  %21 = and i64 %20, 134217728
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %33

; <label>:23:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 0)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 0)
  %25 = load %struct.dent*, %struct.dent** %4, align 8
  %26 = getelementptr inbounds %struct.dent, %struct.dent* %25, i32 0, i32 2
  %27 = getelementptr inbounds [1 x i64], [1 x i64]* %26, i64 0, i64 0
  %28 = load i64, i64* %27, align 8
  %29 = and i64 %28, 134217728
  %30 = icmp eq i64 %29, 0
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 4)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 4)
  store i32 0, i32* %3, align 4
  br label %116

; <label>:33:                                     ; preds = %23, %11
  br label %50

; <label>:34:                                     ; preds = %2
  %35 = load %struct.dent*, %struct.dent** %4, align 8
  %36 = getelementptr inbounds %struct.dent, %struct.dent* %35, i32 0, i32 2
  %37 = getelementptr inbounds [1 x i64], [1 x i64]* %36, i64 0, i64 0
  %38 = load i64, i64* %37, align 8
  %39 = load %struct.dent*, %struct.dent** %5, align 8
  %40 = getelementptr inbounds %struct.dent, %struct.dent* %39, i32 0, i32 2
  %41 = getelementptr inbounds [1 x i64], [1 x i64]* %40, i64 0, i64 0
  %42 = load i64, i64* %41, align 8
  %43 = xor i64 %38, %42
  %44 = and i64 %43, 134217728
  %45 = icmp ne i64 %44, 0
  br i1 %45, label %46, label %48

; <label>:46:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 1)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 1)
  store i32 0, i32* %3, align 4
  br label %116

; <label>:48:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 2)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 2)
  br label %50

; <label>:50:                                     ; preds = %48, %33
  %51 = load %struct.dent*, %struct.dent** %4, align 8
  %52 = getelementptr inbounds %struct.dent, %struct.dent* %51, i32 0, i32 2
  %53 = getelementptr inbounds [1 x i64], [1 x i64]* %52, i64 0, i64 0
  %54 = load i64, i64* %53, align 8
  %55 = load %struct.dent*, %struct.dent** %5, align 8
  %56 = getelementptr inbounds %struct.dent, %struct.dent* %55, i32 0, i32 2
  %57 = getelementptr inbounds [1 x i64], [1 x i64]* %56, i64 0, i64 0
  %58 = load i64, i64* %57, align 8
  %59 = xor i64 %54, %58
  %60 = and i64 %59, 805306368
  %61 = icmp eq i64 %60, 0
  br i1 %61, label %62, label %83

; <label>:62:                                     ; preds = %50
  %63 = load %struct.dent*, %struct.dent** %4, align 8
  %64 = getelementptr inbounds %struct.dent, %struct.dent* %63, i32 0, i32 2
  %65 = getelementptr inbounds [1 x i64], [1 x i64]* %64, i64 0, i64 0
  %66 = load i64, i64* %65, align 8
  %67 = and i64 %66, 805306368
  %68 = icmp ne i64 %67, 805306368
  br i1 %68, label %79, label %69

; <label>:69:                                     ; preds = %62
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 7)
  %70 = add i64 %pgocount4, 1
  store i64 %70, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 7)
  %71 = load %struct.dent*, %struct.dent** %4, align 8
  %72 = getelementptr inbounds %struct.dent, %struct.dent* %71, i32 0, i32 1
  %73 = load i8*, i8** %72, align 8
  %74 = load %struct.dent*, %struct.dent** %5, align 8
  %75 = getelementptr inbounds %struct.dent, %struct.dent* %74, i32 0, i32 1
  %76 = load i8*, i8** %75, align 8
  %77 = call i32 @strcmp(i8* %73, i8* %76) #6
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %81

; <label>:79:                                     ; preds = %69, %62
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 3)
  %80 = add i64 %pgocount5, 1
  store i64 %80, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 3)
  store i32 1, i32* %3, align 4
  br label %116

; <label>:81:                                     ; preds = %69
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 9)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 9)
  store i32 0, i32* %3, align 4
  br label %116

; <label>:83:                                     ; preds = %50
  %84 = load i32, i32* %6, align 4
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %88

; <label>:86:                                     ; preds = %83
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 5)
  %87 = add i64 %pgocount7, 1
  store i64 %87, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 5)
  store i32 0, i32* %3, align 4
  br label %116

; <label>:88:                                     ; preds = %83
  %89 = load %struct.dent*, %struct.dent** %5, align 8
  %90 = getelementptr inbounds %struct.dent, %struct.dent* %89, i32 0, i32 2
  %91 = getelementptr inbounds [1 x i64], [1 x i64]* %90, i64 0, i64 0
  %92 = load i64, i64* %91, align 8
  %93 = and i64 %92, 805306368
  %94 = icmp eq i64 %93, 268435456
  br i1 %94, label %95, label %97

; <label>:95:                                     ; preds = %88
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 6)
  %96 = add i64 %pgocount8, 1
  store i64 %96, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 6)
  store i32 1, i32* %3, align 4
  br label %116

; <label>:97:                                     ; preds = %88
  %98 = load %struct.dent*, %struct.dent** %4, align 8
  %99 = getelementptr inbounds %struct.dent, %struct.dent* %98, i32 0, i32 2
  %100 = getelementptr inbounds [1 x i64], [1 x i64]* %99, i64 0, i64 0
  %101 = load i64, i64* %100, align 8
  %102 = and i64 %101, 805306368
  %103 = icmp eq i64 %102, 0
  br i1 %103, label %104, label %114

; <label>:104:                                    ; preds = %97
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 10)
  %105 = add i64 %pgocount9, 1
  store i64 %105, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 10)
  %106 = load %struct.dent*, %struct.dent** %5, align 8
  %107 = getelementptr inbounds %struct.dent, %struct.dent* %106, i32 0, i32 2
  %108 = getelementptr inbounds [1 x i64], [1 x i64]* %107, i64 0, i64 0
  %109 = load i64, i64* %108, align 8
  %110 = and i64 %109, 805306368
  %111 = icmp eq i64 %110, 536870912
  br i1 %111, label %112, label %114

; <label>:112:                                    ; preds = %104
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 11)
  %113 = add i64 %pgocount10, 1
  store i64 %113, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 11)
  store i32 1, i32* %3, align 4
  br label %116

; <label>:114:                                    ; preds = %104, %97
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 8)
  %115 = add i64 %pgocount11, 1
  store i64 %115, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_acoversb, i64 0, i64 8)
  store i32 0, i32* %3, align 4
  br label %116

; <label>:116:                                    ; preds = %114, %112, %95, %86, %81, %79, %46, %31
  %117 = load i32, i32* %3, align 4
  ret i32 %117
}

; Function Attrs: nounwind uwtable
define internal i32 @issubset(%struct.dent*, %struct.dent*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.dent*, align 8
  store %struct.dent* %0, %struct.dent** %4, align 8
  store %struct.dent* %1, %struct.dent** %5, align 8
  %6 = load %struct.dent*, %struct.dent** %4, align 8
  %7 = getelementptr inbounds %struct.dent, %struct.dent* %6, i32 0, i32 2
  %8 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i64 0, i64 0
  %9 = load i64, i64* %8, align 8
  %10 = load %struct.dent*, %struct.dent** %5, align 8
  %11 = getelementptr inbounds %struct.dent, %struct.dent* %10, i32 0, i32 2
  %12 = getelementptr inbounds [1 x i64], [1 x i64]* %11, i64 0, i64 0
  %13 = load i64, i64* %12, align 8
  %14 = and i64 %9, %13
  %15 = load %struct.dent*, %struct.dent** %4, align 8
  %16 = getelementptr inbounds %struct.dent, %struct.dent* %15, i32 0, i32 2
  %17 = getelementptr inbounds [1 x i64], [1 x i64]* %16, i64 0, i64 0
  %18 = load i64, i64* %17, align 8
  %19 = xor i64 %14, %18
  %20 = and i64 %19, -2080374785
  %21 = icmp ne i64 %20, 0
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_issubset, i64 0, i64 0)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_issubset, i64 0, i64 0)
  store i32 0, i32* %3, align 4
  br label %26

; <label>:24:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_issubset, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_issubset, i64 0, i64 1)
  store i32 1, i32* %3, align 4
  br label %26

; <label>:26:                                     ; preds = %24, %22
  %27 = load i32, i32* %3, align 4
  ret i32 %27
}

; Function Attrs: nounwind uwtable
define internal void @flagout(%struct._IO_FILE*, i32) #0 {
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* @has_marker, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %13, label %7

; <label>:7:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flagout, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flagout, i64 0, i64 1)
  %9 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %10 = sext i8 %9 to i32
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %12 = call i32 @_IO_putc(i32 %10, %struct._IO_FILE* %11)
  br label %13

; <label>:13:                                     ; preds = %7, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flagout, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flagout, i64 0, i64 0)
  store i32 1, i32* @has_marker, align 4
  %15 = load i32, i32* %4, align 4
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %17 = call i32 @_IO_putc(i32 %15, %struct._IO_FILE* %16)
  ret void
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
