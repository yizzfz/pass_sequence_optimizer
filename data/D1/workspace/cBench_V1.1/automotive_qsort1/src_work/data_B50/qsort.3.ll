; ModuleID = 'qsort.2.ll'
source_filename = "qsort.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_qsortx = private constant [6 x i8] c"qsortx"
@__profn_tmp1.ll_shortsort = private constant [17 x i8] c"tmp1.ll:shortsort"
@__profn_tmp1.ll_swap = private constant [12 x i8] c"tmp1.ll:swap"
@__profc_qsortx = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_qsortx = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_qsortx = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2102242203742164849, i64 563170584707159, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i32 0, i32 0), i8* bitcast (void (i8*, i32, i32, i32 (i8*, i8*)*)* @qsortx to i8*), i8* bitcast ([2 x i64]* @__profvp_qsortx to i8*), i32 15, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_shortsort = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_shortsort = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_shortsort = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4040759177084001002, i64 281538455341023, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_shortsort, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_shortsort to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_swap = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_swap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9005468187404322608, i64 40425548223, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_swap, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [39 x i8] c"%\00qsortx\01tmp1.ll:shortsort\01tmp1.ll:swap", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_qsortx to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_shortsort to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_swap to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @qsortx(i8*, i32, i32, i32 (i8*, i8*)*) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32 (i8*, i8*)*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  %15 = alloca [30 x i8*], align 16
  %16 = alloca [30 x i8*], align 16
  %17 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 (i8*, i8*)* %3, i32 (i8*, i8*)** %8, align 8
  %18 = load i32, i32* %6, align 4
  %19 = icmp ult i32 %18, 2
  br i1 %19, label %24, label %20

; <label>:20:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 13)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 13)
  %22 = load i32, i32* %7, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %20, %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 12)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 12)
  br label %220

; <label>:26:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 14)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 14)
  store i32 0, i32* %17, align 4
  %28 = load i8*, i8** %5, align 8
  store i8* %28, i8** %9, align 8
  %29 = load i8*, i8** %5, align 8
  %30 = load i32, i32* %7, align 4
  %31 = load i32, i32* %6, align 4
  %32 = sub i32 %31, 1
  %33 = mul i32 %30, %32
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8* %29, i64 %34
  store i8* %35, i8** %10, align 8
  br label %36

; <label>:36:                                     ; preds = %210, %195, %167, %26
  %37 = load i8*, i8** %10, align 8
  %38 = load i8*, i8** %9, align 8
  %39 = ptrtoint i8* %37 to i64
  %40 = ptrtoint i8* %38 to i64
  %41 = sub i64 %39, %40
  %42 = load i32, i32* %7, align 4
  %43 = zext i32 %42 to i64
  %44 = sdiv i64 %41, %43
  %45 = add nsw i64 %44, 1
  %46 = trunc i64 %45 to i32
  store i32 %46, i32* %14, align 4
  %47 = load i32, i32* %14, align 4
  %48 = icmp ule i32 %47, 8
  br i1 %48, label %49, label %55

; <label>:49:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 5)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 5)
  %51 = load i8*, i8** %9, align 8
  %52 = load i8*, i8** %10, align 8
  %53 = load i32, i32* %7, align 4
  %54 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %8, align 8
  call void @shortsort(i8* %51, i8* %52, i32 %53, i32 (i8*, i8*)* %54)
  br label %205

; <label>:55:                                     ; preds = %36
  %56 = load i8*, i8** %9, align 8
  %57 = load i32, i32* %14, align 4
  %58 = udiv i32 %57, 2
  %59 = load i32, i32* %7, align 4
  %60 = mul i32 %58, %59
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8* %56, i64 %61
  store i8* %62, i8** %11, align 8
  %63 = load i8*, i8** %11, align 8
  %64 = load i8*, i8** %9, align 8
  %65 = load i32, i32* %7, align 4
  call void @swap(i8* %63, i8* %64, i32 %65)
  %66 = load i8*, i8** %9, align 8
  store i8* %66, i8** %12, align 8
  %67 = load i8*, i8** %10, align 8
  %68 = load i32, i32* %7, align 4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8* %67, i64 %69
  store i8* %70, i8** %13, align 8
  br label %71

; <label>:71:                                     ; preds = %119, %55
  br label %72

; <label>:72:                                     ; preds = %90, %71
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 0)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 0)
  %74 = load i32, i32* %7, align 4
  %75 = load i8*, i8** %12, align 8
  %76 = zext i32 %74 to i64
  %77 = getelementptr inbounds i8, i8* %75, i64 %76
  store i8* %77, i8** %12, align 8
  br label %78

; <label>:78:                                     ; preds = %72
  %79 = load i8*, i8** %12, align 8
  %80 = load i8*, i8** %10, align 8
  %81 = icmp ule i8* %79, %80
  br i1 %81, label %82, label %90

; <label>:82:                                     ; preds = %78
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 2)
  %83 = add i64 %pgocount5, 1
  store i64 %83, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 2)
  %84 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %8, align 8
  %85 = load i8*, i8** %12, align 8
  %86 = load i8*, i8** %9, align 8
  %87 = ptrtoint i32 (i8*, i8*)* %84 to i64
  call void @__llvm_profile_instrument_target(i64 %87, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_qsortx to i8*), i32 0)
  %88 = call i32 %84(i8* %85, i8* %86)
  %89 = icmp sle i32 %88, 0
  br label %90

; <label>:90:                                     ; preds = %82, %78
  %91 = phi i1 [ false, %78 ], [ %89, %82 ]
  br i1 %91, label %72, label %92

; <label>:92:                                     ; preds = %90
  br label %93

; <label>:93:                                     ; preds = %112, %92
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 1)
  %94 = add i64 %pgocount6, 1
  store i64 %94, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 1)
  %95 = load i32, i32* %7, align 4
  %96 = load i8*, i8** %13, align 8
  %97 = zext i32 %95 to i64
  %98 = sub i64 0, %97
  %99 = getelementptr inbounds i8, i8* %96, i64 %98
  store i8* %99, i8** %13, align 8
  br label %100

; <label>:100:                                    ; preds = %93
  %101 = load i8*, i8** %13, align 8
  %102 = load i8*, i8** %9, align 8
  %103 = icmp ugt i8* %101, %102
  br i1 %103, label %104, label %112

; <label>:104:                                    ; preds = %100
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 3)
  %105 = add i64 %pgocount7, 1
  store i64 %105, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 3)
  %106 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %8, align 8
  %107 = load i8*, i8** %13, align 8
  %108 = load i8*, i8** %9, align 8
  %109 = ptrtoint i32 (i8*, i8*)* %106 to i64
  call void @__llvm_profile_instrument_target(i64 %109, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_qsortx to i8*), i32 1)
  %110 = call i32 %106(i8* %107, i8* %108)
  %111 = icmp sge i32 %110, 0
  br label %112

; <label>:112:                                    ; preds = %104, %100
  %113 = phi i1 [ false, %100 ], [ %111, %104 ]
  br i1 %113, label %93, label %114

; <label>:114:                                    ; preds = %112
  %115 = load i8*, i8** %13, align 8
  %116 = load i8*, i8** %12, align 8
  %117 = icmp ult i8* %115, %116
  br i1 %117, label %118, label %119

; <label>:118:                                    ; preds = %114
  br label %124

; <label>:119:                                    ; preds = %114
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 4)
  %120 = add i64 %pgocount8, 1
  store i64 %120, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 4)
  %121 = load i8*, i8** %12, align 8
  %122 = load i8*, i8** %13, align 8
  %123 = load i32, i32* %7, align 4
  call void @swap(i8* %121, i8* %122, i32 %123)
  br label %71

; <label>:124:                                    ; preds = %118
  %125 = load i8*, i8** %9, align 8
  %126 = load i8*, i8** %13, align 8
  %127 = load i32, i32* %7, align 4
  call void @swap(i8* %125, i8* %126, i32 %127)
  %128 = load i8*, i8** %13, align 8
  %129 = getelementptr inbounds i8, i8* %128, i64 -1
  %130 = load i8*, i8** %9, align 8
  %131 = ptrtoint i8* %129 to i64
  %132 = ptrtoint i8* %130 to i64
  %133 = sub i64 %131, %132
  %134 = load i8*, i8** %10, align 8
  %135 = load i8*, i8** %12, align 8
  %136 = ptrtoint i8* %134 to i64
  %137 = ptrtoint i8* %135 to i64
  %138 = sub i64 %136, %137
  %139 = icmp sge i64 %133, %138
  br i1 %139, label %140, label %172

; <label>:140:                                    ; preds = %124
  %141 = load i8*, i8** %9, align 8
  %142 = load i32, i32* %7, align 4
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds i8, i8* %141, i64 %143
  %145 = load i8*, i8** %13, align 8
  %146 = icmp ult i8* %144, %145
  br i1 %146, label %147, label %163

; <label>:147:                                    ; preds = %140
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 6)
  %148 = add i64 %pgocount9, 1
  store i64 %148, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 6)
  %149 = load i8*, i8** %9, align 8
  %150 = load i32, i32* %17, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [30 x i8*], [30 x i8*]* %15, i64 0, i64 %151
  store i8* %149, i8** %152, align 8
  %153 = load i8*, i8** %13, align 8
  %154 = load i32, i32* %7, align 4
  %155 = zext i32 %154 to i64
  %156 = sub i64 0, %155
  %157 = getelementptr inbounds i8, i8* %153, i64 %156
  %158 = load i32, i32* %17, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [30 x i8*], [30 x i8*]* %16, i64 0, i64 %159
  store i8* %157, i8** %160, align 8
  %161 = load i32, i32* %17, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %17, align 4
  br label %163

; <label>:163:                                    ; preds = %147, %140
  %164 = load i8*, i8** %12, align 8
  %165 = load i8*, i8** %10, align 8
  %166 = icmp ult i8* %164, %165
  br i1 %166, label %167, label %170

; <label>:167:                                    ; preds = %163
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 7)
  %168 = add i64 %pgocount10, 1
  store i64 %168, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 7)
  %169 = load i8*, i8** %12, align 8
  store i8* %169, i8** %9, align 8
  br label %36

; <label>:170:                                    ; preds = %163
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 8)
  %171 = add i64 %pgocount11, 1
  store i64 %171, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 8)
  br label %204

; <label>:172:                                    ; preds = %124
  %173 = load i8*, i8** %12, align 8
  %174 = load i8*, i8** %10, align 8
  %175 = icmp ult i8* %173, %174
  br i1 %175, label %176, label %188

; <label>:176:                                    ; preds = %172
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 9)
  %177 = add i64 %pgocount12, 1
  store i64 %177, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 9)
  %178 = load i8*, i8** %12, align 8
  %179 = load i32, i32* %17, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [30 x i8*], [30 x i8*]* %15, i64 0, i64 %180
  store i8* %178, i8** %181, align 8
  %182 = load i8*, i8** %10, align 8
  %183 = load i32, i32* %17, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [30 x i8*], [30 x i8*]* %16, i64 0, i64 %184
  store i8* %182, i8** %185, align 8
  %186 = load i32, i32* %17, align 4
  %187 = add nsw i32 %186, 1
  store i32 %187, i32* %17, align 4
  br label %188

; <label>:188:                                    ; preds = %176, %172
  %189 = load i8*, i8** %9, align 8
  %190 = load i32, i32* %7, align 4
  %191 = zext i32 %190 to i64
  %192 = getelementptr inbounds i8, i8* %189, i64 %191
  %193 = load i8*, i8** %13, align 8
  %194 = icmp ult i8* %192, %193
  br i1 %194, label %195, label %202

; <label>:195:                                    ; preds = %188
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 10)
  %196 = add i64 %pgocount13, 1
  store i64 %196, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 10)
  %197 = load i8*, i8** %13, align 8
  %198 = load i32, i32* %7, align 4
  %199 = zext i32 %198 to i64
  %200 = sub i64 0, %199
  %201 = getelementptr inbounds i8, i8* %197, i64 %200
  store i8* %201, i8** %10, align 8
  br label %36

; <label>:202:                                    ; preds = %188
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 11)
  %203 = add i64 %pgocount14, 1
  store i64 %203, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_qsortx, i64 0, i64 11)
  br label %204

; <label>:204:                                    ; preds = %202, %170
  br label %205

; <label>:205:                                    ; preds = %204, %49
  %206 = load i32, i32* %17, align 4
  %207 = add nsw i32 %206, -1
  store i32 %207, i32* %17, align 4
  %208 = load i32, i32* %17, align 4
  %209 = icmp sge i32 %208, 0
  br i1 %209, label %210, label %219

; <label>:210:                                    ; preds = %205
  %211 = load i32, i32* %17, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [30 x i8*], [30 x i8*]* %15, i64 0, i64 %212
  %214 = load i8*, i8** %213, align 8
  store i8* %214, i8** %9, align 8
  %215 = load i32, i32* %17, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [30 x i8*], [30 x i8*]* %16, i64 0, i64 %216
  %218 = load i8*, i8** %217, align 8
  store i8* %218, i8** %10, align 8
  br label %36

; <label>:219:                                    ; preds = %205
  br label %220

; <label>:220:                                    ; preds = %219, %24
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @shortsort(i8*, i8*, i32, i32 (i8*, i8*)*) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32 (i8*, i8*)*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 (i8*, i8*)* %3, i32 (i8*, i8*)** %8, align 8
  br label %11

; <label>:11:                                     ; preds = %42, %4
  %12 = load i8*, i8** %6, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = icmp ugt i8* %12, %13
  br i1 %14, label %15, label %52

; <label>:15:                                     ; preds = %11
  %16 = load i8*, i8** %5, align 8
  store i8* %16, i8** %10, align 8
  %17 = load i8*, i8** %5, align 8
  %18 = load i32, i32* %7, align 4
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8* %17, i64 %19
  store i8* %20, i8** %9, align 8
  br label %21

; <label>:21:                                     ; preds = %36, %15
  %22 = load i8*, i8** %9, align 8
  %23 = load i8*, i8** %6, align 8
  %24 = icmp ule i8* %22, %23
  br i1 %24, label %25, label %42

; <label>:25:                                     ; preds = %21
  %26 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %8, align 8
  %27 = load i8*, i8** %9, align 8
  %28 = load i8*, i8** %10, align 8
  %29 = ptrtoint i32 (i8*, i8*)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_shortsort to i8*), i32 0)
  %30 = call i32 %26(i8* %27, i8* %28)
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %35

; <label>:32:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_shortsort, i64 0, i64 1)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_shortsort, i64 0, i64 1)
  %34 = load i8*, i8** %9, align 8
  store i8* %34, i8** %10, align 8
  br label %35

; <label>:35:                                     ; preds = %32, %25
  br label %36

; <label>:36:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_shortsort, i64 0, i64 0)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_shortsort, i64 0, i64 0)
  %38 = load i32, i32* %7, align 4
  %39 = load i8*, i8** %9, align 8
  %40 = zext i32 %38 to i64
  %41 = getelementptr inbounds i8, i8* %39, i64 %40
  store i8* %41, i8** %9, align 8
  br label %21

; <label>:42:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_shortsort, i64 0, i64 2)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_shortsort, i64 0, i64 2)
  %44 = load i8*, i8** %10, align 8
  %45 = load i8*, i8** %6, align 8
  %46 = load i32, i32* %7, align 4
  call void @swap(i8* %44, i8* %45, i32 %46)
  %47 = load i32, i32* %7, align 4
  %48 = load i8*, i8** %6, align 8
  %49 = zext i32 %47 to i64
  %50 = sub i64 0, %49
  %51 = getelementptr inbounds i8, i8* %48, i64 %50
  store i8* %51, i8** %6, align 8
  br label %11

; <label>:52:                                     ; preds = %11
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_shortsort, i64 0, i64 3)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_shortsort, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @swap(i8*, i8*, i32) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %8 = load i8*, i8** %4, align 8
  %9 = load i8*, i8** %5, align 8
  %10 = icmp ne i8* %8, %9
  br i1 %10, label %11, label %29

; <label>:11:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_swap, i64 0, i64 2)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_swap, i64 0, i64 2)
  br label %13

; <label>:13:                                     ; preds = %17, %11
  %14 = load i32, i32* %6, align 4
  %15 = add i32 %14, -1
  store i32 %15, i32* %6, align 4
  %16 = icmp ne i32 %14, 0
  br i1 %16, label %17, label %28

; <label>:17:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_swap, i64 0, i64 0)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_swap, i64 0, i64 0)
  %19 = load i8*, i8** %4, align 8
  %20 = load i8, i8* %19, align 1
  store i8 %20, i8* %7, align 1
  %21 = load i8*, i8** %5, align 8
  %22 = load i8, i8* %21, align 1
  %23 = load i8*, i8** %4, align 8
  %24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %24, i8** %4, align 8
  store i8 %22, i8* %23, align 1
  %25 = load i8, i8* %7, align 1
  %26 = load i8*, i8** %5, align 8
  %27 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %27, i8** %5, align 8
  store i8 %25, i8* %26, align 1
  br label %13

; <label>:28:                                     ; preds = %13
  br label %29

; <label>:29:                                     ; preds = %28, %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_swap, i64 0, i64 1)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_swap, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #1

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
