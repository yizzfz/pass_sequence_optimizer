; ModuleID = 'tmp1.ll'
source_filename = "rtp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.rtpheader = type { %struct.rtpbits, i32, i32, i32 }
%struct.rtpbits = type { i32 }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

$__llvm_profile_raw_version = comdat any

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [18 x i8] c"socket() failed.\0A\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"setsockopt SO_REUSEADDR failed\0A\00", align 1
@.str.2 = private unnamed_addr constant [59 x i8] c"setsockopt IP_MULTICAST_TTL failed.  multicast in kernel?\0A\00", align 1
@.str.3 = private unnamed_addr constant [60 x i8] c"setsockopt IP_MULTICAST_LOOP failed.  multicast in kernel?\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_initrtp = private constant [7 x i8] c"initrtp"
@__profn_sendrtp = private constant [7 x i8] c"sendrtp"
@__profn_makesocket = private constant [10 x i8] c"makesocket"
@__profc_initrtp = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_initrtp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1454099302143547208, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_initrtp, i32 0, i32 0), i8* bitcast (void (%struct.rtpheader*)* @initrtp to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_sendrtp = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_sendrtp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -786828416522646989, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_sendrtp, i32 0, i32 0), i8* bitcast (i32 (i32, %struct.sockaddr_in*, %struct.rtpheader*, i8*, i32)* @sendrtp to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_makesocket = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_makesocket = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5306755965874738801, i64 76851786595, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i32 0, i32 0), i8* bitcast (i32 (i8*, i16, i32, %struct.sockaddr_in*)* @makesocket to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [33 x i8] c"\1A\1Fx\DA\CB\CC\CB,)*)`,N\CDK\01\D1\B9\89\D9\A9\C5\F9\C9\D9\A9%\00\89\89\0A4", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_initrtp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_sendrtp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_makesocket to i8*), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @initrtp(%struct.rtpheader*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_initrtp, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_initrtp, i64 0, i64 0)
  %3 = alloca %struct.rtpheader*, align 8
  store %struct.rtpheader* %0, %struct.rtpheader** %3, align 8
  %4 = load %struct.rtpheader*, %struct.rtpheader** %3, align 8
  %5 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %4, i32 0, i32 0
  %6 = bitcast %struct.rtpbits* %5 to i32*
  %7 = load i32, i32* %6, align 4
  %8 = and i32 %7, 1073741823
  %9 = or i32 %8, -2147483648
  store i32 %9, i32* %6, align 4
  %10 = load %struct.rtpheader*, %struct.rtpheader** %3, align 8
  %11 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %10, i32 0, i32 0
  %12 = bitcast %struct.rtpbits* %11 to i32*
  %13 = load i32, i32* %12, align 4
  %14 = and i32 %13, -536870913
  store i32 %14, i32* %12, align 4
  %15 = load %struct.rtpheader*, %struct.rtpheader** %3, align 8
  %16 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %15, i32 0, i32 0
  %17 = bitcast %struct.rtpbits* %16 to i32*
  %18 = load i32, i32* %17, align 4
  %19 = and i32 %18, -268435457
  store i32 %19, i32* %17, align 4
  %20 = load %struct.rtpheader*, %struct.rtpheader** %3, align 8
  %21 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %20, i32 0, i32 0
  %22 = bitcast %struct.rtpbits* %21 to i32*
  %23 = load i32, i32* %22, align 4
  %24 = and i32 %23, -251658241
  store i32 %24, i32* %22, align 4
  %25 = load %struct.rtpheader*, %struct.rtpheader** %3, align 8
  %26 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %25, i32 0, i32 0
  %27 = bitcast %struct.rtpbits* %26 to i32*
  %28 = load i32, i32* %27, align 4
  %29 = and i32 %28, -8388609
  store i32 %29, i32* %27, align 4
  %30 = load %struct.rtpheader*, %struct.rtpheader** %3, align 8
  %31 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %30, i32 0, i32 0
  %32 = bitcast %struct.rtpbits* %31 to i32*
  %33 = load i32, i32* %32, align 4
  %34 = and i32 %33, -8323073
  %35 = or i32 %34, 917504
  store i32 %35, i32* %32, align 4
  %36 = call i32 @rand() #6
  %37 = and i32 %36, 65535
  %38 = load %struct.rtpheader*, %struct.rtpheader** %3, align 8
  %39 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %38, i32 0, i32 0
  %40 = bitcast %struct.rtpbits* %39 to i32*
  %41 = load i32, i32* %40, align 4
  %42 = and i32 %37, 65535
  %43 = and i32 %41, -65536
  %44 = or i32 %43, %42
  store i32 %44, i32* %40, align 4
  %45 = shl i32 %42, 16
  %46 = ashr i32 %45, 16
  %47 = call i32 @rand() #6
  %48 = load %struct.rtpheader*, %struct.rtpheader** %3, align 8
  %49 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %48, i32 0, i32 1
  store i32 %47, i32* %49, align 4
  %50 = call i32 @rand() #6
  %51 = load %struct.rtpheader*, %struct.rtpheader** %3, align 8
  %52 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %51, i32 0, i32 2
  store i32 %50, i32* %52, align 4
  %53 = load %struct.rtpheader*, %struct.rtpheader** %3, align 8
  %54 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %53, i32 0, i32 3
  store i32 0, i32* %54, align 4
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define i32 @sendrtp(i32, %struct.sockaddr_in*, %struct.rtpheader*, i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_sendrtp, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_sendrtp, i64 0, i64 0)
  %7 = alloca i32, align 4
  %8 = alloca %struct.sockaddr_in*, align 8
  %9 = alloca %struct.rtpheader*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32*, align 8
  store i32 %0, i32* %7, align 4
  store %struct.sockaddr_in* %1, %struct.sockaddr_in** %8, align 8
  store %struct.rtpheader* %2, %struct.rtpheader** %9, align 8
  store i8* %3, i8** %10, align 8
  store i32 %4, i32* %11, align 4
  %15 = load i32, i32* %11, align 4
  %16 = sext i32 %15 to i64
  %17 = add i64 %16, 16
  %18 = alloca i8, i64 %17, align 16
  store i8* %18, i8** %12, align 8
  %19 = load %struct.rtpheader*, %struct.rtpheader** %9, align 8
  %20 = bitcast %struct.rtpheader* %19 to i32*
  store i32* %20, i32** %13, align 8
  %21 = load i8*, i8** %12, align 8
  %22 = bitcast i8* %21 to i32*
  store i32* %22, i32** %14, align 8
  %23 = load i32*, i32** %13, align 8
  %24 = getelementptr inbounds i32, i32* %23, i64 0
  %25 = load i32, i32* %24, align 4
  %26 = call i32 @htonl(i32 %25) #7
  %27 = load i32*, i32** %14, align 8
  %28 = getelementptr inbounds i32, i32* %27, i64 0
  store i32 %26, i32* %28, align 4
  %29 = load i32*, i32** %13, align 8
  %30 = getelementptr inbounds i32, i32* %29, i64 1
  %31 = load i32, i32* %30, align 4
  %32 = call i32 @htonl(i32 %31) #7
  %33 = load i32*, i32** %14, align 8
  %34 = getelementptr inbounds i32, i32* %33, i64 1
  store i32 %32, i32* %34, align 4
  %35 = load i32*, i32** %13, align 8
  %36 = getelementptr inbounds i32, i32* %35, i64 2
  %37 = load i32, i32* %36, align 4
  %38 = call i32 @htonl(i32 %37) #7
  %39 = load i32*, i32** %14, align 8
  %40 = getelementptr inbounds i32, i32* %39, i64 2
  store i32 %38, i32* %40, align 4
  %41 = load i32*, i32** %13, align 8
  %42 = getelementptr inbounds i32, i32* %41, i64 3
  %43 = load i32, i32* %42, align 4
  %44 = call i32 @htonl(i32 %43) #7
  %45 = load i32*, i32** %14, align 8
  %46 = getelementptr inbounds i32, i32* %45, i64 3
  store i32 %44, i32* %46, align 4
  %47 = load i8*, i8** %12, align 8
  %48 = getelementptr inbounds i8, i8* %47, i64 16
  %49 = load i8*, i8** %10, align 8
  %50 = load i32, i32* %11, align 4
  %51 = sext i32 %50 to i64
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %48, i8* %49, i64 %51, i32 1, i1 false)
  %52 = load i32, i32* %7, align 4
  %53 = load i8*, i8** %12, align 8
  %54 = load i32, i32* %11, align 4
  %55 = sext i32 %54 to i64
  %56 = add i64 %55, 16
  %57 = load %struct.sockaddr_in*, %struct.sockaddr_in** %8, align 8
  %58 = bitcast %struct.sockaddr_in* %57 to %struct.sockaddr*
  %59 = call i64 @sendto(i32 %52, i8* %53, i64 %56, i32 0, %struct.sockaddr* %58, i32 16)
  %60 = trunc i64 %59 to i32
  ret i32 %60
}

; Function Attrs: nounwind readnone
declare i32 @htonl(i32) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare i64 @sendto(i32, i8*, i64, i32, %struct.sockaddr*, i32) #4

; Function Attrs: nounwind uwtable
define i32 @makesocket(i8*, i16 zeroext, i32, %struct.sockaddr_in*) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i16, align 2
  %7 = alloca i32, align 4
  %8 = alloca %struct.sockaddr_in*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.sockaddr_in, align 4
  %12 = alloca i8, align 1
  %13 = alloca i8, align 1
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i16 %1, i16* %6, align 2
  store i32 %2, i32* %7, align 4
  store %struct.sockaddr_in* %3, %struct.sockaddr_in** %8, align 8
  store i32 1, i32* %10, align 4
  %16 = load i32, i32* %7, align 4
  %17 = trunc i32 %16 to i8
  store i8 %17, i8* %12, align 1
  store i8 0, i8* %13, align 1
  %18 = call i32 @socket(i32 2, i32 2, i32 0) #6
  store i32 %18, i32* %15, align 4
  %19 = load i32, i32* %15, align 4
  %20 = icmp slt i32 %19, 0
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 2)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 2)
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

; <label>:25:                                     ; preds = %4
  %26 = load i8*, i8** %5, align 8
  %27 = call i32 @inet_addr(i8* %26) #6
  store i32 %27, i32* %14, align 4
  %28 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %11, i32 0, i32 0
  store i16 2, i16* %28, align 4
  %29 = load %struct.sockaddr_in*, %struct.sockaddr_in** %8, align 8
  %30 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %29, i32 0, i32 0
  store i16 2, i16* %30, align 4
  %31 = load i16, i16* %6, align 2
  %32 = call zeroext i16 @htons(i16 zeroext %31) #7
  %33 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %11, i32 0, i32 1
  store i16 %32, i16* %33, align 2
  %34 = load %struct.sockaddr_in*, %struct.sockaddr_in** %8, align 8
  %35 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %34, i32 0, i32 1
  store i16 %32, i16* %35, align 2
  %36 = load i32, i32* %14, align 4
  %37 = load %struct.sockaddr_in*, %struct.sockaddr_in** %8, align 8
  %38 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %37, i32 0, i32 2
  %39 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %38, i32 0, i32 0
  store i32 %36, i32* %39, align 4
  %40 = load i32, i32* %15, align 4
  %41 = bitcast i32* %10 to i8*
  %42 = call i32 @setsockopt(i32 %40, i32 1, i32 2, i8* %41, i32 4) #6
  store i32 %42, i32* %9, align 4
  %43 = load i32, i32* %9, align 4
  %44 = icmp slt i32 %43, 0
  br i1 %44, label %45, label %49

; <label>:45:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 3)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 3)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

; <label>:49:                                     ; preds = %25
  %50 = load i32, i32* %14, align 4
  %51 = call i32 @ntohl(i32 %50) #7
  %52 = lshr i32 %51, 28
  %53 = icmp eq i32 %52, 14
  br i1 %53, label %54, label %74

; <label>:54:                                     ; preds = %49
  %55 = load i32, i32* %15, align 4
  %56 = call i32 @setsockopt(i32 %55, i32 0, i32 33, i8* %12, i32 1) #6
  store i32 %56, i32* %9, align 4
  %57 = load i32, i32* %9, align 4
  %58 = icmp slt i32 %57, 0
  br i1 %58, label %59, label %63

; <label>:59:                                     ; preds = %54
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 4)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 4)
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

; <label>:63:                                     ; preds = %54
  store i8 1, i8* %13, align 1
  %64 = load i32, i32* %15, align 4
  %65 = call i32 @setsockopt(i32 %64, i32 0, i32 34, i8* %13, i32 1) #6
  store i32 %65, i32* %9, align 4
  %66 = load i32, i32* %9, align 4
  %67 = icmp slt i32 %66, 0
  br i1 %67, label %68, label %72

; <label>:68:                                     ; preds = %63
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 5)
  %69 = add i64 %pgocount3, 1
  store i64 %69, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 5)
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %71 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %70, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

; <label>:72:                                     ; preds = %63
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 1)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 1)
  br label %74

; <label>:74:                                     ; preds = %72, %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 0)
  %75 = add i64 %pgocount5, 1
  store i64 %75, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_makesocket, i64 0, i64 0)
  %76 = load i32, i32* %15, align 4
  ret i32 %76
}

; Function Attrs: nounwind
declare i32 @socket(i32, i32, i32) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind
declare i32 @inet_addr(i8*) #1

; Function Attrs: nounwind readnone
declare zeroext i16 @htons(i16 zeroext) #2

; Function Attrs: nounwind
declare i32 @setsockopt(i32, i32, i32, i8*, i32) #1

; Function Attrs: nounwind readnone
declare i32 @ntohl(i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readnone }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
