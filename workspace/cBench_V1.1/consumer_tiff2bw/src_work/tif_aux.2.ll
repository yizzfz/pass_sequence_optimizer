; ModuleID = 'tmp1.ll'
source_filename = "tif_aux.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, {}*, {}*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFVGetFieldDefaulted = private constant [22 x i8] c"TIFFVGetFieldDefaulted"
@__profn_tmp1.ll_TIFFDefaultTransferFunction = private constant [35 x i8] c"tmp1.ll:TIFFDefaultTransferFunction"
@__profn_tmp1.ll_TIFFDefaultRefBlackWhite = private constant [32 x i8] c"tmp1.ll:TIFFDefaultRefBlackWhite"
@__profn_TIFFGetFieldDefaulted = private constant [21 x i8] c"TIFFGetFieldDefaulted"
@__profc_TIFFVGetFieldDefaulted = private global [60 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFVGetFieldDefaulted = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1704654147334378256, i64 799824558550, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @TIFFVGetFieldDefaulted to i8*), i8* null, i32 60, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFDefaultTransferFunction = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFDefaultTransferFunction = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7528662010865335644, i64 44592619267, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFDefaultTransferFunction, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFDefaultRefBlackWhite = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFDefaultRefBlackWhite = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3490604775621122776, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFDefaultRefBlackWhite, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFGetFieldDefaulted = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFGetFieldDefaulted = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4226596154251347282, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetFieldDefaulted, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, ...)* @TIFFGetFieldDefaulted to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [82 x i8] c"qPx\DA\0B\F1ts\0BsO-q\CBL\CDIqIMK,\CD)IMa,\C9-0\D4\CB\C9\B1\0A\01JCEC\8A\12\F3\8A\D3R\8B\DCJ\F3\92K2\F3\F3\B0\A9\09JMs\CAIL\CE\0E\CF\C8,Ie\04I`\18\0D\00\FC\0B(\B6", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFVGetFieldDefaulted to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFDefaultTransferFunction to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFDefaultRefBlackWhite to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFGetFieldDefaulted to i8*), i8* getelementptr inbounds ([82 x i8], [82 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @TIFFVGetFieldDefaulted(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.__va_list_tag*, align 8
  %8 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %7, align 8
  %9 = load %struct.tiff*, %struct.tiff** %5, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 6
  store %struct.TIFFDirectory* %10, %struct.TIFFDirectory** %8, align 8
  %11 = load %struct.tiff*, %struct.tiff** %5, align 8
  %12 = load i32, i32* %6, align 4
  %13 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %14 = call i32 @TIFFVGetField(%struct.tiff* %11, i32 %12, %struct.__va_list_tag* %13)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 0)
  store i32 1, i32* %4, align 4
  br label %785

; <label>:18:                                     ; preds = %3
  %19 = load i32, i32* %6, align 4
  switch i32 %19, label %783 [
    i32 254, label %20
    i32 258, label %44
    i32 263, label %68
    i32 266, label %92
    i32 274, label %116
    i32 277, label %140
    i32 278, label %164
    i32 280, label %188
    i32 281, label %212
    i32 284, label %236
    i32 296, label %260
    i32 336, label %284
    i32 332, label %331
    i32 334, label %355
    i32 338, label %379
    i32 32995, label %425
    i32 32998, label %464
    i32 32996, label %488
    i32 32997, label %515
    i32 529, label %539
    i32 530, label %586
    i32 531, label %634
    i32 301, label %658
    i32 532, label %751
  ]

; <label>:20:                                     ; preds = %18
  %21 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %22 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %21, i32 0, i32 7
  %23 = load i32, i32* %22, align 8
  %24 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %25 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %24, i32 0, i32 0
  %26 = load i32, i32* %25, align 8
  %27 = icmp ule i32 %26, 40
  br i1 %27, label %28, label %35

; <label>:28:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 2)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 2)
  %30 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %24, i32 0, i32 3
  %31 = load i8*, i8** %30, align 8
  %32 = getelementptr i8, i8* %31, i32 %26
  %33 = bitcast i8* %32 to i32**
  %34 = add i32 %26, 8
  store i32 %34, i32* %25, align 8
  br label %41

; <label>:35:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 3)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 3)
  %37 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %24, i32 0, i32 2
  %38 = load i8*, i8** %37, align 8
  %39 = bitcast i8* %38 to i32**
  %40 = getelementptr i8, i8* %38, i32 8
  store i8* %40, i8** %37, align 8
  br label %41

; <label>:41:                                     ; preds = %35, %28
  %42 = phi i32** [ %33, %28 ], [ %39, %35 ]
  %43 = load i32*, i32** %42, align 8
  store i32 %23, i32* %43, align 4
  store i32 1, i32* %4, align 4
  br label %785

; <label>:44:                                     ; preds = %18
  %45 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %46 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %45, i32 0, i32 8
  %47 = load i16, i16* %46, align 4
  %48 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %49 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %48, i32 0, i32 0
  %50 = load i32, i32* %49, align 8
  %51 = icmp ule i32 %50, 40
  br i1 %51, label %52, label %59

; <label>:52:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 4)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 4)
  %54 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %48, i32 0, i32 3
  %55 = load i8*, i8** %54, align 8
  %56 = getelementptr i8, i8* %55, i32 %50
  %57 = bitcast i8* %56 to i16**
  %58 = add i32 %50, 8
  store i32 %58, i32* %49, align 8
  br label %65

; <label>:59:                                     ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 5)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 5)
  %61 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %48, i32 0, i32 2
  %62 = load i8*, i8** %61, align 8
  %63 = bitcast i8* %62 to i16**
  %64 = getelementptr i8, i8* %62, i32 8
  store i8* %64, i8** %61, align 8
  br label %65

; <label>:65:                                     ; preds = %59, %52
  %66 = phi i16** [ %57, %52 ], [ %63, %59 ]
  %67 = load i16*, i16** %66, align 8
  store i16 %47, i16* %67, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:68:                                     ; preds = %18
  %69 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %70 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %69, i32 0, i32 12
  %71 = load i16, i16* %70, align 4
  %72 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %73 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %72, i32 0, i32 0
  %74 = load i32, i32* %73, align 8
  %75 = icmp ule i32 %74, 40
  br i1 %75, label %76, label %83

; <label>:76:                                     ; preds = %68
  %pgocount5 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 6)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 6)
  %78 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %72, i32 0, i32 3
  %79 = load i8*, i8** %78, align 8
  %80 = getelementptr i8, i8* %79, i32 %74
  %81 = bitcast i8* %80 to i16**
  %82 = add i32 %74, 8
  store i32 %82, i32* %73, align 8
  br label %89

; <label>:83:                                     ; preds = %68
  %pgocount6 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 7)
  %84 = add i64 %pgocount6, 1
  store i64 %84, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 7)
  %85 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %72, i32 0, i32 2
  %86 = load i8*, i8** %85, align 8
  %87 = bitcast i8* %86 to i16**
  %88 = getelementptr i8, i8* %86, i32 8
  store i8* %88, i8** %85, align 8
  br label %89

; <label>:89:                                     ; preds = %83, %76
  %90 = phi i16** [ %81, %76 ], [ %87, %83 ]
  %91 = load i16*, i16** %90, align 8
  store i16 %71, i16* %91, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:92:                                     ; preds = %18
  %93 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %94 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %93, i32 0, i32 13
  %95 = load i16, i16* %94, align 2
  %96 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %97 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %96, i32 0, i32 0
  %98 = load i32, i32* %97, align 8
  %99 = icmp ule i32 %98, 40
  br i1 %99, label %100, label %107

; <label>:100:                                    ; preds = %92
  %pgocount7 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 8)
  %101 = add i64 %pgocount7, 1
  store i64 %101, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 8)
  %102 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %96, i32 0, i32 3
  %103 = load i8*, i8** %102, align 8
  %104 = getelementptr i8, i8* %103, i32 %98
  %105 = bitcast i8* %104 to i16**
  %106 = add i32 %98, 8
  store i32 %106, i32* %97, align 8
  br label %113

; <label>:107:                                    ; preds = %92
  %pgocount8 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 9)
  %108 = add i64 %pgocount8, 1
  store i64 %108, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 9)
  %109 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %96, i32 0, i32 2
  %110 = load i8*, i8** %109, align 8
  %111 = bitcast i8* %110 to i16**
  %112 = getelementptr i8, i8* %110, i32 8
  store i8* %112, i8** %109, align 8
  br label %113

; <label>:113:                                    ; preds = %107, %100
  %114 = phi i16** [ %105, %100 ], [ %111, %107 ]
  %115 = load i16*, i16** %114, align 8
  store i16 %95, i16* %115, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:116:                                    ; preds = %18
  %117 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %118 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %117, i32 0, i32 14
  %119 = load i16, i16* %118, align 8
  %120 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %121 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %120, i32 0, i32 0
  %122 = load i32, i32* %121, align 8
  %123 = icmp ule i32 %122, 40
  br i1 %123, label %124, label %131

; <label>:124:                                    ; preds = %116
  %pgocount9 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 10)
  %125 = add i64 %pgocount9, 1
  store i64 %125, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 10)
  %126 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %120, i32 0, i32 3
  %127 = load i8*, i8** %126, align 8
  %128 = getelementptr i8, i8* %127, i32 %122
  %129 = bitcast i8* %128 to i16**
  %130 = add i32 %122, 8
  store i32 %130, i32* %121, align 8
  br label %137

; <label>:131:                                    ; preds = %116
  %pgocount10 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 11)
  %132 = add i64 %pgocount10, 1
  store i64 %132, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 11)
  %133 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %120, i32 0, i32 2
  %134 = load i8*, i8** %133, align 8
  %135 = bitcast i8* %134 to i16**
  %136 = getelementptr i8, i8* %134, i32 8
  store i8* %136, i8** %133, align 8
  br label %137

; <label>:137:                                    ; preds = %131, %124
  %138 = phi i16** [ %129, %124 ], [ %135, %131 ]
  %139 = load i16*, i16** %138, align 8
  store i16 %119, i16* %139, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:140:                                    ; preds = %18
  %141 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %142 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %141, i32 0, i32 15
  %143 = load i16, i16* %142, align 2
  %144 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %145 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %144, i32 0, i32 0
  %146 = load i32, i32* %145, align 8
  %147 = icmp ule i32 %146, 40
  br i1 %147, label %148, label %155

; <label>:148:                                    ; preds = %140
  %pgocount11 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 12)
  %149 = add i64 %pgocount11, 1
  store i64 %149, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 12)
  %150 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %144, i32 0, i32 3
  %151 = load i8*, i8** %150, align 8
  %152 = getelementptr i8, i8* %151, i32 %146
  %153 = bitcast i8* %152 to i16**
  %154 = add i32 %146, 8
  store i32 %154, i32* %145, align 8
  br label %161

; <label>:155:                                    ; preds = %140
  %pgocount12 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 13)
  %156 = add i64 %pgocount12, 1
  store i64 %156, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 13)
  %157 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %144, i32 0, i32 2
  %158 = load i8*, i8** %157, align 8
  %159 = bitcast i8* %158 to i16**
  %160 = getelementptr i8, i8* %158, i32 8
  store i8* %160, i8** %157, align 8
  br label %161

; <label>:161:                                    ; preds = %155, %148
  %162 = phi i16** [ %153, %148 ], [ %159, %155 ]
  %163 = load i16*, i16** %162, align 8
  store i16 %143, i16* %163, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:164:                                    ; preds = %18
  %165 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %166 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %165, i32 0, i32 16
  %167 = load i32, i32* %166, align 4
  %168 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %169 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %168, i32 0, i32 0
  %170 = load i32, i32* %169, align 8
  %171 = icmp ule i32 %170, 40
  br i1 %171, label %172, label %179

; <label>:172:                                    ; preds = %164
  %pgocount13 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 14)
  %173 = add i64 %pgocount13, 1
  store i64 %173, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 14)
  %174 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %168, i32 0, i32 3
  %175 = load i8*, i8** %174, align 8
  %176 = getelementptr i8, i8* %175, i32 %170
  %177 = bitcast i8* %176 to i32**
  %178 = add i32 %170, 8
  store i32 %178, i32* %169, align 8
  br label %185

; <label>:179:                                    ; preds = %164
  %pgocount14 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 15)
  %180 = add i64 %pgocount14, 1
  store i64 %180, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 15)
  %181 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %168, i32 0, i32 2
  %182 = load i8*, i8** %181, align 8
  %183 = bitcast i8* %182 to i32**
  %184 = getelementptr i8, i8* %182, i32 8
  store i8* %184, i8** %181, align 8
  br label %185

; <label>:185:                                    ; preds = %179, %172
  %186 = phi i32** [ %177, %172 ], [ %183, %179 ]
  %187 = load i32*, i32** %186, align 8
  store i32 %167, i32* %187, align 4
  store i32 1, i32* %4, align 4
  br label %785

; <label>:188:                                    ; preds = %18
  %189 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %190 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %189, i32 0, i32 17
  %191 = load i16, i16* %190, align 8
  %192 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %193 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %192, i32 0, i32 0
  %194 = load i32, i32* %193, align 8
  %195 = icmp ule i32 %194, 40
  br i1 %195, label %196, label %203

; <label>:196:                                    ; preds = %188
  %pgocount15 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 16)
  %197 = add i64 %pgocount15, 1
  store i64 %197, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 16)
  %198 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %192, i32 0, i32 3
  %199 = load i8*, i8** %198, align 8
  %200 = getelementptr i8, i8* %199, i32 %194
  %201 = bitcast i8* %200 to i16**
  %202 = add i32 %194, 8
  store i32 %202, i32* %193, align 8
  br label %209

; <label>:203:                                    ; preds = %188
  %pgocount16 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 17)
  %204 = add i64 %pgocount16, 1
  store i64 %204, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 17)
  %205 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %192, i32 0, i32 2
  %206 = load i8*, i8** %205, align 8
  %207 = bitcast i8* %206 to i16**
  %208 = getelementptr i8, i8* %206, i32 8
  store i8* %208, i8** %205, align 8
  br label %209

; <label>:209:                                    ; preds = %203, %196
  %210 = phi i16** [ %201, %196 ], [ %207, %203 ]
  %211 = load i16*, i16** %210, align 8
  store i16 %191, i16* %211, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:212:                                    ; preds = %18
  %213 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %214 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %213, i32 0, i32 18
  %215 = load i16, i16* %214, align 2
  %216 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %217 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %216, i32 0, i32 0
  %218 = load i32, i32* %217, align 8
  %219 = icmp ule i32 %218, 40
  br i1 %219, label %220, label %227

; <label>:220:                                    ; preds = %212
  %pgocount17 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 18)
  %221 = add i64 %pgocount17, 1
  store i64 %221, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 18)
  %222 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %216, i32 0, i32 3
  %223 = load i8*, i8** %222, align 8
  %224 = getelementptr i8, i8* %223, i32 %218
  %225 = bitcast i8* %224 to i16**
  %226 = add i32 %218, 8
  store i32 %226, i32* %217, align 8
  br label %233

; <label>:227:                                    ; preds = %212
  %pgocount18 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 19)
  %228 = add i64 %pgocount18, 1
  store i64 %228, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 19)
  %229 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %216, i32 0, i32 2
  %230 = load i8*, i8** %229, align 8
  %231 = bitcast i8* %230 to i16**
  %232 = getelementptr i8, i8* %230, i32 8
  store i8* %232, i8** %229, align 8
  br label %233

; <label>:233:                                    ; preds = %227, %220
  %234 = phi i16** [ %225, %220 ], [ %231, %227 ]
  %235 = load i16*, i16** %234, align 8
  store i16 %215, i16* %235, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:236:                                    ; preds = %18
  %237 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %238 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %237, i32 0, i32 24
  %239 = load i16, i16* %238, align 2
  %240 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %241 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %240, i32 0, i32 0
  %242 = load i32, i32* %241, align 8
  %243 = icmp ule i32 %242, 40
  br i1 %243, label %244, label %251

; <label>:244:                                    ; preds = %236
  %pgocount19 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 20)
  %245 = add i64 %pgocount19, 1
  store i64 %245, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 20)
  %246 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %240, i32 0, i32 3
  %247 = load i8*, i8** %246, align 8
  %248 = getelementptr i8, i8* %247, i32 %242
  %249 = bitcast i8* %248 to i16**
  %250 = add i32 %242, 8
  store i32 %250, i32* %241, align 8
  br label %257

; <label>:251:                                    ; preds = %236
  %pgocount20 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 21)
  %252 = add i64 %pgocount20, 1
  store i64 %252, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 21)
  %253 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %240, i32 0, i32 2
  %254 = load i8*, i8** %253, align 8
  %255 = bitcast i8* %254 to i16**
  %256 = getelementptr i8, i8* %254, i32 8
  store i8* %256, i8** %253, align 8
  br label %257

; <label>:257:                                    ; preds = %251, %244
  %258 = phi i16** [ %249, %244 ], [ %255, %251 ]
  %259 = load i16*, i16** %258, align 8
  store i16 %239, i16* %259, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:260:                                    ; preds = %18
  %261 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %262 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %261, i32 0, i32 23
  %263 = load i16, i16* %262, align 8
  %264 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %265 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %264, i32 0, i32 0
  %266 = load i32, i32* %265, align 8
  %267 = icmp ule i32 %266, 40
  br i1 %267, label %268, label %275

; <label>:268:                                    ; preds = %260
  %pgocount21 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 22)
  %269 = add i64 %pgocount21, 1
  store i64 %269, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 22)
  %270 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %264, i32 0, i32 3
  %271 = load i8*, i8** %270, align 8
  %272 = getelementptr i8, i8* %271, i32 %266
  %273 = bitcast i8* %272 to i16**
  %274 = add i32 %266, 8
  store i32 %274, i32* %265, align 8
  br label %281

; <label>:275:                                    ; preds = %260
  %pgocount22 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 23)
  %276 = add i64 %pgocount22, 1
  store i64 %276, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 23)
  %277 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %264, i32 0, i32 2
  %278 = load i8*, i8** %277, align 8
  %279 = bitcast i8* %278 to i16**
  %280 = getelementptr i8, i8* %278, i32 8
  store i8* %280, i8** %277, align 8
  br label %281

; <label>:281:                                    ; preds = %275, %268
  %282 = phi i16** [ %273, %268 ], [ %279, %275 ]
  %283 = load i16*, i16** %282, align 8
  store i16 %263, i16* %283, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:284:                                    ; preds = %18
  %285 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %286 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %285, i32 0, i32 0
  %287 = load i32, i32* %286, align 8
  %288 = icmp ule i32 %287, 40
  br i1 %288, label %289, label %295

; <label>:289:                                    ; preds = %284
  %290 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %285, i32 0, i32 3
  %291 = load i8*, i8** %290, align 8
  %292 = getelementptr i8, i8* %291, i32 %287
  %293 = bitcast i8* %292 to i16**
  %294 = add i32 %287, 8
  store i32 %294, i32* %286, align 8
  br label %301

; <label>:295:                                    ; preds = %284
  %pgocount23 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 24)
  %296 = add i64 %pgocount23, 1
  store i64 %296, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 24)
  %297 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %285, i32 0, i32 2
  %298 = load i8*, i8** %297, align 8
  %299 = bitcast i8* %298 to i16**
  %300 = getelementptr i8, i8* %298, i32 8
  store i8* %300, i8** %297, align 8
  br label %301

; <label>:301:                                    ; preds = %295, %289
  %302 = phi i16** [ %293, %289 ], [ %299, %295 ]
  %303 = load i16*, i16** %302, align 8
  store i16 0, i16* %303, align 2
  %304 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %305 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %304, i32 0, i32 8
  %306 = load i16, i16* %305, align 4
  %307 = zext i16 %306 to i32
  %308 = shl i32 1, %307
  %309 = sub nsw i32 %308, 1
  %310 = trunc i32 %309 to i16
  %311 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %312 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %311, i32 0, i32 0
  %313 = load i32, i32* %312, align 8
  %314 = icmp ule i32 %313, 40
  br i1 %314, label %315, label %322

; <label>:315:                                    ; preds = %301
  %pgocount24 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 25)
  %316 = add i64 %pgocount24, 1
  store i64 %316, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 25)
  %317 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %311, i32 0, i32 3
  %318 = load i8*, i8** %317, align 8
  %319 = getelementptr i8, i8* %318, i32 %313
  %320 = bitcast i8* %319 to i16**
  %321 = add i32 %313, 8
  store i32 %321, i32* %312, align 8
  br label %328

; <label>:322:                                    ; preds = %301
  %pgocount25 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 26)
  %323 = add i64 %pgocount25, 1
  store i64 %323, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 26)
  %324 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %311, i32 0, i32 2
  %325 = load i8*, i8** %324, align 8
  %326 = bitcast i8* %325 to i16**
  %327 = getelementptr i8, i8* %325, i32 8
  store i8* %327, i8** %324, align 8
  br label %328

; <label>:328:                                    ; preds = %322, %315
  %329 = phi i16** [ %320, %315 ], [ %326, %322 ]
  %330 = load i16*, i16** %329, align 8
  store i16 %310, i16* %330, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:331:                                    ; preds = %18
  %332 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %333 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %332, i32 0, i32 55
  %334 = load i16, i16* %333, align 8
  %335 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %336 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %335, i32 0, i32 0
  %337 = load i32, i32* %336, align 8
  %338 = icmp ule i32 %337, 40
  br i1 %338, label %339, label %346

; <label>:339:                                    ; preds = %331
  %pgocount26 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 27)
  %340 = add i64 %pgocount26, 1
  store i64 %340, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 27)
  %341 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %335, i32 0, i32 3
  %342 = load i8*, i8** %341, align 8
  %343 = getelementptr i8, i8* %342, i32 %337
  %344 = bitcast i8* %343 to i16**
  %345 = add i32 %337, 8
  store i32 %345, i32* %336, align 8
  br label %352

; <label>:346:                                    ; preds = %331
  %pgocount27 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 28)
  %347 = add i64 %pgocount27, 1
  store i64 %347, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 28)
  %348 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %335, i32 0, i32 2
  %349 = load i8*, i8** %348, align 8
  %350 = bitcast i8* %349 to i16**
  %351 = getelementptr i8, i8* %349, i32 8
  store i8* %351, i8** %348, align 8
  br label %352

; <label>:352:                                    ; preds = %346, %339
  %353 = phi i16** [ %344, %339 ], [ %350, %346 ]
  %354 = load i16*, i16** %353, align 8
  store i16 %334, i16* %354, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:355:                                    ; preds = %18
  %356 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %357 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %356, i32 0, i32 56
  %358 = load i16, i16* %357, align 2
  %359 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %360 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %359, i32 0, i32 0
  %361 = load i32, i32* %360, align 8
  %362 = icmp ule i32 %361, 40
  br i1 %362, label %363, label %370

; <label>:363:                                    ; preds = %355
  %pgocount28 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 29)
  %364 = add i64 %pgocount28, 1
  store i64 %364, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 29)
  %365 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %359, i32 0, i32 3
  %366 = load i8*, i8** %365, align 8
  %367 = getelementptr i8, i8* %366, i32 %361
  %368 = bitcast i8* %367 to i16**
  %369 = add i32 %361, 8
  store i32 %369, i32* %360, align 8
  br label %376

; <label>:370:                                    ; preds = %355
  %pgocount29 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 30)
  %371 = add i64 %pgocount29, 1
  store i64 %371, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 30)
  %372 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %359, i32 0, i32 2
  %373 = load i8*, i8** %372, align 8
  %374 = bitcast i8* %373 to i16**
  %375 = getelementptr i8, i8* %373, i32 8
  store i8* %375, i8** %372, align 8
  br label %376

; <label>:376:                                    ; preds = %370, %363
  %377 = phi i16** [ %368, %363 ], [ %374, %370 ]
  %378 = load i16*, i16** %377, align 8
  store i16 %358, i16* %378, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:379:                                    ; preds = %18
  %380 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %381 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %380, i32 0, i32 30
  %382 = load i16, i16* %381, align 4
  %383 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %384 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %383, i32 0, i32 0
  %385 = load i32, i32* %384, align 8
  %386 = icmp ule i32 %385, 40
  br i1 %386, label %387, label %393

; <label>:387:                                    ; preds = %379
  %388 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %383, i32 0, i32 3
  %389 = load i8*, i8** %388, align 8
  %390 = getelementptr i8, i8* %389, i32 %385
  %391 = bitcast i8* %390 to i16**
  %392 = add i32 %385, 8
  store i32 %392, i32* %384, align 8
  br label %399

; <label>:393:                                    ; preds = %379
  %pgocount30 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 31)
  %394 = add i64 %pgocount30, 1
  store i64 %394, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 31)
  %395 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %383, i32 0, i32 2
  %396 = load i8*, i8** %395, align 8
  %397 = bitcast i8* %396 to i16**
  %398 = getelementptr i8, i8* %396, i32 8
  store i8* %398, i8** %395, align 8
  br label %399

; <label>:399:                                    ; preds = %393, %387
  %400 = phi i16** [ %391, %387 ], [ %397, %393 ]
  %401 = load i16*, i16** %400, align 8
  store i16 %382, i16* %401, align 2
  %402 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %403 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %402, i32 0, i32 31
  %404 = load i16*, i16** %403, align 8
  %405 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %406 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %405, i32 0, i32 0
  %407 = load i32, i32* %406, align 8
  %408 = icmp ule i32 %407, 40
  br i1 %408, label %409, label %416

; <label>:409:                                    ; preds = %399
  %pgocount31 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 32)
  %410 = add i64 %pgocount31, 1
  store i64 %410, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 32)
  %411 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %405, i32 0, i32 3
  %412 = load i8*, i8** %411, align 8
  %413 = getelementptr i8, i8* %412, i32 %407
  %414 = bitcast i8* %413 to i16***
  %415 = add i32 %407, 8
  store i32 %415, i32* %406, align 8
  br label %422

; <label>:416:                                    ; preds = %399
  %pgocount32 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 33)
  %417 = add i64 %pgocount32, 1
  store i64 %417, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 33)
  %418 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %405, i32 0, i32 2
  %419 = load i8*, i8** %418, align 8
  %420 = bitcast i8* %419 to i16***
  %421 = getelementptr i8, i8* %419, i32 8
  store i8* %421, i8** %418, align 8
  br label %422

; <label>:422:                                    ; preds = %416, %409
  %423 = phi i16*** [ %414, %409 ], [ %420, %416 ]
  %424 = load i16**, i16*** %423, align 8
  store i16* %404, i16** %424, align 8
  store i32 1, i32* %4, align 4
  br label %785

; <label>:425:                                    ; preds = %18
  %426 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %427 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %426, i32 0, i32 30
  %428 = load i16, i16* %427, align 4
  %429 = zext i16 %428 to i32
  %430 = icmp eq i32 %429, 1
  br i1 %430, label %431, label %440

; <label>:431:                                    ; preds = %425
  %pgocount33 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 34)
  %432 = add i64 %pgocount33, 1
  store i64 %432, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 34)
  %433 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %434 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %433, i32 0, i32 31
  %435 = load i16*, i16** %434, align 8
  %436 = getelementptr inbounds i16, i16* %435, i64 0
  %437 = load i16, i16* %436, align 2
  %438 = zext i16 %437 to i32
  %439 = icmp eq i32 %438, 1
  br label %440

; <label>:440:                                    ; preds = %431, %425
  %441 = phi i1 [ false, %425 ], [ %439, %431 ]
  %442 = zext i1 %441 to i32
  %443 = trunc i32 %442 to i16
  %444 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %445 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %444, i32 0, i32 0
  %446 = load i32, i32* %445, align 8
  %447 = icmp ule i32 %446, 40
  br i1 %447, label %448, label %455

; <label>:448:                                    ; preds = %440
  %pgocount34 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 35)
  %449 = add i64 %pgocount34, 1
  store i64 %449, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 35)
  %450 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %444, i32 0, i32 3
  %451 = load i8*, i8** %450, align 8
  %452 = getelementptr i8, i8* %451, i32 %446
  %453 = bitcast i8* %452 to i16**
  %454 = add i32 %446, 8
  store i32 %454, i32* %445, align 8
  br label %461

; <label>:455:                                    ; preds = %440
  %pgocount35 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 36)
  %456 = add i64 %pgocount35, 1
  store i64 %456, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 36)
  %457 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %444, i32 0, i32 2
  %458 = load i8*, i8** %457, align 8
  %459 = bitcast i8* %458 to i16**
  %460 = getelementptr i8, i8* %458, i32 8
  store i8* %460, i8** %457, align 8
  br label %461

; <label>:461:                                    ; preds = %455, %448
  %462 = phi i16** [ %453, %448 ], [ %459, %455 ]
  %463 = load i16*, i16** %462, align 8
  store i16 %443, i16* %463, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:464:                                    ; preds = %18
  %465 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %466 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %465, i32 0, i32 6
  %467 = load i32, i32* %466, align 4
  %468 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %469 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %468, i32 0, i32 0
  %470 = load i32, i32* %469, align 8
  %471 = icmp ule i32 %470, 40
  br i1 %471, label %472, label %479

; <label>:472:                                    ; preds = %464
  %pgocount36 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 37)
  %473 = add i64 %pgocount36, 1
  store i64 %473, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 37)
  %474 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %468, i32 0, i32 3
  %475 = load i8*, i8** %474, align 8
  %476 = getelementptr i8, i8* %475, i32 %470
  %477 = bitcast i8* %476 to i32**
  %478 = add i32 %470, 8
  store i32 %478, i32* %469, align 8
  br label %485

; <label>:479:                                    ; preds = %464
  %pgocount37 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 38)
  %480 = add i64 %pgocount37, 1
  store i64 %480, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 38)
  %481 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %468, i32 0, i32 2
  %482 = load i8*, i8** %481, align 8
  %483 = bitcast i8* %482 to i32**
  %484 = getelementptr i8, i8* %482, i32 8
  store i8* %484, i8** %481, align 8
  br label %485

; <label>:485:                                    ; preds = %479, %472
  %486 = phi i32** [ %477, %472 ], [ %483, %479 ]
  %487 = load i32*, i32** %486, align 8
  store i32 %467, i32* %487, align 4
  store i32 1, i32* %4, align 4
  br label %785

; <label>:488:                                    ; preds = %18
  %489 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %490 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %489, i32 0, i32 9
  %491 = load i16, i16* %490, align 2
  %492 = zext i16 %491 to i32
  %493 = sub nsw i32 %492, 1
  %494 = trunc i32 %493 to i16
  %495 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %496 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %495, i32 0, i32 0
  %497 = load i32, i32* %496, align 8
  %498 = icmp ule i32 %497, 40
  br i1 %498, label %499, label %506

; <label>:499:                                    ; preds = %488
  %pgocount38 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 39)
  %500 = add i64 %pgocount38, 1
  store i64 %500, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 39)
  %501 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %495, i32 0, i32 3
  %502 = load i8*, i8** %501, align 8
  %503 = getelementptr i8, i8* %502, i32 %497
  %504 = bitcast i8* %503 to i16**
  %505 = add i32 %497, 8
  store i32 %505, i32* %496, align 8
  br label %512

; <label>:506:                                    ; preds = %488
  %pgocount39 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 40)
  %507 = add i64 %pgocount39, 1
  store i64 %507, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 40)
  %508 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %495, i32 0, i32 2
  %509 = load i8*, i8** %508, align 8
  %510 = bitcast i8* %509 to i16**
  %511 = getelementptr i8, i8* %509, i32 8
  store i8* %511, i8** %508, align 8
  br label %512

; <label>:512:                                    ; preds = %506, %499
  %513 = phi i16** [ %504, %499 ], [ %510, %506 ]
  %514 = load i16*, i16** %513, align 8
  store i16 %494, i16* %514, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:515:                                    ; preds = %18
  %516 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %517 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %516, i32 0, i32 3
  %518 = load i32, i32* %517, align 8
  %519 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %520 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %519, i32 0, i32 0
  %521 = load i32, i32* %520, align 8
  %522 = icmp ule i32 %521, 40
  br i1 %522, label %523, label %530

; <label>:523:                                    ; preds = %515
  %pgocount40 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 41)
  %524 = add i64 %pgocount40, 1
  store i64 %524, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 41)
  %525 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %519, i32 0, i32 3
  %526 = load i8*, i8** %525, align 8
  %527 = getelementptr i8, i8* %526, i32 %521
  %528 = bitcast i8* %527 to i32**
  %529 = add i32 %521, 8
  store i32 %529, i32* %520, align 8
  br label %536

; <label>:530:                                    ; preds = %515
  %pgocount41 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 42)
  %531 = add i64 %pgocount41, 1
  store i64 %531, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 42)
  %532 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %519, i32 0, i32 2
  %533 = load i8*, i8** %532, align 8
  %534 = bitcast i8* %533 to i32**
  %535 = getelementptr i8, i8* %533, i32 8
  store i8* %535, i8** %532, align 8
  br label %536

; <label>:536:                                    ; preds = %530, %523
  %537 = phi i32** [ %528, %523 ], [ %534, %530 ]
  %538 = load i32*, i32** %537, align 8
  store i32 %518, i32* %538, align 4
  store i32 1, i32* %4, align 4
  br label %785

; <label>:539:                                    ; preds = %18
  %540 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %541 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %540, i32 0, i32 48
  %542 = load float*, float** %541, align 8
  %543 = icmp ne float* %542, null
  br i1 %543, label %562, label %544

; <label>:544:                                    ; preds = %539
  %pgocount42 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 54)
  %545 = add i64 %pgocount42, 1
  store i64 %545, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 54)
  %546 = call i8* @_TIFFmalloc(i32 12)
  %547 = bitcast i8* %546 to float*
  %548 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %549 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %548, i32 0, i32 48
  store float* %547, float** %549, align 8
  %550 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %551 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %550, i32 0, i32 48
  %552 = load float*, float** %551, align 8
  %553 = getelementptr inbounds float, float* %552, i64 0
  store float 0x3FD322D0E0000000, float* %553, align 4
  %554 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %555 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %554, i32 0, i32 48
  %556 = load float*, float** %555, align 8
  %557 = getelementptr inbounds float, float* %556, i64 1
  store float 0x3FE2C8B440000000, float* %557, align 4
  %558 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %559 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %558, i32 0, i32 48
  %560 = load float*, float** %559, align 8
  %561 = getelementptr inbounds float, float* %560, i64 2
  store float 0x3FBD2F1AA0000000, float* %561, align 4
  br label %562

; <label>:562:                                    ; preds = %544, %539
  %563 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %564 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %563, i32 0, i32 48
  %565 = load float*, float** %564, align 8
  %566 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %567 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %566, i32 0, i32 0
  %568 = load i32, i32* %567, align 8
  %569 = icmp ule i32 %568, 40
  br i1 %569, label %570, label %577

; <label>:570:                                    ; preds = %562
  %pgocount43 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 43)
  %571 = add i64 %pgocount43, 1
  store i64 %571, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 43)
  %572 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %566, i32 0, i32 3
  %573 = load i8*, i8** %572, align 8
  %574 = getelementptr i8, i8* %573, i32 %568
  %575 = bitcast i8* %574 to float***
  %576 = add i32 %568, 8
  store i32 %576, i32* %567, align 8
  br label %583

; <label>:577:                                    ; preds = %562
  %pgocount44 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 44)
  %578 = add i64 %pgocount44, 1
  store i64 %578, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 44)
  %579 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %566, i32 0, i32 2
  %580 = load i8*, i8** %579, align 8
  %581 = bitcast i8* %580 to float***
  %582 = getelementptr i8, i8* %580, i32 8
  store i8* %582, i8** %579, align 8
  br label %583

; <label>:583:                                    ; preds = %577, %570
  %584 = phi float*** [ %575, %570 ], [ %581, %577 ]
  %585 = load float**, float*** %584, align 8
  store float* %565, float** %585, align 8
  store i32 1, i32* %4, align 4
  br label %785

; <label>:586:                                    ; preds = %18
  %587 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %588 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %587, i32 0, i32 49
  %589 = getelementptr inbounds [2 x i16], [2 x i16]* %588, i64 0, i64 0
  %590 = load i16, i16* %589, align 8
  %591 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %592 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %591, i32 0, i32 0
  %593 = load i32, i32* %592, align 8
  %594 = icmp ule i32 %593, 40
  br i1 %594, label %595, label %601

; <label>:595:                                    ; preds = %586
  %596 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %591, i32 0, i32 3
  %597 = load i8*, i8** %596, align 8
  %598 = getelementptr i8, i8* %597, i32 %593
  %599 = bitcast i8* %598 to i16**
  %600 = add i32 %593, 8
  store i32 %600, i32* %592, align 8
  br label %607

; <label>:601:                                    ; preds = %586
  %pgocount45 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 45)
  %602 = add i64 %pgocount45, 1
  store i64 %602, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 45)
  %603 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %591, i32 0, i32 2
  %604 = load i8*, i8** %603, align 8
  %605 = bitcast i8* %604 to i16**
  %606 = getelementptr i8, i8* %604, i32 8
  store i8* %606, i8** %603, align 8
  br label %607

; <label>:607:                                    ; preds = %601, %595
  %608 = phi i16** [ %599, %595 ], [ %605, %601 ]
  %609 = load i16*, i16** %608, align 8
  store i16 %590, i16* %609, align 2
  %610 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %611 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %610, i32 0, i32 49
  %612 = getelementptr inbounds [2 x i16], [2 x i16]* %611, i64 0, i64 1
  %613 = load i16, i16* %612, align 2
  %614 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %615 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %614, i32 0, i32 0
  %616 = load i32, i32* %615, align 8
  %617 = icmp ule i32 %616, 40
  br i1 %617, label %618, label %625

; <label>:618:                                    ; preds = %607
  %pgocount46 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 46)
  %619 = add i64 %pgocount46, 1
  store i64 %619, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 46)
  %620 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %614, i32 0, i32 3
  %621 = load i8*, i8** %620, align 8
  %622 = getelementptr i8, i8* %621, i32 %616
  %623 = bitcast i8* %622 to i16**
  %624 = add i32 %616, 8
  store i32 %624, i32* %615, align 8
  br label %631

; <label>:625:                                    ; preds = %607
  %pgocount47 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 47)
  %626 = add i64 %pgocount47, 1
  store i64 %626, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 47)
  %627 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %614, i32 0, i32 2
  %628 = load i8*, i8** %627, align 8
  %629 = bitcast i8* %628 to i16**
  %630 = getelementptr i8, i8* %628, i32 8
  store i8* %630, i8** %627, align 8
  br label %631

; <label>:631:                                    ; preds = %625, %618
  %632 = phi i16** [ %623, %618 ], [ %629, %625 ]
  %633 = load i16*, i16** %632, align 8
  store i16 %613, i16* %633, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:634:                                    ; preds = %18
  %635 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %636 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %635, i32 0, i32 50
  %637 = load i16, i16* %636, align 4
  %638 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %639 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %638, i32 0, i32 0
  %640 = load i32, i32* %639, align 8
  %641 = icmp ule i32 %640, 40
  br i1 %641, label %642, label %649

; <label>:642:                                    ; preds = %634
  %pgocount48 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 48)
  %643 = add i64 %pgocount48, 1
  store i64 %643, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 48)
  %644 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %638, i32 0, i32 3
  %645 = load i8*, i8** %644, align 8
  %646 = getelementptr i8, i8* %645, i32 %640
  %647 = bitcast i8* %646 to i16**
  %648 = add i32 %640, 8
  store i32 %648, i32* %639, align 8
  br label %655

; <label>:649:                                    ; preds = %634
  %pgocount49 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 49)
  %650 = add i64 %pgocount49, 1
  store i64 %650, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 49)
  %651 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %638, i32 0, i32 2
  %652 = load i8*, i8** %651, align 8
  %653 = bitcast i8* %652 to i16**
  %654 = getelementptr i8, i8* %652, i32 8
  store i8* %654, i8** %651, align 8
  br label %655

; <label>:655:                                    ; preds = %649, %642
  %656 = phi i16** [ %647, %642 ], [ %653, %649 ]
  %657 = load i16*, i16** %656, align 8
  store i16 %637, i16* %657, align 2
  store i32 1, i32* %4, align 4
  br label %785

; <label>:658:                                    ; preds = %18
  %659 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %660 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %659, i32 0, i32 54
  %661 = getelementptr inbounds [3 x i16*], [3 x i16*]* %660, i64 0, i64 0
  %662 = load i16*, i16** %661, align 8
  %663 = icmp ne i16* %662, null
  br i1 %663, label %667, label %664

; <label>:664:                                    ; preds = %658
  %pgocount50 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 56)
  %665 = add i64 %pgocount50, 1
  store i64 %665, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 56)
  %666 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  call void @TIFFDefaultTransferFunction(%struct.TIFFDirectory* %666)
  br label %667

; <label>:667:                                    ; preds = %664, %658
  %668 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %669 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %668, i32 0, i32 54
  %670 = getelementptr inbounds [3 x i16*], [3 x i16*]* %669, i64 0, i64 0
  %671 = load i16*, i16** %670, align 8
  %672 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %673 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %672, i32 0, i32 0
  %674 = load i32, i32* %673, align 8
  %675 = icmp ule i32 %674, 40
  br i1 %675, label %676, label %683

; <label>:676:                                    ; preds = %667
  %pgocount51 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 52)
  %677 = add i64 %pgocount51, 1
  store i64 %677, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 52)
  %678 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %672, i32 0, i32 3
  %679 = load i8*, i8** %678, align 8
  %680 = getelementptr i8, i8* %679, i32 %674
  %681 = bitcast i8* %680 to i16***
  %682 = add i32 %674, 8
  store i32 %682, i32* %673, align 8
  br label %689

; <label>:683:                                    ; preds = %667
  %pgocount52 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 53)
  %684 = add i64 %pgocount52, 1
  store i64 %684, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 53)
  %685 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %672, i32 0, i32 2
  %686 = load i8*, i8** %685, align 8
  %687 = bitcast i8* %686 to i16***
  %688 = getelementptr i8, i8* %686, i32 8
  store i8* %688, i8** %685, align 8
  br label %689

; <label>:689:                                    ; preds = %683, %676
  %690 = phi i16*** [ %681, %676 ], [ %687, %683 ]
  %691 = load i16**, i16*** %690, align 8
  store i16* %671, i16** %691, align 8
  %692 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %693 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %692, i32 0, i32 15
  %694 = load i16, i16* %693, align 2
  %695 = zext i16 %694 to i32
  %696 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %697 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %696, i32 0, i32 30
  %698 = load i16, i16* %697, align 4
  %699 = zext i16 %698 to i32
  %700 = sub nsw i32 %695, %699
  %701 = icmp sgt i32 %700, 1
  br i1 %701, label %702, label %750

; <label>:702:                                    ; preds = %689
  %703 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %704 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %703, i32 0, i32 54
  %705 = getelementptr inbounds [3 x i16*], [3 x i16*]* %704, i64 0, i64 1
  %706 = load i16*, i16** %705, align 8
  %707 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %708 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %707, i32 0, i32 0
  %709 = load i32, i32* %708, align 8
  %710 = icmp ule i32 %709, 40
  br i1 %710, label %711, label %717

; <label>:711:                                    ; preds = %702
  %712 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %707, i32 0, i32 3
  %713 = load i8*, i8** %712, align 8
  %714 = getelementptr i8, i8* %713, i32 %709
  %715 = bitcast i8* %714 to i16***
  %716 = add i32 %709, 8
  store i32 %716, i32* %708, align 8
  br label %723

; <label>:717:                                    ; preds = %702
  %pgocount53 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 57)
  %718 = add i64 %pgocount53, 1
  store i64 %718, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 57)
  %719 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %707, i32 0, i32 2
  %720 = load i8*, i8** %719, align 8
  %721 = bitcast i8* %720 to i16***
  %722 = getelementptr i8, i8* %720, i32 8
  store i8* %722, i8** %719, align 8
  br label %723

; <label>:723:                                    ; preds = %717, %711
  %724 = phi i16*** [ %715, %711 ], [ %721, %717 ]
  %725 = load i16**, i16*** %724, align 8
  store i16* %706, i16** %725, align 8
  %726 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %727 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %726, i32 0, i32 54
  %728 = getelementptr inbounds [3 x i16*], [3 x i16*]* %727, i64 0, i64 2
  %729 = load i16*, i16** %728, align 8
  %730 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %731 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %730, i32 0, i32 0
  %732 = load i32, i32* %731, align 8
  %733 = icmp ule i32 %732, 40
  br i1 %733, label %734, label %741

; <label>:734:                                    ; preds = %723
  %pgocount54 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 58)
  %735 = add i64 %pgocount54, 1
  store i64 %735, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 58)
  %736 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %730, i32 0, i32 3
  %737 = load i8*, i8** %736, align 8
  %738 = getelementptr i8, i8* %737, i32 %732
  %739 = bitcast i8* %738 to i16***
  %740 = add i32 %732, 8
  store i32 %740, i32* %731, align 8
  br label %747

; <label>:741:                                    ; preds = %723
  %pgocount55 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 59)
  %742 = add i64 %pgocount55, 1
  store i64 %742, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 59)
  %743 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %730, i32 0, i32 2
  %744 = load i8*, i8** %743, align 8
  %745 = bitcast i8* %744 to i16***
  %746 = getelementptr i8, i8* %744, i32 8
  store i8* %746, i8** %743, align 8
  br label %747

; <label>:747:                                    ; preds = %741, %734
  %748 = phi i16*** [ %739, %734 ], [ %745, %741 ]
  %749 = load i16**, i16*** %748, align 8
  store i16* %729, i16** %749, align 8
  br label %750

; <label>:750:                                    ; preds = %747, %689
  store i32 1, i32* %4, align 4
  br label %785

; <label>:751:                                    ; preds = %18
  %752 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %753 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %752, i32 0, i32 53
  %754 = load float*, float** %753, align 8
  %755 = icmp ne float* %754, null
  br i1 %755, label %759, label %756

; <label>:756:                                    ; preds = %751
  %pgocount56 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 55)
  %757 = add i64 %pgocount56, 1
  store i64 %757, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 55)
  %758 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  call void @TIFFDefaultRefBlackWhite(%struct.TIFFDirectory* %758)
  br label %759

; <label>:759:                                    ; preds = %756, %751
  %760 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %761 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %760, i32 0, i32 53
  %762 = load float*, float** %761, align 8
  %763 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %764 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %763, i32 0, i32 0
  %765 = load i32, i32* %764, align 8
  %766 = icmp ule i32 %765, 40
  br i1 %766, label %767, label %774

; <label>:767:                                    ; preds = %759
  %pgocount57 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 50)
  %768 = add i64 %pgocount57, 1
  store i64 %768, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 50)
  %769 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %763, i32 0, i32 3
  %770 = load i8*, i8** %769, align 8
  %771 = getelementptr i8, i8* %770, i32 %765
  %772 = bitcast i8* %771 to float***
  %773 = add i32 %765, 8
  store i32 %773, i32* %764, align 8
  br label %780

; <label>:774:                                    ; preds = %759
  %pgocount58 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 51)
  %775 = add i64 %pgocount58, 1
  store i64 %775, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 51)
  %776 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %763, i32 0, i32 2
  %777 = load i8*, i8** %776, align 8
  %778 = bitcast i8* %777 to float***
  %779 = getelementptr i8, i8* %777, i32 8
  store i8* %779, i8** %776, align 8
  br label %780

; <label>:780:                                    ; preds = %774, %767
  %781 = phi float*** [ %772, %767 ], [ %778, %774 ]
  %782 = load float**, float*** %781, align 8
  store float* %762, float** %782, align 8
  store i32 1, i32* %4, align 4
  br label %785

; <label>:783:                                    ; preds = %18
  %pgocount59 = load i64, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 1)
  %784 = add i64 %pgocount59, 1
  store i64 %784, i64* getelementptr inbounds ([60 x i64], [60 x i64]* @__profc_TIFFVGetFieldDefaulted, i64 0, i64 1)
  store i32 0, i32* %4, align 4
  br label %785

; <label>:785:                                    ; preds = %783, %780, %750, %655, %631, %583, %536, %512, %485, %461, %422, %376, %352, %328, %281, %257, %233, %209, %185, %161, %137, %113, %89, %65, %41, %16
  %786 = load i32, i32* %4, align 4
  ret i32 %786
}

declare i32 @TIFFVGetField(%struct.tiff*, i32, %struct.__va_list_tag*) #1

declare i8* @_TIFFmalloc(i32) #1

; Function Attrs: nounwind uwtable
define internal void @TIFFDefaultTransferFunction(%struct.TIFFDirectory*) #0 {
  %2 = alloca %struct.TIFFDirectory*, align 8
  %3 = alloca i16**, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca double, align 8
  store %struct.TIFFDirectory* %0, %struct.TIFFDirectory** %2, align 8
  %7 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %2, align 8
  %8 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %7, i32 0, i32 54
  %9 = getelementptr inbounds [3 x i16*], [3 x i16*]* %8, i32 0, i32 0
  store i16** %9, i16*** %3, align 8
  %10 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %2, align 8
  %11 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %10, i32 0, i32 8
  %12 = load i16, i16* %11, align 4
  %13 = zext i16 %12 to i32
  %14 = shl i32 1, %13
  %15 = sext i32 %14 to i64
  store i64 %15, i64* %5, align 8
  %16 = load i64, i64* %5, align 8
  %17 = mul i64 %16, 2
  %18 = trunc i64 %17 to i32
  %19 = call i8* @_TIFFmalloc(i32 %18)
  %20 = bitcast i8* %19 to i16*
  %21 = load i16**, i16*** %3, align 8
  %22 = getelementptr inbounds i16*, i16** %21, i64 0
  store i16* %20, i16** %22, align 8
  %23 = load i16**, i16*** %3, align 8
  %24 = getelementptr inbounds i16*, i16** %23, i64 0
  %25 = load i16*, i16** %24, align 8
  %26 = getelementptr inbounds i16, i16* %25, i64 0
  store i16 0, i16* %26, align 2
  store i64 1, i64* %4, align 8
  br label %27

; <label>:27:                                     ; preds = %49, %1
  %28 = load i64, i64* %4, align 8
  %29 = load i64, i64* %5, align 8
  %30 = icmp slt i64 %28, %29
  br i1 %30, label %31, label %53

; <label>:31:                                     ; preds = %27
  %32 = load i64, i64* %4, align 8
  %33 = sitofp i64 %32 to double
  %34 = load i64, i64* %5, align 8
  %35 = sitofp i64 %34 to double
  %36 = fsub double %35, 1.000000e+00
  %37 = fdiv double %33, %36
  store double %37, double* %6, align 8
  %38 = load double, double* %6, align 8
  %39 = call double @pow(double %38, double 2.200000e+00) #2
  %40 = fmul double 6.553500e+04, %39
  %41 = fadd double %40, 5.000000e-01
  %42 = call double @floor(double %41) #5
  %43 = fptoui double %42 to i16
  %44 = load i16**, i16*** %3, align 8
  %45 = getelementptr inbounds i16*, i16** %44, i64 0
  %46 = load i16*, i16** %45, align 8
  %47 = load i64, i64* %4, align 8
  %48 = getelementptr inbounds i16, i16* %46, i64 %47
  store i16 %43, i16* %48, align 2
  br label %49

; <label>:49:                                     ; preds = %31
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFDefaultTransferFunction, i64 0, i64 0)
  %50 = add i64 %pgocount, 1
  store i64 %50, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFDefaultTransferFunction, i64 0, i64 0)
  %51 = load i64, i64* %4, align 8
  %52 = add nsw i64 %51, 1
  store i64 %52, i64* %4, align 8
  br label %27

; <label>:53:                                     ; preds = %27
  %54 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %2, align 8
  %55 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %54, i32 0, i32 15
  %56 = load i16, i16* %55, align 2
  %57 = zext i16 %56 to i32
  %58 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %2, align 8
  %59 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %58, i32 0, i32 30
  %60 = load i16, i16* %59, align 4
  %61 = zext i16 %60 to i32
  %62 = sub nsw i32 %57, %61
  %63 = icmp sgt i32 %62, 1
  br i1 %63, label %64, label %102

; <label>:64:                                     ; preds = %53
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFDefaultTransferFunction, i64 0, i64 2)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFDefaultTransferFunction, i64 0, i64 2)
  %66 = load i64, i64* %5, align 8
  %67 = mul i64 %66, 2
  %68 = trunc i64 %67 to i32
  %69 = call i8* @_TIFFmalloc(i32 %68)
  %70 = bitcast i8* %69 to i16*
  %71 = load i16**, i16*** %3, align 8
  %72 = getelementptr inbounds i16*, i16** %71, i64 1
  store i16* %70, i16** %72, align 8
  %73 = load i16**, i16*** %3, align 8
  %74 = getelementptr inbounds i16*, i16** %73, i64 1
  %75 = load i16*, i16** %74, align 8
  %76 = bitcast i16* %75 to i8*
  %77 = load i16**, i16*** %3, align 8
  %78 = getelementptr inbounds i16*, i16** %77, i64 0
  %79 = load i16*, i16** %78, align 8
  %80 = bitcast i16* %79 to i8*
  %81 = load i64, i64* %5, align 8
  %82 = mul i64 %81, 2
  %83 = trunc i64 %82 to i32
  call void @_TIFFmemcpy(i8* %76, i8* %80, i32 %83)
  %84 = load i64, i64* %5, align 8
  %85 = mul i64 %84, 2
  %86 = trunc i64 %85 to i32
  %87 = call i8* @_TIFFmalloc(i32 %86)
  %88 = bitcast i8* %87 to i16*
  %89 = load i16**, i16*** %3, align 8
  %90 = getelementptr inbounds i16*, i16** %89, i64 2
  store i16* %88, i16** %90, align 8
  %91 = load i16**, i16*** %3, align 8
  %92 = getelementptr inbounds i16*, i16** %91, i64 2
  %93 = load i16*, i16** %92, align 8
  %94 = bitcast i16* %93 to i8*
  %95 = load i16**, i16*** %3, align 8
  %96 = getelementptr inbounds i16*, i16** %95, i64 0
  %97 = load i16*, i16** %96, align 8
  %98 = bitcast i16* %97 to i8*
  %99 = load i64, i64* %5, align 8
  %100 = mul i64 %99, 2
  %101 = trunc i64 %100 to i32
  call void @_TIFFmemcpy(i8* %94, i8* %98, i32 %101)
  br label %102

; <label>:102:                                    ; preds = %64, %53
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFDefaultTransferFunction, i64 0, i64 1)
  %103 = add i64 %pgocount2, 1
  store i64 %103, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFDefaultTransferFunction, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @TIFFDefaultRefBlackWhite(%struct.TIFFDirectory*) #0 {
  %2 = alloca %struct.TIFFDirectory*, align 8
  %3 = alloca i32, align 4
  store %struct.TIFFDirectory* %0, %struct.TIFFDirectory** %2, align 8
  %4 = call i8* @_TIFFmalloc(i32 24)
  %5 = bitcast i8* %4 to float*
  %6 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %2, align 8
  %7 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %6, i32 0, i32 53
  store float* %5, float** %7, align 8
  store i32 0, i32* %3, align 4
  br label %8

; <label>:8:                                      ; preds = %36, %1
  %9 = load i32, i32* %3, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %40

; <label>:11:                                     ; preds = %8
  %12 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %2, align 8
  %13 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %12, i32 0, i32 53
  %14 = load float*, float** %13, align 8
  %15 = load i32, i32* %3, align 4
  %16 = mul nsw i32 2, %15
  %17 = add nsw i32 %16, 0
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float* %14, i64 %18
  store float 0.000000e+00, float* %19, align 4
  %20 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %2, align 8
  %21 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %20, i32 0, i32 8
  %22 = load i16, i16* %21, align 4
  %23 = zext i16 %22 to i32
  %24 = zext i32 %23 to i64
  %25 = shl i64 1, %24
  %26 = sub nsw i64 %25, 1
  %27 = sitofp i64 %26 to float
  %28 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %2, align 8
  %29 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %28, i32 0, i32 53
  %30 = load float*, float** %29, align 8
  %31 = load i32, i32* %3, align 4
  %32 = mul nsw i32 2, %31
  %33 = add nsw i32 %32, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float* %30, i64 %34
  store float %27, float* %35, align 4
  br label %36

; <label>:36:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFDefaultRefBlackWhite, i64 0, i64 0)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFDefaultRefBlackWhite, i64 0, i64 0)
  %38 = load i32, i32* %3, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %3, align 4
  br label %8

; <label>:40:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFDefaultRefBlackWhite, i64 0, i64 1)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFDefaultRefBlackWhite, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @TIFFGetFieldDefaulted(%struct.tiff*, i32, ...) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetFieldDefaulted, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetFieldDefaulted, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [1 x %struct.__va_list_tag], align 16
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %9 = bitcast %struct.__va_list_tag* %8 to i8*
  call void @llvm.va_start(i8* %9)
  %10 = load %struct.tiff*, %struct.tiff** %4, align 8
  %11 = load i32, i32* %5, align 4
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %13 = call i32 @TIFFVGetFieldDefaulted(%struct.tiff* %10, i32 %11, %struct.__va_list_tag* %12)
  store i32 %13, i32* %6, align 4
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %15 = bitcast %struct.__va_list_tag* %14 to i8*
  call void @llvm.va_end(i8* %15)
  %16 = load i32, i32* %6, align 4
  ret i32 %16
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: nounwind readnone
declare double @floor(double) #3

; Function Attrs: nounwind
declare double @pow(double, double) #4

declare void @_TIFFmemcpy(i8*, i8*, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
