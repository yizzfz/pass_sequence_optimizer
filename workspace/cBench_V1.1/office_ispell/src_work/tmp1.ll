; ModuleID = 'good.ll'
source_filename = "good.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashheader = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i8], [13 x i8], i8, i8, i8, [228 x i16], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [128 x i8], [100 x [11 x i8]], [100 x i32], [100 x i32], i16 }
%struct.success = type { %struct.dent*, %struct.flagent*, %struct.flagent* }
%struct.dent = type { %struct.dent*, i8*, [1 x i64] }
%struct.flagent = type { i8*, i8*, i16, i16, i16, i16, i16, [228 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@hashheader = external global %struct.hashheader, align 4
@numhits = external global i32, align 4
@cflag = external global i32, align 4
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@orig_word = internal global i8* null, align 8
@hits = external global [10 x %struct.success], align 16
@compoundflag = external global i32, align 4
@outfile1 = external global %struct._IO_FILE*, align 8

; Function Attrs: nounwind uwtable
define i32 @good(i8*, i32, i32, i32, i32) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [120 x i8], align 16
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  %16 = alloca %struct.dent*, align 8
  store i8* %0, i8** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  %17 = load i8*, i8** %7, align 8
  store i8* %17, i8** %13, align 8
  %18 = getelementptr inbounds [120 x i8], [120 x i8]* %12, i32 0, i32 0
  store i8* %18, i8** %14, align 8
  br label %19

; <label>:19:                                     ; preds = %23, %5
  %20 = load i8*, i8** %13, align 8
  %21 = load i8, i8* %20, align 1
  %22 = icmp ne i8 %21, 0
  br i1 %22, label %23, label %32

; <label>:23:                                     ; preds = %19
  %24 = load i8*, i8** %13, align 8
  %25 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %25, i8** %13, align 8
  %26 = load i8, i8* %24, align 1
  %27 = zext i8 %26 to i64
  %28 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 22), i64 0, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = load i8*, i8** %14, align 8
  %31 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %31, i8** %14, align 8
  store i8 %29, i8* %30, align 1
  br label %19

; <label>:32:                                     ; preds = %19
  %33 = load i8*, i8** %14, align 8
  store i8 0, i8* %33, align 1
  %34 = load i8*, i8** %14, align 8
  %35 = getelementptr inbounds [120 x i8], [120 x i8]* %12, i32 0, i32 0
  %36 = ptrtoint i8* %34 to i64
  %37 = ptrtoint i8* %35 to i64
  %38 = sub i64 %36, %37
  %39 = trunc i64 %38 to i32
  store i32 %39, i32* %15, align 4
  store i32 0, i32* @numhits, align 4
  %40 = load i32, i32* @cflag, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %47

; <label>:42:                                     ; preds = %32
  %43 = load i8*, i8** %7, align 8
  %44 = call i8* @ichartosstr(i8* %43, i32 0)
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %44)
  %46 = load i8*, i8** %7, align 8
  store i8* %46, i8** @orig_word, align 8
  br label %88

; <label>:47:                                     ; preds = %32
  %48 = getelementptr inbounds [120 x i8], [120 x i8]* %12, i32 0, i32 0
  %49 = call %struct.dent* @lookup(i8* %48, i32 1)
  store %struct.dent* %49, %struct.dent** %16, align 8
  %50 = icmp ne %struct.dent* %49, null
  br i1 %50, label %51, label %87

; <label>:51:                                     ; preds = %47
  %52 = load %struct.dent*, %struct.dent** %16, align 8
  store %struct.dent* %52, %struct.dent** getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0, i32 0), align 16
  store %struct.flagent* null, %struct.flagent** getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0, i32 1), align 8
  store %struct.flagent* null, %struct.flagent** getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0, i32 2), align 16
  %53 = load i32, i32* %9, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %60, label %55

; <label>:55:                                     ; preds = %51
  %56 = load i8*, i8** %7, align 8
  %57 = load i32, i32* %15, align 4
  %58 = call i32 @cap_ok(i8* %56, %struct.success* getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0), i32 %57)
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %61

; <label>:60:                                     ; preds = %55, %51
  store i32 1, i32* @numhits, align 4
  br label %61

; <label>:61:                                     ; preds = %60, %55
  %62 = load i32, i32* @compoundflag, align 4
  %63 = icmp eq i32 %62, 2
  br i1 %63, label %64, label %86

; <label>:64:                                     ; preds = %61
  %65 = load i32, i32* %10, align 4
  %66 = load i32, i32* %11, align 4
  %67 = or i32 %65, %66
  %68 = and i32 %67, 2
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %86

; <label>:70:                                     ; preds = %64
  %71 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 5), align 2
  %72 = sext i16 %71 to i32
  %73 = icmp sge i32 %72, 0
  br i1 %73, label %74, label %86

; <label>:74:                                     ; preds = %70
  %75 = load %struct.dent*, %struct.dent** %16, align 8
  %76 = getelementptr inbounds %struct.dent, %struct.dent* %75, i32 0, i32 2
  %77 = getelementptr inbounds [1 x i64], [1 x i64]* %76, i64 0, i64 0
  %78 = load i64, i64* %77, align 8
  %79 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 5), align 2
  %80 = sext i16 %79 to i32
  %81 = zext i32 %80 to i64
  %82 = shl i64 1, %81
  %83 = and i64 %78, %82
  %84 = icmp eq i64 %83, 0
  br i1 %84, label %85, label %86

; <label>:85:                                     ; preds = %74
  store i32 0, i32* @numhits, align 4
  br label %86

; <label>:86:                                     ; preds = %85, %74, %70, %64, %61
  br label %87

; <label>:87:                                     ; preds = %86, %47
  br label %88

; <label>:88:                                     ; preds = %87, %42
  %89 = load i32, i32* @numhits, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %95

; <label>:91:                                     ; preds = %88
  %92 = load i32, i32* %9, align 4
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %95, label %94

; <label>:94:                                     ; preds = %91
  store i32 1, i32* %6, align 4
  br label %109

; <label>:95:                                     ; preds = %91, %88
  %96 = load i8*, i8** %7, align 8
  %97 = getelementptr inbounds [120 x i8], [120 x i8]* %12, i32 0, i32 0
  %98 = load i32, i32* %15, align 4
  %99 = load i32, i32* %8, align 4
  %100 = load i32, i32* %9, align 4
  %101 = load i32, i32* %10, align 4
  %102 = load i32, i32* %11, align 4
  call void @chk_aff(i8* %96, i8* %97, i32 %98, i32 %99, i32 %100, i32 %101, i32 %102)
  %103 = load i32, i32* @cflag, align 4
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %105, label %107

; <label>:105:                                    ; preds = %95
  %106 = call i32 @putchar(i32 10)
  br label %107

; <label>:107:                                    ; preds = %105, %95
  %108 = load i32, i32* @numhits, align 4
  store i32 %108, i32* %6, align 4
  br label %109

; <label>:109:                                    ; preds = %107, %94
  %110 = load i32, i32* %6, align 4
  ret i32 %110
}

declare i32 @printf(i8*, ...) #1

declare i8* @ichartosstr(i8*, i32) #1

declare %struct.dent* @lookup(i8*, i32) #1

; Function Attrs: nounwind uwtable
define i32 @cap_ok(i8*, %struct.success*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %struct.success*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca %struct.dent*, align 8
  %11 = alloca [120 x i8], align 16
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  store i8* %0, i8** %5, align 8
  store %struct.success* %1, %struct.success** %6, align 8
  store i32 %2, i32* %7, align 4
  %18 = load i8*, i8** %5, align 8
  %19 = call i64 @whatcap(i8* %18)
  store i64 %19, i64* %16, align 8
  store i32 0, i32* %14, align 4
  store i32 0, i32* %13, align 4
  store i32 0, i32* %12, align 4
  %20 = load i64, i64* %16, align 8
  %21 = icmp eq i64 %20, 268435456
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %3
  store i32 1, i32* %4, align 4
  br label %255

; <label>:23:                                     ; preds = %3
  %24 = load i64, i64* %16, align 8
  %25 = icmp eq i64 %24, 805306368
  br i1 %25, label %26, label %60

; <label>:26:                                     ; preds = %23
  %27 = load %struct.success*, %struct.success** %6, align 8
  %28 = getelementptr inbounds %struct.success, %struct.success* %27, i32 0, i32 1
  %29 = load %struct.flagent*, %struct.flagent** %28, align 8
  %30 = icmp ne %struct.flagent* %29, null
  br i1 %30, label %31, label %44

; <label>:31:                                     ; preds = %26
  %32 = load %struct.success*, %struct.success** %6, align 8
  %33 = getelementptr inbounds %struct.success, %struct.success* %32, i32 0, i32 1
  %34 = load %struct.flagent*, %struct.flagent** %33, align 8
  %35 = getelementptr inbounds %struct.flagent, %struct.flagent* %34, i32 0, i32 4
  %36 = load i16, i16* %35, align 4
  %37 = sext i16 %36 to i32
  store i32 %37, i32* %12, align 4
  %38 = load %struct.success*, %struct.success** %6, align 8
  %39 = getelementptr inbounds %struct.success, %struct.success* %38, i32 0, i32 1
  %40 = load %struct.flagent*, %struct.flagent** %39, align 8
  %41 = getelementptr inbounds %struct.flagent, %struct.flagent* %40, i32 0, i32 3
  %42 = load i16, i16* %41, align 2
  %43 = sext i16 %42 to i32
  store i32 %43, i32* %13, align 4
  br label %45

; <label>:44:                                     ; preds = %26
  store i32 0, i32* %13, align 4
  store i32 0, i32* %12, align 4
  br label %45

; <label>:45:                                     ; preds = %44, %31
  %46 = load %struct.success*, %struct.success** %6, align 8
  %47 = getelementptr inbounds %struct.success, %struct.success* %46, i32 0, i32 2
  %48 = load %struct.flagent*, %struct.flagent** %47, align 8
  %49 = icmp ne %struct.flagent* %48, null
  br i1 %49, label %50, label %57

; <label>:50:                                     ; preds = %45
  %51 = load %struct.success*, %struct.success** %6, align 8
  %52 = getelementptr inbounds %struct.success, %struct.success* %51, i32 0, i32 2
  %53 = load %struct.flagent*, %struct.flagent** %52, align 8
  %54 = getelementptr inbounds %struct.flagent, %struct.flagent* %53, i32 0, i32 4
  %55 = load i16, i16* %54, align 4
  %56 = sext i16 %55 to i32
  br label %58

; <label>:57:                                     ; preds = %45
  br label %58

; <label>:58:                                     ; preds = %57, %50
  %59 = phi i32 [ %56, %50 ], [ 0, %57 ]
  store i32 %59, i32* %14, align 4
  br label %60

; <label>:60:                                     ; preds = %58, %23
  br label %61

; <label>:61:                                     ; preds = %60
  %62 = load %struct.success*, %struct.success** %6, align 8
  %63 = getelementptr inbounds %struct.success, %struct.success* %62, i32 0, i32 0
  %64 = load %struct.dent*, %struct.dent** %63, align 8
  store %struct.dent* %64, %struct.dent** %10, align 8
  br label %65

; <label>:65:                                     ; preds = %250, %61
  %66 = load %struct.dent*, %struct.dent** %10, align 8
  %67 = getelementptr inbounds %struct.dent, %struct.dent* %66, i32 0, i32 2
  %68 = getelementptr inbounds [1 x i64], [1 x i64]* %67, i64 0, i64 0
  %69 = load i64, i64* %68, align 8
  %70 = and i64 %69, 805306368
  store i64 %70, i64* %17, align 8
  %71 = load i64, i64* %17, align 8
  %72 = load i64, i64* %16, align 8
  %73 = icmp ne i64 %71, %72
  br i1 %73, label %74, label %87

; <label>:74:                                     ; preds = %65
  %75 = load i64, i64* %17, align 8
  %76 = icmp eq i64 %75, 0
  br i1 %76, label %77, label %86

; <label>:77:                                     ; preds = %74
  %78 = load i64, i64* %16, align 8
  %79 = icmp eq i64 %78, 536870912
  br i1 %79, label %80, label %86

; <label>:80:                                     ; preds = %77
  %81 = load %struct.dent*, %struct.dent** %10, align 8
  %82 = load %struct.success*, %struct.success** %6, align 8
  %83 = call i32 @entryhasaffixes(%struct.dent* %81, %struct.success* %82)
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %86

; <label>:85:                                     ; preds = %80
  store i32 1, i32* %4, align 4
  br label %255

; <label>:86:                                     ; preds = %80, %77, %74
  br label %242

; <label>:87:                                     ; preds = %65
  %88 = load i64, i64* %16, align 8
  %89 = icmp ne i64 %88, 805306368
  br i1 %89, label %90, label %97

; <label>:90:                                     ; preds = %87
  %91 = load %struct.dent*, %struct.dent** %10, align 8
  %92 = load %struct.success*, %struct.success** %6, align 8
  %93 = call i32 @entryhasaffixes(%struct.dent* %91, %struct.success* %92)
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %96

; <label>:95:                                     ; preds = %90
  store i32 1, i32* %4, align 4
  br label %255

; <label>:96:                                     ; preds = %90
  br label %241

; <label>:97:                                     ; preds = %87
  %98 = getelementptr inbounds [120 x i8], [120 x i8]* %11, i32 0, i32 0
  %99 = load %struct.dent*, %struct.dent** %10, align 8
  %100 = getelementptr inbounds %struct.dent, %struct.dent* %99, i32 0, i32 1
  %101 = load i8*, i8** %100, align 8
  %102 = call i32 @strtoichar(i8* %98, i8* %101, i32 100, i32 1)
  %103 = getelementptr inbounds [120 x i8], [120 x i8]* %11, i32 0, i32 0
  store i8* %103, i8** %8, align 8
  %104 = load i8*, i8** %5, align 8
  %105 = load i32, i32* %12, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8* %104, i64 %106
  store i8* %107, i8** %15, align 8
  %108 = load i8*, i8** %8, align 8
  %109 = load i32, i32* %13, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8* %108, i64 %110
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i64
  %114 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %113
  %115 = load i8, i8* %114, align 1
  %116 = icmp ne i8 %115, 0
  br i1 %116, label %117, label %136

; <label>:117:                                    ; preds = %97
  %118 = load i8*, i8** %5, align 8
  store i8* %118, i8** %9, align 8
  br label %119

; <label>:119:                                    ; preds = %132, %117
  %120 = load i8*, i8** %9, align 8
  %121 = load i8*, i8** %15, align 8
  %122 = icmp ult i8* %120, %121
  br i1 %122, label %123, label %135

; <label>:123:                                    ; preds = %119
  %124 = load i8*, i8** %9, align 8
  %125 = load i8, i8* %124, align 1
  %126 = zext i8 %125 to i64
  %127 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 25), i64 0, i64 %126
  %128 = load i8, i8* %127, align 1
  %129 = icmp ne i8 %128, 0
  br i1 %129, label %130, label %131

; <label>:130:                                    ; preds = %123
  br label %240

; <label>:131:                                    ; preds = %123
  br label %132

; <label>:132:                                    ; preds = %131
  %133 = load i8*, i8** %9, align 8
  %134 = getelementptr inbounds i8, i8* %133, i32 1
  store i8* %134, i8** %9, align 8
  br label %119

; <label>:135:                                    ; preds = %119
  br label %155

; <label>:136:                                    ; preds = %97
  %137 = load i8*, i8** %5, align 8
  store i8* %137, i8** %9, align 8
  br label %138

; <label>:138:                                    ; preds = %151, %136
  %139 = load i8*, i8** %9, align 8
  %140 = load i8*, i8** %15, align 8
  %141 = icmp ult i8* %139, %140
  br i1 %141, label %142, label %154

; <label>:142:                                    ; preds = %138
  %143 = load i8*, i8** %9, align 8
  %144 = load i8, i8* %143, align 1
  %145 = zext i8 %144 to i64
  %146 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %145
  %147 = load i8, i8* %146, align 1
  %148 = icmp ne i8 %147, 0
  br i1 %148, label %149, label %150

; <label>:149:                                    ; preds = %142
  br label %240

; <label>:150:                                    ; preds = %142
  br label %151

; <label>:151:                                    ; preds = %150
  %152 = load i8*, i8** %9, align 8
  %153 = getelementptr inbounds i8, i8* %152, i32 1
  store i8* %153, i8** %9, align 8
  br label %138

; <label>:154:                                    ; preds = %138
  br label %155

; <label>:155:                                    ; preds = %154, %135
  %156 = load i32, i32* %13, align 4
  %157 = load i8*, i8** %8, align 8
  %158 = sext i32 %156 to i64
  %159 = getelementptr inbounds i8, i8* %157, i64 %158
  store i8* %159, i8** %8, align 8
  %160 = load i8*, i8** %8, align 8
  %161 = load i32, i32* %7, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i8, i8* %160, i64 %162
  %164 = load i32, i32* %12, align 4
  %165 = sext i32 %164 to i64
  %166 = sub i64 0, %165
  %167 = getelementptr inbounds i8, i8* %163, i64 %166
  %168 = load i32, i32* %14, align 4
  %169 = sext i32 %168 to i64
  %170 = sub i64 0, %169
  %171 = getelementptr inbounds i8, i8* %167, i64 %170
  store i8* %171, i8** %15, align 8
  br label %172

; <label>:172:                                    ; preds = %187, %155
  %173 = load i8*, i8** %8, align 8
  %174 = load i8*, i8** %15, align 8
  %175 = icmp ult i8* %173, %174
  br i1 %175, label %176, label %188

; <label>:176:                                    ; preds = %172
  %177 = load i8*, i8** %8, align 8
  %178 = getelementptr inbounds i8, i8* %177, i32 1
  store i8* %178, i8** %8, align 8
  %179 = load i8, i8* %177, align 1
  %180 = zext i8 %179 to i32
  %181 = load i8*, i8** %9, align 8
  %182 = getelementptr inbounds i8, i8* %181, i32 1
  store i8* %182, i8** %9, align 8
  %183 = load i8, i8* %181, align 1
  %184 = zext i8 %183 to i32
  %185 = icmp ne i32 %180, %184
  br i1 %185, label %186, label %187

; <label>:186:                                    ; preds = %176
  br label %240

; <label>:187:                                    ; preds = %176
  br label %172

; <label>:188:                                    ; preds = %172
  %189 = load i8*, i8** %15, align 8
  %190 = getelementptr inbounds i8, i8* %189, i64 -1
  store i8* %190, i8** %8, align 8
  %191 = load i8*, i8** %8, align 8
  %192 = load i8, i8* %191, align 1
  %193 = zext i8 %192 to i64
  %194 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %193
  %195 = load i8, i8* %194, align 1
  %196 = icmp ne i8 %195, 0
  br i1 %196, label %197, label %215

; <label>:197:                                    ; preds = %188
  br label %198

; <label>:198:                                    ; preds = %211, %197
  %199 = load i8*, i8** %9, align 8
  %200 = load i8, i8* %199, align 1
  %201 = icmp ne i8 %200, 0
  br i1 %201, label %202, label %214

; <label>:202:                                    ; preds = %198
  %203 = load i8*, i8** %9, align 8
  %204 = load i8, i8* %203, align 1
  %205 = zext i8 %204 to i64
  %206 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 25), i64 0, i64 %205
  %207 = load i8, i8* %206, align 1
  %208 = icmp ne i8 %207, 0
  br i1 %208, label %209, label %210

; <label>:209:                                    ; preds = %202
  br label %240

; <label>:210:                                    ; preds = %202
  br label %211

; <label>:211:                                    ; preds = %210
  %212 = load i8*, i8** %9, align 8
  %213 = getelementptr inbounds i8, i8* %212, i32 1
  store i8* %213, i8** %9, align 8
  br label %198

; <label>:214:                                    ; preds = %198
  br label %233

; <label>:215:                                    ; preds = %188
  br label %216

; <label>:216:                                    ; preds = %229, %215
  %217 = load i8*, i8** %9, align 8
  %218 = load i8, i8* %217, align 1
  %219 = icmp ne i8 %218, 0
  br i1 %219, label %220, label %232

; <label>:220:                                    ; preds = %216
  %221 = load i8*, i8** %9, align 8
  %222 = load i8, i8* %221, align 1
  %223 = zext i8 %222 to i64
  %224 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %223
  %225 = load i8, i8* %224, align 1
  %226 = icmp ne i8 %225, 0
  br i1 %226, label %227, label %228

; <label>:227:                                    ; preds = %220
  br label %240

; <label>:228:                                    ; preds = %220
  br label %229

; <label>:229:                                    ; preds = %228
  %230 = load i8*, i8** %9, align 8
  %231 = getelementptr inbounds i8, i8* %230, i32 1
  store i8* %231, i8** %9, align 8
  br label %216

; <label>:232:                                    ; preds = %216
  br label %233

; <label>:233:                                    ; preds = %232, %214
  %234 = load %struct.dent*, %struct.dent** %10, align 8
  %235 = load %struct.success*, %struct.success** %6, align 8
  %236 = call i32 @entryhasaffixes(%struct.dent* %234, %struct.success* %235)
  %237 = icmp ne i32 %236, 0
  br i1 %237, label %238, label %239

; <label>:238:                                    ; preds = %233
  store i32 1, i32* %4, align 4
  br label %255

; <label>:239:                                    ; preds = %233
  br label %240

; <label>:240:                                    ; preds = %239, %227, %209, %186, %149, %130
  br label %241

; <label>:241:                                    ; preds = %240, %96
  br label %242

; <label>:242:                                    ; preds = %241, %86
  %243 = load %struct.dent*, %struct.dent** %10, align 8
  %244 = getelementptr inbounds %struct.dent, %struct.dent* %243, i32 0, i32 2
  %245 = getelementptr inbounds [1 x i64], [1 x i64]* %244, i64 0, i64 0
  %246 = load i64, i64* %245, align 8
  %247 = and i64 %246, 1073741824
  %248 = icmp eq i64 %247, 0
  br i1 %248, label %249, label %250

; <label>:249:                                    ; preds = %242
  br label %254

; <label>:250:                                    ; preds = %242
  %251 = load %struct.dent*, %struct.dent** %10, align 8
  %252 = getelementptr inbounds %struct.dent, %struct.dent* %251, i32 0, i32 0
  %253 = load %struct.dent*, %struct.dent** %252, align 8
  store %struct.dent* %253, %struct.dent** %10, align 8
  br label %65

; <label>:254:                                    ; preds = %249
  store i32 0, i32* %4, align 4
  br label %255

; <label>:255:                                    ; preds = %254, %238, %95, %85, %22
  %256 = load i32, i32* %4, align 4
  ret i32 %256
}

declare void @chk_aff(i8*, i8*, i32, i32, i32, i32, i32) #1

declare i32 @putchar(i32) #1

declare i64 @whatcap(i8*) #1

; Function Attrs: nounwind uwtable
define internal i32 @entryhasaffixes(%struct.dent*, %struct.success*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.success*, align 8
  store %struct.dent* %0, %struct.dent** %4, align 8
  store %struct.success* %1, %struct.success** %5, align 8
  %6 = load %struct.success*, %struct.success** %5, align 8
  %7 = getelementptr inbounds %struct.success, %struct.success* %6, i32 0, i32 1
  %8 = load %struct.flagent*, %struct.flagent** %7, align 8
  %9 = icmp ne %struct.flagent* %8, null
  br i1 %9, label %10, label %26

; <label>:10:                                     ; preds = %2
  %11 = load %struct.dent*, %struct.dent** %4, align 8
  %12 = getelementptr inbounds %struct.dent, %struct.dent* %11, i32 0, i32 2
  %13 = getelementptr inbounds [1 x i64], [1 x i64]* %12, i64 0, i64 0
  %14 = load i64, i64* %13, align 8
  %15 = load %struct.success*, %struct.success** %5, align 8
  %16 = getelementptr inbounds %struct.success, %struct.success* %15, i32 0, i32 1
  %17 = load %struct.flagent*, %struct.flagent** %16, align 8
  %18 = getelementptr inbounds %struct.flagent, %struct.flagent* %17, i32 0, i32 2
  %19 = load i16, i16* %18, align 8
  %20 = sext i16 %19 to i32
  %21 = zext i32 %20 to i64
  %22 = shl i64 1, %21
  %23 = and i64 %14, %22
  %24 = icmp ne i64 %23, 0
  br i1 %24, label %26, label %25

; <label>:25:                                     ; preds = %10
  store i32 0, i32* %3, align 4
  br label %48

; <label>:26:                                     ; preds = %10, %2
  %27 = load %struct.success*, %struct.success** %5, align 8
  %28 = getelementptr inbounds %struct.success, %struct.success* %27, i32 0, i32 2
  %29 = load %struct.flagent*, %struct.flagent** %28, align 8
  %30 = icmp ne %struct.flagent* %29, null
  br i1 %30, label %31, label %47

; <label>:31:                                     ; preds = %26
  %32 = load %struct.dent*, %struct.dent** %4, align 8
  %33 = getelementptr inbounds %struct.dent, %struct.dent* %32, i32 0, i32 2
  %34 = getelementptr inbounds [1 x i64], [1 x i64]* %33, i64 0, i64 0
  %35 = load i64, i64* %34, align 8
  %36 = load %struct.success*, %struct.success** %5, align 8
  %37 = getelementptr inbounds %struct.success, %struct.success* %36, i32 0, i32 2
  %38 = load %struct.flagent*, %struct.flagent** %37, align 8
  %39 = getelementptr inbounds %struct.flagent, %struct.flagent* %38, i32 0, i32 2
  %40 = load i16, i16* %39, align 8
  %41 = sext i16 %40 to i32
  %42 = zext i32 %41 to i64
  %43 = shl i64 1, %42
  %44 = and i64 %35, %43
  %45 = icmp ne i64 %44, 0
  br i1 %45, label %47, label %46

; <label>:46:                                     ; preds = %31
  store i32 0, i32* %3, align 4
  br label %48

; <label>:47:                                     ; preds = %31, %26
  store i32 1, i32* %3, align 4
  br label %48

; <label>:48:                                     ; preds = %47, %46, %25
  %49 = load i32, i32* %3, align 4
  ret i32 %49
}

declare i32 @strtoichar(i8*, i8*, i32, i32) #1

; Function Attrs: nounwind uwtable
define void @flagpr(i8*, i32, i32, i32, i32, i32) #0 {
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  store i8* %0, i8** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  %15 = load i8*, i8** @orig_word, align 8
  %16 = call i64 @strlen(i8* %15) #3
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %14, align 4
  %18 = load i32, i32* %8, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %76

; <label>:20:                                     ; preds = %6
  %21 = load i8*, i8** @orig_word, align 8
  %22 = load i32, i32* %10, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8* %21, i64 %23
  store i8* %24, i8** %13, align 8
  %25 = load i8*, i8** %13, align 8
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i64
  %28 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = icmp ne i8 %29, 0
  br i1 %30, label %31, label %53

; <label>:31:                                     ; preds = %20
  %32 = load i8*, i8** @orig_word, align 8
  store i8* %32, i8** %13, align 8
  br label %33

; <label>:33:                                     ; preds = %49, %31
  %34 = load i8*, i8** %13, align 8
  %35 = load i8*, i8** @orig_word, align 8
  %36 = load i32, i32* %10, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8* %35, i64 %37
  %39 = icmp ult i8* %34, %38
  br i1 %39, label %40, label %52

; <label>:40:                                     ; preds = %33
  %41 = load i8*, i8** %13, align 8
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 25), i64 0, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = icmp ne i8 %45, 0
  br i1 %46, label %47, label %48

; <label>:47:                                     ; preds = %40
  br label %257

; <label>:48:                                     ; preds = %40
  br label %49

; <label>:49:                                     ; preds = %48
  %50 = load i8*, i8** %13, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %51, i8** %13, align 8
  br label %33

; <label>:52:                                     ; preds = %33
  br label %75

; <label>:53:                                     ; preds = %20
  %54 = load i8*, i8** @orig_word, align 8
  store i8* %54, i8** %13, align 8
  br label %55

; <label>:55:                                     ; preds = %71, %53
  %56 = load i8*, i8** %13, align 8
  %57 = load i8*, i8** @orig_word, align 8
  %58 = load i32, i32* %10, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8* %57, i64 %59
  %61 = icmp ult i8* %56, %60
  br i1 %61, label %62, label %74

; <label>:62:                                     ; preds = %55
  %63 = load i8*, i8** %13, align 8
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i64
  %66 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %65
  %67 = load i8, i8* %66, align 1
  %68 = icmp ne i8 %67, 0
  br i1 %68, label %69, label %70

; <label>:69:                                     ; preds = %62
  br label %257

; <label>:70:                                     ; preds = %62
  br label %71

; <label>:71:                                     ; preds = %70
  %72 = load i8*, i8** %13, align 8
  %73 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %73, i8** %13, align 8
  br label %55

; <label>:74:                                     ; preds = %55
  br label %75

; <label>:75:                                     ; preds = %74, %52
  br label %76

; <label>:76:                                     ; preds = %75, %6
  %77 = load i32, i32* %11, align 4
  %78 = icmp sgt i32 %77, 0
  br i1 %78, label %79, label %142

; <label>:79:                                     ; preds = %76
  %80 = load i8*, i8** @orig_word, align 8
  %81 = load i32, i32* %14, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8* %80, i64 %82
  %84 = load i32, i32* %12, align 4
  %85 = sext i32 %84 to i64
  %86 = sub i64 0, %85
  %87 = getelementptr inbounds i8, i8* %83, i64 %86
  store i8* %87, i8** %13, align 8
  %88 = load i8*, i8** %13, align 8
  %89 = getelementptr inbounds i8, i8* %88, i64 -1
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i64
  %92 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %91
  %93 = load i8, i8* %92, align 1
  %94 = icmp ne i8 %93, 0
  br i1 %94, label %95, label %114

; <label>:95:                                     ; preds = %79
  br label %96

; <label>:96:                                     ; preds = %110, %95
  %97 = load i8*, i8** %13, align 8
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %113

; <label>:101:                                    ; preds = %96
  %102 = load i8*, i8** %13, align 8
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i64
  %105 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 25), i64 0, i64 %104
  %106 = load i8, i8* %105, align 1
  %107 = icmp ne i8 %106, 0
  br i1 %107, label %108, label %109

; <label>:108:                                    ; preds = %101
  br label %257

; <label>:109:                                    ; preds = %101
  br label %110

; <label>:110:                                    ; preds = %109
  %111 = load i8*, i8** %13, align 8
  %112 = getelementptr inbounds i8, i8* %111, i32 1
  store i8* %112, i8** %13, align 8
  br label %96

; <label>:113:                                    ; preds = %96
  br label %141

; <label>:114:                                    ; preds = %79
  %115 = load i8*, i8** @orig_word, align 8
  %116 = load i32, i32* %14, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i8, i8* %115, i64 %117
  %119 = load i32, i32* %12, align 4
  %120 = sext i32 %119 to i64
  %121 = sub i64 0, %120
  %122 = getelementptr inbounds i8, i8* %118, i64 %121
  store i8* %122, i8** %13, align 8
  br label %123

; <label>:123:                                    ; preds = %137, %114
  %124 = load i8*, i8** %13, align 8
  %125 = load i8, i8* %124, align 1
  %126 = zext i8 %125 to i32
  %127 = icmp ne i32 %126, 0
  br i1 %127, label %128, label %140

; <label>:128:                                    ; preds = %123
  %129 = load i8*, i8** %13, align 8
  %130 = load i8, i8* %129, align 1
  %131 = zext i8 %130 to i64
  %132 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %131
  %133 = load i8, i8* %132, align 1
  %134 = icmp ne i8 %133, 0
  br i1 %134, label %135, label %136

; <label>:135:                                    ; preds = %128
  br label %257

; <label>:136:                                    ; preds = %128
  br label %137

; <label>:137:                                    ; preds = %136
  %138 = load i8*, i8** %13, align 8
  %139 = getelementptr inbounds i8, i8* %138, i32 1
  store i8* %139, i8** %13, align 8
  br label %123

; <label>:140:                                    ; preds = %123
  br label %141

; <label>:141:                                    ; preds = %140, %113
  br label %142

; <label>:142:                                    ; preds = %141, %76
  %143 = call i32 @putchar(i32 32)
  %144 = load i8*, i8** @orig_word, align 8
  %145 = load i32, i32* %10, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i8, i8* %144, i64 %146
  store i8* %147, i8** %13, align 8
  %148 = load i8*, i8** %13, align 8
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i64
  %151 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %150
  %152 = load i8, i8* %151, align 1
  %153 = icmp ne i8 %152, 0
  br i1 %153, label %154, label %168

; <label>:154:                                    ; preds = %142
  br label %155

; <label>:155:                                    ; preds = %159, %154
  %156 = load i32, i32* %9, align 4
  %157 = add nsw i32 %156, -1
  store i32 %157, i32* %9, align 4
  %158 = icmp sge i32 %157, 0
  br i1 %158, label %159, label %167

; <label>:159:                                    ; preds = %155
  %160 = load i8*, i8** %7, align 8
  %161 = getelementptr inbounds i8, i8* %160, i32 1
  store i8* %161, i8** %7, align 8
  %162 = load i8, i8* %160, align 1
  %163 = zext i8 %162 to i32
  %164 = call i8* @printichar(i32 %163)
  %165 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %166 = call i32 @fputs(i8* %164, %struct._IO_FILE* %165)
  br label %155

; <label>:167:                                    ; preds = %155
  br label %185

; <label>:168:                                    ; preds = %142
  br label %169

; <label>:169:                                    ; preds = %173, %168
  %170 = load i32, i32* %9, align 4
  %171 = add nsw i32 %170, -1
  store i32 %171, i32* %9, align 4
  %172 = icmp sge i32 %171, 0
  br i1 %172, label %173, label %184

; <label>:173:                                    ; preds = %169
  %174 = load i8*, i8** %7, align 8
  %175 = getelementptr inbounds i8, i8* %174, i32 1
  store i8* %175, i8** %7, align 8
  %176 = load i8, i8* %174, align 1
  %177 = zext i8 %176 to i64
  %178 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 21), i64 0, i64 %177
  %179 = load i8, i8* %178, align 1
  %180 = zext i8 %179 to i32
  %181 = call i8* @printichar(i32 %180)
  %182 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %183 = call i32 @fputs(i8* %181, %struct._IO_FILE* %182)
  br label %169

; <label>:184:                                    ; preds = %169
  br label %185

; <label>:185:                                    ; preds = %184, %167
  %186 = load i32, i32* %14, align 4
  %187 = load i32, i32* %10, align 4
  %188 = sub nsw i32 %186, %187
  %189 = load i32, i32* %12, align 4
  %190 = sub nsw i32 %188, %189
  store i32 %190, i32* %9, align 4
  br label %191

; <label>:191:                                    ; preds = %203, %185
  %192 = load i32, i32* %9, align 4
  %193 = add nsw i32 %192, -1
  store i32 %193, i32* %9, align 4
  %194 = icmp sge i32 %193, 0
  br i1 %194, label %195, label %206

; <label>:195:                                    ; preds = %191
  %196 = load i8*, i8** %13, align 8
  %197 = getelementptr inbounds i8, i8* %196, i32 1
  store i8* %197, i8** %13, align 8
  %198 = load i8, i8* %196, align 1
  %199 = zext i8 %198 to i32
  %200 = call i8* @printichar(i32 %199)
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %202 = call i32 @fputs(i8* %200, %struct._IO_FILE* %201)
  br label %203

; <label>:203:                                    ; preds = %195
  %204 = load i8*, i8** %7, align 8
  %205 = getelementptr inbounds i8, i8* %204, i32 1
  store i8* %205, i8** %7, align 8
  br label %191

; <label>:206:                                    ; preds = %191
  %207 = load i8*, i8** %13, align 8
  %208 = load i8*, i8** @orig_word, align 8
  %209 = icmp ugt i8* %207, %208
  br i1 %209, label %210, label %213

; <label>:210:                                    ; preds = %206
  %211 = load i8*, i8** %13, align 8
  %212 = getelementptr inbounds i8, i8* %211, i32 -1
  store i8* %212, i8** %13, align 8
  br label %213

; <label>:213:                                    ; preds = %210, %206
  %214 = load i8*, i8** %13, align 8
  %215 = load i8, i8* %214, align 1
  %216 = zext i8 %215 to i64
  %217 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %216
  %218 = load i8, i8* %217, align 1
  %219 = icmp ne i8 %218, 0
  br i1 %219, label %220, label %225

; <label>:220:                                    ; preds = %213
  %221 = load i8*, i8** %7, align 8
  %222 = call i8* @ichartosstr(i8* %221, i32 0)
  %223 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %224 = call i32 @fputs(i8* %222, %struct._IO_FILE* %223)
  br label %242

; <label>:225:                                    ; preds = %213
  br label %226

; <label>:226:                                    ; preds = %230, %225
  %227 = load i8*, i8** %7, align 8
  %228 = load i8, i8* %227, align 1
  %229 = icmp ne i8 %228, 0
  br i1 %229, label %230, label %241

; <label>:230:                                    ; preds = %226
  %231 = load i8*, i8** %7, align 8
  %232 = getelementptr inbounds i8, i8* %231, i32 1
  store i8* %232, i8** %7, align 8
  %233 = load i8, i8* %231, align 1
  %234 = zext i8 %233 to i64
  %235 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 21), i64 0, i64 %234
  %236 = load i8, i8* %235, align 1
  %237 = zext i8 %236 to i32
  %238 = call i8* @printichar(i32 %237)
  %239 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %240 = call i32 @fputs(i8* %238, %struct._IO_FILE* %239)
  br label %226

; <label>:241:                                    ; preds = %226
  br label %242

; <label>:242:                                    ; preds = %241, %220
  %243 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %244 = sext i8 %243 to i32
  %245 = call i32 @putchar(i32 %244)
  %246 = load i32, i32* %8, align 4
  %247 = icmp sgt i32 %246, 0
  br i1 %247, label %248, label %251

; <label>:248:                                    ; preds = %242
  %249 = load i32, i32* %8, align 4
  %250 = call i32 @putchar(i32 %249)
  br label %251

; <label>:251:                                    ; preds = %248, %242
  %252 = load i32, i32* %11, align 4
  %253 = icmp sgt i32 %252, 0
  br i1 %253, label %254, label %257

; <label>:254:                                    ; preds = %251
  %255 = load i32, i32* %11, align 4
  %256 = call i32 @putchar(i32 %255)
  br label %257

; <label>:257:                                    ; preds = %254, %251, %135, %108, %69, %47
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

declare i8* @printichar(i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
