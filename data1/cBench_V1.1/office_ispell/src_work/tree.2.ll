; ModuleID = 'tmp1.ll'
source_filename = "tree.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.dent = type { %struct.dent*, i8*, [1 x i64] }
%struct.hashheader = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i8], [13 x i8], i8, i8, i8, [228 x i16], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [128 x i8], [100 x [11 x i8]], [100 x i32], [100 x i32], i16 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [9 x i8] c"WORDLIST\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"HOME\00", align 1
@personaldict = internal global [4096 x i8] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [9 x i8] c".ispell_\00", align 1
@dictf = internal global %struct._IO_FILE* null, align 8
@.str.3 = private unnamed_addr constant [6 x i8] c"words\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%s/%s%s\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"./\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"../\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"%s/%s\00", align 1
@cbench_print = external global i32, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str.9 = private unnamed_addr constant [16 x i8] c"Can't open %s\0D\0A\00", align 1
@.str.10 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@lflag = external global i32, align 4
@aflag = external global i32, align 4
@.str.11 = private unnamed_addr constant [50 x i8] c"Warning: Cannot update personal dictionary (%s)\0D\0A\00", align 1
@cantexpand = internal global i32 0, align 4
@hcount = internal global i32 0, align 4
@pershsize = internal global i32 0, align 4
@pershtab = internal global %struct.dent* null, align 8
@goodsizes = internal global [4 x i32] [i32 53, i32 223, i32 907, i32 3631], align 16
@.str.12 = private unnamed_addr constant [43 x i8] c"Ran out of space for personal dictionary\0D\0A\00", align 1
@.str.13 = private unnamed_addr constant [48 x i8] c"Continuing anyway (with reduced performance).\0D\0A\00", align 1
@newwords = internal global i32 0, align 4
@.str.14 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.15 = private unnamed_addr constant [18 x i8] c"Can't create %s\0D\0A\00", align 1
@hashtbl = external global %struct.dent*, align 8
@hashsize = external global i32, align 4
@hashstrings = external global i8*, align 8
@hashheader = external global %struct.hashheader, align 4
@.str.16 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@.str.17 = private unnamed_addr constant [51 x i8] c"\0D\0AWord '%s' too long at line %d of %s, truncated\0D\0A\00", align 1
@.str.18 = private unnamed_addr constant [7 x i8] c"tree.c\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_treeinit = private constant [8 x i8] c"treeinit"
@__profn_tmp1.ll_trydict = private constant [15 x i8] c"tmp1.ll:trydict"
@__profn_tmp1.ll_treeload = private constant [16 x i8] c"tmp1.ll:treeload"
@__profn_treeinsert = private constant [10 x i8] c"treeinsert"
@__profn_tmp1.ll_tinsert = private constant [15 x i8] c"tmp1.ll:tinsert"
@__profn_treelookup = private constant [10 x i8] c"treelookup"
@__profn_treeoutput = private constant [10 x i8] c"treeoutput"
@__profn_tmp1.ll_pdictcmp = private constant [16 x i8] c"tmp1.ll:pdictcmp"
@__profn_mymalloc = private constant [8 x i8] c"mymalloc"
@__profn_myfree = private constant [6 x i8] c"myfree"
@__profc_treeinit = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_treeinit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1393640200676241065, i64 347699736152, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i32 0, i32 0), i8* bitcast (void (i8*, i8*)* @treeinit to i8*), i8* null, i32 28, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_trydict = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_trydict = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8017278370530264010, i64 41968295313, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trydict, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_treeload = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_treeload = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5668226646390974673, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_treeload, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_treeinsert = private global [20 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_treeinsert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -590603133434981383, i64 294101331190, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i32 0, i32 0), i8* bitcast (void (i8*, i32, i32)* @treeinsert to i8*), i8* null, i32 20, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_tinsert = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_tinsert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3245480226109952798, i64 106648078382, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_treelookup = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_treelookup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4485825885229044746, i64 111215626089, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i32 0, i32 0), i8* bitcast (%struct.dent* (i8*)* @treelookup to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_treeoutput = private global [31 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_treeoutput = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1767933162197690767, i64 485915761807, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i32 0, i32 0), i8* bitcast (void ()* @treeoutput to i8*), i8* null, i32 31, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pdictcmp = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pdictcmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4454975035579171854, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_pdictcmp, i32 0, i32 0), i8* bitcast (i32 (%struct.dent**, %struct.dent**)* @pdictcmp to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mymalloc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mymalloc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3385149921654194612, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mymalloc, i32 0, i32 0), i8* bitcast (i8* (i32)* @mymalloc to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_myfree = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_myfree = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5916631177476171689, i64 47051844168, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_myfree, i32 0, i32 0), i8* bitcast (void (i8*)* @myfree to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [125 x i8] c"{\00treeinit\01tmp1.ll:trydict\01tmp1.ll:treeload\01treeinsert\01tmp1.ll:tinsert\01treelookup\01treeoutput\01tmp1.ll:pdictcmp\01mymalloc\01myfree", section "__llvm_prf_names"
@llvm.used = appending global [11 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_treeinit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_trydict to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_treeload to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_treeinsert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_tinsert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_treelookup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_treeoutput to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pdictcmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mymalloc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_myfree to i8*), i8* getelementptr inbounds ([125 x i8], [125 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @treeinit(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca [4096 x i8], align 16
  %8 = alloca %struct._IO_FILE*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %9 = load i8*, i8** %3, align 8
  %10 = icmp eq i8* %9, null
  br i1 %10, label %11, label %14

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 0)
  %13 = call i8* @getenv(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0)) #7
  store i8* %13, i8** %3, align 8
  br label %14

; <label>:14:                                     ; preds = %11, %2
  %15 = call i8* @getenv(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0)) #7
  store i8* %15, i8** %6, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 1)
  br label %207

; <label>:19:                                     ; preds = %14
  %20 = load i8*, i8** %3, align 8
  %21 = icmp eq i8* %20, null
  br i1 %21, label %22, label %106

; <label>:22:                                     ; preds = %19
  %23 = load i8*, i8** %4, align 8
  %24 = call %struct._IO_FILE* @trydict(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* null, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* %23)
  store %struct._IO_FILE* %24, %struct._IO_FILE** @dictf, align 8
  %25 = getelementptr inbounds [4096 x i8], [4096 x i8]* %7, i32 0, i32 0
  %26 = load i8*, i8** %6, align 8
  %27 = load i8*, i8** %4, align 8
  %28 = call %struct._IO_FILE* @trydict(i8* %25, i8* %26, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* %27)
  store %struct._IO_FILE* %28, %struct._IO_FILE** %8, align 8
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %30 = icmp eq %struct._IO_FILE* %29, null
  br i1 %30, label %31, label %41

; <label>:31:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 11)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 11)
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %34 = icmp eq %struct._IO_FILE* %33, null
  br i1 %34, label %35, label %41

; <label>:35:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 19)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 19)
  %37 = call %struct._IO_FILE* @trydict(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* null, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %37, %struct._IO_FILE** @dictf, align 8
  %38 = getelementptr inbounds [4096 x i8], [4096 x i8]* %7, i32 0, i32 0
  %39 = load i8*, i8** %6, align 8
  %40 = call %struct._IO_FILE* @trydict(i8* %38, i8* %39, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %40, %struct._IO_FILE** %8, align 8
  br label %41

; <label>:41:                                     ; preds = %35, %31, %22
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %43 = icmp eq %struct._IO_FILE* %42, null
  br i1 %43, label %44, label %56

; <label>:44:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 12)
  %45 = add i64 %pgocount4, 1
  store i64 %45, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 12)
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %47 = icmp eq %struct._IO_FILE* %46, null
  br i1 %47, label %48, label %56

; <label>:48:                                     ; preds = %44
  %pgocount5 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 20)
  %49 = add i64 %pgocount5, 1
  store i64 %49, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 20)
  %50 = load i8*, i8** %4, align 8
  %51 = call %struct._IO_FILE* @trydict(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* null, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* %50)
  store %struct._IO_FILE* %51, %struct._IO_FILE** @dictf, align 8
  %52 = getelementptr inbounds [4096 x i8], [4096 x i8]* %7, i32 0, i32 0
  %53 = load i8*, i8** %6, align 8
  %54 = load i8*, i8** %4, align 8
  %55 = call %struct._IO_FILE* @trydict(i8* %52, i8* %53, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* %54)
  store %struct._IO_FILE* %55, %struct._IO_FILE** %8, align 8
  br label %56

; <label>:56:                                     ; preds = %48, %44, %41
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %58 = icmp eq %struct._IO_FILE* %57, null
  br i1 %58, label %59, label %69

; <label>:59:                                     ; preds = %56
  %pgocount6 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 13)
  %60 = add i64 %pgocount6, 1
  store i64 %60, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 13)
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %62 = icmp eq %struct._IO_FILE* %61, null
  br i1 %62, label %63, label %69

; <label>:63:                                     ; preds = %59
  %pgocount7 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 21)
  %64 = add i64 %pgocount7, 1
  store i64 %64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 21)
  %65 = call %struct._IO_FILE* @trydict(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* null, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %65, %struct._IO_FILE** @dictf, align 8
  %66 = getelementptr inbounds [4096 x i8], [4096 x i8]* %7, i32 0, i32 0
  %67 = load i8*, i8** %6, align 8
  %68 = call %struct._IO_FILE* @trydict(i8* %66, i8* %67, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %68, %struct._IO_FILE** %8, align 8
  br label %69

; <label>:69:                                     ; preds = %63, %59, %56
  %70 = load i8, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i64 0, i64 0), align 16
  %71 = sext i8 %70 to i32
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %88

; <label>:73:                                     ; preds = %69
  %74 = getelementptr inbounds [4096 x i8], [4096 x i8]* %7, i64 0, i64 0
  %75 = load i8, i8* %74, align 16
  %76 = sext i8 %75 to i32
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %82

; <label>:78:                                     ; preds = %73
  %pgocount8 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 15)
  %79 = add i64 %pgocount8, 1
  store i64 %79, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 15)
  %80 = getelementptr inbounds [4096 x i8], [4096 x i8]* %7, i32 0, i32 0
  %81 = call i8* @strcpy(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* %80) #7
  br label %87

; <label>:82:                                     ; preds = %73
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 22)
  %83 = add i64 %pgocount9, 1
  store i64 %83, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 22)
  %84 = load i8*, i8** %6, align 8
  %85 = load i8*, i8** %4, align 8
  %86 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8* %84, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* %85) #7
  br label %87

; <label>:87:                                     ; preds = %82, %78
  br label %88

; <label>:88:                                     ; preds = %87, %69
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %90 = icmp ne %struct._IO_FILE* %89, null
  br i1 %90, label %91, label %96

; <label>:91:                                     ; preds = %88
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 7)
  %92 = add i64 %pgocount10, 1
  store i64 %92, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 7)
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  call void @treeload(%struct._IO_FILE* %93)
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %95 = call i32 @fclose(%struct._IO_FILE* %94)
  br label %96

; <label>:96:                                     ; preds = %91, %88
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %98 = icmp ne %struct._IO_FILE* %97, null
  br i1 %98, label %99, label %104

; <label>:99:                                     ; preds = %96
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 8)
  %100 = add i64 %pgocount11, 1
  store i64 %100, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 8)
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  call void @treeload(%struct._IO_FILE* %101)
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %103 = call i32 @fclose(%struct._IO_FILE* %102)
  br label %104

; <label>:104:                                    ; preds = %99, %96
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 3)
  %105 = add i64 %pgocount12, 1
  store i64 %105, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 3)
  br label %181

; <label>:106:                                    ; preds = %19
  %107 = load i8*, i8** %3, align 8
  %108 = load i8, i8* %107, align 1
  %109 = sext i8 %108 to i32
  %110 = icmp eq i32 %109, 47
  br i1 %110, label %121, label %111

; <label>:111:                                    ; preds = %106
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 5)
  %112 = add i64 %pgocount13, 1
  store i64 %112, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 5)
  %113 = load i8*, i8** %3, align 8
  %114 = call i32 @strncmp(i8* %113, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i64 2) #8
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %121, label %116

; <label>:116:                                    ; preds = %111
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 9)
  %117 = add i64 %pgocount14, 1
  store i64 %117, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 9)
  %118 = load i8*, i8** %3, align 8
  %119 = call i32 @strncmp(i8* %118, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i64 3) #8
  %120 = icmp eq i32 %119, 0
  br label %121

; <label>:121:                                    ; preds = %116, %111, %106
  %122 = phi i1 [ true, %111 ], [ true, %106 ], [ %120, %116 ]
  %123 = zext i1 %122 to i32
  store i32 %123, i32* %5, align 4
  %124 = load i32, i32* %5, align 4
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %138

; <label>:126:                                    ; preds = %121
  %127 = load i8*, i8** %3, align 8
  %128 = call i8* @strcpy(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* %127) #7
  %129 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %129, %struct._IO_FILE** @dictf, align 8
  %130 = icmp ne %struct._IO_FILE* %129, null
  br i1 %130, label %131, label %136

; <label>:131:                                    ; preds = %126
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 6)
  %132 = add i64 %pgocount15, 1
  store i64 %132, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 6)
  %133 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  call void @treeload(%struct._IO_FILE* %133)
  %134 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %135 = call i32 @fclose(%struct._IO_FILE* %134)
  br label %136

; <label>:136:                                    ; preds = %131, %126
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 2)
  %137 = add i64 %pgocount16, 1
  store i64 %137, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 2)
  br label %180

; <label>:138:                                    ; preds = %121
  %139 = load i8*, i8** %3, align 8
  %140 = call i8* @strcpy(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* %139) #7
  %141 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %141, %struct._IO_FILE** @dictf, align 8
  %142 = icmp ne %struct._IO_FILE* %141, null
  br i1 %142, label %143, label %147

; <label>:143:                                    ; preds = %138
  %144 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  call void @treeload(%struct._IO_FILE* %144)
  %145 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %146 = call i32 @fclose(%struct._IO_FILE* %145)
  br label %165

; <label>:147:                                    ; preds = %138
  %148 = load i32, i32* %5, align 4
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %163, label %150

; <label>:150:                                    ; preds = %147
  %151 = load i8*, i8** %6, align 8
  %152 = load i8*, i8** %3, align 8
  %153 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i32 0, i32 0), i8* %151, i8* %152) #7
  %154 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %154, %struct._IO_FILE** @dictf, align 8
  %155 = icmp ne %struct._IO_FILE* %154, null
  br i1 %155, label %156, label %161

; <label>:156:                                    ; preds = %150
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 26)
  %157 = add i64 %pgocount17, 1
  store i64 %157, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 26)
  %158 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  call void @treeload(%struct._IO_FILE* %158)
  %159 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %160 = call i32 @fclose(%struct._IO_FILE* %159)
  br label %161

; <label>:161:                                    ; preds = %156, %150
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 24)
  %162 = add i64 %pgocount18, 1
  store i64 %162, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 24)
  br label %163

; <label>:163:                                    ; preds = %161, %147
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 16)
  %164 = add i64 %pgocount19, 1
  store i64 %164, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 16)
  br label %165

; <label>:165:                                    ; preds = %163, %143
  %166 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %167 = icmp eq %struct._IO_FILE* %166, null
  br i1 %167, label %168, label %178

; <label>:168:                                    ; preds = %165
  %169 = load i32, i32* @cbench_print, align 4
  %170 = icmp ne i32 %169, 0
  br i1 %170, label %171, label %176

; <label>:171:                                    ; preds = %168
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 18)
  %172 = add i64 %pgocount20, 1
  store i64 %172, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 18)
  %173 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %174 = load i8*, i8** %3, align 8
  %175 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %173, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i32 0, i32 0), i8* %174)
  br label %176

; <label>:176:                                    ; preds = %171, %168
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 17)
  %177 = add i64 %pgocount21, 1
  store i64 %177, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 17)
  call void @perror(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %207

; <label>:178:                                    ; preds = %165
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 10)
  %179 = add i64 %pgocount22, 1
  store i64 %179, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 10)
  br label %180

; <label>:180:                                    ; preds = %178, %136
  br label %181

; <label>:181:                                    ; preds = %180, %104
  %182 = load i32, i32* @lflag, align 4
  %183 = icmp ne i32 %182, 0
  br i1 %183, label %207, label %184

; <label>:184:                                    ; preds = %181
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 4)
  %185 = add i64 %pgocount23, 1
  store i64 %185, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 4)
  %186 = load i32, i32* @aflag, align 4
  %187 = icmp ne i32 %186, 0
  br i1 %187, label %207, label %188

; <label>:188:                                    ; preds = %184
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 14)
  %189 = add i64 %pgocount24, 1
  store i64 %189, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 14)
  %190 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @access to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i32 2)
  %191 = icmp slt i32 %190, 0
  br i1 %191, label %192, label %207

; <label>:192:                                    ; preds = %188
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 23)
  %193 = add i64 %pgocount25, 1
  store i64 %193, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 23)
  %194 = call i32* @__errno_location() #9
  %195 = load i32, i32* %194, align 4
  %196 = icmp ne i32 %195, 2
  br i1 %196, label %197, label %207

; <label>:197:                                    ; preds = %192
  %198 = load i32, i32* @cbench_print, align 4
  %199 = icmp ne i32 %198, 0
  br i1 %199, label %200, label %204

; <label>:200:                                    ; preds = %197
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 27)
  %201 = add i64 %pgocount26, 1
  store i64 %201, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 27)
  %202 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %203 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %202, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0))
  br label %204

; <label>:204:                                    ; preds = %200, %197
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 25)
  %205 = add i64 %pgocount27, 1
  store i64 %205, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_treeinit, i64 0, i64 25)
  %206 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 2)
  br label %207

; <label>:207:                                    ; preds = %204, %192, %188, %184, %181, %176, %17
  ret void
}

; Function Attrs: nounwind
declare i8* @getenv(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal %struct._IO_FILE* @trydict(i8*, i8*, i8*, i8*) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca %struct._IO_FILE*, align 8
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  store i8* %3, i8** %8, align 8
  %10 = load i8*, i8** %6, align 8
  %11 = icmp eq i8* %10, null
  br i1 %11, label %12, label %18

; <label>:12:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trydict, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trydict, i64 0, i64 1)
  %14 = load i8*, i8** %5, align 8
  %15 = load i8*, i8** %7, align 8
  %16 = load i8*, i8** %8, align 8
  %17 = call i32 (i8*, i8*, ...) @sprintf(i8* %14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.16, i32 0, i32 0), i8* %15, i8* %16) #7
  br label %25

; <label>:18:                                     ; preds = %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trydict, i64 0, i64 0)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trydict, i64 0, i64 0)
  %20 = load i8*, i8** %5, align 8
  %21 = load i8*, i8** %6, align 8
  %22 = load i8*, i8** %7, align 8
  %23 = load i8*, i8** %8, align 8
  %24 = call i32 (i8*, i8*, ...) @sprintf(i8* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8* %21, i8* %22, i8* %23) #7
  br label %25

; <label>:25:                                     ; preds = %18, %12
  %26 = load i8*, i8** %5, align 8
  %27 = call %struct._IO_FILE* @fopen(i8* %26, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %27, %struct._IO_FILE** %9, align 8
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %29 = icmp eq %struct._IO_FILE* %28, null
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trydict, i64 0, i64 2)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_trydict, i64 0, i64 2)
  %32 = load i8*, i8** %5, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 0
  store i8 0, i8* %33, align 1
  br label %34

; <label>:34:                                     ; preds = %30, %25
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  ret %struct._IO_FILE* %35
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @treeload(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca [8192 x i8], align 16
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  br label %4

; <label>:4:                                      ; preds = %9, %1
  %5 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %7 = call i8* @fgets(i8* %5, i32 8192, %struct._IO_FILE* %6)
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_treeload, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_treeload, i64 0, i64 0)
  %11 = getelementptr inbounds [8192 x i8], [8192 x i8]* %3, i32 0, i32 0
  call void @treeinsert(i8* %11, i32 8192, i32 1)
  br label %4

; <label>:12:                                     ; preds = %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_treeload, i64 0, i64 1)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_treeload, i64 0, i64 1)
  store i32 0, i32* @newwords, align 4
  ret void
}

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #3

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare void @perror(i8*) #2

declare i32 @access(...) #2

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #4

declare i32 @sleep(...) #2

; Function Attrs: noinline nounwind uwtable
define void @treeinsert(i8*, i32, i32) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.dent, align 8
  %9 = alloca %struct.dent*, align 8
  %10 = alloca %struct.dent*, align 8
  %11 = alloca %struct.dent*, align 8
  %12 = alloca %struct.dent*, align 8
  %13 = alloca i32, align 4
  %14 = alloca [120 x i8], align 16
  %15 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %16 = load i32, i32* @cantexpand, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %180, label %18

; <label>:18:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 6)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 6)
  %20 = load i32, i32* @hcount, align 4
  %21 = mul nsw i32 %20, 100
  %22 = sdiv i32 %21, 70
  %23 = load i32, i32* @pershsize, align 4
  %24 = icmp sge i32 %22, %23
  br i1 %24, label %25, label %180

; <label>:25:                                     ; preds = %18
  %26 = load i32, i32* @pershsize, align 4
  store i32 %26, i32* %13, align 4
  %27 = load %struct.dent*, %struct.dent** @pershtab, align 8
  store %struct.dent* %27, %struct.dent** %12, align 8
  store i32 0, i32* %7, align 4
  br label %28

; <label>:28:                                     ; preds = %42, %25
  %29 = load i32, i32* %7, align 4
  %30 = sext i32 %29 to i64
  %31 = icmp ult i64 %30, 4
  br i1 %31, label %32, label %46

; <label>:32:                                     ; preds = %28
  %33 = load i32, i32* %7, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [4 x i32], [4 x i32]* @goodsizes, i64 0, i64 %34
  %36 = load i32, i32* %35, align 4
  %37 = load i32, i32* @pershsize, align 4
  %38 = icmp sgt i32 %36, %37
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 14)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 14)
  br label %46

; <label>:41:                                     ; preds = %32
  br label %42

; <label>:42:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 3)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 3)
  %44 = load i32, i32* %7, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %7, align 4
  br label %28

; <label>:46:                                     ; preds = %39, %28
  %47 = load i32, i32* %7, align 4
  %48 = sext i32 %47 to i64
  %49 = icmp uge i64 %48, 4
  br i1 %49, label %50, label %56

; <label>:50:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 12)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 12)
  %52 = load i32, i32* @pershsize, align 4
  %53 = add nsw i32 %52, 1
  %54 = load i32, i32* @pershsize, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, i32* @pershsize, align 4
  br label %62

; <label>:56:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 13)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 13)
  %58 = load i32, i32* %7, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [4 x i32], [4 x i32]* @goodsizes, i64 0, i64 %59
  %61 = load i32, i32* %60, align 4
  store i32 %61, i32* @pershsize, align 4
  br label %62

; <label>:62:                                     ; preds = %56, %50
  %63 = load i32, i32* @pershsize, align 4
  %64 = zext i32 %63 to i64
  %65 = call noalias i8* @calloc(i64 %64, i64 24) #7
  %66 = bitcast i8* %65 to %struct.dent*
  store %struct.dent* %66, %struct.dent** @pershtab, align 8
  %67 = load %struct.dent*, %struct.dent** @pershtab, align 8
  %68 = icmp eq %struct.dent* %67, null
  br i1 %68, label %69, label %92

; <label>:69:                                     ; preds = %62
  %70 = load i32, i32* @cbench_print, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %76

; <label>:72:                                     ; preds = %69
  %pgocount5 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 17)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 17)
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %75 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %74, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12, i32 0, i32 0))
  br label %76

; <label>:76:                                     ; preds = %72, %69
  %77 = load %struct.dent*, %struct.dent** %12, align 8
  %78 = icmp eq %struct.dent* %77, null
  br i1 %78, label %79, label %81

; <label>:79:                                     ; preds = %76
  %pgocount6 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 19)
  %80 = add i64 %pgocount6, 1
  store i64 %80, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 19)
  call void @exit(i32 1) #10
  unreachable

; <label>:81:                                     ; preds = %76
  %82 = load i32, i32* @cbench_print, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %88

; <label>:84:                                     ; preds = %81
  %pgocount7 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 18)
  %85 = add i64 %pgocount7, 1
  store i64 %85, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 18)
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %87 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %86, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.13, i32 0, i32 0))
  br label %88

; <label>:88:                                     ; preds = %84, %81
  %pgocount8 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 16)
  %89 = add i64 %pgocount8, 1
  store i64 %89, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 16)
  store i32 1, i32* @cantexpand, align 4
  %90 = load i32, i32* %13, align 4
  store i32 %90, i32* @pershsize, align 4
  %91 = load %struct.dent*, %struct.dent** %12, align 8
  store %struct.dent* %91, %struct.dent** @pershtab, align 8
  store i32 1, i32* @newwords, align 4
  br label %179

; <label>:92:                                     ; preds = %62
  store i32 0, i32* %7, align 4
  br label %93

; <label>:93:                                     ; preds = %168, %92
  %94 = load i32, i32* %7, align 4
  %95 = load i32, i32* %13, align 4
  %96 = icmp slt i32 %94, %95
  br i1 %96, label %97, label %171

; <label>:97:                                     ; preds = %93
  %pgocount9 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 2)
  %98 = add i64 %pgocount9, 1
  store i64 %98, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 2)
  %99 = load %struct.dent*, %struct.dent** %12, align 8
  %100 = load i32, i32* %7, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds %struct.dent, %struct.dent* %99, i64 %101
  store %struct.dent* %102, %struct.dent** %9, align 8
  %103 = load %struct.dent*, %struct.dent** %9, align 8
  %104 = getelementptr inbounds %struct.dent, %struct.dent* %103, i32 0, i32 2
  %105 = getelementptr inbounds [1 x i64], [1 x i64]* %104, i64 0, i64 0
  %106 = load i64, i64* %105, align 8
  %107 = and i64 %106, 67108864
  %108 = icmp ne i64 %107, 0
  br i1 %108, label %109, label %167

; <label>:109:                                    ; preds = %97
  %110 = load %struct.dent*, %struct.dent** %9, align 8
  %111 = call %struct.dent* @tinsert(%struct.dent* %110)
  store %struct.dent* %111, %struct.dent** %11, align 8
  %112 = load %struct.dent*, %struct.dent** %9, align 8
  %113 = getelementptr inbounds %struct.dent, %struct.dent* %112, i32 0, i32 2
  %114 = getelementptr inbounds [1 x i64], [1 x i64]* %113, i64 0, i64 0
  %115 = load i64, i64* %114, align 8
  %116 = and i64 %115, 1073741824
  %117 = trunc i64 %116 to i32
  store i32 %117, i32* %15, align 4
  %118 = load %struct.dent*, %struct.dent** %9, align 8
  %119 = getelementptr inbounds %struct.dent, %struct.dent* %118, i32 0, i32 0
  %120 = load %struct.dent*, %struct.dent** %119, align 8
  store %struct.dent* %120, %struct.dent** %9, align 8
  br label %121

; <label>:121:                                    ; preds = %163, %109
  %122 = load %struct.dent*, %struct.dent** %9, align 8
  %123 = icmp ne %struct.dent* %122, null
  br i1 %123, label %124, label %165

; <label>:124:                                    ; preds = %121
  %125 = load i32, i32* %15, align 4
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %127, label %147

; <label>:127:                                    ; preds = %124
  %128 = load %struct.dent*, %struct.dent** %9, align 8
  %129 = getelementptr inbounds %struct.dent, %struct.dent* %128, i32 0, i32 2
  %130 = getelementptr inbounds [1 x i64], [1 x i64]* %129, i64 0, i64 0
  %131 = load i64, i64* %130, align 8
  %132 = and i64 %131, 1073741824
  %133 = trunc i64 %132 to i32
  store i32 %133, i32* %15, align 4
  %134 = load %struct.dent*, %struct.dent** %11, align 8
  %135 = getelementptr inbounds %struct.dent, %struct.dent* %134, i32 0, i32 0
  %136 = load %struct.dent*, %struct.dent** %135, align 8
  store %struct.dent* %136, %struct.dent** %10, align 8
  %137 = load %struct.dent*, %struct.dent** %9, align 8
  %138 = load %struct.dent*, %struct.dent** %11, align 8
  %139 = getelementptr inbounds %struct.dent, %struct.dent* %138, i32 0, i32 0
  store %struct.dent* %137, %struct.dent** %139, align 8
  %140 = load %struct.dent*, %struct.dent** %9, align 8
  store %struct.dent* %140, %struct.dent** %11, align 8
  %141 = load %struct.dent*, %struct.dent** %9, align 8
  %142 = getelementptr inbounds %struct.dent, %struct.dent* %141, i32 0, i32 0
  %143 = load %struct.dent*, %struct.dent** %142, align 8
  store %struct.dent* %143, %struct.dent** %9, align 8
  %144 = load %struct.dent*, %struct.dent** %10, align 8
  %145 = load %struct.dent*, %struct.dent** %11, align 8
  %146 = getelementptr inbounds %struct.dent, %struct.dent* %145, i32 0, i32 0
  store %struct.dent* %144, %struct.dent** %146, align 8
  br label %163

; <label>:147:                                    ; preds = %124
  %pgocount10 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 0)
  %148 = add i64 %pgocount10, 1
  store i64 %148, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 0)
  %149 = load %struct.dent*, %struct.dent** %9, align 8
  %150 = getelementptr inbounds %struct.dent, %struct.dent* %149, i32 0, i32 2
  %151 = getelementptr inbounds [1 x i64], [1 x i64]* %150, i64 0, i64 0
  %152 = load i64, i64* %151, align 8
  %153 = and i64 %152, 1073741824
  %154 = trunc i64 %153 to i32
  store i32 %154, i32* %15, align 4
  %155 = load %struct.dent*, %struct.dent** %9, align 8
  %156 = call %struct.dent* @tinsert(%struct.dent* %155)
  store %struct.dent* %156, %struct.dent** %11, align 8
  %157 = load %struct.dent*, %struct.dent** %9, align 8
  store %struct.dent* %157, %struct.dent** %10, align 8
  %158 = load %struct.dent*, %struct.dent** %9, align 8
  %159 = getelementptr inbounds %struct.dent, %struct.dent* %158, i32 0, i32 0
  %160 = load %struct.dent*, %struct.dent** %159, align 8
  store %struct.dent* %160, %struct.dent** %9, align 8
  %161 = load %struct.dent*, %struct.dent** %10, align 8
  %162 = bitcast %struct.dent* %161 to i8*
  call void @free(i8* %162) #7
  br label %163

; <label>:163:                                    ; preds = %147, %127
  %pgocount11 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 1)
  %164 = add i64 %pgocount11, 1
  store i64 %164, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 1)
  br label %121

; <label>:165:                                    ; preds = %121
  %pgocount12 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 4)
  %166 = add i64 %pgocount12, 1
  store i64 %166, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 4)
  br label %167

; <label>:167:                                    ; preds = %165, %97
  br label %168

; <label>:168:                                    ; preds = %167
  %169 = load i32, i32* %7, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, i32* %7, align 4
  br label %93

; <label>:171:                                    ; preds = %93
  %172 = load %struct.dent*, %struct.dent** %12, align 8
  %173 = icmp ne %struct.dent* %172, null
  br i1 %173, label %174, label %178

; <label>:174:                                    ; preds = %171
  %pgocount13 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 15)
  %175 = add i64 %pgocount13, 1
  store i64 %175, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 15)
  %176 = load %struct.dent*, %struct.dent** %12, align 8
  %177 = bitcast %struct.dent* %176 to i8*
  call void @free(i8* %177) #7
  br label %178

; <label>:178:                                    ; preds = %174, %171
  br label %179

; <label>:179:                                    ; preds = %178, %88
  br label %180

; <label>:180:                                    ; preds = %179, %18, %3
  %181 = load i8*, i8** %4, align 8
  %182 = load i32, i32* %5, align 4
  %183 = call i32 @makedent(i8* %181, i32 %182, %struct.dent* %8)
  %184 = icmp slt i32 %183, 0
  br i1 %184, label %185, label %187

; <label>:185:                                    ; preds = %180
  %pgocount14 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 7)
  %186 = add i64 %pgocount14, 1
  store i64 %186, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 7)
  br label %232

; <label>:187:                                    ; preds = %180
  %188 = load i32, i32* %6, align 4
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %190, label %196

; <label>:190:                                    ; preds = %187
  %pgocount15 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 5)
  %191 = add i64 %pgocount15, 1
  store i64 %191, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 5)
  %192 = getelementptr inbounds %struct.dent, %struct.dent* %8, i32 0, i32 2
  %193 = getelementptr inbounds [1 x i64], [1 x i64]* %192, i64 0, i64 0
  %194 = load i64, i64* %193, align 8
  %195 = or i64 %194, 134217728
  store i64 %195, i64* %193, align 8
  br label %196

; <label>:196:                                    ; preds = %190, %187
  %197 = getelementptr inbounds [120 x i8], [120 x i8]* %14, i32 0, i32 0
  %198 = load i8*, i8** %4, align 8
  %199 = call i32 @strtoichar(i8* %197, i8* %198, i32 120, i32 1)
  %200 = getelementptr inbounds [120 x i8], [120 x i8]* %14, i32 0, i32 0
  call void @upcase(i8* %200)
  %201 = getelementptr inbounds [120 x i8], [120 x i8]* %14, i32 0, i32 0
  %202 = call %struct.dent* @lookup(i8* %201, i32 1)
  store %struct.dent* %202, %struct.dent** %9, align 8
  %203 = icmp ne %struct.dent* %202, null
  br i1 %203, label %204, label %214

; <label>:204:                                    ; preds = %196
  %205 = load %struct.dent*, %struct.dent** %9, align 8
  %206 = call i32 @combinecaps(%struct.dent* %205, %struct.dent* %8)
  %207 = icmp slt i32 %206, 0
  br i1 %207, label %208, label %212

; <label>:208:                                    ; preds = %204
  %pgocount16 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 10)
  %209 = add i64 %pgocount16, 1
  store i64 %209, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 10)
  %210 = getelementptr inbounds %struct.dent, %struct.dent* %8, i32 0, i32 1
  %211 = load i8*, i8** %210, align 8
  call void @free(i8* %211) #7
  br label %232

; <label>:212:                                    ; preds = %204
  %pgocount17 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 8)
  %213 = add i64 %pgocount17, 1
  store i64 %213, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 8)
  br label %228

; <label>:214:                                    ; preds = %196
  %215 = call %struct.dent* @tinsert(%struct.dent* %8)
  store %struct.dent* %215, %struct.dent** %9, align 8
  %216 = load %struct.dent*, %struct.dent** %9, align 8
  %217 = getelementptr inbounds %struct.dent, %struct.dent* %216, i32 0, i32 2
  %218 = getelementptr inbounds [1 x i64], [1 x i64]* %217, i64 0, i64 0
  %219 = load i64, i64* %218, align 8
  %220 = and i64 %219, 805306368
  %221 = icmp eq i64 %220, 805306368
  br i1 %221, label %222, label %226

; <label>:222:                                    ; preds = %214
  %pgocount18 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 11)
  %223 = add i64 %pgocount18, 1
  store i64 %223, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 11)
  %224 = load %struct.dent*, %struct.dent** %9, align 8
  %225 = call i32 @addvheader(%struct.dent* %224)
  br label %226

; <label>:226:                                    ; preds = %222, %214
  %pgocount19 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 9)
  %227 = add i64 %pgocount19, 1
  store i64 %227, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_treeinsert, i64 0, i64 9)
  br label %228

; <label>:228:                                    ; preds = %226, %212
  %229 = load i32, i32* %6, align 4
  %230 = load i32, i32* @newwords, align 4
  %231 = or i32 %230, %229
  store i32 %231, i32* @newwords, align 4
  br label %232

; <label>:232:                                    ; preds = %228, %208, %185
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal %struct.dent* @tinsert(%struct.dent*) #0 {
  %2 = alloca %struct.dent*, align 8
  %3 = alloca [120 x i8], align 16
  %4 = alloca i32, align 4
  %5 = alloca %struct.dent*, align 8
  %6 = alloca %struct.dent*, align 8
  store %struct.dent* %0, %struct.dent** %2, align 8
  %7 = getelementptr inbounds [120 x i8], [120 x i8]* %3, i32 0, i32 0
  %8 = load %struct.dent*, %struct.dent** %2, align 8
  %9 = getelementptr inbounds %struct.dent, %struct.dent* %8, i32 0, i32 1
  %10 = load i8*, i8** %9, align 8
  %11 = call i32 @strtoichar(i8* %7, i8* %10, i32 120, i32 1)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %25

; <label>:13:                                     ; preds = %1
  %14 = load i32, i32* @cbench_print, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %23

; <label>:16:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 5)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 5)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = load %struct.dent*, %struct.dent** %2, align 8
  %20 = getelementptr inbounds %struct.dent, %struct.dent* %19, i32 0, i32 1
  %21 = load i8*, i8** %20, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.17, i32 0, i32 0), i8* %21, i32 446, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.18, i32 0, i32 0))
  br label %23

; <label>:23:                                     ; preds = %16, %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 2)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 2)
  br label %25

; <label>:25:                                     ; preds = %23, %1
  %26 = getelementptr inbounds [120 x i8], [120 x i8]* %3, i32 0, i32 0
  %27 = load i32, i32* @pershsize, align 4
  %28 = call i32 @hash(i8* %26, i32 %27)
  store i32 %28, i32* %4, align 4
  store %struct.dent* null, %struct.dent** %6, align 8
  %29 = load %struct.dent*, %struct.dent** @pershtab, align 8
  %30 = load i32, i32* %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds %struct.dent, %struct.dent* %29, i64 %31
  store %struct.dent* %32, %struct.dent** %5, align 8
  %33 = load %struct.dent*, %struct.dent** %5, align 8
  %34 = getelementptr inbounds %struct.dent, %struct.dent* %33, i32 0, i32 2
  %35 = getelementptr inbounds [1 x i64], [1 x i64]* %34, i64 0, i64 0
  %36 = load i64, i64* %35, align 8
  %37 = and i64 %36, 67108864
  %38 = icmp ne i64 %37, 0
  br i1 %38, label %39, label %65

; <label>:39:                                     ; preds = %25
  br label %40

; <label>:40:                                     ; preds = %43, %39
  %41 = load %struct.dent*, %struct.dent** %5, align 8
  %42 = icmp ne %struct.dent* %41, null
  br i1 %42, label %43, label %49

; <label>:43:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 0)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 0)
  %45 = load %struct.dent*, %struct.dent** %5, align 8
  store %struct.dent* %45, %struct.dent** %6, align 8
  %46 = load %struct.dent*, %struct.dent** %5, align 8
  %47 = getelementptr inbounds %struct.dent, %struct.dent* %46, i32 0, i32 0
  %48 = load %struct.dent*, %struct.dent** %47, align 8
  store %struct.dent* %48, %struct.dent** %5, align 8
  br label %40

; <label>:49:                                     ; preds = %40
  %50 = call noalias i8* @calloc(i64 1, i64 24) #7
  %51 = bitcast i8* %50 to %struct.dent*
  store %struct.dent* %51, %struct.dent** %5, align 8
  %52 = load %struct.dent*, %struct.dent** %5, align 8
  %53 = icmp eq %struct.dent* %52, null
  br i1 %53, label %54, label %63

; <label>:54:                                     ; preds = %49
  %55 = load i32, i32* @cbench_print, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %61

; <label>:57:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 7)
  %58 = add i64 %pgocount3, 1
  store i64 %58, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 7)
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12, i32 0, i32 0))
  br label %61

; <label>:61:                                     ; preds = %57, %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 6)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 6)
  call void @exit(i32 1) #10
  unreachable

; <label>:63:                                     ; preds = %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 4)
  %64 = add i64 %pgocount5, 1
  store i64 %64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 4)
  br label %65

; <label>:65:                                     ; preds = %63, %25
  %66 = load %struct.dent*, %struct.dent** %5, align 8
  %67 = load %struct.dent*, %struct.dent** %2, align 8
  %68 = bitcast %struct.dent* %66 to i8*
  %69 = bitcast %struct.dent* %67 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %68, i8* %69, i64 24, i32 8, i1 false)
  %70 = load %struct.dent*, %struct.dent** %6, align 8
  %71 = icmp ne %struct.dent* %70, null
  br i1 %71, label %72, label %77

; <label>:72:                                     ; preds = %65
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 3)
  %73 = add i64 %pgocount6, 1
  store i64 %73, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 3)
  %74 = load %struct.dent*, %struct.dent** %5, align 8
  %75 = load %struct.dent*, %struct.dent** %6, align 8
  %76 = getelementptr inbounds %struct.dent, %struct.dent* %75, i32 0, i32 0
  store %struct.dent* %74, %struct.dent** %76, align 8
  br label %77

; <label>:77:                                     ; preds = %72, %65
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 1)
  %78 = add i64 %pgocount7, 1
  store i64 %78, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_tinsert, i64 0, i64 1)
  %79 = load %struct.dent*, %struct.dent** %5, align 8
  %80 = getelementptr inbounds %struct.dent, %struct.dent* %79, i32 0, i32 0
  store %struct.dent* null, %struct.dent** %80, align 8
  %81 = load %struct.dent*, %struct.dent** %5, align 8
  ret %struct.dent* %81
}

; Function Attrs: nounwind
declare void @free(i8*) #1

declare i32 @makedent(i8*, i32, %struct.dent*) #2

declare i32 @strtoichar(i8*, i8*, i32, i32) #2

declare void @upcase(i8*) #2

declare %struct.dent* @lookup(i8*, i32) #2

declare i32 @combinecaps(%struct.dent*, %struct.dent*) #2

declare i32 @addvheader(%struct.dent*) #2

; Function Attrs: noinline nounwind uwtable
define %struct.dent* @treelookup(i8*) #0 {
  %2 = alloca %struct.dent*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.dent*, align 8
  %6 = alloca [120 x i8], align 16
  store i8* %0, i8** %3, align 8
  %7 = load i32, i32* @pershsize, align 4
  %8 = icmp sle i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 3)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 3)
  store %struct.dent* null, %struct.dent** %2, align 8
  br label %78

; <label>:11:                                     ; preds = %1
  %12 = getelementptr inbounds [120 x i8], [120 x i8]* %6, i32 0, i32 0
  %13 = load i8*, i8** %3, align 8
  %14 = call i32 @ichartostr(i8* %12, i8* %13, i32 120, i32 1)
  %15 = load i8*, i8** %3, align 8
  %16 = load i32, i32* @pershsize, align 4
  %17 = call i32 @hash(i8* %15, i32 %16)
  store i32 %17, i32* %4, align 4
  %18 = load %struct.dent*, %struct.dent** @pershtab, align 8
  %19 = load i32, i32* %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.dent, %struct.dent* %18, i64 %20
  store %struct.dent* %21, %struct.dent** %5, align 8
  br label %22

; <label>:22:                                     ; preds = %57, %11
  %23 = load %struct.dent*, %struct.dent** %5, align 8
  %24 = icmp ne %struct.dent* %23, null
  br i1 %24, label %25, label %33

; <label>:25:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 2)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 2)
  %27 = load %struct.dent*, %struct.dent** %5, align 8
  %28 = getelementptr inbounds %struct.dent, %struct.dent* %27, i32 0, i32 2
  %29 = getelementptr inbounds [1 x i64], [1 x i64]* %28, i64 0, i64 0
  %30 = load i64, i64* %29, align 8
  %31 = and i64 %30, 67108864
  %32 = icmp ne i64 %31, 0
  br label %33

; <label>:33:                                     ; preds = %25, %22
  %34 = phi i1 [ false, %22 ], [ %32, %25 ]
  br i1 %34, label %35, label %62

; <label>:35:                                     ; preds = %33
  %36 = getelementptr inbounds [120 x i8], [120 x i8]* %6, i32 0, i32 0
  %37 = load %struct.dent*, %struct.dent** %5, align 8
  %38 = getelementptr inbounds %struct.dent, %struct.dent* %37, i32 0, i32 1
  %39 = load i8*, i8** %38, align 8
  %40 = call i32 @strcmp(i8* %36, i8* %39) #8
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 6)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 6)
  br label %62

; <label>:44:                                     ; preds = %35
  br label %45

; <label>:45:                                     ; preds = %52, %44
  %46 = load %struct.dent*, %struct.dent** %5, align 8
  %47 = getelementptr inbounds %struct.dent, %struct.dent* %46, i32 0, i32 2
  %48 = getelementptr inbounds [1 x i64], [1 x i64]* %47, i64 0, i64 0
  %49 = load i64, i64* %48, align 8
  %50 = and i64 %49, 1073741824
  %51 = icmp ne i64 %50, 0
  br i1 %51, label %52, label %57

; <label>:52:                                     ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 0)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 0)
  %54 = load %struct.dent*, %struct.dent** %5, align 8
  %55 = getelementptr inbounds %struct.dent, %struct.dent* %54, i32 0, i32 0
  %56 = load %struct.dent*, %struct.dent** %55, align 8
  store %struct.dent* %56, %struct.dent** %5, align 8
  br label %45

; <label>:57:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 1)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 1)
  %59 = load %struct.dent*, %struct.dent** %5, align 8
  %60 = getelementptr inbounds %struct.dent, %struct.dent* %59, i32 0, i32 0
  %61 = load %struct.dent*, %struct.dent** %60, align 8
  store %struct.dent* %61, %struct.dent** %5, align 8
  br label %22

; <label>:62:                                     ; preds = %42, %33
  %63 = load %struct.dent*, %struct.dent** %5, align 8
  %64 = icmp ne %struct.dent* %63, null
  br i1 %64, label %65, label %76

; <label>:65:                                     ; preds = %62
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 5)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 5)
  %67 = load %struct.dent*, %struct.dent** %5, align 8
  %68 = getelementptr inbounds %struct.dent, %struct.dent* %67, i32 0, i32 2
  %69 = getelementptr inbounds [1 x i64], [1 x i64]* %68, i64 0, i64 0
  %70 = load i64, i64* %69, align 8
  %71 = and i64 %70, 67108864
  %72 = icmp ne i64 %71, 0
  br i1 %72, label %73, label %76

; <label>:73:                                     ; preds = %65
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 7)
  %74 = add i64 %pgocount6, 1
  store i64 %74, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 7)
  %75 = load %struct.dent*, %struct.dent** %5, align 8
  store %struct.dent* %75, %struct.dent** %2, align 8
  br label %78

; <label>:76:                                     ; preds = %65, %62
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 4)
  %77 = add i64 %pgocount7, 1
  store i64 %77, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_treelookup, i64 0, i64 4)
  store %struct.dent* null, %struct.dent** %2, align 8
  br label %78

; <label>:78:                                     ; preds = %76, %73, %9
  %79 = load %struct.dent*, %struct.dent** %2, align 8
  ret %struct.dent* %79
}

declare i32 @ichartostr(i8*, i8*, i32, i32) #2

declare i32 @hash(i8*, i32) #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define void @treeoutput() #0 {
  %1 = alloca %struct.dent*, align 8
  %2 = alloca %struct.dent*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.dent**, align 8
  %5 = alloca %struct.dent**, align 8
  %6 = alloca %struct.dent*, align 8
  %7 = load i32, i32* @newwords, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 25)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 25)
  br label %337

; <label>:11:                                     ; preds = %0
  %12 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i32 0, i32 0))
  store %struct._IO_FILE* %12, %struct._IO_FILE** @dictf, align 8
  %13 = icmp eq %struct._IO_FILE* %12, null
  br i1 %13, label %14, label %23

; <label>:14:                                     ; preds = %11
  %15 = load i32, i32* @cbench_print, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %21

; <label>:17:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 29)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 29)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @personaldict, i32 0, i32 0))
  br label %21

; <label>:21:                                     ; preds = %17, %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 26)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 26)
  br label %337

; <label>:23:                                     ; preds = %11
  store i32 0, i32* %3, align 4
  %24 = load i32, i32* @hcount, align 4
  %25 = icmp sge i32 %24, 1000
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %23
  %pgocount3 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 27)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 27)
  store %struct.dent** null, %struct.dent*** %4, align 8
  br label %126

; <label>:28:                                     ; preds = %23
  %29 = load %struct.dent*, %struct.dent** @pershtab, align 8
  store %struct.dent* %29, %struct.dent** %1, align 8
  %30 = load %struct.dent*, %struct.dent** @pershtab, align 8
  %31 = load i32, i32* @pershsize, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.dent, %struct.dent* %30, i64 %32
  store %struct.dent* %33, %struct.dent** %6, align 8
  br label %34

; <label>:34:                                     ; preds = %74, %28
  %35 = load %struct.dent*, %struct.dent** %1, align 8
  %36 = load %struct.dent*, %struct.dent** %6, align 8
  %37 = icmp ult %struct.dent* %35, %36
  br i1 %37, label %38, label %78

; <label>:38:                                     ; preds = %34
  %39 = load %struct.dent*, %struct.dent** %1, align 8
  store %struct.dent* %39, %struct.dent** %2, align 8
  br label %40

; <label>:40:                                     ; preds = %68, %38
  %41 = load %struct.dent*, %struct.dent** %2, align 8
  %42 = icmp ne %struct.dent* %41, null
  br i1 %42, label %43, label %73

; <label>:43:                                     ; preds = %40
  %44 = load %struct.dent*, %struct.dent** %2, align 8
  %45 = getelementptr inbounds %struct.dent, %struct.dent* %44, i32 0, i32 2
  %46 = getelementptr inbounds [1 x i64], [1 x i64]* %45, i64 0, i64 0
  %47 = load i64, i64* %46, align 8
  %48 = and i64 %47, 201326592
  %49 = icmp eq i64 %48, 201326592
  br i1 %49, label %50, label %54

; <label>:50:                                     ; preds = %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 7)
  %51 = add i64 %pgocount4, 1
  store i64 %51, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 7)
  %52 = load i32, i32* %3, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %3, align 4
  br label %54

; <label>:54:                                     ; preds = %50, %43
  br label %55

; <label>:55:                                     ; preds = %62, %54
  %56 = load %struct.dent*, %struct.dent** %2, align 8
  %57 = getelementptr inbounds %struct.dent, %struct.dent* %56, i32 0, i32 2
  %58 = getelementptr inbounds [1 x i64], [1 x i64]* %57, i64 0, i64 0
  %59 = load i64, i64* %58, align 8
  %60 = and i64 %59, 1073741824
  %61 = icmp ne i64 %60, 0
  br i1 %61, label %62, label %67

; <label>:62:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 0)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 0)
  %64 = load %struct.dent*, %struct.dent** %2, align 8
  %65 = getelementptr inbounds %struct.dent, %struct.dent* %64, i32 0, i32 0
  %66 = load %struct.dent*, %struct.dent** %65, align 8
  store %struct.dent* %66, %struct.dent** %2, align 8
  br label %55

; <label>:67:                                     ; preds = %55
  br label %68

; <label>:68:                                     ; preds = %67
  %pgocount6 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 4)
  %69 = add i64 %pgocount6, 1
  store i64 %69, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 4)
  %70 = load %struct.dent*, %struct.dent** %2, align 8
  %71 = getelementptr inbounds %struct.dent, %struct.dent* %70, i32 0, i32 0
  %72 = load %struct.dent*, %struct.dent** %71, align 8
  store %struct.dent* %72, %struct.dent** %2, align 8
  br label %40

; <label>:73:                                     ; preds = %40
  br label %74

; <label>:74:                                     ; preds = %73
  %pgocount7 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 12)
  %75 = add i64 %pgocount7, 1
  store i64 %75, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 12)
  %76 = load %struct.dent*, %struct.dent** %1, align 8
  %77 = getelementptr inbounds %struct.dent, %struct.dent* %76, i32 1
  store %struct.dent* %77, %struct.dent** %1, align 8
  br label %34

; <label>:78:                                     ; preds = %34
  %79 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  store %struct.dent* %79, %struct.dent** %1, align 8
  %80 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  %81 = load i32, i32* @hashsize, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds %struct.dent, %struct.dent* %80, i64 %82
  store %struct.dent* %83, %struct.dent** %6, align 8
  br label %84

; <label>:84:                                     ; preds = %115, %78
  %85 = load %struct.dent*, %struct.dent** %1, align 8
  %86 = load %struct.dent*, %struct.dent** %6, align 8
  %87 = icmp ult %struct.dent* %85, %86
  br i1 %87, label %88, label %119

; <label>:88:                                     ; preds = %84
  %89 = load %struct.dent*, %struct.dent** %1, align 8
  %90 = getelementptr inbounds %struct.dent, %struct.dent* %89, i32 0, i32 2
  %91 = getelementptr inbounds [1 x i64], [1 x i64]* %90, i64 0, i64 0
  %92 = load i64, i64* %91, align 8
  %93 = and i64 %92, 201326592
  %94 = icmp eq i64 %93, 201326592
  br i1 %94, label %95, label %114

; <label>:95:                                     ; preds = %88
  %96 = load %struct.dent*, %struct.dent** %1, align 8
  %97 = getelementptr inbounds %struct.dent, %struct.dent* %96, i32 0, i32 2
  %98 = getelementptr inbounds [1 x i64], [1 x i64]* %97, i64 0, i64 0
  %99 = load i64, i64* %98, align 8
  %100 = and i64 %99, 805306368
  %101 = icmp ne i64 %100, 805306368
  br i1 %101, label %102, label %112

; <label>:102:                                    ; preds = %95
  %pgocount8 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 20)
  %103 = add i64 %pgocount8, 1
  store i64 %103, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 20)
  %104 = load %struct.dent*, %struct.dent** %1, align 8
  %105 = getelementptr inbounds %struct.dent, %struct.dent* %104, i32 0, i32 1
  %106 = load i8*, i8** %105, align 8
  %107 = icmp ne i8* %106, null
  br i1 %107, label %108, label %112

; <label>:108:                                    ; preds = %102
  %pgocount9 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 23)
  %109 = add i64 %pgocount9, 1
  store i64 %109, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 23)
  %110 = load i32, i32* %3, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %3, align 4
  br label %112

; <label>:112:                                    ; preds = %108, %102, %95
  %pgocount10 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 17)
  %113 = add i64 %pgocount10, 1
  store i64 %113, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 17)
  br label %114

; <label>:114:                                    ; preds = %112, %88
  br label %115

; <label>:115:                                    ; preds = %114
  %pgocount11 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 13)
  %116 = add i64 %pgocount11, 1
  store i64 %116, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 13)
  %117 = load %struct.dent*, %struct.dent** %1, align 8
  %118 = getelementptr inbounds %struct.dent, %struct.dent* %117, i32 1
  store %struct.dent* %118, %struct.dent** %1, align 8
  br label %84

; <label>:119:                                    ; preds = %84
  %pgocount12 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 28)
  %120 = add i64 %pgocount12, 1
  store i64 %120, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 28)
  %121 = load i32, i32* %3, align 4
  %122 = sext i32 %121 to i64
  %123 = mul i64 %122, 24
  %124 = call noalias i8* @malloc(i64 %123) #7
  %125 = bitcast i8* %124 to %struct.dent**
  store %struct.dent** %125, %struct.dent*** %4, align 8
  br label %126

; <label>:126:                                    ; preds = %119, %26
  %127 = load %struct.dent**, %struct.dent*** %4, align 8
  %128 = icmp eq %struct.dent** %127, null
  br i1 %128, label %129, label %222

; <label>:129:                                    ; preds = %126
  %pgocount13 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 30)
  %130 = add i64 %pgocount13, 1
  store i64 %130, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 30)
  %131 = load %struct.dent*, %struct.dent** @pershtab, align 8
  store %struct.dent* %131, %struct.dent** %1, align 8
  %132 = load %struct.dent*, %struct.dent** @pershtab, align 8
  %133 = load i32, i32* @pershsize, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds %struct.dent, %struct.dent* %132, i64 %134
  store %struct.dent* %135, %struct.dent** %6, align 8
  br label %136

; <label>:136:                                    ; preds = %176, %129
  %137 = load %struct.dent*, %struct.dent** %1, align 8
  %138 = load %struct.dent*, %struct.dent** %6, align 8
  %139 = icmp ult %struct.dent* %137, %138
  br i1 %139, label %140, label %180

; <label>:140:                                    ; preds = %136
  %141 = load %struct.dent*, %struct.dent** %1, align 8
  store %struct.dent* %141, %struct.dent** %2, align 8
  br label %142

; <label>:142:                                    ; preds = %170, %140
  %143 = load %struct.dent*, %struct.dent** %2, align 8
  %144 = icmp ne %struct.dent* %143, null
  br i1 %144, label %145, label %175

; <label>:145:                                    ; preds = %142
  %146 = load %struct.dent*, %struct.dent** %2, align 8
  %147 = getelementptr inbounds %struct.dent, %struct.dent* %146, i32 0, i32 2
  %148 = getelementptr inbounds [1 x i64], [1 x i64]* %147, i64 0, i64 0
  %149 = load i64, i64* %148, align 8
  %150 = and i64 %149, 201326592
  %151 = icmp eq i64 %150, 201326592
  br i1 %151, label %152, label %169

; <label>:152:                                    ; preds = %145
  %153 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %154 = load %struct.dent*, %struct.dent** %2, align 8
  call void @toutent(%struct._IO_FILE* %153, %struct.dent* %154, i32 1)
  br label %155

; <label>:155:                                    ; preds = %162, %152
  %156 = load %struct.dent*, %struct.dent** %2, align 8
  %157 = getelementptr inbounds %struct.dent, %struct.dent* %156, i32 0, i32 2
  %158 = getelementptr inbounds [1 x i64], [1 x i64]* %157, i64 0, i64 0
  %159 = load i64, i64* %158, align 8
  %160 = and i64 %159, 1073741824
  %161 = icmp ne i64 %160, 0
  br i1 %161, label %162, label %167

; <label>:162:                                    ; preds = %155
  %pgocount14 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 2)
  %163 = add i64 %pgocount14, 1
  store i64 %163, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 2)
  %164 = load %struct.dent*, %struct.dent** %2, align 8
  %165 = getelementptr inbounds %struct.dent, %struct.dent* %164, i32 0, i32 0
  %166 = load %struct.dent*, %struct.dent** %165, align 8
  store %struct.dent* %166, %struct.dent** %2, align 8
  br label %155

; <label>:167:                                    ; preds = %155
  %pgocount15 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 8)
  %168 = add i64 %pgocount15, 1
  store i64 %168, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 8)
  br label %169

; <label>:169:                                    ; preds = %167, %145
  br label %170

; <label>:170:                                    ; preds = %169
  %pgocount16 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 5)
  %171 = add i64 %pgocount16, 1
  store i64 %171, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 5)
  %172 = load %struct.dent*, %struct.dent** %2, align 8
  %173 = getelementptr inbounds %struct.dent, %struct.dent* %172, i32 0, i32 0
  %174 = load %struct.dent*, %struct.dent** %173, align 8
  store %struct.dent* %174, %struct.dent** %2, align 8
  br label %142

; <label>:175:                                    ; preds = %142
  br label %176

; <label>:176:                                    ; preds = %175
  %pgocount17 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 14)
  %177 = add i64 %pgocount17, 1
  store i64 %177, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 14)
  %178 = load %struct.dent*, %struct.dent** %1, align 8
  %179 = getelementptr inbounds %struct.dent, %struct.dent* %178, i32 1
  store %struct.dent* %179, %struct.dent** %1, align 8
  br label %136

; <label>:180:                                    ; preds = %136
  %181 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  store %struct.dent* %181, %struct.dent** %1, align 8
  %182 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  %183 = load i32, i32* @hashsize, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds %struct.dent, %struct.dent* %182, i64 %184
  store %struct.dent* %185, %struct.dent** %6, align 8
  br label %186

; <label>:186:                                    ; preds = %217, %180
  %187 = load %struct.dent*, %struct.dent** %1, align 8
  %188 = load %struct.dent*, %struct.dent** %6, align 8
  %189 = icmp ult %struct.dent* %187, %188
  br i1 %189, label %190, label %221

; <label>:190:                                    ; preds = %186
  %191 = load %struct.dent*, %struct.dent** %1, align 8
  %192 = getelementptr inbounds %struct.dent, %struct.dent* %191, i32 0, i32 2
  %193 = getelementptr inbounds [1 x i64], [1 x i64]* %192, i64 0, i64 0
  %194 = load i64, i64* %193, align 8
  %195 = and i64 %194, 201326592
  %196 = icmp eq i64 %195, 201326592
  br i1 %196, label %197, label %216

; <label>:197:                                    ; preds = %190
  %198 = load %struct.dent*, %struct.dent** %1, align 8
  %199 = getelementptr inbounds %struct.dent, %struct.dent* %198, i32 0, i32 2
  %200 = getelementptr inbounds [1 x i64], [1 x i64]* %199, i64 0, i64 0
  %201 = load i64, i64* %200, align 8
  %202 = and i64 %201, 805306368
  %203 = icmp ne i64 %202, 805306368
  br i1 %203, label %204, label %214

; <label>:204:                                    ; preds = %197
  %pgocount18 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 22)
  %205 = add i64 %pgocount18, 1
  store i64 %205, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 22)
  %206 = load %struct.dent*, %struct.dent** %1, align 8
  %207 = getelementptr inbounds %struct.dent, %struct.dent* %206, i32 0, i32 1
  %208 = load i8*, i8** %207, align 8
  %209 = icmp ne i8* %208, null
  br i1 %209, label %210, label %214

; <label>:210:                                    ; preds = %204
  %pgocount19 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 24)
  %211 = add i64 %pgocount19, 1
  store i64 %211, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 24)
  %212 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %213 = load %struct.dent*, %struct.dent** %1, align 8
  call void @toutent(%struct._IO_FILE* %212, %struct.dent* %213, i32 1)
  br label %214

; <label>:214:                                    ; preds = %210, %204, %197
  %pgocount20 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 18)
  %215 = add i64 %pgocount20, 1
  store i64 %215, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 18)
  br label %216

; <label>:216:                                    ; preds = %214, %190
  br label %217

; <label>:217:                                    ; preds = %216
  %pgocount21 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 15)
  %218 = add i64 %pgocount21, 1
  store i64 %218, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 15)
  %219 = load %struct.dent*, %struct.dent** %1, align 8
  %220 = getelementptr inbounds %struct.dent, %struct.dent* %219, i32 1
  store %struct.dent* %220, %struct.dent** %1, align 8
  br label %186

; <label>:221:                                    ; preds = %186
  br label %337

; <label>:222:                                    ; preds = %126
  %223 = load %struct.dent**, %struct.dent*** %4, align 8
  store %struct.dent** %223, %struct.dent*** %5, align 8
  %224 = load %struct.dent*, %struct.dent** @pershtab, align 8
  store %struct.dent* %224, %struct.dent** %1, align 8
  %225 = load %struct.dent*, %struct.dent** @pershtab, align 8
  %226 = load i32, i32* @pershsize, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds %struct.dent, %struct.dent* %225, i64 %227
  store %struct.dent* %228, %struct.dent** %6, align 8
  br label %229

; <label>:229:                                    ; preds = %271, %222
  %230 = load %struct.dent*, %struct.dent** %1, align 8
  %231 = load %struct.dent*, %struct.dent** %6, align 8
  %232 = icmp ult %struct.dent* %230, %231
  br i1 %232, label %233, label %274

; <label>:233:                                    ; preds = %229
  %pgocount22 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 9)
  %234 = add i64 %pgocount22, 1
  store i64 %234, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 9)
  %235 = load %struct.dent*, %struct.dent** %1, align 8
  store %struct.dent* %235, %struct.dent** %2, align 8
  br label %236

; <label>:236:                                    ; preds = %266, %233
  %237 = load %struct.dent*, %struct.dent** %2, align 8
  %238 = icmp ne %struct.dent* %237, null
  br i1 %238, label %239, label %270

; <label>:239:                                    ; preds = %236
  %pgocount23 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 3)
  %240 = add i64 %pgocount23, 1
  store i64 %240, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 3)
  %241 = load %struct.dent*, %struct.dent** %2, align 8
  %242 = getelementptr inbounds %struct.dent, %struct.dent* %241, i32 0, i32 2
  %243 = getelementptr inbounds [1 x i64], [1 x i64]* %242, i64 0, i64 0
  %244 = load i64, i64* %243, align 8
  %245 = and i64 %244, 201326592
  %246 = icmp eq i64 %245, 201326592
  br i1 %246, label %247, label %265

; <label>:247:                                    ; preds = %239
  %248 = load %struct.dent*, %struct.dent** %2, align 8
  %249 = load %struct.dent**, %struct.dent*** %5, align 8
  %250 = getelementptr inbounds %struct.dent*, %struct.dent** %249, i32 1
  store %struct.dent** %250, %struct.dent*** %5, align 8
  store %struct.dent* %248, %struct.dent** %249, align 8
  br label %251

; <label>:251:                                    ; preds = %258, %247
  %252 = load %struct.dent*, %struct.dent** %2, align 8
  %253 = getelementptr inbounds %struct.dent, %struct.dent* %252, i32 0, i32 2
  %254 = getelementptr inbounds [1 x i64], [1 x i64]* %253, i64 0, i64 0
  %255 = load i64, i64* %254, align 8
  %256 = and i64 %255, 1073741824
  %257 = icmp ne i64 %256, 0
  br i1 %257, label %258, label %263

; <label>:258:                                    ; preds = %251
  %pgocount24 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 1)
  %259 = add i64 %pgocount24, 1
  store i64 %259, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 1)
  %260 = load %struct.dent*, %struct.dent** %2, align 8
  %261 = getelementptr inbounds %struct.dent, %struct.dent* %260, i32 0, i32 0
  %262 = load %struct.dent*, %struct.dent** %261, align 8
  store %struct.dent* %262, %struct.dent** %2, align 8
  br label %251

; <label>:263:                                    ; preds = %251
  %pgocount25 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 6)
  %264 = add i64 %pgocount25, 1
  store i64 %264, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 6)
  br label %265

; <label>:265:                                    ; preds = %263, %239
  br label %266

; <label>:266:                                    ; preds = %265
  %267 = load %struct.dent*, %struct.dent** %2, align 8
  %268 = getelementptr inbounds %struct.dent, %struct.dent* %267, i32 0, i32 0
  %269 = load %struct.dent*, %struct.dent** %268, align 8
  store %struct.dent* %269, %struct.dent** %2, align 8
  br label %236

; <label>:270:                                    ; preds = %236
  br label %271

; <label>:271:                                    ; preds = %270
  %272 = load %struct.dent*, %struct.dent** %1, align 8
  %273 = getelementptr inbounds %struct.dent, %struct.dent* %272, i32 1
  store %struct.dent* %273, %struct.dent** %1, align 8
  br label %229

; <label>:274:                                    ; preds = %229
  %275 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  store %struct.dent* %275, %struct.dent** %1, align 8
  %276 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  %277 = load i32, i32* @hashsize, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds %struct.dent, %struct.dent* %276, i64 %278
  store %struct.dent* %279, %struct.dent** %6, align 8
  br label %280

; <label>:280:                                    ; preds = %313, %274
  %281 = load %struct.dent*, %struct.dent** %1, align 8
  %282 = load %struct.dent*, %struct.dent** %6, align 8
  %283 = icmp ult %struct.dent* %281, %282
  br i1 %283, label %284, label %316

; <label>:284:                                    ; preds = %280
  %pgocount26 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 10)
  %285 = add i64 %pgocount26, 1
  store i64 %285, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 10)
  %286 = load %struct.dent*, %struct.dent** %1, align 8
  %287 = getelementptr inbounds %struct.dent, %struct.dent* %286, i32 0, i32 2
  %288 = getelementptr inbounds [1 x i64], [1 x i64]* %287, i64 0, i64 0
  %289 = load i64, i64* %288, align 8
  %290 = and i64 %289, 201326592
  %291 = icmp eq i64 %290, 201326592
  br i1 %291, label %292, label %312

; <label>:292:                                    ; preds = %284
  %293 = load %struct.dent*, %struct.dent** %1, align 8
  %294 = getelementptr inbounds %struct.dent, %struct.dent* %293, i32 0, i32 2
  %295 = getelementptr inbounds [1 x i64], [1 x i64]* %294, i64 0, i64 0
  %296 = load i64, i64* %295, align 8
  %297 = and i64 %296, 805306368
  %298 = icmp ne i64 %297, 805306368
  br i1 %298, label %299, label %310

; <label>:299:                                    ; preds = %292
  %pgocount27 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 19)
  %300 = add i64 %pgocount27, 1
  store i64 %300, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 19)
  %301 = load %struct.dent*, %struct.dent** %1, align 8
  %302 = getelementptr inbounds %struct.dent, %struct.dent* %301, i32 0, i32 1
  %303 = load i8*, i8** %302, align 8
  %304 = icmp ne i8* %303, null
  br i1 %304, label %305, label %310

; <label>:305:                                    ; preds = %299
  %pgocount28 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 21)
  %306 = add i64 %pgocount28, 1
  store i64 %306, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 21)
  %307 = load %struct.dent*, %struct.dent** %1, align 8
  %308 = load %struct.dent**, %struct.dent*** %5, align 8
  %309 = getelementptr inbounds %struct.dent*, %struct.dent** %308, i32 1
  store %struct.dent** %309, %struct.dent*** %5, align 8
  store %struct.dent* %307, %struct.dent** %308, align 8
  br label %310

; <label>:310:                                    ; preds = %305, %299, %292
  %pgocount29 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 16)
  %311 = add i64 %pgocount29, 1
  store i64 %311, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 16)
  br label %312

; <label>:312:                                    ; preds = %310, %284
  br label %313

; <label>:313:                                    ; preds = %312
  %314 = load %struct.dent*, %struct.dent** %1, align 8
  %315 = getelementptr inbounds %struct.dent, %struct.dent* %314, i32 1
  store %struct.dent* %315, %struct.dent** %1, align 8
  br label %280

; <label>:316:                                    ; preds = %280
  %317 = load %struct.dent**, %struct.dent*** %4, align 8
  %318 = bitcast %struct.dent** %317 to i8*
  %319 = load i32, i32* %3, align 4
  %320 = zext i32 %319 to i64
  call void @qsort(i8* %318, i64 %320, i64 8, i32 (i8*, i8*)* bitcast (i32 (%struct.dent**, %struct.dent**)* @pdictcmp to i32 (i8*, i8*)*))
  %321 = load %struct.dent**, %struct.dent*** %4, align 8
  store %struct.dent** %321, %struct.dent*** %5, align 8
  br label %322

; <label>:322:                                    ; preds = %326, %316
  %323 = load i32, i32* %3, align 4
  %324 = add nsw i32 %323, -1
  store i32 %324, i32* %3, align 4
  %325 = icmp sge i32 %324, 0
  br i1 %325, label %326, label %332

; <label>:326:                                    ; preds = %322
  %pgocount30 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 11)
  %327 = add i64 %pgocount30, 1
  store i64 %327, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_treeoutput, i64 0, i64 11)
  %328 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %329 = load %struct.dent**, %struct.dent*** %5, align 8
  %330 = getelementptr inbounds %struct.dent*, %struct.dent** %329, i32 1
  store %struct.dent** %330, %struct.dent*** %5, align 8
  %331 = load %struct.dent*, %struct.dent** %329, align 8
  call void @toutent(%struct._IO_FILE* %328, %struct.dent* %331, i32 1)
  br label %322

; <label>:332:                                    ; preds = %322
  %333 = load %struct.dent**, %struct.dent*** %4, align 8
  %334 = bitcast %struct.dent** %333 to i8*
  call void @free(i8* %334) #7
  store i32 0, i32* @newwords, align 4
  %335 = load %struct._IO_FILE*, %struct._IO_FILE** @dictf, align 8
  %336 = call i32 @fclose(%struct._IO_FILE* %335)
  br label %337

; <label>:337:                                    ; preds = %332, %221, %21, %9
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare void @toutent(%struct._IO_FILE*, %struct.dent*, i32) #2

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @pdictcmp(%struct.dent**, %struct.dent**) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_pdictcmp, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_pdictcmp, i64 0, i64 0)
  %4 = alloca %struct.dent**, align 8
  %5 = alloca %struct.dent**, align 8
  store %struct.dent** %0, %struct.dent*** %4, align 8
  store %struct.dent** %1, %struct.dent*** %5, align 8
  %6 = load %struct.dent**, %struct.dent*** %4, align 8
  %7 = load %struct.dent*, %struct.dent** %6, align 8
  %8 = getelementptr inbounds %struct.dent, %struct.dent* %7, i32 0, i32 1
  %9 = load i8*, i8** %8, align 8
  %10 = load %struct.dent**, %struct.dent*** %5, align 8
  %11 = load %struct.dent*, %struct.dent** %10, align 8
  %12 = getelementptr inbounds %struct.dent, %struct.dent* %11, i32 0, i32 1
  %13 = load i8*, i8** %12, align 8
  %14 = call i32 @casecmp(i8* %9, i8* %13, i32 1)
  ret i32 %14
}

; Function Attrs: noinline nounwind uwtable
define i8* @mymalloc(i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mymalloc, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mymalloc, i64 0, i64 0)
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = zext i32 %4 to i64
  %6 = call noalias i8* @malloc(i64 %5) #7
  ret i8* %6
}

; Function Attrs: noinline nounwind uwtable
define void @myfree(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** @hashstrings, align 8
  %4 = icmp ne i8* %3, null
  br i1 %4, label %5, label %20

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_myfree, i64 0, i64 1)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_myfree, i64 0, i64 1)
  %7 = load i8*, i8** %2, align 8
  %8 = load i8*, i8** @hashstrings, align 8
  %9 = icmp uge i8* %7, %8
  br i1 %9, label %10, label %20

; <label>:10:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_myfree, i64 0, i64 2)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_myfree, i64 0, i64 2)
  %12 = load i8*, i8** %2, align 8
  %13 = load i8*, i8** @hashstrings, align 8
  %14 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 6), align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, i8* %13, i64 %15
  %17 = icmp ule i8* %12, %16
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_myfree, i64 0, i64 3)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_myfree, i64 0, i64 3)
  br label %23

; <label>:20:                                     ; preds = %10, %5, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_myfree, i64 0, i64 0)
  %21 = add i64 %pgocount3, 1
  store i64 %21, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_myfree, i64 0, i64 0)
  %22 = load i8*, i8** %2, align 8
  call void @free(i8* %22) #7
  br label %23

; <label>:23:                                     ; preds = %20, %18
  ret void
}

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #6

declare i32 @casecmp(i8*, i8*, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #7

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { nounwind readnone }
attributes #10 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
