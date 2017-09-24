; ModuleID = 'makedent.ll'
source_filename = "makedent.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashheader = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i8], [13 x i8], i8, i8, i8, [228 x i16], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [128 x i8], [100 x [11 x i8]], [100 x i32], [100 x i32], i16 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.strchartype = type { i8*, i8*, i8* }
%struct.dent = type { %struct.dent*, i8*, [1 x i64] }

@hashheader = external global %struct.hashheader, align 4
@cbench_print = external global i32, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [51 x i8] c"\0D\0AWord '%s' too long at line %d of %s, truncated\0D\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"makedent.c\00", align 1
@.str.2 = private unnamed_addr constant [42 x i8] c"\0D\0AWord '%s' contains illegal characters\0D\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"\0D\0ACouldn't allocate space for word '%s'\0D\0A\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"\0D\0AIllegal affix flag character '%c'\0D\0A\00", align 1
@defdupchar = external global i32, align 4
@laststringch = external global i32, align 4
@strtosichar.out = internal global [184 x i8] zeroinitializer, align 16
@ichartosstr.out = internal global [184 x i8] zeroinitializer, align 16
@printichar.out = internal global [11 x i8] zeroinitializer, align 1
@chartypes = external global %struct.strchartype*, align 8
@.str.5 = private unnamed_addr constant [4 x i8] c"tex\00", align 1
@has_marker = internal global i32 0, align 4
@.str.6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @makedent(i8*, i32, %struct.dent*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.dent*, align 8
  %8 = alloca [120 x i8], align 16
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.dent* %2, %struct.dent** %7, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = call i64 @strlen(i8* %13) #5
  %15 = sub i64 %14, 1
  %16 = trunc i64 %15 to i32
  store i32 %16, i32* %12, align 4
  %17 = load i8*, i8** %5, align 8
  %18 = load i32, i32* %12, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8* %17, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 10
  br i1 %23, label %24, label %29

; <label>:24:                                     ; preds = %3
  %25 = load i8*, i8** %5, align 8
  %26 = load i32, i32* %12, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, i8* %25, i64 %27
  store i8 0, i8* %28, align 1
  br label %29

; <label>:29:                                     ; preds = %24, %3
  %30 = load %struct.dent*, %struct.dent** %7, align 8
  %31 = getelementptr inbounds %struct.dent, %struct.dent* %30, i32 0, i32 0
  store %struct.dent* null, %struct.dent** %31, align 8
  %32 = load %struct.dent*, %struct.dent** %7, align 8
  %33 = getelementptr inbounds %struct.dent, %struct.dent* %32, i32 0, i32 2
  %34 = getelementptr inbounds [1 x i64], [1 x i64]* %33, i64 0, i64 0
  store i64 0, i64* %34, align 8
  %35 = load %struct.dent*, %struct.dent** %7, align 8
  %36 = getelementptr inbounds %struct.dent, %struct.dent* %35, i32 0, i32 2
  %37 = getelementptr inbounds [1 x i64], [1 x i64]* %36, i32 0, i32 0
  %38 = bitcast i64* %37 to i8*
  call void @llvm.memset.p0i8.i64(i8* %38, i8 0, i64 8, i32 8, i1 false)
  %39 = load %struct.dent*, %struct.dent** %7, align 8
  %40 = getelementptr inbounds %struct.dent, %struct.dent* %39, i32 0, i32 2
  %41 = getelementptr inbounds [1 x i64], [1 x i64]* %40, i64 0, i64 0
  %42 = load i64, i64* %41, align 8
  %43 = or i64 %42, 67108864
  store i64 %43, i64* %41, align 8
  %44 = load %struct.dent*, %struct.dent** %7, align 8
  %45 = getelementptr inbounds %struct.dent, %struct.dent* %44, i32 0, i32 2
  %46 = getelementptr inbounds [1 x i64], [1 x i64]* %45, i64 0, i64 0
  %47 = load i64, i64* %46, align 8
  %48 = and i64 %47, -134217729
  store i64 %48, i64* %46, align 8
  %49 = load i8*, i8** %5, align 8
  %50 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %51 = sext i8 %50 to i32
  %52 = call i8* @index(i8* %49, i32 %51) #5
  store i8* %52, i8** %10, align 8
  %53 = load i8*, i8** %10, align 8
  %54 = icmp ne i8* %53, null
  br i1 %54, label %55, label %57

; <label>:55:                                     ; preds = %29
  %56 = load i8*, i8** %10, align 8
  store i8 0, i8* %56, align 1
  br label %57

; <label>:57:                                     ; preds = %55, %29
  %58 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %59 = load i8*, i8** %5, align 8
  %60 = call i32 @strtoichar(i8* %58, i8* %59, i32 100, i32 1)
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %68, label %62

; <label>:62:                                     ; preds = %57
  %63 = load i8*, i8** %5, align 8
  %64 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %65 = load i32, i32* %6, align 4
  %66 = call i32 @ichartostr(i8* %63, i8* %64, i32 %65, i32 1)
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %76

; <label>:68:                                     ; preds = %62, %57
  %69 = load i32, i32* @cbench_print, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %75

; <label>:71:                                     ; preds = %68
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %73 = load i8*, i8** %5, align 8
  %74 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %72, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i8* %73, i32 156, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %75

; <label>:75:                                     ; preds = %71, %68
  store i32 -1, i32* %4, align 4
  br label %237

; <label>:76:                                     ; preds = %62
  %77 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  store i8* %77, i8** %9, align 8
  br label %78

; <label>:78:                                     ; preds = %117, %76
  %79 = load i8*, i8** %9, align 8
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %120

; <label>:83:                                     ; preds = %78
  %84 = load i8*, i8** %9, align 8
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i64
  %87 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 23), i64 0, i64 %86
  %88 = load i8, i8* %87, align 1
  %89 = icmp ne i8 %88, 0
  br i1 %89, label %116, label %90

; <label>:90:                                     ; preds = %83
  %91 = load i8*, i8** %9, align 8
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i64
  %94 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 26), i64 0, i64 %93
  %95 = load i8, i8* %94, align 1
  %96 = icmp ne i8 %95, 0
  br i1 %96, label %97, label %107

; <label>:97:                                     ; preds = %90
  %98 = load i8*, i8** %9, align 8
  %99 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %100 = icmp eq i8* %98, %99
  br i1 %100, label %107, label %101

; <label>:101:                                    ; preds = %97
  %102 = load i8*, i8** %9, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 1
  %104 = load i8, i8* %103, align 1
  %105 = zext i8 %104 to i32
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %107, label %115

; <label>:107:                                    ; preds = %101, %97, %90
  %108 = load i32, i32* @cbench_print, align 4
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %114

; <label>:110:                                    ; preds = %107
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %112 = load i8*, i8** %5, align 8
  %113 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %111, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.2, i32 0, i32 0), i8* %112)
  br label %114

; <label>:114:                                    ; preds = %110, %107
  store i32 -1, i32* %4, align 4
  br label %237

; <label>:115:                                    ; preds = %101
  br label %116

; <label>:116:                                    ; preds = %115, %83
  br label %117

; <label>:117:                                    ; preds = %116
  %118 = load i8*, i8** %9, align 8
  %119 = getelementptr inbounds i8, i8* %118, i32 1
  store i8* %119, i8** %9, align 8
  br label %78

; <label>:120:                                    ; preds = %78
  %121 = load i8*, i8** %5, align 8
  %122 = call i64 @strlen(i8* %121) #5
  %123 = trunc i64 %122 to i32
  store i32 %123, i32* %12, align 4
  %124 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %125 = call i64 @whatcap(i8* %124)
  %126 = load %struct.dent*, %struct.dent** %7, align 8
  %127 = getelementptr inbounds %struct.dent, %struct.dent* %126, i32 0, i32 2
  %128 = getelementptr inbounds [1 x i64], [1 x i64]* %127, i64 0, i64 0
  %129 = load i64, i64* %128, align 8
  %130 = or i64 %129, %125
  store i64 %130, i64* %128, align 8
  %131 = load i32, i32* %12, align 4
  %132 = icmp sgt i32 %131, 99
  br i1 %132, label %133, label %141

; <label>:133:                                    ; preds = %120
  %134 = load i32, i32* @cbench_print, align 4
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %136, label %140

; <label>:136:                                    ; preds = %133
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %138 = load i8*, i8** %5, align 8
  %139 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %137, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i8* %138, i32 186, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %140

; <label>:140:                                    ; preds = %136, %133
  store i32 -1, i32* %4, align 4
  br label %237

; <label>:141:                                    ; preds = %120
  %142 = load i32, i32* %12, align 4
  %143 = add i32 %142, 1
  %144 = call i8* @mymalloc(i32 %143)
  %145 = load %struct.dent*, %struct.dent** %7, align 8
  %146 = getelementptr inbounds %struct.dent, %struct.dent* %145, i32 0, i32 1
  store i8* %144, i8** %146, align 8
  %147 = load %struct.dent*, %struct.dent** %7, align 8
  %148 = getelementptr inbounds %struct.dent, %struct.dent* %147, i32 0, i32 1
  %149 = load i8*, i8** %148, align 8
  %150 = icmp eq i8* %149, null
  br i1 %150, label %151, label %159

; <label>:151:                                    ; preds = %141
  %152 = load i32, i32* @cbench_print, align 4
  %153 = icmp ne i32 %152, 0
  br i1 %153, label %154, label %158

; <label>:154:                                    ; preds = %151
  %155 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %156 = load i8*, i8** %5, align 8
  %157 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %155, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), i8* %156)
  br label %158

; <label>:158:                                    ; preds = %154, %151
  store i32 -1, i32* %4, align 4
  br label %237

; <label>:159:                                    ; preds = %141
  %160 = load %struct.dent*, %struct.dent** %7, align 8
  %161 = getelementptr inbounds %struct.dent, %struct.dent* %160, i32 0, i32 1
  %162 = load i8*, i8** %161, align 8
  %163 = load i8*, i8** %5, align 8
  %164 = call i8* @strcpy(i8* %162, i8* %163) #6
  %165 = load %struct.dent*, %struct.dent** %7, align 8
  %166 = getelementptr inbounds %struct.dent, %struct.dent* %165, i32 0, i32 2
  %167 = getelementptr inbounds [1 x i64], [1 x i64]* %166, i64 0, i64 0
  %168 = load i64, i64* %167, align 8
  %169 = and i64 %168, 805306368
  %170 = icmp ne i64 %169, 805306368
  br i1 %170, label %171, label %175

; <label>:171:                                    ; preds = %159
  %172 = load %struct.dent*, %struct.dent** %7, align 8
  %173 = getelementptr inbounds %struct.dent, %struct.dent* %172, i32 0, i32 1
  %174 = load i8*, i8** %173, align 8
  call void @chupcase(i8* %174)
  br label %175

; <label>:175:                                    ; preds = %171, %159
  %176 = load i8*, i8** %10, align 8
  %177 = icmp eq i8* %176, null
  br i1 %177, label %178, label %179

; <label>:178:                                    ; preds = %175
  store i32 0, i32* %4, align 4
  br label %237

; <label>:179:                                    ; preds = %175
  %180 = load i8*, i8** %10, align 8
  %181 = getelementptr inbounds i8, i8* %180, i32 1
  store i8* %181, i8** %10, align 8
  br label %182

; <label>:182:                                    ; preds = %235, %179
  %183 = load i8*, i8** %10, align 8
  %184 = load i8, i8* %183, align 1
  %185 = sext i8 %184 to i32
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %187, label %192

; <label>:187:                                    ; preds = %182
  %188 = load i8*, i8** %10, align 8
  %189 = load i8, i8* %188, align 1
  %190 = sext i8 %189 to i32
  %191 = icmp ne i32 %190, 10
  br label %192

; <label>:192:                                    ; preds = %187, %182
  %193 = phi i1 [ false, %182 ], [ %191, %187 ]
  br i1 %193, label %194, label %236

; <label>:194:                                    ; preds = %192
  %195 = load i8*, i8** %10, align 8
  %196 = load i8, i8* %195, align 1
  %197 = zext i8 %196 to i32
  %198 = sub nsw i32 %197, 65
  store i32 %198, i32* %11, align 4
  %199 = load i32, i32* %11, align 4
  %200 = icmp sge i32 %199, 0
  br i1 %200, label %201, label %213

; <label>:201:                                    ; preds = %194
  %202 = load i32, i32* %11, align 4
  %203 = icmp sle i32 %202, 26
  br i1 %203, label %204, label %213

; <label>:204:                                    ; preds = %201
  %205 = load i32, i32* %11, align 4
  %206 = zext i32 %205 to i64
  %207 = shl i64 1, %206
  %208 = load %struct.dent*, %struct.dent** %7, align 8
  %209 = getelementptr inbounds %struct.dent, %struct.dent* %208, i32 0, i32 2
  %210 = getelementptr inbounds [1 x i64], [1 x i64]* %209, i64 0, i64 0
  %211 = load i64, i64* %210, align 8
  %212 = or i64 %211, %207
  store i64 %212, i64* %210, align 8
  br label %223

; <label>:213:                                    ; preds = %201, %194
  %214 = load i32, i32* @cbench_print, align 4
  %215 = icmp ne i32 %214, 0
  br i1 %215, label %216, label %222

; <label>:216:                                    ; preds = %213
  %217 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %218 = load i8*, i8** %10, align 8
  %219 = load i8, i8* %218, align 1
  %220 = zext i8 %219 to i32
  %221 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %217, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0), i32 %220)
  br label %222

; <label>:222:                                    ; preds = %216, %213
  br label %223

; <label>:223:                                    ; preds = %222, %204
  %224 = load i8*, i8** %10, align 8
  %225 = getelementptr inbounds i8, i8* %224, i32 1
  store i8* %225, i8** %10, align 8
  %226 = load i8*, i8** %10, align 8
  %227 = load i8, i8* %226, align 1
  %228 = sext i8 %227 to i32
  %229 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %230 = sext i8 %229 to i32
  %231 = icmp eq i32 %228, %230
  br i1 %231, label %232, label %235

; <label>:232:                                    ; preds = %223
  %233 = load i8*, i8** %10, align 8
  %234 = getelementptr inbounds i8, i8* %233, i32 1
  store i8* %234, i8** %10, align 8
  br label %235

; <label>:235:                                    ; preds = %232, %223
  br label %182

; <label>:236:                                    ; preds = %192
  store i32 0, i32* %4, align 4
  br label %237

; <label>:237:                                    ; preds = %236, %178, %158, %140, %114, %75
  %238 = load i32, i32* %4, align 4
  ret i32 %238
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: nounwind readonly
declare i8* @index(i8*, i32) #1

; Function Attrs: noinline nounwind uwtable
define i32 @strtoichar(i8*, i8*, i32, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %10 = load i32, i32* %7, align 4
  %11 = sext i32 %10 to i64
  %12 = udiv i64 %11, 1
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %7, align 4
  br label %14

; <label>:14:                                     ; preds = %60, %4
  %15 = load i32, i32* %7, align 4
  %16 = add nsw i32 %15, -1
  store i32 %16, i32* %7, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %14
  %19 = load i8*, i8** %6, align 8
  %20 = load i8, i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp ne i32 %21, 0
  br label %23

; <label>:23:                                     ; preds = %18, %14
  %24 = phi i1 [ false, %14 ], [ %22, %18 ]
  br i1 %24, label %25, label %65

; <label>:25:                                     ; preds = %23
  store i32 1, i32* %9, align 4
  %26 = load i8*, i8** %6, align 8
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i64
  %29 = getelementptr inbounds [128 x i8], [128 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 27), i64 0, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %43

; <label>:33:                                     ; preds = %25
  %34 = load i8*, i8** %6, align 8
  %35 = load i32, i32* %8, align 4
  %36 = call i32 @stringcharlen(i8* %34, i32 %35)
  store i32 %36, i32* %9, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %39

; <label>:38:                                     ; preds = %33
  br label %40

; <label>:39:                                     ; preds = %33
  store i32 1, i32* %9, align 4
  br label %40

; <label>:40:                                     ; preds = %39, %38
  %41 = phi i32 [ 1, %38 ], [ 0, %39 ]
  %42 = icmp ne i32 %41, 0
  br label %43

; <label>:43:                                     ; preds = %40, %25
  %44 = phi i1 [ false, %25 ], [ %42, %40 ]
  br i1 %44, label %45, label %51

; <label>:45:                                     ; preds = %43
  %46 = load i32, i32* @laststringch, align 4
  %47 = add i32 128, %46
  %48 = trunc i32 %47 to i8
  %49 = load i8*, i8** %5, align 8
  %50 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %50, i8** %5, align 8
  store i8 %48, i8* %49, align 1
  br label %59

; <label>:51:                                     ; preds = %43
  %52 = load i8*, i8** %6, align 8
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  %55 = and i32 %54, 127
  %56 = trunc i32 %55 to i8
  %57 = load i8*, i8** %5, align 8
  %58 = getelementptr inbounds i8, i8* %57, i32 1
  store i8* %58, i8** %5, align 8
  store i8 %56, i8* %57, align 1
  br label %59

; <label>:59:                                     ; preds = %51, %45
  br label %60

; <label>:60:                                     ; preds = %59
  %61 = load i32, i32* %9, align 4
  %62 = load i8*, i8** %6, align 8
  %63 = sext i32 %61 to i64
  %64 = getelementptr inbounds i8, i8* %62, i64 %63
  store i8* %64, i8** %6, align 8
  br label %14

; <label>:65:                                     ; preds = %23
  %66 = load i8*, i8** %5, align 8
  store i8 0, i8* %66, align 1
  %67 = load i32, i32* %7, align 4
  %68 = icmp sle i32 %67, 0
  %69 = zext i1 %68 to i32
  ret i32 %69
}

; Function Attrs: noinline nounwind uwtable
define i32 @ichartostr(i8*, i8*, i32, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  br label %12

; <label>:12:                                     ; preds = %78, %4
  %13 = load i32, i32* %7, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, i32* %7, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %22

; <label>:16:                                     ; preds = %12
  %17 = load i8*, i8** %6, align 8
  %18 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %18, i8** %6, align 8
  %19 = load i8, i8* %17, align 1
  %20 = zext i8 %19 to i32
  store i32 %20, i32* %9, align 4
  %21 = icmp ne i32 %20, 0
  br label %22

; <label>:22:                                     ; preds = %16, %12
  %23 = phi i1 [ false, %12 ], [ %21, %16 ]
  br i1 %23, label %24, label %79

; <label>:24:                                     ; preds = %22
  %25 = load i32, i32* %9, align 4
  %26 = icmp slt i32 %25, 128
  br i1 %26, label %27, label %32

; <label>:27:                                     ; preds = %24
  %28 = load i32, i32* %9, align 4
  %29 = trunc i32 %28 to i8
  %30 = load i8*, i8** %5, align 8
  %31 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %31, i8** %5, align 8
  store i8 %29, i8* %30, align 1
  br label %78

; <label>:32:                                     ; preds = %24
  %33 = load i32, i32* %9, align 4
  %34 = sub nsw i32 %33, 128
  store i32 %34, i32* %9, align 4
  %35 = load i32, i32* %8, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %61, label %37

; <label>:37:                                     ; preds = %32
  %38 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 12), align 4
  store i32 %38, i32* %10, align 4
  br label %39

; <label>:39:                                     ; preds = %59, %37
  %40 = load i32, i32* %10, align 4
  %41 = add nsw i32 %40, -1
  store i32 %41, i32* %10, align 4
  %42 = icmp sge i32 %41, 0
  br i1 %42, label %43, label %60

; <label>:43:                                     ; preds = %39
  %44 = load i32, i32* %10, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [100 x i32], [100 x i32]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 30), i64 0, i64 %45
  %47 = load i32, i32* %46, align 4
  %48 = load i32, i32* @defdupchar, align 4
  %49 = icmp eq i32 %47, %48
  br i1 %49, label %50, label %59

; <label>:50:                                     ; preds = %43
  %51 = load i32, i32* %10, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [100 x i32], [100 x i32]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 29), i64 0, i64 %52
  %54 = load i32, i32* %53, align 4
  %55 = load i32, i32* %9, align 4
  %56 = icmp eq i32 %54, %55
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %50
  %58 = load i32, i32* %10, align 4
  store i32 %58, i32* %9, align 4
  br label %60

; <label>:59:                                     ; preds = %50, %43
  br label %39

; <label>:60:                                     ; preds = %57, %39
  br label %61

; <label>:61:                                     ; preds = %60, %32
  %62 = load i32, i32* %9, align 4
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds [100 x [11 x i8]], [100 x [11 x i8]]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 28), i64 0, i64 %63
  %65 = getelementptr inbounds [11 x i8], [11 x i8]* %64, i32 0, i32 0
  store i8* %65, i8** %11, align 8
  br label %66

; <label>:66:                                     ; preds = %74, %61
  %67 = load i8*, i8** %11, align 8
  %68 = getelementptr inbounds i8, i8* %67, i32 1
  store i8* %68, i8** %11, align 8
  %69 = load i8, i8* %67, align 1
  %70 = load i8*, i8** %5, align 8
  %71 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %71, i8** %5, align 8
  store i8 %69, i8* %70, align 1
  %72 = sext i8 %69 to i32
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %75

; <label>:74:                                     ; preds = %66
  br label %66

; <label>:75:                                     ; preds = %66
  %76 = load i8*, i8** %5, align 8
  %77 = getelementptr inbounds i8, i8* %76, i32 -1
  store i8* %77, i8** %5, align 8
  br label %78

; <label>:78:                                     ; preds = %75, %27
  br label %12

; <label>:79:                                     ; preds = %22
  %80 = load i8*, i8** %5, align 8
  store i8 0, i8* %80, align 1
  %81 = load i32, i32* %7, align 4
  %82 = icmp sle i32 %81, 0
  %83 = zext i1 %82 to i32
  ret i32 %83
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define i64 @whatcap(i8*) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %5 = load i8*, i8** %3, align 8
  store i8* %5, i8** %4, align 8
  br label %6

; <label>:6:                                      ; preds = %19, %1
  %7 = load i8*, i8** %4, align 8
  %8 = load i8, i8* %7, align 1
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %10, label %22

; <label>:10:                                     ; preds = %6
  %11 = load i8*, i8** %4, align 8
  %12 = load i8, i8* %11, align 1
  %13 = zext i8 %12 to i64
  %14 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 25), i64 0, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %10
  br label %22

; <label>:18:                                     ; preds = %10
  br label %19

; <label>:19:                                     ; preds = %18
  %20 = load i8*, i8** %4, align 8
  %21 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %21, i8** %4, align 8
  br label %6

; <label>:22:                                     ; preds = %17, %6
  %23 = load i8*, i8** %4, align 8
  %24 = load i8, i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %22
  store i64 268435456, i64* %2, align 8
  br label %81

; <label>:28:                                     ; preds = %22
  br label %29

; <label>:29:                                     ; preds = %42, %28
  %30 = load i8*, i8** %4, align 8
  %31 = load i8, i8* %30, align 1
  %32 = icmp ne i8 %31, 0
  br i1 %32, label %33, label %45

; <label>:33:                                     ; preds = %29
  %34 = load i8*, i8** %4, align 8
  %35 = load i8, i8* %34, align 1
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = icmp ne i8 %38, 0
  br i1 %39, label %40, label %41

; <label>:40:                                     ; preds = %33
  br label %45

; <label>:41:                                     ; preds = %33
  br label %42

; <label>:42:                                     ; preds = %41
  %43 = load i8*, i8** %4, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %4, align 8
  br label %29

; <label>:45:                                     ; preds = %40, %29
  %46 = load i8*, i8** %4, align 8
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %80

; <label>:50:                                     ; preds = %45
  %51 = load i8*, i8** %3, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 0
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i64
  %55 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = icmp ne i8 %56, 0
  br i1 %57, label %58, label %79

; <label>:58:                                     ; preds = %50
  %59 = load i8*, i8** %3, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 1
  store i8* %60, i8** %4, align 8
  br label %61

; <label>:61:                                     ; preds = %75, %58
  %62 = load i8*, i8** %4, align 8
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i32
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %78

; <label>:66:                                     ; preds = %61
  %67 = load i8*, i8** %4, align 8
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i64
  %70 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %69
  %71 = load i8, i8* %70, align 1
  %72 = icmp ne i8 %71, 0
  br i1 %72, label %73, label %74

; <label>:73:                                     ; preds = %66
  store i64 805306368, i64* %2, align 8
  br label %81

; <label>:74:                                     ; preds = %66
  br label %75

; <label>:75:                                     ; preds = %74
  %76 = load i8*, i8** %4, align 8
  %77 = getelementptr inbounds i8, i8* %76, i32 1
  store i8* %77, i8** %4, align 8
  br label %61

; <label>:78:                                     ; preds = %61
  store i64 536870912, i64* %2, align 8
  br label %81

; <label>:79:                                     ; preds = %50
  store i64 0, i64* %2, align 8
  br label %81

; <label>:80:                                     ; preds = %45
  store i64 805306368, i64* %2, align 8
  br label %81

; <label>:81:                                     ; preds = %80, %79, %78, %73, %27
  %82 = load i64, i64* %2, align 8
  ret i64 %82
}

declare i8* @mymalloc(i32) #3

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define void @chupcase(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i8* @strtosichar(i8* %4, i32 1)
  store i8* %5, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  call void @upcase(i8* %6)
  %7 = load i8*, i8** %2, align 8
  %8 = load i8*, i8** %3, align 8
  %9 = load i8*, i8** %2, align 8
  %10 = call i64 @strlen(i8* %9) #5
  %11 = add i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = call i32 @ichartostr(i8* %7, i8* %8, i32 %12, i32 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @addvheader(%struct.dent*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.dent*, align 8
  %4 = alloca %struct.dent*, align 8
  store %struct.dent* %0, %struct.dent** %3, align 8
  %5 = call i8* @mymalloc(i32 24)
  %6 = bitcast i8* %5 to %struct.dent*
  store %struct.dent* %6, %struct.dent** %4, align 8
  %7 = load %struct.dent*, %struct.dent** %4, align 8
  %8 = icmp eq %struct.dent* %7, null
  br i1 %8, label %9, label %19

; <label>:9:                                      ; preds = %1
  %10 = load i32, i32* @cbench_print, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %18

; <label>:12:                                     ; preds = %9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = load %struct.dent*, %struct.dent** %3, align 8
  %15 = getelementptr inbounds %struct.dent, %struct.dent* %14, i32 0, i32 1
  %16 = load i8*, i8** %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), i8* %16)
  br label %18

; <label>:18:                                     ; preds = %12, %9
  store i32 -1, i32* %2, align 4
  br label %84

; <label>:19:                                     ; preds = %1
  %20 = load %struct.dent*, %struct.dent** %4, align 8
  %21 = load %struct.dent*, %struct.dent** %3, align 8
  %22 = bitcast %struct.dent* %20 to i8*
  %23 = bitcast %struct.dent* %21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %23, i64 24, i32 8, i1 false)
  %24 = load %struct.dent*, %struct.dent** %4, align 8
  %25 = getelementptr inbounds %struct.dent, %struct.dent* %24, i32 0, i32 2
  %26 = getelementptr inbounds [1 x i64], [1 x i64]* %25, i64 0, i64 0
  %27 = load i64, i64* %26, align 8
  %28 = and i64 %27, 805306368
  %29 = icmp ne i64 %28, 805306368
  br i1 %29, label %30, label %33

; <label>:30:                                     ; preds = %19
  %31 = load %struct.dent*, %struct.dent** %4, align 8
  %32 = getelementptr inbounds %struct.dent, %struct.dent* %31, i32 0, i32 1
  store i8* null, i8** %32, align 8
  br label %67

; <label>:33:                                     ; preds = %19
  %34 = load %struct.dent*, %struct.dent** %4, align 8
  %35 = getelementptr inbounds %struct.dent, %struct.dent* %34, i32 0, i32 1
  %36 = load i8*, i8** %35, align 8
  %37 = call i64 @strlen(i8* %36) #5
  %38 = trunc i64 %37 to i32
  %39 = add i32 %38, 1
  %40 = call i8* @mymalloc(i32 %39)
  %41 = load %struct.dent*, %struct.dent** %4, align 8
  %42 = getelementptr inbounds %struct.dent, %struct.dent* %41, i32 0, i32 1
  store i8* %40, i8** %42, align 8
  %43 = load %struct.dent*, %struct.dent** %4, align 8
  %44 = getelementptr inbounds %struct.dent, %struct.dent* %43, i32 0, i32 1
  %45 = load i8*, i8** %44, align 8
  %46 = icmp eq i8* %45, null
  br i1 %46, label %47, label %59

; <label>:47:                                     ; preds = %33
  %48 = load i32, i32* @cbench_print, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %56

; <label>:50:                                     ; preds = %47
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = load %struct.dent*, %struct.dent** %3, align 8
  %53 = getelementptr inbounds %struct.dent, %struct.dent* %52, i32 0, i32 1
  %54 = load i8*, i8** %53, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), i8* %54)
  br label %56

; <label>:56:                                     ; preds = %50, %47
  %57 = load %struct.dent*, %struct.dent** %4, align 8
  %58 = bitcast %struct.dent* %57 to i8*
  call void @myfree(i8* %58)
  store i32 -1, i32* %2, align 4
  br label %84

; <label>:59:                                     ; preds = %33
  %60 = load %struct.dent*, %struct.dent** %4, align 8
  %61 = getelementptr inbounds %struct.dent, %struct.dent* %60, i32 0, i32 1
  %62 = load i8*, i8** %61, align 8
  %63 = load %struct.dent*, %struct.dent** %3, align 8
  %64 = getelementptr inbounds %struct.dent, %struct.dent* %63, i32 0, i32 1
  %65 = load i8*, i8** %64, align 8
  %66 = call i8* @strcpy(i8* %62, i8* %65) #6
  br label %67

; <label>:67:                                     ; preds = %59, %30
  %68 = load %struct.dent*, %struct.dent** %3, align 8
  %69 = getelementptr inbounds %struct.dent, %struct.dent* %68, i32 0, i32 1
  %70 = load i8*, i8** %69, align 8
  call void @chupcase(i8* %70)
  %71 = load %struct.dent*, %struct.dent** %4, align 8
  %72 = load %struct.dent*, %struct.dent** %3, align 8
  %73 = getelementptr inbounds %struct.dent, %struct.dent* %72, i32 0, i32 0
  store %struct.dent* %71, %struct.dent** %73, align 8
  %74 = load %struct.dent*, %struct.dent** %3, align 8
  %75 = getelementptr inbounds %struct.dent, %struct.dent* %74, i32 0, i32 2
  %76 = getelementptr inbounds [1 x i64], [1 x i64]* %75, i64 0, i64 0
  %77 = load i64, i64* %76, align 8
  %78 = and i64 %77, -805306369
  store i64 %78, i64* %76, align 8
  %79 = load %struct.dent*, %struct.dent** %3, align 8
  %80 = getelementptr inbounds %struct.dent, %struct.dent* %79, i32 0, i32 2
  %81 = getelementptr inbounds [1 x i64], [1 x i64]* %80, i64 0, i64 0
  %82 = load i64, i64* %81, align 8
  %83 = or i64 %82, 1342177280
  store i64 %83, i64* %81, align 8
  store i32 0, i32* %2, align 4
  br label %84

; <label>:84:                                     ; preds = %67, %56, %18
  %85 = load i32, i32* %2, align 4
  ret i32 %85
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare void @myfree(i8*) #3

; Function Attrs: noinline nounwind uwtable
define i32 @combinecaps(%struct.dent*, %struct.dent*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.dent*, align 8
  %6 = alloca %struct.dent*, align 8
  %7 = alloca %struct.dent*, align 8
  %8 = alloca i32, align 4
  store %struct.dent* %0, %struct.dent** %4, align 8
  store %struct.dent* %1, %struct.dent** %5, align 8
  store i32 0, i32* %8, align 4
  %9 = load %struct.dent*, %struct.dent** %4, align 8
  store %struct.dent* %9, %struct.dent** %6, align 8
  %10 = load %struct.dent*, %struct.dent** %6, align 8
  %11 = getelementptr inbounds %struct.dent, %struct.dent* %10, i32 0, i32 2
  %12 = getelementptr inbounds [1 x i64], [1 x i64]* %11, i64 0, i64 0
  %13 = load i64, i64* %12, align 8
  %14 = and i64 %13, 1879048192
  %15 = icmp eq i64 %14, 1342177280
  br i1 %15, label %16, label %37

; <label>:16:                                     ; preds = %2
  br label %17

; <label>:17:                                     ; preds = %35, %16
  %18 = load %struct.dent*, %struct.dent** %6, align 8
  %19 = getelementptr inbounds %struct.dent, %struct.dent* %18, i32 0, i32 2
  %20 = getelementptr inbounds [1 x i64], [1 x i64]* %19, i64 0, i64 0
  %21 = load i64, i64* %20, align 8
  %22 = and i64 %21, 1073741824
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %36

; <label>:24:                                     ; preds = %17
  %25 = load %struct.dent*, %struct.dent** %6, align 8
  %26 = getelementptr inbounds %struct.dent, %struct.dent* %25, i32 0, i32 0
  %27 = load %struct.dent*, %struct.dent** %26, align 8
  store %struct.dent* %27, %struct.dent** %6, align 8
  %28 = load %struct.dent*, %struct.dent** %4, align 8
  %29 = load %struct.dent*, %struct.dent** %6, align 8
  %30 = load %struct.dent*, %struct.dent** %5, align 8
  %31 = call i32 @combine_two_entries(%struct.dent* %28, %struct.dent* %29, %struct.dent* %30)
  store i32 %31, i32* %8, align 4
  %32 = load i32, i32* %8, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %35

; <label>:34:                                     ; preds = %24
  br label %36

; <label>:35:                                     ; preds = %24
  br label %17

; <label>:36:                                     ; preds = %34, %17
  br label %42

; <label>:37:                                     ; preds = %2
  %38 = load %struct.dent*, %struct.dent** %4, align 8
  %39 = load %struct.dent*, %struct.dent** %6, align 8
  %40 = load %struct.dent*, %struct.dent** %5, align 8
  %41 = call i32 @combine_two_entries(%struct.dent* %38, %struct.dent* %39, %struct.dent* %40)
  store i32 %41, i32* %8, align 4
  br label %42

; <label>:42:                                     ; preds = %37, %36
  %43 = load i32, i32* %8, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %122

; <label>:45:                                     ; preds = %42
  %46 = load %struct.dent*, %struct.dent** %4, align 8
  %47 = load %struct.dent*, %struct.dent** %6, align 8
  %48 = load %struct.dent*, %struct.dent** %5, align 8
  call void @forcevheader(%struct.dent* %46, %struct.dent* %47, %struct.dent* %48)
  %49 = call i8* @mymalloc(i32 24)
  %50 = bitcast i8* %49 to %struct.dent*
  store %struct.dent* %50, %struct.dent** %7, align 8
  %51 = load %struct.dent*, %struct.dent** %7, align 8
  %52 = icmp eq %struct.dent* %51, null
  br i1 %52, label %53, label %63

; <label>:53:                                     ; preds = %45
  %54 = load i32, i32* @cbench_print, align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %62

; <label>:56:                                     ; preds = %53
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = load %struct.dent*, %struct.dent** %5, align 8
  %59 = getelementptr inbounds %struct.dent, %struct.dent* %58, i32 0, i32 1
  %60 = load i8*, i8** %59, align 8
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), i8* %60)
  br label %62

; <label>:62:                                     ; preds = %56, %53
  store i32 -1, i32* %3, align 4
  br label %124

; <label>:63:                                     ; preds = %45
  %64 = load %struct.dent*, %struct.dent** %7, align 8
  %65 = load %struct.dent*, %struct.dent** %5, align 8
  %66 = bitcast %struct.dent* %64 to i8*
  %67 = bitcast %struct.dent* %65 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %66, i8* %67, i64 24, i32 8, i1 false)
  %68 = load %struct.dent*, %struct.dent** %4, align 8
  %69 = getelementptr inbounds %struct.dent, %struct.dent* %68, i32 0, i32 0
  %70 = load %struct.dent*, %struct.dent** %69, align 8
  %71 = load %struct.dent*, %struct.dent** %7, align 8
  %72 = getelementptr inbounds %struct.dent, %struct.dent* %71, i32 0, i32 0
  store %struct.dent* %70, %struct.dent** %72, align 8
  %73 = load %struct.dent*, %struct.dent** %7, align 8
  %74 = load %struct.dent*, %struct.dent** %4, align 8
  %75 = getelementptr inbounds %struct.dent, %struct.dent* %74, i32 0, i32 0
  store %struct.dent* %73, %struct.dent** %75, align 8
  %76 = load %struct.dent*, %struct.dent** %4, align 8
  %77 = getelementptr inbounds %struct.dent, %struct.dent* %76, i32 0, i32 2
  %78 = getelementptr inbounds [1 x i64], [1 x i64]* %77, i64 0, i64 0
  %79 = load i64, i64* %78, align 8
  %80 = and i64 %79, 1073741824
  %81 = load %struct.dent*, %struct.dent** %7, align 8
  %82 = getelementptr inbounds %struct.dent, %struct.dent* %81, i32 0, i32 2
  %83 = getelementptr inbounds [1 x i64], [1 x i64]* %82, i64 0, i64 0
  %84 = load i64, i64* %83, align 8
  %85 = or i64 %84, %80
  store i64 %85, i64* %83, align 8
  %86 = load %struct.dent*, %struct.dent** %4, align 8
  %87 = getelementptr inbounds %struct.dent, %struct.dent* %86, i32 0, i32 2
  %88 = getelementptr inbounds [1 x i64], [1 x i64]* %87, i64 0, i64 0
  %89 = load i64, i64* %88, align 8
  %90 = or i64 %89, 1073741824
  store i64 %90, i64* %88, align 8
  %91 = load %struct.dent*, %struct.dent** %4, align 8
  %92 = load %struct.dent*, %struct.dent** %5, align 8
  call void @combineaffixes(%struct.dent* %91, %struct.dent* %92)
  %93 = load %struct.dent*, %struct.dent** %5, align 8
  %94 = getelementptr inbounds %struct.dent, %struct.dent* %93, i32 0, i32 2
  %95 = getelementptr inbounds [1 x i64], [1 x i64]* %94, i64 0, i64 0
  %96 = load i64, i64* %95, align 8
  %97 = and i64 %96, 134217728
  %98 = load %struct.dent*, %struct.dent** %4, align 8
  %99 = getelementptr inbounds %struct.dent, %struct.dent* %98, i32 0, i32 2
  %100 = getelementptr inbounds [1 x i64], [1 x i64]* %99, i64 0, i64 0
  %101 = load i64, i64* %100, align 8
  %102 = or i64 %101, %97
  store i64 %102, i64* %100, align 8
  %103 = load %struct.dent*, %struct.dent** %5, align 8
  %104 = getelementptr inbounds %struct.dent, %struct.dent* %103, i32 0, i32 2
  %105 = getelementptr inbounds [1 x i64], [1 x i64]* %104, i64 0, i64 0
  %106 = load i64, i64* %105, align 8
  %107 = and i64 %106, 805306368
  %108 = icmp eq i64 %107, 805306368
  br i1 %108, label %109, label %115

; <label>:109:                                    ; preds = %63
  %110 = load %struct.dent*, %struct.dent** %5, align 8
  %111 = getelementptr inbounds %struct.dent, %struct.dent* %110, i32 0, i32 1
  %112 = load i8*, i8** %111, align 8
  %113 = load %struct.dent*, %struct.dent** %7, align 8
  %114 = getelementptr inbounds %struct.dent, %struct.dent* %113, i32 0, i32 1
  store i8* %112, i8** %114, align 8
  br label %121

; <label>:115:                                    ; preds = %63
  %116 = load %struct.dent*, %struct.dent** %7, align 8
  %117 = getelementptr inbounds %struct.dent, %struct.dent* %116, i32 0, i32 1
  store i8* null, i8** %117, align 8
  %118 = load %struct.dent*, %struct.dent** %5, align 8
  %119 = getelementptr inbounds %struct.dent, %struct.dent* %118, i32 0, i32 1
  %120 = load i8*, i8** %119, align 8
  call void @myfree(i8* %120)
  br label %121

; <label>:121:                                    ; preds = %115, %109
  br label %122

; <label>:122:                                    ; preds = %121, %42
  %123 = load i32, i32* %8, align 4
  store i32 %123, i32* %3, align 4
  br label %124

; <label>:124:                                    ; preds = %122, %62
  %125 = load i32, i32* %3, align 4
  ret i32 %125
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @combine_two_entries(%struct.dent*, %struct.dent*, %struct.dent*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.dent*, align 8
  %6 = alloca %struct.dent*, align 8
  %7 = alloca %struct.dent*, align 8
  store %struct.dent* %0, %struct.dent** %5, align 8
  store %struct.dent* %1, %struct.dent** %6, align 8
  store %struct.dent* %2, %struct.dent** %7, align 8
  %8 = load %struct.dent*, %struct.dent** %6, align 8
  %9 = load %struct.dent*, %struct.dent** %7, align 8
  %10 = call i32 @acoversb(%struct.dent* %8, %struct.dent* %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %38

; <label>:12:                                     ; preds = %3
  %13 = load %struct.dent*, %struct.dent** %6, align 8
  %14 = load %struct.dent*, %struct.dent** %7, align 8
  call void @combineaffixes(%struct.dent* %13, %struct.dent* %14)
  %15 = load %struct.dent*, %struct.dent** %7, align 8
  %16 = getelementptr inbounds %struct.dent, %struct.dent* %15, i32 0, i32 2
  %17 = getelementptr inbounds [1 x i64], [1 x i64]* %16, i64 0, i64 0
  %18 = load i64, i64* %17, align 8
  %19 = and i64 %18, 134217728
  %20 = load %struct.dent*, %struct.dent** %6, align 8
  %21 = getelementptr inbounds %struct.dent, %struct.dent* %20, i32 0, i32 2
  %22 = getelementptr inbounds [1 x i64], [1 x i64]* %21, i64 0, i64 0
  %23 = load i64, i64* %22, align 8
  %24 = or i64 %23, %19
  store i64 %24, i64* %22, align 8
  %25 = load %struct.dent*, %struct.dent** %7, align 8
  %26 = getelementptr inbounds %struct.dent, %struct.dent* %25, i32 0, i32 2
  %27 = getelementptr inbounds [1 x i64], [1 x i64]* %26, i64 0, i64 0
  %28 = load i64, i64* %27, align 8
  %29 = and i64 %28, 134217728
  %30 = load %struct.dent*, %struct.dent** %5, align 8
  %31 = getelementptr inbounds %struct.dent, %struct.dent* %30, i32 0, i32 2
  %32 = getelementptr inbounds [1 x i64], [1 x i64]* %31, i64 0, i64 0
  %33 = load i64, i64* %32, align 8
  %34 = or i64 %33, %29
  store i64 %34, i64* %32, align 8
  %35 = load %struct.dent*, %struct.dent** %7, align 8
  %36 = getelementptr inbounds %struct.dent, %struct.dent* %35, i32 0, i32 1
  %37 = load i8*, i8** %36, align 8
  call void @myfree(i8* %37)
  store i32 1, i32* %4, align 4
  br label %114

; <label>:38:                                     ; preds = %3
  %39 = load %struct.dent*, %struct.dent** %7, align 8
  %40 = load %struct.dent*, %struct.dent** %6, align 8
  %41 = call i32 @acoversb(%struct.dent* %39, %struct.dent* %40)
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %113

; <label>:43:                                     ; preds = %38
  %44 = load %struct.dent*, %struct.dent** %7, align 8
  %45 = load %struct.dent*, %struct.dent** %6, align 8
  call void @combineaffixes(%struct.dent* %44, %struct.dent* %45)
  %46 = load %struct.dent*, %struct.dent** %6, align 8
  %47 = getelementptr inbounds %struct.dent, %struct.dent* %46, i32 0, i32 2
  %48 = getelementptr inbounds [1 x i64], [1 x i64]* %47, i64 0, i64 0
  %49 = load i64, i64* %48, align 8
  %50 = and i64 %49, 1207959552
  %51 = load %struct.dent*, %struct.dent** %7, align 8
  %52 = getelementptr inbounds %struct.dent, %struct.dent* %51, i32 0, i32 2
  %53 = getelementptr inbounds [1 x i64], [1 x i64]* %52, i64 0, i64 0
  %54 = load i64, i64* %53, align 8
  %55 = or i64 %54, %50
  store i64 %55, i64* %53, align 8
  %56 = load %struct.dent*, %struct.dent** %7, align 8
  %57 = getelementptr inbounds %struct.dent, %struct.dent* %56, i32 0, i32 2
  %58 = getelementptr inbounds [1 x i64], [1 x i64]* %57, i64 0, i64 0
  %59 = load i64, i64* %58, align 8
  %60 = and i64 %59, 134217728
  %61 = load %struct.dent*, %struct.dent** %5, align 8
  %62 = getelementptr inbounds %struct.dent, %struct.dent* %61, i32 0, i32 2
  %63 = getelementptr inbounds [1 x i64], [1 x i64]* %62, i64 0, i64 0
  %64 = load i64, i64* %63, align 8
  %65 = or i64 %64, %60
  store i64 %65, i64* %63, align 8
  %66 = load %struct.dent*, %struct.dent** %6, align 8
  %67 = getelementptr inbounds %struct.dent, %struct.dent* %66, i32 0, i32 0
  %68 = load %struct.dent*, %struct.dent** %67, align 8
  %69 = load %struct.dent*, %struct.dent** %7, align 8
  %70 = getelementptr inbounds %struct.dent, %struct.dent* %69, i32 0, i32 0
  store %struct.dent* %68, %struct.dent** %70, align 8
  %71 = load %struct.dent*, %struct.dent** %6, align 8
  %72 = getelementptr inbounds %struct.dent, %struct.dent* %71, i32 0, i32 1
  %73 = load i8*, i8** %72, align 8
  %74 = icmp ne i8* %73, null
  br i1 %74, label %75, label %83

; <label>:75:                                     ; preds = %43
  %76 = load %struct.dent*, %struct.dent** %6, align 8
  %77 = getelementptr inbounds %struct.dent, %struct.dent* %76, i32 0, i32 1
  %78 = load i8*, i8** %77, align 8
  %79 = load %struct.dent*, %struct.dent** %7, align 8
  %80 = getelementptr inbounds %struct.dent, %struct.dent* %79, i32 0, i32 1
  %81 = load i8*, i8** %80, align 8
  %82 = call i8* @strcpy(i8* %78, i8* %81) #6
  br label %83

; <label>:83:                                     ; preds = %75, %43
  %84 = load %struct.dent*, %struct.dent** %7, align 8
  %85 = getelementptr inbounds %struct.dent, %struct.dent* %84, i32 0, i32 1
  %86 = load i8*, i8** %85, align 8
  call void @myfree(i8* %86)
  %87 = load %struct.dent*, %struct.dent** %6, align 8
  %88 = getelementptr inbounds %struct.dent, %struct.dent* %87, i32 0, i32 1
  %89 = load i8*, i8** %88, align 8
  %90 = load %struct.dent*, %struct.dent** %7, align 8
  %91 = getelementptr inbounds %struct.dent, %struct.dent* %90, i32 0, i32 1
  store i8* %89, i8** %91, align 8
  %92 = load %struct.dent*, %struct.dent** %6, align 8
  %93 = load %struct.dent*, %struct.dent** %7, align 8
  %94 = bitcast %struct.dent* %92 to i8*
  %95 = bitcast %struct.dent* %93 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %94, i8* %95, i64 24, i32 8, i1 false)
  %96 = load %struct.dent*, %struct.dent** %7, align 8
  %97 = getelementptr inbounds %struct.dent, %struct.dent* %96, i32 0, i32 2
  %98 = getelementptr inbounds [1 x i64], [1 x i64]* %97, i64 0, i64 0
  %99 = load i64, i64* %98, align 8
  %100 = and i64 %99, 805306368
  %101 = icmp eq i64 %100, 805306368
  br i1 %101, label %102, label %112

; <label>:102:                                    ; preds = %83
  %103 = load %struct.dent*, %struct.dent** %5, align 8
  %104 = getelementptr inbounds %struct.dent, %struct.dent* %103, i32 0, i32 2
  %105 = getelementptr inbounds [1 x i64], [1 x i64]* %104, i64 0, i64 0
  %106 = load i64, i64* %105, align 8
  %107 = and i64 %106, 1879048192
  %108 = icmp ne i64 %107, 1342177280
  br i1 %108, label %109, label %112

; <label>:109:                                    ; preds = %102
  %110 = load %struct.dent*, %struct.dent** %5, align 8
  %111 = call i32 @addvheader(%struct.dent* %110)
  br label %112

; <label>:112:                                    ; preds = %109, %102, %83
  store i32 1, i32* %4, align 4
  br label %114

; <label>:113:                                    ; preds = %38
  store i32 0, i32* %4, align 4
  br label %114

; <label>:114:                                    ; preds = %113, %112, %12
  %115 = load i32, i32* %4, align 4
  ret i32 %115
}

; Function Attrs: noinline nounwind uwtable
define internal void @forcevheader(%struct.dent*, %struct.dent*, %struct.dent*) #0 {
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.dent*, align 8
  %6 = alloca %struct.dent*, align 8
  store %struct.dent* %0, %struct.dent** %4, align 8
  store %struct.dent* %1, %struct.dent** %5, align 8
  store %struct.dent* %2, %struct.dent** %6, align 8
  %7 = load %struct.dent*, %struct.dent** %4, align 8
  %8 = getelementptr inbounds %struct.dent, %struct.dent* %7, i32 0, i32 2
  %9 = getelementptr inbounds [1 x i64], [1 x i64]* %8, i64 0, i64 0
  %10 = load i64, i64* %9, align 8
  %11 = and i64 %10, 1879048192
  %12 = icmp eq i64 %11, 268435456
  br i1 %12, label %13, label %26

; <label>:13:                                     ; preds = %3
  %14 = load %struct.dent*, %struct.dent** %5, align 8
  %15 = getelementptr inbounds %struct.dent, %struct.dent* %14, i32 0, i32 2
  %16 = getelementptr inbounds [1 x i64], [1 x i64]* %15, i64 0, i64 0
  %17 = load i64, i64* %16, align 8
  %18 = load %struct.dent*, %struct.dent** %6, align 8
  %19 = getelementptr inbounds %struct.dent, %struct.dent* %18, i32 0, i32 2
  %20 = getelementptr inbounds [1 x i64], [1 x i64]* %19, i64 0, i64 0
  %21 = load i64, i64* %20, align 8
  %22 = xor i64 %17, %21
  %23 = and i64 %22, 134217728
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %25, label %26

; <label>:25:                                     ; preds = %13
  br label %37

; <label>:26:                                     ; preds = %13, %3
  %27 = load %struct.dent*, %struct.dent** %4, align 8
  %28 = getelementptr inbounds %struct.dent, %struct.dent* %27, i32 0, i32 2
  %29 = getelementptr inbounds [1 x i64], [1 x i64]* %28, i64 0, i64 0
  %30 = load i64, i64* %29, align 8
  %31 = and i64 %30, 1879048192
  %32 = icmp ne i64 %31, 1342177280
  br i1 %32, label %33, label %36

; <label>:33:                                     ; preds = %26
  %34 = load %struct.dent*, %struct.dent** %4, align 8
  %35 = call i32 @addvheader(%struct.dent* %34)
  br label %36

; <label>:36:                                     ; preds = %33, %26
  br label %37

; <label>:37:                                     ; preds = %36, %25
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @combineaffixes(%struct.dent*, %struct.dent*) #0 {
  %3 = alloca %struct.dent*, align 8
  %4 = alloca %struct.dent*, align 8
  store %struct.dent* %0, %struct.dent** %3, align 8
  store %struct.dent* %1, %struct.dent** %4, align 8
  %5 = load %struct.dent*, %struct.dent** %4, align 8
  %6 = getelementptr inbounds %struct.dent, %struct.dent* %5, i32 0, i32 2
  %7 = getelementptr inbounds [1 x i64], [1 x i64]* %6, i64 0, i64 0
  %8 = load i64, i64* %7, align 8
  %9 = and i64 %8, -2080374785
  %10 = load %struct.dent*, %struct.dent** %3, align 8
  %11 = getelementptr inbounds %struct.dent, %struct.dent* %10, i32 0, i32 2
  %12 = getelementptr inbounds [1 x i64], [1 x i64]* %11, i64 0, i64 0
  %13 = load i64, i64* %12, align 8
  %14 = or i64 %13, %9
  store i64 %14, i64* %12, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @upcase(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  br label %3

; <label>:3:                                      ; preds = %7, %1
  %4 = load i8*, i8** %2, align 8
  %5 = load i8, i8* %4, align 1
  %6 = icmp ne i8 %5, 0
  br i1 %6, label %7, label %16

; <label>:7:                                      ; preds = %3
  %8 = load i8*, i8** %2, align 8
  %9 = load i8, i8* %8, align 1
  %10 = zext i8 %9 to i64
  %11 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 22), i64 0, i64 %10
  %12 = load i8, i8* %11, align 1
  %13 = load i8*, i8** %2, align 8
  store i8 %12, i8* %13, align 1
  %14 = load i8*, i8** %2, align 8
  %15 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %15, i8** %2, align 8
  br label %3

; <label>:16:                                     ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @lowcase(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  br label %3

; <label>:3:                                      ; preds = %7, %1
  %4 = load i8*, i8** %2, align 8
  %5 = load i8, i8* %4, align 1
  %6 = icmp ne i8 %5, 0
  br i1 %6, label %7, label %16

; <label>:7:                                      ; preds = %3
  %8 = load i8*, i8** %2, align 8
  %9 = load i8, i8* %8, align 1
  %10 = zext i8 %9 to i64
  %11 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 21), i64 0, i64 %10
  %12 = load i8, i8* %11, align 1
  %13 = load i8*, i8** %2, align 8
  store i8 %12, i8* %13, align 1
  %14 = load i8*, i8** %2, align 8
  %15 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %15, i8** %2, align 8
  br label %3

; <label>:16:                                     ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i8* @strtosichar(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i8*, i8** %3, align 8
  %6 = load i32, i32* %4, align 4
  %7 = call i32 @strtoichar(i8* getelementptr inbounds ([184 x i8], [184 x i8]* @strtosichar.out, i32 0, i32 0), i8* %5, i32 184, i32 %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %17

; <label>:9:                                      ; preds = %2
  %10 = load i32, i32* @cbench_print, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = load i8*, i8** %3, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i8* %14, i32 942, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %16

; <label>:16:                                     ; preds = %12, %9
  br label %17

; <label>:17:                                     ; preds = %16, %2
  ret i8* getelementptr inbounds ([184 x i8], [184 x i8]* @strtosichar.out, i32 0, i32 0)
}

; Function Attrs: noinline nounwind uwtable
define void @toutent(%struct._IO_FILE*, %struct.dent*, i32) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca %struct.dent*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.dent*, align 8
  %8 = alloca [120 x i8], align 16
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store %struct.dent* %1, %struct.dent** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.dent*, %struct.dent** %5, align 8
  store %struct.dent* %9, %struct.dent** %7, align 8
  %10 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %11 = load %struct.dent*, %struct.dent** %7, align 8
  %12 = getelementptr inbounds %struct.dent, %struct.dent* %11, i32 0, i32 1
  %13 = load i8*, i8** %12, align 8
  %14 = call i32 @strtoichar(i8* %10, i8* %13, i32 100, i32 1)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %26

; <label>:16:                                     ; preds = %3
  %17 = load i32, i32* @cbench_print, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %25

; <label>:19:                                     ; preds = %16
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = load %struct.dent*, %struct.dent** %7, align 8
  %22 = getelementptr inbounds %struct.dent, %struct.dent* %21, i32 0, i32 1
  %23 = load i8*, i8** %22, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i8* %23, i32 698, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %25

; <label>:25:                                     ; preds = %19, %16
  br label %26

; <label>:26:                                     ; preds = %25, %3
  br label %27

; <label>:27:                                     ; preds = %98, %26
  %28 = load i32, i32* %6, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %37

; <label>:30:                                     ; preds = %27
  %31 = load %struct.dent*, %struct.dent** %7, align 8
  %32 = getelementptr inbounds %struct.dent, %struct.dent* %31, i32 0, i32 2
  %33 = getelementptr inbounds [1 x i64], [1 x i64]* %32, i64 0, i64 0
  %34 = load i64, i64* %33, align 8
  %35 = and i64 %34, 134217728
  %36 = icmp ne i64 %35, 0
  br i1 %36, label %37, label %86

; <label>:37:                                     ; preds = %30, %27
  %38 = load %struct.dent*, %struct.dent** %7, align 8
  %39 = getelementptr inbounds %struct.dent, %struct.dent* %38, i32 0, i32 2
  %40 = getelementptr inbounds [1 x i64], [1 x i64]* %39, i64 0, i64 0
  %41 = load i64, i64* %40, align 8
  %42 = and i64 %41, 805306368
  switch i64 %42, label %85 [
    i64 0, label %43
    i64 268435456, label %49
    i64 536870912, label %67
    i64 805306368, label %79
  ]

; <label>:43:                                     ; preds = %37
  %44 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  call void @lowcase(i8* %44)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %46 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %47 = call i8* @ichartosstr(i8* %46, i32 1)
  %48 = load %struct.dent*, %struct.dent** %7, align 8
  call void @toutword(%struct._IO_FILE* %45, i8* %47, %struct.dent* %48)
  br label %85

; <label>:49:                                     ; preds = %37
  %50 = load %struct.dent*, %struct.dent** %7, align 8
  %51 = getelementptr inbounds %struct.dent, %struct.dent* %50, i32 0, i32 2
  %52 = getelementptr inbounds [1 x i64], [1 x i64]* %51, i64 0, i64 0
  %53 = load i64, i64* %52, align 8
  %54 = and i64 %53, 1073741824
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %60, label %56

; <label>:56:                                     ; preds = %49
  %57 = load %struct.dent*, %struct.dent** %7, align 8
  %58 = load %struct.dent*, %struct.dent** %5, align 8
  %59 = icmp ne %struct.dent* %57, %58
  br i1 %59, label %60, label %66

; <label>:60:                                     ; preds = %56, %49
  %61 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  call void @upcase(i8* %61)
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %63 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %64 = call i8* @ichartosstr(i8* %63, i32 1)
  %65 = load %struct.dent*, %struct.dent** %7, align 8
  call void @toutword(%struct._IO_FILE* %62, i8* %64, %struct.dent* %65)
  br label %66

; <label>:66:                                     ; preds = %60, %56
  br label %85

; <label>:67:                                     ; preds = %37
  %68 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  call void @lowcase(i8* %68)
  %69 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i64 0, i64 0
  %70 = load i8, i8* %69, align 16
  %71 = zext i8 %70 to i64
  %72 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 22), i64 0, i64 %71
  %73 = load i8, i8* %72, align 1
  %74 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i64 0, i64 0
  store i8 %73, i8* %74, align 16
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %76 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %77 = call i8* @ichartosstr(i8* %76, i32 1)
  %78 = load %struct.dent*, %struct.dent** %7, align 8
  call void @toutword(%struct._IO_FILE* %75, i8* %77, %struct.dent* %78)
  br label %85

; <label>:79:                                     ; preds = %37
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %81 = load %struct.dent*, %struct.dent** %7, align 8
  %82 = getelementptr inbounds %struct.dent, %struct.dent* %81, i32 0, i32 1
  %83 = load i8*, i8** %82, align 8
  %84 = load %struct.dent*, %struct.dent** %7, align 8
  call void @toutword(%struct._IO_FILE* %80, i8* %83, %struct.dent* %84)
  br label %85

; <label>:85:                                     ; preds = %79, %67, %66, %43, %37
  br label %86

; <label>:86:                                     ; preds = %85, %30
  %87 = load %struct.dent*, %struct.dent** %7, align 8
  %88 = getelementptr inbounds %struct.dent, %struct.dent* %87, i32 0, i32 2
  %89 = getelementptr inbounds [1 x i64], [1 x i64]* %88, i64 0, i64 0
  %90 = load i64, i64* %89, align 8
  %91 = and i64 %90, 1073741824
  %92 = icmp ne i64 %91, 0
  br i1 %92, label %93, label %97

; <label>:93:                                     ; preds = %86
  %94 = load %struct.dent*, %struct.dent** %7, align 8
  %95 = getelementptr inbounds %struct.dent, %struct.dent* %94, i32 0, i32 0
  %96 = load %struct.dent*, %struct.dent** %95, align 8
  store %struct.dent* %96, %struct.dent** %7, align 8
  br label %98

; <label>:97:                                     ; preds = %86
  br label %99

; <label>:98:                                     ; preds = %93
  br label %27

; <label>:99:                                     ; preds = %97
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @toutword(%struct._IO_FILE*, i8*, %struct.dent*) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.dent*, align 8
  %7 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i8* %1, i8** %5, align 8
  store %struct.dent* %2, %struct.dent** %6, align 8
  store i32 0, i32* @has_marker, align 4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %9 = load i8*, i8** %5, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* %9)
  store i32 0, i32* %7, align 4
  br label %11

; <label>:11:                                     ; preds = %29, %3
  %12 = load i32, i32* %7, align 4
  %13 = icmp slt i32 %12, 26
  br i1 %13, label %14, label %32

; <label>:14:                                     ; preds = %11
  %15 = load %struct.dent*, %struct.dent** %6, align 8
  %16 = getelementptr inbounds %struct.dent, %struct.dent* %15, i32 0, i32 2
  %17 = getelementptr inbounds [1 x i64], [1 x i64]* %16, i64 0, i64 0
  %18 = load i64, i64* %17, align 8
  %19 = load i32, i32* %7, align 4
  %20 = zext i32 %19 to i64
  %21 = shl i64 1, %20
  %22 = and i64 %18, %21
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %14
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %26 = load i32, i32* %7, align 4
  %27 = add nsw i32 %26, 65
  call void @flagout(%struct._IO_FILE* %25, i32 %27)
  br label %28

; <label>:28:                                     ; preds = %24, %14
  br label %29

; <label>:29:                                     ; preds = %28
  %30 = load i32, i32* %7, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %7, align 4
  br label %11

; <label>:32:                                     ; preds = %11
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i8* @ichartosstr(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i8*, i8** %3, align 8
  %6 = load i32, i32* %4, align 4
  %7 = call i32 @ichartostr(i8* getelementptr inbounds ([184 x i8], [184 x i8]* @ichartosstr.out, i32 0, i32 0), i8* %5, i32 184, i32 %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %16

; <label>:9:                                      ; preds = %2
  %10 = load i32, i32* @cbench_print, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %15

; <label>:12:                                     ; preds = %9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([184 x i8], [184 x i8]* @ichartosstr.out, i32 0, i32 0), i32 956, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %15

; <label>:15:                                     ; preds = %12, %9
  br label %16

; <label>:16:                                     ; preds = %15, %2
  ret i8* getelementptr inbounds ([184 x i8], [184 x i8]* @ichartosstr.out, i32 0, i32 0)
}

; Function Attrs: noinline nounwind uwtable
define i32 @stringcharlen(i8*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 0, i32* %9, align 4
  %12 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 12), align 4
  %13 = sub nsw i32 %12, 1
  store i32 %13, i32* %10, align 4
  %14 = load i32, i32* %5, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %2
  br label %19

; <label>:17:                                     ; preds = %2
  %18 = load i32, i32* @defdupchar, align 4
  br label %19

; <label>:19:                                     ; preds = %17, %16
  %20 = phi i32 [ 0, %16 ], [ %18, %17 ]
  store i32 %20, i32* %11, align 4
  br label %21

; <label>:21:                                     ; preds = %126, %19
  %22 = load i32, i32* %9, align 4
  %23 = load i32, i32* %10, align 4
  %24 = icmp sle i32 %22, %23
  br i1 %24, label %25, label %127

; <label>:25:                                     ; preds = %21
  %26 = load i32, i32* %9, align 4
  %27 = load i32, i32* %10, align 4
  %28 = add nsw i32 %26, %27
  %29 = ashr i32 %28, 1
  store i32 %29, i32* %8, align 4
  %30 = load i32, i32* %8, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [100 x [11 x i8]], [100 x [11 x i8]]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 28), i64 0, i64 %31
  %33 = getelementptr inbounds [11 x i8], [11 x i8]* %32, i64 0, i64 0
  store i8* %33, i8** %7, align 8
  %34 = load i8*, i8** %4, align 8
  store i8* %34, i8** %6, align 8
  br label %35

; <label>:35:                                     ; preds = %51, %25
  %36 = load i8*, i8** %7, align 8
  %37 = load i8, i8* %36, align 1
  %38 = icmp ne i8 %37, 0
  br i1 %38, label %39, label %54

; <label>:39:                                     ; preds = %35
  %40 = load i8*, i8** %6, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %6, align 8
  %42 = load i8, i8* %40, align 1
  %43 = sext i8 %42 to i32
  %44 = load i8*, i8** %7, align 8
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = xor i32 %43, %46
  %48 = and i32 %47, 127
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %51

; <label>:50:                                     ; preds = %39
  br label %54

; <label>:51:                                     ; preds = %39
  %52 = load i8*, i8** %7, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %7, align 8
  br label %35

; <label>:54:                                     ; preds = %50, %35
  %55 = load i8*, i8** %7, align 8
  %56 = load i8, i8* %55, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %84

; <label>:59:                                     ; preds = %54
  %60 = load i32, i32* %8, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [100 x i32], [100 x i32]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 30), i64 0, i64 %61
  %63 = load i32, i32* %62, align 4
  %64 = load i32, i32* %11, align 4
  %65 = icmp eq i32 %63, %64
  br i1 %65, label %66, label %80

; <label>:66:                                     ; preds = %59
  %67 = load i32, i32* %8, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [100 x i32], [100 x i32]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 29), i64 0, i64 %68
  %70 = load i32, i32* %69, align 4
  store i32 %70, i32* @laststringch, align 4
  %71 = load i8*, i8** %7, align 8
  %72 = load i32, i32* %8, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [100 x [11 x i8]], [100 x [11 x i8]]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 28), i64 0, i64 %73
  %75 = getelementptr inbounds [11 x i8], [11 x i8]* %74, i64 0, i64 0
  %76 = ptrtoint i8* %71 to i64
  %77 = ptrtoint i8* %75 to i64
  %78 = sub i64 %76, %77
  %79 = trunc i64 %78 to i32
  store i32 %79, i32* %3, align 4
  br label %128

; <label>:80:                                     ; preds = %59
  %81 = load i8*, i8** %7, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 -1
  store i8* %82, i8** %7, align 8
  br label %83

; <label>:83:                                     ; preds = %80
  br label %84

; <label>:84:                                     ; preds = %83, %54
  %85 = load i8*, i8** %6, align 8
  %86 = getelementptr inbounds i8, i8* %85, i32 -1
  store i8* %86, i8** %6, align 8
  %87 = load i8, i8* %86, align 1
  %88 = sext i8 %87 to i32
  %89 = and i32 %88, 127
  %90 = load i8*, i8** %7, align 8
  %91 = load i8, i8* %90, align 1
  %92 = sext i8 %91 to i32
  %93 = and i32 %92, 127
  %94 = icmp slt i32 %89, %93
  br i1 %94, label %95, label %98

; <label>:95:                                     ; preds = %84
  %96 = load i32, i32* %8, align 4
  %97 = sub nsw i32 %96, 1
  store i32 %97, i32* %10, align 4
  br label %126

; <label>:98:                                     ; preds = %84
  %99 = load i8*, i8** %6, align 8
  %100 = load i8, i8* %99, align 1
  %101 = sext i8 %100 to i32
  %102 = and i32 %101, 127
  %103 = load i8*, i8** %7, align 8
  %104 = load i8, i8* %103, align 1
  %105 = sext i8 %104 to i32
  %106 = and i32 %105, 127
  %107 = icmp sgt i32 %102, %106
  br i1 %107, label %108, label %111

; <label>:108:                                    ; preds = %98
  %109 = load i32, i32* %8, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %9, align 4
  br label %125

; <label>:111:                                    ; preds = %98
  %112 = load i32, i32* %11, align 4
  %113 = load i32, i32* %8, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [100 x i32], [100 x i32]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 30), i64 0, i64 %114
  %116 = load i32, i32* %115, align 4
  %117 = icmp slt i32 %112, %116
  br i1 %117, label %118, label %121

; <label>:118:                                    ; preds = %111
  %119 = load i32, i32* %8, align 4
  %120 = sub nsw i32 %119, 1
  store i32 %120, i32* %10, align 4
  br label %124

; <label>:121:                                    ; preds = %111
  %122 = load i32, i32* %8, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %9, align 4
  br label %124

; <label>:124:                                    ; preds = %121, %118
  br label %125

; <label>:125:                                    ; preds = %124, %108
  br label %126

; <label>:126:                                    ; preds = %125, %95
  br label %21

; <label>:127:                                    ; preds = %21
  store i32 -1, i32* @laststringch, align 4
  store i32 0, i32* %3, align 4
  br label %128

; <label>:128:                                    ; preds = %127, %66
  %129 = load i32, i32* %3, align 4
  ret i32 %129
}

; Function Attrs: noinline nounwind uwtable
define i8* @printichar(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp slt i32 %3, 128
  br i1 %4, label %5, label %8

; <label>:5:                                      ; preds = %1
  %6 = load i32, i32* %2, align 4
  %7 = trunc i32 %6 to i8
  store i8 %7, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @printichar.out, i64 0, i64 0), align 1
  store i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @printichar.out, i64 0, i64 1), align 1
  br label %15

; <label>:8:                                      ; preds = %1
  %9 = load i32, i32* %2, align 4
  %10 = sub i32 %9, 128
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds [100 x [11 x i8]], [100 x [11 x i8]]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 28), i64 0, i64 %11
  %13 = getelementptr inbounds [11 x i8], [11 x i8]* %12, i32 0, i32 0
  %14 = call i8* @strcpy(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @printichar.out, i32 0, i32 0), i8* %13) #6
  br label %15

; <label>:15:                                     ; preds = %8, %5
  ret i8* getelementptr inbounds ([11 x i8], [11 x i8]* @printichar.out, i32 0, i32 0)
}

; Function Attrs: noinline nounwind uwtable
define i32 @findfiletype(i8*, i32, i32*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32* %2, i32** %7, align 8
  %12 = load i8*, i8** %5, align 8
  %13 = call i64 @strlen(i8* %12) #5
  %14 = trunc i64 %13 to i32
  store i32 %14, i32* %11, align 4
  %15 = load i32, i32* %6, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %53

; <label>:17:                                     ; preds = %3
  store i32 0, i32* %10, align 4
  br label %18

; <label>:18:                                     ; preds = %49, %17
  %19 = load i32, i32* %10, align 4
  %20 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 13), align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %52

; <label>:22:                                     ; preds = %18
  %23 = load i8*, i8** %5, align 8
  %24 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %25 = load i32, i32* %10, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %24, i64 %26
  %28 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %27, i32 0, i32 0
  %29 = load i8*, i8** %28, align 8
  %30 = call i32 @strcmp(i8* %23, i8* %29) #5
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %48

; <label>:32:                                     ; preds = %22
  %33 = load i32*, i32** %7, align 8
  %34 = icmp ne i32* %33, null
  br i1 %34, label %35, label %46

; <label>:35:                                     ; preds = %32
  %36 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %37 = load i32, i32* %10, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %36, i64 %38
  %40 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %39, i32 0, i32 1
  %41 = load i8*, i8** %40, align 8
  %42 = call i32 @strcmp(i8* %41, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0)) #5
  %43 = icmp eq i32 %42, 0
  %44 = zext i1 %43 to i32
  %45 = load i32*, i32** %7, align 8
  store i32 %44, i32* %45, align 4
  br label %46

; <label>:46:                                     ; preds = %35, %32
  %47 = load i32, i32* %10, align 4
  store i32 %47, i32* %4, align 4
  br label %115

; <label>:48:                                     ; preds = %22
  br label %49

; <label>:49:                                     ; preds = %48
  %50 = load i32, i32* %10, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %10, align 4
  br label %18

; <label>:52:                                     ; preds = %18
  br label %53

; <label>:53:                                     ; preds = %52, %3
  store i32 0, i32* %10, align 4
  br label %54

; <label>:54:                                     ; preds = %111, %53
  %55 = load i32, i32* %10, align 4
  %56 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 13), align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %114

; <label>:58:                                     ; preds = %54
  %59 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %60 = load i32, i32* %10, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %59, i64 %61
  %63 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %62, i32 0, i32 2
  %64 = load i8*, i8** %63, align 8
  store i8* %64, i8** %8, align 8
  br label %65

; <label>:65:                                     ; preds = %104, %58
  %66 = load i8*, i8** %8, align 8
  %67 = load i8, i8* %66, align 1
  %68 = sext i8 %67 to i32
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %110

; <label>:70:                                     ; preds = %65
  %71 = load i8*, i8** %8, align 8
  %72 = call i64 @strlen(i8* %71) #5
  %73 = trunc i64 %72 to i32
  store i32 %73, i32* %9, align 4
  %74 = load i32, i32* %11, align 4
  %75 = load i32, i32* %9, align 4
  %76 = icmp sge i32 %74, %75
  br i1 %76, label %77, label %103

; <label>:77:                                     ; preds = %70
  %78 = load i8*, i8** %5, align 8
  %79 = load i32, i32* %11, align 4
  %80 = load i32, i32* %9, align 4
  %81 = sub nsw i32 %79, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8* %78, i64 %82
  %84 = load i8*, i8** %8, align 8
  %85 = call i32 @strcmp(i8* %83, i8* %84) #5
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %103

; <label>:87:                                     ; preds = %77
  %88 = load i32*, i32** %7, align 8
  %89 = icmp ne i32* %88, null
  br i1 %89, label %90, label %101

; <label>:90:                                     ; preds = %87
  %91 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %92 = load i32, i32* %10, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %91, i64 %93
  %95 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %94, i32 0, i32 1
  %96 = load i8*, i8** %95, align 8
  %97 = call i32 @strcmp(i8* %96, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0)) #5
  %98 = icmp eq i32 %97, 0
  %99 = zext i1 %98 to i32
  %100 = load i32*, i32** %7, align 8
  store i32 %99, i32* %100, align 4
  br label %101

; <label>:101:                                    ; preds = %90, %87
  %102 = load i32, i32* %10, align 4
  store i32 %102, i32* %4, align 4
  br label %115

; <label>:103:                                    ; preds = %77, %70
  br label %104

; <label>:104:                                    ; preds = %103
  %105 = load i32, i32* %9, align 4
  %106 = add nsw i32 %105, 1
  %107 = load i8*, i8** %8, align 8
  %108 = sext i32 %106 to i64
  %109 = getelementptr inbounds i8, i8* %107, i64 %108
  store i8* %109, i8** %8, align 8
  br label %65

; <label>:110:                                    ; preds = %65
  br label %111

; <label>:111:                                    ; preds = %110
  %112 = load i32, i32* %10, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %10, align 4
  br label %54

; <label>:114:                                    ; preds = %54
  store i32 -1, i32* %4, align 4
  br label %115

; <label>:115:                                    ; preds = %114, %101, %46
  %116 = load i32, i32* %4, align 4
  ret i32 %116
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @acoversb(%struct.dent*, %struct.dent*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.dent*, align 8
  %6 = alloca i32, align 4
  store %struct.dent* %0, %struct.dent** %4, align 8
  store %struct.dent* %1, %struct.dent** %5, align 8
  %7 = load %struct.dent*, %struct.dent** %5, align 8
  %8 = load %struct.dent*, %struct.dent** %4, align 8
  %9 = call i32 @issubset(%struct.dent* %7, %struct.dent* %8)
  store i32 %9, i32* %6, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %32

; <label>:11:                                     ; preds = %2
  %12 = load %struct.dent*, %struct.dent** %4, align 8
  %13 = getelementptr inbounds %struct.dent, %struct.dent* %12, i32 0, i32 2
  %14 = getelementptr inbounds [1 x i64], [1 x i64]* %13, i64 0, i64 0
  %15 = load i64, i64* %14, align 8
  %16 = load %struct.dent*, %struct.dent** %5, align 8
  %17 = getelementptr inbounds %struct.dent, %struct.dent* %16, i32 0, i32 2
  %18 = getelementptr inbounds [1 x i64], [1 x i64]* %17, i64 0, i64 0
  %19 = load i64, i64* %18, align 8
  %20 = xor i64 %15, %19
  %21 = and i64 %20, 134217728
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %31

; <label>:23:                                     ; preds = %11
  %24 = load %struct.dent*, %struct.dent** %4, align 8
  %25 = getelementptr inbounds %struct.dent, %struct.dent* %24, i32 0, i32 2
  %26 = getelementptr inbounds [1 x i64], [1 x i64]* %25, i64 0, i64 0
  %27 = load i64, i64* %26, align 8
  %28 = and i64 %27, 134217728
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %30, label %31

; <label>:30:                                     ; preds = %23
  store i32 0, i32* %3, align 4
  br label %104

; <label>:31:                                     ; preds = %23, %11
  br label %46

; <label>:32:                                     ; preds = %2
  %33 = load %struct.dent*, %struct.dent** %4, align 8
  %34 = getelementptr inbounds %struct.dent, %struct.dent* %33, i32 0, i32 2
  %35 = getelementptr inbounds [1 x i64], [1 x i64]* %34, i64 0, i64 0
  %36 = load i64, i64* %35, align 8
  %37 = load %struct.dent*, %struct.dent** %5, align 8
  %38 = getelementptr inbounds %struct.dent, %struct.dent* %37, i32 0, i32 2
  %39 = getelementptr inbounds [1 x i64], [1 x i64]* %38, i64 0, i64 0
  %40 = load i64, i64* %39, align 8
  %41 = xor i64 %36, %40
  %42 = and i64 %41, 134217728
  %43 = icmp ne i64 %42, 0
  br i1 %43, label %44, label %45

; <label>:44:                                     ; preds = %32
  store i32 0, i32* %3, align 4
  br label %104

; <label>:45:                                     ; preds = %32
  br label %46

; <label>:46:                                     ; preds = %45, %31
  %47 = load %struct.dent*, %struct.dent** %4, align 8
  %48 = getelementptr inbounds %struct.dent, %struct.dent* %47, i32 0, i32 2
  %49 = getelementptr inbounds [1 x i64], [1 x i64]* %48, i64 0, i64 0
  %50 = load i64, i64* %49, align 8
  %51 = load %struct.dent*, %struct.dent** %5, align 8
  %52 = getelementptr inbounds %struct.dent, %struct.dent* %51, i32 0, i32 2
  %53 = getelementptr inbounds [1 x i64], [1 x i64]* %52, i64 0, i64 0
  %54 = load i64, i64* %53, align 8
  %55 = xor i64 %50, %54
  %56 = and i64 %55, 805306368
  %57 = icmp eq i64 %56, 0
  br i1 %57, label %58, label %76

; <label>:58:                                     ; preds = %46
  %59 = load %struct.dent*, %struct.dent** %4, align 8
  %60 = getelementptr inbounds %struct.dent, %struct.dent* %59, i32 0, i32 2
  %61 = getelementptr inbounds [1 x i64], [1 x i64]* %60, i64 0, i64 0
  %62 = load i64, i64* %61, align 8
  %63 = and i64 %62, 805306368
  %64 = icmp ne i64 %63, 805306368
  br i1 %64, label %74, label %65

; <label>:65:                                     ; preds = %58
  %66 = load %struct.dent*, %struct.dent** %4, align 8
  %67 = getelementptr inbounds %struct.dent, %struct.dent* %66, i32 0, i32 1
  %68 = load i8*, i8** %67, align 8
  %69 = load %struct.dent*, %struct.dent** %5, align 8
  %70 = getelementptr inbounds %struct.dent, %struct.dent* %69, i32 0, i32 1
  %71 = load i8*, i8** %70, align 8
  %72 = call i32 @strcmp(i8* %68, i8* %71) #5
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %75

; <label>:74:                                     ; preds = %65, %58
  store i32 1, i32* %3, align 4
  br label %104

; <label>:75:                                     ; preds = %65
  store i32 0, i32* %3, align 4
  br label %104

; <label>:76:                                     ; preds = %46
  %77 = load i32, i32* %6, align 4
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %80

; <label>:79:                                     ; preds = %76
  store i32 0, i32* %3, align 4
  br label %104

; <label>:80:                                     ; preds = %76
  %81 = load %struct.dent*, %struct.dent** %5, align 8
  %82 = getelementptr inbounds %struct.dent, %struct.dent* %81, i32 0, i32 2
  %83 = getelementptr inbounds [1 x i64], [1 x i64]* %82, i64 0, i64 0
  %84 = load i64, i64* %83, align 8
  %85 = and i64 %84, 805306368
  %86 = icmp eq i64 %85, 268435456
  br i1 %86, label %87, label %88

; <label>:87:                                     ; preds = %80
  store i32 1, i32* %3, align 4
  br label %104

; <label>:88:                                     ; preds = %80
  %89 = load %struct.dent*, %struct.dent** %4, align 8
  %90 = getelementptr inbounds %struct.dent, %struct.dent* %89, i32 0, i32 2
  %91 = getelementptr inbounds [1 x i64], [1 x i64]* %90, i64 0, i64 0
  %92 = load i64, i64* %91, align 8
  %93 = and i64 %92, 805306368
  %94 = icmp eq i64 %93, 0
  br i1 %94, label %95, label %103

; <label>:95:                                     ; preds = %88
  %96 = load %struct.dent*, %struct.dent** %5, align 8
  %97 = getelementptr inbounds %struct.dent, %struct.dent* %96, i32 0, i32 2
  %98 = getelementptr inbounds [1 x i64], [1 x i64]* %97, i64 0, i64 0
  %99 = load i64, i64* %98, align 8
  %100 = and i64 %99, 805306368
  %101 = icmp eq i64 %100, 536870912
  br i1 %101, label %102, label %103

; <label>:102:                                    ; preds = %95
  store i32 1, i32* %3, align 4
  br label %104

; <label>:103:                                    ; preds = %95, %88
  store i32 0, i32* %3, align 4
  br label %104

; <label>:104:                                    ; preds = %103, %102, %87, %79, %75, %74, %44, %30
  %105 = load i32, i32* %3, align 4
  ret i32 %105
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @issubset(%struct.dent*, %struct.dent*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.dent*, align 8
  store %struct.dent* %0, %struct.dent** %4, align 8
  store %struct.dent* %1, %struct.dent** %5, align 8
  %6 = load %struct.dent*, %struct.dent** %4, align 8
  %7 = getelementptr inbounds %struct.dent, %struct.dent* %6, i32 0, i32 2
  %8 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i64 0, i64 0
  %9 = load i64, i64* %8, align 8
  %10 = load %struct.dent*, %struct.dent** %5, align 8
  %11 = getelementptr inbounds %struct.dent, %struct.dent* %10, i32 0, i32 2
  %12 = getelementptr inbounds [1 x i64], [1 x i64]* %11, i64 0, i64 0
  %13 = load i64, i64* %12, align 8
  %14 = and i64 %9, %13
  %15 = load %struct.dent*, %struct.dent** %4, align 8
  %16 = getelementptr inbounds %struct.dent, %struct.dent* %15, i32 0, i32 2
  %17 = getelementptr inbounds [1 x i64], [1 x i64]* %16, i64 0, i64 0
  %18 = load i64, i64* %17, align 8
  %19 = xor i64 %14, %18
  %20 = and i64 %19, -2080374785
  %21 = icmp ne i64 %20, 0
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %2
  store i32 0, i32* %3, align 4
  br label %24

; <label>:23:                                     ; preds = %2
  store i32 1, i32* %3, align 4
  br label %24

; <label>:24:                                     ; preds = %23, %22
  %25 = load i32, i32* %3, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind uwtable
define internal void @flagout(%struct._IO_FILE*, i32) #0 {
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* @has_marker, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %12, label %7

; <label>:7:                                      ; preds = %2
  %8 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %9 = sext i8 %8 to i32
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %11 = call i32 @_IO_putc(i32 %9, %struct._IO_FILE* %10)
  br label %12

; <label>:12:                                     ; preds = %7, %2
  store i32 1, i32* @has_marker, align 4
  %13 = load i32, i32* %4, align 4
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %15 = call i32 @_IO_putc(i32 %13, %struct._IO_FILE* %14)
  ret void
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
