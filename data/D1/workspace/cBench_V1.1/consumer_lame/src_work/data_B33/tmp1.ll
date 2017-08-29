; ModuleID = 'interface.ll'
source_filename = "interface.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mpstr = type { %struct.buf*, %struct.buf*, i32, i32, i32, %struct.frame, [2 x [2304 x i8]], [2 x [2 x [576 x double]]], [2 x i32], i64, i32, [2 x [2 x [272 x double]]], i32 }
%struct.buf = type { i8*, i64, i64, %struct.buf*, %struct.buf* }
%struct.frame = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@gmp = common global %struct.mpstr* null, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [19 x i8] c"To less out space\0A\00", align 1
@wordpointer = external global i8*, align 8
@bitindex = external global i32, align 4
@.str.1 = private unnamed_addr constant [22 x i8] c"Can't step back %ld!\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Out of memory!\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"Fatal error!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @InitMP3(%struct.mpstr*) #0 {
  %2 = alloca %struct.mpstr*, align 8
  store %struct.mpstr* %0, %struct.mpstr** %2, align 8
  %3 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %4 = bitcast %struct.mpstr* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 31880, i32 8, i1 false)
  %5 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %6 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %5, i32 0, i32 3
  store i32 0, i32* %6, align 4
  %7 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %8 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %7, i32 0, i32 4
  store i32 -1, i32* %8, align 8
  %9 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %10 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %9, i32 0, i32 2
  store i32 0, i32* %10, align 8
  %11 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %12 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %11, i32 0, i32 1
  store %struct.buf* null, %struct.buf** %12, align 8
  %13 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %14 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %13, i32 0, i32 0
  store %struct.buf* null, %struct.buf** %14, align 8
  %15 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %16 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %15, i32 0, i32 5
  %17 = getelementptr inbounds %struct.frame, %struct.frame* %16, i32 0, i32 2
  store i32 -1, i32* %17, align 4
  %18 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %19 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %18, i32 0, i32 10
  store i32 0, i32* %19, align 8
  %20 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %21 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %20, i32 0, i32 12
  store i32 1, i32* %21, align 8
  call void @make_decode_tables(i64 32767)
  call void @init_layer3(i32 32)
  ret i32 1
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @make_decode_tables(i64) #2

declare void @init_layer3(i32) #2

; Function Attrs: noinline nounwind uwtable
define void @ExitMP3(%struct.mpstr*) #0 {
  %2 = alloca %struct.mpstr*, align 8
  %3 = alloca %struct.buf*, align 8
  %4 = alloca %struct.buf*, align 8
  store %struct.mpstr* %0, %struct.mpstr** %2, align 8
  %5 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %6 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %5, i32 0, i32 1
  %7 = load %struct.buf*, %struct.buf** %6, align 8
  store %struct.buf* %7, %struct.buf** %3, align 8
  br label %8

; <label>:8:                                      ; preds = %11, %1
  %9 = load %struct.buf*, %struct.buf** %3, align 8
  %10 = icmp ne %struct.buf* %9, null
  br i1 %10, label %11, label %21

; <label>:11:                                     ; preds = %8
  %12 = load %struct.buf*, %struct.buf** %3, align 8
  %13 = getelementptr inbounds %struct.buf, %struct.buf* %12, i32 0, i32 0
  %14 = load i8*, i8** %13, align 8
  call void @free(i8* %14) #5
  %15 = load %struct.buf*, %struct.buf** %3, align 8
  %16 = getelementptr inbounds %struct.buf, %struct.buf* %15, i32 0, i32 3
  %17 = load %struct.buf*, %struct.buf** %16, align 8
  store %struct.buf* %17, %struct.buf** %4, align 8
  %18 = load %struct.buf*, %struct.buf** %3, align 8
  %19 = bitcast %struct.buf* %18 to i8*
  call void @free(i8* %19) #5
  %20 = load %struct.buf*, %struct.buf** %4, align 8
  store %struct.buf* %20, %struct.buf** %3, align 8
  br label %8

; <label>:21:                                     ; preds = %8
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define i32 @decodeMP3(%struct.mpstr*, i8*, i32, i8*, i32, i32*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca %struct.mpstr*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store %struct.mpstr* %0, %struct.mpstr** %8, align 8
  store i8* %1, i8** %9, align 8
  store i32 %2, i32* %10, align 4
  store i8* %3, i8** %11, align 8
  store i32 %4, i32* %12, align 4
  store i32* %5, i32** %13, align 8
  %17 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  store %struct.mpstr* %17, %struct.mpstr** @gmp, align 8
  %18 = load i32, i32* %12, align 4
  %19 = icmp slt i32 %18, 4608
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0))
  store i32 -1, i32* %7, align 4
  br label %190

; <label>:23:                                     ; preds = %6
  %24 = load i8*, i8** %9, align 8
  %25 = icmp ne i8* %24, null
  br i1 %25, label %26, label %34

; <label>:26:                                     ; preds = %23
  %27 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %28 = load i8*, i8** %9, align 8
  %29 = load i32, i32* %10, align 4
  %30 = call %struct.buf* @addbuf(%struct.mpstr* %27, i8* %28, i32 %29)
  %31 = icmp eq %struct.buf* %30, null
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %26
  store i32 -1, i32* %7, align 4
  br label %190

; <label>:33:                                     ; preds = %26
  br label %34

; <label>:34:                                     ; preds = %33, %23
  %35 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %36 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %35, i32 0, i32 3
  %37 = load i32, i32* %36, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %59

; <label>:39:                                     ; preds = %34
  %40 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %41 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %40, i32 0, i32 2
  %42 = load i32, i32* %41, align 8
  %43 = icmp slt i32 %42, 4
  br i1 %43, label %44, label %45

; <label>:44:                                     ; preds = %39
  store i32 1, i32* %7, align 4
  br label %190

; <label>:45:                                     ; preds = %39
  %46 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  call void @read_head(%struct.mpstr* %46)
  %47 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %48 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %47, i32 0, i32 5
  %49 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %50 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %49, i32 0, i32 9
  %51 = load i64, i64* %50, align 8
  %52 = call i32 @decode_header(%struct.frame* %48, i64 %51)
  %53 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %54 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %53, i32 0, i32 5
  %55 = getelementptr inbounds %struct.frame, %struct.frame* %54, i32 0, i32 17
  %56 = load i32, i32* %55, align 4
  %57 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %58 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %57, i32 0, i32 3
  store i32 %56, i32* %58, align 4
  br label %59

; <label>:59:                                     ; preds = %45, %34
  %60 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %61 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %60, i32 0, i32 5
  %62 = getelementptr inbounds %struct.frame, %struct.frame* %61, i32 0, i32 17
  %63 = load i32, i32* %62, align 4
  %64 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %65 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %64, i32 0, i32 2
  %66 = load i32, i32* %65, align 8
  %67 = icmp sgt i32 %63, %66
  br i1 %67, label %68, label %69

; <label>:68:                                     ; preds = %59
  store i32 1, i32* %7, align 4
  br label %190

; <label>:69:                                     ; preds = %59
  %70 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %71 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %70, i32 0, i32 6
  %72 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %73 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %72, i32 0, i32 10
  %74 = load i32, i32* %73, align 8
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [2 x [2304 x i8]], [2 x [2304 x i8]]* %71, i64 0, i64 %75
  %77 = getelementptr inbounds [2304 x i8], [2304 x i8]* %76, i32 0, i32 0
  %78 = getelementptr inbounds i8, i8* %77, i64 512
  store i8* %78, i8** @wordpointer, align 8
  %79 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %80 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %79, i32 0, i32 10
  %81 = load i32, i32* %80, align 8
  %82 = add nsw i32 %81, 1
  %83 = and i32 %82, 1
  %84 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %85 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %84, i32 0, i32 10
  store i32 %83, i32* %85, align 8
  store i32 0, i32* @bitindex, align 4
  store i32 0, i32* %14, align 4
  br label %86

; <label>:86:                                     ; preds = %167, %69
  %87 = load i32, i32* %14, align 4
  %88 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %89 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %88, i32 0, i32 3
  %90 = load i32, i32* %89, align 4
  %91 = icmp slt i32 %87, %90
  br i1 %91, label %92, label %168

; <label>:92:                                     ; preds = %86
  %93 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %94 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %93, i32 0, i32 1
  %95 = load %struct.buf*, %struct.buf** %94, align 8
  %96 = getelementptr inbounds %struct.buf, %struct.buf* %95, i32 0, i32 1
  %97 = load i64, i64* %96, align 8
  %98 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %99 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %98, i32 0, i32 1
  %100 = load %struct.buf*, %struct.buf** %99, align 8
  %101 = getelementptr inbounds %struct.buf, %struct.buf* %100, i32 0, i32 2
  %102 = load i64, i64* %101, align 8
  %103 = sub nsw i64 %97, %102
  %104 = trunc i64 %103 to i32
  store i32 %104, i32* %16, align 4
  %105 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %106 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %105, i32 0, i32 3
  %107 = load i32, i32* %106, align 4
  %108 = load i32, i32* %14, align 4
  %109 = sub nsw i32 %107, %108
  %110 = load i32, i32* %16, align 4
  %111 = icmp sle i32 %109, %110
  br i1 %111, label %112, label %118

; <label>:112:                                    ; preds = %92
  %113 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %114 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %113, i32 0, i32 3
  %115 = load i32, i32* %114, align 4
  %116 = load i32, i32* %14, align 4
  %117 = sub nsw i32 %115, %116
  store i32 %117, i32* %15, align 4
  br label %120

; <label>:118:                                    ; preds = %92
  %119 = load i32, i32* %16, align 4
  store i32 %119, i32* %15, align 4
  br label %120

; <label>:120:                                    ; preds = %118, %112
  %121 = load i8*, i8** @wordpointer, align 8
  %122 = load i32, i32* %14, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i8, i8* %121, i64 %123
  %125 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %126 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %125, i32 0, i32 1
  %127 = load %struct.buf*, %struct.buf** %126, align 8
  %128 = getelementptr inbounds %struct.buf, %struct.buf* %127, i32 0, i32 0
  %129 = load i8*, i8** %128, align 8
  %130 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %131 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %130, i32 0, i32 1
  %132 = load %struct.buf*, %struct.buf** %131, align 8
  %133 = getelementptr inbounds %struct.buf, %struct.buf* %132, i32 0, i32 2
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds i8, i8* %129, i64 %134
  %136 = load i32, i32* %15, align 4
  %137 = sext i32 %136 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %124, i8* %135, i64 %137, i32 1, i1 false)
  %138 = load i32, i32* %15, align 4
  %139 = load i32, i32* %14, align 4
  %140 = add nsw i32 %139, %138
  store i32 %140, i32* %14, align 4
  %141 = load i32, i32* %15, align 4
  %142 = sext i32 %141 to i64
  %143 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %144 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %143, i32 0, i32 1
  %145 = load %struct.buf*, %struct.buf** %144, align 8
  %146 = getelementptr inbounds %struct.buf, %struct.buf* %145, i32 0, i32 2
  %147 = load i64, i64* %146, align 8
  %148 = add nsw i64 %147, %142
  store i64 %148, i64* %146, align 8
  %149 = load i32, i32* %15, align 4
  %150 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %151 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %150, i32 0, i32 2
  %152 = load i32, i32* %151, align 8
  %153 = sub nsw i32 %152, %149
  store i32 %153, i32* %151, align 8
  %154 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %155 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %154, i32 0, i32 1
  %156 = load %struct.buf*, %struct.buf** %155, align 8
  %157 = getelementptr inbounds %struct.buf, %struct.buf* %156, i32 0, i32 2
  %158 = load i64, i64* %157, align 8
  %159 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %160 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %159, i32 0, i32 1
  %161 = load %struct.buf*, %struct.buf** %160, align 8
  %162 = getelementptr inbounds %struct.buf, %struct.buf* %161, i32 0, i32 1
  %163 = load i64, i64* %162, align 8
  %164 = icmp eq i64 %158, %163
  br i1 %164, label %165, label %167

; <label>:165:                                    ; preds = %120
  %166 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  call void @remove_buf(%struct.mpstr* %166)
  br label %167

; <label>:167:                                    ; preds = %165, %120
  br label %86

; <label>:168:                                    ; preds = %86
  %169 = load i32*, i32** %13, align 8
  store i32 0, i32* %169, align 4
  %170 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %171 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %170, i32 0, i32 5
  %172 = getelementptr inbounds %struct.frame, %struct.frame* %171, i32 0, i32 7
  %173 = load i32, i32* %172, align 4
  %174 = icmp ne i32 %173, 0
  br i1 %174, label %175, label %177

; <label>:175:                                    ; preds = %168
  %176 = call i32 @getbits(i32 16)
  br label %177

; <label>:177:                                    ; preds = %175, %168
  %178 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %179 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %178, i32 0, i32 5
  %180 = load i8*, i8** %11, align 8
  %181 = load i32*, i32** %13, align 8
  %182 = call i32 @do_layer3(%struct.frame* %179, i8* %180, i32* %181)
  %183 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %184 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %183, i32 0, i32 3
  %185 = load i32, i32* %184, align 4
  %186 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %187 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %186, i32 0, i32 4
  store i32 %185, i32* %187, align 8
  %188 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %189 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %188, i32 0, i32 3
  store i32 0, i32* %189, align 4
  store i32 0, i32* %7, align 4
  br label %190

; <label>:190:                                    ; preds = %177, %68, %44, %32, %20
  %191 = load i32, i32* %7, align 4
  ret i32 %191
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define internal %struct.buf* @addbuf(%struct.mpstr*, i8*, i32) #0 {
  %4 = alloca %struct.buf*, align 8
  %5 = alloca %struct.mpstr*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.buf*, align 8
  store %struct.mpstr* %0, %struct.mpstr** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %9 = call noalias i8* @malloc(i64 40) #5
  %10 = bitcast i8* %9 to %struct.buf*
  store %struct.buf* %10, %struct.buf** %8, align 8
  %11 = load %struct.buf*, %struct.buf** %8, align 8
  %12 = icmp ne %struct.buf* %11, null
  br i1 %12, label %16, label %13

; <label>:13:                                     ; preds = %3
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
  store %struct.buf* null, %struct.buf** %4, align 8
  br label %73

; <label>:16:                                     ; preds = %3
  %17 = load i32, i32* %7, align 4
  %18 = sext i32 %17 to i64
  %19 = call noalias i8* @malloc(i64 %18) #5
  %20 = load %struct.buf*, %struct.buf** %8, align 8
  %21 = getelementptr inbounds %struct.buf, %struct.buf* %20, i32 0, i32 0
  store i8* %19, i8** %21, align 8
  %22 = load %struct.buf*, %struct.buf** %8, align 8
  %23 = getelementptr inbounds %struct.buf, %struct.buf* %22, i32 0, i32 0
  %24 = load i8*, i8** %23, align 8
  %25 = icmp ne i8* %24, null
  br i1 %25, label %29, label %26

; <label>:26:                                     ; preds = %16
  %27 = load %struct.buf*, %struct.buf** %8, align 8
  %28 = bitcast %struct.buf* %27 to i8*
  call void @free(i8* %28) #5
  store %struct.buf* null, %struct.buf** %4, align 8
  br label %73

; <label>:29:                                     ; preds = %16
  %30 = load i32, i32* %7, align 4
  %31 = sext i32 %30 to i64
  %32 = load %struct.buf*, %struct.buf** %8, align 8
  %33 = getelementptr inbounds %struct.buf, %struct.buf* %32, i32 0, i32 1
  store i64 %31, i64* %33, align 8
  %34 = load %struct.buf*, %struct.buf** %8, align 8
  %35 = getelementptr inbounds %struct.buf, %struct.buf* %34, i32 0, i32 0
  %36 = load i8*, i8** %35, align 8
  %37 = load i8*, i8** %6, align 8
  %38 = load i32, i32* %7, align 4
  %39 = sext i32 %38 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* %37, i64 %39, i32 1, i1 false)
  %40 = load %struct.buf*, %struct.buf** %8, align 8
  %41 = getelementptr inbounds %struct.buf, %struct.buf* %40, i32 0, i32 3
  store %struct.buf* null, %struct.buf** %41, align 8
  %42 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %43 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %42, i32 0, i32 0
  %44 = load %struct.buf*, %struct.buf** %43, align 8
  %45 = load %struct.buf*, %struct.buf** %8, align 8
  %46 = getelementptr inbounds %struct.buf, %struct.buf* %45, i32 0, i32 4
  store %struct.buf* %44, %struct.buf** %46, align 8
  %47 = load %struct.buf*, %struct.buf** %8, align 8
  %48 = getelementptr inbounds %struct.buf, %struct.buf* %47, i32 0, i32 2
  store i64 0, i64* %48, align 8
  %49 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %50 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %49, i32 0, i32 1
  %51 = load %struct.buf*, %struct.buf** %50, align 8
  %52 = icmp ne %struct.buf* %51, null
  br i1 %52, label %57, label %53

; <label>:53:                                     ; preds = %29
  %54 = load %struct.buf*, %struct.buf** %8, align 8
  %55 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %56 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %55, i32 0, i32 1
  store %struct.buf* %54, %struct.buf** %56, align 8
  br label %63

; <label>:57:                                     ; preds = %29
  %58 = load %struct.buf*, %struct.buf** %8, align 8
  %59 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %60 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %59, i32 0, i32 0
  %61 = load %struct.buf*, %struct.buf** %60, align 8
  %62 = getelementptr inbounds %struct.buf, %struct.buf* %61, i32 0, i32 3
  store %struct.buf* %58, %struct.buf** %62, align 8
  br label %63

; <label>:63:                                     ; preds = %57, %53
  %64 = load %struct.buf*, %struct.buf** %8, align 8
  %65 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %66 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %65, i32 0, i32 0
  store %struct.buf* %64, %struct.buf** %66, align 8
  %67 = load i32, i32* %7, align 4
  %68 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %69 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %68, i32 0, i32 2
  %70 = load i32, i32* %69, align 8
  %71 = add nsw i32 %70, %67
  store i32 %71, i32* %69, align 8
  %72 = load %struct.buf*, %struct.buf** %8, align 8
  store %struct.buf* %72, %struct.buf** %4, align 8
  br label %73

; <label>:73:                                     ; preds = %63, %26, %13
  %74 = load %struct.buf*, %struct.buf** %4, align 8
  ret %struct.buf* %74
}

; Function Attrs: noinline nounwind uwtable
define internal void @read_head(%struct.mpstr*) #0 {
  %2 = alloca %struct.mpstr*, align 8
  %3 = alloca i64, align 8
  store %struct.mpstr* %0, %struct.mpstr** %2, align 8
  %4 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %5 = call i32 @read_buf_byte(%struct.mpstr* %4)
  %6 = sext i32 %5 to i64
  store i64 %6, i64* %3, align 8
  %7 = load i64, i64* %3, align 8
  %8 = shl i64 %7, 8
  store i64 %8, i64* %3, align 8
  %9 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %10 = call i32 @read_buf_byte(%struct.mpstr* %9)
  %11 = sext i32 %10 to i64
  %12 = load i64, i64* %3, align 8
  %13 = or i64 %12, %11
  store i64 %13, i64* %3, align 8
  %14 = load i64, i64* %3, align 8
  %15 = shl i64 %14, 8
  store i64 %15, i64* %3, align 8
  %16 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %17 = call i32 @read_buf_byte(%struct.mpstr* %16)
  %18 = sext i32 %17 to i64
  %19 = load i64, i64* %3, align 8
  %20 = or i64 %19, %18
  store i64 %20, i64* %3, align 8
  %21 = load i64, i64* %3, align 8
  %22 = shl i64 %21, 8
  store i64 %22, i64* %3, align 8
  %23 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %24 = call i32 @read_buf_byte(%struct.mpstr* %23)
  %25 = sext i32 %24 to i64
  %26 = load i64, i64* %3, align 8
  %27 = or i64 %26, %25
  store i64 %27, i64* %3, align 8
  %28 = load i64, i64* %3, align 8
  %29 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %30 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %29, i32 0, i32 9
  store i64 %28, i64* %30, align 8
  ret void
}

declare i32 @decode_header(%struct.frame*, i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define internal void @remove_buf(%struct.mpstr*) #0 {
  %2 = alloca %struct.mpstr*, align 8
  %3 = alloca %struct.buf*, align 8
  store %struct.mpstr* %0, %struct.mpstr** %2, align 8
  %4 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %5 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %4, i32 0, i32 1
  %6 = load %struct.buf*, %struct.buf** %5, align 8
  store %struct.buf* %6, %struct.buf** %3, align 8
  %7 = load %struct.buf*, %struct.buf** %3, align 8
  %8 = getelementptr inbounds %struct.buf, %struct.buf* %7, i32 0, i32 3
  %9 = load %struct.buf*, %struct.buf** %8, align 8
  %10 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %11 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %10, i32 0, i32 1
  store %struct.buf* %9, %struct.buf** %11, align 8
  %12 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %13 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %12, i32 0, i32 1
  %14 = load %struct.buf*, %struct.buf** %13, align 8
  %15 = icmp ne %struct.buf* %14, null
  br i1 %15, label %16, label %21

; <label>:16:                                     ; preds = %1
  %17 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %18 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %17, i32 0, i32 1
  %19 = load %struct.buf*, %struct.buf** %18, align 8
  %20 = getelementptr inbounds %struct.buf, %struct.buf* %19, i32 0, i32 4
  store %struct.buf* null, %struct.buf** %20, align 8
  br label %26

; <label>:21:                                     ; preds = %1
  %22 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %23 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %22, i32 0, i32 0
  store %struct.buf* null, %struct.buf** %23, align 8
  %24 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %25 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %24, i32 0, i32 1
  store %struct.buf* null, %struct.buf** %25, align 8
  br label %26

; <label>:26:                                     ; preds = %21, %16
  %27 = load %struct.buf*, %struct.buf** %3, align 8
  %28 = getelementptr inbounds %struct.buf, %struct.buf* %27, i32 0, i32 0
  %29 = load i8*, i8** %28, align 8
  call void @free(i8* %29) #5
  %30 = load %struct.buf*, %struct.buf** %3, align 8
  %31 = bitcast %struct.buf* %30 to i8*
  call void @free(i8* %31) #5
  ret void
}

declare i32 @getbits(i32) #2

declare i32 @do_layer3(%struct.frame*, i8*, i32*) #2

; Function Attrs: noinline nounwind uwtable
define i32 @set_pointer(i64) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  store i64 %0, i64* %3, align 8
  %5 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %6 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %5, i32 0, i32 4
  %7 = load i32, i32* %6, align 8
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %16

; <label>:9:                                      ; preds = %1
  %10 = load i64, i64* %3, align 8
  %11 = icmp sgt i64 %10, 0
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = load i64, i64* %3, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i64 %14)
  store i32 -1, i32* %2, align 4
  br label %45

; <label>:16:                                     ; preds = %9, %1
  %17 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %18 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %17, i32 0, i32 6
  %19 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %20 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %19, i32 0, i32 10
  %21 = load i32, i32* %20, align 8
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [2 x [2304 x i8]], [2 x [2304 x i8]]* %18, i64 0, i64 %22
  %24 = getelementptr inbounds [2304 x i8], [2304 x i8]* %23, i32 0, i32 0
  %25 = getelementptr inbounds i8, i8* %24, i64 512
  store i8* %25, i8** %4, align 8
  %26 = load i64, i64* %3, align 8
  %27 = load i8*, i8** @wordpointer, align 8
  %28 = sub i64 0, %26
  %29 = getelementptr inbounds i8, i8* %27, i64 %28
  store i8* %29, i8** @wordpointer, align 8
  %30 = load i64, i64* %3, align 8
  %31 = icmp ne i64 %30, 0
  br i1 %31, label %32, label %44

; <label>:32:                                     ; preds = %16
  %33 = load i8*, i8** @wordpointer, align 8
  %34 = load i8*, i8** %4, align 8
  %35 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %36 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %35, i32 0, i32 4
  %37 = load i32, i32* %36, align 8
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8* %34, i64 %38
  %40 = load i64, i64* %3, align 8
  %41 = sub i64 0, %40
  %42 = getelementptr inbounds i8, i8* %39, i64 %41
  %43 = load i64, i64* %3, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* %42, i64 %43, i32 1, i1 false)
  br label %44

; <label>:44:                                     ; preds = %32, %16
  store i32 0, i32* @bitindex, align 4
  store i32 0, i32* %2, align 4
  br label %45

; <label>:45:                                     ; preds = %44, %12
  %46 = load i32, i32* %2, align 4
  ret i32 %46
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_buf_byte(%struct.mpstr*) #0 {
  %2 = alloca %struct.mpstr*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %struct.mpstr* %0, %struct.mpstr** %2, align 8
  %5 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %6 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %5, i32 0, i32 1
  %7 = load %struct.buf*, %struct.buf** %6, align 8
  %8 = getelementptr inbounds %struct.buf, %struct.buf* %7, i32 0, i32 2
  %9 = load i64, i64* %8, align 8
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %4, align 4
  br label %11

; <label>:11:                                     ; preds = %35, %1
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %15 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %14, i32 0, i32 1
  %16 = load %struct.buf*, %struct.buf** %15, align 8
  %17 = getelementptr inbounds %struct.buf, %struct.buf* %16, i32 0, i32 1
  %18 = load i64, i64* %17, align 8
  %19 = icmp sge i64 %13, %18
  br i1 %19, label %20, label %36

; <label>:20:                                     ; preds = %11
  %21 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  call void @remove_buf(%struct.mpstr* %21)
  %22 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %23 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %22, i32 0, i32 1
  %24 = load %struct.buf*, %struct.buf** %23, align 8
  %25 = getelementptr inbounds %struct.buf, %struct.buf* %24, i32 0, i32 2
  %26 = load i64, i64* %25, align 8
  %27 = trunc i64 %26 to i32
  store i32 %27, i32* %4, align 4
  %28 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %29 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %28, i32 0, i32 1
  %30 = load %struct.buf*, %struct.buf** %29, align 8
  %31 = icmp ne %struct.buf* %30, null
  br i1 %31, label %35, label %32

; <label>:32:                                     ; preds = %20
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:35:                                     ; preds = %20
  br label %11

; <label>:36:                                     ; preds = %11
  %37 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %38 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %37, i32 0, i32 1
  %39 = load %struct.buf*, %struct.buf** %38, align 8
  %40 = getelementptr inbounds %struct.buf, %struct.buf* %39, i32 0, i32 0
  %41 = load i8*, i8** %40, align 8
  %42 = load i32, i32* %4, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8* %41, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  store i32 %46, i32* %3, align 4
  %47 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %48 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %47, i32 0, i32 2
  %49 = load i32, i32* %48, align 8
  %50 = add nsw i32 %49, -1
  store i32 %50, i32* %48, align 8
  %51 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %52 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %51, i32 0, i32 1
  %53 = load %struct.buf*, %struct.buf** %52, align 8
  %54 = getelementptr inbounds %struct.buf, %struct.buf* %53, i32 0, i32 2
  %55 = load i64, i64* %54, align 8
  %56 = add nsw i64 %55, 1
  store i64 %56, i64* %54, align 8
  %57 = load i32, i32* %3, align 4
  ret i32 %57
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
