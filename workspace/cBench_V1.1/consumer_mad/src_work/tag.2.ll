; ModuleID = 'tmp1.ll'
source_filename = "tag.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.id3_tag = type { i32, i32, i32, i32, i32, i32, i32, %struct.id3_frame**, i64 }
%struct.id3_frame = type { [5 x i8], i8*, i32, i32, i32, i32, i8*, i64, i64, i32, %union.id3_field* }
%union.id3_field = type { %struct.anon.5 }
%struct.anon.5 = type { i32, i8*, i64 }
%struct.id3_compat = type { i8*, i8*, i32 (%struct.id3_frame*, i8*, i8*, i64)* }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [18 x i8] c"tag->refcount > 0\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"tag.c\00", align 1
@__PRETTY_FUNCTION__.id3_tag_delref = private unnamed_addr constant [38 x i8] c"void id3_tag_delref(struct id3_tag *)\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"ID3\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"3DI\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"TIT2\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"TPE1\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"TALB\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"TDRC\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"TRCK\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"TCON\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"COMM\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"XXX\00", align 1
@id3_ucs4_empty = external constant [0 x i64], align 8
@.str.12 = private unnamed_addr constant [4 x i8] c"TAG\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_tag_new = private constant [11 x i8] c"id3_tag_new"
@__profn_id3_tag_delete = private constant [14 x i8] c"id3_tag_delete"
@__profn_id3_tag_clearframes = private constant [19 x i8] c"id3_tag_clearframes"
@__profn_id3_tag_addref = private constant [14 x i8] c"id3_tag_addref"
@__profn_id3_tag_delref = private constant [14 x i8] c"id3_tag_delref"
@__profn_id3_tag_attachframe = private constant [19 x i8] c"id3_tag_attachframe"
@__profn_id3_tag_detachframe = private constant [19 x i8] c"id3_tag_detachframe"
@__profn_id3_tag_findframe = private constant [17 x i8] c"id3_tag_findframe"
@__profn_id3_tag_query = private constant [13 x i8] c"id3_tag_query"
@__profn_tmp1.ll_tagtype = private constant [15 x i8] c"tmp1.ll:tagtype"
@__profn_tmp1.ll_parse_header = private constant [20 x i8] c"tmp1.ll:parse_header"
@__profn_id3_tag_parse = private constant [13 x i8] c"id3_tag_parse"
@__profn_tmp1.ll_v1_parse = private constant [16 x i8] c"tmp1.ll:v1_parse"
@__profn_tmp1.ll_v2_parse = private constant [16 x i8] c"tmp1.ll:v2_parse"
@__profn_id3_tag_render = private constant [14 x i8] c"id3_tag_render"
@__profn_tmp1.ll_v1_render = private constant [17 x i8] c"tmp1.ll:v1_render"
@__profn_tmp1.ll_v1_attachstr = private constant [20 x i8] c"tmp1.ll:v1_attachstr"
@__profn_tmp1.ll_trim = private constant [12 x i8] c"tmp1.ll:trim"
@__profn_tmp1.ll_v1_renderstr = private constant [20 x i8] c"tmp1.ll:v1_renderstr"
@__profc_id3_tag_new = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_tag_new = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 435338185463943210, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_new, i32 0, i32 0), i8* bitcast (%struct.id3_tag* ()* @id3_tag_new to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_tag_delete = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_tag_delete = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3962279547815783812, i64 35373395463, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_tag_delete, i32 0, i32 0), i8* bitcast (void (%struct.id3_tag*)* @id3_tag_delete to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_tag_clearframes = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_tag_clearframes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4071269559331944410, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_clearframes, i32 0, i32 0), i8* bitcast (void (%struct.id3_tag*)* @id3_tag_clearframes to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_tag_addref = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_tag_addref = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1816167181341428816, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_tag_addref, i32 0, i32 0), i8* bitcast (void (%struct.id3_tag*)* @id3_tag_addref to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_tag_delref = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_tag_delref = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -256313462056298730, i64 33962515092, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_delref, i32 0, i32 0), i8* bitcast (void (%struct.id3_tag*)* @id3_tag_delref to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_tag_attachframe = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_tag_attachframe = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 600392223056591154, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_attachframe, i32 0, i32 0), i8* bitcast (i32 (%struct.id3_tag*, %struct.id3_frame*)* @id3_tag_attachframe to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_tag_detachframe = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_tag_detachframe = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -594204144251559235, i64 78837162582, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_tag_detachframe, i32 0, i32 0), i8* bitcast (i32 (%struct.id3_tag*, %struct.id3_frame*)* @id3_tag_detachframe to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_tag_findframe = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_tag_findframe = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1000563055294522729, i64 139871040942, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i32 0, i32 0), i8* bitcast (%struct.id3_frame* (%struct.id3_tag*, i8*, i32)* @id3_tag_findframe to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_tag_query = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_tag_query = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5103566837893716567, i64 68451539699, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i32 0, i32 0), i8* bitcast (i64 (i8*, i64)* @id3_tag_query to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_tagtype = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_tagtype = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5694566378463672518, i64 72057765267808637, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i32 0, i32 0), i8* null, i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_parse_header = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_parse_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6744738594127742823, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_parse_header, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_tag_parse = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_tag_parse = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4653229383418093132, i64 123163396718, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i32 0, i32 0), i8* bitcast (%struct.id3_tag* (i8*, i64)* @id3_tag_parse to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_v1_parse = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_v1_parse = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8308328004411098064, i64 128891978224, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i32 0, i32 0), i8* null, i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_v2_parse = private global [41 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_v2_parse = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1503383573680195683, i64 516605518789, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i32 0, i32 0), i8* null, i8* null, i32 41, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_tag_render = private global [30 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_tag_render = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4430496290009099780, i64 420257969912, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i32 0, i32 0), i8* bitcast (i64 (%struct.id3_tag*, i8*)* @id3_tag_render to i8*), i8* null, i32 30, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_v1_render = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_v1_render = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5725037352741673581, i64 72057710887796243, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_v1_attachstr = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_v1_attachstr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6229429047892628133, i64 163098486076, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i32 0, i32 0), i8* null, i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_trim = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_trim = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3068640563101556527, i64 39911148230, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trim, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_v1_renderstr = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_v1_renderstr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5590298185233412593, i64 43969736709, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_v1_renderstr, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [132 x i8] c"\C1\02\80\01x\DAe\8FA\0E\C20\0C\04\D5\0F!\15n|&\B2\EA\0D\8D\94D\C11\A0\FE\9ER\8A\09\E4\E6\1D\CD\1C\1C\F8\E4\94..\E31\84\FDfD(lN\11$^(\A1\1A#f\81o\8Bv\92*M\F3\964J\CF|\C8\FCK\AE7\C82h*\E3!\C6\F3Jt)\B0]H*\DC\0Cb\88%\1B4\E5>\FE\83\E3\0E>\BE \BF\F2&\E8\C9\FB\81\AA_\A8\12R\DF\AC\C6\13\A8\09t\85", section "__llvm_prf_names"
@llvm.used = appending global [20 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_tag_new to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_tag_delete to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_tag_clearframes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_tag_addref to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_tag_delref to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_tag_attachframe to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_tag_detachframe to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_tag_findframe to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_tag_query to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_tagtype to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_parse_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_tag_parse to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_v1_parse to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_v2_parse to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_tag_render to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_v1_render to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_v1_attachstr to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_trim to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_v1_renderstr to i8*), i8* getelementptr inbounds ([132 x i8], [132 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define %struct.id3_tag* @id3_tag_new() #0 {
  %1 = alloca %struct.id3_tag*, align 8
  %2 = call noalias i8* @malloc(i64 48) #6
  %3 = bitcast i8* %2 to %struct.id3_tag*
  store %struct.id3_tag* %3, %struct.id3_tag** %1, align 8
  %4 = load %struct.id3_tag*, %struct.id3_tag** %1, align 8
  %5 = icmp ne %struct.id3_tag* %4, null
  br i1 %5, label %6, label %26

; <label>:6:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_new, i64 0, i64 1)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_new, i64 0, i64 1)
  %8 = load %struct.id3_tag*, %struct.id3_tag** %1, align 8
  %9 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %8, i32 0, i32 0
  store i32 0, i32* %9, align 8
  %10 = load %struct.id3_tag*, %struct.id3_tag** %1, align 8
  %11 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %10, i32 0, i32 1
  store i32 1024, i32* %11, align 4
  %12 = load %struct.id3_tag*, %struct.id3_tag** %1, align 8
  %13 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %12, i32 0, i32 2
  store i32 0, i32* %13, align 8
  %14 = load %struct.id3_tag*, %struct.id3_tag** %1, align 8
  %15 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %14, i32 0, i32 3
  store i32 0, i32* %15, align 4
  %16 = load %struct.id3_tag*, %struct.id3_tag** %1, align 8
  %17 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %16, i32 0, i32 4
  store i32 0, i32* %17, align 8
  %18 = load %struct.id3_tag*, %struct.id3_tag** %1, align 8
  %19 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %18, i32 0, i32 5
  store i32 6, i32* %19, align 4
  %20 = load %struct.id3_tag*, %struct.id3_tag** %1, align 8
  %21 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %20, i32 0, i32 6
  store i32 0, i32* %21, align 8
  %22 = load %struct.id3_tag*, %struct.id3_tag** %1, align 8
  %23 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %22, i32 0, i32 7
  store %struct.id3_frame** null, %struct.id3_frame*** %23, align 8
  %24 = load %struct.id3_tag*, %struct.id3_tag** %1, align 8
  %25 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %24, i32 0, i32 8
  store i64 0, i64* %25, align 8
  br label %26

; <label>:26:                                     ; preds = %6, %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_new, i64 0, i64 0)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_new, i64 0, i64 0)
  %28 = load %struct.id3_tag*, %struct.id3_tag** %1, align 8
  ret %struct.id3_tag* %28
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define void @id3_tag_delete(%struct.id3_tag*) #0 {
  %2 = alloca %struct.id3_tag*, align 8
  store %struct.id3_tag* %0, %struct.id3_tag** %2, align 8
  %3 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %4 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 8
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %23

; <label>:7:                                      ; preds = %1
  %8 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  call void @id3_tag_clearframes(%struct.id3_tag* %8)
  %9 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %10 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %9, i32 0, i32 7
  %11 = load %struct.id3_frame**, %struct.id3_frame*** %10, align 8
  %12 = icmp ne %struct.id3_frame** %11, null
  br i1 %12, label %13, label %19

; <label>:13:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_tag_delete, i64 0, i64 2)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_tag_delete, i64 0, i64 2)
  %15 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %16 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %15, i32 0, i32 7
  %17 = load %struct.id3_frame**, %struct.id3_frame*** %16, align 8
  %18 = bitcast %struct.id3_frame** %17 to i8*
  call void @free(i8* %18) #6
  br label %19

; <label>:19:                                     ; preds = %13, %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_tag_delete, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_tag_delete, i64 0, i64 1)
  %21 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %22 = bitcast %struct.id3_tag* %21 to i8*
  call void @free(i8* %22) #6
  br label %23

; <label>:23:                                     ; preds = %19, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_tag_delete, i64 0, i64 0)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_tag_delete, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define void @id3_tag_clearframes(%struct.id3_tag*) #0 {
  %2 = alloca %struct.id3_tag*, align 8
  %3 = alloca i32, align 4
  store %struct.id3_tag* %0, %struct.id3_tag** %2, align 8
  store i32 0, i32* %3, align 4
  br label %4

; <label>:4:                                      ; preds = %25, %1
  %5 = load i32, i32* %3, align 4
  %6 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %7 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %6, i32 0, i32 6
  %8 = load i32, i32* %7, align 8
  %9 = icmp ult i32 %5, %8
  br i1 %9, label %10, label %29

; <label>:10:                                     ; preds = %4
  %11 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %12 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %11, i32 0, i32 7
  %13 = load %struct.id3_frame**, %struct.id3_frame*** %12, align 8
  %14 = load i32, i32* %3, align 4
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %13, i64 %15
  %17 = load %struct.id3_frame*, %struct.id3_frame** %16, align 8
  call void @id3_frame_delref(%struct.id3_frame* %17)
  %18 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %19 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %18, i32 0, i32 7
  %20 = load %struct.id3_frame**, %struct.id3_frame*** %19, align 8
  %21 = load i32, i32* %3, align 4
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %20, i64 %22
  %24 = load %struct.id3_frame*, %struct.id3_frame** %23, align 8
  call void @id3_frame_delete(%struct.id3_frame* %24)
  br label %25

; <label>:25:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_clearframes, i64 0, i64 0)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_clearframes, i64 0, i64 0)
  %27 = load i32, i32* %3, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %3, align 4
  br label %4

; <label>:29:                                     ; preds = %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_clearframes, i64 0, i64 1)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_clearframes, i64 0, i64 1)
  %31 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %32 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %31, i32 0, i32 6
  store i32 0, i32* %32, align 8
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @id3_tag_addref(%struct.id3_tag*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_tag_addref, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_tag_addref, i64 0, i64 0)
  %3 = alloca %struct.id3_tag*, align 8
  store %struct.id3_tag* %0, %struct.id3_tag** %3, align 8
  %4 = load %struct.id3_tag*, %struct.id3_tag** %3, align 8
  %5 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %4, i32 0, i32 0
  %6 = load i32, i32* %5, align 8
  %7 = add i32 %6, 1
  store i32 %7, i32* %5, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @id3_tag_delref(%struct.id3_tag*) #0 {
  %2 = alloca %struct.id3_tag*, align 8
  store %struct.id3_tag* %0, %struct.id3_tag** %2, align 8
  %3 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %4 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 8
  %6 = icmp ugt i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %1
  br label %11

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_delref, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_delref, i64 0, i64 1)
  call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 103, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__PRETTY_FUNCTION__.id3_tag_delref, i32 0, i32 0)) #7
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11:                                     ; preds = %10, %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_delref, i64 0, i64 0)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_delref, i64 0, i64 0)
  %13 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %14 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %13, i32 0, i32 0
  %15 = load i32, i32* %14, align 8
  %16 = add i32 %15, -1
  store i32 %16, i32* %14, align 8
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

declare void @id3_frame_delref(%struct.id3_frame*) #3

declare void @id3_frame_delete(%struct.id3_frame*) #3

; Function Attrs: nounwind uwtable
define i32 @id3_tag_attachframe(%struct.id3_tag*, %struct.id3_frame*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.id3_tag*, align 8
  %5 = alloca %struct.id3_frame*, align 8
  %6 = alloca %struct.id3_frame**, align 8
  store %struct.id3_tag* %0, %struct.id3_tag** %4, align 8
  store %struct.id3_frame* %1, %struct.id3_frame** %5, align 8
  %7 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %8 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %7, i32 0, i32 7
  %9 = load %struct.id3_frame**, %struct.id3_frame*** %8, align 8
  %10 = bitcast %struct.id3_frame** %9 to i8*
  %11 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %12 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %11, i32 0, i32 6
  %13 = load i32, i32* %12, align 8
  %14 = add i32 %13, 1
  %15 = zext i32 %14 to i64
  %16 = mul i64 %15, 8
  %17 = call i8* @realloc(i8* %10, i64 %16) #6
  %18 = bitcast i8* %17 to %struct.id3_frame**
  store %struct.id3_frame** %18, %struct.id3_frame*** %6, align 8
  %19 = load %struct.id3_frame**, %struct.id3_frame*** %6, align 8
  %20 = icmp eq %struct.id3_frame** %19, null
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_attachframe, i64 0, i64 1)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_attachframe, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %39

; <label>:23:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_attachframe, i64 0, i64 0)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_tag_attachframe, i64 0, i64 0)
  %25 = load %struct.id3_frame**, %struct.id3_frame*** %6, align 8
  %26 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %27 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %26, i32 0, i32 7
  store %struct.id3_frame** %25, %struct.id3_frame*** %27, align 8
  %28 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %29 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %30 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %29, i32 0, i32 7
  %31 = load %struct.id3_frame**, %struct.id3_frame*** %30, align 8
  %32 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %33 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %32, i32 0, i32 6
  %34 = load i32, i32* %33, align 8
  %35 = add i32 %34, 1
  store i32 %35, i32* %33, align 8
  %36 = zext i32 %34 to i64
  %37 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %31, i64 %36
  store %struct.id3_frame* %28, %struct.id3_frame** %37, align 8
  %38 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  call void @id3_frame_addref(%struct.id3_frame* %38)
  store i32 0, i32* %3, align 4
  br label %39

; <label>:39:                                     ; preds = %23, %21
  %40 = load i32, i32* %3, align 4
  ret i32 %40
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

declare void @id3_frame_addref(%struct.id3_frame*) #3

; Function Attrs: nounwind uwtable
define i32 @id3_tag_detachframe(%struct.id3_tag*, %struct.id3_frame*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.id3_tag*, align 8
  %5 = alloca %struct.id3_frame*, align 8
  %6 = alloca i32, align 4
  store %struct.id3_tag* %0, %struct.id3_tag** %4, align 8
  store %struct.id3_frame* %1, %struct.id3_frame** %5, align 8
  store i32 0, i32* %6, align 4
  br label %7

; <label>:7:                                      ; preds = %26, %2
  %8 = load i32, i32* %6, align 4
  %9 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %10 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %9, i32 0, i32 6
  %11 = load i32, i32* %10, align 8
  %12 = icmp ult i32 %8, %11
  br i1 %12, label %13, label %30

; <label>:13:                                     ; preds = %7
  %14 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %15 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %14, i32 0, i32 7
  %16 = load %struct.id3_frame**, %struct.id3_frame*** %15, align 8
  %17 = load i32, i32* %6, align 4
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %16, i64 %18
  %20 = load %struct.id3_frame*, %struct.id3_frame** %19, align 8
  %21 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %22 = icmp eq %struct.id3_frame* %20, %21
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_tag_detachframe, i64 0, i64 4)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_tag_detachframe, i64 0, i64 4)
  br label %30

; <label>:25:                                     ; preds = %13
  br label %26

; <label>:26:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_tag_detachframe, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_tag_detachframe, i64 0, i64 1)
  %28 = load i32, i32* %6, align 4
  %29 = add i32 %28, 1
  store i32 %29, i32* %6, align 4
  br label %7

; <label>:30:                                     ; preds = %23, %7
  %31 = load i32, i32* %6, align 4
  %32 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %33 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %32, i32 0, i32 6
  %34 = load i32, i32* %33, align 8
  %35 = icmp eq i32 %31, %34
  br i1 %35, label %36, label %38

; <label>:36:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_tag_detachframe, i64 0, i64 2)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_tag_detachframe, i64 0, i64 2)
  store i32 -1, i32* %3, align 4
  br label %69

; <label>:38:                                     ; preds = %30
  %39 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %40 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %39, i32 0, i32 6
  %41 = load i32, i32* %40, align 8
  %42 = add i32 %41, -1
  store i32 %42, i32* %40, align 8
  br label %43

; <label>:43:                                     ; preds = %50, %38
  %44 = load i32, i32* %6, align 4
  %45 = add i32 %44, 1
  store i32 %45, i32* %6, align 4
  %46 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %47 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %46, i32 0, i32 6
  %48 = load i32, i32* %47, align 8
  %49 = icmp ult i32 %44, %48
  br i1 %49, label %50, label %66

; <label>:50:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_tag_detachframe, i64 0, i64 0)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_tag_detachframe, i64 0, i64 0)
  %52 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %53 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %52, i32 0, i32 7
  %54 = load %struct.id3_frame**, %struct.id3_frame*** %53, align 8
  %55 = load i32, i32* %6, align 4
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %54, i64 %56
  %58 = load %struct.id3_frame*, %struct.id3_frame** %57, align 8
  %59 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %60 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %59, i32 0, i32 7
  %61 = load %struct.id3_frame**, %struct.id3_frame*** %60, align 8
  %62 = load i32, i32* %6, align 4
  %63 = sub i32 %62, 1
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %61, i64 %64
  store %struct.id3_frame* %58, %struct.id3_frame** %65, align 8
  br label %43

; <label>:66:                                     ; preds = %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_tag_detachframe, i64 0, i64 3)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_tag_detachframe, i64 0, i64 3)
  %68 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  call void @id3_frame_delref(%struct.id3_frame* %68)
  store i32 0, i32* %3, align 4
  br label %69

; <label>:69:                                     ; preds = %66, %36
  %70 = load i32, i32* %3, align 4
  ret i32 %70
}

; Function Attrs: nounwind uwtable
define %struct.id3_frame* @id3_tag_findframe(%struct.id3_tag*, i8*, i32) #0 {
  %4 = alloca %struct.id3_frame*, align 8
  %5 = alloca %struct.id3_tag*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.id3_compat*, align 8
  store %struct.id3_tag* %0, %struct.id3_tag** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %11 = load i8*, i8** %6, align 8
  %12 = icmp eq i8* %11, null
  br i1 %12, label %19, label %13

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 2)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 2)
  %15 = load i8*, i8** %6, align 8
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %38

; <label>:19:                                     ; preds = %13, %3
  %20 = load i32, i32* %7, align 4
  %21 = load %struct.id3_tag*, %struct.id3_tag** %5, align 8
  %22 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %21, i32 0, i32 6
  %23 = load i32, i32* %22, align 8
  %24 = icmp ult i32 %20, %23
  br i1 %24, label %25, label %34

; <label>:25:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 3)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 3)
  %27 = load %struct.id3_tag*, %struct.id3_tag** %5, align 8
  %28 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %27, i32 0, i32 7
  %29 = load %struct.id3_frame**, %struct.id3_frame*** %28, align 8
  %30 = load i32, i32* %7, align 4
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %29, i64 %31
  %33 = load %struct.id3_frame*, %struct.id3_frame** %32, align 8
  br label %36

; <label>:34:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 4)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 4)
  br label %36

; <label>:36:                                     ; preds = %34, %25
  %37 = phi %struct.id3_frame* [ %33, %25 ], [ null, %34 ]
  store %struct.id3_frame* %37, %struct.id3_frame** %4, align 8
  br label %115

; <label>:38:                                     ; preds = %13
  %39 = load i8*, i8** %6, align 8
  %40 = call i64 @strlen(i8* %39) #8
  %41 = trunc i64 %40 to i32
  store i32 %41, i32* %8, align 4
  %42 = load i32, i32* %8, align 4
  %43 = icmp eq i32 %42, 4
  br i1 %43, label %44, label %72

; <label>:44:                                     ; preds = %38
  %45 = load i8*, i8** %6, align 8
  %46 = load i32, i32* %8, align 4
  %47 = call %struct.id3_compat* @id3_compat_lookup(i8* %45, i32 %46)
  store %struct.id3_compat* %47, %struct.id3_compat** %10, align 8
  %48 = load %struct.id3_compat*, %struct.id3_compat** %10, align 8
  %49 = icmp ne %struct.id3_compat* %48, null
  br i1 %49, label %50, label %70

; <label>:50:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 7)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 7)
  %52 = load %struct.id3_compat*, %struct.id3_compat** %10, align 8
  %53 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %52, i32 0, i32 1
  %54 = load i8*, i8** %53, align 8
  %55 = icmp ne i8* %54, null
  br i1 %55, label %56, label %70

; <label>:56:                                     ; preds = %50
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 9)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 9)
  %58 = load %struct.id3_compat*, %struct.id3_compat** %10, align 8
  %59 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %58, i32 0, i32 2
  %60 = load i32 (%struct.id3_frame*, i8*, i8*, i64)*, i32 (%struct.id3_frame*, i8*, i8*, i64)** %59, align 8
  %61 = icmp ne i32 (%struct.id3_frame*, i8*, i8*, i64)* %60, null
  br i1 %61, label %70, label %62

; <label>:62:                                     ; preds = %56
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 10)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 10)
  %64 = load %struct.id3_compat*, %struct.id3_compat** %10, align 8
  %65 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %64, i32 0, i32 1
  %66 = load i8*, i8** %65, align 8
  store i8* %66, i8** %6, align 8
  %67 = load i8*, i8** %6, align 8
  %68 = call i64 @strlen(i8* %67) #8
  %69 = trunc i64 %68 to i32
  store i32 %69, i32* %8, align 4
  br label %70

; <label>:70:                                     ; preds = %62, %56, %50, %44
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 6)
  %71 = add i64 %pgocount6, 1
  store i64 %71, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 6)
  br label %72

; <label>:72:                                     ; preds = %70, %38
  store i32 0, i32* %9, align 4
  br label %73

; <label>:73:                                     ; preds = %109, %72
  %74 = load i32, i32* %9, align 4
  %75 = load %struct.id3_tag*, %struct.id3_tag** %5, align 8
  %76 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %75, i32 0, i32 6
  %77 = load i32, i32* %76, align 8
  %78 = icmp ult i32 %74, %77
  br i1 %78, label %79, label %113

; <label>:79:                                     ; preds = %73
  %80 = load %struct.id3_tag*, %struct.id3_tag** %5, align 8
  %81 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %80, i32 0, i32 7
  %82 = load %struct.id3_frame**, %struct.id3_frame*** %81, align 8
  %83 = load i32, i32* %9, align 4
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %82, i64 %84
  %86 = load %struct.id3_frame*, %struct.id3_frame** %85, align 8
  %87 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %86, i32 0, i32 0
  %88 = getelementptr inbounds [5 x i8], [5 x i8]* %87, i32 0, i32 0
  %89 = load i8*, i8** %6, align 8
  %90 = load i32, i32* %8, align 4
  %91 = zext i32 %90 to i64
  %92 = call i32 @strncmp(i8* %88, i8* %89, i64 %91) #8
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %108

; <label>:94:                                     ; preds = %79
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 1)
  %95 = add i64 %pgocount7, 1
  store i64 %95, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 1)
  %96 = load i32, i32* %7, align 4
  %97 = add i32 %96, -1
  store i32 %97, i32* %7, align 4
  %98 = icmp eq i32 %96, 0
  br i1 %98, label %99, label %108

; <label>:99:                                     ; preds = %94
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 8)
  %100 = add i64 %pgocount8, 1
  store i64 %100, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 8)
  %101 = load %struct.id3_tag*, %struct.id3_tag** %5, align 8
  %102 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %101, i32 0, i32 7
  %103 = load %struct.id3_frame**, %struct.id3_frame*** %102, align 8
  %104 = load i32, i32* %9, align 4
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %103, i64 %105
  %107 = load %struct.id3_frame*, %struct.id3_frame** %106, align 8
  store %struct.id3_frame* %107, %struct.id3_frame** %4, align 8
  br label %115

; <label>:108:                                    ; preds = %94, %79
  br label %109

; <label>:109:                                    ; preds = %108
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 0)
  %110 = add i64 %pgocount9, 1
  store i64 %110, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 0)
  %111 = load i32, i32* %9, align 4
  %112 = add i32 %111, 1
  store i32 %112, i32* %9, align 4
  br label %73

; <label>:113:                                    ; preds = %73
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 5)
  %114 = add i64 %pgocount10, 1
  store i64 %114, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_findframe, i64 0, i64 5)
  store %struct.id3_frame* null, %struct.id3_frame** %4, align 8
  br label %115

; <label>:115:                                    ; preds = %113, %99, %36
  %116 = load %struct.id3_frame*, %struct.id3_frame** %4, align 8
  ret %struct.id3_frame* %116
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

declare %struct.id3_compat* @id3_compat_lookup(i8*, i32) #3

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #4

; Function Attrs: nounwind uwtable
define i64 @id3_tag_query(i8*, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  %9 = load i8*, i8** %4, align 8
  %10 = load i64, i64* %5, align 8
  %11 = call i32 @tagtype(i8* %9, i64 %10)
  switch i32 %11, label %33 [
    i32 1, label %12
    i32 2, label %14
    i32 3, label %26
    i32 0, label %31
  ]

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 2)
  store i64 128, i64* %3, align 8
  br label %35

; <label>:14:                                     ; preds = %2
  call void @parse_header(i8** %4, i32* %6, i32* %7, i64* %8)
  %15 = load i32, i32* %7, align 4
  %16 = and i32 %15, 16
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 5)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 5)
  %20 = load i64, i64* %8, align 8
  %21 = add i64 %20, 10
  store i64 %21, i64* %8, align 8
  br label %22

; <label>:22:                                     ; preds = %18, %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 3)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 3)
  %24 = load i64, i64* %8, align 8
  %25 = add i64 10, %24
  store i64 %25, i64* %3, align 8
  br label %35

; <label>:26:                                     ; preds = %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 4)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 4)
  call void @parse_header(i8** %4, i32* %6, i32* %7, i64* %8)
  %28 = load i64, i64* %8, align 8
  %29 = sub i64 0, %28
  %30 = sub i64 %29, 10
  store i64 %30, i64* %3, align 8
  br label %35

; <label>:31:                                     ; preds = %2
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 1)
  %32 = add i64 %pgocount4, 1
  store i64 %32, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 1)
  br label %33

; <label>:33:                                     ; preds = %31, %2
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 0)
  %34 = add i64 %pgocount5, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_tag_query, i64 0, i64 0)
  store i64 0, i64* %3, align 8
  br label %35

; <label>:35:                                     ; preds = %33, %26, %22, %12
  %36 = load i64, i64* %3, align 8
  ret i64 %36
}

; Function Attrs: nounwind uwtable
define internal i32 @tagtype(i8*, i64) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = icmp uge i64 %6, 3
  br i1 %7, label %8, label %31

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 3)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 3)
  %10 = load i8*, i8** %4, align 8
  %11 = getelementptr inbounds i8, i8* %10, i64 0
  %12 = load i8, i8* %11, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp eq i32 %13, 84
  br i1 %14, label %15, label %31

; <label>:15:                                     ; preds = %8
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 5)
  %16 = add i64 %pgocount2, 1
  store i64 %16, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 5)
  %17 = load i8*, i8** %4, align 8
  %18 = getelementptr inbounds i8, i8* %17, i64 1
  %19 = load i8, i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp eq i32 %20, 65
  br i1 %21, label %22, label %31

; <label>:22:                                     ; preds = %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 8)
  %23 = add i64 %pgocount3, 1
  store i64 %23, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 8)
  %24 = load i8*, i8** %4, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 2
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 71
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %22
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 11)
  %30 = add i64 %pgocount4, 1
  store i64 %30, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 11)
  store i32 1, i32* %3, align 4
  br label %130

; <label>:31:                                     ; preds = %22, %15, %8, %2
  %32 = load i64, i64* %5, align 8
  %33 = icmp uge i64 %32, 10
  br i1 %33, label %34, label %128

; <label>:34:                                     ; preds = %31
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 4)
  %35 = add i64 %pgocount5, 1
  store i64 %35, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 4)
  %36 = load i8*, i8** %4, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 0
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = icmp eq i32 %39, 73
  br i1 %40, label %41, label %55

; <label>:41:                                     ; preds = %34
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 6)
  %42 = add i64 %pgocount6, 1
  store i64 %42, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 6)
  %43 = load i8*, i8** %4, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 1
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = icmp eq i32 %46, 68
  br i1 %47, label %48, label %55

; <label>:48:                                     ; preds = %41
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 9)
  %49 = add i64 %pgocount7, 1
  store i64 %49, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 9)
  %50 = load i8*, i8** %4, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 2
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = icmp eq i32 %53, 51
  br i1 %54, label %76, label %55

; <label>:55:                                     ; preds = %48, %41, %34
  %56 = load i8*, i8** %4, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 0
  %58 = load i8, i8* %57, align 1
  %59 = zext i8 %58 to i32
  %60 = icmp eq i32 %59, 51
  br i1 %60, label %61, label %128

; <label>:61:                                     ; preds = %55
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 7)
  %62 = add i64 %pgocount8, 1
  store i64 %62, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 7)
  %63 = load i8*, i8** %4, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 1
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = icmp eq i32 %66, 68
  br i1 %67, label %68, label %128

; <label>:68:                                     ; preds = %61
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 10)
  %69 = add i64 %pgocount9, 1
  store i64 %69, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 10)
  %70 = load i8*, i8** %4, align 8
  %71 = getelementptr inbounds i8, i8* %70, i64 2
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = icmp eq i32 %73, 73
  br i1 %74, label %76, label %._crit_edge1

._crit_edge1:                                     ; preds = %68
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 1)
  %75 = add i64 %pgocount10, 1
  store i64 %75, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 1)
  br label %128

; <label>:76:                                     ; preds = %68, %48
  %77 = load i8*, i8** %4, align 8
  %78 = getelementptr inbounds i8, i8* %77, i64 3
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = icmp slt i32 %80, 255
  br i1 %81, label %83, label %._crit_edge

._crit_edge:                                      ; preds = %76
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 0)
  %82 = add i64 %pgocount11, 1
  store i64 %82, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 0)
  br label %128

; <label>:83:                                     ; preds = %76
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 12)
  %84 = add i64 %pgocount12, 1
  store i64 %84, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 12)
  %85 = load i8*, i8** %4, align 8
  %86 = getelementptr inbounds i8, i8* %85, i64 4
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = icmp slt i32 %88, 255
  br i1 %89, label %90, label %128

; <label>:90:                                     ; preds = %83
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 13)
  %91 = add i64 %pgocount13, 1
  store i64 %91, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 13)
  %92 = load i8*, i8** %4, align 8
  %93 = getelementptr inbounds i8, i8* %92, i64 6
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = icmp slt i32 %95, 128
  br i1 %96, label %97, label %128

; <label>:97:                                     ; preds = %90
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 14)
  %98 = add i64 %pgocount14, 1
  store i64 %98, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 14)
  %99 = load i8*, i8** %4, align 8
  %100 = getelementptr inbounds i8, i8* %99, i64 7
  %101 = load i8, i8* %100, align 1
  %102 = zext i8 %101 to i32
  %103 = icmp slt i32 %102, 128
  br i1 %103, label %104, label %128

; <label>:104:                                    ; preds = %97
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 15)
  %105 = add i64 %pgocount15, 1
  store i64 %105, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 15)
  %106 = load i8*, i8** %4, align 8
  %107 = getelementptr inbounds i8, i8* %106, i64 8
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  %110 = icmp slt i32 %109, 128
  br i1 %110, label %111, label %128

; <label>:111:                                    ; preds = %104
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 16)
  %112 = add i64 %pgocount16, 1
  store i64 %112, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 16)
  %113 = load i8*, i8** %4, align 8
  %114 = getelementptr inbounds i8, i8* %113, i64 9
  %115 = load i8, i8* %114, align 1
  %116 = zext i8 %115 to i32
  %117 = icmp slt i32 %116, 128
  br i1 %117, label %118, label %128

; <label>:118:                                    ; preds = %111
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 17)
  %119 = add i64 %pgocount17, 1
  store i64 %119, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 17)
  %120 = load i8*, i8** %4, align 8
  %121 = getelementptr inbounds i8, i8* %120, i64 0
  %122 = load i8, i8* %121, align 1
  %123 = zext i8 %122 to i32
  %124 = icmp eq i32 %123, 73
  %125 = zext i1 %124 to i64
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 18)
  %126 = add i64 %pgocount18, %125
  store i64 %126, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 18)
  %127 = select i1 %124, i32 2, i32 3
  store i32 %127, i32* %3, align 4
  br label %130

; <label>:128:                                    ; preds = %._crit_edge1, %._crit_edge, %111, %104, %97, %90, %83, %61, %55, %31
  %pgocount19 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 2)
  %129 = add i64 %pgocount19, 1
  store i64 %129, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_tagtype, i64 0, i64 2)
  store i32 0, i32* %3, align 4
  br label %130

; <label>:130:                                    ; preds = %128, %118, %29
  %131 = load i32, i32* %3, align 4
  ret i32 %131
}

; Function Attrs: nounwind uwtable
define internal void @parse_header(i8**, i32*, i32*, i64*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_parse_header, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_parse_header, i64 0, i64 0)
  %6 = alloca i8**, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i64*, align 8
  store i8** %0, i8*** %6, align 8
  store i32* %1, i32** %7, align 8
  store i32* %2, i32** %8, align 8
  store i64* %3, i64** %9, align 8
  %10 = load i8**, i8*** %6, align 8
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 3
  store i8* %12, i8** %10, align 8
  %13 = load i8**, i8*** %6, align 8
  %14 = call i64 @id3_parse_uint(i8** %13, i32 2)
  %15 = trunc i64 %14 to i32
  %16 = load i32*, i32** %7, align 8
  store i32 %15, i32* %16, align 4
  %17 = load i8**, i8*** %6, align 8
  %18 = call i64 @id3_parse_uint(i8** %17, i32 1)
  %19 = trunc i64 %18 to i32
  %20 = load i32*, i32** %8, align 8
  store i32 %19, i32* %20, align 4
  %21 = load i8**, i8*** %6, align 8
  %22 = call i64 @id3_parse_syncsafe(i8** %21, i32 4)
  %23 = load i64*, i64** %9, align 8
  store i64 %22, i64* %23, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.id3_tag* @id3_tag_parse(i8*, i64) #0 {
  %3 = alloca %struct.id3_tag*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  %10 = load i8*, i8** %4, align 8
  %11 = load i64, i64* %5, align 8
  %12 = call i32 @tagtype(i8* %10, i64 %11)
  switch i32 %12, label %29 [
    i32 1, label %14
    i32 2, label %25
    i32 3, label %._crit_edge
    i32 0, label %27
  ]

._crit_edge:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 0)
  br label %27

; <label>:14:                                     ; preds = %2
  %15 = load i64, i64* %5, align 8
  %16 = icmp ult i64 %15, 128
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 6)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 6)
  br label %23

; <label>:19:                                     ; preds = %14
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 7)
  %20 = add i64 %pgocount3, 1
  store i64 %20, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 7)
  %21 = load i8*, i8** %4, align 8
  %22 = call %struct.id3_tag* @v1_parse(i8* %21)
  br label %23

; <label>:23:                                     ; preds = %19, %17
  %24 = phi %struct.id3_tag* [ null, %17 ], [ %22, %19 ]
  store %struct.id3_tag* %24, %struct.id3_tag** %3, align 8
  br label %60

; <label>:25:                                     ; preds = %2
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 3)
  %26 = add i64 %pgocount4, 1
  store i64 %26, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 3)
  br label %29

; <label>:27:                                     ; preds = %._crit_edge, %2
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 2)
  %28 = add i64 %pgocount5, 1
  store i64 %28, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 2)
  store %struct.id3_tag* null, %struct.id3_tag** %3, align 8
  br label %60

; <label>:29:                                     ; preds = %25, %2
  %30 = load i8*, i8** %4, align 8
  store i8* %30, i8** %6, align 8
  call void @parse_header(i8** %6, i32* %7, i32* %8, i64* %9)
  %31 = load i32, i32* %7, align 4
  %32 = lshr i32 %31, 8
  %33 = and i32 %32, 255
  switch i32 %33, label %58 [
    i32 4, label %35
    i32 2, label %._crit_edge1
    i32 3, label %45
  ]

._crit_edge1:                                     ; preds = %29
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 1)
  %34 = add i64 %pgocount6, 1
  store i64 %34, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 1)
  br label %45

; <label>:35:                                     ; preds = %29
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 9)
  %36 = add i64 %pgocount7, 1
  store i64 %36, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 9)
  %37 = load i32, i32* %8, align 4
  %38 = and i32 %37, 16
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %35
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 10)
  %41 = add i64 %pgocount8, 1
  store i64 %41, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 10)
  %42 = load i64, i64* %9, align 8
  %43 = add i64 %42, 10
  store i64 %43, i64* %9, align 8
  br label %44

; <label>:44:                                     ; preds = %40, %35
  br label %45

; <label>:45:                                     ; preds = %._crit_edge1, %44, %29
  %46 = load i64, i64* %5, align 8
  %47 = load i64, i64* %9, align 8
  %48 = add i64 10, %47
  %49 = icmp ult i64 %46, %48
  br i1 %49, label %50, label %52

; <label>:50:                                     ; preds = %45
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 4)
  %51 = add i64 %pgocount9, 1
  store i64 %51, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 4)
  br label %56

; <label>:52:                                     ; preds = %45
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 5)
  %53 = add i64 %pgocount10, 1
  store i64 %53, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 5)
  %54 = load i8*, i8** %4, align 8
  %55 = call %struct.id3_tag* @v2_parse(i8* %54)
  br label %56

; <label>:56:                                     ; preds = %52, %50
  %57 = phi %struct.id3_tag* [ null, %50 ], [ %55, %52 ]
  store %struct.id3_tag* %57, %struct.id3_tag** %3, align 8
  br label %60

; <label>:58:                                     ; preds = %29
  %pgocount11 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 8)
  %59 = add i64 %pgocount11, 1
  store i64 %59, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_tag_parse, i64 0, i64 8)
  store %struct.id3_tag* null, %struct.id3_tag** %3, align 8
  br label %60

; <label>:60:                                     ; preds = %58, %56, %27, %23
  %61 = load %struct.id3_tag*, %struct.id3_tag** %3, align 8
  ret %struct.id3_tag* %61
}

; Function Attrs: nounwind uwtable
define internal %struct.id3_tag* @v1_parse(i8*) #0 {
  %2 = alloca %struct.id3_tag*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %struct.id3_tag*, align 8
  %5 = alloca [31 x i8], align 16
  %6 = alloca [31 x i8], align 16
  %7 = alloca [31 x i8], align 16
  %8 = alloca [5 x i8], align 1
  %9 = alloca [31 x i8], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  %12 = call %struct.id3_tag* @id3_tag_new()
  store %struct.id3_tag* %12, %struct.id3_tag** %4, align 8
  %13 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %14 = icmp ne %struct.id3_tag* %13, null
  br i1 %14, label %15, label %125

; <label>:15:                                     ; preds = %1
  %16 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %17 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %16, i32 0, i32 1
  store i32 256, i32* %17, align 4
  %18 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %19 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %18, i32 0, i32 5
  %20 = load i32, i32* %19, align 4
  %21 = or i32 %20, 256
  store i32 %21, i32* %19, align 4
  %22 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %23 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %22, i32 0, i32 5
  %24 = load i32, i32* %23, align 4
  %25 = and i32 %24, -3
  store i32 %25, i32* %23, align 4
  %26 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %27 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %26, i32 0, i32 4
  store i32 56, i32* %27, align 8
  %28 = getelementptr inbounds [31 x i8], [31 x i8]* %9, i64 0, i64 30
  store i8 0, i8* %28, align 2
  %29 = getelementptr inbounds [5 x i8], [5 x i8]* %8, i64 0, i64 4
  store i8 0, i8* %29, align 1
  %30 = getelementptr inbounds [31 x i8], [31 x i8]* %7, i64 0, i64 30
  store i8 0, i8* %30, align 2
  %31 = getelementptr inbounds [31 x i8], [31 x i8]* %6, i64 0, i64 30
  store i8 0, i8* %31, align 2
  %32 = getelementptr inbounds [31 x i8], [31 x i8]* %5, i64 0, i64 30
  store i8 0, i8* %32, align 2
  %33 = getelementptr inbounds [31 x i8], [31 x i8]* %5, i32 0, i32 0
  %34 = load i8*, i8** %3, align 8
  %35 = getelementptr inbounds i8, i8* %34, i64 3
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* %35, i64 30, i32 1, i1 false)
  %36 = getelementptr inbounds [31 x i8], [31 x i8]* %6, i32 0, i32 0
  %37 = load i8*, i8** %3, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* %38, i64 30, i32 1, i1 false)
  %39 = getelementptr inbounds [31 x i8], [31 x i8]* %7, i32 0, i32 0
  %40 = load i8*, i8** %3, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 63
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %39, i8* %41, i64 30, i32 1, i1 false)
  %42 = getelementptr inbounds [5 x i8], [5 x i8]* %8, i32 0, i32 0
  %43 = load i8*, i8** %3, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %42, i8* %44, i64 4, i32 1, i1 false)
  %45 = getelementptr inbounds [31 x i8], [31 x i8]* %9, i32 0, i32 0
  %46 = load i8*, i8** %3, align 8
  %47 = getelementptr inbounds i8, i8* %46, i64 97
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* %47, i64 30, i32 1, i1 false)
  %48 = load i8*, i8** %3, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 127
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i32
  store i32 %51, i32* %10, align 4
  store i32 0, i32* %11, align 4
  %52 = getelementptr inbounds [31 x i8], [31 x i8]* %9, i64 0, i64 28
  %53 = load i8, i8* %52, align 4
  %54 = sext i8 %53 to i32
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %69

; <label>:56:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 6)
  %57 = add i64 %pgocount, 1
  store i64 %57, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 6)
  %58 = getelementptr inbounds [31 x i8], [31 x i8]* %9, i64 0, i64 29
  %59 = load i8, i8* %58, align 1
  %60 = sext i8 %59 to i32
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %69

; <label>:62:                                     ; preds = %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 8)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 8)
  %64 = getelementptr inbounds [31 x i8], [31 x i8]* %9, i64 0, i64 29
  %65 = load i8, i8* %64, align 1
  %66 = sext i8 %65 to i32
  store i32 %66, i32* %11, align 4
  %67 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %68 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %67, i32 0, i32 1
  store i32 257, i32* %68, align 4
  br label %69

; <label>:69:                                     ; preds = %62, %56, %15
  %70 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %71 = getelementptr inbounds [31 x i8], [31 x i8]* %5, i32 0, i32 0
  %72 = call i32 @v1_attachstr(%struct.id3_tag* %70, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8* %71, i64 0)
  %73 = icmp eq i32 %72, -1
  br i1 %73, label %120, label %74

; <label>:74:                                     ; preds = %69
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 4)
  %75 = add i64 %pgocount3, 1
  store i64 %75, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 4)
  %76 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %77 = getelementptr inbounds [31 x i8], [31 x i8]* %6, i32 0, i32 0
  %78 = call i32 @v1_attachstr(%struct.id3_tag* %76, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i8* %77, i64 0)
  %79 = icmp eq i32 %78, -1
  br i1 %79, label %120, label %80

; <label>:80:                                     ; preds = %74
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 5)
  %81 = add i64 %pgocount4, 1
  store i64 %81, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 5)
  %82 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %83 = getelementptr inbounds [31 x i8], [31 x i8]* %7, i32 0, i32 0
  %84 = call i32 @v1_attachstr(%struct.id3_tag* %82, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i8* %83, i64 0)
  %85 = icmp eq i32 %84, -1
  br i1 %85, label %120, label %86

; <label>:86:                                     ; preds = %80
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 7)
  %87 = add i64 %pgocount5, 1
  store i64 %87, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 7)
  %88 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %89 = getelementptr inbounds [5 x i8], [5 x i8]* %8, i32 0, i32 0
  %90 = call i32 @v1_attachstr(%struct.id3_tag* %88, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8* %89, i64 0)
  %91 = icmp eq i32 %90, -1
  br i1 %91, label %120, label %92

; <label>:92:                                     ; preds = %86
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 9)
  %93 = add i64 %pgocount6, 1
  store i64 %93, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 9)
  %94 = load i32, i32* %11, align 4
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %103

; <label>:96:                                     ; preds = %92
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 10)
  %97 = add i64 %pgocount7, 1
  store i64 %97, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 10)
  %98 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %99 = load i32, i32* %11, align 4
  %100 = zext i32 %99 to i64
  %101 = call i32 @v1_attachstr(%struct.id3_tag* %98, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0), i8* null, i64 %100)
  %102 = icmp eq i32 %101, -1
  br i1 %102, label %120, label %103

; <label>:103:                                    ; preds = %96, %92
  %104 = load i32, i32* %10, align 4
  %105 = icmp ult i32 %104, 255
  br i1 %105, label %106, label %114

; <label>:106:                                    ; preds = %103
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 11)
  %107 = add i64 %pgocount8, 1
  store i64 %107, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 11)
  %108 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %109 = load i32, i32* %10, align 4
  %110 = zext i32 %109 to i64
  %111 = call i32 @v1_attachstr(%struct.id3_tag* %108, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i8* null, i64 %110)
  %112 = icmp eq i32 %111, -1
  br i1 %112, label %._crit_edge1, label %114

._crit_edge1:                                     ; preds = %106
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 1)
  %113 = add i64 %pgocount9, 1
  store i64 %113, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 1)
  br label %120

; <label>:114:                                    ; preds = %106, %103
  %115 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %116 = getelementptr inbounds [31 x i8], [31 x i8]* %9, i32 0, i32 0
  %117 = call i32 @v1_attachstr(%struct.id3_tag* %115, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0), i8* %116, i64 0)
  %118 = icmp eq i32 %117, -1
  br i1 %118, label %._crit_edge, label %123

._crit_edge:                                      ; preds = %114
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 0)
  %119 = add i64 %pgocount10, 1
  store i64 %119, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 0)
  br label %120

; <label>:120:                                    ; preds = %._crit_edge1, %._crit_edge, %96, %86, %80, %74, %69
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 2)
  %121 = add i64 %pgocount11, 1
  store i64 %121, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 2)
  %122 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  call void @id3_tag_delete(%struct.id3_tag* %122)
  store %struct.id3_tag* null, %struct.id3_tag** %2, align 8
  br label %128

; <label>:123:                                    ; preds = %114
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 12)
  %124 = add i64 %pgocount12, 1
  store i64 %124, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 12)
  br label %125

; <label>:125:                                    ; preds = %123, %1
  %pgocount13 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 3)
  %126 = add i64 %pgocount13, 1
  store i64 %126, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_v1_parse, i64 0, i64 3)
  %127 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  store %struct.id3_tag* %127, %struct.id3_tag** %2, align 8
  br label %128

; <label>:128:                                    ; preds = %125, %120
  %129 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  ret %struct.id3_tag* %129
}

; Function Attrs: nounwind uwtable
define internal %struct.id3_tag* @v2_parse(i8*) #0 {
  %2 = alloca %struct.id3_tag*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %struct.id3_tag*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i64, align 8
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i64, align 8
  %23 = alloca %struct.id3_frame*, align 8
  store i8* %0, i8** %3, align 8
  store i8* null, i8** %5, align 8
  %24 = call %struct.id3_tag* @id3_tag_new()
  store %struct.id3_tag* %24, %struct.id3_tag** %4, align 8
  %25 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %26 = icmp ne %struct.id3_tag* %25, null
  br i1 %26, label %27, label %400

; <label>:27:                                     ; preds = %1
  %28 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %29 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %28, i32 0, i32 1
  %30 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %31 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %30, i32 0, i32 2
  call void @parse_header(i8** %3, i32* %29, i32* %31, i64* %7)
  %32 = load i64, i64* %7, align 8
  %33 = add i64 10, %32
  %34 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %35 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %34, i32 0, i32 8
  store i64 %33, i64* %35, align 8
  %36 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %37 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %36, i32 0, i32 2
  %38 = load i32, i32* %37, align 8
  %39 = and i32 %38, 128
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %65

; <label>:41:                                     ; preds = %27
  %pgocount = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 4)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 4)
  %43 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %44 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %43, i32 0, i32 1
  %45 = load i32, i32* %44, align 4
  %46 = lshr i32 %45, 8
  %47 = and i32 %46, 255
  %48 = icmp ult i32 %47, 4
  br i1 %48, label %49, label %65

; <label>:49:                                     ; preds = %41
  %50 = load i64, i64* %7, align 8
  %51 = call noalias i8* @malloc(i64 %50) #6
  store i8* %51, i8** %5, align 8
  %52 = load i8*, i8** %5, align 8
  %53 = icmp eq i8* %52, null
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 13)
  %55 = add i64 %pgocount1, 1
  store i64 %55, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 13)
  br label %409

; <label>:56:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 8)
  %57 = add i64 %pgocount2, 1
  store i64 %57, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 8)
  %58 = load i8*, i8** %5, align 8
  %59 = load i8*, i8** %3, align 8
  %60 = load i64, i64* %7, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %58, i8* %59, i64 %60, i32 1, i1 false)
  %61 = load i8*, i8** %5, align 8
  %62 = load i64, i64* %7, align 8
  %63 = call i64 @id3_util_deunsynchronise(i8* %61, i64 %62)
  store i64 %63, i64* %7, align 8
  %64 = load i8*, i8** %5, align 8
  store i8* %64, i8** %3, align 8
  br label %65

; <label>:65:                                     ; preds = %56, %41, %27
  %66 = load i8*, i8** %3, align 8
  %67 = load i64, i64* %7, align 8
  %68 = getelementptr inbounds i8, i8* %66, i64 %67
  store i8* %68, i8** %6, align 8
  %69 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %70 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %69, i32 0, i32 2
  %71 = load i32, i32* %70, align 8
  %72 = and i32 %71, 64
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %350

; <label>:74:                                     ; preds = %65
  %75 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %76 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %75, i32 0, i32 1
  %77 = load i32, i32* %76, align 4
  %78 = lshr i32 %77, 8
  %79 = and i32 %78, 255
  switch i32 %79, label %348 [
    i32 2, label %80
    i32 3, label %82
    i32 4, label %167
  ]

; <label>:80:                                     ; preds = %74
  %pgocount3 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 12)
  %81 = add i64 %pgocount3, 1
  store i64 %81, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 12)
  br label %409

; <label>:82:                                     ; preds = %74
  %83 = load i8*, i8** %6, align 8
  %84 = load i8*, i8** %3, align 8
  %85 = ptrtoint i8* %83 to i64
  %86 = ptrtoint i8* %84 to i64
  %87 = sub i64 %85, %86
  %88 = icmp slt i64 %87, 4
  br i1 %88, label %89, label %91

; <label>:89:                                     ; preds = %82
  %pgocount4 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 15)
  %90 = add i64 %pgocount4, 1
  store i64 %90, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 15)
  br label %409

; <label>:91:                                     ; preds = %82
  %92 = call i64 @id3_parse_uint(i8** %3, i32 4)
  store i64 %92, i64* %10, align 8
  %93 = load i64, i64* %10, align 8
  %94 = load i8*, i8** %6, align 8
  %95 = load i8*, i8** %3, align 8
  %96 = ptrtoint i8* %94 to i64
  %97 = ptrtoint i8* %95 to i64
  %98 = sub i64 %96, %97
  %99 = icmp ugt i64 %93, %98
  br i1 %99, label %100, label %102

; <label>:100:                                    ; preds = %91
  %pgocount5 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 21)
  %101 = add i64 %pgocount5, 1
  store i64 %101, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 21)
  br label %409

; <label>:102:                                    ; preds = %91
  %103 = load i8*, i8** %3, align 8
  store i8* %103, i8** %8, align 8
  %104 = load i8*, i8** %3, align 8
  %105 = load i64, i64* %10, align 8
  %106 = getelementptr inbounds i8, i8* %104, i64 %105
  store i8* %106, i8** %9, align 8
  %107 = load i8*, i8** %9, align 8
  store i8* %107, i8** %3, align 8
  %108 = load i8*, i8** %9, align 8
  %109 = load i8*, i8** %8, align 8
  %110 = ptrtoint i8* %108 to i64
  %111 = ptrtoint i8* %109 to i64
  %112 = sub i64 %110, %111
  %113 = icmp sge i64 %112, 6
  br i1 %113, label %114, label %165

; <label>:114:                                    ; preds = %102
  %115 = call i64 @id3_parse_uint(i8** %8, i32 2)
  %116 = trunc i64 %115 to i32
  store i32 %116, i32* %11, align 4
  %117 = call i64 @id3_parse_uint(i8** %8, i32 4)
  store i64 %117, i64* %12, align 8
  %118 = load i64, i64* %12, align 8
  %119 = load i8*, i8** %6, align 8
  %120 = load i8*, i8** %3, align 8
  %121 = ptrtoint i8* %119 to i64
  %122 = ptrtoint i8* %120 to i64
  %123 = sub i64 %121, %122
  %124 = icmp ugt i64 %118, %123
  br i1 %124, label %125, label %127

; <label>:125:                                    ; preds = %114
  %pgocount6 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 25)
  %126 = add i64 %pgocount6, 1
  store i64 %126, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 25)
  br label %409

; <label>:127:                                    ; preds = %114
  %128 = load i64, i64* %12, align 8
  %129 = load i8*, i8** %6, align 8
  %130 = sub i64 0, %128
  %131 = getelementptr inbounds i8, i8* %129, i64 %130
  store i8* %131, i8** %6, align 8
  %132 = load i32, i32* %11, align 4
  %133 = and i32 %132, 32768
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %135, label %163

; <label>:135:                                    ; preds = %127
  %136 = load i8*, i8** %9, align 8
  %137 = load i8*, i8** %8, align 8
  %138 = ptrtoint i8* %136 to i64
  %139 = ptrtoint i8* %137 to i64
  %140 = sub i64 %138, %139
  %141 = icmp slt i64 %140, 4
  br i1 %141, label %142, label %144

; <label>:142:                                    ; preds = %135
  %pgocount7 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 30)
  %143 = add i64 %pgocount7, 1
  store i64 %143, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 30)
  br label %409

; <label>:144:                                    ; preds = %135
  %145 = call i64 @id3_parse_uint(i8** %8, i32 4)
  store i64 %145, i64* %13, align 8
  %146 = load i64, i64* %13, align 8
  %147 = load i8*, i8** %3, align 8
  %148 = load i8*, i8** %6, align 8
  %149 = load i8*, i8** %3, align 8
  %150 = ptrtoint i8* %148 to i64
  %151 = ptrtoint i8* %149 to i64
  %152 = sub i64 %150, %151
  %153 = call i64 @id3_crc_calculate(i8* %147, i64 %152)
  %154 = icmp ne i64 %146, %153
  br i1 %154, label %155, label %157

; <label>:155:                                    ; preds = %144
  %pgocount8 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 32)
  %156 = add i64 %pgocount8, 1
  store i64 %156, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 32)
  br label %409

; <label>:157:                                    ; preds = %144
  %pgocount9 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 33)
  %158 = add i64 %pgocount9, 1
  store i64 %158, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 33)
  %159 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %160 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %159, i32 0, i32 3
  %161 = load i32, i32* %160, align 4
  %162 = or i32 %161, 32
  store i32 %162, i32* %160, align 4
  br label %163

; <label>:163:                                    ; preds = %157, %127
  %pgocount10 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 27)
  %164 = add i64 %pgocount10, 1
  store i64 %164, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 27)
  br label %165

; <label>:165:                                    ; preds = %163, %102
  %pgocount11 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 23)
  %166 = add i64 %pgocount11, 1
  store i64 %166, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 23)
  br label %348

; <label>:167:                                    ; preds = %74
  %168 = load i8*, i8** %6, align 8
  %169 = load i8*, i8** %3, align 8
  %170 = ptrtoint i8* %168 to i64
  %171 = ptrtoint i8* %169 to i64
  %172 = sub i64 %170, %171
  %173 = icmp slt i64 %172, 4
  br i1 %173, label %174, label %176

; <label>:174:                                    ; preds = %167
  %pgocount12 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 16)
  %175 = add i64 %pgocount12, 1
  store i64 %175, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 16)
  br label %409

; <label>:176:                                    ; preds = %167
  %177 = load i8*, i8** %3, align 8
  store i8* %177, i8** %14, align 8
  %178 = call i64 @id3_parse_syncsafe(i8** %3, i32 4)
  store i64 %178, i64* %16, align 8
  %179 = load i64, i64* %16, align 8
  %180 = icmp ult i64 %179, 6
  br i1 %180, label %190, label %181

; <label>:181:                                    ; preds = %176
  %pgocount13 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 22)
  %182 = add i64 %pgocount13, 1
  store i64 %182, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 22)
  %183 = load i64, i64* %16, align 8
  %184 = load i8*, i8** %6, align 8
  %185 = load i8*, i8** %14, align 8
  %186 = ptrtoint i8* %184 to i64
  %187 = ptrtoint i8* %185 to i64
  %188 = sub i64 %186, %187
  %189 = icmp ugt i64 %183, %188
  br i1 %189, label %190, label %192

; <label>:190:                                    ; preds = %181, %176
  %pgocount14 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 18)
  %191 = add i64 %pgocount14, 1
  store i64 %191, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 18)
  br label %409

; <label>:192:                                    ; preds = %181
  %193 = load i8*, i8** %14, align 8
  %194 = load i64, i64* %16, align 8
  %195 = getelementptr inbounds i8, i8* %193, i64 %194
  store i8* %195, i8** %15, align 8
  %196 = call i64 @id3_parse_uint(i8** %3, i32 1)
  %197 = trunc i64 %196 to i32
  store i32 %197, i32* %17, align 4
  %198 = load i32, i32* %17, align 4
  %199 = icmp ult i32 %198, 1
  br i1 %199, label %210, label %200

; <label>:200:                                    ; preds = %192
  %pgocount15 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 26)
  %201 = add i64 %pgocount15, 1
  store i64 %201, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 26)
  %202 = load i32, i32* %17, align 4
  %203 = zext i32 %202 to i64
  %204 = load i8*, i8** %15, align 8
  %205 = load i8*, i8** %3, align 8
  %206 = ptrtoint i8* %204 to i64
  %207 = ptrtoint i8* %205 to i64
  %208 = sub i64 %206, %207
  %209 = icmp sgt i64 %203, %208
  br i1 %209, label %210, label %212

; <label>:210:                                    ; preds = %200, %192
  %pgocount16 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 24)
  %211 = add i64 %pgocount16, 1
  store i64 %211, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 24)
  br label %409

; <label>:212:                                    ; preds = %200
  %213 = load i8*, i8** %3, align 8
  %214 = load i32, i32* %17, align 4
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds i8, i8* %213, i64 %215
  store i8* %216, i8** %14, align 8
  %217 = load i8*, i8** %3, align 8
  store i8* %217, i8** %18, align 8
  %218 = load i8*, i8** %14, align 8
  store i8* %218, i8** %19, align 8
  br label %219

; <label>:219:                                    ; preds = %268, %212
  %220 = load i32, i32* %17, align 4
  %221 = add i32 %220, -1
  store i32 %221, i32* %17, align 4
  %222 = icmp ne i32 %220, 0
  br i1 %222, label %223, label %270

; <label>:223:                                    ; preds = %219
  %224 = call i64 @id3_parse_uint(i8** %18, i32 1)
  %225 = trunc i64 %224 to i32
  store i32 %225, i32* %21, align 4
  br label %226

; <label>:226:                                    ; preds = %263, %223
  %227 = load i32, i32* %21, align 4
  %228 = icmp ne i32 %227, 0
  br i1 %228, label %229, label %268

; <label>:229:                                    ; preds = %226
  %230 = load i32, i32* %21, align 4
  %231 = and i32 %230, 128
  %232 = icmp ne i32 %231, 0
  br i1 %232, label %233, label %262

; <label>:233:                                    ; preds = %229
  %234 = load i8*, i8** %19, align 8
  %235 = load i8*, i8** %15, align 8
  %236 = icmp eq i8* %234, %235
  br i1 %236, label %237, label %239

; <label>:237:                                    ; preds = %233
  %pgocount17 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 31)
  %238 = add i64 %pgocount17, 1
  store i64 %238, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 31)
  br label %409

; <label>:239:                                    ; preds = %233
  %240 = call i64 @id3_parse_uint(i8** %19, i32 1)
  %241 = trunc i64 %240 to i32
  store i32 %241, i32* %20, align 4
  %242 = load i32, i32* %20, align 4
  %243 = icmp ugt i32 %242, 127
  br i1 %243, label %254, label %244

; <label>:244:                                    ; preds = %239
  %pgocount18 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 19)
  %245 = add i64 %pgocount18, 1
  store i64 %245, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 19)
  %246 = load i32, i32* %20, align 4
  %247 = zext i32 %246 to i64
  %248 = load i8*, i8** %15, align 8
  %249 = load i8*, i8** %19, align 8
  %250 = ptrtoint i8* %248 to i64
  %251 = ptrtoint i8* %249 to i64
  %252 = sub i64 %250, %251
  %253 = icmp sgt i64 %247, %252
  br i1 %253, label %254, label %256

; <label>:254:                                    ; preds = %244, %239
  %pgocount19 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 29)
  %255 = add i64 %pgocount19, 1
  store i64 %255, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 29)
  br label %409

; <label>:256:                                    ; preds = %244
  %pgocount20 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 20)
  %257 = add i64 %pgocount20, 1
  store i64 %257, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 20)
  %258 = load i32, i32* %20, align 4
  %259 = load i8*, i8** %19, align 8
  %260 = zext i32 %258 to i64
  %261 = getelementptr inbounds i8, i8* %259, i64 %260
  store i8* %261, i8** %19, align 8
  br label %262

; <label>:262:                                    ; preds = %256, %229
  br label %263

; <label>:263:                                    ; preds = %262
  %pgocount21 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 14)
  %264 = add i64 %pgocount21, 1
  store i64 %264, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 14)
  %265 = load i32, i32* %21, align 4
  %266 = shl i32 %265, 1
  %267 = and i32 %266, 255
  store i32 %267, i32* %21, align 4
  br label %226

; <label>:268:                                    ; preds = %226
  %pgocount22 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 28)
  %269 = add i64 %pgocount22, 1
  store i64 %269, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 28)
  br label %219

; <label>:270:                                    ; preds = %219
  %271 = call i64 @id3_parse_uint(i8** %3, i32 1)
  %272 = trunc i64 %271 to i32
  %273 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %274 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %273, i32 0, i32 3
  store i32 %272, i32* %274, align 4
  %275 = load i8*, i8** %15, align 8
  store i8* %275, i8** %3, align 8
  %276 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %277 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %276, i32 0, i32 3
  %278 = load i32, i32* %277, align 4
  %279 = and i32 %278, 64
  %280 = icmp ne i32 %279, 0
  br i1 %280, label %281, label %289

; <label>:281:                                    ; preds = %270
  %pgocount23 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 34)
  %282 = add i64 %pgocount23, 1
  store i64 %282, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 34)
  %283 = call i64 @id3_parse_uint(i8** %14, i32 1)
  %284 = trunc i64 %283 to i32
  store i32 %284, i32* %17, align 4
  %285 = load i32, i32* %17, align 4
  %286 = load i8*, i8** %14, align 8
  %287 = zext i32 %285 to i64
  %288 = getelementptr inbounds i8, i8* %286, i64 %287
  store i8* %288, i8** %14, align 8
  br label %289

; <label>:289:                                    ; preds = %281, %270
  %290 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %291 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %290, i32 0, i32 3
  %292 = load i32, i32* %291, align 4
  %293 = and i32 %292, 32
  %294 = icmp ne i32 %293, 0
  br i1 %294, label %295, label %322

; <label>:295:                                    ; preds = %289
  %296 = call i64 @id3_parse_uint(i8** %14, i32 1)
  %297 = trunc i64 %296 to i32
  store i32 %297, i32* %17, align 4
  %298 = load i32, i32* %17, align 4
  %299 = icmp ult i32 %298, 5
  br i1 %299, label %300, label %302

; <label>:300:                                    ; preds = %295
  %pgocount24 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 36)
  %301 = add i64 %pgocount24, 1
  store i64 %301, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 36)
  br label %409

; <label>:302:                                    ; preds = %295
  %303 = call i64 @id3_parse_syncsafe(i8** %14, i32 5)
  store i64 %303, i64* %22, align 8
  %304 = load i32, i32* %17, align 4
  %305 = sub i32 %304, 5
  %306 = load i8*, i8** %14, align 8
  %307 = zext i32 %305 to i64
  %308 = getelementptr inbounds i8, i8* %306, i64 %307
  store i8* %308, i8** %14, align 8
  %309 = load i64, i64* %22, align 8
  %310 = load i8*, i8** %3, align 8
  %311 = load i8*, i8** %6, align 8
  %312 = load i8*, i8** %3, align 8
  %313 = ptrtoint i8* %311 to i64
  %314 = ptrtoint i8* %312 to i64
  %315 = sub i64 %313, %314
  %316 = call i64 @id3_crc_calculate(i8* %310, i64 %315)
  %317 = icmp ne i64 %309, %316
  br i1 %317, label %318, label %320

; <label>:318:                                    ; preds = %302
  %pgocount25 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 39)
  %319 = add i64 %pgocount25, 1
  store i64 %319, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 39)
  br label %409

; <label>:320:                                    ; preds = %302
  %pgocount26 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 40)
  %321 = add i64 %pgocount26, 1
  store i64 %321, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 40)
  br label %322

; <label>:322:                                    ; preds = %320, %289
  %323 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %324 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %323, i32 0, i32 3
  %325 = load i32, i32* %324, align 4
  %326 = and i32 %325, 16
  %327 = icmp ne i32 %326, 0
  br i1 %327, label %328, label %346

; <label>:328:                                    ; preds = %322
  %329 = call i64 @id3_parse_uint(i8** %14, i32 1)
  %330 = trunc i64 %329 to i32
  store i32 %330, i32* %17, align 4
  %331 = load i32, i32* %17, align 4
  %332 = icmp ult i32 %331, 1
  br i1 %332, label %333, label %335

; <label>:333:                                    ; preds = %328
  %pgocount27 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 37)
  %334 = add i64 %pgocount27, 1
  store i64 %334, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 37)
  br label %409

; <label>:335:                                    ; preds = %328
  %pgocount28 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 38)
  %336 = add i64 %pgocount28, 1
  store i64 %336, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 38)
  %337 = call i64 @id3_parse_uint(i8** %14, i32 1)
  %338 = trunc i64 %337 to i32
  %339 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %340 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %339, i32 0, i32 4
  store i32 %338, i32* %340, align 8
  %341 = load i32, i32* %17, align 4
  %342 = sub i32 %341, 1
  %343 = load i8*, i8** %14, align 8
  %344 = zext i32 %342 to i64
  %345 = getelementptr inbounds i8, i8* %343, i64 %344
  store i8* %345, i8** %14, align 8
  br label %346

; <label>:346:                                    ; preds = %335, %322
  %pgocount29 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 35)
  %347 = add i64 %pgocount29, 1
  store i64 %347, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 35)
  br label %348

; <label>:348:                                    ; preds = %346, %165, %74
  %pgocount30 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 11)
  %349 = add i64 %pgocount30, 1
  store i64 %349, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 11)
  br label %350

; <label>:350:                                    ; preds = %348, %65
  br label %351

; <label>:351:                                    ; preds = %382, %350
  %352 = load i8*, i8** %3, align 8
  %353 = load i8*, i8** %6, align 8
  %354 = icmp ult i8* %352, %353
  br i1 %354, label %355, label %384

; <label>:355:                                    ; preds = %351
  %356 = load i8*, i8** %3, align 8
  %357 = load i8, i8* %356, align 1
  %358 = zext i8 %357 to i32
  %359 = icmp eq i32 %358, 0
  br i1 %359, label %360, label %362

; <label>:360:                                    ; preds = %355
  %pgocount31 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 10)
  %361 = add i64 %pgocount31, 1
  store i64 %361, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 10)
  br label %384

; <label>:362:                                    ; preds = %355
  %363 = load i8*, i8** %6, align 8
  %364 = load i8*, i8** %3, align 8
  %365 = ptrtoint i8* %363 to i64
  %366 = ptrtoint i8* %364 to i64
  %367 = sub i64 %365, %366
  %368 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %369 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %368, i32 0, i32 1
  %370 = load i32, i32* %369, align 4
  %371 = call %struct.id3_frame* @id3_frame_parse(i8** %3, i64 %367, i32 %370)
  store %struct.id3_frame* %371, %struct.id3_frame** %23, align 8
  %372 = load %struct.id3_frame*, %struct.id3_frame** %23, align 8
  %373 = icmp eq %struct.id3_frame* %372, null
  br i1 %373, label %380, label %374

; <label>:374:                                    ; preds = %362
  %pgocount32 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 0)
  %375 = add i64 %pgocount32, 1
  store i64 %375, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 0)
  %376 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %377 = load %struct.id3_frame*, %struct.id3_frame** %23, align 8
  %378 = call i32 @id3_tag_attachframe(%struct.id3_tag* %376, %struct.id3_frame* %377)
  %379 = icmp eq i32 %378, -1
  br i1 %379, label %380, label %382

; <label>:380:                                    ; preds = %374, %362
  %pgocount33 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 6)
  %381 = add i64 %pgocount33, 1
  store i64 %381, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 6)
  br label %409

; <label>:382:                                    ; preds = %374
  %pgocount34 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 1)
  %383 = add i64 %pgocount34, 1
  store i64 %383, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 1)
  br label %351

; <label>:384:                                    ; preds = %360, %351
  %385 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %386 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %385, i32 0, i32 1
  %387 = load i32, i32* %386, align 4
  %388 = lshr i32 %387, 8
  %389 = and i32 %388, 255
  %390 = icmp ult i32 %389, 4
  br i1 %390, label %391, label %398

; <label>:391:                                    ; preds = %384
  %pgocount35 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 9)
  %392 = add i64 %pgocount35, 1
  store i64 %392, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 9)
  %393 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %394 = call i32 @id3_compat_fixup(%struct.id3_tag* %393)
  %395 = icmp eq i32 %394, -1
  br i1 %395, label %396, label %398

; <label>:396:                                    ; preds = %391
  %pgocount36 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 17)
  %397 = add i64 %pgocount36, 1
  store i64 %397, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 17)
  br label %409

; <label>:398:                                    ; preds = %391, %384
  %pgocount37 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 7)
  %399 = add i64 %pgocount37, 1
  store i64 %399, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 7)
  br label %400

; <label>:400:                                    ; preds = %398, %1
  %401 = load i8*, i8** %5, align 8
  %402 = icmp ne i8* %401, null
  br i1 %402, label %403, label %406

; <label>:403:                                    ; preds = %400
  %pgocount38 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 3)
  %404 = add i64 %pgocount38, 1
  store i64 %404, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 3)
  %405 = load i8*, i8** %5, align 8
  call void @free(i8* %405) #6
  br label %406

; <label>:406:                                    ; preds = %403, %400
  %pgocount39 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 2)
  %407 = add i64 %pgocount39, 1
  store i64 %407, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 2)
  %408 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  store %struct.id3_tag* %408, %struct.id3_tag** %2, align 8
  br label %417

; <label>:409:                                    ; preds = %396, %380, %333, %318, %300, %254, %237, %210, %190, %174, %155, %142, %125, %100, %89, %80, %54
  %410 = load i8*, i8** %5, align 8
  %411 = icmp ne i8* %410, null
  br i1 %411, label %412, label %415

; <label>:412:                                    ; preds = %409
  %pgocount40 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 5)
  %413 = add i64 %pgocount40, 1
  store i64 %413, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_v2_parse, i64 0, i64 5)
  %414 = load i8*, i8** %5, align 8
  call void @free(i8* %414) #6
  br label %415

; <label>:415:                                    ; preds = %412, %409
  %416 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  call void @id3_tag_delete(%struct.id3_tag* %416)
  store %struct.id3_tag* null, %struct.id3_tag** %2, align 8
  br label %417

; <label>:417:                                    ; preds = %415, %406
  %418 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  ret %struct.id3_tag* %418
}

; Function Attrs: nounwind uwtable
define i64 @id3_tag_render(%struct.id3_tag*, i8*) #0 {
  %3 = alloca i64, align 8
  %4 = alloca %struct.id3_tag*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca i8*, align 8
  store %struct.id3_tag* %0, %struct.id3_tag** %4, align 8
  store i8* %1, i8** %5, align 8
  store i64 0, i64* %6, align 8
  store i8* null, i8** %8, align 8
  store i8* null, i8** %9, align 8
  store i8* null, i8** %10, align 8
  store i8* null, i8** %11, align 8
  %17 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %18 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %17, i32 0, i32 5
  %19 = load i32, i32* %18, align 4
  %20 = and i32 %19, 256
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %27

; <label>:22:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 2)
  %24 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %25 = load i8*, i8** %5, align 8
  %26 = call i64 @v1_render(%struct.id3_tag* %24, i8* %25)
  store i64 %26, i64* %3, align 8
  br label %375

; <label>:27:                                     ; preds = %2
  store i32 0, i32* %14, align 4
  br label %28

; <label>:28:                                     ; preds = %48, %27
  %29 = load i32, i32* %14, align 4
  %30 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %31 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %30, i32 0, i32 6
  %32 = load i32, i32* %31, align 8
  %33 = icmp ult i32 %29, %32
  br i1 %33, label %34, label %51

; <label>:34:                                     ; preds = %28
  %35 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %36 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %35, i32 0, i32 7
  %37 = load %struct.id3_frame**, %struct.id3_frame*** %36, align 8
  %38 = load i32, i32* %14, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %37, i64 %39
  %41 = load %struct.id3_frame*, %struct.id3_frame** %40, align 8
  %42 = call i64 @id3_frame_render(%struct.id3_frame* %41, i8** null, i32 0)
  %43 = icmp ugt i64 %42, 0
  br i1 %43, label %44, label %46

; <label>:44:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 4)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 4)
  br label %51

; <label>:46:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 1)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 1)
  br label %48

; <label>:48:                                     ; preds = %46
  %49 = load i32, i32* %14, align 4
  %50 = add i32 %49, 1
  store i32 %50, i32* %14, align 4
  br label %28

; <label>:51:                                     ; preds = %44, %28
  %52 = load i32, i32* %14, align 4
  %53 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %54 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %53, i32 0, i32 6
  %55 = load i32, i32* %54, align 8
  %56 = icmp eq i32 %52, %55
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %51
  %pgocount3 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 3)
  %58 = add i64 %pgocount3, 1
  store i64 %58, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 3)
  store i64 0, i64* %3, align 8
  br label %375

; <label>:59:                                     ; preds = %51
  %60 = load i8*, i8** %5, align 8
  %61 = icmp ne i8* %60, null
  br i1 %61, label %62, label %64

; <label>:62:                                     ; preds = %59
  %pgocount4 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 5)
  %63 = add i64 %pgocount4, 1
  store i64 %63, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 5)
  br label %66

; <label>:64:                                     ; preds = %59
  %pgocount5 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 18)
  %65 = add i64 %pgocount5, 1
  store i64 %65, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 18)
  br label %66

; <label>:66:                                     ; preds = %64, %62
  %67 = phi i8** [ %5, %62 ], [ null, %64 ]
  store i8** %67, i8*** %7, align 8
  %68 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %69 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %68, i32 0, i32 2
  %70 = load i32, i32* %69, align 8
  %71 = and i32 %70, 240
  store i32 %71, i32* %12, align 4
  %72 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %73 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %72, i32 0, i32 3
  %74 = load i32, i32* %73, align 4
  %75 = and i32 %74, 112
  store i32 %75, i32* %13, align 4
  %76 = load i32, i32* %13, align 4
  %77 = and i32 %76, -33
  store i32 %77, i32* %13, align 4
  %78 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %79 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %78, i32 0, i32 5
  %80 = load i32, i32* %79, align 4
  %81 = and i32 %80, 4
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %87

; <label>:83:                                     ; preds = %66
  %pgocount6 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 13)
  %84 = add i64 %pgocount6, 1
  store i64 %84, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 13)
  %85 = load i32, i32* %13, align 4
  %86 = or i32 %85, 32
  store i32 %86, i32* %13, align 4
  br label %87

; <label>:87:                                     ; preds = %83, %66
  %88 = load i32, i32* %13, align 4
  %89 = and i32 %88, -17
  store i32 %89, i32* %13, align 4
  %90 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %91 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %90, i32 0, i32 4
  %92 = load i32, i32* %91, align 8
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %98

; <label>:94:                                     ; preds = %87
  %pgocount7 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 6)
  %95 = add i64 %pgocount7, 1
  store i64 %95, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 6)
  %96 = load i32, i32* %13, align 4
  %97 = or i32 %96, 16
  store i32 %97, i32* %13, align 4
  br label %98

; <label>:98:                                     ; preds = %94, %87
  %99 = load i32, i32* %12, align 4
  %100 = and i32 %99, -129
  store i32 %100, i32* %12, align 4
  %101 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %102 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %101, i32 0, i32 5
  %103 = load i32, i32* %102, align 4
  %104 = and i32 %103, 1
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %106, label %110

; <label>:106:                                    ; preds = %98
  %pgocount8 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 14)
  %107 = add i64 %pgocount8, 1
  store i64 %107, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 14)
  %108 = load i32, i32* %12, align 4
  %109 = or i32 %108, 128
  store i32 %109, i32* %12, align 4
  br label %110

; <label>:110:                                    ; preds = %106, %98
  %111 = load i32, i32* %12, align 4
  %112 = and i32 %111, -65
  store i32 %112, i32* %12, align 4
  %113 = load i32, i32* %13, align 4
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %119

; <label>:115:                                    ; preds = %110
  %pgocount9 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 7)
  %116 = add i64 %pgocount9, 1
  store i64 %116, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 7)
  %117 = load i32, i32* %12, align 4
  %118 = or i32 %117, 64
  store i32 %118, i32* %12, align 4
  br label %119

; <label>:119:                                    ; preds = %115, %110
  %120 = load i32, i32* %12, align 4
  %121 = and i32 %120, -17
  store i32 %121, i32* %12, align 4
  %122 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %123 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %122, i32 0, i32 5
  %124 = load i32, i32* %123, align 4
  %125 = and i32 %124, 16
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %127, label %131

; <label>:127:                                    ; preds = %119
  %pgocount10 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 15)
  %128 = add i64 %pgocount10, 1
  store i64 %128, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 15)
  %129 = load i32, i32* %12, align 4
  %130 = or i32 %129, 16
  store i32 %130, i32* %12, align 4
  br label %131

; <label>:131:                                    ; preds = %127, %119
  %132 = load i8**, i8*** %7, align 8
  %133 = icmp ne i8** %132, null
  br i1 %133, label %134, label %138

; <label>:134:                                    ; preds = %131
  %pgocount11 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 8)
  %135 = add i64 %pgocount11, 1
  store i64 %135, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 8)
  %136 = load i8**, i8*** %7, align 8
  %137 = load i8*, i8** %136, align 8
  store i8* %137, i8** %8, align 8
  br label %138

; <label>:138:                                    ; preds = %134, %131
  %139 = load i8**, i8*** %7, align 8
  %140 = call i64 @id3_render_immediate(i8** %139, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 3)
  %141 = load i64, i64* %6, align 8
  %142 = add i64 %141, %140
  store i64 %142, i64* %6, align 8
  %143 = load i8**, i8*** %7, align 8
  %144 = call i64 @id3_render_int(i8** %143, i64 1024, i32 2)
  %145 = load i64, i64* %6, align 8
  %146 = add i64 %145, %144
  store i64 %146, i64* %6, align 8
  %147 = load i8**, i8*** %7, align 8
  %148 = load i32, i32* %12, align 4
  %149 = sext i32 %148 to i64
  %150 = call i64 @id3_render_int(i8** %147, i64 %149, i32 1)
  %151 = load i64, i64* %6, align 8
  %152 = add i64 %151, %150
  store i64 %152, i64* %6, align 8
  %153 = load i8**, i8*** %7, align 8
  %154 = icmp ne i8** %153, null
  br i1 %154, label %155, label %159

; <label>:155:                                    ; preds = %138
  %pgocount12 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 9)
  %156 = add i64 %pgocount12, 1
  store i64 %156, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 9)
  %157 = load i8**, i8*** %7, align 8
  %158 = load i8*, i8** %157, align 8
  store i8* %158, i8** %9, align 8
  br label %159

; <label>:159:                                    ; preds = %155, %138
  %160 = load i8**, i8*** %7, align 8
  %161 = call i64 @id3_render_syncsafe(i8** %160, i64 0, i32 4)
  %162 = load i64, i64* %6, align 8
  %163 = add i64 %162, %161
  store i64 %163, i64* %6, align 8
  %164 = load i32, i32* %12, align 4
  %165 = and i32 %164, 64
  %166 = icmp ne i32 %165, 0
  br i1 %166, label %167, label %249

; <label>:167:                                    ; preds = %159
  store i64 0, i64* %15, align 8
  store i8* null, i8** %16, align 8
  %168 = load i8**, i8*** %7, align 8
  %169 = icmp ne i8** %168, null
  br i1 %169, label %170, label %174

; <label>:170:                                    ; preds = %167
  %pgocount13 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 19)
  %171 = add i64 %pgocount13, 1
  store i64 %171, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 19)
  %172 = load i8**, i8*** %7, align 8
  %173 = load i8*, i8** %172, align 8
  store i8* %173, i8** %16, align 8
  br label %174

; <label>:174:                                    ; preds = %170, %167
  %175 = load i8**, i8*** %7, align 8
  %176 = call i64 @id3_render_syncsafe(i8** %175, i64 0, i32 4)
  %177 = load i64, i64* %15, align 8
  %178 = add i64 %177, %176
  store i64 %178, i64* %15, align 8
  %179 = load i8**, i8*** %7, align 8
  %180 = call i64 @id3_render_int(i8** %179, i64 1, i32 1)
  %181 = load i64, i64* %15, align 8
  %182 = add i64 %181, %180
  store i64 %182, i64* %15, align 8
  %183 = load i8**, i8*** %7, align 8
  %184 = load i32, i32* %13, align 4
  %185 = sext i32 %184 to i64
  %186 = call i64 @id3_render_int(i8** %183, i64 %185, i32 1)
  %187 = load i64, i64* %15, align 8
  %188 = add i64 %187, %186
  store i64 %188, i64* %15, align 8
  %189 = load i32, i32* %13, align 4
  %190 = and i32 %189, 64
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %192, label %198

; <label>:192:                                    ; preds = %174
  %pgocount14 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 21)
  %193 = add i64 %pgocount14, 1
  store i64 %193, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 21)
  %194 = load i8**, i8*** %7, align 8
  %195 = call i64 @id3_render_int(i8** %194, i64 0, i32 1)
  %196 = load i64, i64* %15, align 8
  %197 = add i64 %196, %195
  store i64 %197, i64* %15, align 8
  br label %198

; <label>:198:                                    ; preds = %192, %174
  %199 = load i32, i32* %13, align 4
  %200 = and i32 %199, 32
  %201 = icmp ne i32 %200, 0
  br i1 %201, label %202, label %219

; <label>:202:                                    ; preds = %198
  %203 = load i8**, i8*** %7, align 8
  %204 = call i64 @id3_render_int(i8** %203, i64 5, i32 1)
  %205 = load i64, i64* %15, align 8
  %206 = add i64 %205, %204
  store i64 %206, i64* %15, align 8
  %207 = load i8**, i8*** %7, align 8
  %208 = icmp ne i8** %207, null
  br i1 %208, label %209, label %213

; <label>:209:                                    ; preds = %202
  %pgocount15 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 26)
  %210 = add i64 %pgocount15, 1
  store i64 %210, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 26)
  %211 = load i8**, i8*** %7, align 8
  %212 = load i8*, i8** %211, align 8
  store i8* %212, i8** %10, align 8
  br label %213

; <label>:213:                                    ; preds = %209, %202
  %pgocount16 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 22)
  %214 = add i64 %pgocount16, 1
  store i64 %214, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 22)
  %215 = load i8**, i8*** %7, align 8
  %216 = call i64 @id3_render_syncsafe(i8** %215, i64 0, i32 5)
  %217 = load i64, i64* %15, align 8
  %218 = add i64 %217, %216
  store i64 %218, i64* %15, align 8
  br label %219

; <label>:219:                                    ; preds = %213, %198
  %220 = load i32, i32* %13, align 4
  %221 = and i32 %220, 16
  %222 = icmp ne i32 %221, 0
  br i1 %222, label %223, label %237

; <label>:223:                                    ; preds = %219
  %pgocount17 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 23)
  %224 = add i64 %pgocount17, 1
  store i64 %224, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 23)
  %225 = load i8**, i8*** %7, align 8
  %226 = call i64 @id3_render_int(i8** %225, i64 1, i32 1)
  %227 = load i64, i64* %15, align 8
  %228 = add i64 %227, %226
  store i64 %228, i64* %15, align 8
  %229 = load i8**, i8*** %7, align 8
  %230 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %231 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %230, i32 0, i32 4
  %232 = load i32, i32* %231, align 8
  %233 = sext i32 %232 to i64
  %234 = call i64 @id3_render_int(i8** %229, i64 %233, i32 1)
  %235 = load i64, i64* %15, align 8
  %236 = add i64 %235, %234
  store i64 %236, i64* %15, align 8
  br label %237

; <label>:237:                                    ; preds = %223, %219
  %238 = load i8*, i8** %16, align 8
  %239 = icmp ne i8* %238, null
  br i1 %239, label %240, label %244

; <label>:240:                                    ; preds = %237
  %pgocount18 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 20)
  %241 = add i64 %pgocount18, 1
  store i64 %241, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 20)
  %242 = load i64, i64* %15, align 8
  %243 = call i64 @id3_render_syncsafe(i8** %16, i64 %242, i32 4)
  br label %244

; <label>:244:                                    ; preds = %240, %237
  %pgocount19 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 16)
  %245 = add i64 %pgocount19, 1
  store i64 %245, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 16)
  %246 = load i64, i64* %15, align 8
  %247 = load i64, i64* %6, align 8
  %248 = add i64 %247, %246
  store i64 %248, i64* %6, align 8
  br label %249

; <label>:249:                                    ; preds = %244, %159
  %250 = load i8**, i8*** %7, align 8
  %251 = icmp ne i8** %250, null
  br i1 %251, label %252, label %256

; <label>:252:                                    ; preds = %249
  %pgocount20 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 10)
  %253 = add i64 %pgocount20, 1
  store i64 %253, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 10)
  %254 = load i8**, i8*** %7, align 8
  %255 = load i8*, i8** %254, align 8
  store i8* %255, i8** %11, align 8
  br label %256

; <label>:256:                                    ; preds = %252, %249
  store i32 0, i32* %14, align 4
  br label %257

; <label>:257:                                    ; preds = %278, %256
  %258 = load i32, i32* %14, align 4
  %259 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %260 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %259, i32 0, i32 6
  %261 = load i32, i32* %260, align 8
  %262 = icmp ult i32 %258, %261
  br i1 %262, label %263, label %282

; <label>:263:                                    ; preds = %257
  %264 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %265 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %264, i32 0, i32 7
  %266 = load %struct.id3_frame**, %struct.id3_frame*** %265, align 8
  %267 = load i32, i32* %14, align 4
  %268 = zext i32 %267 to i64
  %269 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %266, i64 %268
  %270 = load %struct.id3_frame*, %struct.id3_frame** %269, align 8
  %271 = load i8**, i8*** %7, align 8
  %272 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %273 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %272, i32 0, i32 5
  %274 = load i32, i32* %273, align 4
  %275 = call i64 @id3_frame_render(%struct.id3_frame* %270, i8** %271, i32 %274)
  %276 = load i64, i64* %6, align 8
  %277 = add i64 %276, %275
  store i64 %277, i64* %6, align 8
  br label %278

; <label>:278:                                    ; preds = %263
  %pgocount21 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 0)
  %279 = add i64 %pgocount21, 1
  store i64 %279, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 0)
  %280 = load i32, i32* %14, align 4
  %281 = add i32 %280, 1
  store i32 %281, i32* %14, align 4
  br label %257

; <label>:282:                                    ; preds = %257
  %283 = load i32, i32* %12, align 4
  %284 = and i32 %283, 16
  %285 = icmp ne i32 %284, 0
  br i1 %285, label %335, label %286

; <label>:286:                                    ; preds = %282
  %287 = load i64, i64* %6, align 8
  %288 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %289 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %288, i32 0, i32 8
  %290 = load i64, i64* %289, align 8
  %291 = icmp ult i64 %287, %290
  br i1 %291, label %292, label %303

; <label>:292:                                    ; preds = %286
  %pgocount22 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 24)
  %293 = add i64 %pgocount22, 1
  store i64 %293, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 24)
  %294 = load i8**, i8*** %7, align 8
  %295 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %296 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %295, i32 0, i32 8
  %297 = load i64, i64* %296, align 8
  %298 = load i64, i64* %6, align 8
  %299 = sub i64 %297, %298
  %300 = call i64 @id3_render_padding(i8** %294, i8 zeroext 0, i64 %299)
  %301 = load i64, i64* %6, align 8
  %302 = add i64 %301, %300
  store i64 %302, i64* %6, align 8
  br label %334

; <label>:303:                                    ; preds = %286
  %304 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %305 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %304, i32 0, i32 5
  %306 = load i32, i32* %305, align 4
  %307 = and i32 %306, 1
  %308 = icmp ne i32 %307, 0
  br i1 %308, label %309, label %332

; <label>:309:                                    ; preds = %303
  %310 = load i8**, i8*** %7, align 8
  %311 = icmp eq i8** %310, null
  br i1 %311, label %312, label %316

; <label>:312:                                    ; preds = %309
  %pgocount23 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 28)
  %313 = add i64 %pgocount23, 1
  store i64 %313, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 28)
  %314 = load i64, i64* %6, align 8
  %315 = add i64 %314, 1
  store i64 %315, i64* %6, align 8
  br label %331

; <label>:316:                                    ; preds = %309
  %pgocount24 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 27)
  %317 = add i64 %pgocount24, 1
  store i64 %317, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 27)
  %318 = load i8**, i8*** %7, align 8
  %319 = load i8*, i8** %318, align 8
  %320 = getelementptr inbounds i8, i8* %319, i64 -1
  %321 = load i8, i8* %320, align 1
  %322 = zext i8 %321 to i32
  %323 = icmp eq i32 %322, 255
  br i1 %323, label %324, label %330

; <label>:324:                                    ; preds = %316
  %pgocount25 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 29)
  %325 = add i64 %pgocount25, 1
  store i64 %325, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 29)
  %326 = load i8**, i8*** %7, align 8
  %327 = call i64 @id3_render_padding(i8** %326, i8 zeroext 0, i64 1)
  %328 = load i64, i64* %6, align 8
  %329 = add i64 %328, %327
  store i64 %329, i64* %6, align 8
  br label %330

; <label>:330:                                    ; preds = %324, %316
  br label %331

; <label>:331:                                    ; preds = %330, %312
  br label %332

; <label>:332:                                    ; preds = %331, %303
  %pgocount26 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 25)
  %333 = add i64 %pgocount26, 1
  store i64 %333, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 25)
  br label %334

; <label>:334:                                    ; preds = %332, %292
  br label %335

; <label>:335:                                    ; preds = %334, %282
  %336 = load i8*, i8** %9, align 8
  %337 = icmp ne i8* %336, null
  br i1 %337, label %338, label %343

; <label>:338:                                    ; preds = %335
  %pgocount27 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 11)
  %339 = add i64 %pgocount27, 1
  store i64 %339, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 11)
  %340 = load i64, i64* %6, align 8
  %341 = sub i64 %340, 10
  %342 = call i64 @id3_render_syncsafe(i8** %9, i64 %341, i32 4)
  br label %343

; <label>:343:                                    ; preds = %338, %335
  %344 = load i8*, i8** %10, align 8
  %345 = icmp ne i8* %344, null
  br i1 %345, label %346, label %357

; <label>:346:                                    ; preds = %343
  %pgocount28 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 12)
  %347 = add i64 %pgocount28, 1
  store i64 %347, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 12)
  %348 = load i8*, i8** %11, align 8
  %349 = load i8**, i8*** %7, align 8
  %350 = load i8*, i8** %349, align 8
  %351 = load i8*, i8** %11, align 8
  %352 = ptrtoint i8* %350 to i64
  %353 = ptrtoint i8* %351 to i64
  %354 = sub i64 %352, %353
  %355 = call i64 @id3_crc_calculate(i8* %348, i64 %354)
  %356 = call i64 @id3_render_syncsafe(i8** %10, i64 %355, i32 5)
  br label %357

; <label>:357:                                    ; preds = %346, %343
  %358 = load i32, i32* %12, align 4
  %359 = and i32 %358, 16
  %360 = icmp ne i32 %359, 0
  br i1 %360, label %361, label %373

; <label>:361:                                    ; preds = %357
  %pgocount29 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 17)
  %362 = add i64 %pgocount29, 1
  store i64 %362, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_id3_tag_render, i64 0, i64 17)
  %363 = load i8**, i8*** %7, align 8
  %364 = call i64 @id3_render_immediate(i8** %363, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 3)
  %365 = load i64, i64* %6, align 8
  %366 = add i64 %365, %364
  store i64 %366, i64* %6, align 8
  %367 = load i8**, i8*** %7, align 8
  %368 = load i8*, i8** %8, align 8
  %369 = getelementptr inbounds i8, i8* %368, i64 3
  %370 = call i64 @id3_render_binary(i8** %367, i8* %369, i64 7)
  %371 = load i64, i64* %6, align 8
  %372 = add i64 %371, %370
  store i64 %372, i64* %6, align 8
  br label %373

; <label>:373:                                    ; preds = %361, %357
  %374 = load i64, i64* %6, align 8
  store i64 %374, i64* %3, align 8
  br label %375

; <label>:375:                                    ; preds = %373, %57, %22
  %376 = load i64, i64* %3, align 8
  ret i64 %376
}

; Function Attrs: nounwind uwtable
define internal i64 @v1_render(%struct.id3_tag*, i8*) #0 {
  %3 = alloca i64, align 8
  %4 = alloca %struct.id3_tag*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.id3_frame*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct.id3_tag* %0, %struct.id3_tag** %4, align 8
  store i8* %1, i8** %5, align 8
  %9 = load i8*, i8** %5, align 8
  %10 = icmp eq i8* %9, null
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 3)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 3)
  store i64 128, i64* %3, align 8
  br label %102

; <label>:13:                                     ; preds = %2
  %14 = call i64 @id3_render_immediate(i8** %5, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i32 3)
  %15 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  call void @v1_renderstr(%struct.id3_tag* %15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8** %5, i64 30)
  %16 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  call void @v1_renderstr(%struct.id3_tag* %16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i8** %5, i64 30)
  %17 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  call void @v1_renderstr(%struct.id3_tag* %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i8** %5, i64 30)
  %18 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  call void @v1_renderstr(%struct.id3_tag* %18, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8** %5, i64 4)
  %19 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  call void @v1_renderstr(%struct.id3_tag* %19, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0), i8** %5, i64 30)
  %20 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %21 = call %struct.id3_frame* @id3_tag_findframe(%struct.id3_tag* %20, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0), i32 0)
  store %struct.id3_frame* %21, %struct.id3_frame** %6, align 8
  %22 = load %struct.id3_frame*, %struct.id3_frame** %6, align 8
  %23 = icmp ne %struct.id3_frame* %22, null
  br i1 %23, label %24, label %45

; <label>:24:                                     ; preds = %13
  %25 = load %struct.id3_frame*, %struct.id3_frame** %6, align 8
  %26 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %25, i32 0, i32 10
  %27 = load %union.id3_field*, %union.id3_field** %26, align 8
  %28 = getelementptr inbounds %union.id3_field, %union.id3_field* %27, i64 1
  %29 = call i64* @id3_field_getstrings(%union.id3_field* %28, i32 0)
  %30 = call i64 @id3_ucs4_getnumber(i64* %29)
  %31 = trunc i64 %30 to i32
  store i32 %31, i32* %7, align 4
  %32 = load i32, i32* %7, align 4
  %33 = and i32 %32, 255
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %43

; <label>:35:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 6)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 6)
  %37 = load i8*, i8** %5, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 -2
  store i8 0, i8* %38, align 1
  %39 = load i32, i32* %7, align 4
  %40 = trunc i32 %39 to i8
  %41 = load i8*, i8** %5, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 -1
  store i8 %40, i8* %42, align 1
  br label %43

; <label>:43:                                     ; preds = %35, %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 1)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 1)
  br label %45

; <label>:45:                                     ; preds = %43, %13
  %46 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %47 = call %struct.id3_frame* @id3_tag_findframe(%struct.id3_tag* %46, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i32 0)
  store %struct.id3_frame* %47, %struct.id3_frame** %6, align 8
  %48 = load %struct.id3_frame*, %struct.id3_frame** %6, align 8
  %49 = icmp ne %struct.id3_frame* %48, null
  br i1 %49, label %50, label %58

; <label>:50:                                     ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 2)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 2)
  %52 = load %struct.id3_frame*, %struct.id3_frame** %6, align 8
  %53 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %52, i32 0, i32 10
  %54 = load %union.id3_field*, %union.id3_field** %53, align 8
  %55 = getelementptr inbounds %union.id3_field, %union.id3_field* %54, i64 1
  %56 = call i64* @id3_field_getstrings(%union.id3_field* %55, i32 0)
  %57 = call i64 @id3_ucs4_getnumber(i64* %56)
  br label %60

; <label>:58:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 7)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 7)
  br label %60

; <label>:60:                                     ; preds = %58, %50
  %61 = phi i64 [ %57, %50 ], [ 255, %58 ]
  %62 = trunc i64 %61 to i32
  store i32 %62, i32* %7, align 4
  %63 = load i32, i32* %7, align 4
  %64 = zext i32 %63 to i64
  %65 = call i64 @id3_render_int(i8** %5, i64 %64, i32 1)
  %66 = load i8*, i8** %5, align 8
  %67 = getelementptr inbounds i8, i8* %66, i64 -128
  store i8* %67, i8** %5, align 8
  store i32 3, i32* %8, align 4
  br label %68

; <label>:68:                                     ; preds = %83, %60
  %69 = load i32, i32* %8, align 4
  %70 = icmp ult i32 %69, 127
  br i1 %70, label %71, label %86

; <label>:71:                                     ; preds = %68
  %72 = load i8*, i8** %5, align 8
  %73 = load i32, i32* %8, align 4
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8* %72, i64 %74
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i32
  %78 = icmp ne i32 %77, 32
  br i1 %78, label %79, label %81

; <label>:79:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 4)
  %80 = add i64 %pgocount5, 1
  store i64 %80, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 4)
  br label %86

; <label>:81:                                     ; preds = %71
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 0)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 0)
  br label %83

; <label>:83:                                     ; preds = %81
  %84 = load i32, i32* %8, align 4
  %85 = add i32 %84, 1
  store i32 %85, i32* %8, align 4
  br label %68

; <label>:86:                                     ; preds = %79, %68
  %87 = load i32, i32* %8, align 4
  %88 = icmp eq i32 %87, 127
  br i1 %88, label %89, label %96

; <label>:89:                                     ; preds = %86
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 5)
  %90 = add i64 %pgocount7, 1
  store i64 %90, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 5)
  %91 = load i8*, i8** %5, align 8
  %92 = getelementptr inbounds i8, i8* %91, i64 127
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = icmp eq i32 %94, 255
  br label %96

; <label>:96:                                     ; preds = %89, %86
  %97 = phi i1 [ false, %86 ], [ %95, %89 ]
  %98 = zext i1 %97 to i64
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 8)
  %99 = add i64 %pgocount8, %98
  store i64 %99, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_v1_render, i64 0, i64 8)
  %100 = select i1 %97, i32 0, i32 128
  %101 = sext i32 %100 to i64
  store i64 %101, i64* %3, align 8
  br label %102

; <label>:102:                                    ; preds = %96, %11
  %103 = load i64, i64* %3, align 8
  ret i64 %103
}

declare i64 @id3_frame_render(%struct.id3_frame*, i8**, i32) #3

declare i64 @id3_render_immediate(i8**, i8*, i32) #3

declare i64 @id3_render_int(i8**, i64, i32) #3

declare i64 @id3_render_syncsafe(i8**, i64, i32) #3

declare i64 @id3_render_padding(i8**, i8 zeroext, i64) #3

declare i64 @id3_crc_calculate(i8*, i64) #3

declare i64 @id3_render_binary(i8**, i8*, i64) #3

declare i64 @id3_parse_uint(i8**, i32) #3

declare i64 @id3_parse_syncsafe(i8**, i32) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind uwtable
define internal i32 @v1_attachstr(%struct.id3_tag*, i8*, i8*, i64) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.id3_tag*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca %struct.id3_frame*, align 8
  %11 = alloca [31 x i64], align 16
  %12 = alloca i64*, align 8
  store %struct.id3_tag* %0, %struct.id3_tag** %6, align 8
  store i8* %1, i8** %7, align 8
  store i8* %2, i8** %8, align 8
  store i64 %3, i64* %9, align 8
  %13 = load i8*, i8** %8, align 8
  %14 = icmp ne i8* %13, null
  br i1 %14, label %15, label %25

; <label>:15:                                     ; preds = %4
  %16 = load i8*, i8** %8, align 8
  call void @trim(i8* %16)
  %17 = load i8*, i8** %8, align 8
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 2)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 2)
  store i32 0, i32* %5, align 4
  br label %105

; <label>:23:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 0)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 0)
  br label %25

; <label>:25:                                     ; preds = %23, %4
  %26 = load i8*, i8** %7, align 8
  %27 = call %struct.id3_frame* @id3_frame_new(i8* %26)
  store %struct.id3_frame* %27, %struct.id3_frame** %10, align 8
  %28 = load %struct.id3_frame*, %struct.id3_frame** %10, align 8
  %29 = icmp eq %struct.id3_frame* %28, null
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 1)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 1)
  store i32 -1, i32* %5, align 4
  br label %105

; <label>:32:                                     ; preds = %25
  %33 = load %struct.id3_frame*, %struct.id3_frame** %10, align 8
  %34 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %33, i32 0, i32 10
  %35 = load %union.id3_field*, %union.id3_field** %34, align 8
  %36 = getelementptr inbounds %union.id3_field, %union.id3_field* %35, i64 0
  %37 = call i32 @id3_field_settextencoding(%union.id3_field* %36, i32 0)
  %38 = icmp eq i32 %37, -1
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 3)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 3)
  br label %103

; <label>:41:                                     ; preds = %32
  %42 = load i8*, i8** %8, align 8
  %43 = icmp ne i8* %42, null
  br i1 %43, label %44, label %47

; <label>:44:                                     ; preds = %41
  %45 = load i8*, i8** %8, align 8
  %46 = getelementptr inbounds [31 x i64], [31 x i64]* %11, i32 0, i32 0
  call void @id3_latin1_decode(i8* %45, i64* %46)
  br label %51

; <label>:47:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 4)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 4)
  %49 = getelementptr inbounds [31 x i64], [31 x i64]* %11, i32 0, i32 0
  %50 = load i64, i64* %9, align 8
  call void @id3_ucs4_putnumber(i64* %49, i64 %50)
  br label %51

; <label>:51:                                     ; preds = %47, %44
  %52 = load i8*, i8** %7, align 8
  %53 = call i32 @strcmp(i8* %52, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0)) #8
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %83

; <label>:55:                                     ; preds = %51
  %56 = load %struct.id3_frame*, %struct.id3_frame** %10, align 8
  %57 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %56, i32 0, i32 10
  %58 = load %union.id3_field*, %union.id3_field** %57, align 8
  %59 = getelementptr inbounds %union.id3_field, %union.id3_field* %58, i64 1
  %60 = call i32 @id3_field_setlanguage(%union.id3_field* %59, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0))
  %61 = icmp eq i32 %60, -1
  br i1 %61, label %79, label %62

; <label>:62:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 7)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 7)
  %64 = load %struct.id3_frame*, %struct.id3_frame** %10, align 8
  %65 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %64, i32 0, i32 10
  %66 = load %union.id3_field*, %union.id3_field** %65, align 8
  %67 = getelementptr inbounds %union.id3_field, %union.id3_field* %66, i64 2
  %68 = call i32 @id3_field_setstring(%union.id3_field* %67, i64* getelementptr inbounds ([0 x i64], [0 x i64]* @id3_ucs4_empty, i32 0, i32 0))
  %69 = icmp eq i32 %68, -1
  br i1 %69, label %79, label %70

; <label>:70:                                     ; preds = %62
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 10)
  %71 = add i64 %pgocount6, 1
  store i64 %71, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 10)
  %72 = load %struct.id3_frame*, %struct.id3_frame** %10, align 8
  %73 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %72, i32 0, i32 10
  %74 = load %union.id3_field*, %union.id3_field** %73, align 8
  %75 = getelementptr inbounds %union.id3_field, %union.id3_field* %74, i64 3
  %76 = getelementptr inbounds [31 x i64], [31 x i64]* %11, i32 0, i32 0
  %77 = call i32 @id3_field_setfullstring(%union.id3_field* %75, i64* %76)
  %78 = icmp eq i32 %77, -1
  br i1 %78, label %79, label %81

; <label>:79:                                     ; preds = %70, %62, %55
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 6)
  %80 = add i64 %pgocount7, 1
  store i64 %80, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 6)
  br label %103

; <label>:81:                                     ; preds = %70
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 11)
  %82 = add i64 %pgocount8, 1
  store i64 %82, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 11)
  br label %94

; <label>:83:                                     ; preds = %51
  %84 = getelementptr inbounds [31 x i64], [31 x i64]* %11, i32 0, i32 0
  store i64* %84, i64** %12, align 8
  %85 = load %struct.id3_frame*, %struct.id3_frame** %10, align 8
  %86 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %85, i32 0, i32 10
  %87 = load %union.id3_field*, %union.id3_field** %86, align 8
  %88 = getelementptr inbounds %union.id3_field, %union.id3_field* %87, i64 1
  %89 = call i32 @id3_field_setstrings(%union.id3_field* %88, i32 1, i64** %12)
  %90 = icmp eq i32 %89, -1
  br i1 %90, label %91, label %93

; <label>:91:                                     ; preds = %83
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 8)
  %92 = add i64 %pgocount9, 1
  store i64 %92, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 8)
  br label %103

; <label>:93:                                     ; preds = %83
  br label %94

; <label>:94:                                     ; preds = %93, %81
  %95 = load %struct.id3_tag*, %struct.id3_tag** %6, align 8
  %96 = load %struct.id3_frame*, %struct.id3_frame** %10, align 8
  %97 = call i32 @id3_tag_attachframe(%struct.id3_tag* %95, %struct.id3_frame* %96)
  %98 = icmp eq i32 %97, -1
  br i1 %98, label %99, label %101

; <label>:99:                                     ; preds = %94
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 9)
  %100 = add i64 %pgocount10, 1
  store i64 %100, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 9)
  br label %103

; <label>:101:                                    ; preds = %94
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 5)
  %102 = add i64 %pgocount11, 1
  store i64 %102, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_v1_attachstr, i64 0, i64 5)
  store i32 0, i32* %5, align 4
  br label %105

; <label>:103:                                    ; preds = %99, %91, %79, %39
  %104 = load %struct.id3_frame*, %struct.id3_frame** %10, align 8
  call void @id3_frame_delete(%struct.id3_frame* %104)
  store i32 -1, i32* %5, align 4
  br label %105

; <label>:105:                                    ; preds = %103, %101, %30, %21
  %106 = load i32, i32* %5, align 4
  ret i32 %106
}

; Function Attrs: nounwind uwtable
define internal void @trim(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = call i64 @strlen(i8* %5) #8
  %7 = getelementptr inbounds i8, i8* %4, i64 %6
  store i8* %7, i8** %3, align 8
  br label %8

; <label>:8:                                      ; preds = %21, %1
  %9 = load i8*, i8** %3, align 8
  %10 = load i8*, i8** %2, align 8
  %11 = icmp ugt i8* %9, %10
  br i1 %11, label %12, label %19

; <label>:12:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trim, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trim, i64 0, i64 1)
  %14 = load i8*, i8** %3, align 8
  %15 = getelementptr inbounds i8, i8* %14, i64 -1
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp eq i32 %17, 32
  br label %19

; <label>:19:                                     ; preds = %12, %8
  %20 = phi i1 [ false, %8 ], [ %18, %12 ]
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trim, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trim, i64 0, i64 0)
  %23 = load i8*, i8** %3, align 8
  %24 = getelementptr inbounds i8, i8* %23, i32 -1
  store i8* %24, i8** %3, align 8
  br label %8

; <label>:25:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trim, i64 0, i64 2)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trim, i64 0, i64 2)
  %27 = load i8*, i8** %3, align 8
  store i8 0, i8* %27, align 1
  ret void
}

declare %struct.id3_frame* @id3_frame_new(i8*) #3

declare i32 @id3_field_settextencoding(%union.id3_field*, i32) #3

declare void @id3_latin1_decode(i8*, i64*) #3

declare void @id3_ucs4_putnumber(i64*, i64) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #4

declare i32 @id3_field_setlanguage(%union.id3_field*, i8*) #3

declare i32 @id3_field_setstring(%union.id3_field*, i64*) #3

declare i32 @id3_field_setfullstring(%union.id3_field*, i64*) #3

declare i32 @id3_field_setstrings(%union.id3_field*, i32, i64**) #3

declare i64 @id3_util_deunsynchronise(i8*, i64) #3

declare %struct.id3_frame* @id3_frame_parse(i8**, i64, i32) #3

declare i32 @id3_compat_fixup(%struct.id3_tag*) #3

; Function Attrs: nounwind uwtable
define internal void @v1_renderstr(%struct.id3_tag*, i8*, i8**, i64) #0 {
  %5 = alloca %struct.id3_tag*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i64, align 8
  %9 = alloca %struct.id3_frame*, align 8
  %10 = alloca i64*, align 8
  store %struct.id3_tag* %0, %struct.id3_tag** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i64 %3, i64* %8, align 8
  %11 = load %struct.id3_tag*, %struct.id3_tag** %5, align 8
  %12 = load i8*, i8** %6, align 8
  %13 = call %struct.id3_frame* @id3_tag_findframe(%struct.id3_tag* %11, i8* %12, i32 0)
  store %struct.id3_frame* %13, %struct.id3_frame** %9, align 8
  %14 = load %struct.id3_frame*, %struct.id3_frame** %9, align 8
  %15 = icmp eq %struct.id3_frame* %14, null
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_v1_renderstr, i64 0, i64 1)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_v1_renderstr, i64 0, i64 1)
  store i64* getelementptr inbounds ([0 x i64], [0 x i64]* @id3_ucs4_empty, i32 0, i32 0), i64** %10, align 8
  br label %37

; <label>:18:                                     ; preds = %4
  %19 = load i8*, i8** %6, align 8
  %20 = call i32 @strcmp(i8* %19, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0)) #8
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %29

; <label>:22:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_v1_renderstr, i64 0, i64 2)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_v1_renderstr, i64 0, i64 2)
  %24 = load %struct.id3_frame*, %struct.id3_frame** %9, align 8
  %25 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %24, i32 0, i32 10
  %26 = load %union.id3_field*, %union.id3_field** %25, align 8
  %27 = getelementptr inbounds %union.id3_field, %union.id3_field* %26, i64 3
  %28 = call i64* @id3_field_getfullstring(%union.id3_field* %27)
  store i64* %28, i64** %10, align 8
  br label %36

; <label>:29:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_v1_renderstr, i64 0, i64 0)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_v1_renderstr, i64 0, i64 0)
  %31 = load %struct.id3_frame*, %struct.id3_frame** %9, align 8
  %32 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %31, i32 0, i32 10
  %33 = load %union.id3_field*, %union.id3_field** %32, align 8
  %34 = getelementptr inbounds %union.id3_field, %union.id3_field* %33, i64 1
  %35 = call i64* @id3_field_getstrings(%union.id3_field* %34, i32 0)
  store i64* %35, i64** %10, align 8
  br label %36

; <label>:36:                                     ; preds = %29, %22
  br label %37

; <label>:37:                                     ; preds = %36, %16
  %38 = load i8**, i8*** %7, align 8
  %39 = load i64*, i64** %10, align 8
  %40 = load i64, i64* %8, align 8
  %41 = call i64 @id3_render_paddedstring(i8** %38, i64* %39, i64 %40)
  ret void
}

declare i64 @id3_ucs4_getnumber(i64*) #3

declare i64* @id3_field_getstrings(%union.id3_field*, i32) #3

declare i64* @id3_field_getfullstring(%union.id3_field*) #3

declare i64 @id3_render_paddedstring(i8**, i64*, i64) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #6

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
