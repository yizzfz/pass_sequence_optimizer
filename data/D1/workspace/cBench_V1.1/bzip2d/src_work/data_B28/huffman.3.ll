; ModuleID = 'huffman.2.ll'
source_filename = "huffman.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_BZ2_hbMakeCodeLengths = private constant [21 x i8] c"BZ2_hbMakeCodeLengths"
@__profn_BZ2_hbAssignCodes = private constant [17 x i8] c"BZ2_hbAssignCodes"
@__profn_BZ2_hbCreateDecodeTables = private constant [24 x i8] c"BZ2_hbCreateDecodeTables"
@__profc_BZ2_hbMakeCodeLengths = private global [23 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_hbMakeCodeLengths = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1328468256441965610, i64 370727336690, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i32 0, i32 0), i8* bitcast (void (i8*, i32*, i32, i32)* @BZ2_hbMakeCodeLengths to i8*), i8* null, i32 23, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_hbAssignCodes = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_hbAssignCodes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4458963168793919202, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_hbAssignCodes, i32 0, i32 0), i8* bitcast (void (i32*, i8*, i32, i32, i32)* @BZ2_hbAssignCodes to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_hbCreateDecodeTables = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_hbCreateDecodeTables = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8167218726544347764, i64 195160010110, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i32 0, i32 0), i8* bitcast (void (i32*, i32*, i32*, i8*, i32, i32, i32)* @BZ2_hbCreateDecodeTables to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [66 x i8] c"@\00BZ2_hbMakeCodeLengths\01BZ2_hbAssignCodes\01BZ2_hbCreateDecodeTables", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_hbMakeCodeLengths to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_hbAssignCodes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_hbCreateDecodeTables to i8*), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @BZ2_hbMakeCodeLengths(i8*, i32*, i32, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8, align 1
  %17 = alloca [260 x i32], align 16
  %18 = alloca [516 x i32], align 16
  %19 = alloca [516 x i32], align 16
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32 0, i32* %13, align 4
  br label %30

; <label>:30:                                     ; preds = %57, %4
  %31 = load i32, i32* %13, align 4
  %32 = load i32, i32* %7, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %60

; <label>:34:                                     ; preds = %30
  %35 = load i32*, i32** %6, align 8
  %36 = load i32, i32* %13, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32* %35, i64 %37
  %39 = load i32, i32* %38, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %34
  %pgocount = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 21)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 21)
  br label %50

; <label>:43:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 18)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 18)
  %45 = load i32*, i32** %6, align 8
  %46 = load i32, i32* %13, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32* %45, i64 %47
  %49 = load i32, i32* %48, align 4
  br label %50

; <label>:50:                                     ; preds = %43, %41
  %51 = phi i32 [ 1, %41 ], [ %49, %43 ]
  %52 = shl i32 %51, 8
  %53 = load i32, i32* %13, align 4
  %54 = add nsw i32 %53, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %55
  store i32 %52, i32* %56, align 4
  br label %57

; <label>:57:                                     ; preds = %50
  %58 = load i32, i32* %13, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %13, align 4
  br label %30

; <label>:60:                                     ; preds = %30
  br label %61

; <label>:61:                                     ; preds = %450, %60
  %62 = load i32, i32* %7, align 4
  store i32 %62, i32* %9, align 4
  store i32 0, i32* %10, align 4
  %63 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 0
  store i32 0, i32* %63, align 16
  %64 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 0
  store i32 0, i32* %64, align 16
  %65 = getelementptr inbounds [516 x i32], [516 x i32]* %19, i64 0, i64 0
  store i32 -2, i32* %65, align 16
  store i32 1, i32* %13, align 4
  br label %66

; <label>:66:                                     ; preds = %116, %61
  %67 = load i32, i32* %13, align 4
  %68 = load i32, i32* %7, align 4
  %69 = icmp sle i32 %67, %68
  br i1 %69, label %70, label %120

; <label>:70:                                     ; preds = %66
  %71 = load i32, i32* %13, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [516 x i32], [516 x i32]* %19, i64 0, i64 %72
  store i32 -1, i32* %73, align 4
  %74 = load i32, i32* %10, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %10, align 4
  %76 = load i32, i32* %13, align 4
  %77 = load i32, i32* %10, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %78
  store i32 %76, i32* %79, align 4
  %80 = load i32, i32* %10, align 4
  store i32 %80, i32* %20, align 4
  %81 = load i32, i32* %20, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %82
  %84 = load i32, i32* %83, align 4
  store i32 %84, i32* %21, align 4
  br label %85

; <label>:85:                                     ; preds = %99, %70
  %86 = load i32, i32* %21, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %87
  %89 = load i32, i32* %88, align 4
  %90 = load i32, i32* %20, align 4
  %91 = ashr i32 %90, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %92
  %94 = load i32, i32* %93, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %95
  %97 = load i32, i32* %96, align 4
  %98 = icmp slt i32 %89, %97
  br i1 %98, label %99, label %111

; <label>:99:                                     ; preds = %85
  %pgocount2 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 0)
  %100 = add i64 %pgocount2, 1
  store i64 %100, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 0)
  %101 = load i32, i32* %20, align 4
  %102 = ashr i32 %101, 1
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %103
  %105 = load i32, i32* %104, align 4
  %106 = load i32, i32* %20, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %107
  store i32 %105, i32* %108, align 4
  %109 = load i32, i32* %20, align 4
  %110 = ashr i32 %109, 1
  store i32 %110, i32* %20, align 4
  br label %85

; <label>:111:                                    ; preds = %85
  %112 = load i32, i32* %21, align 4
  %113 = load i32, i32* %20, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %114
  store i32 %112, i32* %115, align 4
  br label %116

; <label>:116:                                    ; preds = %111
  %pgocount3 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 9)
  %117 = add i64 %pgocount3, 1
  store i64 %117, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 9)
  %118 = load i32, i32* %13, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %13, align 4
  br label %66

; <label>:120:                                    ; preds = %66
  %121 = load i32, i32* %10, align 4
  %122 = icmp slt i32 %121, 260
  br i1 %122, label %125, label %123

; <label>:123:                                    ; preds = %120
  %pgocount4 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 19)
  %124 = add i64 %pgocount4, 1
  store i64 %124, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 19)
  call void @BZ2_bz__AssertH__fail(i32 2001)
  br label %125

; <label>:125:                                    ; preds = %123, %120
  br label %126

; <label>:126:                                    ; preds = %374, %125
  %127 = load i32, i32* %10, align 4
  %128 = icmp sgt i32 %127, 1
  br i1 %128, label %129, label %379

; <label>:129:                                    ; preds = %126
  %130 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 1
  %131 = load i32, i32* %130, align 4
  store i32 %131, i32* %11, align 4
  %132 = load i32, i32* %10, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %133
  %135 = load i32, i32* %134, align 4
  %136 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 1
  store i32 %135, i32* %136, align 4
  %137 = load i32, i32* %10, align 4
  %138 = add nsw i32 %137, -1
  store i32 %138, i32* %10, align 4
  store i32 1, i32* %22, align 4
  %139 = load i32, i32* %22, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %140
  %142 = load i32, i32* %141, align 4
  store i32 %142, i32* %24, align 4
  br label %143

; <label>:143:                                    ; preds = %191, %129
  %144 = load i32, i32* %22, align 4
  %145 = shl i32 %144, 1
  store i32 %145, i32* %23, align 4
  %146 = load i32, i32* %23, align 4
  %147 = load i32, i32* %10, align 4
  %148 = icmp sgt i32 %146, %147
  br i1 %148, label %149, label %150

; <label>:149:                                    ; preds = %143
  br label %201

; <label>:150:                                    ; preds = %143
  %151 = load i32, i32* %23, align 4
  %152 = load i32, i32* %10, align 4
  %153 = icmp slt i32 %151, %152
  br i1 %153, label %154, label %176

; <label>:154:                                    ; preds = %150
  %pgocount5 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 5)
  %155 = add i64 %pgocount5, 1
  store i64 %155, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 5)
  %156 = load i32, i32* %23, align 4
  %157 = add nsw i32 %156, 1
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %158
  %160 = load i32, i32* %159, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %161
  %163 = load i32, i32* %162, align 4
  %164 = load i32, i32* %23, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %165
  %167 = load i32, i32* %166, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %168
  %170 = load i32, i32* %169, align 4
  %171 = icmp slt i32 %163, %170
  br i1 %171, label %172, label %176

; <label>:172:                                    ; preds = %154
  %pgocount6 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 7)
  %173 = add i64 %pgocount6, 1
  store i64 %173, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 7)
  %174 = load i32, i32* %23, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, i32* %23, align 4
  br label %176

; <label>:176:                                    ; preds = %172, %154, %150
  %177 = load i32, i32* %24, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %178
  %180 = load i32, i32* %179, align 4
  %181 = load i32, i32* %23, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %182
  %184 = load i32, i32* %183, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %185
  %187 = load i32, i32* %186, align 4
  %188 = icmp slt i32 %180, %187
  br i1 %188, label %189, label %191

; <label>:189:                                    ; preds = %176
  %pgocount7 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 15)
  %190 = add i64 %pgocount7, 1
  store i64 %190, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 15)
  br label %201

; <label>:191:                                    ; preds = %176
  %pgocount8 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 3)
  %192 = add i64 %pgocount8, 1
  store i64 %192, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 3)
  %193 = load i32, i32* %23, align 4
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %194
  %196 = load i32, i32* %195, align 4
  %197 = load i32, i32* %22, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %198
  store i32 %196, i32* %199, align 4
  %200 = load i32, i32* %23, align 4
  store i32 %200, i32* %22, align 4
  br label %143

; <label>:201:                                    ; preds = %189, %149
  %202 = load i32, i32* %24, align 4
  %203 = load i32, i32* %22, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %204
  store i32 %202, i32* %205, align 4
  %206 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 1
  %207 = load i32, i32* %206, align 4
  store i32 %207, i32* %12, align 4
  %208 = load i32, i32* %10, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %209
  %211 = load i32, i32* %210, align 4
  %212 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 1
  store i32 %211, i32* %212, align 4
  %213 = load i32, i32* %10, align 4
  %214 = add nsw i32 %213, -1
  store i32 %214, i32* %10, align 4
  store i32 1, i32* %25, align 4
  %215 = load i32, i32* %25, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %216
  %218 = load i32, i32* %217, align 4
  store i32 %218, i32* %27, align 4
  br label %219

; <label>:219:                                    ; preds = %267, %201
  %220 = load i32, i32* %25, align 4
  %221 = shl i32 %220, 1
  store i32 %221, i32* %26, align 4
  %222 = load i32, i32* %26, align 4
  %223 = load i32, i32* %10, align 4
  %224 = icmp sgt i32 %222, %223
  br i1 %224, label %225, label %226

; <label>:225:                                    ; preds = %219
  br label %277

; <label>:226:                                    ; preds = %219
  %227 = load i32, i32* %26, align 4
  %228 = load i32, i32* %10, align 4
  %229 = icmp slt i32 %227, %228
  br i1 %229, label %230, label %252

; <label>:230:                                    ; preds = %226
  %pgocount9 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 6)
  %231 = add i64 %pgocount9, 1
  store i64 %231, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 6)
  %232 = load i32, i32* %26, align 4
  %233 = add nsw i32 %232, 1
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %234
  %236 = load i32, i32* %235, align 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %237
  %239 = load i32, i32* %238, align 4
  %240 = load i32, i32* %26, align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %241
  %243 = load i32, i32* %242, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %244
  %246 = load i32, i32* %245, align 4
  %247 = icmp slt i32 %239, %246
  br i1 %247, label %248, label %252

; <label>:248:                                    ; preds = %230
  %pgocount10 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 8)
  %249 = add i64 %pgocount10, 1
  store i64 %249, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 8)
  %250 = load i32, i32* %26, align 4
  %251 = add nsw i32 %250, 1
  store i32 %251, i32* %26, align 4
  br label %252

; <label>:252:                                    ; preds = %248, %230, %226
  %253 = load i32, i32* %27, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %254
  %256 = load i32, i32* %255, align 4
  %257 = load i32, i32* %26, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %258
  %260 = load i32, i32* %259, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %261
  %263 = load i32, i32* %262, align 4
  %264 = icmp slt i32 %256, %263
  br i1 %264, label %265, label %267

; <label>:265:                                    ; preds = %252
  %pgocount11 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 16)
  %266 = add i64 %pgocount11, 1
  store i64 %266, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 16)
  br label %277

; <label>:267:                                    ; preds = %252
  %pgocount12 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 4)
  %268 = add i64 %pgocount12, 1
  store i64 %268, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 4)
  %269 = load i32, i32* %26, align 4
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %270
  %272 = load i32, i32* %271, align 4
  %273 = load i32, i32* %25, align 4
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %274
  store i32 %272, i32* %275, align 4
  %276 = load i32, i32* %26, align 4
  store i32 %276, i32* %25, align 4
  br label %219

; <label>:277:                                    ; preds = %265, %225
  %278 = load i32, i32* %27, align 4
  %279 = load i32, i32* %25, align 4
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %280
  store i32 %278, i32* %281, align 4
  %282 = load i32, i32* %9, align 4
  %283 = add nsw i32 %282, 1
  store i32 %283, i32* %9, align 4
  %284 = load i32, i32* %9, align 4
  %285 = load i32, i32* %12, align 4
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds [516 x i32], [516 x i32]* %19, i64 0, i64 %286
  store i32 %284, i32* %287, align 4
  %288 = load i32, i32* %11, align 4
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds [516 x i32], [516 x i32]* %19, i64 0, i64 %289
  store i32 %284, i32* %290, align 4
  %291 = load i32, i32* %11, align 4
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %292
  %294 = load i32, i32* %293, align 4
  %295 = and i32 %294, -256
  %296 = load i32, i32* %12, align 4
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %297
  %299 = load i32, i32* %298, align 4
  %300 = and i32 %299, -256
  %301 = add i32 %295, %300
  %302 = load i32, i32* %11, align 4
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %303
  %305 = load i32, i32* %304, align 4
  %306 = and i32 %305, 255
  %307 = load i32, i32* %12, align 4
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %308
  %310 = load i32, i32* %309, align 4
  %311 = and i32 %310, 255
  %312 = icmp sgt i32 %306, %311
  br i1 %312, label %313, label %320

; <label>:313:                                    ; preds = %277
  %pgocount13 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 12)
  %314 = add i64 %pgocount13, 1
  store i64 %314, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 12)
  %315 = load i32, i32* %11, align 4
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %316
  %318 = load i32, i32* %317, align 4
  %319 = and i32 %318, 255
  br label %327

; <label>:320:                                    ; preds = %277
  %pgocount14 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 13)
  %321 = add i64 %pgocount14, 1
  store i64 %321, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 13)
  %322 = load i32, i32* %12, align 4
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %323
  %325 = load i32, i32* %324, align 4
  %326 = and i32 %325, 255
  br label %327

; <label>:327:                                    ; preds = %320, %313
  %328 = phi i32 [ %319, %313 ], [ %326, %320 ]
  %329 = add nsw i32 1, %328
  %330 = or i32 %301, %329
  %331 = load i32, i32* %9, align 4
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %332
  store i32 %330, i32* %333, align 4
  %334 = load i32, i32* %9, align 4
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds [516 x i32], [516 x i32]* %19, i64 0, i64 %335
  store i32 -1, i32* %336, align 4
  %337 = load i32, i32* %10, align 4
  %338 = add nsw i32 %337, 1
  store i32 %338, i32* %10, align 4
  %339 = load i32, i32* %9, align 4
  %340 = load i32, i32* %10, align 4
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %341
  store i32 %339, i32* %342, align 4
  %343 = load i32, i32* %10, align 4
  store i32 %343, i32* %28, align 4
  %344 = load i32, i32* %28, align 4
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %345
  %347 = load i32, i32* %346, align 4
  store i32 %347, i32* %29, align 4
  br label %348

; <label>:348:                                    ; preds = %362, %327
  %349 = load i32, i32* %29, align 4
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %350
  %352 = load i32, i32* %351, align 4
  %353 = load i32, i32* %28, align 4
  %354 = ashr i32 %353, 1
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %355
  %357 = load i32, i32* %356, align 4
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %358
  %360 = load i32, i32* %359, align 4
  %361 = icmp slt i32 %352, %360
  br i1 %361, label %362, label %374

; <label>:362:                                    ; preds = %348
  %pgocount15 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 1)
  %363 = add i64 %pgocount15, 1
  store i64 %363, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 1)
  %364 = load i32, i32* %28, align 4
  %365 = ashr i32 %364, 1
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %366
  %368 = load i32, i32* %367, align 4
  %369 = load i32, i32* %28, align 4
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %370
  store i32 %368, i32* %371, align 4
  %372 = load i32, i32* %28, align 4
  %373 = ashr i32 %372, 1
  store i32 %373, i32* %28, align 4
  br label %348

; <label>:374:                                    ; preds = %348
  %375 = load i32, i32* %29, align 4
  %376 = load i32, i32* %28, align 4
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds [260 x i32], [260 x i32]* %17, i64 0, i64 %377
  store i32 %375, i32* %378, align 4
  br label %126

; <label>:379:                                    ; preds = %126
  %380 = load i32, i32* %9, align 4
  %381 = icmp slt i32 %380, 516
  br i1 %381, label %384, label %382

; <label>:382:                                    ; preds = %379
  %pgocount16 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 20)
  %383 = add i64 %pgocount16, 1
  store i64 %383, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 20)
  call void @BZ2_bz__AssertH__fail(i32 2002)
  br label %384

; <label>:384:                                    ; preds = %382, %379
  store i8 0, i8* %16, align 1
  store i32 1, i32* %13, align 4
  br label %385

; <label>:385:                                    ; preds = %419, %384
  %386 = load i32, i32* %13, align 4
  %387 = load i32, i32* %7, align 4
  %388 = icmp sle i32 %386, %387
  br i1 %388, label %389, label %423

; <label>:389:                                    ; preds = %385
  store i32 0, i32* %14, align 4
  %390 = load i32, i32* %13, align 4
  store i32 %390, i32* %15, align 4
  br label %391

; <label>:391:                                    ; preds = %397, %389
  %392 = load i32, i32* %15, align 4
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds [516 x i32], [516 x i32]* %19, i64 0, i64 %393
  %395 = load i32, i32* %394, align 4
  %396 = icmp sge i32 %395, 0
  br i1 %396, label %397, label %405

; <label>:397:                                    ; preds = %391
  %pgocount17 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 2)
  %398 = add i64 %pgocount17, 1
  store i64 %398, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 2)
  %399 = load i32, i32* %15, align 4
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds [516 x i32], [516 x i32]* %19, i64 0, i64 %400
  %402 = load i32, i32* %401, align 4
  store i32 %402, i32* %15, align 4
  %403 = load i32, i32* %14, align 4
  %404 = add nsw i32 %403, 1
  store i32 %404, i32* %14, align 4
  br label %391

; <label>:405:                                    ; preds = %391
  %406 = load i32, i32* %14, align 4
  %407 = trunc i32 %406 to i8
  %408 = load i8*, i8** %5, align 8
  %409 = load i32, i32* %13, align 4
  %410 = sub nsw i32 %409, 1
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds i8, i8* %408, i64 %411
  store i8 %407, i8* %412, align 1
  %413 = load i32, i32* %14, align 4
  %414 = load i32, i32* %8, align 4
  %415 = icmp sgt i32 %413, %414
  br i1 %415, label %416, label %418

; <label>:416:                                    ; preds = %405
  %pgocount18 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 14)
  %417 = add i64 %pgocount18, 1
  store i64 %417, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 14)
  store i8 1, i8* %16, align 1
  br label %418

; <label>:418:                                    ; preds = %416, %405
  br label %419

; <label>:419:                                    ; preds = %418
  %pgocount19 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 10)
  %420 = add i64 %pgocount19, 1
  store i64 %420, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 10)
  %421 = load i32, i32* %13, align 4
  %422 = add nsw i32 %421, 1
  store i32 %422, i32* %13, align 4
  br label %385

; <label>:423:                                    ; preds = %385
  %424 = load i8, i8* %16, align 1
  %425 = icmp ne i8 %424, 0
  br i1 %425, label %427, label %426

; <label>:426:                                    ; preds = %423
  br label %452

; <label>:427:                                    ; preds = %423
  store i32 1, i32* %13, align 4
  br label %428

; <label>:428:                                    ; preds = %446, %427
  %429 = load i32, i32* %13, align 4
  %430 = load i32, i32* %7, align 4
  %431 = icmp sle i32 %429, %430
  br i1 %431, label %432, label %450

; <label>:432:                                    ; preds = %428
  %433 = load i32, i32* %13, align 4
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %434
  %436 = load i32, i32* %435, align 4
  %437 = ashr i32 %436, 8
  store i32 %437, i32* %14, align 4
  %438 = load i32, i32* %14, align 4
  %439 = sdiv i32 %438, 2
  %440 = add nsw i32 1, %439
  store i32 %440, i32* %14, align 4
  %441 = load i32, i32* %14, align 4
  %442 = shl i32 %441, 8
  %443 = load i32, i32* %13, align 4
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds [516 x i32], [516 x i32]* %18, i64 0, i64 %444
  store i32 %442, i32* %445, align 4
  br label %446

; <label>:446:                                    ; preds = %432
  %pgocount20 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 11)
  %447 = add i64 %pgocount20, 1
  store i64 %447, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 11)
  %448 = load i32, i32* %13, align 4
  %449 = add nsw i32 %448, 1
  store i32 %449, i32* %13, align 4
  br label %428

; <label>:450:                                    ; preds = %428
  %pgocount21 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 17)
  %451 = add i64 %pgocount21, 1
  store i64 %451, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 17)
  br label %61

; <label>:452:                                    ; preds = %426
  %pgocount22 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 22)
  %453 = add i64 %pgocount22, 1
  store i64 %453, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_hbMakeCodeLengths, i64 0, i64 22)
  ret void
}

declare void @BZ2_bz__AssertH__fail(i32) #1

; Function Attrs: noinline nounwind uwtable
define void @BZ2_hbAssignCodes(i32*, i8*, i32, i32, i32) #0 {
  %6 = alloca i32*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32* %0, i32** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  store i32 0, i32* %12, align 4
  %14 = load i32, i32* %8, align 4
  store i32 %14, i32* %11, align 4
  br label %15

; <label>:15:                                     ; preds = %50, %5
  %16 = load i32, i32* %11, align 4
  %17 = load i32, i32* %9, align 4
  %18 = icmp sle i32 %16, %17
  br i1 %18, label %19, label %54

; <label>:19:                                     ; preds = %15
  store i32 0, i32* %13, align 4
  br label %20

; <label>:20:                                     ; preds = %43, %19
  %21 = load i32, i32* %13, align 4
  %22 = load i32, i32* %10, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %47

; <label>:24:                                     ; preds = %20
  %25 = load i8*, i8** %7, align 8
  %26 = load i32, i32* %13, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, i8* %25, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = load i32, i32* %11, align 4
  %32 = icmp eq i32 %30, %31
  br i1 %32, label %33, label %42

; <label>:33:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_hbAssignCodes, i64 0, i64 1)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_hbAssignCodes, i64 0, i64 1)
  %35 = load i32, i32* %12, align 4
  %36 = load i32*, i32** %6, align 8
  %37 = load i32, i32* %13, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32* %36, i64 %38
  store i32 %35, i32* %39, align 4
  %40 = load i32, i32* %12, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %12, align 4
  br label %42

; <label>:42:                                     ; preds = %33, %24
  br label %43

; <label>:43:                                     ; preds = %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_hbAssignCodes, i64 0, i64 0)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_hbAssignCodes, i64 0, i64 0)
  %45 = load i32, i32* %13, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %13, align 4
  br label %20

; <label>:47:                                     ; preds = %20
  %48 = load i32, i32* %12, align 4
  %49 = shl i32 %48, 1
  store i32 %49, i32* %12, align 4
  br label %50

; <label>:50:                                     ; preds = %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_hbAssignCodes, i64 0, i64 2)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_hbAssignCodes, i64 0, i64 2)
  %52 = load i32, i32* %11, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %11, align 4
  br label %15

; <label>:54:                                     ; preds = %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_hbAssignCodes, i64 0, i64 3)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_hbAssignCodes, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @BZ2_hbCreateDecodeTables(i32*, i32*, i32*, i8*, i32, i32, i32) #0 {
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store i32* %0, i32** %8, align 8
  store i32* %1, i32** %9, align 8
  store i32* %2, i32** %10, align 8
  store i8* %3, i8** %11, align 8
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  store i32 %6, i32* %14, align 4
  store i32 0, i32* %15, align 4
  %19 = load i32, i32* %12, align 4
  store i32 %19, i32* %16, align 4
  br label %20

; <label>:20:                                     ; preds = %53, %7
  %21 = load i32, i32* %16, align 4
  %22 = load i32, i32* %13, align 4
  %23 = icmp sle i32 %21, %22
  br i1 %23, label %24, label %57

; <label>:24:                                     ; preds = %20
  store i32 0, i32* %17, align 4
  br label %25

; <label>:25:                                     ; preds = %48, %24
  %26 = load i32, i32* %17, align 4
  %27 = load i32, i32* %14, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %52

; <label>:29:                                     ; preds = %25
  %30 = load i8*, i8** %11, align 8
  %31 = load i32, i32* %17, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %30, i64 %32
  %34 = load i8, i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = load i32, i32* %16, align 4
  %37 = icmp eq i32 %35, %36
  br i1 %37, label %38, label %47

; <label>:38:                                     ; preds = %29
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 1)
  %39 = add i64 %pgocount, 1
  store i64 %39, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 1)
  %40 = load i32, i32* %17, align 4
  %41 = load i32*, i32** %10, align 8
  %42 = load i32, i32* %15, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32* %41, i64 %43
  store i32 %40, i32* %44, align 4
  %45 = load i32, i32* %15, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %15, align 4
  br label %47

; <label>:47:                                     ; preds = %38, %29
  br label %48

; <label>:48:                                     ; preds = %47
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 0)
  %49 = add i64 %pgocount1, 1
  store i64 %49, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 0)
  %50 = load i32, i32* %17, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %17, align 4
  br label %25

; <label>:52:                                     ; preds = %25
  br label %53

; <label>:53:                                     ; preds = %52
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 2)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 2)
  %55 = load i32, i32* %16, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %16, align 4
  br label %20

; <label>:57:                                     ; preds = %20
  store i32 0, i32* %16, align 4
  br label %58

; <label>:58:                                     ; preds = %66, %57
  %59 = load i32, i32* %16, align 4
  %60 = icmp slt i32 %59, 23
  br i1 %60, label %61, label %70

; <label>:61:                                     ; preds = %58
  %62 = load i32*, i32** %9, align 8
  %63 = load i32, i32* %16, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32* %62, i64 %64
  store i32 0, i32* %65, align 4
  br label %66

; <label>:66:                                     ; preds = %61
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 3)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 3)
  %68 = load i32, i32* %16, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %16, align 4
  br label %58

; <label>:70:                                     ; preds = %58
  store i32 0, i32* %16, align 4
  br label %71

; <label>:71:                                     ; preds = %88, %70
  %72 = load i32, i32* %16, align 4
  %73 = load i32, i32* %14, align 4
  %74 = icmp slt i32 %72, %73
  br i1 %74, label %75, label %92

; <label>:75:                                     ; preds = %71
  %76 = load i32*, i32** %9, align 8
  %77 = load i8*, i8** %11, align 8
  %78 = load i32, i32* %16, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i8, i8* %77, i64 %79
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i32
  %83 = add nsw i32 %82, 1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32* %76, i64 %84
  %86 = load i32, i32* %85, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %85, align 4
  br label %88

; <label>:88:                                     ; preds = %75
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 4)
  %89 = add i64 %pgocount4, 1
  store i64 %89, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 4)
  %90 = load i32, i32* %16, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %16, align 4
  br label %71

; <label>:92:                                     ; preds = %71
  store i32 1, i32* %16, align 4
  br label %93

; <label>:93:                                     ; preds = %109, %92
  %94 = load i32, i32* %16, align 4
  %95 = icmp slt i32 %94, 23
  br i1 %95, label %96, label %113

; <label>:96:                                     ; preds = %93
  %97 = load i32*, i32** %9, align 8
  %98 = load i32, i32* %16, align 4
  %99 = sub nsw i32 %98, 1
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32* %97, i64 %100
  %102 = load i32, i32* %101, align 4
  %103 = load i32*, i32** %9, align 8
  %104 = load i32, i32* %16, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32* %103, i64 %105
  %107 = load i32, i32* %106, align 4
  %108 = add nsw i32 %107, %102
  store i32 %108, i32* %106, align 4
  br label %109

; <label>:109:                                    ; preds = %96
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 5)
  %110 = add i64 %pgocount5, 1
  store i64 %110, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 5)
  %111 = load i32, i32* %16, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %16, align 4
  br label %93

; <label>:113:                                    ; preds = %93
  store i32 0, i32* %16, align 4
  br label %114

; <label>:114:                                    ; preds = %122, %113
  %115 = load i32, i32* %16, align 4
  %116 = icmp slt i32 %115, 23
  br i1 %116, label %117, label %126

; <label>:117:                                    ; preds = %114
  %118 = load i32*, i32** %8, align 8
  %119 = load i32, i32* %16, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32* %118, i64 %120
  store i32 0, i32* %121, align 4
  br label %122

; <label>:122:                                    ; preds = %117
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 6)
  %123 = add i64 %pgocount6, 1
  store i64 %123, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 6)
  %124 = load i32, i32* %16, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %16, align 4
  br label %114

; <label>:126:                                    ; preds = %114
  store i32 0, i32* %18, align 4
  %127 = load i32, i32* %12, align 4
  store i32 %127, i32* %16, align 4
  br label %128

; <label>:128:                                    ; preds = %155, %126
  %129 = load i32, i32* %16, align 4
  %130 = load i32, i32* %13, align 4
  %131 = icmp sle i32 %129, %130
  br i1 %131, label %132, label %159

; <label>:132:                                    ; preds = %128
  %133 = load i32*, i32** %9, align 8
  %134 = load i32, i32* %16, align 4
  %135 = add nsw i32 %134, 1
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32* %133, i64 %136
  %138 = load i32, i32* %137, align 4
  %139 = load i32*, i32** %9, align 8
  %140 = load i32, i32* %16, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32* %139, i64 %141
  %143 = load i32, i32* %142, align 4
  %144 = sub nsw i32 %138, %143
  %145 = load i32, i32* %18, align 4
  %146 = add nsw i32 %145, %144
  store i32 %146, i32* %18, align 4
  %147 = load i32, i32* %18, align 4
  %148 = sub nsw i32 %147, 1
  %149 = load i32*, i32** %8, align 8
  %150 = load i32, i32* %16, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, i32* %149, i64 %151
  store i32 %148, i32* %152, align 4
  %153 = load i32, i32* %18, align 4
  %154 = shl i32 %153, 1
  store i32 %154, i32* %18, align 4
  br label %155

; <label>:155:                                    ; preds = %132
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 7)
  %156 = add i64 %pgocount7, 1
  store i64 %156, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 7)
  %157 = load i32, i32* %16, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, i32* %16, align 4
  br label %128

; <label>:159:                                    ; preds = %128
  %160 = load i32, i32* %12, align 4
  %161 = add nsw i32 %160, 1
  store i32 %161, i32* %16, align 4
  br label %162

; <label>:162:                                    ; preds = %185, %159
  %163 = load i32, i32* %16, align 4
  %164 = load i32, i32* %13, align 4
  %165 = icmp sle i32 %163, %164
  br i1 %165, label %166, label %189

; <label>:166:                                    ; preds = %162
  %167 = load i32*, i32** %8, align 8
  %168 = load i32, i32* %16, align 4
  %169 = sub nsw i32 %168, 1
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i32, i32* %167, i64 %170
  %172 = load i32, i32* %171, align 4
  %173 = add nsw i32 %172, 1
  %174 = shl i32 %173, 1
  %175 = load i32*, i32** %9, align 8
  %176 = load i32, i32* %16, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i32, i32* %175, i64 %177
  %179 = load i32, i32* %178, align 4
  %180 = sub nsw i32 %174, %179
  %181 = load i32*, i32** %9, align 8
  %182 = load i32, i32* %16, align 4
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i32, i32* %181, i64 %183
  store i32 %180, i32* %184, align 4
  br label %185

; <label>:185:                                    ; preds = %166
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 8)
  %186 = add i64 %pgocount8, 1
  store i64 %186, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 8)
  %187 = load i32, i32* %16, align 4
  %188 = add nsw i32 %187, 1
  store i32 %188, i32* %16, align 4
  br label %162

; <label>:189:                                    ; preds = %162
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 9)
  %190 = add i64 %pgocount9, 1
  store i64 %190, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_hbCreateDecodeTables, i64 0, i64 9)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
