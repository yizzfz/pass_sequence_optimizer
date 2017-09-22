; ModuleID = 'tmp1.ll'
source_filename = "frame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.id3_frametype = type { i8*, i32, i32*, i32, i8* }
%struct.id3_frame = type { [5 x i8], i8*, i32, i32, i32, i32, i8*, i64, i64, i32, %union.id3_field* }
%union.id3_field = type { %struct.anon.5 }
%struct.anon.5 = type { i32, i8*, i64 }
%struct.id3_compat = type { i8*, i8*, i32 (%struct.id3_frame*, i8*, i8*, i64)* }

$__llvm_profile_raw_version = comdat any

@id3_frametype_text = external constant %struct.id3_frametype, align 8
@id3_frametype_url = external constant %struct.id3_frametype, align 8
@id3_frametype_experimental = external constant %struct.id3_frametype, align 8
@id3_frametype_unknown = external constant %struct.id3_frametype, align 8
@id3_frametype_obsolete = external constant %struct.id3_frametype, align 8
@.str = private unnamed_addr constant [20 x i8] c"frame->refcount > 0\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"frame.c\00", align 1
@__PRETTY_FUNCTION__.id3_frame_delref = private unnamed_addr constant [42 x i8] c"void id3_frame_delref(struct id3_frame *)\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"ZOBS\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_frame_validid = private constant [17 x i8] c"id3_frame_validid"
@__profn_tmp1.ll_valid_idchar = private constant [20 x i8] c"tmp1.ll:valid_idchar"
@__profn_id3_frame_new = private constant [13 x i8] c"id3_frame_new"
@__profn_id3_frame_delete = private constant [16 x i8] c"id3_frame_delete"
@__profn_id3_frame_addref = private constant [16 x i8] c"id3_frame_addref"
@__profn_id3_frame_delref = private constant [16 x i8] c"id3_frame_delref"
@__profn_id3_frame_parse = private constant [15 x i8] c"id3_frame_parse"
@__profn_tmp1.ll_unparseable = private constant [19 x i8] c"tmp1.ll:unparseable"
@__profn_tmp1.ll_obsolete = private constant [16 x i8] c"tmp1.ll:obsolete"
@__profn_tmp1.ll_parse_data = private constant [18 x i8] c"tmp1.ll:parse_data"
@__profn_id3_frame_render = private constant [16 x i8] c"id3_frame_render"
@__profn_tmp1.ll_render_data = private constant [19 x i8] c"tmp1.ll:render_data"
@__profc_id3_frame_validid = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_frame_validid = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7706369146947718017, i64 39850498994, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_validid, i32 0, i32 0), i8* bitcast (i32 (i8*)* @id3_frame_validid to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_valid_idchar = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_valid_idchar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3148224806647675348, i64 46274221523, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_valid_idchar, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_frame_new = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_frame_new = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6291802053393465055, i64 132483072391, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i32 0, i32 0), i8* bitcast (%struct.id3_frame* (i8*)* @id3_frame_new to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_frame_delete = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_frame_delete = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 472665059286238708, i64 56425897411, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_delete, i32 0, i32 0), i8* bitcast (void (%struct.id3_frame*)* @id3_frame_delete to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_frame_addref = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_frame_addref = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 198359658394681778, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_frame_addref, i32 0, i32 0), i8* bitcast (void (%struct.id3_frame*)* @id3_frame_addref to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_frame_delref = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_frame_delref = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4686062375809213319, i64 33962515092, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_frame_delref, i32 0, i32 0), i8* bitcast (void (%struct.id3_frame*)* @id3_frame_delref to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_frame_parse = private global [47 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_id3_frame_parse = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_id3_frame_parse = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5346149695541172109, i64 282080302947193, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i32 0, i32 0), i8* bitcast (%struct.id3_frame* (i8**, i64, i32)* @id3_frame_parse to i8*), i8* bitcast ([1 x i64]* @__profvp_id3_frame_parse to i8*), i32 47, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_unparseable = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_unparseable = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -766139634773076478, i64 74066110196, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_unparseable, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_obsolete = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_obsolete = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3171033882160040072, i64 74461872474, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_parse_data = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_parse_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6354656297945695968, i64 51054561640, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_parse_data, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_frame_render = private global [27 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_frame_render = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3720169370980764711, i64 360688377689, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i32 0, i32 0), i8* bitcast (i64 (%struct.id3_frame*, i8**, i32)* @id3_frame_render to i8*), i8* null, i32 27, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_render_data = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_render_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3071724591667305052, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_render_data, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [215 x i8] c"\D4\01\00id3_frame_validid\01tmp1.ll:valid_idchar\01id3_frame_new\01id3_frame_delete\01id3_frame_addref\01id3_frame_delref\01id3_frame_parse\01tmp1.ll:unparseable\01tmp1.ll:obsolete\01tmp1.ll:parse_data\01id3_frame_render\01tmp1.ll:render_data", section "__llvm_prf_names"
@llvm.used = appending global [14 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_frame_validid to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_valid_idchar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_frame_new to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_frame_delete to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_frame_addref to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_frame_delref to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_frame_parse to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_unparseable to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_obsolete to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_parse_data to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_frame_render to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_render_data to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([215 x i8], [215 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @id3_frame_validid(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = getelementptr inbounds i8, i8* %3, i64 0
  %5 = load i8, i8* %4, align 1
  %6 = call i32 @valid_idchar(i8 signext %5)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %29

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_validid, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_validid, i64 0, i64 1)
  %10 = load i8*, i8** %2, align 8
  %11 = getelementptr inbounds i8, i8* %10, i64 1
  %12 = load i8, i8* %11, align 1
  %13 = call i32 @valid_idchar(i8 signext %12)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %29

; <label>:15:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_validid, i64 0, i64 2)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_validid, i64 0, i64 2)
  %17 = load i8*, i8** %2, align 8
  %18 = getelementptr inbounds i8, i8* %17, i64 2
  %19 = load i8, i8* %18, align 1
  %20 = call i32 @valid_idchar(i8 signext %19)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %29

; <label>:22:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_validid, i64 0, i64 3)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_validid, i64 0, i64 3)
  %24 = load i8*, i8** %2, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 3
  %26 = load i8, i8* %25, align 1
  %27 = call i32 @valid_idchar(i8 signext %26)
  %28 = icmp ne i32 %27, 0
  br label %29

; <label>:29:                                     ; preds = %22, %15, %8, %1
  %30 = phi i1 [ false, %15 ], [ false, %8 ], [ false, %1 ], [ %28, %22 ]
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_validid, i64 0, i64 0)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_validid, i64 0, i64 0)
  %32 = zext i1 %30 to i32
  ret i32 %32
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @valid_idchar(i8 signext) #0 {
  %2 = alloca i8, align 1
  store i8 %0, i8* %2, align 1
  %3 = load i8, i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp sge i32 %4, 65
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_valid_idchar, i64 0, i64 2)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_valid_idchar, i64 0, i64 2)
  %8 = load i8, i8* %2, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp sle i32 %9, 90
  br i1 %10, label %23, label %11

; <label>:11:                                     ; preds = %6, %1
  %12 = load i8, i8* %2, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp sge i32 %13, 48
  br i1 %14, label %15, label %20

; <label>:15:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_valid_idchar, i64 0, i64 3)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_valid_idchar, i64 0, i64 3)
  %17 = load i8, i8* %2, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp sle i32 %18, 57
  br label %20

; <label>:20:                                     ; preds = %15, %11
  %21 = phi i1 [ false, %11 ], [ %19, %15 ]
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_valid_idchar, i64 0, i64 1)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_valid_idchar, i64 0, i64 1)
  br label %23

; <label>:23:                                     ; preds = %20, %6
  %24 = phi i1 [ true, %6 ], [ %21, %20 ]
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_valid_idchar, i64 0, i64 0)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_valid_idchar, i64 0, i64 0)
  %26 = zext i1 %24 to i32
  ret i32 %26
}

; Function Attrs: noinline nounwind uwtable
define %struct.id3_frame* @id3_frame_new(i8*) #0 {
  %2 = alloca %struct.id3_frame*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %struct.id3_frametype*, align 8
  %5 = alloca %struct.id3_frame*, align 8
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = call i32 @id3_frame_validid(i8* %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %12, label %10

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 5)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 5)
  store %struct.id3_frame* null, %struct.id3_frame** %2, align 8
  br label %139

; <label>:12:                                     ; preds = %1
  %13 = load i8*, i8** %3, align 8
  %14 = call %struct.id3_frametype* @id3_frametype_lookup(i8* %13, i32 4)
  store %struct.id3_frametype* %14, %struct.id3_frametype** %4, align 8
  %15 = load %struct.id3_frametype*, %struct.id3_frametype** %4, align 8
  %16 = icmp eq %struct.id3_frametype* %15, null
  br i1 %16, label %17, label %39

; <label>:17:                                     ; preds = %12
  %18 = load i8*, i8** %3, align 8
  %19 = getelementptr inbounds i8, i8* %18, i64 0
  %20 = load i8, i8* %19, align 1
  %21 = sext i8 %20 to i32
  switch i32 %21, label %30 [
    i32 84, label %24
    i32 87, label %26
    i32 88, label %._crit_edge
    i32 89, label %._crit_edge1
    i32 90, label %28
  ]

._crit_edge1:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 1)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 1)
  br label %28

._crit_edge:                                      ; preds = %17
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 0)
  %23 = add i64 %pgocount3, 1
  store i64 %23, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 0)
  br label %28

; <label>:24:                                     ; preds = %17
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 7)
  %25 = add i64 %pgocount4, 1
  store i64 %25, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 7)
  store %struct.id3_frametype* @id3_frametype_text, %struct.id3_frametype** %4, align 8
  br label %38

; <label>:26:                                     ; preds = %17
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 8)
  %27 = add i64 %pgocount5, 1
  store i64 %27, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 8)
  store %struct.id3_frametype* @id3_frametype_url, %struct.id3_frametype** %4, align 8
  br label %38

; <label>:28:                                     ; preds = %._crit_edge1, %._crit_edge, %17
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 6)
  %29 = add i64 %pgocount6, 1
  store i64 %29, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 6)
  store %struct.id3_frametype* @id3_frametype_experimental, %struct.id3_frametype** %4, align 8
  br label %38

; <label>:30:                                     ; preds = %17
  store %struct.id3_frametype* @id3_frametype_unknown, %struct.id3_frametype** %4, align 8
  %31 = load i8*, i8** %3, align 8
  %32 = call %struct.id3_compat* @id3_compat_lookup(i8* %31, i32 4)
  %33 = icmp ne %struct.id3_compat* %32, null
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %30
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 10)
  %35 = add i64 %pgocount7, 1
  store i64 %35, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 10)
  store %struct.id3_frametype* @id3_frametype_obsolete, %struct.id3_frametype** %4, align 8
  br label %36

; <label>:36:                                     ; preds = %34, %30
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 9)
  %37 = add i64 %pgocount8, 1
  store i64 %37, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 9)
  br label %38

; <label>:38:                                     ; preds = %36, %28, %26, %24
  br label %39

; <label>:39:                                     ; preds = %38, %12
  %40 = load %struct.id3_frametype*, %struct.id3_frametype** %4, align 8
  %41 = getelementptr inbounds %struct.id3_frametype, %struct.id3_frametype* %40, i32 0, i32 1
  %42 = load i32, i32* %41, align 8
  %43 = zext i32 %42 to i64
  %44 = mul i64 %43, 24
  %45 = add i64 72, %44
  %46 = call noalias i8* @malloc(i64 %45) #5
  %47 = bitcast i8* %46 to %struct.id3_frame*
  store %struct.id3_frame* %47, %struct.id3_frame** %5, align 8
  %48 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %49 = icmp ne %struct.id3_frame* %48, null
  br i1 %49, label %50, label %136

; <label>:50:                                     ; preds = %39
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 4)
  %51 = add i64 %pgocount9, 1
  store i64 %51, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 4)
  %52 = load i8*, i8** %3, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 0
  %54 = load i8, i8* %53, align 1
  %55 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %56 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %55, i32 0, i32 0
  %57 = getelementptr inbounds [5 x i8], [5 x i8]* %56, i64 0, i64 0
  store i8 %54, i8* %57, align 8
  %58 = load i8*, i8** %3, align 8
  %59 = getelementptr inbounds i8, i8* %58, i64 1
  %60 = load i8, i8* %59, align 1
  %61 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %62 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %61, i32 0, i32 0
  %63 = getelementptr inbounds [5 x i8], [5 x i8]* %62, i64 0, i64 1
  store i8 %60, i8* %63, align 1
  %64 = load i8*, i8** %3, align 8
  %65 = getelementptr inbounds i8, i8* %64, i64 2
  %66 = load i8, i8* %65, align 1
  %67 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %68 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %67, i32 0, i32 0
  %69 = getelementptr inbounds [5 x i8], [5 x i8]* %68, i64 0, i64 2
  store i8 %66, i8* %69, align 2
  %70 = load i8*, i8** %3, align 8
  %71 = getelementptr inbounds i8, i8* %70, i64 3
  %72 = load i8, i8* %71, align 1
  %73 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %74 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %73, i32 0, i32 0
  %75 = getelementptr inbounds [5 x i8], [5 x i8]* %74, i64 0, i64 3
  store i8 %72, i8* %75, align 1
  %76 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %77 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %76, i32 0, i32 0
  %78 = getelementptr inbounds [5 x i8], [5 x i8]* %77, i64 0, i64 4
  store i8 0, i8* %78, align 4
  %79 = load %struct.id3_frametype*, %struct.id3_frametype** %4, align 8
  %80 = getelementptr inbounds %struct.id3_frametype, %struct.id3_frametype* %79, i32 0, i32 4
  %81 = load i8*, i8** %80, align 8
  %82 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %83 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %82, i32 0, i32 1
  store i8* %81, i8** %83, align 8
  %84 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %85 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %84, i32 0, i32 2
  store i32 0, i32* %85, align 8
  %86 = load %struct.id3_frametype*, %struct.id3_frametype** %4, align 8
  %87 = getelementptr inbounds %struct.id3_frametype, %struct.id3_frametype* %86, i32 0, i32 3
  %88 = load i32, i32* %87, align 8
  %89 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %90 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %89, i32 0, i32 3
  store i32 %88, i32* %90, align 4
  %91 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %92 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %91, i32 0, i32 4
  store i32 0, i32* %92, align 8
  %93 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %94 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %93, i32 0, i32 5
  store i32 0, i32* %94, align 4
  %95 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %96 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %95, i32 0, i32 6
  store i8* null, i8** %96, align 8
  %97 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %98 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %97, i32 0, i32 7
  store i64 0, i64* %98, align 8
  %99 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %100 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %99, i32 0, i32 8
  store i64 0, i64* %100, align 8
  %101 = load %struct.id3_frametype*, %struct.id3_frametype** %4, align 8
  %102 = getelementptr inbounds %struct.id3_frametype, %struct.id3_frametype* %101, i32 0, i32 1
  %103 = load i32, i32* %102, align 8
  %104 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %105 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %104, i32 0, i32 9
  store i32 %103, i32* %105, align 8
  %106 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %107 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %106, i64 1
  %108 = bitcast %struct.id3_frame* %107 to %union.id3_field*
  %109 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %110 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %109, i32 0, i32 10
  store %union.id3_field* %108, %union.id3_field** %110, align 8
  store i32 0, i32* %6, align 4
  br label %111

; <label>:111:                                    ; preds = %131, %50
  %112 = load i32, i32* %6, align 4
  %113 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %114 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %113, i32 0, i32 9
  %115 = load i32, i32* %114, align 8
  %116 = icmp ult i32 %112, %115
  br i1 %116, label %117, label %135

; <label>:117:                                    ; preds = %111
  %118 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %119 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %118, i32 0, i32 10
  %120 = load %union.id3_field*, %union.id3_field** %119, align 8
  %121 = load i32, i32* %6, align 4
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds %union.id3_field, %union.id3_field* %120, i64 %122
  %124 = load %struct.id3_frametype*, %struct.id3_frametype** %4, align 8
  %125 = getelementptr inbounds %struct.id3_frametype, %struct.id3_frametype* %124, i32 0, i32 2
  %126 = load i32*, i32** %125, align 8
  %127 = load i32, i32* %6, align 4
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32* %126, i64 %128
  %130 = load i32, i32* %129, align 4
  call void @id3_field_init(%union.id3_field* %123, i32 %130)
  br label %131

; <label>:131:                                    ; preds = %117
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 2)
  %132 = add i64 %pgocount10, 1
  store i64 %132, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 2)
  %133 = load i32, i32* %6, align 4
  %134 = add i32 %133, 1
  store i32 %134, i32* %6, align 4
  br label %111

; <label>:135:                                    ; preds = %111
  br label %136

; <label>:136:                                    ; preds = %135, %39
  %pgocount11 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 3)
  %137 = add i64 %pgocount11, 1
  store i64 %137, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_frame_new, i64 0, i64 3)
  %138 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  store %struct.id3_frame* %138, %struct.id3_frame** %2, align 8
  br label %139

; <label>:139:                                    ; preds = %136, %10
  %140 = load %struct.id3_frame*, %struct.id3_frame** %2, align 8
  ret %struct.id3_frame* %140
}

declare %struct.id3_frametype* @id3_frametype_lookup(i8*, i32) #1

declare %struct.id3_compat* @id3_compat_lookup(i8*, i32) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @id3_field_init(%union.id3_field*, i32) #1

; Function Attrs: noinline nounwind uwtable
define void @id3_frame_delete(%struct.id3_frame*) #0 {
  %2 = alloca %struct.id3_frame*, align 8
  %3 = alloca i32, align 4
  store %struct.id3_frame* %0, %struct.id3_frame** %2, align 8
  %4 = load %struct.id3_frame*, %struct.id3_frame** %2, align 8
  %5 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %4, i32 0, i32 2
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %40

; <label>:8:                                      ; preds = %1
  store i32 0, i32* %3, align 4
  br label %9

; <label>:9:                                      ; preds = %22, %8
  %10 = load i32, i32* %3, align 4
  %11 = load %struct.id3_frame*, %struct.id3_frame** %2, align 8
  %12 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %11, i32 0, i32 9
  %13 = load i32, i32* %12, align 8
  %14 = icmp ult i32 %10, %13
  br i1 %14, label %15, label %26

; <label>:15:                                     ; preds = %9
  %16 = load %struct.id3_frame*, %struct.id3_frame** %2, align 8
  %17 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %16, i32 0, i32 10
  %18 = load %union.id3_field*, %union.id3_field** %17, align 8
  %19 = load i32, i32* %3, align 4
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds %union.id3_field, %union.id3_field* %18, i64 %20
  call void @id3_field_finish(%union.id3_field* %21)
  br label %22

; <label>:22:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_delete, i64 0, i64 0)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_delete, i64 0, i64 0)
  %24 = load i32, i32* %3, align 4
  %25 = add i32 %24, 1
  store i32 %25, i32* %3, align 4
  br label %9

; <label>:26:                                     ; preds = %9
  %27 = load %struct.id3_frame*, %struct.id3_frame** %2, align 8
  %28 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %27, i32 0, i32 6
  %29 = load i8*, i8** %28, align 8
  %30 = icmp ne i8* %29, null
  br i1 %30, label %31, label %36

; <label>:31:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_delete, i64 0, i64 3)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_delete, i64 0, i64 3)
  %33 = load %struct.id3_frame*, %struct.id3_frame** %2, align 8
  %34 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %33, i32 0, i32 6
  %35 = load i8*, i8** %34, align 8
  call void @free(i8* %35) #5
  br label %36

; <label>:36:                                     ; preds = %31, %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_delete, i64 0, i64 2)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_delete, i64 0, i64 2)
  %38 = load %struct.id3_frame*, %struct.id3_frame** %2, align 8
  %39 = bitcast %struct.id3_frame* %38 to i8*
  call void @free(i8* %39) #5
  br label %40

; <label>:40:                                     ; preds = %36, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_delete, i64 0, i64 1)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_frame_delete, i64 0, i64 1)
  ret void
}

declare void @id3_field_finish(%union.id3_field*) #1

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define void @id3_frame_addref(%struct.id3_frame*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_frame_addref, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_frame_addref, i64 0, i64 0)
  %3 = alloca %struct.id3_frame*, align 8
  store %struct.id3_frame* %0, %struct.id3_frame** %3, align 8
  %4 = load %struct.id3_frame*, %struct.id3_frame** %3, align 8
  %5 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %4, i32 0, i32 2
  %6 = load i32, i32* %5, align 8
  %7 = add i32 %6, 1
  store i32 %7, i32* %5, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @id3_frame_delref(%struct.id3_frame*) #0 {
  %2 = alloca %struct.id3_frame*, align 8
  store %struct.id3_frame* %0, %struct.id3_frame** %2, align 8
  %3 = load %struct.id3_frame*, %struct.id3_frame** %2, align 8
  %4 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %3, i32 0, i32 2
  %5 = load i32, i32* %4, align 8
  %6 = icmp ugt i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %1
  br label %11

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_frame_delref, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_frame_delref, i64 0, i64 1)
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 149, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__PRETTY_FUNCTION__.id3_frame_delref, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11:                                     ; preds = %10, %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_frame_delref, i64 0, i64 0)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_frame_delref, i64 0, i64 0)
  %13 = load %struct.id3_frame*, %struct.id3_frame** %2, align 8
  %14 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %13, i32 0, i32 2
  %15 = load i32, i32* %14, align 8
  %16 = add i32 %15, -1
  store i32 %16, i32* %14, align 8
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: noinline nounwind uwtable
define %struct.id3_frame* @id3_frame_parse(i8**, i64, i32) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.id3_frame*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.id3_compat*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca [4 x i8], align 1
  %19 = alloca i8*, align 8
  store i8** %0, i8*** %4, align 8
  store i64 %1, i64* %5, align 8
  store i32 %2, i32* %6, align 4
  store %struct.id3_frame* null, %struct.id3_frame** %7, align 8
  store i64 0, i64* %12, align 8
  store i32 0, i32* %13, align 4
  store i32 0, i32* %14, align 4
  store i32 0, i32* %15, align 4
  store %struct.id3_compat* null, %struct.id3_compat** %16, align 8
  store i8* null, i8** %17, align 8
  %20 = load i8**, i8*** %4, align 8
  %21 = load i8*, i8** %20, align 8
  store i8* %21, i8** %8, align 8
  %22 = load i8**, i8*** %4, align 8
  %23 = load i8*, i8** %22, align 8
  %24 = load i64, i64* %5, align 8
  %25 = getelementptr inbounds i8, i8* %23, i64 %24
  store i8* %25, i8** %9, align 8
  %26 = load i32, i32* %6, align 4
  %27 = lshr i32 %26, 8
  %28 = and i32 %27, 255
  %29 = icmp ult i32 %28, 4
  br i1 %29, label %30, label %179

; <label>:30:                                     ; preds = %3
  %31 = load i32, i32* %6, align 4
  %32 = lshr i32 %31, 8
  %33 = and i32 %32, 255
  switch i32 %33, label %176 [
    i32 2, label %34
    i32 3, label %62
  ]

; <label>:34:                                     ; preds = %30
  %35 = load i64, i64* %5, align 8
  %36 = icmp ult i64 %35, 6
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %34
  %pgocount = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 5)
  %38 = add i64 %pgocount, 1
  store i64 %38, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 5)
  br label %511

; <label>:39:                                     ; preds = %34
  %40 = load i8*, i8** %8, align 8
  %41 = call %struct.id3_compat* @id3_compat_lookup(i8* %40, i32 3)
  store %struct.id3_compat* %41, %struct.id3_compat** %16, align 8
  %42 = load i8**, i8*** %4, align 8
  %43 = load i8*, i8** %42, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 3
  store i8* %44, i8** %42, align 8
  %45 = load i8**, i8*** %4, align 8
  %46 = call i64 @id3_parse_uint(i8** %45, i32 3)
  store i64 %46, i64* %11, align 8
  %47 = load i64, i64* %11, align 8
  %48 = load i8*, i8** %9, align 8
  %49 = load i8**, i8*** %4, align 8
  %50 = load i8*, i8** %49, align 8
  %51 = ptrtoint i8* %48 to i64
  %52 = ptrtoint i8* %50 to i64
  %53 = sub i64 %51, %52
  %54 = icmp ugt i64 %47, %53
  br i1 %54, label %55, label %57

; <label>:55:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 8)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 8)
  br label %511

; <label>:57:                                     ; preds = %39
  %58 = load i8**, i8*** %4, align 8
  %59 = load i8*, i8** %58, align 8
  %60 = load i64, i64* %11, align 8
  %61 = getelementptr inbounds i8, i8* %59, i64 %60
  store i8* %61, i8** %9, align 8
  br label %178

; <label>:62:                                     ; preds = %30
  %63 = load i64, i64* %5, align 8
  %64 = icmp ult i64 %63, 10
  br i1 %64, label %65, label %67

; <label>:65:                                     ; preds = %62
  %pgocount2 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 6)
  %66 = add i64 %pgocount2, 1
  store i64 %66, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 6)
  br label %511

; <label>:67:                                     ; preds = %62
  %68 = load i8*, i8** %8, align 8
  %69 = call %struct.id3_compat* @id3_compat_lookup(i8* %68, i32 4)
  store %struct.id3_compat* %69, %struct.id3_compat** %16, align 8
  %70 = load i8**, i8*** %4, align 8
  %71 = load i8*, i8** %70, align 8
  %72 = getelementptr inbounds i8, i8* %71, i64 4
  store i8* %72, i8** %70, align 8
  %73 = load i8**, i8*** %4, align 8
  %74 = call i64 @id3_parse_uint(i8** %73, i32 4)
  store i64 %74, i64* %11, align 8
  %75 = load i8**, i8*** %4, align 8
  %76 = call i64 @id3_parse_uint(i8** %75, i32 2)
  %77 = trunc i64 %76 to i32
  store i32 %77, i32* %13, align 4
  %78 = load i64, i64* %11, align 8
  %79 = load i8*, i8** %9, align 8
  %80 = load i8**, i8*** %4, align 8
  %81 = load i8*, i8** %80, align 8
  %82 = ptrtoint i8* %79 to i64
  %83 = ptrtoint i8* %81 to i64
  %84 = sub i64 %82, %83
  %85 = icmp ugt i64 %78, %84
  br i1 %85, label %86, label %88

; <label>:86:                                     ; preds = %67
  %pgocount3 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 9)
  %87 = add i64 %pgocount3, 1
  store i64 %87, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 9)
  br label %511

; <label>:88:                                     ; preds = %67
  %89 = load i8**, i8*** %4, align 8
  %90 = load i8*, i8** %89, align 8
  %91 = load i64, i64* %11, align 8
  %92 = getelementptr inbounds i8, i8* %90, i64 %91
  store i8* %92, i8** %9, align 8
  %93 = load i32, i32* %13, align 4
  %94 = and i32 %93, 31
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %107

; <label>:96:                                     ; preds = %88
  %pgocount4 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 14)
  %97 = add i64 %pgocount4, 1
  store i64 %97, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 14)
  %98 = load i8*, i8** %8, align 8
  %99 = load i8**, i8*** %4, align 8
  %100 = load i8*, i8** %9, align 8
  %101 = load i8**, i8*** %4, align 8
  %102 = load i8*, i8** %101, align 8
  %103 = ptrtoint i8* %100 to i64
  %104 = ptrtoint i8* %102 to i64
  %105 = sub i64 %103, %104
  %106 = call %struct.id3_frame* @unparseable(i8* %98, i8** %99, i64 %105, i32 0, i32 0, i32 0, i64 0)
  store %struct.id3_frame* %106, %struct.id3_frame** %7, align 8
  br label %519

; <label>:107:                                    ; preds = %88
  %108 = load i32, i32* %13, align 4
  %109 = ashr i32 %108, 1
  %110 = and i32 %109, 65280
  %111 = load i32, i32* %13, align 4
  %112 = ashr i32 %111, 4
  %113 = and i32 %112, 12
  %114 = or i32 %110, %113
  %115 = load i32, i32* %13, align 4
  %116 = shl i32 %115, 1
  %117 = and i32 %116, 64
  %118 = or i32 %114, %117
  store i32 %118, i32* %13, align 4
  %119 = load i32, i32* %13, align 4
  %120 = and i32 %119, 8
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %122, label %136

; <label>:122:                                    ; preds = %107
  %123 = load i8*, i8** %9, align 8
  %124 = load i8**, i8*** %4, align 8
  %125 = load i8*, i8** %124, align 8
  %126 = ptrtoint i8* %123 to i64
  %127 = ptrtoint i8* %125 to i64
  %128 = sub i64 %126, %127
  %129 = icmp slt i64 %128, 4
  br i1 %129, label %130, label %132

; <label>:130:                                    ; preds = %122
  %pgocount5 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 38)
  %131 = add i64 %pgocount5, 1
  store i64 %131, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 38)
  br label %511

; <label>:132:                                    ; preds = %122
  %pgocount6 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 39)
  %133 = add i64 %pgocount6, 1
  store i64 %133, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 39)
  %134 = load i8**, i8*** %4, align 8
  %135 = call i64 @id3_parse_uint(i8** %134, i32 4)
  store i64 %135, i64* %12, align 8
  br label %136

; <label>:136:                                    ; preds = %132, %107
  %137 = load i32, i32* %13, align 4
  %138 = and i32 %137, 4
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %140, label %155

; <label>:140:                                    ; preds = %136
  %141 = load i8*, i8** %9, align 8
  %142 = load i8**, i8*** %4, align 8
  %143 = load i8*, i8** %142, align 8
  %144 = ptrtoint i8* %141 to i64
  %145 = ptrtoint i8* %143 to i64
  %146 = sub i64 %144, %145
  %147 = icmp slt i64 %146, 1
  br i1 %147, label %148, label %150

; <label>:148:                                    ; preds = %140
  %pgocount7 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 44)
  %149 = add i64 %pgocount7, 1
  store i64 %149, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 44)
  br label %511

; <label>:150:                                    ; preds = %140
  %pgocount8 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 40)
  %151 = add i64 %pgocount8, 1
  store i64 %151, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 40)
  %152 = load i8**, i8*** %4, align 8
  %153 = call i64 @id3_parse_uint(i8** %152, i32 1)
  %154 = trunc i64 %153 to i32
  store i32 %154, i32* %15, align 4
  br label %155

; <label>:155:                                    ; preds = %150, %136
  %156 = load i32, i32* %13, align 4
  %157 = and i32 %156, 64
  %158 = icmp ne i32 %157, 0
  br i1 %158, label %159, label %174

; <label>:159:                                    ; preds = %155
  %160 = load i8*, i8** %9, align 8
  %161 = load i8**, i8*** %4, align 8
  %162 = load i8*, i8** %161, align 8
  %163 = ptrtoint i8* %160 to i64
  %164 = ptrtoint i8* %162 to i64
  %165 = sub i64 %163, %164
  %166 = icmp slt i64 %165, 1
  br i1 %166, label %167, label %169

; <label>:167:                                    ; preds = %159
  %pgocount9 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 45)
  %168 = add i64 %pgocount9, 1
  store i64 %168, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 45)
  br label %511

; <label>:169:                                    ; preds = %159
  %pgocount10 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 41)
  %170 = add i64 %pgocount10, 1
  store i64 %170, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 41)
  %171 = load i8**, i8*** %4, align 8
  %172 = call i64 @id3_parse_uint(i8** %171, i32 1)
  %173 = trunc i64 %172 to i32
  store i32 %173, i32* %14, align 4
  br label %174

; <label>:174:                                    ; preds = %169, %155
  %pgocount11 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 28)
  %175 = add i64 %pgocount11, 1
  store i64 %175, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 28)
  br label %178

; <label>:176:                                    ; preds = %30
  %pgocount12 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 3)
  %177 = add i64 %pgocount12, 1
  store i64 %177, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 3)
  br label %511

; <label>:178:                                    ; preds = %174, %57
  br label %292

; <label>:179:                                    ; preds = %3
  %180 = load i64, i64* %5, align 8
  %181 = icmp ult i64 %180, 10
  br i1 %181, label %182, label %184

; <label>:182:                                    ; preds = %179
  %pgocount13 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 2)
  %183 = add i64 %pgocount13, 1
  store i64 %183, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 2)
  br label %511

; <label>:184:                                    ; preds = %179
  %185 = load i8**, i8*** %4, align 8
  %186 = load i8*, i8** %185, align 8
  %187 = getelementptr inbounds i8, i8* %186, i64 4
  store i8* %187, i8** %185, align 8
  %188 = load i8**, i8*** %4, align 8
  %189 = call i64 @id3_parse_syncsafe(i8** %188, i32 4)
  store i64 %189, i64* %11, align 8
  %190 = load i8**, i8*** %4, align 8
  %191 = call i64 @id3_parse_uint(i8** %190, i32 2)
  %192 = trunc i64 %191 to i32
  store i32 %192, i32* %13, align 4
  %193 = load i64, i64* %11, align 8
  %194 = load i8*, i8** %9, align 8
  %195 = load i8**, i8*** %4, align 8
  %196 = load i8*, i8** %195, align 8
  %197 = ptrtoint i8* %194 to i64
  %198 = ptrtoint i8* %196 to i64
  %199 = sub i64 %197, %198
  %200 = icmp ugt i64 %193, %199
  br i1 %200, label %201, label %203

; <label>:201:                                    ; preds = %184
  %pgocount14 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 4)
  %202 = add i64 %pgocount14, 1
  store i64 %202, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 4)
  br label %511

; <label>:203:                                    ; preds = %184
  %204 = load i8**, i8*** %4, align 8
  %205 = load i8*, i8** %204, align 8
  %206 = load i64, i64* %11, align 8
  %207 = getelementptr inbounds i8, i8* %205, i64 %206
  store i8* %207, i8** %9, align 8
  %208 = load i32, i32* %13, align 4
  %209 = and i32 %208, 176
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %211, label %223

; <label>:211:                                    ; preds = %203
  %pgocount15 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 7)
  %212 = add i64 %pgocount15, 1
  store i64 %212, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 7)
  %213 = load i8*, i8** %8, align 8
  %214 = load i8**, i8*** %4, align 8
  %215 = load i8*, i8** %9, align 8
  %216 = load i8**, i8*** %4, align 8
  %217 = load i8*, i8** %216, align 8
  %218 = ptrtoint i8* %215 to i64
  %219 = ptrtoint i8* %217 to i64
  %220 = sub i64 %218, %219
  %221 = load i32, i32* %13, align 4
  %222 = call %struct.id3_frame* @unparseable(i8* %213, i8** %214, i64 %220, i32 %221, i32 0, i32 0, i64 0)
  store %struct.id3_frame* %222, %struct.id3_frame** %7, align 8
  br label %519

; <label>:223:                                    ; preds = %203
  %224 = load i32, i32* %13, align 4
  %225 = and i32 %224, 64
  %226 = icmp ne i32 %225, 0
  br i1 %226, label %227, label %242

; <label>:227:                                    ; preds = %223
  %228 = load i8*, i8** %9, align 8
  %229 = load i8**, i8*** %4, align 8
  %230 = load i8*, i8** %229, align 8
  %231 = ptrtoint i8* %228 to i64
  %232 = ptrtoint i8* %230 to i64
  %233 = sub i64 %231, %232
  %234 = icmp slt i64 %233, 1
  br i1 %234, label %235, label %237

; <label>:235:                                    ; preds = %227
  %pgocount16 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 26)
  %236 = add i64 %pgocount16, 1
  store i64 %236, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 26)
  br label %511

; <label>:237:                                    ; preds = %227
  %pgocount17 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 18)
  %238 = add i64 %pgocount17, 1
  store i64 %238, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 18)
  %239 = load i8**, i8*** %4, align 8
  %240 = call i64 @id3_parse_uint(i8** %239, i32 1)
  %241 = trunc i64 %240 to i32
  store i32 %241, i32* %14, align 4
  br label %242

; <label>:242:                                    ; preds = %237, %223
  %243 = load i32, i32* %13, align 4
  %244 = and i32 %243, 8
  %245 = icmp ne i32 %244, 0
  br i1 %245, label %246, label %253

; <label>:246:                                    ; preds = %242
  %pgocount18 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 16)
  %247 = add i64 %pgocount18, 1
  store i64 %247, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 16)
  %248 = load i32, i32* %13, align 4
  %249 = and i32 %248, 1
  %250 = icmp ne i32 %249, 0
  br i1 %250, label %253, label %251

; <label>:251:                                    ; preds = %246
  %pgocount19 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 22)
  %252 = add i64 %pgocount19, 1
  store i64 %252, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 22)
  br label %511

; <label>:253:                                    ; preds = %246, %242
  %254 = load i32, i32* %13, align 4
  %255 = and i32 %254, 4
  %256 = icmp ne i32 %255, 0
  br i1 %256, label %257, label %272

; <label>:257:                                    ; preds = %253
  %258 = load i8*, i8** %9, align 8
  %259 = load i8**, i8*** %4, align 8
  %260 = load i8*, i8** %259, align 8
  %261 = ptrtoint i8* %258 to i64
  %262 = ptrtoint i8* %260 to i64
  %263 = sub i64 %261, %262
  %264 = icmp slt i64 %263, 1
  br i1 %264, label %265, label %267

; <label>:265:                                    ; preds = %257
  %pgocount20 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 36)
  %266 = add i64 %pgocount20, 1
  store i64 %266, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 36)
  br label %511

; <label>:267:                                    ; preds = %257
  %pgocount21 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 25)
  %268 = add i64 %pgocount21, 1
  store i64 %268, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 25)
  %269 = load i8**, i8*** %4, align 8
  %270 = call i64 @id3_parse_uint(i8** %269, i32 1)
  %271 = trunc i64 %270 to i32
  store i32 %271, i32* %15, align 4
  br label %272

; <label>:272:                                    ; preds = %267, %253
  %273 = load i32, i32* %13, align 4
  %274 = and i32 %273, 1
  %275 = icmp ne i32 %274, 0
  br i1 %275, label %276, label %290

; <label>:276:                                    ; preds = %272
  %277 = load i8*, i8** %9, align 8
  %278 = load i8**, i8*** %4, align 8
  %279 = load i8*, i8** %278, align 8
  %280 = ptrtoint i8* %277 to i64
  %281 = ptrtoint i8* %279 to i64
  %282 = sub i64 %280, %281
  %283 = icmp slt i64 %282, 4
  br i1 %283, label %284, label %286

; <label>:284:                                    ; preds = %276
  %pgocount22 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 31)
  %285 = add i64 %pgocount22, 1
  store i64 %285, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 31)
  br label %511

; <label>:286:                                    ; preds = %276
  %pgocount23 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 32)
  %287 = add i64 %pgocount23, 1
  store i64 %287, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 32)
  %288 = load i8**, i8*** %4, align 8
  %289 = call i64 @id3_parse_syncsafe(i8** %288, i32 4)
  store i64 %289, i64* %12, align 8
  br label %290

; <label>:290:                                    ; preds = %286, %272
  %pgocount24 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 17)
  %291 = add i64 %pgocount24, 1
  store i64 %291, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 17)
  br label %292

; <label>:292:                                    ; preds = %290, %178
  %293 = load %struct.id3_compat*, %struct.id3_compat** %16, align 8
  %294 = icmp ne %struct.id3_compat* %293, null
  br i1 %294, label %295, label %312

; <label>:295:                                    ; preds = %292
  %pgocount25 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 10)
  %296 = add i64 %pgocount25, 1
  store i64 %296, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 10)
  %297 = load %struct.id3_compat*, %struct.id3_compat** %16, align 8
  %298 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %297, i32 0, i32 1
  %299 = load i8*, i8** %298, align 8
  %300 = icmp ne i8* %299, null
  br i1 %300, label %301, label %312

; <label>:301:                                    ; preds = %295
  %pgocount26 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 15)
  %302 = add i64 %pgocount26, 1
  store i64 %302, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 15)
  %303 = load %struct.id3_compat*, %struct.id3_compat** %16, align 8
  %304 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %303, i32 0, i32 2
  %305 = load i32 (%struct.id3_frame*, i8*, i8*, i64)*, i32 (%struct.id3_frame*, i8*, i8*, i64)** %304, align 8
  %306 = icmp ne i32 (%struct.id3_frame*, i8*, i8*, i64)* %305, null
  br i1 %306, label %312, label %307

; <label>:307:                                    ; preds = %301
  %pgocount27 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 21)
  %308 = add i64 %pgocount27, 1
  store i64 %308, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 21)
  %309 = load %struct.id3_compat*, %struct.id3_compat** %16, align 8
  %310 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %309, i32 0, i32 1
  %311 = load i8*, i8** %310, align 8
  store i8* %311, i8** %8, align 8
  br label %312

; <label>:312:                                    ; preds = %307, %301, %295, %292
  %313 = load i8**, i8*** %4, align 8
  %314 = load i8*, i8** %313, align 8
  store i8* %314, i8** %10, align 8
  %315 = load i8*, i8** %9, align 8
  %316 = load i8**, i8*** %4, align 8
  store i8* %315, i8** %316, align 8
  %317 = load i32, i32* %13, align 4
  %318 = and i32 %317, 2
  %319 = icmp ne i32 %318, 0
  br i1 %319, label %320, label %358

; <label>:320:                                    ; preds = %312
  %pgocount28 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 11)
  %321 = add i64 %pgocount28, 1
  store i64 %321, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 11)
  %322 = load i8*, i8** %9, align 8
  %323 = load i8*, i8** %10, align 8
  %324 = ptrtoint i8* %322 to i64
  %325 = ptrtoint i8* %323 to i64
  %326 = sub i64 %324, %325
  %327 = icmp sgt i64 %326, 0
  br i1 %327, label %328, label %358

; <label>:328:                                    ; preds = %320
  %329 = load i8*, i8** %9, align 8
  %330 = load i8*, i8** %10, align 8
  %331 = ptrtoint i8* %329 to i64
  %332 = ptrtoint i8* %330 to i64
  %333 = sub i64 %331, %332
  %334 = call noalias i8* @malloc(i64 %333) #5
  store i8* %334, i8** %17, align 8
  %335 = load i8*, i8** %17, align 8
  %336 = icmp eq i8* %335, null
  br i1 %336, label %337, label %339

; <label>:337:                                    ; preds = %328
  %pgocount29 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 27)
  %338 = add i64 %pgocount29, 1
  store i64 %338, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 27)
  br label %511

; <label>:339:                                    ; preds = %328
  %pgocount30 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 19)
  %340 = add i64 %pgocount30, 1
  store i64 %340, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 19)
  %341 = load i8*, i8** %17, align 8
  %342 = load i8*, i8** %10, align 8
  %343 = load i8*, i8** %9, align 8
  %344 = load i8*, i8** %10, align 8
  %345 = ptrtoint i8* %343 to i64
  %346 = ptrtoint i8* %344 to i64
  %347 = sub i64 %345, %346
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %341, i8* %342, i64 %347, i32 1, i1 false)
  %348 = load i8*, i8** %17, align 8
  %349 = load i8*, i8** %17, align 8
  %350 = load i8*, i8** %9, align 8
  %351 = load i8*, i8** %10, align 8
  %352 = ptrtoint i8* %350 to i64
  %353 = ptrtoint i8* %351 to i64
  %354 = sub i64 %352, %353
  %355 = call i64 @id3_util_deunsynchronise(i8* %349, i64 %354)
  %356 = getelementptr inbounds i8, i8* %348, i64 %355
  store i8* %356, i8** %9, align 8
  %357 = load i8*, i8** %17, align 8
  store i8* %357, i8** %10, align 8
  br label %358

; <label>:358:                                    ; preds = %339, %320, %312
  %359 = load i32, i32* %13, align 4
  %360 = and i32 %359, 4
  %361 = icmp ne i32 %360, 0
  br i1 %361, label %362, label %375

; <label>:362:                                    ; preds = %358
  %pgocount31 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 13)
  %363 = add i64 %pgocount31, 1
  store i64 %363, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 13)
  %364 = load i8*, i8** %8, align 8
  %365 = load i8*, i8** %9, align 8
  %366 = load i8*, i8** %10, align 8
  %367 = ptrtoint i8* %365 to i64
  %368 = ptrtoint i8* %366 to i64
  %369 = sub i64 %367, %368
  %370 = load i32, i32* %13, align 4
  %371 = load i32, i32* %14, align 4
  %372 = load i32, i32* %15, align 4
  %373 = load i64, i64* %12, align 8
  %374 = call %struct.id3_frame* @unparseable(i8* %364, i8** %10, i64 %369, i32 %370, i32 %371, i32 %372, i64 %373)
  store %struct.id3_frame* %374, %struct.id3_frame** %7, align 8
  br label %519

; <label>:375:                                    ; preds = %358
  %pgocount32 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 12)
  %376 = add i64 %pgocount32, 1
  store i64 %376, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 12)
  %377 = load i32, i32* %13, align 4
  %378 = and i32 %377, 8
  %379 = icmp ne i32 %378, 0
  br i1 %379, label %380, label %405

; <label>:380:                                    ; preds = %375
  %381 = load i8*, i8** %10, align 8
  %382 = load i8*, i8** %9, align 8
  %383 = load i8*, i8** %10, align 8
  %384 = ptrtoint i8* %382 to i64
  %385 = ptrtoint i8* %383 to i64
  %386 = sub i64 %384, %385
  %387 = load i64, i64* %12, align 8
  %388 = call i8* @id3_util_decompress(i8* %381, i64 %386, i64 %387)
  store i8* %388, i8** %19, align 8
  %389 = load i8*, i8** %19, align 8
  %390 = icmp eq i8* %389, null
  br i1 %390, label %391, label %393

; <label>:391:                                    ; preds = %380
  %pgocount33 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 33)
  %392 = add i64 %pgocount33, 1
  store i64 %392, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 33)
  br label %511

; <label>:393:                                    ; preds = %380
  %394 = load i8*, i8** %17, align 8
  %395 = icmp ne i8* %394, null
  br i1 %395, label %396, label %399

; <label>:396:                                    ; preds = %393
  %pgocount34 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 34)
  %397 = add i64 %pgocount34, 1
  store i64 %397, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 34)
  %398 = load i8*, i8** %17, align 8
  call void @free(i8* %398) #5
  br label %399

; <label>:399:                                    ; preds = %396, %393
  %pgocount35 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 24)
  %400 = add i64 %pgocount35, 1
  store i64 %400, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 24)
  %401 = load i8*, i8** %19, align 8
  store i8* %401, i8** %17, align 8
  store i8* %401, i8** %10, align 8
  %402 = load i8*, i8** %10, align 8
  %403 = load i64, i64* %12, align 8
  %404 = getelementptr inbounds i8, i8* %402, i64 %403
  store i8* %404, i8** %9, align 8
  br label %405

; <label>:405:                                    ; preds = %399, %375
  %406 = load i32, i32* %6, align 4
  %407 = lshr i32 %406, 8
  %408 = and i32 %407, 255
  %409 = icmp eq i32 %408, 2
  br i1 %409, label %410, label %428

; <label>:410:                                    ; preds = %405
  %pgocount36 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 20)
  %411 = add i64 %pgocount36, 1
  store i64 %411, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 20)
  %412 = getelementptr inbounds [4 x i8], [4 x i8]* %18, i64 0, i64 0
  store i8 89, i8* %412, align 1
  %413 = load i8*, i8** %8, align 8
  %414 = getelementptr inbounds i8, i8* %413, i64 0
  %415 = load i8, i8* %414, align 1
  %416 = getelementptr inbounds [4 x i8], [4 x i8]* %18, i64 0, i64 1
  store i8 %415, i8* %416, align 1
  %417 = load i8*, i8** %8, align 8
  %418 = getelementptr inbounds i8, i8* %417, i64 1
  %419 = load i8, i8* %418, align 1
  %420 = getelementptr inbounds [4 x i8], [4 x i8]* %18, i64 0, i64 2
  store i8 %419, i8* %420, align 1
  %421 = load i8*, i8** %8, align 8
  %422 = getelementptr inbounds i8, i8* %421, i64 2
  %423 = load i8, i8* %422, align 1
  %424 = getelementptr inbounds [4 x i8], [4 x i8]* %18, i64 0, i64 3
  store i8 %423, i8* %424, align 1
  %425 = getelementptr inbounds [4 x i8], [4 x i8]* %18, i32 0, i32 0
  store i8* %425, i8** %8, align 8
  %426 = load i32, i32* %13, align 4
  %427 = or i32 %426, 24576
  store i32 %427, i32* %13, align 4
  br label %428

; <label>:428:                                    ; preds = %410, %405
  %429 = load %struct.id3_compat*, %struct.id3_compat** %16, align 8
  %430 = icmp ne %struct.id3_compat* %429, null
  br i1 %430, label %431, label %452

; <label>:431:                                    ; preds = %428
  %432 = load %struct.id3_compat*, %struct.id3_compat** %16, align 8
  %433 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %432, i32 0, i32 1
  %434 = load i8*, i8** %433, align 8
  %435 = icmp ne i8* %434, null
  br i1 %435, label %436, label %440

; <label>:436:                                    ; preds = %431
  %437 = load %struct.id3_compat*, %struct.id3_compat** %16, align 8
  %438 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %437, i32 0, i32 1
  %439 = load i8*, i8** %438, align 8
  store i8* %439, i8** %8, align 8
  br label %450

; <label>:440:                                    ; preds = %431
  %pgocount37 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 35)
  %441 = add i64 %pgocount37, 1
  store i64 %441, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 35)
  %442 = load i8*, i8** %8, align 8
  %443 = load i8*, i8** %10, align 8
  %444 = load i8*, i8** %9, align 8
  %445 = load i8*, i8** %10, align 8
  %446 = ptrtoint i8* %444 to i64
  %447 = ptrtoint i8* %445 to i64
  %448 = sub i64 %446, %447
  %449 = call %struct.id3_frame* @obsolete(i8* %442, i8* %443, i64 %448)
  store %struct.id3_frame* %449, %struct.id3_frame** %7, align 8
  br label %519

; <label>:450:                                    ; preds = %436
  %pgocount38 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 23)
  %451 = add i64 %pgocount38, 1
  store i64 %451, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 23)
  br label %452

; <label>:452:                                    ; preds = %450, %428
  %453 = load i8*, i8** %8, align 8
  %454 = call %struct.id3_frame* @id3_frame_new(i8* %453)
  store %struct.id3_frame* %454, %struct.id3_frame** %7, align 8
  %455 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  %456 = icmp ne %struct.id3_frame* %455, null
  br i1 %456, label %457, label %508

; <label>:457:                                    ; preds = %452
  %458 = load i32, i32* %13, align 4
  %459 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  %460 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %459, i32 0, i32 3
  store i32 %458, i32* %460, align 4
  %461 = load i32, i32* %14, align 4
  %462 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  %463 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %462, i32 0, i32 4
  store i32 %461, i32* %463, align 8
  %464 = load %struct.id3_compat*, %struct.id3_compat** %16, align 8
  %465 = icmp ne %struct.id3_compat* %464, null
  br i1 %465, label %466, label %493

; <label>:466:                                    ; preds = %457
  %pgocount39 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 29)
  %467 = add i64 %pgocount39, 1
  store i64 %467, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 29)
  %468 = load %struct.id3_compat*, %struct.id3_compat** %16, align 8
  %469 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %468, i32 0, i32 2
  %470 = load i32 (%struct.id3_frame*, i8*, i8*, i64)*, i32 (%struct.id3_frame*, i8*, i8*, i64)** %469, align 8
  %471 = icmp ne i32 (%struct.id3_frame*, i8*, i8*, i64)* %470, null
  br i1 %471, label %472, label %493

; <label>:472:                                    ; preds = %466
  %473 = load %struct.id3_compat*, %struct.id3_compat** %16, align 8
  %474 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %473, i32 0, i32 2
  %475 = load i32 (%struct.id3_frame*, i8*, i8*, i64)*, i32 (%struct.id3_frame*, i8*, i8*, i64)** %474, align 8
  %476 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  %477 = load %struct.id3_compat*, %struct.id3_compat** %16, align 8
  %478 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %477, i32 0, i32 0
  %479 = load i8*, i8** %478, align 8
  %480 = load i8*, i8** %10, align 8
  %481 = load i8*, i8** %9, align 8
  %482 = load i8*, i8** %10, align 8
  %483 = ptrtoint i8* %481 to i64
  %484 = ptrtoint i8* %482 to i64
  %485 = sub i64 %483, %484
  %486 = ptrtoint i32 (%struct.id3_frame*, i8*, i8*, i64)* %475 to i64
  call void @__llvm_profile_instrument_target(i64 %486, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_frame_parse to i8*), i32 0)
  %487 = call i32 %475(%struct.id3_frame* %476, i8* %479, i8* %480, i64 %485)
  %488 = icmp eq i32 %487, -1
  br i1 %488, label %489, label %491

; <label>:489:                                    ; preds = %472
  %pgocount40 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 46)
  %490 = add i64 %pgocount40, 1
  store i64 %490, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 46)
  br label %511

; <label>:491:                                    ; preds = %472
  %pgocount41 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 42)
  %492 = add i64 %pgocount41, 1
  store i64 %492, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 42)
  br label %507

; <label>:493:                                    ; preds = %466, %457
  %494 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  %495 = load i8*, i8** %10, align 8
  %496 = load i8*, i8** %9, align 8
  %497 = load i8*, i8** %10, align 8
  %498 = ptrtoint i8* %496 to i64
  %499 = ptrtoint i8* %497 to i64
  %500 = sub i64 %498, %499
  %501 = call i32 @parse_data(%struct.id3_frame* %494, i8* %495, i64 %500)
  %502 = icmp eq i32 %501, -1
  br i1 %502, label %503, label %505

; <label>:503:                                    ; preds = %493
  %pgocount42 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 43)
  %504 = add i64 %pgocount42, 1
  store i64 %504, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 43)
  br label %511

; <label>:505:                                    ; preds = %493
  %pgocount43 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 37)
  %506 = add i64 %pgocount43, 1
  store i64 %506, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 37)
  br label %507

; <label>:507:                                    ; preds = %505, %491
  br label %508

; <label>:508:                                    ; preds = %507, %452
  br i1 false, label %509, label %518

; <label>:509:                                    ; preds = %508
  %pgocount44 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 30)
  %510 = add i64 %pgocount44, 1
  store i64 %510, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 30)
  br label %511

; <label>:511:                                    ; preds = %509, %503, %489, %391, %337, %284, %265, %251, %235, %201, %182, %176, %167, %148, %130, %86, %65, %55, %37
  %512 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  %513 = icmp ne %struct.id3_frame* %512, null
  br i1 %513, label %514, label %517

; <label>:514:                                    ; preds = %511
  %pgocount45 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 1)
  %515 = add i64 %pgocount45, 1
  store i64 %515, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 1)
  %516 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  call void @id3_frame_delete(%struct.id3_frame* %516)
  store %struct.id3_frame* null, %struct.id3_frame** %7, align 8
  br label %517

; <label>:517:                                    ; preds = %514, %511
  br label %518

; <label>:518:                                    ; preds = %517, %508
  br label %519

; <label>:519:                                    ; preds = %518, %440, %362, %211, %96
  %520 = load i8*, i8** %17, align 8
  %521 = icmp ne i8* %520, null
  br i1 %521, label %522, label %525

; <label>:522:                                    ; preds = %519
  %pgocount46 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 0)
  %523 = add i64 %pgocount46, 1
  store i64 %523, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_id3_frame_parse, i64 0, i64 0)
  %524 = load i8*, i8** %17, align 8
  call void @free(i8* %524) #5
  br label %525

; <label>:525:                                    ; preds = %522, %519
  %526 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  ret %struct.id3_frame* %526
}

declare i64 @id3_parse_uint(i8**, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal %struct.id3_frame* @unparseable(i8*, i8**, i64, i32, i32, i32, i64) #0 {
  %8 = alloca i8*, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  %15 = alloca %struct.id3_frame*, align 8
  %16 = alloca i8*, align 8
  store i8* %0, i8** %8, align 8
  store i8** %1, i8*** %9, align 8
  store i64 %2, i64* %10, align 8
  store i32 %3, i32* %11, align 4
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  store i64 %6, i64* %14, align 8
  store %struct.id3_frame* null, %struct.id3_frame** %15, align 8
  %17 = load i64, i64* %10, align 8
  %18 = icmp ne i64 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %7
  %20 = load i64, i64* %10, align 8
  br label %23

; <label>:21:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_unparseable, i64 0, i64 1)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_unparseable, i64 0, i64 1)
  br label %23

; <label>:23:                                     ; preds = %21, %19
  %24 = phi i64 [ %20, %19 ], [ 1, %21 ]
  %25 = call noalias i8* @malloc(i64 %24) #5
  store i8* %25, i8** %16, align 8
  %26 = load i8*, i8** %16, align 8
  %27 = icmp eq i8* %26, null
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_unparseable, i64 0, i64 2)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_unparseable, i64 0, i64 2)
  br label %65

; <label>:30:                                     ; preds = %23
  %31 = load i8*, i8** %8, align 8
  %32 = call %struct.id3_frame* @id3_frame_new(i8* %31)
  store %struct.id3_frame* %32, %struct.id3_frame** %15, align 8
  %33 = load %struct.id3_frame*, %struct.id3_frame** %15, align 8
  %34 = icmp eq %struct.id3_frame* %33, null
  br i1 %34, label %35, label %38

; <label>:35:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_unparseable, i64 0, i64 4)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_unparseable, i64 0, i64 4)
  %37 = load i8*, i8** %16, align 8
  call void @free(i8* %37) #5
  br label %62

; <label>:38:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_unparseable, i64 0, i64 0)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_unparseable, i64 0, i64 0)
  %40 = load i8*, i8** %16, align 8
  %41 = load i8**, i8*** %9, align 8
  %42 = load i8*, i8** %41, align 8
  %43 = load i64, i64* %10, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* %42, i64 %43, i32 1, i1 false)
  %44 = load i32, i32* %11, align 4
  %45 = load %struct.id3_frame*, %struct.id3_frame** %15, align 8
  %46 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %45, i32 0, i32 3
  store i32 %44, i32* %46, align 4
  %47 = load i32, i32* %12, align 4
  %48 = load %struct.id3_frame*, %struct.id3_frame** %15, align 8
  %49 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %48, i32 0, i32 4
  store i32 %47, i32* %49, align 8
  %50 = load i32, i32* %13, align 4
  %51 = load %struct.id3_frame*, %struct.id3_frame** %15, align 8
  %52 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %51, i32 0, i32 5
  store i32 %50, i32* %52, align 4
  %53 = load i8*, i8** %16, align 8
  %54 = load %struct.id3_frame*, %struct.id3_frame** %15, align 8
  %55 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %54, i32 0, i32 6
  store i8* %53, i8** %55, align 8
  %56 = load i64, i64* %10, align 8
  %57 = load %struct.id3_frame*, %struct.id3_frame** %15, align 8
  %58 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %57, i32 0, i32 7
  store i64 %56, i64* %58, align 8
  %59 = load i64, i64* %14, align 8
  %60 = load %struct.id3_frame*, %struct.id3_frame** %15, align 8
  %61 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %60, i32 0, i32 8
  store i64 %59, i64* %61, align 8
  br label %62

; <label>:62:                                     ; preds = %38, %35
  br i1 false, label %63, label %66

; <label>:63:                                     ; preds = %62
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_unparseable, i64 0, i64 3)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_unparseable, i64 0, i64 3)
  br label %65

; <label>:65:                                     ; preds = %63, %28
  br label %66

; <label>:66:                                     ; preds = %65, %62
  %67 = load i64, i64* %10, align 8
  %68 = load i8**, i8*** %9, align 8
  %69 = load i8*, i8** %68, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 %67
  store i8* %70, i8** %68, align 8
  %71 = load %struct.id3_frame*, %struct.id3_frame** %15, align 8
  ret %struct.id3_frame* %71
}

declare i64 @id3_parse_syncsafe(i8**, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

declare i64 @id3_util_deunsynchronise(i8*, i64) #1

declare i8* @id3_util_decompress(i8*, i64, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal %struct.id3_frame* @obsolete(i8*, i8*, i64) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.id3_frame*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i64 %2, i64* %6, align 8
  %8 = call %struct.id3_frame* @id3_frame_new(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0))
  store %struct.id3_frame* %8, %struct.id3_frame** %7, align 8
  %9 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  %10 = icmp ne %struct.id3_frame* %9, null
  br i1 %10, label %11, label %33

; <label>:11:                                     ; preds = %3
  %12 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  %13 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %12, i32 0, i32 10
  %14 = load %union.id3_field*, %union.id3_field** %13, align 8
  %15 = getelementptr inbounds %union.id3_field, %union.id3_field* %14, i64 0
  %16 = load i8*, i8** %4, align 8
  %17 = call i32 @id3_field_setframeid(%union.id3_field* %15, i8* %16)
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %29, label %19

; <label>:19:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 2)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 2)
  %21 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  %22 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %21, i32 0, i32 10
  %23 = load %union.id3_field*, %union.id3_field** %22, align 8
  %24 = getelementptr inbounds %union.id3_field, %union.id3_field* %23, i64 1
  %25 = load i8*, i8** %5, align 8
  %26 = load i64, i64* %6, align 8
  %27 = call i32 @id3_field_setbinarydata(%union.id3_field* %24, i8* %25, i64 %26)
  %28 = icmp eq i32 %27, -1
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %19, %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 3)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 3)
  br label %36

; <label>:31:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 5)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 5)
  br label %33

; <label>:33:                                     ; preds = %31, %3
  br i1 false, label %34, label %43

; <label>:34:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 4)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 4)
  br label %36

; <label>:36:                                     ; preds = %34, %29
  %37 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  %38 = icmp ne %struct.id3_frame* %37, null
  br i1 %38, label %39, label %42

; <label>:39:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 1)
  %40 = add i64 %pgocount4, 1
  store i64 %40, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 1)
  %41 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  call void @id3_frame_delete(%struct.id3_frame* %41)
  store %struct.id3_frame* null, %struct.id3_frame** %7, align 8
  br label %42

; <label>:42:                                     ; preds = %39, %36
  br label %43

; <label>:43:                                     ; preds = %42, %33
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 0)
  %44 = add i64 %pgocount5, 1
  store i64 %44, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_obsolete, i64 0, i64 0)
  %45 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  ret %struct.id3_frame* %45
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @parse_data(%struct.id3_frame*, i8*, i64) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.id3_frame*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  store %struct.id3_frame* %0, %struct.id3_frame** %5, align 8
  store i8* %1, i8** %6, align 8
  store i64 %2, i64* %7, align 8
  store i32 0, i32* %8, align 4
  %11 = load i8*, i8** %6, align 8
  %12 = load i64, i64* %7, align 8
  %13 = getelementptr inbounds i8, i8* %11, i64 %12
  store i8* %13, i8** %9, align 8
  store i32 0, i32* %10, align 4
  br label %14

; <label>:14:                                     ; preds = %37, %3
  %15 = load i32, i32* %10, align 4
  %16 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %17 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %16, i32 0, i32 9
  %18 = load i32, i32* %17, align 8
  %19 = icmp ult i32 %15, %18
  br i1 %19, label %20, label %41

; <label>:20:                                     ; preds = %14
  %21 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %22 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %21, i32 0, i32 10
  %23 = load %union.id3_field*, %union.id3_field** %22, align 8
  %24 = load i32, i32* %10, align 4
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds %union.id3_field, %union.id3_field* %23, i64 %25
  %27 = load i8*, i8** %9, align 8
  %28 = load i8*, i8** %6, align 8
  %29 = ptrtoint i8* %27 to i64
  %30 = ptrtoint i8* %28 to i64
  %31 = sub i64 %29, %30
  %32 = call i32 @id3_field_parse(%union.id3_field* %26, i8** %6, i64 %31, i32* %8)
  %33 = icmp eq i32 %32, -1
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_parse_data, i64 0, i64 2)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_parse_data, i64 0, i64 2)
  store i32 -1, i32* %4, align 4
  br label %43

; <label>:36:                                     ; preds = %20
  br label %37

; <label>:37:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_parse_data, i64 0, i64 0)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_parse_data, i64 0, i64 0)
  %39 = load i32, i32* %10, align 4
  %40 = add i32 %39, 1
  store i32 %40, i32* %10, align 4
  br label %14

; <label>:41:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_parse_data, i64 0, i64 1)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_parse_data, i64 0, i64 1)
  store i32 0, i32* %4, align 4
  br label %43

; <label>:43:                                     ; preds = %41, %34
  %44 = load i32, i32* %4, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_frame_render(%struct.id3_frame*, i8**, i32) #0 {
  %4 = alloca i64, align 8
  %5 = alloca %struct.id3_frame*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  store %struct.id3_frame* %0, %struct.id3_frame** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i32 %2, i32* %7, align 4
  store i64 0, i64* %8, align 8
  store i8* null, i8** %11, align 8
  store i8* null, i8** %12, align 8
  store i8* null, i8** %13, align 8
  %18 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %19 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %18, i32 0, i32 3
  %20 = load i32, i32* %19, align 4
  %21 = and i32 %20, 16384
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %35, label %23

; <label>:23:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 1)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 1)
  %25 = load i32, i32* %7, align 4
  %26 = and i32 %25, 32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %37

; <label>:28:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 2)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 2)
  %30 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %31 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %30, i32 0, i32 3
  %32 = load i32, i32* %31, align 4
  %33 = and i32 %32, 8192
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %28, %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 0)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 0)
  store i64 0, i64* %4, align 8
  br label %306

; <label>:37:                                     ; preds = %28, %23
  %38 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %39 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %38, i32 0, i32 10
  %40 = load %union.id3_field*, %union.id3_field** %39, align 8
  %41 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %42 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %41, i32 0, i32 9
  %43 = load i32, i32* %42, align 8
  %44 = call i64 @render_data(i8** null, %union.id3_field* %40, i32 %43)
  store i64 %44, i64* %9, align 8
  %45 = load i64, i64* %9, align 8
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %47, label %55

; <label>:47:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 6)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 6)
  %49 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %50 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %49, i32 0, i32 6
  %51 = load i8*, i8** %50, align 8
  %52 = icmp eq i8* %51, null
  br i1 %52, label %53, label %55

; <label>:53:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 17)
  %54 = add i64 %pgocount4, 1
  store i64 %54, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 17)
  store i64 0, i64* %4, align 8
  br label %306

; <label>:55:                                     ; preds = %47, %37
  %56 = load i8**, i8*** %6, align 8
  %57 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %58 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %57, i32 0, i32 0
  %59 = getelementptr inbounds [5 x i8], [5 x i8]* %58, i32 0, i32 0
  %60 = call i64 @id3_render_immediate(i8** %56, i8* %59, i32 4)
  %61 = load i64, i64* %8, align 8
  %62 = add i64 %61, %60
  store i64 %62, i64* %8, align 8
  %63 = load i8**, i8*** %6, align 8
  %64 = icmp ne i8** %63, null
  br i1 %64, label %65, label %69

; <label>:65:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 3)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 3)
  %67 = load i8**, i8*** %6, align 8
  %68 = load i8*, i8** %67, align 8
  store i8* %68, i8** %11, align 8
  br label %69

; <label>:69:                                     ; preds = %65, %55
  %70 = load i8**, i8*** %6, align 8
  %71 = call i64 @id3_render_syncsafe(i8** %70, i64 0, i32 4)
  %72 = load i64, i64* %8, align 8
  %73 = add i64 %72, %71
  store i64 %73, i64* %8, align 8
  %74 = load i8**, i8*** %6, align 8
  %75 = icmp ne i8** %74, null
  br i1 %75, label %76, label %80

; <label>:76:                                     ; preds = %69
  %pgocount6 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 4)
  %77 = add i64 %pgocount6, 1
  store i64 %77, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 4)
  %78 = load i8**, i8*** %6, align 8
  %79 = load i8*, i8** %78, align 8
  store i8* %79, i8** %12, align 8
  br label %80

; <label>:80:                                     ; preds = %76, %69
  %81 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %82 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %81, i32 0, i32 3
  %83 = load i32, i32* %82, align 4
  store i32 %83, i32* %14, align 4
  %84 = load i8**, i8*** %6, align 8
  %85 = load i32, i32* %14, align 4
  %86 = sext i32 %85 to i64
  %87 = call i64 @id3_render_int(i8** %84, i64 %86, i32 2)
  %88 = load i64, i64* %8, align 8
  %89 = add i64 %88, %87
  store i64 %89, i64* %8, align 8
  %90 = load i32, i32* %14, align 4
  %91 = and i32 %90, 176
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %114

; <label>:93:                                     ; preds = %80
  %94 = load i8**, i8*** %6, align 8
  %95 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %96 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %95, i32 0, i32 6
  %97 = load i8*, i8** %96, align 8
  %98 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %99 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %98, i32 0, i32 7
  %100 = load i64, i64* %99, align 8
  %101 = call i64 @id3_render_binary(i8** %94, i8* %97, i64 %100)
  %102 = load i64, i64* %8, align 8
  %103 = add i64 %102, %101
  store i64 %103, i64* %8, align 8
  %104 = load i8*, i8** %11, align 8
  %105 = icmp ne i8* %104, null
  br i1 %105, label %106, label %111

; <label>:106:                                    ; preds = %93
  %pgocount7 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 7)
  %107 = add i64 %pgocount7, 1
  store i64 %107, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 7)
  %108 = load i64, i64* %8, align 8
  %109 = sub i64 %108, 10
  %110 = call i64 @id3_render_syncsafe(i8** %11, i64 %109, i32 4)
  br label %111

; <label>:111:                                    ; preds = %106, %93
  %pgocount8 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 5)
  %112 = add i64 %pgocount8, 1
  store i64 %112, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 5)
  %113 = load i64, i64* %8, align 8
  store i64 %113, i64* %4, align 8
  br label %306

; <label>:114:                                    ; preds = %80
  %115 = load i32, i32* %14, align 4
  %116 = and i32 %115, 28751
  store i32 %116, i32* %14, align 4
  %117 = load i32, i32* %14, align 4
  %118 = and i32 %117, -3
  store i32 %118, i32* %14, align 4
  %119 = load i32, i32* %7, align 4
  %120 = and i32 %119, 1
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %122, label %126

; <label>:122:                                    ; preds = %114
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 11)
  %123 = add i64 %pgocount9, 1
  store i64 %123, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 11)
  %124 = load i32, i32* %14, align 4
  %125 = or i32 %124, 2
  store i32 %125, i32* %14, align 4
  br label %126

; <label>:126:                                    ; preds = %122, %114
  %127 = load i32, i32* %14, align 4
  %128 = and i32 %127, 4
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %142, label %130

; <label>:130:                                    ; preds = %126
  %131 = load i32, i32* %14, align 4
  %132 = and i32 %131, -9
  store i32 %132, i32* %14, align 4
  %133 = load i32, i32* %7, align 4
  %134 = and i32 %133, 2
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %136, label %140

; <label>:136:                                    ; preds = %130
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 19)
  %137 = add i64 %pgocount10, 1
  store i64 %137, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 19)
  %138 = load i32, i32* %14, align 4
  %139 = or i32 %138, 9
  store i32 %139, i32* %14, align 4
  br label %140

; <label>:140:                                    ; preds = %136, %130
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 12)
  %141 = add i64 %pgocount11, 1
  store i64 %141, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 12)
  br label %142

; <label>:142:                                    ; preds = %140, %126
  %143 = load i32, i32* %14, align 4
  %144 = and i32 %143, 64
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %146, label %156

; <label>:146:                                    ; preds = %142
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 13)
  %147 = add i64 %pgocount12, 1
  store i64 %147, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 13)
  %148 = load i8**, i8*** %6, align 8
  %149 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %150 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %149, i32 0, i32 4
  %151 = load i32, i32* %150, align 8
  %152 = sext i32 %151 to i64
  %153 = call i64 @id3_render_int(i8** %148, i64 %152, i32 1)
  %154 = load i64, i64* %8, align 8
  %155 = add i64 %154, %153
  store i64 %155, i64* %8, align 8
  br label %156

; <label>:156:                                    ; preds = %146, %142
  %157 = load i32, i32* %14, align 4
  %158 = and i32 %157, 4
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %160, label %170

; <label>:160:                                    ; preds = %156
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 14)
  %161 = add i64 %pgocount13, 1
  store i64 %161, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 14)
  %162 = load i8**, i8*** %6, align 8
  %163 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %164 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %163, i32 0, i32 5
  %165 = load i32, i32* %164, align 4
  %166 = sext i32 %165 to i64
  %167 = call i64 @id3_render_int(i8** %162, i64 %166, i32 1)
  %168 = load i64, i64* %8, align 8
  %169 = add i64 %168, %167
  store i64 %169, i64* %8, align 8
  br label %170

; <label>:170:                                    ; preds = %160, %156
  %171 = load i32, i32* %14, align 4
  %172 = and i32 %171, 1
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %190

; <label>:174:                                    ; preds = %170
  %175 = load i32, i32* %14, align 4
  %176 = and i32 %175, 4
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %183

; <label>:178:                                    ; preds = %174
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 20)
  %179 = add i64 %pgocount14, 1
  store i64 %179, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 20)
  %180 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %181 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %180, i32 0, i32 8
  %182 = load i64, i64* %181, align 8
  store i64 %182, i64* %9, align 8
  br label %183

; <label>:183:                                    ; preds = %178, %174
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 15)
  %184 = add i64 %pgocount15, 1
  store i64 %184, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 15)
  %185 = load i8**, i8*** %6, align 8
  %186 = load i64, i64* %9, align 8
  %187 = call i64 @id3_render_syncsafe(i8** %185, i64 %186, i32 4)
  %188 = load i64, i64* %8, align 8
  %189 = add i64 %188, %187
  store i64 %189, i64* %8, align 8
  br label %190

; <label>:190:                                    ; preds = %183, %170
  %191 = load i8**, i8*** %6, align 8
  %192 = icmp ne i8** %191, null
  br i1 %192, label %193, label %197

; <label>:193:                                    ; preds = %190
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 8)
  %194 = add i64 %pgocount16, 1
  store i64 %194, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 8)
  %195 = load i8**, i8*** %6, align 8
  %196 = load i8*, i8** %195, align 8
  store i8* %196, i8** %13, align 8
  br label %197

; <label>:197:                                    ; preds = %193, %190
  %198 = load i32, i32* %14, align 4
  %199 = and i32 %198, 4
  %200 = icmp ne i32 %199, 0
  br i1 %200, label %201, label %211

; <label>:201:                                    ; preds = %197
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 16)
  %202 = add i64 %pgocount17, 1
  store i64 %202, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 16)
  %203 = load i8**, i8*** %6, align 8
  %204 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %205 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %204, i32 0, i32 6
  %206 = load i8*, i8** %205, align 8
  %207 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %208 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %207, i32 0, i32 7
  %209 = load i64, i64* %208, align 8
  %210 = call i64 @id3_render_binary(i8** %203, i8* %206, i64 %209)
  store i64 %210, i64* %10, align 8
  br label %252

; <label>:211:                                    ; preds = %197
  %212 = load i8**, i8*** %6, align 8
  %213 = icmp eq i8** %212, null
  br i1 %213, label %214, label %217

; <label>:214:                                    ; preds = %211
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 21)
  %215 = add i64 %pgocount18, 1
  store i64 %215, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 21)
  %216 = load i64, i64* %9, align 8
  store i64 %216, i64* %10, align 8
  br label %251

; <label>:217:                                    ; preds = %211
  %218 = load i8**, i8*** %6, align 8
  %219 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %220 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %219, i32 0, i32 10
  %221 = load %union.id3_field*, %union.id3_field** %220, align 8
  %222 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %223 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %222, i32 0, i32 9
  %224 = load i32, i32* %223, align 8
  %225 = call i64 @render_data(i8** %218, %union.id3_field* %221, i32 %224)
  store i64 %225, i64* %10, align 8
  %226 = load i32, i32* %14, align 4
  %227 = and i32 %226, 8
  %228 = icmp ne i32 %227, 0
  br i1 %228, label %229, label %249

; <label>:229:                                    ; preds = %217
  %230 = load i8*, i8** %13, align 8
  %231 = load i64, i64* %10, align 8
  %232 = call i8* @id3_util_compress(i8* %230, i64 %231, i64* %16)
  store i8* %232, i8** %15, align 8
  %233 = load i8*, i8** %15, align 8
  %234 = icmp eq i8* %233, null
  br i1 %234, label %235, label %239

; <label>:235:                                    ; preds = %229
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 26)
  %236 = add i64 %pgocount19, 1
  store i64 %236, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 26)
  %237 = load i32, i32* %14, align 4
  %238 = and i32 %237, -9
  store i32 %238, i32* %14, align 4
  br label %248

; <label>:239:                                    ; preds = %229
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 25)
  %240 = add i64 %pgocount20, 1
  store i64 %240, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 25)
  %241 = load i8*, i8** %13, align 8
  %242 = load i8**, i8*** %6, align 8
  store i8* %241, i8** %242, align 8
  %243 = load i8**, i8*** %6, align 8
  %244 = load i8*, i8** %15, align 8
  %245 = load i64, i64* %16, align 8
  %246 = call i64 @id3_render_binary(i8** %243, i8* %244, i64 %245)
  store i64 %246, i64* %10, align 8
  %247 = load i8*, i8** %15, align 8
  call void @free(i8* %247) #5
  br label %248

; <label>:248:                                    ; preds = %239, %235
  br label %249

; <label>:249:                                    ; preds = %248, %217
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 18)
  %250 = add i64 %pgocount21, 1
  store i64 %250, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 18)
  br label %251

; <label>:251:                                    ; preds = %249, %214
  br label %252

; <label>:252:                                    ; preds = %251, %201
  %253 = load i32, i32* %14, align 4
  %254 = and i32 %253, 2
  %255 = icmp ne i32 %254, 0
  br i1 %255, label %256, label %285

; <label>:256:                                    ; preds = %252
  %257 = load i8*, i8** %13, align 8
  %258 = icmp eq i8* %257, null
  br i1 %258, label %259, label %263

; <label>:259:                                    ; preds = %256
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 22)
  %260 = add i64 %pgocount22, 1
  store i64 %260, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 22)
  %261 = load i64, i64* %10, align 8
  %262 = mul i64 %261, 2
  store i64 %262, i64* %10, align 8
  br label %284

; <label>:263:                                    ; preds = %256
  %264 = load i8*, i8** %13, align 8
  %265 = load i64, i64* %10, align 8
  %266 = call i64 @id3_util_unsynchronise(i8* %264, i64 %265)
  store i64 %266, i64* %17, align 8
  %267 = load i64, i64* %17, align 8
  %268 = load i64, i64* %10, align 8
  %269 = icmp eq i64 %267, %268
  br i1 %269, label %270, label %274

; <label>:270:                                    ; preds = %263
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 23)
  %271 = add i64 %pgocount23, 1
  store i64 %271, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 23)
  %272 = load i32, i32* %14, align 4
  %273 = and i32 %272, -3
  store i32 %273, i32* %14, align 4
  br label %283

; <label>:274:                                    ; preds = %263
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 24)
  %275 = add i64 %pgocount24, 1
  store i64 %275, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 24)
  %276 = load i64, i64* %17, align 8
  %277 = load i64, i64* %10, align 8
  %278 = sub i64 %276, %277
  %279 = load i8**, i8*** %6, align 8
  %280 = load i8*, i8** %279, align 8
  %281 = getelementptr inbounds i8, i8* %280, i64 %278
  store i8* %281, i8** %279, align 8
  %282 = load i64, i64* %17, align 8
  store i64 %282, i64* %10, align 8
  br label %283

; <label>:283:                                    ; preds = %274, %270
  br label %284

; <label>:284:                                    ; preds = %283, %259
  br label %285

; <label>:285:                                    ; preds = %284, %252
  %286 = load i64, i64* %10, align 8
  %287 = load i64, i64* %8, align 8
  %288 = add i64 %287, %286
  store i64 %288, i64* %8, align 8
  %289 = load i8*, i8** %11, align 8
  %290 = icmp ne i8* %289, null
  br i1 %290, label %291, label %296

; <label>:291:                                    ; preds = %285
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 9)
  %292 = add i64 %pgocount25, 1
  store i64 %292, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 9)
  %293 = load i64, i64* %8, align 8
  %294 = sub i64 %293, 10
  %295 = call i64 @id3_render_syncsafe(i8** %11, i64 %294, i32 4)
  br label %296

; <label>:296:                                    ; preds = %291, %285
  %297 = load i8*, i8** %12, align 8
  %298 = icmp ne i8* %297, null
  br i1 %298, label %299, label %304

; <label>:299:                                    ; preds = %296
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 10)
  %300 = add i64 %pgocount26, 1
  store i64 %300, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_frame_render, i64 0, i64 10)
  %301 = load i32, i32* %14, align 4
  %302 = sext i32 %301 to i64
  %303 = call i64 @id3_render_int(i8** %12, i64 %302, i32 2)
  br label %304

; <label>:304:                                    ; preds = %299, %296
  %305 = load i64, i64* %8, align 8
  store i64 %305, i64* %4, align 8
  br label %306

; <label>:306:                                    ; preds = %304, %111, %53, %35
  %307 = load i64, i64* %4, align 8
  ret i64 %307
}

; Function Attrs: noinline nounwind uwtable
define internal i64 @render_data(i8**, %union.id3_field*, i32) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca %union.id3_field*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8** %0, i8*** %4, align 8
  store %union.id3_field* %1, %union.id3_field** %5, align 8
  store i32 %2, i32* %6, align 4
  store i64 0, i64* %7, align 8
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  br label %10

; <label>:10:                                     ; preds = %28, %3
  %11 = load i32, i32* %9, align 4
  %12 = load i32, i32* %6, align 4
  %13 = icmp ult i32 %11, %12
  br i1 %13, label %14, label %32

; <label>:14:                                     ; preds = %10
  %15 = load %union.id3_field*, %union.id3_field** %5, align 8
  %16 = load i32, i32* %9, align 4
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds %union.id3_field, %union.id3_field* %15, i64 %17
  %19 = load i8**, i8*** %4, align 8
  %20 = load i32, i32* %9, align 4
  %21 = load i32, i32* %6, align 4
  %22 = sub i32 %21, 1
  %23 = icmp ult i32 %20, %22
  %24 = zext i1 %23 to i32
  %25 = call i64 @id3_field_render(%union.id3_field* %18, i8** %19, i32* %8, i32 %24)
  %26 = load i64, i64* %7, align 8
  %27 = add i64 %26, %25
  store i64 %27, i64* %7, align 8
  br label %28

; <label>:28:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_render_data, i64 0, i64 0)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_render_data, i64 0, i64 0)
  %30 = load i32, i32* %9, align 4
  %31 = add i32 %30, 1
  store i32 %31, i32* %9, align 4
  br label %10

; <label>:32:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_render_data, i64 0, i64 1)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_render_data, i64 0, i64 1)
  %34 = load i64, i64* %7, align 8
  ret i64 %34
}

declare i64 @id3_render_immediate(i8**, i8*, i32) #1

declare i64 @id3_render_syncsafe(i8**, i64, i32) #1

declare i64 @id3_render_int(i8**, i64, i32) #1

declare i64 @id3_render_binary(i8**, i8*, i64) #1

declare i8* @id3_util_compress(i8*, i64, i64*) #1

declare i64 @id3_util_unsynchronise(i8*, i64) #1

declare i32 @id3_field_setframeid(%union.id3_field*, i8*) #1

declare i32 @id3_field_setbinarydata(%union.id3_field*, i8*, i64) #1

declare i32 @id3_field_parse(%union.id3_field*, i8**, i64, i32*) #1

declare i64 @id3_field_render(%union.id3_field*, i8**, i32*, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #5

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
