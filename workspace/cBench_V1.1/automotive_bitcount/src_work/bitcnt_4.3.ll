; ModuleID = 'bitcnt_4.2.ll'
source_filename = "bitcnt_4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@bits = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_ntbl_bitcnt = private constant [11 x i8] c"ntbl_bitcnt"
@__profn_btbl_bitcnt = private constant [11 x i8] c"btbl_bitcnt"
@__profc_ntbl_bitcnt = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ntbl_bitcnt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5150323126096911371, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ntbl_bitcnt, i32 0, i32 0), i8* bitcast (i32 (i64)* @ntbl_bitcnt to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_btbl_bitcnt = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_btbl_bitcnt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2547757961925567172, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_btbl_bitcnt, i32 0, i32 0), i8* bitcast (i32 (i64)* @btbl_bitcnt to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [24 x i8] c"\17\16x\DA\CB+I\CA\89O\CA,I\CE+aLB\B0\01m!\09\1C", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ntbl_bitcnt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_btbl_bitcnt to i8*), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @ntbl_bitcnt(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = and i64 %4, 15
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %7
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  store i32 %10, i32* %3, align 4
  %11 = load i64, i64* %2, align 8
  %12 = ashr i64 %11, 4
  store i64 %12, i64* %2, align 8
  %13 = icmp ne i64 0, %12
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ntbl_bitcnt, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ntbl_bitcnt, i64 0, i64 1)
  %16 = load i64, i64* %2, align 8
  %17 = call i32 @ntbl_bitcnt(i64 %16)
  %18 = load i32, i32* %3, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, i32* %3, align 4
  br label %20

; <label>:20:                                     ; preds = %14, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ntbl_bitcnt, i64 0, i64 0)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ntbl_bitcnt, i64 0, i64 0)
  %22 = load i32, i32* %3, align 4
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define i32 @btbl_bitcnt(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  %4 = bitcast i64* %2 to i8*
  %5 = getelementptr inbounds i8, i8* %4, i64 0
  %6 = load i8, i8* %5, align 8
  %7 = sext i8 %6 to i32
  %8 = and i32 %7, 255
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %9
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  store i32 %12, i32* %3, align 4
  %13 = load i64, i64* %2, align 8
  %14 = ashr i64 %13, 8
  store i64 %14, i64* %2, align 8
  %15 = icmp ne i64 0, %14
  br i1 %15, label %16, label %22

; <label>:16:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_btbl_bitcnt, i64 0, i64 1)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_btbl_bitcnt, i64 0, i64 1)
  %18 = load i64, i64* %2, align 8
  %19 = call i32 @btbl_bitcnt(i64 %18)
  %20 = load i32, i32* %3, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, i32* %3, align 4
  br label %22

; <label>:22:                                     ; preds = %16, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_btbl_bitcnt, i64 0, i64 0)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_btbl_bitcnt, i64 0, i64 0)
  %24 = load i32, i32* %3, align 4
  ret i32 %24
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
