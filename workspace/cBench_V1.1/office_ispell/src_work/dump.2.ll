; ModuleID = 'tmp1.ll'
source_filename = "dump.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashheader = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i8], [13 x i8], i8, i8, i8, [228 x i16], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [128 x i8], [100 x [11 x i8]], [100 x i32], [100 x i32], i16 }
%struct.flagent = type { i8*, i8*, i16, i16, i16, i16, i16, [228 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@hashheader = external global %struct.hashheader, align 4
@.str = private unnamed_addr constant [16 x i8] c"flagmarker \5C%c\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"flagmarker \5C%3.3o\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"flagmarker %c\0A\00", align 1
@numpflags = external global i32, align 4
@.str.3 = private unnamed_addr constant [10 x i8] c"prefixes\0A\00", align 1
@pflaglist = external global %struct.flagent*, align 8
@numsflags = external global i32, align 4
@.str.4 = private unnamed_addr constant [10 x i8] c"suffixes\0A\00", align 1
@sflaglist = external global %struct.flagent*, align 8
@.str.5 = private unnamed_addr constant [14 x i8] c"  flag %s%c: \00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c" \00", align 1
@outfile1 = external global %struct._IO_FILE*, align 8
@.str.8 = private unnamed_addr constant [4 x i8] c"\09> \00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"-%s,\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"[^\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"%c-%c\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_dumpmode = private constant [8 x i8] c"dumpmode"
@__profn_tmp1.ll_tbldump = private constant [15 x i8] c"tmp1.ll:tbldump"
@__profn_tmp1.ll_entdump = private constant [15 x i8] c"tmp1.ll:entdump"
@__profn_tmp1.ll_setdump = private constant [15 x i8] c"tmp1.ll:setdump"
@__profn_tmp1.ll_subsetdump = private constant [18 x i8] c"tmp1.ll:subsetdump"
@__profc_dumpmode = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_dumpmode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1515354312303029848, i64 129970294761, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i32 0, i32 0), i8* bitcast (void ()* @dumpmode to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_tbldump = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_tbldump = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4417035755857861726, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_tbldump, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_entdump = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_entdump = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -855820584397969946, i64 72057680739739624, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_setdump = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_setdump = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2908638386633715428, i64 92734603908, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_subsetdump = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_subsetdump = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5568744753812952393, i64 131366806285, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [47 x i8] c"K-x\DAK)\CD-\C8\CDOIe,\C9-0\D4\CB\C9\B1*I\CAI\01\8A\C1\F9\A9y%(\FC\E2T4~i\12T\08\00\11\BC\1B\AB", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_dumpmode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_tbldump to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_entdump to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_setdump to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_subsetdump to i8*), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @dumpmode() #0 {
  %1 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %2 = sext i8 %1 to i32
  %3 = icmp eq i32 %2, 92
  br i1 %3, label %34, label %4

; <label>:4:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 3)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 3)
  %6 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %7 = sext i8 %6 to i32
  %8 = icmp eq i32 %7, 35
  br i1 %8, label %34, label %9

; <label>:9:                                      ; preds = %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 4)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 4)
  %11 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 62
  br i1 %13, label %34, label %14

; <label>:14:                                     ; preds = %9
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 5)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 5)
  %16 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %17 = sext i8 %16 to i32
  %18 = icmp eq i32 %17, 58
  br i1 %18, label %34, label %19

; <label>:19:                                     ; preds = %14
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 6)
  %20 = add i64 %pgocount3, 1
  store i64 %20, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 6)
  %21 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 45
  br i1 %23, label %34, label %24

; <label>:24:                                     ; preds = %19
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 7)
  %25 = add i64 %pgocount4, 1
  store i64 %25, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 7)
  %26 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %27 = sext i8 %26 to i32
  %28 = icmp eq i32 %27, 44
  br i1 %28, label %34, label %29

; <label>:29:                                     ; preds = %24
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 8)
  %30 = add i64 %pgocount5, 1
  store i64 %30, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 8)
  %31 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %32, 91
  br i1 %33, label %34, label %39

; <label>:34:                                     ; preds = %29, %24, %19, %14, %9, %4, %0
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 0)
  %35 = add i64 %pgocount6, 1
  store i64 %35, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 0)
  %36 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %37 = sext i8 %36 to i32
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i32 %37)
  br label %60

; <label>:39:                                     ; preds = %29
  %40 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %41 = sext i8 %40 to i32
  %42 = icmp slt i32 %41, 32
  br i1 %42, label %48, label %43

; <label>:43:                                     ; preds = %39
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 10)
  %44 = add i64 %pgocount7, 1
  store i64 %44, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 10)
  %45 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %46 = sext i8 %45 to i32
  %47 = icmp sge i32 %46, 127
  br i1 %47, label %48, label %54

; <label>:48:                                     ; preds = %43, %39
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 9)
  %49 = add i64 %pgocount8, 1
  store i64 %49, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 9)
  %50 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %51 = sext i8 %50 to i32
  %52 = and i32 %51, 255
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0), i32 %52)
  br label %59

; <label>:54:                                     ; preds = %43
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 11)
  %55 = add i64 %pgocount9, 1
  store i64 %55, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 11)
  %56 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %57 = sext i8 %56 to i32
  %58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 %57)
  br label %59

; <label>:59:                                     ; preds = %54, %48
  br label %60

; <label>:60:                                     ; preds = %59, %34
  %61 = load i32, i32* @numpflags, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %68

; <label>:63:                                     ; preds = %60
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 1)
  %64 = add i64 %pgocount10, 1
  store i64 %64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 1)
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0))
  %66 = load %struct.flagent*, %struct.flagent** @pflaglist, align 8
  %67 = load i32, i32* @numpflags, align 4
  call void @tbldump(%struct.flagent* %66, i32 %67)
  br label %68

; <label>:68:                                     ; preds = %63, %60
  %69 = load i32, i32* @numsflags, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %76

; <label>:71:                                     ; preds = %68
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 2)
  %72 = add i64 %pgocount11, 1
  store i64 %72, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_dumpmode, i64 0, i64 2)
  %73 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0))
  %74 = load %struct.flagent*, %struct.flagent** @sflaglist, align 8
  %75 = load i32, i32* @numsflags, align 4
  call void @tbldump(%struct.flagent* %74, i32 %75)
  br label %76

; <label>:76:                                     ; preds = %71, %68
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal void @tbldump(%struct.flagent*, i32) #0 {
  %3 = alloca %struct.flagent*, align 8
  %4 = alloca i32, align 4
  store %struct.flagent* %0, %struct.flagent** %3, align 8
  store i32 %1, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %9, %2
  %6 = load i32, i32* %4, align 4
  %7 = add nsw i32 %6, -1
  store i32 %7, i32* %4, align 4
  %8 = icmp sge i32 %7, 0
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_tbldump, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_tbldump, i64 0, i64 0)
  %11 = load %struct.flagent*, %struct.flagent** %3, align 8
  %12 = getelementptr inbounds %struct.flagent, %struct.flagent* %11, i32 1
  store %struct.flagent* %12, %struct.flagent** %3, align 8
  call void @entdump(%struct.flagent* %11)
  br label %5

; <label>:13:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_tbldump, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_tbldump, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @entdump(%struct.flagent*) #0 {
  %2 = alloca %struct.flagent*, align 8
  %3 = alloca i32, align 4
  store %struct.flagent* %0, %struct.flagent** %2, align 8
  %4 = load %struct.flagent*, %struct.flagent** %2, align 8
  %5 = getelementptr inbounds %struct.flagent, %struct.flagent* %4, i32 0, i32 6
  %6 = load i16, i16* %5, align 8
  %7 = sext i16 %6 to i32
  %8 = and i32 %7, 1
  %9 = icmp ne i32 %8, 0
  %10 = zext i1 %9 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 6)
  %11 = add i64 %pgocount, %10
  store i64 %11, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 6)
  %12 = select i1 %9, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)
  %13 = load %struct.flagent*, %struct.flagent** %2, align 8
  %14 = getelementptr inbounds %struct.flagent, %struct.flagent* %13, i32 0, i32 2
  %15 = load i16, i16* %14, align 8
  %16 = sext i16 %15 to i32
  %17 = add nsw i32 %16, 65
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i32 0, i32 0), i8* %12, i32 %17)
  store i32 0, i32* %3, align 4
  br label %19

; <label>:19:                                     ; preds = %45, %1
  %20 = load i32, i32* %3, align 4
  %21 = load %struct.flagent*, %struct.flagent** %2, align 8
  %22 = getelementptr inbounds %struct.flagent, %struct.flagent* %21, i32 0, i32 5
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i32
  %25 = icmp slt i32 %20, %24
  br i1 %25, label %26, label %48

; <label>:26:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 0)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 0)
  %28 = load %struct.flagent*, %struct.flagent** %2, align 8
  %29 = getelementptr inbounds %struct.flagent, %struct.flagent* %28, i32 0, i32 7
  %30 = getelementptr inbounds [228 x i8], [228 x i8]* %29, i32 0, i32 0
  %31 = load i32, i32* %3, align 4
  %32 = shl i32 1, %31
  call void @setdump(i8* %30, i32 %32)
  %33 = load i32, i32* %3, align 4
  %34 = load %struct.flagent*, %struct.flagent** %2, align 8
  %35 = getelementptr inbounds %struct.flagent, %struct.flagent* %34, i32 0, i32 5
  %36 = load i16, i16* %35, align 2
  %37 = sext i16 %36 to i32
  %38 = sub nsw i32 %37, 1
  %39 = icmp slt i32 %33, %38
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 1)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 1)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %43 = call i32 @_IO_putc(i32 32, %struct._IO_FILE* %42)
  br label %44

; <label>:44:                                     ; preds = %40, %26
  br label %45

; <label>:45:                                     ; preds = %44
  %46 = load i32, i32* %3, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %3, align 4
  br label %19

; <label>:48:                                     ; preds = %19
  %49 = load i32, i32* %3, align 4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %55

; <label>:51:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 4)
  %52 = add i64 %pgocount3, 1
  store i64 %52, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 4)
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %54 = call i32 @_IO_putc(i32 46, %struct._IO_FILE* %53)
  br label %55

; <label>:55:                                     ; preds = %51, %48
  %56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0))
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %58 = call i32 @_IO_putc(i32 9, %struct._IO_FILE* %57)
  %59 = load %struct.flagent*, %struct.flagent** %2, align 8
  %60 = getelementptr inbounds %struct.flagent, %struct.flagent* %59, i32 0, i32 3
  %61 = load i16, i16* %60, align 2
  %62 = icmp ne i16 %61, 0
  br i1 %62, label %63, label %70

; <label>:63:                                     ; preds = %55
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 2)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 2)
  %65 = load %struct.flagent*, %struct.flagent** %2, align 8
  %66 = getelementptr inbounds %struct.flagent, %struct.flagent* %65, i32 0, i32 0
  %67 = load i8*, i8** %66, align 8
  %68 = call i8* @ichartosstr(i8* %67, i32 1)
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i8* %68)
  br label %70

; <label>:70:                                     ; preds = %63, %55
  %71 = load %struct.flagent*, %struct.flagent** %2, align 8
  %72 = getelementptr inbounds %struct.flagent, %struct.flagent* %71, i32 0, i32 4
  %73 = load i16, i16* %72, align 4
  %74 = sext i16 %73 to i32
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %82

; <label>:76:                                     ; preds = %70
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 3)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 3)
  %78 = load %struct.flagent*, %struct.flagent** %2, align 8
  %79 = getelementptr inbounds %struct.flagent, %struct.flagent* %78, i32 0, i32 1
  %80 = load i8*, i8** %79, align 8
  %81 = call i8* @ichartosstr(i8* %80, i32 1)
  br label %84

; <label>:82:                                     ; preds = %70
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 5)
  %83 = add i64 %pgocount6, 1
  store i64 %83, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_entdump, i64 0, i64 5)
  br label %84

; <label>:84:                                     ; preds = %82, %76
  %85 = phi i8* [ %81, %76 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), %82 ]
  %86 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8* %85)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @setdump(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %7, align 4
  store i32 0, i32* %6, align 4
  store i32 128, i32* %5, align 4
  br label %8

; <label>:8:                                      ; preds = %27, %2
  %9 = load i32, i32* %5, align 4
  %10 = add nsw i32 %9, -1
  store i32 %10, i32* %5, align 4
  %11 = icmp sge i32 %10, 0
  br i1 %11, label %12, label %29

; <label>:12:                                     ; preds = %8
  %13 = load i8*, i8** %3, align 8
  %14 = load i32, i32* %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, i8* %13, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = load i32, i32* %4, align 4
  %20 = and i32 %18, %19
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %27

; <label>:22:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 1)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 1)
  %24 = load i32, i32* %7, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %7, align 4
  %26 = load i32, i32* %5, align 4
  store i32 %26, i32* %6, align 4
  br label %27

; <label>:27:                                     ; preds = %22, %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 0)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 0)
  br label %8

; <label>:29:                                     ; preds = %8
  %30 = load i32, i32* %7, align 4
  %31 = icmp eq i32 %30, 1
  br i1 %31, label %32, label %37

; <label>:32:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 2)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 2)
  %34 = load i32, i32* %6, align 4
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %36 = call i32 @_IO_putc(i32 %34, %struct._IO_FILE* %35)
  br label %65

; <label>:37:                                     ; preds = %29
  %38 = load i32, i32* %7, align 4
  %39 = icmp eq i32 %38, 128
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 3)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 3)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %43 = call i32 @_IO_putc(i32 46, %struct._IO_FILE* %42)
  br label %64

; <label>:44:                                     ; preds = %37
  %45 = load i32, i32* %7, align 4
  %46 = icmp sgt i32 %45, 64
  br i1 %46, label %47, label %54

; <label>:47:                                     ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 4)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 4)
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0))
  %50 = load i8*, i8** %3, align 8
  %51 = load i32, i32* %4, align 4
  call void @subsetdump(i8* %50, i32 %51, i32 0)
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %53 = call i32 @_IO_putc(i32 93, %struct._IO_FILE* %52)
  br label %63

; <label>:54:                                     ; preds = %44
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 5)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_setdump, i64 0, i64 5)
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %57 = call i32 @_IO_putc(i32 91, %struct._IO_FILE* %56)
  %58 = load i8*, i8** %3, align 8
  %59 = load i32, i32* %4, align 4
  %60 = load i32, i32* %4, align 4
  call void @subsetdump(i8* %58, i32 %59, i32 %60)
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %62 = call i32 @_IO_putc(i32 93, %struct._IO_FILE* %61)
  br label %63

; <label>:63:                                     ; preds = %54, %47
  br label %64

; <label>:64:                                     ; preds = %63, %40
  br label %65

; <label>:65:                                     ; preds = %64, %32
  ret void
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

declare i8* @ichartosstr(i8*, i32) #1

; Function Attrs: nounwind uwtable
define internal void @subsetdump(i8*, i32, i32) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %9

; <label>:9:                                      ; preds = %82, %3
  %10 = load i32, i32* %7, align 4
  %11 = icmp slt i32 %10, 128
  br i1 %11, label %12, label %88

; <label>:12:                                     ; preds = %9
  %13 = load i8*, i8** %4, align 8
  %14 = load i8, i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = load i32, i32* %6, align 4
  %17 = xor i32 %15, %16
  %18 = load i32, i32* %5, align 4
  %19 = and i32 %17, %18
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %81

; <label>:21:                                     ; preds = %12
  %22 = load i32, i32* %7, align 4
  store i32 %22, i32* %8, align 4
  br label %23

; <label>:23:                                     ; preds = %38, %21
  %24 = load i32, i32* %7, align 4
  %25 = icmp slt i32 %24, 128
  br i1 %25, label %26, label %44

; <label>:26:                                     ; preds = %23
  %27 = load i8*, i8** %4, align 8
  %28 = load i8, i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = load i32, i32* %6, align 4
  %31 = xor i32 %29, %30
  %32 = load i32, i32* %5, align 4
  %33 = and i32 %31, %32
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 4)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 4)
  br label %44

; <label>:37:                                     ; preds = %26
  br label %38

; <label>:38:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 0)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 0)
  %40 = load i8*, i8** %4, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %4, align 8
  %42 = load i32, i32* %7, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %7, align 4
  br label %23

; <label>:44:                                     ; preds = %35, %23
  %45 = load i32, i32* %7, align 4
  %46 = load i32, i32* %8, align 4
  %47 = add nsw i32 %46, 1
  %48 = icmp eq i32 %45, %47
  br i1 %48, label %49, label %54

; <label>:49:                                     ; preds = %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 3)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 3)
  %51 = load i32, i32* %8, align 4
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %53 = call i32 @_IO_putc(i32 %51, %struct._IO_FILE* %52)
  br label %80

; <label>:54:                                     ; preds = %44
  %55 = load i32, i32* %7, align 4
  %56 = load i32, i32* %8, align 4
  %57 = add nsw i32 %56, 3
  %58 = icmp sle i32 %55, %57
  br i1 %58, label %59, label %73

; <label>:59:                                     ; preds = %54
  br label %60

; <label>:60:                                     ; preds = %64, %59
  %61 = load i32, i32* %8, align 4
  %62 = load i32, i32* %7, align 4
  %63 = icmp slt i32 %61, %62
  br i1 %63, label %64, label %71

; <label>:64:                                     ; preds = %60
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 1)
  %65 = add i64 %pgocount3, 1
  store i64 %65, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 1)
  %66 = load i32, i32* %8, align 4
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %68 = call i32 @_IO_putc(i32 %66, %struct._IO_FILE* %67)
  %69 = load i32, i32* %8, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %8, align 4
  br label %60

; <label>:71:                                     ; preds = %60
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 5)
  %72 = add i64 %pgocount4, 1
  store i64 %72, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 5)
  br label %79

; <label>:73:                                     ; preds = %54
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 6)
  %74 = add i64 %pgocount5, 1
  store i64 %74, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 6)
  %75 = load i32, i32* %8, align 4
  %76 = load i32, i32* %7, align 4
  %77 = sub nsw i32 %76, 1
  %78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i32 0, i32 0), i32 %75, i32 %77)
  br label %79

; <label>:79:                                     ; preds = %73, %71
  br label %80

; <label>:80:                                     ; preds = %79, %49
  br label %81

; <label>:81:                                     ; preds = %80, %12
  br label %82

; <label>:82:                                     ; preds = %81
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 2)
  %83 = add i64 %pgocount6, 1
  store i64 %83, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 2)
  %84 = load i8*, i8** %4, align 8
  %85 = getelementptr inbounds i8, i8* %84, i32 1
  store i8* %85, i8** %4, align 8
  %86 = load i32, i32* %7, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %7, align 4
  br label %9

; <label>:88:                                     ; preds = %9
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 7)
  %89 = add i64 %pgocount7, 1
  store i64 %89, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_subsetdump, i64 0, i64 7)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
