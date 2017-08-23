; ModuleID = 'tmp1.ll'
source_filename = "bit.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mad_bitptr = type { i8*, i16, i16 }

$__llvm_profile_raw_version = comdat any

@crc_table = internal constant [256 x i16] [i16 0, i16 -32763, i16 -32753, i16 10, i16 -32741, i16 30, i16 20, i16 -32751, i16 -32717, i16 54, i16 60, i16 -32711, i16 40, i16 -32723, i16 -32729, i16 34, i16 -32669, i16 102, i16 108, i16 -32663, i16 120, i16 -32643, i16 -32649, i16 114, i16 80, i16 -32683, i16 -32673, i16 90, i16 -32693, i16 78, i16 68, i16 -32703, i16 -32573, i16 198, i16 204, i16 -32567, i16 216, i16 -32547, i16 -32553, i16 210, i16 240, i16 -32523, i16 -32513, i16 250, i16 -32533, i16 238, i16 228, i16 -32543, i16 160, i16 -32603, i16 -32593, i16 170, i16 -32581, i16 190, i16 180, i16 -32591, i16 -32621, i16 150, i16 156, i16 -32615, i16 136, i16 -32627, i16 -32633, i16 130, i16 -32381, i16 390, i16 396, i16 -32375, i16 408, i16 -32355, i16 -32361, i16 402, i16 432, i16 -32331, i16 -32321, i16 442, i16 -32341, i16 430, i16 420, i16 -32351, i16 480, i16 -32283, i16 -32273, i16 490, i16 -32261, i16 510, i16 500, i16 -32271, i16 -32301, i16 470, i16 476, i16 -32295, i16 456, i16 -32307, i16 -32313, i16 450, i16 320, i16 -32443, i16 -32433, i16 330, i16 -32421, i16 350, i16 340, i16 -32431, i16 -32397, i16 374, i16 380, i16 -32391, i16 360, i16 -32403, i16 -32409, i16 354, i16 -32477, i16 294, i16 300, i16 -32471, i16 312, i16 -32451, i16 -32457, i16 306, i16 272, i16 -32491, i16 -32481, i16 282, i16 -32501, i16 270, i16 260, i16 -32511, i16 -31997, i16 774, i16 780, i16 -31991, i16 792, i16 -31971, i16 -31977, i16 786, i16 816, i16 -31947, i16 -31937, i16 826, i16 -31957, i16 814, i16 804, i16 -31967, i16 864, i16 -31899, i16 -31889, i16 874, i16 -31877, i16 894, i16 884, i16 -31887, i16 -31917, i16 854, i16 860, i16 -31911, i16 840, i16 -31923, i16 -31929, i16 834, i16 960, i16 -31803, i16 -31793, i16 970, i16 -31781, i16 990, i16 980, i16 -31791, i16 -31757, i16 1014, i16 1020, i16 -31751, i16 1000, i16 -31763, i16 -31769, i16 994, i16 -31837, i16 934, i16 940, i16 -31831, i16 952, i16 -31811, i16 -31817, i16 946, i16 912, i16 -31851, i16 -31841, i16 922, i16 -31861, i16 910, i16 900, i16 -31871, i16 640, i16 -32123, i16 -32113, i16 650, i16 -32101, i16 670, i16 660, i16 -32111, i16 -32077, i16 694, i16 700, i16 -32071, i16 680, i16 -32083, i16 -32089, i16 674, i16 -32029, i16 742, i16 748, i16 -32023, i16 760, i16 -32003, i16 -32009, i16 754, i16 720, i16 -32043, i16 -32033, i16 730, i16 -32053, i16 718, i16 708, i16 -32063, i16 -32189, i16 582, i16 588, i16 -32183, i16 600, i16 -32163, i16 -32169, i16 594, i16 624, i16 -32139, i16 -32129, i16 634, i16 -32149, i16 622, i16 612, i16 -32159, i16 544, i16 -32219, i16 -32209, i16 554, i16 -32197, i16 574, i16 564, i16 -32207, i16 -32237, i16 534, i16 540, i16 -32231, i16 520, i16 -32243, i16 -32249, i16 514], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_mad_bit_init = private constant [12 x i8] c"mad_bit_init"
@__profn_mad_bit_length = private constant [14 x i8] c"mad_bit_length"
@__profn_mad_bit_nextbyte = private constant [16 x i8] c"mad_bit_nextbyte"
@__profn_mad_bit_skip = private constant [12 x i8] c"mad_bit_skip"
@__profn_mad_bit_read = private constant [12 x i8] c"mad_bit_read"
@__profn_mad_bit_crc = private constant [11 x i8] c"mad_bit_crc"
@__profc_mad_bit_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_bit_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1124632266666239721, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_bit_init, i32 0, i32 0), i8* bitcast (void (%struct.mad_bitptr*, i8*)* @mad_bit_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_bit_length = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_bit_length = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3751880798688274437, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_bit_length, i32 0, i32 0), i8* bitcast (i32 (%struct.mad_bitptr*, %struct.mad_bitptr*)* @mad_bit_length to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_bit_nextbyte = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_bit_nextbyte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5094051514541354075, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_bit_nextbyte, i32 0, i32 0), i8* bitcast (i8* (%struct.mad_bitptr*)* @mad_bit_nextbyte to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_bit_skip = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_bit_skip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1659407227366337115, i64 36496524737, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mad_bit_skip, i32 0, i32 0), i8* bitcast (void (%struct.mad_bitptr*, i32)* @mad_bit_skip to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_bit_read = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_bit_read = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4458876617330324795, i64 68975973208, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_bit_read, i32 0, i32 0), i8* bitcast (i64 (%struct.mad_bitptr*, i32)* @mad_bit_read to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_bit_crc = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_bit_crc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1960907446341925053, i64 101114579171, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i32 0, i32 0), i8* bitcast (i16 (i8*, i64, i32, i16)* @mad_bit_crc to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [58 x i8] c"R8x\DA\CBML\89O\CA,\89\CF\CC\CB,a\CC\85rrR\F3\D2K2\E0\DC\BC\D4\8A\92\A4\CA\92T\B8@qvf\01\9CS\94\9A\98\02\E7$\17%\03\00\19\F4\1FT", section "__llvm_prf_names"
@llvm.used = appending global [7 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_bit_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_bit_length to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_bit_nextbyte to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_bit_skip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_bit_read to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_bit_crc to i8*), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @mad_bit_init(%struct.mad_bitptr*, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_bit_init, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_bit_init, i64 0, i64 0)
  %4 = alloca %struct.mad_bitptr*, align 8
  %5 = alloca i8*, align 8
  store %struct.mad_bitptr* %0, %struct.mad_bitptr** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load i8*, i8** %5, align 8
  %7 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %8 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %7, i32 0, i32 0
  store i8* %6, i8** %8, align 8
  %9 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %10 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %9, i32 0, i32 1
  store i16 0, i16* %10, align 8
  %11 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %12 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %11, i32 0, i32 2
  store i16 8, i16* %12, align 2
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @mad_bit_length(%struct.mad_bitptr*, %struct.mad_bitptr*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_bit_length, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_bit_length, i64 0, i64 0)
  %4 = alloca %struct.mad_bitptr*, align 8
  %5 = alloca %struct.mad_bitptr*, align 8
  store %struct.mad_bitptr* %0, %struct.mad_bitptr** %4, align 8
  store %struct.mad_bitptr* %1, %struct.mad_bitptr** %5, align 8
  %6 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %7 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %6, i32 0, i32 2
  %8 = load i16, i16* %7, align 2
  %9 = zext i16 %8 to i64
  %10 = load %struct.mad_bitptr*, %struct.mad_bitptr** %5, align 8
  %11 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %10, i32 0, i32 0
  %12 = load i8*, i8** %11, align 8
  %13 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %14 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %13, i32 0, i32 0
  %15 = load i8*, i8** %14, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 1
  %17 = ptrtoint i8* %12 to i64
  %18 = ptrtoint i8* %16 to i64
  %19 = sub i64 %17, %18
  %20 = mul nsw i64 8, %19
  %21 = add nsw i64 %9, %20
  %22 = load %struct.mad_bitptr*, %struct.mad_bitptr** %5, align 8
  %23 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %22, i32 0, i32 2
  %24 = load i16, i16* %23, align 2
  %25 = zext i16 %24 to i32
  %26 = sub nsw i32 8, %25
  %27 = sext i32 %26 to i64
  %28 = add nsw i64 %21, %27
  %29 = trunc i64 %28 to i32
  ret i32 %29
}

; Function Attrs: nounwind uwtable
define i8* @mad_bit_nextbyte(%struct.mad_bitptr*) #0 {
  %2 = alloca %struct.mad_bitptr*, align 8
  store %struct.mad_bitptr* %0, %struct.mad_bitptr** %2, align 8
  %3 = load %struct.mad_bitptr*, %struct.mad_bitptr** %2, align 8
  %4 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %3, i32 0, i32 2
  %5 = load i16, i16* %4, align 2
  %6 = zext i16 %5 to i32
  %7 = icmp eq i32 %6, 8
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_bit_nextbyte, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_bit_nextbyte, i64 0, i64 0)
  %10 = load %struct.mad_bitptr*, %struct.mad_bitptr** %2, align 8
  %11 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %10, i32 0, i32 0
  %12 = load i8*, i8** %11, align 8
  br label %19

; <label>:13:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_bit_nextbyte, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_bit_nextbyte, i64 0, i64 1)
  %15 = load %struct.mad_bitptr*, %struct.mad_bitptr** %2, align 8
  %16 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %15, i32 0, i32 0
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr inbounds i8, i8* %17, i64 1
  br label %19

; <label>:19:                                     ; preds = %13, %8
  %20 = phi i8* [ %12, %8 ], [ %18, %13 ]
  ret i8* %20
}

; Function Attrs: nounwind uwtable
define void @mad_bit_skip(%struct.mad_bitptr*, i32) #0 {
  %3 = alloca %struct.mad_bitptr*, align 8
  %4 = alloca i32, align 4
  store %struct.mad_bitptr* %0, %struct.mad_bitptr** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = udiv i32 %5, 8
  %7 = load %struct.mad_bitptr*, %struct.mad_bitptr** %3, align 8
  %8 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %7, i32 0, i32 0
  %9 = load i8*, i8** %8, align 8
  %10 = zext i32 %6 to i64
  %11 = getelementptr inbounds i8, i8* %9, i64 %10
  store i8* %11, i8** %8, align 8
  %12 = load i32, i32* %4, align 4
  %13 = urem i32 %12, 8
  %14 = load %struct.mad_bitptr*, %struct.mad_bitptr** %3, align 8
  %15 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %14, i32 0, i32 2
  %16 = load i16, i16* %15, align 2
  %17 = zext i16 %16 to i32
  %18 = sub i32 %17, %13
  %19 = trunc i32 %18 to i16
  store i16 %19, i16* %15, align 2
  %20 = load %struct.mad_bitptr*, %struct.mad_bitptr** %3, align 8
  %21 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %20, i32 0, i32 2
  %22 = load i16, i16* %21, align 2
  %23 = zext i16 %22 to i32
  %24 = icmp sgt i32 %23, 8
  br i1 %24, label %25, label %37

; <label>:25:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mad_bit_skip, i64 0, i64 1)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mad_bit_skip, i64 0, i64 1)
  %27 = load %struct.mad_bitptr*, %struct.mad_bitptr** %3, align 8
  %28 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %27, i32 0, i32 0
  %29 = load i8*, i8** %28, align 8
  %30 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %30, i8** %28, align 8
  %31 = load %struct.mad_bitptr*, %struct.mad_bitptr** %3, align 8
  %32 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %31, i32 0, i32 2
  %33 = load i16, i16* %32, align 2
  %34 = zext i16 %33 to i32
  %35 = add nsw i32 %34, 8
  %36 = trunc i32 %35 to i16
  store i16 %36, i16* %32, align 2
  br label %37

; <label>:37:                                     ; preds = %25, %2
  %38 = load %struct.mad_bitptr*, %struct.mad_bitptr** %3, align 8
  %39 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %38, i32 0, i32 2
  %40 = load i16, i16* %39, align 2
  %41 = zext i16 %40 to i32
  %42 = icmp slt i32 %41, 8
  br i1 %42, label %43, label %52

; <label>:43:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mad_bit_skip, i64 0, i64 2)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mad_bit_skip, i64 0, i64 2)
  %45 = load %struct.mad_bitptr*, %struct.mad_bitptr** %3, align 8
  %46 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %45, i32 0, i32 0
  %47 = load i8*, i8** %46, align 8
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i16
  %50 = load %struct.mad_bitptr*, %struct.mad_bitptr** %3, align 8
  %51 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %50, i32 0, i32 1
  store i16 %49, i16* %51, align 8
  br label %52

; <label>:52:                                     ; preds = %43, %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mad_bit_skip, i64 0, i64 0)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mad_bit_skip, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define i64 @mad_bit_read(%struct.mad_bitptr*, i32) #0 {
  %3 = alloca i64, align 8
  %4 = alloca %struct.mad_bitptr*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store %struct.mad_bitptr* %0, %struct.mad_bitptr** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %8 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %7, i32 0, i32 2
  %9 = load i16, i16* %8, align 2
  %10 = zext i16 %9 to i32
  %11 = icmp eq i32 %10, 8
  br i1 %11, label %12, label %21

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_bit_read, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_bit_read, i64 0, i64 1)
  %14 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %15 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %14, i32 0, i32 0
  %16 = load i8*, i8** %15, align 8
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i16
  %19 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %20 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %19, i32 0, i32 1
  store i16 %18, i16* %20, align 8
  br label %21

; <label>:21:                                     ; preds = %12, %2
  %22 = load i32, i32* %5, align 4
  %23 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %24 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %23, i32 0, i32 2
  %25 = load i16, i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = icmp ult i32 %22, %26
  br i1 %27, label %28, label %57

; <label>:28:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_bit_read, i64 0, i64 2)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_bit_read, i64 0, i64 2)
  %30 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %31 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %30, i32 0, i32 1
  %32 = load i16, i16* %31, align 8
  %33 = zext i16 %32 to i32
  %34 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %35 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %34, i32 0, i32 2
  %36 = load i16, i16* %35, align 2
  %37 = zext i16 %36 to i32
  %38 = shl i32 1, %37
  %39 = sub nsw i32 %38, 1
  %40 = and i32 %33, %39
  %41 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %42 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %41, i32 0, i32 2
  %43 = load i16, i16* %42, align 2
  %44 = zext i16 %43 to i32
  %45 = load i32, i32* %5, align 4
  %46 = sub i32 %44, %45
  %47 = ashr i32 %40, %46
  %48 = sext i32 %47 to i64
  store i64 %48, i64* %6, align 8
  %49 = load i32, i32* %5, align 4
  %50 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %51 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %50, i32 0, i32 2
  %52 = load i16, i16* %51, align 2
  %53 = zext i16 %52 to i32
  %54 = sub i32 %53, %49
  %55 = trunc i32 %54 to i16
  store i16 %55, i16* %51, align 2
  %56 = load i64, i64* %6, align 8
  store i64 %56, i64* %3, align 8
  br label %133

; <label>:57:                                     ; preds = %21
  %58 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %59 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %58, i32 0, i32 1
  %60 = load i16, i16* %59, align 8
  %61 = zext i16 %60 to i32
  %62 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %63 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %62, i32 0, i32 2
  %64 = load i16, i16* %63, align 2
  %65 = zext i16 %64 to i32
  %66 = shl i32 1, %65
  %67 = sub nsw i32 %66, 1
  %68 = and i32 %61, %67
  %69 = sext i32 %68 to i64
  store i64 %69, i64* %6, align 8
  %70 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %71 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %70, i32 0, i32 2
  %72 = load i16, i16* %71, align 2
  %73 = zext i16 %72 to i32
  %74 = load i32, i32* %5, align 4
  %75 = sub i32 %74, %73
  store i32 %75, i32* %5, align 4
  %76 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %77 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %76, i32 0, i32 0
  %78 = load i8*, i8** %77, align 8
  %79 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %79, i8** %77, align 8
  %80 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %81 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %80, i32 0, i32 2
  store i16 8, i16* %81, align 2
  br label %82

; <label>:82:                                     ; preds = %85, %57
  %83 = load i32, i32* %5, align 4
  %84 = icmp uge i32 %83, 8
  br i1 %84, label %85, label %98

; <label>:85:                                     ; preds = %82
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_bit_read, i64 0, i64 0)
  %86 = add i64 %pgocount2, 1
  store i64 %86, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_bit_read, i64 0, i64 0)
  %87 = load i64, i64* %6, align 8
  %88 = shl i64 %87, 8
  %89 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %90 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %89, i32 0, i32 0
  %91 = load i8*, i8** %90, align 8
  %92 = getelementptr inbounds i8, i8* %91, i32 1
  store i8* %92, i8** %90, align 8
  %93 = load i8, i8* %91, align 1
  %94 = zext i8 %93 to i64
  %95 = or i64 %88, %94
  store i64 %95, i64* %6, align 8
  %96 = load i32, i32* %5, align 4
  %97 = sub i32 %96, 8
  store i32 %97, i32* %5, align 4
  br label %82

; <label>:98:                                     ; preds = %82
  %99 = load i32, i32* %5, align 4
  %100 = icmp ugt i32 %99, 0
  br i1 %100, label %101, label %130

; <label>:101:                                    ; preds = %98
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_bit_read, i64 0, i64 4)
  %102 = add i64 %pgocount3, 1
  store i64 %102, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_bit_read, i64 0, i64 4)
  %103 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %104 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %103, i32 0, i32 0
  %105 = load i8*, i8** %104, align 8
  %106 = load i8, i8* %105, align 1
  %107 = zext i8 %106 to i16
  %108 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %109 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %108, i32 0, i32 1
  store i16 %107, i16* %109, align 8
  %110 = load i64, i64* %6, align 8
  %111 = load i32, i32* %5, align 4
  %112 = zext i32 %111 to i64
  %113 = shl i64 %110, %112
  %114 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %115 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %114, i32 0, i32 1
  %116 = load i16, i16* %115, align 8
  %117 = zext i16 %116 to i32
  %118 = load i32, i32* %5, align 4
  %119 = sub i32 8, %118
  %120 = ashr i32 %117, %119
  %121 = sext i32 %120 to i64
  %122 = or i64 %113, %121
  store i64 %122, i64* %6, align 8
  %123 = load i32, i32* %5, align 4
  %124 = load %struct.mad_bitptr*, %struct.mad_bitptr** %4, align 8
  %125 = getelementptr inbounds %struct.mad_bitptr, %struct.mad_bitptr* %124, i32 0, i32 2
  %126 = load i16, i16* %125, align 2
  %127 = zext i16 %126 to i32
  %128 = sub i32 %127, %123
  %129 = trunc i32 %128 to i16
  store i16 %129, i16* %125, align 2
  br label %130

; <label>:130:                                    ; preds = %101, %98
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_bit_read, i64 0, i64 3)
  %131 = add i64 %pgocount4, 1
  store i64 %131, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_bit_read, i64 0, i64 3)
  %132 = load i64, i64* %6, align 8
  store i64 %132, i64* %3, align 8
  br label %133

; <label>:133:                                    ; preds = %130, %28
  %134 = load i64, i64* %3, align 8
  ret i64 %134
}

; Function Attrs: nounwind uwtable
define zeroext i16 @mad_bit_crc(i8*, i64, i32, i16 zeroext) #0 {
  %5 = alloca %struct.mad_bitptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i16, align 2
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = bitcast %struct.mad_bitptr* %5 to { i8*, i64 }*
  %12 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %11, i32 0, i32 0
  store i8* %0, i8** %12, align 8
  %13 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %11, i32 0, i32 1
  store i64 %1, i64* %13, align 8
  store i32 %2, i32* %6, align 4
  store i16 %3, i16* %7, align 2
  %14 = load i16, i16* %7, align 2
  %15 = zext i16 %14 to i32
  store i32 %15, i32* %8, align 4
  br label %16

; <label>:16:                                     ; preds = %73, %4
  %17 = load i32, i32* %6, align 4
  %18 = icmp uge i32 %17, 32
  br i1 %18, label %19, label %77

; <label>:19:                                     ; preds = %16
  %20 = call i64 @mad_bit_read(%struct.mad_bitptr* %5, i32 32)
  store i64 %20, i64* %9, align 8
  %21 = load i32, i32* %8, align 4
  %22 = shl i32 %21, 8
  %23 = load i32, i32* %8, align 4
  %24 = lshr i32 %23, 8
  %25 = zext i32 %24 to i64
  %26 = load i64, i64* %9, align 8
  %27 = lshr i64 %26, 24
  %28 = xor i64 %25, %27
  %29 = and i64 %28, 255
  %30 = getelementptr inbounds [256 x i16], [256 x i16]* @crc_table, i64 0, i64 %29
  %31 = load i16, i16* %30, align 2
  %32 = zext i16 %31 to i32
  %33 = xor i32 %22, %32
  store i32 %33, i32* %8, align 4
  %34 = load i32, i32* %8, align 4
  %35 = shl i32 %34, 8
  %36 = load i32, i32* %8, align 4
  %37 = lshr i32 %36, 8
  %38 = zext i32 %37 to i64
  %39 = load i64, i64* %9, align 8
  %40 = lshr i64 %39, 16
  %41 = xor i64 %38, %40
  %42 = and i64 %41, 255
  %43 = getelementptr inbounds [256 x i16], [256 x i16]* @crc_table, i64 0, i64 %42
  %44 = load i16, i16* %43, align 2
  %45 = zext i16 %44 to i32
  %46 = xor i32 %35, %45
  store i32 %46, i32* %8, align 4
  %47 = load i32, i32* %8, align 4
  %48 = shl i32 %47, 8
  %49 = load i32, i32* %8, align 4
  %50 = lshr i32 %49, 8
  %51 = zext i32 %50 to i64
  %52 = load i64, i64* %9, align 8
  %53 = lshr i64 %52, 8
  %54 = xor i64 %51, %53
  %55 = and i64 %54, 255
  %56 = getelementptr inbounds [256 x i16], [256 x i16]* @crc_table, i64 0, i64 %55
  %57 = load i16, i16* %56, align 2
  %58 = zext i16 %57 to i32
  %59 = xor i32 %48, %58
  store i32 %59, i32* %8, align 4
  %60 = load i32, i32* %8, align 4
  %61 = shl i32 %60, 8
  %62 = load i32, i32* %8, align 4
  %63 = lshr i32 %62, 8
  %64 = zext i32 %63 to i64
  %65 = load i64, i64* %9, align 8
  %66 = lshr i64 %65, 0
  %67 = xor i64 %64, %66
  %68 = and i64 %67, 255
  %69 = getelementptr inbounds [256 x i16], [256 x i16]* @crc_table, i64 0, i64 %68
  %70 = load i16, i16* %69, align 2
  %71 = zext i16 %70 to i32
  %72 = xor i32 %61, %71
  store i32 %72, i32* %8, align 4
  br label %73

; <label>:73:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 0)
  %74 = add i64 %pgocount, 1
  store i64 %74, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 0)
  %75 = load i32, i32* %6, align 4
  %76 = sub i32 %75, 32
  store i32 %76, i32* %6, align 4
  br label %16

; <label>:77:                                     ; preds = %16
  %78 = load i32, i32* %6, align 4
  %79 = udiv i32 %78, 8
  switch i32 %79, label %126 [
    i32 3, label %80
    i32 2, label %94
    i32 1, label %108
    i32 0, label %124
  ]

; <label>:80:                                     ; preds = %77
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 7)
  %81 = add i64 %pgocount1, 1
  store i64 %81, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 7)
  %82 = load i32, i32* %8, align 4
  %83 = shl i32 %82, 8
  %84 = load i32, i32* %8, align 4
  %85 = lshr i32 %84, 8
  %86 = zext i32 %85 to i64
  %87 = call i64 @mad_bit_read(%struct.mad_bitptr* %5, i32 8)
  %88 = xor i64 %86, %87
  %89 = and i64 %88, 255
  %90 = getelementptr inbounds [256 x i16], [256 x i16]* @crc_table, i64 0, i64 %89
  %91 = load i16, i16* %90, align 2
  %92 = zext i16 %91 to i32
  %93 = xor i32 %83, %92
  store i32 %93, i32* %8, align 4
  br label %94

; <label>:94:                                     ; preds = %80, %77
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 6)
  %95 = add i64 %pgocount2, 1
  store i64 %95, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 6)
  %96 = load i32, i32* %8, align 4
  %97 = shl i32 %96, 8
  %98 = load i32, i32* %8, align 4
  %99 = lshr i32 %98, 8
  %100 = zext i32 %99 to i64
  %101 = call i64 @mad_bit_read(%struct.mad_bitptr* %5, i32 8)
  %102 = xor i64 %100, %101
  %103 = and i64 %102, 255
  %104 = getelementptr inbounds [256 x i16], [256 x i16]* @crc_table, i64 0, i64 %103
  %105 = load i16, i16* %104, align 2
  %106 = zext i16 %105 to i32
  %107 = xor i32 %97, %106
  store i32 %107, i32* %8, align 4
  br label %108

; <label>:108:                                    ; preds = %94, %77
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 5)
  %109 = add i64 %pgocount3, 1
  store i64 %109, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 5)
  %110 = load i32, i32* %8, align 4
  %111 = shl i32 %110, 8
  %112 = load i32, i32* %8, align 4
  %113 = lshr i32 %112, 8
  %114 = zext i32 %113 to i64
  %115 = call i64 @mad_bit_read(%struct.mad_bitptr* %5, i32 8)
  %116 = xor i64 %114, %115
  %117 = and i64 %116, 255
  %118 = getelementptr inbounds [256 x i16], [256 x i16]* @crc_table, i64 0, i64 %117
  %119 = load i16, i16* %118, align 2
  %120 = zext i16 %119 to i32
  %121 = xor i32 %111, %120
  store i32 %121, i32* %8, align 4
  %122 = load i32, i32* %6, align 4
  %123 = urem i32 %122, 8
  store i32 %123, i32* %6, align 4
  br label %124

; <label>:124:                                    ; preds = %108, %77
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 4)
  %125 = add i64 %pgocount4, 1
  store i64 %125, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 4)
  br label %126

; <label>:126:                                    ; preds = %124, %77
  br label %127

; <label>:127:                                    ; preds = %147, %126
  %128 = load i32, i32* %6, align 4
  %129 = add i32 %128, -1
  store i32 %129, i32* %6, align 4
  %130 = icmp ne i32 %128, 0
  br i1 %130, label %131, label %149

; <label>:131:                                    ; preds = %127
  %132 = call i64 @mad_bit_read(%struct.mad_bitptr* %5, i32 1)
  %133 = load i32, i32* %8, align 4
  %134 = lshr i32 %133, 15
  %135 = zext i32 %134 to i64
  %136 = xor i64 %132, %135
  %137 = trunc i64 %136 to i32
  store i32 %137, i32* %10, align 4
  %138 = load i32, i32* %8, align 4
  %139 = shl i32 %138, 1
  store i32 %139, i32* %8, align 4
  %140 = load i32, i32* %10, align 4
  %141 = and i32 %140, 1
  %142 = icmp ne i32 %141, 0
  br i1 %142, label %143, label %147

; <label>:143:                                    ; preds = %131
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 2)
  %144 = add i64 %pgocount5, 1
  store i64 %144, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 2)
  %145 = load i32, i32* %8, align 4
  %146 = xor i32 %145, 32773
  store i32 %146, i32* %8, align 4
  br label %147

; <label>:147:                                    ; preds = %143, %131
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 1)
  %148 = add i64 %pgocount6, 1
  store i64 %148, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 1)
  br label %127

; <label>:149:                                    ; preds = %127
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 3)
  %150 = add i64 %pgocount7, 1
  store i64 %150, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mad_bit_crc, i64 0, i64 3)
  %151 = load i32, i32* %8, align 4
  %152 = and i32 %151, 65535
  %153 = trunc i32 %152 to i16
  ret i16 %153
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
