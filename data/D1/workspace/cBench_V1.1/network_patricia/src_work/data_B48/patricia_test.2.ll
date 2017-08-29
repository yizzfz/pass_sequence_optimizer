; ModuleID = 'tmp1.ll'
source_filename = "patricia_test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.ptree = type { i64, %struct.ptree_mask*, i8, i8, %struct.ptree*, %struct.ptree* }
%struct.ptree_mask = type { i64, i8* }
%struct.in_addr = type { i32 }
%struct.MyNode = type { i32, double }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [24 x i8] c"Usage: %s <TCP stream>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"File %s doesn't seem to exist\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"Allocating p-trie node\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Allocating p-trie mask data\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"Allocating p-trie mask's node data\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%f %d\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%f %08x: \00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Found.\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.9 = private unnamed_addr constant [22 x i8] c"Failed on pat_insert\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main1 = private constant [5 x i8] c"main1"
@__profc_main1 = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 169741652436, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**, i32)* @main1 to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [7 x i8] c"\05\00main1", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.ptree*, align 8
  %8 = alloca %struct.ptree*, align 8
  %9 = alloca %struct.ptree*, align 8
  %10 = alloca %struct.ptree_mask*, align 8
  %11 = alloca %struct._IO_FILE*, align 8
  %12 = alloca [128 x i8], align 16
  %13 = alloca [16 x i8], align 16
  %14 = alloca %struct.in_addr, align 4
  %15 = alloca i64, align 8
  %16 = alloca float, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 %2, i32* %6, align 4
  store i64 4294967295, i64* %15, align 8
  %17 = load i32, i32* %4, align 4
  %18 = icmp slt i32 %17, 2
  br i1 %18, label %19, label %25

; <label>:19:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 8)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 8)
  %21 = load i8**, i8*** %5, align 8
  %22 = getelementptr inbounds i8*, i8** %21, i64 0
  %23 = load i8*, i8** %22, align 8
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0), i8* %23)
  call void @exit(i32 1) #6
  unreachable

; <label>:25:                                     ; preds = %3
  %26 = load i8**, i8*** %5, align 8
  %27 = getelementptr inbounds i8*, i8** %26, i64 1
  %28 = load i8*, i8** %27, align 8
  %29 = call %struct._IO_FILE* @fopen(i8* %28, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %29, %struct._IO_FILE** %11, align 8
  %30 = icmp eq %struct._IO_FILE* %29, null
  br i1 %30, label %31, label %37

; <label>:31:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 9)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 9)
  %33 = load i8**, i8*** %5, align 8
  %34 = getelementptr inbounds i8*, i8** %33, i64 1
  %35 = load i8*, i8** %34, align 8
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i32 0, i32 0), i8* %35)
  call void @exit(i32 1) #6
  unreachable

; <label>:37:                                     ; preds = %25
  %38 = call noalias i8* @malloc(i64 40) #5
  %39 = bitcast i8* %38 to %struct.ptree*
  store %struct.ptree* %39, %struct.ptree** %7, align 8
  %40 = load %struct.ptree*, %struct.ptree** %7, align 8
  %41 = icmp ne %struct.ptree* %40, null
  br i1 %41, label %44, label %42

; <label>:42:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 10)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 10)
  call void @perror(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:44:                                     ; preds = %37
  %45 = load %struct.ptree*, %struct.ptree** %7, align 8
  %46 = bitcast %struct.ptree* %45 to i8*
  call void @llvm.memset.p0i8.i64(i8* %46, i8 0, i64 40, i32 8, i1 false)
  %47 = call noalias i8* @malloc(i64 16) #5
  %48 = bitcast i8* %47 to %struct.ptree_mask*
  %49 = load %struct.ptree*, %struct.ptree** %7, align 8
  %50 = getelementptr inbounds %struct.ptree, %struct.ptree* %49, i32 0, i32 1
  store %struct.ptree_mask* %48, %struct.ptree_mask** %50, align 8
  %51 = load %struct.ptree*, %struct.ptree** %7, align 8
  %52 = getelementptr inbounds %struct.ptree, %struct.ptree* %51, i32 0, i32 1
  %53 = load %struct.ptree_mask*, %struct.ptree_mask** %52, align 8
  %54 = icmp ne %struct.ptree_mask* %53, null
  br i1 %54, label %57, label %55

; <label>:55:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 11)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 11)
  call void @perror(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:57:                                     ; preds = %44
  %58 = load %struct.ptree*, %struct.ptree** %7, align 8
  %59 = getelementptr inbounds %struct.ptree, %struct.ptree* %58, i32 0, i32 1
  %60 = load %struct.ptree_mask*, %struct.ptree_mask** %59, align 8
  %61 = bitcast %struct.ptree_mask* %60 to i8*
  call void @llvm.memset.p0i8.i64(i8* %61, i8 0, i64 16, i32 8, i1 false)
  %62 = load %struct.ptree*, %struct.ptree** %7, align 8
  %63 = getelementptr inbounds %struct.ptree, %struct.ptree* %62, i32 0, i32 1
  %64 = load %struct.ptree_mask*, %struct.ptree_mask** %63, align 8
  store %struct.ptree_mask* %64, %struct.ptree_mask** %10, align 8
  %65 = call noalias i8* @malloc(i64 16) #5
  %66 = bitcast i8* %65 to %struct.MyNode*
  %67 = bitcast %struct.MyNode* %66 to i8*
  %68 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %69 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %68, i32 0, i32 1
  store i8* %67, i8** %69, align 8
  %70 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %71 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %70, i32 0, i32 1
  %72 = load i8*, i8** %71, align 8
  %73 = icmp ne i8* %72, null
  br i1 %73, label %76, label %74

; <label>:74:                                     ; preds = %57
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 12)
  %75 = add i64 %pgocount4, 1
  store i64 %75, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 12)
  call void @perror(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:76:                                     ; preds = %57
  %77 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %78 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %77, i32 0, i32 1
  %79 = load i8*, i8** %78, align 8
  call void @llvm.memset.p0i8.i64(i8* %79, i8 0, i64 1, i32 1, i1 false)
  %80 = load %struct.ptree*, %struct.ptree** %7, align 8
  %81 = getelementptr inbounds %struct.ptree, %struct.ptree* %80, i32 0, i32 2
  store i8 1, i8* %81, align 8
  %82 = load %struct.ptree*, %struct.ptree** %7, align 8
  %83 = load %struct.ptree*, %struct.ptree** %7, align 8
  %84 = getelementptr inbounds %struct.ptree, %struct.ptree* %83, i32 0, i32 5
  store %struct.ptree* %82, %struct.ptree** %84, align 8
  %85 = load %struct.ptree*, %struct.ptree** %7, align 8
  %86 = getelementptr inbounds %struct.ptree, %struct.ptree* %85, i32 0, i32 4
  store %struct.ptree* %82, %struct.ptree** %86, align 8
  br label %87

; <label>:87:                                     ; preds = %198, %76
  %88 = getelementptr inbounds [128 x i8], [128 x i8]* %12, i32 0, i32 0
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %90 = call i8* @fgets(i8* %88, i32 128, %struct._IO_FILE* %89)
  %91 = icmp ne i8* %90, null
  br i1 %91, label %92, label %199

; <label>:92:                                     ; preds = %87
  %93 = getelementptr inbounds [128 x i8], [128 x i8]* %12, i32 0, i32 0
  %94 = bitcast %struct.in_addr* %14 to i32*
  %95 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %93, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), float* %16, i32* %94) #5
  %96 = call noalias i8* @malloc(i64 40) #5
  %97 = bitcast i8* %96 to %struct.ptree*
  store %struct.ptree* %97, %struct.ptree** %8, align 8
  %98 = load %struct.ptree*, %struct.ptree** %8, align 8
  %99 = icmp ne %struct.ptree* %98, null
  br i1 %99, label %102, label %100

; <label>:100:                                    ; preds = %92
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 4)
  %101 = add i64 %pgocount5, 1
  store i64 %101, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 4)
  call void @perror(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:102:                                    ; preds = %92
  %103 = load %struct.ptree*, %struct.ptree** %8, align 8
  %104 = bitcast %struct.ptree* %103 to i8*
  call void @llvm.memset.p0i8.i64(i8* %104, i8 0, i64 40, i32 8, i1 false)
  %105 = call noalias i8* @malloc(i64 16) #5
  %106 = bitcast i8* %105 to %struct.ptree_mask*
  %107 = load %struct.ptree*, %struct.ptree** %8, align 8
  %108 = getelementptr inbounds %struct.ptree, %struct.ptree* %107, i32 0, i32 1
  store %struct.ptree_mask* %106, %struct.ptree_mask** %108, align 8
  %109 = load %struct.ptree*, %struct.ptree** %8, align 8
  %110 = getelementptr inbounds %struct.ptree, %struct.ptree* %109, i32 0, i32 1
  %111 = load %struct.ptree_mask*, %struct.ptree_mask** %110, align 8
  %112 = icmp ne %struct.ptree_mask* %111, null
  br i1 %112, label %115, label %113

; <label>:113:                                    ; preds = %102
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 5)
  %114 = add i64 %pgocount6, 1
  store i64 %114, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 5)
  call void @perror(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:115:                                    ; preds = %102
  %116 = load %struct.ptree*, %struct.ptree** %8, align 8
  %117 = getelementptr inbounds %struct.ptree, %struct.ptree* %116, i32 0, i32 1
  %118 = load %struct.ptree_mask*, %struct.ptree_mask** %117, align 8
  %119 = bitcast %struct.ptree_mask* %118 to i8*
  call void @llvm.memset.p0i8.i64(i8* %119, i8 0, i64 16, i32 8, i1 false)
  %120 = load %struct.ptree*, %struct.ptree** %8, align 8
  %121 = getelementptr inbounds %struct.ptree, %struct.ptree* %120, i32 0, i32 1
  %122 = load %struct.ptree_mask*, %struct.ptree_mask** %121, align 8
  store %struct.ptree_mask* %122, %struct.ptree_mask** %10, align 8
  %123 = call noalias i8* @malloc(i64 16) #5
  %124 = bitcast i8* %123 to %struct.MyNode*
  %125 = bitcast %struct.MyNode* %124 to i8*
  %126 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %127 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %126, i32 0, i32 1
  store i8* %125, i8** %127, align 8
  %128 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %129 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %128, i32 0, i32 1
  %130 = load i8*, i8** %129, align 8
  %131 = icmp ne i8* %130, null
  br i1 %131, label %134, label %132

; <label>:132:                                    ; preds = %115
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 6)
  %133 = add i64 %pgocount7, 1
  store i64 %133, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 6)
  call void @perror(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:134:                                    ; preds = %115
  %135 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %136 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %135, i32 0, i32 1
  %137 = load i8*, i8** %136, align 8
  call void @llvm.memset.p0i8.i64(i8* %137, i8 0, i64 1, i32 1, i1 false)
  %138 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %14, i32 0, i32 0
  %139 = load i32, i32* %138, align 4
  %140 = zext i32 %139 to i64
  %141 = load %struct.ptree*, %struct.ptree** %8, align 8
  %142 = getelementptr inbounds %struct.ptree, %struct.ptree* %141, i32 0, i32 0
  store i64 %140, i64* %142, align 8
  %143 = load i64, i64* %15, align 8
  %144 = and i64 %143, 4278190080
  %145 = lshr i64 %144, 24
  %146 = load i64, i64* %15, align 8
  %147 = and i64 %146, 16711680
  %148 = lshr i64 %147, 8
  %149 = or i64 %145, %148
  %150 = load i64, i64* %15, align 8
  %151 = and i64 %150, 65280
  %152 = shl i64 %151, 8
  %153 = or i64 %149, %152
  %154 = load i64, i64* %15, align 8
  %155 = and i64 %154, 255
  %156 = shl i64 %155, 24
  %157 = or i64 %153, %156
  %158 = load %struct.ptree*, %struct.ptree** %8, align 8
  %159 = getelementptr inbounds %struct.ptree, %struct.ptree* %158, i32 0, i32 1
  %160 = load %struct.ptree_mask*, %struct.ptree_mask** %159, align 8
  %161 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %160, i32 0, i32 0
  store i64 %157, i64* %161, align 8
  %162 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %14, i32 0, i32 0
  %163 = load i32, i32* %162, align 4
  %164 = zext i32 %163 to i64
  %165 = load %struct.ptree*, %struct.ptree** %7, align 8
  %166 = call %struct.ptree* @pat_search(i64 %164, %struct.ptree* %165)
  store %struct.ptree* %166, %struct.ptree** %9, align 8
  %167 = load %struct.ptree*, %struct.ptree** %9, align 8
  %168 = getelementptr inbounds %struct.ptree, %struct.ptree* %167, i32 0, i32 0
  %169 = load i64, i64* %168, align 8
  %170 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %14, i32 0, i32 0
  %171 = load i32, i32* %170, align 4
  %172 = zext i32 %171 to i64
  %173 = icmp eq i64 %169, %172
  br i1 %173, label %174, label %186

; <label>:174:                                    ; preds = %134
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 1)
  %175 = add i64 %pgocount8, 1
  store i64 %175, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 1)
  %176 = load i32, i32* %6, align 4
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %186

; <label>:178:                                    ; preds = %174
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 2)
  %179 = add i64 %pgocount9, 1
  store i64 %179, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 2)
  %180 = load float, float* %16, align 4
  %181 = fpext float %180 to double
  %182 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %14, i32 0, i32 0
  %183 = load i32, i32* %182, align 4
  %184 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i32 0, i32 0), double %181, i32 %183)
  %185 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0))
  br label %191

; <label>:186:                                    ; preds = %174, %134
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 0)
  %187 = add i64 %pgocount10, 1
  store i64 %187, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 0)
  %188 = load %struct.ptree*, %struct.ptree** %8, align 8
  %189 = load %struct.ptree*, %struct.ptree** %7, align 8
  %190 = call %struct.ptree* @pat_insert(%struct.ptree* %188, %struct.ptree* %189)
  store %struct.ptree* %190, %struct.ptree** %8, align 8
  br label %191

; <label>:191:                                    ; preds = %186, %178
  %192 = load %struct.ptree*, %struct.ptree** %8, align 8
  %193 = icmp ne %struct.ptree* %192, null
  br i1 %193, label %198, label %194

; <label>:194:                                    ; preds = %191
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 7)
  %195 = add i64 %pgocount11, 1
  store i64 %195, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 7)
  %196 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %197 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %196, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.9, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:198:                                    ; preds = %191
  br label %87

; <label>:199:                                    ; preds = %87
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 3)
  %200 = add i64 %pgocount12, 1
  store i64 %200, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_main1, i64 0, i64 3)
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %202 = call i32 @fclose(%struct._IO_FILE* %201)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare void @perror(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #3

declare %struct.ptree* @pat_search(i64, %struct.ptree*) #1

declare %struct.ptree* @pat_insert(%struct.ptree*, %struct.ptree*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
