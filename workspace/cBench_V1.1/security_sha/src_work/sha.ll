; ModuleID = 'sha.c'
source_filename = "sha.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.SHA_INFO = type { [5 x i64], i64, i64, [16 x i64] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [31 x i8] c"%08lx %08lx %08lx %08lx %08lx\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @sha_init(%struct.SHA_INFO*) #0 {
  %2 = alloca %struct.SHA_INFO*, align 8
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %2, align 8
  %3 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %4 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %3, i32 0, i32 0
  %5 = getelementptr inbounds [5 x i64], [5 x i64]* %4, i64 0, i64 0
  store i64 1732584193, i64* %5, align 8
  %6 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %7 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %6, i32 0, i32 0
  %8 = getelementptr inbounds [5 x i64], [5 x i64]* %7, i64 0, i64 1
  store i64 4023233417, i64* %8, align 8
  %9 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %10 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %9, i32 0, i32 0
  %11 = getelementptr inbounds [5 x i64], [5 x i64]* %10, i64 0, i64 2
  store i64 2562383102, i64* %11, align 8
  %12 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %13 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %12, i32 0, i32 0
  %14 = getelementptr inbounds [5 x i64], [5 x i64]* %13, i64 0, i64 3
  store i64 271733878, i64* %14, align 8
  %15 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %16 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %15, i32 0, i32 0
  %17 = getelementptr inbounds [5 x i64], [5 x i64]* %16, i64 0, i64 4
  store i64 3285377520, i64* %17, align 8
  %18 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %19 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %18, i32 0, i32 1
  store i64 0, i64* %19, align 8
  %20 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %21 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %20, i32 0, i32 2
  store i64 0, i64* %21, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sha_update(%struct.SHA_INFO*, i8*, i32) #0 {
  %4 = alloca %struct.SHA_INFO*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %8 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %7, i32 0, i32 1
  %9 = load i64, i64* %8, align 8
  %10 = load i32, i32* %6, align 4
  %11 = sext i32 %10 to i64
  %12 = shl i64 %11, 3
  %13 = add i64 %9, %12
  %14 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %15 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %14, i32 0, i32 1
  %16 = load i64, i64* %15, align 8
  %17 = icmp ult i64 %13, %16
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %3
  %19 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %20 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %19, i32 0, i32 2
  %21 = load i64, i64* %20, align 8
  %22 = add i64 %21, 1
  store i64 %22, i64* %20, align 8
  br label %23

; <label>:23:                                     ; preds = %18, %3
  %24 = load i32, i32* %6, align 4
  %25 = sext i32 %24 to i64
  %26 = shl i64 %25, 3
  %27 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %28 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %27, i32 0, i32 1
  %29 = load i64, i64* %28, align 8
  %30 = add i64 %29, %26
  store i64 %30, i64* %28, align 8
  %31 = load i32, i32* %6, align 4
  %32 = sext i32 %31 to i64
  %33 = lshr i64 %32, 29
  %34 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %35 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %34, i32 0, i32 2
  %36 = load i64, i64* %35, align 8
  %37 = add i64 %36, %33
  store i64 %37, i64* %35, align 8
  br label %38

; <label>:38:                                     ; preds = %41, %23
  %39 = load i32, i32* %6, align 4
  %40 = icmp sge i32 %39, 64
  br i1 %40, label %41, label %55

; <label>:41:                                     ; preds = %38
  %42 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %43 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %42, i32 0, i32 3
  %44 = getelementptr inbounds [16 x i64], [16 x i64]* %43, i32 0, i32 0
  %45 = bitcast i64* %44 to i8*
  %46 = load i8*, i8** %5, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* %46, i64 64, i32 1, i1 false)
  %47 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %48 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %47, i32 0, i32 3
  %49 = getelementptr inbounds [16 x i64], [16 x i64]* %48, i32 0, i32 0
  call void @byte_reverse(i64* %49, i32 64)
  %50 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  call void @sha_transform(%struct.SHA_INFO* %50)
  %51 = load i8*, i8** %5, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 64
  store i8* %52, i8** %5, align 8
  %53 = load i32, i32* %6, align 4
  %54 = sub nsw i32 %53, 64
  store i32 %54, i32* %6, align 4
  br label %38

; <label>:55:                                     ; preds = %38
  %56 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %57 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %56, i32 0, i32 3
  %58 = getelementptr inbounds [16 x i64], [16 x i64]* %57, i32 0, i32 0
  %59 = bitcast i64* %58 to i8*
  %60 = load i8*, i8** %5, align 8
  %61 = load i32, i32* %6, align 4
  %62 = sext i32 %61 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %59, i8* %60, i64 %62, i32 1, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define internal void @byte_reverse(i64*, i32) #0 {
  %3 = alloca i64*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [4 x i8], align 1
  %7 = alloca i8*, align 8
  store i64* %0, i64** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load i32, i32* %4, align 4
  %9 = sext i32 %8 to i64
  %10 = udiv i64 %9, 8
  %11 = trunc i64 %10 to i32
  store i32 %11, i32* %4, align 4
  %12 = load i64*, i64** %3, align 8
  %13 = bitcast i64* %12 to i8*
  store i8* %13, i8** %7, align 8
  store i32 0, i32* %5, align 4
  br label %14

; <label>:14:                                     ; preds = %53, %2
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %4, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %56

; <label>:18:                                     ; preds = %14
  %19 = load i8*, i8** %7, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  %21 = load i8, i8* %20, align 1
  %22 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 0
  store i8 %21, i8* %22, align 1
  %23 = load i8*, i8** %7, align 8
  %24 = getelementptr inbounds i8, i8* %23, i64 1
  %25 = load i8, i8* %24, align 1
  %26 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 1
  store i8 %25, i8* %26, align 1
  %27 = load i8*, i8** %7, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 2
  %29 = load i8, i8* %28, align 1
  %30 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 2
  store i8 %29, i8* %30, align 1
  %31 = load i8*, i8** %7, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 3
  %33 = load i8, i8* %32, align 1
  %34 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 3
  store i8 %33, i8* %34, align 1
  %35 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 3
  %36 = load i8, i8* %35, align 1
  %37 = load i8*, i8** %7, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 0
  store i8 %36, i8* %38, align 1
  %39 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 2
  %40 = load i8, i8* %39, align 1
  %41 = load i8*, i8** %7, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 1
  store i8 %40, i8* %42, align 1
  %43 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 1
  %44 = load i8, i8* %43, align 1
  %45 = load i8*, i8** %7, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 2
  store i8 %44, i8* %46, align 1
  %47 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 0
  %48 = load i8, i8* %47, align 1
  %49 = load i8*, i8** %7, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 3
  store i8 %48, i8* %50, align 1
  %51 = load i8*, i8** %7, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 8
  store i8* %52, i8** %7, align 8
  br label %53

; <label>:53:                                     ; preds = %18
  %54 = load i32, i32* %5, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %5, align 4
  br label %14

; <label>:56:                                     ; preds = %14
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @sha_transform(%struct.SHA_INFO*) #0 {
  %2 = alloca %struct.SHA_INFO*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca [80 x i64], align 16
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %2, align 8
  store i32 0, i32* %3, align 4
  br label %11

; <label>:11:                                     ; preds = %24, %1
  %12 = load i32, i32* %3, align 4
  %13 = icmp slt i32 %12, 16
  br i1 %13, label %14, label %27

; <label>:14:                                     ; preds = %11
  %15 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %16 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %15, i32 0, i32 3
  %17 = load i32, i32* %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [16 x i64], [16 x i64]* %16, i64 0, i64 %18
  %20 = load i64, i64* %19, align 8
  %21 = load i32, i32* %3, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %22
  store i64 %20, i64* %23, align 8
  br label %24

; <label>:24:                                     ; preds = %14
  %25 = load i32, i32* %3, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %3, align 4
  br label %11

; <label>:27:                                     ; preds = %11
  store i32 16, i32* %3, align 4
  br label %28

; <label>:28:                                     ; preds = %58, %27
  %29 = load i32, i32* %3, align 4
  %30 = icmp slt i32 %29, 80
  br i1 %30, label %31, label %61

; <label>:31:                                     ; preds = %28
  %32 = load i32, i32* %3, align 4
  %33 = sub nsw i32 %32, 3
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %34
  %36 = load i64, i64* %35, align 8
  %37 = load i32, i32* %3, align 4
  %38 = sub nsw i32 %37, 8
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %39
  %41 = load i64, i64* %40, align 8
  %42 = xor i64 %36, %41
  %43 = load i32, i32* %3, align 4
  %44 = sub nsw i32 %43, 14
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %45
  %47 = load i64, i64* %46, align 8
  %48 = xor i64 %42, %47
  %49 = load i32, i32* %3, align 4
  %50 = sub nsw i32 %49, 16
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %51
  %53 = load i64, i64* %52, align 8
  %54 = xor i64 %48, %53
  %55 = load i32, i32* %3, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %56
  store i64 %54, i64* %57, align 8
  br label %58

; <label>:58:                                     ; preds = %31
  %59 = load i32, i32* %3, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %3, align 4
  br label %28

; <label>:61:                                     ; preds = %28
  %62 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %63 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %62, i32 0, i32 0
  %64 = getelementptr inbounds [5 x i64], [5 x i64]* %63, i64 0, i64 0
  %65 = load i64, i64* %64, align 8
  store i64 %65, i64* %5, align 8
  %66 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %67 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %66, i32 0, i32 0
  %68 = getelementptr inbounds [5 x i64], [5 x i64]* %67, i64 0, i64 1
  %69 = load i64, i64* %68, align 8
  store i64 %69, i64* %6, align 8
  %70 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %71 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %70, i32 0, i32 0
  %72 = getelementptr inbounds [5 x i64], [5 x i64]* %71, i64 0, i64 2
  %73 = load i64, i64* %72, align 8
  store i64 %73, i64* %7, align 8
  %74 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %75 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %74, i32 0, i32 0
  %76 = getelementptr inbounds [5 x i64], [5 x i64]* %75, i64 0, i64 3
  %77 = load i64, i64* %76, align 8
  store i64 %77, i64* %8, align 8
  %78 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %79 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %78, i32 0, i32 0
  %80 = getelementptr inbounds [5 x i64], [5 x i64]* %79, i64 0, i64 4
  %81 = load i64, i64* %80, align 8
  store i64 %81, i64* %9, align 8
  store i32 0, i32* %3, align 4
  br label %82

; <label>:82:                                     ; preds = %117, %61
  %83 = load i32, i32* %3, align 4
  %84 = icmp slt i32 %83, 20
  br i1 %84, label %85, label %120

; <label>:85:                                     ; preds = %82
  %86 = load i64, i64* %5, align 8
  %87 = shl i64 %86, 5
  %88 = load i64, i64* %5, align 8
  %89 = lshr i64 %88, 27
  %90 = or i64 %87, %89
  %91 = load i64, i64* %6, align 8
  %92 = load i64, i64* %7, align 8
  %93 = and i64 %91, %92
  %94 = load i64, i64* %6, align 8
  %95 = xor i64 %94, -1
  %96 = load i64, i64* %8, align 8
  %97 = and i64 %95, %96
  %98 = or i64 %93, %97
  %99 = add i64 %90, %98
  %100 = load i64, i64* %9, align 8
  %101 = add i64 %99, %100
  %102 = load i32, i32* %3, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %103
  %105 = load i64, i64* %104, align 8
  %106 = add i64 %101, %105
  %107 = add i64 %106, 1518500249
  store i64 %107, i64* %4, align 8
  %108 = load i64, i64* %8, align 8
  store i64 %108, i64* %9, align 8
  %109 = load i64, i64* %7, align 8
  store i64 %109, i64* %8, align 8
  %110 = load i64, i64* %6, align 8
  %111 = shl i64 %110, 30
  %112 = load i64, i64* %6, align 8
  %113 = lshr i64 %112, 2
  %114 = or i64 %111, %113
  store i64 %114, i64* %7, align 8
  %115 = load i64, i64* %5, align 8
  store i64 %115, i64* %6, align 8
  %116 = load i64, i64* %4, align 8
  store i64 %116, i64* %5, align 8
  br label %117

; <label>:117:                                    ; preds = %85
  %118 = load i32, i32* %3, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %3, align 4
  br label %82

; <label>:120:                                    ; preds = %82
  store i32 20, i32* %3, align 4
  br label %121

; <label>:121:                                    ; preds = %153, %120
  %122 = load i32, i32* %3, align 4
  %123 = icmp slt i32 %122, 40
  br i1 %123, label %124, label %156

; <label>:124:                                    ; preds = %121
  %125 = load i64, i64* %5, align 8
  %126 = shl i64 %125, 5
  %127 = load i64, i64* %5, align 8
  %128 = lshr i64 %127, 27
  %129 = or i64 %126, %128
  %130 = load i64, i64* %6, align 8
  %131 = load i64, i64* %7, align 8
  %132 = xor i64 %130, %131
  %133 = load i64, i64* %8, align 8
  %134 = xor i64 %132, %133
  %135 = add i64 %129, %134
  %136 = load i64, i64* %9, align 8
  %137 = add i64 %135, %136
  %138 = load i32, i32* %3, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %139
  %141 = load i64, i64* %140, align 8
  %142 = add i64 %137, %141
  %143 = add i64 %142, 1859775393
  store i64 %143, i64* %4, align 8
  %144 = load i64, i64* %8, align 8
  store i64 %144, i64* %9, align 8
  %145 = load i64, i64* %7, align 8
  store i64 %145, i64* %8, align 8
  %146 = load i64, i64* %6, align 8
  %147 = shl i64 %146, 30
  %148 = load i64, i64* %6, align 8
  %149 = lshr i64 %148, 2
  %150 = or i64 %147, %149
  store i64 %150, i64* %7, align 8
  %151 = load i64, i64* %5, align 8
  store i64 %151, i64* %6, align 8
  %152 = load i64, i64* %4, align 8
  store i64 %152, i64* %5, align 8
  br label %153

; <label>:153:                                    ; preds = %124
  %154 = load i32, i32* %3, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %3, align 4
  br label %121

; <label>:156:                                    ; preds = %121
  store i32 40, i32* %3, align 4
  br label %157

; <label>:157:                                    ; preds = %195, %156
  %158 = load i32, i32* %3, align 4
  %159 = icmp slt i32 %158, 60
  br i1 %159, label %160, label %198

; <label>:160:                                    ; preds = %157
  %161 = load i64, i64* %5, align 8
  %162 = shl i64 %161, 5
  %163 = load i64, i64* %5, align 8
  %164 = lshr i64 %163, 27
  %165 = or i64 %162, %164
  %166 = load i64, i64* %6, align 8
  %167 = load i64, i64* %7, align 8
  %168 = and i64 %166, %167
  %169 = load i64, i64* %6, align 8
  %170 = load i64, i64* %8, align 8
  %171 = and i64 %169, %170
  %172 = or i64 %168, %171
  %173 = load i64, i64* %7, align 8
  %174 = load i64, i64* %8, align 8
  %175 = and i64 %173, %174
  %176 = or i64 %172, %175
  %177 = add i64 %165, %176
  %178 = load i64, i64* %9, align 8
  %179 = add i64 %177, %178
  %180 = load i32, i32* %3, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %181
  %183 = load i64, i64* %182, align 8
  %184 = add i64 %179, %183
  %185 = add i64 %184, 2400959708
  store i64 %185, i64* %4, align 8
  %186 = load i64, i64* %8, align 8
  store i64 %186, i64* %9, align 8
  %187 = load i64, i64* %7, align 8
  store i64 %187, i64* %8, align 8
  %188 = load i64, i64* %6, align 8
  %189 = shl i64 %188, 30
  %190 = load i64, i64* %6, align 8
  %191 = lshr i64 %190, 2
  %192 = or i64 %189, %191
  store i64 %192, i64* %7, align 8
  %193 = load i64, i64* %5, align 8
  store i64 %193, i64* %6, align 8
  %194 = load i64, i64* %4, align 8
  store i64 %194, i64* %5, align 8
  br label %195

; <label>:195:                                    ; preds = %160
  %196 = load i32, i32* %3, align 4
  %197 = add nsw i32 %196, 1
  store i32 %197, i32* %3, align 4
  br label %157

; <label>:198:                                    ; preds = %157
  store i32 60, i32* %3, align 4
  br label %199

; <label>:199:                                    ; preds = %231, %198
  %200 = load i32, i32* %3, align 4
  %201 = icmp slt i32 %200, 80
  br i1 %201, label %202, label %234

; <label>:202:                                    ; preds = %199
  %203 = load i64, i64* %5, align 8
  %204 = shl i64 %203, 5
  %205 = load i64, i64* %5, align 8
  %206 = lshr i64 %205, 27
  %207 = or i64 %204, %206
  %208 = load i64, i64* %6, align 8
  %209 = load i64, i64* %7, align 8
  %210 = xor i64 %208, %209
  %211 = load i64, i64* %8, align 8
  %212 = xor i64 %210, %211
  %213 = add i64 %207, %212
  %214 = load i64, i64* %9, align 8
  %215 = add i64 %213, %214
  %216 = load i32, i32* %3, align 4
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %217
  %219 = load i64, i64* %218, align 8
  %220 = add i64 %215, %219
  %221 = add i64 %220, 3395469782
  store i64 %221, i64* %4, align 8
  %222 = load i64, i64* %8, align 8
  store i64 %222, i64* %9, align 8
  %223 = load i64, i64* %7, align 8
  store i64 %223, i64* %8, align 8
  %224 = load i64, i64* %6, align 8
  %225 = shl i64 %224, 30
  %226 = load i64, i64* %6, align 8
  %227 = lshr i64 %226, 2
  %228 = or i64 %225, %227
  store i64 %228, i64* %7, align 8
  %229 = load i64, i64* %5, align 8
  store i64 %229, i64* %6, align 8
  %230 = load i64, i64* %4, align 8
  store i64 %230, i64* %5, align 8
  br label %231

; <label>:231:                                    ; preds = %202
  %232 = load i32, i32* %3, align 4
  %233 = add nsw i32 %232, 1
  store i32 %233, i32* %3, align 4
  br label %199

; <label>:234:                                    ; preds = %199
  %235 = load i64, i64* %5, align 8
  %236 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %237 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %236, i32 0, i32 0
  %238 = getelementptr inbounds [5 x i64], [5 x i64]* %237, i64 0, i64 0
  %239 = load i64, i64* %238, align 8
  %240 = add i64 %239, %235
  store i64 %240, i64* %238, align 8
  %241 = load i64, i64* %6, align 8
  %242 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %243 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %242, i32 0, i32 0
  %244 = getelementptr inbounds [5 x i64], [5 x i64]* %243, i64 0, i64 1
  %245 = load i64, i64* %244, align 8
  %246 = add i64 %245, %241
  store i64 %246, i64* %244, align 8
  %247 = load i64, i64* %7, align 8
  %248 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %249 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %248, i32 0, i32 0
  %250 = getelementptr inbounds [5 x i64], [5 x i64]* %249, i64 0, i64 2
  %251 = load i64, i64* %250, align 8
  %252 = add i64 %251, %247
  store i64 %252, i64* %250, align 8
  %253 = load i64, i64* %8, align 8
  %254 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %255 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %254, i32 0, i32 0
  %256 = getelementptr inbounds [5 x i64], [5 x i64]* %255, i64 0, i64 3
  %257 = load i64, i64* %256, align 8
  %258 = add i64 %257, %253
  store i64 %258, i64* %256, align 8
  %259 = load i64, i64* %9, align 8
  %260 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %261 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %260, i32 0, i32 0
  %262 = getelementptr inbounds [5 x i64], [5 x i64]* %261, i64 0, i64 4
  %263 = load i64, i64* %262, align 8
  %264 = add i64 %263, %259
  store i64 %264, i64* %262, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sha_final(%struct.SHA_INFO*) #0 {
  %2 = alloca %struct.SHA_INFO*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %2, align 8
  %6 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %7 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %6, i32 0, i32 1
  %8 = load i64, i64* %7, align 8
  store i64 %8, i64* %4, align 8
  %9 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %10 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %9, i32 0, i32 2
  %11 = load i64, i64* %10, align 8
  store i64 %11, i64* %5, align 8
  %12 = load i64, i64* %4, align 8
  %13 = lshr i64 %12, 3
  %14 = and i64 %13, 63
  %15 = trunc i64 %14 to i32
  store i32 %15, i32* %3, align 4
  %16 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %17 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %16, i32 0, i32 3
  %18 = getelementptr inbounds [16 x i64], [16 x i64]* %17, i32 0, i32 0
  %19 = bitcast i64* %18 to i8*
  %20 = load i32, i32* %3, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %3, align 4
  %22 = sext i32 %20 to i64
  %23 = getelementptr inbounds i8, i8* %19, i64 %22
  store i8 -128, i8* %23, align 1
  %24 = load i32, i32* %3, align 4
  %25 = icmp sgt i32 %24, 56
  br i1 %25, label %26, label %43

; <label>:26:                                     ; preds = %1
  %27 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %28 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %27, i32 0, i32 3
  %29 = bitcast [16 x i64]* %28 to i8*
  %30 = load i32, i32* %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8* %29, i64 %31
  %33 = load i32, i32* %3, align 4
  %34 = sub nsw i32 64, %33
  %35 = sext i32 %34 to i64
  call void @llvm.memset.p0i8.i64(i8* %32, i8 0, i64 %35, i32 1, i1 false)
  %36 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %37 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %36, i32 0, i32 3
  %38 = getelementptr inbounds [16 x i64], [16 x i64]* %37, i32 0, i32 0
  call void @byte_reverse(i64* %38, i32 64)
  %39 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  call void @sha_transform(%struct.SHA_INFO* %39)
  %40 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %41 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %40, i32 0, i32 3
  %42 = bitcast [16 x i64]* %41 to i8*
  call void @llvm.memset.p0i8.i64(i8* %42, i8 0, i64 56, i32 8, i1 false)
  br label %53

; <label>:43:                                     ; preds = %1
  %44 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %45 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %44, i32 0, i32 3
  %46 = bitcast [16 x i64]* %45 to i8*
  %47 = load i32, i32* %3, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8* %46, i64 %48
  %50 = load i32, i32* %3, align 4
  %51 = sub nsw i32 56, %50
  %52 = sext i32 %51 to i64
  call void @llvm.memset.p0i8.i64(i8* %49, i8 0, i64 %52, i32 1, i1 false)
  br label %53

; <label>:53:                                     ; preds = %43, %26
  %54 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %55 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %54, i32 0, i32 3
  %56 = getelementptr inbounds [16 x i64], [16 x i64]* %55, i32 0, i32 0
  call void @byte_reverse(i64* %56, i32 64)
  %57 = load i64, i64* %5, align 8
  %58 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %59 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %58, i32 0, i32 3
  %60 = getelementptr inbounds [16 x i64], [16 x i64]* %59, i64 0, i64 14
  store i64 %57, i64* %60, align 8
  %61 = load i64, i64* %4, align 8
  %62 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %63 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %62, i32 0, i32 3
  %64 = getelementptr inbounds [16 x i64], [16 x i64]* %63, i64 0, i64 15
  store i64 %61, i64* %64, align 8
  %65 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  call void @sha_transform(%struct.SHA_INFO* %65)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define void @sha_stream(%struct.SHA_INFO*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.SHA_INFO*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca [8192 x i8], align 16
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  %7 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  call void @sha_init(%struct.SHA_INFO* %7)
  br label %8

; <label>:8:                                      ; preds = %14, %2
  %9 = getelementptr inbounds [8192 x i8], [8192 x i8]* %6, i32 0, i32 0
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %11 = call i64 @fread(i8* %9, i64 1, i64 8192, %struct._IO_FILE* %10)
  %12 = trunc i64 %11 to i32
  store i32 %12, i32* %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %8
  %15 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %16 = getelementptr inbounds [8192 x i8], [8192 x i8]* %6, i32 0, i32 0
  %17 = load i32, i32* %5, align 4
  call void @sha_update(%struct.SHA_INFO* %15, i8* %16, i32 %17)
  br label %8

; <label>:18:                                     ; preds = %8
  %19 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  call void @sha_final(%struct.SHA_INFO* %19)
  ret void
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define void @sha_print(%struct.SHA_INFO*) #0 {
  %2 = alloca %struct.SHA_INFO*, align 8
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %2, align 8
  %3 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %4 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %3, i32 0, i32 0
  %5 = getelementptr inbounds [5 x i64], [5 x i64]* %4, i64 0, i64 0
  %6 = load i64, i64* %5, align 8
  %7 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %8 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %7, i32 0, i32 0
  %9 = getelementptr inbounds [5 x i64], [5 x i64]* %8, i64 0, i64 1
  %10 = load i64, i64* %9, align 8
  %11 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %12 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %11, i32 0, i32 0
  %13 = getelementptr inbounds [5 x i64], [5 x i64]* %12, i64 0, i64 2
  %14 = load i64, i64* %13, align 8
  %15 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %16 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %15, i32 0, i32 0
  %17 = getelementptr inbounds [5 x i64], [5 x i64]* %16, i64 0, i64 3
  %18 = load i64, i64* %17, align 8
  %19 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %20 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %19, i32 0, i32 0
  %21 = getelementptr inbounds [5 x i64], [5 x i64]* %20, i64 0, i64 4
  %22 = load i64, i64* %21, align 8
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i32 0, i32 0), i64 %6, i64 %10, i64 %14, i64 %18, i64 %22)
  ret void
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
