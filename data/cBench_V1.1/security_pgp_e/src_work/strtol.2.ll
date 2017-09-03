; ModuleID = 'tmp1.ll'
source_filename = "strtol.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_strtol = private constant [6 x i8] c"strtol"
@__profc_strtol = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_strtol = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8230713220122516988, i64 288230656297815104, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i32 0, i32 0), i8* bitcast (i64 (i8*, i8**, i32)* @strtol to i8*), i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [8 x i8] c"\06\00strtol", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_strtol to i8*), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i64 @strtol(i8*, i8**, i32) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8** %1, i8*** %5, align 8
  store i32 %2, i32* %6, align 4
  %14 = load i8*, i8** %4, align 8
  store i8* %14, i8** %7, align 8
  store i32 0, i32* %11, align 4
  br label %15

; <label>:15:                                     ; preds = %21, %3
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 1)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 1)
  %17 = load i8*, i8** %7, align 8
  %18 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %18, i8** %7, align 8
  %19 = load i8, i8* %17, align 1
  %20 = sext i8 %19 to i32
  store i32 %20, i32* %9, align 4
  br label %21

; <label>:21:                                     ; preds = %15
  %22 = call i16** @__ctype_b_loc() #3
  %23 = load i16*, i16** %22, align 8
  %24 = load i32, i32* %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i16, i16* %23, i64 %25
  %27 = load i16, i16* %26, align 2
  %28 = zext i16 %27 to i32
  %29 = and i32 %28, 8192
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %15, label %31

; <label>:31:                                     ; preds = %21
  %32 = load i32, i32* %9, align 4
  %33 = icmp eq i32 %32, 45
  br i1 %33, label %34, label %40

; <label>:34:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 9)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 9)
  store i32 1, i32* %11, align 4
  %36 = load i8*, i8** %7, align 8
  %37 = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %37, i8** %7, align 8
  %38 = load i8, i8* %36, align 1
  %39 = sext i8 %38 to i32
  store i32 %39, i32* %9, align 4
  br label %51

; <label>:40:                                     ; preds = %31
  %41 = load i32, i32* %9, align 4
  %42 = icmp eq i32 %41, 43
  br i1 %42, label %43, label %49

; <label>:43:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 18)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 18)
  %45 = load i8*, i8** %7, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %7, align 8
  %47 = load i8, i8* %45, align 1
  %48 = sext i8 %47 to i32
  store i32 %48, i32* %9, align 4
  br label %49

; <label>:49:                                     ; preds = %43, %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 10)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 10)
  br label %51

; <label>:51:                                     ; preds = %49, %34
  %52 = load i32, i32* %6, align 4
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %59, label %54

; <label>:54:                                     ; preds = %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 8)
  %55 = add i64 %pgocount4, 1
  store i64 %55, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 8)
  %56 = load i32, i32* %6, align 4
  %57 = icmp eq i32 %56, 16
  br i1 %57, label %59, label %._crit_edge

._crit_edge:                                      ; preds = %54
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 0)
  %58 = add i64 %pgocount5, 1
  store i64 %58, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 0)
  br label %82

; <label>:59:                                     ; preds = %54, %51
  %60 = load i32, i32* %9, align 4
  %61 = icmp eq i32 %60, 48
  br i1 %61, label %62, label %82

; <label>:62:                                     ; preds = %59
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 15)
  %63 = add i64 %pgocount6, 1
  store i64 %63, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 15)
  %64 = load i8*, i8** %7, align 8
  %65 = load i8, i8* %64, align 1
  %66 = sext i8 %65 to i32
  %67 = icmp eq i32 %66, 120
  br i1 %67, label %74, label %68

; <label>:68:                                     ; preds = %62
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 20)
  %69 = add i64 %pgocount7, 1
  store i64 %69, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 20)
  %70 = load i8*, i8** %7, align 8
  %71 = load i8, i8* %70, align 1
  %72 = sext i8 %71 to i32
  %73 = icmp eq i32 %72, 88
  br i1 %73, label %74, label %82

; <label>:74:                                     ; preds = %68, %62
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 17)
  %75 = add i64 %pgocount8, 1
  store i64 %75, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 17)
  %76 = load i8*, i8** %7, align 8
  %77 = getelementptr inbounds i8, i8* %76, i64 1
  %78 = load i8, i8* %77, align 1
  %79 = sext i8 %78 to i32
  store i32 %79, i32* %9, align 4
  %80 = load i8*, i8** %7, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 2
  store i8* %81, i8** %7, align 8
  store i32 16, i32* %6, align 4
  br label %82

; <label>:82:                                     ; preds = %._crit_edge, %74, %68, %59
  %83 = load i32, i32* %6, align 4
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %85, label %92

; <label>:85:                                     ; preds = %82
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 13)
  %86 = add i64 %pgocount9, 1
  store i64 %86, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 13)
  %87 = load i32, i32* %9, align 4
  %88 = icmp eq i32 %87, 48
  %89 = zext i1 %88 to i64
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 21)
  %90 = add i64 %pgocount10, %89
  store i64 %90, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 21)
  %91 = select i1 %88, i32 8, i32 10
  store i32 %91, i32* %6, align 4
  br label %92

; <label>:92:                                     ; preds = %85, %82
  %93 = load i32, i32* %11, align 4
  %94 = icmp ne i32 %93, 0
  %95 = zext i1 %94 to i64
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 22)
  %96 = add i64 %pgocount11, %95
  store i64 %96, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 22)
  %97 = select i1 %94, i64 -9223372036854775808, i64 9223372036854775807
  store i64 %97, i64* %10, align 8
  %98 = load i64, i64* %10, align 8
  %99 = load i32, i32* %6, align 4
  %100 = sext i32 %99 to i64
  %101 = urem i64 %98, %100
  %102 = trunc i64 %101 to i32
  store i32 %102, i32* %13, align 4
  %103 = load i32, i32* %6, align 4
  %104 = sext i32 %103 to i64
  %105 = load i64, i64* %10, align 8
  %106 = udiv i64 %105, %104
  store i64 %106, i64* %10, align 8
  store i64 0, i64* %8, align 8
  store i32 0, i32* %12, align 4
  br label %107

; <label>:107:                                    ; preds = %185, %92
  %108 = call i16** @__ctype_b_loc() #3
  %109 = load i16*, i16** %108, align 8
  %110 = load i32, i32* %9, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i16, i16* %109, i64 %111
  %113 = load i16, i16* %112, align 2
  %114 = zext i16 %113 to i32
  %115 = and i32 %114, 2048
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %117, label %121

; <label>:117:                                    ; preds = %107
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 3)
  %118 = add i64 %pgocount12, 1
  store i64 %118, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 3)
  %119 = load i32, i32* %9, align 4
  %120 = sub nsw i32 %119, 48
  store i32 %120, i32* %9, align 4
  br label %150

; <label>:121:                                    ; preds = %107
  %122 = call i16** @__ctype_b_loc() #3
  %123 = load i16*, i16** %122, align 8
  %124 = load i32, i32* %9, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i16, i16* %123, i64 %125
  %127 = load i16, i16* %126, align 2
  %128 = zext i16 %127 to i32
  %129 = and i32 %128, 1024
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %131, label %147

; <label>:131:                                    ; preds = %121
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 4)
  %132 = add i64 %pgocount13, 1
  store i64 %132, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 4)
  %133 = call i16** @__ctype_b_loc() #3
  %134 = load i16*, i16** %133, align 8
  %135 = load i32, i32* %9, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i16, i16* %134, i64 %136
  %138 = load i16, i16* %137, align 2
  %139 = zext i16 %138 to i32
  %140 = and i32 %139, 256
  %141 = icmp ne i32 %140, 0
  %142 = zext i1 %141 to i64
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 23)
  %143 = add i64 %pgocount14, %142
  store i64 %143, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 23)
  %144 = select i1 %141, i32 55, i32 87
  %145 = load i32, i32* %9, align 4
  %146 = sub nsw i32 %145, %144
  store i32 %146, i32* %9, align 4
  br label %149

; <label>:147:                                    ; preds = %121
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 16)
  %148 = add i64 %pgocount15, 1
  store i64 %148, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 16)
  br label %190

; <label>:149:                                    ; preds = %131
  br label %150

; <label>:150:                                    ; preds = %149, %117
  %151 = load i32, i32* %9, align 4
  %152 = load i32, i32* %6, align 4
  %153 = icmp sge i32 %151, %152
  br i1 %153, label %154, label %155

; <label>:154:                                    ; preds = %150
  br label %190

; <label>:155:                                    ; preds = %150
  %156 = load i32, i32* %12, align 4
  %157 = icmp slt i32 %156, 0
  br i1 %157, label %173, label %158

; <label>:158:                                    ; preds = %155
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 2)
  %159 = add i64 %pgocount16, 1
  store i64 %159, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 2)
  %160 = load i64, i64* %8, align 8
  %161 = load i64, i64* %10, align 8
  %162 = icmp ugt i64 %160, %161
  br i1 %162, label %173, label %163

; <label>:163:                                    ; preds = %158
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 5)
  %164 = add i64 %pgocount17, 1
  store i64 %164, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 5)
  %165 = load i64, i64* %8, align 8
  %166 = load i64, i64* %10, align 8
  %167 = icmp eq i64 %165, %166
  br i1 %167, label %168, label %174

; <label>:168:                                    ; preds = %163
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 7)
  %169 = add i64 %pgocount18, 1
  store i64 %169, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 7)
  %170 = load i32, i32* %9, align 4
  %171 = load i32, i32* %13, align 4
  %172 = icmp sgt i32 %170, %171
  br i1 %172, label %173, label %174

; <label>:173:                                    ; preds = %168, %158, %155
  store i32 -1, i32* %12, align 4
  br label %184

; <label>:174:                                    ; preds = %168, %163
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 6)
  %175 = add i64 %pgocount19, 1
  store i64 %175, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 6)
  store i32 1, i32* %12, align 4
  %176 = load i32, i32* %6, align 4
  %177 = sext i32 %176 to i64
  %178 = load i64, i64* %8, align 8
  %179 = mul i64 %178, %177
  store i64 %179, i64* %8, align 8
  %180 = load i32, i32* %9, align 4
  %181 = sext i32 %180 to i64
  %182 = load i64, i64* %8, align 8
  %183 = add i64 %182, %181
  store i64 %183, i64* %8, align 8
  br label %184

; <label>:184:                                    ; preds = %174, %173
  br label %185

; <label>:185:                                    ; preds = %184
  %186 = load i8*, i8** %7, align 8
  %187 = getelementptr inbounds i8, i8* %186, i32 1
  store i8* %187, i8** %7, align 8
  %188 = load i8, i8* %186, align 1
  %189 = sext i8 %188 to i32
  store i32 %189, i32* %9, align 4
  br label %107

; <label>:190:                                    ; preds = %154, %147
  %191 = load i32, i32* %12, align 4
  %192 = icmp slt i32 %191, 0
  br i1 %192, label %193, label %201

; <label>:193:                                    ; preds = %190
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 14)
  %194 = add i64 %pgocount20, 1
  store i64 %194, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 14)
  %195 = load i32, i32* %11, align 4
  %196 = icmp ne i32 %195, 0
  %197 = zext i1 %196 to i64
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 24)
  %198 = add i64 %pgocount21, %197
  store i64 %198, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 24)
  %199 = select i1 %196, i64 -9223372036854775808, i64 9223372036854775807
  store i64 %199, i64* %8, align 8
  %200 = call i32* @__errno_location() #3
  store i32 34, i32* %200, align 4
  br label %209

; <label>:201:                                    ; preds = %190
  %202 = load i32, i32* %11, align 4
  %203 = icmp ne i32 %202, 0
  br i1 %203, label %204, label %208

; <label>:204:                                    ; preds = %201
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 11)
  %205 = add i64 %pgocount22, 1
  store i64 %205, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 11)
  %206 = load i64, i64* %8, align 8
  %207 = sub i64 0, %206
  store i64 %207, i64* %8, align 8
  br label %208

; <label>:208:                                    ; preds = %204, %201
  br label %209

; <label>:209:                                    ; preds = %208, %193
  %210 = load i8**, i8*** %5, align 8
  %211 = icmp ne i8** %210, null
  br i1 %211, label %212, label %225

; <label>:212:                                    ; preds = %209
  %213 = load i32, i32* %12, align 4
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %215, label %219

; <label>:215:                                    ; preds = %212
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 12)
  %216 = add i64 %pgocount23, 1
  store i64 %216, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 12)
  %217 = load i8*, i8** %7, align 8
  %218 = getelementptr inbounds i8, i8* %217, i64 -1
  br label %222

; <label>:219:                                    ; preds = %212
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 19)
  %220 = add i64 %pgocount24, 1
  store i64 %220, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_strtol, i64 0, i64 19)
  %221 = load i8*, i8** %4, align 8
  br label %222

; <label>:222:                                    ; preds = %219, %215
  %223 = phi i8* [ %218, %215 ], [ %221, %219 ]
  %224 = load i8**, i8*** %5, align 8
  store i8* %223, i8** %224, align 8
  br label %225

; <label>:225:                                    ; preds = %222, %209
  %226 = load i64, i64* %8, align 8
  ret i64 %226
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #1

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
