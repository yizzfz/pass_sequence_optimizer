; ModuleID = 'saynum.2.ll'
source_filename = "saynum.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.darray_t = type { i8*, i32, i32, i16, i16 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [63 x i8] c"$Id: saynum.c,v 1.13 1994/11/08 13:30:50 a904209 Exp a904209 $\00", align 1
@saynum_id = global i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str, i32 0, i32 0), align 8
@.str.1 = private unnamed_addr constant [6 x i8] c"minus\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"a lot\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"billion\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"million\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"thousand\00", align 1
@Cardinals = internal global [20 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.31, i32 0, i32 0)], align 16
@.str.7 = private unnamed_addr constant [8 x i8] c"hundred\00", align 1
@Twenties = internal global [8 x i8*] [i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.39, i32 0, i32 0)], align 16
@.str.8 = private unnamed_addr constant [10 x i8] c"billionth\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"millionth\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c"thousandth\00", align 1
@.str.11 = private unnamed_addr constant [10 x i8] c"hundredth\00", align 1
@Ord_twenties = internal global [8 x i8*] [i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.44, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.45, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.46, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.47, i32 0, i32 0)], align 16
@Ordinals = internal global [20 x i8*] [i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.49, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.50, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.51, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.52, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.53, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.54, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.55, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.56, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.57, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.58, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.59, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.60, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.63, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.64, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.65, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.66, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.67, i32 0, i32 0)], align 16
@.str.12 = private unnamed_addr constant [5 x i8] c"zero\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"one\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"two\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"three\00", align 1
@.str.16 = private unnamed_addr constant [5 x i8] c"four\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"five\00", align 1
@.str.18 = private unnamed_addr constant [4 x i8] c"six\00", align 1
@.str.19 = private unnamed_addr constant [6 x i8] c"seven\00", align 1
@.str.20 = private unnamed_addr constant [6 x i8] c"eight\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"nine\00", align 1
@.str.22 = private unnamed_addr constant [4 x i8] c"ten\00", align 1
@.str.23 = private unnamed_addr constant [7 x i8] c"eleven\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"twelve\00", align 1
@.str.25 = private unnamed_addr constant [9 x i8] c"thirteen\00", align 1
@.str.26 = private unnamed_addr constant [9 x i8] c"fourteen\00", align 1
@.str.27 = private unnamed_addr constant [8 x i8] c"fifteen\00", align 1
@.str.28 = private unnamed_addr constant [8 x i8] c"sixteen\00", align 1
@.str.29 = private unnamed_addr constant [10 x i8] c"seventeen\00", align 1
@.str.30 = private unnamed_addr constant [9 x i8] c"eighteen\00", align 1
@.str.31 = private unnamed_addr constant [9 x i8] c"nineteen\00", align 1
@.str.32 = private unnamed_addr constant [7 x i8] c"twenty\00", align 1
@.str.33 = private unnamed_addr constant [7 x i8] c"thirty\00", align 1
@.str.34 = private unnamed_addr constant [6 x i8] c"forty\00", align 1
@.str.35 = private unnamed_addr constant [6 x i8] c"fifty\00", align 1
@.str.36 = private unnamed_addr constant [6 x i8] c"sixty\00", align 1
@.str.37 = private unnamed_addr constant [8 x i8] c"seventy\00", align 1
@.str.38 = private unnamed_addr constant [7 x i8] c"eighty\00", align 1
@.str.39 = private unnamed_addr constant [7 x i8] c"ninety\00", align 1
@.str.40 = private unnamed_addr constant [10 x i8] c"twentieth\00", align 1
@.str.41 = private unnamed_addr constant [10 x i8] c"thirtieth\00", align 1
@.str.42 = private unnamed_addr constant [9 x i8] c"fortieth\00", align 1
@.str.43 = private unnamed_addr constant [9 x i8] c"fiftieth\00", align 1
@.str.44 = private unnamed_addr constant [9 x i8] c"sixtieth\00", align 1
@.str.45 = private unnamed_addr constant [11 x i8] c"seventieth\00", align 1
@.str.46 = private unnamed_addr constant [10 x i8] c"eightieth\00", align 1
@.str.47 = private unnamed_addr constant [10 x i8] c"ninetieth\00", align 1
@.str.48 = private unnamed_addr constant [7 x i8] c"zeroth\00", align 1
@.str.49 = private unnamed_addr constant [6 x i8] c"first\00", align 1
@.str.50 = private unnamed_addr constant [7 x i8] c"second\00", align 1
@.str.51 = private unnamed_addr constant [6 x i8] c"third\00", align 1
@.str.52 = private unnamed_addr constant [7 x i8] c"fourth\00", align 1
@.str.53 = private unnamed_addr constant [6 x i8] c"fifth\00", align 1
@.str.54 = private unnamed_addr constant [6 x i8] c"sixth\00", align 1
@.str.55 = private unnamed_addr constant [8 x i8] c"seventh\00", align 1
@.str.56 = private unnamed_addr constant [7 x i8] c"eighth\00", align 1
@.str.57 = private unnamed_addr constant [6 x i8] c"ninth\00", align 1
@.str.58 = private unnamed_addr constant [6 x i8] c"tenth\00", align 1
@.str.59 = private unnamed_addr constant [9 x i8] c"eleventh\00", align 1
@.str.60 = private unnamed_addr constant [8 x i8] c"twelfth\00", align 1
@.str.61 = private unnamed_addr constant [11 x i8] c"thirteenth\00", align 1
@.str.62 = private unnamed_addr constant [11 x i8] c"fourteenth\00", align 1
@.str.63 = private unnamed_addr constant [10 x i8] c"fifteenth\00", align 1
@.str.64 = private unnamed_addr constant [10 x i8] c"sixteenth\00", align 1
@.str.65 = private unnamed_addr constant [12 x i8] c"seventeenth\00", align 1
@.str.66 = private unnamed_addr constant [11 x i8] c"eighteenth\00", align 1
@.str.67 = private unnamed_addr constant [11 x i8] c"nineteenth\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_xlate_cardinal = private constant [14 x i8] c"xlate_cardinal"
@__profn_xlate_ordinal = private constant [13 x i8] c"xlate_ordinal"
@__profc_xlate_cardinal = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_xlate_cardinal = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -920617212276582318, i64 224282260714, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i32 0, i32 0), i8* bitcast (i32 (i64, %struct.darray_t*)* @xlate_cardinal to i8*), i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_xlate_ordinal = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_xlate_ordinal = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6157989399444672716, i64 224282260714, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i32 0, i32 0), i8* bitcast (i32 (i64, %struct.darray_t*)* @xlate_ordinal to i8*), i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [30 x i8] c"\1C\1Cx\DA\AB\C8I,I\8DON,J\C9\CCK\CCa\AC\00s\F3!<\00\A1\E1\0B#", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_xlate_cardinal to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_xlate_ordinal to i8*), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @xlate_cardinal(i64, %struct.darray_t*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca %struct.darray_t*, align 8
  %6 = alloca i32, align 4
  store i64 %0, i64* %4, align 8
  store %struct.darray_t* %1, %struct.darray_t** %5, align 8
  store i32 0, i32* %6, align 4
  %7 = load i64, i64* %4, align 8
  %8 = icmp slt i64 %7, 0
  br i1 %8, label %9, label %27

; <label>:9:                                      ; preds = %2
  %10 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %11 = call i32 @xlate_string(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), %struct.darray_t* %10)
  %12 = load i32, i32* %6, align 4
  %13 = add i32 %12, %11
  store i32 %13, i32* %6, align 4
  %14 = load i64, i64* %4, align 8
  %15 = sub nsw i64 0, %14
  store i64 %15, i64* %4, align 8
  %16 = load i64, i64* %4, align 8
  %17 = icmp slt i64 %16, 0
  br i1 %17, label %18, label %25

; <label>:18:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 8)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 8)
  %20 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %21 = call i32 @xlate_string(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), %struct.darray_t* %20)
  %22 = load i32, i32* %6, align 4
  %23 = add i32 %22, %21
  store i32 %23, i32* %6, align 4
  %24 = load i32, i32* %6, align 4
  store i32 %24, i32* %3, align 4
  br label %188

; <label>:25:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 4)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 4)
  br label %27

; <label>:27:                                     ; preds = %25, %2
  %28 = load i64, i64* %4, align 8
  %29 = icmp sge i64 %28, 1000000000
  br i1 %29, label %30, label %59

; <label>:30:                                     ; preds = %27
  %31 = load i64, i64* %4, align 8
  %32 = sdiv i64 %31, 1000000000
  %33 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %34 = call i32 @xlate_cardinal(i64 %32, %struct.darray_t* %33)
  %35 = load i32, i32* %6, align 4
  %36 = add i32 %35, %34
  store i32 %36, i32* %6, align 4
  %37 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %38 = call i32 @xlate_string(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), %struct.darray_t* %37)
  %39 = load i32, i32* %6, align 4
  %40 = add i32 %39, %38
  store i32 %40, i32* %6, align 4
  %41 = load i64, i64* %4, align 8
  %42 = srem i64 %41, 1000000000
  store i64 %42, i64* %4, align 8
  %43 = load i64, i64* %4, align 8
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %45, label %48

; <label>:45:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 7)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 7)
  %47 = load i32, i32* %6, align 4
  store i32 %47, i32* %3, align 4
  br label %188

; <label>:48:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 3)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 3)
  %50 = load i64, i64* %4, align 8
  %51 = icmp slt i64 %50, 100
  br i1 %51, label %52, label %58

; <label>:52:                                     ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 9)
  %53 = add i64 %pgocount4, 1
  store i64 %53, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 9)
  %54 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %55 = call i32 @xlate_string(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), %struct.darray_t* %54)
  %56 = load i32, i32* %6, align 4
  %57 = add i32 %56, %55
  store i32 %57, i32* %6, align 4
  br label %58

; <label>:58:                                     ; preds = %52, %48
  br label %59

; <label>:59:                                     ; preds = %58, %27
  %60 = load i64, i64* %4, align 8
  %61 = icmp sge i64 %60, 1000000
  br i1 %61, label %62, label %91

; <label>:62:                                     ; preds = %59
  %63 = load i64, i64* %4, align 8
  %64 = sdiv i64 %63, 1000000
  %65 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %66 = call i32 @xlate_cardinal(i64 %64, %struct.darray_t* %65)
  %67 = load i32, i32* %6, align 4
  %68 = add i32 %67, %66
  store i32 %68, i32* %6, align 4
  %69 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %70 = call i32 @xlate_string(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), %struct.darray_t* %69)
  %71 = load i32, i32* %6, align 4
  %72 = add i32 %71, %70
  store i32 %72, i32* %6, align 4
  %73 = load i64, i64* %4, align 8
  %74 = srem i64 %73, 1000000
  store i64 %74, i64* %4, align 8
  %75 = load i64, i64* %4, align 8
  %76 = icmp eq i64 %75, 0
  br i1 %76, label %77, label %80

; <label>:77:                                     ; preds = %62
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 11)
  %78 = add i64 %pgocount5, 1
  store i64 %78, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 11)
  %79 = load i32, i32* %6, align 4
  store i32 %79, i32* %3, align 4
  br label %188

; <label>:80:                                     ; preds = %62
  %81 = load i64, i64* %4, align 8
  %82 = icmp slt i64 %81, 100
  br i1 %82, label %83, label %89

; <label>:83:                                     ; preds = %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 13)
  %84 = add i64 %pgocount6, 1
  store i64 %84, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 13)
  %85 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %86 = call i32 @xlate_string(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), %struct.darray_t* %85)
  %87 = load i32, i32* %6, align 4
  %88 = add i32 %87, %86
  store i32 %88, i32* %6, align 4
  br label %89

; <label>:89:                                     ; preds = %83, %80
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 5)
  %90 = add i64 %pgocount7, 1
  store i64 %90, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 5)
  br label %91

; <label>:91:                                     ; preds = %89, %59
  %92 = load i64, i64* %4, align 8
  %93 = icmp sge i64 %92, 1000
  br i1 %93, label %94, label %99

; <label>:94:                                     ; preds = %91
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 1)
  %95 = add i64 %pgocount8, 1
  store i64 %95, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 1)
  %96 = load i64, i64* %4, align 8
  %97 = icmp sle i64 %96, 1099
  br i1 %97, label %102, label %._crit_edge

._crit_edge:                                      ; preds = %94
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 0)
  %98 = add i64 %pgocount9, 1
  store i64 %98, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 0)
  br label %99

; <label>:99:                                     ; preds = %._crit_edge, %91
  %100 = load i64, i64* %4, align 8
  %101 = icmp sge i64 %100, 2000
  br i1 %101, label %102, label %131

; <label>:102:                                    ; preds = %99, %94
  %103 = load i64, i64* %4, align 8
  %104 = sdiv i64 %103, 1000
  %105 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %106 = call i32 @xlate_cardinal(i64 %104, %struct.darray_t* %105)
  %107 = load i32, i32* %6, align 4
  %108 = add i32 %107, %106
  store i32 %108, i32* %6, align 4
  %109 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %110 = call i32 @xlate_string(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i32 0, i32 0), %struct.darray_t* %109)
  %111 = load i32, i32* %6, align 4
  %112 = add i32 %111, %110
  store i32 %112, i32* %6, align 4
  %113 = load i64, i64* %4, align 8
  %114 = srem i64 %113, 1000
  store i64 %114, i64* %4, align 8
  %115 = load i64, i64* %4, align 8
  %116 = icmp eq i64 %115, 0
  br i1 %116, label %117, label %120

; <label>:117:                                    ; preds = %102
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 12)
  %118 = add i64 %pgocount10, 1
  store i64 %118, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 12)
  %119 = load i32, i32* %6, align 4
  store i32 %119, i32* %3, align 4
  br label %188

; <label>:120:                                    ; preds = %102
  %121 = load i64, i64* %4, align 8
  %122 = icmp slt i64 %121, 100
  br i1 %122, label %123, label %129

; <label>:123:                                    ; preds = %120
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 14)
  %124 = add i64 %pgocount11, 1
  store i64 %124, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 14)
  %125 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %126 = call i32 @xlate_string(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), %struct.darray_t* %125)
  %127 = load i32, i32* %6, align 4
  %128 = add i32 %127, %126
  store i32 %128, i32* %6, align 4
  br label %129

; <label>:129:                                    ; preds = %123, %120
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 6)
  %130 = add i64 %pgocount12, 1
  store i64 %130, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 6)
  br label %131

; <label>:131:                                    ; preds = %129, %99
  %132 = load i64, i64* %4, align 8
  %133 = icmp sge i64 %132, 100
  br i1 %133, label %134, label %156

; <label>:134:                                    ; preds = %131
  %135 = load i64, i64* %4, align 8
  %136 = sdiv i64 %135, 100
  %137 = getelementptr inbounds [20 x i8*], [20 x i8*]* @Cardinals, i64 0, i64 %136
  %138 = load i8*, i8** %137, align 8
  %139 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %140 = call i32 @xlate_string(i8* %138, %struct.darray_t* %139)
  %141 = load i32, i32* %6, align 4
  %142 = add i32 %141, %140
  store i32 %142, i32* %6, align 4
  %143 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %144 = call i32 @xlate_string(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i32 0, i32 0), %struct.darray_t* %143)
  %145 = load i32, i32* %6, align 4
  %146 = add i32 %145, %144
  store i32 %146, i32* %6, align 4
  %147 = load i64, i64* %4, align 8
  %148 = srem i64 %147, 100
  store i64 %148, i64* %4, align 8
  %149 = load i64, i64* %4, align 8
  %150 = icmp eq i64 %149, 0
  br i1 %150, label %151, label %154

; <label>:151:                                    ; preds = %134
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 16)
  %152 = add i64 %pgocount13, 1
  store i64 %152, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 16)
  %153 = load i32, i32* %6, align 4
  store i32 %153, i32* %3, align 4
  br label %188

; <label>:154:                                    ; preds = %134
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 10)
  %155 = add i64 %pgocount14, 1
  store i64 %155, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 10)
  br label %156

; <label>:156:                                    ; preds = %154, %131
  %157 = load i64, i64* %4, align 8
  %158 = icmp sge i64 %157, 20
  br i1 %158, label %159, label %178

; <label>:159:                                    ; preds = %156
  %160 = load i64, i64* %4, align 8
  %161 = sub nsw i64 %160, 20
  %162 = sdiv i64 %161, 10
  %163 = getelementptr inbounds [8 x i8*], [8 x i8*]* @Twenties, i64 0, i64 %162
  %164 = load i8*, i8** %163, align 8
  %165 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %166 = call i32 @xlate_string(i8* %164, %struct.darray_t* %165)
  %167 = load i32, i32* %6, align 4
  %168 = add i32 %167, %166
  store i32 %168, i32* %6, align 4
  %169 = load i64, i64* %4, align 8
  %170 = srem i64 %169, 10
  store i64 %170, i64* %4, align 8
  %171 = load i64, i64* %4, align 8
  %172 = icmp eq i64 %171, 0
  br i1 %172, label %173, label %176

; <label>:173:                                    ; preds = %159
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 17)
  %174 = add i64 %pgocount15, 1
  store i64 %174, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 17)
  %175 = load i32, i32* %6, align 4
  store i32 %175, i32* %3, align 4
  br label %188

; <label>:176:                                    ; preds = %159
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 15)
  %177 = add i64 %pgocount16, 1
  store i64 %177, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 15)
  br label %178

; <label>:178:                                    ; preds = %176, %156
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 2)
  %179 = add i64 %pgocount17, 1
  store i64 %179, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_cardinal, i64 0, i64 2)
  %180 = load i64, i64* %4, align 8
  %181 = getelementptr inbounds [20 x i8*], [20 x i8*]* @Cardinals, i64 0, i64 %180
  %182 = load i8*, i8** %181, align 8
  %183 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %184 = call i32 @xlate_string(i8* %182, %struct.darray_t* %183)
  %185 = load i32, i32* %6, align 4
  %186 = add i32 %185, %184
  store i32 %186, i32* %6, align 4
  %187 = load i32, i32* %6, align 4
  store i32 %187, i32* %3, align 4
  br label %188

; <label>:188:                                    ; preds = %178, %173, %151, %117, %77, %45, %18
  %189 = load i32, i32* %3, align 4
  ret i32 %189
}

declare i32 @xlate_string(i8*, %struct.darray_t*) #1

; Function Attrs: nounwind uwtable
define i32 @xlate_ordinal(i64, %struct.darray_t*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca %struct.darray_t*, align 8
  %6 = alloca i32, align 4
  store i64 %0, i64* %4, align 8
  store %struct.darray_t* %1, %struct.darray_t** %5, align 8
  store i32 0, i32* %6, align 4
  %7 = load i64, i64* %4, align 8
  %8 = icmp slt i64 %7, 0
  br i1 %8, label %9, label %27

; <label>:9:                                      ; preds = %2
  %10 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %11 = call i32 @xlate_string(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), %struct.darray_t* %10)
  %12 = load i32, i32* %6, align 4
  %13 = add i32 %12, %11
  store i32 %13, i32* %6, align 4
  %14 = load i64, i64* %4, align 8
  %15 = sub nsw i64 0, %14
  store i64 %15, i64* %4, align 8
  %16 = load i64, i64* %4, align 8
  %17 = icmp slt i64 %16, 0
  br i1 %17, label %18, label %25

; <label>:18:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 8)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 8)
  %20 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %21 = call i32 @xlate_string(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), %struct.darray_t* %20)
  %22 = load i32, i32* %6, align 4
  %23 = add i32 %22, %21
  store i32 %23, i32* %6, align 4
  %24 = load i32, i32* %6, align 4
  store i32 %24, i32* %3, align 4
  br label %214

; <label>:25:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 4)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 4)
  br label %27

; <label>:27:                                     ; preds = %25, %2
  %28 = load i64, i64* %4, align 8
  %29 = icmp sge i64 %28, 1000000000
  br i1 %29, label %30, label %63

; <label>:30:                                     ; preds = %27
  %31 = load i64, i64* %4, align 8
  %32 = sdiv i64 %31, 1000000000
  %33 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %34 = call i32 @xlate_cardinal(i64 %32, %struct.darray_t* %33)
  %35 = load i32, i32* %6, align 4
  %36 = add i32 %35, %34
  store i32 %36, i32* %6, align 4
  %37 = load i64, i64* %4, align 8
  %38 = srem i64 %37, 1000000000
  store i64 %38, i64* %4, align 8
  %39 = load i64, i64* %4, align 8
  %40 = icmp eq i64 %39, 0
  br i1 %40, label %41, label %48

; <label>:41:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 7)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 7)
  %43 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %44 = call i32 @xlate_string(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0), %struct.darray_t* %43)
  %45 = load i32, i32* %6, align 4
  %46 = add i32 %45, %44
  store i32 %46, i32* %6, align 4
  %47 = load i32, i32* %6, align 4
  store i32 %47, i32* %3, align 4
  br label %214

; <label>:48:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 3)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 3)
  %50 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %51 = call i32 @xlate_string(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), %struct.darray_t* %50)
  %52 = load i32, i32* %6, align 4
  %53 = add i32 %52, %51
  store i32 %53, i32* %6, align 4
  %54 = load i64, i64* %4, align 8
  %55 = icmp slt i64 %54, 100
  br i1 %55, label %56, label %62

; <label>:56:                                     ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 9)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 9)
  %58 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %59 = call i32 @xlate_string(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), %struct.darray_t* %58)
  %60 = load i32, i32* %6, align 4
  %61 = add i32 %60, %59
  store i32 %61, i32* %6, align 4
  br label %62

; <label>:62:                                     ; preds = %56, %48
  br label %63

; <label>:63:                                     ; preds = %62, %27
  %64 = load i64, i64* %4, align 8
  %65 = icmp sge i64 %64, 1000000
  br i1 %65, label %66, label %99

; <label>:66:                                     ; preds = %63
  %67 = load i64, i64* %4, align 8
  %68 = sdiv i64 %67, 1000000
  %69 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %70 = call i32 @xlate_cardinal(i64 %68, %struct.darray_t* %69)
  %71 = load i32, i32* %6, align 4
  %72 = add i32 %71, %70
  store i32 %72, i32* %6, align 4
  %73 = load i64, i64* %4, align 8
  %74 = srem i64 %73, 1000000
  store i64 %74, i64* %4, align 8
  %75 = load i64, i64* %4, align 8
  %76 = icmp eq i64 %75, 0
  br i1 %76, label %77, label %84

; <label>:77:                                     ; preds = %66
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 11)
  %78 = add i64 %pgocount5, 1
  store i64 %78, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 11)
  %79 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %80 = call i32 @xlate_string(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i32 0, i32 0), %struct.darray_t* %79)
  %81 = load i32, i32* %6, align 4
  %82 = add i32 %81, %80
  store i32 %82, i32* %6, align 4
  %83 = load i32, i32* %6, align 4
  store i32 %83, i32* %3, align 4
  br label %214

; <label>:84:                                     ; preds = %66
  %85 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %86 = call i32 @xlate_string(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), %struct.darray_t* %85)
  %87 = load i32, i32* %6, align 4
  %88 = add i32 %87, %86
  store i32 %88, i32* %6, align 4
  %89 = load i64, i64* %4, align 8
  %90 = icmp slt i64 %89, 100
  br i1 %90, label %91, label %97

; <label>:91:                                     ; preds = %84
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 13)
  %92 = add i64 %pgocount6, 1
  store i64 %92, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 13)
  %93 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %94 = call i32 @xlate_string(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), %struct.darray_t* %93)
  %95 = load i32, i32* %6, align 4
  %96 = add i32 %95, %94
  store i32 %96, i32* %6, align 4
  br label %97

; <label>:97:                                     ; preds = %91, %84
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 5)
  %98 = add i64 %pgocount7, 1
  store i64 %98, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 5)
  br label %99

; <label>:99:                                     ; preds = %97, %63
  %100 = load i64, i64* %4, align 8
  %101 = icmp sge i64 %100, 1000
  br i1 %101, label %102, label %107

; <label>:102:                                    ; preds = %99
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 1)
  %103 = add i64 %pgocount8, 1
  store i64 %103, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 1)
  %104 = load i64, i64* %4, align 8
  %105 = icmp sle i64 %104, 1099
  br i1 %105, label %110, label %._crit_edge

._crit_edge:                                      ; preds = %102
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 0)
  %106 = add i64 %pgocount9, 1
  store i64 %106, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 0)
  br label %107

; <label>:107:                                    ; preds = %._crit_edge, %99
  %108 = load i64, i64* %4, align 8
  %109 = icmp sge i64 %108, 2000
  br i1 %109, label %110, label %143

; <label>:110:                                    ; preds = %107, %102
  %111 = load i64, i64* %4, align 8
  %112 = sdiv i64 %111, 1000
  %113 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %114 = call i32 @xlate_cardinal(i64 %112, %struct.darray_t* %113)
  %115 = load i32, i32* %6, align 4
  %116 = add i32 %115, %114
  store i32 %116, i32* %6, align 4
  %117 = load i64, i64* %4, align 8
  %118 = srem i64 %117, 1000
  store i64 %118, i64* %4, align 8
  %119 = load i64, i64* %4, align 8
  %120 = icmp eq i64 %119, 0
  br i1 %120, label %121, label %128

; <label>:121:                                    ; preds = %110
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 12)
  %122 = add i64 %pgocount10, 1
  store i64 %122, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 12)
  %123 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %124 = call i32 @xlate_string(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), %struct.darray_t* %123)
  %125 = load i32, i32* %6, align 4
  %126 = add i32 %125, %124
  store i32 %126, i32* %6, align 4
  %127 = load i32, i32* %6, align 4
  store i32 %127, i32* %3, align 4
  br label %214

; <label>:128:                                    ; preds = %110
  %129 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %130 = call i32 @xlate_string(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i32 0, i32 0), %struct.darray_t* %129)
  %131 = load i32, i32* %6, align 4
  %132 = add i32 %131, %130
  store i32 %132, i32* %6, align 4
  %133 = load i64, i64* %4, align 8
  %134 = icmp slt i64 %133, 100
  br i1 %134, label %135, label %141

; <label>:135:                                    ; preds = %128
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 14)
  %136 = add i64 %pgocount11, 1
  store i64 %136, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 14)
  %137 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %138 = call i32 @xlate_string(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), %struct.darray_t* %137)
  %139 = load i32, i32* %6, align 4
  %140 = add i32 %139, %138
  store i32 %140, i32* %6, align 4
  br label %141

; <label>:141:                                    ; preds = %135, %128
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 6)
  %142 = add i64 %pgocount12, 1
  store i64 %142, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 6)
  br label %143

; <label>:143:                                    ; preds = %141, %107
  %144 = load i64, i64* %4, align 8
  %145 = icmp sge i64 %144, 100
  br i1 %145, label %146, label %172

; <label>:146:                                    ; preds = %143
  %147 = load i64, i64* %4, align 8
  %148 = sdiv i64 %147, 100
  %149 = getelementptr inbounds [20 x i8*], [20 x i8*]* @Cardinals, i64 0, i64 %148
  %150 = load i8*, i8** %149, align 8
  %151 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %152 = call i32 @xlate_string(i8* %150, %struct.darray_t* %151)
  %153 = load i32, i32* %6, align 4
  %154 = add i32 %153, %152
  store i32 %154, i32* %6, align 4
  %155 = load i64, i64* %4, align 8
  %156 = srem i64 %155, 100
  store i64 %156, i64* %4, align 8
  %157 = load i64, i64* %4, align 8
  %158 = icmp eq i64 %157, 0
  br i1 %158, label %159, label %166

; <label>:159:                                    ; preds = %146
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 16)
  %160 = add i64 %pgocount13, 1
  store i64 %160, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 16)
  %161 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %162 = call i32 @xlate_string(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.11, i32 0, i32 0), %struct.darray_t* %161)
  %163 = load i32, i32* %6, align 4
  %164 = add i32 %163, %162
  store i32 %164, i32* %6, align 4
  %165 = load i32, i32* %6, align 4
  store i32 %165, i32* %3, align 4
  br label %214

; <label>:166:                                    ; preds = %146
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 10)
  %167 = add i64 %pgocount14, 1
  store i64 %167, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 10)
  %168 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %169 = call i32 @xlate_string(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i32 0, i32 0), %struct.darray_t* %168)
  %170 = load i32, i32* %6, align 4
  %171 = add i32 %170, %169
  store i32 %171, i32* %6, align 4
  br label %172

; <label>:172:                                    ; preds = %166, %143
  %173 = load i64, i64* %4, align 8
  %174 = icmp sge i64 %173, 20
  br i1 %174, label %175, label %204

; <label>:175:                                    ; preds = %172
  %176 = load i64, i64* %4, align 8
  %177 = srem i64 %176, 10
  %178 = icmp eq i64 %177, 0
  br i1 %178, label %179, label %191

; <label>:179:                                    ; preds = %175
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 17)
  %180 = add i64 %pgocount15, 1
  store i64 %180, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 17)
  %181 = load i64, i64* %4, align 8
  %182 = sub nsw i64 %181, 20
  %183 = sdiv i64 %182, 10
  %184 = getelementptr inbounds [8 x i8*], [8 x i8*]* @Ord_twenties, i64 0, i64 %183
  %185 = load i8*, i8** %184, align 8
  %186 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %187 = call i32 @xlate_string(i8* %185, %struct.darray_t* %186)
  %188 = load i32, i32* %6, align 4
  %189 = add i32 %188, %187
  store i32 %189, i32* %6, align 4
  %190 = load i32, i32* %6, align 4
  store i32 %190, i32* %3, align 4
  br label %214

; <label>:191:                                    ; preds = %175
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 15)
  %192 = add i64 %pgocount16, 1
  store i64 %192, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 15)
  %193 = load i64, i64* %4, align 8
  %194 = sub nsw i64 %193, 20
  %195 = sdiv i64 %194, 10
  %196 = getelementptr inbounds [8 x i8*], [8 x i8*]* @Twenties, i64 0, i64 %195
  %197 = load i8*, i8** %196, align 8
  %198 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %199 = call i32 @xlate_string(i8* %197, %struct.darray_t* %198)
  %200 = load i32, i32* %6, align 4
  %201 = add i32 %200, %199
  store i32 %201, i32* %6, align 4
  %202 = load i64, i64* %4, align 8
  %203 = srem i64 %202, 10
  store i64 %203, i64* %4, align 8
  br label %204

; <label>:204:                                    ; preds = %191, %172
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 2)
  %205 = add i64 %pgocount17, 1
  store i64 %205, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_xlate_ordinal, i64 0, i64 2)
  %206 = load i64, i64* %4, align 8
  %207 = getelementptr inbounds [20 x i8*], [20 x i8*]* @Ordinals, i64 0, i64 %206
  %208 = load i8*, i8** %207, align 8
  %209 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %210 = call i32 @xlate_string(i8* %208, %struct.darray_t* %209)
  %211 = load i32, i32* %6, align 4
  %212 = add i32 %211, %210
  store i32 %212, i32* %6, align 4
  %213 = load i32, i32* %6, align 4
  store i32 %213, i32* %3, align 4
  br label %214

; <label>:214:                                    ; preds = %204, %179, %159, %121, %77, %41, %18
  %215 = load i32, i32* %3, align 4
  ret i32 %215
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
