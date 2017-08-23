; ModuleID = 'tmp1.ll'
source_filename = "layer12.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, [30 x i8] }
%struct.anon.0 = type { i16, i16 }
%struct.quantclass = type { i16, i8, i8, i32, i32 }
%struct.mad_stream = type { i8*, i8*, i64, i32, i64, i8*, i8*, %struct.mad_bitptr, %struct.mad_bitptr, i32, [2567 x i8]*, i32, i32, i32 }
%struct.mad_bitptr = type { i8*, i16, i16 }
%struct.mad_frame = type { %struct.mad_header, i32, [2 x [36 x [32 x i32]]], [2 x [32 x [18 x i32]]]* }
%struct.mad_header = type { i32, i32, i32, i32, i64, i32, i16, i16, i32, i32, %struct.mad_timer_t }
%struct.mad_timer_t = type { i64, i64 }

$__llvm_profile_raw_version = comdat any

@sf_table = internal constant [63 x i32] [i32 536870912, i32 426114725, i32 338207482, i32 268435456, i32 213057363, i32 169103741, i32 134217728, i32 106528681, i32 84551870, i32 67108864, i32 53264341, i32 42275935, i32 33554432, i32 26632170, i32 21137968, i32 16777216, i32 13316085, i32 10568984, i32 8388608, i32 6658043, i32 5284492, i32 4194304, i32 3329021, i32 2642246, i32 2097152, i32 1664511, i32 1321123, i32 1048576, i32 832255, i32 660561, i32 524288, i32 416128, i32 330281, i32 262144, i32 208064, i32 165140, i32 131072, i32 104032, i32 82570, i32 65536, i32 52016, i32 41285, i32 32768, i32 26008, i32 20643, i32 16384, i32 13004, i32 10321, i32 8192, i32 6502, i32 5161, i32 4096, i32 3251, i32 2580, i32 2048, i32 1625, i32 1290, i32 1024, i32 813, i32 645, i32 512, i32 406, i32 323], align 16
@sbquant_table = internal constant [5 x %struct.anon] [%struct.anon { i32 27, [30 x i8] c"\07\07\07\06\06\06\06\06\06\06\06\03\03\03\03\03\03\03\03\03\03\03\03\00\00\00\00\00\00\00" }, %struct.anon { i32 30, [30 x i8] c"\07\07\07\06\06\06\06\06\06\06\06\03\03\03\03\03\03\03\03\03\03\03\03\00\00\00\00\00\00\00" }, %struct.anon { i32 8, [30 x i8] c"\05\05\02\02\02\02\02\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, %struct.anon { i32 12, [30 x i8] c"\05\05\02\02\02\02\02\02\02\02\02\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, %struct.anon { i32 30, [30 x i8] c"\04\04\04\04\02\02\02\02\02\02\02\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01" }], align 16
@bitalloc_table = internal constant [8 x %struct.anon.0] [%struct.anon.0 { i16 2, i16 0 }, %struct.anon.0 { i16 2, i16 3 }, %struct.anon.0 { i16 3, i16 3 }, %struct.anon.0 { i16 3, i16 1 }, %struct.anon.0 { i16 4, i16 2 }, %struct.anon.0 { i16 4, i16 3 }, %struct.anon.0 { i16 4, i16 4 }, %struct.anon.0 { i16 4, i16 5 }], align 16
@offset_table = internal constant [6 x [15 x i8]] [[15 x i8] c"\00\01\10\00\00\00\00\00\00\00\00\00\00\00\00", [15 x i8] c"\00\01\02\03\04\05\10\00\00\00\00\00\00\00\00", [15 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E", [15 x i8] c"\00\01\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F", [15 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\10", [15 x i8] c"\00\02\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10"], align 16
@qc_table = internal constant [17 x %struct.quantclass] [%struct.quantclass { i16 3, i8 2, i8 5, i32 357913941, i32 134217728 }, %struct.quantclass { i16 5, i8 3, i8 7, i32 429496730, i32 134217728 }, %struct.quantclass { i16 7, i8 0, i8 3, i32 306783378, i32 67108864 }, %struct.quantclass { i16 9, i8 4, i8 10, i32 477218588, i32 134217728 }, %struct.quantclass { i16 15, i8 0, i8 4, i32 286331153, i32 33554432 }, %struct.quantclass { i16 31, i8 0, i8 5, i32 277094664, i32 16777216 }, %struct.quantclass { i16 63, i8 0, i8 6, i32 272696336, i32 8388608 }, %struct.quantclass { i16 127, i8 0, i8 7, i32 270549121, i32 4194304 }, %struct.quantclass { i16 255, i8 0, i8 8, i32 269488144, i32 2097152 }, %struct.quantclass { i16 511, i8 0, i8 9, i32 268960770, i32 1048576 }, %struct.quantclass { i16 1023, i8 0, i8 10, i32 268697856, i32 524288 }, %struct.quantclass { i16 2047, i8 0, i8 11, i32 268566592, i32 262144 }, %struct.quantclass { i16 4095, i8 0, i8 12, i32 268501008, i32 131072 }, %struct.quantclass { i16 8191, i8 0, i8 13, i32 268468228, i32 65536 }, %struct.quantclass { i16 16383, i8 0, i8 14, i32 268451841, i32 32768 }, %struct.quantclass { i16 32767, i8 0, i8 15, i32 268443648, i32 16384 }, %struct.quantclass { i16 -1, i8 0, i8 16, i32 268439552, i32 8192 }], align 16
@linear_table = internal constant [14 x i32] [i32 357913941, i32 306783378, i32 286331153, i32 277094664, i32 272696336, i32 270549121, i32 269488144, i32 268960770, i32 268697856, i32 268566592, i32 268501008, i32 268468228, i32 268451841, i32 268443648], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_mad_layer_I = private constant [11 x i8] c"mad_layer_I"
@__profn_tmp1.ll_I_sample = private constant [16 x i8] c"tmp1.ll:I_sample"
@__profn_mad_layer_II = private constant [12 x i8] c"mad_layer_II"
@__profn_tmp1.ll_II_samples = private constant [18 x i8] c"tmp1.ll:II_samples"
@__profc_mad_layer_I = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_layer_I = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3191595798467488053, i64 72058011737022065, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i32 0, i32 0), i8* bitcast (i32 (%struct.mad_stream*, %struct.mad_frame*)* @mad_layer_I to i8*), i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_I_sample = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_I_sample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3703289374715508673, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_I_sample, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_layer_II = private global [48 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_layer_II = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2650349018335796411, i64 216173498358474563, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i32 0, i32 0), i8* bitcast (i32 (%struct.mad_stream*, %struct.mad_frame*)* @mad_layer_II to i8*), i8* null, i32 48, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_II_samples = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_II_samples = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 247545716306205465, i64 93487622682, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_II_samples, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [46 x i8] c"<,x\DA\CBML\89\CFI\ACL-\8A\F7d,\C9-0\D4\CB\C9\B1\F2\8C/N\CC-\C8Ie\CCEH\22\C9\C2\A4\8B\01\92#\15\8D", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_layer_I to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_I_sample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_layer_II to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_II_samples to i8*), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @mad_layer_I(%struct.mad_stream*, %struct.mad_frame*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.mad_stream*, align 8
  %5 = alloca %struct.mad_frame*, align 8
  %6 = alloca %struct.mad_header*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [2 x [32 x i8]], align 16
  %14 = alloca [2 x [32 x i8]], align 16
  %15 = alloca i32, align 4
  store %struct.mad_stream* %0, %struct.mad_stream** %4, align 8
  store %struct.mad_frame* %1, %struct.mad_frame** %5, align 8
  %16 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %17 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %16, i32 0, i32 0
  store %struct.mad_header* %17, %struct.mad_header** %6, align 8
  %18 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %19 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %18, i32 0, i32 1
  %20 = load i32, i32* %19, align 4
  %21 = icmp ne i32 %20, 0
  %22 = zext i1 %21 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 24)
  %23 = add i64 %pgocount, %22
  store i64 %23, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 24)
  %24 = select i1 %21, i32 2, i32 1
  store i32 %24, i32* %7, align 4
  store i32 32, i32* %8, align 4
  %25 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %26 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %25, i32 0, i32 1
  %27 = load i32, i32* %26, align 4
  %28 = icmp eq i32 %27, 2
  br i1 %28, label %29, label %40

; <label>:29:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 14)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 14)
  %31 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %32 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %31, i32 0, i32 8
  %33 = load i32, i32* %32, align 8
  %34 = or i32 %33, 256
  store i32 %34, i32* %32, align 8
  %35 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %36 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %35, i32 0, i32 2
  %37 = load i32, i32* %36, align 8
  %38 = mul nsw i32 %37, 4
  %39 = add nsw i32 4, %38
  store i32 %39, i32* %8, align 4
  br label %40

; <label>:40:                                     ; preds = %29, %2
  %41 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %42 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %41, i32 0, i32 8
  %43 = load i32, i32* %42, align 8
  %44 = and i32 %43, 16
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %89

; <label>:46:                                     ; preds = %40
  %47 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %48 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %47, i32 0, i32 7
  %49 = load i32, i32* %8, align 4
  %50 = load i32, i32* %7, align 4
  %51 = mul i32 %49, %50
  %52 = load i32, i32* %8, align 4
  %53 = sub i32 32, %52
  %54 = add i32 %51, %53
  %55 = mul i32 4, %54
  %56 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %57 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %56, i32 0, i32 6
  %58 = load i16, i16* %57, align 4
  %59 = bitcast %struct.mad_bitptr* %48 to { i8*, i64 }*
  %60 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %59, i32 0, i32 0
  %61 = load i8*, i8** %60, align 8
  %62 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %59, i32 0, i32 1
  %63 = load i64, i64* %62, align 8
  %64 = call zeroext i16 @mad_bit_crc(i8* %61, i64 %63, i32 %55, i16 zeroext %58)
  %65 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %66 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %65, i32 0, i32 6
  store i16 %64, i16* %66, align 4
  %67 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %68 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %67, i32 0, i32 6
  %69 = load i16, i16* %68, align 4
  %70 = zext i16 %69 to i32
  %71 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %72 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %71, i32 0, i32 7
  %73 = load i16, i16* %72, align 2
  %74 = zext i16 %73 to i32
  %75 = icmp ne i32 %70, %74
  br i1 %75, label %76, label %87

; <label>:76:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 17)
  %77 = add i64 %pgocount2, 1
  store i64 %77, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 17)
  %78 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %79 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %78, i32 0, i32 1
  %80 = load i32, i32* %79, align 8
  %81 = and i32 %80, 1
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %87, label %83

; <label>:83:                                     ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 18)
  %84 = add i64 %pgocount3, 1
  store i64 %84, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 18)
  %85 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %86 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %85, i32 0, i32 13
  store i32 513, i32* %86, align 8
  store i32 -1, i32* %3, align 4
  br label %394

; <label>:87:                                     ; preds = %76, %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 15)
  %88 = add i64 %pgocount4, 1
  store i64 %88, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 15)
  br label %89

; <label>:89:                                     ; preds = %87, %40
  store i32 0, i32* %11, align 4
  br label %90

; <label>:90:                                     ; preds = %132, %89
  %91 = load i32, i32* %11, align 4
  %92 = load i32, i32* %8, align 4
  %93 = icmp ult i32 %91, %92
  br i1 %93, label %94, label %136

; <label>:94:                                     ; preds = %90
  store i32 0, i32* %9, align 4
  br label %95

; <label>:95:                                     ; preds = %128, %94
  %96 = load i32, i32* %9, align 4
  %97 = load i32, i32* %7, align 4
  %98 = icmp ult i32 %96, %97
  br i1 %98, label %99, label %131

; <label>:99:                                     ; preds = %95
  %100 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %101 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %100, i32 0, i32 7
  %102 = call i64 @mad_bit_read(%struct.mad_bitptr* %101, i32 4)
  %103 = trunc i64 %102 to i32
  store i32 %103, i32* %12, align 4
  %104 = load i32, i32* %12, align 4
  %105 = icmp eq i32 %104, 15
  br i1 %105, label %106, label %110

; <label>:106:                                    ; preds = %99
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 10)
  %107 = add i64 %pgocount5, 1
  store i64 %107, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 10)
  %108 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %109 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %108, i32 0, i32 13
  store i32 529, i32* %109, align 8
  store i32 -1, i32* %3, align 4
  br label %394

; <label>:110:                                    ; preds = %99
  %111 = load i32, i32* %12, align 4
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %117

; <label>:113:                                    ; preds = %110
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 4)
  %114 = add i64 %pgocount6, 1
  store i64 %114, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 4)
  %115 = load i32, i32* %12, align 4
  %116 = add i32 %115, 1
  br label %119

; <label>:117:                                    ; preds = %110
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 5)
  %118 = add i64 %pgocount7, 1
  store i64 %118, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 5)
  br label %119

; <label>:119:                                    ; preds = %117, %113
  %120 = phi i32 [ %116, %113 ], [ 0, %117 ]
  %121 = trunc i32 %120 to i8
  %122 = load i32, i32* %9, align 4
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %13, i64 0, i64 %123
  %125 = load i32, i32* %11, align 4
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds [32 x i8], [32 x i8]* %124, i64 0, i64 %126
  store i8 %121, i8* %127, align 1
  br label %128

; <label>:128:                                    ; preds = %119
  %129 = load i32, i32* %9, align 4
  %130 = add i32 %129, 1
  store i32 %130, i32* %9, align 4
  br label %95

; <label>:131:                                    ; preds = %95
  br label %132

; <label>:132:                                    ; preds = %131
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 9)
  %133 = add i64 %pgocount8, 1
  store i64 %133, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 9)
  %134 = load i32, i32* %11, align 4
  %135 = add i32 %134, 1
  store i32 %135, i32* %11, align 4
  br label %90

; <label>:136:                                    ; preds = %90
  %137 = load i32, i32* %8, align 4
  store i32 %137, i32* %11, align 4
  br label %138

; <label>:138:                                    ; preds = %172, %136
  %139 = load i32, i32* %11, align 4
  %140 = icmp ult i32 %139, 32
  br i1 %140, label %141, label %175

; <label>:141:                                    ; preds = %138
  %142 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %143 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %142, i32 0, i32 7
  %144 = call i64 @mad_bit_read(%struct.mad_bitptr* %143, i32 4)
  %145 = trunc i64 %144 to i32
  store i32 %145, i32* %12, align 4
  %146 = load i32, i32* %12, align 4
  %147 = icmp eq i32 %146, 15
  br i1 %147, label %148, label %152

; <label>:148:                                    ; preds = %141
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 21)
  %149 = add i64 %pgocount9, 1
  store i64 %149, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 21)
  %150 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %151 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %150, i32 0, i32 13
  store i32 529, i32* %151, align 8
  store i32 -1, i32* %3, align 4
  br label %394

; <label>:152:                                    ; preds = %141
  %153 = load i32, i32* %12, align 4
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %155, label %159

; <label>:155:                                    ; preds = %152
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 13)
  %156 = add i64 %pgocount10, 1
  store i64 %156, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 13)
  %157 = load i32, i32* %12, align 4
  %158 = add i32 %157, 1
  br label %161

; <label>:159:                                    ; preds = %152
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 16)
  %160 = add i64 %pgocount11, 1
  store i64 %160, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 16)
  br label %161

; <label>:161:                                    ; preds = %159, %155
  %162 = phi i32 [ %158, %155 ], [ 0, %159 ]
  %163 = trunc i32 %162 to i8
  %164 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %13, i64 0, i64 1
  %165 = load i32, i32* %11, align 4
  %166 = zext i32 %165 to i64
  %167 = getelementptr inbounds [32 x i8], [32 x i8]* %164, i64 0, i64 %166
  store i8 %163, i8* %167, align 1
  %168 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %13, i64 0, i64 0
  %169 = load i32, i32* %11, align 4
  %170 = zext i32 %169 to i64
  %171 = getelementptr inbounds [32 x i8], [32 x i8]* %168, i64 0, i64 %170
  store i8 %163, i8* %171, align 1
  br label %172

; <label>:172:                                    ; preds = %161
  %173 = load i32, i32* %11, align 4
  %174 = add i32 %173, 1
  store i32 %174, i32* %11, align 4
  br label %138

; <label>:175:                                    ; preds = %138
  store i32 0, i32* %11, align 4
  br label %176

; <label>:176:                                    ; preds = %225, %175
  %177 = load i32, i32* %11, align 4
  %178 = icmp ult i32 %177, 32
  br i1 %178, label %179, label %229

; <label>:179:                                    ; preds = %176
  store i32 0, i32* %9, align 4
  br label %180

; <label>:180:                                    ; preds = %220, %179
  %181 = load i32, i32* %9, align 4
  %182 = load i32, i32* %7, align 4
  %183 = icmp ult i32 %181, %182
  br i1 %183, label %184, label %224

; <label>:184:                                    ; preds = %180
  %185 = load i32, i32* %9, align 4
  %186 = zext i32 %185 to i64
  %187 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %13, i64 0, i64 %186
  %188 = load i32, i32* %11, align 4
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds [32 x i8], [32 x i8]* %187, i64 0, i64 %189
  %191 = load i8, i8* %190, align 1
  %192 = icmp ne i8 %191, 0
  br i1 %192, label %193, label %219

; <label>:193:                                    ; preds = %184
  %194 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %195 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %194, i32 0, i32 7
  %196 = call i64 @mad_bit_read(%struct.mad_bitptr* %195, i32 6)
  %197 = trunc i64 %196 to i8
  %198 = load i32, i32* %9, align 4
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %14, i64 0, i64 %199
  %201 = load i32, i32* %11, align 4
  %202 = zext i32 %201 to i64
  %203 = getelementptr inbounds [32 x i8], [32 x i8]* %200, i64 0, i64 %202
  store i8 %197, i8* %203, align 1
  %204 = load i32, i32* %9, align 4
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %14, i64 0, i64 %205
  %207 = load i32, i32* %11, align 4
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds [32 x i8], [32 x i8]* %206, i64 0, i64 %208
  %210 = load i8, i8* %209, align 1
  %211 = zext i8 %210 to i32
  %212 = icmp eq i32 %211, 63
  br i1 %212, label %213, label %217

; <label>:213:                                    ; preds = %193
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 22)
  %214 = add i64 %pgocount12, 1
  store i64 %214, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 22)
  %215 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %216 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %215, i32 0, i32 13
  store i32 545, i32* %216, align 8
  store i32 -1, i32* %3, align 4
  br label %394

; <label>:217:                                    ; preds = %193
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 11)
  %218 = add i64 %pgocount13, 1
  store i64 %218, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 11)
  br label %219

; <label>:219:                                    ; preds = %217, %184
  br label %220

; <label>:220:                                    ; preds = %219
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 8)
  %221 = add i64 %pgocount14, 1
  store i64 %221, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 8)
  %222 = load i32, i32* %9, align 4
  %223 = add i32 %222, 1
  store i32 %223, i32* %9, align 4
  br label %180

; <label>:224:                                    ; preds = %180
  br label %225

; <label>:225:                                    ; preds = %224
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 20)
  %226 = add i64 %pgocount15, 1
  store i64 %226, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 20)
  %227 = load i32, i32* %11, align 4
  %228 = add i32 %227, 1
  store i32 %228, i32* %11, align 4
  br label %176

; <label>:229:                                    ; preds = %176
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 23)
  %230 = add i64 %pgocount16, 1
  store i64 %230, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 23)
  store i32 0, i32* %10, align 4
  br label %231

; <label>:231:                                    ; preds = %389, %229
  %232 = load i32, i32* %10, align 4
  %233 = icmp ult i32 %232, 12
  br i1 %233, label %234, label %393

; <label>:234:                                    ; preds = %231
  store i32 0, i32* %11, align 4
  br label %235

; <label>:235:                                    ; preds = %298, %234
  %236 = load i32, i32* %11, align 4
  %237 = load i32, i32* %8, align 4
  %238 = icmp ult i32 %236, %237
  br i1 %238, label %239, label %302

; <label>:239:                                    ; preds = %235
  store i32 0, i32* %9, align 4
  br label %240

; <label>:240:                                    ; preds = %294, %239
  %241 = load i32, i32* %9, align 4
  %242 = load i32, i32* %7, align 4
  %243 = icmp ult i32 %241, %242
  br i1 %243, label %244, label %297

; <label>:244:                                    ; preds = %240
  %245 = load i32, i32* %9, align 4
  %246 = zext i32 %245 to i64
  %247 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %13, i64 0, i64 %246
  %248 = load i32, i32* %11, align 4
  %249 = zext i32 %248 to i64
  %250 = getelementptr inbounds [32 x i8], [32 x i8]* %247, i64 0, i64 %249
  %251 = load i8, i8* %250, align 1
  %252 = zext i8 %251 to i32
  store i32 %252, i32* %12, align 4
  %253 = load i32, i32* %12, align 4
  %254 = icmp ne i32 %253, 0
  br i1 %254, label %255, label %278

; <label>:255:                                    ; preds = %244
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 0)
  %256 = add i64 %pgocount17, 1
  store i64 %256, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 0)
  %257 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %258 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %257, i32 0, i32 7
  %259 = load i32, i32* %12, align 4
  %260 = call i32 @I_sample(%struct.mad_bitptr* %258, i32 %259)
  %261 = sext i32 %260 to i64
  %262 = add nsw i64 %261, 2048
  %263 = ashr i64 %262, 12
  %264 = load i32, i32* %9, align 4
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %14, i64 0, i64 %265
  %267 = load i32, i32* %11, align 4
  %268 = zext i32 %267 to i64
  %269 = getelementptr inbounds [32 x i8], [32 x i8]* %266, i64 0, i64 %268
  %270 = load i8, i8* %269, align 1
  %271 = zext i8 %270 to i64
  %272 = getelementptr inbounds [63 x i32], [63 x i32]* @sf_table, i64 0, i64 %271
  %273 = load i32, i32* %272, align 4
  %274 = sext i32 %273 to i64
  %275 = add nsw i64 %274, 32768
  %276 = ashr i64 %275, 16
  %277 = mul nsw i64 %263, %276
  br label %280

; <label>:278:                                    ; preds = %244
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 2)
  %279 = add i64 %pgocount18, 1
  store i64 %279, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 2)
  br label %280

; <label>:280:                                    ; preds = %278, %255
  %281 = phi i64 [ %277, %255 ], [ 0, %278 ]
  %282 = trunc i64 %281 to i32
  %283 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %284 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %283, i32 0, i32 2
  %285 = load i32, i32* %9, align 4
  %286 = zext i32 %285 to i64
  %287 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %284, i64 0, i64 %286
  %288 = load i32, i32* %10, align 4
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %287, i64 0, i64 %289
  %291 = load i32, i32* %11, align 4
  %292 = zext i32 %291 to i64
  %293 = getelementptr inbounds [32 x i32], [32 x i32]* %290, i64 0, i64 %292
  store i32 %282, i32* %293, align 4
  br label %294

; <label>:294:                                    ; preds = %280
  %295 = load i32, i32* %9, align 4
  %296 = add i32 %295, 1
  store i32 %296, i32* %9, align 4
  br label %240

; <label>:297:                                    ; preds = %240
  br label %298

; <label>:298:                                    ; preds = %297
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 6)
  %299 = add i64 %pgocount19, 1
  store i64 %299, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 6)
  %300 = load i32, i32* %11, align 4
  %301 = add i32 %300, 1
  store i32 %301, i32* %11, align 4
  br label %235

; <label>:302:                                    ; preds = %235
  %303 = load i32, i32* %8, align 4
  store i32 %303, i32* %11, align 4
  br label %304

; <label>:304:                                    ; preds = %385, %302
  %305 = load i32, i32* %11, align 4
  %306 = icmp ult i32 %305, 32
  br i1 %306, label %307, label %388

; <label>:307:                                    ; preds = %304
  %308 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %13, i64 0, i64 0
  %309 = load i32, i32* %11, align 4
  %310 = zext i32 %309 to i64
  %311 = getelementptr inbounds [32 x i8], [32 x i8]* %308, i64 0, i64 %310
  %312 = load i8, i8* %311, align 1
  %313 = zext i8 %312 to i32
  store i32 %313, i32* %12, align 4
  %314 = icmp ne i32 %313, 0
  br i1 %314, label %315, label %361

; <label>:315:                                    ; preds = %307
  %316 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %317 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %316, i32 0, i32 7
  %318 = load i32, i32* %12, align 4
  %319 = call i32 @I_sample(%struct.mad_bitptr* %317, i32 %318)
  store i32 %319, i32* %15, align 4
  store i32 0, i32* %9, align 4
  br label %320

; <label>:320:                                    ; preds = %355, %315
  %321 = load i32, i32* %9, align 4
  %322 = load i32, i32* %7, align 4
  %323 = icmp ult i32 %321, %322
  br i1 %323, label %324, label %359

; <label>:324:                                    ; preds = %320
  %325 = load i32, i32* %15, align 4
  %326 = sext i32 %325 to i64
  %327 = add nsw i64 %326, 2048
  %328 = ashr i64 %327, 12
  %329 = load i32, i32* %9, align 4
  %330 = zext i32 %329 to i64
  %331 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %14, i64 0, i64 %330
  %332 = load i32, i32* %11, align 4
  %333 = zext i32 %332 to i64
  %334 = getelementptr inbounds [32 x i8], [32 x i8]* %331, i64 0, i64 %333
  %335 = load i8, i8* %334, align 1
  %336 = zext i8 %335 to i64
  %337 = getelementptr inbounds [63 x i32], [63 x i32]* @sf_table, i64 0, i64 %336
  %338 = load i32, i32* %337, align 4
  %339 = sext i32 %338 to i64
  %340 = add nsw i64 %339, 32768
  %341 = ashr i64 %340, 16
  %342 = mul nsw i64 %328, %341
  %343 = trunc i64 %342 to i32
  %344 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %345 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %344, i32 0, i32 2
  %346 = load i32, i32* %9, align 4
  %347 = zext i32 %346 to i64
  %348 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %345, i64 0, i64 %347
  %349 = load i32, i32* %10, align 4
  %350 = zext i32 %349 to i64
  %351 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %348, i64 0, i64 %350
  %352 = load i32, i32* %11, align 4
  %353 = zext i32 %352 to i64
  %354 = getelementptr inbounds [32 x i32], [32 x i32]* %351, i64 0, i64 %353
  store i32 %343, i32* %354, align 4
  br label %355

; <label>:355:                                    ; preds = %324
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 1)
  %356 = add i64 %pgocount20, 1
  store i64 %356, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 1)
  %357 = load i32, i32* %9, align 4
  %358 = add i32 %357, 1
  store i32 %358, i32* %9, align 4
  br label %320

; <label>:359:                                    ; preds = %320
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 7)
  %360 = add i64 %pgocount21, 1
  store i64 %360, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 7)
  br label %384

; <label>:361:                                    ; preds = %307
  store i32 0, i32* %9, align 4
  br label %362

; <label>:362:                                    ; preds = %378, %361
  %363 = load i32, i32* %9, align 4
  %364 = load i32, i32* %7, align 4
  %365 = icmp ult i32 %363, %364
  br i1 %365, label %366, label %382

; <label>:366:                                    ; preds = %362
  %367 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %368 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %367, i32 0, i32 2
  %369 = load i32, i32* %9, align 4
  %370 = zext i32 %369 to i64
  %371 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %368, i64 0, i64 %370
  %372 = load i32, i32* %10, align 4
  %373 = zext i32 %372 to i64
  %374 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %371, i64 0, i64 %373
  %375 = load i32, i32* %11, align 4
  %376 = zext i32 %375 to i64
  %377 = getelementptr inbounds [32 x i32], [32 x i32]* %374, i64 0, i64 %376
  store i32 0, i32* %377, align 4
  br label %378

; <label>:378:                                    ; preds = %366
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 3)
  %379 = add i64 %pgocount22, 1
  store i64 %379, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 3)
  %380 = load i32, i32* %9, align 4
  %381 = add i32 %380, 1
  store i32 %381, i32* %9, align 4
  br label %362

; <label>:382:                                    ; preds = %362
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 12)
  %383 = add i64 %pgocount23, 1
  store i64 %383, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 12)
  br label %384

; <label>:384:                                    ; preds = %382, %359
  br label %385

; <label>:385:                                    ; preds = %384
  %386 = load i32, i32* %11, align 4
  %387 = add i32 %386, 1
  store i32 %387, i32* %11, align 4
  br label %304

; <label>:388:                                    ; preds = %304
  br label %389

; <label>:389:                                    ; preds = %388
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 19)
  %390 = add i64 %pgocount24, 1
  store i64 %390, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mad_layer_I, i64 0, i64 19)
  %391 = load i32, i32* %10, align 4
  %392 = add i32 %391, 1
  store i32 %392, i32* %10, align 4
  br label %231

; <label>:393:                                    ; preds = %231
  store i32 0, i32* %3, align 4
  br label %394

; <label>:394:                                    ; preds = %393, %213, %148, %106, %83
  %395 = load i32, i32* %3, align 4
  ret i32 %395
}

declare zeroext i16 @mad_bit_crc(i8*, i64, i32, i16 zeroext) #1

declare i64 @mad_bit_read(%struct.mad_bitptr*, i32) #1

; Function Attrs: nounwind uwtable
define internal i32 @I_sample(%struct.mad_bitptr*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_I_sample, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_I_sample, i64 0, i64 0)
  %4 = alloca %struct.mad_bitptr*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.mad_bitptr* %0, %struct.mad_bitptr** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %8 = load i32, i32* %5, align 4
  %9 = call i64 @mad_bit_read(%struct.mad_bitptr* %7, i32 %8)
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %6, align 4
  %11 = load i32, i32* %5, align 4
  %12 = sub i32 %11, 1
  %13 = shl i32 1, %12
  %14 = load i32, i32* %6, align 4
  %15 = xor i32 %14, %13
  store i32 %15, i32* %6, align 4
  %16 = load i32, i32* %6, align 4
  %17 = load i32, i32* %5, align 4
  %18 = sub i32 %17, 1
  %19 = shl i32 1, %18
  %20 = and i32 %16, %19
  %21 = sub nsw i32 0, %20
  %22 = load i32, i32* %6, align 4
  %23 = or i32 %22, %21
  store i32 %23, i32* %6, align 4
  %24 = load i32, i32* %5, align 4
  %25 = sub i32 %24, 1
  %26 = sub i32 28, %25
  %27 = load i32, i32* %6, align 4
  %28 = shl i32 %27, %26
  store i32 %28, i32* %6, align 4
  %29 = load i32, i32* %5, align 4
  %30 = sub i32 %29, 1
  %31 = ashr i32 268435456, %30
  %32 = load i32, i32* %6, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %6, align 4
  %34 = load i32, i32* %6, align 4
  %35 = sext i32 %34 to i64
  %36 = add nsw i64 %35, 2048
  %37 = ashr i64 %36, 12
  %38 = load i32, i32* %5, align 4
  %39 = sub i32 %38, 2
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds [14 x i32], [14 x i32]* @linear_table, i64 0, i64 %40
  %42 = load i32, i32* %41, align 4
  %43 = sext i32 %42 to i64
  %44 = add nsw i64 %43, 32768
  %45 = ashr i64 %44, 16
  %46 = mul nsw i64 %37, %45
  %47 = trunc i64 %46 to i32
  ret i32 %47
}

; Function Attrs: nounwind uwtable
define i32 @mad_layer_II(%struct.mad_stream*, %struct.mad_frame*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.mad_stream*, align 8
  %5 = alloca %struct.mad_frame*, align 8
  %6 = alloca %struct.mad_header*, align 8
  %7 = alloca %struct.mad_bitptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i8*, align 8
  %18 = alloca [2 x [32 x i8]], align 16
  %19 = alloca [2 x [32 x i8]], align 16
  %20 = alloca [2 x [32 x [3 x i8]]], align 16
  %21 = alloca [3 x i32], align 4
  store %struct.mad_stream* %0, %struct.mad_stream** %4, align 8
  store %struct.mad_frame* %1, %struct.mad_frame** %5, align 8
  %22 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %23 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %22, i32 0, i32 0
  store %struct.mad_header* %23, %struct.mad_header** %6, align 8
  %24 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %25 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %24, i32 0, i32 1
  %26 = load i32, i32* %25, align 4
  %27 = icmp ne i32 %26, 0
  %28 = zext i1 %27 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 45)
  %29 = add i64 %pgocount, %28
  store i64 %29, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 45)
  %30 = select i1 %27, i32 2, i32 1
  store i32 %30, i32* %11, align 4
  %31 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %32 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %31, i32 0, i32 8
  %33 = load i32, i32* %32, align 8
  %34 = and i32 %33, 4096
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %38

; <label>:36:                                     ; preds = %2
  %pgocount4 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 33)
  %37 = add i64 %pgocount4, 1
  store i64 %37, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 33)
  store i32 4, i32* %8, align 4
  br label %77

; <label>:38:                                     ; preds = %2
  %39 = load i32, i32* %11, align 4
  %40 = icmp eq i32 %39, 2
  br i1 %40, label %41, label %46

; <label>:41:                                     ; preds = %38
  %42 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %43 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %42, i32 0, i32 4
  %44 = load i64, i64* %43, align 8
  %45 = udiv i64 %44, 2
  br label %51

; <label>:46:                                     ; preds = %38
  %pgocount5 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 38)
  %47 = add i64 %pgocount5, 1
  store i64 %47, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 38)
  %48 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %49 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %48, i32 0, i32 4
  %50 = load i64, i64* %49, align 8
  br label %51

; <label>:51:                                     ; preds = %46, %41
  %52 = phi i64 [ %45, %41 ], [ %50, %46 ]
  switch i64 %52, label %67 [
    i64 32000, label %._crit_edge1
    i64 48000, label %56
    i64 56000, label %._crit_edge2
    i64 64000, label %._crit_edge3
    i64 80000, label %65
  ]

._crit_edge3:                                     ; preds = %51
  %pgocount6 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 16)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 16)
  br label %65

._crit_edge2:                                     ; preds = %51
  %pgocount7 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 15)
  %54 = add i64 %pgocount7, 1
  store i64 %54, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 15)
  br label %65

._crit_edge1:                                     ; preds = %51
  %pgocount8 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 14)
  %55 = add i64 %pgocount8, 1
  store i64 %55, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 14)
  br label %56

; <label>:56:                                     ; preds = %._crit_edge1, %51
  %pgocount9 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 41)
  %57 = add i64 %pgocount9, 1
  store i64 %57, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 41)
  %58 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %59 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %58, i32 0, i32 5
  %60 = load i32, i32* %59, align 8
  %61 = icmp eq i32 %60, 32000
  %62 = zext i1 %61 to i64
  %pgocount10 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 46)
  %63 = add i64 %pgocount10, %62
  store i64 %63, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 46)
  %64 = select i1 %61, i32 3, i32 2
  store i32 %64, i32* %8, align 4
  br label %76

; <label>:65:                                     ; preds = %._crit_edge3, %._crit_edge2, %51
  %pgocount11 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 39)
  %66 = add i64 %pgocount11, 1
  store i64 %66, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 39)
  store i32 0, i32* %8, align 4
  br label %76

; <label>:67:                                     ; preds = %51
  %pgocount12 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 43)
  %68 = add i64 %pgocount12, 1
  store i64 %68, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 43)
  %69 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %70 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %69, i32 0, i32 5
  %71 = load i32, i32* %70, align 8
  %72 = icmp eq i32 %71, 48000
  %73 = zext i1 %72 to i64
  %pgocount13 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 47)
  %74 = add i64 %pgocount13, %73
  store i64 %74, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 47)
  %75 = select i1 %72, i32 0, i32 1
  store i32 %75, i32* %8, align 4
  br label %76

; <label>:76:                                     ; preds = %67, %65, %56
  br label %77

; <label>:77:                                     ; preds = %76, %36
  %78 = load i32, i32* %8, align 4
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds [5 x %struct.anon], [5 x %struct.anon]* @sbquant_table, i64 0, i64 %79
  %81 = getelementptr inbounds %struct.anon, %struct.anon* %80, i32 0, i32 0
  %82 = load i32, i32* %81, align 4
  store i32 %82, i32* %9, align 4
  %83 = load i32, i32* %8, align 4
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds [5 x %struct.anon], [5 x %struct.anon]* @sbquant_table, i64 0, i64 %84
  %86 = getelementptr inbounds %struct.anon, %struct.anon* %85, i32 0, i32 1
  %87 = getelementptr inbounds [30 x i8], [30 x i8]* %86, i32 0, i32 0
  store i8* %87, i8** %17, align 8
  store i32 32, i32* %12, align 4
  %88 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %89 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %88, i32 0, i32 1
  %90 = load i32, i32* %89, align 4
  %91 = icmp eq i32 %90, 2
  br i1 %91, label %92, label %103

; <label>:92:                                     ; preds = %77
  %pgocount14 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 34)
  %93 = add i64 %pgocount14, 1
  store i64 %93, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 34)
  %94 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %95 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %94, i32 0, i32 8
  %96 = load i32, i32* %95, align 8
  %97 = or i32 %96, 256
  store i32 %97, i32* %95, align 8
  %98 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %99 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %98, i32 0, i32 2
  %100 = load i32, i32* %99, align 8
  %101 = mul nsw i32 %100, 4
  %102 = add nsw i32 4, %101
  store i32 %102, i32* %12, align 4
  br label %103

; <label>:103:                                    ; preds = %92, %77
  %104 = load i32, i32* %12, align 4
  %105 = load i32, i32* %9, align 4
  %106 = icmp ugt i32 %104, %105
  br i1 %106, label %107, label %110

; <label>:107:                                    ; preds = %103
  %pgocount15 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 35)
  %108 = add i64 %pgocount15, 1
  store i64 %108, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 35)
  %109 = load i32, i32* %9, align 4
  store i32 %109, i32* %12, align 4
  br label %110

; <label>:110:                                    ; preds = %107, %103
  %111 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %112 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %111, i32 0, i32 7
  %113 = bitcast %struct.mad_bitptr* %7 to i8*
  %114 = bitcast %struct.mad_bitptr* %112 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %113, i8* %114, i64 16, i32 8, i1 false)
  store i32 0, i32* %16, align 4
  br label %115

; <label>:115:                                    ; preds = %151, %110
  %116 = load i32, i32* %16, align 4
  %117 = load i32, i32* %12, align 4
  %118 = icmp ult i32 %116, %117
  br i1 %118, label %119, label %155

; <label>:119:                                    ; preds = %115
  %120 = load i8*, i8** %17, align 8
  %121 = load i32, i32* %16, align 4
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8* %120, i64 %122
  %124 = load i8, i8* %123, align 1
  %125 = zext i8 %124 to i64
  %126 = getelementptr inbounds [8 x %struct.anon.0], [8 x %struct.anon.0]* @bitalloc_table, i64 0, i64 %125
  %127 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %126, i32 0, i32 0
  %128 = load i16, i16* %127, align 4
  %129 = zext i16 %128 to i32
  store i32 %129, i32* %10, align 4
  store i32 0, i32* %14, align 4
  br label %130

; <label>:130:                                    ; preds = %146, %119
  %131 = load i32, i32* %14, align 4
  %132 = load i32, i32* %11, align 4
  %133 = icmp ult i32 %131, %132
  br i1 %133, label %134, label %150

; <label>:134:                                    ; preds = %130
  %135 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %136 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %135, i32 0, i32 7
  %137 = load i32, i32* %10, align 4
  %138 = call i64 @mad_bit_read(%struct.mad_bitptr* %136, i32 %137)
  %139 = trunc i64 %138 to i8
  %140 = load i32, i32* %14, align 4
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %18, i64 0, i64 %141
  %143 = load i32, i32* %16, align 4
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds [32 x i8], [32 x i8]* %142, i64 0, i64 %144
  store i8 %139, i8* %145, align 1
  br label %146

; <label>:146:                                    ; preds = %134
  %pgocount16 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 7)
  %147 = add i64 %pgocount16, 1
  store i64 %147, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 7)
  %148 = load i32, i32* %14, align 4
  %149 = add i32 %148, 1
  store i32 %149, i32* %14, align 4
  br label %130

; <label>:150:                                    ; preds = %130
  br label %151

; <label>:151:                                    ; preds = %150
  %pgocount17 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 19)
  %152 = add i64 %pgocount17, 1
  store i64 %152, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 19)
  %153 = load i32, i32* %16, align 4
  %154 = add i32 %153, 1
  store i32 %154, i32* %16, align 4
  br label %115

; <label>:155:                                    ; preds = %115
  %156 = load i32, i32* %12, align 4
  store i32 %156, i32* %16, align 4
  br label %157

; <label>:157:                                    ; preds = %185, %155
  %158 = load i32, i32* %16, align 4
  %159 = load i32, i32* %9, align 4
  %160 = icmp ult i32 %158, %159
  br i1 %160, label %161, label %189

; <label>:161:                                    ; preds = %157
  %162 = load i8*, i8** %17, align 8
  %163 = load i32, i32* %16, align 4
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds i8, i8* %162, i64 %164
  %166 = load i8, i8* %165, align 1
  %167 = zext i8 %166 to i64
  %168 = getelementptr inbounds [8 x %struct.anon.0], [8 x %struct.anon.0]* @bitalloc_table, i64 0, i64 %167
  %169 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %168, i32 0, i32 0
  %170 = load i16, i16* %169, align 4
  %171 = zext i16 %170 to i32
  store i32 %171, i32* %10, align 4
  %172 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %173 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %172, i32 0, i32 7
  %174 = load i32, i32* %10, align 4
  %175 = call i64 @mad_bit_read(%struct.mad_bitptr* %173, i32 %174)
  %176 = trunc i64 %175 to i8
  %177 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %18, i64 0, i64 1
  %178 = load i32, i32* %16, align 4
  %179 = zext i32 %178 to i64
  %180 = getelementptr inbounds [32 x i8], [32 x i8]* %177, i64 0, i64 %179
  store i8 %176, i8* %180, align 1
  %181 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %18, i64 0, i64 0
  %182 = load i32, i32* %16, align 4
  %183 = zext i32 %182 to i64
  %184 = getelementptr inbounds [32 x i8], [32 x i8]* %181, i64 0, i64 %183
  store i8 %176, i8* %184, align 1
  br label %185

; <label>:185:                                    ; preds = %161
  %pgocount18 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 20)
  %186 = add i64 %pgocount18, 1
  store i64 %186, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 20)
  %187 = load i32, i32* %16, align 4
  %188 = add i32 %187, 1
  store i32 %188, i32* %16, align 4
  br label %157

; <label>:189:                                    ; preds = %157
  store i32 0, i32* %16, align 4
  br label %190

; <label>:190:                                    ; preds = %226, %189
  %191 = load i32, i32* %16, align 4
  %192 = load i32, i32* %9, align 4
  %193 = icmp ult i32 %191, %192
  br i1 %193, label %194, label %230

; <label>:194:                                    ; preds = %190
  store i32 0, i32* %14, align 4
  br label %195

; <label>:195:                                    ; preds = %221, %194
  %196 = load i32, i32* %14, align 4
  %197 = load i32, i32* %11, align 4
  %198 = icmp ult i32 %196, %197
  br i1 %198, label %199, label %225

; <label>:199:                                    ; preds = %195
  %200 = load i32, i32* %14, align 4
  %201 = zext i32 %200 to i64
  %202 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %18, i64 0, i64 %201
  %203 = load i32, i32* %16, align 4
  %204 = zext i32 %203 to i64
  %205 = getelementptr inbounds [32 x i8], [32 x i8]* %202, i64 0, i64 %204
  %206 = load i8, i8* %205, align 1
  %207 = icmp ne i8 %206, 0
  br i1 %207, label %208, label %220

; <label>:208:                                    ; preds = %199
  %pgocount19 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 11)
  %209 = add i64 %pgocount19, 1
  store i64 %209, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 11)
  %210 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %211 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %210, i32 0, i32 7
  %212 = call i64 @mad_bit_read(%struct.mad_bitptr* %211, i32 2)
  %213 = trunc i64 %212 to i8
  %214 = load i32, i32* %14, align 4
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %19, i64 0, i64 %215
  %217 = load i32, i32* %16, align 4
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds [32 x i8], [32 x i8]* %216, i64 0, i64 %218
  store i8 %213, i8* %219, align 1
  br label %220

; <label>:220:                                    ; preds = %208, %199
  br label %221

; <label>:221:                                    ; preds = %220
  %pgocount20 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 8)
  %222 = add i64 %pgocount20, 1
  store i64 %222, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 8)
  %223 = load i32, i32* %14, align 4
  %224 = add i32 %223, 1
  store i32 %224, i32* %14, align 4
  br label %195

; <label>:225:                                    ; preds = %195
  br label %226

; <label>:226:                                    ; preds = %225
  %pgocount21 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 21)
  %227 = add i64 %pgocount21, 1
  store i64 %227, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 21)
  %228 = load i32, i32* %16, align 4
  %229 = add i32 %228, 1
  store i32 %229, i32* %16, align 4
  br label %190

; <label>:230:                                    ; preds = %190
  %231 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %232 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %231, i32 0, i32 8
  %233 = load i32, i32* %232, align 8
  %234 = and i32 %233, 16
  %235 = icmp ne i32 %234, 0
  br i1 %235, label %236, label %273

; <label>:236:                                    ; preds = %230
  %237 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %238 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %237, i32 0, i32 7
  %239 = call i32 @mad_bit_length(%struct.mad_bitptr* %7, %struct.mad_bitptr* %238)
  %240 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %241 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %240, i32 0, i32 6
  %242 = load i16, i16* %241, align 4
  %243 = bitcast %struct.mad_bitptr* %7 to { i8*, i64 }*
  %244 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %243, i32 0, i32 0
  %245 = load i8*, i8** %244, align 8
  %246 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %243, i32 0, i32 1
  %247 = load i64, i64* %246, align 8
  %248 = call zeroext i16 @mad_bit_crc(i8* %245, i64 %247, i32 %239, i16 zeroext %242)
  %249 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %250 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %249, i32 0, i32 6
  store i16 %248, i16* %250, align 4
  %251 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %252 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %251, i32 0, i32 6
  %253 = load i16, i16* %252, align 4
  %254 = zext i16 %253 to i32
  %255 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %256 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %255, i32 0, i32 7
  %257 = load i16, i16* %256, align 2
  %258 = zext i16 %257 to i32
  %259 = icmp ne i32 %254, %258
  br i1 %259, label %260, label %271

; <label>:260:                                    ; preds = %236
  %pgocount22 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 40)
  %261 = add i64 %pgocount22, 1
  store i64 %261, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 40)
  %262 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %263 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %262, i32 0, i32 1
  %264 = load i32, i32* %263, align 8
  %265 = and i32 %264, 1
  %266 = icmp ne i32 %265, 0
  br i1 %266, label %271, label %267

; <label>:267:                                    ; preds = %260
  %pgocount23 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 42)
  %268 = add i64 %pgocount23, 1
  store i64 %268, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 42)
  %269 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %270 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %269, i32 0, i32 13
  store i32 513, i32* %270, align 8
  store i32 -1, i32* %3, align 4
  br label %770

; <label>:271:                                    ; preds = %260, %236
  %pgocount24 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 37)
  %272 = add i64 %pgocount24, 1
  store i64 %272, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 37)
  br label %273

; <label>:273:                                    ; preds = %271, %230
  store i32 0, i32* %16, align 4
  br label %274

; <label>:274:                                    ; preds = %447, %273
  %275 = load i32, i32* %16, align 4
  %276 = load i32, i32* %9, align 4
  %277 = icmp ult i32 %275, %276
  br i1 %277, label %278, label %451

; <label>:278:                                    ; preds = %274
  store i32 0, i32* %14, align 4
  br label %279

; <label>:279:                                    ; preds = %442, %278
  %280 = load i32, i32* %14, align 4
  %281 = load i32, i32* %11, align 4
  %282 = icmp ult i32 %280, %281
  br i1 %282, label %283, label %446

; <label>:283:                                    ; preds = %279
  %284 = load i32, i32* %14, align 4
  %285 = zext i32 %284 to i64
  %286 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %18, i64 0, i64 %285
  %287 = load i32, i32* %16, align 4
  %288 = zext i32 %287 to i64
  %289 = getelementptr inbounds [32 x i8], [32 x i8]* %286, i64 0, i64 %288
  %290 = load i8, i8* %289, align 1
  %291 = icmp ne i8 %290, 0
  br i1 %291, label %292, label %441

; <label>:292:                                    ; preds = %283
  %293 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %294 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %293, i32 0, i32 7
  %295 = call i64 @mad_bit_read(%struct.mad_bitptr* %294, i32 6)
  %296 = trunc i64 %295 to i8
  %297 = load i32, i32* %14, align 4
  %298 = zext i32 %297 to i64
  %299 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %298
  %300 = load i32, i32* %16, align 4
  %301 = zext i32 %300 to i64
  %302 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %299, i64 0, i64 %301
  %303 = getelementptr inbounds [3 x i8], [3 x i8]* %302, i64 0, i64 0
  store i8 %296, i8* %303, align 1
  %304 = load i32, i32* %14, align 4
  %305 = zext i32 %304 to i64
  %306 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %19, i64 0, i64 %305
  %307 = load i32, i32* %16, align 4
  %308 = zext i32 %307 to i64
  %309 = getelementptr inbounds [32 x i8], [32 x i8]* %306, i64 0, i64 %308
  %310 = load i8, i8* %309, align 1
  %311 = zext i8 %310 to i32
  switch i32 %311, label %363 [
    i32 2, label %313
    i32 0, label %337
    i32 1, label %._crit_edge
    i32 3, label %350
  ]

._crit_edge:                                      ; preds = %292
  %pgocount25 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 5)
  %312 = add i64 %pgocount25, 1
  store i64 %312, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 5)
  br label %350

; <label>:313:                                    ; preds = %292
  %pgocount26 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 30)
  %314 = add i64 %pgocount26, 1
  store i64 %314, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 30)
  %315 = load i32, i32* %14, align 4
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %316
  %318 = load i32, i32* %16, align 4
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %317, i64 0, i64 %319
  %321 = getelementptr inbounds [3 x i8], [3 x i8]* %320, i64 0, i64 0
  %322 = load i8, i8* %321, align 1
  %323 = load i32, i32* %14, align 4
  %324 = zext i32 %323 to i64
  %325 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %324
  %326 = load i32, i32* %16, align 4
  %327 = zext i32 %326 to i64
  %328 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %325, i64 0, i64 %327
  %329 = getelementptr inbounds [3 x i8], [3 x i8]* %328, i64 0, i64 1
  store i8 %322, i8* %329, align 1
  %330 = load i32, i32* %14, align 4
  %331 = zext i32 %330 to i64
  %332 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %331
  %333 = load i32, i32* %16, align 4
  %334 = zext i32 %333 to i64
  %335 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %332, i64 0, i64 %334
  %336 = getelementptr inbounds [3 x i8], [3 x i8]* %335, i64 0, i64 2
  store i8 %322, i8* %336, align 1
  br label %363

; <label>:337:                                    ; preds = %292
  %pgocount27 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 31)
  %338 = add i64 %pgocount27, 1
  store i64 %338, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 31)
  %339 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %340 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %339, i32 0, i32 7
  %341 = call i64 @mad_bit_read(%struct.mad_bitptr* %340, i32 6)
  %342 = trunc i64 %341 to i8
  %343 = load i32, i32* %14, align 4
  %344 = zext i32 %343 to i64
  %345 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %344
  %346 = load i32, i32* %16, align 4
  %347 = zext i32 %346 to i64
  %348 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %345, i64 0, i64 %347
  %349 = getelementptr inbounds [3 x i8], [3 x i8]* %348, i64 0, i64 1
  store i8 %342, i8* %349, align 1
  br label %350

; <label>:350:                                    ; preds = %._crit_edge, %337, %292
  %pgocount28 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 28)
  %351 = add i64 %pgocount28, 1
  store i64 %351, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 28)
  %352 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %353 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %352, i32 0, i32 7
  %354 = call i64 @mad_bit_read(%struct.mad_bitptr* %353, i32 6)
  %355 = trunc i64 %354 to i8
  %356 = load i32, i32* %14, align 4
  %357 = zext i32 %356 to i64
  %358 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %357
  %359 = load i32, i32* %16, align 4
  %360 = zext i32 %359 to i64
  %361 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %358, i64 0, i64 %360
  %362 = getelementptr inbounds [3 x i8], [3 x i8]* %361, i64 0, i64 2
  store i8 %355, i8* %362, align 1
  br label %363

; <label>:363:                                    ; preds = %350, %313, %292
  %364 = load i32, i32* %14, align 4
  %365 = zext i32 %364 to i64
  %366 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %19, i64 0, i64 %365
  %367 = load i32, i32* %16, align 4
  %368 = zext i32 %367 to i64
  %369 = getelementptr inbounds [32 x i8], [32 x i8]* %366, i64 0, i64 %368
  %370 = load i8, i8* %369, align 1
  %371 = zext i8 %370 to i32
  %372 = and i32 %371, 1
  %373 = icmp ne i32 %372, 0
  br i1 %373, label %374, label %401

; <label>:374:                                    ; preds = %363
  %pgocount29 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 29)
  %375 = add i64 %pgocount29, 1
  store i64 %375, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 29)
  %376 = load i32, i32* %14, align 4
  %377 = zext i32 %376 to i64
  %378 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %377
  %379 = load i32, i32* %16, align 4
  %380 = zext i32 %379 to i64
  %381 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %378, i64 0, i64 %380
  %382 = load i32, i32* %14, align 4
  %383 = zext i32 %382 to i64
  %384 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %19, i64 0, i64 %383
  %385 = load i32, i32* %16, align 4
  %386 = zext i32 %385 to i64
  %387 = getelementptr inbounds [32 x i8], [32 x i8]* %384, i64 0, i64 %386
  %388 = load i8, i8* %387, align 1
  %389 = zext i8 %388 to i32
  %390 = sub nsw i32 %389, 1
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds [3 x i8], [3 x i8]* %381, i64 0, i64 %391
  %393 = load i8, i8* %392, align 1
  %394 = load i32, i32* %14, align 4
  %395 = zext i32 %394 to i64
  %396 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %395
  %397 = load i32, i32* %16, align 4
  %398 = zext i32 %397 to i64
  %399 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %396, i64 0, i64 %398
  %400 = getelementptr inbounds [3 x i8], [3 x i8]* %399, i64 0, i64 1
  store i8 %393, i8* %400, align 1
  br label %401

; <label>:401:                                    ; preds = %374, %363
  %402 = load i32, i32* %14, align 4
  %403 = zext i32 %402 to i64
  %404 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %403
  %405 = load i32, i32* %16, align 4
  %406 = zext i32 %405 to i64
  %407 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %404, i64 0, i64 %406
  %408 = getelementptr inbounds [3 x i8], [3 x i8]* %407, i64 0, i64 0
  %409 = load i8, i8* %408, align 1
  %410 = zext i8 %409 to i32
  %411 = icmp eq i32 %410, 63
  br i1 %411, label %436, label %412

; <label>:412:                                    ; preds = %401
  %pgocount30 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 25)
  %413 = add i64 %pgocount30, 1
  store i64 %413, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 25)
  %414 = load i32, i32* %14, align 4
  %415 = zext i32 %414 to i64
  %416 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %415
  %417 = load i32, i32* %16, align 4
  %418 = zext i32 %417 to i64
  %419 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %416, i64 0, i64 %418
  %420 = getelementptr inbounds [3 x i8], [3 x i8]* %419, i64 0, i64 1
  %421 = load i8, i8* %420, align 1
  %422 = zext i8 %421 to i32
  %423 = icmp eq i32 %422, 63
  br i1 %423, label %436, label %424

; <label>:424:                                    ; preds = %412
  %pgocount31 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 26)
  %425 = add i64 %pgocount31, 1
  store i64 %425, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 26)
  %426 = load i32, i32* %14, align 4
  %427 = zext i32 %426 to i64
  %428 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %427
  %429 = load i32, i32* %16, align 4
  %430 = zext i32 %429 to i64
  %431 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %428, i64 0, i64 %430
  %432 = getelementptr inbounds [3 x i8], [3 x i8]* %431, i64 0, i64 2
  %433 = load i8, i8* %432, align 1
  %434 = zext i8 %433 to i32
  %435 = icmp eq i32 %434, 63
  br i1 %435, label %436, label %439

; <label>:436:                                    ; preds = %424, %412, %401
  %437 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %438 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %437, i32 0, i32 13
  store i32 545, i32* %438, align 8
  store i32 -1, i32* %3, align 4
  br label %770

; <label>:439:                                    ; preds = %424
  %pgocount32 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 27)
  %440 = add i64 %pgocount32, 1
  store i64 %440, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 27)
  br label %441

; <label>:441:                                    ; preds = %439, %283
  br label %442

; <label>:442:                                    ; preds = %441
  %pgocount33 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 24)
  %443 = add i64 %pgocount33, 1
  store i64 %443, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 24)
  %444 = load i32, i32* %14, align 4
  %445 = add i32 %444, 1
  store i32 %445, i32* %14, align 4
  br label %279

; <label>:446:                                    ; preds = %279
  br label %447

; <label>:447:                                    ; preds = %446
  %pgocount34 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 36)
  %448 = add i64 %pgocount34, 1
  store i64 %448, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 36)
  %449 = load i32, i32* %16, align 4
  %450 = add i32 %449, 1
  store i32 %450, i32* %16, align 4
  br label %274

; <label>:451:                                    ; preds = %274
  %pgocount35 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 44)
  %452 = add i64 %pgocount35, 1
  store i64 %452, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 44)
  store i32 0, i32* %13, align 4
  br label %453

; <label>:453:                                    ; preds = %765, %451
  %454 = load i32, i32* %13, align 4
  %455 = icmp ult i32 %454, 12
  br i1 %455, label %456, label %769

; <label>:456:                                    ; preds = %453
  store i32 0, i32* %16, align 4
  br label %457

; <label>:457:                                    ; preds = %580, %456
  %458 = load i32, i32* %16, align 4
  %459 = load i32, i32* %12, align 4
  %460 = icmp ult i32 %458, %459
  br i1 %460, label %461, label %584

; <label>:461:                                    ; preds = %457
  store i32 0, i32* %14, align 4
  br label %462

; <label>:462:                                    ; preds = %576, %461
  %463 = load i32, i32* %14, align 4
  %464 = load i32, i32* %11, align 4
  %465 = icmp ult i32 %463, %464
  br i1 %465, label %466, label %579

; <label>:466:                                    ; preds = %462
  %467 = load i32, i32* %14, align 4
  %468 = zext i32 %467 to i64
  %469 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %18, i64 0, i64 %468
  %470 = load i32, i32* %16, align 4
  %471 = zext i32 %470 to i64
  %472 = getelementptr inbounds [32 x i8], [32 x i8]* %469, i64 0, i64 %471
  %473 = load i8, i8* %472, align 1
  %474 = zext i8 %473 to i32
  store i32 %474, i32* %8, align 4
  %475 = icmp ne i32 %474, 0
  br i1 %475, label %476, label %550

; <label>:476:                                    ; preds = %466
  %477 = load i8*, i8** %17, align 8
  %478 = load i32, i32* %16, align 4
  %479 = zext i32 %478 to i64
  %480 = getelementptr inbounds i8, i8* %477, i64 %479
  %481 = load i8, i8* %480, align 1
  %482 = zext i8 %481 to i64
  %483 = getelementptr inbounds [8 x %struct.anon.0], [8 x %struct.anon.0]* @bitalloc_table, i64 0, i64 %482
  %484 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %483, i32 0, i32 1
  %485 = load i16, i16* %484, align 2
  %486 = zext i16 %485 to i64
  %487 = getelementptr inbounds [6 x [15 x i8]], [6 x [15 x i8]]* @offset_table, i64 0, i64 %486
  %488 = load i32, i32* %8, align 4
  %489 = sub i32 %488, 1
  %490 = zext i32 %489 to i64
  %491 = getelementptr inbounds [15 x i8], [15 x i8]* %487, i64 0, i64 %490
  %492 = load i8, i8* %491, align 1
  %493 = zext i8 %492 to i32
  store i32 %493, i32* %8, align 4
  %494 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %495 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %494, i32 0, i32 7
  %496 = load i32, i32* %8, align 4
  %497 = zext i32 %496 to i64
  %498 = getelementptr inbounds [17 x %struct.quantclass], [17 x %struct.quantclass]* @qc_table, i64 0, i64 %497
  %499 = getelementptr inbounds [3 x i32], [3 x i32]* %21, i32 0, i32 0
  call void @II_samples(%struct.mad_bitptr* %495, %struct.quantclass* %498, i32* %499)
  store i32 0, i32* %15, align 4
  br label %500

; <label>:500:                                    ; preds = %544, %476
  %501 = load i32, i32* %15, align 4
  %502 = icmp ult i32 %501, 3
  br i1 %502, label %503, label %548

; <label>:503:                                    ; preds = %500
  %504 = load i32, i32* %15, align 4
  %505 = zext i32 %504 to i64
  %506 = getelementptr inbounds [3 x i32], [3 x i32]* %21, i64 0, i64 %505
  %507 = load i32, i32* %506, align 4
  %508 = sext i32 %507 to i64
  %509 = add nsw i64 %508, 2048
  %510 = ashr i64 %509, 12
  %511 = load i32, i32* %14, align 4
  %512 = zext i32 %511 to i64
  %513 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %512
  %514 = load i32, i32* %16, align 4
  %515 = zext i32 %514 to i64
  %516 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %513, i64 0, i64 %515
  %517 = load i32, i32* %13, align 4
  %518 = udiv i32 %517, 4
  %519 = zext i32 %518 to i64
  %520 = getelementptr inbounds [3 x i8], [3 x i8]* %516, i64 0, i64 %519
  %521 = load i8, i8* %520, align 1
  %522 = zext i8 %521 to i64
  %523 = getelementptr inbounds [63 x i32], [63 x i32]* @sf_table, i64 0, i64 %522
  %524 = load i32, i32* %523, align 4
  %525 = sext i32 %524 to i64
  %526 = add nsw i64 %525, 32768
  %527 = ashr i64 %526, 16
  %528 = mul nsw i64 %510, %527
  %529 = trunc i64 %528 to i32
  %530 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %531 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %530, i32 0, i32 2
  %532 = load i32, i32* %14, align 4
  %533 = zext i32 %532 to i64
  %534 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %531, i64 0, i64 %533
  %535 = load i32, i32* %13, align 4
  %536 = mul i32 3, %535
  %537 = load i32, i32* %15, align 4
  %538 = add i32 %536, %537
  %539 = zext i32 %538 to i64
  %540 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %534, i64 0, i64 %539
  %541 = load i32, i32* %16, align 4
  %542 = zext i32 %541 to i64
  %543 = getelementptr inbounds [32 x i32], [32 x i32]* %540, i64 0, i64 %542
  store i32 %529, i32* %543, align 4
  br label %544

; <label>:544:                                    ; preds = %503
  %pgocount36 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 1)
  %545 = add i64 %pgocount36, 1
  store i64 %545, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 1)
  %546 = load i32, i32* %15, align 4
  %547 = add i32 %546, 1
  store i32 %547, i32* %15, align 4
  br label %500

; <label>:548:                                    ; preds = %500
  %pgocount37 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 9)
  %549 = add i64 %pgocount37, 1
  store i64 %549, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 9)
  br label %575

; <label>:550:                                    ; preds = %466
  store i32 0, i32* %15, align 4
  br label %551

; <label>:551:                                    ; preds = %569, %550
  %552 = load i32, i32* %15, align 4
  %553 = icmp ult i32 %552, 3
  br i1 %553, label %554, label %573

; <label>:554:                                    ; preds = %551
  %555 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %556 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %555, i32 0, i32 2
  %557 = load i32, i32* %14, align 4
  %558 = zext i32 %557 to i64
  %559 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %556, i64 0, i64 %558
  %560 = load i32, i32* %13, align 4
  %561 = mul i32 3, %560
  %562 = load i32, i32* %15, align 4
  %563 = add i32 %561, %562
  %564 = zext i32 %563 to i64
  %565 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %559, i64 0, i64 %564
  %566 = load i32, i32* %16, align 4
  %567 = zext i32 %566 to i64
  %568 = getelementptr inbounds [32 x i32], [32 x i32]* %565, i64 0, i64 %567
  store i32 0, i32* %568, align 4
  br label %569

; <label>:569:                                    ; preds = %554
  %pgocount38 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 3)
  %570 = add i64 %pgocount38, 1
  store i64 %570, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 3)
  %571 = load i32, i32* %15, align 4
  %572 = add i32 %571, 1
  store i32 %572, i32* %15, align 4
  br label %551

; <label>:573:                                    ; preds = %551
  %pgocount39 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 12)
  %574 = add i64 %pgocount39, 1
  store i64 %574, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 12)
  br label %575

; <label>:575:                                    ; preds = %573, %548
  br label %576

; <label>:576:                                    ; preds = %575
  %577 = load i32, i32* %14, align 4
  %578 = add i32 %577, 1
  store i32 %578, i32* %14, align 4
  br label %462

; <label>:579:                                    ; preds = %462
  br label %580

; <label>:580:                                    ; preds = %579
  %pgocount40 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 17)
  %581 = add i64 %pgocount40, 1
  store i64 %581, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 17)
  %582 = load i32, i32* %16, align 4
  %583 = add i32 %582, 1
  store i32 %583, i32* %16, align 4
  br label %457

; <label>:584:                                    ; preds = %457
  %585 = load i32, i32* %12, align 4
  store i32 %585, i32* %16, align 4
  br label %586

; <label>:586:                                    ; preds = %718, %584
  %587 = load i32, i32* %16, align 4
  %588 = load i32, i32* %9, align 4
  %589 = icmp ult i32 %587, %588
  br i1 %589, label %590, label %721

; <label>:590:                                    ; preds = %586
  %591 = getelementptr inbounds [2 x [32 x i8]], [2 x [32 x i8]]* %18, i64 0, i64 0
  %592 = load i32, i32* %16, align 4
  %593 = zext i32 %592 to i64
  %594 = getelementptr inbounds [32 x i8], [32 x i8]* %591, i64 0, i64 %593
  %595 = load i8, i8* %594, align 1
  %596 = zext i8 %595 to i32
  store i32 %596, i32* %8, align 4
  %597 = icmp ne i32 %596, 0
  br i1 %597, label %598, label %682

; <label>:598:                                    ; preds = %590
  %599 = load i8*, i8** %17, align 8
  %600 = load i32, i32* %16, align 4
  %601 = zext i32 %600 to i64
  %602 = getelementptr inbounds i8, i8* %599, i64 %601
  %603 = load i8, i8* %602, align 1
  %604 = zext i8 %603 to i64
  %605 = getelementptr inbounds [8 x %struct.anon.0], [8 x %struct.anon.0]* @bitalloc_table, i64 0, i64 %604
  %606 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %605, i32 0, i32 1
  %607 = load i16, i16* %606, align 2
  %608 = zext i16 %607 to i64
  %609 = getelementptr inbounds [6 x [15 x i8]], [6 x [15 x i8]]* @offset_table, i64 0, i64 %608
  %610 = load i32, i32* %8, align 4
  %611 = sub i32 %610, 1
  %612 = zext i32 %611 to i64
  %613 = getelementptr inbounds [15 x i8], [15 x i8]* %609, i64 0, i64 %612
  %614 = load i8, i8* %613, align 1
  %615 = zext i8 %614 to i32
  store i32 %615, i32* %8, align 4
  %616 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %617 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %616, i32 0, i32 7
  %618 = load i32, i32* %8, align 4
  %619 = zext i32 %618 to i64
  %620 = getelementptr inbounds [17 x %struct.quantclass], [17 x %struct.quantclass]* @qc_table, i64 0, i64 %619
  %621 = getelementptr inbounds [3 x i32], [3 x i32]* %21, i32 0, i32 0
  call void @II_samples(%struct.mad_bitptr* %617, %struct.quantclass* %620, i32* %621)
  store i32 0, i32* %14, align 4
  br label %622

; <label>:622:                                    ; preds = %676, %598
  %623 = load i32, i32* %14, align 4
  %624 = load i32, i32* %11, align 4
  %625 = icmp ult i32 %623, %624
  br i1 %625, label %626, label %680

; <label>:626:                                    ; preds = %622
  store i32 0, i32* %15, align 4
  br label %627

; <label>:627:                                    ; preds = %671, %626
  %628 = load i32, i32* %15, align 4
  %629 = icmp ult i32 %628, 3
  br i1 %629, label %630, label %675

; <label>:630:                                    ; preds = %627
  %631 = load i32, i32* %15, align 4
  %632 = zext i32 %631 to i64
  %633 = getelementptr inbounds [3 x i32], [3 x i32]* %21, i64 0, i64 %632
  %634 = load i32, i32* %633, align 4
  %635 = sext i32 %634 to i64
  %636 = add nsw i64 %635, 2048
  %637 = ashr i64 %636, 12
  %638 = load i32, i32* %14, align 4
  %639 = zext i32 %638 to i64
  %640 = getelementptr inbounds [2 x [32 x [3 x i8]]], [2 x [32 x [3 x i8]]]* %20, i64 0, i64 %639
  %641 = load i32, i32* %16, align 4
  %642 = zext i32 %641 to i64
  %643 = getelementptr inbounds [32 x [3 x i8]], [32 x [3 x i8]]* %640, i64 0, i64 %642
  %644 = load i32, i32* %13, align 4
  %645 = udiv i32 %644, 4
  %646 = zext i32 %645 to i64
  %647 = getelementptr inbounds [3 x i8], [3 x i8]* %643, i64 0, i64 %646
  %648 = load i8, i8* %647, align 1
  %649 = zext i8 %648 to i64
  %650 = getelementptr inbounds [63 x i32], [63 x i32]* @sf_table, i64 0, i64 %649
  %651 = load i32, i32* %650, align 4
  %652 = sext i32 %651 to i64
  %653 = add nsw i64 %652, 32768
  %654 = ashr i64 %653, 16
  %655 = mul nsw i64 %637, %654
  %656 = trunc i64 %655 to i32
  %657 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %658 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %657, i32 0, i32 2
  %659 = load i32, i32* %14, align 4
  %660 = zext i32 %659 to i64
  %661 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %658, i64 0, i64 %660
  %662 = load i32, i32* %13, align 4
  %663 = mul i32 3, %662
  %664 = load i32, i32* %15, align 4
  %665 = add i32 %663, %664
  %666 = zext i32 %665 to i64
  %667 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %661, i64 0, i64 %666
  %668 = load i32, i32* %16, align 4
  %669 = zext i32 %668 to i64
  %670 = getelementptr inbounds [32 x i32], [32 x i32]* %667, i64 0, i64 %669
  store i32 %656, i32* %670, align 4
  br label %671

; <label>:671:                                    ; preds = %630
  %pgocount41 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 2)
  %672 = add i64 %pgocount41, 1
  store i64 %672, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 2)
  %673 = load i32, i32* %15, align 4
  %674 = add i32 %673, 1
  store i32 %674, i32* %15, align 4
  br label %627

; <label>:675:                                    ; preds = %627
  br label %676

; <label>:676:                                    ; preds = %675
  %pgocount42 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 10)
  %677 = add i64 %pgocount42, 1
  store i64 %677, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 10)
  %678 = load i32, i32* %14, align 4
  %679 = add i32 %678, 1
  store i32 %679, i32* %14, align 4
  br label %622

; <label>:680:                                    ; preds = %622
  %pgocount43 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 22)
  %681 = add i64 %pgocount43, 1
  store i64 %681, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 22)
  br label %717

; <label>:682:                                    ; preds = %590
  store i32 0, i32* %14, align 4
  br label %683

; <label>:683:                                    ; preds = %711, %682
  %684 = load i32, i32* %14, align 4
  %685 = load i32, i32* %11, align 4
  %686 = icmp ult i32 %684, %685
  br i1 %686, label %687, label %715

; <label>:687:                                    ; preds = %683
  store i32 0, i32* %15, align 4
  br label %688

; <label>:688:                                    ; preds = %706, %687
  %689 = load i32, i32* %15, align 4
  %690 = icmp ult i32 %689, 3
  br i1 %690, label %691, label %710

; <label>:691:                                    ; preds = %688
  %692 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %693 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %692, i32 0, i32 2
  %694 = load i32, i32* %14, align 4
  %695 = zext i32 %694 to i64
  %696 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %693, i64 0, i64 %695
  %697 = load i32, i32* %13, align 4
  %698 = mul i32 3, %697
  %699 = load i32, i32* %15, align 4
  %700 = add i32 %698, %699
  %701 = zext i32 %700 to i64
  %702 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %696, i64 0, i64 %701
  %703 = load i32, i32* %16, align 4
  %704 = zext i32 %703 to i64
  %705 = getelementptr inbounds [32 x i32], [32 x i32]* %702, i64 0, i64 %704
  store i32 0, i32* %705, align 4
  br label %706

; <label>:706:                                    ; preds = %691
  %pgocount44 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 4)
  %707 = add i64 %pgocount44, 1
  store i64 %707, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 4)
  %708 = load i32, i32* %15, align 4
  %709 = add i32 %708, 1
  store i32 %709, i32* %15, align 4
  br label %688

; <label>:710:                                    ; preds = %688
  br label %711

; <label>:711:                                    ; preds = %710
  %pgocount45 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 13)
  %712 = add i64 %pgocount45, 1
  store i64 %712, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 13)
  %713 = load i32, i32* %14, align 4
  %714 = add i32 %713, 1
  store i32 %714, i32* %14, align 4
  br label %683

; <label>:715:                                    ; preds = %683
  %pgocount46 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 23)
  %716 = add i64 %pgocount46, 1
  store i64 %716, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 23)
  br label %717

; <label>:717:                                    ; preds = %715, %680
  br label %718

; <label>:718:                                    ; preds = %717
  %719 = load i32, i32* %16, align 4
  %720 = add i32 %719, 1
  store i32 %720, i32* %16, align 4
  br label %586

; <label>:721:                                    ; preds = %586
  store i32 0, i32* %14, align 4
  br label %722

; <label>:722:                                    ; preds = %760, %721
  %723 = load i32, i32* %14, align 4
  %724 = load i32, i32* %11, align 4
  %725 = icmp ult i32 %723, %724
  br i1 %725, label %726, label %764

; <label>:726:                                    ; preds = %722
  store i32 0, i32* %15, align 4
  br label %727

; <label>:727:                                    ; preds = %755, %726
  %728 = load i32, i32* %15, align 4
  %729 = icmp ult i32 %728, 3
  br i1 %729, label %730, label %759

; <label>:730:                                    ; preds = %727
  %731 = load i32, i32* %9, align 4
  store i32 %731, i32* %16, align 4
  br label %732

; <label>:732:                                    ; preds = %750, %730
  %733 = load i32, i32* %16, align 4
  %734 = icmp ult i32 %733, 32
  br i1 %734, label %735, label %754

; <label>:735:                                    ; preds = %732
  %736 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %737 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %736, i32 0, i32 2
  %738 = load i32, i32* %14, align 4
  %739 = zext i32 %738 to i64
  %740 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %737, i64 0, i64 %739
  %741 = load i32, i32* %13, align 4
  %742 = mul i32 3, %741
  %743 = load i32, i32* %15, align 4
  %744 = add i32 %742, %743
  %745 = zext i32 %744 to i64
  %746 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %740, i64 0, i64 %745
  %747 = load i32, i32* %16, align 4
  %748 = zext i32 %747 to i64
  %749 = getelementptr inbounds [32 x i32], [32 x i32]* %746, i64 0, i64 %748
  store i32 0, i32* %749, align 4
  br label %750

; <label>:750:                                    ; preds = %735
  %pgocount47 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 0)
  %751 = add i64 %pgocount47, 1
  store i64 %751, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 0)
  %752 = load i32, i32* %16, align 4
  %753 = add i32 %752, 1
  store i32 %753, i32* %16, align 4
  br label %732

; <label>:754:                                    ; preds = %732
  br label %755

; <label>:755:                                    ; preds = %754
  %pgocount48 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 6)
  %756 = add i64 %pgocount48, 1
  store i64 %756, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 6)
  %757 = load i32, i32* %15, align 4
  %758 = add i32 %757, 1
  store i32 %758, i32* %15, align 4
  br label %727

; <label>:759:                                    ; preds = %727
  br label %760

; <label>:760:                                    ; preds = %759
  %pgocount49 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 18)
  %761 = add i64 %pgocount49, 1
  store i64 %761, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 18)
  %762 = load i32, i32* %14, align 4
  %763 = add i32 %762, 1
  store i32 %763, i32* %14, align 4
  br label %722

; <label>:764:                                    ; preds = %722
  br label %765

; <label>:765:                                    ; preds = %764
  %pgocount50 = load i64, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 32)
  %766 = add i64 %pgocount50, 1
  store i64 %766, i64* getelementptr inbounds ([48 x i64], [48 x i64]* @__profc_mad_layer_II, i64 0, i64 32)
  %767 = load i32, i32* %13, align 4
  %768 = add i32 %767, 1
  store i32 %768, i32* %13, align 4
  br label %453

; <label>:769:                                    ; preds = %453
  store i32 0, i32* %3, align 4
  br label %770

; <label>:770:                                    ; preds = %769, %436, %267
  %771 = load i32, i32* %3, align 4
  ret i32 %771
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare i32 @mad_bit_length(%struct.mad_bitptr*, %struct.mad_bitptr*) #1

; Function Attrs: nounwind uwtable
define internal void @II_samples(%struct.mad_bitptr*, %struct.quantclass*, i32*) #0 {
  %4 = alloca %struct.mad_bitptr*, align 8
  %5 = alloca %struct.quantclass*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [3 x i32], align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.mad_bitptr* %0, %struct.mad_bitptr** %4, align 8
  store %struct.quantclass* %1, %struct.quantclass** %5, align 8
  store i32* %2, i32** %6, align 8
  %13 = load %struct.quantclass*, %struct.quantclass** %5, align 8
  %14 = getelementptr inbounds %struct.quantclass, %struct.quantclass* %13, i32 0, i32 1
  %15 = load i8, i8* %14, align 2
  %16 = zext i8 %15 to i32
  store i32 %16, i32* %7, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %49

; <label>:18:                                     ; preds = %3
  %19 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %20 = load %struct.quantclass*, %struct.quantclass** %5, align 8
  %21 = getelementptr inbounds %struct.quantclass, %struct.quantclass* %20, i32 0, i32 2
  %22 = load i8, i8* %21, align 1
  %23 = zext i8 %22 to i32
  %24 = call i64 @mad_bit_read(%struct.mad_bitptr* %19, i32 %23)
  %25 = trunc i64 %24 to i32
  store i32 %25, i32* %10, align 4
  %26 = load %struct.quantclass*, %struct.quantclass** %5, align 8
  %27 = getelementptr inbounds %struct.quantclass, %struct.quantclass* %26, i32 0, i32 0
  %28 = load i16, i16* %27, align 4
  %29 = zext i16 %28 to i32
  store i32 %29, i32* %11, align 4
  store i32 0, i32* %8, align 4
  br label %30

; <label>:30:                                     ; preds = %44, %18
  %31 = load i32, i32* %8, align 4
  %32 = icmp ult i32 %31, 3
  br i1 %32, label %33, label %47

; <label>:33:                                     ; preds = %30
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_II_samples, i64 0, i64 1)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_II_samples, i64 0, i64 1)
  %35 = load i32, i32* %10, align 4
  %36 = load i32, i32* %11, align 4
  %37 = urem i32 %35, %36
  %38 = load i32, i32* %8, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds [3 x i32], [3 x i32]* %9, i64 0, i64 %39
  store i32 %37, i32* %40, align 4
  %41 = load i32, i32* %11, align 4
  %42 = load i32, i32* %10, align 4
  %43 = udiv i32 %42, %41
  store i32 %43, i32* %10, align 4
  br label %44

; <label>:44:                                     ; preds = %33
  %45 = load i32, i32* %8, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %8, align 4
  br label %30

; <label>:47:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_II_samples, i64 0, i64 3)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_II_samples, i64 0, i64 3)
  br label %71

; <label>:49:                                     ; preds = %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_II_samples, i64 0, i64 4)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_II_samples, i64 0, i64 4)
  %51 = load %struct.quantclass*, %struct.quantclass** %5, align 8
  %52 = getelementptr inbounds %struct.quantclass, %struct.quantclass* %51, i32 0, i32 2
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i32
  store i32 %54, i32* %7, align 4
  store i32 0, i32* %8, align 4
  br label %55

; <label>:55:                                     ; preds = %66, %49
  %56 = load i32, i32* %8, align 4
  %57 = icmp ult i32 %56, 3
  br i1 %57, label %58, label %70

; <label>:58:                                     ; preds = %55
  %59 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %60 = load i32, i32* %7, align 4
  %61 = call i64 @mad_bit_read(%struct.mad_bitptr* %59, i32 %60)
  %62 = trunc i64 %61 to i32
  %63 = load i32, i32* %8, align 4
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds [3 x i32], [3 x i32]* %9, i64 0, i64 %64
  store i32 %62, i32* %65, align 4
  br label %66

; <label>:66:                                     ; preds = %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_II_samples, i64 0, i64 2)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_II_samples, i64 0, i64 2)
  %68 = load i32, i32* %8, align 4
  %69 = add i32 %68, 1
  store i32 %69, i32* %8, align 4
  br label %55

; <label>:70:                                     ; preds = %55
  br label %71

; <label>:71:                                     ; preds = %70, %47
  store i32 0, i32* %8, align 4
  br label %72

; <label>:72:                                     ; preds = %118, %71
  %73 = load i32, i32* %8, align 4
  %74 = icmp ult i32 %73, 3
  br i1 %74, label %75, label %121

; <label>:75:                                     ; preds = %72
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_II_samples, i64 0, i64 0)
  %76 = add i64 %pgocount4, 1
  store i64 %76, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_II_samples, i64 0, i64 0)
  %77 = load i32, i32* %8, align 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds [3 x i32], [3 x i32]* %9, i64 0, i64 %78
  %80 = load i32, i32* %79, align 4
  %81 = load i32, i32* %7, align 4
  %82 = sub i32 %81, 1
  %83 = shl i32 1, %82
  %84 = xor i32 %80, %83
  store i32 %84, i32* %12, align 4
  %85 = load i32, i32* %12, align 4
  %86 = load i32, i32* %7, align 4
  %87 = sub i32 %86, 1
  %88 = shl i32 1, %87
  %89 = and i32 %85, %88
  %90 = sub nsw i32 0, %89
  %91 = load i32, i32* %12, align 4
  %92 = or i32 %91, %90
  store i32 %92, i32* %12, align 4
  %93 = load i32, i32* %7, align 4
  %94 = sub i32 %93, 1
  %95 = sub i32 28, %94
  %96 = load i32, i32* %12, align 4
  %97 = shl i32 %96, %95
  store i32 %97, i32* %12, align 4
  %98 = load i32, i32* %12, align 4
  %99 = load %struct.quantclass*, %struct.quantclass** %5, align 8
  %100 = getelementptr inbounds %struct.quantclass, %struct.quantclass* %99, i32 0, i32 4
  %101 = load i32, i32* %100, align 4
  %102 = add nsw i32 %98, %101
  %103 = sext i32 %102 to i64
  %104 = add nsw i64 %103, 2048
  %105 = ashr i64 %104, 12
  %106 = load %struct.quantclass*, %struct.quantclass** %5, align 8
  %107 = getelementptr inbounds %struct.quantclass, %struct.quantclass* %106, i32 0, i32 3
  %108 = load i32, i32* %107, align 4
  %109 = sext i32 %108 to i64
  %110 = add nsw i64 %109, 32768
  %111 = ashr i64 %110, 16
  %112 = mul nsw i64 %105, %111
  %113 = trunc i64 %112 to i32
  %114 = load i32*, i32** %6, align 8
  %115 = load i32, i32* %8, align 4
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32* %114, i64 %116
  store i32 %113, i32* %117, align 4
  br label %118

; <label>:118:                                    ; preds = %75
  %119 = load i32, i32* %8, align 4
  %120 = add i32 %119, 1
  store i32 %120, i32* %8, align 4
  br label %72

; <label>:121:                                    ; preds = %72
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
