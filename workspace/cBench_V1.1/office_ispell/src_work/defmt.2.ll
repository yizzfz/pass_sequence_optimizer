; ModuleID = 'tmp1.ll'
source_filename = "defmt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashheader = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i8], [13 x i8], i8, i8, i8, [228 x i16], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [128 x i8], [100 x [11 x i8]], [100 x i32], [100 x i32], i16 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.success = type { %struct.dent*, %struct.flagent*, %struct.flagent* }
%struct.dent = type { %struct.dent*, i8*, [1 x i64] }
%struct.flagent = type { i8*, i8*, i16, i16, i16, i16, i16, [228 x i8] }

$__llvm_profile_raw_version = comdat any

@TeX_comment = internal global i32 0, align 4
@save_math_mode = internal global i32 0, align 4
@math_mode = external global i32, align 4
@save_LaTeX_Mode = internal global i8 0, align 1
@LaTeX_Mode = external global i8, align 1
@hashheader = external global %struct.hashheader, align 4
@contextbufs = external global [10 x [8192 x i8]], align 16
@currentchar = external global i8*, align 8
@tflag = external global i32, align 4
@.str = private unnamed_addr constant [5 x i8] c"if t\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"if n\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"ds \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"de \00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"nr \00", align 1
@lflag = external global i32, align 4
@aflag = external global i32, align 4
@ctoken = external global [120 x i8], align 16
@itoken = external global [120 x i8], align 16
@cbench_print = external global i32, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [51 x i8] c"\0D\0AWord '%s' too long at line %d of %s, truncated\0D\0A\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"defmt.c\00", align 1
@minword = external global i32, align 4
@cflag = external global i32, align 4
@.str.7 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@terse = external global i32, align 4
@.str.8 = private unnamed_addr constant [3 x i8] c"*\0A\00", align 1
@hits = external global [10 x %struct.success], align 16
@.str.9 = private unnamed_addr constant [6 x i8] c"+ %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"-\0A\00", align 1
@pcount = external global i32, align 4
@.str.11 = private unnamed_addr constant [12 x i8] c"%c %s %d %d\00", align 1
@easypossibilities = external global i32, align 4
@contextoffset = external global i32, align 4
@possibilities = external global [100 x [120 x i8]], align 16
@.str.12 = private unnamed_addr constant [6 x i8] c"%c %s\00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"# %s %d\0A\00", align 1
@quit = external global i32, align 4
@.str.15 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.16 = private unnamed_addr constant [38 x i8] c"****ERROR in parsing TeX math mode!\0D\0A\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"\5Cend\00", align 1
@.str.18 = private unnamed_addr constant [9 x i8] c"equation\00", align 1
@.str.19 = private unnamed_addr constant [9 x i8] c"eqnarray\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c"displaymath\00", align 1
@.str.21 = private unnamed_addr constant [8 x i8] c"picture\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c"math\00", align 1
@.str.23 = private unnamed_addr constant [8 x i8] c"tabular\00", align 1
@.str.24 = private unnamed_addr constant [9 x i8] c"minipage\00", align 1
@.str.25 = private unnamed_addr constant [9 x i8] c"tabular*\00", align 1
@.str.26 = private unnamed_addr constant [37 x i8] c"***ERROR in LR to math-mode switch.\0A\00", align 1
@.str.27 = private unnamed_addr constant [4 x i8] c"end\00", align 1
@.str.28 = private unnamed_addr constant [5 x i8] c"mbox\00", align 1
@.str.29 = private unnamed_addr constant [8 x i8] c"makebox\00", align 1
@.str.30 = private unnamed_addr constant [5 x i8] c"fbox\00", align 1
@.str.31 = private unnamed_addr constant [9 x i8] c"framebox\00", align 1
@.str.32 = private unnamed_addr constant [7 x i8] c"parbox\00", align 1
@.str.33 = private unnamed_addr constant [9 x i8] c"raisebox\00", align 1
@.str.34 = private unnamed_addr constant [6 x i8] c"begin\00", align 1
@.str.35 = private unnamed_addr constant [7 x i8] c"vspace\00", align 1
@.str.36 = private unnamed_addr constant [7 x i8] c"hspace\00", align 1
@.str.37 = private unnamed_addr constant [5 x i8] c"cite\00", align 1
@.str.38 = private unnamed_addr constant [4 x i8] c"ref\00", align 1
@.str.39 = private unnamed_addr constant [6 x i8] c"label\00", align 1
@.str.40 = private unnamed_addr constant [6 x i8] c"input\00", align 1
@.str.41 = private unnamed_addr constant [7 x i8] c"nocite\00", align 1
@.str.42 = private unnamed_addr constant [8 x i8] c"include\00", align 1
@.str.43 = private unnamed_addr constant [12 x i8] c"includeonly\00", align 1
@.str.44 = private unnamed_addr constant [14 x i8] c"documentstyle\00", align 1
@.str.45 = private unnamed_addr constant [14 x i8] c"documentclass\00", align 1
@.str.46 = private unnamed_addr constant [11 x i8] c"usepackage\00", align 1
@.str.47 = private unnamed_addr constant [10 x i8] c"pagestyle\00", align 1
@.str.48 = private unnamed_addr constant [14 x i8] c"pagenumbering\00", align 1
@.str.49 = private unnamed_addr constant [13 x i8] c"bibliography\00", align 1
@.str.50 = private unnamed_addr constant [8 x i8] c"bibitem\00", align 1
@.str.51 = private unnamed_addr constant [12 x i8] c"hyphenation\00", align 1
@.str.52 = private unnamed_addr constant [8 x i8] c"pageref\00", align 1
@.str.53 = private unnamed_addr constant [5 x i8] c"rule\00", align 1
@.str.54 = private unnamed_addr constant [11 x i8] c"setcounter\00", align 1
@.str.55 = private unnamed_addr constant [13 x i8] c"addtocounter\00", align 1
@.str.56 = private unnamed_addr constant [10 x i8] c"setlength\00", align 1
@.str.57 = private unnamed_addr constant [12 x i8] c"addtolength\00", align 1
@.str.58 = private unnamed_addr constant [11 x i8] c"settowidth\00", align 1
@.str.59 = private unnamed_addr constant [5 x i8] c"verb\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_skipoverword = private constant [12 x i8] c"skipoverword"
@__profn_checkline = private constant [9 x i8] c"checkline"
@__profn_tmp1.ll_skiptoword = private constant [18 x i8] c"tmp1.ll:skiptoword"
@__profn_tmp1.ll_TeX_math_check = private constant [22 x i8] c"tmp1.ll:TeX_math_check"
@__profn_tmp1.ll_TeX_LR_check = private constant [20 x i8] c"tmp1.ll:TeX_LR_check"
@__profn_tmp1.ll_TeX_math_end = private constant [20 x i8] c"tmp1.ll:TeX_math_end"
@__profn_tmp1.ll_TeX_strncmp = private constant [19 x i8] c"tmp1.ll:TeX_strncmp"
@__profn_tmp1.ll_TeX_skip_parens = private constant [23 x i8] c"tmp1.ll:TeX_skip_parens"
@__profn_tmp1.ll_TeX_math_begin = private constant [22 x i8] c"tmp1.ll:TeX_math_begin"
@__profn_tmp1.ll_TeX_open_paren = private constant [22 x i8] c"tmp1.ll:TeX_open_paren"
@__profn_tmp1.ll_TeX_skip_args = private constant [21 x i8] c"tmp1.ll:TeX_skip_args"
@__profn_tmp1.ll_TeX_LR_begin = private constant [20 x i8] c"tmp1.ll:TeX_LR_begin"
@__profn_tmp1.ll_TeX_skip_check = private constant [22 x i8] c"tmp1.ll:TeX_skip_check"
@__profc_skipoverword = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_skipoverword = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1315155736944392084, i64 155795819903, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i32 0, i32 0), i8* bitcast (i8* (i8*)* @skipoverword to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_checkline = private global [70 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_checkline = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2297957801239344001, i64 144116032298973266, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*)* @checkline to i8*), i8* null, i32 70, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_skiptoword = private global [55 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_skiptoword = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8285252402072258584, i64 691567753607, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i32 0, i32 0), i8* null, i8* null, i32 55, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TeX_math_check = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TeX_math_check = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4754686078493909976, i64 97580996874, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TeX_LR_check = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TeX_LR_check = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6210945214370356382, i64 102927125736, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TeX_math_end = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TeX_math_end = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7428945677377765429, i64 120181300456, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TeX_strncmp = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TeX_strncmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 18949465236051573, i64 50911015908, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_strncmp, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TeX_skip_parens = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TeX_skip_parens = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1006488277365495836, i64 49763264094, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_skip_parens, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TeX_math_begin = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TeX_math_begin = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6117570241764252686, i64 222495421490, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i32 0, i32 0), i8* null, i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TeX_open_paren = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TeX_open_paren = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4121747849101186734, i64 49763264094, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_open_paren, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TeX_skip_args = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TeX_skip_args = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1377024363707074570, i64 111546037789, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TeX_LR_begin = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TeX_LR_begin = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5343481014272784323, i64 113915861137, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TeX_skip_check = private global [35 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TeX_skip_check = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7704709881034615177, i64 372947095253, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i32 0, i32 0), i8* null, i8* null, i32 35, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [118 x i8] c"\86\02sx\DAm\8EA\0A\850\0C\05\F1B\82[\CF\E0\EA\E3\C2]\A9\FDA\8Bm\1A\92\A2\D7W\22.j\DD\CE\1B&\91\CDS\DA\81\8F\C4\FF\C6\AD\E0\B6\E0\11\9A\1C\A9kC\E8\E5\9As\D2\F1A#L&\DA\BC\1A\B5\0B<\FC>\A0\BA\80e@2\A3\8BT\B2\EB\96!\CB\80R\07fX<\168\11\E0\AD\D7\15\CB\8B\BC?\AB\0B\AA\EA\C3'\026^\E4", section "__llvm_prf_names"
@llvm.used = appending global [14 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_skipoverword to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_checkline to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_skiptoword to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TeX_math_check to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TeX_LR_check to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TeX_math_end to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TeX_strncmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TeX_skip_parens to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TeX_math_begin to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TeX_open_paren to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TeX_skip_args to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TeX_LR_begin to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TeX_skip_check to i8*), i8* getelementptr inbounds ([118 x i8], [118 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i8* @skipoverword(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  store i8* null, i8** %3, align 8
  br label %5

; <label>:5:                                      ; preds = %78, %1
  %6 = load i8*, i8** %2, align 8
  %7 = load i8, i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %18

; <label>:10:                                     ; preds = %5
  %11 = load i32, i32* @TeX_comment, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 6)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 6)
  %15 = load i32, i32* @save_math_mode, align 4
  store i32 %15, i32* @math_mode, align 4
  %16 = load i8, i8* @save_LaTeX_Mode, align 1
  store i8 %16, i8* @LaTeX_Mode, align 1
  store i32 0, i32* @TeX_comment, align 4
  br label %17

; <label>:17:                                     ; preds = %13, %10
  br label %79

; <label>:18:                                     ; preds = %5
  %19 = load i8*, i8** %2, align 8
  %20 = load i8, i8* %19, align 1
  %21 = zext i8 %20 to i64
  %22 = getelementptr inbounds [128 x i8], [128 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 27), i64 0, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %37

; <label>:26:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 0)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 0)
  %28 = load i8*, i8** %2, align 8
  %29 = call i32 @stringcharlen(i8* %28, i32 0)
  store i32 %29, i32* %4, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %37

; <label>:31:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 1)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 1)
  %33 = load i32, i32* %4, align 4
  %34 = load i8*, i8** %2, align 8
  %35 = sext i32 %33 to i64
  %36 = getelementptr inbounds i8, i8* %34, i64 %35
  store i8* %36, i8** %2, align 8
  store i8* null, i8** %3, align 8
  br label %77

; <label>:37:                                     ; preds = %26, %18
  %38 = load i8*, i8** %2, align 8
  %39 = load i8, i8* %38, align 1
  %40 = zext i8 %39 to i64
  %41 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 23), i64 0, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = icmp ne i8 %42, 0
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 2)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 2)
  %46 = load i8*, i8** %2, align 8
  %47 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %47, i8** %2, align 8
  store i8* null, i8** %3, align 8
  br label %76

; <label>:48:                                     ; preds = %37
  %49 = load i8*, i8** %2, align 8
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i64
  %52 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 26), i64 0, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = icmp ne i8 %53, 0
  br i1 %54, label %55, label %73

; <label>:55:                                     ; preds = %48
  %56 = load i8*, i8** %3, align 8
  %57 = icmp eq i8* %56, null
  br i1 %57, label %58, label %61

; <label>:58:                                     ; preds = %55
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 4)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 4)
  %60 = load i8*, i8** %2, align 8
  store i8* %60, i8** %3, align 8
  br label %70

; <label>:61:                                     ; preds = %55
  %62 = load i8*, i8** %3, align 8
  %63 = load i8*, i8** %2, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 -1
  %65 = icmp eq i8* %62, %64
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %61
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 9)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 9)
  br label %79

; <label>:68:                                     ; preds = %61
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 3)
  %69 = add i64 %pgocount6, 1
  store i64 %69, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 3)
  br label %70

; <label>:70:                                     ; preds = %68, %58
  %71 = load i8*, i8** %2, align 8
  %72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %72, i8** %2, align 8
  br label %75

; <label>:73:                                     ; preds = %48
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 8)
  %74 = add i64 %pgocount7, 1
  store i64 %74, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 8)
  br label %79

; <label>:75:                                     ; preds = %70
  br label %76

; <label>:76:                                     ; preds = %75, %44
  br label %77

; <label>:77:                                     ; preds = %76, %31
  br label %78

; <label>:78:                                     ; preds = %77
  br label %5

; <label>:79:                                     ; preds = %73, %66, %17
  %80 = load i8*, i8** %3, align 8
  %81 = icmp ne i8* %80, null
  br i1 %81, label %82, label %85

; <label>:82:                                     ; preds = %79
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 5)
  %83 = add i64 %pgocount8, 1
  store i64 %83, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 5)
  %84 = load i8*, i8** %3, align 8
  br label %88

; <label>:85:                                     ; preds = %79
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 7)
  %86 = add i64 %pgocount9, 1
  store i64 %86, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_skipoverword, i64 0, i64 7)
  %87 = load i8*, i8** %2, align 8
  br label %88

; <label>:88:                                     ; preds = %85, %82
  %89 = phi i8* [ %84, %82 ], [ %87, %85 ]
  ret i8* %89
}

declare i32 @stringcharlen(i8*, i32) #1

; Function Attrs: nounwind uwtable
define void @checkline(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  store i8* getelementptr inbounds ([10 x [8192 x i8]], [10 x [8192 x i8]]* @contextbufs, i64 0, i64 0, i32 0), i8** @currentchar, align 8
  %9 = call i64 @strlen(i8* getelementptr inbounds ([10 x [8192 x i8]], [10 x [8192 x i8]]* @contextbufs, i64 0, i64 0, i32 0)) #5
  %10 = sub i64 %9, 1
  %11 = trunc i64 %10 to i32
  store i32 %11, i32* %6, align 4
  %12 = load i32, i32* %6, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8192 x i8], [8192 x i8]* getelementptr inbounds ([10 x [8192 x i8]], [10 x [8192 x i8]]* @contextbufs, i64 0, i64 0), i64 0, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 10
  %18 = zext i1 %17 to i32
  store i32 %18, i32* %5, align 4
  %19 = load i32, i32* %5, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %26

; <label>:21:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 39)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 39)
  %23 = load i32, i32* %6, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8192 x i8], [8192 x i8]* getelementptr inbounds ([10 x [8192 x i8]], [10 x [8192 x i8]]* @contextbufs, i64 0, i64 0), i64 0, i64 %24
  store i8 0, i8* %25, align 1
  br label %26

; <label>:26:                                     ; preds = %21, %1
  %27 = load i32, i32* @tflag, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %213, label %29

; <label>:29:                                     ; preds = %26
  %30 = load i8*, i8** @currentchar, align 8
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 15, i64 2), align 2
  %34 = sext i8 %33 to i32
  %35 = icmp eq i32 %32, %34
  br i1 %35, label %36, label %87

; <label>:36:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 48)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 48)
  %38 = load i8*, i8** @currentchar, align 8
  %39 = getelementptr inbounds i8, i8* %38, i64 1
  %40 = call i32 @strncmp(i8* %39, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i64 4) #5
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %48, label %42

; <label>:42:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 53)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 53)
  %44 = load i8*, i8** @currentchar, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 1
  %46 = call i32 @strncmp(i8* %45, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i64 4) #5
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %87

; <label>:48:                                     ; preds = %42, %36
  call void @copyout(i8** @currentchar, i32 5)
  br label %49

; <label>:49:                                     ; preds = %83, %48
  %50 = load i8*, i8** @currentchar, align 8
  %51 = load i8, i8* %50, align 1
  %52 = sext i8 %51 to i32
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %81

; <label>:54:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 20)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 20)
  %56 = load i8*, i8** @currentchar, align 8
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %60, label %79

; <label>:60:                                     ; preds = %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 27)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 27)
  %62 = load i8*, i8** @currentchar, align 8
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i32
  %65 = icmp slt i32 %64, 128
  br i1 %65, label %66, label %79

; <label>:66:                                     ; preds = %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 37)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 37)
  %68 = call i16** @__ctype_b_loc() #6
  %69 = load i16*, i16** %68, align 8
  %70 = load i8*, i8** @currentchar, align 8
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i16, i16* %69, i64 %73
  %75 = load i16, i16* %74, align 2
  %76 = zext i16 %75 to i32
  %77 = and i32 %76, 8192
  %78 = icmp ne i32 %77, 0
  br label %79

; <label>:79:                                     ; preds = %66, %60, %54
  %80 = phi i1 [ false, %60 ], [ false, %54 ], [ %78, %66 ]
  br label %81

; <label>:81:                                     ; preds = %79, %49
  %82 = phi i1 [ false, %49 ], [ %80, %79 ]
  br i1 %82, label %83, label %85

; <label>:83:                                     ; preds = %81
  %pgocount6 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 14)
  %84 = add i64 %pgocount6, 1
  store i64 %84, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 14)
  call void @copyout(i8** @currentchar, i32 1)
  br label %49

; <label>:85:                                     ; preds = %81
  %pgocount7 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 55)
  %86 = add i64 %pgocount7, 1
  store i64 %86, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 55)
  br label %87

; <label>:87:                                     ; preds = %85, %42, %29
  %88 = load i8*, i8** @currentchar, align 8
  %89 = load i8, i8* %88, align 1
  %90 = sext i8 %89 to i32
  %91 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 15, i64 2), align 2
  %92 = sext i8 %91 to i32
  %93 = icmp eq i32 %90, %92
  br i1 %93, label %94, label %211

; <label>:94:                                     ; preds = %87
  %pgocount8 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 49)
  %95 = add i64 %pgocount8, 1
  store i64 %95, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 49)
  %96 = load i8*, i8** @currentchar, align 8
  %97 = getelementptr inbounds i8, i8* %96, i64 1
  %98 = call i32 @strncmp(i8* %97, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i64 3) #5
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %112, label %100

; <label>:100:                                    ; preds = %94
  %pgocount9 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 54)
  %101 = add i64 %pgocount9, 1
  store i64 %101, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 54)
  %102 = load i8*, i8** @currentchar, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 1
  %104 = call i32 @strncmp(i8* %103, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i64 3) #5
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %112, label %106

; <label>:106:                                    ; preds = %100
  %pgocount10 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 59)
  %107 = add i64 %pgocount10, 1
  store i64 %107, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 59)
  %108 = load i8*, i8** @currentchar, align 8
  %109 = getelementptr inbounds i8, i8* %108, i64 1
  %110 = call i32 @strncmp(i8* %109, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i64 3) #5
  %111 = icmp eq i32 %110, 0
  br i1 %111, label %112, label %211

; <label>:112:                                    ; preds = %106, %100, %94
  call void @copyout(i8** @currentchar, i32 4)
  br label %113

; <label>:113:                                    ; preds = %147, %112
  %114 = load i8*, i8** @currentchar, align 8
  %115 = load i8, i8* %114, align 1
  %116 = sext i8 %115 to i32
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %118, label %145

; <label>:118:                                    ; preds = %113
  %pgocount11 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 18)
  %119 = add i64 %pgocount11, 1
  store i64 %119, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 18)
  %120 = load i8*, i8** @currentchar, align 8
  %121 = load i8, i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = icmp sgt i32 %122, 0
  br i1 %123, label %124, label %143

; <label>:124:                                    ; preds = %118
  %pgocount12 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 23)
  %125 = add i64 %pgocount12, 1
  store i64 %125, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 23)
  %126 = load i8*, i8** @currentchar, align 8
  %127 = load i8, i8* %126, align 1
  %128 = zext i8 %127 to i32
  %129 = icmp slt i32 %128, 128
  br i1 %129, label %130, label %143

; <label>:130:                                    ; preds = %124
  %pgocount13 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 31)
  %131 = add i64 %pgocount13, 1
  store i64 %131, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 31)
  %132 = call i16** @__ctype_b_loc() #6
  %133 = load i16*, i16** %132, align 8
  %134 = load i8*, i8** @currentchar, align 8
  %135 = load i8, i8* %134, align 1
  %136 = zext i8 %135 to i32
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i16, i16* %133, i64 %137
  %139 = load i16, i16* %138, align 2
  %140 = zext i16 %139 to i32
  %141 = and i32 %140, 8192
  %142 = icmp ne i32 %141, 0
  br label %143

; <label>:143:                                    ; preds = %130, %124, %118
  %144 = phi i1 [ false, %124 ], [ false, %118 ], [ %142, %130 ]
  br label %145

; <label>:145:                                    ; preds = %143, %113
  %146 = phi i1 [ false, %113 ], [ %144, %143 ]
  br i1 %146, label %147, label %149

; <label>:147:                                    ; preds = %145
  %pgocount14 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 9)
  %148 = add i64 %pgocount14, 1
  store i64 %148, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 9)
  call void @copyout(i8** @currentchar, i32 1)
  br label %113

; <label>:149:                                    ; preds = %145
  br label %150

; <label>:150:                                    ; preds = %185, %149
  %151 = load i8*, i8** @currentchar, align 8
  %152 = load i8, i8* %151, align 1
  %153 = sext i8 %152 to i32
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %155, label %183

; <label>:155:                                    ; preds = %150
  %pgocount15 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 19)
  %156 = add i64 %pgocount15, 1
  store i64 %156, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 19)
  %157 = load i8*, i8** @currentchar, align 8
  %158 = load i8, i8* %157, align 1
  %159 = zext i8 %158 to i32
  %160 = icmp sgt i32 %159, 0
  br i1 %160, label %161, label %180

; <label>:161:                                    ; preds = %155
  %pgocount16 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 24)
  %162 = add i64 %pgocount16, 1
  store i64 %162, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 24)
  %163 = load i8*, i8** @currentchar, align 8
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  %166 = icmp slt i32 %165, 128
  br i1 %166, label %167, label %180

; <label>:167:                                    ; preds = %161
  %pgocount17 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 32)
  %168 = add i64 %pgocount17, 1
  store i64 %168, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 32)
  %169 = call i16** @__ctype_b_loc() #6
  %170 = load i16*, i16** %169, align 8
  %171 = load i8*, i8** @currentchar, align 8
  %172 = load i8, i8* %171, align 1
  %173 = zext i8 %172 to i32
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i16, i16* %170, i64 %174
  %176 = load i16, i16* %175, align 2
  %177 = zext i16 %176 to i32
  %178 = and i32 %177, 8192
  %179 = icmp ne i32 %178, 0
  br label %180

; <label>:180:                                    ; preds = %167, %161, %155
  %181 = phi i1 [ false, %161 ], [ false, %155 ], [ %179, %167 ]
  %182 = xor i1 %181, true
  br label %183

; <label>:183:                                    ; preds = %180, %150
  %184 = phi i1 [ false, %150 ], [ %182, %180 ]
  br i1 %184, label %185, label %187

; <label>:185:                                    ; preds = %183
  %pgocount18 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 10)
  %186 = add i64 %pgocount18, 1
  store i64 %186, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 10)
  call void @copyout(i8** @currentchar, i32 1)
  br label %150

; <label>:187:                                    ; preds = %183
  %188 = load i8*, i8** @currentchar, align 8
  %189 = load i8, i8* %188, align 1
  %190 = sext i8 %189 to i32
  %191 = icmp eq i32 %190, 0
  br i1 %191, label %192, label %209

; <label>:192:                                    ; preds = %187
  %193 = load i32, i32* @lflag, align 4
  %194 = icmp ne i32 %193, 0
  br i1 %194, label %207, label %195

; <label>:195:                                    ; preds = %192
  %pgocount19 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 64)
  %196 = add i64 %pgocount19, 1
  store i64 %196, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 64)
  %197 = load i32, i32* @aflag, align 4
  %198 = icmp ne i32 %197, 0
  br i1 %198, label %203, label %199

; <label>:199:                                    ; preds = %195
  %pgocount20 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 67)
  %200 = add i64 %pgocount20, 1
  store i64 %200, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 67)
  %201 = load i32, i32* %5, align 4
  %202 = icmp ne i32 %201, 0
  br i1 %202, label %203, label %207

; <label>:203:                                    ; preds = %199, %195
  %pgocount21 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 65)
  %204 = add i64 %pgocount21, 1
  store i64 %204, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 65)
  %205 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %206 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %205)
  br label %207

; <label>:207:                                    ; preds = %203, %199, %192
  %pgocount22 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 61)
  %208 = add i64 %pgocount22, 1
  store i64 %208, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 61)
  br label %547

; <label>:209:                                    ; preds = %187
  %pgocount23 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 58)
  %210 = add i64 %pgocount23, 1
  store i64 %210, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 58)
  br label %211

; <label>:211:                                    ; preds = %209, %106, %87
  %pgocount24 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 43)
  %212 = add i64 %pgocount24, 1
  store i64 %212, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 43)
  br label %213

; <label>:213:                                    ; preds = %211, %26
  %214 = load i32, i32* @tflag, align 4
  %215 = icmp ne i32 %214, 0
  br i1 %215, label %302, label %216

; <label>:216:                                    ; preds = %213
  %pgocount25 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 41)
  %217 = add i64 %pgocount25, 1
  store i64 %217, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 41)
  %218 = load i8*, i8** @currentchar, align 8
  %219 = load i8, i8* %218, align 1
  %220 = sext i8 %219 to i32
  %221 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 15, i64 2), align 2
  %222 = sext i8 %221 to i32
  %223 = icmp eq i32 %220, %222
  br i1 %223, label %224, label %302

; <label>:224:                                    ; preds = %216
  br label %225

; <label>:225:                                    ; preds = %275, %224
  %226 = load i8*, i8** @currentchar, align 8
  %227 = load i8, i8* %226, align 1
  %228 = sext i8 %227 to i32
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %230, label %258

; <label>:230:                                    ; preds = %225
  %231 = load i8*, i8** @currentchar, align 8
  %232 = load i8, i8* %231, align 1
  %233 = zext i8 %232 to i32
  %234 = icmp sgt i32 %233, 0
  br i1 %234, label %235, label %254

; <label>:235:                                    ; preds = %230
  %pgocount26 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 21)
  %236 = add i64 %pgocount26, 1
  store i64 %236, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 21)
  %237 = load i8*, i8** @currentchar, align 8
  %238 = load i8, i8* %237, align 1
  %239 = zext i8 %238 to i32
  %240 = icmp slt i32 %239, 128
  br i1 %240, label %241, label %254

; <label>:241:                                    ; preds = %235
  %pgocount27 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 30)
  %242 = add i64 %pgocount27, 1
  store i64 %242, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 30)
  %243 = call i16** @__ctype_b_loc() #6
  %244 = load i16*, i16** %243, align 8
  %245 = load i8*, i8** @currentchar, align 8
  %246 = load i8, i8* %245, align 1
  %247 = zext i8 %246 to i32
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds i16, i16* %244, i64 %248
  %250 = load i16, i16* %249, align 2
  %251 = zext i16 %250 to i32
  %252 = and i32 %251, 8192
  %253 = icmp ne i32 %252, 0
  br label %254

; <label>:254:                                    ; preds = %241, %235, %230
  %255 = phi i1 [ false, %235 ], [ false, %230 ], [ %253, %241 ]
  %pgocount28 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 13)
  %256 = add i64 %pgocount28, 1
  store i64 %256, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 13)
  %257 = xor i1 %255, true
  br label %258

; <label>:258:                                    ; preds = %254, %225
  %259 = phi i1 [ false, %225 ], [ %257, %254 ]
  br i1 %259, label %260, label %278

; <label>:260:                                    ; preds = %258
  %pgocount29 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 8)
  %261 = add i64 %pgocount29, 1
  store i64 %261, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 8)
  %262 = load i32, i32* @aflag, align 4
  %263 = icmp ne i32 %262, 0
  br i1 %263, label %275, label %264

; <label>:264:                                    ; preds = %260
  %pgocount30 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 22)
  %265 = add i64 %pgocount30, 1
  store i64 %265, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 22)
  %266 = load i32, i32* @lflag, align 4
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %275, label %268

; <label>:268:                                    ; preds = %264
  %pgocount31 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 34)
  %269 = add i64 %pgocount31, 1
  store i64 %269, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 34)
  %270 = load i8*, i8** @currentchar, align 8
  %271 = load i8, i8* %270, align 1
  %272 = sext i8 %271 to i32
  %273 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %274 = call i32 @_IO_putc(i32 %272, %struct._IO_FILE* %273)
  br label %275

; <label>:275:                                    ; preds = %268, %264, %260
  %276 = load i8*, i8** @currentchar, align 8
  %277 = getelementptr inbounds i8, i8* %276, i32 1
  store i8* %277, i8** @currentchar, align 8
  br label %225

; <label>:278:                                    ; preds = %258
  %279 = load i8*, i8** @currentchar, align 8
  %280 = load i8, i8* %279, align 1
  %281 = sext i8 %280 to i32
  %282 = icmp eq i32 %281, 0
  br i1 %282, label %283, label %300

; <label>:283:                                    ; preds = %278
  %284 = load i32, i32* @lflag, align 4
  %285 = icmp ne i32 %284, 0
  br i1 %285, label %298, label %286

; <label>:286:                                    ; preds = %283
  %pgocount32 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 62)
  %287 = add i64 %pgocount32, 1
  store i64 %287, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 62)
  %288 = load i32, i32* @aflag, align 4
  %289 = icmp ne i32 %288, 0
  br i1 %289, label %294, label %290

; <label>:290:                                    ; preds = %286
  %pgocount33 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 66)
  %291 = add i64 %pgocount33, 1
  store i64 %291, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 66)
  %292 = load i32, i32* %5, align 4
  %293 = icmp ne i32 %292, 0
  br i1 %293, label %294, label %298

; <label>:294:                                    ; preds = %290, %286
  %pgocount34 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 63)
  %295 = add i64 %pgocount34, 1
  store i64 %295, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 63)
  %296 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %297 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %296)
  br label %298

; <label>:298:                                    ; preds = %294, %290, %283
  %pgocount35 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 60)
  %299 = add i64 %pgocount35, 1
  store i64 %299, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 60)
  br label %547

; <label>:300:                                    ; preds = %278
  %pgocount36 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 56)
  %301 = add i64 %pgocount36, 1
  store i64 %301, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 56)
  br label %302

; <label>:302:                                    ; preds = %300, %216, %213
  br label %303

; <label>:303:                                    ; preds = %531, %398, %302
  %304 = load i8*, i8** @currentchar, align 8
  %305 = call i8* @skiptoword(i8* %304)
  store i8* %305, i8** %3, align 8
  %306 = load i8*, i8** %3, align 8
  %307 = load i8*, i8** @currentchar, align 8
  %308 = icmp ne i8* %306, %307
  br i1 %308, label %309, label %317

; <label>:309:                                    ; preds = %303
  %pgocount37 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 2)
  %310 = add i64 %pgocount37, 1
  store i64 %310, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 2)
  %311 = load i8*, i8** %3, align 8
  %312 = load i8*, i8** @currentchar, align 8
  %313 = ptrtoint i8* %311 to i64
  %314 = ptrtoint i8* %312 to i64
  %315 = sub i64 %313, %314
  %316 = trunc i64 %315 to i32
  call void @copyout(i8** @currentchar, i32 %316)
  br label %317

; <label>:317:                                    ; preds = %309, %303
  %318 = load i8*, i8** @currentchar, align 8
  %319 = load i8, i8* %318, align 1
  %320 = sext i8 %319 to i32
  %321 = icmp eq i32 %320, 0
  br i1 %321, label %322, label %324

; <label>:322:                                    ; preds = %317
  %pgocount38 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 33)
  %323 = add i64 %pgocount38, 1
  store i64 %323, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 33)
  br label %532

; <label>:324:                                    ; preds = %317
  store i8* getelementptr inbounds ([120 x i8], [120 x i8]* @ctoken, i32 0, i32 0), i8** %3, align 8
  %325 = load i8*, i8** @currentchar, align 8
  %326 = call i8* @skipoverword(i8* %325)
  store i8* %326, i8** %4, align 8
  br label %327

; <label>:327:                                    ; preds = %337, %324
  %328 = load i8*, i8** @currentchar, align 8
  %329 = load i8*, i8** %4, align 8
  %330 = icmp ult i8* %328, %329
  br i1 %330, label %331, label %335

; <label>:331:                                    ; preds = %327
  %pgocount39 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 1)
  %332 = add i64 %pgocount39, 1
  store i64 %332, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 1)
  %333 = load i8*, i8** %3, align 8
  %334 = icmp ult i8* %333, getelementptr inbounds ([120 x i8], [120 x i8]* @ctoken, i32 0, i64 119)
  br label %335

; <label>:335:                                    ; preds = %331, %327
  %336 = phi i1 [ false, %327 ], [ %334, %331 ]
  br i1 %336, label %337, label %344

; <label>:337:                                    ; preds = %335
  %pgocount40 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 0)
  %338 = add i64 %pgocount40, 1
  store i64 %338, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 0)
  %339 = load i8*, i8** @currentchar, align 8
  %340 = getelementptr inbounds i8, i8* %339, i32 1
  store i8* %340, i8** @currentchar, align 8
  %341 = load i8, i8* %339, align 1
  %342 = load i8*, i8** %3, align 8
  %343 = getelementptr inbounds i8, i8* %342, i32 1
  store i8* %343, i8** %3, align 8
  store i8 %341, i8* %342, align 1
  br label %327

; <label>:344:                                    ; preds = %335
  %345 = load i8*, i8** %3, align 8
  store i8 0, i8* %345, align 1
  %346 = call i32 @strtoichar(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @itoken, i32 0, i32 0), i8* getelementptr inbounds ([120 x i8], [120 x i8]* @ctoken, i32 0, i32 0), i32 100, i32 0)
  %347 = icmp ne i32 %346, 0
  br i1 %347, label %348, label %357

; <label>:348:                                    ; preds = %344
  %349 = load i32, i32* @cbench_print, align 4
  %350 = icmp ne i32 %349, 0
  br i1 %350, label %351, label %355

; <label>:351:                                    ; preds = %348
  %pgocount41 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 5)
  %352 = add i64 %pgocount41, 1
  store i64 %352, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 5)
  %353 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %354 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %353, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([120 x i8], [120 x i8]* @ctoken, i32 0, i32 0), i32 463, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0))
  br label %355

; <label>:355:                                    ; preds = %351, %348
  %pgocount42 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 3)
  %356 = add i64 %pgocount42, 1
  store i64 %356, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 3)
  br label %357

; <label>:357:                                    ; preds = %355, %344
  %358 = call i64 @strlen(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @itoken, i32 0, i32 0)) #5
  %359 = trunc i64 %358 to i32
  store i32 %359, i32* %8, align 4
  %360 = load i32, i32* @lflag, align 4
  %361 = icmp ne i32 %360, 0
  br i1 %361, label %362, label %384

; <label>:362:                                    ; preds = %357
  %363 = load i32, i32* %8, align 4
  %364 = load i32, i32* @minword, align 4
  %365 = icmp sgt i32 %363, %364
  br i1 %365, label %366, label %382

; <label>:366:                                    ; preds = %362
  %pgocount43 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 7)
  %367 = add i64 %pgocount43, 1
  store i64 %367, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 7)
  %368 = call i32 @good(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @itoken, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0)
  %369 = icmp ne i32 %368, 0
  br i1 %369, label %382, label %370

; <label>:370:                                    ; preds = %366
  %pgocount44 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 16)
  %371 = add i64 %pgocount44, 1
  store i64 %371, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 16)
  %372 = load i32, i32* @cflag, align 4
  %373 = icmp ne i32 %372, 0
  br i1 %373, label %382, label %374

; <label>:374:                                    ; preds = %370
  %pgocount45 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 28)
  %375 = add i64 %pgocount45, 1
  store i64 %375, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 28)
  %376 = call i32 @compoundgood(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @itoken, i32 0, i32 0), i32 0)
  %377 = icmp ne i32 %376, 0
  br i1 %377, label %382, label %378

; <label>:378:                                    ; preds = %374
  %pgocount46 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 40)
  %379 = add i64 %pgocount46, 1
  store i64 %379, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 40)
  %380 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %381 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %380, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([120 x i8], [120 x i8]* @ctoken, i32 0, i32 0))
  br label %382

; <label>:382:                                    ; preds = %378, %374, %370, %366, %362
  %pgocount47 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 4)
  %383 = add i64 %pgocount47, 1
  store i64 %383, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 4)
  br label %520

; <label>:384:                                    ; preds = %357
  %385 = load i32, i32* @aflag, align 4
  %386 = icmp ne i32 %385, 0
  br i1 %386, label %387, label %512

; <label>:387:                                    ; preds = %384
  %388 = load i32, i32* %8, align 4
  %389 = load i32, i32* @minword, align 4
  %390 = icmp sle i32 %388, %389
  br i1 %390, label %391, label %400

; <label>:391:                                    ; preds = %387
  %392 = load i32, i32* @terse, align 4
  %393 = icmp ne i32 %392, 0
  br i1 %393, label %398, label %394

; <label>:394:                                    ; preds = %391
  %pgocount48 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 29)
  %395 = add i64 %pgocount48, 1
  store i64 %395, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 29)
  %396 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %397 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %396, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0))
  br label %398

; <label>:398:                                    ; preds = %394, %391
  %pgocount49 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 17)
  %399 = add i64 %pgocount49, 1
  store i64 %399, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 17)
  br label %303

; <label>:400:                                    ; preds = %387
  %401 = call i32 @good(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @itoken, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0)
  %402 = icmp ne i32 %401, 0
  br i1 %402, label %403, label %432

; <label>:403:                                    ; preds = %400
  %404 = load %struct.flagent*, %struct.flagent** getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0, i32 1), align 8
  %405 = icmp eq %struct.flagent* %404, null
  br i1 %405, label %406, label %419

; <label>:406:                                    ; preds = %403
  %pgocount50 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 35)
  %407 = add i64 %pgocount50, 1
  store i64 %407, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 35)
  %408 = load %struct.flagent*, %struct.flagent** getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0, i32 2), align 16
  %409 = icmp eq %struct.flagent* %408, null
  br i1 %409, label %410, label %419

; <label>:410:                                    ; preds = %406
  %411 = load i32, i32* @terse, align 4
  %412 = icmp ne i32 %411, 0
  br i1 %412, label %417, label %413

; <label>:413:                                    ; preds = %410
  %pgocount51 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 57)
  %414 = add i64 %pgocount51, 1
  store i64 %414, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 57)
  %415 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %416 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %415, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0))
  br label %417

; <label>:417:                                    ; preds = %413, %410
  %pgocount52 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 45)
  %418 = add i64 %pgocount52, 1
  store i64 %418, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 45)
  br label %431

; <label>:419:                                    ; preds = %406, %403
  %420 = load i32, i32* @terse, align 4
  %421 = icmp ne i32 %420, 0
  br i1 %421, label %429, label %422

; <label>:422:                                    ; preds = %419
  %pgocount53 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 38)
  %423 = add i64 %pgocount53, 1
  store i64 %423, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 38)
  %424 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %425 = load %struct.dent*, %struct.dent** getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0, i32 0), align 16
  %426 = getelementptr inbounds %struct.dent, %struct.dent* %425, i32 0, i32 1
  %427 = load i8*, i8** %426, align 8
  %428 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %424, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i32 0, i32 0), i8* %427)
  br label %429

; <label>:429:                                    ; preds = %422, %419
  %pgocount54 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 25)
  %430 = add i64 %pgocount54, 1
  store i64 %430, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 25)
  br label %431

; <label>:431:                                    ; preds = %429, %417
  br label %511

; <label>:432:                                    ; preds = %400
  %433 = call i32 @compoundgood(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @itoken, i32 0, i32 0), i32 0)
  %434 = icmp ne i32 %433, 0
  br i1 %434, label %435, label %444

; <label>:435:                                    ; preds = %432
  %pgocount55 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 36)
  %436 = add i64 %pgocount55, 1
  store i64 %436, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 36)
  %437 = load i32, i32* @terse, align 4
  %438 = icmp ne i32 %437, 0
  br i1 %438, label %443, label %439

; <label>:439:                                    ; preds = %435
  %pgocount56 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 46)
  %440 = add i64 %pgocount56, 1
  store i64 %440, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 46)
  %441 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %442 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %441, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0))
  br label %443

; <label>:443:                                    ; preds = %439, %435
  br label %510

; <label>:444:                                    ; preds = %432
  call void @makepossibilities(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @itoken, i32 0, i32 0))
  %445 = load i32, i32* @pcount, align 4
  %446 = icmp ne i32 %445, 0
  br i1 %446, label %447, label %497

; <label>:447:                                    ; preds = %444
  %448 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %449 = load i32, i32* @easypossibilities, align 4
  %450 = icmp ne i32 %449, 0
  %451 = zext i1 %450 to i64
  %pgocount57 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 68)
  %452 = add i64 %pgocount57, %451
  store i64 %452, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 68)
  %453 = select i1 %450, i32 38, i32 63
  %454 = load i32, i32* @easypossibilities, align 4
  %455 = load i8*, i8** @currentchar, align 8
  %456 = ptrtoint i8* %455 to i64
  %457 = sub i64 %456, ptrtoint ([10 x [8192 x i8]]* @contextbufs to i64)
  %458 = call i64 @strlen(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @ctoken, i32 0, i32 0)) #5
  %459 = sub i64 %457, %458
  %460 = trunc i64 %459 to i32
  %461 = load i32, i32* @contextoffset, align 4
  %462 = add nsw i32 %460, %461
  %463 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %448, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0), i32 %453, i8* getelementptr inbounds ([120 x i8], [120 x i8]* @ctoken, i32 0, i32 0), i32 %454, i32 %462)
  store i32 0, i32* %7, align 4
  br label %464

; <label>:464:                                    ; preds = %490, %447
  %465 = load i32, i32* %7, align 4
  %466 = icmp slt i32 %465, 100
  br i1 %466, label %467, label %493

; <label>:467:                                    ; preds = %464
  %468 = load i32, i32* %7, align 4
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds [100 x [120 x i8]], [100 x [120 x i8]]* @possibilities, i64 0, i64 %469
  %471 = getelementptr inbounds [120 x i8], [120 x i8]* %470, i64 0, i64 0
  %472 = load i8, i8* %471, align 8
  %473 = sext i8 %472 to i32
  %474 = icmp eq i32 %473, 0
  br i1 %474, label %475, label %477

; <label>:475:                                    ; preds = %467
  %pgocount58 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 51)
  %476 = add i64 %pgocount58, 1
  store i64 %476, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 51)
  br label %493

; <label>:477:                                    ; preds = %467
  %pgocount59 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 11)
  %478 = add i64 %pgocount59, 1
  store i64 %478, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 11)
  %479 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %480 = load i32, i32* %7, align 4
  %481 = icmp ne i32 %480, 0
  %482 = zext i1 %481 to i64
  %pgocount60 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 69)
  %483 = add i64 %pgocount60, %482
  store i64 %483, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 69)
  %484 = select i1 %481, i32 44, i32 58
  %485 = load i32, i32* %7, align 4
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds [100 x [120 x i8]], [100 x [120 x i8]]* @possibilities, i64 0, i64 %486
  %488 = getelementptr inbounds [120 x i8], [120 x i8]* %487, i32 0, i32 0
  %489 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %479, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), i32 %484, i8* %488)
  br label %490

; <label>:490:                                    ; preds = %477
  %491 = load i32, i32* %7, align 4
  %492 = add nsw i32 %491, 1
  store i32 %492, i32* %7, align 4
  br label %464

; <label>:493:                                    ; preds = %475, %464
  %pgocount61 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 47)
  %494 = add i64 %pgocount61, 1
  store i64 %494, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 47)
  %495 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %496 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %495, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i32 0, i32 0))
  br label %509

; <label>:497:                                    ; preds = %444
  %pgocount62 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 50)
  %498 = add i64 %pgocount62, 1
  store i64 %498, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 50)
  %499 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %500 = load i8*, i8** @currentchar, align 8
  %501 = ptrtoint i8* %500 to i64
  %502 = sub i64 %501, ptrtoint ([10 x [8192 x i8]]* @contextbufs to i64)
  %503 = call i64 @strlen(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @ctoken, i32 0, i32 0)) #5
  %504 = sub i64 %502, %503
  %505 = trunc i64 %504 to i32
  %506 = load i32, i32* @contextoffset, align 4
  %507 = add nsw i32 %505, %506
  %508 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %499, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([120 x i8], [120 x i8]* @ctoken, i32 0, i32 0), i32 %507)
  br label %509

; <label>:509:                                    ; preds = %497, %493
  br label %510

; <label>:510:                                    ; preds = %509, %443
  br label %511

; <label>:511:                                    ; preds = %510, %431
  br label %519

; <label>:512:                                    ; preds = %384
  %513 = load i32, i32* @quit, align 4
  %514 = icmp ne i32 %513, 0
  br i1 %514, label %517, label %515

; <label>:515:                                    ; preds = %512
  %pgocount63 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 26)
  %516 = add i64 %pgocount63, 1
  store i64 %516, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 26)
  call void @correct(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @ctoken, i32 0, i32 0), i32 120, i8* getelementptr inbounds ([120 x i8], [120 x i8]* @itoken, i32 0, i32 0), i32 120, i8** @currentchar)
  br label %517

; <label>:517:                                    ; preds = %515, %512
  %pgocount64 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 12)
  %518 = add i64 %pgocount64, 1
  store i64 %518, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 12)
  br label %519

; <label>:519:                                    ; preds = %517, %511
  br label %520

; <label>:520:                                    ; preds = %519, %382
  %521 = load i32, i32* @aflag, align 4
  %522 = icmp ne i32 %521, 0
  br i1 %522, label %531, label %523

; <label>:523:                                    ; preds = %520
  %pgocount65 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 6)
  %524 = add i64 %pgocount65, 1
  store i64 %524, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 6)
  %525 = load i32, i32* @lflag, align 4
  %526 = icmp ne i32 %525, 0
  br i1 %526, label %531, label %527

; <label>:527:                                    ; preds = %523
  %pgocount66 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 15)
  %528 = add i64 %pgocount66, 1
  store i64 %528, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 15)
  %529 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %530 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %529, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([120 x i8], [120 x i8]* @ctoken, i32 0, i32 0))
  br label %531

; <label>:531:                                    ; preds = %527, %523, %520
  br label %303

; <label>:532:                                    ; preds = %322
  %533 = load i32, i32* @lflag, align 4
  %534 = icmp ne i32 %533, 0
  br i1 %534, label %547, label %535

; <label>:535:                                    ; preds = %532
  %pgocount67 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 42)
  %536 = add i64 %pgocount67, 1
  store i64 %536, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 42)
  %537 = load i32, i32* @aflag, align 4
  %538 = icmp ne i32 %537, 0
  br i1 %538, label %543, label %539

; <label>:539:                                    ; preds = %535
  %pgocount68 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 52)
  %540 = add i64 %pgocount68, 1
  store i64 %540, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 52)
  %541 = load i32, i32* %5, align 4
  %542 = icmp ne i32 %541, 0
  br i1 %542, label %543, label %547

; <label>:543:                                    ; preds = %539, %535
  %pgocount69 = load i64, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 44)
  %544 = add i64 %pgocount69, 1
  store i64 %544, i64* getelementptr inbounds ([70 x i64], [70 x i64]* @__profc_checkline, i64 0, i64 44)
  %545 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %546 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %545)
  br label %547

; <label>:547:                                    ; preds = %543, %539, %532, %298, %207
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #2

declare void @copyout(i8**, i32) #1

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #3

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define internal i8* @skiptoword(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  br label %3

; <label>:3:                                      ; preds = %417, %359, %331, %321, %285, %1
  %4 = load i8*, i8** %2, align 8
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %52

; <label>:8:                                      ; preds = %3
  %9 = load i8*, i8** %2, align 8
  %10 = load i8, i8* %9, align 1
  %11 = zext i8 %10 to i64
  %12 = getelementptr inbounds [128 x i8], [128 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 27), i64 0, i64 %11
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %22

; <label>:16:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 9)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 9)
  %18 = load i8*, i8** %2, align 8
  %19 = call i32 @stringcharlen(i8* %18, i32 0)
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %30, label %._crit_edge

._crit_edge:                                      ; preds = %16
  %pgocount4 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 0)
  %21 = add i64 %pgocount4, 1
  store i64 %21, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 0)
  br label %22

; <label>:22:                                     ; preds = %._crit_edge, %8
  %23 = load i8*, i8** %2, align 8
  %24 = load i8, i8* %23, align 1
  %25 = zext i8 %24 to i64
  %26 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 23), i64 0, i64 %25
  %27 = load i8, i8* %26, align 1
  %28 = icmp ne i8 %27, 0
  br i1 %28, label %30, label %._crit_edge1

._crit_edge1:                                     ; preds = %22
  %pgocount5 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 1)
  %29 = add i64 %pgocount5, 1
  store i64 %29, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 1)
  br label %49

; <label>:30:                                     ; preds = %22, %16
  %31 = load i8*, i8** %2, align 8
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i64
  %34 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 26), i64 0, i64 %33
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %49, label %38

; <label>:38:                                     ; preds = %30
  %39 = load i32, i32* @tflag, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %46

; <label>:41:                                     ; preds = %38
  %pgocount6 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 18)
  %42 = add i64 %pgocount6, 1
  store i64 %42, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 18)
  %43 = load i32, i32* @math_mode, align 4
  %44 = and i32 %43, 1
  %45 = icmp ne i32 %44, 0
  br label %46

; <label>:46:                                     ; preds = %41, %38
  %47 = phi i1 [ false, %38 ], [ %45, %41 ]
  %pgocount7 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 16)
  %48 = add i64 %pgocount7, 1
  store i64 %48, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 16)
  br label %49

; <label>:49:                                     ; preds = %._crit_edge1, %46, %30
  %50 = phi i1 [ true, %30 ], [ true, %._crit_edge1 ], [ %47, %46 ]
  %pgocount8 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 8)
  %51 = add i64 %pgocount8, 1
  store i64 %51, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 8)
  br label %52

; <label>:52:                                     ; preds = %49, %3
  %53 = phi i1 [ false, %3 ], [ %50, %49 ]
  br i1 %53, label %54, label %418

; <label>:54:                                     ; preds = %52
  %55 = load i32, i32* @tflag, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %257

; <label>:57:                                     ; preds = %54
  %58 = load i8*, i8** %2, align 8
  %59 = load i8, i8* %58, align 1
  %60 = sext i8 %59 to i32
  %61 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 12), align 1
  %62 = sext i8 %61 to i32
  %63 = icmp eq i32 %60, %62
  br i1 %63, label %64, label %73

; <label>:64:                                     ; preds = %57
  %65 = load i32, i32* @TeX_comment, align 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %71, label %67

; <label>:67:                                     ; preds = %64
  %pgocount9 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 17)
  %68 = add i64 %pgocount9, 1
  store i64 %68, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 17)
  %69 = load i32, i32* @math_mode, align 4
  store i32 %69, i32* @save_math_mode, align 4
  %70 = load i8, i8* @LaTeX_Mode, align 1
  store i8 %70, i8* @save_LaTeX_Mode, align 1
  store i32 0, i32* @math_mode, align 4
  store i8 80, i8* @LaTeX_Mode, align 1
  store i32 1, i32* @TeX_comment, align 4
  br label %71

; <label>:71:                                     ; preds = %67, %64
  %pgocount10 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 12)
  %72 = add i64 %pgocount10, 1
  store i64 %72, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 12)
  br label %249

; <label>:73:                                     ; preds = %57
  %74 = load i32, i32* @math_mode, align 4
  %75 = and i32 %74, 1
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %166

; <label>:77:                                     ; preds = %73
  %78 = load i8, i8* @LaTeX_Mode, align 1
  %79 = sext i8 %78 to i32
  %80 = icmp eq i32 %79, 101
  br i1 %80, label %81, label %85

; <label>:81:                                     ; preds = %77
  %pgocount11 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 21)
  %82 = add i64 %pgocount11, 1
  store i64 %82, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 21)
  %83 = call i32 @TeX_math_check(i32 101, i8** %2)
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %94, label %85

; <label>:85:                                     ; preds = %81, %77
  %86 = load i8, i8* @LaTeX_Mode, align 1
  %87 = sext i8 %86 to i32
  %88 = icmp eq i32 %87, 109
  br i1 %88, label %89, label %98

; <label>:89:                                     ; preds = %85
  %pgocount12 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 29)
  %90 = add i64 %pgocount12, 1
  store i64 %90, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 29)
  %91 = call i32 @TeX_LR_check(i32 1, i8** %2)
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %94, label %._crit_edge3

._crit_edge3:                                     ; preds = %89
  %pgocount13 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 3)
  %93 = add i64 %pgocount13, 1
  store i64 %93, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 3)
  br label %98

; <label>:94:                                     ; preds = %89, %81
  %pgocount14 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 20)
  %95 = add i64 %pgocount14, 1
  store i64 %95, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 20)
  %96 = load i32, i32* @math_mode, align 4
  %97 = add nsw i32 %96, -1
  store i32 %97, i32* @math_mode, align 4
  br label %153

; <label>:98:                                     ; preds = %._crit_edge3, %85
  br label %99

; <label>:99:                                     ; preds = %133, %98
  %100 = load i8*, i8** %2, align 8
  %101 = load i8, i8* %100, align 1
  %102 = sext i8 %101 to i32
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %131

; <label>:104:                                    ; preds = %99
  %105 = load i8*, i8** %2, align 8
  %106 = load i8, i8* %105, align 1
  %107 = sext i8 %106 to i32
  %108 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 8), align 1
  %109 = sext i8 %108 to i32
  %110 = icmp eq i32 %107, %109
  br i1 %110, label %127, label %111

; <label>:111:                                    ; preds = %104
  %pgocount15 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 7)
  %112 = add i64 %pgocount15, 1
  store i64 %112, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 7)
  %113 = load i8*, i8** %2, align 8
  %114 = load i8, i8* %113, align 1
  %115 = sext i8 %114 to i32
  %116 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 9), align 1
  %117 = sext i8 %116 to i32
  %118 = icmp eq i32 %115, %117
  br i1 %118, label %127, label %119

; <label>:119:                                    ; preds = %111
  %pgocount16 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 11)
  %120 = add i64 %pgocount16, 1
  store i64 %120, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 11)
  %121 = load i8*, i8** %2, align 8
  %122 = load i8, i8* %121, align 1
  %123 = sext i8 %122 to i32
  %124 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 12), align 1
  %125 = sext i8 %124 to i32
  %126 = icmp eq i32 %123, %125
  br label %127

; <label>:127:                                    ; preds = %119, %111, %104
  %128 = phi i1 [ true, %111 ], [ true, %104 ], [ %126, %119 ]
  %pgocount17 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 6)
  %129 = add i64 %pgocount17, 1
  store i64 %129, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 6)
  %130 = xor i1 %128, true
  br label %131

; <label>:131:                                    ; preds = %127, %99
  %132 = phi i1 [ false, %99 ], [ %130, %127 ]
  br i1 %132, label %133, label %137

; <label>:133:                                    ; preds = %131
  %pgocount18 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 5)
  %134 = add i64 %pgocount18, 1
  store i64 %134, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 5)
  %135 = load i8*, i8** %2, align 8
  %136 = getelementptr inbounds i8, i8* %135, i32 1
  store i8* %136, i8** %2, align 8
  br label %99

; <label>:137:                                    ; preds = %131
  %138 = load i8*, i8** %2, align 8
  %139 = load i8, i8* %138, align 1
  %140 = sext i8 %139 to i32
  %141 = icmp eq i32 %140, 0
  br i1 %141, label %142, label %144

; <label>:142:                                    ; preds = %137
  %pgocount19 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 54)
  %143 = add i64 %pgocount19, 1
  store i64 %143, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 54)
  br label %418

; <label>:144:                                    ; preds = %137
  %145 = call i32 @TeX_math_end(i8** %2)
  %146 = icmp ne i32 %145, 0
  br i1 %146, label %147, label %151

; <label>:147:                                    ; preds = %144
  %pgocount20 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 32)
  %148 = add i64 %pgocount20, 1
  store i64 %148, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 32)
  %149 = load i32, i32* @math_mode, align 4
  %150 = add nsw i32 %149, -1
  store i32 %150, i32* @math_mode, align 4
  br label %151

; <label>:151:                                    ; preds = %147, %144
  %pgocount21 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 24)
  %152 = add i64 %pgocount21, 1
  store i64 %152, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 24)
  br label %153

; <label>:153:                                    ; preds = %151, %94
  %154 = load i32, i32* @math_mode, align 4
  %155 = icmp slt i32 %154, 0
  br i1 %155, label %156, label %165

; <label>:156:                                    ; preds = %153
  %pgocount22 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 27)
  %157 = add i64 %pgocount22, 1
  store i64 %157, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 27)
  %158 = load i32, i32* @cbench_print, align 4
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %160, label %164

; <label>:160:                                    ; preds = %156
  %pgocount23 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 35)
  %161 = add i64 %pgocount23, 1
  store i64 %161, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 35)
  %162 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %163 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %162, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.16, i32 0, i32 0))
  br label %164

; <label>:164:                                    ; preds = %160, %156
  store i32 0, i32* @math_mode, align 4
  br label %165

; <label>:165:                                    ; preds = %164, %153
  br label %248

; <label>:166:                                    ; preds = %73
  %167 = load i32, i32* @math_mode, align 4
  %168 = icmp sgt i32 %167, 1
  br i1 %168, label %169, label %188

; <label>:169:                                    ; preds = %166
  %pgocount24 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 22)
  %170 = add i64 %pgocount24, 1
  store i64 %170, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 22)
  %171 = load i8*, i8** %2, align 8
  %172 = load i8, i8* %171, align 1
  %173 = sext i8 %172 to i32
  %174 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 5), align 1
  %175 = sext i8 %174 to i32
  %176 = icmp eq i32 %173, %175
  br i1 %176, label %177, label %188

; <label>:177:                                    ; preds = %169
  %pgocount25 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 34)
  %178 = add i64 %pgocount25, 1
  store i64 %178, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 34)
  %179 = load i32, i32* @math_mode, align 4
  %180 = load i32, i32* @math_mode, align 4
  %181 = and i32 %180, 127
  %182 = mul nsw i32 %181, 128
  %183 = icmp slt i32 %179, %182
  br i1 %183, label %184, label %188

; <label>:184:                                    ; preds = %177
  %pgocount26 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 46)
  %185 = add i64 %pgocount26, 1
  store i64 %185, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 46)
  %186 = load i32, i32* @math_mode, align 4
  %187 = add nsw i32 %186, -1
  store i32 %187, i32* @math_mode, align 4
  br label %247

; <label>:188:                                    ; preds = %177, %169, %166
  %189 = load i8, i8* @LaTeX_Mode, align 1
  %190 = sext i8 %189 to i32
  %191 = icmp eq i32 %190, 109
  br i1 %191, label %208, label %192

; <label>:192:                                    ; preds = %188
  %pgocount27 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 25)
  %193 = add i64 %pgocount27, 1
  store i64 %193, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 25)
  %194 = load i32, i32* @math_mode, align 4
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %196, label %217

; <label>:196:                                    ; preds = %192
  %pgocount28 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 33)
  %197 = add i64 %pgocount28, 1
  store i64 %197, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 33)
  %198 = load i32, i32* @math_mode, align 4
  %199 = load i32, i32* @math_mode, align 4
  %200 = and i32 %199, 127
  %201 = mul nsw i32 %200, 128
  %202 = icmp sge i32 %198, %201
  br i1 %202, label %203, label %217

; <label>:203:                                    ; preds = %196
  %pgocount29 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 42)
  %204 = add i64 %pgocount29, 1
  store i64 %204, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 42)
  %205 = load i8*, i8** %2, align 8
  %206 = call i32 @TeX_strncmp(i8* %205, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i32 0, i32 0), i32 4)
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %208, label %217

; <label>:208:                                    ; preds = %203, %188
  %209 = call i32 @TeX_LR_check(i32 0, i8** %2)
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %211, label %215

; <label>:211:                                    ; preds = %208
  %pgocount30 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 30)
  %212 = add i64 %pgocount30, 1
  store i64 %212, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 30)
  %213 = load i32, i32* @math_mode, align 4
  %214 = add nsw i32 %213, -1
  store i32 %214, i32* @math_mode, align 4
  br label %215

; <label>:215:                                    ; preds = %211, %208
  %pgocount31 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 23)
  %216 = add i64 %pgocount31, 1
  store i64 %216, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 23)
  br label %246

; <label>:217:                                    ; preds = %203, %196, %192
  %218 = load i8, i8* @LaTeX_Mode, align 1
  %219 = sext i8 %218 to i32
  %220 = icmp eq i32 %219, 98
  br i1 %220, label %221, label %229

; <label>:221:                                    ; preds = %217
  %pgocount32 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 41)
  %222 = add i64 %pgocount32, 1
  store i64 %222, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 41)
  %223 = call i32 @TeX_math_check(i32 98, i8** %2)
  %224 = icmp ne i32 %223, 0
  br i1 %224, label %225, label %229

; <label>:225:                                    ; preds = %221
  %pgocount33 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 48)
  %226 = add i64 %pgocount33, 1
  store i64 %226, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 48)
  %227 = load i32, i32* @math_mode, align 4
  %228 = add nsw i32 %227, 1
  store i32 %228, i32* @math_mode, align 4
  br label %245

; <label>:229:                                    ; preds = %221, %217
  %230 = load i8, i8* @LaTeX_Mode, align 1
  %231 = sext i8 %230 to i32
  %232 = icmp eq i32 %231, 114
  br i1 %232, label %233, label %235

; <label>:233:                                    ; preds = %229
  %pgocount34 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 43)
  %234 = add i64 %pgocount34, 1
  store i64 %234, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 43)
  call void @TeX_skip_parens(i8** %2)
  store i8 80, i8* @LaTeX_Mode, align 1
  br label %244

; <label>:235:                                    ; preds = %229
  %236 = call i32 @TeX_math_begin(i8** %2)
  %237 = icmp ne i32 %236, 0
  br i1 %237, label %238, label %242

; <label>:238:                                    ; preds = %235
  %pgocount35 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 50)
  %239 = add i64 %pgocount35, 1
  store i64 %239, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 50)
  %240 = load i32, i32* @math_mode, align 4
  %241 = add nsw i32 %240, 1
  store i32 %241, i32* @math_mode, align 4
  br label %242

; <label>:242:                                    ; preds = %238, %235
  %pgocount36 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 44)
  %243 = add i64 %pgocount36, 1
  store i64 %243, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 44)
  br label %244

; <label>:244:                                    ; preds = %242, %233
  br label %245

; <label>:245:                                    ; preds = %244, %225
  br label %246

; <label>:246:                                    ; preds = %245, %215
  br label %247

; <label>:247:                                    ; preds = %246, %184
  br label %248

; <label>:248:                                    ; preds = %247, %165
  br label %249

; <label>:249:                                    ; preds = %248, %71
  %250 = load i8*, i8** %2, align 8
  %251 = load i8, i8* %250, align 1
  %252 = sext i8 %251 to i32
  %253 = icmp eq i32 %252, 0
  br i1 %253, label %254, label %256

; <label>:254:                                    ; preds = %249
  %pgocount37 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 47)
  %255 = add i64 %pgocount37, 1
  store i64 %255, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 47)
  br label %418

; <label>:256:                                    ; preds = %249
  br label %366

; <label>:257:                                    ; preds = %54
  %258 = load i8*, i8** %2, align 8
  %259 = load i8, i8* %258, align 1
  %260 = sext i8 %259 to i32
  %261 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 15, i64 3), align 1
  %262 = sext i8 %261 to i32
  %263 = icmp eq i32 %260, %262
  br i1 %263, label %264, label %364

; <label>:264:                                    ; preds = %257
  %265 = load i8*, i8** %2, align 8
  %266 = getelementptr inbounds i8, i8* %265, i64 1
  %267 = load i8, i8* %266, align 1
  %268 = sext i8 %267 to i32
  switch i32 %268, label %323 [
    i32 102, label %269
    i32 115, label %286
  ]

; <label>:269:                                    ; preds = %264
  %270 = load i8*, i8** %2, align 8
  %271 = getelementptr inbounds i8, i8* %270, i64 2
  %272 = load i8, i8* %271, align 1
  %273 = sext i8 %272 to i32
  %274 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 15, i64 0), align 4
  %275 = sext i8 %274 to i32
  %276 = icmp eq i32 %273, %275
  br i1 %276, label %277, label %281

; <label>:277:                                    ; preds = %269
  %pgocount38 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 36)
  %278 = add i64 %pgocount38, 1
  store i64 %278, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 36)
  %279 = load i8*, i8** %2, align 8
  %280 = getelementptr inbounds i8, i8* %279, i64 5
  store i8* %280, i8** %2, align 8
  br label %285

; <label>:281:                                    ; preds = %269
  %pgocount39 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 37)
  %282 = add i64 %pgocount39, 1
  store i64 %282, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 37)
  %283 = load i8*, i8** %2, align 8
  %284 = getelementptr inbounds i8, i8* %283, i64 3
  store i8* %284, i8** %2, align 8
  br label %285

; <label>:285:                                    ; preds = %281, %277
  br label %3

; <label>:286:                                    ; preds = %264
  %287 = load i8*, i8** %2, align 8
  %288 = getelementptr inbounds i8, i8* %287, i64 2
  store i8* %288, i8** %2, align 8
  %289 = load i8*, i8** %2, align 8
  %290 = load i8, i8* %289, align 1
  %291 = sext i8 %290 to i32
  %292 = icmp eq i32 %291, 43
  br i1 %292, label %299, label %293

; <label>:293:                                    ; preds = %286
  %pgocount40 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 38)
  %294 = add i64 %pgocount40, 1
  store i64 %294, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 38)
  %295 = load i8*, i8** %2, align 8
  %296 = load i8, i8* %295, align 1
  %297 = sext i8 %296 to i32
  %298 = icmp eq i32 %297, 45
  br i1 %298, label %299, label %303

; <label>:299:                                    ; preds = %293, %286
  %pgocount41 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 31)
  %300 = add i64 %pgocount41, 1
  store i64 %300, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 31)
  %301 = load i8*, i8** %2, align 8
  %302 = getelementptr inbounds i8, i8* %301, i32 1
  store i8* %302, i8** %2, align 8
  br label %303

; <label>:303:                                    ; preds = %299, %293
  %304 = load i8*, i8** %2, align 8
  %305 = getelementptr inbounds i8, i8* %304, i32 1
  store i8* %305, i8** %2, align 8
  %306 = call i16** @__ctype_b_loc() #6
  %307 = load i16*, i16** %306, align 8
  %308 = load i8*, i8** %2, align 8
  %309 = load i8, i8* %308, align 1
  %310 = sext i8 %309 to i32
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds i16, i16* %307, i64 %311
  %313 = load i16, i16* %312, align 2
  %314 = zext i16 %313 to i32
  %315 = and i32 %314, 2048
  %316 = icmp ne i32 %315, 0
  br i1 %316, label %317, label %321

; <label>:317:                                    ; preds = %303
  %pgocount42 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 39)
  %318 = add i64 %pgocount42, 1
  store i64 %318, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 39)
  %319 = load i8*, i8** %2, align 8
  %320 = getelementptr inbounds i8, i8* %319, i32 1
  store i8* %320, i8** %2, align 8
  br label %321

; <label>:321:                                    ; preds = %317, %303
  %pgocount43 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 26)
  %322 = add i64 %pgocount43, 1
  store i64 %322, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 26)
  br label %3

; <label>:323:                                    ; preds = %264
  %324 = load i8*, i8** %2, align 8
  %325 = getelementptr inbounds i8, i8* %324, i64 1
  %326 = load i8, i8* %325, align 1
  %327 = sext i8 %326 to i32
  %328 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 15, i64 0), align 4
  %329 = sext i8 %328 to i32
  %330 = icmp eq i32 %327, %329
  br i1 %330, label %331, label %335

; <label>:331:                                    ; preds = %323
  %pgocount44 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 40)
  %332 = add i64 %pgocount44, 1
  store i64 %332, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 40)
  %333 = load i8*, i8** %2, align 8
  %334 = getelementptr inbounds i8, i8* %333, i64 4
  store i8* %334, i8** %2, align 8
  br label %3

; <label>:335:                                    ; preds = %323
  %336 = load i8*, i8** %2, align 8
  %337 = getelementptr inbounds i8, i8* %336, i64 1
  %338 = load i8, i8* %337, align 1
  %339 = sext i8 %338 to i32
  %340 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 15, i64 4), align 4
  %341 = sext i8 %340 to i32
  %342 = icmp eq i32 %339, %341
  br i1 %342, label %343, label %360

; <label>:343:                                    ; preds = %335
  %344 = load i8*, i8** %2, align 8
  %345 = getelementptr inbounds i8, i8* %344, i64 2
  %346 = load i8, i8* %345, align 1
  %347 = sext i8 %346 to i32
  %348 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 15, i64 0), align 4
  %349 = sext i8 %348 to i32
  %350 = icmp eq i32 %347, %349
  br i1 %350, label %351, label %355

; <label>:351:                                    ; preds = %343
  %pgocount45 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 52)
  %352 = add i64 %pgocount45, 1
  store i64 %352, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 52)
  %353 = load i8*, i8** %2, align 8
  %354 = getelementptr inbounds i8, i8* %353, i64 5
  store i8* %354, i8** %2, align 8
  br label %359

; <label>:355:                                    ; preds = %343
  %pgocount46 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 53)
  %356 = add i64 %pgocount46, 1
  store i64 %356, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 53)
  %357 = load i8*, i8** %2, align 8
  %358 = getelementptr inbounds i8, i8* %357, i64 3
  store i8* %358, i8** %2, align 8
  br label %359

; <label>:359:                                    ; preds = %355, %351
  br label %3

; <label>:360:                                    ; preds = %335
  br label %361

; <label>:361:                                    ; preds = %360
  br label %362

; <label>:362:                                    ; preds = %361
  %pgocount47 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 49)
  %363 = add i64 %pgocount47, 1
  store i64 %363, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 49)
  br label %364

; <label>:364:                                    ; preds = %362, %257
  %pgocount48 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 14)
  %365 = add i64 %pgocount48, 1
  store i64 %365, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 14)
  br label %366

; <label>:366:                                    ; preds = %364, %256
  %367 = load i8*, i8** %2, align 8
  %368 = load i8, i8* %367, align 1
  %369 = sext i8 %368 to i32
  %370 = icmp eq i32 %369, 48
  br i1 %370, label %371, label %414

; <label>:371:                                    ; preds = %366
  %pgocount49 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 10)
  %372 = add i64 %pgocount49, 1
  store i64 %372, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 10)
  %373 = load i8*, i8** %2, align 8
  %374 = getelementptr inbounds i8, i8* %373, i64 1
  %375 = load i8, i8* %374, align 1
  %376 = sext i8 %375 to i32
  %377 = icmp eq i32 %376, 120
  br i1 %377, label %385, label %378

; <label>:378:                                    ; preds = %371
  %pgocount50 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 15)
  %379 = add i64 %pgocount50, 1
  store i64 %379, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 15)
  %380 = load i8*, i8** %2, align 8
  %381 = getelementptr inbounds i8, i8* %380, i64 1
  %382 = load i8, i8* %381, align 1
  %383 = sext i8 %382 to i32
  %384 = icmp eq i32 %383, 88
  br i1 %384, label %385, label %414

; <label>:385:                                    ; preds = %378, %371
  %386 = load i32, i32* @terse, align 4
  %387 = icmp ne i32 %386, 0
  br i1 %387, label %393, label %388

; <label>:388:                                    ; preds = %385
  %pgocount51 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 19)
  %389 = add i64 %pgocount51, 1
  store i64 %389, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 19)
  %390 = load i32, i32* @aflag, align 4
  %391 = icmp ne i32 %390, 0
  br i1 %391, label %414, label %._crit_edge2

._crit_edge2:                                     ; preds = %388
  %pgocount52 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 2)
  %392 = add i64 %pgocount52, 1
  store i64 %392, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 2)
  br label %393

; <label>:393:                                    ; preds = %._crit_edge2, %385
  %394 = load i8*, i8** %2, align 8
  %395 = getelementptr inbounds i8, i8* %394, i64 2
  store i8* %395, i8** %2, align 8
  br label %396

; <label>:396:                                    ; preds = %408, %393
  %397 = call i16** @__ctype_b_loc() #6
  %398 = load i16*, i16** %397, align 8
  %399 = load i8*, i8** %2, align 8
  %400 = load i8, i8* %399, align 1
  %401 = sext i8 %400 to i32
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds i16, i16* %398, i64 %402
  %404 = load i16, i16* %403, align 2
  %405 = zext i16 %404 to i32
  %406 = and i32 %405, 4096
  %407 = icmp ne i32 %406, 0
  br i1 %407, label %408, label %412

; <label>:408:                                    ; preds = %396
  %pgocount53 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 4)
  %409 = add i64 %pgocount53, 1
  store i64 %409, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 4)
  %410 = load i8*, i8** %2, align 8
  %411 = getelementptr inbounds i8, i8* %410, i32 1
  store i8* %411, i8** %2, align 8
  br label %396

; <label>:412:                                    ; preds = %396
  %pgocount54 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 13)
  %413 = add i64 %pgocount54, 1
  store i64 %413, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 13)
  br label %417

; <label>:414:                                    ; preds = %388, %378, %366
  %415 = load i8*, i8** %2, align 8
  %416 = getelementptr inbounds i8, i8* %415, i32 1
  store i8* %416, i8** %2, align 8
  br label %417

; <label>:417:                                    ; preds = %414, %412
  br label %3

; <label>:418:                                    ; preds = %254, %142, %52
  %419 = load i8*, i8** %2, align 8
  %420 = load i8, i8* %419, align 1
  %421 = sext i8 %420 to i32
  %422 = icmp eq i32 %421, 0
  br i1 %422, label %423, label %432

; <label>:423:                                    ; preds = %418
  %424 = load i32, i32* @TeX_comment, align 4
  %425 = icmp ne i32 %424, 0
  br i1 %425, label %426, label %430

; <label>:426:                                    ; preds = %423
  %pgocount55 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 51)
  %427 = add i64 %pgocount55, 1
  store i64 %427, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 51)
  %428 = load i32, i32* @save_math_mode, align 4
  store i32 %428, i32* @math_mode, align 4
  %429 = load i8, i8* @save_LaTeX_Mode, align 1
  store i8 %429, i8* @LaTeX_Mode, align 1
  store i32 0, i32* @TeX_comment, align 4
  br label %430

; <label>:430:                                    ; preds = %426, %423
  %pgocount56 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 45)
  %431 = add i64 %pgocount56, 1
  store i64 %431, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 45)
  br label %432

; <label>:432:                                    ; preds = %430, %418
  %pgocount57 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 28)
  %433 = add i64 %pgocount57, 1
  store i64 %433, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_skiptoword, i64 0, i64 28)
  %434 = load i8*, i8** %2, align 8
  ret i8* %434
}

declare i32 @strtoichar(i8*, i8*, i32, i32) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @good(i8*, i32, i32, i32, i32) #1

declare i32 @compoundgood(i8*, i32) #1

declare void @makepossibilities(i8*) #1

declare void @correct(i8*, i32, i8*, i32, i8**) #1

; Function Attrs: nounwind uwtable
define internal i32 @TeX_math_check(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %6 = load i8**, i8*** %5, align 8
  call void @TeX_open_paren(i8** %6)
  %7 = load i8**, i8*** %5, align 8
  %8 = load i8*, i8** %7, align 8
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 2)
  %14 = load i32, i32* %4, align 4
  %15 = trunc i32 %14 to i8
  store i8 %15, i8* @LaTeX_Mode, align 1
  store i32 0, i32* %3, align 4
  br label %63

; <label>:16:                                     ; preds = %2
  store i8 80, i8* @LaTeX_Mode, align 1
  br label %17

; <label>:17:                                     ; preds = %16
  %18 = load i8**, i8*** %5, align 8
  %19 = load i8*, i8** %18, align 8
  %20 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %20, i8** %18, align 8
  %21 = call i32 @strncmp(i8* %20, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.18, i32 0, i32 0), i64 8) #5
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %47, label %23

; <label>:23:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 1)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 1)
  %25 = load i8**, i8*** %5, align 8
  %26 = load i8*, i8** %25, align 8
  %27 = call i32 @strncmp(i8* %26, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.19, i32 0, i32 0), i64 8) #5
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %47, label %29

; <label>:29:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 3)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 3)
  %31 = load i8**, i8*** %5, align 8
  %32 = load i8*, i8** %31, align 8
  %33 = call i32 @strncmp(i8* %32, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.20, i32 0, i32 0), i64 11) #5
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %47, label %35

; <label>:35:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 4)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 4)
  %37 = load i8**, i8*** %5, align 8
  %38 = load i8*, i8** %37, align 8
  %39 = call i32 @strncmp(i8* %38, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21, i32 0, i32 0), i64 7) #5
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %47, label %41

; <label>:41:                                     ; preds = %35
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 5)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 5)
  %43 = load i8**, i8*** %5, align 8
  %44 = load i8*, i8** %43, align 8
  %45 = call i32 @strncmp(i8* %44, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i32 0, i32 0), i64 4) #5
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %53

; <label>:47:                                     ; preds = %41, %35, %29, %23, %17
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 0)
  %48 = add i64 %pgocount5, 1
  store i64 %48, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 0)
  %49 = load i8**, i8*** %5, align 8
  %50 = load i8*, i8** %49, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 -1
  store i8* %51, i8** %49, align 8
  %52 = load i8**, i8*** %5, align 8
  call void @TeX_skip_parens(i8** %52)
  store i32 1, i32* %3, align 4
  br label %63

; <label>:53:                                     ; preds = %41
  %54 = load i32, i32* %4, align 4
  %55 = icmp eq i32 %54, 98
  br i1 %55, label %56, label %59

; <label>:56:                                     ; preds = %53
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 6)
  %57 = add i64 %pgocount6, 1
  store i64 %57, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 6)
  %58 = load i8**, i8*** %5, align 8
  call void @TeX_skip_args(i8** %58)
  br label %62

; <label>:59:                                     ; preds = %53
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 7)
  %60 = add i64 %pgocount7, 1
  store i64 %60, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_math_check, i64 0, i64 7)
  %61 = load i8**, i8*** %5, align 8
  call void @TeX_skip_parens(i8** %61)
  br label %62

; <label>:62:                                     ; preds = %59, %56
  store i32 0, i32* %3, align 4
  br label %63

; <label>:63:                                     ; preds = %62, %47, %12
  %64 = load i32, i32* %3, align 4
  ret i32 %64
}

; Function Attrs: nounwind uwtable
define internal i32 @TeX_LR_check(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %6 = load i8**, i8*** %5, align 8
  call void @TeX_open_paren(i8** %6)
  %7 = load i8**, i8*** %5, align 8
  %8 = load i8*, i8** %7, align 8
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 1)
  store i8 109, i8* @LaTeX_Mode, align 1
  store i32 0, i32* %3, align 4
  br label %71

; <label>:14:                                     ; preds = %2
  store i8 80, i8* @LaTeX_Mode, align 1
  br label %15

; <label>:15:                                     ; preds = %14
  %16 = load i8**, i8*** %5, align 8
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %18, i8** %16, align 8
  %19 = call i32 @strncmp(i8* %18, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.24, i32 0, i32 0), i64 8) #5
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %66

; <label>:21:                                     ; preds = %15
  %22 = load i8**, i8*** %5, align 8
  call void @TeX_skip_parens(i8** %22)
  %23 = load i8**, i8*** %5, align 8
  %24 = load i8*, i8** %23, align 8
  %25 = load i8, i8* %24, align 1
  %26 = icmp ne i8 %25, 0
  br i1 %26, label %27, label %32

; <label>:27:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 2)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 2)
  %29 = load i8**, i8*** %5, align 8
  %30 = load i8*, i8** %29, align 8
  %31 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %31, i8** %29, align 8
  br label %32

; <label>:32:                                     ; preds = %27, %21
  %33 = load i32, i32* %4, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %46

; <label>:35:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 3)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 3)
  %37 = load i8**, i8*** %5, align 8
  call void @TeX_skip_parens(i8** %37)
  %38 = load i32, i32* @math_mode, align 4
  %39 = add nsw i32 %38, 2
  store i32 %39, i32* @math_mode, align 4
  %40 = load i32, i32* @math_mode, align 4
  %41 = and i32 %40, 127
  %42 = sub nsw i32 %41, 1
  %43 = mul nsw i32 %42, 128
  %44 = load i32, i32* @math_mode, align 4
  %45 = add nsw i32 %44, %43
  store i32 %45, i32* @math_mode, align 4
  br label %65

; <label>:46:                                     ; preds = %32
  %47 = load i32, i32* @math_mode, align 4
  %48 = and i32 %47, 127
  %49 = mul nsw i32 %48, 128
  %50 = load i32, i32* @math_mode, align 4
  %51 = sub nsw i32 %50, %49
  store i32 %51, i32* @math_mode, align 4
  %52 = load i32, i32* @math_mode, align 4
  %53 = icmp slt i32 %52, 0
  br i1 %53, label %54, label %63

; <label>:54:                                     ; preds = %46
  %55 = load i32, i32* @cbench_print, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %61

; <label>:57:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 6)
  %58 = add i64 %pgocount3, 1
  store i64 %58, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 6)
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.26, i32 0, i32 0))
  br label %61

; <label>:61:                                     ; preds = %57, %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 5)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 5)
  store i32 1, i32* @math_mode, align 4
  br label %63

; <label>:63:                                     ; preds = %61, %46
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 4)
  %64 = add i64 %pgocount5, 1
  store i64 %64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 4)
  br label %65

; <label>:65:                                     ; preds = %63, %35
  store i32 1, i32* %3, align 4
  br label %71

; <label>:66:                                     ; preds = %15
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 0)
  %67 = add i64 %pgocount6, 1
  store i64 %67, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TeX_LR_check, i64 0, i64 0)
  %68 = load i8**, i8*** %5, align 8
  %69 = load i8*, i8** %68, align 8
  %70 = getelementptr inbounds i8, i8* %69, i32 -1
  store i8* %70, i8** %68, align 8
  store i32 0, i32* %3, align 4
  br label %71

; <label>:71:                                     ; preds = %66, %65, %12
  %72 = load i32, i32* %3, align 4
  ret i32 %72
}

; Function Attrs: nounwind uwtable
define internal i32 @TeX_math_end(i8**) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i8** %0, i8*** %3, align 8
  %4 = load i8**, i8*** %3, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 9), align 1
  %9 = sext i8 %8 to i32
  %10 = icmp eq i32 %7, %9
  br i1 %10, label %11, label %27

; <label>:11:                                     ; preds = %1
  %12 = load i8**, i8*** %3, align 8
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds i8, i8* %13, i64 1
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 9), align 1
  %18 = sext i8 %17 to i32
  %19 = icmp eq i32 %16, %18
  br i1 %19, label %20, label %25

; <label>:20:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 1)
  %22 = load i8**, i8*** %3, align 8
  %23 = load i8*, i8** %22, align 8
  %24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %24, i8** %22, align 8
  br label %25

; <label>:25:                                     ; preds = %20, %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 0)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 0)
  store i32 1, i32* %2, align 4
  br label %84

; <label>:27:                                     ; preds = %1
  %28 = load i8**, i8*** %3, align 8
  %29 = load i8*, i8** %28, align 8
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 12), align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %31, %33
  br i1 %34, label %35, label %44

; <label>:35:                                     ; preds = %27
  %36 = load i32, i32* @TeX_comment, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %42, label %38

; <label>:38:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 5)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 5)
  %40 = load i32, i32* @math_mode, align 4
  store i32 %40, i32* @save_math_mode, align 4
  %41 = load i8, i8* @LaTeX_Mode, align 1
  store i8 %41, i8* @save_LaTeX_Mode, align 1
  store i32 0, i32* @math_mode, align 4
  store i8 80, i8* @LaTeX_Mode, align 1
  store i32 1, i32* @TeX_comment, align 4
  br label %42

; <label>:42:                                     ; preds = %38, %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 2)
  %43 = add i64 %pgocount3, 1
  store i64 %43, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %84

; <label>:44:                                     ; preds = %27
  br label %45

; <label>:45:                                     ; preds = %44
  %46 = load i8**, i8*** %3, align 8
  %47 = load i8*, i8** %46, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %46, align 8
  %49 = load i8**, i8*** %3, align 8
  %50 = load i8*, i8** %49, align 8
  %51 = load i8, i8* %50, align 1
  %52 = sext i8 %51 to i32
  %53 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 1), align 1
  %54 = sext i8 %53 to i32
  %55 = icmp eq i32 %52, %54
  br i1 %55, label %65, label %56

; <label>:56:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 4)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 4)
  %58 = load i8**, i8*** %3, align 8
  %59 = load i8*, i8** %58, align 8
  %60 = load i8, i8* %59, align 1
  %61 = sext i8 %60 to i32
  %62 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 3), align 1
  %63 = sext i8 %62 to i32
  %64 = icmp eq i32 %61, %63
  br i1 %64, label %65, label %67

; <label>:65:                                     ; preds = %56, %45
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 3)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 3)
  store i32 1, i32* %2, align 4
  br label %84

; <label>:67:                                     ; preds = %56
  %68 = load i8**, i8*** %3, align 8
  %69 = call i32 @TeX_LR_begin(i8** %68)
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %67
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 6)
  %72 = add i64 %pgocount6, 1
  store i64 %72, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 6)
  store i32 1, i32* %2, align 4
  br label %84

; <label>:73:                                     ; preds = %67
  %74 = load i8**, i8*** %3, align 8
  %75 = load i8*, i8** %74, align 8
  %76 = call i32 @TeX_strncmp(i8* %75, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.27, i32 0, i32 0), i32 3)
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %82

; <label>:78:                                     ; preds = %73
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 8)
  %79 = add i64 %pgocount7, 1
  store i64 %79, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 8)
  %80 = load i8**, i8*** %3, align 8
  %81 = call i32 @TeX_math_check(i32 101, i8** %80)
  store i32 %81, i32* %2, align 4
  br label %84

; <label>:82:                                     ; preds = %73
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 7)
  %83 = add i64 %pgocount8, 1
  store i64 %83, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_math_end, i64 0, i64 7)
  store i32 0, i32* %2, align 4
  br label %84

; <label>:84:                                     ; preds = %82, %78, %71, %65, %42, %25
  %85 = load i32, i32* %2, align 4
  ret i32 %85
}

; Function Attrs: nounwind uwtable
define internal i32 @TeX_strncmp(i8*, i8*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %9 = load i8*, i8** %5, align 8
  %10 = load i8*, i8** %6, align 8
  %11 = load i32, i32* %7, align 4
  %12 = sext i32 %11 to i64
  %13 = call i32 @strncmp(i8* %9, i8* %10, i64 %12) #5
  store i32 %13, i32* %8, align 4
  %14 = load i32, i32* %8, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %45

; <label>:16:                                     ; preds = %3
  %17 = load i8*, i8** %5, align 8
  %18 = load i32, i32* %7, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8* %17, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = and i32 %22, -128
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %43

; <label>:25:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_strncmp, i64 0, i64 2)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_strncmp, i64 0, i64 2)
  %27 = call i16** @__ctype_b_loc() #6
  %28 = load i16*, i16** %27, align 8
  %29 = load i8*, i8** %5, align 8
  %30 = load i32, i32* %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8* %29, i64 %31
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i16, i16* %28, i64 %35
  %37 = load i16, i16* %36, align 2
  %38 = zext i16 %37 to i32
  %39 = and i32 %38, 1024
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_strncmp, i64 0, i64 3)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_strncmp, i64 0, i64 3)
  store i32 1, i32* %4, align 4
  br label %48

; <label>:43:                                     ; preds = %25, %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_strncmp, i64 0, i64 1)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_strncmp, i64 0, i64 1)
  br label %45

; <label>:45:                                     ; preds = %43, %3
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_strncmp, i64 0, i64 0)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_strncmp, i64 0, i64 0)
  %47 = load i32, i32* %8, align 4
  store i32 %47, i32* %4, align 4
  br label %48

; <label>:48:                                     ; preds = %45, %41
  %49 = load i32, i32* %4, align 4
  ret i32 %49
}

; Function Attrs: nounwind uwtable
define internal void @TeX_skip_parens(i8**) #0 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8
  br label %3

; <label>:3:                                      ; preds = %29, %1
  %4 = load i8**, i8*** %2, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %27

; <label>:9:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_skip_parens, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_skip_parens, i64 0, i64 1)
  %11 = load i8**, i8*** %2, align 8
  %12 = load i8*, i8** %11, align 8
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 5), align 1
  %16 = sext i8 %15 to i32
  %17 = icmp ne i32 %14, %16
  br i1 %17, label %18, label %27

; <label>:18:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_skip_parens, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_skip_parens, i64 0, i64 2)
  %20 = load i8**, i8*** %2, align 8
  %21 = load i8*, i8** %20, align 8
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 9), align 1
  %25 = sext i8 %24 to i32
  %26 = icmp ne i32 %23, %25
  br label %27

; <label>:27:                                     ; preds = %18, %9, %3
  %28 = phi i1 [ false, %9 ], [ false, %3 ], [ %26, %18 ]
  br i1 %28, label %29, label %34

; <label>:29:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_skip_parens, i64 0, i64 0)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_skip_parens, i64 0, i64 0)
  %31 = load i8**, i8*** %2, align 8
  %32 = load i8*, i8** %31, align 8
  %33 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %33, i8** %31, align 8
  br label %3

; <label>:34:                                     ; preds = %27
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_skip_parens, i64 0, i64 3)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_skip_parens, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @TeX_math_begin(i8**) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i8** %0, i8*** %3, align 8
  %4 = load i8**, i8*** %3, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 9), align 1
  %9 = sext i8 %8 to i32
  %10 = icmp eq i32 %7, %9
  br i1 %10, label %11, label %27

; <label>:11:                                     ; preds = %1
  %12 = load i8**, i8*** %3, align 8
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds i8, i8* %13, i64 1
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 9), align 1
  %18 = sext i8 %17 to i32
  %19 = icmp eq i32 %16, %18
  br i1 %19, label %20, label %25

; <label>:20:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 9)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 9)
  %22 = load i8**, i8*** %3, align 8
  %23 = load i8*, i8** %22, align 8
  %24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %24, i8** %22, align 8
  br label %25

; <label>:25:                                     ; preds = %20, %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 6)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 6)
  store i32 1, i32* %2, align 4
  br label %179

; <label>:27:                                     ; preds = %1
  br label %28

; <label>:28:                                     ; preds = %104, %78, %27
  %29 = load i8**, i8*** %3, align 8
  %30 = load i8*, i8** %29, align 8
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 8), align 1
  %34 = sext i8 %33 to i32
  %35 = icmp eq i32 %32, %34
  br i1 %35, label %36, label %106

; <label>:36:                                     ; preds = %28
  %37 = load i8**, i8*** %3, align 8
  %38 = load i8*, i8** %37, align 8
  %39 = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %39, i8** %37, align 8
  %40 = load i8**, i8*** %3, align 8
  %41 = load i8*, i8** %40, align 8
  %42 = load i8, i8* %41, align 1
  %43 = sext i8 %42 to i32
  %44 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 0), align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %43, %45
  br i1 %46, label %56, label %47

; <label>:47:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 1)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 1)
  %49 = load i8**, i8*** %3, align 8
  %50 = load i8*, i8** %49, align 8
  %51 = load i8, i8* %50, align 1
  %52 = sext i8 %51 to i32
  %53 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 2), align 1
  %54 = sext i8 %53 to i32
  %55 = icmp eq i32 %52, %54
  br i1 %55, label %56, label %58

; <label>:56:                                     ; preds = %47, %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 10)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 10)
  store i32 1, i32* %2, align 4
  br label %179

; <label>:58:                                     ; preds = %47
  %59 = call i16** @__ctype_b_loc() #6
  %60 = load i16*, i16** %59, align 8
  %61 = load i8**, i8*** %3, align 8
  %62 = load i8*, i8** %61, align 8
  %63 = load i8, i8* %62, align 1
  %64 = sext i8 %63 to i32
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i16, i16* %60, i64 %65
  %67 = load i16, i16* %66, align 2
  %68 = zext i16 %67 to i32
  %69 = and i32 %68, 1024
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %83, label %71

; <label>:71:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 3)
  %72 = add i64 %pgocount4, 1
  store i64 %72, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 3)
  %73 = load i8**, i8*** %3, align 8
  %74 = load i8*, i8** %73, align 8
  %75 = load i8, i8* %74, align 1
  %76 = sext i8 %75 to i32
  %77 = icmp ne i32 %76, 64
  br i1 %77, label %78, label %83

; <label>:78:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 4)
  %79 = add i64 %pgocount5, 1
  store i64 %79, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 4)
  %80 = load i8**, i8*** %3, align 8
  %81 = load i8*, i8** %80, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %82, i8** %80, align 8
  br label %28

; <label>:83:                                     ; preds = %71, %58
  %84 = load i8**, i8*** %3, align 8
  %85 = load i8*, i8** %84, align 8
  %86 = call i32 @TeX_strncmp(i8* %85, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.34, i32 0, i32 0), i32 5)
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %99

; <label>:88:                                     ; preds = %83
  %89 = load i8**, i8*** %3, align 8
  %90 = call i32 @TeX_math_check(i32 98, i8** %89)
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %92, label %94

; <label>:92:                                     ; preds = %88
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 12)
  %93 = add i64 %pgocount6, 1
  store i64 %93, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 12)
  store i32 1, i32* %2, align 4
  br label %179

; <label>:94:                                     ; preds = %88
  %95 = load i8**, i8*** %3, align 8
  %96 = load i8*, i8** %95, align 8
  %97 = getelementptr inbounds i8, i8* %96, i32 -1
  store i8* %97, i8** %95, align 8
  br label %98

; <label>:98:                                     ; preds = %94
  br label %102

; <label>:99:                                     ; preds = %83
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 11)
  %100 = add i64 %pgocount7, 1
  store i64 %100, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 11)
  %101 = load i8**, i8*** %3, align 8
  call void @TeX_skip_check(i8** %101)
  store i32 0, i32* %2, align 4
  br label %179

; <label>:102:                                    ; preds = %98
  br label %103

; <label>:103:                                    ; preds = %102
  br label %104

; <label>:104:                                    ; preds = %103
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 2)
  %105 = add i64 %pgocount8, 1
  store i64 %105, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 2)
  br label %28

; <label>:106:                                    ; preds = %28
  %107 = load i8**, i8*** %3, align 8
  %108 = load i8*, i8** %107, align 8
  %109 = load i8, i8* %108, align 1
  %110 = sext i8 %109 to i32
  %111 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 2), align 1
  %112 = sext i8 %111 to i32
  %113 = icmp eq i32 %110, %112
  br i1 %113, label %124, label %114

; <label>:114:                                    ; preds = %106
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 14)
  %115 = add i64 %pgocount9, 1
  store i64 %115, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 14)
  %116 = load i8**, i8*** %3, align 8
  %117 = load i8*, i8** %116, align 8
  %118 = load i8, i8* %117, align 1
  %119 = sext i8 %118 to i32
  %120 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 6), align 1
  %121 = sext i8 %120 to i32
  %122 = icmp eq i32 %119, %121
  br i1 %122, label %124, label %._crit_edge

._crit_edge:                                      ; preds = %114
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 0)
  %123 = add i64 %pgocount10, 1
  store i64 %123, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 0)
  br label %177

; <label>:124:                                    ; preds = %114, %106
  %125 = load i8**, i8*** %3, align 8
  %126 = load i8*, i8** %125, align 8
  %127 = getelementptr inbounds i8, i8* %126, i64 1
  %128 = load i8, i8* %127, align 1
  %129 = sext i8 %128 to i32
  %130 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 11), align 1
  %131 = sext i8 %130 to i32
  %132 = icmp eq i32 %129, %131
  br i1 %132, label %133, label %177

; <label>:133:                                    ; preds = %124
  %134 = load i8**, i8*** %3, align 8
  %135 = load i8*, i8** %134, align 8
  %136 = getelementptr inbounds i8, i8* %135, i32 1
  store i8* %136, i8** %134, align 8
  br label %137

; <label>:137:                                    ; preds = %173, %133
  %138 = load i8**, i8*** %3, align 8
  %139 = load i8*, i8** %138, align 8
  %140 = load i8, i8* %139, align 1
  %141 = icmp ne i8 %140, 0
  br i1 %141, label %142, label %175

; <label>:142:                                    ; preds = %137
  %143 = load i8**, i8*** %3, align 8
  %144 = load i8*, i8** %143, align 8
  %145 = getelementptr inbounds i8, i8* %144, i32 1
  store i8* %145, i8** %143, align 8
  %146 = load i8, i8* %144, align 1
  %147 = sext i8 %146 to i32
  %148 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 11), align 1
  %149 = sext i8 %148 to i32
  %150 = icmp eq i32 %147, %149
  br i1 %150, label %151, label %173

; <label>:151:                                    ; preds = %142
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 7)
  %152 = add i64 %pgocount11, 1
  store i64 %152, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 7)
  %153 = load i8**, i8*** %3, align 8
  %154 = load i8*, i8** %153, align 8
  %155 = load i8, i8* %154, align 1
  %156 = sext i8 %155 to i32
  %157 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 3), align 1
  %158 = sext i8 %157 to i32
  %159 = icmp eq i32 %156, %158
  br i1 %159, label %169, label %160

; <label>:160:                                    ; preds = %151
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 8)
  %161 = add i64 %pgocount12, 1
  store i64 %161, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 8)
  %162 = load i8**, i8*** %3, align 8
  %163 = load i8*, i8** %162, align 8
  %164 = load i8, i8* %163, align 1
  %165 = sext i8 %164 to i32
  %166 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 7), align 1
  %167 = sext i8 %166 to i32
  %168 = icmp eq i32 %165, %167
  br i1 %168, label %169, label %173

; <label>:169:                                    ; preds = %160, %151
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 15)
  %170 = add i64 %pgocount13, 1
  store i64 %170, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 15)
  %171 = load i8**, i8*** %3, align 8
  %172 = call i32 @TeX_math_begin(i8** %171)
  store i32 %172, i32* %2, align 4
  br label %179

; <label>:173:                                    ; preds = %160, %142
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 5)
  %174 = add i64 %pgocount14, 1
  store i64 %174, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 5)
  br label %137

; <label>:175:                                    ; preds = %137
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 16)
  %176 = add i64 %pgocount15, 1
  store i64 %176, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 16)
  store i32 0, i32* %2, align 4
  br label %179

; <label>:177:                                    ; preds = %._crit_edge, %124
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 13)
  %178 = add i64 %pgocount16, 1
  store i64 %178, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_TeX_math_begin, i64 0, i64 13)
  store i32 0, i32* %2, align 4
  br label %179

; <label>:179:                                    ; preds = %177, %175, %169, %99, %92, %56, %25
  %180 = load i32, i32* %2, align 4
  ret i32 %180
}

; Function Attrs: nounwind uwtable
define internal void @TeX_open_paren(i8**) #0 {
  %2 = alloca i8**, align 8
  store i8** %0, i8*** %2, align 8
  br label %3

; <label>:3:                                      ; preds = %29, %1
  %4 = load i8**, i8*** %2, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %27

; <label>:9:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_open_paren, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_open_paren, i64 0, i64 1)
  %11 = load i8**, i8*** %2, align 8
  %12 = load i8*, i8** %11, align 8
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 4), align 1
  %16 = sext i8 %15 to i32
  %17 = icmp ne i32 %14, %16
  br i1 %17, label %18, label %27

; <label>:18:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_open_paren, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_open_paren, i64 0, i64 2)
  %20 = load i8**, i8*** %2, align 8
  %21 = load i8*, i8** %20, align 8
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 16, i64 9), align 1
  %25 = sext i8 %24 to i32
  %26 = icmp ne i32 %23, %25
  br label %27

; <label>:27:                                     ; preds = %18, %9, %3
  %28 = phi i1 [ false, %9 ], [ false, %3 ], [ %26, %18 ]
  br i1 %28, label %29, label %34

; <label>:29:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_open_paren, i64 0, i64 0)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_open_paren, i64 0, i64 0)
  %31 = load i8**, i8*** %2, align 8
  %32 = load i8*, i8** %31, align 8
  %33 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %33, i8** %31, align 8
  br label %3

; <label>:34:                                     ; preds = %27
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_open_paren, i64 0, i64 3)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TeX_open_paren, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @TeX_skip_args(i8**) #0 {
  %2 = alloca i8**, align 8
  %3 = alloca i32, align 4
  store i8** %0, i8*** %2, align 8
  store i32 0, i32* %3, align 4
  %4 = load i8**, i8*** %2, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = call i32 @strncmp(i8* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.23, i32 0, i32 0), i64 7) #5
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %14, label %8

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 0)
  %10 = load i8**, i8*** %2, align 8
  %11 = load i8*, i8** %10, align 8
  %12 = call i32 @strncmp(i8* %11, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.24, i32 0, i32 0), i64 8) #5
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %8, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 1)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 1)
  %16 = load i32, i32* %3, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %3, align 4
  br label %18

; <label>:18:                                     ; preds = %14, %8
  %19 = load i8**, i8*** %2, align 8
  %20 = load i8*, i8** %19, align 8
  %21 = call i32 @strncmp(i8* %20, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.25, i32 0, i32 0), i64 8) #5
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 2)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 2)
  %25 = load i32, i32* %3, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %3, align 4
  br label %27

; <label>:27:                                     ; preds = %23, %18
  %28 = load i8**, i8*** %2, align 8
  call void @TeX_skip_parens(i8** %28)
  %29 = load i8**, i8*** %2, align 8
  %30 = load i8*, i8** %29, align 8
  %31 = load i8, i8* %30, align 1
  %32 = icmp ne i8 %31, 0
  br i1 %32, label %33, label %37

; <label>:33:                                     ; preds = %27
  %34 = load i8**, i8*** %2, align 8
  %35 = load i8*, i8** %34, align 8
  %36 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %36, i8** %34, align 8
  br label %39

; <label>:37:                                     ; preds = %27
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 3)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 3)
  br label %65

; <label>:39:                                     ; preds = %33
  %40 = load i32, i32* %3, align 4
  %41 = add nsw i32 %40, -1
  store i32 %41, i32* %3, align 4
  %42 = icmp ne i32 %40, 0
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %39
  %44 = load i8**, i8*** %2, align 8
  call void @TeX_skip_parens(i8** %44)
  br label %47

; <label>:45:                                     ; preds = %39
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 5)
  %46 = add i64 %pgocount4, 1
  store i64 %46, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 5)
  br label %65

; <label>:47:                                     ; preds = %43
  %48 = load i8**, i8*** %2, align 8
  %49 = load i8*, i8** %48, align 8
  %50 = load i8, i8* %49, align 1
  %51 = icmp ne i8 %50, 0
  br i1 %51, label %52, label %57

; <label>:52:                                     ; preds = %47
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 4)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 4)
  %54 = load i8**, i8*** %2, align 8
  %55 = load i8*, i8** %54, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** %54, align 8
  br label %59

; <label>:57:                                     ; preds = %47
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 7)
  %58 = add i64 %pgocount6, 1
  store i64 %58, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 7)
  br label %65

; <label>:59:                                     ; preds = %52
  %60 = load i32, i32* %3, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %65

; <label>:62:                                     ; preds = %59
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 6)
  %63 = add i64 %pgocount7, 1
  store i64 %63, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TeX_skip_args, i64 0, i64 6)
  %64 = load i8**, i8*** %2, align 8
  call void @TeX_skip_parens(i8** %64)
  br label %65

; <label>:65:                                     ; preds = %62, %59, %57, %45, %37
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @TeX_LR_begin(i8**) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i8** %0, i8*** %3, align 8
  %4 = load i8**, i8*** %3, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = call i32 @TeX_strncmp(i8* %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i32 0, i32 0), i32 4)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %26, label %8

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 1)
  %10 = load i8**, i8*** %3, align 8
  %11 = load i8*, i8** %10, align 8
  %12 = call i32 @TeX_strncmp(i8* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.29, i32 0, i32 0), i32 7)
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %26, label %14

; <label>:14:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 2)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 2)
  %16 = load i8**, i8*** %3, align 8
  %17 = load i8*, i8** %16, align 8
  %18 = call i32 @TeX_strncmp(i8* %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.30, i32 0, i32 0), i32 4)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %26, label %20

; <label>:20:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 3)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 3)
  %22 = load i8**, i8*** %3, align 8
  %23 = load i8*, i8** %22, align 8
  %24 = call i32 @TeX_strncmp(i8* %23, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.31, i32 0, i32 0), i32 8)
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %20, %14, %8, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 0)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 0)
  %28 = load i32, i32* @math_mode, align 4
  %29 = add nsw i32 %28, 2
  store i32 %29, i32* @math_mode, align 4
  br label %69

; <label>:30:                                     ; preds = %20
  %31 = load i8**, i8*** %3, align 8
  %32 = load i8*, i8** %31, align 8
  %33 = call i32 @TeX_strncmp(i8* %32, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.32, i32 0, i32 0), i32 6)
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %41, label %35

; <label>:35:                                     ; preds = %30
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 4)
  %36 = add i64 %pgocount4, 1
  store i64 %36, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 4)
  %37 = load i8**, i8*** %3, align 8
  %38 = load i8*, i8** %37, align 8
  %39 = call i32 @TeX_strncmp(i8* %38, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i32 8)
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %57

; <label>:41:                                     ; preds = %35, %30
  %42 = load i32, i32* @math_mode, align 4
  %43 = add nsw i32 %42, 2
  store i32 %43, i32* @math_mode, align 4
  %44 = load i8**, i8*** %3, align 8
  call void @TeX_open_paren(i8** %44)
  %45 = load i8**, i8*** %3, align 8
  %46 = load i8*, i8** %45, align 8
  %47 = load i8, i8* %46, align 1
  %48 = icmp ne i8 %47, 0
  br i1 %48, label %49, label %54

; <label>:49:                                     ; preds = %41
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 5)
  %50 = add i64 %pgocount5, 1
  store i64 %50, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 5)
  %51 = load i8**, i8*** %3, align 8
  %52 = load i8*, i8** %51, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %51, align 8
  br label %56

; <label>:54:                                     ; preds = %41
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 7)
  %55 = add i64 %pgocount6, 1
  store i64 %55, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 7)
  store i8 114, i8* @LaTeX_Mode, align 1
  br label %56

; <label>:56:                                     ; preds = %54, %49
  br label %68

; <label>:57:                                     ; preds = %35
  %58 = load i8**, i8*** %3, align 8
  %59 = load i8*, i8** %58, align 8
  %60 = call i32 @TeX_strncmp(i8* %59, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.34, i32 0, i32 0), i32 5)
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %66

; <label>:62:                                     ; preds = %57
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 8)
  %63 = add i64 %pgocount7, 1
  store i64 %63, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 8)
  %64 = load i8**, i8*** %3, align 8
  %65 = call i32 @TeX_LR_check(i32 1, i8** %64)
  store i32 %65, i32* %2, align 4
  br label %71

; <label>:66:                                     ; preds = %57
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 6)
  %67 = add i64 %pgocount8, 1
  store i64 %67, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TeX_LR_begin, i64 0, i64 6)
  store i32 0, i32* %2, align 4
  br label %71

; <label>:68:                                     ; preds = %56
  br label %69

; <label>:69:                                     ; preds = %68, %26
  %70 = load i8**, i8*** %3, align 8
  call void @TeX_open_paren(i8** %70)
  store i32 1, i32* %2, align 4
  br label %71

; <label>:71:                                     ; preds = %69, %66, %62
  %72 = load i32, i32* %2, align 4
  ret i32 %72
}

; Function Attrs: nounwind uwtable
define internal void @TeX_skip_check(i8**) #0 {
  %2 = alloca i8**, align 8
  %3 = alloca i32, align 4
  store i8** %0, i8*** %2, align 8
  %4 = load i8**, i8*** %2, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = call i32 @TeX_strncmp(i8* %5, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.27, i32 0, i32 0), i32 3)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %122, label %8

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 1)
  %10 = load i8**, i8*** %2, align 8
  %11 = load i8*, i8** %10, align 8
  %12 = call i32 @TeX_strncmp(i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.35, i32 0, i32 0), i32 6)
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %122, label %14

; <label>:14:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 2)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 2)
  %16 = load i8**, i8*** %2, align 8
  %17 = load i8*, i8** %16, align 8
  %18 = call i32 @TeX_strncmp(i8* %17, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i32 0, i32 0), i32 6)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %122, label %20

; <label>:20:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 4)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 4)
  %22 = load i8**, i8*** %2, align 8
  %23 = load i8*, i8** %22, align 8
  %24 = call i32 @TeX_strncmp(i8* %23, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.37, i32 0, i32 0), i32 4)
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %122, label %26

; <label>:26:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 5)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 5)
  %28 = load i8**, i8*** %2, align 8
  %29 = load i8*, i8** %28, align 8
  %30 = call i32 @TeX_strncmp(i8* %29, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.38, i32 0, i32 0), i32 3)
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %122, label %32

; <label>:32:                                     ; preds = %26
  %pgocount4 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 6)
  %33 = add i64 %pgocount4, 1
  store i64 %33, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 6)
  %34 = load i8**, i8*** %2, align 8
  %35 = load i8*, i8** %34, align 8
  %36 = call i32 @TeX_strncmp(i8* %35, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.32, i32 0, i32 0), i32 6)
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %122, label %38

; <label>:38:                                     ; preds = %32
  %pgocount5 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 7)
  %39 = add i64 %pgocount5, 1
  store i64 %39, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 7)
  %40 = load i8**, i8*** %2, align 8
  %41 = load i8*, i8** %40, align 8
  %42 = call i32 @TeX_strncmp(i8* %41, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.39, i32 0, i32 0), i32 5)
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %122, label %44

; <label>:44:                                     ; preds = %38
  %pgocount6 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 8)
  %45 = add i64 %pgocount6, 1
  store i64 %45, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 8)
  %46 = load i8**, i8*** %2, align 8
  %47 = load i8*, i8** %46, align 8
  %48 = call i32 @TeX_strncmp(i8* %47, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.40, i32 0, i32 0), i32 5)
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %122, label %50

; <label>:50:                                     ; preds = %44
  %pgocount7 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 9)
  %51 = add i64 %pgocount7, 1
  store i64 %51, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 9)
  %52 = load i8**, i8*** %2, align 8
  %53 = load i8*, i8** %52, align 8
  %54 = call i32 @TeX_strncmp(i8* %53, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i32 6)
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %122, label %56

; <label>:56:                                     ; preds = %50
  %pgocount8 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 10)
  %57 = add i64 %pgocount8, 1
  store i64 %57, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 10)
  %58 = load i8**, i8*** %2, align 8
  %59 = load i8*, i8** %58, align 8
  %60 = call i32 @TeX_strncmp(i8* %59, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.42, i32 0, i32 0), i32 7)
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %122, label %62

; <label>:62:                                     ; preds = %56
  %pgocount9 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 11)
  %63 = add i64 %pgocount9, 1
  store i64 %63, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 11)
  %64 = load i8**, i8*** %2, align 8
  %65 = load i8*, i8** %64, align 8
  %66 = call i32 @TeX_strncmp(i8* %65, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.43, i32 0, i32 0), i32 11)
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %122, label %68

; <label>:68:                                     ; preds = %62
  %pgocount10 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 12)
  %69 = add i64 %pgocount10, 1
  store i64 %69, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 12)
  %70 = load i8**, i8*** %2, align 8
  %71 = load i8*, i8** %70, align 8
  %72 = call i32 @TeX_strncmp(i8* %71, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.44, i32 0, i32 0), i32 13)
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %122, label %74

; <label>:74:                                     ; preds = %68
  %pgocount11 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 13)
  %75 = add i64 %pgocount11, 1
  store i64 %75, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 13)
  %76 = load i8**, i8*** %2, align 8
  %77 = load i8*, i8** %76, align 8
  %78 = call i32 @TeX_strncmp(i8* %77, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.45, i32 0, i32 0), i32 13)
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %122, label %80

; <label>:80:                                     ; preds = %74
  %pgocount12 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 14)
  %81 = add i64 %pgocount12, 1
  store i64 %81, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 14)
  %82 = load i8**, i8*** %2, align 8
  %83 = load i8*, i8** %82, align 8
  %84 = call i32 @TeX_strncmp(i8* %83, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.46, i32 0, i32 0), i32 10)
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %122, label %86

; <label>:86:                                     ; preds = %80
  %pgocount13 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 15)
  %87 = add i64 %pgocount13, 1
  store i64 %87, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 15)
  %88 = load i8**, i8*** %2, align 8
  %89 = load i8*, i8** %88, align 8
  %90 = call i32 @TeX_strncmp(i8* %89, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.47, i32 0, i32 0), i32 9)
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %122, label %92

; <label>:92:                                     ; preds = %86
  %pgocount14 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 16)
  %93 = add i64 %pgocount14, 1
  store i64 %93, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 16)
  %94 = load i8**, i8*** %2, align 8
  %95 = load i8*, i8** %94, align 8
  %96 = call i32 @TeX_strncmp(i8* %95, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.48, i32 0, i32 0), i32 13)
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %122, label %98

; <label>:98:                                     ; preds = %92
  %pgocount15 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 17)
  %99 = add i64 %pgocount15, 1
  store i64 %99, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 17)
  %100 = load i8**, i8*** %2, align 8
  %101 = load i8*, i8** %100, align 8
  %102 = call i32 @TeX_strncmp(i8* %101, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.49, i32 0, i32 0), i32 12)
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %122, label %104

; <label>:104:                                    ; preds = %98
  %pgocount16 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 18)
  %105 = add i64 %pgocount16, 1
  store i64 %105, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 18)
  %106 = load i8**, i8*** %2, align 8
  %107 = load i8*, i8** %106, align 8
  %108 = call i32 @TeX_strncmp(i8* %107, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.50, i32 0, i32 0), i32 7)
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %122, label %110

; <label>:110:                                    ; preds = %104
  %pgocount17 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 19)
  %111 = add i64 %pgocount17, 1
  store i64 %111, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 19)
  %112 = load i8**, i8*** %2, align 8
  %113 = load i8*, i8** %112, align 8
  %114 = call i32 @TeX_strncmp(i8* %113, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.51, i32 0, i32 0), i32 11)
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %122, label %116

; <label>:116:                                    ; preds = %110
  %pgocount18 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 20)
  %117 = add i64 %pgocount18, 1
  store i64 %117, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 20)
  %118 = load i8**, i8*** %2, align 8
  %119 = load i8*, i8** %118, align 8
  %120 = call i32 @TeX_strncmp(i8* %119, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.52, i32 0, i32 0), i32 7)
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %133

; <label>:122:                                    ; preds = %116, %110, %104, %98, %92, %86, %80, %74, %68, %62, %56, %50, %44, %38, %32, %26, %20, %14, %8, %1
  %123 = load i8**, i8*** %2, align 8
  call void @TeX_skip_parens(i8** %123)
  %124 = load i8**, i8*** %2, align 8
  %125 = load i8*, i8** %124, align 8
  %126 = load i8, i8* %125, align 1
  %127 = sext i8 %126 to i32
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %129, label %131

; <label>:129:                                    ; preds = %122
  %pgocount19 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 3)
  %130 = add i64 %pgocount19, 1
  store i64 %130, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 3)
  store i8 114, i8* @LaTeX_Mode, align 1
  br label %131

; <label>:131:                                    ; preds = %129, %122
  %pgocount20 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 0)
  %132 = add i64 %pgocount20, 1
  store i64 %132, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 0)
  br label %264

; <label>:133:                                    ; preds = %116
  %134 = load i8**, i8*** %2, align 8
  %135 = load i8*, i8** %134, align 8
  %136 = call i32 @TeX_strncmp(i8* %135, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.53, i32 0, i32 0), i32 4)
  %137 = icmp eq i32 %136, 0
  br i1 %137, label %168, label %138

; <label>:138:                                    ; preds = %133
  %pgocount21 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 23)
  %139 = add i64 %pgocount21, 1
  store i64 %139, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 23)
  %140 = load i8**, i8*** %2, align 8
  %141 = load i8*, i8** %140, align 8
  %142 = call i32 @TeX_strncmp(i8* %141, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.54, i32 0, i32 0), i32 10)
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %168, label %144

; <label>:144:                                    ; preds = %138
  %pgocount22 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 26)
  %145 = add i64 %pgocount22, 1
  store i64 %145, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 26)
  %146 = load i8**, i8*** %2, align 8
  %147 = load i8*, i8** %146, align 8
  %148 = call i32 @TeX_strncmp(i8* %147, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.55, i32 0, i32 0), i32 12)
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %168, label %150

; <label>:150:                                    ; preds = %144
  %pgocount23 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 29)
  %151 = add i64 %pgocount23, 1
  store i64 %151, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 29)
  %152 = load i8**, i8*** %2, align 8
  %153 = load i8*, i8** %152, align 8
  %154 = call i32 @TeX_strncmp(i8* %153, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.56, i32 0, i32 0), i32 9)
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %168, label %156

; <label>:156:                                    ; preds = %150
  %pgocount24 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 31)
  %157 = add i64 %pgocount24, 1
  store i64 %157, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 31)
  %158 = load i8**, i8*** %2, align 8
  %159 = load i8*, i8** %158, align 8
  %160 = call i32 @TeX_strncmp(i8* %159, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.57, i32 0, i32 0), i32 11)
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %168, label %162

; <label>:162:                                    ; preds = %156
  %pgocount25 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 32)
  %163 = add i64 %pgocount25, 1
  store i64 %163, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 32)
  %164 = load i8**, i8*** %2, align 8
  %165 = load i8*, i8** %164, align 8
  %166 = call i32 @TeX_strncmp(i8* %165, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.58, i32 0, i32 0), i32 10)
  %167 = icmp eq i32 %166, 0
  br i1 %167, label %168, label %192

; <label>:168:                                    ; preds = %162, %156, %150, %144, %138, %133
  %169 = load i8**, i8*** %2, align 8
  call void @TeX_skip_parens(i8** %169)
  %170 = load i8**, i8*** %2, align 8
  %171 = load i8*, i8** %170, align 8
  %172 = load i8, i8* %171, align 1
  %173 = sext i8 %172 to i32
  %174 = icmp eq i32 %173, 0
  br i1 %174, label %175, label %177

; <label>:175:                                    ; preds = %168
  %pgocount26 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 28)
  %176 = add i64 %pgocount26, 1
  store i64 %176, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 28)
  store i8 114, i8* @LaTeX_Mode, align 1
  br label %191

; <label>:177:                                    ; preds = %168
  %178 = load i8**, i8*** %2, align 8
  %179 = load i8*, i8** %178, align 8
  %180 = getelementptr inbounds i8, i8* %179, i32 1
  store i8* %180, i8** %178, align 8
  %181 = load i8**, i8*** %2, align 8
  call void @TeX_skip_parens(i8** %181)
  %182 = load i8**, i8*** %2, align 8
  %183 = load i8*, i8** %182, align 8
  %184 = load i8, i8* %183, align 1
  %185 = sext i8 %184 to i32
  %186 = icmp eq i32 %185, 0
  br i1 %186, label %187, label %189

; <label>:187:                                    ; preds = %177
  %pgocount27 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 30)
  %188 = add i64 %pgocount27, 1
  store i64 %188, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 30)
  store i8 114, i8* @LaTeX_Mode, align 1
  br label %189

; <label>:189:                                    ; preds = %187, %177
  %pgocount28 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 25)
  %190 = add i64 %pgocount28, 1
  store i64 %190, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 25)
  br label %191

; <label>:191:                                    ; preds = %189, %175
  br label %263

; <label>:192:                                    ; preds = %162
  %193 = load i8**, i8*** %2, align 8
  %194 = load i8*, i8** %193, align 8
  %195 = call i32 @TeX_strncmp(i8* %194, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.59, i32 0, i32 0), i32 4)
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %197, label %229

; <label>:197:                                    ; preds = %192
  %pgocount29 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 34)
  %198 = add i64 %pgocount29, 1
  store i64 %198, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 34)
  %199 = load i8**, i8*** %2, align 8
  %200 = load i8*, i8** %199, align 8
  %201 = getelementptr inbounds i8, i8* %200, i64 4
  %202 = load i8, i8* %201, align 1
  %203 = sext i8 %202 to i32
  store i32 %203, i32* %3, align 4
  %204 = load i8**, i8*** %2, align 8
  %205 = load i8*, i8** %204, align 8
  %206 = getelementptr inbounds i8, i8* %205, i64 5
  store i8* %206, i8** %204, align 8
  br label %207

; <label>:207:                                    ; preds = %223, %197
  %208 = load i8**, i8*** %2, align 8
  %209 = load i8*, i8** %208, align 8
  %210 = load i8, i8* %209, align 1
  %211 = sext i8 %210 to i32
  %212 = load i32, i32* %3, align 4
  %213 = icmp ne i32 %211, %212
  br i1 %213, label %214, label %221

; <label>:214:                                    ; preds = %207
  %pgocount30 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 27)
  %215 = add i64 %pgocount30, 1
  store i64 %215, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 27)
  %216 = load i8**, i8*** %2, align 8
  %217 = load i8*, i8** %216, align 8
  %218 = load i8, i8* %217, align 1
  %219 = sext i8 %218 to i32
  %220 = icmp ne i32 %219, 0
  br label %221

; <label>:221:                                    ; preds = %214, %207
  %222 = phi i1 [ false, %207 ], [ %220, %214 ]
  br i1 %222, label %223, label %228

; <label>:223:                                    ; preds = %221
  %pgocount31 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 22)
  %224 = add i64 %pgocount31, 1
  store i64 %224, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 22)
  %225 = load i8**, i8*** %2, align 8
  %226 = load i8*, i8** %225, align 8
  %227 = getelementptr inbounds i8, i8* %226, i32 1
  store i8* %227, i8** %225, align 8
  br label %207

; <label>:228:                                    ; preds = %221
  br label %262

; <label>:229:                                    ; preds = %192
  br label %230

; <label>:230:                                    ; preds = %252, %229
  %231 = call i16** @__ctype_b_loc() #6
  %232 = load i16*, i16** %231, align 8
  %233 = load i8**, i8*** %2, align 8
  %234 = load i8*, i8** %233, align 8
  %235 = load i8, i8* %234, align 1
  %236 = sext i8 %235 to i32
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds i16, i16* %232, i64 %237
  %239 = load i16, i16* %238, align 2
  %240 = zext i16 %239 to i32
  %241 = and i32 %240, 1024
  %242 = icmp ne i32 %241, 0
  br i1 %242, label %250, label %243

; <label>:243:                                    ; preds = %230
  %pgocount32 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 24)
  %244 = add i64 %pgocount32, 1
  store i64 %244, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 24)
  %245 = load i8**, i8*** %2, align 8
  %246 = load i8*, i8** %245, align 8
  %247 = load i8, i8* %246, align 1
  %248 = sext i8 %247 to i32
  %249 = icmp eq i32 %248, 64
  br label %250

; <label>:250:                                    ; preds = %243, %230
  %251 = phi i1 [ true, %230 ], [ %249, %243 ]
  br i1 %251, label %252, label %257

; <label>:252:                                    ; preds = %250
  %pgocount33 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 21)
  %253 = add i64 %pgocount33, 1
  store i64 %253, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 21)
  %254 = load i8**, i8*** %2, align 8
  %255 = load i8*, i8** %254, align 8
  %256 = getelementptr inbounds i8, i8* %255, i32 1
  store i8* %256, i8** %254, align 8
  br label %230

; <label>:257:                                    ; preds = %250
  %pgocount34 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 33)
  %258 = add i64 %pgocount34, 1
  store i64 %258, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_TeX_skip_check, i64 0, i64 33)
  %259 = load i8**, i8*** %2, align 8
  %260 = load i8*, i8** %259, align 8
  %261 = getelementptr inbounds i8, i8* %260, i32 -1
  store i8* %261, i8** %259, align 8
  br label %262

; <label>:262:                                    ; preds = %257, %228
  br label %263

; <label>:263:                                    ; preds = %262, %191
  br label %264

; <label>:264:                                    ; preds = %263, %131
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
