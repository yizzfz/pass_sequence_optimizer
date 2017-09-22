; ModuleID = 'tmp1.ll'
source_filename = "random.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.IdeaRandContext = type { [8 x i8], [52 x i16], i32, [8 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.IdeaCfbContext = type { [8 x i8], [8 x i8], [52 x i16], i32 }

$__llvm_profile_raw_version = comdat any

@randSeedOpen = internal global i8 0, align 1
@globalRandseedName = external global [256 x i8], align 16
@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@randContext = internal global %struct.IdeaRandContext zeroinitializer, align 4
@.str.1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@cryptRandSave.savedwashed = internal global i8 0, align 1
@trueRandBits = internal global i32 0, align 4
@.str.2 = private unnamed_addr constant [22 x i8] c"trueRandBits >= count\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"random.c\00", align 1
@__PRETTY_FUNCTION__.trueRandConsume = private unnamed_addr constant [35 x i8] c"void trueRandConsume(unsigned int)\00", align 1
@trueRandPending = internal global i32 0, align 4
@trueRandEvent.event1 = internal global i32 0, align 4
@trueRandEvent.event2 = internal global i32 0, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [182 x i8] c"\0AWe need to generate %u random bits.  This is done by measuring the\0Atime intervals between your keystrokes.  Please enter some random text\0Aon your keyboard until you hear the beep:\0A\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"\0D%4d \00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"\0D   0 *\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"\07 -Enough, thank you.\0A\00", align 1
@stdout = external global %struct._IO_FILE*, align 8
@.str.8 = private unnamed_addr constant [4 x i8] c"\07*\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_cryptRandOpen = private constant [13 x i8] c"cryptRandOpen"
@__profn_cryptRandInit = private constant [13 x i8] c"cryptRandInit"
@__profn_trueRandByte = private constant [12 x i8] c"trueRandByte"
@__profn_cryptRandByte = private constant [13 x i8] c"cryptRandByte"
@__profn_cryptRandWriteFile = private constant [18 x i8] c"cryptRandWriteFile"
@__profn_cryptRandSave = private constant [13 x i8] c"cryptRandSave"
@__profn_trueRandFlush = private constant [13 x i8] c"trueRandFlush"
@__profn_trueRandConsume = private constant [15 x i8] c"trueRandConsume"
@__profn_trueRandAccum = private constant [13 x i8] c"trueRandAccum"
@__profn_trueRandEvent = private constant [13 x i8] c"trueRandEvent"
@__profn_trueRandAccumLater = private constant [18 x i8] c"trueRandAccumLater"
@__profn_tmp1.ll_flush_input = private constant [19 x i8] c"tmp1.ll:flush_input"
@__profn_getstring = private constant [9 x i8] c"getstring"
@__profc_cryptRandOpen = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_cryptRandOpen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5510213424129277400, i64 99898500998, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i32 0, i32 0), i8* bitcast (i32 (%struct.IdeaCfbContext*)* @cryptRandOpen to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_cryptRandInit = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_cryptRandInit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5638938017237853486, i64 44592619267, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cryptRandInit, i32 0, i32 0), i8* bitcast (void (%struct.IdeaCfbContext*)* @cryptRandInit to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_trueRandByte = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_trueRandByte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8104558490470229642, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_trueRandByte, i32 0, i32 0), i8* bitcast (i32 ()* @trueRandByte to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_cryptRandByte = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_cryptRandByte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4618504362725372156, i64 22759827559, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cryptRandByte, i32 0, i32 0), i8* bitcast (i8 ()* @cryptRandByte to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_cryptRandWriteFile = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_cryptRandWriteFile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4606451296929693479, i64 72057714439829917, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.IdeaCfbContext*, i32)* @cryptRandWriteFile to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_cryptRandSave = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_cryptRandSave = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3135476558969371181, i64 57052125916, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_cryptRandSave, i32 0, i32 0), i8* bitcast (void (%struct.IdeaCfbContext*)* @cryptRandSave to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_trueRandFlush = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_trueRandFlush = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3052424971694057888, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_trueRandFlush, i32 0, i32 0), i8* bitcast (void ()* @trueRandFlush to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_trueRandConsume = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_trueRandConsume = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7113791622986146030, i64 33962515092, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_trueRandConsume, i32 0, i32 0), i8* bitcast (void (i32)* @trueRandConsume to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_trueRandAccum = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_trueRandAccum = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5377346105670852067, i64 72057651968210918, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trueRandAccum, i32 0, i32 0), i8* bitcast (void (i32)* @trueRandAccum to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_trueRandEvent = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_trueRandEvent = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8518201066037716048, i64 85579114605, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i32 0, i32 0), i8* bitcast (i32 (i32)* @trueRandEvent to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_trueRandAccumLater = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_trueRandAccumLater = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7089070131709948979, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_trueRandAccumLater, i32 0, i32 0), i8* bitcast (void (i32)* @trueRandAccumLater to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_flush_input = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_flush_input = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1740811515377157990, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_flush_input, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_getstring = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_getstring = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5274785776018088856, i64 176414857490, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32)* @getstring to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [197 x i8] c"\C2\01\00cryptRandOpen\01cryptRandInit\01trueRandByte\01cryptRandByte\01cryptRandWriteFile\01cryptRandSave\01trueRandFlush\01trueRandConsume\01trueRandAccum\01trueRandEvent\01trueRandAccumLater\01tmp1.ll:flush_input\01getstring", section "__llvm_prf_names"
@llvm.used = appending global [14 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_cryptRandOpen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_cryptRandInit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_trueRandByte to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_cryptRandByte to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_cryptRandWriteFile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_cryptRandSave to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_trueRandFlush to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_trueRandConsume to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_trueRandAccum to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_trueRandEvent to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_trueRandAccumLater to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_flush_input to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_getstring to i8*), i8* getelementptr inbounds ([197 x i8], [197 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @cryptRandOpen(%struct.IdeaCfbContext*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.IdeaCfbContext*, align 8
  %4 = alloca [256 x i8], align 16
  %5 = alloca i32, align 4
  %6 = alloca %struct._IO_FILE*, align 8
  store %struct.IdeaCfbContext* %0, %struct.IdeaCfbContext** %3, align 8
  %7 = load i8, i8* @randSeedOpen, align 1
  %8 = icmp ne i8 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 2)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %66

; <label>:11:                                     ; preds = %1
  %12 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalRandseedName, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %12, %struct._IO_FILE** %6, align 8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp ne %struct._IO_FILE* %13, null
  br i1 %14, label %17, label %15

; <label>:15:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 3)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 3)
  store i32 -1, i32* %2, align 4
  br label %66

; <label>:17:                                     ; preds = %11
  %18 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %20 = call i64 @fread(i8* %18, i64 1, i64 24, %struct._IO_FILE* %19)
  %21 = trunc i64 %20 to i32
  store i32 %21, i32* %5, align 4
  %22 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %3, align 8
  %23 = icmp ne %struct.IdeaCfbContext* %22, null
  br i1 %23, label %24, label %29

; <label>:24:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 4)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 4)
  %26 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %3, align 8
  %27 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %28 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  call void @ideaCfbEncrypt(%struct.IdeaCfbContext* %26, i8* %27, i8* %28, i32 24)
  br label %29

; <label>:29:                                     ; preds = %24, %17
  %30 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %31 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %32 = getelementptr inbounds i8, i8* %31, i64 16
  call void @ideaRandInit(%struct.IdeaRandContext* @randContext, i8* %30, i8* %32)
  store i8 1, i8* @randSeedOpen, align 1
  %33 = load i32, i32* %5, align 4
  %34 = icmp ne i32 %33, 24
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 5)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 5)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %38 = call i32 @fclose(%struct._IO_FILE* %37)
  store i32 -1, i32* %2, align 4
  br label %66

; <label>:39:                                     ; preds = %29
  br label %40

; <label>:40:                                     ; preds = %58, %39
  %41 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %43 = call i64 @fread(i8* %41, i64 1, i64 256, %struct._IO_FILE* %42)
  %44 = trunc i64 %43 to i32
  store i32 %44, i32* %5, align 4
  %45 = load i32, i32* %5, align 4
  %46 = icmp sle i32 %45, 0
  br i1 %46, label %47, label %49

; <label>:47:                                     ; preds = %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 6)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 6)
  br label %62

; <label>:49:                                     ; preds = %40
  %50 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %3, align 8
  %51 = icmp ne %struct.IdeaCfbContext* %50, null
  br i1 %51, label %52, label %58

; <label>:52:                                     ; preds = %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 1)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 1)
  %54 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %3, align 8
  %55 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %56 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %57 = load i32, i32* %5, align 4
  call void @ideaCfbEncrypt(%struct.IdeaCfbContext* %54, i8* %55, i8* %56, i32 %57)
  br label %58

; <label>:58:                                     ; preds = %52, %49
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 0)
  %59 = add i64 %pgocount6, 1
  store i64 %59, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_cryptRandOpen, i64 0, i64 0)
  %60 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i32 0, i32 0
  %61 = load i32, i32* %5, align 4
  call void @randPoolAddBytes(i8* %60, i32 %61)
  br label %40

; <label>:62:                                     ; preds = %47
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %64 = call i32 @fclose(%struct._IO_FILE* %63)
  %65 = bitcast [256 x i8]* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %65, i8 0, i64 256, i32 16, i1 false)
  store i32 0, i32* %2, align 4
  br label %66

; <label>:66:                                     ; preds = %62, %35, %15, %9
  %67 = load i32, i32* %2, align 4
  ret i32 %67
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare void @ideaCfbEncrypt(%struct.IdeaCfbContext*, i8*, i8*, i32) #1

declare void @ideaRandInit(%struct.IdeaRandContext*, i8*, i8*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare void @randPoolAddBytes(i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: noinline nounwind uwtable
define void @cryptRandInit(%struct.IdeaCfbContext*) #0 {
  %2 = alloca %struct.IdeaCfbContext*, align 8
  %3 = alloca [24 x i8], align 16
  %4 = alloca i32, align 4
  store %struct.IdeaCfbContext* %0, %struct.IdeaCfbContext** %2, align 8
  store i32 0, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %15, %1
  %6 = load i32, i32* %4, align 4
  %7 = sext i32 %6 to i64
  %8 = icmp ult i64 %7, 24
  br i1 %8, label %9, label %19

; <label>:9:                                      ; preds = %5
  %10 = call i32 @trueRandByte()
  %11 = trunc i32 %10 to i8
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [24 x i8], [24 x i8]* %3, i64 0, i64 %13
  store i8 %11, i8* %14, align 1
  br label %15

; <label>:15:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cryptRandInit, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cryptRandInit, i64 0, i64 0)
  %17 = load i32, i32* %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %4, align 4
  br label %5

; <label>:19:                                     ; preds = %5
  %20 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %2, align 8
  %21 = icmp ne %struct.IdeaCfbContext* %20, null
  br i1 %21, label %22, label %27

; <label>:22:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cryptRandInit, i64 0, i64 2)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cryptRandInit, i64 0, i64 2)
  %24 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %2, align 8
  %25 = getelementptr inbounds [24 x i8], [24 x i8]* %3, i32 0, i32 0
  %26 = getelementptr inbounds [24 x i8], [24 x i8]* %3, i32 0, i32 0
  call void @ideaCfbEncrypt(%struct.IdeaCfbContext* %24, i8* %25, i8* %26, i32 24)
  br label %27

; <label>:27:                                     ; preds = %22, %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cryptRandInit, i64 0, i64 1)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_cryptRandInit, i64 0, i64 1)
  %29 = getelementptr inbounds [24 x i8], [24 x i8]* %3, i32 0, i32 0
  %30 = getelementptr inbounds [24 x i8], [24 x i8]* %3, i32 0, i32 0
  %31 = getelementptr inbounds i8, i8* %30, i64 16
  call void @ideaRandInit(%struct.IdeaRandContext* @randContext, i8* %29, i8* %31)
  store i8 1, i8* @randSeedOpen, align 1
  %32 = bitcast [24 x i8]* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %32, i8 0, i64 24, i32 16, i1 false)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @trueRandByte() #0 {
  %1 = load i32, i32* @trueRandPending, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %5

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_trueRandByte, i64 0, i64 1)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_trueRandByte, i64 0, i64 1)
  call void @trueRandAccum(i32 0)
  br label %5

; <label>:5:                                      ; preds = %3, %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_trueRandByte, i64 0, i64 0)
  %6 = add i64 %pgocount1, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_trueRandByte, i64 0, i64 0)
  %7 = call zeroext i8 @randPoolGetByte()
  %8 = zext i8 %7 to i32
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @cryptRandByte() #0 {
  %1 = load i8, i8* @randSeedOpen, align 1
  %2 = icmp ne i8 %1, 0
  br i1 %2, label %6, label %3

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cryptRandByte, i64 0, i64 1)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cryptRandByte, i64 0, i64 1)
  %5 = call i32 @cryptRandOpen(%struct.IdeaCfbContext* null)
  br label %6

; <label>:6:                                      ; preds = %3, %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cryptRandByte, i64 0, i64 0)
  %7 = add i64 %pgocount1, 1
  store i64 %7, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cryptRandByte, i64 0, i64 0)
  %8 = call zeroext i8 @ideaRandByte(%struct.IdeaRandContext* @randContext)
  ret i8 %8
}

declare zeroext i8 @ideaRandByte(%struct.IdeaRandContext*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @cryptRandWriteFile(i8*, %struct.IdeaCfbContext*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %struct.IdeaCfbContext*, align 8
  %7 = alloca i32, align 4
  %8 = alloca [256 x i8], align 16
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store %struct.IdeaCfbContext* %1, %struct.IdeaCfbContext** %6, align 8
  store i32 %2, i32* %7, align 4
  %12 = load i8*, i8** %5, align 8
  %13 = call %struct._IO_FILE* @fopen(i8* %12, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %13, %struct._IO_FILE** %9, align 8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %15 = icmp ne %struct._IO_FILE* %14, null
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 5)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 5)
  store i32 -1, i32* %4, align 4
  br label %87

; <label>:18:                                     ; preds = %3
  br label %19

; <label>:19:                                     ; preds = %69, %18
  %20 = load i32, i32* %7, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %73

; <label>:22:                                     ; preds = %19
  %23 = load i32, i32* %7, align 4
  %24 = zext i32 %23 to i64
  %25 = icmp ult i64 %24, 256
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 2)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 2)
  %28 = load i32, i32* %7, align 4
  %29 = zext i32 %28 to i64
  br label %32

; <label>:30:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 3)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 3)
  br label %32

; <label>:32:                                     ; preds = %30, %26
  %33 = phi i64 [ %29, %26 ], [ 256, %30 ]
  %34 = trunc i64 %33 to i32
  store i32 %34, i32* %11, align 4
  store i32 0, i32* %10, align 4
  br label %35

; <label>:35:                                     ; preds = %44, %32
  %36 = load i32, i32* %10, align 4
  %37 = load i32, i32* %11, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %48

; <label>:39:                                     ; preds = %35
  %40 = call zeroext i8 @ideaRandByte(%struct.IdeaRandContext* @randContext)
  %41 = load i32, i32* %10, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [256 x i8], [256 x i8]* %8, i64 0, i64 %42
  store i8 %40, i8* %43, align 1
  br label %44

; <label>:44:                                     ; preds = %39
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 0)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 0)
  %46 = load i32, i32* %10, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %10, align 4
  br label %35

; <label>:48:                                     ; preds = %35
  %49 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %6, align 8
  %50 = icmp ne %struct.IdeaCfbContext* %49, null
  br i1 %50, label %51, label %57

; <label>:51:                                     ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 1)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 1)
  %53 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %6, align 8
  %54 = getelementptr inbounds [256 x i8], [256 x i8]* %8, i32 0, i32 0
  %55 = getelementptr inbounds [256 x i8], [256 x i8]* %8, i32 0, i32 0
  %56 = load i32, i32* %11, align 4
  call void @ideaCfbEncrypt(%struct.IdeaCfbContext* %53, i8* %54, i8* %55, i32 %56)
  br label %57

; <label>:57:                                     ; preds = %51, %48
  %58 = getelementptr inbounds [256 x i8], [256 x i8]* %8, i32 0, i32 0
  %59 = load i32, i32* %11, align 4
  %60 = sext i32 %59 to i64
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %62 = call i64 @fwrite(i8* %58, i64 1, i64 %60, %struct._IO_FILE* %61)
  %63 = trunc i64 %62 to i32
  store i32 %63, i32* %10, align 4
  %64 = load i32, i32* %10, align 4
  %65 = load i32, i32* %11, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %69

; <label>:67:                                     ; preds = %57
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 6)
  %68 = add i64 %pgocount5, 1
  store i64 %68, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 6)
  br label %73

; <label>:69:                                     ; preds = %57
  %70 = load i32, i32* %11, align 4
  %71 = load i32, i32* %7, align 4
  %72 = sub i32 %71, %70
  store i32 %72, i32* %7, align 4
  br label %19

; <label>:73:                                     ; preds = %67, %19
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %75 = call i32 @fclose(%struct._IO_FILE* %74)
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %81, label %77

; <label>:77:                                     ; preds = %73
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 7)
  %78 = add i64 %pgocount6, 1
  store i64 %78, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 7)
  %79 = load i32, i32* %7, align 4
  %80 = icmp ne i32 %79, 0
  br label %81

; <label>:81:                                     ; preds = %77, %73
  %82 = phi i1 [ true, %73 ], [ %80, %77 ]
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 4)
  %83 = add i64 %pgocount7, 1
  store i64 %83, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 4)
  %84 = zext i1 %82 to i64
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 8)
  %85 = add i64 %pgocount8, %84
  store i64 %85, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_cryptRandWriteFile, i64 0, i64 8)
  %86 = select i1 %82, i32 -1, i32 0
  store i32 %86, i32* %4, align 4
  br label %87

; <label>:87:                                     ; preds = %81, %16
  %88 = load i32, i32* %4, align 4
  ret i32 %88
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define void @cryptRandSave(%struct.IdeaCfbContext*) #0 {
  %2 = alloca %struct.IdeaCfbContext*, align 8
  store %struct.IdeaCfbContext* %0, %struct.IdeaCfbContext** %2, align 8
  %3 = load i8, i8* @randSeedOpen, align 1
  %4 = icmp ne i8 %3, 0
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_cryptRandSave, i64 0, i64 1)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_cryptRandSave, i64 0, i64 1)
  br label %22

; <label>:7:                                      ; preds = %1
  %8 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %2, align 8
  %9 = icmp ne %struct.IdeaCfbContext* %8, null
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_cryptRandSave, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_cryptRandSave, i64 0, i64 0)
  store i8 1, i8* @cryptRandSave.savedwashed, align 1
  br label %19

; <label>:12:                                     ; preds = %7
  %13 = load i8, i8* @cryptRandSave.savedwashed, align 1
  %14 = icmp ne i8 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_cryptRandSave, i64 0, i64 2)
  %16 = add i64 %pgocount2, 1
  store i64 %16, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_cryptRandSave, i64 0, i64 2)
  br label %22

; <label>:17:                                     ; preds = %12
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_cryptRandSave, i64 0, i64 3)
  %18 = add i64 %pgocount3, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_cryptRandSave, i64 0, i64 3)
  br label %19

; <label>:19:                                     ; preds = %17, %10
  %20 = load %struct.IdeaCfbContext*, %struct.IdeaCfbContext** %2, align 8
  %21 = call i32 @cryptRandWriteFile(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @globalRandseedName, i32 0, i32 0), %struct.IdeaCfbContext* %20, i32 408)
  br label %22

; <label>:22:                                     ; preds = %19, %15, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @trueRandFlush() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_trueRandFlush, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_trueRandFlush, i64 0, i64 0)
  %2 = call i64 @noise()
  call void @randPoolStir()
  call void @randPoolStir()
  call void @randPoolStir()
  call void @randPoolStir()
  ret void
}

declare i64 @noise() #1

declare void @randPoolStir() #1

; Function Attrs: noinline nounwind uwtable
define void @trueRandConsume(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* @trueRandBits, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp uge i32 %3, %4
  br i1 %5, label %6, label %7

; <label>:6:                                      ; preds = %1
  br label %10

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_trueRandConsume, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_trueRandConsume, i64 0, i64 1)
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i32 392, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__PRETTY_FUNCTION__.trueRandConsume, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %10

; <label>:10:                                     ; preds = %9, %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_trueRandConsume, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_trueRandConsume, i64 0, i64 0)
  %12 = load i32, i32* %2, align 4
  %13 = load i32, i32* @trueRandBits, align 4
  %14 = sub i32 %13, %12
  store i32 %14, i32* @trueRandBits, align 4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: noinline nounwind uwtable
define void @trueRandAccum(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %4 = load i32, i32* @trueRandPending, align 4
  %5 = load i32, i32* %2, align 4
  %6 = add i32 %5, %4
  store i32 %6, i32* %2, align 4
  store i32 0, i32* @trueRandPending, align 4
  %7 = load i32, i32* %2, align 4
  %8 = icmp ugt i32 %7, 3072
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trueRandAccum, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trueRandAccum, i64 0, i64 1)
  store i32 3072, i32* %2, align 4
  br label %11

; <label>:11:                                     ; preds = %9, %1
  %12 = load i32, i32* @trueRandBits, align 4
  %13 = load i32, i32* %2, align 4
  %14 = icmp uge i32 %12, %13
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trueRandAccum, i64 0, i64 2)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trueRandAccum, i64 0, i64 2)
  br label %54

; <label>:17:                                     ; preds = %11
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i8* @LANG(i8* getelementptr inbounds ([182 x i8], [182 x i8]* @.str.4, i32 0, i32 0))
  %20 = load i32, i32* %2, align 4
  %21 = load i32, i32* @trueRandBits, align 4
  %22 = sub i32 %20, %21
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* %19, i32 %22)
  call void (...) @ttycbreak()
  br label %24

; <label>:24:                                     ; preds = %42, %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trueRandAccum, i64 0, i64 0)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trueRandAccum, i64 0, i64 0)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = load i32, i32* %2, align 4
  %28 = load i32, i32* @trueRandBits, align 4
  %29 = sub i32 %27, %28
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0), i32 %29)
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = call i32 @fflush(%struct._IO_FILE* %31)
  call void @flush_input()
  %33 = call i32 (...) @getch()
  store i32 %33, i32* %3, align 4
  %34 = load i32, i32* %3, align 4
  %35 = call i32 @trueRandEvent(i32 %34)
  %36 = icmp ne i32 %35, 0
  %37 = zext i1 %36 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trueRandAccum, i64 0, i64 4)
  %38 = add i64 %pgocount3, %37
  store i64 %38, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trueRandAccum, i64 0, i64 4)
  %39 = select i1 %36, i32 46, i32 63
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = call i32 @fputc(i32 %39, %struct._IO_FILE* %40)
  br label %42

; <label>:42:                                     ; preds = %24
  %43 = load i32, i32* @trueRandBits, align 4
  %44 = load i32, i32* %2, align 4
  %45 = icmp ult i32 %43, %44
  br i1 %45, label %24, label %46

; <label>:46:                                     ; preds = %42
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trueRandAccum, i64 0, i64 3)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trueRandAccum, i64 0, i64 3)
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = call i32 @fputs(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), %struct._IO_FILE* %48)
  %50 = call i8* @LANG(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = call i32 @fputs(i8* %50, %struct._IO_FILE* %51)
  %53 = call i32 @sleep(i32 1)
  call void @flush_input()
  call void (...) @ttynorm()
  br label %54

; <label>:54:                                     ; preds = %46, %15
  ret void
}

declare zeroext i8 @randPoolGetByte() #1

; Function Attrs: noinline nounwind uwtable
define i32 @trueRandEvent(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %5 = call i64 @noise()
  store i64 %5, i64* %3, align 8
  %6 = bitcast i32* %2 to i8*
  call void @randPoolAddBytes(i8* %6, i32 4)
  %7 = load i32, i32* %2, align 4
  %8 = load i32, i32* @trueRandEvent.event1, align 4
  %9 = icmp eq i32 %7, %8
  br i1 %9, label %10, label %17

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 2)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 2)
  %12 = load i32, i32* %2, align 4
  %13 = load i32, i32* @trueRandEvent.event2, align 4
  %14 = icmp eq i32 %12, %13
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 5)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 5)
  store i32 0, i32* %4, align 4
  br label %37

; <label>:17:                                     ; preds = %10, %1
  %18 = load i32, i32* @trueRandEvent.event1, align 4
  store i32 %18, i32* @trueRandEvent.event2, align 4
  %19 = load i32, i32* %2, align 4
  store i32 %19, i32* @trueRandEvent.event1, align 4
  store i32 0, i32* %4, align 4
  br label %20

; <label>:20:                                     ; preds = %26, %17
  %21 = load i64, i64* %3, align 8
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %30

; <label>:23:                                     ; preds = %20
  %24 = load i64, i64* %3, align 8
  %25 = lshr i64 %24, 1
  store i64 %25, i64* %3, align 8
  br label %26

; <label>:26:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 0)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 0)
  %28 = load i32, i32* %4, align 4
  %29 = add i32 %28, 1
  store i32 %29, i32* %4, align 4
  br label %20

; <label>:30:                                     ; preds = %20
  %31 = load i32, i32* %4, align 4
  %32 = icmp ugt i32 %31, 8
  br i1 %32, label %33, label %35

; <label>:33:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 4)
  %34 = add i64 %pgocount3, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 4)
  store i32 8, i32* %4, align 4
  br label %35

; <label>:35:                                     ; preds = %33, %30
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 1)
  %36 = add i64 %pgocount4, 1
  store i64 %36, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 1)
  br label %37

; <label>:37:                                     ; preds = %35, %15
  %38 = load i32, i32* %4, align 4
  %39 = load i32, i32* @trueRandBits, align 4
  %40 = add i32 %39, %38
  store i32 %40, i32* @trueRandBits, align 4
  %41 = load i32, i32* @trueRandBits, align 4
  %42 = icmp ugt i32 %41, 3072
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %37
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 3)
  %44 = add i64 %pgocount5, 1
  store i64 %44, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_trueRandEvent, i64 0, i64 3)
  store i32 3072, i32* @trueRandBits, align 4
  br label %45

; <label>:45:                                     ; preds = %43, %37
  %46 = load i32, i32* %4, align 4
  ret i32 %46
}

; Function Attrs: noinline nounwind uwtable
define void @trueRandAccumLater(i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_trueRandAccumLater, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_trueRandAccumLater, i64 0, i64 0)
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = load i32, i32* @trueRandPending, align 4
  %6 = add i32 %5, %4
  store i32 %6, i32* @trueRandPending, align 4
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @LANG(i8*) #1

declare void @ttycbreak(...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @flush_input() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_flush_input, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_flush_input, i64 0, i64 0)
  ret void
}

declare i32 @getch(...) #1

declare i32 @fputc(i32, %struct._IO_FILE*) #1

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

declare i32 @sleep(i32) #1

declare void @ttynorm(...) #1

; Function Attrs: noinline nounwind uwtable
define i32 @getstring(i8*, i32, i32) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8, align 1
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  call void (...) @ttycbreak()
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %10 = call i32 @fflush(%struct._IO_FILE* %9)
  store i32 0, i32* %7, align 4
  br label %11

; <label>:11:                                     ; preds = %116, %64, %49, %3
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = call i32 @fflush(%struct._IO_FILE* %12)
  %14 = call i32 (...) @getch()
  %15 = trunc i32 %14 to i8
  store i8 %15, i8* %8, align 1
  %16 = load i8, i8* %8, align 1
  %17 = sext i8 %16 to i32
  %18 = call i32 @trueRandEvent(i32 %17)
  %19 = load i8, i8* %8, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp eq i32 %20, 8
  br i1 %21, label %27, label %22

; <label>:22:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 0)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 0)
  %24 = load i8, i8* %8, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %25, 127
  br i1 %26, label %27, label %50

; <label>:27:                                     ; preds = %22, %11
  %28 = load i32, i32* %7, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %45

; <label>:30:                                     ; preds = %27
  %31 = load i32, i32* %6, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %41

; <label>:33:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 2)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 2)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i32 @_IO_putc(i32 8, %struct._IO_FILE* %35)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i32 @_IO_putc(i32 32, %struct._IO_FILE* %37)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = call i32 @_IO_putc(i32 8, %struct._IO_FILE* %39)
  br label %41

; <label>:41:                                     ; preds = %33, %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 1)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 1)
  %43 = load i32, i32* %7, align 4
  %44 = add i32 %43, -1
  store i32 %44, i32* %7, align 4
  br label %49

; <label>:45:                                     ; preds = %27
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 3)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 3)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = call i32 @_IO_putc(i32 7, %struct._IO_FILE* %47)
  br label %49

; <label>:49:                                     ; preds = %45, %41
  br label %11

; <label>:50:                                     ; preds = %22
  %51 = load i8, i8* %8, align 1
  %52 = sext i8 %51 to i32
  %53 = icmp slt i32 %52, 32
  br i1 %53, label %54, label %68

; <label>:54:                                     ; preds = %50
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 6)
  %55 = add i64 %pgocount4, 1
  store i64 %55, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 6)
  %56 = load i8, i8* %8, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp ne i32 %57, 10
  br i1 %58, label %59, label %68

; <label>:59:                                     ; preds = %54
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 7)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 7)
  %61 = load i8, i8* %8, align 1
  %62 = sext i8 %61 to i32
  %63 = icmp ne i32 %62, 13
  br i1 %63, label %64, label %68

; <label>:64:                                     ; preds = %59
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 8)
  %65 = add i64 %pgocount6, 1
  store i64 %65, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 8)
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %67 = call i32 @_IO_putc(i32 7, %struct._IO_FILE* %66)
  br label %11

; <label>:68:                                     ; preds = %59, %54, %50
  %69 = load i32, i32* %6, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %77

; <label>:71:                                     ; preds = %68
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 5)
  %72 = add i64 %pgocount7, 1
  store i64 %72, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 5)
  %73 = load i8, i8* %8, align 1
  %74 = sext i8 %73 to i32
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %76 = call i32 @_IO_putc(i32 %74, %struct._IO_FILE* %75)
  br label %77

; <label>:77:                                     ; preds = %71, %68
  %78 = load i8, i8* %8, align 1
  %79 = sext i8 %78 to i32
  %80 = icmp eq i32 %79, 13
  br i1 %80, label %81, label %90

; <label>:81:                                     ; preds = %77
  %82 = load i32, i32* %6, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %88

; <label>:84:                                     ; preds = %81
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 13)
  %85 = add i64 %pgocount8, 1
  store i64 %85, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 13)
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %87 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %86)
  br label %88

; <label>:88:                                     ; preds = %84, %81
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 9)
  %89 = add i64 %pgocount9, 1
  store i64 %89, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 9)
  br label %118

; <label>:90:                                     ; preds = %77
  %91 = load i8, i8* %8, align 1
  %92 = sext i8 %91 to i32
  %93 = icmp eq i32 %92, 10
  br i1 %93, label %94, label %96

; <label>:94:                                     ; preds = %90
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 10)
  %95 = add i64 %pgocount10, 1
  store i64 %95, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 10)
  br label %118

; <label>:96:                                     ; preds = %90
  %97 = load i8, i8* %8, align 1
  %98 = sext i8 %97 to i32
  %99 = icmp eq i32 %98, 10
  br i1 %99, label %100, label %102

; <label>:100:                                    ; preds = %96
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 11)
  %101 = add i64 %pgocount11, 1
  store i64 %101, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 11)
  br label %118

; <label>:102:                                    ; preds = %96
  %103 = load i8, i8* %8, align 1
  %104 = load i8*, i8** %4, align 8
  %105 = load i32, i32* %7, align 4
  %106 = add i32 %105, 1
  store i32 %106, i32* %7, align 4
  %107 = zext i32 %105 to i64
  %108 = getelementptr inbounds i8, i8* %104, i64 %107
  store i8 %103, i8* %108, align 1
  %109 = load i32, i32* %7, align 4
  %110 = load i32, i32* %5, align 4
  %111 = icmp uge i32 %109, %110
  br i1 %111, label %112, label %116

; <label>:112:                                    ; preds = %102
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 12)
  %113 = add i64 %pgocount12, 1
  store i64 %113, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 12)
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %115 = call i32 @fputs(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), %struct._IO_FILE* %114)
  br label %118

; <label>:116:                                    ; preds = %102
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 4)
  %117 = add i64 %pgocount13, 1
  store i64 %117, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_getstring, i64 0, i64 4)
  br label %11

; <label>:118:                                    ; preds = %112, %100, %94, %88
  %119 = load i8*, i8** %4, align 8
  %120 = load i32, i32* %7, align 4
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds i8, i8* %119, i64 %121
  store i8 0, i8* %122, align 1
  call void (...) @ttynorm()
  %123 = load i32, i32* %7, align 4
  ret i32 %123
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
