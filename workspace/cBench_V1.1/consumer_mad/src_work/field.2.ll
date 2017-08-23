; ModuleID = 'tmp1.ll'
source_filename = "field.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.id3_field = type { %struct.anon.5 }
%struct.anon.5 = type { i32, i8*, i64 }
%struct.anon = type { i32, i64 }
%struct.anon.0 = type { i32, i8* }
%struct.anon.1 = type { i32, i32, i8** }
%struct.anon.2 = type { i32, i64* }
%struct.anon.3 = type { i32, i32, i64** }
%struct.anon.4 = type { i32, [9 x i8] }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [4 x i8] c"XXX\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"XXXX\00", align 1
@id3_ucs4_empty = external constant [0 x i64], align 8
@id3_field_getbinarydata.empty = internal constant i8 0, align 1
@.str.2 = private unnamed_addr constant [48 x i8] c"field->binary.length == 0 || field->binary.data\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"field.c\00", align 1
@__PRETTY_FUNCTION__.id3_field_getbinarydata = private unnamed_addr constant [83 x i8] c"const id3_byte_t *id3_field_getbinarydata(const union id3_field *, id3_length_t *)\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_field_init = private constant [14 x i8] c"id3_field_init"
@__profn_id3_field_finish = private constant [16 x i8] c"id3_field_finish"
@__profn_id3_field_type = private constant [14 x i8] c"id3_field_type"
@__profn_id3_field_parse = private constant [15 x i8] c"id3_field_parse"
@__profn_id3_field_render = private constant [16 x i8] c"id3_field_render"
@__profn_id3_field_setint = private constant [16 x i8] c"id3_field_setint"
@__profn_id3_field_settextencoding = private constant [25 x i8] c"id3_field_settextencoding"
@__profn_id3_field_setlatin1 = private constant [19 x i8] c"id3_field_setlatin1"
@__profn_tmp1.ll_set_latin1 = private constant [18 x i8] c"tmp1.ll:set_latin1"
@__profn_id3_field_setfulllatin1 = private constant [23 x i8] c"id3_field_setfulllatin1"
@__profn_id3_field_setstring = private constant [19 x i8] c"id3_field_setstring"
@__profn_tmp1.ll_set_string = private constant [18 x i8] c"tmp1.ll:set_string"
@__profn_id3_field_setfullstring = private constant [23 x i8] c"id3_field_setfullstring"
@__profn_id3_field_setstrings = private constant [20 x i8] c"id3_field_setstrings"
@__profn_id3_field_addstring = private constant [19 x i8] c"id3_field_addstring"
@__profn_id3_field_setlanguage = private constant [21 x i8] c"id3_field_setlanguage"
@__profn_id3_field_setframeid = private constant [20 x i8] c"id3_field_setframeid"
@__profn_id3_field_setbinarydata = private constant [23 x i8] c"id3_field_setbinarydata"
@__profn_id3_field_getint = private constant [16 x i8] c"id3_field_getint"
@__profn_id3_field_getstring = private constant [19 x i8] c"id3_field_getstring"
@__profn_id3_field_getfullstring = private constant [23 x i8] c"id3_field_getfullstring"
@__profn_id3_field_getnstrings = private constant [21 x i8] c"id3_field_getnstrings"
@__profn_id3_field_getstrings = private constant [20 x i8] c"id3_field_getstrings"
@__profn_id3_field_getframeid = private constant [20 x i8] c"id3_field_getframeid"
@__profn_id3_field_getbinarydata = private constant [23 x i8] c"id3_field_getbinarydata"
@__profc_id3_field_init = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -491420031176203937, i64 123157987211, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i32 0, i32 0), i8* bitcast (void (%union.id3_field*, i32)* @id3_field_init to i8*), i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_finish = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_finish = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3123102683131168872, i64 216178726286, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i32 0, i32 0), i8* bitcast (void (%union.id3_field*)* @id3_field_finish to i8*), i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_type = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_type = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6584016115348407920, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_field_type, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*)* @id3_field_type to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_parse = private global [34 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_parse = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2307110556054657975, i64 370684356847, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i8**, i64, i32*)* @id3_field_parse to i8*), i8* null, i32 34, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_render = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_render = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5672546531977415128, i64 212734089692, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i32 0, i32 0), i8* bitcast (i64 (%union.id3_field*, i8**, i32*, i32)* @id3_field_render to i8*), i8* null, i32 21, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_setint = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_setint = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5237565367386141633, i64 144408798014, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i64)* @id3_field_setint to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_settextencoding = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_settextencoding = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1236085751453180636, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_settextencoding, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i32)* @id3_field_settextencoding to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_setlatin1 = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_setlatin1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5432315895933759774, i64 73293290057, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setlatin1, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i8*)* @id3_field_setlatin1 to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_set_latin1 = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_set_latin1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -601464446236472297, i64 55091702963, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_latin1, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_setfulllatin1 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_setfulllatin1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2047500053827788926, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setfulllatin1, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i8*)* @id3_field_setfulllatin1 to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_setstring = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_setstring = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2389053190786846802, i64 73293290057, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setstring, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i64*)* @id3_field_setstring to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_set_string = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_set_string = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5478341333254507310, i64 55091702963, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_string, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_setfullstring = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_setfullstring = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3983661716051329442, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setfullstring, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i64*)* @id3_field_setfullstring to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_setstrings = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_setstrings = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6231161251102278467, i64 103987090524, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i32, i64**)* @id3_field_setstrings to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_addstring = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_addstring = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8314703189746105327, i64 53954356755, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_addstring, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i64*)* @id3_field_addstring to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_setlanguage = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_setlanguage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7005063050589876525, i64 50515727635, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setlanguage, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i8*)* @id3_field_setlanguage to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_setframeid = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_setframeid = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4753852179137056098, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setframeid, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i8*)* @id3_field_setframeid to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_setbinarydata = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_setbinarydata = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3475804302057083178, i64 57052125916, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setbinarydata, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*, i8*, i64)* @id3_field_setbinarydata to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_getint = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_getint = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3117045340379616839, i64 53431810676, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getint, i32 0, i32 0), i8* bitcast (i64 (%union.id3_field*)* @id3_field_getint to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_getstring = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_getstring = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3018376412676653205, i64 43969736709, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getstring, i32 0, i32 0), i8* bitcast (i64* (%union.id3_field*)* @id3_field_getstring to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_getfullstring = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_getfullstring = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3741280219434537301, i64 43969736709, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getfullstring, i32 0, i32 0), i8* bitcast (i64* (%union.id3_field*)* @id3_field_getfullstring to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_getnstrings = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_getnstrings = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1310997176977726252, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_getnstrings, i32 0, i32 0), i8* bitcast (i32 (%union.id3_field*)* @id3_field_getnstrings to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_getstrings = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_getstrings = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2466440213567165482, i64 51375187908, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_getstrings, i32 0, i32 0), i8* bitcast (i64* (%union.id3_field*, i32)* @id3_field_getstrings to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_getframeid = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_getframeid = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4316011577812121543, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_getframeid, i32 0, i32 0), i8* bitcast (i8* (%union.id3_field*)* @id3_field_getframeid to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_field_getbinarydata = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_field_getbinarydata = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5927389490353748125, i64 75537349726, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getbinarydata, i32 0, i32 0), i8* bitcast (i8* (%union.id3_field*, i64*)* @id3_field_getbinarydata to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [159 x i8] c"\F9\03\9B\01x\DAm\D0\D1\0A\830\0C\05P\FC\A1\81\ECm?#q\89Y f\D2F\98\7F\BF\8E\89\A4\DA\C7{\9A\84K\05\EF\C3$\A48\88\89wr\C4\A9\E4\FC\0A\E0\DBB!.\90r\CC\89\0C)\05\C8\E4b^\83\D3\C7\C9\9Eo\14\E3\FAE\A1L\F7\9D\CFK\7FS}\14\19v\AA\C6\A6U\B5\E5\D9\D3\EFd\5C\DF\E9\B2\DE\F2\BF\E5\80\80\D8\1AT0^\81\E9t6\C1L\825\8Eb\906\04\87\E0|\FE\14>\BAW\D6,Z\DC\AEM\B9U\9F[\A58\96\FA\02\11\B0\BE\B2", section "__llvm_prf_names"
@llvm.used = appending global [26 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_finish to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_type to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_parse to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_render to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_setint to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_settextencoding to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_setlatin1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_set_latin1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_setfulllatin1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_setstring to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_set_string to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_setfullstring to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_setstrings to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_addstring to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_setlanguage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_setframeid to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_setbinarydata to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_getint to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_getstring to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_getfullstring to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_getnstrings to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_getstrings to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_getframeid to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_field_getbinarydata to i8*), i8* getelementptr inbounds ([159 x i8], [159 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @id3_field_init(%union.id3_field*, i32) #0 {
  %3 = alloca %union.id3_field*, align 8
  %4 = alloca i32, align 4
  store %union.id3_field* %0, %union.id3_field** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = load %union.id3_field*, %union.id3_field** %3, align 8
  %7 = bitcast %union.id3_field* %6 to i32*
  store i32 %5, i32* %7, align 8
  switch i32 %5, label %74 [
    i32 0, label %._crit_edge
    i32 10, label %._crit_edge1
    i32 11, label %._crit_edge2
    i32 12, label %._crit_edge3
    i32 13, label %15
    i32 1, label %._crit_edge4
    i32 2, label %20
    i32 3, label %25
    i32 4, label %._crit_edge5
    i32 5, label %33
    i32 6, label %38
    i32 7, label %46
    i32 8, label %53
    i32 9, label %60
    i32 14, label %._crit_edge6
    i32 15, label %66
  ]

._crit_edge6:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 6)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 6)
  br label %66

._crit_edge5:                                     ; preds = %2
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 5)
  %9 = add i64 %pgocount7, 1
  store i64 %9, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 5)
  br label %33

._crit_edge4:                                     ; preds = %2
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 4)
  %10 = add i64 %pgocount8, 1
  store i64 %10, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 4)
  br label %20

._crit_edge3:                                     ; preds = %2
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 3)
  %11 = add i64 %pgocount9, 1
  store i64 %11, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 3)
  br label %15

._crit_edge2:                                     ; preds = %2
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 2)
  %12 = add i64 %pgocount10, 1
  store i64 %12, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 2)
  br label %15

._crit_edge1:                                     ; preds = %2
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 1)
  %13 = add i64 %pgocount11, 1
  store i64 %13, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 1)
  br label %15

._crit_edge:                                      ; preds = %2
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 0)
  %14 = add i64 %pgocount12, 1
  store i64 %14, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 0)
  br label %15

; <label>:15:                                     ; preds = %._crit_edge3, %._crit_edge2, %._crit_edge1, %._crit_edge, %2
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 8)
  %16 = add i64 %pgocount13, 1
  store i64 %16, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 8)
  %17 = load %union.id3_field*, %union.id3_field** %3, align 8
  %18 = bitcast %union.id3_field* %17 to %struct.anon*
  %19 = getelementptr inbounds %struct.anon, %struct.anon* %18, i32 0, i32 1
  store i64 0, i64* %19, align 8
  br label %74

; <label>:20:                                     ; preds = %._crit_edge4, %2
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 10)
  %21 = add i64 %pgocount14, 1
  store i64 %21, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 10)
  %22 = load %union.id3_field*, %union.id3_field** %3, align 8
  %23 = bitcast %union.id3_field* %22 to %struct.anon.0*
  %24 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %23, i32 0, i32 1
  store i8* null, i8** %24, align 8
  br label %74

; <label>:25:                                     ; preds = %2
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 16)
  %26 = add i64 %pgocount15, 1
  store i64 %26, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 16)
  %27 = load %union.id3_field*, %union.id3_field** %3, align 8
  %28 = bitcast %union.id3_field* %27 to %struct.anon.1*
  %29 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %28, i32 0, i32 1
  store i32 0, i32* %29, align 4
  %30 = load %union.id3_field*, %union.id3_field** %3, align 8
  %31 = bitcast %union.id3_field* %30 to %struct.anon.1*
  %32 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %31, i32 0, i32 2
  store i8** null, i8*** %32, align 8
  br label %33

; <label>:33:                                     ; preds = %._crit_edge5, %25, %2
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 9)
  %34 = add i64 %pgocount16, 1
  store i64 %34, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 9)
  %35 = load %union.id3_field*, %union.id3_field** %3, align 8
  %36 = bitcast %union.id3_field* %35 to %struct.anon.2*
  %37 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %36, i32 0, i32 1
  store i64* null, i64** %37, align 8
  br label %74

; <label>:38:                                     ; preds = %2
  %pgocount17 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 12)
  %39 = add i64 %pgocount17, 1
  store i64 %39, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 12)
  %40 = load %union.id3_field*, %union.id3_field** %3, align 8
  %41 = bitcast %union.id3_field* %40 to %struct.anon.3*
  %42 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %41, i32 0, i32 1
  store i32 0, i32* %42, align 4
  %43 = load %union.id3_field*, %union.id3_field** %3, align 8
  %44 = bitcast %union.id3_field* %43 to %struct.anon.3*
  %45 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %44, i32 0, i32 2
  store i64** null, i64*** %45, align 8
  br label %74

; <label>:46:                                     ; preds = %2
  %pgocount18 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 13)
  %47 = add i64 %pgocount18, 1
  store i64 %47, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 13)
  %48 = load %union.id3_field*, %union.id3_field** %3, align 8
  %49 = bitcast %union.id3_field* %48 to %struct.anon.4*
  %50 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %49, i32 0, i32 1
  %51 = getelementptr inbounds [9 x i8], [9 x i8]* %50, i32 0, i32 0
  %52 = call i8* @strcpy(i8* %51, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0)) #6
  br label %74

; <label>:53:                                     ; preds = %2
  %pgocount19 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 14)
  %54 = add i64 %pgocount19, 1
  store i64 %54, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 14)
  %55 = load %union.id3_field*, %union.id3_field** %3, align 8
  %56 = bitcast %union.id3_field* %55 to %struct.anon.4*
  %57 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %56, i32 0, i32 1
  %58 = getelementptr inbounds [9 x i8], [9 x i8]* %57, i32 0, i32 0
  %59 = call i8* @strcpy(i8* %58, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0)) #6
  br label %74

; <label>:60:                                     ; preds = %2
  %pgocount20 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 15)
  %61 = add i64 %pgocount20, 1
  store i64 %61, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 15)
  %62 = load %union.id3_field*, %union.id3_field** %3, align 8
  %63 = bitcast %union.id3_field* %62 to %struct.anon.4*
  %64 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %63, i32 0, i32 1
  %65 = getelementptr inbounds [9 x i8], [9 x i8]* %64, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %65, i8 0, i64 9, i32 4, i1 false)
  br label %74

; <label>:66:                                     ; preds = %._crit_edge6, %2
  %pgocount21 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 11)
  %67 = add i64 %pgocount21, 1
  store i64 %67, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 11)
  %68 = load %union.id3_field*, %union.id3_field** %3, align 8
  %69 = bitcast %union.id3_field* %68 to %struct.anon.5*
  %70 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %69, i32 0, i32 1
  store i8* null, i8** %70, align 8
  %71 = load %union.id3_field*, %union.id3_field** %3, align 8
  %72 = bitcast %union.id3_field* %71 to %struct.anon.5*
  %73 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %72, i32 0, i32 2
  store i64 0, i64* %73, align 8
  br label %74

; <label>:74:                                     ; preds = %66, %60, %53, %46, %38, %33, %20, %15, %2
  %pgocount22 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 7)
  %75 = add i64 %pgocount22, 1
  store i64 %75, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_id3_field_init, i64 0, i64 7)
  ret void
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define void @id3_field_finish(%union.id3_field*) #0 {
  %2 = alloca %union.id3_field*, align 8
  %3 = alloca i32, align 4
  store %union.id3_field* %0, %union.id3_field** %2, align 8
  %4 = load %union.id3_field*, %union.id3_field** %2, align 8
  %5 = bitcast %union.id3_field* %4 to i32*
  %6 = load i32, i32* %5, align 8
  switch i32 %6, label %135 [
    i32 0, label %._crit_edge
    i32 10, label %._crit_edge1
    i32 11, label %._crit_edge2
    i32 12, label %._crit_edge3
    i32 13, label %._crit_edge4
    i32 7, label %._crit_edge5
    i32 8, label %._crit_edge6
    i32 9, label %17
    i32 1, label %._crit_edge7
    i32 2, label %19
    i32 3, label %33
    i32 4, label %._crit_edge8
    i32 5, label %69
    i32 6, label %84
    i32 14, label %._crit_edge9
    i32 15, label %121
  ]

._crit_edge9:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 9)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 9)
  br label %121

._crit_edge8:                                     ; preds = %1
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 8)
  %8 = add i64 %pgocount10, 1
  store i64 %8, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 8)
  br label %69

._crit_edge7:                                     ; preds = %1
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 7)
  %9 = add i64 %pgocount11, 1
  store i64 %9, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 7)
  br label %19

._crit_edge6:                                     ; preds = %1
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 6)
  %10 = add i64 %pgocount12, 1
  store i64 %10, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 6)
  br label %17

._crit_edge5:                                     ; preds = %1
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 5)
  %11 = add i64 %pgocount13, 1
  store i64 %11, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 5)
  br label %17

._crit_edge4:                                     ; preds = %1
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 4)
  %12 = add i64 %pgocount14, 1
  store i64 %12, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 4)
  br label %17

._crit_edge3:                                     ; preds = %1
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 3)
  %13 = add i64 %pgocount15, 1
  store i64 %13, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 3)
  br label %17

._crit_edge2:                                     ; preds = %1
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 2)
  %14 = add i64 %pgocount16, 1
  store i64 %14, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 2)
  br label %17

._crit_edge1:                                     ; preds = %1
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 1)
  %15 = add i64 %pgocount17, 1
  store i64 %15, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 1)
  br label %17

._crit_edge:                                      ; preds = %1
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 0)
  %16 = add i64 %pgocount18, 1
  store i64 %16, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 0)
  br label %17

; <label>:17:                                     ; preds = %._crit_edge6, %._crit_edge5, %._crit_edge4, %._crit_edge3, %._crit_edge2, %._crit_edge1, %._crit_edge, %1
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 13)
  %18 = add i64 %pgocount19, 1
  store i64 %18, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 13)
  br label %135

; <label>:19:                                     ; preds = %._crit_edge7, %1
  %20 = load %union.id3_field*, %union.id3_field** %2, align 8
  %21 = bitcast %union.id3_field* %20 to %struct.anon.0*
  %22 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %21, i32 0, i32 1
  %23 = load i8*, i8** %22, align 8
  %24 = icmp ne i8* %23, null
  br i1 %24, label %25, label %31

; <label>:25:                                     ; preds = %19
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 17)
  %26 = add i64 %pgocount20, 1
  store i64 %26, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 17)
  %27 = load %union.id3_field*, %union.id3_field** %2, align 8
  %28 = bitcast %union.id3_field* %27 to %struct.anon.0*
  %29 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %28, i32 0, i32 1
  %30 = load i8*, i8** %29, align 8
  call void @free(i8* %30) #6
  br label %31

; <label>:31:                                     ; preds = %25, %19
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 14)
  %32 = add i64 %pgocount21, 1
  store i64 %32, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 14)
  br label %135

; <label>:33:                                     ; preds = %1
  store i32 0, i32* %3, align 4
  br label %34

; <label>:34:                                     ; preds = %50, %33
  %35 = load i32, i32* %3, align 4
  %36 = load %union.id3_field*, %union.id3_field** %2, align 8
  %37 = bitcast %union.id3_field* %36 to %struct.anon.1*
  %38 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %37, i32 0, i32 1
  %39 = load i32, i32* %38, align 4
  %40 = icmp ult i32 %35, %39
  br i1 %40, label %41, label %54

; <label>:41:                                     ; preds = %34
  %42 = load %union.id3_field*, %union.id3_field** %2, align 8
  %43 = bitcast %union.id3_field* %42 to %struct.anon.1*
  %44 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %43, i32 0, i32 2
  %45 = load i8**, i8*** %44, align 8
  %46 = load i32, i32* %3, align 4
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i8*, i8** %45, i64 %47
  %49 = load i8*, i8** %48, align 8
  call void @free(i8* %49) #6
  br label %50

; <label>:50:                                     ; preds = %41
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 10)
  %51 = add i64 %pgocount22, 1
  store i64 %51, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 10)
  %52 = load i32, i32* %3, align 4
  %53 = add i32 %52, 1
  store i32 %53, i32* %3, align 4
  br label %34

; <label>:54:                                     ; preds = %34
  %55 = load %union.id3_field*, %union.id3_field** %2, align 8
  %56 = bitcast %union.id3_field* %55 to %struct.anon.1*
  %57 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %56, i32 0, i32 2
  %58 = load i8**, i8*** %57, align 8
  %59 = icmp ne i8** %58, null
  br i1 %59, label %60, label %67

; <label>:60:                                     ; preds = %54
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 22)
  %61 = add i64 %pgocount23, 1
  store i64 %61, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 22)
  %62 = load %union.id3_field*, %union.id3_field** %2, align 8
  %63 = bitcast %union.id3_field* %62 to %struct.anon.1*
  %64 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %63, i32 0, i32 2
  %65 = load i8**, i8*** %64, align 8
  %66 = bitcast i8** %65 to i8*
  call void @free(i8* %66) #6
  br label %67

; <label>:67:                                     ; preds = %60, %54
  %pgocount24 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 20)
  %68 = add i64 %pgocount24, 1
  store i64 %68, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 20)
  br label %135

; <label>:69:                                     ; preds = %._crit_edge8, %1
  %70 = load %union.id3_field*, %union.id3_field** %2, align 8
  %71 = bitcast %union.id3_field* %70 to %struct.anon.2*
  %72 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %71, i32 0, i32 1
  %73 = load i64*, i64** %72, align 8
  %74 = icmp ne i64* %73, null
  br i1 %74, label %75, label %82

; <label>:75:                                     ; preds = %69
  %pgocount25 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 18)
  %76 = add i64 %pgocount25, 1
  store i64 %76, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 18)
  %77 = load %union.id3_field*, %union.id3_field** %2, align 8
  %78 = bitcast %union.id3_field* %77 to %struct.anon.2*
  %79 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %78, i32 0, i32 1
  %80 = load i64*, i64** %79, align 8
  %81 = bitcast i64* %80 to i8*
  call void @free(i8* %81) #6
  br label %82

; <label>:82:                                     ; preds = %75, %69
  %pgocount26 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 15)
  %83 = add i64 %pgocount26, 1
  store i64 %83, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 15)
  br label %135

; <label>:84:                                     ; preds = %1
  store i32 0, i32* %3, align 4
  br label %85

; <label>:85:                                     ; preds = %102, %84
  %86 = load i32, i32* %3, align 4
  %87 = load %union.id3_field*, %union.id3_field** %2, align 8
  %88 = bitcast %union.id3_field* %87 to %struct.anon.3*
  %89 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %88, i32 0, i32 1
  %90 = load i32, i32* %89, align 4
  %91 = icmp ult i32 %86, %90
  br i1 %91, label %92, label %106

; <label>:92:                                     ; preds = %85
  %93 = load %union.id3_field*, %union.id3_field** %2, align 8
  %94 = bitcast %union.id3_field* %93 to %struct.anon.3*
  %95 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %94, i32 0, i32 2
  %96 = load i64**, i64*** %95, align 8
  %97 = load i32, i32* %3, align 4
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds i64*, i64** %96, i64 %98
  %100 = load i64*, i64** %99, align 8
  %101 = bitcast i64* %100 to i8*
  call void @free(i8* %101) #6
  br label %102

; <label>:102:                                    ; preds = %92
  %pgocount27 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 11)
  %103 = add i64 %pgocount27, 1
  store i64 %103, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 11)
  %104 = load i32, i32* %3, align 4
  %105 = add i32 %104, 1
  store i32 %105, i32* %3, align 4
  br label %85

; <label>:106:                                    ; preds = %85
  %107 = load %union.id3_field*, %union.id3_field** %2, align 8
  %108 = bitcast %union.id3_field* %107 to %struct.anon.3*
  %109 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %108, i32 0, i32 2
  %110 = load i64**, i64*** %109, align 8
  %111 = icmp ne i64** %110, null
  br i1 %111, label %112, label %119

; <label>:112:                                    ; preds = %106
  %pgocount28 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 23)
  %113 = add i64 %pgocount28, 1
  store i64 %113, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 23)
  %114 = load %union.id3_field*, %union.id3_field** %2, align 8
  %115 = bitcast %union.id3_field* %114 to %struct.anon.3*
  %116 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %115, i32 0, i32 2
  %117 = load i64**, i64*** %116, align 8
  %118 = bitcast i64** %117 to i8*
  call void @free(i8* %118) #6
  br label %119

; <label>:119:                                    ; preds = %112, %106
  %pgocount29 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 21)
  %120 = add i64 %pgocount29, 1
  store i64 %120, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 21)
  br label %135

; <label>:121:                                    ; preds = %._crit_edge9, %1
  %122 = load %union.id3_field*, %union.id3_field** %2, align 8
  %123 = bitcast %union.id3_field* %122 to %struct.anon.5*
  %124 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %123, i32 0, i32 1
  %125 = load i8*, i8** %124, align 8
  %126 = icmp ne i8* %125, null
  br i1 %126, label %127, label %133

; <label>:127:                                    ; preds = %121
  %pgocount30 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 19)
  %128 = add i64 %pgocount30, 1
  store i64 %128, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 19)
  %129 = load %union.id3_field*, %union.id3_field** %2, align 8
  %130 = bitcast %union.id3_field* %129 to %struct.anon.5*
  %131 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %130, i32 0, i32 1
  %132 = load i8*, i8** %131, align 8
  call void @free(i8* %132) #6
  br label %133

; <label>:133:                                    ; preds = %127, %121
  %pgocount31 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 16)
  %134 = add i64 %pgocount31, 1
  store i64 %134, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 16)
  br label %135

; <label>:135:                                    ; preds = %133, %119, %82, %67, %31, %17, %1
  %pgocount32 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 12)
  %136 = add i64 %pgocount32, 1
  store i64 %136, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_id3_field_finish, i64 0, i64 12)
  %137 = load %union.id3_field*, %union.id3_field** %2, align 8
  %138 = load %union.id3_field*, %union.id3_field** %2, align 8
  %139 = bitcast %union.id3_field* %138 to i32*
  %140 = load i32, i32* %139, align 8
  call void @id3_field_init(%union.id3_field* %137, i32 %140)
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @id3_field_type(%union.id3_field*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_field_type, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_field_type, i64 0, i64 0)
  %3 = alloca %union.id3_field*, align 8
  store %union.id3_field* %0, %union.id3_field** %3, align 8
  %4 = load %union.id3_field*, %union.id3_field** %3, align 8
  %5 = bitcast %union.id3_field* %4 to i32*
  %6 = load i32, i32* %5, align 8
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @id3_field_parse(%union.id3_field*, i8**, i64, i32*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %union.id3_field*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8**, align 8
  %14 = alloca i64*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i64*, align 8
  %17 = alloca i64**, align 8
  %18 = alloca i8*, align 8
  store %union.id3_field* %0, %union.id3_field** %6, align 8
  store i8** %1, i8*** %7, align 8
  store i64 %2, i64* %8, align 8
  store i32* %3, i32** %9, align 8
  %19 = load %union.id3_field*, %union.id3_field** %6, align 8
  call void @id3_field_finish(%union.id3_field* %19)
  %20 = load %union.id3_field*, %union.id3_field** %6, align 8
  %21 = bitcast %union.id3_field* %20 to i32*
  %22 = load i32, i32* %21, align 8
  switch i32 %22, label %317 [
    i32 13, label %27
    i32 12, label %39
    i32 11, label %51
    i32 10, label %._crit_edge
    i32 0, label %63
    i32 7, label %88
    i32 8, label %100
    i32 9, label %112
    i32 1, label %._crit_edge1
    i32 2, label %124
    i32 3, label %143
    i32 4, label %._crit_edge2
    i32 5, label %209
    i32 6, label %230
    i32 14, label %._crit_edge3
    i32 15, label %299
  ]

._crit_edge3:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 3)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 3)
  br label %299

._crit_edge2:                                     ; preds = %4
  %pgocount4 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 2)
  %24 = add i64 %pgocount4, 1
  store i64 %24, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 2)
  br label %209

._crit_edge1:                                     ; preds = %4
  %pgocount5 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 1)
  %25 = add i64 %pgocount5, 1
  store i64 %25, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 1)
  br label %124

._crit_edge:                                      ; preds = %4
  %pgocount6 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 0)
  %26 = add i64 %pgocount6, 1
  store i64 %26, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 0)
  br label %63

; <label>:27:                                     ; preds = %4
  %28 = load i64, i64* %8, align 8
  %29 = icmp ult i64 %28, 4
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %27
  %pgocount7 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 15)
  %31 = add i64 %pgocount7, 1
  store i64 %31, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 15)
  br label %319

; <label>:32:                                     ; preds = %27
  %pgocount8 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 16)
  %33 = add i64 %pgocount8, 1
  store i64 %33, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 16)
  %34 = load i8**, i8*** %7, align 8
  %35 = call i64 @id3_parse_uint(i8** %34, i32 4)
  %36 = load %union.id3_field*, %union.id3_field** %6, align 8
  %37 = bitcast %union.id3_field* %36 to %struct.anon*
  %38 = getelementptr inbounds %struct.anon, %struct.anon* %37, i32 0, i32 1
  store i64 %35, i64* %38, align 8
  br label %317

; <label>:39:                                     ; preds = %4
  %40 = load i64, i64* %8, align 8
  %41 = icmp ult i64 %40, 3
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %39
  %pgocount9 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 17)
  %43 = add i64 %pgocount9, 1
  store i64 %43, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 17)
  br label %319

; <label>:44:                                     ; preds = %39
  %pgocount10 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 18)
  %45 = add i64 %pgocount10, 1
  store i64 %45, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 18)
  %46 = load i8**, i8*** %7, align 8
  %47 = call i64 @id3_parse_uint(i8** %46, i32 3)
  %48 = load %union.id3_field*, %union.id3_field** %6, align 8
  %49 = bitcast %union.id3_field* %48 to %struct.anon*
  %50 = getelementptr inbounds %struct.anon, %struct.anon* %49, i32 0, i32 1
  store i64 %47, i64* %50, align 8
  br label %317

; <label>:51:                                     ; preds = %4
  %52 = load i64, i64* %8, align 8
  %53 = icmp ult i64 %52, 2
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %51
  %pgocount11 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 19)
  %55 = add i64 %pgocount11, 1
  store i64 %55, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 19)
  br label %319

; <label>:56:                                     ; preds = %51
  %pgocount12 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 20)
  %57 = add i64 %pgocount12, 1
  store i64 %57, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 20)
  %58 = load i8**, i8*** %7, align 8
  %59 = call i64 @id3_parse_uint(i8** %58, i32 2)
  %60 = load %union.id3_field*, %union.id3_field** %6, align 8
  %61 = bitcast %union.id3_field* %60 to %struct.anon*
  %62 = getelementptr inbounds %struct.anon, %struct.anon* %61, i32 0, i32 1
  store i64 %59, i64* %62, align 8
  br label %317

; <label>:63:                                     ; preds = %._crit_edge, %4
  %64 = load i64, i64* %8, align 8
  %65 = icmp ult i64 %64, 1
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %63
  %pgocount13 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 10)
  %67 = add i64 %pgocount13, 1
  store i64 %67, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 10)
  br label %319

; <label>:68:                                     ; preds = %63
  %69 = load i8**, i8*** %7, align 8
  %70 = call i64 @id3_parse_uint(i8** %69, i32 1)
  %71 = load %union.id3_field*, %union.id3_field** %6, align 8
  %72 = bitcast %union.id3_field* %71 to %struct.anon*
  %73 = getelementptr inbounds %struct.anon, %struct.anon* %72, i32 0, i32 1
  store i64 %70, i64* %73, align 8
  %74 = load %union.id3_field*, %union.id3_field** %6, align 8
  %75 = bitcast %union.id3_field* %74 to i32*
  %76 = load i32, i32* %75, align 8
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %86

; <label>:78:                                     ; preds = %68
  %pgocount14 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 27)
  %79 = add i64 %pgocount14, 1
  store i64 %79, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 27)
  %80 = load %union.id3_field*, %union.id3_field** %6, align 8
  %81 = bitcast %union.id3_field* %80 to %struct.anon*
  %82 = getelementptr inbounds %struct.anon, %struct.anon* %81, i32 0, i32 1
  %83 = load i64, i64* %82, align 8
  %84 = trunc i64 %83 to i32
  %85 = load i32*, i32** %9, align 8
  store i32 %84, i32* %85, align 4
  br label %86

; <label>:86:                                     ; preds = %78, %68
  %pgocount15 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 11)
  %87 = add i64 %pgocount15, 1
  store i64 %87, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 11)
  br label %317

; <label>:88:                                     ; preds = %4
  %89 = load i64, i64* %8, align 8
  %90 = icmp ult i64 %89, 3
  br i1 %90, label %91, label %93

; <label>:91:                                     ; preds = %88
  %pgocount16 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 21)
  %92 = add i64 %pgocount16, 1
  store i64 %92, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 21)
  br label %319

; <label>:93:                                     ; preds = %88
  %pgocount17 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 22)
  %94 = add i64 %pgocount17, 1
  store i64 %94, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 22)
  %95 = load i8**, i8*** %7, align 8
  %96 = load %union.id3_field*, %union.id3_field** %6, align 8
  %97 = bitcast %union.id3_field* %96 to %struct.anon.4*
  %98 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %97, i32 0, i32 1
  %99 = getelementptr inbounds [9 x i8], [9 x i8]* %98, i32 0, i32 0
  call void @id3_parse_immediate(i8** %95, i32 3, i8* %99)
  br label %317

; <label>:100:                                    ; preds = %4
  %101 = load i64, i64* %8, align 8
  %102 = icmp ult i64 %101, 4
  br i1 %102, label %103, label %105

; <label>:103:                                    ; preds = %100
  %pgocount18 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 23)
  %104 = add i64 %pgocount18, 1
  store i64 %104, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 23)
  br label %319

; <label>:105:                                    ; preds = %100
  %pgocount19 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 24)
  %106 = add i64 %pgocount19, 1
  store i64 %106, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 24)
  %107 = load i8**, i8*** %7, align 8
  %108 = load %union.id3_field*, %union.id3_field** %6, align 8
  %109 = bitcast %union.id3_field* %108 to %struct.anon.4*
  %110 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %109, i32 0, i32 1
  %111 = getelementptr inbounds [9 x i8], [9 x i8]* %110, i32 0, i32 0
  call void @id3_parse_immediate(i8** %107, i32 4, i8* %111)
  br label %317

; <label>:112:                                    ; preds = %4
  %113 = load i64, i64* %8, align 8
  %114 = icmp ult i64 %113, 8
  br i1 %114, label %115, label %117

; <label>:115:                                    ; preds = %112
  %pgocount20 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 25)
  %116 = add i64 %pgocount20, 1
  store i64 %116, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 25)
  br label %319

; <label>:117:                                    ; preds = %112
  %pgocount21 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 26)
  %118 = add i64 %pgocount21, 1
  store i64 %118, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 26)
  %119 = load i8**, i8*** %7, align 8
  %120 = load %union.id3_field*, %union.id3_field** %6, align 8
  %121 = bitcast %union.id3_field* %120 to %struct.anon.4*
  %122 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %121, i32 0, i32 1
  %123 = getelementptr inbounds [9 x i8], [9 x i8]* %122, i32 0, i32 0
  call void @id3_parse_immediate(i8** %119, i32 8, i8* %123)
  br label %317

; <label>:124:                                    ; preds = %._crit_edge1, %4
  %125 = load i8**, i8*** %7, align 8
  %126 = load i64, i64* %8, align 8
  %127 = load %union.id3_field*, %union.id3_field** %6, align 8
  %128 = bitcast %union.id3_field* %127 to i32*
  %129 = load i32, i32* %128, align 8
  %130 = icmp eq i32 %129, 2
  %131 = zext i1 %130 to i32
  %132 = call i8* @id3_parse_latin1(i8** %125, i64 %126, i32 %131)
  store i8* %132, i8** %10, align 8
  %133 = load i8*, i8** %10, align 8
  %134 = icmp eq i8* %133, null
  br i1 %134, label %135, label %137

; <label>:135:                                    ; preds = %124
  %pgocount22 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 12)
  %136 = add i64 %pgocount22, 1
  store i64 %136, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 12)
  br label %319

; <label>:137:                                    ; preds = %124
  %pgocount23 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 7)
  %138 = add i64 %pgocount23, 1
  store i64 %138, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 7)
  %139 = load i8*, i8** %10, align 8
  %140 = load %union.id3_field*, %union.id3_field** %6, align 8
  %141 = bitcast %union.id3_field* %140 to %struct.anon.0*
  %142 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %141, i32 0, i32 1
  store i8* %139, i8** %142, align 8
  br label %317

; <label>:143:                                    ; preds = %4
  %144 = load i8**, i8*** %7, align 8
  %145 = load i8*, i8** %144, align 8
  %146 = load i64, i64* %8, align 8
  %147 = getelementptr inbounds i8, i8* %145, i64 %146
  store i8* %147, i8** %11, align 8
  br label %148

; <label>:148:                                    ; preds = %189, %143
  %149 = load i8*, i8** %11, align 8
  %150 = load i8**, i8*** %7, align 8
  %151 = load i8*, i8** %150, align 8
  %152 = ptrtoint i8* %149 to i64
  %153 = ptrtoint i8* %151 to i64
  %154 = sub i64 %152, %153
  %155 = icmp sgt i64 %154, 0
  br i1 %155, label %156, label %207

; <label>:156:                                    ; preds = %148
  %157 = load i8**, i8*** %7, align 8
  %158 = load i8*, i8** %11, align 8
  %159 = load i8**, i8*** %7, align 8
  %160 = load i8*, i8** %159, align 8
  %161 = ptrtoint i8* %158 to i64
  %162 = ptrtoint i8* %160 to i64
  %163 = sub i64 %161, %162
  %164 = call i8* @id3_parse_latin1(i8** %157, i64 %163, i32 0)
  store i8* %164, i8** %12, align 8
  %165 = load i8*, i8** %12, align 8
  %166 = icmp eq i8* %165, null
  br i1 %166, label %167, label %169

; <label>:167:                                    ; preds = %156
  %pgocount24 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 28)
  %168 = add i64 %pgocount24, 1
  store i64 %168, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 28)
  br label %319

; <label>:169:                                    ; preds = %156
  %170 = load %union.id3_field*, %union.id3_field** %6, align 8
  %171 = bitcast %union.id3_field* %170 to %struct.anon.1*
  %172 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %171, i32 0, i32 2
  %173 = load i8**, i8*** %172, align 8
  %174 = bitcast i8** %173 to i8*
  %175 = load %union.id3_field*, %union.id3_field** %6, align 8
  %176 = bitcast %union.id3_field* %175 to %struct.anon.1*
  %177 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %176, i32 0, i32 1
  %178 = load i32, i32* %177, align 4
  %179 = add i32 %178, 1
  %180 = zext i32 %179 to i64
  %181 = mul i64 %180, 8
  %182 = call i8* @realloc(i8* %174, i64 %181) #6
  %183 = bitcast i8* %182 to i8**
  store i8** %183, i8*** %13, align 8
  %184 = load i8**, i8*** %13, align 8
  %185 = icmp eq i8** %184, null
  br i1 %185, label %186, label %189

; <label>:186:                                    ; preds = %169
  %pgocount25 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 33)
  %187 = add i64 %pgocount25, 1
  store i64 %187, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 33)
  %188 = load i8*, i8** %12, align 8
  call void @free(i8* %188) #6
  br label %319

; <label>:189:                                    ; preds = %169
  %pgocount26 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 5)
  %190 = add i64 %pgocount26, 1
  store i64 %190, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 5)
  %191 = load i8**, i8*** %13, align 8
  %192 = load %union.id3_field*, %union.id3_field** %6, align 8
  %193 = bitcast %union.id3_field* %192 to %struct.anon.1*
  %194 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %193, i32 0, i32 2
  store i8** %191, i8*** %194, align 8
  %195 = load i8*, i8** %12, align 8
  %196 = load %union.id3_field*, %union.id3_field** %6, align 8
  %197 = bitcast %union.id3_field* %196 to %struct.anon.1*
  %198 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %197, i32 0, i32 2
  %199 = load i8**, i8*** %198, align 8
  %200 = load %union.id3_field*, %union.id3_field** %6, align 8
  %201 = bitcast %union.id3_field* %200 to %struct.anon.1*
  %202 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %201, i32 0, i32 1
  %203 = load i32, i32* %202, align 4
  %204 = add i32 %203, 1
  store i32 %204, i32* %202, align 4
  %205 = zext i32 %203 to i64
  %206 = getelementptr inbounds i8*, i8** %199, i64 %205
  store i8* %195, i8** %206, align 8
  br label %148

; <label>:207:                                    ; preds = %148
  %pgocount27 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 29)
  %208 = add i64 %pgocount27, 1
  store i64 %208, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 29)
  br label %317

; <label>:209:                                    ; preds = %._crit_edge2, %4
  %210 = load i8**, i8*** %7, align 8
  %211 = load i64, i64* %8, align 8
  %212 = load i32*, i32** %9, align 8
  %213 = load i32, i32* %212, align 4
  %214 = load %union.id3_field*, %union.id3_field** %6, align 8
  %215 = bitcast %union.id3_field* %214 to i32*
  %216 = load i32, i32* %215, align 8
  %217 = icmp eq i32 %216, 5
  %218 = zext i1 %217 to i32
  %219 = call i64* @id3_parse_string(i8** %210, i64 %211, i32 %213, i32 %218)
  store i64* %219, i64** %14, align 8
  %220 = load i64*, i64** %14, align 8
  %221 = icmp eq i64* %220, null
  br i1 %221, label %222, label %224

; <label>:222:                                    ; preds = %209
  %pgocount28 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 13)
  %223 = add i64 %pgocount28, 1
  store i64 %223, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 13)
  br label %319

; <label>:224:                                    ; preds = %209
  %pgocount29 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 8)
  %225 = add i64 %pgocount29, 1
  store i64 %225, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 8)
  %226 = load i64*, i64** %14, align 8
  %227 = load %union.id3_field*, %union.id3_field** %6, align 8
  %228 = bitcast %union.id3_field* %227 to %struct.anon.2*
  %229 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %228, i32 0, i32 1
  store i64* %226, i64** %229, align 8
  br label %317

; <label>:230:                                    ; preds = %4
  %231 = load i8**, i8*** %7, align 8
  %232 = load i8*, i8** %231, align 8
  %233 = load i64, i64* %8, align 8
  %234 = getelementptr inbounds i8, i8* %232, i64 %233
  store i8* %234, i8** %15, align 8
  br label %235

; <label>:235:                                    ; preds = %279, %230
  %236 = load i8*, i8** %15, align 8
  %237 = load i8**, i8*** %7, align 8
  %238 = load i8*, i8** %237, align 8
  %239 = ptrtoint i8* %236 to i64
  %240 = ptrtoint i8* %238 to i64
  %241 = sub i64 %239, %240
  %242 = icmp sgt i64 %241, 0
  br i1 %242, label %243, label %297

; <label>:243:                                    ; preds = %235
  %244 = load i8**, i8*** %7, align 8
  %245 = load i8*, i8** %15, align 8
  %246 = load i8**, i8*** %7, align 8
  %247 = load i8*, i8** %246, align 8
  %248 = ptrtoint i8* %245 to i64
  %249 = ptrtoint i8* %247 to i64
  %250 = sub i64 %248, %249
  %251 = load i32*, i32** %9, align 8
  %252 = load i32, i32* %251, align 4
  %253 = call i64* @id3_parse_string(i8** %244, i64 %250, i32 %252, i32 0)
  store i64* %253, i64** %16, align 8
  %254 = load i64*, i64** %16, align 8
  %255 = icmp eq i64* %254, null
  br i1 %255, label %256, label %258

; <label>:256:                                    ; preds = %243
  %pgocount30 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 30)
  %257 = add i64 %pgocount30, 1
  store i64 %257, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 30)
  br label %319

; <label>:258:                                    ; preds = %243
  %259 = load %union.id3_field*, %union.id3_field** %6, align 8
  %260 = bitcast %union.id3_field* %259 to %struct.anon.3*
  %261 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %260, i32 0, i32 2
  %262 = load i64**, i64*** %261, align 8
  %263 = bitcast i64** %262 to i8*
  %264 = load %union.id3_field*, %union.id3_field** %6, align 8
  %265 = bitcast %union.id3_field* %264 to %struct.anon.3*
  %266 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %265, i32 0, i32 1
  %267 = load i32, i32* %266, align 4
  %268 = add i32 %267, 1
  %269 = zext i32 %268 to i64
  %270 = mul i64 %269, 8
  %271 = call i8* @realloc(i8* %263, i64 %270) #6
  %272 = bitcast i8* %271 to i64**
  store i64** %272, i64*** %17, align 8
  %273 = load i64**, i64*** %17, align 8
  %274 = icmp eq i64** %273, null
  br i1 %274, label %275, label %279

; <label>:275:                                    ; preds = %258
  %pgocount31 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 31)
  %276 = add i64 %pgocount31, 1
  store i64 %276, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 31)
  %277 = load i64*, i64** %16, align 8
  %278 = bitcast i64* %277 to i8*
  call void @free(i8* %278) #6
  br label %319

; <label>:279:                                    ; preds = %258
  %pgocount32 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 4)
  %280 = add i64 %pgocount32, 1
  store i64 %280, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 4)
  %281 = load i64**, i64*** %17, align 8
  %282 = load %union.id3_field*, %union.id3_field** %6, align 8
  %283 = bitcast %union.id3_field* %282 to %struct.anon.3*
  %284 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %283, i32 0, i32 2
  store i64** %281, i64*** %284, align 8
  %285 = load i64*, i64** %16, align 8
  %286 = load %union.id3_field*, %union.id3_field** %6, align 8
  %287 = bitcast %union.id3_field* %286 to %struct.anon.3*
  %288 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %287, i32 0, i32 2
  %289 = load i64**, i64*** %288, align 8
  %290 = load %union.id3_field*, %union.id3_field** %6, align 8
  %291 = bitcast %union.id3_field* %290 to %struct.anon.3*
  %292 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %291, i32 0, i32 1
  %293 = load i32, i32* %292, align 4
  %294 = add i32 %293, 1
  store i32 %294, i32* %292, align 4
  %295 = zext i32 %293 to i64
  %296 = getelementptr inbounds i64*, i64** %289, i64 %295
  store i64* %285, i64** %296, align 8
  br label %235

; <label>:297:                                    ; preds = %235
  %pgocount33 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 32)
  %298 = add i64 %pgocount33, 1
  store i64 %298, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 32)
  br label %317

; <label>:299:                                    ; preds = %._crit_edge3, %4
  %300 = load i8**, i8*** %7, align 8
  %301 = load i64, i64* %8, align 8
  %302 = call i8* @id3_parse_binary(i8** %300, i64 %301)
  store i8* %302, i8** %18, align 8
  %303 = load i8*, i8** %18, align 8
  %304 = icmp eq i8* %303, null
  br i1 %304, label %305, label %307

; <label>:305:                                    ; preds = %299
  %pgocount34 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 14)
  %306 = add i64 %pgocount34, 1
  store i64 %306, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 14)
  br label %319

; <label>:307:                                    ; preds = %299
  %pgocount35 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 9)
  %308 = add i64 %pgocount35, 1
  store i64 %308, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 9)
  %309 = load i8*, i8** %18, align 8
  %310 = load %union.id3_field*, %union.id3_field** %6, align 8
  %311 = bitcast %union.id3_field* %310 to %struct.anon.5*
  %312 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %311, i32 0, i32 1
  store i8* %309, i8** %312, align 8
  %313 = load i64, i64* %8, align 8
  %314 = load %union.id3_field*, %union.id3_field** %6, align 8
  %315 = bitcast %union.id3_field* %314 to %struct.anon.5*
  %316 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %315, i32 0, i32 2
  store i64 %313, i64* %316, align 8
  br label %317

; <label>:317:                                    ; preds = %307, %297, %224, %207, %137, %117, %105, %93, %86, %56, %44, %32, %4
  %pgocount36 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 6)
  %318 = add i64 %pgocount36, 1
  store i64 %318, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_id3_field_parse, i64 0, i64 6)
  store i32 0, i32* %5, align 4
  br label %320

; <label>:319:                                    ; preds = %305, %275, %256, %222, %186, %167, %135, %115, %103, %91, %66, %54, %42, %30
  store i32 -1, i32* %5, align 4
  br label %320

; <label>:320:                                    ; preds = %319, %317
  %321 = load i32, i32* %5, align 4
  ret i32 %321
}

declare i64 @id3_parse_uint(i8**, i32) #3

declare void @id3_parse_immediate(i8**, i32, i8*) #3

declare i8* @id3_parse_latin1(i8**, i64, i32) #3

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

declare i64* @id3_parse_string(i8**, i64, i32, i32) #3

declare i8* @id3_parse_binary(i8**, i64) #3

; Function Attrs: nounwind uwtable
define i64 @id3_field_render(%union.id3_field*, i8**, i32*, i32) #0 {
  %5 = alloca i64, align 8
  %6 = alloca %union.id3_field*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  store %union.id3_field* %0, %union.id3_field** %6, align 8
  store i8** %1, i8*** %7, align 8
  store i32* %2, i32** %8, align 8
  store i32 %3, i32* %9, align 4
  %12 = load %union.id3_field*, %union.id3_field** %6, align 8
  %13 = bitcast %union.id3_field* %12 to i32*
  %14 = load i32, i32* %13, align 8
  switch i32 %14, label %200 [
    i32 13, label %18
    i32 12, label %26
    i32 11, label %34
    i32 0, label %42
    i32 10, label %50
    i32 1, label %._crit_edge
    i32 2, label %58
    i32 3, label %67
    i32 4, label %._crit_edge1
    i32 5, label %109
    i32 6, label %120
    i32 7, label %164
    i32 8, label %172
    i32 9, label %180
    i32 14, label %._crit_edge2
    i32 15, label %188
  ]

._crit_edge2:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 2)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 2)
  br label %188

._crit_edge1:                                     ; preds = %4
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 1)
  %16 = add i64 %pgocount3, 1
  store i64 %16, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 1)
  br label %109

._crit_edge:                                      ; preds = %4
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 0)
  %17 = add i64 %pgocount4, 1
  store i64 %17, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 0)
  br label %58

; <label>:18:                                     ; preds = %4
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 11)
  %19 = add i64 %pgocount5, 1
  store i64 %19, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 11)
  %20 = load i8**, i8*** %7, align 8
  %21 = load %union.id3_field*, %union.id3_field** %6, align 8
  %22 = bitcast %union.id3_field* %21 to %struct.anon*
  %23 = getelementptr inbounds %struct.anon, %struct.anon* %22, i32 0, i32 1
  %24 = load i64, i64* %23, align 8
  %25 = call i64 @id3_render_int(i8** %20, i64 %24, i32 4)
  store i64 %25, i64* %5, align 8
  br label %202

; <label>:26:                                     ; preds = %4
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 12)
  %27 = add i64 %pgocount6, 1
  store i64 %27, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 12)
  %28 = load i8**, i8*** %7, align 8
  %29 = load %union.id3_field*, %union.id3_field** %6, align 8
  %30 = bitcast %union.id3_field* %29 to %struct.anon*
  %31 = getelementptr inbounds %struct.anon, %struct.anon* %30, i32 0, i32 1
  %32 = load i64, i64* %31, align 8
  %33 = call i64 @id3_render_int(i8** %28, i64 %32, i32 3)
  store i64 %33, i64* %5, align 8
  br label %202

; <label>:34:                                     ; preds = %4
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 13)
  %35 = add i64 %pgocount7, 1
  store i64 %35, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 13)
  %36 = load i8**, i8*** %7, align 8
  %37 = load %union.id3_field*, %union.id3_field** %6, align 8
  %38 = bitcast %union.id3_field* %37 to %struct.anon*
  %39 = getelementptr inbounds %struct.anon, %struct.anon* %38, i32 0, i32 1
  %40 = load i64, i64* %39, align 8
  %41 = call i64 @id3_render_int(i8** %36, i64 %40, i32 2)
  store i64 %41, i64* %5, align 8
  br label %202

; <label>:42:                                     ; preds = %4
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 14)
  %43 = add i64 %pgocount8, 1
  store i64 %43, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 14)
  %44 = load %union.id3_field*, %union.id3_field** %6, align 8
  %45 = bitcast %union.id3_field* %44 to %struct.anon*
  %46 = getelementptr inbounds %struct.anon, %struct.anon* %45, i32 0, i32 1
  %47 = load i64, i64* %46, align 8
  %48 = trunc i64 %47 to i32
  %49 = load i32*, i32** %8, align 8
  store i32 %48, i32* %49, align 4
  br label %50

; <label>:50:                                     ; preds = %42, %4
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 7)
  %51 = add i64 %pgocount9, 1
  store i64 %51, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 7)
  %52 = load i8**, i8*** %7, align 8
  %53 = load %union.id3_field*, %union.id3_field** %6, align 8
  %54 = bitcast %union.id3_field* %53 to %struct.anon*
  %55 = getelementptr inbounds %struct.anon, %struct.anon* %54, i32 0, i32 1
  %56 = load i64, i64* %55, align 8
  %57 = call i64 @id3_render_int(i8** %52, i64 %56, i32 1)
  store i64 %57, i64* %5, align 8
  br label %202

; <label>:58:                                     ; preds = %._crit_edge, %4
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 8)
  %59 = add i64 %pgocount10, 1
  store i64 %59, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 8)
  %60 = load i8**, i8*** %7, align 8
  %61 = load %union.id3_field*, %union.id3_field** %6, align 8
  %62 = bitcast %union.id3_field* %61 to %struct.anon.0*
  %63 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %62, i32 0, i32 1
  %64 = load i8*, i8** %63, align 8
  %65 = load i32, i32* %9, align 4
  %66 = call i64 @id3_render_latin1(i8** %60, i8* %64, i32 %65)
  store i64 %66, i64* %5, align 8
  br label %202

; <label>:67:                                     ; preds = %4
  store i64 0, i64* %10, align 8
  store i32 0, i32* %11, align 4
  br label %68

; <label>:68:                                     ; preds = %102, %67
  %69 = load i32, i32* %11, align 4
  %70 = load %union.id3_field*, %union.id3_field** %6, align 8
  %71 = bitcast %union.id3_field* %70 to %struct.anon.1*
  %72 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %71, i32 0, i32 1
  %73 = load i32, i32* %72, align 4
  %74 = icmp ult i32 %69, %73
  br i1 %74, label %75, label %106

; <label>:75:                                     ; preds = %68
  %76 = load i8**, i8*** %7, align 8
  %77 = load %union.id3_field*, %union.id3_field** %6, align 8
  %78 = bitcast %union.id3_field* %77 to %struct.anon.1*
  %79 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %78, i32 0, i32 2
  %80 = load i8**, i8*** %79, align 8
  %81 = load i32, i32* %11, align 4
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i8*, i8** %80, i64 %82
  %84 = load i8*, i8** %83, align 8
  %85 = load i32, i32* %11, align 4
  %86 = load %union.id3_field*, %union.id3_field** %6, align 8
  %87 = bitcast %union.id3_field* %86 to %struct.anon.1*
  %88 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %87, i32 0, i32 1
  %89 = load i32, i32* %88, align 4
  %90 = sub i32 %89, 1
  %91 = icmp ult i32 %85, %90
  br i1 %91, label %96, label %92

; <label>:92:                                     ; preds = %75
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 5)
  %93 = add i64 %pgocount11, 1
  store i64 %93, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 5)
  %94 = load i32, i32* %9, align 4
  %95 = icmp ne i32 %94, 0
  br label %96

; <label>:96:                                     ; preds = %92, %75
  %97 = phi i1 [ true, %75 ], [ %95, %92 ]
  %98 = zext i1 %97 to i32
  %99 = call i64 @id3_render_latin1(i8** %76, i8* %84, i32 %98)
  %100 = load i64, i64* %10, align 8
  %101 = add i64 %100, %99
  store i64 %101, i64* %10, align 8
  br label %102

; <label>:102:                                    ; preds = %96
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 3)
  %103 = add i64 %pgocount12, 1
  store i64 %103, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 3)
  %104 = load i32, i32* %11, align 4
  %105 = add i32 %104, 1
  store i32 %105, i32* %11, align 4
  br label %68

; <label>:106:                                    ; preds = %68
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 15)
  %107 = add i64 %pgocount13, 1
  store i64 %107, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 15)
  %108 = load i64, i64* %10, align 8
  store i64 %108, i64* %5, align 8
  br label %202

; <label>:109:                                    ; preds = %._crit_edge1, %4
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 10)
  %110 = add i64 %pgocount14, 1
  store i64 %110, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 10)
  %111 = load i8**, i8*** %7, align 8
  %112 = load %union.id3_field*, %union.id3_field** %6, align 8
  %113 = bitcast %union.id3_field* %112 to %struct.anon.2*
  %114 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %113, i32 0, i32 1
  %115 = load i64*, i64** %114, align 8
  %116 = load i32*, i32** %8, align 8
  %117 = load i32, i32* %116, align 4
  %118 = load i32, i32* %9, align 4
  %119 = call i64 @id3_render_string(i8** %111, i64* %115, i32 %117, i32 %118)
  store i64 %119, i64* %5, align 8
  br label %202

; <label>:120:                                    ; preds = %4
  store i64 0, i64* %10, align 8
  store i32 0, i32* %11, align 4
  br label %121

; <label>:121:                                    ; preds = %157, %120
  %122 = load i32, i32* %11, align 4
  %123 = load %union.id3_field*, %union.id3_field** %6, align 8
  %124 = bitcast %union.id3_field* %123 to %struct.anon.3*
  %125 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %124, i32 0, i32 1
  %126 = load i32, i32* %125, align 4
  %127 = icmp ult i32 %122, %126
  br i1 %127, label %128, label %161

; <label>:128:                                    ; preds = %121
  %129 = load i8**, i8*** %7, align 8
  %130 = load %union.id3_field*, %union.id3_field** %6, align 8
  %131 = bitcast %union.id3_field* %130 to %struct.anon.3*
  %132 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %131, i32 0, i32 2
  %133 = load i64**, i64*** %132, align 8
  %134 = load i32, i32* %11, align 4
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds i64*, i64** %133, i64 %135
  %137 = load i64*, i64** %136, align 8
  %138 = load i32*, i32** %8, align 8
  %139 = load i32, i32* %138, align 4
  %140 = load i32, i32* %11, align 4
  %141 = load %union.id3_field*, %union.id3_field** %6, align 8
  %142 = bitcast %union.id3_field* %141 to %struct.anon.3*
  %143 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %142, i32 0, i32 1
  %144 = load i32, i32* %143, align 4
  %145 = sub i32 %144, 1
  %146 = icmp ult i32 %140, %145
  br i1 %146, label %151, label %147

; <label>:147:                                    ; preds = %128
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 6)
  %148 = add i64 %pgocount15, 1
  store i64 %148, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 6)
  %149 = load i32, i32* %9, align 4
  %150 = icmp ne i32 %149, 0
  br label %151

; <label>:151:                                    ; preds = %147, %128
  %152 = phi i1 [ true, %128 ], [ %150, %147 ]
  %153 = zext i1 %152 to i32
  %154 = call i64 @id3_render_string(i8** %129, i64* %137, i32 %139, i32 %153)
  %155 = load i64, i64* %10, align 8
  %156 = add i64 %155, %154
  store i64 %156, i64* %10, align 8
  br label %157

; <label>:157:                                    ; preds = %151
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 4)
  %158 = add i64 %pgocount16, 1
  store i64 %158, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 4)
  %159 = load i32, i32* %11, align 4
  %160 = add i32 %159, 1
  store i32 %160, i32* %11, align 4
  br label %121

; <label>:161:                                    ; preds = %121
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 16)
  %162 = add i64 %pgocount17, 1
  store i64 %162, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 16)
  %163 = load i64, i64* %10, align 8
  store i64 %163, i64* %5, align 8
  br label %202

; <label>:164:                                    ; preds = %4
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 17)
  %165 = add i64 %pgocount18, 1
  store i64 %165, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 17)
  %166 = load i8**, i8*** %7, align 8
  %167 = load %union.id3_field*, %union.id3_field** %6, align 8
  %168 = bitcast %union.id3_field* %167 to %struct.anon.4*
  %169 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %168, i32 0, i32 1
  %170 = getelementptr inbounds [9 x i8], [9 x i8]* %169, i32 0, i32 0
  %171 = call i64 @id3_render_immediate(i8** %166, i8* %170, i32 3)
  store i64 %171, i64* %5, align 8
  br label %202

; <label>:172:                                    ; preds = %4
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 20)
  %173 = add i64 %pgocount19, 1
  store i64 %173, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 20)
  %174 = load i8**, i8*** %7, align 8
  %175 = load %union.id3_field*, %union.id3_field** %6, align 8
  %176 = bitcast %union.id3_field* %175 to %struct.anon.4*
  %177 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %176, i32 0, i32 1
  %178 = getelementptr inbounds [9 x i8], [9 x i8]* %177, i32 0, i32 0
  %179 = call i64 @id3_render_immediate(i8** %174, i8* %178, i32 4)
  store i64 %179, i64* %5, align 8
  br label %202

; <label>:180:                                    ; preds = %4
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 18)
  %181 = add i64 %pgocount20, 1
  store i64 %181, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 18)
  %182 = load i8**, i8*** %7, align 8
  %183 = load %union.id3_field*, %union.id3_field** %6, align 8
  %184 = bitcast %union.id3_field* %183 to %struct.anon.4*
  %185 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %184, i32 0, i32 1
  %186 = getelementptr inbounds [9 x i8], [9 x i8]* %185, i32 0, i32 0
  %187 = call i64 @id3_render_immediate(i8** %182, i8* %186, i32 8)
  store i64 %187, i64* %5, align 8
  br label %202

; <label>:188:                                    ; preds = %._crit_edge2, %4
  %pgocount21 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 9)
  %189 = add i64 %pgocount21, 1
  store i64 %189, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 9)
  %190 = load i8**, i8*** %7, align 8
  %191 = load %union.id3_field*, %union.id3_field** %6, align 8
  %192 = bitcast %union.id3_field* %191 to %struct.anon.5*
  %193 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %192, i32 0, i32 1
  %194 = load i8*, i8** %193, align 8
  %195 = load %union.id3_field*, %union.id3_field** %6, align 8
  %196 = bitcast %union.id3_field* %195 to %struct.anon.5*
  %197 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %196, i32 0, i32 2
  %198 = load i64, i64* %197, align 8
  %199 = call i64 @id3_render_binary(i8** %190, i8* %194, i64 %198)
  store i64 %199, i64* %5, align 8
  br label %202

; <label>:200:                                    ; preds = %4
  %pgocount22 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 19)
  %201 = add i64 %pgocount22, 1
  store i64 %201, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_id3_field_render, i64 0, i64 19)
  store i64 0, i64* %5, align 8
  br label %202

; <label>:202:                                    ; preds = %200, %188, %180, %172, %164, %161, %109, %106, %58, %50, %34, %26, %18
  %203 = load i64, i64* %5, align 8
  ret i64 %203
}

declare i64 @id3_render_int(i8**, i64, i32) #3

declare i64 @id3_render_latin1(i8**, i8*, i32) #3

declare i64 @id3_render_string(i8**, i64*, i32, i32) #3

declare i64 @id3_render_immediate(i8**, i8*, i32) #3

declare i64 @id3_render_binary(i8**, i8*, i64) #3

; Function Attrs: nounwind uwtable
define i32 @id3_field_setint(%union.id3_field*, i64) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i64, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load %union.id3_field*, %union.id3_field** %4, align 8
  %7 = bitcast %union.id3_field* %6 to i32*
  %8 = load i32, i32* %7, align 8
  switch i32 %8, label %53 [
    i32 10, label %9
    i32 11, label %20
    i32 12, label %31
    i32 13, label %42
  ]

; <label>:9:                                      ; preds = %2
  %10 = load i64, i64* %5, align 8
  %11 = icmp sgt i64 %10, 127
  br i1 %11, label %16, label %12

; <label>:12:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 8)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 8)
  %14 = load i64, i64* %5, align 8
  %15 = icmp slt i64 %14, -128
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %12, %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 4)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 4)
  store i32 -1, i32* %3, align 4
  br label %60

; <label>:18:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 12)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 12)
  br label %55

; <label>:20:                                     ; preds = %2
  %21 = load i64, i64* %5, align 8
  %22 = icmp sgt i64 %21, 32767
  br i1 %22, label %27, label %23

; <label>:23:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 5)
  %24 = add i64 %pgocount3, 1
  store i64 %24, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 5)
  %25 = load i64, i64* %5, align 8
  %26 = icmp slt i64 %25, -32768
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %23, %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 1)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %60

; <label>:29:                                     ; preds = %23
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 9)
  %30 = add i64 %pgocount5, 1
  store i64 %30, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 9)
  br label %55

; <label>:31:                                     ; preds = %2
  %32 = load i64, i64* %5, align 8
  %33 = icmp sgt i64 %32, 8388607
  br i1 %33, label %38, label %34

; <label>:34:                                     ; preds = %31
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 6)
  %35 = add i64 %pgocount6, 1
  store i64 %35, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 6)
  %36 = load i64, i64* %5, align 8
  %37 = icmp slt i64 %36, -8388608
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %34, %31
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 2)
  %39 = add i64 %pgocount7, 1
  store i64 %39, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 2)
  store i32 -1, i32* %3, align 4
  br label %60

; <label>:40:                                     ; preds = %34
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 10)
  %41 = add i64 %pgocount8, 1
  store i64 %41, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 10)
  br label %55

; <label>:42:                                     ; preds = %2
  %43 = load i64, i64* %5, align 8
  %44 = icmp sgt i64 %43, 2147483647
  br i1 %44, label %49, label %45

; <label>:45:                                     ; preds = %42
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 7)
  %46 = add i64 %pgocount9, 1
  store i64 %46, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 7)
  %47 = load i64, i64* %5, align 8
  %48 = icmp slt i64 %47, -2147483648
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %45, %42
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 3)
  %50 = add i64 %pgocount10, 1
  store i64 %50, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 3)
  store i32 -1, i32* %3, align 4
  br label %60

; <label>:51:                                     ; preds = %45
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 11)
  %52 = add i64 %pgocount11, 1
  store i64 %52, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 11)
  br label %55

; <label>:53:                                     ; preds = %2
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 0)
  %54 = add i64 %pgocount12, 1
  store i64 %54, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_field_setint, i64 0, i64 0)
  store i32 -1, i32* %3, align 4
  br label %60

; <label>:55:                                     ; preds = %51, %40, %29, %18
  %56 = load i64, i64* %5, align 8
  %57 = load %union.id3_field*, %union.id3_field** %4, align 8
  %58 = bitcast %union.id3_field* %57 to %struct.anon*
  %59 = getelementptr inbounds %struct.anon, %struct.anon* %58, i32 0, i32 1
  store i64 %56, i64* %59, align 8
  store i32 0, i32* %3, align 4
  br label %60

; <label>:60:                                     ; preds = %55, %53, %49, %38, %27, %16
  %61 = load i32, i32* %3, align 4
  ret i32 %61
}

; Function Attrs: nounwind uwtable
define i32 @id3_field_settextencoding(%union.id3_field*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i32, align 4
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %union.id3_field*, %union.id3_field** %4, align 8
  %7 = bitcast %union.id3_field* %6 to i32*
  %8 = load i32, i32* %7, align 8
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_settextencoding, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_settextencoding, i64 0, i64 0)
  store i32 -1, i32* %3, align 4
  br label %20

; <label>:12:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_settextencoding, i64 0, i64 1)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_settextencoding, i64 0, i64 1)
  %14 = load %union.id3_field*, %union.id3_field** %4, align 8
  call void @id3_field_finish(%union.id3_field* %14)
  %15 = load i32, i32* %5, align 4
  %16 = zext i32 %15 to i64
  %17 = load %union.id3_field*, %union.id3_field** %4, align 8
  %18 = bitcast %union.id3_field* %17 to %struct.anon*
  %19 = getelementptr inbounds %struct.anon, %struct.anon* %18, i32 0, i32 1
  store i64 %16, i64* %19, align 8
  store i32 0, i32* %3, align 4
  br label %20

; <label>:20:                                     ; preds = %12, %10
  %21 = load i32, i32* %3, align 4
  ret i32 %21
}

; Function Attrs: nounwind uwtable
define i32 @id3_field_setlatin1(%union.id3_field*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i8* %1, i8** %5, align 8
  %7 = load %union.id3_field*, %union.id3_field** %4, align 8
  %8 = bitcast %union.id3_field* %7 to i32*
  %9 = load i32, i32* %8, align 8
  %10 = icmp ne i32 %9, 1
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setlatin1, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setlatin1, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %42

; <label>:13:                                     ; preds = %2
  %14 = load %union.id3_field*, %union.id3_field** %4, align 8
  call void @id3_field_finish(%union.id3_field* %14)
  %15 = load i8*, i8** %5, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %17, label %37

; <label>:17:                                     ; preds = %13
  %18 = load i8*, i8** %5, align 8
  store i8* %18, i8** %6, align 8
  br label %19

; <label>:19:                                     ; preds = %31, %17
  %20 = load i8*, i8** %6, align 8
  %21 = load i8, i8* %20, align 1
  %22 = icmp ne i8 %21, 0
  br i1 %22, label %23, label %35

; <label>:23:                                     ; preds = %19
  %24 = load i8*, i8** %6, align 8
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i32
  %27 = icmp eq i32 %26, 10
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setlatin1, i64 0, i64 4)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setlatin1, i64 0, i64 4)
  store i32 -1, i32* %3, align 4
  br label %42

; <label>:30:                                     ; preds = %23
  br label %31

; <label>:31:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setlatin1, i64 0, i64 0)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setlatin1, i64 0, i64 0)
  %33 = load i8*, i8** %6, align 8
  %34 = getelementptr inbounds i8, i8* %33, i32 1
  store i8* %34, i8** %6, align 8
  br label %19

; <label>:35:                                     ; preds = %19
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setlatin1, i64 0, i64 3)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setlatin1, i64 0, i64 3)
  br label %37

; <label>:37:                                     ; preds = %35, %13
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setlatin1, i64 0, i64 2)
  %38 = add i64 %pgocount4, 1
  store i64 %38, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setlatin1, i64 0, i64 2)
  %39 = load %union.id3_field*, %union.id3_field** %4, align 8
  %40 = load i8*, i8** %5, align 8
  %41 = call i32 @set_latin1(%union.id3_field* %39, i8* %40)
  store i32 %41, i32* %3, align 4
  br label %42

; <label>:42:                                     ; preds = %37, %28, %11
  %43 = load i32, i32* %3, align 4
  ret i32 %43
}

; Function Attrs: nounwind uwtable
define internal i32 @set_latin1(%union.id3_field*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i8* %1, i8** %5, align 8
  %7 = load i8*, i8** %5, align 8
  %8 = icmp eq i8* %7, null
  br i1 %8, label %15, label %9

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_latin1, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_latin1, i64 0, i64 0)
  %11 = load i8*, i8** %5, align 8
  %12 = load i8, i8* %11, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %9, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_latin1, i64 0, i64 1)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_latin1, i64 0, i64 1)
  store i8* null, i8** %6, align 8
  br label %26

; <label>:17:                                     ; preds = %9
  %18 = load i8*, i8** %5, align 8
  %19 = call i8* @id3_latin1_duplicate(i8* %18)
  store i8* %19, i8** %6, align 8
  %20 = load i8*, i8** %6, align 8
  %21 = icmp eq i8* %20, null
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_latin1, i64 0, i64 3)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_latin1, i64 0, i64 3)
  store i32 -1, i32* %3, align 4
  br label %31

; <label>:24:                                     ; preds = %17
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_latin1, i64 0, i64 2)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_latin1, i64 0, i64 2)
  br label %26

; <label>:26:                                     ; preds = %24, %15
  %27 = load i8*, i8** %6, align 8
  %28 = load %union.id3_field*, %union.id3_field** %4, align 8
  %29 = bitcast %union.id3_field* %28 to %struct.anon.0*
  %30 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %29, i32 0, i32 1
  store i8* %27, i8** %30, align 8
  store i32 0, i32* %3, align 4
  br label %31

; <label>:31:                                     ; preds = %26, %22
  %32 = load i32, i32* %3, align 4
  ret i32 %32
}

; Function Attrs: nounwind uwtable
define i32 @id3_field_setfulllatin1(%union.id3_field*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i8*, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load %union.id3_field*, %union.id3_field** %4, align 8
  %7 = bitcast %union.id3_field* %6 to i32*
  %8 = load i32, i32* %7, align 8
  %9 = icmp ne i32 %8, 2
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setfulllatin1, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setfulllatin1, i64 0, i64 0)
  store i32 -1, i32* %3, align 4
  br label %18

; <label>:12:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setfulllatin1, i64 0, i64 1)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setfulllatin1, i64 0, i64 1)
  %14 = load %union.id3_field*, %union.id3_field** %4, align 8
  call void @id3_field_finish(%union.id3_field* %14)
  %15 = load %union.id3_field*, %union.id3_field** %4, align 8
  %16 = load i8*, i8** %5, align 8
  %17 = call i32 @set_latin1(%union.id3_field* %15, i8* %16)
  store i32 %17, i32* %3, align 4
  br label %18

; <label>:18:                                     ; preds = %12, %10
  %19 = load i32, i32* %3, align 4
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define i32 @id3_field_setstring(%union.id3_field*, i64*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64*, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i64* %1, i64** %5, align 8
  %7 = load %union.id3_field*, %union.id3_field** %4, align 8
  %8 = bitcast %union.id3_field* %7 to i32*
  %9 = load i32, i32* %8, align 8
  %10 = icmp ne i32 %9, 4
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setstring, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setstring, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %41

; <label>:13:                                     ; preds = %2
  %14 = load %union.id3_field*, %union.id3_field** %4, align 8
  call void @id3_field_finish(%union.id3_field* %14)
  %15 = load i64*, i64** %5, align 8
  %16 = icmp ne i64* %15, null
  br i1 %16, label %17, label %36

; <label>:17:                                     ; preds = %13
  %18 = load i64*, i64** %5, align 8
  store i64* %18, i64** %6, align 8
  br label %19

; <label>:19:                                     ; preds = %30, %17
  %20 = load i64*, i64** %6, align 8
  %21 = load i64, i64* %20, align 8
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %34

; <label>:23:                                     ; preds = %19
  %24 = load i64*, i64** %6, align 8
  %25 = load i64, i64* %24, align 8
  %26 = icmp eq i64 %25, 10
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setstring, i64 0, i64 4)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setstring, i64 0, i64 4)
  store i32 -1, i32* %3, align 4
  br label %41

; <label>:29:                                     ; preds = %23
  br label %30

; <label>:30:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setstring, i64 0, i64 0)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setstring, i64 0, i64 0)
  %32 = load i64*, i64** %6, align 8
  %33 = getelementptr inbounds i64, i64* %32, i32 1
  store i64* %33, i64** %6, align 8
  br label %19

; <label>:34:                                     ; preds = %19
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setstring, i64 0, i64 3)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setstring, i64 0, i64 3)
  br label %36

; <label>:36:                                     ; preds = %34, %13
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setstring, i64 0, i64 2)
  %37 = add i64 %pgocount4, 1
  store i64 %37, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_setstring, i64 0, i64 2)
  %38 = load %union.id3_field*, %union.id3_field** %4, align 8
  %39 = load i64*, i64** %5, align 8
  %40 = call i32 @set_string(%union.id3_field* %38, i64* %39)
  store i32 %40, i32* %3, align 4
  br label %41

; <label>:41:                                     ; preds = %36, %27, %11
  %42 = load i32, i32* %3, align 4
  ret i32 %42
}

; Function Attrs: nounwind uwtable
define internal i32 @set_string(%union.id3_field*, i64*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64*, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i64* %1, i64** %5, align 8
  %7 = load i64*, i64** %5, align 8
  %8 = icmp eq i64* %7, null
  br i1 %8, label %14, label %9

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_string, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_string, i64 0, i64 0)
  %11 = load i64*, i64** %5, align 8
  %12 = load i64, i64* %11, align 8
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_string, i64 0, i64 1)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_string, i64 0, i64 1)
  store i64* null, i64** %6, align 8
  br label %25

; <label>:16:                                     ; preds = %9
  %17 = load i64*, i64** %5, align 8
  %18 = call i64* @id3_ucs4_duplicate(i64* %17)
  store i64* %18, i64** %6, align 8
  %19 = load i64*, i64** %6, align 8
  %20 = icmp eq i64* %19, null
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_string, i64 0, i64 3)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_string, i64 0, i64 3)
  store i32 -1, i32* %3, align 4
  br label %30

; <label>:23:                                     ; preds = %16
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_string, i64 0, i64 2)
  %24 = add i64 %pgocount3, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_string, i64 0, i64 2)
  br label %25

; <label>:25:                                     ; preds = %23, %14
  %26 = load i64*, i64** %6, align 8
  %27 = load %union.id3_field*, %union.id3_field** %4, align 8
  %28 = bitcast %union.id3_field* %27 to %struct.anon.2*
  %29 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %28, i32 0, i32 1
  store i64* %26, i64** %29, align 8
  store i32 0, i32* %3, align 4
  br label %30

; <label>:30:                                     ; preds = %25, %21
  %31 = load i32, i32* %3, align 4
  ret i32 %31
}

; Function Attrs: nounwind uwtable
define i32 @id3_field_setfullstring(%union.id3_field*, i64*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i64*, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i64* %1, i64** %5, align 8
  %6 = load %union.id3_field*, %union.id3_field** %4, align 8
  %7 = bitcast %union.id3_field* %6 to i32*
  %8 = load i32, i32* %7, align 8
  %9 = icmp ne i32 %8, 5
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setfullstring, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setfullstring, i64 0, i64 0)
  store i32 -1, i32* %3, align 4
  br label %18

; <label>:12:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setfullstring, i64 0, i64 1)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setfullstring, i64 0, i64 1)
  %14 = load %union.id3_field*, %union.id3_field** %4, align 8
  call void @id3_field_finish(%union.id3_field* %14)
  %15 = load %union.id3_field*, %union.id3_field** %4, align 8
  %16 = load i64*, i64** %5, align 8
  %17 = call i32 @set_string(%union.id3_field* %15, i64* %16)
  store i32 %17, i32* %3, align 4
  br label %18

; <label>:18:                                     ; preds = %12, %10
  %19 = load i32, i32* %3, align 4
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define i32 @id3_field_setstrings(%union.id3_field*, i32, i64**) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %union.id3_field*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64**, align 8
  %8 = alloca i64**, align 8
  %9 = alloca i32, align 4
  store %union.id3_field* %0, %union.id3_field** %5, align 8
  store i32 %1, i32* %6, align 4
  store i64** %2, i64*** %7, align 8
  %10 = load %union.id3_field*, %union.id3_field** %5, align 8
  %11 = bitcast %union.id3_field* %10 to i32*
  %12 = load i32, i32* %11, align 8
  %13 = icmp ne i32 %12, 6
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 2)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 2)
  store i32 -1, i32* %4, align 4
  br label %86

; <label>:16:                                     ; preds = %3
  %17 = load %union.id3_field*, %union.id3_field** %5, align 8
  call void @id3_field_finish(%union.id3_field* %17)
  %18 = load i32, i32* %6, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 3)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 3)
  store i32 0, i32* %4, align 4
  br label %86

; <label>:22:                                     ; preds = %16
  %23 = load i32, i32* %6, align 4
  %24 = zext i32 %23 to i64
  %25 = mul i64 %24, 8
  %26 = call noalias i8* @malloc(i64 %25) #6
  %27 = bitcast i8* %26 to i64**
  store i64** %27, i64*** %8, align 8
  %28 = load i64**, i64*** %8, align 8
  %29 = icmp eq i64** %28, null
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 4)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 4)
  store i32 -1, i32* %4, align 4
  br label %86

; <label>:32:                                     ; preds = %22
  store i32 0, i32* %9, align 4
  br label %33

; <label>:33:                                     ; preds = %72, %32
  %34 = load i32, i32* %9, align 4
  %35 = load i32, i32* %6, align 4
  %36 = icmp ult i32 %34, %35
  br i1 %36, label %37, label %76

; <label>:37:                                     ; preds = %33
  %38 = load i64**, i64*** %7, align 8
  %39 = load i32, i32* %9, align 4
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i64*, i64** %38, i64 %40
  %42 = load i64*, i64** %41, align 8
  %43 = call i64* @id3_ucs4_duplicate(i64* %42)
  %44 = load i64**, i64*** %8, align 8
  %45 = load i32, i32* %9, align 4
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i64*, i64** %44, i64 %46
  store i64* %43, i64** %47, align 8
  %48 = load i64**, i64*** %8, align 8
  %49 = load i32, i32* %9, align 4
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i64*, i64** %48, i64 %50
  %52 = load i64*, i64** %51, align 8
  %53 = icmp eq i64* %52, null
  br i1 %53, label %54, label %71

; <label>:54:                                     ; preds = %37
  br label %55

; <label>:55:                                     ; preds = %59, %54
  %56 = load i32, i32* %9, align 4
  %57 = add i32 %56, -1
  store i32 %57, i32* %9, align 4
  %58 = icmp ne i32 %56, 0
  br i1 %58, label %59, label %67

; <label>:59:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 0)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 0)
  %61 = load i64**, i64*** %8, align 8
  %62 = load i32, i32* %9, align 4
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i64*, i64** %61, i64 %63
  %65 = load i64*, i64** %64, align 8
  %66 = bitcast i64* %65 to i8*
  call void @free(i8* %66) #6
  br label %55

; <label>:67:                                     ; preds = %55
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 6)
  %68 = add i64 %pgocount4, 1
  store i64 %68, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 6)
  %69 = load i64**, i64*** %8, align 8
  %70 = bitcast i64** %69 to i8*
  call void @free(i8* %70) #6
  store i32 -1, i32* %4, align 4
  br label %86

; <label>:71:                                     ; preds = %37
  br label %72

; <label>:72:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 1)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 1)
  %74 = load i32, i32* %9, align 4
  %75 = add i32 %74, 1
  store i32 %75, i32* %9, align 4
  br label %33

; <label>:76:                                     ; preds = %33
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 5)
  %77 = add i64 %pgocount6, 1
  store i64 %77, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_field_setstrings, i64 0, i64 5)
  %78 = load i64**, i64*** %8, align 8
  %79 = load %union.id3_field*, %union.id3_field** %5, align 8
  %80 = bitcast %union.id3_field* %79 to %struct.anon.3*
  %81 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %80, i32 0, i32 2
  store i64** %78, i64*** %81, align 8
  %82 = load i32, i32* %6, align 4
  %83 = load %union.id3_field*, %union.id3_field** %5, align 8
  %84 = bitcast %union.id3_field* %83 to %struct.anon.3*
  %85 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %84, i32 0, i32 1
  store i32 %82, i32* %85, align 4
  store i32 0, i32* %4, align 4
  br label %86

; <label>:86:                                     ; preds = %76, %67, %30, %20, %14
  %87 = load i32, i32* %4, align 4
  ret i32 %87
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i64* @id3_ucs4_duplicate(i64*) #3

; Function Attrs: nounwind uwtable
define i32 @id3_field_addstring(%union.id3_field*, i64*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca i64**, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i64* %1, i64** %5, align 8
  %8 = load %union.id3_field*, %union.id3_field** %4, align 8
  %9 = bitcast %union.id3_field* %8 to i32*
  %10 = load i32, i32* %9, align 8
  %11 = icmp ne i32 %10, 6
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_addstring, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_addstring, i64 0, i64 0)
  store i32 -1, i32* %3, align 4
  br label %60

; <label>:14:                                     ; preds = %2
  %15 = load i64*, i64** %5, align 8
  %16 = call i64* @id3_ucs4_duplicate(i64* %15)
  store i64* %16, i64** %6, align 8
  %17 = load i64*, i64** %6, align 8
  %18 = icmp eq i64* %17, null
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_addstring, i64 0, i64 2)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_addstring, i64 0, i64 2)
  store i32 -1, i32* %3, align 4
  br label %60

; <label>:21:                                     ; preds = %14
  %22 = load %union.id3_field*, %union.id3_field** %4, align 8
  %23 = bitcast %union.id3_field* %22 to %struct.anon.3*
  %24 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %23, i32 0, i32 2
  %25 = load i64**, i64*** %24, align 8
  %26 = bitcast i64** %25 to i8*
  %27 = load %union.id3_field*, %union.id3_field** %4, align 8
  %28 = bitcast %union.id3_field* %27 to %struct.anon.3*
  %29 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %28, i32 0, i32 1
  %30 = load i32, i32* %29, align 4
  %31 = add i32 %30, 1
  %32 = zext i32 %31 to i64
  %33 = mul i64 %32, 8
  %34 = call i8* @realloc(i8* %26, i64 %33) #6
  %35 = bitcast i8* %34 to i64**
  store i64** %35, i64*** %7, align 8
  %36 = load i64**, i64*** %7, align 8
  %37 = icmp eq i64** %36, null
  br i1 %37, label %38, label %42

; <label>:38:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_addstring, i64 0, i64 3)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_addstring, i64 0, i64 3)
  %40 = load i64*, i64** %6, align 8
  %41 = bitcast i64* %40 to i8*
  call void @free(i8* %41) #6
  store i32 -1, i32* %3, align 4
  br label %60

; <label>:42:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_addstring, i64 0, i64 1)
  %43 = add i64 %pgocount3, 1
  store i64 %43, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_addstring, i64 0, i64 1)
  %44 = load i64**, i64*** %7, align 8
  %45 = load %union.id3_field*, %union.id3_field** %4, align 8
  %46 = bitcast %union.id3_field* %45 to %struct.anon.3*
  %47 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %46, i32 0, i32 2
  store i64** %44, i64*** %47, align 8
  %48 = load i64*, i64** %6, align 8
  %49 = load %union.id3_field*, %union.id3_field** %4, align 8
  %50 = bitcast %union.id3_field* %49 to %struct.anon.3*
  %51 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %50, i32 0, i32 2
  %52 = load i64**, i64*** %51, align 8
  %53 = load %union.id3_field*, %union.id3_field** %4, align 8
  %54 = bitcast %union.id3_field* %53 to %struct.anon.3*
  %55 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %54, i32 0, i32 1
  %56 = load i32, i32* %55, align 4
  %57 = add i32 %56, 1
  store i32 %57, i32* %55, align 4
  %58 = zext i32 %56 to i64
  %59 = getelementptr inbounds i64*, i64** %52, i64 %58
  store i64* %48, i64** %59, align 8
  store i32 0, i32* %3, align 4
  br label %60

; <label>:60:                                     ; preds = %42, %38, %19, %12
  %61 = load i32, i32* %3, align 4
  ret i32 %61
}

; Function Attrs: nounwind uwtable
define i32 @id3_field_setlanguage(%union.id3_field*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i8*, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load %union.id3_field*, %union.id3_field** %4, align 8
  %7 = bitcast %union.id3_field* %6 to i32*
  %8 = load i32, i32* %7, align 8
  %9 = icmp ne i32 %8, 7
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setlanguage, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setlanguage, i64 0, i64 0)
  store i32 -1, i32* %3, align 4
  br label %31

; <label>:12:                                     ; preds = %2
  %13 = load %union.id3_field*, %union.id3_field** %4, align 8
  call void @id3_field_finish(%union.id3_field* %13)
  %14 = load i8*, i8** %5, align 8
  %15 = icmp eq i8* %14, null
  br i1 %15, label %21, label %16

; <label>:16:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setlanguage, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setlanguage, i64 0, i64 2)
  %18 = load i8*, i8** %5, align 8
  %19 = call i64 @strlen(i8* %18) #7
  %20 = icmp ne i64 %19, 3
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %16, %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setlanguage, i64 0, i64 1)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setlanguage, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %31

; <label>:23:                                     ; preds = %16
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setlanguage, i64 0, i64 3)
  %24 = add i64 %pgocount3, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setlanguage, i64 0, i64 3)
  %25 = load %union.id3_field*, %union.id3_field** %4, align 8
  %26 = bitcast %union.id3_field* %25 to %struct.anon.4*
  %27 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %26, i32 0, i32 1
  %28 = getelementptr inbounds [9 x i8], [9 x i8]* %27, i32 0, i32 0
  %29 = load i8*, i8** %5, align 8
  %30 = call i8* @strcpy(i8* %28, i8* %29) #6
  store i32 0, i32* %3, align 4
  br label %31

; <label>:31:                                     ; preds = %23, %21, %10
  %32 = load i32, i32* %3, align 4
  ret i32 %32
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

; Function Attrs: nounwind uwtable
define i32 @id3_field_setframeid(%union.id3_field*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i8*, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load %union.id3_field*, %union.id3_field** %4, align 8
  %7 = bitcast %union.id3_field* %6 to i32*
  %8 = load i32, i32* %7, align 8
  %9 = icmp ne i32 %8, 8
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setframeid, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setframeid, i64 0, i64 0)
  store i32 -1, i32* %3, align 4
  br label %47

; <label>:12:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setframeid, i64 0, i64 1)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_setframeid, i64 0, i64 1)
  %14 = load %union.id3_field*, %union.id3_field** %4, align 8
  call void @id3_field_finish(%union.id3_field* %14)
  %15 = load i8*, i8** %5, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 0
  %17 = load i8, i8* %16, align 1
  %18 = load %union.id3_field*, %union.id3_field** %4, align 8
  %19 = bitcast %union.id3_field* %18 to %struct.anon.4*
  %20 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %19, i32 0, i32 1
  %21 = getelementptr inbounds [9 x i8], [9 x i8]* %20, i64 0, i64 0
  store i8 %17, i8* %21, align 4
  %22 = load i8*, i8** %5, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 1
  %24 = load i8, i8* %23, align 1
  %25 = load %union.id3_field*, %union.id3_field** %4, align 8
  %26 = bitcast %union.id3_field* %25 to %struct.anon.4*
  %27 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %26, i32 0, i32 1
  %28 = getelementptr inbounds [9 x i8], [9 x i8]* %27, i64 0, i64 1
  store i8 %24, i8* %28, align 1
  %29 = load i8*, i8** %5, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 2
  %31 = load i8, i8* %30, align 1
  %32 = load %union.id3_field*, %union.id3_field** %4, align 8
  %33 = bitcast %union.id3_field* %32 to %struct.anon.4*
  %34 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %33, i32 0, i32 1
  %35 = getelementptr inbounds [9 x i8], [9 x i8]* %34, i64 0, i64 2
  store i8 %31, i8* %35, align 2
  %36 = load i8*, i8** %5, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 3
  %38 = load i8, i8* %37, align 1
  %39 = load %union.id3_field*, %union.id3_field** %4, align 8
  %40 = bitcast %union.id3_field* %39 to %struct.anon.4*
  %41 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %40, i32 0, i32 1
  %42 = getelementptr inbounds [9 x i8], [9 x i8]* %41, i64 0, i64 3
  store i8 %38, i8* %42, align 1
  %43 = load %union.id3_field*, %union.id3_field** %4, align 8
  %44 = bitcast %union.id3_field* %43 to %struct.anon.4*
  %45 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %44, i32 0, i32 1
  %46 = getelementptr inbounds [9 x i8], [9 x i8]* %45, i64 0, i64 4
  store i8 0, i8* %46, align 4
  store i32 0, i32* %3, align 4
  br label %47

; <label>:47:                                     ; preds = %12, %10
  %48 = load i32, i32* %3, align 4
  ret i32 %48
}

; Function Attrs: nounwind uwtable
define i32 @id3_field_setbinarydata(%union.id3_field*, i8*, i64) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %union.id3_field*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  store %union.id3_field* %0, %union.id3_field** %5, align 8
  store i8* %1, i8** %6, align 8
  store i64 %2, i64* %7, align 8
  %9 = load %union.id3_field*, %union.id3_field** %5, align 8
  %10 = bitcast %union.id3_field* %9 to i32*
  %11 = load i32, i32* %10, align 8
  %12 = icmp ne i32 %11, 15
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setbinarydata, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setbinarydata, i64 0, i64 0)
  store i32 -1, i32* %4, align 4
  br label %42

; <label>:15:                                     ; preds = %3
  %16 = load %union.id3_field*, %union.id3_field** %5, align 8
  call void @id3_field_finish(%union.id3_field* %16)
  %17 = load i64, i64* %7, align 8
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setbinarydata, i64 0, i64 2)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setbinarydata, i64 0, i64 2)
  store i8* null, i8** %8, align 8
  br label %33

; <label>:21:                                     ; preds = %15
  %22 = load i64, i64* %7, align 8
  %23 = call noalias i8* @malloc(i64 %22) #6
  store i8* %23, i8** %8, align 8
  %24 = load i8*, i8** %8, align 8
  %25 = icmp eq i8* %24, null
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setbinarydata, i64 0, i64 3)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setbinarydata, i64 0, i64 3)
  store i32 -1, i32* %4, align 4
  br label %42

; <label>:28:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setbinarydata, i64 0, i64 1)
  %29 = add i64 %pgocount3, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_setbinarydata, i64 0, i64 1)
  %30 = load i8*, i8** %8, align 8
  %31 = load i8*, i8** %6, align 8
  %32 = load i64, i64* %7, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %31, i64 %32, i32 1, i1 false)
  br label %33

; <label>:33:                                     ; preds = %28, %19
  %34 = load i8*, i8** %8, align 8
  %35 = load %union.id3_field*, %union.id3_field** %5, align 8
  %36 = bitcast %union.id3_field* %35 to %struct.anon.5*
  %37 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %36, i32 0, i32 1
  store i8* %34, i8** %37, align 8
  %38 = load i64, i64* %7, align 8
  %39 = load %union.id3_field*, %union.id3_field** %5, align 8
  %40 = bitcast %union.id3_field* %39 to %struct.anon.5*
  %41 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %40, i32 0, i32 2
  store i64 %38, i64* %41, align 8
  store i32 0, i32* %4, align 4
  br label %42

; <label>:42:                                     ; preds = %33, %26, %13
  %43 = load i32, i32* %4, align 4
  ret i32 %43
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i64 @id3_field_getint(%union.id3_field*) #0 {
  %2 = alloca i64, align 8
  %3 = alloca %union.id3_field*, align 8
  store %union.id3_field* %0, %union.id3_field** %3, align 8
  %4 = load %union.id3_field*, %union.id3_field** %3, align 8
  %5 = bitcast %union.id3_field* %4 to i32*
  %6 = load i32, i32* %5, align 8
  %7 = icmp ne i32 %6, 10
  br i1 %7, label %8, label %28

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getint, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getint, i64 0, i64 1)
  %10 = load %union.id3_field*, %union.id3_field** %3, align 8
  %11 = bitcast %union.id3_field* %10 to i32*
  %12 = load i32, i32* %11, align 8
  %13 = icmp ne i32 %12, 11
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getint, i64 0, i64 2)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getint, i64 0, i64 2)
  %16 = load %union.id3_field*, %union.id3_field** %3, align 8
  %17 = bitcast %union.id3_field* %16 to i32*
  %18 = load i32, i32* %17, align 8
  %19 = icmp ne i32 %18, 12
  br i1 %19, label %20, label %28

; <label>:20:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getint, i64 0, i64 3)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getint, i64 0, i64 3)
  %22 = load %union.id3_field*, %union.id3_field** %3, align 8
  %23 = bitcast %union.id3_field* %22 to i32*
  %24 = load i32, i32* %23, align 8
  %25 = icmp ne i32 %24, 13
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getint, i64 0, i64 4)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getint, i64 0, i64 4)
  store i64 -1, i64* %2, align 8
  br label %34

; <label>:28:                                     ; preds = %20, %14, %8, %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getint, i64 0, i64 0)
  %29 = add i64 %pgocount4, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getint, i64 0, i64 0)
  %30 = load %union.id3_field*, %union.id3_field** %3, align 8
  %31 = bitcast %union.id3_field* %30 to %struct.anon*
  %32 = getelementptr inbounds %struct.anon, %struct.anon* %31, i32 0, i32 1
  %33 = load i64, i64* %32, align 8
  store i64 %33, i64* %2, align 8
  br label %34

; <label>:34:                                     ; preds = %28, %26
  %35 = load i64, i64* %2, align 8
  ret i64 %35
}

; Function Attrs: nounwind uwtable
define i64* @id3_field_getstring(%union.id3_field*) #0 {
  %2 = alloca i64*, align 8
  %3 = alloca %union.id3_field*, align 8
  store %union.id3_field* %0, %union.id3_field** %3, align 8
  %4 = load %union.id3_field*, %union.id3_field** %3, align 8
  %5 = bitcast %union.id3_field* %4 to i32*
  %6 = load i32, i32* %5, align 8
  %7 = icmp ne i32 %6, 4
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getstring, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getstring, i64 0, i64 0)
  store i64* null, i64** %2, align 8
  br label %26

; <label>:10:                                     ; preds = %1
  %11 = load %union.id3_field*, %union.id3_field** %3, align 8
  %12 = bitcast %union.id3_field* %11 to %struct.anon.2*
  %13 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %12, i32 0, i32 1
  %14 = load i64*, i64** %13, align 8
  %15 = icmp ne i64* %14, null
  br i1 %15, label %16, label %22

; <label>:16:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getstring, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getstring, i64 0, i64 1)
  %18 = load %union.id3_field*, %union.id3_field** %3, align 8
  %19 = bitcast %union.id3_field* %18 to %struct.anon.2*
  %20 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %19, i32 0, i32 1
  %21 = load i64*, i64** %20, align 8
  br label %24

; <label>:22:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getstring, i64 0, i64 2)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getstring, i64 0, i64 2)
  br label %24

; <label>:24:                                     ; preds = %22, %16
  %25 = phi i64* [ %21, %16 ], [ getelementptr inbounds ([0 x i64], [0 x i64]* @id3_ucs4_empty, i32 0, i32 0), %22 ]
  store i64* %25, i64** %2, align 8
  br label %26

; <label>:26:                                     ; preds = %24, %8
  %27 = load i64*, i64** %2, align 8
  ret i64* %27
}

; Function Attrs: nounwind uwtable
define i64* @id3_field_getfullstring(%union.id3_field*) #0 {
  %2 = alloca i64*, align 8
  %3 = alloca %union.id3_field*, align 8
  store %union.id3_field* %0, %union.id3_field** %3, align 8
  %4 = load %union.id3_field*, %union.id3_field** %3, align 8
  %5 = bitcast %union.id3_field* %4 to i32*
  %6 = load i32, i32* %5, align 8
  %7 = icmp ne i32 %6, 5
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getfullstring, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getfullstring, i64 0, i64 0)
  store i64* null, i64** %2, align 8
  br label %26

; <label>:10:                                     ; preds = %1
  %11 = load %union.id3_field*, %union.id3_field** %3, align 8
  %12 = bitcast %union.id3_field* %11 to %struct.anon.2*
  %13 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %12, i32 0, i32 1
  %14 = load i64*, i64** %13, align 8
  %15 = icmp ne i64* %14, null
  br i1 %15, label %16, label %22

; <label>:16:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getfullstring, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getfullstring, i64 0, i64 1)
  %18 = load %union.id3_field*, %union.id3_field** %3, align 8
  %19 = bitcast %union.id3_field* %18 to %struct.anon.2*
  %20 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %19, i32 0, i32 1
  %21 = load i64*, i64** %20, align 8
  br label %24

; <label>:22:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getfullstring, i64 0, i64 2)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_field_getfullstring, i64 0, i64 2)
  br label %24

; <label>:24:                                     ; preds = %22, %16
  %25 = phi i64* [ %21, %16 ], [ getelementptr inbounds ([0 x i64], [0 x i64]* @id3_ucs4_empty, i32 0, i32 0), %22 ]
  store i64* %25, i64** %2, align 8
  br label %26

; <label>:26:                                     ; preds = %24, %8
  %27 = load i64*, i64** %2, align 8
  ret i64* %27
}

; Function Attrs: nounwind uwtable
define i32 @id3_field_getnstrings(%union.id3_field*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %union.id3_field*, align 8
  store %union.id3_field* %0, %union.id3_field** %3, align 8
  %4 = load %union.id3_field*, %union.id3_field** %3, align 8
  %5 = bitcast %union.id3_field* %4 to i32*
  %6 = load i32, i32* %5, align 8
  %7 = icmp ne i32 %6, 6
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_getnstrings, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_getnstrings, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %16

; <label>:10:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_getnstrings, i64 0, i64 1)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_getnstrings, i64 0, i64 1)
  %12 = load %union.id3_field*, %union.id3_field** %3, align 8
  %13 = bitcast %union.id3_field* %12 to %struct.anon.3*
  %14 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %13, i32 0, i32 1
  %15 = load i32, i32* %14, align 4
  store i32 %15, i32* %2, align 4
  br label %16

; <label>:16:                                     ; preds = %10, %8
  %17 = load i32, i32* %2, align 4
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define i64* @id3_field_getstrings(%union.id3_field*, i32) #0 {
  %3 = alloca i64*, align 8
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64*, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load %union.id3_field*, %union.id3_field** %4, align 8
  %8 = bitcast %union.id3_field* %7 to i32*
  %9 = load i32, i32* %8, align 8
  %10 = icmp ne i32 %9, 6
  br i1 %10, label %19, label %11

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_getstrings, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_getstrings, i64 0, i64 1)
  %13 = load i32, i32* %5, align 4
  %14 = load %union.id3_field*, %union.id3_field** %4, align 8
  %15 = bitcast %union.id3_field* %14 to %struct.anon.3*
  %16 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %15, i32 0, i32 1
  %17 = load i32, i32* %16, align 4
  %18 = icmp uge i32 %13, %17
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %11, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_getstrings, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_getstrings, i64 0, i64 0)
  store i64* null, i64** %3, align 8
  br label %37

; <label>:21:                                     ; preds = %11
  %22 = load %union.id3_field*, %union.id3_field** %4, align 8
  %23 = bitcast %union.id3_field* %22 to %struct.anon.3*
  %24 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %23, i32 0, i32 2
  %25 = load i64**, i64*** %24, align 8
  %26 = load i32, i32* %5, align 4
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i64*, i64** %25, i64 %27
  %29 = load i64*, i64** %28, align 8
  store i64* %29, i64** %6, align 8
  %30 = load i64*, i64** %6, align 8
  %31 = icmp eq i64* %30, null
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_getstrings, i64 0, i64 3)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_getstrings, i64 0, i64 3)
  store i64* getelementptr inbounds ([0 x i64], [0 x i64]* @id3_ucs4_empty, i32 0, i32 0), i64** %6, align 8
  br label %34

; <label>:34:                                     ; preds = %32, %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_getstrings, i64 0, i64 2)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_field_getstrings, i64 0, i64 2)
  %36 = load i64*, i64** %6, align 8
  store i64* %36, i64** %3, align 8
  br label %37

; <label>:37:                                     ; preds = %34, %19
  %38 = load i64*, i64** %3, align 8
  ret i64* %38
}

; Function Attrs: nounwind uwtable
define i8* @id3_field_getframeid(%union.id3_field*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %union.id3_field*, align 8
  store %union.id3_field* %0, %union.id3_field** %3, align 8
  %4 = load %union.id3_field*, %union.id3_field** %3, align 8
  %5 = bitcast %union.id3_field* %4 to i32*
  %6 = load i32, i32* %5, align 8
  %7 = icmp ne i32 %6, 8
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_getframeid, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_getframeid, i64 0, i64 0)
  store i8* null, i8** %2, align 8
  br label %16

; <label>:10:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_getframeid, i64 0, i64 1)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_field_getframeid, i64 0, i64 1)
  %12 = load %union.id3_field*, %union.id3_field** %3, align 8
  %13 = bitcast %union.id3_field* %12 to %struct.anon.4*
  %14 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %13, i32 0, i32 1
  %15 = getelementptr inbounds [9 x i8], [9 x i8]* %14, i32 0, i32 0
  store i8* %15, i8** %2, align 8
  br label %16

; <label>:16:                                     ; preds = %10, %8
  %17 = load i8*, i8** %2, align 8
  ret i8* %17
}

; Function Attrs: nounwind uwtable
define i8* @id3_field_getbinarydata(%union.id3_field*, i64*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %union.id3_field*, align 8
  %5 = alloca i64*, align 8
  store %union.id3_field* %0, %union.id3_field** %4, align 8
  store i64* %1, i64** %5, align 8
  %6 = load %union.id3_field*, %union.id3_field** %4, align 8
  %7 = bitcast %union.id3_field* %6 to i32*
  %8 = load i32, i32* %7, align 8
  %9 = icmp ne i32 %8, 15
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getbinarydata, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getbinarydata, i64 0, i64 0)
  store i8* null, i8** %3, align 8
  br label %50

; <label>:12:                                     ; preds = %2
  %13 = load %union.id3_field*, %union.id3_field** %4, align 8
  %14 = bitcast %union.id3_field* %13 to %struct.anon.5*
  %15 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %14, i32 0, i32 2
  %16 = load i64, i64* %15, align 8
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %25, label %18

; <label>:18:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getbinarydata, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getbinarydata, i64 0, i64 1)
  %20 = load %union.id3_field*, %union.id3_field** %4, align 8
  %21 = bitcast %union.id3_field* %20 to %struct.anon.5*
  %22 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %21, i32 0, i32 1
  %23 = load i8*, i8** %22, align 8
  %24 = icmp ne i8* %23, null
  br i1 %24, label %25, label %26

; <label>:25:                                     ; preds = %18, %12
  br label %29

; <label>:26:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getbinarydata, i64 0, i64 4)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getbinarydata, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i32 779, i8* getelementptr inbounds ([83 x i8], [83 x i8]* @__PRETTY_FUNCTION__.id3_field_getbinarydata, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %29

; <label>:29:                                     ; preds = %28, %25
  %30 = load %union.id3_field*, %union.id3_field** %4, align 8
  %31 = bitcast %union.id3_field* %30 to %struct.anon.5*
  %32 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %31, i32 0, i32 2
  %33 = load i64, i64* %32, align 8
  %34 = load i64*, i64** %5, align 8
  store i64 %33, i64* %34, align 8
  %35 = load %union.id3_field*, %union.id3_field** %4, align 8
  %36 = bitcast %union.id3_field* %35 to %struct.anon.5*
  %37 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %36, i32 0, i32 1
  %38 = load i8*, i8** %37, align 8
  %39 = icmp ne i8* %38, null
  br i1 %39, label %40, label %46

; <label>:40:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getbinarydata, i64 0, i64 2)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getbinarydata, i64 0, i64 2)
  %42 = load %union.id3_field*, %union.id3_field** %4, align 8
  %43 = bitcast %union.id3_field* %42 to %struct.anon.5*
  %44 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %43, i32 0, i32 1
  %45 = load i8*, i8** %44, align 8
  br label %48

; <label>:46:                                     ; preds = %29
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getbinarydata, i64 0, i64 3)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_field_getbinarydata, i64 0, i64 3)
  br label %48

; <label>:48:                                     ; preds = %46, %40
  %49 = phi i8* [ %45, %40 ], [ @id3_field_getbinarydata.empty, %46 ]
  store i8* %49, i8** %3, align 8
  br label %50

; <label>:50:                                     ; preds = %48, %10
  %51 = load i8*, i8** %3, align 8
  ret i8* %51
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #5

declare i8* @id3_latin1_duplicate(i8*) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
