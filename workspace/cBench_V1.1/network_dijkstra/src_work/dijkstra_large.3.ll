; ModuleID = 'dijkstra_large.2.ll'
source_filename = "dijkstra_large.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._QITEM = type { i32, i32, i32, %struct._QITEM* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct._NODE = type { i32, i32 }

$__llvm_profile_raw_version = comdat any

@NUM_NODES = global i32 0, align 4
@qHead = global %struct._QITEM* null, align 8
@g_qCount = global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@stdout = external global %struct._IO_FILE*, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"Out of memory.\0A\00", align 1
@ch = common global i32 0, align 4
@rgnNodes = common global %struct._NODE* null, align 8
@.str.2 = private unnamed_addr constant [54 x i8] c"Shortest path is 0 in cost. Just stay where you are.\0A\00", align 1
@iNode = common global i32 0, align 4
@iDist = common global i32 0, align 4
@iPrev = common global i32 0, align 4
@i = common global i32 0, align 4
@AdjMatrix = common global i32* null, align 8
@iCost = common global i32 0, align 4
@.str.3 = private unnamed_addr constant [28 x i8] c"Usage: dijkstra <filename>\0A\00", align 1
@.str.4 = private unnamed_addr constant [41 x i8] c"Only supports matrix size is #define'd.\0A\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"Matrix size: %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"AdjMatrix size: %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [18 x i8] c"rgnNodesSize: %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [30 x i8] c"Shortest path is %d in cost. \00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"Path is: \00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_print_path = private constant [10 x i8] c"print_path"
@__profn_enqueue = private constant [7 x i8] c"enqueue"
@__profn_dequeue = private constant [7 x i8] c"dequeue"
@__profn_qcount = private constant [6 x i8] c"qcount"
@__profn_dijkstra = private constant [8 x i8] c"dijkstra"
@__profn_main = private constant [4 x i8] c"main"
@__profc_print_path = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_print_path = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2836776867012024237, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_print_path, i32 0, i32 0), i8* bitcast (void (%struct._NODE*, i32)* @print_path to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_enqueue = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_enqueue = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9115961150839627173, i64 56129130468, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_enqueue, i32 0, i32 0), i8* bitcast (void (i32, i32, i32)* @enqueue to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_dequeue = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_dequeue = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -70968857413126833, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_dequeue, i32 0, i32 0), i8* bitcast (void (i32*, i32*, i32*)* @dequeue to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_qcount = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_qcount = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -663674338065027853, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_qcount, i32 0, i32 0), i8* bitcast (i32 ()* @qcount to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_dijkstra = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_dijkstra = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4129700562993725323, i64 122192596190, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i32 0, i32 0), i8* bitcast (void (i32, i32)* @dijkstra to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_main = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 121186892684, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [52 x i8] c"/2x\DA+(\CA\CC+\89/H,\C9`L\CD+,M-MeLI\85\D0\85\C9\F9\A5y%\8C)\99Y\D9\C5%E\89\8C\B9\89\99y\00\B0\C2\11\C0", section "__llvm_prf_names"
@llvm.used = appending global [7 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_print_path to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_enqueue to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_dequeue to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_qcount to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_dijkstra to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @print_path(%struct._NODE*, i32) #0 {
  %3 = alloca %struct._NODE*, align 8
  %4 = alloca i32, align 4
  store %struct._NODE* %0, %struct._NODE** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %struct._NODE*, %struct._NODE** %3, align 8
  %6 = load i32, i32* %4, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds %struct._NODE, %struct._NODE* %5, i64 %7
  %9 = getelementptr inbounds %struct._NODE, %struct._NODE* %8, i32 0, i32 1
  %10 = load i32, i32* %9, align 4
  %11 = icmp ne i32 %10, 9999
  br i1 %11, label %12, label %21

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_print_path, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_print_path, i64 0, i64 1)
  %14 = load %struct._NODE*, %struct._NODE** %3, align 8
  %15 = load %struct._NODE*, %struct._NODE** %3, align 8
  %16 = load i32, i32* %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct._NODE, %struct._NODE* %15, i64 %17
  %19 = getelementptr inbounds %struct._NODE, %struct._NODE* %18, i32 0, i32 1
  %20 = load i32, i32* %19, align 4
  call void @print_path(%struct._NODE* %14, i32 %20)
  br label %21

; <label>:21:                                     ; preds = %12, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_print_path, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_print_path, i64 0, i64 0)
  %23 = load i32, i32* %4, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %23)
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %26 = call i32 @fflush(%struct._IO_FILE* %25)
  ret void
}

declare i32 @printf(i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @enqueue(i32, i32, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct._QITEM*, align 8
  %8 = alloca %struct._QITEM*, align 8
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %9 = call noalias i8* @malloc(i64 24) #4
  %10 = bitcast i8* %9 to %struct._QITEM*
  store %struct._QITEM* %10, %struct._QITEM** %7, align 8
  %11 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  store %struct._QITEM* %11, %struct._QITEM** %8, align 8
  %12 = load %struct._QITEM*, %struct._QITEM** %7, align 8
  %13 = icmp ne %struct._QITEM* %12, null
  br i1 %13, label %18, label %14

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_enqueue, i64 0, i64 3)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_enqueue, i64 0, i64 3)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:18:                                     ; preds = %3
  %19 = load i32, i32* %4, align 4
  %20 = load %struct._QITEM*, %struct._QITEM** %7, align 8
  %21 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %20, i32 0, i32 0
  store i32 %19, i32* %21, align 8
  %22 = load i32, i32* %5, align 4
  %23 = load %struct._QITEM*, %struct._QITEM** %7, align 8
  %24 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %23, i32 0, i32 1
  store i32 %22, i32* %24, align 4
  %25 = load i32, i32* %6, align 4
  %26 = load %struct._QITEM*, %struct._QITEM** %7, align 8
  %27 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %26, i32 0, i32 2
  store i32 %25, i32* %27, align 8
  %28 = load %struct._QITEM*, %struct._QITEM** %7, align 8
  %29 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %28, i32 0, i32 3
  store %struct._QITEM* null, %struct._QITEM** %29, align 8
  %30 = load %struct._QITEM*, %struct._QITEM** %8, align 8
  %31 = icmp ne %struct._QITEM* %30, null
  br i1 %31, label %35, label %32

; <label>:32:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_enqueue, i64 0, i64 2)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_enqueue, i64 0, i64 2)
  %34 = load %struct._QITEM*, %struct._QITEM** %7, align 8
  store %struct._QITEM* %34, %struct._QITEM** @qHead, align 8
  br label %51

; <label>:35:                                     ; preds = %18
  br label %36

; <label>:36:                                     ; preds = %41, %35
  %37 = load %struct._QITEM*, %struct._QITEM** %8, align 8
  %38 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %37, i32 0, i32 3
  %39 = load %struct._QITEM*, %struct._QITEM** %38, align 8
  %40 = icmp ne %struct._QITEM* %39, null
  br i1 %40, label %41, label %46

; <label>:41:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_enqueue, i64 0, i64 0)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_enqueue, i64 0, i64 0)
  %43 = load %struct._QITEM*, %struct._QITEM** %8, align 8
  %44 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %43, i32 0, i32 3
  %45 = load %struct._QITEM*, %struct._QITEM** %44, align 8
  store %struct._QITEM* %45, %struct._QITEM** %8, align 8
  br label %36

; <label>:46:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_enqueue, i64 0, i64 1)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_enqueue, i64 0, i64 1)
  %48 = load %struct._QITEM*, %struct._QITEM** %7, align 8
  %49 = load %struct._QITEM*, %struct._QITEM** %8, align 8
  %50 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %49, i32 0, i32 3
  store %struct._QITEM* %48, %struct._QITEM** %50, align 8
  br label %51

; <label>:51:                                     ; preds = %46, %32
  %52 = load i32, i32* @g_qCount, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* @g_qCount, align 4
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define void @dequeue(i32*, i32*, i32*) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca %struct._QITEM*, align 8
  store i32* %0, i32** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %2, i32** %6, align 8
  %8 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  store %struct._QITEM* %8, %struct._QITEM** %7, align 8
  %9 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  %10 = icmp ne %struct._QITEM* %9, null
  br i1 %10, label %11, label %32

; <label>:11:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_dequeue, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_dequeue, i64 0, i64 1)
  %13 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  %14 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %13, i32 0, i32 0
  %15 = load i32, i32* %14, align 8
  %16 = load i32*, i32** %4, align 8
  store i32 %15, i32* %16, align 4
  %17 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  %18 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %17, i32 0, i32 1
  %19 = load i32, i32* %18, align 4
  %20 = load i32*, i32** %5, align 8
  store i32 %19, i32* %20, align 4
  %21 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  %22 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %21, i32 0, i32 2
  %23 = load i32, i32* %22, align 8
  %24 = load i32*, i32** %6, align 8
  store i32 %23, i32* %24, align 4
  %25 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  %26 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %25, i32 0, i32 3
  %27 = load %struct._QITEM*, %struct._QITEM** %26, align 8
  store %struct._QITEM* %27, %struct._QITEM** @qHead, align 8
  %28 = load %struct._QITEM*, %struct._QITEM** %7, align 8
  %29 = bitcast %struct._QITEM* %28 to i8*
  call void @free(i8* %29) #4
  %30 = load i32, i32* @g_qCount, align 4
  %31 = add nsw i32 %30, -1
  store i32 %31, i32* @g_qCount, align 4
  br label %32

; <label>:32:                                     ; preds = %11, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_dequeue, i64 0, i64 0)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_dequeue, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @qcount() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_qcount, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_qcount, i64 0, i64 0)
  %2 = load i32, i32* @g_qCount, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define void @dijkstra(i32, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  store i32 0, i32* @ch, align 4
  br label %5

; <label>:5:                                      ; preds = %20, %2
  %6 = load i32, i32* @ch, align 4
  %7 = load i32, i32* @NUM_NODES, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %24

; <label>:9:                                      ; preds = %5
  %10 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %11 = load i32, i32* @ch, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds %struct._NODE, %struct._NODE* %10, i64 %12
  %14 = getelementptr inbounds %struct._NODE, %struct._NODE* %13, i32 0, i32 0
  store i32 9999, i32* %14, align 4
  %15 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %16 = load i32, i32* @ch, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct._NODE, %struct._NODE* %15, i64 %17
  %19 = getelementptr inbounds %struct._NODE, %struct._NODE* %18, i32 0, i32 1
  store i32 9999, i32* %19, align 4
  br label %20

; <label>:20:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 4)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 4)
  %22 = load i32, i32* @ch, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* @ch, align 4
  br label %5

; <label>:24:                                     ; preds = %5
  %25 = load i32, i32* %3, align 4
  %26 = load i32, i32* %4, align 4
  %27 = icmp eq i32 %25, %26
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 6)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 6)
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0))
  br label %114

; <label>:31:                                     ; preds = %24
  %32 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %33 = load i32, i32* %3, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds %struct._NODE, %struct._NODE* %32, i64 %34
  %36 = getelementptr inbounds %struct._NODE, %struct._NODE* %35, i32 0, i32 0
  store i32 0, i32* %36, align 4
  %37 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %38 = load i32, i32* %3, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct._NODE, %struct._NODE* %37, i64 %39
  %41 = getelementptr inbounds %struct._NODE, %struct._NODE* %40, i32 0, i32 1
  store i32 9999, i32* %41, align 4
  %42 = load i32, i32* %3, align 4
  call void @enqueue(i32 %42, i32 0, i32 9999)
  br label %43

; <label>:43:                                     ; preds = %110, %31
  %44 = call i32 @qcount()
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %46, label %112

; <label>:46:                                     ; preds = %43
  call void @dequeue(i32* @iNode, i32* @iDist, i32* @iPrev)
  store i32 0, i32* @i, align 4
  br label %47

; <label>:47:                                     ; preds = %106, %46
  %48 = load i32, i32* @i, align 4
  %49 = load i32, i32* @NUM_NODES, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %110

; <label>:51:                                     ; preds = %47
  %52 = load i32*, i32** @AdjMatrix, align 8
  %53 = load i32, i32* @iNode, align 4
  %54 = load i32, i32* @NUM_NODES, align 4
  %55 = mul nsw i32 %53, %54
  %56 = load i32, i32* @i, align 4
  %57 = add nsw i32 %55, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32* %52, i64 %58
  %60 = load i32, i32* %59, align 4
  store i32 %60, i32* @iCost, align 4
  %61 = icmp ne i32 %60, 9999
  br i1 %61, label %62, label %105

; <label>:62:                                     ; preds = %51
  %63 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %64 = load i32, i32* @i, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds %struct._NODE, %struct._NODE* %63, i64 %65
  %67 = getelementptr inbounds %struct._NODE, %struct._NODE* %66, i32 0, i32 0
  %68 = load i32, i32* %67, align 4
  %69 = icmp eq i32 9999, %68
  br i1 %69, label %82, label %70

; <label>:70:                                     ; preds = %62
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 3)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 3)
  %72 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %73 = load i32, i32* @i, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds %struct._NODE, %struct._NODE* %72, i64 %74
  %76 = getelementptr inbounds %struct._NODE, %struct._NODE* %75, i32 0, i32 0
  %77 = load i32, i32* %76, align 4
  %78 = load i32, i32* @iCost, align 4
  %79 = load i32, i32* @iDist, align 4
  %80 = add nsw i32 %78, %79
  %81 = icmp sgt i32 %77, %80
  br i1 %81, label %82, label %103

; <label>:82:                                     ; preds = %70, %62
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 2)
  %83 = add i64 %pgocount3, 1
  store i64 %83, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 2)
  %84 = load i32, i32* @iDist, align 4
  %85 = load i32, i32* @iCost, align 4
  %86 = add nsw i32 %84, %85
  %87 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %88 = load i32, i32* @i, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds %struct._NODE, %struct._NODE* %87, i64 %89
  %91 = getelementptr inbounds %struct._NODE, %struct._NODE* %90, i32 0, i32 0
  store i32 %86, i32* %91, align 4
  %92 = load i32, i32* @iNode, align 4
  %93 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %94 = load i32, i32* @i, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds %struct._NODE, %struct._NODE* %93, i64 %95
  %97 = getelementptr inbounds %struct._NODE, %struct._NODE* %96, i32 0, i32 1
  store i32 %92, i32* %97, align 4
  %98 = load i32, i32* @i, align 4
  %99 = load i32, i32* @iDist, align 4
  %100 = load i32, i32* @iCost, align 4
  %101 = add nsw i32 %99, %100
  %102 = load i32, i32* @iNode, align 4
  call void @enqueue(i32 %98, i32 %101, i32 %102)
  br label %103

; <label>:103:                                    ; preds = %82, %70
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 1)
  %104 = add i64 %pgocount4, 1
  store i64 %104, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 1)
  br label %105

; <label>:105:                                    ; preds = %103, %51
  br label %106

; <label>:106:                                    ; preds = %105
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 0)
  %107 = add i64 %pgocount5, 1
  store i64 %107, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 0)
  %108 = load i32, i32* @i, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* @i, align 4
  br label %47

; <label>:110:                                    ; preds = %47
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 5)
  %111 = add i64 %pgocount6, 1
  store i64 %111, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 5)
  br label %43

; <label>:112:                                    ; preds = %43
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 7)
  %113 = add i64 %pgocount7, 1
  store i64 %113, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_dijkstra, i64 0, i64 7)
  br label %114

; <label>:114:                                    ; preds = %112, %28
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca %struct._IO_FILE*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %10, align 8
  %13 = load i32, i32* %4, align 4
  %14 = icmp slt i32 %13, 2
  br i1 %14, label %15, label %21

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 5)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 5)
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0))
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:21:                                     ; preds = %2
  %22 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0))
  store %struct._IO_FILE* %22, %struct._IO_FILE** %10, align 8
  %23 = icmp eq %struct._IO_FILE* %22, null
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 6)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 6)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:28:                                     ; preds = %21
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i64* %12)
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %32 = call i32 @fclose(%struct._IO_FILE* %31)
  %33 = load i8**, i8*** %5, align 8
  %34 = getelementptr inbounds i8*, i8** %33, i64 1
  %35 = load i8*, i8** %34, align 8
  %36 = call %struct._IO_FILE* @fopen(i8* %35, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  store %struct._IO_FILE* %36, %struct._IO_FILE** %9, align 8
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i32* @NUM_NODES)
  %39 = load i32, i32* @NUM_NODES, align 4
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11, i32 0, i32 0), i32 %39)
  %41 = load i32, i32* @NUM_NODES, align 4
  %42 = add nsw i32 %41, 1
  %43 = mul nsw i32 4, %42
  %44 = load i32, i32* @NUM_NODES, align 4
  %45 = add nsw i32 %44, 1
  %46 = mul nsw i32 %43, %45
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i32 0, i32 0), i32 %46)
  %48 = load i32, i32* @NUM_NODES, align 4
  %49 = add nsw i32 %48, 1
  %50 = mul nsw i32 8, %49
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.13, i32 0, i32 0), i32 %50)
  %52 = load i32, i32* @NUM_NODES, align 4
  %53 = add nsw i32 %52, 1
  %54 = sext i32 %53 to i64
  %55 = mul i64 4, %54
  %56 = load i32, i32* @NUM_NODES, align 4
  %57 = add nsw i32 %56, 1
  %58 = sext i32 %57 to i64
  %59 = mul i64 %55, %58
  %60 = call noalias i8* @malloc(i64 %59) #4
  %61 = bitcast i8* %60 to i32*
  store i32* %61, i32** @AdjMatrix, align 8
  %62 = load i32, i32* @NUM_NODES, align 4
  %63 = add nsw i32 %62, 1
  %64 = sext i32 %63 to i64
  %65 = mul i64 8, %64
  %66 = call noalias i8* @malloc(i64 %65) #4
  %67 = bitcast i8* %66 to %struct._NODE*
  store %struct._NODE* %67, %struct._NODE** @rgnNodes, align 8
  store i32 0, i32* %6, align 4
  br label %68

; <label>:68:                                     ; preds = %94, %28
  %69 = load i32, i32* %6, align 4
  %70 = load i32, i32* @NUM_NODES, align 4
  %71 = icmp slt i32 %69, %70
  br i1 %71, label %72, label %98

; <label>:72:                                     ; preds = %68
  store i32 0, i32* %7, align 4
  br label %73

; <label>:73:                                     ; preds = %89, %72
  %74 = load i32, i32* %7, align 4
  %75 = load i32, i32* @NUM_NODES, align 4
  %76 = icmp slt i32 %74, %75
  br i1 %76, label %77, label %93

; <label>:77:                                     ; preds = %73
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %79 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i32* %8)
  %80 = load i32, i32* %8, align 4
  %81 = load i32*, i32** @AdjMatrix, align 8
  %82 = load i32, i32* %6, align 4
  %83 = load i32, i32* @NUM_NODES, align 4
  %84 = mul nsw i32 %82, %83
  %85 = load i32, i32* %7, align 4
  %86 = add nsw i32 %84, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32* %81, i64 %87
  store i32 %80, i32* %88, align 4
  br label %89

; <label>:89:                                     ; preds = %77
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 0)
  %90 = add i64 %pgocount2, 1
  store i64 %90, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 0)
  %91 = load i32, i32* %7, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %7, align 4
  br label %73

; <label>:93:                                     ; preds = %73
  br label %94

; <label>:94:                                     ; preds = %93
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 2)
  %95 = add i64 %pgocount3, 1
  store i64 %95, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 2)
  %96 = load i32, i32* %6, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %6, align 4
  br label %68

; <label>:98:                                     ; preds = %68
  store i32 0, i32* %6, align 4
  %99 = load i32, i32* @NUM_NODES, align 4
  %100 = sdiv i32 %99, 2
  store i32 %100, i32* %7, align 4
  br label %101

; <label>:101:                                    ; preds = %132, %98
  %102 = load i32, i32* %6, align 4
  %103 = load i32, i32* @NUM_NODES, align 4
  %104 = icmp slt i32 %102, %103
  br i1 %104, label %105, label %138

; <label>:105:                                    ; preds = %101
  %106 = load i32, i32* %7, align 4
  %107 = load i32, i32* @NUM_NODES, align 4
  %108 = srem i32 %106, %107
  store i32 %108, i32* %7, align 4
  store i64 0, i64* %11, align 8
  br label %109

; <label>:109:                                    ; preds = %116, %105
  %110 = load i64, i64* %11, align 8
  %111 = load i64, i64* %12, align 8
  %112 = icmp slt i64 %110, %111
  br i1 %112, label %113, label %120

; <label>:113:                                    ; preds = %109
  %114 = load i32, i32* %6, align 4
  %115 = load i32, i32* %7, align 4
  call void @dijkstra(i32 %114, i32 %115)
  br label %116

; <label>:116:                                    ; preds = %113
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 1)
  %117 = add i64 %pgocount4, 1
  store i64 %117, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 1)
  %118 = load i64, i64* %11, align 8
  %119 = add nsw i64 %118, 1
  store i64 %119, i64* %11, align 8
  br label %109

; <label>:120:                                    ; preds = %109
  %121 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %122 = load i32, i32* %7, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds %struct._NODE, %struct._NODE* %121, i64 %123
  %125 = getelementptr inbounds %struct._NODE, %struct._NODE* %124, i32 0, i32 0
  %126 = load i32, i32* %125, align 4
  %127 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.14, i32 0, i32 0), i32 %126)
  %128 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i32 0, i32 0))
  %129 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %130 = load i32, i32* %7, align 4
  call void @print_path(%struct._NODE* %129, i32 %130)
  %131 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i32 0, i32 0))
  br label %132

; <label>:132:                                    ; preds = %120
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 3)
  %133 = add i64 %pgocount5, 1
  store i64 %133, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 3)
  %134 = load i32, i32* %6, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, i32* %6, align 4
  %136 = load i32, i32* %7, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %7, align 4
  br label %101

; <label>:138:                                    ; preds = %101
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 4)
  %139 = add i64 %pgocount6, 1
  store i64 %139, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_main, i64 0, i64 4)
  %140 = load i32*, i32** @AdjMatrix, align 8
  %141 = bitcast i32* %140 to i8*
  call void @free(i8* %141) #4
  %142 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %143 = bitcast %struct._NODE* %142 to i8*
  call void @free(i8* %143) #4
  ret i32 0
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
