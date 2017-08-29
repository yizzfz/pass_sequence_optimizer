; ModuleID = 'tmp1.ll'
source_filename = "bf.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

$__llvm_profile_raw_version = comdat any

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [45 x i8] c"Usage: blowfish {e|d} <intput> <output> key\0A\00", align 1
@.str.1 = private unnamed_addr constant [37 x i8] c"key must be in hexadecimal notation\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Bad key value.\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 317195555792, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [6 x i8] c"\04\00main", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca %struct.bf_key_st, align 8
  %7 = alloca [32 x i8], align 16
  %8 = alloca [40 x i8], align 16
  %9 = alloca [40 x i8], align 16
  %10 = alloca [32 x i8], align 16
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i8, align 1
  %17 = alloca %struct._IO_FILE*, align 8
  %18 = alloca %struct._IO_FILE*, align 8
  %19 = alloca %struct._IO_FILE*, align 8
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca i32, align 4
  %23 = alloca [32 x i8], align 16
  %24 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %25 = bitcast [32 x i8]* %10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %25, i8 0, i64 32, i32 16, i1 false)
  store i32 0, i32* %11, align 4
  store i32 0, i32* %12, align 4
  store i32 0, i32* %13, align 4
  store i32 -1, i32* %14, align 4
  store %struct._IO_FILE* null, %struct._IO_FILE** %19, align 8
  %26 = load i32, i32* %4, align 4
  %27 = icmp slt i32 %26, 3
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 17)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 17)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:32:                                     ; preds = %2
  %33 = load i8**, i8*** %5, align 8
  %34 = getelementptr inbounds i8*, i8** %33, i64 1
  %35 = load i8*, i8** %34, align 8
  %36 = load i8, i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp eq i32 %37, 101
  br i1 %38, label %47, label %39

; <label>:39:                                     ; preds = %32
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 11)
  %40 = add i64 %pgocount5, 1
  store i64 %40, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 11)
  %41 = load i8**, i8*** %5, align 8
  %42 = getelementptr inbounds i8*, i8** %41, i64 1
  %43 = load i8*, i8** %42, align 8
  %44 = load i8, i8* %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 69
  br i1 %46, label %47, label %48

; <label>:47:                                     ; preds = %39, %32
  store i32 1, i32* %14, align 4
  br label %70

; <label>:48:                                     ; preds = %39
  %49 = load i8**, i8*** %5, align 8
  %50 = getelementptr inbounds i8*, i8** %49, i64 1
  %51 = load i8*, i8** %50, align 8
  %52 = load i8, i8* %51, align 1
  %53 = sext i8 %52 to i32
  %54 = icmp eq i32 %53, 100
  br i1 %54, label %63, label %55

; <label>:55:                                     ; preds = %48
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 14)
  %56 = add i64 %pgocount6, 1
  store i64 %56, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 14)
  %57 = load i8**, i8*** %5, align 8
  %58 = getelementptr inbounds i8*, i8** %57, i64 1
  %59 = load i8*, i8** %58, align 8
  %60 = load i8, i8* %59, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp eq i32 %61, 68
  br i1 %62, label %63, label %64

; <label>:63:                                     ; preds = %55, %48
  store i32 0, i32* %14, align 4
  br label %68

; <label>:64:                                     ; preds = %55
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 21)
  %65 = add i64 %pgocount7, 1
  store i64 %65, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 21)
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %67 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %66, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:68:                                     ; preds = %63
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 13)
  %69 = add i64 %pgocount8, 1
  store i64 %69, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 13)
  br label %70

; <label>:70:                                     ; preds = %68, %47
  %71 = load i8**, i8*** %5, align 8
  %72 = getelementptr inbounds i8*, i8** %71, i64 4
  %73 = load i8*, i8** %72, align 8
  store i8* %73, i8** %15, align 8
  br label %74

; <label>:74:                                     ; preds = %145, %70
  %75 = load i32, i32* %13, align 4
  %76 = icmp slt i32 %75, 64
  br i1 %76, label %77, label %83

; <label>:77:                                     ; preds = %74
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 5)
  %78 = add i64 %pgocount9, 1
  store i64 %78, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 5)
  %79 = load i8*, i8** %15, align 8
  %80 = load i8, i8* %79, align 1
  %81 = sext i8 %80 to i32
  %82 = icmp ne i32 %81, 0
  br label %83

; <label>:83:                                     ; preds = %77, %74
  %84 = phi i1 [ false, %74 ], [ %82, %77 ]
  br i1 %84, label %85, label %146

; <label>:85:                                     ; preds = %83
  %86 = load i8*, i8** %15, align 8
  %87 = getelementptr inbounds i8, i8* %86, i32 1
  store i8* %87, i8** %15, align 8
  %88 = load i8, i8* %86, align 1
  %89 = sext i8 %88 to i32
  %90 = call i32 @toupper(i32 %89) #8
  %91 = trunc i32 %90 to i8
  store i8 %91, i8* %16, align 1
  %92 = load i8, i8* %16, align 1
  %93 = sext i8 %92 to i32
  %94 = icmp sge i32 %93, 48
  br i1 %94, label %96, label %._crit_edge1

._crit_edge1:                                     ; preds = %85
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 6)
  %95 = add i64 %pgocount10, 1
  store i64 %95, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 6)
  br label %109

; <label>:96:                                     ; preds = %85
  %97 = load i8, i8* %16, align 1
  %98 = sext i8 %97 to i32
  %99 = icmp sle i32 %98, 57
  br i1 %99, label %101, label %._crit_edge3

._crit_edge3:                                     ; preds = %96
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 9)
  %100 = add i64 %pgocount11, 1
  store i64 %100, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 9)
  br label %109

; <label>:101:                                    ; preds = %96
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 8)
  %102 = add i64 %pgocount12, 1
  store i64 %102, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 8)
  %103 = load i32, i32* %12, align 4
  %104 = shl i32 %103, 4
  %105 = load i8, i8* %16, align 1
  %106 = sext i8 %105 to i32
  %107 = add nsw i32 %104, %106
  %108 = sub nsw i32 %107, 48
  store i32 %108, i32* %12, align 4
  br label %130

; <label>:109:                                    ; preds = %._crit_edge3, %._crit_edge1
  %110 = load i8, i8* %16, align 1
  %111 = sext i8 %110 to i32
  %112 = icmp sge i32 %111, 65
  br i1 %112, label %113, label %126

; <label>:113:                                    ; preds = %109
  %114 = load i8, i8* %16, align 1
  %115 = sext i8 %114 to i32
  %116 = icmp sle i32 %115, 70
  br i1 %116, label %118, label %._crit_edge4

._crit_edge4:                                     ; preds = %113
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 15)
  %117 = add i64 %pgocount13, 1
  store i64 %117, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 15)
  br label %126

; <label>:118:                                    ; preds = %113
  %119 = load i32, i32* %12, align 4
  %120 = shl i32 %119, 4
  %121 = load i8, i8* %16, align 1
  %122 = sext i8 %121 to i32
  %123 = add nsw i32 %120, %122
  %124 = sub nsw i32 %123, 65
  %125 = add nsw i32 %124, 10
  store i32 %125, i32* %12, align 4
  br label %129

; <label>:126:                                    ; preds = %._crit_edge4, %109
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 16)
  %127 = add i64 %pgocount14, 1
  store i64 %127, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 16)
  %128 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:129:                                    ; preds = %118
  br label %130

; <label>:130:                                    ; preds = %129, %101
  %131 = load i32, i32* %13, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %13, align 4
  %133 = and i32 %131, 1
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %136, label %._crit_edge2

._crit_edge2:                                     ; preds = %130
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 7)
  %135 = add i64 %pgocount15, 1
  store i64 %135, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 7)
  br label %145

; <label>:136:                                    ; preds = %130
  %137 = load i32, i32* %12, align 4
  %138 = and i32 %137, 255
  %139 = trunc i32 %138 to i8
  %140 = load i32, i32* %13, align 4
  %141 = sdiv i32 %140, 2
  %142 = sub nsw i32 %141, 1
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [32 x i8], [32 x i8]* %7, i64 0, i64 %143
  store i8 %139, i8* %144, align 1
  br label %145

; <label>:145:                                    ; preds = %._crit_edge2, %136
  br label %74

; <label>:146:                                    ; preds = %83
  %147 = getelementptr inbounds [32 x i8], [32 x i8]* %7, i32 0, i32 0
  call void @BF_set_key(%struct.bf_key_st* %6, i32 8, i8* %147)
  %148 = load i8*, i8** %15, align 8
  %149 = load i8, i8* %148, align 1
  %150 = icmp ne i8 %149, 0
  br i1 %150, label %151, label %154

; <label>:151:                                    ; preds = %146
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 18)
  %152 = add i64 %pgocount16, 1
  store i64 %152, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 18)
  %153 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:154:                                    ; preds = %146
  %155 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %155, %struct._IO_FILE** %19, align 8
  %156 = icmp eq %struct._IO_FILE* %155, null
  br i1 %156, label %157, label %161

; <label>:157:                                    ; preds = %154
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 12)
  %158 = add i64 %pgocount17, 1
  store i64 %158, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 12)
  %159 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %160 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %159, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i32 0, i32 0))
  store i32 1, i32* %3, align 4
  br label %258

; <label>:161:                                    ; preds = %154
  %162 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %163 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %162, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i64* %21)
  %164 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %165 = call i32 @fclose(%struct._IO_FILE* %164)
  %166 = load i8**, i8*** %5, align 8
  %167 = getelementptr inbounds i8*, i8** %166, i64 2
  %168 = load i8*, i8** %167, align 8
  %169 = call %struct._IO_FILE* @fopen(i8* %168, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %169, %struct._IO_FILE** %17, align 8
  %170 = icmp eq %struct._IO_FILE* %169, null
  br i1 %170, label %171, label %175

; <label>:171:                                    ; preds = %161
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 19)
  %172 = add i64 %pgocount18, 1
  store i64 %172, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 19)
  %173 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %174 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %173, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:175:                                    ; preds = %161
  %176 = load i8**, i8*** %5, align 8
  %177 = getelementptr inbounds i8*, i8** %176, i64 3
  %178 = load i8*, i8** %177, align 8
  %179 = call %struct._IO_FILE* @fopen(i8* %178, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0))
  store %struct._IO_FILE* %179, %struct._IO_FILE** %18, align 8
  %180 = icmp eq %struct._IO_FILE* %179, null
  br i1 %180, label %181, label %185

; <label>:181:                                    ; preds = %175
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 20)
  %182 = add i64 %pgocount19, 1
  store i64 %182, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 20)
  %183 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %184 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %183, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:185:                                    ; preds = %175
  store i32 0, i32* %13, align 4
  br label %186

; <label>:186:                                    ; preds = %251, %185
  %187 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %188 = call i32 @feof(%struct._IO_FILE* %187) #6
  %189 = icmp ne i32 %188, 0
  %190 = xor i1 %189, true
  br i1 %190, label %191, label %252

; <label>:191:                                    ; preds = %186
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 4)
  %192 = add i64 %pgocount20, 1
  store i64 %192, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 4)
  br label %193

; <label>:193:                                    ; preds = %203, %191
  %194 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %195 = call i32 @feof(%struct._IO_FILE* %194) #6
  %196 = icmp ne i32 %195, 0
  br i1 %196, label %._crit_edge, label %198

._crit_edge:                                      ; preds = %193
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 0)
  %197 = add i64 %pgocount21, 1
  store i64 %197, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 0)
  br label %201

; <label>:198:                                    ; preds = %193
  %199 = load i32, i32* %13, align 4
  %200 = icmp slt i32 %199, 40
  br label %201

; <label>:201:                                    ; preds = %._crit_edge, %198
  %202 = phi i1 [ false, %._crit_edge ], [ %200, %198 ]
  br i1 %202, label %203, label %212

; <label>:203:                                    ; preds = %201
  %pgocount22 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 1)
  %204 = add i64 %pgocount22, 1
  store i64 %204, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 1)
  %205 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %206 = call i32 @_IO_getc(%struct._IO_FILE* %205)
  %207 = trunc i32 %206 to i8
  %208 = load i32, i32* %13, align 4
  %209 = add nsw i32 %208, 1
  store i32 %209, i32* %13, align 4
  %210 = sext i32 %208 to i64
  %211 = getelementptr inbounds [40 x i8], [40 x i8]* %8, i64 0, i64 %210
  store i8 %207, i8* %211, align 1
  br label %193

; <label>:212:                                    ; preds = %201
  %213 = load i32, i32* %11, align 4
  store i32 %213, i32* %22, align 4
  %214 = getelementptr inbounds [32 x i8], [32 x i8]* %23, i32 0, i32 0
  %215 = getelementptr inbounds [32 x i8], [32 x i8]* %10, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %214, i8* %215, i64 32, i32 16, i1 false)
  store i64 0, i64* %20, align 8
  br label %216

; <label>:216:                                    ; preds = %230, %212
  %217 = load i64, i64* %20, align 8
  %218 = load i64, i64* %21, align 8
  %219 = icmp slt i64 %217, %218
  br i1 %219, label %220, label %234

; <label>:220:                                    ; preds = %216
  %221 = load i32, i32* %22, align 4
  store i32 %221, i32* %11, align 4
  %222 = getelementptr inbounds [32 x i8], [32 x i8]* %10, i32 0, i32 0
  %223 = getelementptr inbounds [32 x i8], [32 x i8]* %23, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %222, i8* %223, i64 32, i32 16, i1 false)
  %224 = getelementptr inbounds [40 x i8], [40 x i8]* %8, i32 0, i32 0
  %225 = getelementptr inbounds [40 x i8], [40 x i8]* %9, i32 0, i32 0
  %226 = load i32, i32* %13, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [32 x i8], [32 x i8]* %10, i32 0, i32 0
  %229 = load i32, i32* %14, align 4
  call void @BF_cfb64_encrypt(i8* %224, i8* %225, i64 %227, %struct.bf_key_st* %6, i8* %228, i32* %11, i32 %229)
  br label %230

; <label>:230:                                    ; preds = %220
  %pgocount23 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 2)
  %231 = add i64 %pgocount23, 1
  store i64 %231, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 2)
  %232 = load i64, i64* %20, align 8
  %233 = add nsw i64 %232, 1
  store i64 %233, i64* %20, align 8
  br label %216

; <label>:234:                                    ; preds = %216
  store i32 0, i32* %24, align 4
  br label %235

; <label>:235:                                    ; preds = %247, %234
  %236 = load i32, i32* %24, align 4
  %237 = load i32, i32* %13, align 4
  %238 = icmp slt i32 %236, %237
  br i1 %238, label %239, label %251

; <label>:239:                                    ; preds = %235
  %240 = load i32, i32* %24, align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [40 x i8], [40 x i8]* %9, i64 0, i64 %241
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %246 = call i32 @fputc(i32 %244, %struct._IO_FILE* %245)
  br label %247

; <label>:247:                                    ; preds = %239
  %pgocount24 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 3)
  %248 = add i64 %pgocount24, 1
  store i64 %248, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 3)
  %249 = load i32, i32* %24, align 4
  %250 = add nsw i32 %249, 1
  store i32 %250, i32* %24, align 4
  br label %235

; <label>:251:                                    ; preds = %235
  store i32 0, i32* %13, align 4
  br label %186

; <label>:252:                                    ; preds = %186
  %pgocount25 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 10)
  %253 = add i64 %pgocount25, 1
  store i64 %253, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 10)
  %254 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %255 = call i32 @fclose(%struct._IO_FILE* %254)
  %256 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %257 = call i32 @fclose(%struct._IO_FILE* %256)
  store i32 0, i32* %3, align 4
  br label %258

; <label>:258:                                    ; preds = %252, %157
  %259 = load i32, i32* %3, align 4
  ret i32 %259
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #4

declare i32 @printf(i8*, ...) #2

declare void @BF_set_key(%struct.bf_key_st*, i32, i8*) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #5

declare i32 @_IO_getc(%struct._IO_FILE*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

declare void @BF_cfb64_encrypt(i8*, i8*, i64, %struct.bf_key_st*, i8*, i32*, i32) #2

declare i32 @fputc(i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
