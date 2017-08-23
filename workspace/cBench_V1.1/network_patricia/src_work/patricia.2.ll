; ModuleID = 'tmp1.ll'
source_filename = "patricia.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ptree = type { i64, %struct.ptree_mask*, i8, i8, %struct.ptree*, %struct.ptree* }
%struct.ptree_mask = type { i64, i8* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_pat_insert = private constant [10 x i8] c"pat_insert"
@__profn_tmp1.ll_bit = private constant [11 x i8] c"tmp1.ll:bit"
@__profn_tmp1.ll_insertR = private constant [15 x i8] c"tmp1.ll:insertR"
@__profn_pat_remove = private constant [10 x i8] c"pat_remove"
@__profn_pat_search = private constant [10 x i8] c"pat_search"
@__profc_pat_insert = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_pat_insert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6788662159596285922, i64 228720131702, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i32 0, i32 0), i8* bitcast (%struct.ptree* (%struct.ptree*, %struct.ptree*)* @pat_insert to i8*), i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_bit = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_bit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2412374408750803230, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_bit, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_insertR = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_insertR = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4383167918105498148, i64 86220159095, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_pat_remove = private global [23 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_pat_remove = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5124916942517845154, i64 340014848040, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i32 0, i32 0), i8* bitcast (i32 (%struct.ptree*, %struct.ptree*)* @pat_remove to i8*), i8* null, i32 23, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_pat_search = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_pat_search = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5475036285681273464, i64 94104897219, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i32 0, i32 0), i8* bitcast (%struct.ptree* (i64, %struct.ptree*)* @pat_search to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [53 x i8] c"<3x\DA+H,\89\CF\CC+N-*a,\C9-0\D4\CB\C9\B1J\CAD\B0!RA\8C\05@eE\A9\B9\F9e\A9`fqjbQr\06\00\9F\B8\164", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_pat_insert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_bit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_insertR to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_pat_remove to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_pat_search to i8*), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define %struct.ptree* @pat_insert(%struct.ptree*, %struct.ptree*) #0 {
  %3 = alloca %struct.ptree*, align 8
  %4 = alloca %struct.ptree*, align 8
  %5 = alloca %struct.ptree*, align 8
  %6 = alloca %struct.ptree*, align 8
  %7 = alloca %struct.ptree_mask*, align 8
  %8 = alloca %struct.ptree_mask*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.ptree* %0, %struct.ptree** %4, align 8
  store %struct.ptree* %1, %struct.ptree** %5, align 8
  %11 = load %struct.ptree*, %struct.ptree** %5, align 8
  %12 = icmp ne %struct.ptree* %11, null
  br i1 %12, label %13, label %23

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 8)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 8)
  %15 = load %struct.ptree*, %struct.ptree** %4, align 8
  %16 = icmp ne %struct.ptree* %15, null
  br i1 %16, label %17, label %23

; <label>:17:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 9)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 9)
  %19 = load %struct.ptree*, %struct.ptree** %4, align 8
  %20 = getelementptr inbounds %struct.ptree, %struct.ptree* %19, i32 0, i32 1
  %21 = load %struct.ptree_mask*, %struct.ptree_mask** %20, align 8
  %22 = icmp ne %struct.ptree_mask* %21, null
  br i1 %22, label %25, label %23

; <label>:23:                                     ; preds = %17, %13, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 7)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 7)
  store %struct.ptree* null, %struct.ptree** %3, align 8
  br label %277

; <label>:25:                                     ; preds = %17
  %26 = load %struct.ptree*, %struct.ptree** %4, align 8
  %27 = getelementptr inbounds %struct.ptree, %struct.ptree* %26, i32 0, i32 1
  %28 = load %struct.ptree_mask*, %struct.ptree_mask** %27, align 8
  %29 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %28, i32 0, i32 0
  %30 = load i64, i64* %29, align 8
  %31 = load %struct.ptree*, %struct.ptree** %4, align 8
  %32 = getelementptr inbounds %struct.ptree, %struct.ptree* %31, i32 0, i32 0
  %33 = load i64, i64* %32, align 8
  %34 = and i64 %33, %30
  store i64 %34, i64* %32, align 8
  %35 = load %struct.ptree*, %struct.ptree** %5, align 8
  store %struct.ptree* %35, %struct.ptree** %6, align 8
  br label %36

; <label>:36:                                     ; preds = %62, %25
  %37 = load %struct.ptree*, %struct.ptree** %6, align 8
  %38 = getelementptr inbounds %struct.ptree, %struct.ptree* %37, i32 0, i32 3
  %39 = load i8, i8* %38, align 1
  %40 = sext i8 %39 to i32
  store i32 %40, i32* %9, align 4
  %41 = load %struct.ptree*, %struct.ptree** %6, align 8
  %42 = getelementptr inbounds %struct.ptree, %struct.ptree* %41, i32 0, i32 3
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = load %struct.ptree*, %struct.ptree** %4, align 8
  %46 = getelementptr inbounds %struct.ptree, %struct.ptree* %45, i32 0, i32 0
  %47 = load i64, i64* %46, align 8
  %48 = call i64 @bit(i32 %44, i64 %47)
  %49 = icmp ne i64 %48, 0
  br i1 %49, label %50, label %55

; <label>:50:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 0)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 0)
  %52 = load %struct.ptree*, %struct.ptree** %6, align 8
  %53 = getelementptr inbounds %struct.ptree, %struct.ptree* %52, i32 0, i32 5
  %54 = load %struct.ptree*, %struct.ptree** %53, align 8
  br label %60

; <label>:55:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 2)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 2)
  %57 = load %struct.ptree*, %struct.ptree** %6, align 8
  %58 = getelementptr inbounds %struct.ptree, %struct.ptree* %57, i32 0, i32 4
  %59 = load %struct.ptree*, %struct.ptree** %58, align 8
  br label %60

; <label>:60:                                     ; preds = %55, %50
  %61 = phi %struct.ptree* [ %54, %50 ], [ %59, %55 ]
  store %struct.ptree* %61, %struct.ptree** %6, align 8
  br label %62

; <label>:62:                                     ; preds = %60
  %63 = load i32, i32* %9, align 4
  %64 = load %struct.ptree*, %struct.ptree** %6, align 8
  %65 = getelementptr inbounds %struct.ptree, %struct.ptree* %64, i32 0, i32 3
  %66 = load i8, i8* %65, align 1
  %67 = sext i8 %66 to i32
  %68 = icmp slt i32 %63, %67
  br i1 %68, label %36, label %69

; <label>:69:                                     ; preds = %62
  %70 = load %struct.ptree*, %struct.ptree** %4, align 8
  %71 = getelementptr inbounds %struct.ptree, %struct.ptree* %70, i32 0, i32 0
  %72 = load i64, i64* %71, align 8
  %73 = load %struct.ptree*, %struct.ptree** %6, align 8
  %74 = getelementptr inbounds %struct.ptree, %struct.ptree* %73, i32 0, i32 0
  %75 = load i64, i64* %74, align 8
  %76 = icmp eq i64 %72, %75
  br i1 %76, label %77, label %219

; <label>:77:                                     ; preds = %69
  store i32 0, i32* %9, align 4
  br label %78

; <label>:78:                                     ; preds = %122, %77
  %79 = load i32, i32* %9, align 4
  %80 = load %struct.ptree*, %struct.ptree** %6, align 8
  %81 = getelementptr inbounds %struct.ptree, %struct.ptree* %80, i32 0, i32 2
  %82 = load i8, i8* %81, align 8
  %83 = zext i8 %82 to i32
  %84 = icmp slt i32 %79, %83
  br i1 %84, label %85, label %126

; <label>:85:                                     ; preds = %78
  %86 = load %struct.ptree*, %struct.ptree** %4, align 8
  %87 = getelementptr inbounds %struct.ptree, %struct.ptree* %86, i32 0, i32 1
  %88 = load %struct.ptree_mask*, %struct.ptree_mask** %87, align 8
  %89 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %88, i32 0, i32 0
  %90 = load i64, i64* %89, align 8
  %91 = load %struct.ptree*, %struct.ptree** %6, align 8
  %92 = getelementptr inbounds %struct.ptree, %struct.ptree* %91, i32 0, i32 1
  %93 = load %struct.ptree_mask*, %struct.ptree_mask** %92, align 8
  %94 = load i32, i32* %9, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %93, i64 %95
  %97 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %96, i32 0, i32 0
  %98 = load i64, i64* %97, align 8
  %99 = icmp eq i64 %90, %98
  br i1 %99, label %100, label %121

; <label>:100:                                    ; preds = %85
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 12)
  %101 = add i64 %pgocount5, 1
  store i64 %101, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 12)
  %102 = load %struct.ptree*, %struct.ptree** %4, align 8
  %103 = getelementptr inbounds %struct.ptree, %struct.ptree* %102, i32 0, i32 1
  %104 = load %struct.ptree_mask*, %struct.ptree_mask** %103, align 8
  %105 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %104, i32 0, i32 1
  %106 = load i8*, i8** %105, align 8
  %107 = load %struct.ptree*, %struct.ptree** %6, align 8
  %108 = getelementptr inbounds %struct.ptree, %struct.ptree* %107, i32 0, i32 1
  %109 = load %struct.ptree_mask*, %struct.ptree_mask** %108, align 8
  %110 = load i32, i32* %9, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %109, i64 %111
  %113 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %112, i32 0, i32 1
  store i8* %106, i8** %113, align 8
  %114 = load %struct.ptree*, %struct.ptree** %4, align 8
  %115 = getelementptr inbounds %struct.ptree, %struct.ptree* %114, i32 0, i32 1
  %116 = load %struct.ptree_mask*, %struct.ptree_mask** %115, align 8
  %117 = bitcast %struct.ptree_mask* %116 to i8*
  call void @free(i8* %117) #4
  %118 = load %struct.ptree*, %struct.ptree** %4, align 8
  %119 = bitcast %struct.ptree* %118 to i8*
  call void @free(i8* %119) #4
  store %struct.ptree* null, %struct.ptree** %4, align 8
  %120 = load %struct.ptree*, %struct.ptree** %6, align 8
  store %struct.ptree* %120, %struct.ptree** %3, align 8
  br label %277

; <label>:121:                                    ; preds = %85
  br label %122

; <label>:122:                                    ; preds = %121
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 4)
  %123 = add i64 %pgocount6, 1
  store i64 %123, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 4)
  %124 = load i32, i32* %9, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %9, align 4
  br label %78

; <label>:126:                                    ; preds = %78
  %127 = load %struct.ptree*, %struct.ptree** %6, align 8
  %128 = getelementptr inbounds %struct.ptree, %struct.ptree* %127, i32 0, i32 2
  %129 = load i8, i8* %128, align 8
  %130 = zext i8 %129 to i32
  %131 = add nsw i32 %130, 1
  %132 = sext i32 %131 to i64
  %133 = mul i64 16, %132
  %134 = call noalias i8* @malloc(i64 %133) #4
  %135 = bitcast i8* %134 to %struct.ptree_mask*
  store %struct.ptree_mask* %135, %struct.ptree_mask** %7, align 8
  store i32 0, i32* %10, align 4
  store i32 0, i32* %9, align 4
  %136 = load %struct.ptree_mask*, %struct.ptree_mask** %7, align 8
  store %struct.ptree_mask* %136, %struct.ptree_mask** %8, align 8
  br label %137

; <label>:137:                                    ; preds = %185, %126
  %138 = load i32, i32* %9, align 4
  %139 = load %struct.ptree*, %struct.ptree** %6, align 8
  %140 = getelementptr inbounds %struct.ptree, %struct.ptree* %139, i32 0, i32 2
  %141 = load i8, i8* %140, align 8
  %142 = zext i8 %141 to i32
  %143 = icmp slt i32 %138, %142
  br i1 %143, label %144, label %188

; <label>:144:                                    ; preds = %137
  %145 = load %struct.ptree*, %struct.ptree** %4, align 8
  %146 = getelementptr inbounds %struct.ptree, %struct.ptree* %145, i32 0, i32 1
  %147 = load %struct.ptree_mask*, %struct.ptree_mask** %146, align 8
  %148 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %147, i32 0, i32 0
  %149 = load i64, i64* %148, align 8
  %150 = load %struct.ptree*, %struct.ptree** %6, align 8
  %151 = getelementptr inbounds %struct.ptree, %struct.ptree* %150, i32 0, i32 1
  %152 = load %struct.ptree_mask*, %struct.ptree_mask** %151, align 8
  %153 = load i32, i32* %9, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %152, i64 %154
  %156 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %155, i32 0, i32 0
  %157 = load i64, i64* %156, align 8
  %158 = icmp ugt i64 %149, %157
  br i1 %158, label %159, label %172

; <label>:159:                                    ; preds = %144
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 5)
  %160 = add i64 %pgocount7, 1
  store i64 %160, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 5)
  %161 = load %struct.ptree_mask*, %struct.ptree_mask** %8, align 8
  %162 = bitcast %struct.ptree_mask* %161 to i8*
  %163 = load %struct.ptree*, %struct.ptree** %6, align 8
  %164 = getelementptr inbounds %struct.ptree, %struct.ptree* %163, i32 0, i32 1
  %165 = load %struct.ptree_mask*, %struct.ptree_mask** %164, align 8
  %166 = load i32, i32* %9, align 4
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %165, i64 %167
  %169 = bitcast %struct.ptree_mask* %168 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %162, i8* %169, i64 16, i32 8, i1 false)
  %170 = load i32, i32* %9, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %9, align 4
  br label %184

; <label>:172:                                    ; preds = %144
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 6)
  %173 = add i64 %pgocount8, 1
  store i64 %173, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 6)
  %174 = load %struct.ptree_mask*, %struct.ptree_mask** %8, align 8
  %175 = bitcast %struct.ptree_mask* %174 to i8*
  %176 = load %struct.ptree*, %struct.ptree** %4, align 8
  %177 = getelementptr inbounds %struct.ptree, %struct.ptree* %176, i32 0, i32 1
  %178 = load %struct.ptree_mask*, %struct.ptree_mask** %177, align 8
  %179 = bitcast %struct.ptree_mask* %178 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %175, i8* %179, i64 16, i32 8, i1 false)
  %180 = load %struct.ptree*, %struct.ptree** %4, align 8
  %181 = getelementptr inbounds %struct.ptree, %struct.ptree* %180, i32 0, i32 1
  %182 = load %struct.ptree_mask*, %struct.ptree_mask** %181, align 8
  %183 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %182, i32 0, i32 0
  store i64 4294967295, i64* %183, align 8
  store i32 1, i32* %10, align 4
  br label %184

; <label>:184:                                    ; preds = %172, %159
  br label %185

; <label>:185:                                    ; preds = %184
  %186 = load %struct.ptree_mask*, %struct.ptree_mask** %8, align 8
  %187 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %186, i32 1
  store %struct.ptree_mask* %187, %struct.ptree_mask** %8, align 8
  br label %137

; <label>:188:                                    ; preds = %137
  %189 = load i32, i32* %10, align 4
  %190 = icmp ne i32 %189, 0
  br i1 %190, label %199, label %191

; <label>:191:                                    ; preds = %188
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 14)
  %192 = add i64 %pgocount9, 1
  store i64 %192, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 14)
  %193 = load %struct.ptree_mask*, %struct.ptree_mask** %8, align 8
  %194 = bitcast %struct.ptree_mask* %193 to i8*
  %195 = load %struct.ptree*, %struct.ptree** %4, align 8
  %196 = getelementptr inbounds %struct.ptree, %struct.ptree* %195, i32 0, i32 1
  %197 = load %struct.ptree_mask*, %struct.ptree_mask** %196, align 8
  %198 = bitcast %struct.ptree_mask* %197 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %194, i8* %198, i64 16, i32 8, i1 false)
  br label %199

; <label>:199:                                    ; preds = %191, %188
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 11)
  %200 = add i64 %pgocount10, 1
  store i64 %200, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 11)
  %201 = load %struct.ptree*, %struct.ptree** %4, align 8
  %202 = getelementptr inbounds %struct.ptree, %struct.ptree* %201, i32 0, i32 1
  %203 = load %struct.ptree_mask*, %struct.ptree_mask** %202, align 8
  %204 = bitcast %struct.ptree_mask* %203 to i8*
  call void @free(i8* %204) #4
  %205 = load %struct.ptree*, %struct.ptree** %4, align 8
  %206 = bitcast %struct.ptree* %205 to i8*
  call void @free(i8* %206) #4
  store %struct.ptree* null, %struct.ptree** %4, align 8
  %207 = load %struct.ptree*, %struct.ptree** %6, align 8
  %208 = getelementptr inbounds %struct.ptree, %struct.ptree* %207, i32 0, i32 2
  %209 = load i8, i8* %208, align 8
  %210 = add i8 %209, 1
  store i8 %210, i8* %208, align 8
  %211 = load %struct.ptree*, %struct.ptree** %6, align 8
  %212 = getelementptr inbounds %struct.ptree, %struct.ptree* %211, i32 0, i32 1
  %213 = load %struct.ptree_mask*, %struct.ptree_mask** %212, align 8
  %214 = bitcast %struct.ptree_mask* %213 to i8*
  call void @free(i8* %214) #4
  %215 = load %struct.ptree_mask*, %struct.ptree_mask** %7, align 8
  %216 = load %struct.ptree*, %struct.ptree** %6, align 8
  %217 = getelementptr inbounds %struct.ptree, %struct.ptree* %216, i32 0, i32 1
  store %struct.ptree_mask* %215, %struct.ptree_mask** %217, align 8
  %218 = load %struct.ptree*, %struct.ptree** %6, align 8
  store %struct.ptree* %218, %struct.ptree** %3, align 8
  br label %277

; <label>:219:                                    ; preds = %69
  store i32 1, i32* %9, align 4
  br label %220

; <label>:220:                                    ; preds = %239, %219
  %221 = load i32, i32* %9, align 4
  %222 = icmp slt i32 %221, 32
  br i1 %222, label %223, label %236

; <label>:223:                                    ; preds = %220
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 3)
  %224 = add i64 %pgocount11, 1
  store i64 %224, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 3)
  %225 = load i32, i32* %9, align 4
  %226 = load %struct.ptree*, %struct.ptree** %4, align 8
  %227 = getelementptr inbounds %struct.ptree, %struct.ptree* %226, i32 0, i32 0
  %228 = load i64, i64* %227, align 8
  %229 = call i64 @bit(i32 %225, i64 %228)
  %230 = load i32, i32* %9, align 4
  %231 = load %struct.ptree*, %struct.ptree** %6, align 8
  %232 = getelementptr inbounds %struct.ptree, %struct.ptree* %231, i32 0, i32 0
  %233 = load i64, i64* %232, align 8
  %234 = call i64 @bit(i32 %230, i64 %233)
  %235 = icmp eq i64 %229, %234
  br label %236

; <label>:236:                                    ; preds = %223, %220
  %237 = phi i1 [ false, %220 ], [ %235, %223 ]
  br i1 %237, label %238, label %243

; <label>:238:                                    ; preds = %236
  br label %239

; <label>:239:                                    ; preds = %238
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 1)
  %240 = add i64 %pgocount12, 1
  store i64 %240, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 1)
  %241 = load i32, i32* %9, align 4
  %242 = add nsw i32 %241, 1
  store i32 %242, i32* %9, align 4
  br label %220

; <label>:243:                                    ; preds = %236
  %244 = load %struct.ptree*, %struct.ptree** %5, align 8
  %245 = getelementptr inbounds %struct.ptree, %struct.ptree* %244, i32 0, i32 3
  %246 = load i8, i8* %245, align 1
  %247 = sext i8 %246 to i32
  %248 = load %struct.ptree*, %struct.ptree** %4, align 8
  %249 = getelementptr inbounds %struct.ptree, %struct.ptree* %248, i32 0, i32 0
  %250 = load i64, i64* %249, align 8
  %251 = call i64 @bit(i32 %247, i64 %250)
  %252 = icmp ne i64 %251, 0
  br i1 %252, label %253, label %264

; <label>:253:                                    ; preds = %243
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 10)
  %254 = add i64 %pgocount13, 1
  store i64 %254, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 10)
  %255 = load %struct.ptree*, %struct.ptree** %5, align 8
  %256 = getelementptr inbounds %struct.ptree, %struct.ptree* %255, i32 0, i32 5
  %257 = load %struct.ptree*, %struct.ptree** %256, align 8
  %258 = load %struct.ptree*, %struct.ptree** %4, align 8
  %259 = load i32, i32* %9, align 4
  %260 = load %struct.ptree*, %struct.ptree** %5, align 8
  %261 = call %struct.ptree* @insertR(%struct.ptree* %257, %struct.ptree* %258, i32 %259, %struct.ptree* %260)
  %262 = load %struct.ptree*, %struct.ptree** %5, align 8
  %263 = getelementptr inbounds %struct.ptree, %struct.ptree* %262, i32 0, i32 5
  store %struct.ptree* %261, %struct.ptree** %263, align 8
  br label %275

; <label>:264:                                    ; preds = %243
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 13)
  %265 = add i64 %pgocount14, 1
  store i64 %265, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_pat_insert, i64 0, i64 13)
  %266 = load %struct.ptree*, %struct.ptree** %5, align 8
  %267 = getelementptr inbounds %struct.ptree, %struct.ptree* %266, i32 0, i32 4
  %268 = load %struct.ptree*, %struct.ptree** %267, align 8
  %269 = load %struct.ptree*, %struct.ptree** %4, align 8
  %270 = load i32, i32* %9, align 4
  %271 = load %struct.ptree*, %struct.ptree** %5, align 8
  %272 = call %struct.ptree* @insertR(%struct.ptree* %268, %struct.ptree* %269, i32 %270, %struct.ptree* %271)
  %273 = load %struct.ptree*, %struct.ptree** %5, align 8
  %274 = getelementptr inbounds %struct.ptree, %struct.ptree* %273, i32 0, i32 4
  store %struct.ptree* %272, %struct.ptree** %274, align 8
  br label %275

; <label>:275:                                    ; preds = %264, %253
  %276 = load %struct.ptree*, %struct.ptree** %4, align 8
  store %struct.ptree* %276, %struct.ptree** %3, align 8
  br label %277

; <label>:277:                                    ; preds = %275, %199, %100, %23
  %278 = load %struct.ptree*, %struct.ptree** %3, align 8
  ret %struct.ptree* %278
}

; Function Attrs: inlinehint nounwind uwtable
define internal i64 @bit(i32, i64) #1 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_bit, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_bit, i64 0, i64 0)
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store i32 %0, i32* %4, align 4
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = load i32, i32* %4, align 4
  %8 = sub nsw i32 31, %7
  %9 = shl i32 1, %8
  %10 = sext i32 %9 to i64
  %11 = and i64 %6, %10
  ret i64 %11
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal %struct.ptree* @insertR(%struct.ptree*, %struct.ptree*, i32, %struct.ptree*) #0 {
  %5 = alloca %struct.ptree*, align 8
  %6 = alloca %struct.ptree*, align 8
  %7 = alloca %struct.ptree*, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.ptree*, align 8
  store %struct.ptree* %0, %struct.ptree** %6, align 8
  store %struct.ptree* %1, %struct.ptree** %7, align 8
  store i32 %2, i32* %8, align 4
  store %struct.ptree* %3, %struct.ptree** %9, align 8
  %10 = load %struct.ptree*, %struct.ptree** %6, align 8
  %11 = getelementptr inbounds %struct.ptree, %struct.ptree* %10, i32 0, i32 3
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = load i32, i32* %8, align 4
  %15 = icmp sge i32 %13, %14
  br i1 %15, label %27, label %16

; <label>:16:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 0)
  %18 = load %struct.ptree*, %struct.ptree** %6, align 8
  %19 = getelementptr inbounds %struct.ptree, %struct.ptree* %18, i32 0, i32 3
  %20 = load i8, i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = load %struct.ptree*, %struct.ptree** %9, align 8
  %23 = getelementptr inbounds %struct.ptree, %struct.ptree* %22, i32 0, i32 3
  %24 = load i8, i8* %23, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp sle i32 %21, %25
  br i1 %26, label %27, label %64

; <label>:27:                                     ; preds = %16, %4
  %28 = load i32, i32* %8, align 4
  %29 = trunc i32 %28 to i8
  %30 = load %struct.ptree*, %struct.ptree** %7, align 8
  %31 = getelementptr inbounds %struct.ptree, %struct.ptree* %30, i32 0, i32 3
  store i8 %29, i8* %31, align 1
  %32 = load i32, i32* %8, align 4
  %33 = load %struct.ptree*, %struct.ptree** %7, align 8
  %34 = getelementptr inbounds %struct.ptree, %struct.ptree* %33, i32 0, i32 0
  %35 = load i64, i64* %34, align 8
  %36 = call i64 @bit(i32 %32, i64 %35)
  %37 = icmp ne i64 %36, 0
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %27
  %39 = load %struct.ptree*, %struct.ptree** %6, align 8
  br label %43

; <label>:40:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 2)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 2)
  %42 = load %struct.ptree*, %struct.ptree** %7, align 8
  br label %43

; <label>:43:                                     ; preds = %40, %38
  %44 = phi %struct.ptree* [ %39, %38 ], [ %42, %40 ]
  %45 = load %struct.ptree*, %struct.ptree** %7, align 8
  %46 = getelementptr inbounds %struct.ptree, %struct.ptree* %45, i32 0, i32 4
  store %struct.ptree* %44, %struct.ptree** %46, align 8
  %47 = load i32, i32* %8, align 4
  %48 = load %struct.ptree*, %struct.ptree** %7, align 8
  %49 = getelementptr inbounds %struct.ptree, %struct.ptree* %48, i32 0, i32 0
  %50 = load i64, i64* %49, align 8
  %51 = call i64 @bit(i32 %47, i64 %50)
  %52 = icmp ne i64 %51, 0
  br i1 %52, label %53, label %56

; <label>:53:                                     ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 1)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 1)
  %55 = load %struct.ptree*, %struct.ptree** %7, align 8
  br label %59

; <label>:56:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 3)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 3)
  %58 = load %struct.ptree*, %struct.ptree** %6, align 8
  br label %59

; <label>:59:                                     ; preds = %56, %53
  %60 = phi %struct.ptree* [ %55, %53 ], [ %58, %56 ]
  %61 = load %struct.ptree*, %struct.ptree** %7, align 8
  %62 = getelementptr inbounds %struct.ptree, %struct.ptree* %61, i32 0, i32 5
  store %struct.ptree* %60, %struct.ptree** %62, align 8
  %63 = load %struct.ptree*, %struct.ptree** %7, align 8
  store %struct.ptree* %63, %struct.ptree** %5, align 8
  br label %98

; <label>:64:                                     ; preds = %16
  %65 = load %struct.ptree*, %struct.ptree** %6, align 8
  %66 = getelementptr inbounds %struct.ptree, %struct.ptree* %65, i32 0, i32 3
  %67 = load i8, i8* %66, align 1
  %68 = sext i8 %67 to i32
  %69 = load %struct.ptree*, %struct.ptree** %7, align 8
  %70 = getelementptr inbounds %struct.ptree, %struct.ptree* %69, i32 0, i32 0
  %71 = load i64, i64* %70, align 8
  %72 = call i64 @bit(i32 %68, i64 %71)
  %73 = icmp ne i64 %72, 0
  br i1 %73, label %74, label %85

; <label>:74:                                     ; preds = %64
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 4)
  %75 = add i64 %pgocount4, 1
  store i64 %75, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 4)
  %76 = load %struct.ptree*, %struct.ptree** %6, align 8
  %77 = getelementptr inbounds %struct.ptree, %struct.ptree* %76, i32 0, i32 5
  %78 = load %struct.ptree*, %struct.ptree** %77, align 8
  %79 = load %struct.ptree*, %struct.ptree** %7, align 8
  %80 = load i32, i32* %8, align 4
  %81 = load %struct.ptree*, %struct.ptree** %6, align 8
  %82 = call %struct.ptree* @insertR(%struct.ptree* %78, %struct.ptree* %79, i32 %80, %struct.ptree* %81)
  %83 = load %struct.ptree*, %struct.ptree** %6, align 8
  %84 = getelementptr inbounds %struct.ptree, %struct.ptree* %83, i32 0, i32 5
  store %struct.ptree* %82, %struct.ptree** %84, align 8
  br label %96

; <label>:85:                                     ; preds = %64
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 5)
  %86 = add i64 %pgocount5, 1
  store i64 %86, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_insertR, i64 0, i64 5)
  %87 = load %struct.ptree*, %struct.ptree** %6, align 8
  %88 = getelementptr inbounds %struct.ptree, %struct.ptree* %87, i32 0, i32 4
  %89 = load %struct.ptree*, %struct.ptree** %88, align 8
  %90 = load %struct.ptree*, %struct.ptree** %7, align 8
  %91 = load i32, i32* %8, align 4
  %92 = load %struct.ptree*, %struct.ptree** %6, align 8
  %93 = call %struct.ptree* @insertR(%struct.ptree* %89, %struct.ptree* %90, i32 %91, %struct.ptree* %92)
  %94 = load %struct.ptree*, %struct.ptree** %6, align 8
  %95 = getelementptr inbounds %struct.ptree, %struct.ptree* %94, i32 0, i32 4
  store %struct.ptree* %93, %struct.ptree** %95, align 8
  br label %96

; <label>:96:                                     ; preds = %85, %74
  %97 = load %struct.ptree*, %struct.ptree** %6, align 8
  store %struct.ptree* %97, %struct.ptree** %5, align 8
  br label %98

; <label>:98:                                     ; preds = %96, %59
  %99 = load %struct.ptree*, %struct.ptree** %5, align 8
  ret %struct.ptree* %99
}

; Function Attrs: nounwind uwtable
define i32 @pat_remove(%struct.ptree*, %struct.ptree*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.ptree*, align 8
  %5 = alloca %struct.ptree*, align 8
  %6 = alloca %struct.ptree*, align 8
  %7 = alloca %struct.ptree*, align 8
  %8 = alloca %struct.ptree*, align 8
  %9 = alloca %struct.ptree*, align 8
  %10 = alloca %struct.ptree*, align 8
  %11 = alloca %struct.ptree_mask*, align 8
  %12 = alloca %struct.ptree_mask*, align 8
  %13 = alloca i32, align 4
  store %struct.ptree* %0, %struct.ptree** %4, align 8
  store %struct.ptree* %1, %struct.ptree** %5, align 8
  %14 = load %struct.ptree*, %struct.ptree** %4, align 8
  %15 = icmp ne %struct.ptree* %14, null
  br i1 %15, label %16, label %26

; <label>:16:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 5)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 5)
  %18 = load %struct.ptree*, %struct.ptree** %4, align 8
  %19 = getelementptr inbounds %struct.ptree, %struct.ptree* %18, i32 0, i32 1
  %20 = load %struct.ptree_mask*, %struct.ptree_mask** %19, align 8
  %21 = icmp ne %struct.ptree_mask* %20, null
  br i1 %21, label %22, label %26

; <label>:22:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 7)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 7)
  %24 = load %struct.ptree*, %struct.ptree** %10, align 8
  %25 = icmp ne %struct.ptree* %24, null
  br i1 %25, label %28, label %26

; <label>:26:                                     ; preds = %22, %16, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 4)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 4)
  store i32 0, i32* %3, align 4
  br label %360

; <label>:28:                                     ; preds = %22
  %29 = load %struct.ptree*, %struct.ptree** %5, align 8
  store %struct.ptree* %29, %struct.ptree** %10, align 8
  store %struct.ptree* %29, %struct.ptree** %6, align 8
  store %struct.ptree* %29, %struct.ptree** %7, align 8
  br label %30

; <label>:30:                                     ; preds = %58, %28
  %31 = load %struct.ptree*, %struct.ptree** %10, align 8
  %32 = getelementptr inbounds %struct.ptree, %struct.ptree* %31, i32 0, i32 3
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  store i32 %34, i32* %13, align 4
  %35 = load %struct.ptree*, %struct.ptree** %6, align 8
  store %struct.ptree* %35, %struct.ptree** %7, align 8
  %36 = load %struct.ptree*, %struct.ptree** %10, align 8
  store %struct.ptree* %36, %struct.ptree** %6, align 8
  %37 = load %struct.ptree*, %struct.ptree** %10, align 8
  %38 = getelementptr inbounds %struct.ptree, %struct.ptree* %37, i32 0, i32 3
  %39 = load i8, i8* %38, align 1
  %40 = sext i8 %39 to i32
  %41 = load %struct.ptree*, %struct.ptree** %4, align 8
  %42 = getelementptr inbounds %struct.ptree, %struct.ptree* %41, i32 0, i32 0
  %43 = load i64, i64* %42, align 8
  %44 = call i64 @bit(i32 %40, i64 %43)
  %45 = icmp ne i64 %44, 0
  br i1 %45, label %46, label %51

; <label>:46:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 0)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 0)
  %48 = load %struct.ptree*, %struct.ptree** %10, align 8
  %49 = getelementptr inbounds %struct.ptree, %struct.ptree* %48, i32 0, i32 5
  %50 = load %struct.ptree*, %struct.ptree** %49, align 8
  br label %56

; <label>:51:                                     ; preds = %30
  %pgocount4 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 1)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 1)
  %53 = load %struct.ptree*, %struct.ptree** %10, align 8
  %54 = getelementptr inbounds %struct.ptree, %struct.ptree* %53, i32 0, i32 4
  %55 = load %struct.ptree*, %struct.ptree** %54, align 8
  br label %56

; <label>:56:                                     ; preds = %51, %46
  %57 = phi %struct.ptree* [ %50, %46 ], [ %55, %51 ]
  store %struct.ptree* %57, %struct.ptree** %10, align 8
  br label %58

; <label>:58:                                     ; preds = %56
  %59 = load i32, i32* %13, align 4
  %60 = load %struct.ptree*, %struct.ptree** %10, align 8
  %61 = getelementptr inbounds %struct.ptree, %struct.ptree* %60, i32 0, i32 3
  %62 = load i8, i8* %61, align 1
  %63 = sext i8 %62 to i32
  %64 = icmp slt i32 %59, %63
  br i1 %64, label %30, label %65

; <label>:65:                                     ; preds = %58
  %66 = load %struct.ptree*, %struct.ptree** %10, align 8
  %67 = getelementptr inbounds %struct.ptree, %struct.ptree* %66, i32 0, i32 0
  %68 = load i64, i64* %67, align 8
  %69 = load %struct.ptree*, %struct.ptree** %4, align 8
  %70 = getelementptr inbounds %struct.ptree, %struct.ptree* %69, i32 0, i32 0
  %71 = load i64, i64* %70, align 8
  %72 = icmp ne i64 %68, %71
  br i1 %72, label %73, label %75

; <label>:73:                                     ; preds = %65
  %pgocount5 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 10)
  %74 = add i64 %pgocount5, 1
  store i64 %74, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 10)
  store i32 0, i32* %3, align 4
  br label %360

; <label>:75:                                     ; preds = %65
  %76 = load %struct.ptree*, %struct.ptree** %10, align 8
  %77 = getelementptr inbounds %struct.ptree, %struct.ptree* %76, i32 0, i32 2
  %78 = load i8, i8* %77, align 8
  %79 = zext i8 %78 to i32
  %80 = icmp eq i32 %79, 1
  br i1 %80, label %81, label %258

; <label>:81:                                     ; preds = %75
  %82 = load %struct.ptree*, %struct.ptree** %10, align 8
  %83 = getelementptr inbounds %struct.ptree, %struct.ptree* %82, i32 0, i32 3
  %84 = load i8, i8* %83, align 1
  %85 = sext i8 %84 to i32
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %89

; <label>:87:                                     ; preds = %81
  %pgocount6 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 14)
  %88 = add i64 %pgocount6, 1
  store i64 %88, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 14)
  store i32 0, i32* %3, align 4
  br label %360

; <label>:89:                                     ; preds = %81
  %90 = load %struct.ptree*, %struct.ptree** %10, align 8
  %91 = getelementptr inbounds %struct.ptree, %struct.ptree* %90, i32 0, i32 1
  %92 = load %struct.ptree_mask*, %struct.ptree_mask** %91, align 8
  %93 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %92, i32 0, i32 0
  %94 = load i64, i64* %93, align 8
  %95 = load %struct.ptree*, %struct.ptree** %4, align 8
  %96 = getelementptr inbounds %struct.ptree, %struct.ptree* %95, i32 0, i32 1
  %97 = load %struct.ptree_mask*, %struct.ptree_mask** %96, align 8
  %98 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %97, i32 0, i32 0
  %99 = load i64, i64* %98, align 8
  %100 = icmp ne i64 %94, %99
  br i1 %100, label %101, label %103

; <label>:101:                                    ; preds = %89
  %pgocount7 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 15)
  %102 = add i64 %pgocount7, 1
  store i64 %102, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 15)
  store i32 0, i32* %3, align 4
  br label %360

; <label>:103:                                    ; preds = %89
  %104 = load %struct.ptree*, %struct.ptree** %6, align 8
  store %struct.ptree* %104, %struct.ptree** %8, align 8
  store %struct.ptree* %104, %struct.ptree** %9, align 8
  br label %105

; <label>:105:                                    ; preds = %132, %103
  %106 = load %struct.ptree*, %struct.ptree** %8, align 8
  %107 = getelementptr inbounds %struct.ptree, %struct.ptree* %106, i32 0, i32 3
  %108 = load i8, i8* %107, align 1
  %109 = sext i8 %108 to i32
  store i32 %109, i32* %13, align 4
  %110 = load %struct.ptree*, %struct.ptree** %8, align 8
  store %struct.ptree* %110, %struct.ptree** %9, align 8
  %111 = load %struct.ptree*, %struct.ptree** %8, align 8
  %112 = getelementptr inbounds %struct.ptree, %struct.ptree* %111, i32 0, i32 3
  %113 = load i8, i8* %112, align 1
  %114 = sext i8 %113 to i32
  %115 = load %struct.ptree*, %struct.ptree** %6, align 8
  %116 = getelementptr inbounds %struct.ptree, %struct.ptree* %115, i32 0, i32 0
  %117 = load i64, i64* %116, align 8
  %118 = call i64 @bit(i32 %114, i64 %117)
  %119 = icmp ne i64 %118, 0
  br i1 %119, label %120, label %125

; <label>:120:                                    ; preds = %105
  %pgocount8 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 8)
  %121 = add i64 %pgocount8, 1
  store i64 %121, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 8)
  %122 = load %struct.ptree*, %struct.ptree** %8, align 8
  %123 = getelementptr inbounds %struct.ptree, %struct.ptree* %122, i32 0, i32 5
  %124 = load %struct.ptree*, %struct.ptree** %123, align 8
  br label %130

; <label>:125:                                    ; preds = %105
  %pgocount9 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 9)
  %126 = add i64 %pgocount9, 1
  store i64 %126, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 9)
  %127 = load %struct.ptree*, %struct.ptree** %8, align 8
  %128 = getelementptr inbounds %struct.ptree, %struct.ptree* %127, i32 0, i32 4
  %129 = load %struct.ptree*, %struct.ptree** %128, align 8
  br label %130

; <label>:130:                                    ; preds = %125, %120
  %131 = phi %struct.ptree* [ %124, %120 ], [ %129, %125 ]
  store %struct.ptree* %131, %struct.ptree** %8, align 8
  br label %132

; <label>:132:                                    ; preds = %130
  %133 = load i32, i32* %13, align 4
  %134 = load %struct.ptree*, %struct.ptree** %8, align 8
  %135 = getelementptr inbounds %struct.ptree, %struct.ptree* %134, i32 0, i32 3
  %136 = load i8, i8* %135, align 1
  %137 = sext i8 %136 to i32
  %138 = icmp slt i32 %133, %137
  br i1 %138, label %105, label %139

; <label>:139:                                    ; preds = %132
  %140 = load %struct.ptree*, %struct.ptree** %9, align 8
  %141 = getelementptr inbounds %struct.ptree, %struct.ptree* %140, i32 0, i32 3
  %142 = load i8, i8* %141, align 1
  %143 = sext i8 %142 to i32
  %144 = load %struct.ptree*, %struct.ptree** %6, align 8
  %145 = getelementptr inbounds %struct.ptree, %struct.ptree* %144, i32 0, i32 0
  %146 = load i64, i64* %145, align 8
  %147 = call i64 @bit(i32 %143, i64 %146)
  %148 = icmp ne i64 %147, 0
  br i1 %148, label %149, label %153

; <label>:149:                                    ; preds = %139
  %150 = load %struct.ptree*, %struct.ptree** %10, align 8
  %151 = load %struct.ptree*, %struct.ptree** %9, align 8
  %152 = getelementptr inbounds %struct.ptree, %struct.ptree* %151, i32 0, i32 5
  store %struct.ptree* %150, %struct.ptree** %152, align 8
  br label %158

; <label>:153:                                    ; preds = %139
  %pgocount10 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 18)
  %154 = add i64 %pgocount10, 1
  store i64 %154, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 18)
  %155 = load %struct.ptree*, %struct.ptree** %10, align 8
  %156 = load %struct.ptree*, %struct.ptree** %9, align 8
  %157 = getelementptr inbounds %struct.ptree, %struct.ptree* %156, i32 0, i32 4
  store %struct.ptree* %155, %struct.ptree** %157, align 8
  br label %158

; <label>:158:                                    ; preds = %153, %149
  %159 = load %struct.ptree*, %struct.ptree** %7, align 8
  %160 = getelementptr inbounds %struct.ptree, %struct.ptree* %159, i32 0, i32 3
  %161 = load i8, i8* %160, align 1
  %162 = sext i8 %161 to i32
  %163 = load %struct.ptree*, %struct.ptree** %4, align 8
  %164 = getelementptr inbounds %struct.ptree, %struct.ptree* %163, i32 0, i32 0
  %165 = load i64, i64* %164, align 8
  %166 = call i64 @bit(i32 %162, i64 %165)
  %167 = icmp ne i64 %166, 0
  br i1 %167, label %168, label %192

; <label>:168:                                    ; preds = %158
  %169 = load %struct.ptree*, %struct.ptree** %6, align 8
  %170 = getelementptr inbounds %struct.ptree, %struct.ptree* %169, i32 0, i32 3
  %171 = load i8, i8* %170, align 1
  %172 = sext i8 %171 to i32
  %173 = load %struct.ptree*, %struct.ptree** %4, align 8
  %174 = getelementptr inbounds %struct.ptree, %struct.ptree* %173, i32 0, i32 0
  %175 = load i64, i64* %174, align 8
  %176 = call i64 @bit(i32 %172, i64 %175)
  %177 = icmp ne i64 %176, 0
  br i1 %177, label %178, label %183

; <label>:178:                                    ; preds = %168
  %pgocount11 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 19)
  %179 = add i64 %pgocount11, 1
  store i64 %179, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 19)
  %180 = load %struct.ptree*, %struct.ptree** %6, align 8
  %181 = getelementptr inbounds %struct.ptree, %struct.ptree* %180, i32 0, i32 4
  %182 = load %struct.ptree*, %struct.ptree** %181, align 8
  br label %188

; <label>:183:                                    ; preds = %168
  %pgocount12 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 20)
  %184 = add i64 %pgocount12, 1
  store i64 %184, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 20)
  %185 = load %struct.ptree*, %struct.ptree** %6, align 8
  %186 = getelementptr inbounds %struct.ptree, %struct.ptree* %185, i32 0, i32 5
  %187 = load %struct.ptree*, %struct.ptree** %186, align 8
  br label %188

; <label>:188:                                    ; preds = %183, %178
  %189 = phi %struct.ptree* [ %182, %178 ], [ %187, %183 ]
  %190 = load %struct.ptree*, %struct.ptree** %7, align 8
  %191 = getelementptr inbounds %struct.ptree, %struct.ptree* %190, i32 0, i32 5
  store %struct.ptree* %189, %struct.ptree** %191, align 8
  br label %216

; <label>:192:                                    ; preds = %158
  %193 = load %struct.ptree*, %struct.ptree** %6, align 8
  %194 = getelementptr inbounds %struct.ptree, %struct.ptree* %193, i32 0, i32 3
  %195 = load i8, i8* %194, align 1
  %196 = sext i8 %195 to i32
  %197 = load %struct.ptree*, %struct.ptree** %4, align 8
  %198 = getelementptr inbounds %struct.ptree, %struct.ptree* %197, i32 0, i32 0
  %199 = load i64, i64* %198, align 8
  %200 = call i64 @bit(i32 %196, i64 %199)
  %201 = icmp ne i64 %200, 0
  br i1 %201, label %202, label %207

; <label>:202:                                    ; preds = %192
  %pgocount13 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 21)
  %203 = add i64 %pgocount13, 1
  store i64 %203, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 21)
  %204 = load %struct.ptree*, %struct.ptree** %6, align 8
  %205 = getelementptr inbounds %struct.ptree, %struct.ptree* %204, i32 0, i32 4
  %206 = load %struct.ptree*, %struct.ptree** %205, align 8
  br label %212

; <label>:207:                                    ; preds = %192
  %pgocount14 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 22)
  %208 = add i64 %pgocount14, 1
  store i64 %208, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 22)
  %209 = load %struct.ptree*, %struct.ptree** %6, align 8
  %210 = getelementptr inbounds %struct.ptree, %struct.ptree* %209, i32 0, i32 5
  %211 = load %struct.ptree*, %struct.ptree** %210, align 8
  br label %212

; <label>:212:                                    ; preds = %207, %202
  %213 = phi %struct.ptree* [ %206, %202 ], [ %211, %207 ]
  %214 = load %struct.ptree*, %struct.ptree** %7, align 8
  %215 = getelementptr inbounds %struct.ptree, %struct.ptree* %214, i32 0, i32 4
  store %struct.ptree* %213, %struct.ptree** %215, align 8
  br label %216

; <label>:216:                                    ; preds = %212, %188
  %217 = load %struct.ptree*, %struct.ptree** %10, align 8
  %218 = getelementptr inbounds %struct.ptree, %struct.ptree* %217, i32 0, i32 1
  %219 = load %struct.ptree_mask*, %struct.ptree_mask** %218, align 8
  %220 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %219, i32 0, i32 1
  %221 = load i8*, i8** %220, align 8
  %222 = icmp ne i8* %221, null
  br i1 %222, label %223, label %230

; <label>:223:                                    ; preds = %216
  %pgocount15 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 16)
  %224 = add i64 %pgocount15, 1
  store i64 %224, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 16)
  %225 = load %struct.ptree*, %struct.ptree** %10, align 8
  %226 = getelementptr inbounds %struct.ptree, %struct.ptree* %225, i32 0, i32 1
  %227 = load %struct.ptree_mask*, %struct.ptree_mask** %226, align 8
  %228 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %227, i32 0, i32 1
  %229 = load i8*, i8** %228, align 8
  call void @free(i8* %229) #4
  br label %230

; <label>:230:                                    ; preds = %223, %216
  %231 = load %struct.ptree*, %struct.ptree** %10, align 8
  %232 = getelementptr inbounds %struct.ptree, %struct.ptree* %231, i32 0, i32 1
  %233 = load %struct.ptree_mask*, %struct.ptree_mask** %232, align 8
  %234 = bitcast %struct.ptree_mask* %233 to i8*
  call void @free(i8* %234) #4
  %235 = load %struct.ptree*, %struct.ptree** %10, align 8
  %236 = load %struct.ptree*, %struct.ptree** %6, align 8
  %237 = icmp ne %struct.ptree* %235, %236
  br i1 %237, label %238, label %255

; <label>:238:                                    ; preds = %230
  %pgocount16 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 17)
  %239 = add i64 %pgocount16, 1
  store i64 %239, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 17)
  %240 = load %struct.ptree*, %struct.ptree** %6, align 8
  %241 = getelementptr inbounds %struct.ptree, %struct.ptree* %240, i32 0, i32 0
  %242 = load i64, i64* %241, align 8
  %243 = load %struct.ptree*, %struct.ptree** %10, align 8
  %244 = getelementptr inbounds %struct.ptree, %struct.ptree* %243, i32 0, i32 0
  store i64 %242, i64* %244, align 8
  %245 = load %struct.ptree*, %struct.ptree** %6, align 8
  %246 = getelementptr inbounds %struct.ptree, %struct.ptree* %245, i32 0, i32 1
  %247 = load %struct.ptree_mask*, %struct.ptree_mask** %246, align 8
  %248 = load %struct.ptree*, %struct.ptree** %10, align 8
  %249 = getelementptr inbounds %struct.ptree, %struct.ptree* %248, i32 0, i32 1
  store %struct.ptree_mask* %247, %struct.ptree_mask** %249, align 8
  %250 = load %struct.ptree*, %struct.ptree** %6, align 8
  %251 = getelementptr inbounds %struct.ptree, %struct.ptree* %250, i32 0, i32 2
  %252 = load i8, i8* %251, align 8
  %253 = load %struct.ptree*, %struct.ptree** %10, align 8
  %254 = getelementptr inbounds %struct.ptree, %struct.ptree* %253, i32 0, i32 2
  store i8 %252, i8* %254, align 8
  br label %255

; <label>:255:                                    ; preds = %238, %230
  %256 = load %struct.ptree*, %struct.ptree** %6, align 8
  %257 = bitcast %struct.ptree* %256 to i8*
  call void @free(i8* %257) #4
  store i32 1, i32* %3, align 4
  br label %360

; <label>:258:                                    ; preds = %75
  store i32 0, i32* %13, align 4
  br label %259

; <label>:259:                                    ; preds = %284, %258
  %260 = load i32, i32* %13, align 4
  %261 = load %struct.ptree*, %struct.ptree** %10, align 8
  %262 = getelementptr inbounds %struct.ptree, %struct.ptree* %261, i32 0, i32 2
  %263 = load i8, i8* %262, align 8
  %264 = zext i8 %263 to i32
  %265 = icmp slt i32 %260, %264
  br i1 %265, label %266, label %288

; <label>:266:                                    ; preds = %259
  %267 = load %struct.ptree*, %struct.ptree** %4, align 8
  %268 = getelementptr inbounds %struct.ptree, %struct.ptree* %267, i32 0, i32 1
  %269 = load %struct.ptree_mask*, %struct.ptree_mask** %268, align 8
  %270 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %269, i32 0, i32 0
  %271 = load i64, i64* %270, align 8
  %272 = load %struct.ptree*, %struct.ptree** %10, align 8
  %273 = getelementptr inbounds %struct.ptree, %struct.ptree* %272, i32 0, i32 1
  %274 = load %struct.ptree_mask*, %struct.ptree_mask** %273, align 8
  %275 = load i32, i32* %13, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %274, i64 %276
  %278 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %277, i32 0, i32 0
  %279 = load i64, i64* %278, align 8
  %280 = icmp eq i64 %271, %279
  br i1 %280, label %281, label %283

; <label>:281:                                    ; preds = %266
  %pgocount17 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 13)
  %282 = add i64 %pgocount17, 1
  store i64 %282, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 13)
  br label %288

; <label>:283:                                    ; preds = %266
  br label %284

; <label>:284:                                    ; preds = %283
  %pgocount18 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 3)
  %285 = add i64 %pgocount18, 1
  store i64 %285, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 3)
  %286 = load i32, i32* %13, align 4
  %287 = add nsw i32 %286, 1
  store i32 %287, i32* %13, align 4
  br label %259

; <label>:288:                                    ; preds = %281, %259
  %289 = load i32, i32* %13, align 4
  %290 = load %struct.ptree*, %struct.ptree** %10, align 8
  %291 = getelementptr inbounds %struct.ptree, %struct.ptree* %290, i32 0, i32 2
  %292 = load i8, i8* %291, align 8
  %293 = zext i8 %292 to i32
  %294 = icmp sge i32 %289, %293
  br i1 %294, label %295, label %297

; <label>:295:                                    ; preds = %288
  %pgocount19 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 11)
  %296 = add i64 %pgocount19, 1
  store i64 %296, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 11)
  store i32 0, i32* %3, align 4
  br label %360

; <label>:297:                                    ; preds = %288
  %298 = load %struct.ptree*, %struct.ptree** %10, align 8
  %299 = getelementptr inbounds %struct.ptree, %struct.ptree* %298, i32 0, i32 2
  %300 = load i8, i8* %299, align 8
  %301 = zext i8 %300 to i32
  %302 = sub nsw i32 %301, 1
  %303 = sext i32 %302 to i64
  %304 = mul i64 16, %303
  %305 = call noalias i8* @malloc(i64 %304) #4
  %306 = bitcast i8* %305 to %struct.ptree_mask*
  store %struct.ptree_mask* %306, %struct.ptree_mask** %11, align 8
  store i32 0, i32* %13, align 4
  %307 = load %struct.ptree_mask*, %struct.ptree_mask** %11, align 8
  store %struct.ptree_mask* %307, %struct.ptree_mask** %12, align 8
  br label %308

; <label>:308:                                    ; preds = %343, %297
  %309 = load i32, i32* %13, align 4
  %310 = load %struct.ptree*, %struct.ptree** %10, align 8
  %311 = getelementptr inbounds %struct.ptree, %struct.ptree* %310, i32 0, i32 2
  %312 = load i8, i8* %311, align 8
  %313 = zext i8 %312 to i32
  %314 = icmp slt i32 %309, %313
  br i1 %314, label %315, label %347

; <label>:315:                                    ; preds = %308
  %316 = load %struct.ptree*, %struct.ptree** %4, align 8
  %317 = getelementptr inbounds %struct.ptree, %struct.ptree* %316, i32 0, i32 1
  %318 = load %struct.ptree_mask*, %struct.ptree_mask** %317, align 8
  %319 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %318, i32 0, i32 0
  %320 = load i64, i64* %319, align 8
  %321 = load %struct.ptree*, %struct.ptree** %10, align 8
  %322 = getelementptr inbounds %struct.ptree, %struct.ptree* %321, i32 0, i32 1
  %323 = load %struct.ptree_mask*, %struct.ptree_mask** %322, align 8
  %324 = load i32, i32* %13, align 4
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %323, i64 %325
  %327 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %326, i32 0, i32 0
  %328 = load i64, i64* %327, align 8
  %329 = icmp ne i64 %320, %328
  br i1 %329, label %330, label %342

; <label>:330:                                    ; preds = %315
  %pgocount20 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 6)
  %331 = add i64 %pgocount20, 1
  store i64 %331, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 6)
  %332 = load %struct.ptree_mask*, %struct.ptree_mask** %12, align 8
  %333 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %332, i32 1
  store %struct.ptree_mask* %333, %struct.ptree_mask** %12, align 8
  %334 = bitcast %struct.ptree_mask* %332 to i8*
  %335 = load %struct.ptree*, %struct.ptree** %10, align 8
  %336 = getelementptr inbounds %struct.ptree, %struct.ptree* %335, i32 0, i32 1
  %337 = load %struct.ptree_mask*, %struct.ptree_mask** %336, align 8
  %338 = load i32, i32* %13, align 4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %337, i64 %339
  %341 = bitcast %struct.ptree_mask* %340 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %334, i8* %341, i64 16, i32 8, i1 false)
  br label %342

; <label>:342:                                    ; preds = %330, %315
  br label %343

; <label>:343:                                    ; preds = %342
  %pgocount21 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 2)
  %344 = add i64 %pgocount21, 1
  store i64 %344, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 2)
  %345 = load i32, i32* %13, align 4
  %346 = add nsw i32 %345, 1
  store i32 %346, i32* %13, align 4
  br label %308

; <label>:347:                                    ; preds = %308
  %pgocount22 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 12)
  %348 = add i64 %pgocount22, 1
  store i64 %348, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_pat_remove, i64 0, i64 12)
  %349 = load %struct.ptree*, %struct.ptree** %10, align 8
  %350 = getelementptr inbounds %struct.ptree, %struct.ptree* %349, i32 0, i32 2
  %351 = load i8, i8* %350, align 8
  %352 = add i8 %351, -1
  store i8 %352, i8* %350, align 8
  %353 = load %struct.ptree*, %struct.ptree** %10, align 8
  %354 = getelementptr inbounds %struct.ptree, %struct.ptree* %353, i32 0, i32 1
  %355 = load %struct.ptree_mask*, %struct.ptree_mask** %354, align 8
  %356 = bitcast %struct.ptree_mask* %355 to i8*
  call void @free(i8* %356) #4
  %357 = load %struct.ptree_mask*, %struct.ptree_mask** %11, align 8
  %358 = load %struct.ptree*, %struct.ptree** %10, align 8
  %359 = getelementptr inbounds %struct.ptree, %struct.ptree* %358, i32 0, i32 1
  store %struct.ptree_mask* %357, %struct.ptree_mask** %359, align 8
  store i32 1, i32* %3, align 4
  br label %360

; <label>:360:                                    ; preds = %347, %295, %255, %101, %87, %73, %26
  %361 = load i32, i32* %3, align 4
  ret i32 %361
}

; Function Attrs: nounwind uwtable
define %struct.ptree* @pat_search(i64, %struct.ptree*) #0 {
  %3 = alloca %struct.ptree*, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.ptree*, align 8
  %6 = alloca %struct.ptree*, align 8
  %7 = alloca %struct.ptree*, align 8
  %8 = alloca i32, align 4
  store i64 %0, i64* %4, align 8
  store %struct.ptree* %1, %struct.ptree** %5, align 8
  store %struct.ptree* null, %struct.ptree** %6, align 8
  %9 = load %struct.ptree*, %struct.ptree** %5, align 8
  store %struct.ptree* %9, %struct.ptree** %7, align 8
  %10 = load %struct.ptree*, %struct.ptree** %7, align 8
  %11 = icmp ne %struct.ptree* %10, null
  br i1 %11, label %14, label %12

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 3)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 3)
  store %struct.ptree* null, %struct.ptree** %3, align 8
  br label %81

; <label>:14:                                     ; preds = %2
  br label %15

; <label>:15:                                     ; preds = %54, %14
  %16 = load %struct.ptree*, %struct.ptree** %7, align 8
  %17 = getelementptr inbounds %struct.ptree, %struct.ptree* %16, i32 0, i32 0
  %18 = load i64, i64* %17, align 8
  %19 = load i64, i64* %4, align 8
  %20 = load %struct.ptree*, %struct.ptree** %7, align 8
  %21 = getelementptr inbounds %struct.ptree, %struct.ptree* %20, i32 0, i32 1
  %22 = load %struct.ptree_mask*, %struct.ptree_mask** %21, align 8
  %23 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %22, i32 0, i32 0
  %24 = load i64, i64* %23, align 8
  %25 = and i64 %19, %24
  %26 = icmp eq i64 %18, %25
  br i1 %26, label %27, label %30

; <label>:27:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 1)
  %29 = load %struct.ptree*, %struct.ptree** %7, align 8
  store %struct.ptree* %29, %struct.ptree** %6, align 8
  br label %30

; <label>:30:                                     ; preds = %27, %15
  %31 = load %struct.ptree*, %struct.ptree** %7, align 8
  %32 = getelementptr inbounds %struct.ptree, %struct.ptree* %31, i32 0, i32 3
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  store i32 %34, i32* %8, align 4
  %35 = load %struct.ptree*, %struct.ptree** %7, align 8
  %36 = getelementptr inbounds %struct.ptree, %struct.ptree* %35, i32 0, i32 3
  %37 = load i8, i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = load i64, i64* %4, align 8
  %40 = call i64 @bit(i32 %38, i64 %39)
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %47

; <label>:42:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 0)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 0)
  %44 = load %struct.ptree*, %struct.ptree** %7, align 8
  %45 = getelementptr inbounds %struct.ptree, %struct.ptree* %44, i32 0, i32 5
  %46 = load %struct.ptree*, %struct.ptree** %45, align 8
  br label %52

; <label>:47:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 2)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 2)
  %49 = load %struct.ptree*, %struct.ptree** %7, align 8
  %50 = getelementptr inbounds %struct.ptree, %struct.ptree* %49, i32 0, i32 4
  %51 = load %struct.ptree*, %struct.ptree** %50, align 8
  br label %52

; <label>:52:                                     ; preds = %47, %42
  %53 = phi %struct.ptree* [ %46, %42 ], [ %51, %47 ]
  store %struct.ptree* %53, %struct.ptree** %7, align 8
  br label %54

; <label>:54:                                     ; preds = %52
  %55 = load i32, i32* %8, align 4
  %56 = load %struct.ptree*, %struct.ptree** %7, align 8
  %57 = getelementptr inbounds %struct.ptree, %struct.ptree* %56, i32 0, i32 3
  %58 = load i8, i8* %57, align 1
  %59 = sext i8 %58 to i32
  %60 = icmp slt i32 %55, %59
  br i1 %60, label %15, label %61

; <label>:61:                                     ; preds = %54
  %62 = load %struct.ptree*, %struct.ptree** %7, align 8
  %63 = getelementptr inbounds %struct.ptree, %struct.ptree* %62, i32 0, i32 0
  %64 = load i64, i64* %63, align 8
  %65 = load i64, i64* %4, align 8
  %66 = load %struct.ptree*, %struct.ptree** %7, align 8
  %67 = getelementptr inbounds %struct.ptree, %struct.ptree* %66, i32 0, i32 1
  %68 = load %struct.ptree_mask*, %struct.ptree_mask** %67, align 8
  %69 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %68, i32 0, i32 0
  %70 = load i64, i64* %69, align 8
  %71 = and i64 %65, %70
  %72 = icmp eq i64 %64, %71
  br i1 %72, label %73, label %76

; <label>:73:                                     ; preds = %61
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 4)
  %74 = add i64 %pgocount4, 1
  store i64 %74, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 4)
  %75 = load %struct.ptree*, %struct.ptree** %7, align 8
  br label %79

; <label>:76:                                     ; preds = %61
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 5)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_pat_search, i64 0, i64 5)
  %78 = load %struct.ptree*, %struct.ptree** %6, align 8
  br label %79

; <label>:79:                                     ; preds = %76, %73
  %80 = phi %struct.ptree* [ %75, %73 ], [ %78, %76 ]
  store %struct.ptree* %80, %struct.ptree** %3, align 8
  br label %81

; <label>:81:                                     ; preds = %79, %12
  %82 = load %struct.ptree*, %struct.ptree** %3, align 8
  ret %struct.ptree* %82
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
