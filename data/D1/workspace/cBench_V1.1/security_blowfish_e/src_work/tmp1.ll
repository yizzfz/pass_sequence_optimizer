; ModuleID = 'bf.ll'
source_filename = "bf.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

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
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %2
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:31:                                     ; preds = %2
  %32 = load i8**, i8*** %5, align 8
  %33 = getelementptr inbounds i8*, i8** %32, i64 1
  %34 = load i8*, i8** %33, align 8
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp eq i32 %36, 101
  br i1 %37, label %45, label %38

; <label>:38:                                     ; preds = %31
  %39 = load i8**, i8*** %5, align 8
  %40 = getelementptr inbounds i8*, i8** %39, i64 1
  %41 = load i8*, i8** %40, align 8
  %42 = load i8, i8* %41, align 1
  %43 = sext i8 %42 to i32
  %44 = icmp eq i32 %43, 69
  br i1 %44, label %45, label %46

; <label>:45:                                     ; preds = %38, %31
  store i32 1, i32* %14, align 4
  br label %65

; <label>:46:                                     ; preds = %38
  %47 = load i8**, i8*** %5, align 8
  %48 = getelementptr inbounds i8*, i8** %47, i64 1
  %49 = load i8*, i8** %48, align 8
  %50 = load i8, i8* %49, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp eq i32 %51, 100
  br i1 %52, label %60, label %53

; <label>:53:                                     ; preds = %46
  %54 = load i8**, i8*** %5, align 8
  %55 = getelementptr inbounds i8*, i8** %54, i64 1
  %56 = load i8*, i8** %55, align 8
  %57 = load i8, i8* %56, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp eq i32 %58, 68
  br i1 %59, label %60, label %61

; <label>:60:                                     ; preds = %53, %46
  store i32 0, i32* %14, align 4
  br label %64

; <label>:61:                                     ; preds = %53
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %63 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:64:                                     ; preds = %60
  br label %65

; <label>:65:                                     ; preds = %64, %45
  %66 = load i8**, i8*** %5, align 8
  %67 = getelementptr inbounds i8*, i8** %66, i64 4
  %68 = load i8*, i8** %67, align 8
  store i8* %68, i8** %15, align 8
  br label %69

; <label>:69:                                     ; preds = %133, %65
  %70 = load i32, i32* %13, align 4
  %71 = icmp slt i32 %70, 64
  br i1 %71, label %72, label %77

; <label>:72:                                     ; preds = %69
  %73 = load i8*, i8** %15, align 8
  %74 = load i8, i8* %73, align 1
  %75 = sext i8 %74 to i32
  %76 = icmp ne i32 %75, 0
  br label %77

; <label>:77:                                     ; preds = %72, %69
  %78 = phi i1 [ false, %69 ], [ %76, %72 ]
  br i1 %78, label %79, label %134

; <label>:79:                                     ; preds = %77
  %80 = load i8*, i8** %15, align 8
  %81 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %81, i8** %15, align 8
  %82 = load i8, i8* %80, align 1
  %83 = sext i8 %82 to i32
  %84 = call i32 @toupper(i32 %83) #7
  %85 = trunc i32 %84 to i8
  store i8 %85, i8* %16, align 1
  %86 = load i8, i8* %16, align 1
  %87 = sext i8 %86 to i32
  %88 = icmp sge i32 %87, 48
  br i1 %88, label %89, label %100

; <label>:89:                                     ; preds = %79
  %90 = load i8, i8* %16, align 1
  %91 = sext i8 %90 to i32
  %92 = icmp sle i32 %91, 57
  br i1 %92, label %93, label %100

; <label>:93:                                     ; preds = %89
  %94 = load i32, i32* %12, align 4
  %95 = shl i32 %94, 4
  %96 = load i8, i8* %16, align 1
  %97 = sext i8 %96 to i32
  %98 = add nsw i32 %95, %97
  %99 = sub nsw i32 %98, 48
  store i32 %99, i32* %12, align 4
  br label %119

; <label>:100:                                    ; preds = %89, %79
  %101 = load i8, i8* %16, align 1
  %102 = sext i8 %101 to i32
  %103 = icmp sge i32 %102, 65
  br i1 %103, label %104, label %116

; <label>:104:                                    ; preds = %100
  %105 = load i8, i8* %16, align 1
  %106 = sext i8 %105 to i32
  %107 = icmp sle i32 %106, 70
  br i1 %107, label %108, label %116

; <label>:108:                                    ; preds = %104
  %109 = load i32, i32* %12, align 4
  %110 = shl i32 %109, 4
  %111 = load i8, i8* %16, align 1
  %112 = sext i8 %111 to i32
  %113 = add nsw i32 %110, %112
  %114 = sub nsw i32 %113, 65
  %115 = add nsw i32 %114, 10
  store i32 %115, i32* %12, align 4
  br label %118

; <label>:116:                                    ; preds = %104, %100
  %117 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:118:                                    ; preds = %108
  br label %119

; <label>:119:                                    ; preds = %118, %93
  %120 = load i32, i32* %13, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %13, align 4
  %122 = and i32 %120, 1
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %133

; <label>:124:                                    ; preds = %119
  %125 = load i32, i32* %12, align 4
  %126 = and i32 %125, 255
  %127 = trunc i32 %126 to i8
  %128 = load i32, i32* %13, align 4
  %129 = sdiv i32 %128, 2
  %130 = sub nsw i32 %129, 1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [32 x i8], [32 x i8]* %7, i64 0, i64 %131
  store i8 %127, i8* %132, align 1
  br label %133

; <label>:133:                                    ; preds = %124, %119
  br label %69

; <label>:134:                                    ; preds = %77
  %135 = getelementptr inbounds [32 x i8], [32 x i8]* %7, i32 0, i32 0
  call void @BF_set_key(%struct.bf_key_st* %6, i32 8, i8* %135)
  %136 = load i8*, i8** %15, align 8
  %137 = load i8, i8* %136, align 1
  %138 = icmp ne i8 %137, 0
  br i1 %138, label %139, label %141

; <label>:139:                                    ; preds = %134
  %140 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:141:                                    ; preds = %134
  %142 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %142, %struct._IO_FILE** %19, align 8
  %143 = icmp eq %struct._IO_FILE* %142, null
  br i1 %143, label %144, label %147

; <label>:144:                                    ; preds = %141
  %145 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %146 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %145, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i32 0, i32 0))
  store i32 1, i32* %3, align 4
  br label %236

; <label>:147:                                    ; preds = %141
  %148 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %149 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %148, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i64* %21)
  %150 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %151 = call i32 @fclose(%struct._IO_FILE* %150)
  %152 = load i8**, i8*** %5, align 8
  %153 = getelementptr inbounds i8*, i8** %152, i64 2
  %154 = load i8*, i8** %153, align 8
  %155 = call %struct._IO_FILE* @fopen(i8* %154, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %155, %struct._IO_FILE** %17, align 8
  %156 = icmp eq %struct._IO_FILE* %155, null
  br i1 %156, label %157, label %160

; <label>:157:                                    ; preds = %147
  %158 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %159 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %158, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:160:                                    ; preds = %147
  %161 = load i8**, i8*** %5, align 8
  %162 = getelementptr inbounds i8*, i8** %161, i64 3
  %163 = load i8*, i8** %162, align 8
  %164 = call %struct._IO_FILE* @fopen(i8* %163, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0))
  store %struct._IO_FILE* %164, %struct._IO_FILE** %18, align 8
  %165 = icmp eq %struct._IO_FILE* %164, null
  br i1 %165, label %166, label %169

; <label>:166:                                    ; preds = %160
  %167 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %168 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %167, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:169:                                    ; preds = %160
  store i32 0, i32* %13, align 4
  br label %170

; <label>:170:                                    ; preds = %230, %169
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %172 = call i32 @feof(%struct._IO_FILE* %171) #8
  %173 = icmp ne i32 %172, 0
  %174 = xor i1 %173, true
  br i1 %174, label %175, label %231

; <label>:175:                                    ; preds = %170
  br label %176

; <label>:176:                                    ; preds = %185, %175
  %177 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %178 = call i32 @feof(%struct._IO_FILE* %177) #8
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %183, label %180

; <label>:180:                                    ; preds = %176
  %181 = load i32, i32* %13, align 4
  %182 = icmp slt i32 %181, 40
  br label %183

; <label>:183:                                    ; preds = %180, %176
  %184 = phi i1 [ false, %176 ], [ %182, %180 ]
  br i1 %184, label %185, label %193

; <label>:185:                                    ; preds = %183
  %186 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %187 = call i32 @_IO_getc(%struct._IO_FILE* %186)
  %188 = trunc i32 %187 to i8
  %189 = load i32, i32* %13, align 4
  %190 = add nsw i32 %189, 1
  store i32 %190, i32* %13, align 4
  %191 = sext i32 %189 to i64
  %192 = getelementptr inbounds [40 x i8], [40 x i8]* %8, i64 0, i64 %191
  store i8 %188, i8* %192, align 1
  br label %176

; <label>:193:                                    ; preds = %183
  %194 = load i32, i32* %11, align 4
  store i32 %194, i32* %22, align 4
  %195 = getelementptr inbounds [32 x i8], [32 x i8]* %23, i32 0, i32 0
  %196 = getelementptr inbounds [32 x i8], [32 x i8]* %10, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %195, i8* %196, i64 32, i32 16, i1 false)
  store i64 0, i64* %20, align 8
  br label %197

; <label>:197:                                    ; preds = %211, %193
  %198 = load i64, i64* %20, align 8
  %199 = load i64, i64* %21, align 8
  %200 = icmp slt i64 %198, %199
  br i1 %200, label %201, label %214

; <label>:201:                                    ; preds = %197
  %202 = load i32, i32* %22, align 4
  store i32 %202, i32* %11, align 4
  %203 = getelementptr inbounds [32 x i8], [32 x i8]* %10, i32 0, i32 0
  %204 = getelementptr inbounds [32 x i8], [32 x i8]* %23, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %203, i8* %204, i64 32, i32 16, i1 false)
  %205 = getelementptr inbounds [40 x i8], [40 x i8]* %8, i32 0, i32 0
  %206 = getelementptr inbounds [40 x i8], [40 x i8]* %9, i32 0, i32 0
  %207 = load i32, i32* %13, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [32 x i8], [32 x i8]* %10, i32 0, i32 0
  %210 = load i32, i32* %14, align 4
  call void @BF_cfb64_encrypt(i8* %205, i8* %206, i64 %208, %struct.bf_key_st* %6, i8* %209, i32* %11, i32 %210)
  br label %211

; <label>:211:                                    ; preds = %201
  %212 = load i64, i64* %20, align 8
  %213 = add nsw i64 %212, 1
  store i64 %213, i64* %20, align 8
  br label %197

; <label>:214:                                    ; preds = %197
  store i32 0, i32* %24, align 4
  br label %215

; <label>:215:                                    ; preds = %227, %214
  %216 = load i32, i32* %24, align 4
  %217 = load i32, i32* %13, align 4
  %218 = icmp slt i32 %216, %217
  br i1 %218, label %219, label %230

; <label>:219:                                    ; preds = %215
  %220 = load i32, i32* %24, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [40 x i8], [40 x i8]* %9, i64 0, i64 %221
  %223 = load i8, i8* %222, align 1
  %224 = zext i8 %223 to i32
  %225 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %226 = call i32 @fputc(i32 %224, %struct._IO_FILE* %225)
  br label %227

; <label>:227:                                    ; preds = %219
  %228 = load i32, i32* %24, align 4
  %229 = add nsw i32 %228, 1
  store i32 %229, i32* %24, align 4
  br label %215

; <label>:230:                                    ; preds = %215
  store i32 0, i32* %13, align 4
  br label %170

; <label>:231:                                    ; preds = %170
  %232 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %233 = call i32 @fclose(%struct._IO_FILE* %232)
  %234 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %235 = call i32 @fclose(%struct._IO_FILE* %234)
  store i32 0, i32* %3, align 4
  br label %236

; <label>:236:                                    ; preds = %231, %144
  %237 = load i32, i32* %3, align 4
  ret i32 %237
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
