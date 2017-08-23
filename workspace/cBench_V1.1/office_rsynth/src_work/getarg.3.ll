; ModuleID = 'getarg.2.ll'
source_filename = "getarg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [63 x i8] c"$Id: getarg.c,v 1.13 1994/11/08 13:30:50 a904209 Exp a904209 $\00", align 1
@getarg_id = global i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str, i32 0, i32 0), align 8
@help_only = global i32 0, align 4
@.str.1 = private unnamed_addr constant [6 x i8] c"-help\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [5 x i8] c"%s:\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c" -%s <%s> [\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"]\09%s\0A\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c" -%s <string> [%s]\09%s\0A\00", align 1
@.str.6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.7 = private unnamed_addr constant [18 x i8] c" [+|-]%s [%s]\09%s\0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"yes\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"no\00", align 1
@.str.10 = private unnamed_addr constant [27 x i8] c"%s : %s invalid after -%s\0A\00", align 1
@.str.11 = private unnamed_addr constant [28 x i8] c"%s : no argument after -%s\0A\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_getargs = private constant [7 x i8] c"getargs"
@__profc_getargs = private global [43 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_getargs = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5018360157688967692, i64 72058188220835872, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i8**, ...)* @getargs to i8*), i8* null, i32 43, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [17 x i8] c"\07\0Fx\DAKO-I,J/\06\00\0B\95\02\EE", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_getargs to i8*), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @getargs(i8*, i32, i8**, ...) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8**, align 8
  %7 = alloca [1 x %struct.__va_list_tag], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store i8** %2, i8*** %6, align 8
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  br label %23

; <label>:23:                                     ; preds = %479, %3
  %24 = load i32, i32* %8, align 4
  %25 = load i32, i32* %5, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %480

; <label>:27:                                     ; preds = %23
  %28 = load i8**, i8*** %6, align 8
  %29 = load i32, i32* %8, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8*, i8** %28, i64 %30
  %32 = load i8*, i8** %31, align 8
  store i8* %32, i8** %10, align 8
  %33 = load i8*, i8** %10, align 8
  %34 = getelementptr inbounds i8, i8* %33, i32 1
  store i8* %34, i8** %10, align 8
  %35 = load i8, i8* %33, align 1
  %36 = sext i8 %35 to i32
  store i32 %36, i32* %11, align 4
  %37 = load i8*, i8** %10, align 8
  %38 = load i8, i8* %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %475

; <label>:41:                                     ; preds = %27
  %pgocount = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 20)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 20)
  %43 = load i32, i32* %11, align 4
  %44 = icmp eq i32 %43, 45
  br i1 %44, label %49, label %45

; <label>:45:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 24)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 24)
  %47 = load i32, i32* %11, align 4
  %48 = icmp eq i32 %47, 43
  br i1 %48, label %49, label %475

; <label>:49:                                     ; preds = %45, %41
  store i32 1, i32* %12, align 4
  br label %50

; <label>:50:                                     ; preds = %438, %49
  %51 = load i8*, i8** %10, align 8
  %52 = load i8, i8* %51, align 1
  %53 = icmp ne i8 %52, 0
  br i1 %53, label %54, label %440

; <label>:54:                                     ; preds = %50
  store i32 0, i32* %14, align 4
  %55 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %56 = bitcast %struct.__va_list_tag* %55 to i8*
  call void @llvm.va_start(i8* %56)
  br label %57

; <label>:57:                                     ; preds = %430, %54
  %58 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %59 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 0
  %60 = load i32, i32* %59, align 16
  %61 = icmp ule i32 %60, 40
  br i1 %61, label %62, label %68

; <label>:62:                                     ; preds = %57
  %63 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 3
  %64 = load i8*, i8** %63, align 16
  %65 = getelementptr i8, i8* %64, i32 %60
  %66 = bitcast i8* %65 to i8**
  %67 = add i32 %60, 8
  store i32 %67, i32* %59, align 16
  br label %74

; <label>:68:                                     ; preds = %57
  %pgocount4 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 3)
  %69 = add i64 %pgocount4, 1
  store i64 %69, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 3)
  %70 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8
  %72 = bitcast i8* %71 to i8**
  %73 = getelementptr i8, i8* %71, i32 8
  store i8* %73, i8** %70, align 8
  br label %74

; <label>:74:                                     ; preds = %68, %62
  %75 = phi i8** [ %66, %62 ], [ %72, %68 ]
  %76 = load i8*, i8** %75, align 8
  store i8* %76, i8** %13, align 8
  %77 = icmp ne i8* %76, null
  br i1 %77, label %78, label %431

; <label>:78:                                     ; preds = %74
  %79 = load i8*, i8** %13, align 8
  %80 = call i64 @strlen(i8* %79) #5
  %81 = trunc i64 %80 to i32
  store i32 %81, i32* %15, align 4
  %82 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %83 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %82, i32 0, i32 0
  %84 = load i32, i32* %83, align 16
  %85 = icmp ule i32 %84, 40
  br i1 %85, label %86, label %92

; <label>:86:                                     ; preds = %78
  %87 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %82, i32 0, i32 3
  %88 = load i8*, i8** %87, align 16
  %89 = getelementptr i8, i8* %88, i32 %84
  %90 = bitcast i8* %89 to i8**
  %91 = add i32 %84, 8
  store i32 %91, i32* %83, align 16
  br label %98

; <label>:92:                                     ; preds = %78
  %pgocount5 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 4)
  %93 = add i64 %pgocount5, 1
  store i64 %93, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 4)
  %94 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %82, i32 0, i32 2
  %95 = load i8*, i8** %94, align 8
  %96 = bitcast i8* %95 to i8**
  %97 = getelementptr i8, i8* %95, i32 8
  store i8* %97, i8** %94, align 8
  br label %98

; <label>:98:                                     ; preds = %92, %86
  %99 = phi i8** [ %90, %86 ], [ %96, %92 ]
  %100 = load i8*, i8** %99, align 8
  store i8* %100, i8** %16, align 8
  %101 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %102 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %101, i32 0, i32 0
  %103 = load i32, i32* %102, align 16
  %104 = icmp ule i32 %103, 40
  br i1 %104, label %105, label %111

; <label>:105:                                    ; preds = %98
  %106 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %101, i32 0, i32 3
  %107 = load i8*, i8** %106, align 16
  %108 = getelementptr i8, i8* %107, i32 %103
  %109 = bitcast i8* %108 to i8**
  %110 = add i32 %103, 8
  store i32 %110, i32* %102, align 16
  br label %117

; <label>:111:                                    ; preds = %98
  %pgocount6 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 5)
  %112 = add i64 %pgocount6, 1
  store i64 %112, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 5)
  %113 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %101, i32 0, i32 2
  %114 = load i8*, i8** %113, align 8
  %115 = bitcast i8* %114 to i8**
  %116 = getelementptr i8, i8* %114, i32 8
  store i8* %116, i8** %113, align 8
  br label %117

; <label>:117:                                    ; preds = %111, %105
  %118 = phi i8** [ %109, %105 ], [ %115, %111 ]
  %119 = load i8*, i8** %118, align 8
  store i8* %119, i8** %17, align 8
  %120 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %121 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %120, i32 0, i32 0
  %122 = load i32, i32* %121, align 16
  %123 = icmp ule i32 %122, 40
  br i1 %123, label %124, label %130

; <label>:124:                                    ; preds = %117
  %125 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %120, i32 0, i32 3
  %126 = load i8*, i8** %125, align 16
  %127 = getelementptr i8, i8* %126, i32 %122
  %128 = bitcast i8* %127 to i8**
  %129 = add i32 %122, 8
  store i32 %129, i32* %121, align 16
  br label %136

; <label>:130:                                    ; preds = %117
  %pgocount7 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 6)
  %131 = add i64 %pgocount7, 1
  store i64 %131, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 6)
  %132 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %120, i32 0, i32 2
  %133 = load i8*, i8** %132, align 8
  %134 = bitcast i8* %133 to i8**
  %135 = getelementptr i8, i8* %133, i32 8
  store i8* %135, i8** %132, align 8
  br label %136

; <label>:136:                                    ; preds = %130, %124
  %137 = phi i8** [ %128, %124 ], [ %134, %130 ]
  %138 = load i8*, i8** %137, align 8
  store i8* %138, i8** %18, align 8
  %139 = load i8*, i8** %10, align 8
  %140 = call i32 @strcmp(i8* %139, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0)) #5
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %244, label %142

; <label>:142:                                    ; preds = %136
  store i32 1, i32* @help_only, align 4
  %143 = load i32, i32* %9, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %9, align 4
  %145 = icmp ne i32 %143, 0
  br i1 %145, label %151, label %146

; <label>:146:                                    ; preds = %142
  %pgocount8 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 10)
  %147 = add i64 %pgocount8, 1
  store i64 %147, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 10)
  %148 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %149 = load i8*, i8** %4, align 8
  %150 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %148, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i8* %149)
  br label %151

; <label>:151:                                    ; preds = %146, %142
  %152 = load i8*, i8** %16, align 8
  %153 = icmp ne i8* %152, null
  br i1 %153, label %154, label %230

; <label>:154:                                    ; preds = %151
  %155 = load i8*, i8** %16, align 8
  %156 = call i8* @strchr(i8* %155, i32 37) #5
  store i8* %156, i8** %19, align 8
  %157 = load i8*, i8** %19, align 8
  %158 = icmp ne i8* %157, null
  br i1 %158, label %159, label %211

; <label>:159:                                    ; preds = %154
  %160 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %161 = load i8*, i8** %13, align 8
  %162 = load i8*, i8** %19, align 8
  %163 = getelementptr inbounds i8, i8* %162, i64 1
  %164 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %160, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i8* %161, i8* %163)
  %165 = load i8*, i8** %19, align 8
  %166 = load i8*, i8** %19, align 8
  %167 = call i64 @strlen(i8* %166) #5
  %168 = getelementptr inbounds i8, i8* %165, i64 %167
  %169 = getelementptr inbounds i8, i8* %168, i64 -1
  %170 = load i8, i8* %169, align 1
  %171 = sext i8 %170 to i32
  switch i32 %171, label %206 [
    i32 101, label %._crit_edge
    i32 102, label %._crit_edge1
    i32 103, label %175
    i32 117, label %._crit_edge2
    i32 100, label %183
  ]

._crit_edge2:                                     ; preds = %159
  %pgocount9 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 2)
  %172 = add i64 %pgocount9, 1
  store i64 %172, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 2)
  br label %183

._crit_edge1:                                     ; preds = %159
  %pgocount10 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 1)
  %173 = add i64 %pgocount10, 1
  store i64 %173, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 1)
  br label %175

._crit_edge:                                      ; preds = %159
  %pgocount11 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 0)
  %174 = add i64 %pgocount11, 1
  store i64 %174, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 0)
  br label %175

; <label>:175:                                    ; preds = %._crit_edge, %._crit_edge1, %159
  %pgocount12 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 13)
  %176 = add i64 %pgocount12, 1
  store i64 %176, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 13)
  %177 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %178 = load i8*, i8** %16, align 8
  %179 = load i8*, i8** %17, align 8
  %180 = bitcast i8* %179 to double*
  %181 = load double, double* %180, align 8
  %182 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %177, i8* %178, double %181)
  br label %206

; <label>:183:                                    ; preds = %._crit_edge2, %159
  %184 = load i8*, i8** %19, align 8
  %185 = getelementptr inbounds i8, i8* %184, i64 1
  %186 = load i8, i8* %185, align 1
  %187 = sext i8 %186 to i32
  %188 = icmp eq i32 %187, 108
  br i1 %188, label %189, label %197

; <label>:189:                                    ; preds = %183
  %pgocount13 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 18)
  %190 = add i64 %pgocount13, 1
  store i64 %190, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 18)
  %191 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %192 = load i8*, i8** %16, align 8
  %193 = load i8*, i8** %17, align 8
  %194 = bitcast i8* %193 to i64*
  %195 = load i64, i64* %194, align 8
  %196 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %191, i8* %192, i64 %195)
  br label %205

; <label>:197:                                    ; preds = %183
  %pgocount14 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 19)
  %198 = add i64 %pgocount14, 1
  store i64 %198, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 19)
  %199 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %200 = load i8*, i8** %16, align 8
  %201 = load i8*, i8** %17, align 8
  %202 = bitcast i8* %201 to i32*
  %203 = load i32, i32* %202, align 4
  %204 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %199, i8* %200, i32 %203)
  br label %205

; <label>:205:                                    ; preds = %197, %189
  br label %206

; <label>:206:                                    ; preds = %205, %175, %159
  %pgocount15 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 9)
  %207 = add i64 %pgocount15, 1
  store i64 %207, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 9)
  %208 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %209 = load i8*, i8** %18, align 8
  %210 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %208, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0), i8* %209)
  br label %229

; <label>:211:                                    ; preds = %154
  %212 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %213 = load i8*, i8** %13, align 8
  %214 = load i8*, i8** %17, align 8
  %215 = bitcast i8* %214 to i8**
  %216 = load i8*, i8** %215, align 8
  %217 = icmp ne i8* %216, null
  br i1 %217, label %218, label %223

; <label>:218:                                    ; preds = %211
  %pgocount16 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 15)
  %219 = add i64 %pgocount16, 1
  store i64 %219, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 15)
  %220 = load i8*, i8** %17, align 8
  %221 = bitcast i8* %220 to i8**
  %222 = load i8*, i8** %221, align 8
  br label %225

; <label>:223:                                    ; preds = %211
  %pgocount17 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 17)
  %224 = add i64 %pgocount17, 1
  store i64 %224, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 17)
  br label %225

; <label>:225:                                    ; preds = %223, %218
  %226 = phi i8* [ %222, %218 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i32 0, i32 0), %223 ]
  %227 = load i8*, i8** %18, align 8
  %228 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %212, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i32 0, i32 0), i8* %213, i8* %226, i8* %227)
  br label %229

; <label>:229:                                    ; preds = %225, %206
  br label %243

; <label>:230:                                    ; preds = %151
  %pgocount18 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 11)
  %231 = add i64 %pgocount18, 1
  store i64 %231, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 11)
  %232 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %233 = load i8*, i8** %13, align 8
  %234 = load i8*, i8** %17, align 8
  %235 = bitcast i8* %234 to i32*
  %236 = load i32, i32* %235, align 4
  %237 = icmp ne i32 %236, 0
  %238 = zext i1 %237 to i64
  %pgocount19 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 42)
  %239 = add i64 %pgocount19, %238
  store i64 %239, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 42)
  %240 = select i1 %237, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0)
  %241 = load i8*, i8** %18, align 8
  %242 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %232, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.7, i32 0, i32 0), i8* %233, i8* %240, i8* %241)
  br label %243

; <label>:243:                                    ; preds = %230, %229
  br label %430

; <label>:244:                                    ; preds = %136
  %245 = load i32, i32* %15, align 4
  %246 = icmp sgt i32 %245, 1
  br i1 %246, label %247, label %336

; <label>:247:                                    ; preds = %244
  %248 = load i32, i32* %14, align 4
  %249 = icmp ne i32 %248, 0
  br i1 %249, label %334, label %250

; <label>:250:                                    ; preds = %247
  %pgocount20 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 12)
  %251 = add i64 %pgocount20, 1
  store i64 %251, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 12)
  %252 = load i8*, i8** %10, align 8
  %253 = load i8*, i8** %13, align 8
  %254 = call i32 @strcmp(i8* %252, i8* %253) #5
  %255 = icmp ne i32 %254, 0
  br i1 %255, label %334, label %256

; <label>:256:                                    ; preds = %250
  %257 = load i8*, i8** %16, align 8
  %258 = icmp ne i8* %257, null
  br i1 %258, label %259, label %309

; <label>:259:                                    ; preds = %256
  %260 = load i32, i32* %8, align 4
  %261 = load i32, i32* %12, align 4
  %262 = add nsw i32 %260, %261
  %263 = load i32, i32* %5, align 4
  %264 = icmp slt i32 %262, %263
  br i1 %264, label %265, label %300

; <label>:265:                                    ; preds = %259
  %266 = load i8**, i8*** %6, align 8
  %267 = load i32, i32* %8, align 4
  %268 = load i32, i32* %12, align 4
  %269 = add nsw i32 %268, 1
  store i32 %269, i32* %12, align 4
  %270 = add nsw i32 %267, %268
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds i8*, i8** %266, i64 %271
  %273 = load i8*, i8** %272, align 8
  store i8* %273, i8** %20, align 8
  %274 = load i8*, i8** %16, align 8
  %275 = call i8* @strchr(i8* %274, i32 37) #5
  %276 = icmp ne i8* %275, null
  br i1 %276, label %277, label %294

; <label>:277:                                    ; preds = %265
  %278 = load i8*, i8** %20, align 8
  %279 = load i8*, i8** %16, align 8
  %280 = load i8*, i8** %17, align 8
  %281 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %278, i8* %279, i8* %280) #1
  %282 = icmp ne i32 %281, 1
  br i1 %282, label %283, label %292

; <label>:283:                                    ; preds = %277
  %pgocount21 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 38)
  %284 = add i64 %pgocount21, 1
  store i64 %284, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 38)
  %285 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %286 = load i8**, i8*** %6, align 8
  %287 = getelementptr inbounds i8*, i8** %286, i64 0
  %288 = load i8*, i8** %287, align 8
  %289 = load i8*, i8** %20, align 8
  %290 = load i8*, i8** %13, align 8
  %291 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %285, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.10, i32 0, i32 0), i8* %288, i8* %289, i8* %290)
  br label %292

; <label>:292:                                    ; preds = %283, %277
  %pgocount22 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 33)
  %293 = add i64 %pgocount22, 1
  store i64 %293, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 33)
  br label %299

; <label>:294:                                    ; preds = %265
  %pgocount23 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 37)
  %295 = add i64 %pgocount23, 1
  store i64 %295, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 37)
  %296 = load i8*, i8** %20, align 8
  %297 = load i8*, i8** %17, align 8
  %298 = bitcast i8* %297 to i8**
  store i8* %296, i8** %298, align 8
  br label %299

; <label>:299:                                    ; preds = %294, %292
  br label %308

; <label>:300:                                    ; preds = %259
  %pgocount24 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 29)
  %301 = add i64 %pgocount24, 1
  store i64 %301, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 29)
  %302 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %303 = load i8**, i8*** %6, align 8
  %304 = getelementptr inbounds i8*, i8** %303, i64 0
  %305 = load i8*, i8** %304, align 8
  %306 = load i8*, i8** %13, align 8
  %307 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %302, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.11, i32 0, i32 0), i8* %305, i8* %306)
  br label %308

; <label>:308:                                    ; preds = %300, %299
  br label %327

; <label>:309:                                    ; preds = %256
  %310 = load i32, i32* %11, align 4
  %311 = icmp eq i32 %310, 43
  br i1 %311, label %312, label %316

; <label>:312:                                    ; preds = %309
  %pgocount25 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 34)
  %313 = add i64 %pgocount25, 1
  store i64 %313, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 34)
  %314 = load i8*, i8** %17, align 8
  %315 = bitcast i8* %314 to i32*
  store i32 1, i32* %315, align 4
  br label %326

; <label>:316:                                    ; preds = %309
  %pgocount26 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 35)
  %317 = add i64 %pgocount26, 1
  store i64 %317, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 35)
  %318 = load i8*, i8** %17, align 8
  %319 = bitcast i8* %318 to i32*
  %320 = load i32, i32* %319, align 4
  %321 = icmp ne i32 %320, 0
  %322 = xor i1 %321, true
  %323 = zext i1 %322 to i32
  %324 = load i8*, i8** %17, align 8
  %325 = bitcast i8* %324 to i32*
  store i32 %323, i32* %325, align 4
  br label %326

; <label>:326:                                    ; preds = %316, %312
  br label %327

; <label>:327:                                    ; preds = %326, %308
  %328 = load i32, i32* %14, align 4
  %329 = add nsw i32 %328, 1
  store i32 %329, i32* %14, align 4
  %330 = load i32, i32* %15, align 4
  %331 = load i8*, i8** %10, align 8
  %332 = sext i32 %330 to i64
  %333 = getelementptr inbounds i8, i8* %331, i64 %332
  store i8* %333, i8** %10, align 8
  br label %431

; <label>:334:                                    ; preds = %250, %247
  %pgocount27 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 7)
  %335 = add i64 %pgocount27, 1
  store i64 %335, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 7)
  br label %429

; <label>:336:                                    ; preds = %244
  %337 = load i8*, i8** %10, align 8
  %338 = load i8, i8* %337, align 1
  %339 = sext i8 %338 to i32
  %340 = load i8*, i8** %13, align 8
  %341 = load i8, i8* %340, align 1
  %342 = sext i8 %341 to i32
  %343 = icmp eq i32 %339, %342
  br i1 %343, label %344, label %427

; <label>:344:                                    ; preds = %336
  %345 = load i8*, i8** %16, align 8
  %346 = icmp ne i8* %345, null
  br i1 %346, label %347, label %397

; <label>:347:                                    ; preds = %344
  %348 = load i32, i32* %8, align 4
  %349 = load i32, i32* %12, align 4
  %350 = add nsw i32 %348, %349
  %351 = load i32, i32* %5, align 4
  %352 = icmp slt i32 %350, %351
  br i1 %352, label %353, label %388

; <label>:353:                                    ; preds = %347
  %354 = load i8**, i8*** %6, align 8
  %355 = load i32, i32* %8, align 4
  %356 = load i32, i32* %12, align 4
  %357 = add nsw i32 %356, 1
  store i32 %357, i32* %12, align 4
  %358 = add nsw i32 %355, %356
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds i8*, i8** %354, i64 %359
  %361 = load i8*, i8** %360, align 8
  store i8* %361, i8** %21, align 8
  %362 = load i8*, i8** %16, align 8
  %363 = call i8* @strchr(i8* %362, i32 37) #5
  %364 = icmp ne i8* %363, null
  br i1 %364, label %365, label %382

; <label>:365:                                    ; preds = %353
  %366 = load i8*, i8** %21, align 8
  %367 = load i8*, i8** %16, align 8
  %368 = load i8*, i8** %17, align 8
  %369 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %366, i8* %367, i8* %368) #1
  %370 = icmp ne i32 %369, 1
  br i1 %370, label %371, label %380

; <label>:371:                                    ; preds = %365
  %pgocount28 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 32)
  %372 = add i64 %pgocount28, 1
  store i64 %372, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 32)
  %373 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %374 = load i8**, i8*** %6, align 8
  %375 = getelementptr inbounds i8*, i8** %374, i64 0
  %376 = load i8*, i8** %375, align 8
  %377 = load i8*, i8** %21, align 8
  %378 = load i8*, i8** %13, align 8
  %379 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %373, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.10, i32 0, i32 0), i8* %376, i8* %377, i8* %378)
  br label %380

; <label>:380:                                    ; preds = %371, %365
  %pgocount29 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 25)
  %381 = add i64 %pgocount29, 1
  store i64 %381, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 25)
  br label %387

; <label>:382:                                    ; preds = %353
  %pgocount30 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 30)
  %383 = add i64 %pgocount30, 1
  store i64 %383, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 30)
  %384 = load i8*, i8** %21, align 8
  %385 = load i8*, i8** %17, align 8
  %386 = bitcast i8* %385 to i8**
  store i8* %384, i8** %386, align 8
  br label %387

; <label>:387:                                    ; preds = %382, %380
  br label %396

; <label>:388:                                    ; preds = %347
  %pgocount31 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 22)
  %389 = add i64 %pgocount31, 1
  store i64 %389, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 22)
  %390 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %391 = load i8**, i8*** %6, align 8
  %392 = getelementptr inbounds i8*, i8** %391, i64 0
  %393 = load i8*, i8** %392, align 8
  %394 = load i8*, i8** %13, align 8
  %395 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %390, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.11, i32 0, i32 0), i8* %393, i8* %394)
  br label %396

; <label>:396:                                    ; preds = %388, %387
  br label %422

; <label>:397:                                    ; preds = %344
  %398 = load i8*, i8** %16, align 8
  %399 = icmp ne i8* %398, null
  br i1 %399, label %404, label %400

; <label>:400:                                    ; preds = %397
  %pgocount32 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 28)
  %401 = add i64 %pgocount32, 1
  store i64 %401, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 28)
  %402 = load i32, i32* %11, align 4
  %403 = icmp eq i32 %402, 43
  br i1 %403, label %404, label %411

; <label>:404:                                    ; preds = %400, %397
  %pgocount33 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 23)
  %405 = add i64 %pgocount33, 1
  store i64 %405, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 23)
  %406 = load i32, i32* %11, align 4
  %407 = icmp eq i32 %406, 43
  %408 = zext i1 %407 to i32
  %409 = load i8*, i8** %17, align 8
  %410 = bitcast i8* %409 to i32*
  store i32 %408, i32* %410, align 4
  br label %421

; <label>:411:                                    ; preds = %400
  %pgocount34 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 36)
  %412 = add i64 %pgocount34, 1
  store i64 %412, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 36)
  %413 = load i8*, i8** %17, align 8
  %414 = bitcast i8* %413 to i32*
  %415 = load i32, i32* %414, align 4
  %416 = icmp ne i32 %415, 0
  %417 = xor i1 %416, true
  %418 = zext i1 %417 to i32
  %419 = load i8*, i8** %17, align 8
  %420 = bitcast i8* %419 to i32*
  store i32 %418, i32* %420, align 4
  br label %421

; <label>:421:                                    ; preds = %411, %404
  br label %422

; <label>:422:                                    ; preds = %421, %396
  %423 = load i32, i32* %14, align 4
  %424 = add nsw i32 %423, 1
  store i32 %424, i32* %14, align 4
  %425 = load i8*, i8** %10, align 8
  %426 = getelementptr inbounds i8, i8* %425, i32 1
  store i8* %426, i8** %10, align 8
  br label %431

; <label>:427:                                    ; preds = %336
  %pgocount35 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 8)
  %428 = add i64 %pgocount35, 1
  store i64 %428, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 8)
  br label %429

; <label>:429:                                    ; preds = %427, %334
  br label %430

; <label>:430:                                    ; preds = %429, %243
  br label %57

; <label>:431:                                    ; preds = %422, %327, %74
  %432 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %433 = bitcast %struct.__va_list_tag* %432 to i8*
  call void @llvm.va_end(i8* %433)
  %434 = load i32, i32* %14, align 4
  %435 = icmp ne i32 %434, 0
  br i1 %435, label %438, label %436

; <label>:436:                                    ; preds = %431
  %pgocount36 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 27)
  %437 = add i64 %pgocount36, 1
  store i64 %437, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 27)
  store i32 0, i32* %12, align 4
  br label %440

; <label>:438:                                    ; preds = %431
  %pgocount37 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 16)
  %439 = add i64 %pgocount37, 1
  store i64 %439, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 16)
  br label %50

; <label>:440:                                    ; preds = %436, %50
  %441 = load i32, i32* %12, align 4
  %442 = icmp ne i32 %441, 0
  br i1 %442, label %443, label %470

; <label>:443:                                    ; preds = %440
  %pgocount38 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 26)
  %444 = add i64 %pgocount38, 1
  store i64 %444, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 26)
  %445 = load i32, i32* %12, align 4
  %446 = load i32, i32* %5, align 4
  %447 = sub nsw i32 %446, %445
  store i32 %447, i32* %5, align 4
  %448 = load i32, i32* %8, align 4
  store i32 %448, i32* %22, align 4
  br label %449

; <label>:449:                                    ; preds = %465, %443
  %450 = load i32, i32* %22, align 4
  %451 = load i32, i32* %5, align 4
  %452 = icmp sle i32 %450, %451
  br i1 %452, label %453, label %469

; <label>:453:                                    ; preds = %449
  %454 = load i8**, i8*** %6, align 8
  %455 = load i32, i32* %22, align 4
  %456 = load i32, i32* %12, align 4
  %457 = add nsw i32 %455, %456
  %458 = sext i32 %457 to i64
  %459 = getelementptr inbounds i8*, i8** %454, i64 %458
  %460 = load i8*, i8** %459, align 8
  %461 = load i8**, i8*** %6, align 8
  %462 = load i32, i32* %22, align 4
  %463 = sext i32 %462 to i64
  %464 = getelementptr inbounds i8*, i8** %461, i64 %463
  store i8* %460, i8** %464, align 8
  br label %465

; <label>:465:                                    ; preds = %453
  %pgocount39 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 14)
  %466 = add i64 %pgocount39, 1
  store i64 %466, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 14)
  %467 = load i32, i32* %22, align 4
  %468 = add nsw i32 %467, 1
  store i32 %468, i32* %22, align 4
  br label %449

; <label>:469:                                    ; preds = %449
  br label %474

; <label>:470:                                    ; preds = %440
  %pgocount40 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 31)
  %471 = add i64 %pgocount40, 1
  store i64 %471, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 31)
  %472 = load i32, i32* %8, align 4
  %473 = add nsw i32 %472, 1
  store i32 %473, i32* %8, align 4
  br label %474

; <label>:474:                                    ; preds = %470, %469
  br label %479

; <label>:475:                                    ; preds = %45, %27
  %pgocount41 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 21)
  %476 = add i64 %pgocount41, 1
  store i64 %476, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 21)
  %477 = load i32, i32* %8, align 4
  %478 = add nsw i32 %477, 1
  store i32 %478, i32* %8, align 4
  br label %479

; <label>:479:                                    ; preds = %475, %474
  br label %23

; <label>:480:                                    ; preds = %23
  %481 = load i32, i32* @help_only, align 4
  %482 = icmp ne i32 %481, 0
  br i1 %482, label %483, label %491

; <label>:483:                                    ; preds = %480
  %pgocount42 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 40)
  %484 = add i64 %pgocount42, 1
  store i64 %484, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 40)
  %485 = load i32, i32* %9, align 4
  %486 = icmp ne i32 %485, 0
  br i1 %486, label %487, label %491

; <label>:487:                                    ; preds = %483
  %pgocount43 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 41)
  %488 = add i64 %pgocount43, 1
  store i64 %488, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 41)
  %489 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %490 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %489, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  br label %491

; <label>:491:                                    ; preds = %487, %483, %480
  %pgocount44 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 39)
  %492 = add i64 %pgocount44, 1
  store i64 %492, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_getargs, i64 0, i64 39)
  %493 = load i32, i32* %5, align 4
  ret i32 %493
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #2

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #4

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
