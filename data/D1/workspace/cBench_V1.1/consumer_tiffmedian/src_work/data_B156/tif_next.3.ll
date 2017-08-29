; ModuleID = 'tif_next.2.ll'
source_filename = "tif_next.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [45 x i8] c"NeXTDecode: Not enough data for scanline %ld\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFInitNeXT = private constant [12 x i8] c"TIFFInitNeXT"
@__profn_tmp1.ll_NeXTDecode = private constant [18 x i8] c"tmp1.ll:NeXTDecode"
@__profc_TIFFInitNeXT = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFInitNeXT = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2824480168154759017, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitNeXT, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFInitNeXT to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_NeXTDecode = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_NeXTDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1736346729296631065, i64 201767733387, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @NeXTDecode to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [33 x i8] c"\1F\00TIFFInitNeXT\01tmp1.ll:NeXTDecode", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFInitNeXT to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_NeXTDecode to i8*), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitNeXT(%struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitNeXT, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitNeXT, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @NeXTDecode, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @NeXTDecode, i32 (%struct.tiff*, i8*, i32, i16)** %10, align 8
  %11 = load %struct.tiff*, %struct.tiff** %4, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @NeXTDecode, i32 (%struct.tiff*, i8*, i32, i16)** %12, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @NeXTDecode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i64, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %20 = load i16, i16* %9, align 2
  %21 = load i8*, i8** %7, align 8
  store i8* %21, i8** %11, align 8
  %22 = load i32, i32* %8, align 4
  store i32 %22, i32* %12, align 4
  br label %23

; <label>:23:                                     ; preds = %27, %4
  %24 = load i32, i32* %12, align 4
  %25 = add nsw i32 %24, -1
  store i32 %25, i32* %12, align 4
  %26 = icmp sgt i32 %24, 0
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 5)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 5)
  %29 = load i8*, i8** %11, align 8
  %30 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %30, i8** %11, align 8
  store i8 -1, i8* %29, align 1
  br label %23

; <label>:31:                                     ; preds = %23
  %32 = load %struct.tiff*, %struct.tiff** %6, align 8
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %32, i32 0, i32 42
  %34 = load i8*, i8** %33, align 8
  store i8* %34, i8** %10, align 8
  %35 = load %struct.tiff*, %struct.tiff** %6, align 8
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %35, i32 0, i32 43
  %37 = load i32, i32* %36, align 8
  store i32 %37, i32* %12, align 4
  %38 = load %struct.tiff*, %struct.tiff** %6, align 8
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %38, i32 0, i32 38
  %40 = load i32, i32* %39, align 8
  store i32 %40, i32* %15, align 4
  %41 = load i8*, i8** %7, align 8
  store i8* %41, i8** %14, align 8
  br label %42

; <label>:42:                                     ; preds = %198, %31
  %43 = load i32, i32* %8, align 4
  %44 = sext i32 %43 to i64
  %45 = icmp sgt i64 %44, 0
  br i1 %45, label %46, label %206

; <label>:46:                                     ; preds = %42
  %47 = load i8*, i8** %10, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %10, align 8
  %49 = load i8, i8* %47, align 1
  %50 = zext i8 %49 to i32
  store i32 %50, i32* %13, align 4
  %51 = load i32, i32* %12, align 4
  %52 = add nsw i32 %51, -1
  store i32 %52, i32* %12, align 4
  %53 = load i32, i32* %13, align 4
  switch i32 %53, label %117 [
    i32 0, label %54
    i32 64, label %72
  ]

; <label>:54:                                     ; preds = %46
  %55 = load i32, i32* %12, align 4
  %56 = load i32, i32* %15, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %60

; <label>:58:                                     ; preds = %54
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 12)
  %59 = add i64 %pgocount1, 1
  store i64 %59, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 12)
  br label %214

; <label>:60:                                     ; preds = %54
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 7)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 7)
  %62 = load i8*, i8** %14, align 8
  %63 = load i8*, i8** %10, align 8
  %64 = load i32, i32* %15, align 4
  call void @_TIFFmemcpy(i8* %62, i8* %63, i32 %64)
  %65 = load i32, i32* %15, align 4
  %66 = load i8*, i8** %10, align 8
  %67 = sext i32 %65 to i64
  %68 = getelementptr inbounds i8, i8* %66, i64 %67
  store i8* %68, i8** %10, align 8
  %69 = load i32, i32* %15, align 4
  %70 = load i32, i32* %12, align 4
  %71 = sub nsw i32 %70, %69
  store i32 %71, i32* %12, align 4
  br label %197

; <label>:72:                                     ; preds = %46
  %73 = load i8*, i8** %10, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 0
  %75 = load i8, i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = mul nsw i32 %76, 256
  %78 = load i8*, i8** %10, align 8
  %79 = getelementptr inbounds i8, i8* %78, i64 1
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = add nsw i32 %77, %81
  store i32 %82, i32* %16, align 4
  %83 = load i8*, i8** %10, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 2
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = mul nsw i32 %86, 256
  %88 = load i8*, i8** %10, align 8
  %89 = getelementptr inbounds i8, i8* %88, i64 3
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i32
  %92 = add nsw i32 %87, %91
  store i32 %92, i32* %13, align 4
  %93 = load i32, i32* %12, align 4
  %94 = load i32, i32* %13, align 4
  %95 = add nsw i32 4, %94
  %96 = icmp slt i32 %93, %95
  br i1 %96, label %97, label %99

; <label>:97:                                     ; preds = %72
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 13)
  %98 = add i64 %pgocount3, 1
  store i64 %98, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 13)
  br label %214

; <label>:99:                                     ; preds = %72
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 8)
  %100 = add i64 %pgocount4, 1
  store i64 %100, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 8)
  %101 = load i8*, i8** %14, align 8
  %102 = load i32, i32* %16, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i8, i8* %101, i64 %103
  %105 = load i8*, i8** %10, align 8
  %106 = getelementptr inbounds i8, i8* %105, i64 4
  %107 = load i32, i32* %13, align 4
  call void @_TIFFmemcpy(i8* %104, i8* %106, i32 %107)
  %108 = load i32, i32* %13, align 4
  %109 = add nsw i32 4, %108
  %110 = load i8*, i8** %10, align 8
  %111 = sext i32 %109 to i64
  %112 = getelementptr inbounds i8, i8* %110, i64 %111
  store i8* %112, i8** %10, align 8
  %113 = load i32, i32* %13, align 4
  %114 = add nsw i32 4, %113
  %115 = load i32, i32* %12, align 4
  %116 = sub nsw i32 %115, %114
  store i32 %116, i32* %12, align 4
  br label %197

; <label>:117:                                    ; preds = %46
  store i32 0, i32* %17, align 4
  %118 = load %struct.tiff*, %struct.tiff** %6, align 8
  %119 = getelementptr inbounds %struct.tiff, %struct.tiff* %118, i32 0, i32 6
  %120 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %119, i32 0, i32 1
  %121 = load i32, i32* %120, align 8
  %122 = zext i32 %121 to i64
  store i64 %122, i64* %19, align 8
  %123 = load i8*, i8** %14, align 8
  store i8* %123, i8** %11, align 8
  br label %124

; <label>:124:                                    ; preds = %187, %117
  %125 = load i32, i32* %13, align 4
  %126 = ashr i32 %125, 6
  %127 = and i32 %126, 3
  store i32 %127, i32* %18, align 4
  %128 = load i32, i32* %13, align 4
  %129 = and i32 %128, 63
  store i32 %129, i32* %13, align 4
  br label %130

; <label>:130:                                    ; preds = %174, %124
  %131 = load i32, i32* %13, align 4
  %132 = add nsw i32 %131, -1
  store i32 %132, i32* %13, align 4
  %133 = icmp sgt i32 %131, 0
  br i1 %133, label %134, label %176

; <label>:134:                                    ; preds = %130
  %135 = load i32, i32* %17, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, i32* %17, align 4
  %137 = and i32 %135, 3
  switch i32 %137, label %174 [
    i32 0, label %138
    i32 1, label %145
    i32 2, label %155
    i32 3, label %165
  ]

; <label>:138:                                    ; preds = %134
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 1)
  %139 = add i64 %pgocount5, 1
  store i64 %139, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 1)
  %140 = load i32, i32* %18, align 4
  %141 = shl i32 %140, 6
  %142 = trunc i32 %141 to i8
  %143 = load i8*, i8** %11, align 8
  %144 = getelementptr inbounds i8, i8* %143, i64 0
  store i8 %142, i8* %144, align 1
  br label %174

; <label>:145:                                    ; preds = %134
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 2)
  %146 = add i64 %pgocount6, 1
  store i64 %146, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 2)
  %147 = load i32, i32* %18, align 4
  %148 = shl i32 %147, 4
  %149 = load i8*, i8** %11, align 8
  %150 = getelementptr inbounds i8, i8* %149, i64 0
  %151 = load i8, i8* %150, align 1
  %152 = zext i8 %151 to i32
  %153 = or i32 %152, %148
  %154 = trunc i32 %153 to i8
  store i8 %154, i8* %150, align 1
  br label %174

; <label>:155:                                    ; preds = %134
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 3)
  %156 = add i64 %pgocount7, 1
  store i64 %156, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 3)
  %157 = load i32, i32* %18, align 4
  %158 = shl i32 %157, 2
  %159 = load i8*, i8** %11, align 8
  %160 = getelementptr inbounds i8, i8* %159, i64 0
  %161 = load i8, i8* %160, align 1
  %162 = zext i8 %161 to i32
  %163 = or i32 %162, %158
  %164 = trunc i32 %163 to i8
  store i8 %164, i8* %160, align 1
  br label %174

; <label>:165:                                    ; preds = %134
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 4)
  %166 = add i64 %pgocount8, 1
  store i64 %166, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 4)
  %167 = load i32, i32* %18, align 4
  %168 = load i8*, i8** %11, align 8
  %169 = getelementptr inbounds i8, i8* %168, i32 1
  store i8* %169, i8** %11, align 8
  %170 = load i8, i8* %168, align 1
  %171 = zext i8 %170 to i32
  %172 = or i32 %171, %167
  %173 = trunc i32 %172 to i8
  store i8 %173, i8* %168, align 1
  br label %174

; <label>:174:                                    ; preds = %165, %155, %145, %138, %134
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 0)
  %175 = add i64 %pgocount9, 1
  store i64 %175, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 0)
  br label %130

; <label>:176:                                    ; preds = %130
  %177 = load i32, i32* %17, align 4
  %178 = load i64, i64* %19, align 8
  %179 = trunc i64 %178 to i32
  %180 = icmp sge i32 %177, %179
  br i1 %180, label %181, label %182

; <label>:181:                                    ; preds = %176
  br label %195

; <label>:182:                                    ; preds = %176
  %183 = load i32, i32* %12, align 4
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %187

; <label>:185:                                    ; preds = %182
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 10)
  %186 = add i64 %pgocount10, 1
  store i64 %186, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 10)
  br label %214

; <label>:187:                                    ; preds = %182
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 6)
  %188 = add i64 %pgocount11, 1
  store i64 %188, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 6)
  %189 = load i8*, i8** %10, align 8
  %190 = getelementptr inbounds i8, i8* %189, i32 1
  store i8* %190, i8** %10, align 8
  %191 = load i8, i8* %189, align 1
  %192 = zext i8 %191 to i32
  store i32 %192, i32* %13, align 4
  %193 = load i32, i32* %12, align 4
  %194 = add nsw i32 %193, -1
  store i32 %194, i32* %12, align 4
  br label %124

; <label>:195:                                    ; preds = %181
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 9)
  %196 = add i64 %pgocount12, 1
  store i64 %196, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 9)
  br label %197

; <label>:197:                                    ; preds = %195, %99, %60
  br label %198

; <label>:198:                                    ; preds = %197
  %199 = load i32, i32* %15, align 4
  %200 = load i32, i32* %8, align 4
  %201 = sub nsw i32 %200, %199
  store i32 %201, i32* %8, align 4
  %202 = load i32, i32* %15, align 4
  %203 = load i8*, i8** %14, align 8
  %204 = sext i32 %202 to i64
  %205 = getelementptr inbounds i8, i8* %203, i64 %204
  store i8* %205, i8** %14, align 8
  br label %42

; <label>:206:                                    ; preds = %42
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 11)
  %207 = add i64 %pgocount13, 1
  store i64 %207, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_NeXTDecode, i64 0, i64 11)
  %208 = load i8*, i8** %10, align 8
  %209 = load %struct.tiff*, %struct.tiff** %6, align 8
  %210 = getelementptr inbounds %struct.tiff, %struct.tiff* %209, i32 0, i32 42
  store i8* %208, i8** %210, align 8
  %211 = load i32, i32* %12, align 4
  %212 = load %struct.tiff*, %struct.tiff** %6, align 8
  %213 = getelementptr inbounds %struct.tiff, %struct.tiff* %212, i32 0, i32 43
  store i32 %211, i32* %213, align 8
  store i32 1, i32* %5, align 4
  br label %222

; <label>:214:                                    ; preds = %185, %97, %58
  %215 = load %struct.tiff*, %struct.tiff** %6, align 8
  %216 = getelementptr inbounds %struct.tiff, %struct.tiff* %215, i32 0, i32 0
  %217 = load i8*, i8** %216, align 8
  %218 = load %struct.tiff*, %struct.tiff** %6, align 8
  %219 = getelementptr inbounds %struct.tiff, %struct.tiff* %218, i32 0, i32 11
  %220 = load i32, i32* %219, align 8
  %221 = zext i32 %220 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %217, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0), i64 %221)
  store i32 0, i32* %5, align 4
  br label %222

; <label>:222:                                    ; preds = %214, %206
  %223 = load i32, i32* %5, align 4
  ret i32 %223
}

declare void @_TIFFmemcpy(i8*, i8*, i32) #1

declare void @TIFFError(i8*, i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
