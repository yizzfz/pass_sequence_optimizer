; ModuleID = 'tmp1.ll'
source_filename = "file.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.id3_file = type { %struct._IO_FILE*, i32, i32, i32, %struct.id3_tag*, i32, %struct.filetag* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.id3_tag = type { i32, i32, i32, i32, i32, i32, i32, %struct.id3_frame**, i64 }
%struct.id3_frame = type { [5 x i8], i8*, i32, i32, i32, i32, i8*, i64, i64, i32, %union.id3_field* }
%union.id3_field = type { %struct.anon.5 }
%struct.anon.5 = type { i32, i8*, i64 }
%struct.filetag = type { %struct.id3_tag*, i64, i64 }
%struct._G_fpos_t = type { i64, %struct.__mbstate_t }
%struct.__mbstate_t = type { i32, %union.anon }
%union.anon = type { i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [4 x i8] c"r+b\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"size == sizeof(id3v1_data)\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"file.c\00", align 1
@__PRETTY_FUNCTION__.id3_file_update = private unnamed_addr constant [39 x i8] c"int id3_file_update(struct id3_file *)\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"SEEK\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_file_open = private constant [13 x i8] c"id3_file_open"
@__profn_tmp1.ll_new_file = private constant [16 x i8] c"tmp1.ll:new_file"
@__profn_id3_file_fdopen = private constant [15 x i8] c"id3_file_fdopen"
@__profn_id3_file_close = private constant [14 x i8] c"id3_file_close"
@__profn_tmp1.ll_finish_file = private constant [19 x i8] c"tmp1.ll:finish_file"
@__profn_id3_file_tag = private constant [12 x i8] c"id3_file_tag"
@__profn_id3_file_update = private constant [15 x i8] c"id3_file_update"
@__profn_tmp1.ll_search_tags = private constant [19 x i8] c"tmp1.ll:search_tags"
@__profn_tmp1.ll_query_tag = private constant [17 x i8] c"tmp1.ll:query_tag"
@__profn_tmp1.ll_add_tag = private constant [15 x i8] c"tmp1.ll:add_tag"
@__profn_tmp1.ll_read_tag = private constant [16 x i8] c"tmp1.ll:read_tag"
@__profn_tmp1.ll_update_primary = private constant [22 x i8] c"tmp1.ll:update_primary"
@__profc_id3_file_open = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_file_open = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6913835295441891566, i64 72057635754399355, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_open, i32 0, i32 0), i8* bitcast (%struct.id3_file* (i8*, i32)* @id3_file_open to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_new_file = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_new_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1525533851936917743, i64 78796775247, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_file_fdopen = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_file_fdopen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6720590843544470899, i64 72057635754399355, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_fdopen, i32 0, i32 0), i8* bitcast (%struct.id3_file* (i32, i32)* @id3_file_fdopen to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_file_close = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_file_close = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8920911173346156528, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_file_close, i32 0, i32 0), i8* bitcast (void (%struct.id3_file*)* @id3_file_close to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_file = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6388506678522860475, i64 59881859849, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_finish_file, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_file_tag = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_file_tag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4954561187997456063, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_file_tag, i32 0, i32 0), i8* bitcast (%struct.id3_tag* (%struct.id3_file*)* @id3_file_tag to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_file_update = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_file_update = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5625629934198416010, i64 162888619904, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i32 0, i32 0), i8* bitcast (i32 (%struct.id3_file*)* @id3_file_update to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_search_tags = private global [20 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_search_tags = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7880527474872830031, i64 72057841918134028, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i32 0, i32 0), i8* null, i8* null, i32 20, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_query_tag = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_query_tag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1012270608595633808, i64 42754363654, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_query_tag, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_add_tag = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_add_tag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9043297855430394291, i64 129361649726, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_tag = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_read_tag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3702478380838256654, i64 35373395463, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_tag, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_update_primary = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_update_primary = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6818407490758690822, i64 61520343272, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_update_primary, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [106 x i8] c"\CC\01gx\DA]\8C\D1\0A\80 \0CE\F1\87\82\E8\AD\9F\91\D1f\0D\D4l*\D1\DFG\86\86=\DE\B3s\C68i\C3\96\F4\1E\C8\AB\E4\C28X;{:\0BU\5C\CF\06\8B\D0\F6b\F7H\CD7\EC9n\BF$\C1\FA\8D\1C\10\D2\17D\02Y\B6G\89\8D\1D\99\E4*U%\80\D8m!\E8\C1\FBU\07a\07r\DD\9A*J2", section "__llvm_prf_names"
@llvm.used = appending global [13 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_file_open to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_new_file to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_file_fdopen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_file_close to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_file to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_file_tag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_file_update to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_search_tags to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_query_tag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_add_tag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_tag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_update_primary to i8*), i8* getelementptr inbounds ([106 x i8], [106 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define %struct.id3_file* @id3_file_open(i8*, i32) #0 {
  %3 = alloca %struct.id3_file*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct.id3_file*, align 8
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %8 = load i8*, i8** %4, align 8
  %9 = load i32, i32* %5, align 4
  %10 = icmp eq i32 %9, 1
  %11 = zext i1 %10 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_open, i64 0, i64 3)
  %12 = add i64 %pgocount, %11
  store i64 %12, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_open, i64 0, i64 3)
  %13 = select i1 %10, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0)
  %14 = call %struct._IO_FILE* @fopen(i8* %8, i8* %13)
  store %struct._IO_FILE* %14, %struct._IO_FILE** %6, align 8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %16 = icmp eq %struct._IO_FILE* %15, null
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_open, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_open, i64 0, i64 1)
  store %struct.id3_file* null, %struct.id3_file** %3, align 8
  br label %32

; <label>:19:                                     ; preds = %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %21 = load i32, i32* %5, align 4
  %22 = call %struct.id3_file* @new_file(%struct._IO_FILE* %20, i32 %21)
  store %struct.id3_file* %22, %struct.id3_file** %7, align 8
  %23 = load %struct.id3_file*, %struct.id3_file** %7, align 8
  %24 = icmp eq %struct.id3_file* %23, null
  br i1 %24, label %25, label %29

; <label>:25:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_open, i64 0, i64 2)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_open, i64 0, i64 2)
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %28 = call i32 @fclose(%struct._IO_FILE* %27)
  br label %29

; <label>:29:                                     ; preds = %25, %19
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_open, i64 0, i64 0)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_open, i64 0, i64 0)
  %31 = load %struct.id3_file*, %struct.id3_file** %7, align 8
  store %struct.id3_file* %31, %struct.id3_file** %3, align 8
  br label %32

; <label>:32:                                     ; preds = %29, %17
  %33 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  ret %struct.id3_file* %33
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define internal %struct.id3_file* @new_file(%struct._IO_FILE*, i32) #0 {
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.id3_file*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = call noalias i8* @malloc(i64 48) #5
  %7 = bitcast i8* %6 to %struct.id3_file*
  store %struct.id3_file* %7, %struct.id3_file** %5, align 8
  %8 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %9 = icmp eq %struct.id3_file* %8, null
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 1)
  br label %49

; <label>:12:                                     ; preds = %2
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %14 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %15 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %14, i32 0, i32 0
  store %struct._IO_FILE* %13, %struct._IO_FILE** %15, align 8
  %16 = load i32, i32* %4, align 4
  %17 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %18 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %17, i32 0, i32 1
  store i32 %16, i32* %18, align 8
  %19 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %20 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %19, i32 0, i32 2
  store i32 0, i32* %20, align 4
  %21 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %22 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %21, i32 0, i32 3
  store i32 0, i32* %22, align 8
  %23 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %24 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %23, i32 0, i32 5
  store i32 0, i32* %24, align 8
  %25 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %26 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %25, i32 0, i32 6
  store %struct.filetag* null, %struct.filetag** %26, align 8
  %27 = call %struct.id3_tag* @id3_tag_new()
  %28 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %29 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %28, i32 0, i32 4
  store %struct.id3_tag* %27, %struct.id3_tag** %29, align 8
  %30 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %31 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %30, i32 0, i32 4
  %32 = load %struct.id3_tag*, %struct.id3_tag** %31, align 8
  %33 = icmp eq %struct.id3_tag* %32, null
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 2)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 2)
  br label %49

; <label>:36:                                     ; preds = %12
  %37 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %38 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %37, i32 0, i32 4
  %39 = load %struct.id3_tag*, %struct.id3_tag** %38, align 8
  call void @id3_tag_addref(%struct.id3_tag* %39)
  %40 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %41 = call i32 @search_tags(%struct.id3_file* %40)
  %42 = icmp eq i32 %41, -1
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 4)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 4)
  br label %49

; <label>:45:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 3)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 3)
  br i1 false, label %47, label %56

; <label>:47:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 5)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 5)
  br label %49

; <label>:49:                                     ; preds = %47, %43, %34, %10
  %50 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  %51 = icmp ne %struct.id3_file* %50, null
  br i1 %51, label %52, label %55

; <label>:52:                                     ; preds = %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 0)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_new_file, i64 0, i64 0)
  %54 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  call void @finish_file(%struct.id3_file* %54)
  store %struct.id3_file* null, %struct.id3_file** %5, align 8
  br label %55

; <label>:55:                                     ; preds = %52, %49
  br label %56

; <label>:56:                                     ; preds = %55, %45
  %57 = load %struct.id3_file*, %struct.id3_file** %5, align 8
  ret %struct.id3_file* %57
}

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define %struct.id3_file* @id3_file_fdopen(i32, i32) #0 {
  %3 = alloca %struct.id3_file*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct.id3_file*, align 8
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  %9 = load i32, i32* %4, align 4
  %10 = load i32, i32* %5, align 4
  %11 = icmp eq i32 %10, 1
  %12 = zext i1 %11 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_fdopen, i64 0, i64 3)
  %13 = add i64 %pgocount, %12
  store i64 %13, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_fdopen, i64 0, i64 3)
  %14 = select i1 %11, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0)
  %15 = call %struct._IO_FILE* @fdopen(i32 %9, i8* %14) #5
  store %struct._IO_FILE* %15, %struct._IO_FILE** %6, align 8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %17 = icmp eq %struct._IO_FILE* %16, null
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_fdopen, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_fdopen, i64 0, i64 1)
  store %struct.id3_file* null, %struct.id3_file** %3, align 8
  br label %40

; <label>:20:                                     ; preds = %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %22 = load i32, i32* %5, align 4
  %23 = call %struct.id3_file* @new_file(%struct._IO_FILE* %21, i32 %22)
  store %struct.id3_file* %23, %struct.id3_file** %7, align 8
  %24 = load %struct.id3_file*, %struct.id3_file** %7, align 8
  %25 = icmp eq %struct.id3_file* %24, null
  br i1 %25, label %26, label %37

; <label>:26:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_fdopen, i64 0, i64 2)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_fdopen, i64 0, i64 2)
  %28 = load i32, i32* %4, align 4
  %29 = call i32 @dup(i32 %28) #5
  store i32 %29, i32* %8, align 4
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load i32, i32* %8, align 4
  %33 = load i32, i32* %4, align 4
  %34 = call i32 @dup2(i32 %32, i32 %33) #5
  %35 = load i32, i32* %8, align 4
  %36 = call i32 @close(i32 %35)
  br label %37

; <label>:37:                                     ; preds = %26, %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_fdopen, i64 0, i64 0)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_file_fdopen, i64 0, i64 0)
  %39 = load %struct.id3_file*, %struct.id3_file** %7, align 8
  store %struct.id3_file* %39, %struct.id3_file** %3, align 8
  br label %40

; <label>:40:                                     ; preds = %37, %18
  %41 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  ret %struct.id3_file* %41
}

; Function Attrs: nounwind
declare %struct._IO_FILE* @fdopen(i32, i8*) #2

; Function Attrs: nounwind
declare i32 @dup(i32) #2

; Function Attrs: nounwind
declare i32 @dup2(i32, i32) #2

declare i32 @close(i32) #1

; Function Attrs: nounwind uwtable
define void @id3_file_close(%struct.id3_file*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_file_close, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_file_close, i64 0, i64 0)
  %3 = alloca %struct.id3_file*, align 8
  store %struct.id3_file* %0, %struct.id3_file** %3, align 8
  %4 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %5 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %4, i32 0, i32 0
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %7 = call i32 @fclose(%struct._IO_FILE* %6)
  %8 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  call void @finish_file(%struct.id3_file* %8)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @finish_file(%struct.id3_file*) #0 {
  %2 = alloca %struct.id3_file*, align 8
  %3 = alloca i32, align 4
  store %struct.id3_file* %0, %struct.id3_file** %2, align 8
  %4 = load %struct.id3_file*, %struct.id3_file** %2, align 8
  %5 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %4, i32 0, i32 4
  %6 = load %struct.id3_tag*, %struct.id3_tag** %5, align 8
  %7 = icmp ne %struct.id3_tag* %6, null
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_finish_file, i64 0, i64 2)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_finish_file, i64 0, i64 2)
  %10 = load %struct.id3_file*, %struct.id3_file** %2, align 8
  %11 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %10, i32 0, i32 4
  %12 = load %struct.id3_tag*, %struct.id3_tag** %11, align 8
  call void @id3_tag_delref(%struct.id3_tag* %12)
  %13 = load %struct.id3_file*, %struct.id3_file** %2, align 8
  %14 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %13, i32 0, i32 4
  %15 = load %struct.id3_tag*, %struct.id3_tag** %14, align 8
  call void @id3_tag_delete(%struct.id3_tag* %15)
  br label %16

; <label>:16:                                     ; preds = %8, %1
  store i32 0, i32* %3, align 4
  br label %17

; <label>:17:                                     ; preds = %40, %16
  %18 = load i32, i32* %3, align 4
  %19 = load %struct.id3_file*, %struct.id3_file** %2, align 8
  %20 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %19, i32 0, i32 5
  %21 = load i32, i32* %20, align 8
  %22 = icmp ult i32 %18, %21
  br i1 %22, label %23, label %44

; <label>:23:                                     ; preds = %17
  %24 = load %struct.id3_file*, %struct.id3_file** %2, align 8
  %25 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %24, i32 0, i32 6
  %26 = load %struct.filetag*, %struct.filetag** %25, align 8
  %27 = load i32, i32* %3, align 4
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds %struct.filetag, %struct.filetag* %26, i64 %28
  %30 = getelementptr inbounds %struct.filetag, %struct.filetag* %29, i32 0, i32 0
  %31 = load %struct.id3_tag*, %struct.id3_tag** %30, align 8
  call void @id3_tag_delref(%struct.id3_tag* %31)
  %32 = load %struct.id3_file*, %struct.id3_file** %2, align 8
  %33 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %32, i32 0, i32 6
  %34 = load %struct.filetag*, %struct.filetag** %33, align 8
  %35 = load i32, i32* %3, align 4
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds %struct.filetag, %struct.filetag* %34, i64 %36
  %38 = getelementptr inbounds %struct.filetag, %struct.filetag* %37, i32 0, i32 0
  %39 = load %struct.id3_tag*, %struct.id3_tag** %38, align 8
  call void @id3_tag_delete(%struct.id3_tag* %39)
  br label %40

; <label>:40:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_finish_file, i64 0, i64 0)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_finish_file, i64 0, i64 0)
  %42 = load i32, i32* %3, align 4
  %43 = add i32 %42, 1
  store i32 %43, i32* %3, align 4
  br label %17

; <label>:44:                                     ; preds = %17
  %45 = load %struct.id3_file*, %struct.id3_file** %2, align 8
  %46 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %45, i32 0, i32 6
  %47 = load %struct.filetag*, %struct.filetag** %46, align 8
  %48 = icmp ne %struct.filetag* %47, null
  br i1 %48, label %49, label %55

; <label>:49:                                     ; preds = %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_finish_file, i64 0, i64 3)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_finish_file, i64 0, i64 3)
  %51 = load %struct.id3_file*, %struct.id3_file** %2, align 8
  %52 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %51, i32 0, i32 6
  %53 = load %struct.filetag*, %struct.filetag** %52, align 8
  %54 = bitcast %struct.filetag* %53 to i8*
  call void @free(i8* %54) #5
  br label %55

; <label>:55:                                     ; preds = %49, %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_finish_file, i64 0, i64 1)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_finish_file, i64 0, i64 1)
  %57 = load %struct.id3_file*, %struct.id3_file** %2, align 8
  %58 = bitcast %struct.id3_file* %57 to i8*
  call void @free(i8* %58) #5
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.id3_tag* @id3_file_tag(%struct.id3_file*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_file_tag, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_file_tag, i64 0, i64 0)
  %3 = alloca %struct.id3_file*, align 8
  store %struct.id3_file* %0, %struct.id3_file** %3, align 8
  %4 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %5 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %4, i32 0, i32 4
  %6 = load %struct.id3_tag*, %struct.id3_tag** %5, align 8
  ret %struct.id3_tag* %6
}

; Function Attrs: nounwind uwtable
define i32 @id3_file_update(%struct.id3_file*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.id3_file*, align 8
  %4 = alloca i64, align 8
  %5 = alloca [128 x i8], align 16
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  store %struct.id3_file* %0, %struct.id3_file** %3, align 8
  store i8* null, i8** %6, align 8
  store i8* null, i8** %7, align 8
  %8 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %9 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %8, i32 0, i32 1
  %10 = load i32, i32* %9, align 8
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 0)
  store i32 -1, i32* %2, align 4
  br label %103

; <label>:14:                                     ; preds = %1
  %15 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %16 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %15, i32 0, i32 3
  %17 = load i32, i32* %16, align 8
  %18 = and i32 %17, 1
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %21, label %._crit_edge

._crit_edge:                                      ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 8)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 8)
  br label %63

; <label>:21:                                     ; preds = %14
  %22 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %23 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %22, i32 0, i32 4
  %24 = load %struct.id3_tag*, %struct.id3_tag** %23, align 8
  %25 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %24, i32 0, i32 5
  %26 = load i32, i32* %25, align 4
  %27 = or i32 %26, 256
  store i32 %27, i32* %25, align 4
  %28 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %29 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %28, i32 0, i32 4
  %30 = load %struct.id3_tag*, %struct.id3_tag** %29, align 8
  %31 = call i64 @id3_tag_render(%struct.id3_tag* %30, i8* null)
  store i64 %31, i64* %4, align 8
  %32 = load i64, i64* %4, align 8
  %33 = icmp ne i64 %32, 0
  br i1 %33, label %34, label %61

; <label>:34:                                     ; preds = %21
  %35 = load i64, i64* %4, align 8
  %36 = icmp eq i64 %35, 128
  br i1 %36, label %37, label %38

; <label>:37:                                     ; preds = %34
  br label %41

; <label>:38:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 9)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 9)
  call void @__assert_fail(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i32 429, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__PRETTY_FUNCTION__.id3_file_update, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %41

; <label>:41:                                     ; preds = %40, %37
  %42 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %43 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %42, i32 0, i32 4
  %44 = load %struct.id3_tag*, %struct.id3_tag** %43, align 8
  %45 = getelementptr inbounds [128 x i8], [128 x i8]* %5, i32 0, i32 0
  %46 = call i64 @id3_tag_render(%struct.id3_tag* %44, i8* %45)
  store i64 %46, i64* %4, align 8
  %47 = load i64, i64* %4, align 8
  %48 = icmp ne i64 %47, 0
  br i1 %48, label %49, label %59

; <label>:49:                                     ; preds = %41
  %50 = load i64, i64* %4, align 8
  %51 = icmp eq i64 %50, 128
  br i1 %51, label %52, label %53

; <label>:52:                                     ; preds = %49
  br label %56

; <label>:53:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 10)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 10)
  call void @__assert_fail(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i32 433, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__PRETTY_FUNCTION__.id3_file_update, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %56

; <label>:56:                                     ; preds = %55, %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 6)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 6)
  %58 = getelementptr inbounds [128 x i8], [128 x i8]* %5, i32 0, i32 0
  store i8* %58, i8** %6, align 8
  br label %59

; <label>:59:                                     ; preds = %56, %41
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 4)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 4)
  br label %61

; <label>:61:                                     ; preds = %59, %21
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 1)
  %62 = add i64 %pgocount6, 1
  store i64 %62, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 1)
  br label %63

; <label>:63:                                     ; preds = %._crit_edge, %61
  %64 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %65 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %64, i32 0, i32 4
  %66 = load %struct.id3_tag*, %struct.id3_tag** %65, align 8
  %67 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %66, i32 0, i32 5
  %68 = load i32, i32* %67, align 4
  %69 = and i32 %68, -257
  store i32 %69, i32* %67, align 4
  %70 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %71 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %70, i32 0, i32 4
  %72 = load %struct.id3_tag*, %struct.id3_tag** %71, align 8
  %73 = call i64 @id3_tag_render(%struct.id3_tag* %72, i8* null)
  store i64 %73, i64* %4, align 8
  %74 = load i64, i64* %4, align 8
  %75 = icmp ne i64 %74, 0
  br i1 %75, label %76, label %96

; <label>:76:                                     ; preds = %63
  %77 = load i64, i64* %4, align 8
  %78 = call noalias i8* @malloc(i64 %77) #5
  store i8* %78, i8** %7, align 8
  %79 = load i8*, i8** %7, align 8
  %80 = icmp eq i8* %79, null
  br i1 %80, label %81, label %83

; <label>:81:                                     ; preds = %76
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 5)
  %82 = add i64 %pgocount7, 1
  store i64 %82, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 5)
  store i32 -1, i32* %2, align 4
  br label %103

; <label>:83:                                     ; preds = %76
  %84 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %85 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %84, i32 0, i32 4
  %86 = load %struct.id3_tag*, %struct.id3_tag** %85, align 8
  %87 = load i8*, i8** %7, align 8
  %88 = call i64 @id3_tag_render(%struct.id3_tag* %86, i8* %87)
  store i64 %88, i64* %4, align 8
  %89 = load i64, i64* %4, align 8
  %90 = icmp eq i64 %89, 0
  br i1 %90, label %91, label %94

; <label>:91:                                     ; preds = %83
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 7)
  %92 = add i64 %pgocount8, 1
  store i64 %92, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 7)
  %93 = load i8*, i8** %7, align 8
  call void @free(i8* %93) #5
  store i8* null, i8** %7, align 8
  br label %94

; <label>:94:                                     ; preds = %91, %83
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 3)
  %95 = add i64 %pgocount9, 1
  store i64 %95, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 3)
  br label %96

; <label>:96:                                     ; preds = %94, %63
  %97 = load i8*, i8** %7, align 8
  %98 = icmp ne i8* %97, null
  br i1 %98, label %99, label %102

; <label>:99:                                     ; preds = %96
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 2)
  %100 = add i64 %pgocount10, 1
  store i64 %100, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_file_update, i64 0, i64 2)
  %101 = load i8*, i8** %7, align 8
  call void @free(i8* %101) #5
  br label %102

; <label>:102:                                    ; preds = %99, %96
  store i32 0, i32* %2, align 4
  br label %103

; <label>:103:                                    ; preds = %102, %81, %12
  %104 = load i32, i32* %2, align 4
  ret i32 %104
}

declare i64 @id3_tag_render(%struct.id3_tag*, i8*) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

declare %struct.id3_tag* @id3_tag_new() #1

declare void @id3_tag_addref(%struct.id3_tag*) #1

; Function Attrs: nounwind uwtable
define internal i32 @search_tags(%struct.id3_file*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.id3_file*, align 8
  %4 = alloca %struct._G_fpos_t, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.id3_frame*, align 8
  %8 = alloca i64, align 8
  store %struct.id3_file* %0, %struct.id3_file** %3, align 8
  store i32 0, i32* %6, align 4
  %9 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %10 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %9, i32 0, i32 0
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %12 = call i32 @fgetpos(%struct._IO_FILE* %11, %struct._G_fpos_t* %4)
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 3)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 3)
  store i32 -1, i32* %2, align 4
  br label %187

; <label>:16:                                     ; preds = %1
  %17 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %18 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %17, i32 0, i32 0
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %20 = call i32 @fseek(%struct._IO_FILE* %19, i64 -128, i32 2)
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %48

; <label>:22:                                     ; preds = %16
  %23 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %24 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %23, i32 0, i32 0
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %24, align 8
  %26 = call i64 @query_tag(%struct._IO_FILE* %25)
  store i64 %26, i64* %5, align 8
  %27 = load i64, i64* %5, align 8
  %28 = icmp sgt i64 %27, 0
  br i1 %28, label %29, label %46

; <label>:29:                                     ; preds = %22
  %30 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %31 = load i64, i64* %5, align 8
  %32 = call i32 @add_tag(%struct.id3_file* %30, i64 %31)
  %33 = icmp eq i32 %32, -1
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 12)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 12)
  br label %172

; <label>:36:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 10)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 10)
  %38 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %39 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %38, i32 0, i32 2
  %40 = load i32, i32* %39, align 4
  %41 = or i32 %40, 1
  store i32 %41, i32* %39, align 4
  %42 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %43 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %42, i32 0, i32 3
  %44 = load i32, i32* %43, align 8
  %45 = or i32 %44, 1
  store i32 %45, i32* %43, align 8
  br label %46

; <label>:46:                                     ; preds = %36, %22
  %pgocount3 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 7)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 7)
  br label %48

; <label>:48:                                     ; preds = %46, %16
  %49 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %50 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %49, i32 0, i32 0
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** %50, align 8
  call void @rewind(%struct._IO_FILE* %51)
  %52 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %53 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %52, i32 0, i32 0
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** %53, align 8
  %55 = call i64 @query_tag(%struct._IO_FILE* %54)
  store i64 %55, i64* %5, align 8
  %56 = load i64, i64* %5, align 8
  %57 = icmp sgt i64 %56, 0
  br i1 %57, label %58, label %119

; <label>:58:                                     ; preds = %48
  %59 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %60 = load i64, i64* %5, align 8
  %61 = call i32 @add_tag(%struct.id3_file* %59, i64 %60)
  %62 = icmp eq i32 %61, -1
  br i1 %62, label %63, label %65

; <label>:63:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 9)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 9)
  br label %172

; <label>:65:                                     ; preds = %58
  br label %66

; <label>:66:                                     ; preds = %115, %65
  %67 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %68 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %67, i32 0, i32 6
  %69 = load %struct.filetag*, %struct.filetag** %68, align 8
  %70 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %71 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %70, i32 0, i32 5
  %72 = load i32, i32* %71, align 8
  %73 = sub i32 %72, 1
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds %struct.filetag, %struct.filetag* %69, i64 %74
  %76 = getelementptr inbounds %struct.filetag, %struct.filetag* %75, i32 0, i32 0
  %77 = load %struct.id3_tag*, %struct.id3_tag** %76, align 8
  %78 = call %struct.id3_frame* @id3_tag_findframe(%struct.id3_tag* %77, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i32 0)
  store %struct.id3_frame* %78, %struct.id3_frame** %7, align 8
  %79 = icmp ne %struct.id3_frame* %78, null
  br i1 %79, label %80, label %117

; <label>:80:                                     ; preds = %66
  %81 = load %struct.id3_frame*, %struct.id3_frame** %7, align 8
  %82 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %81, i32 0, i32 10
  %83 = load %union.id3_field*, %union.id3_field** %82, align 8
  %84 = getelementptr inbounds %union.id3_field, %union.id3_field* %83, i64 0
  %85 = call i64 @id3_field_getint(%union.id3_field* %84)
  store i64 %85, i64* %8, align 8
  %86 = load i64, i64* %8, align 8
  %87 = icmp slt i64 %86, 0
  br i1 %87, label %96, label %88

; <label>:88:                                     ; preds = %80
  %pgocount5 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 0)
  %89 = add i64 %pgocount5, 1
  store i64 %89, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 0)
  %90 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %91 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %90, i32 0, i32 0
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** %91, align 8
  %93 = load i64, i64* %8, align 8
  %94 = call i32 @fseek(%struct._IO_FILE* %92, i64 %93, i32 1)
  %95 = icmp eq i32 %94, -1
  br i1 %95, label %96, label %98

; <label>:96:                                     ; preds = %88, %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 11)
  %97 = add i64 %pgocount6, 1
  store i64 %97, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 11)
  br label %117

; <label>:98:                                     ; preds = %88
  %99 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %100 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %99, i32 0, i32 0
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** %100, align 8
  %102 = call i64 @query_tag(%struct._IO_FILE* %101)
  store i64 %102, i64* %5, align 8
  %103 = load i64, i64* %5, align 8
  %104 = icmp sle i64 %103, 0
  br i1 %104, label %105, label %107

; <label>:105:                                    ; preds = %98
  %pgocount7 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 14)
  %106 = add i64 %pgocount7, 1
  store i64 %106, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 14)
  br label %117

; <label>:107:                                    ; preds = %98
  %108 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %109 = load i64, i64* %5, align 8
  %110 = call i32 @add_tag(%struct.id3_file* %108, i64 %109)
  %111 = icmp eq i32 %110, -1
  br i1 %111, label %112, label %114

; <label>:112:                                    ; preds = %107
  %pgocount8 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 15)
  %113 = add i64 %pgocount8, 1
  store i64 %113, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 15)
  br label %172

; <label>:114:                                    ; preds = %107
  br label %115

; <label>:115:                                    ; preds = %114
  %pgocount9 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 1)
  %116 = add i64 %pgocount9, 1
  store i64 %116, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 1)
  br label %66

; <label>:117:                                    ; preds = %105, %96, %66
  %pgocount10 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 6)
  %118 = add i64 %pgocount10, 1
  store i64 %118, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 6)
  br label %119

; <label>:119:                                    ; preds = %117, %48
  %120 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %121 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %120, i32 0, i32 0
  %122 = load %struct._IO_FILE*, %struct._IO_FILE** %121, align 8
  %123 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %124 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %123, i32 0, i32 2
  %125 = load i32, i32* %124, align 4
  %126 = and i32 %125, 1
  %127 = icmp ne i32 %126, 0
  %128 = zext i1 %127 to i64
  %pgocount11 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 19)
  %129 = add i64 %pgocount11, %128
  store i64 %129, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 19)
  %130 = select i1 %127, i32 -128, i32 0
  %131 = add nsw i32 %130, -10
  %132 = sext i32 %131 to i64
  %133 = call i32 @fseek(%struct._IO_FILE* %122, i64 %132, i32 2)
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %135, label %169

; <label>:135:                                    ; preds = %119
  %136 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %137 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %136, i32 0, i32 0
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** %137, align 8
  %139 = call i64 @query_tag(%struct._IO_FILE* %138)
  store i64 %139, i64* %5, align 8
  %140 = load i64, i64* %5, align 8
  %141 = icmp slt i64 %140, 0
  br i1 %141, label %142, label %167

; <label>:142:                                    ; preds = %135
  %pgocount12 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 13)
  %143 = add i64 %pgocount12, 1
  store i64 %143, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 13)
  %144 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %145 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %144, i32 0, i32 0
  %146 = load %struct._IO_FILE*, %struct._IO_FILE** %145, align 8
  %147 = load i64, i64* %5, align 8
  %148 = call i32 @fseek(%struct._IO_FILE* %146, i64 %147, i32 1)
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %150, label %167

; <label>:150:                                    ; preds = %142
  %151 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %152 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %151, i32 0, i32 0
  %153 = load %struct._IO_FILE*, %struct._IO_FILE** %152, align 8
  %154 = call i64 @query_tag(%struct._IO_FILE* %153)
  store i64 %154, i64* %5, align 8
  %155 = load i64, i64* %5, align 8
  %156 = icmp sgt i64 %155, 0
  br i1 %156, label %157, label %165

; <label>:157:                                    ; preds = %150
  %pgocount13 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 17)
  %158 = add i64 %pgocount13, 1
  store i64 %158, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 17)
  %159 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %160 = load i64, i64* %5, align 8
  %161 = call i32 @add_tag(%struct.id3_file* %159, i64 %160)
  %162 = icmp eq i32 %161, -1
  br i1 %162, label %163, label %165

; <label>:163:                                    ; preds = %157
  %pgocount14 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 18)
  %164 = add i64 %pgocount14, 1
  store i64 %164, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 18)
  br label %172

; <label>:165:                                    ; preds = %157, %150
  %pgocount15 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 16)
  %166 = add i64 %pgocount15, 1
  store i64 %166, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 16)
  br label %167

; <label>:167:                                    ; preds = %165, %142, %135
  %pgocount16 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 8)
  %168 = add i64 %pgocount16, 1
  store i64 %168, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 8)
  br label %169

; <label>:169:                                    ; preds = %167, %119
  br i1 false, label %170, label %173

; <label>:170:                                    ; preds = %169
  %pgocount17 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 5)
  %171 = add i64 %pgocount17, 1
  store i64 %171, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 5)
  br label %172

; <label>:172:                                    ; preds = %170, %163, %112, %63, %34
  store i32 -1, i32* %6, align 4
  br label %173

; <label>:173:                                    ; preds = %172, %169
  %174 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %175 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %174, i32 0, i32 0
  %176 = load %struct._IO_FILE*, %struct._IO_FILE** %175, align 8
  call void @clearerr(%struct._IO_FILE* %176) #5
  %177 = load %struct.id3_file*, %struct.id3_file** %3, align 8
  %178 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %177, i32 0, i32 0
  %179 = load %struct._IO_FILE*, %struct._IO_FILE** %178, align 8
  %180 = call i32 @fsetpos(%struct._IO_FILE* %179, %struct._G_fpos_t* %4)
  %181 = icmp eq i32 %180, -1
  br i1 %181, label %182, label %184

; <label>:182:                                    ; preds = %173
  %pgocount18 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 4)
  %183 = add i64 %pgocount18, 1
  store i64 %183, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 4)
  store i32 -1, i32* %2, align 4
  br label %187

; <label>:184:                                    ; preds = %173
  %pgocount19 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 2)
  %185 = add i64 %pgocount19, 1
  store i64 %185, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_search_tags, i64 0, i64 2)
  %186 = load i32, i32* %6, align 4
  store i32 %186, i32* %2, align 4
  br label %187

; <label>:187:                                    ; preds = %184, %182, %14
  %188 = load i32, i32* %2, align 4
  ret i32 %188
}

declare i32 @fgetpos(%struct._IO_FILE*, %struct._G_fpos_t*) #1

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #1

; Function Attrs: nounwind uwtable
define internal i64 @query_tag(%struct._IO_FILE*) #0 {
  %2 = alloca i64, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca %struct._G_fpos_t, align 8
  %5 = alloca [10 x i8], align 1
  %6 = alloca i64, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %8 = call i32 @fgetpos(%struct._IO_FILE* %7, %struct._G_fpos_t* %4)
  %9 = icmp eq i32 %8, -1
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_query_tag, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_query_tag, i64 0, i64 1)
  store i64 0, i64* %2, align 8
  br label %26

; <label>:12:                                     ; preds = %1
  %13 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i32 0, i32 0
  %14 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i32 0, i32 0
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %16 = call i64 @fread(i8* %14, i64 1, i64 10, %struct._IO_FILE* %15)
  %17 = call i64 @id3_tag_query(i8* %13, i64 %16)
  store i64 %17, i64* %6, align 8
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %19 = call i32 @fsetpos(%struct._IO_FILE* %18, %struct._G_fpos_t* %4)
  %20 = icmp eq i32 %19, -1
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_query_tag, i64 0, i64 2)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_query_tag, i64 0, i64 2)
  store i64 0, i64* %2, align 8
  br label %26

; <label>:23:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_query_tag, i64 0, i64 0)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_query_tag, i64 0, i64 0)
  %25 = load i64, i64* %6, align 8
  store i64 %25, i64* %2, align 8
  br label %26

; <label>:26:                                     ; preds = %23, %21, %10
  %27 = load i64, i64* %2, align 8
  ret i64 %27
}

; Function Attrs: nounwind uwtable
define internal i32 @add_tag(%struct.id3_file*, i64) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.id3_file*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.filetag, align 8
  %9 = alloca %struct.filetag*, align 8
  %10 = alloca %struct.id3_tag*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store %struct.id3_file* %0, %struct.id3_file** %4, align 8
  store i64 %1, i64* %5, align 8
  %15 = load %struct.id3_file*, %struct.id3_file** %4, align 8
  %16 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %15, i32 0, i32 0
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %18 = call i64 @ftell(%struct._IO_FILE* %17)
  store i64 %18, i64* %6, align 8
  %19 = load i64, i64* %6, align 8
  %20 = icmp eq i64 %19, -1
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 3)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 3)
  store i32 -1, i32* %3, align 4
  br label %139

; <label>:23:                                     ; preds = %2
  %24 = load i64, i64* %6, align 8
  store i64 %24, i64* %11, align 8
  %25 = load i64, i64* %11, align 8
  %26 = load i64, i64* %5, align 8
  %27 = add i64 %25, %26
  store i64 %27, i64* %12, align 8
  store i32 0, i32* %7, align 4
  br label %28

; <label>:28:                                     ; preds = %75, %23
  %29 = load i32, i32* %7, align 4
  %30 = load %struct.id3_file*, %struct.id3_file** %4, align 8
  %31 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %30, i32 0, i32 5
  %32 = load i32, i32* %31, align 8
  %33 = icmp ult i32 %29, %32
  br i1 %33, label %34, label %79

; <label>:34:                                     ; preds = %28
  %35 = load %struct.id3_file*, %struct.id3_file** %4, align 8
  %36 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %35, i32 0, i32 6
  %37 = load %struct.filetag*, %struct.filetag** %36, align 8
  %38 = load i32, i32* %7, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds %struct.filetag, %struct.filetag* %37, i64 %39
  %41 = getelementptr inbounds %struct.filetag, %struct.filetag* %40, i32 0, i32 1
  %42 = load i64, i64* %41, align 8
  store i64 %42, i64* %13, align 8
  %43 = load i64, i64* %13, align 8
  %44 = load %struct.id3_file*, %struct.id3_file** %4, align 8
  %45 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %44, i32 0, i32 6
  %46 = load %struct.filetag*, %struct.filetag** %45, align 8
  %47 = load i32, i32* %7, align 4
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds %struct.filetag, %struct.filetag* %46, i64 %48
  %50 = getelementptr inbounds %struct.filetag, %struct.filetag* %49, i32 0, i32 2
  %51 = load i64, i64* %50, align 8
  %52 = add i64 %43, %51
  store i64 %52, i64* %14, align 8
  %53 = load i64, i64* %11, align 8
  %54 = load i64, i64* %13, align 8
  %55 = icmp eq i64 %53, %54
  br i1 %55, label %56, label %63

; <label>:56:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 1)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 1)
  %58 = load i64, i64* %12, align 8
  %59 = load i64, i64* %14, align 8
  %60 = icmp eq i64 %58, %59
  br i1 %60, label %61, label %63

; <label>:61:                                     ; preds = %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 4)
  %62 = add i64 %pgocount2, 1
  store i64 %62, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 4)
  store i32 0, i32* %3, align 4
  br label %139

; <label>:63:                                     ; preds = %56, %34
  %64 = load i64, i64* %11, align 8
  %65 = load i64, i64* %14, align 8
  %66 = icmp ult i64 %64, %65
  br i1 %66, label %67, label %74

; <label>:67:                                     ; preds = %63
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 2)
  %68 = add i64 %pgocount3, 1
  store i64 %68, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 2)
  %69 = load i64, i64* %12, align 8
  %70 = load i64, i64* %13, align 8
  %71 = icmp ugt i64 %69, %70
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 5)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 5)
  store i32 -1, i32* %3, align 4
  br label %139

; <label>:74:                                     ; preds = %67, %63
  br label %75

; <label>:75:                                     ; preds = %74
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 0)
  %76 = add i64 %pgocount5, 1
  store i64 %76, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 0)
  %77 = load i32, i32* %7, align 4
  %78 = add i32 %77, 1
  store i32 %78, i32* %7, align 4
  br label %28

; <label>:79:                                     ; preds = %28
  %80 = load %struct.id3_file*, %struct.id3_file** %4, align 8
  %81 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %80, i32 0, i32 6
  %82 = load %struct.filetag*, %struct.filetag** %81, align 8
  %83 = bitcast %struct.filetag* %82 to i8*
  %84 = load %struct.id3_file*, %struct.id3_file** %4, align 8
  %85 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %84, i32 0, i32 5
  %86 = load i32, i32* %85, align 8
  %87 = add i32 %86, 1
  %88 = zext i32 %87 to i64
  %89 = mul i64 %88, 24
  %90 = call i8* @realloc(i8* %83, i64 %89) #5
  %91 = bitcast i8* %90 to %struct.filetag*
  store %struct.filetag* %91, %struct.filetag** %9, align 8
  %92 = load %struct.filetag*, %struct.filetag** %9, align 8
  %93 = icmp eq %struct.filetag* %92, null
  br i1 %93, label %94, label %96

; <label>:94:                                     ; preds = %79
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 6)
  %95 = add i64 %pgocount6, 1
  store i64 %95, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 6)
  store i32 -1, i32* %3, align 4
  br label %139

; <label>:96:                                     ; preds = %79
  %97 = load %struct.filetag*, %struct.filetag** %9, align 8
  %98 = load %struct.id3_file*, %struct.id3_file** %4, align 8
  %99 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %98, i32 0, i32 6
  store %struct.filetag* %97, %struct.filetag** %99, align 8
  %100 = load %struct.id3_file*, %struct.id3_file** %4, align 8
  %101 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %100, i32 0, i32 0
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** %101, align 8
  %103 = load i64, i64* %5, align 8
  %104 = call %struct.id3_tag* @read_tag(%struct._IO_FILE* %102, i64 %103)
  store %struct.id3_tag* %104, %struct.id3_tag** %10, align 8
  %105 = load %struct.id3_tag*, %struct.id3_tag** %10, align 8
  %106 = icmp eq %struct.id3_tag* %105, null
  br i1 %106, label %107, label %109

; <label>:107:                                    ; preds = %96
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 8)
  %108 = add i64 %pgocount7, 1
  store i64 %108, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 8)
  store i32 -1, i32* %3, align 4
  br label %139

; <label>:109:                                    ; preds = %96
  %110 = load %struct.id3_file*, %struct.id3_file** %4, align 8
  %111 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %110, i32 0, i32 4
  %112 = load %struct.id3_tag*, %struct.id3_tag** %111, align 8
  %113 = load %struct.id3_tag*, %struct.id3_tag** %10, align 8
  %114 = call i32 @update_primary(%struct.id3_tag* %112, %struct.id3_tag* %113)
  %115 = icmp eq i32 %114, -1
  br i1 %115, label %116, label %119

; <label>:116:                                    ; preds = %109
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 9)
  %117 = add i64 %pgocount8, 1
  store i64 %117, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 9)
  %118 = load %struct.id3_tag*, %struct.id3_tag** %10, align 8
  call void @id3_tag_delete(%struct.id3_tag* %118)
  store i32 -1, i32* %3, align 4
  br label %139

; <label>:119:                                    ; preds = %109
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 7)
  %120 = add i64 %pgocount9, 1
  store i64 %120, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_add_tag, i64 0, i64 7)
  %121 = load %struct.id3_tag*, %struct.id3_tag** %10, align 8
  %122 = getelementptr inbounds %struct.filetag, %struct.filetag* %8, i32 0, i32 0
  store %struct.id3_tag* %121, %struct.id3_tag** %122, align 8
  %123 = load i64, i64* %6, align 8
  %124 = getelementptr inbounds %struct.filetag, %struct.filetag* %8, i32 0, i32 1
  store i64 %123, i64* %124, align 8
  %125 = load i64, i64* %5, align 8
  %126 = getelementptr inbounds %struct.filetag, %struct.filetag* %8, i32 0, i32 2
  store i64 %125, i64* %126, align 8
  %127 = load %struct.id3_file*, %struct.id3_file** %4, align 8
  %128 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %127, i32 0, i32 6
  %129 = load %struct.filetag*, %struct.filetag** %128, align 8
  %130 = load %struct.id3_file*, %struct.id3_file** %4, align 8
  %131 = getelementptr inbounds %struct.id3_file, %struct.id3_file* %130, i32 0, i32 5
  %132 = load i32, i32* %131, align 8
  %133 = add i32 %132, 1
  store i32 %133, i32* %131, align 8
  %134 = zext i32 %132 to i64
  %135 = getelementptr inbounds %struct.filetag, %struct.filetag* %129, i64 %134
  %136 = bitcast %struct.filetag* %135 to i8*
  %137 = bitcast %struct.filetag* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %136, i8* %137, i64 24, i32 8, i1 false)
  %138 = load %struct.id3_tag*, %struct.id3_tag** %10, align 8
  call void @id3_tag_addref(%struct.id3_tag* %138)
  store i32 0, i32* %3, align 4
  br label %139

; <label>:139:                                    ; preds = %119, %116, %107, %94, %72, %61, %21
  %140 = load i32, i32* %3, align 4
  ret i32 %140
}

declare void @rewind(%struct._IO_FILE*) #1

declare %struct.id3_frame* @id3_tag_findframe(%struct.id3_tag*, i8*, i32) #1

declare i64 @id3_field_getint(%union.id3_field*) #1

; Function Attrs: nounwind
declare void @clearerr(%struct._IO_FILE*) #2

declare i32 @fsetpos(%struct._IO_FILE*, %struct._G_fpos_t*) #1

declare i64 @id3_tag_query(i8*, i64) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i64 @ftell(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #2

; Function Attrs: nounwind uwtable
define internal %struct.id3_tag* @read_tag(%struct._IO_FILE*, i64) #0 {
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.id3_tag*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store i64 %1, i64* %4, align 8
  store %struct.id3_tag* null, %struct.id3_tag** %6, align 8
  %7 = load i64, i64* %4, align 8
  %8 = call noalias i8* @malloc(i64 %7) #5
  store i8* %8, i8** %5, align 8
  %9 = load i8*, i8** %5, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %25

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_tag, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_tag, i64 0, i64 1)
  %13 = load i8*, i8** %5, align 8
  %14 = load i64, i64* %4, align 8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %16 = call i64 @fread(i8* %13, i64 %14, i64 1, %struct._IO_FILE* %15)
  %17 = icmp eq i64 %16, 1
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_tag, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_tag, i64 0, i64 2)
  %20 = load i8*, i8** %5, align 8
  %21 = load i64, i64* %4, align 8
  %22 = call %struct.id3_tag* @id3_tag_parse(i8* %20, i64 %21)
  store %struct.id3_tag* %22, %struct.id3_tag** %6, align 8
  br label %23

; <label>:23:                                     ; preds = %18, %11
  %24 = load i8*, i8** %5, align 8
  call void @free(i8* %24) #5
  br label %25

; <label>:25:                                     ; preds = %23, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_tag, i64 0, i64 0)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_tag, i64 0, i64 0)
  %27 = load %struct.id3_tag*, %struct.id3_tag** %6, align 8
  ret %struct.id3_tag* %27
}

; Function Attrs: nounwind uwtable
define internal i32 @update_primary(%struct.id3_tag*, %struct.id3_tag*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.id3_tag*, align 8
  %5 = alloca %struct.id3_tag*, align 8
  %6 = alloca i32, align 4
  store %struct.id3_tag* %0, %struct.id3_tag** %4, align 8
  store %struct.id3_tag* %1, %struct.id3_tag** %5, align 8
  %7 = load %struct.id3_tag*, %struct.id3_tag** %5, align 8
  %8 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %7, i32 0, i32 3
  %9 = load i32, i32* %8, align 4
  %10 = and i32 %9, 64
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %15, label %12

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_update_primary, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_update_primary, i64 0, i64 1)
  %14 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  call void @id3_tag_clearframes(%struct.id3_tag* %14)
  br label %15

; <label>:15:                                     ; preds = %12, %2
  store i32 0, i32* %6, align 4
  br label %16

; <label>:16:                                     ; preds = %36, %15
  %17 = load i32, i32* %6, align 4
  %18 = load %struct.id3_tag*, %struct.id3_tag** %5, align 8
  %19 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %18, i32 0, i32 6
  %20 = load i32, i32* %19, align 8
  %21 = icmp ult i32 %17, %20
  br i1 %21, label %22, label %40

; <label>:22:                                     ; preds = %16
  %23 = load %struct.id3_tag*, %struct.id3_tag** %4, align 8
  %24 = load %struct.id3_tag*, %struct.id3_tag** %5, align 8
  %25 = getelementptr inbounds %struct.id3_tag, %struct.id3_tag* %24, i32 0, i32 7
  %26 = load %struct.id3_frame**, %struct.id3_frame*** %25, align 8
  %27 = load i32, i32* %6, align 4
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds %struct.id3_frame*, %struct.id3_frame** %26, i64 %28
  %30 = load %struct.id3_frame*, %struct.id3_frame** %29, align 8
  %31 = call i32 @id3_tag_attachframe(%struct.id3_tag* %23, %struct.id3_frame* %30)
  %32 = icmp eq i32 %31, -1
  br i1 %32, label %33, label %35

; <label>:33:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_update_primary, i64 0, i64 3)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_update_primary, i64 0, i64 3)
  store i32 -1, i32* %3, align 4
  br label %42

; <label>:35:                                     ; preds = %22
  br label %36

; <label>:36:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_update_primary, i64 0, i64 0)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_update_primary, i64 0, i64 0)
  %38 = load i32, i32* %6, align 4
  %39 = add i32 %38, 1
  store i32 %39, i32* %6, align 4
  br label %16

; <label>:40:                                     ; preds = %16
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_update_primary, i64 0, i64 2)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_update_primary, i64 0, i64 2)
  store i32 0, i32* %3, align 4
  br label %42

; <label>:42:                                     ; preds = %40, %33
  %43 = load i32, i32* %3, align 4
  ret i32 %43
}

declare void @id3_tag_delete(%struct.id3_tag*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

declare %struct.id3_tag* @id3_tag_parse(i8*, i64) #1

declare void @id3_tag_clearframes(%struct.id3_tag*) #1

declare i32 @id3_tag_attachframe(%struct.id3_tag*, %struct.id3_frame*) #1

declare void @id3_tag_delref(%struct.id3_tag*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
