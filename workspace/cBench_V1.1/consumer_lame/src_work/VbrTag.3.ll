; ModuleID = 'VbrTag.2.ll'
source_filename = "VbrTag.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.VBRTAGDATA = type { i32, i32, i32, i32, i32, i32, [100 x i8] }
%struct.bit_stream_struc = type { i8*, i32, %struct._IO_FILE*, i8*, i32, i64, i32, i32 }

$__llvm_profile_raw_version = comdat any

@SizeOfEmptyFrame = global [2 x [2 x i32]] [[2 x i32] [i32 32, i32 17], [2 x i32] [i32 17, i32 9]], align 16
@pVbrFrames = global i32* null, align 8
@nVbrNumFrames = global i32 0, align 4
@nVbrFrameBufferSize = global i32 0, align 4
@VBRTag = internal global [5 x i8] c"Xing\00", align 1
@GetVbrTag.sr_table = internal global [4 x i32] [i32 44100, i32 48000, i32 32000, i32 99999], align 16
@g_Position = internal global [100 x i64] zeroinitializer, align 16
@pbtStreamBuffer = internal global [216 x i8] zeroinitializer, align 16
@nZeroStreamSize = internal global i32 0, align 4
@InitVbrTag.framesize = internal constant [3 x i32] [i32 208, i32 192, i32 288], align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [34 x i8] c"illegal sampling frequency index\0A\00", align 1
@TotalFrameSize = internal global i32 0, align 4
@.str.1 = private unnamed_addr constant [34 x i8] c"Xing VBR header problem...use -t\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"rb+\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"LAME%s\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_AddVbrFrame = private constant [11 x i8] c"AddVbrFrame"
@__profn_CreateI4 = private constant [8 x i8] c"CreateI4"
@__profn_CheckVbrTag = private constant [11 x i8] c"CheckVbrTag"
@__profn_GetVbrTag = private constant [9 x i8] c"GetVbrTag"
@__profn_tmp1.ll_ExtractI4 = private constant [17 x i8] c"tmp1.ll:ExtractI4"
@__profn_InitVbrTag = private constant [10 x i8] c"InitVbrTag"
@__profn_PutVbrTag = private constant [9 x i8] c"PutVbrTag"
@__profn_SeekPoint = private constant [9 x i8] c"SeekPoint"
@__profc_AddVbrFrame = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_AddVbrFrame = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8636806278436187627, i64 46786341626, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_AddVbrFrame, i32 0, i32 0), i8* bitcast (void (i32)* @AddVbrFrame to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_CreateI4 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_CreateI4 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9167823296331939907, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_CreateI4, i32 0, i32 0), i8* bitcast (void (i8*, i32)* @CreateI4 to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_CheckVbrTag = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_CheckVbrTag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9022916287836470088, i64 116767516401, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i32 0, i32 0), i8* bitcast (i32 (i8*)* @CheckVbrTag to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_GetVbrTag = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_GetVbrTag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3734957933799467875, i64 218045123920, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i32 0, i32 0), i8* bitcast (i32 (%struct.VBRTAGDATA*, i8*)* @GetVbrTag to i8*), i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ExtractI4 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ExtractI4 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4049135458524519602, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_ExtractI4, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_InitVbrTag = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_InitVbrTag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8982550591864006816, i64 98422371626, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i32 0, i32 0), i8* bitcast (i32 (%struct.bit_stream_struc*, i32, i32, i32)* @InitVbrTag to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_PutVbrTag = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_PutVbrTag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3649870894347648025, i64 125272421316, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32)* @PutVbrTag to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_SeekPoint = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_SeekPoint = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -373949355607780741, i64 68185842450, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_SeekPoint, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, float)* @SeekPoint to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [81 x i8] c"[Ox\DAsLI\09K*r+J\CCMet.JM,I\F54at\CEHM\CE\06\0A\87$\A63\BA\A7\96@Y%\B9\05\86z99V\AE\15%E\89\C9%@u\9Ey\990\C9\80R\18+855; ?3\AF\04\00\98\A3\1F\86", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_AddVbrFrame to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_CreateI4 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_CheckVbrTag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_GetVbrTag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ExtractI4 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_InitVbrTag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_PutVbrTag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_SeekPoint to i8*), i8* getelementptr inbounds ([81 x i8], [81 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @AddVbrFrame(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32*, i32** @pVbrFrames, align 8
  %4 = icmp eq i32* %3, null
  br i1 %4, label %9, label %5

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_AddVbrFrame, i64 0, i64 1)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_AddVbrFrame, i64 0, i64 1)
  %7 = load i32, i32* @nVbrFrameBufferSize, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %16

; <label>:9:                                      ; preds = %5, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_AddVbrFrame, i64 0, i64 2)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_AddVbrFrame, i64 0, i64 2)
  store i32 100, i32* @nVbrFrameBufferSize, align 4
  %11 = load i32, i32* @nVbrFrameBufferSize, align 4
  %12 = sext i32 %11 to i64
  %13 = mul i64 %12, 4
  %14 = call noalias i8* @malloc(i64 %13) #6
  %15 = bitcast i8* %14 to i32*
  store i32* %15, i32** @pVbrFrames, align 8
  br label %16

; <label>:16:                                     ; preds = %9, %5
  %17 = load i32, i32* @nVbrNumFrames, align 4
  %18 = load i32, i32* @nVbrFrameBufferSize, align 4
  %19 = icmp eq i32 %17, %18
  br i1 %19, label %20, label %31

; <label>:20:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_AddVbrFrame, i64 0, i64 3)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_AddVbrFrame, i64 0, i64 3)
  %22 = load i32, i32* @nVbrFrameBufferSize, align 4
  %23 = mul nsw i32 %22, 2
  store i32 %23, i32* @nVbrFrameBufferSize, align 4
  %24 = load i32*, i32** @pVbrFrames, align 8
  %25 = bitcast i32* %24 to i8*
  %26 = load i32, i32* @nVbrFrameBufferSize, align 4
  %27 = sext i32 %26 to i64
  %28 = mul i64 %27, 4
  %29 = call i8* @realloc(i8* %25, i64 %28) #6
  %30 = bitcast i8* %29 to i32*
  store i32* %30, i32** @pVbrFrames, align 8
  br label %31

; <label>:31:                                     ; preds = %20, %16
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_AddVbrFrame, i64 0, i64 0)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_AddVbrFrame, i64 0, i64 0)
  %33 = load i32, i32* %2, align 4
  %34 = load i32*, i32** @pVbrFrames, align 8
  %35 = load i32, i32* @nVbrNumFrames, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* @nVbrNumFrames, align 4
  %37 = sext i32 %35 to i64
  %38 = getelementptr inbounds i32, i32* %34, i64 %37
  store i32 %33, i32* %38, align 4
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

; Function Attrs: nounwind uwtable
define void @CreateI4(i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_CreateI4, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_CreateI4, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = ashr i32 %6, 24
  %8 = and i32 %7, 255
  %9 = trunc i32 %8 to i8
  %10 = load i8*, i8** %4, align 8
  %11 = getelementptr inbounds i8, i8* %10, i64 0
  store i8 %9, i8* %11, align 1
  %12 = load i32, i32* %5, align 4
  %13 = ashr i32 %12, 16
  %14 = and i32 %13, 255
  %15 = trunc i32 %14 to i8
  %16 = load i8*, i8** %4, align 8
  %17 = getelementptr inbounds i8, i8* %16, i64 1
  store i8 %15, i8* %17, align 1
  %18 = load i32, i32* %5, align 4
  %19 = ashr i32 %18, 8
  %20 = and i32 %19, 255
  %21 = trunc i32 %20 to i8
  %22 = load i8*, i8** %4, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 2
  store i8 %21, i8* %23, align 1
  %24 = load i32, i32* %5, align 4
  %25 = and i32 %24, 255
  %26 = trunc i32 %25 to i8
  %27 = load i8*, i8** %4, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 3
  store i8 %26, i8* %28, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @CheckVbrTag(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 1
  %9 = load i8, i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = ashr i32 %10, 3
  %12 = and i32 %11, 1
  store i32 %12, i32* %4, align 4
  %13 = load i8*, i8** %3, align 8
  %14 = getelementptr inbounds i8, i8* %13, i64 2
  %15 = load i8, i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = ashr i32 %16, 2
  %18 = and i32 %17, 3
  store i32 %18, i32* %6, align 4
  %19 = load i8*, i8** %3, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 3
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = ashr i32 %22, 6
  %24 = and i32 %23, 3
  store i32 %24, i32* %5, align 4
  %25 = load i32, i32* %4, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %39

; <label>:27:                                     ; preds = %1
  %28 = load i32, i32* %5, align 4
  %29 = icmp ne i32 %28, 3
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %27
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 0)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 0)
  %32 = load i8*, i8** %3, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 36
  store i8* %33, i8** %3, align 8
  br label %38

; <label>:34:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 1)
  %36 = load i8*, i8** %3, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 21
  store i8* %37, i8** %3, align 8
  br label %38

; <label>:38:                                     ; preds = %34, %30
  br label %51

; <label>:39:                                     ; preds = %1
  %40 = load i32, i32* %5, align 4
  %41 = icmp ne i32 %40, 3
  br i1 %41, label %42, label %46

; <label>:42:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 3)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 3)
  %44 = load i8*, i8** %3, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 21
  store i8* %45, i8** %3, align 8
  br label %50

; <label>:46:                                     ; preds = %39
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 4)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 4)
  %48 = load i8*, i8** %3, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 13
  store i8* %49, i8** %3, align 8
  br label %50

; <label>:50:                                     ; preds = %46, %42
  br label %51

; <label>:51:                                     ; preds = %50, %38
  %52 = load i8*, i8** %3, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 0
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 0), align 1
  %57 = sext i8 %56 to i32
  %58 = icmp ne i32 %55, %57
  br i1 %58, label %59, label %60

; <label>:59:                                     ; preds = %51
  store i32 0, i32* %2, align 4
  br label %92

; <label>:60:                                     ; preds = %51
  %61 = load i8*, i8** %3, align 8
  %62 = getelementptr inbounds i8, i8* %61, i64 1
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i32
  %65 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 1), align 1
  %66 = sext i8 %65 to i32
  %67 = icmp ne i32 %64, %66
  br i1 %67, label %68, label %70

; <label>:68:                                     ; preds = %60
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 2)
  %69 = add i64 %pgocount4, 1
  store i64 %69, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %92

; <label>:70:                                     ; preds = %60
  %71 = load i8*, i8** %3, align 8
  %72 = getelementptr inbounds i8, i8* %71, i64 2
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 2), align 1
  %76 = sext i8 %75 to i32
  %77 = icmp ne i32 %74, %76
  br i1 %77, label %78, label %80

; <label>:78:                                     ; preds = %70
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 5)
  %79 = add i64 %pgocount5, 1
  store i64 %79, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 5)
  store i32 0, i32* %2, align 4
  br label %92

; <label>:80:                                     ; preds = %70
  %81 = load i8*, i8** %3, align 8
  %82 = getelementptr inbounds i8, i8* %81, i64 3
  %83 = load i8, i8* %82, align 1
  %84 = zext i8 %83 to i32
  %85 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 3), align 1
  %86 = sext i8 %85 to i32
  %87 = icmp ne i32 %84, %86
  br i1 %87, label %88, label %90

; <label>:88:                                     ; preds = %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 6)
  %89 = add i64 %pgocount6, 1
  store i64 %89, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 6)
  store i32 0, i32* %2, align 4
  br label %92

; <label>:90:                                     ; preds = %80
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 7)
  %91 = add i64 %pgocount7, 1
  store i64 %91, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_CheckVbrTag, i64 0, i64 7)
  store i32 1, i32* %2, align 4
  br label %92

; <label>:92:                                     ; preds = %90, %88, %78, %68, %59
  %93 = load i32, i32* %2, align 4
  ret i32 %93
}

; Function Attrs: nounwind uwtable
define i32 @GetVbrTag(%struct.VBRTAGDATA*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.VBRTAGDATA*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.VBRTAGDATA* %0, %struct.VBRTAGDATA** %4, align 8
  store i8* %1, i8** %5, align 8
  %11 = load %struct.VBRTAGDATA*, %struct.VBRTAGDATA** %4, align 8
  %12 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %11, i32 0, i32 2
  store i32 0, i32* %12, align 4
  %13 = load i8*, i8** %5, align 8
  %14 = getelementptr inbounds i8, i8* %13, i64 1
  %15 = load i8, i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = ashr i32 %16, 3
  %18 = and i32 %17, 1
  store i32 %18, i32* %8, align 4
  %19 = load i8*, i8** %5, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 2
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = ashr i32 %22, 2
  %24 = and i32 %23, 3
  store i32 %24, i32* %10, align 4
  %25 = load i8*, i8** %5, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 3
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = ashr i32 %28, 6
  %30 = and i32 %29, 3
  store i32 %30, i32* %9, align 4
  %31 = load i32, i32* %8, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %45

; <label>:33:                                     ; preds = %2
  %34 = load i32, i32* %9, align 4
  %35 = icmp ne i32 %34, 3
  br i1 %35, label %36, label %40

; <label>:36:                                     ; preds = %33
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 1)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 1)
  %38 = load i8*, i8** %5, align 8
  %39 = getelementptr inbounds i8, i8* %38, i64 36
  store i8* %39, i8** %5, align 8
  br label %44

; <label>:40:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 2)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 2)
  %42 = load i8*, i8** %5, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 21
  store i8* %43, i8** %5, align 8
  br label %44

; <label>:44:                                     ; preds = %40, %36
  br label %57

; <label>:45:                                     ; preds = %2
  %46 = load i32, i32* %9, align 4
  %47 = icmp ne i32 %46, 3
  br i1 %47, label %48, label %52

; <label>:48:                                     ; preds = %45
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 4)
  %49 = add i64 %pgocount2, 1
  store i64 %49, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 4)
  %50 = load i8*, i8** %5, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 21
  store i8* %51, i8** %5, align 8
  br label %56

; <label>:52:                                     ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 5)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 5)
  %54 = load i8*, i8** %5, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 13
  store i8* %55, i8** %5, align 8
  br label %56

; <label>:56:                                     ; preds = %52, %48
  br label %57

; <label>:57:                                     ; preds = %56, %44
  %58 = load i8*, i8** %5, align 8
  %59 = getelementptr inbounds i8, i8* %58, i64 0
  %60 = load i8, i8* %59, align 1
  %61 = zext i8 %60 to i32
  %62 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 0), align 1
  %63 = sext i8 %62 to i32
  %64 = icmp ne i32 %61, %63
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %57
  store i32 0, i32* %3, align 4
  br label %196

; <label>:66:                                     ; preds = %57
  %67 = load i8*, i8** %5, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 1
  %69 = load i8, i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 1), align 1
  %72 = sext i8 %71 to i32
  %73 = icmp ne i32 %70, %72
  br i1 %73, label %74, label %76

; <label>:74:                                     ; preds = %66
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 3)
  %75 = add i64 %pgocount4, 1
  store i64 %75, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 3)
  store i32 0, i32* %3, align 4
  br label %196

; <label>:76:                                     ; preds = %66
  %77 = load i8*, i8** %5, align 8
  %78 = getelementptr inbounds i8, i8* %77, i64 2
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 2), align 1
  %82 = sext i8 %81 to i32
  %83 = icmp ne i32 %80, %82
  br i1 %83, label %84, label %86

; <label>:84:                                     ; preds = %76
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 6)
  %85 = add i64 %pgocount5, 1
  store i64 %85, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 6)
  store i32 0, i32* %3, align 4
  br label %196

; <label>:86:                                     ; preds = %76
  %87 = load i8*, i8** %5, align 8
  %88 = getelementptr inbounds i8, i8* %87, i64 3
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i32
  %91 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 3), align 1
  %92 = sext i8 %91 to i32
  %93 = icmp ne i32 %90, %92
  br i1 %93, label %94, label %96

; <label>:94:                                     ; preds = %86
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 7)
  %95 = add i64 %pgocount6, 1
  store i64 %95, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 7)
  store i32 0, i32* %3, align 4
  br label %196

; <label>:96:                                     ; preds = %86
  %97 = load i8*, i8** %5, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 4
  store i8* %98, i8** %5, align 8
  %99 = load i32, i32* %8, align 4
  %100 = load %struct.VBRTAGDATA*, %struct.VBRTAGDATA** %4, align 8
  %101 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %100, i32 0, i32 0
  store i32 %99, i32* %101, align 4
  %102 = load i32, i32* %10, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [4 x i32], [4 x i32]* @GetVbrTag.sr_table, i64 0, i64 %103
  %105 = load i32, i32* %104, align 4
  %106 = load %struct.VBRTAGDATA*, %struct.VBRTAGDATA** %4, align 8
  %107 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %106, i32 0, i32 1
  store i32 %105, i32* %107, align 4
  %108 = load i32, i32* %8, align 4
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %116

; <label>:110:                                    ; preds = %96
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 13)
  %111 = add i64 %pgocount7, 1
  store i64 %111, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 13)
  %112 = load %struct.VBRTAGDATA*, %struct.VBRTAGDATA** %4, align 8
  %113 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %112, i32 0, i32 1
  %114 = load i32, i32* %113, align 4
  %115 = ashr i32 %114, 1
  store i32 %115, i32* %113, align 4
  br label %116

; <label>:116:                                    ; preds = %110, %96
  %117 = load i8*, i8** %5, align 8
  %118 = call i32 @ExtractI4(i8* %117)
  %119 = load %struct.VBRTAGDATA*, %struct.VBRTAGDATA** %4, align 8
  %120 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %119, i32 0, i32 2
  store i32 %118, i32* %120, align 4
  store i32 %118, i32* %7, align 4
  %121 = load i8*, i8** %5, align 8
  %122 = getelementptr inbounds i8, i8* %121, i64 4
  store i8* %122, i8** %5, align 8
  %123 = load i32, i32* %7, align 4
  %124 = and i32 %123, 1
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %134

; <label>:126:                                    ; preds = %116
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 9)
  %127 = add i64 %pgocount8, 1
  store i64 %127, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 9)
  %128 = load i8*, i8** %5, align 8
  %129 = call i32 @ExtractI4(i8* %128)
  %130 = load %struct.VBRTAGDATA*, %struct.VBRTAGDATA** %4, align 8
  %131 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %130, i32 0, i32 3
  store i32 %129, i32* %131, align 4
  %132 = load i8*, i8** %5, align 8
  %133 = getelementptr inbounds i8, i8* %132, i64 4
  store i8* %133, i8** %5, align 8
  br label %134

; <label>:134:                                    ; preds = %126, %116
  %135 = load i32, i32* %7, align 4
  %136 = and i32 %135, 2
  %137 = icmp ne i32 %136, 0
  br i1 %137, label %138, label %146

; <label>:138:                                    ; preds = %134
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 10)
  %139 = add i64 %pgocount9, 1
  store i64 %139, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 10)
  %140 = load i8*, i8** %5, align 8
  %141 = call i32 @ExtractI4(i8* %140)
  %142 = load %struct.VBRTAGDATA*, %struct.VBRTAGDATA** %4, align 8
  %143 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %142, i32 0, i32 4
  store i32 %141, i32* %143, align 4
  %144 = load i8*, i8** %5, align 8
  %145 = getelementptr inbounds i8, i8* %144, i64 4
  store i8* %145, i8** %5, align 8
  br label %146

; <label>:146:                                    ; preds = %138, %134
  %147 = load i32, i32* %7, align 4
  %148 = and i32 %147, 4
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %150, label %180

; <label>:150:                                    ; preds = %146
  %151 = load %struct.VBRTAGDATA*, %struct.VBRTAGDATA** %4, align 8
  %152 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %151, i32 0, i32 6
  %153 = getelementptr inbounds [100 x i8], [100 x i8]* %152, i32 0, i32 0
  %154 = icmp ne i8* %153, null
  br i1 %154, label %155, label %176

; <label>:155:                                    ; preds = %150
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 14)
  %156 = add i64 %pgocount10, 1
  store i64 %156, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 14)
  store i32 0, i32* %6, align 4
  br label %157

; <label>:157:                                    ; preds = %171, %155
  %158 = load i32, i32* %6, align 4
  %159 = icmp slt i32 %158, 100
  br i1 %159, label %160, label %175

; <label>:160:                                    ; preds = %157
  %161 = load i8*, i8** %5, align 8
  %162 = load i32, i32* %6, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i8, i8* %161, i64 %163
  %165 = load i8, i8* %164, align 1
  %166 = load %struct.VBRTAGDATA*, %struct.VBRTAGDATA** %4, align 8
  %167 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %166, i32 0, i32 6
  %168 = load i32, i32* %6, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [100 x i8], [100 x i8]* %167, i64 0, i64 %169
  store i8 %165, i8* %170, align 1
  br label %171

; <label>:171:                                    ; preds = %160
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 0)
  %172 = add i64 %pgocount11, 1
  store i64 %172, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 0)
  %173 = load i32, i32* %6, align 4
  %174 = add nsw i32 %173, 1
  store i32 %174, i32* %6, align 4
  br label %157

; <label>:175:                                    ; preds = %157
  br label %176

; <label>:176:                                    ; preds = %175, %150
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 11)
  %177 = add i64 %pgocount12, 1
  store i64 %177, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 11)
  %178 = load i8*, i8** %5, align 8
  %179 = getelementptr inbounds i8, i8* %178, i64 100
  store i8* %179, i8** %5, align 8
  br label %180

; <label>:180:                                    ; preds = %176, %146
  %181 = load %struct.VBRTAGDATA*, %struct.VBRTAGDATA** %4, align 8
  %182 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %181, i32 0, i32 5
  store i32 -1, i32* %182, align 4
  %183 = load i32, i32* %7, align 4
  %184 = and i32 %183, 8
  %185 = icmp ne i32 %184, 0
  br i1 %185, label %186, label %194

; <label>:186:                                    ; preds = %180
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 12)
  %187 = add i64 %pgocount13, 1
  store i64 %187, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 12)
  %188 = load i8*, i8** %5, align 8
  %189 = call i32 @ExtractI4(i8* %188)
  %190 = load %struct.VBRTAGDATA*, %struct.VBRTAGDATA** %4, align 8
  %191 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %190, i32 0, i32 5
  store i32 %189, i32* %191, align 4
  %192 = load i8*, i8** %5, align 8
  %193 = getelementptr inbounds i8, i8* %192, i64 4
  store i8* %193, i8** %5, align 8
  br label %194

; <label>:194:                                    ; preds = %186, %180
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 8)
  %195 = add i64 %pgocount14, 1
  store i64 %195, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_GetVbrTag, i64 0, i64 8)
  store i32 1, i32* %3, align 4
  br label %196

; <label>:196:                                    ; preds = %194, %94, %84, %74, %65
  %197 = load i32, i32* %3, align 4
  ret i32 %197
}

; Function Attrs: nounwind uwtable
define internal i32 @ExtractI4(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_ExtractI4, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_ExtractI4, i64 0, i64 0)
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = load i8, i8* %6, align 1
  %8 = zext i8 %7 to i32
  store i32 %8, i32* %4, align 4
  %9 = load i32, i32* %4, align 4
  %10 = shl i32 %9, 8
  store i32 %10, i32* %4, align 4
  %11 = load i8*, i8** %3, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 1
  %13 = load i8, i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = load i32, i32* %4, align 4
  %16 = or i32 %15, %14
  store i32 %16, i32* %4, align 4
  %17 = load i32, i32* %4, align 4
  %18 = shl i32 %17, 8
  store i32 %18, i32* %4, align 4
  %19 = load i8*, i8** %3, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 2
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = load i32, i32* %4, align 4
  %24 = or i32 %23, %22
  store i32 %24, i32* %4, align 4
  %25 = load i32, i32* %4, align 4
  %26 = shl i32 %25, 8
  store i32 %26, i32* %4, align 4
  %27 = load i8*, i8** %3, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 3
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = load i32, i32* %4, align 4
  %32 = or i32 %31, %30
  store i32 %32, i32* %4, align 4
  %33 = load i32, i32* %4, align 4
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define i32 @InitVbrTag(%struct.bit_stream_struc*, i32, i32, i32) #0 {
  %5 = alloca %struct.bit_stream_struc*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.bit_stream_struc* %0, %struct.bit_stream_struc** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32* null, i32** @pVbrFrames, align 8
  store i32 0, i32* @nVbrNumFrames, align 4
  store i32 0, i32* @nVbrFrameBufferSize, align 4
  call void @llvm.memset.p0i8.i64(i8* bitcast ([100 x i64]* @g_Position to i8*), i8 0, i64 800, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i32 0, i32 0), i8 0, i64 216, i32 16, i1 false)
  store i32 0, i32* %9, align 4
  br label %11

; <label>:11:                                     ; preds = %18, %4
  %12 = load i32, i32* %9, align 4
  %13 = icmp slt i32 %12, 100
  br i1 %13, label %14, label %22

; <label>:14:                                     ; preds = %11
  %15 = load i32, i32* %9, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x i64], [100 x i64]* @g_Position, i64 0, i64 %16
  store i64 -1, i64* %17, align 8
  br label %18

; <label>:18:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 0)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 0)
  %20 = load i32, i32* %9, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %9, align 4
  br label %11

; <label>:22:                                     ; preds = %11
  %23 = load i32, i32* %7, align 4
  %24 = icmp eq i32 %23, 3
  br i1 %24, label %25, label %33

; <label>:25:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 2)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 2)
  %27 = load i32, i32* %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* @SizeOfEmptyFrame, i64 0, i64 %28
  %30 = getelementptr inbounds [2 x i32], [2 x i32]* %29, i64 0, i64 1
  %31 = load i32, i32* %30, align 4
  %32 = add nsw i32 %31, 4
  store i32 %32, i32* @nZeroStreamSize, align 4
  br label %41

; <label>:33:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 3)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 3)
  %35 = load i32, i32* %6, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* @SizeOfEmptyFrame, i64 0, i64 %36
  %38 = getelementptr inbounds [2 x i32], [2 x i32]* %37, i64 0, i64 0
  %39 = load i32, i32* %38, align 8
  %40 = add nsw i32 %39, 4
  store i32 %40, i32* @nZeroStreamSize, align 4
  br label %41

; <label>:41:                                     ; preds = %33, %25
  %42 = load i32, i32* %8, align 4
  %43 = icmp sgt i32 %42, 2
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 4)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 4)
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

; <label>:48:                                     ; preds = %41
  %49 = load i32, i32* %8, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [3 x i32], [3 x i32]* @InitVbrTag.framesize, i64 0, i64 %50
  %52 = load i32, i32* %51, align 4
  store i32 %52, i32* @TotalFrameSize, align 4
  %53 = load i32, i32* @nZeroStreamSize, align 4
  %54 = add nsw i32 %53, 120
  store i32 %54, i32* %10, align 4
  %55 = load i32, i32* %10, align 4
  %56 = add nsw i32 %55, 20
  store i32 %56, i32* %10, align 4
  %57 = load i32, i32* @TotalFrameSize, align 4
  %58 = load i32, i32* %10, align 4
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %60, label %64

; <label>:60:                                     ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 5)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 5)
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %63 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

; <label>:64:                                     ; preds = %48
  store i32 0, i32* %9, align 4
  br label %65

; <label>:65:                                     ; preds = %71, %64
  %66 = load i32, i32* %9, align 4
  %67 = load i32, i32* @TotalFrameSize, align 4
  %68 = icmp slt i32 %66, %67
  br i1 %68, label %69, label %75

; <label>:69:                                     ; preds = %65
  %70 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %5, align 8
  call void @putbits(%struct.bit_stream_struc* %70, i32 0, i32 8)
  br label %71

; <label>:71:                                     ; preds = %69
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 1)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_InitVbrTag, i64 0, i64 1)
  %73 = load i32, i32* %9, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %9, align 4
  br label %65

; <label>:75:                                     ; preds = %65
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

declare void @putbits(%struct.bit_stream_struc*, i32, i32) #3

; Function Attrs: nounwind uwtable
define i32 @PutVbrTag(i8*, i32, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8, align 1
  %12 = alloca [100 x i8], align 16
  %13 = alloca %struct._IO_FILE*, align 8
  %14 = alloca [80 x i8], align 16
  %15 = alloca i32, align 4
  %16 = alloca float, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %17 = load i32, i32* @nVbrNumFrames, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %23, label %19

; <label>:19:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 2)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 2)
  %21 = load i32*, i32** @pVbrFrames, align 8
  %22 = icmp eq i32* %21, null
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %19, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 3)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 3)
  store i32 -1, i32* %4, align 4
  br label %186

; <label>:25:                                     ; preds = %19
  %26 = load i8*, i8** %5, align 8
  %27 = call %struct._IO_FILE* @fopen(i8* %26, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %27, %struct._IO_FILE** %13, align 8
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %29 = icmp eq %struct._IO_FILE* %28, null
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 4)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 4)
  store i32 -1, i32* %4, align 4
  br label %186

; <label>:32:                                     ; preds = %25
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i32 0, i32 0), i8 0, i64 216, i32 16, i1 false)
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %34 = call i32 @fseek(%struct._IO_FILE* %33, i64 0, i32 2)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %36 = call i64 @ftell(%struct._IO_FILE* %35)
  store i64 %36, i64* %9, align 8
  %37 = load i64, i64* %9, align 8
  %38 = icmp eq i64 %37, 0
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 5)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 5)
  store i32 -1, i32* %4, align 4
  br label %186

; <label>:41:                                     ; preds = %32
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %43 = load i32, i32* @TotalFrameSize, align 4
  %44 = sext i32 %43 to i64
  %45 = call i32 @fseek(%struct._IO_FILE* %42, i64 %44, i32 0)
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %47 = call i64 @fread(i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i32 0, i32 0), i64 4, i64 1, %struct._IO_FILE* %46)
  store i8 -1, i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 0), align 16
  %48 = load i32, i32* %7, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %60

; <label>:50:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 8)
  %51 = add i64 %pgocount4, 1
  store i64 %51, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 8)
  store i8 -5, i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 1), align 1
  %52 = load i8, i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 2), align 2
  %53 = zext i8 %52 to i32
  %54 = and i32 %53, 12
  %55 = trunc i32 %54 to i8
  store i8 %55, i8* %11, align 1
  %56 = load i8, i8* %11, align 1
  %57 = sext i8 %56 to i32
  %58 = or i32 80, %57
  %59 = trunc i32 %58 to i8
  store i8 %59, i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 2), align 2
  br label %69

; <label>:60:                                     ; preds = %41
  store i8 -13, i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 1), align 1
  %61 = load i8, i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 2), align 2
  %62 = zext i8 %61 to i32
  %63 = and i32 %62, 12
  %64 = trunc i32 %63 to i8
  store i8 %64, i8* %11, align 1
  %65 = load i8, i8* %11, align 1
  %66 = sext i8 %65 to i32
  %67 = or i32 -128, %66
  %68 = trunc i32 %67 to i8
  store i8 %68, i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 2), align 2
  br label %69

; <label>:69:                                     ; preds = %60, %50
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %71 = call i32 @fseek(%struct._IO_FILE* %70, i64 0, i32 0)
  %72 = getelementptr inbounds [100 x i8], [100 x i8]* %12, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %72, i8 0, i64 100, i32 16, i1 false)
  store i32 1, i32* %8, align 4
  br label %73

; <label>:73:                                     ; preds = %106, %69
  %74 = load i32, i32* %8, align 4
  %75 = icmp slt i32 %74, 100
  br i1 %75, label %76, label %109

; <label>:76:                                     ; preds = %73
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 0)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 0)
  %78 = load i32, i32* %8, align 4
  %79 = sitofp i32 %78 to double
  %80 = fmul double 1.000000e-02, %79
  %81 = load i32, i32* @nVbrNumFrames, align 4
  %82 = sitofp i32 %81 to double
  %83 = fmul double %80, %82
  %84 = call double @floor(double %83) #8
  %85 = fptosi double %84 to i32
  store i32 %85, i32* %15, align 4
  %86 = load i32*, i32** @pVbrFrames, align 8
  %87 = load i32, i32* %15, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32* %86, i64 %88
  %90 = load i32, i32* %89, align 4
  %91 = sitofp i32 %90 to float
  %92 = fmul float 2.560000e+02, %91
  %93 = load i64, i64* %9, align 8
  %94 = sitofp i64 %93 to float
  %95 = fdiv float %92, %94
  store float %95, float* %16, align 4
  %96 = load float, float* %16, align 4
  %97 = fcmp ogt float %96, 2.550000e+02
  br i1 %97, label %98, label %100

; <label>:98:                                     ; preds = %76
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 1)
  %99 = add i64 %pgocount6, 1
  store i64 %99, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 1)
  store float 2.550000e+02, float* %16, align 4
  br label %100

; <label>:100:                                    ; preds = %98, %76
  %101 = load float, float* %16, align 4
  %102 = fptoui float %101 to i8
  %103 = load i32, i32* %8, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [100 x i8], [100 x i8]* %12, i64 0, i64 %104
  store i8 %102, i8* %105, align 1
  br label %106

; <label>:106:                                    ; preds = %100
  %107 = load i32, i32* %8, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %8, align 4
  br label %73

; <label>:109:                                    ; preds = %73
  %110 = load i32, i32* @nZeroStreamSize, align 4
  store i32 %110, i32* %10, align 4
  %111 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 0), align 1
  %112 = load i32, i32* %10, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %10, align 4
  %114 = sext i32 %112 to i64
  %115 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %114
  store i8 %111, i8* %115, align 1
  %116 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 1), align 1
  %117 = load i32, i32* %10, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %10, align 4
  %119 = sext i32 %117 to i64
  %120 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %119
  store i8 %116, i8* %120, align 1
  %121 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 2), align 1
  %122 = load i32, i32* %10, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %10, align 4
  %124 = sext i32 %122 to i64
  %125 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %124
  store i8 %121, i8* %125, align 1
  %126 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @VBRTag, i64 0, i64 3), align 1
  %127 = load i32, i32* %10, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %10, align 4
  %129 = sext i32 %127 to i64
  %130 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %129
  store i8 %126, i8* %130, align 1
  %131 = load i32, i32* %10, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %132
  call void @CreateI4(i8* %133, i32 15)
  %134 = load i32, i32* %10, align 4
  %135 = add nsw i32 %134, 4
  store i32 %135, i32* %10, align 4
  %136 = load i32, i32* %10, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %137
  %139 = load i32, i32* @nVbrNumFrames, align 4
  call void @CreateI4(i8* %138, i32 %139)
  %140 = load i32, i32* %10, align 4
  %141 = add nsw i32 %140, 4
  store i32 %141, i32* %10, align 4
  %142 = load i32, i32* %10, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %143
  %145 = load i64, i64* %9, align 8
  %146 = trunc i64 %145 to i32
  call void @CreateI4(i8* %144, i32 %146)
  %147 = load i32, i32* %10, align 4
  %148 = add nsw i32 %147, 4
  store i32 %148, i32* %10, align 4
  %149 = load i32, i32* %10, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %150
  %152 = getelementptr inbounds [100 x i8], [100 x i8]* %12, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %151, i8* %152, i64 100, i32 1, i1 false)
  %153 = load i32, i32* %10, align 4
  %154 = sext i32 %153 to i64
  %155 = add i64 %154, 100
  %156 = trunc i64 %155 to i32
  store i32 %156, i32* %10, align 4
  %157 = load i32, i32* %10, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %158
  %160 = load i32, i32* %6, align 4
  call void @CreateI4(i8* %159, i32 %160)
  %161 = load i32, i32* %10, align 4
  %162 = add nsw i32 %161, 4
  store i32 %162, i32* %10, align 4
  %163 = getelementptr inbounds [80 x i8], [80 x i8]* %14, i32 0, i32 0
  %164 = call i8* @get_lame_version()
  %165 = call i32 (i8*, i8*, ...) @sprintf(i8* %163, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* %164) #6
  %166 = load i32, i32* %10, align 4
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %167
  %169 = getelementptr inbounds [80 x i8], [80 x i8]* %14, i32 0, i32 0
  %170 = call i8* @strncpy(i8* %168, i8* %169, i64 20) #6
  %171 = load i32, i32* %10, align 4
  %172 = add nsw i32 %171, 20
  store i32 %172, i32* %10, align 4
  %173 = load i32, i32* @TotalFrameSize, align 4
  %174 = sext i32 %173 to i64
  %175 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %176 = call i64 @fwrite(i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i32 0, i32 0), i64 %174, i64 1, %struct._IO_FILE* %175)
  %177 = icmp ne i64 %176, 1
  br i1 %177, label %178, label %180

; <label>:178:                                    ; preds = %109
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 6)
  %179 = add i64 %pgocount7, 1
  store i64 %179, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 6)
  store i32 -1, i32* %4, align 4
  br label %186

; <label>:180:                                    ; preds = %109
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 7)
  %181 = add i64 %pgocount8, 1
  store i64 %181, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_PutVbrTag, i64 0, i64 7)
  %182 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %183 = call i32 @fclose(%struct._IO_FILE* %182)
  %184 = load i32*, i32** @pVbrFrames, align 8
  %185 = bitcast i32* %184 to i8*
  call void @free(i8* %185) #6
  store i32* null, i32** @pVbrFrames, align 8
  store i32 0, i32* %4, align 4
  br label %186

; <label>:186:                                    ; preds = %180, %178, %39, %30, %23
  %187 = load i32, i32* %4, align 4
  ret i32 %187
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #3

declare i64 @ftell(%struct._IO_FILE*) #3

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #3

; Function Attrs: nounwind readnone
declare double @floor(double) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #1

declare i8* @get_lame_version() #3

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #1

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #3

declare i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @SeekPoint(i8*, i32, float) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store float %2, float* %6, align 4
  %12 = load float, float* %6, align 4
  %13 = fcmp olt float %12, 0.000000e+00
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_SeekPoint, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_SeekPoint, i64 0, i64 0)
  store float 0.000000e+00, float* %6, align 4
  br label %16

; <label>:16:                                     ; preds = %14, %3
  %17 = load float, float* %6, align 4
  %18 = fcmp ogt float %17, 1.000000e+02
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_SeekPoint, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_SeekPoint, i64 0, i64 1)
  store float 1.000000e+02, float* %6, align 4
  br label %21

; <label>:21:                                     ; preds = %19, %16
  %22 = load float, float* %6, align 4
  %23 = fptosi float %22 to i32
  store i32 %23, i32* %7, align 4
  %24 = load i32, i32* %7, align 4
  %25 = icmp sgt i32 %24, 99
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_SeekPoint, i64 0, i64 2)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_SeekPoint, i64 0, i64 2)
  store i32 99, i32* %7, align 4
  br label %28

; <label>:28:                                     ; preds = %26, %21
  %29 = load i8*, i8** %4, align 8
  %30 = load i32, i32* %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8* %29, i64 %31
  %33 = load i8, i8* %32, align 1
  %34 = uitofp i8 %33 to float
  store float %34, float* %9, align 4
  %35 = load i32, i32* %7, align 4
  %36 = icmp slt i32 %35, 99
  br i1 %36, label %37, label %46

; <label>:37:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_SeekPoint, i64 0, i64 3)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_SeekPoint, i64 0, i64 3)
  %39 = load i8*, i8** %4, align 8
  %40 = load i32, i32* %7, align 4
  %41 = add nsw i32 %40, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %39, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = uitofp i8 %44 to float
  store float %45, float* %10, align 4
  br label %48

; <label>:46:                                     ; preds = %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_SeekPoint, i64 0, i64 4)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_SeekPoint, i64 0, i64 4)
  store float 2.560000e+02, float* %10, align 4
  br label %48

; <label>:48:                                     ; preds = %46, %37
  %49 = load float, float* %9, align 4
  %50 = load float, float* %10, align 4
  %51 = load float, float* %9, align 4
  %52 = fsub float %50, %51
  %53 = load float, float* %6, align 4
  %54 = load i32, i32* %7, align 4
  %55 = sitofp i32 %54 to float
  %56 = fsub float %53, %55
  %57 = fmul float %52, %56
  %58 = fadd float %49, %57
  store float %58, float* %11, align 4
  %59 = load float, float* %11, align 4
  %60 = fmul float 3.906250e-03, %59
  %61 = load i32, i32* %5, align 4
  %62 = sitofp i32 %61 to float
  %63 = fmul float %60, %62
  %64 = fptosi float %63 to i32
  store i32 %64, i32* %8, align 4
  %65 = load i32, i32* %8, align 4
  ret i32 %65
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
